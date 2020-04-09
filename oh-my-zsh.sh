#!/bin/bash

ISUBUNTU=`cat /etc/lsb-release`
ZSH=$HOME/.oh-my-zsh

if [ -n $ISUBUNTU ];then
    CMD="sudo yum -y install"
else
    CMD="sudo apt-get install -y"
fi

#Jump to home directory
cd $HOME 

#install gcc go git java nodejs jenkins nginx zsh 
$CMD gcc golang java nodejs nginx zsh
chsh -s /bin/zsh 

$CMD update
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed -i "11s/robbyrussell/ys/g" $HOME/.zshrc
sed -i "65s/git/\ngit\nzsh-syntax-highlighting\n/g" $HOME/.zshrc

echo "exprot GOPATH=$HOME/go" >> $HOME/.zshrc 
source $HOME/.zshrc
