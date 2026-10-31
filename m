Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.321.1793416329919602260
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 20:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fmG17k4s;
 spf=pass (domain: mvista.com, ip: 74.125.82.170, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36661f953e4so2052837eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 20:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1793416329; x=1794021129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BnyzBQa9eKGEZJHZtdMr4Bqp9OVEAnEabO19UJ2q2gs=;
        b=fmG17k4s/AZED+oINgrrvOvqItZMKmQVW4x25IvbS9TXOL576aarWUzklWNLvSlsiM
         f7Rf6zZZ7RVA0kIlHeK816BbraZSi1vFjd4GdypDqg7ORT/km95kcg9cGaBCl8fLw6LY
         3U6ycR0nXmbCd2nyUIvuyq5D2x0cJMgnx9c2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793416329; x=1794021129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BnyzBQa9eKGEZJHZtdMr4Bqp9OVEAnEabO19UJ2q2gs=;
        b=JVX3CADPgVD0YB/kZSEUPOy/iUXKxOpNZn5pV44oT2LLGAuYT5ztNgk/wRutwCcIb6
         ZOVwyfUGXH9UwHAGsZRRFnQAlsPyp1OTwFIODGMq+67AWYFPyb+5p1UpkNQK9kpXpUT6
         GZu9AIslfSBqzt5tBs2DgT9MAZkVCb3D07fu87NnVEAmF6ORY6aY1CajluqzXhey2pwb
         6afKUkldsevmMkcDMpd3pa8GU1TvpxWnEvWUytsmgAMOyISXL4h96lQPHBLuQVZQdOGc
         hprr1Jq5FxHWb0xhUw9bZFBWMzYs2yQBQBktL51vNjKX4q/IXvVUMK5RmrxdlXlskApG
         N9mA==
X-Gm-Message-State: AFq9FYI5qPA9XJUwlu49rtq2GyJORJkmTzRzWjsUOENbaDTBTtDW2RA3
	t7/1au5sQDLFTjFgazwzcOlut3rtlD5Td8vLTS6dfNPE7/CJknIFUwpJqK6CXe8nymSnuKpSKYT
	u0Kx3UIo=
X-Gm-Gg: AYBFou3zC+L1son2PYYaG3cKpNjB1gql5jp6f9MOtHf8j+CHUbM3XJ5T/ITfpfc92yZ
	pICARsXk04xRrj7C7gRB1kvsZdMrPhHfvcbXQmw3ljBb2TBswFPwyY+YCEtp9sThypm0r/zCNCo
	YsfeZmTvzIjmeWlHIgB9DzehHOhat34utzODwm/R2YzvwVvERsltaPvxOP3kukgHLhFBwxSpcbr
	EXsZ/KB2uehBDC5tl+KYoZtSA7i4dRAlSw4EP/2NSuCRrqIqae4GGEB0AybxB8kFKvZCG0W54Gi
	fzDMrPf0DV7Rz7Gt41tGdHadBqxU1nNz48WOmvmNtojUTdiFVTl+hE2f9a05T7htVyKAvJ3kBAC
	4iBszlDGNf58ZVLV6E1j/KraXFlUuq2fS/aVMWLlHNxN3YsgIfJ3ywUrBW4ggjn/zvnVkCSNG1i
	kggDjvSDme7LSQ6n/zuPLu9g3XWR3YV4N0wflwSBQ23pcfavVQanySRhi9h/bKFNYZiS+XeBkJc
	fTKBK9J/EPQF4zDNSyw7DjpwbpeLTOkX6cB1dGKg20csuDY5YYHyqcoiGfq3huUXqfaG8TJbHkx
	qzdmhK9GCYe7NRuEu+zucT5fuDY=
X-Received: by 2002:a05:693c:414f:20b0:369:e930:6bc4 with SMTP id 5a478bee46e88-36a423f6f4amr6186799eec.30.1793416329013;
        Fri, 30 Oct 2026 20:12:09 -0700 (PDT)
Return-Path: <hprajapati@mvista.com>
Received: from MVIN00013 ([103.250.136.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm13316816eec.22.2026.10.30.20.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:12:08 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCHv6] vim: Fix for CVE-2026-73076
Date: Sat, 31 Oct 2026 08:42:03 +0530
Message-ID: <20261031031203.5491-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 03:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249131
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
index 0000000000..aacca1a3f0
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
++	let cmd= cmd.join(s:recordfile, '|')."|".join(s:recorddir, '|')
+    elseif exists("s:recorddir")
+-   	let cmd= cmd.s:recorddir
++	let cmd= cmd.join(s:recorddir, '|')
+    elseif exists("s:recordfile")
+-   	let cmd= cmd.s:recordfile
++	let cmd= cmd.join(s:recordfile, '|')
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

