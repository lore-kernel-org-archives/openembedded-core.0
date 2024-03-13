Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C7DC54E69
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:57 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.2050.1710351232275995979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JEPaSvVK;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-413e99afcc8so890465e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351231; x=1710956031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HoydjquagiTRMhAhZC5nmCxsbFNBthDTYVI0pqI9OgM=;
        b=JEPaSvVKVetxBX5weB73i5HFAn/8hcfOeufXJ1Me9+rLMtWiL20pocyMfnWZAmfft+
         dknj/QWnInGqGB0It77mPrFGP7Gvd7Pr9rQiGG8H7JVjC2ik3bvIwEpoME6bGUO5STz2
         bRbSTWYfOVPIZ8jDUWiCoUa9L5pemhyykt2GUDBpaYiqnfna2XLcdmvcTReL9Ya2HiqA
         QWaz9Yb9aUebE59yl2k+aS5RYtRQVc77kdpg9wZmZOiSyl0c1FUY784hEY6XumP0eBEh
         w35AXQ3YtifrgXV1R6vYyRKazBC/7DaQi5euCJwV14bDa5l9/fCc74p4YqwdGX9McgCU
         Ak6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351231; x=1710956031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HoydjquagiTRMhAhZC5nmCxsbFNBthDTYVI0pqI9OgM=;
        b=fGzEFh1y7DGlTAlIU427KleTLVNZzB9t5K5OQjEGfC0akFfgseHG6Y14d2pUErHc1r
         Mlcnz3l3kCoC+t5kJGy8Km3bKwBw0kymvZyW3WpyD1RxydlPcakwmYb6L22oD6nXi6M1
         W+F3+5gR3AnRpLfbBIXG5MN8m4uD/a16zuiJDC7lC01pr8f9OkB+OHIhkCuMSrejUdrT
         opop3HtVwOOpqoYst5rscDdXWnsoUDfXp9gvXqn8hUwr+Ov7k0NSGzsUybe46w0BPNd6
         CK0OsjuPzhADnj+IAIGxmejVPjwJmN27K9BZcDB4y7ejnEQO+HVxxTSRQFvYd6FNHPO/
         BwhQ==
X-Gm-Message-State: AOJu0Yw9EuXuUaDUhVElUQMSSlwsSBffs+K6QKmhIMFRsbHP5GJLyMpv
	mGnZRXH9jfdQmwd7vTSwzOK9t0/7NF1S/t09pph/HGPmhd4N5t0frxQDSUUi
X-Google-Smtp-Source: AGHT+IFTCOqrHullSaPsvO+e1jm6LzkUTGdiux3BBjApsJMoH9shQ0CAi4KdfoN5tQGbi9ECd6jiAA==
X-Received: by 2002:a05:600c:19cf:b0:413:260e:22af with SMTP id u15-20020a05600c19cf00b00413260e22afmr404404wmq.19.1710351230694;
        Wed, 13 Mar 2024 10:33:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/21] tcl: update 8.6.13 -> 8.6.14
Date: Wed, 13 Mar 2024 18:33:33 +0100
Message-Id: <20240313173336.3900178-18-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197070

Drop recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
(very obsolete)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../tcltk/tcl/alter-includedir.patch          | 11 +++---
 .../tcl/fix_issue_with_old_distro_glibc.patch | 39 -------------------
 .../tcl/fix_non_native_build_issue.patch      | 17 ++++----
 meta/recipes-devtools/tcltk/tcl/interp.patch  | 10 ++++-
 .../tcltk/tcl/tcl-add-soname.patch            | 11 +++---
 .../tcl-remove-hardcoded-install-path.patch   | 17 ++++----
 .../tcltk/{tcl_8.6.13.bb => tcl_8.6.14.bb}    |  5 +--
 7 files changed, 38 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
 rename meta/recipes-devtools/tcltk/{tcl_8.6.13.bb => tcl_8.6.14.bb} (96%)

diff --git a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch b/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
index 96d0ab2ad48..bfc718cfd3c 100644
--- a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
@@ -1,4 +1,4 @@
-From 27e5595c065ce3af687818555a882ab5e1dfbc2b Mon Sep 17 00:00:00 2001
+From 3130dca60636dc12d0d12df75b002fd123349e21 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 22 Nov 2022 18:48:27 +0800
 Subject: [PATCH] tcl: update the header location
@@ -19,7 +19,6 @@ to detect tcl doesn't find the header.
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
 ---
  unix/Makefile.in  | 2 +-
  unix/configure.in | 4 ++--
@@ -27,7 +26,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 0b8179f..4824b28 100644
+index a3b7d69..969ddb8 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
@@ -40,10 +39,10 @@ index 0b8179f..4824b28 100644
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
 diff --git a/unix/configure.in b/unix/configure.in
-index 0354a0b..2d0c00f 100644
+index 4974fb6..a72934f 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
-@@ -774,7 +774,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+@@ -776,7 +776,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
  test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
@@ -52,7 +51,7 @@ index 0354a0b..2d0c00f 100644
  HTML_DIR='$(DISTDIR)/html'
  
  # Note:  in the following variable, it's important to use the absolute
-@@ -895,7 +895,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
+@@ -897,7 +897,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
  TCL_STUB_LIB_PATH="${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
  
  # Install time header dir can be set via --includedir
diff --git a/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch b/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
deleted file mode 100644
index 2c31cec8e3e..00000000000
--- a/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Fixes tcl target recipe build on old distros which have glibc older than 2.14
-
-| + echo 'NOTE: make  DESTDIR=/srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image install'
-| NOTE: make  DESTDIR=/srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image install
-| + make  DESTDIR=/srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image install
-| Making directory /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image/usr/lib
-| Installing message catalogs
-| Making directory /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image/usr/share/man
-| tclsh: /lib64/libc.so.6: version `GLIBC_2.14' not found (required by /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/tcl8.5.11/unix/libtcl8.5.so)
-| Making directory /srv/home/nitin/builds/build-gcc47/tmp/work/x86_64-poky-linux/tcl-8.5.11-r5/image/usr/bin
-| make: *** [install-msgs] Error 1
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/04/26
-
-Index: unix/Makefile.in
-===================================================================
---- a/unix.orig/Makefile.in	2013-11-10 23:38:01.787425628 -0800
-+++ b/unix/Makefile.in	2013-11-10 23:37:59.807425578 -0800
-@@ -686,7 +686,7 @@
- # tcltest executable gets the build directory burned into its ld search path.
- # This keeps tcltest from picking up an already installed version of the Tcl
- # library.
--SHELL_ENV =	@LD_LIBRARY_PATH_VAR@=`pwd`:${@LD_LIBRARY_PATH_VAR@} \
-+SHELL_ENV =	@LD_LIBRARY_PATH_VAR@=${@LD_LIBRARY_PATH_VAR@} \
- 		TCLLIBPATH="@abs_builddir@/pkgs" \
- 		TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"
- 
-@@ -712,7 +712,7 @@
- 	$(SHELL_ENV) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
- 
- gdb-test: ${TCLTEST_EXE}
--	@echo "set env @LD_LIBRARY_PATH_VAR@=`pwd`:$${@LD_LIBRARY_PATH_VAR@}" > gdb.run
-+	@echo "set env @LD_LIBRARY_PATH_VAR@=$${@LD_LIBRARY_PATH_VAR@}" > gdb.run
- 	@echo "set env TCL_LIBRARY=${TCL_BUILDTIME_LIBRARY}" >> gdb.run
- 	@echo "set args $(TOP_DIR)/tests/all.tcl $(TESTFLAGS) -singleproc 1" >> gdb.run
- 	$(GDB) ${TCLTEST_EXE} --command=gdb.run
diff --git a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
index 6dbef7077f8..09c49daa2ce 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
@@ -1,19 +1,18 @@
-From 8a6c77cdd265fe7ce35929f58f1ade0c6bc4025b Mon Sep 17 00:00:00 2001
+From 371aa300369e9ea3234cba22d5c0babc7d40dfdf Mon Sep 17 00:00:00 2001
 From: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: Fri, 13 Aug 2010 12:24:00 -0700
 Subject: [PATCH] tcl: fix a build issue
 
 Upstream-Status: Inappropriate [upstream does not support installed tests]
-
 ---
  unix/Makefile.in | 20 ++++++++++----------
  1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index b110fe9..d7b35a8 100644
+index 9dd053d..a3b7d69 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
-@@ -814,23 +814,23 @@ tcltest-real:
+@@ -815,7 +815,7 @@ tcltest-real:
  test: test-tcl test-packages
  
  test-tcl: ${TCLTEST_EXE}
@@ -21,9 +20,11 @@ index b110fe9..d7b35a8 100644
 +	$(SHELL_ENV) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
  
  gdb-test: ${TCLTEST_EXE}
- 	@echo "set env @LD_LIBRARY_PATH_VAR@=`pwd`:$${@LD_LIBRARY_PATH_VAR@}" > gdb.run
- 	@echo "set env TCL_LIBRARY=${TCL_BUILDTIME_LIBRARY}" >> gdb.run
- 	@echo "set args $(TOP_DIR)/tests/all.tcl $(TESTFLAGS) -singleproc 1" >> gdb.run
+ 	@printf '%s ' set env @LD_LIBRARY_PATH_VAR@=\"`pwd`$${@LD_LIBRARY_PATH_VAR@:+:$${@LD_LIBRARY_PATH_VAR}}\" > gdb.run
+@@ -824,17 +824,17 @@ gdb-test: ${TCLTEST_EXE}
+ 	@printf '\n' >>gdb.run
+ 	@printf '%s ' set args $(call shquotequote,$(TOP_DIR))/tests/all.tcl\
+ 		$(call shquotequote,$(TESTFLAGS)) -singleproc 1 >> gdb.run
 -	$(GDB) ./${TCLTEST_EXE} --command=gdb.run
 +	$(GDB) ${TCLTEST_EXE} --command=gdb.run
  	rm gdb.run
@@ -41,7 +42,7 @@ index b110fe9..d7b35a8 100644
  
  # The following target generates the shared libraries in dltest/ that are used
  # for testing; they are included as part of the "tcltest" target (via the
-@@ -848,28 +848,28 @@ dltest.marker: ${STUB_LIB_FILE}
+@@ -852,28 +852,28 @@ dltest.marker: ${STUB_LIB_FILE}
  # This target can be used to run tclsh from the build directory
  # via `make shell SCRIPT=/tmp/foo.tcl`
  shell: ${TCL_EXE}
diff --git a/meta/recipes-devtools/tcltk/tcl/interp.patch b/meta/recipes-devtools/tcltk/tcl/interp.patch
index 95d6318f644..2e0dc94cff1 100644
--- a/meta/recipes-devtools/tcltk/tcl/interp.patch
+++ b/meta/recipes-devtools/tcltk/tcl/interp.patch
@@ -1,11 +1,19 @@
+From 426aa2ff62dda77fd011e8f630b9d4ea17984817 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 12 Jul 2021 14:50:13 +0100
+Subject: [PATCH] tcl: fix race in interp.test
+
 The interp-36.7 patch has race conditions and is missing cleanup.  This patch by
 a Tcl maintainer should improve matters.
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/interp.test | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/tests/interp.test b/tests/interp.test
-index d7424847f..fc90990f3 100644
+index d742484..fc90990 100644
 --- a/tests/interp.test
 +++ b/tests/interp.test
 @@ -3595,17 +3595,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch b/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
index 3123d289a14..a0195e263c1 100644
--- a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
@@ -1,20 +1,19 @@
-From d6155ec08b355d64f1a7db407254d159037bb72a Mon Sep 17 00:00:00 2001
+From b89fd73daf9b3eb2f889f65baba5f90d8a930c82 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 9 Dec 2009 23:59:44 +0000
 Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging function
 
 Upstream-Status: Pending
-
 ---
  unix/Makefile.in | 5 ++++-
  unix/tcl.m4      | 3 +++
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 398afd0..804532e 100644
+index 7619afc..9dd053d 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
-@@ -893,7 +893,10 @@ install-binaries: binaries
+@@ -904,7 +904,10 @@ install-binaries: binaries
  	done
  	@echo "Installing $(LIB_FILE) to $(DLL_INSTALL_DIR)/"
  	@@INSTALL_LIB@
@@ -27,10 +26,10 @@ index 398afd0..804532e 100644
  	@$(INSTALL_PROGRAM) ${TCL_EXE} "$(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
  	@echo "Installing tclConfig.sh to $(CONFIG_INSTALL_DIR)/"
 diff --git a/unix/tcl.m4 b/unix/tcl.m4
-index f3d08ec..797c93f 100644
+index 0307a06..37c4d67 100644
 --- a/unix/tcl.m4
 +++ b/unix/tcl.m4
-@@ -1382,6 +1382,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
+@@ -1378,6 +1378,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
  	    # get rid of the warnings.
  	    #CFLAGS_OPTIMIZE="${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES -D__NO_MATH_INLINES"
  
diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch b/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch
index 99c5faf02cb..93e7877256b 100644
--- a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch
+++ b/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch
@@ -1,4 +1,4 @@
-From 6efc98774681795712073c2b91e5e9d1763239b8 Mon Sep 17 00:00:00 2001
+From 050fc597fbfa4da2c31bd0df58c871892a490470 Mon Sep 17 00:00:00 2001
 From: "Song.Li" <Song.Li@windriver.com>
 Date: Wed, 1 Aug 2012 19:05:51 +0800
 Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit target
@@ -13,15 +13,14 @@ Signed-off-by: Song.Li <Song.Li@windriver.com>
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- configure    | 2 +-
- configure.in | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ unix/configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: unix/configure.in
-===================================================================
---- a/unix.orig/configure.in	2013-11-10 23:20:50.000000000 -0800
-+++ b/unix/configure.in	2013-11-10 23:39:41.199428131 -0800
-@@ -790,7 +790,7 @@
+diff --git a/unix/configure.in b/unix/configure.in
+index 4f62510..4974fb6 100644
+--- a/unix/configure.in
++++ b/unix/configure.in
+@@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb b/meta/recipes-devtools/tcltk/tcl_8.6.14.bb
similarity index 96%
rename from meta/recipes-devtools/tcltk/tcl_8.6.13.bb
rename to meta/recipes-devtools/tcltk/tcl_8.6.14.bb
index bb75353a5a8..964824e434a 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.14.bb
@@ -19,13 +19,12 @@ BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz \
                 file://tcl-add-soname.patch"
 SRC_URI = "${BASE_SRC_URI} \
            file://fix_non_native_build_issue.patch \
-           file://fix_issue_with_old_distro_glibc.patch \
            file://tcl-remove-hardcoded-install-path.patch \
            file://alter-includedir.patch \
            file://interp.patch \
            file://run-ptest \
-"
-SRC_URI[sha256sum] = "c61f0d6699e2bc7691f119b41963aaa8dc980f23532c4e937739832a5f4a6642"
+           "
+SRC_URI[sha256sum] = "ff604f43862a778827d7ecd1ad7686950ac2ef48d9cf69d3424cea9de08d9a72"
 
 SRC_URI:class-native = "${BASE_SRC_URI}"
 
-- 
2.39.2


