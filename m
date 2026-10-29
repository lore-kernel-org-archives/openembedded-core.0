Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7012.1793262357053211173
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 01:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iBVsWQYm;
 spf=pass (domain: mvista.com, ip: 74.125.82.49, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-170135e43c7so1009368c88.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 01:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1793262356; x=1793867156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5DIXIsNwdDYwvjWxwyIf/mOoNzIHMjTEAt+MZW+RHeQ=;
        b=iBVsWQYmixh+Wknmko6duRtPIBI5t6d6hCqIdC8qD0/CA2qiic4rJpQoTufsrEql1v
         ZYLKF/vPkUIaUDFcA4F/MTnQjG5eQHD2Pal/DhgN2dZW0qYlU4i3LGUnyhaeElOyWATd
         RIkIjfWorhYA4wfl0oV+hcwXJut48dwBVnaVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262356; x=1793867156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5DIXIsNwdDYwvjWxwyIf/mOoNzIHMjTEAt+MZW+RHeQ=;
        b=z7NXsLdyJ6KI1uN+x6vxJ7Ty926UfyCIwPHsftap++pOEPjQ18IaEk88jkBKVErJG7
         13w37AabdM/JWGSJ1F79/TuWGXoHt9H1P3EcNI3bYe2vvRQ1AbFmuOPLa+alGkZ6vOKN
         eVb5VhMw4nVFgEUrHWRAuUtctLTKwNQh6NzHmYEzyIO45SHqPGjqLX4fUoQoDDX10RCO
         hyxl9rpF27VB9FoyCq5MhE/7eEQuuFTvTITrmM7ZfVJmg2KHyhjuDiQRnvzpFgYxGiMt
         EDXqqeP3+G9BOts+yWy4Zr48X2u4MhxKf0yBpezfE2jXpCrKHyvVe/29kWW7S9rHKSwy
         Ll/w==
X-Gm-Message-State: AFq9FYLLsZWH8d192NmQvOxzbfK2USpxbWMhN5x0dz2mYAPVe2FTaiOP
	IwvG5VNIq+bggN1saQh0uXF8vNMV/Uvw704VVpeYzqQ90qJ7Z7hu0ftkX2lx8NwnVgyoip0zKyX
	wheVpd/M=
X-Gm-Gg: AYBFou2pHb2TN4UursFEhe3UISPSmihJiYWzIRTrgl6bLm26UkYC22KrXtw9UOBtQV+
	zrEMyyOP0lTF9vINx2KFFa7/K9G/jUvup15K4uAYOSaNXyTR2CIwo1+q0Q+D7Dp+6YjIYjoVIBV
	ehOTzeexUT9Um+CA7MzynxWHABCPK9L5t5XmLP2KWSnj93JjnVxbwyldELzA+sP3Kl9HpWwvigl
	lStkPh8eJLcqgEuYuJyLmUtQrVdbxqtGbm3nxjVjd1AwRFiLN0zI1mfs5SP1KAHE4+BUZi7vE1W
	yQztG9+7PTC1DI6Oq/GrhXwTFVEyrTpFFgoh9jeAQ6q6UvuEG8Yx+oXvBhMrTzLlK0NKNmFL944
	BUW1dudGEgP0qmn/KG/p0sFoq0i+U06PH+/jm3tYljlHGVXDxh0AVrkV3NWpLCgRiKxPr1jZE7X
	CJjaznIxjbHpbd2aTbIY5bXzadTMAC+iGy8zxbgAhdYRZdSVPu9WsX/DNP/a1dpVd7NLkzRaslj
	rTgRPH4nUfrrSsi4rmnQl/ChAq3LZuslsiRQIDNbINl8l8q0Q4QV+zS0ViQlY2oZnK3y42DLCUv
	R7t6wEACuFAjvjgCPOQ6/gR2xq5V7KCmOz0+qOFvFg==
X-Received: by 2002:a05:7023:a47:10b0:196:e254:db24 with SMTP id a92af1059eb24-1a6cced4226mr6113929c88.21.1793262355989;
        Thu, 29 Oct 2026 01:25:55 -0700 (PDT)
Return-Path: <hprajapati@mvista.com>
Received: from MVIN00013.mvista.com ([103.250.136.237])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a7549528ebsm11760930c88.0.2026.10.29.01.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:25:55 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCHv5] vim: Fix for CVE-2026-73076
Date: Thu, 29 Oct 2026 13:55:48 +0530
Message-ID: <20261029082548.641629-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 08:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248909
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
index 0000000000..5ed023a747
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
+index 6456984411..803d19a83b 100644
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
++	 let cmd= cmd.join(s:recordfile, '|')."|".join(s:recorddir, '|')
+    elseif exists("s:recorddir")
+-   	let cmd= cmd.s:recorddir
++	 let cmd= cmd.join(s:recorddir, '|')
+    elseif exists("s:recordfile")
+-   	let cmd= cmd.s:recordfile
++	 let cmd= cmd.join(s:recordfile, '|')
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

