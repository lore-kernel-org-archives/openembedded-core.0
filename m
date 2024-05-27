Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5920DC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 18:12:36 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.3778.1716833545959943142
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 11:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mH9SOD7Y;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-35502a992c9so8302f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 11:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716833544; x=1717438344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2SBUWIKFwm7ivLtrB2I+7N61tZmEqv4WShyBauZuRk=;
        b=mH9SOD7YCKZTFVpUFS3lSh64NHJ7u+OPL0i/Ui54aatuT0Il+PppkROzjBNcHv2ZJC
         3jDovsA8L4niGV2rFaYFSRReKaEMlAOaYNhhUMijLYtfA0ANgzN3ECSUlTIXFoHCMPuM
         irwtIc5AKqchD697D7+tXAE8P2tRsSEGqc+HqB+GWexgPBdi8ThcPt1uXQYtl//aim9s
         q6zouXLM9p9LumevYYfPQOga2OD2Fkwrx/0UIqEiHTBoVo09I1wpi/zqBfzqL5xL4XOX
         TexRLMzaijgF2LSKv1OqJhx/U0rB89ePRYhL7KVejuvdjUdQjNMOsq0ZzAqkez/hStsK
         FxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716833544; x=1717438344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2SBUWIKFwm7ivLtrB2I+7N61tZmEqv4WShyBauZuRk=;
        b=rcQcUit1nRgcLkjk8B0vhsjGXUqJhG4Exow9DKw+vzFJ5ymAh6DVfxT72e27PPk90T
         6G62TPUZeou8ZYuE/YGqtaWJ5WYSO5Qyexf/izQv/HsOzdxk0uCriQQiaXdrWCL9Op0q
         MV31T1KUPMHKRajRdLny21KEIguRArs93r++ka+tXYxlZnEmQyrPI9NmjEnqXEBfBmcI
         gXIimh+EU4vLdxnmU2cXWUPcY8WbRGr+nx/IRaakXDxJvBFk7fb+HlZMMuXX1Evjaln8
         IAv8UYWrMFoz+qw5s75n3lRy1YvmbjZl2Ge96iZ+vzGrEuGV//jaAcyws2zjVKeGafP9
         gZvw==
X-Gm-Message-State: AOJu0YzcN8F6QE432LVAl/ahrqpljsJTNKRpGv56I3o7p/qHVAfHWVCg
	HZRkRrjJvtP52tA1Aiw1nAntCtQ1Oqc2fJNLHL0+1eio6ILIwhGZkToHdQ==
X-Google-Smtp-Source: AGHT+IGQCrt8Wb0wcCrkRwl+7YcNB+FeK7L0uC6daPDkotAPqtt3DHtySY+zYgRLxFtizXmv+3KYdg==
X-Received: by 2002:adf:e541:0:b0:34f:c7c8:5a12 with SMTP id ffacd0b85a97d-3552fdaaac0mr8256920f8f.40.1716833544281;
        Mon, 27 May 2024 11:12:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc50064sm510272466b.107.2024.05.27.11.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 11:12:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/13] gtk-doc: upgrade 1.33.2 -> 1.34.0
Date: Mon, 27 May 2024 20:12:12 +0200
Message-Id: <20240527181214.1778037-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527181214.1778037-1-alex.kanavin@gmail.com>
References: <20240527181214.1778037-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 18:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199928

From: Alexander Kanavin <alex@linutronix.de>

Drop merged patch.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...t-error-out-if-xsltproc-is-not-found.patch |  9 +++----
 ...code-paths-to-perl-python-in-scripts.patch | 23 +++++++++---------
 ...01-Don-t-use-docdir-from-environment.patch | 24 -------------------
 .../gtk-doc/files/conditionaltests.patch      | 14 ++++-------
 .../gtk-doc/files/no-clobber.patch            |  7 +++---
 .../gtk-doc/files/pkg-config-native.patch     |  3 +--
 .../{gtk-doc_1.33.2.bb => gtk-doc_1.34.0.bb}  |  3 +--
 7 files changed, 24 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk-doc/files/0001-Don-t-use-docdir-from-environment.patch
 rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.33.2.bb => gtk-doc_1.34.0.bb} (94%)

diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
index 99ae4d44171..ee1acda401c 100644
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
@@ -1,4 +1,4 @@
-From 8b7fbbb405959f2868ad6eadd7dd00018758a8a5 Mon Sep 17 00:00:00 2001
+From 50d3b9d3ca0e1ff47c8e7559303855530e58839a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 7 Sep 2016 14:52:04 +0300
 Subject: [PATCH] Do not error out if xsltproc is not found.
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index b0c88d7..2a61d6e 100644
+index 8725074..0491090 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -58,7 +58,7 @@ dnl Check for xsltproc
+@@ -37,7 +37,7 @@ dnl Check for xsltproc
  dnl
  AC_PATH_PROG([XSLTPROC], [xsltproc])
  if test -z "$XSLTPROC"; then
@@ -26,6 +26,3 @@ index b0c88d7..2a61d6e 100644
  fi
  
  dnl
--- 
-2.9.3
-
diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
index 19e05f1b996..f329539fa8b 100644
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
@@ -1,4 +1,4 @@
-From 80e6aff72affa6d92f5abd7ff6353dfc4a7bff38 Mon Sep 17 00:00:00 2001
+From 64163565f8d6853b02e53308a6e6ba23d9d96299 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Aug 2016 16:44:46 +0300
 Subject: [PATCH] Do not hardocode paths to perl/python in scripts.
@@ -9,7 +9,6 @@ on targets either.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  gtkdoc-check.in    | 2 +-
  gtkdoc-depscan.in  | 2 +-
@@ -25,7 +24,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  11 files changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/gtkdoc-check.in b/gtkdoc-check.in
-index 8c8e917..f6a25f6 100755
+index d9e2ad5..9ec526d 100755
 --- a/gtkdoc-check.in
 +++ b/gtkdoc-check.in
 @@ -1,4 +1,4 @@
@@ -35,7 +34,7 @@ index 8c8e917..f6a25f6 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-depscan.in b/gtkdoc-depscan.in
-index 9bfaf30..aadc952 100755
+index c43317c..200837c 100755
 --- a/gtkdoc-depscan.in
 +++ b/gtkdoc-depscan.in
 @@ -1,4 +1,4 @@
@@ -45,7 +44,7 @@ index 9bfaf30..aadc952 100755
  from __future__ import print_function
  
 diff --git a/gtkdoc-fixxref.in b/gtkdoc-fixxref.in
-index 44f6bd1..26fbd93 100755
+index f9c4905..ed2ead1 100755
 --- a/gtkdoc-fixxref.in
 +++ b/gtkdoc-fixxref.in
 @@ -1,4 +1,4 @@
@@ -55,7 +54,7 @@ index 44f6bd1..26fbd93 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-mkdb.in b/gtkdoc-mkdb.in
-index 42d5731..3a56d56 100755
+index 641f3c4..35e95fb 100755
 --- a/gtkdoc-mkdb.in
 +++ b/gtkdoc-mkdb.in
 @@ -1,4 +1,4 @@
@@ -65,7 +64,7 @@ index 42d5731..3a56d56 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-mkhtml.in b/gtkdoc-mkhtml.in
-index 0d0a15d..914ff55 100755
+index b09f7a9..8d45966 100755
 --- a/gtkdoc-mkhtml.in
 +++ b/gtkdoc-mkhtml.in
 @@ -1,4 +1,4 @@
@@ -75,7 +74,7 @@ index 0d0a15d..914ff55 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-mkman.in b/gtkdoc-mkman.in
-index c5445cd..65db71a 100755
+index 8f7b018..9bac0b6 100755
 --- a/gtkdoc-mkman.in
 +++ b/gtkdoc-mkman.in
 @@ -1,4 +1,4 @@
@@ -85,7 +84,7 @@ index c5445cd..65db71a 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-mkpdf.in b/gtkdoc-mkpdf.in
-index e8c0c03..f807236 100755
+index 7dca4b0..808f92d 100755
 --- a/gtkdoc-mkpdf.in
 +++ b/gtkdoc-mkpdf.in
 @@ -1,4 +1,4 @@
@@ -95,7 +94,7 @@ index e8c0c03..f807236 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-rebase.in b/gtkdoc-rebase.in
-index 17a71c2..ec3fd28 100755
+index e8b0bf5..a960d8f 100755
 --- a/gtkdoc-rebase.in
 +++ b/gtkdoc-rebase.in
 @@ -1,4 +1,4 @@
@@ -105,7 +104,7 @@ index 17a71c2..ec3fd28 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-scan.in b/gtkdoc-scan.in
-index 954c811..f461504 100755
+index 7893ebc..b7eb83d 100755
 --- a/gtkdoc-scan.in
 +++ b/gtkdoc-scan.in
 @@ -1,4 +1,4 @@
@@ -115,7 +114,7 @@ index 954c811..f461504 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-scangobj.in b/gtkdoc-scangobj.in
-index 4cbe130..52c2c24 100755
+index 7660c70..c6ff072 100755
 --- a/gtkdoc-scangobj.in
 +++ b/gtkdoc-scangobj.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Don-t-use-docdir-from-environment.patch b/meta/recipes-gnome/gtk-doc/files/0001-Don-t-use-docdir-from-environment.patch
deleted file mode 100644
index f40124877c3..00000000000
--- a/meta/recipes-gnome/gtk-doc/files/0001-Don-t-use-docdir-from-environment.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 72dfeec0e49478b0bfb471c4155044391bad8e6c Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Fri, 8 Dec 2023 10:35:25 +0000
-Subject: [PATCH] Don't use docdir from environment
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gtk-doc/-/merge_requests/73]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- buildsystems/autotools/gtkdocize.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/buildsystems/autotools/gtkdocize.in b/buildsystems/autotools/gtkdocize.in
-index 83127bf..76dcbfd 100755
---- a/buildsystems/autotools/gtkdocize.in
-+++ b/buildsystems/autotools/gtkdocize.in
-@@ -39,7 +39,7 @@ set - $args
- 
- # assume working directory if srcdir is not set
- test "$srcdir" || srcdir=.
--test "$docdir" || docdir="$srcdir"
-+docdir="$srcdir"
- 
- # detect configure script
- no_configure_found=0
diff --git a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch b/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
index 21c2db7826f..55cae34b469 100644
--- a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
+++ b/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
@@ -1,23 +1,22 @@
-From 78bbf185934147a69ceb4b617d424e12e70997bf Mon Sep 17 00:00:00 2001
+From 9aa9230a305e964b2417daea2b51e43b2dee607c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 27 Jun 2017 21:00:58 +0100
-Subject: [PATCH 3/3] gtk-doc: Handle floating gtk-doc dependency
+Subject: [PATCH] gtk-doc: Handle floating gtk-doc dependency
 
 Allow the tests to be explicitly disabled to avoid floating dependnecy
 issues. This is not really an issue with RSS but is on previous releases.
 
 RP 2017/6/27
 Upstream-Status: Pending
-
 ---
  configure.ac | 10 ++++++++++
  1 file changed, 10 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 684e2d1..e5e3aab 100644
+index 0491090..4270c88 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -146,6 +146,11 @@ if test "x$GCC" = "xyes"; then
+@@ -82,6 +82,11 @@ if test "x$GCC" = "xyes"; then
  	fi
  fi
  
@@ -29,7 +28,7 @@ index 684e2d1..e5e3aab 100644
  dnl if glib is available we can enable the tests
  PKG_CHECK_MODULES(TEST_DEPS, [glib-2.0 >= 2.6.0 gobject-2.0 >= 2.6.0],
  	[	glib_prefix="`$PKG_CONFIG --variable=prefix glib-2.0`"
-@@ -156,6 +161,11 @@ PKG_CHECK_MODULES(TEST_DEPS, [glib-2.0 >= 2.6.0 gobject-2.0 >= 2.6.0],
+@@ -92,6 +97,11 @@ PKG_CHECK_MODULES(TEST_DEPS, [glib-2.0 >= 2.6.0 gobject-2.0 >= 2.6.0],
  		build_tests="no"
  	]
  )
@@ -41,6 +40,3 @@ index 684e2d1..e5e3aab 100644
  AM_CONDITIONAL(GTK_DOC_USE_LIBTOOL, test -n "$LIBTOOL" -a x$gtk_doc_use_libtool = xyes )
  dnl this enables the rule in test/Makefile.am
  AM_CONDITIONAL(BUILD_TESTS, test x$build_tests = xyes)
--- 
-2.14.1
-
diff --git a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
index d1695479dc0..90207d6c12a 100644
--- a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
+++ b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
@@ -1,4 +1,4 @@
-From 8bc4c1f169f89bc5531da5b7e892b8f20e0f9a18 Mon Sep 17 00:00:00 2001
+From fa5e31e02b9d3c6c5ec3cdc1f34dd6c179520fd0 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 21 Mar 2018 14:47:29 +0000
 Subject: [PATCH] gtk-doc: don't regenerate gtk-doc in do_install
@@ -20,16 +20,15 @@ files which don't already exist.
 
 Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=794571]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
  buildsystems/autotools/gtk-doc.make | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/buildsystems/autotools/gtk-doc.make b/buildsystems/autotools/gtk-doc.make
-index 7d9a27f..8cb336d 100644
+index fb2e7e2..4f6fe2b 100644
 --- a/buildsystems/autotools/gtk-doc.make
 +++ b/buildsystems/autotools/gtk-doc.make
-@@ -111,7 +111,7 @@ setup-build.stamp:
+@@ -112,7 +112,7 @@ setup-build.stamp:
  	      destdir=`dirname $(abs_builddir)/$$file`; \
  	      test -d "$$destdir" || mkdir -p "$$destdir"; \
  	      test -f $(abs_srcdir)/$$file && \
diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
index 1d260aa72b5..1b5c190f56b 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -1,11 +1,10 @@
-From ebb0f7313a0931f646e86badce2627eff2fa37a8 Mon Sep 17 00:00:00 2001
+From c11fba9bcb8d55568067e626bd959841c05081e5 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 5 Sep 2016 22:25:44 +0100
 Subject: [PATCH] Use native pkg-config when looking for gtk-doc.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
  buildsystems/autotools/gtk-doc.m4 | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb
similarity index 94%
rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb
index 4fd5a6e9256..693ae427e09 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb
@@ -21,12 +21,11 @@ PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_XSLTPROC=xsltproc"
 
-SRC_URI[archive.sha256sum] = "cc1b709a20eb030a278a1f9842a362e00402b7f834ae1df4c1998a723152bf43"
+SRC_URI[archive.sha256sum] = "b20b72b32a80bc18c7f975c9d4c16460c2276566a0b50f87d6852dff3aa7861c"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
            file://conditionaltests.patch \
            file://no-clobber.patch \
-           file://0001-Don-t-use-docdir-from-environment.patch \
            "
 SRC_URI:append:class-native = " file://pkg-config-native.patch"
 
-- 
2.39.2


