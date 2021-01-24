"call pathogen#infect()
"===================
set nu
set expandtab	                        "To insert space characters whenever the tab key is pressed, set the 'expandtab' option:
set tabstop=4	                        "4个空格字符代替一个Tab字符
set shiftwidth=4                        "shfit +>> 缩进时，插入的4个空格
set autoindent                          "开启自动缩进，换行时，自动与上一行保持相同的缩进
autocmd FileType yaml,yml set list      ”yaml文件自动打开 set list
"===================
set hlsearch        "高亮选择
set nu
"set relativenumber
set mouse=a
set nowrap
colorscheme desert
"set cindent
set noeb
set tabstop=4
set expandtab
set fencs=utf-8,GB18030,ucs-bom,default,latin1
set ignorecase
set path+=/sysbuild/source/ks_apps/inc/
set path+=/sysbuild/source/ks_apps/inc/sfl/
set path+=/sysbuild/source/ks_apps/lib/libdatabase/inc
set path+=/sysbuild/source/ks_apps/inc/libfastcommon/

inoremap { {}<ESC>i

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

set tags+=/usr/local/src/kingsoft_vgm_docs/libfastcommon-1.0.36/tags
set tags+=/usr/local/src/hiredis-0.13.3/tags
set tags+=/usr/local/src/zlog-1.2.12/tags
set tags+=/usr/local/src/libzdb-3.1/tags
set tags+=/usr/local/src/kingsoft_vgm_docs/fastdfs-5.0.11/tags
set tags+=/usr/local/src/kingsoft_vgm_docs/ks_apps/src/lcmshow/tags
set tags+=/usr/local/src/protobuf-2.5.0/tags

syntax enable
filetype plugin on
set number
let g:go_disable_autoinstall = 0

" Highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.go,*.cpp,*.[ch],*.sh exec ":call SetTitle()"

func SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: xiezg")
        call append(line(".")+2, "\# mail: xzghyd2008@hotmail.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".")+4, "\# Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".")+5, "\#########################################################################")
        call append(line(".")+6, "\#!/bin/bash")
        call append(line(".")+7, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), " # File Name: ".expand("%"))
        call append(line(".")+1, " # Author: xiezg")
        call append(line(".")+2, " # Mail: xzghyd2008@hotmail.com ")
        call append(line(".")+3, " # Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".")+4, " # Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".")+5, " ************************************************************************/")
        call append(line(".")+6, "")

        if &filetype != 'go'
            call append( line(".")+7, "#include <stdlib.h>" )
            call append( line(".")+8, "#include <stdio.h>" )
            call append( line(".")+9, "" )
            call append( line(".")+10, "" )
        endif
endif

autocmd BufNewFile * normal G
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWrite,BufWritePre,FileWritePre  *.c      ks|call LastModified()|'s
autocmd BufWrite,BufWritePre,FileWritePre  *.cpp    ks|call LastModified()|'s
autocmd BufWrite,BufWritePre,FileWritePre  *.h      ks|call LastModified()|'s
autocmd BufWrite,BufWritePre,FileWritePre  *.sh     ks|call LastModified()|'s
autocmd BufWrite,BufWritePre,FileWritePre  *.go     ks|call LastModified()|'s

func LastModified()
    if line("$") > 10
        let l = 10
    else
        let l = line("$")
    endif

    :silent exe "1,".l."g/Last modified: /s/Last modified: .*/Last modified:".strftime(" %Y-%m-%d %H:%M:%S" )

endfunc
