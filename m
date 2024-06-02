Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F250C25B74
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 21:26:12 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.68750.1717363568011108182
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 14:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R/VDT7LT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-421208c97a2so32364465e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 14:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717363566; x=1717968366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xih6u7qU5Va7gjzOqJUAlR9JN7na60YBpDdmggq45E0=;
        b=R/VDT7LTdSoi7q04DHeQn/Yvjmw+RhjY885lPbweMueUdFEdxS1LQgnDyf/ZJL72YB
         WiUMV9HeN5FmgujRrXibnBbhuTIttauHq9Cd1c/+EgLEOcQ73BVFNZZHtknodyC2UMVo
         LEikSL2GDHjSirFGUJvJZDHqp1CpgQnlTrs80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717363566; x=1717968366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xih6u7qU5Va7gjzOqJUAlR9JN7na60YBpDdmggq45E0=;
        b=vPC/a0AOluBcispgn458Ka/mOHOa3R0QJzq82qVFwB3OP9hqw0dKVnLHi9jN3YVNC+
         WfJQumZV1fVUV6RqIopqxbgBTrg7/SvVDEXAUWGg8scA3z7+Jj17P1yvS9qMpQm6tr6l
         HGiUJI0t+HIIvbJZwB4/3qvUpDrVMccf3W6EPKySncbL6XhlYTnLjXxf9O7nh9WmaeQ1
         D98NDd3fwA0YAbP90pJ5wMQHYk+vCL/g7g82vTQaxOqV6WuFWUn0ATTTHFmfWHUZ9D9B
         W9ZZWGxMa8eWNgyYyrWPD1bRFJSlMHjQonHkIkCGDWmfZax0bVZbkGf+Q6SXEH2Mzz4F
         jQig==
X-Gm-Message-State: AOJu0YwhEVxFkuIY/1P6w3UMg3zM+t9zAioYwH+DJewnApsnG1+GKcFX
	UN0DivWWaQURJzagGUN2Q7hkjuFIVBt12UspPRCsPbNt8rhlqbjYP6FiRCO/DSwIucCVbPbJa63
	y
X-Google-Smtp-Source: AGHT+IFtW7CE1BlELumJUVsakluf92s3HFER/7E1FG0epc7Q8WdhS4aL2WEUUw3qWLh9coH9qFeXNA==
X-Received: by 2002:a05:600c:1ca9:b0:420:29dd:84d5 with SMTP id 5b1f17b1804b1-4212e043d0fmr58511785e9.5.1717363565362;
        Sun, 02 Jun 2024 14:26:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a80:acf7:af1d:55dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42136e0d9fbsm52413975e9.28.2024.06.02.14.26.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 14:26:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libtool: 2.4.7 -> 2.5.0
Date: Sun,  2 Jun 2024 22:26:04 +0100
Message-Id: <20240602212604.3421561-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 21:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200222

Whilst this is an alpha release, it makes sense for us to
stay close to upstream.

We can drop a lot of merged patches which is great to see.

During testing, one bug showed up, particularly on mip64 due
to an issue with FILECMD being changed to use AC_CHECK_PROG
incorredly. A patch has been added for that and sent upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libtool-2.4.7.inc => libtool-2.5.0.inc}  | 16 ++---
 ...-cross_2.4.7.bb => libtool-cross_2.5.0.bb} |  0
 ...ative_2.4.7.bb => libtool-native_2.5.0.bb} |  0
 ...in.in-Parse-additional-clang-options.patch | 33 ----------
 ...e-the-with-sysroot-option-to-avoid-c.patch | 51 +++++++---------
 ...-libtool.m4-Cleanup-sysroot-trailing.patch | 37 ------------
 ...-Add-missing-sysroot-to-library-path.patch |  3 +-
 ...tool-Fix-support-for-NIOS2-processor.patch | 60 -------------------
 ...r-static-libs-for-internal-compiler-.patch | 17 +++---
 ...-sure-autoheader-run-before-autoconf.patch | 31 ----------
 ...-sure-autoheader-run-before-automake.patch | 33 ----------
 ...-prefix-map-compiler-options-correct.patch | 37 ------------
 ...eproducibility-stop-encoding-hostnam.patch | 29 ---------
 .../libtool/libtool/filefix.patch             | 28 +++++++++
 .../{libtool_2.4.7.bb => libtool_2.5.0.bb}    |  0
 ...ol_2.4.7.bb => nativesdk-libtool_2.5.0.bb} |  0
 16 files changed, 66 insertions(+), 309 deletions(-)
 rename meta/recipes-devtools/libtool/{libtool-2.4.7.inc => libtool-2.5.0.inc} (70%)
 rename meta/recipes-devtools/libtool/{libtool-cross_2.4.7.bb => libtool-cross_2.5.0.bb} (100%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.4.7.bb => libtool-native_2.5.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch
 delete mode 100644 meta/recipes-devtools/libtool/libtool/0003-libtool.m4-Cleanup-sysroot-trailing.patch
 delete mode 100644 meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-support-for-NIOS2-processor.patch
 delete mode 100644 meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
 delete mode 100644 meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch
 delete mode 100644 meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch
 delete mode 100644 meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
 create mode 100644 meta/recipes-devtools/libtool/libtool/filefix.patch
 rename meta/recipes-devtools/libtool/{libtool_2.4.7.bb => libtool_2.5.0.bb} (100%)
 rename meta/recipes-devtools/libtool/{nativesdk-libtool_2.4.7.bb => nativesdk-libtool_2.5.0.bb} (100%)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.7.inc b/meta/recipes-devtools/libtool/libtool-2.5.0.inc
similarity index 70%
rename from meta/recipes-devtools/libtool/libtool-2.4.7.inc
rename to meta/recipes-devtools/libtool/libtool-2.5.0.inc
index 16bb10d48f8..dd6215476e8 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.7.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.5.0.inc
@@ -8,26 +8,22 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://libltdl/COPYING.LIB;md5=4fbd65380cdd255951079008b364516c "
 
-SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
+SRC_URI = "https://alpha.gnu.org/gnu/libtool/libtool-${PV}.tar.gz \
            file://0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch \
            file://0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch \
            file://0003-ltmain.in-Add-missing-sysroot-to-library-path.patch \
            file://0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch \
            file://0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch \
            file://dont-depend-on-help2man.patch \
-           file://0003-libtool.m4-Cleanup-sysroot-trailing.patch \
            file://0006-libtool.m4-Handle-as-a-sysroot-correctly.patch \
-           file://nohardcodepaths.patch \
-           file://0007-libtool-Fix-support-for-NIOS2-processor.patch \
            file://0008-libtool-Check-for-static-libs-for-internal-compiler-.patch \
-           file://0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch \
-           file://0010-Makefile.am-make-sure-autoheader-run-before-automake.patch \
-           file://0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch \
-           file://0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch \
-           file://0001-ltmain.in-Parse-additional-clang-options.patch \
+           file://nohardcodepaths.patch \
+           file://filefix.patch \
           "
 
-SRC_URI[sha256sum] = "04e96c2404ea70c590c546eba4202a4e12722c640016c12b9b2f1ce3d481e9a8"
+
+
+SRC_URI[sha256sum] = "d438c317455d85554ce2f998be48866fd40cfcbf834d60b3026f4fc0ed583d23"
 
 do_compile:prepend () {
 	# Sometimes this file doesn't get rebuilt, force the issue
diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb b/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb
rename to meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb b/meta/recipes-devtools/libtool/libtool-native_2.5.0.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool-native_2.4.7.bb
rename to meta/recipes-devtools/libtool/libtool-native_2.5.0.bb
diff --git a/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch b/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch
deleted file mode 100644
index c52083327c4..00000000000
--- a/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-ltmain.in: Parse additional clang options
-
-clang uses -rtlib and --unwindlib to select proper compiler
-runtime in some cases. Therefore pass these options to linker when found in
-ldflags
-
-* build-aux/ltmain.in: Handle clang linker options
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=725646bf095bf5c07c49ae38dd060f95bd95ae3c]
-
----
- build-aux/ltmain.in | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
-index 037f009..ba5c816 100644
---- a/build-aux/ltmain.in
-+++ b/build-aux/ltmain.in
-@@ -5414,10 +5414,12 @@ func_mode_link ()
-       # -fsanitize=*         Clang/GCC memory and address sanitizer
-       # -fuse-ld=*           Linker select flags for GCC
-       # -f{file|debug|macro|profile}-prefix-map* needed for lto linking
-+      # -rtlib=*             select c runtime lib with clang
-+      # --unwindlib=*        select unwinder library with clang
-       # -Wa,*                Pass flags directly to the assembler
-       -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=*|-xtarget=*|+DA*|+DD*|-q*|-m*| \
-       -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
--      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*| \
-+      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*|-rtlib=*|--unwindlib=*| \
-       -specs=*|-fsanitize=*|-fuse-ld=*|-ffile-prefix-map=*|-fdebug-prefix-map=*|-fmacro-prefix-map=*|-fprofile-prefix-map=*|-Wa,*)
-         func_quote_arg pretty "$arg"
- 	arg=$func_quote_arg_result
diff --git a/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch b/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch
index 2126f829537..039f063bf67 100644
--- a/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch
+++ b/meta/recipes-devtools/libtool/libtool/0002-libtool.m4-Rename-the-with-sysroot-option-to-avoid-c.patch
@@ -13,18 +13,12 @@ http://lists.gnu.org/archive/html/libtool/2010-10/msg00048.html
 
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00014.html]
 
-Index: libtool-2.4.7/m4/libtool.m4
+Index: libtool-2.5.0/m4/libtool.m4
 ===================================================================
---- libtool-2.4.7.orig/m4/libtool.m4
-+++ libtool-2.4.7/m4/libtool.m4
-@@ -1244,28 +1244,28 @@ _LT_DECL([], [ECHO], [1], [An echo progr
- AC_DEFUN([_LT_WITH_SYSROOT],
- [m4_require([_LT_DECL_SED])dnl
- AC_MSG_CHECKING([for sysroot])
--AC_ARG_WITH([sysroot],
--[AS_HELP_STRING([--with-sysroot@<:@=DIR@:>@],
-+AC_ARG_WITH([libtool-sysroot],
-+[AS_HELP_STRING([--with-libtool-sysroot@<:@=DIR@:>@],
+--- libtool-2.5.0.orig/m4/libtool.m4
++++ libtool-2.5.0/m4/libtool.m4
+@@ -1247,12 +1247,12 @@ AC_ARG_WITH([sysroot],
+ [AS_HELP_STRING([--with-sysroot@<:@=DIR@:>@],
    [Search for dependent libraries within DIR (or the compiler's sysroot
     if not specified).])],
 -[], [with_sysroot=no])
@@ -37,7 +31,8 @@ Index: libtool-2.4.7/m4/libtool.m4
 +case $with_libtool_sysroot in #(
   yes)
     if test yes = "$GCC"; then
-      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
+      # Trim trailing / since we'll always append absolute paths and we want
+@@ -1261,12 +1261,12 @@ case $with_sysroot in #(
     fi
     ;; #(
   /*)
@@ -52,10 +47,10 @@ Index: libtool-2.4.7/m4/libtool.m4
     AC_MSG_ERROR([The sysroot must be an absolute path.])
     ;;
  esac
-Index: libtool-2.4.7/tests/sysroot.at
+Index: libtool-2.5.0/tests/sysroot.at
 ===================================================================
---- libtool-2.4.7.orig/tests/sysroot.at
-+++ libtool-2.4.7/tests/sysroot.at
+--- libtool-2.5.0.orig/tests/sysroot.at
++++ libtool-2.5.0/tests/sysroot.at
 @@ -65,7 +65,7 @@ while read file; do
  done])
  
@@ -83,11 +78,11 @@ Index: libtool-2.4.7/tests/sysroot.at
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  ]])
-diff --git a/tests/testsuite b/tests/testsuite
-index 24265e4..d388e3e 100755
---- a/tests/testsuite
-+++ b/tests/testsuite
-@@ -48997,7 +48997,7 @@ $at_traceon; }
+Index: libtool-2.5.0/tests/testsuite
+===================================================================
+--- libtool-2.5.0.orig/tests/testsuite
++++ libtool-2.5.0/tests/testsuite
+@@ -49054,7 +49054,7 @@ $at_traceon; }
  
  
  LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
@@ -96,7 +91,7 @@ index 24265e4..d388e3e 100755
  
  #???
  if test PATH = "$shlibpath_var"; then
-@@ -49211,7 +49211,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -49269,7 +49269,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([lib2.c])
  LT_INIT
@@ -105,7 +100,7 @@ index 24265e4..d388e3e 100755
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -49404,7 +49404,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -49463,7 +49463,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([prog.c])
  LT_INIT
@@ -114,7 +109,7 @@ index 24265e4..d388e3e 100755
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -49761,7 +49761,7 @@ $at_traceon; }
+@@ -49821,7 +49821,7 @@ $at_traceon; }
  
  
  LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
@@ -123,7 +118,7 @@ index 24265e4..d388e3e 100755
  
  #???
  if test PATH = "$shlibpath_var"; then
-@@ -49975,7 +49975,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -50036,7 +50036,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([lib2.c])
  LT_INIT
@@ -132,7 +127,7 @@ index 24265e4..d388e3e 100755
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -50168,7 +50168,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -50230,7 +50230,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([prog.c])
  LT_INIT
@@ -141,7 +136,7 @@ index 24265e4..d388e3e 100755
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -50525,7 +50525,7 @@ $at_traceon; }
+@@ -50588,7 +50588,7 @@ $at_traceon; }
  
  
  LDFLAGS="$LDFLAGS --sysroot=$sysroot -no-undefined"
@@ -150,7 +145,7 @@ index 24265e4..d388e3e 100755
  
  #???
  if test PATH = "$shlibpath_var"; then
-@@ -50739,7 +50739,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -50803,7 +50803,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([lib2.c])
  LT_INIT
@@ -159,7 +154,7 @@ index 24265e4..d388e3e 100755
  AC_SUBST([sysroot])
  AC_OUTPUT(Makefile)
  _ATEOF
-@@ -50932,7 +50932,7 @@ AM_INIT_AUTOMAKE([foreign])
+@@ -50997,7 +50997,7 @@ AM_INIT_AUTOMAKE([foreign])
  AC_PROG_CC
  AC_CONFIG_SRCDIR([prog.c])
  LT_INIT
diff --git a/meta/recipes-devtools/libtool/libtool/0003-libtool.m4-Cleanup-sysroot-trailing.patch b/meta/recipes-devtools/libtool/libtool/0003-libtool.m4-Cleanup-sysroot-trailing.patch
deleted file mode 100644
index 6d922382ef1..00000000000
--- a/meta/recipes-devtools/libtool/libtool/0003-libtool.m4-Cleanup-sysroot-trailing.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-libtool.m4: Cleanup sysroot trailing "/"
-
-If $CC has --sysroot=/, it is a valid configuration however libtool will
-then set lt_sysroot to "/".
-
-This means references like $lt_sysroot$libdir become //usr/lib instead
-of the more normally expected /usr/lib. This may or may not break something
-but certainly is confusing to the user and gives confusing output. Making
-"/" simply unset lt_sysroot is much cleaner.
-
-Whilst here, trim any trailing '/' from sysroot paths to drop the duplication
-and result in cleaner/consistent output.
-
-* m4/libtool.m4: Cleanup sysroot trailing '/' handling
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=365805327c7b9bbdb0e622b954b6b0d8eaeb3f99]
-Signed-off-by:  Richard Purdie <richard.purdie@linuxfoundation.org>
-
----
- m4/libtool.m4 | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/m4/libtool.m4 b/m4/libtool.m4
-index fa1ae91..2f31d24 100644
---- a/m4/libtool.m4
-+++ b/m4/libtool.m4
-@@ -1256,7 +1256,9 @@ lt_sysroot=
- case $with_libtool_sysroot in #(
-  yes)
-    if test yes = "$GCC"; then
--     lt_sysroot=`$CC --print-sysroot 2>/dev/null`
-+     # Trim trailing / since we'll always append absolute paths and we want
-+     # to avoid //, if only for less confusing output for the user.
-+     lt_sysroot=`$CC --print-sysroot 2>/dev/null | $SED 's:/\+$::'`
-    fi
-    ;; #(
-  /*)
diff --git a/meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch b/meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch
index 35f48ef906a..69e2c456af3 100644
--- a/meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch
+++ b/meta/recipes-devtools/libtool/libtool/0003-ltmain.in-Add-missing-sysroot-to-library-path.patch
@@ -8,7 +8,8 @@ i.e. when lt_sysroot is not set, it will still behave the same and add
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00017.html]
+Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00017.html]
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=3221f9f0fb98d5740ab5d0e8db6a731302520644]
 
 diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
 index f884824..25a91de 100644
diff --git a/meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-support-for-NIOS2-processor.patch b/meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-support-for-NIOS2-processor.patch
deleted file mode 100644
index 676ce7fd1ba..00000000000
--- a/meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-support-for-NIOS2-processor.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-libtool: Fix support for NIOS2 processor
-
-The name of the system contains the string "nios2". This string
-is caught by the some of the greedy checks for OS/2 in libtool,
-in particular the *os2* branches of switch statements match for
-the nios2 string, which results in incorrect behavior of libtool.
-
-Switch to use $host_os instead of $host and tweak the patterns to
-match to avoid this problem for nios2.
-
-* build-aux/ltmain.in: Fix NIOS2 support
----
- build-aux/ltmain.in | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Submitted: https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00021.html
-Reworked and submitted: https://lists.gnu.org/archive/html/libtool-patches/2024-01/msg00068.html
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=49e6cb0d4dfdca2a59b909dc4532fe22dbc57ad5]
-
-Index: libtool-2.4.7/build-aux/ltmain.in
-===================================================================
---- libtool-2.4.7.orig/build-aux/ltmain.in
-+++ libtool-2.4.7/build-aux/ltmain.in
-@@ -518,10 +518,10 @@ libtool_validate_options ()
-     # preserve --debug
-     test : = "$debug_cmd" || func_append preserve_args " --debug"
- 
--    case $host in
-+    case $host_os in
-       # Solaris2 added to fix http://debbugs.gnu.org/cgi/bugreport.cgi?bug=16452
-       # see also: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=59788
--      *cygwin* | *mingw* | *pw32* | *cegcc* | *solaris2* | *os2*)
-+      cygwin* | mingw* | pw32* | cegcc* | solaris2* | os2*)
-         # don't eliminate duplications in $postdeps and $predeps
-         opt_duplicate_compiler_generated_deps=:
-         ;;
-@@ -6273,8 +6273,8 @@ func_mode_link ()
- 	fi
- 	if test -n "$library_names" &&
- 	   { test no = "$use_static_libs" || test -z "$old_library"; }; then
--	  case $host in
--	  *cygwin* | *mingw* | *cegcc* | *os2*)
-+	  case $host_os in
-+	  cygwin* | mingw* | cegcc* | os2*)
- 	      # No point in relinking DLLs because paths are not encoded
- 	      func_append notinst_deplibs " $lib"
- 	      need_relink=no
-@@ -6343,8 +6343,8 @@ func_mode_link ()
- 	      soname=$dlname
- 	    elif test -n "$soname_spec"; then
- 	      # bleh windows
--	      case $host in
--	      *cygwin* | mingw* | *cegcc* | *os2*)
-+	      case $host_os in
-+	      cygwin* | mingw* | cegcc* | os2*)
- 	        func_arith $current - $age
- 		major=$func_arith_result
- 		versuffix=-$major
diff --git a/meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch b/meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch
index c151c3b4813..c103ebb7bfc 100644
--- a/meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch
+++ b/meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch
@@ -15,19 +15,16 @@ https://debbugs.gnu.org/cgi/bugreport.cgi?bug=27866
 
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00016.html]
 
-diff --git a/m4/libtool.m4 b/m4/libtool.m4
-index bd90775..3794130 100644
---- a/m4/libtool.m4
-+++ b/m4/libtool.m4
-@@ -7556,7 +7556,7 @@ if AC_TRY_EVAL(ac_compile); then
+Index: libtool-2.5.0/m4/libtool.m4
+===================================================================
+--- libtool-2.5.0.orig/m4/libtool.m4
++++ libtool-2.5.0/m4/libtool.m4
+@@ -7553,7 +7553,7 @@ if AC_TRY_EVAL(ac_compile); then
    for p in `eval "$output_verbose_link_cmd"`; do
      case $prev$p in
  
 -    -L* | -R* | -l*)
 +    -L* | -R* | -l* | */libclang_rt.*.a)
-        # Some compilers place space between "-{L,R}" and the path.
+        # Some compilers place space between "-{L,R,l}" and the path.
         # Remove the space.
-        if test x-L = "$p" ||
--- 
-2.25.1
-
+        if test x-L = x"$p" ||
diff --git a/meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch b/meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
deleted file mode 100644
index f51deecbef2..00000000000
--- a/meta/recipes-devtools/libtool/libtool/0009-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From: Mingli Yu <mingli.yu@windriver.com>
-Subject: [PATCH 09/12] Makefile.am: make sure autoheader run before autoconf
-
-autoheader will update ../libtool-2.4.6/libltdl/config-h.in which
-autoconf needs, so there comes a race sometimes as below:
- | configure.ac:45: error: required file 'config-h.in' not found
- | touch '../libtool-2.4.6/libltdl/config-h.in'
-
-So make sure autoheader run before autoconf to avoid this race.
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=e7dc729dd27b367905cd0ce52b5466d91537857a]
-
-diff --git a/Makefile.am b/Makefile.am
-index c29860e..9c34bfd 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -370,7 +370,7 @@ lt_configure_deps = $(lt_aclocal_m4) $(lt_aclocal_m4_deps)
- $(lt_aclocal_m4): $(lt_aclocal_m4_deps)
- 	$(AM_V_GEN)cd '$(srcdir)/$(ltdl_dir)' && $(ACLOCAL) -I ../m4
- 
--$(lt_configure): $(lt_configure_deps)
-+$(lt_configure): $(lt_configure_deps) $(lt_config_h_in)
- 	$(AM_V_GEN)cd '$(srcdir)/$(ltdl_dir)' && $(AUTOCONF)
- 
- $(lt_config_h_in): $(lt_configure_deps)
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch b/meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch
deleted file mode 100644
index e451de59e33..00000000000
--- a/meta/recipes-devtools/libtool/libtool/0010-Makefile.am-make-sure-autoheader-run-before-automake.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From: Mingli Yu <mingli.yu@windriver.com>
-Subject: [PATCH 10/12] Makefile.am: make sure autoheader run before automake
-
-When use automake to generate Makefile.in from Makefile.am, there
-comes below race:
- | configure.ac:45: error: required file 'config-h.in' not found
-
-It is because the file config-h.in in updating process by autoheader,
-so make automake run after autoheader to avoid the above race.
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=e01c0bfe5e041418d84460901a1a5b11b89d596f]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
-diff --git a/Makefile.am b/Makefile.am
-index 9c34bfd..231ef3f 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -333,7 +333,7 @@ EXTRA_DIST     += $(lt_aclocal_m4) \
- 		  $(lt_obsolete_m4) \
- 		  $(stamp_mk)
- 
--$(lt_Makefile_in): $(lt_Makefile_am) $(lt_aclocal_m4)
-+$(lt_Makefile_in): $(lt_Makefile_am) $(lt_aclocal_m4) $(lt_config_h_in)
- 	$(AM_V_GEN)cd '$(srcdir)/$(ltdl_dir)' && $(AUTOMAKE) Makefile
- 
- # Don't let unused scripts leak into the libltdl Makefile
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch b/meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch
deleted file mode 100644
index 4c6b6f05b49..00000000000
--- a/meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-ltmain.in: Handle prefix-map compiler options correctly
-
-If lto is enabled, we need the prefix-map variables to be passed to the linker
-to correctly link the objects using correctly mapped paths.
-
-Add these to the list of options libtool passes through.
-
-* build-aux/ltmain.in: Handle prefix-map compiler options
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00019.html
-https://lists.gnu.org/archive/html/libtool-patches/2024-01/msg00066.html
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=cdf4bf702f11d17e06569936e8a433a77f791228]
-
----
- build-aux/ltmain.in | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
-index 0a50f5b..037f009 100644
---- a/build-aux/ltmain.in
-+++ b/build-aux/ltmain.in
-@@ -5413,11 +5413,12 @@ func_mode_link ()
-       # -stdlib=*            select c++ std lib with clang
-       # -fsanitize=*         Clang/GCC memory and address sanitizer
-       # -fuse-ld=*           Linker select flags for GCC
-+      # -f{file|debug|macro|profile}-prefix-map* needed for lto linking
-       # -Wa,*                Pass flags directly to the assembler
-       -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=*|-xtarget=*|+DA*|+DD*|-q*|-m*| \
-       -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
-       -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*| \
--      -specs=*|-fsanitize=*|-fuse-ld=*|-Wa,*)
-+      -specs=*|-fsanitize=*|-fuse-ld=*|-ffile-prefix-map=*|-fdebug-prefix-map=*|-fmacro-prefix-map=*|-fprofile-prefix-map=*|-Wa,*)
-         func_quote_arg pretty "$arg"
- 	arg=$func_quote_arg_result
-         func_append compile_command " $arg"
diff --git a/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch b/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
deleted file mode 100644
index 8469b8727e1..00000000000
--- a/meta/recipes-devtools/libtool/libtool/0012-libtool.m4-For-reproducibility-stop-encoding-hostnam.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Subject: [PATCH 12/12] libtool.m4: For reproducibility stop encoding hostname in libtool script
-
-For reproducibilty, stop encoding the hostname into the libtool script, this isn't
-really adding much to debugging and most distros are carrying such a patch now as
-reproducibility is important.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-https://sources.debian.org/data/main/libt/libtool/2.4.6-10/debian/patches/
-        no_hostname.patch
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=bd826173c4c9c3fa8d77d92785754897cb4bfd89]
-
-diff --git a/m4/libtool.m4 b/m4/libtool.m4
-index 3794130..84a550c 100644
---- a/m4/libtool.m4
-+++ b/m4/libtool.m4
-@@ -730,7 +730,6 @@ _LT_CONFIG_SAVE_COMMANDS([
-     cat <<_LT_EOF >> "$cfgfile"
- #! $SHELL
- # Generated automatically by $as_me ($PACKAGE) $VERSION
--# Libtool was configured on host `(hostname || uname -n) 2>/dev/null | sed 1q`:
- # NOTE: Changes made to this file will be lost: look at ltmain.sh.
- 
- # Provide generalized library-building support services.
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/libtool/libtool/filefix.patch b/meta/recipes-devtools/libtool/libtool/filefix.patch
new file mode 100644
index 00000000000..a76b5be2cc4
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/filefix.patch
@@ -0,0 +1,28 @@
+[PATCH] libtool.m4: Fix AC_CHECK_PROG usage
+
+In commit:
+
+https://git.savannah.gnu.org/cgit/libtool.git/commit/m4/libtool.m4?id=64bef5ba65f6820cd5f88e5249324b4f5955ee25
+
+AC_CHECK_TOOL was changed to AC_CHECK_PROG however the arguments are
+different and this result is a value of ":". Change this to match the
+original intent.
+
+The lack of FILECMD was causing failures for mips64 builds as -m elf was 
+being passed to LD which isn't supported on our targets.
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2024-06/msg00000.html]
+
+Index: libtool-2.5.0/m4/libtool.m4
+===================================================================
+--- libtool-2.5.0.orig/m4/libtool.m4
++++ libtool-2.5.0/m4/libtool.m4
+@@ -8216,7 +8216,7 @@ AC_SUBST([DLLTOOL])
+ # ----------------
+ # Check for a file(cmd) program that can be used to detect file type and magic
+ m4_defun([_LT_DECL_FILECMD],
+-[AC_CHECK_PROG([FILECMD], [file], [:])
++[AC_CHECK_PROG([FILECMD], [file], [file], [:])
+ _LT_DECL([], [FILECMD], [1], [A file(cmd) program that detects file types])
+ ])# _LD_DECL_FILECMD
+ 
diff --git a/meta/recipes-devtools/libtool/libtool_2.4.7.bb b/meta/recipes-devtools/libtool/libtool_2.5.0.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool_2.4.7.bb
rename to meta/recipes-devtools/libtool/libtool_2.5.0.bb
diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.7.bb b/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/nativesdk-libtool_2.4.7.bb
rename to meta/recipes-devtools/libtool/nativesdk-libtool_2.5.0.bb

