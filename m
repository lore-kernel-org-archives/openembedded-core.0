Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1383.1792476980370172259
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 23:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OtItb4HJ;
 spf=pass (domain: mvista.com, ip: 74.125.82.181, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3514b90bb89so7608115eec.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 23:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1792476980; x=1793081780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4IJ6ZDNg7WDa2k7XLjh8Zu901KtqSK33pMO/9AmVMI=;
        b=OtItb4HJt6c60dC/2LXkNyN0GRu0moXy0mj3uC2z+gvw0zLUpdWET3Xb0FPLRK0oXp
         i5Wgf6zYiJtBO4w8mbZGUkzmeIS6WEAW0KFZUaoxlq19v1XZDXM1ZGbhUKH26LO0FkIQ
         40vFw5aPA9GVJ1mErMfNf/C2aQwbKo68m1ye8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476980; x=1793081780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4IJ6ZDNg7WDa2k7XLjh8Zu901KtqSK33pMO/9AmVMI=;
        b=a7RurF10vXZ70Bp8I2W+tBtMEdI+5RbQp+2O9gxhY/TvdE33jlMFDpytuwaFycwSi8
         iSiAPYwpxhEso8B+3jIHWCeY03rKpSqNQEU/nQ2UWN3eWyzMm/M7Ntt40AWDR6Tz4STI
         Xh/CPrbSbtaAkn5EjG/xAo8lOFG7j8gKZLzCsXszU9T3pqJ8vBy3STzUHfFlf6qgpfC8
         X3U9Se9yWX1jkqb8TalbJpreEKphYXYz9E4YmLhADz/iEkbG7kDLzXlEoCC4SV3fUNAE
         9Nvs71ARLqYmmCu7NO10A3PafPx9eI0YeeNN+GyaUrLs4UzTTdePAl+qLQ/x16v9EioF
         Z2Eg==
X-Gm-Message-State: AFq9FYIP7IcwOOCarjtyQ3y48/8xfhG6/Bpu3OdwYWNRvre8INz8LVN0
	YEmZjFfvDRRXPTJQoYr9OC1f0G5N06rxoQmWLHEPO2rFQmyDFAi/neYO+KBejbXj3t9SIs5O7ju
	8OF+G5aw=
X-Gm-Gg: AYBFou3ur+3NpY3OF51033VtNH61ty0N5jeZrKlpugUFbveSd23hNqI0WGCcdqnf75M
	3nRySJsXMBol53kLGwMNHxTSJeu1GT0z8ohLapkPNUMcyTKc4Z31uFUSr3+zSgZwHQd+ATbi29Y
	79ILOmXZwjvARXiag1VvDsqtzCMMallJ4KBIdBpLaf12X+3SFauzIQKxa6sgh/DiPrIvMh2s37j
	1tFEDAIChfsSau3RU879wY0bx3EK4NIAp5Zk3jK3eEi5EpolLQjLRhlezZLYm/vClQ0Hci8uRcT
	ZaiqNPNVbex3kfdFTGULGcE43ammKjqSFE8UYjrkRZRv2hHmrJ920hFd/4hYrP1nE73ZUSg2U0u
	TJh3iMGOrz4fdpO8+QaBCBErlPn8m8JjNrRNC6SEsVMCTOsnPjkMQCCZ6prUgDP9p7+jXlzD7iP
	jpcHozma9WmAkOTihf8RhtaGoae58s4ecALlxTohA3+5PR+A5hxKIX04EIVyccGBkBbmxBamxnZ
	POsvLZpPEv4sEVbgb7gOA==
X-Received: by 2002:a05:7300:c397:b0:35a:5153:ab24 with SMTP id 5a478bee46e88-361a146d9d2mr13859600eec.9.1792476979500;
        Mon, 19 Oct 2026 23:16:19 -0700 (PDT)
Return-Path: <hprajapati@mvista.com>
Received: from MVIN00013.mvista.com ([103.250.136.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b63e1sm39564310eec.8.2026.10.19.23.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:16:19 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCHv4] vim: Fix for CVE-2026-73076
Date: Tue, 20 Oct 2026 11:46:10 +0530
Message-ID: <20261020061611.9031-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 06:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248220
Content-Type: text/plain; charset="utf-8"

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://github.com/vim/vim/commit/581a2f3ac9c6f96a26324f6b2c8c11415fd0d452
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73076

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../vim/files/CVE-2026-73076.patch            | 155 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73076.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-73076.patch b/meta/recipes-support/vim/files/CVE-2026-73076.patch
new file mode 100644
index 0000000000..892bec3567
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2026-73076.patch
@@ -0,0 +1,155 @@
+From b270bf38cd33c2b0724f214454e4bca1fccc65c1 Mon Sep 17 00:00:00 2001
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
+index 6456984411..3776314b88 100644
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
++    for line in split(exestring, '|')
++      if line !~ '^call delete(''[^'']\{-}''\(,"d"\)\?)$'
++        echomsg "ignoring .VimballRecord entry: " line
++      else
++        sil! keepalt keepjumps exe line
++        let nr_files+= 1
++      endif
++    endfor
+ 	sil! keepalt keepjumps d
+-	let exestring= strlen(substitute(exestring,'call delete(.\{-})|\=',"D","g"))
+-"	call Decho("exestring<".exestring.">")
+-	echomsg "removed ".exestring." files"
++	 echomsg "removed ".nr_files." files"
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
++   endif
++  call add(s:recorddir, $'call delete({string(a:dir)},"d")')
++ endfun
++
+ " ---------------------------------------------------------------------
+ " s:RecordInFile: {{{2
+ fun! s:RecordInFile(home)
+@@ -660,11 +672,11 @@ fun! s:RecordInFile(home)
+    setlocal ma
+    $
+    if exists("s:recordfile") && exists("s:recorddir")
+-   	let cmd= cmd.s:recordfile."|".s:recorddir
++        let cmd= cmd.join(s:recordfile, '|')."|".join(s:recorddir, '|')
+    elseif exists("s:recorddir")
+-   	let cmd= cmd.s:recorddir
++        let cmd= cmd.join(s:recorddir, '|')
+    elseif exists("s:recordfile")
+-   	let cmd= cmd.s:recordfile
++        let cmd= cmd.join(s:recordfile, '|')
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
-- 
2.50.1

