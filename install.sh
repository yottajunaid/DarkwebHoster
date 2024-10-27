#!/bin/bash

pkgs=(php tor pv curl)
for p in "${pkgs[@]}"; do 
  if ! hash ${p} > /dev/null 2>&1; then
    printf "\n\e[32m${p} not found installing....\n\e[0m"
    apt install ${p} -y > /dev/null 2>&1
  fi 
done
echo instaling DarkwebHoster...

curl -sLO https://github.com/yottajunaid/DarkwebHoster/raw/main/files/torrc
curl -sLO https://github.com/yottajunaid/DarkwebHoster/raw/main/files/DWH

mv torrc $PREFIX/etc/tor/torrc
mv DWH $PATH/DarkwebHoster

chmod +x $PATH/DarkwebHoster
if [[ -d $PREFIX/var/lib/tor/hidden_service/ ]];then 
  printf "\n 
now you can launch DWH by typing \e[31mDarkwebHoster\e[0m from any directory
"
else
  echo tor hidden hidden_service directory not found creating...
  mkdir -p $PREFIX/var/lib/tor/hidden_service/ 
  printf "\nnow you can launch DWH by typing \e[3131mDarkwebHoster\e[0m from any directory"
fi 

