Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92.1795101861607222263
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=eaGzsdLx;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b467581b98so28333175e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101860; x=1795706660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=evc0hHMoD9tNO6nKijJp5ZIYc4F4YcTlSYQR6X4YCE4=;
        b=eaGzsdLx/Gs7fGX+g0AMcigmET8BEbnzodXAouY+yAc7EjZOxXdDv2GAkc5zdY8jyU
         pQRxUQBcNdDkuq95TfHq6PUsIVdBKGQAJfDXknw1mbIy48YaoOndmeNz2O9/rqnW5Won
         bArzaMdpGC9TNrcOc7s/OE7PGsuAYUY0aX8qizYNLtvuPEFRl+ntdprWDhlO/FBViNNo
         qcJgazWKzj8ts/1/5KM6//5QKSlLwJUbspqnmfw0aqGpTro6xbEcj9hA4LQhXrZ+6jcO
         J75a0+DDeZxjXN+QLsG/lgUYM+AZtkNFHIs0R7dmxFB0EZCZpAjBuLu9SYspXIegXPXC
         Ntfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101860; x=1795706660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=evc0hHMoD9tNO6nKijJp5ZIYc4F4YcTlSYQR6X4YCE4=;
        b=Xb161NJau+4bScmqI6I+pLHkikNBc/X1CT9IleR62f3ydff/e0N1HtxlyZF8YRV42/
         W3qpgAcGtdYhSdN0ERjbODVbmkAOp1LxikiP1DwbZc0FzEoNIvgtog0GnLv3zVwj51SF
         gdBWh6kPIjMFmkPvOXfleW/cFnhzP2SCS+HNM524SfgpSffTcNXJEU20mQu905oYcswo
         WRruCVWsUa4v+oq1PIMKQzcc1XbwpiMVvdJ9IxQO4zFbzHFFjCgyNbenlGOVJXd/vjhz
         HWsRi9LmnYW4n9euhysBsMVIGZyJgctNsDcLezQWf+XVLRu9Gm9NwCB890KV5VwKLQPZ
         zGww==
X-Gm-Message-State: APuU4Z8cC/vy3SufcRwoAIc7Xu+RnRJvMW+0wRuwjHevLVQJfCpja2AE
	BRpLpkFXMi/5qRBVIcDm686/UEuz8BN5dOvl1Kme0Dc952GrUb9dm8+Tfsn+v6eyCR9HqUxk3Jg
	DSb2+lnw=
X-Gm-Gg: AYBFou2Exzuf0R0aupHKEQ9375MyOR+c+VPaABIGUT6lirhq061uKHOVgRMPrcgBDXA
	/ZmT++HiSs2Da131Ol2+X3KW8F/zzdsqtGxS9fZ0pRqZWVSSYgp1dzcqnyanBc6ePMPpmaI4exI
	rPfY8fxtWs6hOJ7aQGJBfhD0CKHm+UPvEBxhX4qdUDa9U0ESnh865ClS1JOTPitcK9dAgkqrJuV
	CgsWBEIPQvURcGpivF3q3lEhbsv+GuF69Sz6oCvQBq4lUPWBzKs+5l8zzB15dy2MfFCPuoB3YeP
	P3YxW83I9W8K8CLxhEPtnA/LBH/zLIpYmF8i9/z0O7sVH6mtizq5xcWnkXGG7JWN+aZGWpX/RYH
	r8SOi4CNN6q/F4T2Rs9ZApvshK4RrqRIi9ruJZSAYbnrUZ/B5kXfHgmn8t+D8BxITsNqbmP9IB1
	Nyo/s9oajksgZmd2YIUdH9wMz8F6UueqgquRWuYFz5iYsp00p0Sovm2lDFj+bFzRXLlH0kSq56y
	AY31axjcGU7AHv+N24pu9caR35HR45+pXunENVSVY2cRJKCMHFBWpxaNbiO4fAF8NEa3+j4HgiB
	OrmwyICwB6YuVclB+BM5VCRIkkvttDj23RZakTXt39ji2JgasPoi0nPc+6DZYOH/I5SkJk26QYw
	kjgsYwVVeTz7PxZUlVwq/mqYEPsstmy0FlOWJ7fTcOIjyGNzNrBwgnCU=
X-Received: by 2002:a05:600c:c171:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4bb7da283b9mr124732625e9.19.1795101859574;
        Thu, 19 Nov 2026 07:24:19 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:19 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/19] vim: Fix for CVE-2026-73076
Date: Thu, 19 Nov 2026 16:22:29 +0100
Message-ID: <18f649f788030bb828ae7ded61e2307c89360342.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250686
Content-Type: text/plain; charset="utf-8"

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/581a2f3ac9c6f96a26324f6b2c8c11415fd0d452
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73076

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
[fatho: fix indentations to stay consistent with upstream]
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../vim/files/CVE-2026-73076.patch            | 155 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73076.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73076.patch b/meta/recipes-support/vim/files/CVE-2026-73076.patch
new file mode 100644
index 0000000000..87f2d4b62f
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-73076.patch
@@ -0,0 +1,155 @@
+From c74d28b907af0b1f1621f881f098374124bcd53d Mon Sep 17 00:00:00 2001
+From: Christian Brabandt <cb@256bit.org>
+Date: Fri, 24 Jul 2026 17:43:51 +0200
+Subject: [PATCH] patch 9.2.0847: [security]: vimball: code execution via
+ .VimballRecord file
+
+Problem:  [security]: vimball: code execution via .VimballRecord file
+          (tdjackey)
+Solution: Forbid arbitrary commands, fix broken directory deletion code,
+          refactor code
+
+Github Security Advisory:
+https://github.com/vim/vim/security/advisories/GHSA-r22p-fhw4-84p2
+Signed-off-by: Christian Brabandt <cb@256bit.org>
+
+Backport Changes:
+
+The .VimballRecord rejection is placed after the fenc/filecnt extraction
+because the earlier strange-filename check block present in upstream 9.2 does
+not exist in the 9.1.1683 vim sources.
+Omitted src/testdir/test_plugin_vimball.vim because the current vim source
+archive does not include it.
+
+CVE: CVE-2026-73076
+Upstream-Status: Backport [https://github.com/vim/vim/commit/581a2f3ac9c6f96a26324f6b2c8c11415fd0d452]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ runtime/autoload/vimball.vim | 62 +++++++++++++++++++++---------------
+ 1 file changed, 37 insertions(+), 25 deletions(-)
+
+diff --git a/runtime/autoload/vimball.vim b/runtime/autoload/vimball.vim
+index 6456984411..5791c7f44a 100644
+--- a/runtime/autoload/vimball.vim
++++ b/runtime/autoload/vimball.vim
+@@ -18,9 +18,9 @@ if &cp || exists("g:loaded_vimball")
+  finish
+ endif
+ let g:loaded_vimball = "v37"
+-if v:version < 702
++if v:version < 900
+  echohl WarningMsg
+- echo "***warning*** this version of vimball needs vim 7.2"
++ echo "***warning*** this version of vimball needs vim 9.0"
+  echohl Normal
+  finish
+ endif
+@@ -270,6 +270,13 @@ fun! vimball#Vimball(really,...)
+    let fenc    = substitute(getline(linenr+1),'^\d\+\s*\(\S\{-}\)$','\1','')
+    let filecnt = filecnt + 1
+ "   call Decho("fname<".fname."> fsize=".fsize." filecnt=".filecnt. " fenc=".fenc)
++   if fname =~? '\%(^\|/\)\.VimballRecord$'
++     echomsg "(Vimball) Forbidding .VimballRecord filename, aborting..."
++     exe "tabn ".curtabnr
++     bw! Vimball
++     call s:ChgDir(curdir)
++     return
++   endif
+ 
+    if a:really
+     echomsg "extracted <".fname.">: ".fsize." lines"
+@@ -309,7 +316,7 @@ fun! vimball#Vimball(really,...)
+       else
+        call mkdir(dirname)
+       endif
+-	  call s:RecordInVar(home,"rmdir('".dirname."')")
++	  call s:RecordDirInVar(dirname)
+      endif
+     endwhile
+    endif
+@@ -343,7 +350,7 @@ fun! vimball#Vimball(really,...)
+ 	 exe "silent w! ".fnameescape(fnamepath)
+ 	endif
+ 	echo "wrote ".fnameescape(fnamepath)
+-	call s:RecordInVar(home,"call delete('".fnamepath."')")
++	call s:RecordInVar(fnamepath)
+     endif
+ 
+     " return to tab with vimball
+@@ -464,11 +471,17 @@ fun! vimball#RmVimball(...)
+     let s:VBRstring= substitute(exestring,'call delete(','','g')
+     let s:VBRstring= substitute(s:VBRstring,"[')]",'','g')
+ "	call Decho("exe ".exestring)
+-	sil! keepalt keepjumps exe exestring
++	let nr_files= 0
++	for line in split(exestring, '|')
++		if line !~ '^call delete(''[^'']\{-}''\(,"d"\)\?)$'
++			echomsg "ignoring .VimballRecord entry: " line
++		else
++			sil! keepalt keepjumps exe line
++			let nr_files+= 1
++		endif
++	endfor
+ 	sil! keepalt keepjumps d
+-	let exestring= strlen(substitute(exestring,'call delete(.\{-})|\=',"D","g"))
+-"	call Decho("exestring<".exestring.">")
+-	echomsg "removed ".exestring." files"
++	echomsg "removed ".nr_files." files"
+    else
+     let s:VBRstring= ''
+ 	let curfile    = substitute(curfile,'\.vmb','','')
+@@ -622,23 +635,22 @@ fun! s:ChgDir(newdir)
+ endfun
+ 
+ " ---------------------------------------------------------------------
+-" s:RecordInVar: record a un-vimball command in the .VimballRecord file {{{2
+-fun! s:RecordInVar(home,cmd)
+-"  call Dfunc("RecordInVar(home<".a:home."> cmd<".a:cmd.">)")
+-  if a:cmd =~ '^rmdir'
+-"   if !exists("s:recorddir")
+-"    let s:recorddir= substitute(a:cmd,'^rmdir',"call s:Rmdir",'')
+-"   else
+-"    let s:recorddir= s:recorddir."|".substitute(a:cmd,'^rmdir',"call s:Rmdir",'')
+-"   endif
+-  elseif !exists("s:recordfile")
+-   let s:recordfile= a:cmd
+-  else
+-   let s:recordfile= s:recordfile."|".a:cmd
++" s:RecordInVar: record a un-vimball file deletion in the .VimballRecord file {{{2
++fun! s:RecordInVar(file)
++  if !exists("s:recordfile")
++    let s:recordfile=[]
+   endif
+-"  call Dret("RecordInVar : s:recordfile<".(exists("s:recordfile")? s:recordfile : "")."> s:recorddir<".(exists("s:recorddir")? s:recorddir : "").">")
++  call add(s:recordfile, $'call delete({string(a:file)})')
+ endfun
+ 
++" s:RecordDirInVar: record a un-vimball dir deletion in the .VimballRecord file {{{2
++fun! s:RecordDirInVar(dir)
++  if !exists("s:recorddir")
++    let s:recorddir = []
++  endif
++  call add(s:recorddir, $'call delete({string(a:dir)},"d")')
++  endfun
++
+ " ---------------------------------------------------------------------
+ " s:RecordInFile: {{{2
+ fun! s:RecordInFile(home)
+@@ -660,11 +672,11 @@ fun! s:RecordInFile(home)
+    setlocal ma
+    $
+    if exists("s:recordfile") && exists("s:recorddir")
+-   	let cmd= cmd.s:recordfile."|".s:recorddir
++   	let cmd= cmd.join(s:recordfile, '|')."|".join(s:recorddir, '|')
+    elseif exists("s:recorddir")
+-   	let cmd= cmd.s:recorddir
++   	let cmd= cmd.join(s:recorddir, '|')
+    elseif exists("s:recordfile")
+-   	let cmd= cmd.s:recordfile
++   	let cmd= cmd.join(s:recordfile, '|')
+    else
+ "    call Dret("s:RecordInFile : neither recordfile nor recorddir exist")
+ 	return
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index f84d2a9688..3a8b67085a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -58,6 +58,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2026-73074.patch \
            file://CVE-2026-73077.patch \
            file://CVE-2026-73078.patch \
+           file://CVE-2026-73076.patch \
            "
 
 PV .= ".1683"
