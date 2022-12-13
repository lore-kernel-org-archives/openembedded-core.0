Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F263CC2D0CC
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:46 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.70630.1670929887012599922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=odUxC5pw;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id co23so15230896wrb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0734l3aoUZblG4wHamfW+9Z0+sDRpxq4nYVqrIBnLAU=;
        b=odUxC5pwmcW7NLtUUAva99iCWyZ0FJdhpBY8kUNmCivACrPjVD6e6ZDmwXfA5Gf5FP
         gzAgPGDcoeGRA7UY1T0BgFpWIwF+sJoEjnf4SjwRZA7FgblTpkdXo+XHTpTmm5jwCSac
         hEQpTJOU+sU4TyxbbOWDLvxD1XdcbWTTD+lcQgSCyKzeSxITWCGu7fv3WgYJqczSf3h3
         L0s972hvlEAGk69/mt6q3U/FlFJN5oEDQ8nS92NPNJ3/3Z8Q3nJVK2K/UIE3jqLVad39
         aN9hozGvBWD078quuIag3xLU6fLUOyP8EA52ioVYwH1XrXmmCoL9v58cYx+JX7CG5TAK
         LGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0734l3aoUZblG4wHamfW+9Z0+sDRpxq4nYVqrIBnLAU=;
        b=Om778+hZNeUU52U9FnPtN/OnBtLvC4j0pNMYL9+o+CIsUGp+SXF8Nsw39vIz+JDElG
         smhpI6DB2hCz5BQkpjSwDtFH44XzNzIUZcS+Nsd9MK/C74/DgYwxD6pxKE6eOaeGgQzG
         WPHZ40qBJGTdPPTPK07hScCKN/+tSBzbSDlr/zFU6/1jGcnctjyOtQCeWlD3alNd8rcD
         vnPzB9+e7H/KewEwZKMRPOQhsprHhCfUnXVJ/UzzGAOJIUlrHvxWxwPQacUGr+ThFnSp
         oKueQgOKM/38mhKDUKwodgCMQEv8AIHVW6hqtfixXC/PLoIInmhY8/8rfEFA7rpY8kjE
         aVJA==
X-Gm-Message-State: ANoB5plgrDdCB7SItaARTxvDunAsNdo7uPTN3kz4ZcrWIGn8s2IlXOd/
	rckPFnkbhbdCeJdc/tQyV7SoYqqTlAY=
X-Google-Smtp-Source: AA0mqf4EU5mUfifXLMvpcpYrwxYhYO/VNAAkcYA8MyWlwo7cqfGgEwOM0/xqlUJIqr+K/4pIn7y8Iw==
X-Received: by 2002:adf:e4cc:0:b0:24d:b0fb:e2c3 with SMTP id v12-20020adfe4cc000000b0024db0fbe2c3mr8255553wrm.61.1670929898795;
        Tue, 13 Dec 2022 03:11:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/24] ghostscript: update 9.56.1 -> 10.0.0
Date: Tue, 13 Dec 2022 12:11:15 +0100
Message-Id: <20221213111118.149697-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174531

Drop --without-jbig2dec as it is now required by pdf support
and jbig2dec library is in ghostscript's source tree.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ghostscript/cross-compile.patch           | 40 +++++++++++++++++++
 .../do-not-check-local-libpng-source.patch    |  8 ++--
 ...script_9.56.1.bb => ghostscript_10.0.0.bb} |  5 ++-
 3 files changed, 47 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/cross-compile.patch
 rename meta/recipes-extended/ghostscript/{files => ghostscript}/do-not-check-local-libpng-source.patch (85%)
 rename meta/recipes-extended/ghostscript/{ghostscript_9.56.1.bb => ghostscript_10.0.0.bb} (96%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/cross-compile.patch b/meta/recipes-extended/ghostscript/ghostscript/cross-compile.patch
new file mode 100644
index 0000000000..ba62820df1
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/cross-compile.patch
@@ -0,0 +1,40 @@
+From 4c3575346b9c7d394ebc73b4e5fabebadd8877ec Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Thu, 24 Nov 2022 16:33:47 +0000
+Subject: [PATCH] Fix a little bitrot in the cross-compiling logic
+
+Removing the option to disable FAPI meant configuring for cross compiling would
+fail because the option being passed to the sub-call to configure would include
+an unknown command line option.
+
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=patch;f=configure.ac;h=4c3575346b9c7d394ebc73b4e5fabebadd8877ec]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d5c68c4b3..738eb10a9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -138,7 +138,7 @@ if test x"$host" != x"$build" ; then
+   echo $AUXFLAGS_MAK_LINE07 >> $AUXFLAGS_MAK.in
+ 
+   AC_MSG_NOTICE([Begin recursive call to configure script (for auxiliary tools)])
+-  "$absolute_source_path/configure" CC="$CCAUX" CFLAGS="$CFLAGSAUX" CPPFLAGS="$CPPFLAGSAUX" LDFLAGS="$LDFLAGSAUX" CCAUX= CFLAGSAUX= CFLAGSAUX= MAKEFILE=$AUXFLAGS_MAK --host=$build --build=$build --enable-auxtools_only --disable-hidden-visibility --with-local-zlib --without-libtiff --disable-contrib --disable-fontconfig --disable-dbus --disable-freetype --disable-fapi --disable-cups --disable-openjpeg --disable-gtk --with-libiconv=no --without-libidn --without-libpaper --without-pdftoraster --without-ijs --without-jbig2dec --without-x --with-drivers=""
++  "$absolute_source_path/configure" CC="$CCAUX" CFLAGS="$CFLAGSAUX" CPPFLAGS="$CPPFLAGSAUX" LDFLAGS="$LDFLAGSAUX" CCAUX= CFLAGSAUX= CFLAGSAUX= MAKEFILE=$AUXFLAGS_MAK --host=$build --build=$build --enable-auxtools_only --disable-hidden-visibility --with-local-zlib --without-libtiff --disable-contrib --disable-fontconfig --disable-dbus --disable-freetype --disable-cups --disable-openjpeg --disable-gtk --with-libiconv=no --without-libidn --without-libpaper --without-pdftoraster --without-ijs --without-jbig2dec --without-x --with-drivers=""
+   status=$?
+   cp config.log "$olddir/configaux.log"
+   if test $status -eq 0 ; then
+@@ -2530,7 +2530,7 @@ PDF=
+ PDF_MAK="\$(GLSRCDIR)\$(D)stub.mak"
+ PDFROMFS_MAK="\$(GLSRCDIR)\$(D)stub.mak"
+ 
+-if test x"$with_pdf" != x"no" ; then
++if test x"$with_pdf" != x"no" -a x"$enable_auxtools_only" != x"yes" ; then
+ 
+   if test x"$JBIG2_DECODER" = x""; then
+       AC_MSG_ERROR([No JBIG2 decoder available, required for PDF support])
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch b/meta/recipes-extended/ghostscript/ghostscript/do-not-check-local-libpng-source.patch
similarity index 85%
rename from meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
rename to meta/recipes-extended/ghostscript/ghostscript/do-not-check-local-libpng-source.patch
index a9afb9948c..13e71c824f 100644
--- a/meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/do-not-check-local-libpng-source.patch
@@ -1,4 +1,4 @@
-From 2adaa7366064a8f18af864eda74e52877a89620c Mon Sep 17 00:00:00 2001
+From 108a7d3f79af8c669af129bd87401402e76edfa9 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 18 Jan 2016 01:00:30 -0500
 Subject: [PATCH] configure.ac: do not check local png source
@@ -17,12 +17,12 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 698abd3..e65ac8b 100644
+index bb57825..389c473 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1241,7 +1241,7 @@ else
+@@ -1441,7 +1441,7 @@ else
    PNGDEVS=''
-   PNGDEVS_ALL='png48 png16m pnggray pngmono pngmonod png256 png16 pngalpha'
+   PNGDEVS_ALL='png48 png16m pnggray pngmono pngmonod png256 png16 pngalpha png16malpha'
    AC_MSG_CHECKING([for local png library source])
 -  if test -f $srcdir/libpng/pngread.c; then
 +  if false; then
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.56.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
similarity index 96%
rename from meta/recipes-extended/ghostscript/ghostscript_9.56.1.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
index e71a6cc0d3..56a93632e2 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.56.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
@@ -33,6 +33,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://do-not-check-local-libpng-source.patch \
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
+                file://cross-compile.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
@@ -44,7 +45,7 @@ SRC_URI:class-native = "${SRC_URI_BASE} \
                         file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
                         "
 
-SRC_URI[sha256sum] = "1598b9a38659cce8448d42a73054b2f9cbfcc40a9b97eeec5f22d4d6cd1de8e6"
+SRC_URI[sha256sum] = "a57764d70caf85e2fc0b0f59b83b92e25775631714dcdb97cc6e0cea414bb5a3"
 
 # Put something like
 #
@@ -72,7 +73,7 @@ EXTRA_OECONF:append:mipsarcho32 = " --with-large_color_index=0"
 # Explicity disable libtiff, fontconfig,
 # freetype, cups for ghostscript-native
 EXTRA_OECONF:class-native = "--without-x --with-system-libtiff=no \
-                             --without-jbig2dec --without-libpaper \
+                             --without-libpaper \
                              --with-fontpath=${datadir}/fonts \
                              --without-libidn --disable-fontconfig \
                              --enable-freetype --disable-cups "
-- 
2.30.2


