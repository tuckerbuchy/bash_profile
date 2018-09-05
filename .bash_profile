export DYNAMO_PATH=$HOME/dynamo
alias dynamo_local='java -Djava.library.path=$DYNAMO_PATH/DynamoDBLocal_lib -jar $DYNAMO_PATH/DynamoDBLocal.jar -sharedDb'

export PATH=$HOME/Applications/:$PATH
export EDITOR=$HOME/Applications/sublime
export LSCOLORS="EHfxcxdxBxegecabagacad" 
alias ls='ls -lGH'        

function reekdiff() {
	changed_files=`{ git diff --name-only ; git diff --name-only --staged ; } | sort | uniq`
	if [ -z $changed_files ]
  then
    return 0 
  else
    # 1 = false
    reek $changed_files
  fi
}
alias reekdiff=reekdiff


parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

eval "$(rbenv init -)"
