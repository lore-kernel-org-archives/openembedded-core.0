Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874B5C54E6A
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:57 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.2095.1710351233090624194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TELib/54;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5131316693cso168886e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351231; x=1710956031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsljwgexOdKy+UkGo/wFzK2xnwuieO6u4kKGJQ7tgTc=;
        b=TELib/54qC83e9Ki2UjisOSAhnYVVHPQikzTQb1ItDUysCWejG33Ji7R1rL9GsXILr
         F2QLch73koa6qBbFzpf/PaN6hA/C2/2NWJNZltcS8RZMLh7PXkf3zNrnhDTaNLsrzve1
         nO0+XxbEa1uvPvSUCwnrCROv0gFXmeA9eGIofXVE7tZxB5G/SWxhB6vUOuntVPGMlWep
         cNTuzFyY5GJoLYqqYbjATlVXeJHIzDhNj4HcOa+PQpkL3yXUPK2Dk9nfc31Y+gBBAMqX
         hw0NyshyPxU9oV5qSVSn1/fn/ssS3qrXEx1Whq1oPOeO5dxTffONyn+yA4HqxWfOcaC9
         Wg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351231; x=1710956031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsljwgexOdKy+UkGo/wFzK2xnwuieO6u4kKGJQ7tgTc=;
        b=WxP6kyOobUaP74nS3kvC9jVe0tc2vJ9wtxPxB6K+rhamp/kMd3ouUs6Wn+wPCqjjgK
         s0ySv445HbeLWbSEhbA4rqJJ227CnXXrR8+p4FhUvqfWHjk8kbNmKVRHTu16h+lTI8pR
         Z2PZQ2xdx1qa5ep+McSXZYtnWSua3HTDrsyy5H54EHRobkQUmRjLZgDw9XqXj6oD2RCC
         I0Jo8DRZY6cb0u+DUdA5cAK1Oo1/QRXYMpAfFiiviaMkLR60MkHEBgYfKVCKth6iq0Ar
         3AjUIjyo1CtC0QgVwKyrc9pZ3ZxDVnlog5NZTMhmohd5dxRDsoLgESGg5oeoRPewsH8N
         qIwA==
X-Gm-Message-State: AOJu0Yw+pTiJRBn5SaT/WpX5oB2H31j7dk0IziX5LMJRieYL9no16/A6
	0ylt5dh9RaXJJShPdJWP6DQ1k/BgPH18N19p+X80RuTMsEhg3YfyZ4rpKbvb
X-Google-Smtp-Source: AGHT+IHe48+tnYIQYSOVPbZwpnpQeQpKlUE19rBy1irSWkmTSCnrBWj9gVT0ayqqb2hRJNGZxEoj2g==
X-Received: by 2002:ac2:5e3c:0:b0:513:c6ec:fa6c with SMTP id o28-20020ac25e3c000000b00513c6ecfa6cmr2156163lfg.48.1710351231208;
        Wed, 13 Mar 2024 10:33:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/21] texinfo: update 7.0.3 -> 7.1
Date: Wed, 13 Mar 2024 18:33:34 +0100
Message-Id: <20240313173336.3900178-19-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197071

Drop texinfo/link-zip.patch
(no longer necessary)

Add texinfo_cv_sys_iconv_converts_euc_cn=yes as otherwise
it's determined via building and running a helper binary.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...hanges-to-build-without-zlib-and-nc.patch} | 13 +++++++----
 ...tch => 0002-dont-depend-on-help2man.patch} | 16 +++++++------
 ...patch => 0003-texinfo-Update-to-5.1.patch} | 12 ++++++----
 .../texinfo/texinfo/link-zip.patch            | 23 -------------------
 .../{texinfo_7.0.3.bb => texinfo_7.1.bb}      | 10 ++++----
 5 files changed, 29 insertions(+), 45 deletions(-)
 rename meta/recipes-extended/texinfo/texinfo/{disable-native-tools.patch => 0001-texinfo-several-changes-to-build-without-zlib-and-nc.patch} (88%)
 rename meta/recipes-extended/texinfo/texinfo/{dont-depend-on-help2man.patch => 0002-dont-depend-on-help2man.patch} (84%)
 rename meta/recipes-extended/texinfo/texinfo/{use_host_makedoc.patch => 0003-texinfo-Update-to-5.1.patch} (75%)
 delete mode 100644 meta/recipes-extended/texinfo/texinfo/link-zip.patch
 rename meta/recipes-extended/texinfo/{texinfo_7.0.3.bb => texinfo_7.1.bb} (89%)

diff --git a/meta/recipes-extended/texinfo/texinfo/disable-native-tools.patch b/meta/recipes-extended/texinfo/texinfo/0001-texinfo-several-changes-to-build-without-zlib-and-nc.patch
similarity index 88%
rename from meta/recipes-extended/texinfo/texinfo/disable-native-tools.patch
rename to meta/recipes-extended/texinfo/texinfo/0001-texinfo-several-changes-to-build-without-zlib-and-nc.patch
index 3801d73883d..b43a115b235 100644
--- a/meta/recipes-extended/texinfo/texinfo/disable-native-tools.patch
+++ b/meta/recipes-extended/texinfo/texinfo/0001-texinfo-several-changes-to-build-without-zlib-and-nc.patch
@@ -1,7 +1,8 @@
-From e5d8f6d4a7652ea95c8d069ce9333494f2db868c Mon Sep 17 00:00:00 2001
+From ee9d23373b488c4a499c561d71e6b6ba7ca1bd31 Mon Sep 17 00:00:00 2001
 From: Joshua Lock <josh@linux.intel.com>
 Date: Fri, 16 Sep 2011 15:35:48 -0700
-Subject: [PATCH] texinfo: several changes to build without zlib and ncurses
+Subject: [PATCH 1/3] texinfo: several changes to build without zlib and
+ ncurses
 
 We already DEPEND on the native texinfo being present before building so
 there isn't any need to try and build the required native texinfo binaries
@@ -10,16 +11,15 @@ before cross-compiling. This simplifies the recipe somewhat!
 Upstream-Status: Inappropriate oe specific
 
 Signed-off-by: Joshua Lock <josh@linux.intel.com>
-
 ---
  configure.ac | 24 +-----------------------
  1 file changed, 1 insertion(+), 23 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 6fcd3a0..c108df7 100644
+index 8094498..5b72fc1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -180,29 +180,7 @@ AC_CANONICAL_BUILD
+@@ -247,29 +247,7 @@ AC_CANONICAL_BUILD
  # $native_tools is also added to SUBDIRS in the main Makefile.am,
  # so that make compiles the native tools first.
  #
@@ -50,3 +50,6 @@ index 6fcd3a0..c108df7 100644
  AC_SUBST(native_tools)
  AM_CONDITIONAL(TOOLS_ONLY, [[test "x$tools_only" = x1]])
  
+-- 
+2.39.2
+
diff --git a/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch b/meta/recipes-extended/texinfo/texinfo/0002-dont-depend-on-help2man.patch
similarity index 84%
rename from meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch
rename to meta/recipes-extended/texinfo/texinfo/0002-dont-depend-on-help2man.patch
index 825887cc2e9..f3b6827d582 100644
--- a/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch
+++ b/meta/recipes-extended/texinfo/texinfo/0002-dont-depend-on-help2man.patch
@@ -1,33 +1,32 @@
-From 451a9b9c3874872d575693fc7733fae02690a7d3 Mon Sep 17 00:00:00 2001
+From e02be81fa68ddc7f939abd99de4e42759a0d5d8c Mon Sep 17 00:00:00 2001
 From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
 Date: Tue, 29 Nov 2016 13:43:24 -0600
-Subject: [PATCH] dont-depend-on-help2man
+Subject: [PATCH 2/3] dont-depend-on-help2man
 
 Upstream-Status: Inappropriate
 
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
 Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
-
 ---
  doc/Makefile.am |  2 +-
  man/Makefile.am | 12 ++++++------
  2 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/doc/Makefile.am b/doc/Makefile.am
-index 407a38c..6b5ff3e 100644
+index e9e6298..f1b9895 100644
 --- a/doc/Makefile.am
 +++ b/doc/Makefile.am
-@@ -55,7 +55,7 @@ refcard_files = refcard/Makefile refcard/txicmdcheck \
+@@ -63,7 +63,7 @@ refcard/txirefcard.pdf refcard/txirefcard-a4.pdf: refcard/txirefcard.tex
  # Include our texinfo.tex, not Automake's.
  EXTRA_DIST = epsf.tex texinfo.tex \
               fdl.texi \
 -	     $(man_MANS) $(TXI_XLATE) \
 +	     $(TXI_XLATE) \
               $(refcard_files) \
-              gendocs.chapter/gendocs_template \
  	     texinfo-tex-test.texi texinfo-tex-test.WIDOWs \
+              texinfo-ja.tex short-sample-ja.texi \
 diff --git a/man/Makefile.am b/man/Makefile.am
-index d0cd72c..a19e52a 100644
+index f2c703f..61caeeb 100644
 --- a/man/Makefile.am
 +++ b/man/Makefile.am
 @@ -11,27 +11,27 @@
@@ -64,3 +63,6 @@ index d0cd72c..a19e52a 100644
  
  # Maintainers should be able to regenerate.
  MAINTAINERCLEANFILES = $(man_MANS)
+-- 
+2.39.2
+
diff --git a/meta/recipes-extended/texinfo/texinfo/use_host_makedoc.patch b/meta/recipes-extended/texinfo/texinfo/0003-texinfo-Update-to-5.1.patch
similarity index 75%
rename from meta/recipes-extended/texinfo/texinfo/use_host_makedoc.patch
rename to meta/recipes-extended/texinfo/texinfo/0003-texinfo-Update-to-5.1.patch
index c6c9952c9ed..f99f8b87d5c 100644
--- a/meta/recipes-extended/texinfo/texinfo/use_host_makedoc.patch
+++ b/meta/recipes-extended/texinfo/texinfo/0003-texinfo-Update-to-5.1.patch
@@ -1,21 +1,20 @@
-From 81ccd162b869c20e450073fa834b5cabbea8e3d4 Mon Sep 17 00:00:00 2001
+From 33b85a3928895b812b37dc759c6de711802db45f Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Mon, 29 Jul 2013 15:02:34 -0700
-Subject: [PATCH] texinfo: Update to 5.1
+Subject: [PATCH 3/3] texinfo: Update to 5.1
 
 Upstream-Status: Inappropriate [cross build specific]
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
 ---
  info/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/info/Makefile.am b/info/Makefile.am
-index 35596b1..cae1421 100644
+index f57b341..a019aa7 100644
 --- a/info/Makefile.am
 +++ b/info/Makefile.am
-@@ -69,7 +69,7 @@ cmd_sources = $(srcdir)/session.c $(srcdir)/echo-area.c $(srcdir)/infodoc.c \
+@@ -77,7 +77,7 @@ cmd_sources = $(srcdir)/session.c $(srcdir)/echo-area.c $(srcdir)/infodoc.c \
  # more than once.
  funs.h: makedoc$(EXEEXT) $(cmd_sources)
  	rm -f $(generated_sources)
@@ -24,3 +23,6 @@ index 35596b1..cae1421 100644
  
  # The following hack is necessary to hint make before the automatic
  # dependencies are built.
+-- 
+2.39.2
+
diff --git a/meta/recipes-extended/texinfo/texinfo/link-zip.patch b/meta/recipes-extended/texinfo/texinfo/link-zip.patch
deleted file mode 100644
index 72d7067aa90..00000000000
--- a/meta/recipes-extended/texinfo/texinfo/link-zip.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From c5050ac84c8a3cc3ff8c7e558f8c2fdb57f410d9 Mon Sep 17 00:00:00 2001
-From: Joshua Lock <josh@linux.intel.com>
-Date: Mon, 29 Jul 2013 15:02:34 -0700
-Subject: [PATCH] install-info uses symbols from zlib so must link against it.
-
-Upstream-Status: Pending
-
-Signed-off-by: Joshua Lock <josh@linux.intel.com>
-
----
- install-info/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/install-info/Makefile.am b/install-info/Makefile.am
-index 9bcff71..68247f9 100644
---- a/install-info/Makefile.am
-+++ b/install-info/Makefile.am
-@@ -33,4 +33,4 @@ AM_CPPFLAGS = 					\
-   -I$(top_srcdir)/gnulib/lib			\
-   -I$(top_builddir)/gnulib/lib			\
-   -DLOCALEDIR=\"$(localedir)\"
--LDADD = $(top_builddir)/gnulib/lib/libgnu.a $(LIBINTL) $(LIBTHREAD)
-+LDADD = $(top_builddir)/gnulib/lib/libgnu.a $(LIBINTL) $(LIBTHREAD) -lz
diff --git a/meta/recipes-extended/texinfo/texinfo_7.0.3.bb b/meta/recipes-extended/texinfo/texinfo_7.1.bb
similarity index 89%
rename from meta/recipes-extended/texinfo/texinfo_7.0.3.bb
rename to meta/recipes-extended/texinfo/texinfo_7.1.bb
index b149177b72d..65d8252fb97 100644
--- a/meta/recipes-extended/texinfo/texinfo_7.0.3.bb
+++ b/meta/recipes-extended/texinfo/texinfo_7.1.bb
@@ -25,17 +25,16 @@ RDEPENDS:info += "${@compress_pkg(d)}"
 DEPENDS = "zlib ncurses texinfo-replacement-native"
 DEPENDS:class-native = "zlib-native ncurses-native"
 
-TARGET_PATCH = "file://use_host_makedoc.patch"
+TARGET_PATCH = "file://0003-texinfo-Update-to-5.1.patch"
 TARGET_PATCH:class-native = ""
 
 SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
-           file://disable-native-tools.patch \
-           file://link-zip.patch \
-           file://dont-depend-on-help2man.patch \
+           file://0001-texinfo-several-changes-to-build-without-zlib-and-nc.patch \
+           file://0002-dont-depend-on-help2man.patch \
            ${TARGET_PATCH} \
            "
 
-SRC_URI[sha256sum] = "3cc5706fb086b895e1dc2b407aade9f95a3a233ff856273e2b659b089f117683"
+SRC_URI[sha256sum] = "dd5710b3a53ac002644677a06145748e260592a35be182dc830ebebb79c5d5a0"
 
 tex_texinfo = "texmf/tex/texinfo"
 
@@ -44,6 +43,7 @@ inherit gettext autotools multilib_script
 MULTILIB_SCRIPTS = "${PN}:${bindir}/texi2any"
 
 EXTRA_AUTORECONF += "-I ${S}/gnulib/m4"
+CACHED_CONFIGUREVARS += "texinfo_cv_sys_iconv_converts_euc_cn=yes"
 
 do_configure:prepend () {
 	# autotools_do_configure updates po/Makefile.in.in, we also need
-- 
2.39.2


