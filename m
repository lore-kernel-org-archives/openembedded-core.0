Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.11919.1595691430744991838
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2020 08:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nOJz9jiu;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id p1so6033581pls.4
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2020 08:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TIzk4yy0dx0+QL9iod4xnnIvQnE9ZTapa7x5gUy4YmM=;
        b=nOJz9jiuY1CBr6H6YlACHWxM8PqRQGP180Mq19obauNUXht5Eo43A+sDXqRSP7xJ7u
         HPDQxUWeUsNB1C/ChKDnt0W8v4206nmaB9C+okIR3iMzq7/Y5yIg8Ay6Y+1FBPD4rD6A
         aBgKNl74mJEiqQfztJPOz+iIBwG13apnbNNE/79gg0BuEp6HMLwBtixe2fWRh5S1pza1
         zmveKRSFxlQbAyfK5m7Y9RyJ42RZoPphA3EDfzek/Ta3QzUEVKakHUAOGVM9uy1nRvi0
         mQ5zxn+NN1rxVA1DGdW2JJi261zd6lE+5OZoqmlLVeBuKx25JUn7thU/0l6QNDXrI8+U
         VqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TIzk4yy0dx0+QL9iod4xnnIvQnE9ZTapa7x5gUy4YmM=;
        b=mSxuecLN5Vow1VtP22W5GwxMwpLTIWVJSqcZPUmLEmo7M5l2uvZlsApvtjRiIHnuTE
         mb+lklJVyV1fnTspZv+GZlIWBku+OWVpO5sXVCtiQumodsCi57LYXYRjIpTPVbBLYiAd
         b6fKyQGirobD0Wc/tf8brdVFFrpJQTQ61HZFhGENVjRh7F6vaDTZp/vw0jJ0H6K6R79U
         Q6+t6xVwvxKxFJ+k+R7RSOByWXjKJPsb99zOGYGH/eYyNshm+mf9DOkUj2lnrDqqjUgk
         7L4rvnEpah/OBIGjZEEIwNBRGBoD9N2f8f08bT1clvOZ9KWQ3vq8hd4sx+dTQlpnYSjx
         +V9w==
X-Gm-Message-State: AOAM531JX/7Ykrev5KrWqs8WZkixfkCzWOuNReW8Vk07n0szr2r2gMlo
	ydjtV+YM6KPoe6WUlTEXAZg2NgDgjrE=
X-Google-Smtp-Source: ABdhPJzzojHGUWPbibimUoSxBmSQwrHcwURRFL6/WiZdtXa8R4iupxDeCHkaE4Fb3bqS38SiTHNF2Q==
X-Received: by 2002:a17:90b:e92:: with SMTP id fv18mr10798356pjb.108.1595691428036;
        Sat, 25 Jul 2020 08:37:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9c5f])
        by smtp.gmail.com with ESMTPSA id w64sm9545538pgd.67.2020.07.25.08.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 08:37:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [RFT][PATCH] glibc: Upgrade to upcoming 2.32
Date: Sat, 25 Jul 2020 08:37:05 -0700
Message-Id: <20200725153705.127723-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 0001-localedef-Add-hardlink-resolver-to-build.patch as its applied
to localedef upstream

Drop CVE patches which are already part of 2.32 release

Drop unused attribute patch as its fixed differently in 2.32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 ...2.31.bb => cross-localedef-native_2.32.bb} |  18 +-
 meta/recipes-core/glibc/glibc-common.inc      |   2 +-
 ...bc-locale_2.31.bb => glibc-locale_2.32.bb} |   0
 ...bc-mtrace_2.31.bb => glibc-mtrace_2.32.bb} |   0
 ...-scripts_2.31.bb => glibc-scripts_2.32.bb} |   0
 ...tsuite_2.31.bb => glibc-testsuite_2.32.bb} |   0
 meta/recipes-core/glibc/glibc-version.inc     |   8 +-
 ...dd-hardlink-resolver-from-util-linux.patch |   7 +-
 ...ledef-Add-hardlink-resolver-to-build.patch |  52 -----
 ...-fix-ups-hardlink-to-make-it-compile.patch |   7 +-
 ...Look-for-host-system-ld.so.cache-as-.patch |  14 +-
 ...Fix-buffer-overrun-with-a-relocated-.patch |  12 +-
 ...Raise-the-size-of-arrays-containing-.patch |  28 +--
 ...k-glibc-Allow-64-bit-atomics-for-x86.patch |   7 +-
 ...Make-relocatable-install-for-locales.patch |  60 +++---
 ...5500-e6500-603e-fsqrt-implementation.patch |   7 +-
 ...ndefined-reference-to-__sqrt_finite.patch} |   7 +-
 ...are-now-inline-functions-and-call-o.patch} |   9 +-
 ...43-which-explains-what-the-patch-do.patch} |   8 +-
 ...-err-tab.pl-with-specific-dirs-in-S.patch} |   7 +-
 ...are-now-inline-functions-and-call-o.patch} |   9 +-
 ...gure.ac-handle-correctly-libc_cv_ro.patch} |   7 +-
 ...he-path-sets-wrong-config-variables.patch} |  11 +-
 .../glibc/0016-Add-unused-attribute.patch     |  31 ---
 ...one-re-written-tzselect-as-posix-sh.patch} |   7 +-
 ...ash-dependency-for-nscd-init-script.patch} |   7 +-
 ...s-building-and-testing-instructions.patch} |   7 +-
 ...libc-Help-bootstrap-cross-toolchain.patch} |   9 +-
 ...glibc-Resolve-__fpscr_values-on-SH4.patch} |   7 +-
 ...ort-cross-locale-generation-support.patch} |  17 +-
 ...efine-DUMMY_LOCALE_T-if-not-defined.patch} |   7 +-
 ...archive-uses-a-hard-coded-locale-pa.patch} |   8 +-
 ...e-_dl_build_local_scope-breadth-fir.patch} |   9 +-
 ...t-no-lines-in-bison-generated-files.patch} |   7 +-
 ...026-inject-file-assembly-directives.patch} |  77 +------
 ...ybe-uninitialized-errors-with-Os-BZ.patch} |   7 +-
 ...E_KNOWN_INTERPRETER_NAMES-to-known-.patch} |   8 +-
 ...-the-header-between-arm-and-aarch64.patch} |   7 +-
 ...ate-version-numbers-for-2.32-release.patch |  27 +++
 .../glibc/glibc/CVE-2020-6096.patch           | 112 ----------
 .../glibc/glibc/CVE-2020-6096_2.patch         | 194 ------------------
 .../glibc/{glibc_2.31.bb => glibc_2.32.bb}    |  46 ++---
 43 files changed, 270 insertions(+), 606 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.31.bb => cross-localedef-native_2.32.bb} (70%)
 rename meta/recipes-core/glibc/{glibc-locale_2.31.bb => glibc-locale_2.32.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.31.bb => glibc-mtrace_2.32.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.31.bb => glibc-scripts_2.32.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-testsuite_2.31.bb => glibc-testsuite_2.32.bb} (100%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-to-build.patch
 rename meta/recipes-core/glibc/glibc/{0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch => 0009-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch} (97%)
 rename meta/recipes-core/glibc/glibc/{0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch => 0010-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch} (98%)
 rename meta/recipes-core/glibc/glibc/{0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch => 0011-Quote-from-bug-1443-which-explains-what-the-patch-do.patch} (93%)
 rename meta/recipes-core/glibc/glibc/{0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch => 0012-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch} (87%)
 rename meta/recipes-core/glibc/glibc/{0014-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch => 0013-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch} (91%)
 rename meta/recipes-core/glibc/glibc/{0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch => 0014-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch} (88%)
 rename meta/recipes-core/glibc/glibc/{0017-yes-within-the-path-sets-wrong-config-variables.patch => 0015-yes-within-the-path-sets-wrong-config-variables.patch} (97%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0016-Add-unused-attribute.patch
 rename meta/recipes-core/glibc/glibc/{0018-timezone-re-written-tzselect-as-posix-sh.patch => 0016-timezone-re-written-tzselect-as-posix-sh.patch} (89%)
 rename meta/recipes-core/glibc/glibc/{0019-Remove-bash-dependency-for-nscd-init-script.patch => 0017-Remove-bash-dependency-for-nscd-init-script.patch} (92%)
 rename meta/recipes-core/glibc/glibc/{0020-eglibc-Cross-building-and-testing-instructions.patch => 0018-eglibc-Cross-building-and-testing-instructions.patch} (99%)
 rename meta/recipes-core/glibc/glibc/{0021-eglibc-Help-bootstrap-cross-toolchain.patch => 0019-eglibc-Help-bootstrap-cross-toolchain.patch} (95%)
 rename meta/recipes-core/glibc/glibc/{0022-eglibc-Resolve-__fpscr_values-on-SH4.patch => 0020-eglibc-Resolve-__fpscr_values-on-SH4.patch} (92%)
 rename meta/recipes-core/glibc/glibc/{0023-eglibc-Forward-port-cross-locale-generation-support.patch => 0021-eglibc-Forward-port-cross-locale-generation-support.patch} (98%)
 rename meta/recipes-core/glibc/glibc/{0024-Define-DUMMY_LOCALE_T-if-not-defined.patch => 0022-Define-DUMMY_LOCALE_T-if-not-defined.patch} (84%)
 rename meta/recipes-core/glibc/glibc/{0025-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch => 0023-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch} (95%)
 rename meta/recipes-core/glibc/glibc/{0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch => 0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch} (88%)
 rename meta/recipes-core/glibc/glibc/{0027-intl-Emit-no-lines-in-bison-generated-files.patch => 0025-intl-Emit-no-lines-in-bison-generated-files.patch} (86%)
 rename meta/recipes-core/glibc/glibc/{0028-inject-file-assembly-directives.patch => 0026-inject-file-assembly-directives.patch} (66%)
 rename meta/recipes-core/glibc/glibc/{0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch => 0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch} (92%)
 rename meta/recipes-core/glibc/glibc/{0009-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch => 0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch} (83%)
 rename meta/recipes-core/glibc/glibc/{0030-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch => 0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch} (93%)
 create mode 100644 meta/recipes-core/glibc/glibc/0030-Update-version-numbers-for-2.32-release.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch
 rename meta/recipes-core/glibc/{glibc_2.31.bb => glibc_2.32.bb} (69%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 054985c6a4..84dd6af6cb 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -20,7 +20,7 @@ GCCVERSION ?= "10.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.34%"
 GDBVERSION ?= "9.%"
-GLIBCVERSION ?= "2.31%"
+GLIBCVERSION ?= "2.32"
 LINUXLIBCVERSION ?= "5.4%"
 QEMUVERSION ?= "5.0%"
 GOVERSION ?= "1.14%"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.31.bb b/meta/recipes-core/glibc/cross-localedef-native_2.32.bb
similarity index 70%
rename from meta/recipes-core/glibc/cross-localedef-native_2.31.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.32.bb
index 24de55d929..5a0abbb70f 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.31.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.32.bb
@@ -22,19 +22,17 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
            \
-           file://0001-localedef-Add-hardlink-resolver-to-build.patch;patchdir=localedef \
-           \
            file://0001-localedef-Add-hardlink-resolver-from-util-linux.patch \
            file://0002-localedef-fix-ups-hardlink-to-make-it-compile.patch \
            \
-           file://0018-timezone-re-written-tzselect-as-posix-sh.patch \
-           file://0019-Remove-bash-dependency-for-nscd-init-script.patch \
-           file://0020-eglibc-Cross-building-and-testing-instructions.patch \
-           file://0021-eglibc-Help-bootstrap-cross-toolchain.patch \
-           file://0022-eglibc-Resolve-__fpscr_values-on-SH4.patch \
-           file://0023-eglibc-Forward-port-cross-locale-generation-support.patch \
-           file://0024-Define-DUMMY_LOCALE_T-if-not-defined.patch \
-           file://0025-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
+           file://0016-timezone-re-written-tzselect-as-posix-sh.patch \
+           file://0017-Remove-bash-dependency-for-nscd-init-script.patch \
+           file://0018-eglibc-Cross-building-and-testing-instructions.patch \
+           file://0019-eglibc-Help-bootstrap-cross-toolchain.patch \
+           file://0020-eglibc-Resolve-__fpscr_values-on-SH4.patch \
+           file://0021-eglibc-Forward-port-cross-locale-generation-support.patch \
+           file://0022-Define-DUMMY_LOCALE_T-if-not-defined.patch \
+           file://0023-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
 "
 # Makes for a rather long rev (22 characters), but...
 #
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index 8d412cc857..027c700998 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -22,4 +22,4 @@ ARM_INSTRUCTION_SET_armv6 = "arm"
 #
 COMPATIBLE_HOST_libc-musl_class-target = "null"
 
-PV = "2.31"
+PV = "2.32"
diff --git a/meta/recipes-core/glibc/glibc-locale_2.31.bb b/meta/recipes-core/glibc/glibc-locale_2.32.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.31.bb
rename to meta/recipes-core/glibc/glibc-locale_2.32.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.31.bb b/meta/recipes-core/glibc/glibc-mtrace_2.32.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.31.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.32.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.31.bb b/meta/recipes-core/glibc/glibc-scripts_2.32.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.31.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.32.bb
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.31.bb b/meta/recipes-core/glibc/glibc-testsuite_2.32.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-testsuite_2.31.bb
rename to meta/recipes-core/glibc/glibc-testsuite_2.32.bb
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index c2d68979eb..790b090f4a 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,7 +1,7 @@
-SRCBRANCH ?= "release/2.31/master"
-PV = "2.31+git${SRCPV}"
-SRCREV_glibc ?= "109474122400ca7d60782b131dc867a5c1f2fe55"
-SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
+SRCBRANCH ?= "master"
+PV = "2.32"
+SRCREV_glibc ?= "7ebd114211dcd290efd54e610bbde0765bd7764c"
+SRCREV_localedef ?= "b6ca7c146c6d2c93cddfa61e395cb8a196e3d46f"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 
diff --git a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
index d0786be8b8..e0ec1887dc 100644
--- a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
+++ b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
@@ -1,7 +1,7 @@
-From 3dcf144e998aed17b3fb957a255b1e923ba07d71 Mon Sep 17 00:00:00 2001
+From 5db90855621a81d02f1434d5602cefea8c45de1c Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 09:59:22 -0800
-Subject: [PATCH] localedef: Add hardlink resolver from util-linux
+Subject: [PATCH 01/29] localedef: Add hardlink resolver from util-linux
 
 The hard link resolver that is built into localedef cannot be run in
 parallel.  It will search sibling directories (which are be processed
@@ -1128,3 +1128,6 @@ index 0000000000..0129a85e2e
 +}
 +
 +#endif
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-to-build.patch b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-to-build.patch
deleted file mode 100644
index d6652981a8..0000000000
--- a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-to-build.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 56ae260ac24ade94e2e0e77c81751312372d253f Mon Sep 17 00:00:00 2001
-From: Jason Wessel <jason.wessel@windriver.com>
-Date: Sat, 7 Dec 2019 09:56:23 -0800
-Subject: [PATCH] localedef: Add hardlink resolver to build
-
-The sourcecode for this is imported from util-linux and is kept with
-glibc sources
-
-Upstream-Status: Pending
-Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.in | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 77fbded..a87e5b2 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -40,6 +40,8 @@ WARNFLAGS	= -Wall -Wno-format
- FULLCC		= $(CC) $(CPPFLAGS) $(CFLAGS) \
- 		  $(DEFINES) $(INCLUDES) $(WARNFLAGS)
- 
-+CROSS_LOCALEDEF_HARDLINK_OBJS = cross-localedef-hardlink.o
-+
- LOCALEDEF_OBJS	= charmap.o charmap-dir.o ld-address.o ld-collate.o \
- 		  ld-ctype.o ld-identification.o ld-measurement.o \
- 		  ld-messages.o ld-monetary.o ld-name.o ld-numeric.o \
-@@ -54,11 +56,14 @@ LOCALEDEF_OBJS	= charmap.o charmap-dir.o ld-address.o ld-collate.o \
- 		  asprintf.o getdelim.o localedef_extra.o \
- 		  obstack_printf.o vasprintf.o
- 
--all:		localedef$(EXEEXT)
-+all:		localedef$(EXEEXT) cross-localedef-hardlink$(EXEEXT)
- 
- localedef$(EXEEXT): $(LOCALEDEF_OBJS)
- 		$(CC) -o $@ $(LOCALEDEF_OBJS) $(LIBS)
- 
-+cross-localedef-hardlink$(EXEEXT): $(CROSS_LOCALEDEF_HARDLINK_OBJS)
-+		$(CC) -o $@ $(CROSS_LOCALEDEF_HARDLINK_OBJS) $(LIBS)
-+
- clean:
- 		rm -f locale$(EXEEXT) $(LOCALEDEF_OBJS)
- 
-@@ -77,6 +82,7 @@ clean:
- %.o: $(srcdir)/%.c
- 		$(FULLCC) -c -o $@ $<
- 
-+cross-localedef-hardlink.o: glibc/locale/programs/cross-localedef-hardlink.c
- charmap.o: glibc/locale/programs/charmap.c
- charmap-dir.o: glibc/locale/programs/charmap-dir.c
- ld-address.o: glibc/locale/programs/ld-address.c
diff --git a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
index 5222e37d1a..05b76803b4 100644
--- a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
+++ b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
@@ -1,7 +1,7 @@
-From b52dba15527380cc18635e3696e0ef87efee9a84 Mon Sep 17 00:00:00 2001
+From ab022ce3c1c01fd6c850f541a33efd0cacabe052 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 10:01:37 -0800
-Subject: [PATCH] localedef: fix-ups hardlink to make it compile
+Subject: [PATCH 02/29] localedef: fix-ups hardlink to make it compile
 
 Upstream-Status: Pending
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
@@ -236,3 +236,6 @@ index 63615896b0..726e6dd948 100644
  				}
  				continue;
  			}
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index 4cdc8354b6..743994f2db 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,7 +1,8 @@
-From 6987ad183770cb56680ccc4f6ea065a04f31ccb6 Mon Sep 17 00:00:00 2001
+From de4322ef6d4dc9fc3ee9b69af1c10edbc64a66a3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:48:24 +0000
-Subject: [PATCH] nativesdk-glibc: Look for host system ld.so.cache as well
+Subject: [PATCH 03/29] nativesdk-glibc: Look for host system ld.so.cache as
+ well
 
 Upstream-Status: Inappropriate [embedded specific]
 
@@ -30,10 +31,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index a6b80f9395..3226f2e531 100644
+index e39980fb19..565b039b23 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -2073,6 +2073,14 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2160,6 +2160,14 @@ _dl_map_object (struct link_map *loader, const char *name,
              }
          }
  
@@ -48,7 +49,7 @@ index a6b80f9395..3226f2e531 100644
  #ifdef USE_LDCONFIG
        if (fd == -1
  	  && (__glibc_likely ((mode & __RTLD_SECURE) == 0)
-@@ -2131,14 +2139,6 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2218,14 +2226,6 @@ _dl_map_object (struct link_map *loader, const char *name,
  	}
  #endif
  
@@ -63,3 +64,6 @@ index a6b80f9395..3226f2e531 100644
        /* Add another newline when we are tracing the library loading.  */
        if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_LIBS))
  	_dl_debug_printf ("\n");
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index 62e12897f5..a3b5b7750c 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,7 +1,8 @@
-From 7806340c2accc2c51e7e861b618c29fb5609a007 Mon Sep 17 00:00:00 2001
+From 258c44e4ecffd830cb89d0016d45b2bac765f559 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
-Subject: [PATCH] nativesdk-glibc: Fix buffer overrun with a relocated SDK
+Subject: [PATCH 04/29] nativesdk-glibc: Fix buffer overrun with a relocated
+ SDK
 
 When ld-linux-*.so.2 is relocated to a path that is longer than the
 original fixed location, the dynamic loader will crash in open_path
@@ -21,10 +22,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 3226f2e531..7cb8a86fab 100644
+index 565b039b23..e1b3486549 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -1773,7 +1773,19 @@ open_path (const char *name, size_t namelen, int mode,
+@@ -1860,7 +1860,19 @@ open_path (const char *name, size_t namelen, int mode,
         given on the command line when rtld is run directly.  */
      return -1;
  
@@ -44,3 +45,6 @@ index 3226f2e531..7cb8a86fab 100644
    do
      {
        struct r_search_path_elem *this_dir = *dirs;
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index 294c2b975e..2073576aac 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,7 +1,8 @@
-From 1b97befbe693eb93a77b6098f6ae1394a53462f4 Mon Sep 17 00:00:00 2001
+From 19cd858f5f04a6ac584fbd89a2fbc51791263b85 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
-Subject: [PATCH] nativesdk-glibc: Raise the size of arrays containing dl paths
+Subject: [PATCH 05/29] nativesdk-glibc: Raise the size of arrays containing dl
+ paths
 
 This patch puts the dynamic loader path in the binaries, SYSTEM_DIRS strings
 and lengths as well as ld.so.cache path in the dynamic loader to specific
@@ -25,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  7 files changed, 14 insertions(+), 10 deletions(-)
 
 diff --git a/elf/dl-cache.c b/elf/dl-cache.c
-index 3eedd9afcf..efdfe5cae7 100644
+index 93d185e788..e115b18756 100644
 --- a/elf/dl-cache.c
 +++ b/elf/dl-cache.c
 @@ -133,6 +133,10 @@ do									      \
@@ -40,10 +41,10 @@ index 3eedd9afcf..efdfe5cae7 100644
  _dl_cache_libcmp (const char *p1, const char *p2)
  {
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 7cb8a86fab..e32d4aa936 100644
+index e1b3486549..5226d0c4fa 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -110,8 +110,8 @@ static size_t max_capstrlen attribute_relro;
+@@ -111,8 +111,8 @@ static size_t max_capstrlen attribute_relro;
     gen-trusted-dirs.awk.  */
  #include "trusted-dirs.h"
  
@@ -66,10 +67,10 @@ index 331cc1df48..885b2d9476 100644
 +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
    = RUNTIME_LINKER;
 diff --git a/elf/ldconfig.c b/elf/ldconfig.c
-index 681ed78496..8833ed0a6b 100644
+index 0c090dca15..6bb6e0fe72 100644
 --- a/elf/ldconfig.c
 +++ b/elf/ldconfig.c
-@@ -168,6 +168,9 @@ static struct argp argp =
+@@ -171,6 +171,9 @@ static struct argp argp =
    options, parse_opt, NULL, doc, NULL, more_help, NULL
  };
  
@@ -80,18 +81,18 @@ index 681ed78496..8833ed0a6b 100644
     a platform.  */
  static int
 diff --git a/elf/rtld.c b/elf/rtld.c
-index 553cfbd1b7..39347c2c03 100644
+index 5b882163fa..db407b5d8b 100644
 --- a/elf/rtld.c
 +++ b/elf/rtld.c
-@@ -175,6 +175,7 @@ dso_name_valid_for_suid (const char *p)
+@@ -217,6 +217,7 @@ dso_name_valid_for_suid (const char *p)
      }
    return *p != '\0';
  }
 +extern const char LD_SO_CACHE[4096] __attribute__ ((section (".ldsocache")));
  
- /* LD_AUDIT variable contents.  Must be processed before the
-    audit_list below.  */
-@@ -1222,13 +1223,13 @@ of this helper program; chances are you did not intend to run this program.\n\
+ static void
+ audit_list_init (struct audit_list *list)
+@@ -1286,13 +1287,13 @@ of this helper program; chances are you did not intend to run this program.\n\
    --list                list all dependencies and how they are resolved\n\
    --verify              verify that given object really is a dynamically linked\n\
  			object we can handle\n\
@@ -135,3 +136,6 @@ index 6b310e9e15..3877311df4 100644
  #ifndef add_system_dir
  # define add_system_dir(dir) add_dir (dir)
  #endif
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index db8b6c0f1c..372dca727e 100644
--- a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -1,7 +1,7 @@
-From a752857cc342ee5136c9a593037b6ee6ff8af8ee Mon Sep 17 00:00:00 2001
+From bd0486cab67c3441210aed48caab67418610a765 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:35:35 -0800
-Subject: [PATCH] nativesdk-glibc: Allow 64 bit atomics for x86
+Subject: [PATCH 06/29] nativesdk-glibc: Allow 64 bit atomics for x86
 
 The fix consist of allowing 64bit atomic ops for x86.
 This should be safe for i586 and newer CPUs.
@@ -37,3 +37,6 @@ index bb49648374..aa08d3c0a7 100644
  # define SP_REG				"esp"
  # define SEG_REG			"gs"
  # define BR_CONSTRAINT			"r"
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index 27cd17cdcd..729ce1b42d 100644
--- a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -1,7 +1,7 @@
-From 3df91d1d8b9c7a01b3ef8133c4f9b9764227d583 Mon Sep 17 00:00:00 2001
+From 9a8bf11ea375a2fe5eddb30bc10943e64d3b96a4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:55:12 -0700
-Subject: [PATCH] nativesdk-glibc: Make relocatable install for locales
+Subject: [PATCH 07/29] nativesdk-glibc: Make relocatable install for locales
 
 The glibc locale path is hard-coded to the install prefix, but in SDKs we need
 to be able to relocate the binaries.  Expand the strings to 4K and put them in a
@@ -12,16 +12,17 @@ Upstream-Status: Inappropriate (OE-specific)
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- locale/findlocale.c  | 4 ++--
- locale/loadarchive.c | 2 +-
- locale/localeinfo.h  | 2 +-
- 3 files changed, 4 insertions(+), 4 deletions(-)
+ locale/findlocale.c      | 4 ++--
+ locale/loadarchive.c     | 2 +-
+ locale/localeinfo.h      | 2 +-
+ locale/programs/locale.c | 7 ++++---
+ 4 files changed, 8 insertions(+), 7 deletions(-)
 
-Index: git/locale/findlocale.c
-===================================================================
---- git.orig/locale/findlocale.c
-+++ git/locale/findlocale.c
-@@ -56,7 +56,7 @@ struct __locale_data *const _nl_C[] attr
+diff --git a/locale/findlocale.c b/locale/findlocale.c
+index 9cd3b71a6d..84272310e0 100644
+--- a/locale/findlocale.c
++++ b/locale/findlocale.c
+@@ -56,7 +56,7 @@ struct __locale_data *const _nl_C[] attribute_hidden =
     which are somehow addressed.  */
  struct loaded_l10nfile *_nl_locale_file_list[__LC_LAST];
  
@@ -30,7 +31,7 @@ Index: git/locale/findlocale.c
  
  /* Checks if the name is actually present, that is, not NULL and not
     empty.  */
-@@ -166,7 +166,7 @@ _nl_find_locale (const char *locale_path
+@@ -166,7 +166,7 @@ _nl_find_locale (const char *locale_path, size_t locale_path_len,
  
        /* Nothing in the archive.  Set the default path to search below.  */
        locale_path = _nl_default_locale_path;
@@ -39,10 +40,10 @@ Index: git/locale/findlocale.c
      }
    else
      /* We really have to load some data.  First see whether the name is
-Index: git/locale/loadarchive.c
-===================================================================
---- git.orig/locale/loadarchive.c
-+++ git/locale/loadarchive.c
+diff --git a/locale/loadarchive.c b/locale/loadarchive.c
+index ba0fe45648..9737fd4cda 100644
+--- a/locale/loadarchive.c
++++ b/locale/loadarchive.c
 @@ -42,7 +42,7 @@
  
  
@@ -52,11 +53,11 @@ Index: git/locale/loadarchive.c
  
  /* Size of initial mapping window, optimal if large enough to
     cover the header plus the initial locale.  */
-Index: git/locale/localeinfo.h
-===================================================================
---- git.orig/locale/localeinfo.h
-+++ git/locale/localeinfo.h
-@@ -331,7 +331,7 @@ _nl_lookup_word (locale_t l, int categor
+diff --git a/locale/localeinfo.h b/locale/localeinfo.h
+index 1bfe22aa7f..fdc283c69a 100644
+--- a/locale/localeinfo.h
++++ b/locale/localeinfo.h
+@@ -331,7 +331,7 @@ _nl_lookup_word (locale_t l, int category, int item)
  }
  
  /* Default search path if no LOCPATH environment variable.  */
@@ -65,11 +66,11 @@ Index: git/locale/localeinfo.h
  
  /* Load the locale data for CATEGORY from the file specified by *NAME.
     If *NAME is "", use environment variables as specified by POSIX, and
-Index: git/locale/programs/locale.c
-===================================================================
---- git.orig/locale/programs/locale.c
-+++ git/locale/programs/locale.c
-@@ -632,6 +632,7 @@ nameentcmp (const void *a, const void *b
+diff --git a/locale/programs/locale.c b/locale/programs/locale.c
+index e2e309c2a1..61a92cdcd1 100644
+--- a/locale/programs/locale.c
++++ b/locale/programs/locale.c
+@@ -632,6 +632,7 @@ nameentcmp (const void *a, const void *b)
  		  ((const struct nameent *) b)->name);
  }
  
@@ -77,7 +78,7 @@ Index: git/locale/programs/locale.c
  
  static int
  write_archive_locales (void **all_datap, char *linebuf)
-@@ -645,7 +646,7 @@ write_archive_locales (void **all_datap,
+@@ -645,7 +646,7 @@ write_archive_locales (void **all_datap, char *linebuf)
    int fd, ret = 0;
    uint32_t cnt;
  
@@ -86,7 +87,7 @@ Index: git/locale/programs/locale.c
    if (fd < 0)
      return 0;
  
-@@ -700,8 +701,8 @@ write_archive_locales (void **all_datap,
+@@ -700,8 +701,8 @@ write_archive_locales (void **all_datap, char *linebuf)
  	  if (cnt)
  	    putchar_unlocked ('\n');
  
@@ -97,3 +98,6 @@ Index: git/locale/programs/locale.c
  
  	  locrec = (struct locrecent *) (addr + names[cnt].locrec_offset);
  
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch b/meta/recipes-core/glibc/glibc/0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
index 3dac325380..5e3b3e2d7b 100644
--- a/meta/recipes-core/glibc/glibc/0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
+++ b/meta/recipes-core/glibc/glibc/0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
@@ -1,7 +1,7 @@
-From 61b6c9737897c5828ef4b40699ee0a74c570034a Mon Sep 17 00:00:00 2001
+From 59b0a78ae706a540dbd8905bc97c875220d6aeb2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:01:50 +0000
-Subject: [PATCH] fsl e500/e5500/e6500/603e fsqrt implementation
+Subject: [PATCH 08/29] fsl e500/e5500/e6500/603e fsqrt implementation
 
 Upstream-Status: Pending
 Signed-off-by: Edmar Wienskoski <edmar@freescale.com>
@@ -1579,3 +1579,6 @@ index 0000000000..04ff8cc181
 +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc64/e6500/fpu
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch b/meta/recipes-core/glibc/glibc/0009-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
similarity index 97%
rename from meta/recipes-core/glibc/glibc/0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
rename to meta/recipes-core/glibc/glibc/0009-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
index 01446abc43..a94ed207f5 100644
--- a/meta/recipes-core/glibc/glibc/0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
+++ b/meta/recipes-core/glibc/glibc/0009-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
@@ -1,7 +1,7 @@
-From 4483a83074a340a921e319b88d72166f18e0df0b Mon Sep 17 00:00:00 2001
+From 78f67f016ca9e3f7a37af86cf6e400cf17cf1d05 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:15:07 +0000
-Subject: [PATCH] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
+Subject: [PATCH 09/29] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
 
 on ppc fixes the errors like below
 | ./.libs/libpulsecore-1.1.so: undefined reference to `__sqrt_finite'
@@ -203,3 +203,6 @@ index 26fa067abf..9d175122a8 100644
    return f_washf (b);
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0010-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
similarity index 98%
rename from meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
rename to meta/recipes-core/glibc/glibc/0010-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index 451f372650..743bea1433 100644
--- a/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0010-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,8 +1,8 @@
-From 347b2e31d010b04c42e78157a028aa1d58fe0f5e Mon Sep 17 00:00:00 2001
+From 670b5d70ab62b42ab02a8e18b8fcee2879b8c4a0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:16:38 +0000
-Subject: [PATCH] __ieee754_sqrt{,f} are now inline functions and call out
- __slow versions
+Subject: [PATCH 10/29] __ieee754_sqrt{,f} are now inline functions and call
+ out __slow versions
 
 Upstream-Status: Pending
 
@@ -382,3 +382,6 @@ index 9d175122a8..10de1f0cc3 100644
 +}
 +
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch b/meta/recipes-core/glibc/glibc/0011-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
similarity index 93%
rename from meta/recipes-core/glibc/glibc/0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
rename to meta/recipes-core/glibc/glibc/0011-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
index a0b46c0479..a9280b7c34 100644
--- a/meta/recipes-core/glibc/glibc/0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
+++ b/meta/recipes-core/glibc/glibc/0011-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
@@ -1,7 +1,8 @@
-From 8ca8e5cd78cbd37a713e1181f8f6641b57352aa8 Mon Sep 17 00:00:00 2001
+From de7a7c04a92dbc5d35cb37e47c471e12784cc95e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:20:09 +0000
-Subject: [PATCH] Quote from bug 1443 which explains what the patch does :
+Subject: [PATCH 11/29] Quote from bug 1443 which explains what the patch does
+ :
 
   We build some random program and link it with -lust.  When we run it,
   it dies with a SIGSEGV before reaching main().
@@ -56,3 +57,6 @@ index 90856779b1..a29bb86c56 100644
  	  break;
  
  	case R_ARM_TLS_TPOFF32:
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/glibc/glibc/0012-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
similarity index 87%
rename from meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
rename to meta/recipes-core/glibc/glibc/0012-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
index 736de8cf04..ab07455ade 100644
--- a/meta/recipes-core/glibc/glibc/0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
+++ b/meta/recipes-core/glibc/glibc/0012-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
@@ -1,7 +1,7 @@
-From 21509735678990760d5ebf9d0c65efa4b52b838d Mon Sep 17 00:00:00 2001
+From c8807899367e64d803585e7dd4b56a1085d5893b Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Wed, 19 Dec 2012 04:39:57 -0600
-Subject: [PATCH] eglibc: run libm-err-tab.pl with specific dirs in ${S}
+Subject: [PATCH 12/29] eglibc: run libm-err-tab.pl with specific dirs in ${S}
 
 libm-err-tab.pl will parse all the files named "libm-test-ulps"
 in the given dir recursively. To avoid parsing the one in
@@ -31,3 +31,6 @@ index c61e11dcd7..5d859e6f84 100644
  	$(move-if-change) $(objpfx)libm-err-tmp $(objpfx)libm-err.texi
  	touch $@
  
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0014-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0013-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
similarity index 91%
rename from meta/recipes-core/glibc/glibc/0014-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
rename to meta/recipes-core/glibc/glibc/0013-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index e73b640c16..d875825ff9 100644
--- a/meta/recipes-core/glibc/glibc/0014-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0013-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,8 +1,8 @@
-From e33deb119734ef443ef44c42a00a569f90e1e149 Mon Sep 17 00:00:00 2001
+From 86fea3409b89f9d8884053a519282f2f30d7ea87 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:24:46 +0000
-Subject: [PATCH] __ieee754_sqrt{,f} are now inline functions and call out
- __slow versions
+Subject: [PATCH 13/29] __ieee754_sqrt{,f} are now inline functions and call
+ out __slow versions
 
 Upstream-Status: Pending
 
@@ -56,3 +56,6 @@ index 812653558f..10de1f0cc3 100644
       float b;
  #endif
  {
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch b/meta/recipes-core/glibc/glibc/0014-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
similarity index 88%
rename from meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
rename to meta/recipes-core/glibc/glibc/0014-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
index 0cdd0567df..954534bae2 100644
--- a/meta/recipes-core/glibc/glibc/0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
+++ b/meta/recipes-core/glibc/glibc/0014-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
@@ -1,7 +1,7 @@
-From c50cae36e90c41849301a9a668adf31e81e43a07 Mon Sep 17 00:00:00 2001
+From a3c4f67fb3cb02855073a9cdbcf2881fb53144f0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
-Subject: [PATCH] sysdeps/gnu/configure.ac: handle correctly
+Subject: [PATCH 14/29] sysdeps/gnu/configure.ac: handle correctly
  $libc_cv_rootsbindir
 
 Upstream-Status:Pending
@@ -37,3 +37,6 @@ index 634fe4de2a..3db1697f4f 100644
 +  test -n "$libc_cv_rootsbindir" || libc_cv_rootsbindir=/sbin
    ;;
  esac
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0017-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
similarity index 97%
rename from meta/recipes-core/glibc/glibc/0017-yes-within-the-path-sets-wrong-config-variables.patch
rename to meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
index 49089af41e..04a9bf01c4 100644
--- a/meta/recipes-core/glibc/glibc/0017-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,7 +1,7 @@
-From c421cd7e885497a99179b982dc4a27e8405f8857 Mon Sep 17 00:00:00 2001
+From 17a602b89cbe53a5a92d0153ccb013a737f028cb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
-Subject: [PATCH] 'yes' within the path sets wrong config variables
+Subject: [PATCH 15/29] 'yes' within the path sets wrong config variables
 
 It seems that the 'AC_EGREP_CPP(yes...' example is quite popular
 but being such a short word to grep it is likely to produce
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  12 files changed, 28 insertions(+), 28 deletions(-)
 
 diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
-index 5bd355a691..3bc5537bc0 100644
+index ac3cf6fd36..32add94df9 100644
 --- a/sysdeps/aarch64/configure
 +++ b/sysdeps/aarch64/configure
 @@ -148,12 +148,12 @@ else
@@ -48,7 +48,7 @@ index 5bd355a691..3bc5537bc0 100644
  else
    libc_cv_aarch64_be=no
 diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
-index 7851dd4dac..6e9238171f 100644
+index 8b042d6d05..3cdd262951 100644
 --- a/sysdeps/aarch64/configure.ac
 +++ b/sysdeps/aarch64/configure.ac
 @@ -10,8 +10,8 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
@@ -258,3 +258,6 @@ index f9cba6e15d..b21f72f1e4 100644
                         #endif
      ], libc_cv_ppc64_def_call_elf=yes, libc_cv_ppc64_def_call_elf=no)])
    if test $libc_cv_ppc64_def_call_elf = no; then
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0016-Add-unused-attribute.patch b/meta/recipes-core/glibc/glibc/0016-Add-unused-attribute.patch
deleted file mode 100644
index 574e7c3503..0000000000
--- a/meta/recipes-core/glibc/glibc/0016-Add-unused-attribute.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From c323125744020a29f79e50dc4d024b55c482eafc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 18 Mar 2015 00:28:41 +0000
-Subject: [PATCH] Add unused attribute
-
-Helps in avoiding gcc warning when header is is included in
-a source file which does not use both functions
-
-        * iconv/gconv_charset.h (strip):
-        Add unused attribute.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- iconv/gconv_charset.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/iconv/gconv_charset.h b/iconv/gconv_charset.h
-index 348acc089b..fa92465d89 100644
---- a/iconv/gconv_charset.h
-+++ b/iconv/gconv_charset.h
-@@ -21,7 +21,7 @@
- #include <locale.h>
- 
- 
--static void
-+static void __attribute__ ((unused))
- strip (char *wp, const char *s)
- {
-   int slash_count = 0;
diff --git a/meta/recipes-core/glibc/glibc/0018-timezone-re-written-tzselect-as-posix-sh.patch b/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
similarity index 89%
rename from meta/recipes-core/glibc/glibc/0018-timezone-re-written-tzselect-as-posix-sh.patch
rename to meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
index 20b0ee98ea..cd072018e5 100644
--- a/meta/recipes-core/glibc/glibc/0018-timezone-re-written-tzselect-as-posix-sh.patch
+++ b/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
@@ -1,7 +1,7 @@
-From 2023d88c355b8af6458c8e39ce38b75c1ca4ea2a Mon Sep 17 00:00:00 2001
+From 4762386b599f5c3287310a69ad3555e0129e0c51 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:33:03 +0000
-Subject: [PATCH] timezone: re-written tzselect as posix sh
+Subject: [PATCH 16/29] timezone: re-written tzselect as posix sh
 
 To avoid the bash dependency.
 
@@ -40,3 +40,6 @@ index 18fce27e24..70745f9d36 100755
  
  # Output one argument as-is to standard output.
  # Safer than 'echo', which can mishandle '\' or leading '-'.
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0019-Remove-bash-dependency-for-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
similarity index 92%
rename from meta/recipes-core/glibc/glibc/0019-Remove-bash-dependency-for-nscd-init-script.patch
rename to meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
index 1c15a51308..57907fe660 100644
--- a/meta/recipes-core/glibc/glibc/0019-Remove-bash-dependency-for-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
@@ -1,7 +1,7 @@
-From 06da20d9f89907e5f2777537244e6589ca3c9703 Mon Sep 17 00:00:00 2001
+From dac46c07736a799fc82be03aa546b2d24c19ad78 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
-Subject: [PATCH] Remove bash dependency for nscd init script
+Subject: [PATCH 17/29] Remove bash dependency for nscd init script
 
 The nscd init script uses #! /bin/bash but only really uses one bashism
 (translated strings), so remove them and switch the shell to #!/bin/sh.
@@ -70,3 +70,6 @@ index a882da7d8b..b02986ec15 100644
  	RETVAL=1
  	;;
  esac
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0020-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
similarity index 99%
rename from meta/recipes-core/glibc/glibc/0020-eglibc-Cross-building-and-testing-instructions.patch
rename to meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
index eda5565371..58d41ffe04 100644
--- a/meta/recipes-core/glibc/glibc/0020-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,7 +1,7 @@
-From 5641452a24f76c5dafa3749a542fcac93f77390f Mon Sep 17 00:00:00 2001
+From 0bd1dedf77194151397c53b12e0355c2edb8bccc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
-Subject: [PATCH] eglibc: Cross building and testing instructions
+Subject: [PATCH 18/29] eglibc: Cross building and testing instructions
 
 Ported from eglibc
 Upstream-Status: Pending
@@ -614,3 +614,6 @@ index 0000000000..b67b468466
 +- Some tests require access to libstdc++.so.6 and libgcc_s.so.1; we
 +  simply place copies of these libraries in the top GLIBC build
 +  directory.
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0021-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
similarity index 95%
rename from meta/recipes-core/glibc/glibc/0021-eglibc-Help-bootstrap-cross-toolchain.patch
rename to meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
index 6374ea4086..f633079f34 100644
--- a/meta/recipes-core/glibc/glibc/0021-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,7 +1,7 @@
-From 6a32d5bf40deee5d12d24c06f3ea9b5479c16802 Mon Sep 17 00:00:00 2001
+From 5591b7653411da26fa2939352e50ea4121b327e6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
-Subject: [PATCH] eglibc: Help bootstrap cross toolchain
+Subject: [PATCH 19/29] eglibc: Help bootstrap cross toolchain
 
 Taken from EGLIBC, r1484 + r1525
 
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 include/stubs-bootstrap.h
 
 diff --git a/Makefile b/Makefile
-index 8f0a93aceb..8eba23a868 100644
+index 6dcfe40c25..bc37c32e5a 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -79,9 +79,18 @@ subdir-dirs = include
@@ -95,3 +95,6 @@ index 0000000000..1d2b669aff
 +   difficult headers.  The <gnu/stubs.h> header depends, via the
 +   EGLIBC subdir 'stubs' make targets, on every .o file in EGLIBC, but
 +   an empty stubs.h like this will do fine for GCC.  */
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0022-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
similarity index 92%
rename from meta/recipes-core/glibc/glibc/0022-eglibc-Resolve-__fpscr_values-on-SH4.patch
rename to meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
index 2a503c811e..bb21c54721 100644
--- a/meta/recipes-core/glibc/glibc/0022-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,7 +1,7 @@
-From 25c21857a3fc0eb26831616ba88a696dd31ecba1 Mon Sep 17 00:00:00 2001
+From d3451c186f96c6b2434a4ac9304c01730bf22061 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
-Subject: [PATCH] eglibc: Resolve __fpscr_values on SH4
+Subject: [PATCH 20/29] eglibc: Resolve __fpscr_values on SH4
 
 2010-09-29  Nobuhiro Iwamatsu  <iwamatsu@nigauri.org>
             Andrew Stubbs  <ams@codesourcery.com>
@@ -51,3 +51,6 @@ index 85ff3f900e..7743b8d57a 100644
 +       .long 0x80000
 +weak_alias (___fpscr_values, __fpscr_values)
 +
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0023-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0021-eglibc-Forward-port-cross-locale-generation-support.patch
similarity index 98%
rename from meta/recipes-core/glibc/glibc/0023-eglibc-Forward-port-cross-locale-generation-support.patch
rename to meta/recipes-core/glibc/glibc/0021-eglibc-Forward-port-cross-locale-generation-support.patch
index 1a90f22db6..7fe5db0c2a 100644
--- a/meta/recipes-core/glibc/glibc/0023-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0021-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,7 +1,7 @@
-From 30008327aadf0c775e644bb387d7c25952ed05b5 Mon Sep 17 00:00:00 2001
+From e4b8abdc2d884d721fd89d67b689546f2f780924 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
-Subject: [PATCH] eglibc: Forward port cross locale generation support
+Subject: [PATCH 21/29] eglibc: Forward port cross locale generation support
 
 Upstream-Status: Pending
 
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 locale/catnames.c
 
 diff --git a/locale/Makefile b/locale/Makefile
-index c9694e236e..ba7105fad6 100644
+index 49c0c78c7d..ebfcf4f4da 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
 @@ -26,7 +26,8 @@ headers		= langinfo.h locale.h bits/locale.h \
@@ -34,8 +34,8 @@ index c9694e236e..ba7105fad6 100644
 +		  newlocale duplocale freelocale uselocale \
 +		  catnames
  tests		= tst-C-locale tst-locname tst-duplocale
+ tests-container	= tst-localedef-path-norm
  categories	= ctype messages monetary numeric time paper name \
- 		  address telephone measurement identification collate
 diff --git a/locale/catnames.c b/locale/catnames.c
 new file mode 100644
 index 0000000000..538f3f5edb
@@ -361,7 +361,7 @@ index 7ebd933801..5753750756 100644
    size_t bufmax = 56;
  
 diff --git a/locale/programs/localedef.c b/locale/programs/localedef.c
-index dbbb0145c0..097a8b6193 100644
+index b048bd05b9..fed15c42ec 100644
 --- a/locale/programs/localedef.c
 +++ b/locale/programs/localedef.c
 @@ -109,6 +109,7 @@ void (*argp_program_version_hook) (FILE *, struct argp_state *) = print_version;
@@ -381,7 +381,7 @@ index dbbb0145c0..097a8b6193 100644
    { NULL, 0, NULL, 0, NULL }
  };
  
-@@ -242,12 +245,14 @@ main (int argc, char *argv[])
+@@ -243,12 +246,14 @@ main (int argc, char *argv[])
       ctype locale.  (P1003.2 4.35.5.2)  */
    setlocale (LC_CTYPE, "POSIX");
  
@@ -396,7 +396,7 @@ index dbbb0145c0..097a8b6193 100644
  
    /* Process charmap file.  */
    charmap = charmap_read (charmap_file, verbose, 1, be_quiet, 1);
-@@ -399,6 +404,9 @@ parse_opt (int key, char *arg, struct argp_state *state)
+@@ -400,6 +405,9 @@ parse_opt (int key, char *arg, struct argp_state *state)
        /* Do not hard link to other locales.  */
        hard_links = false;
        break;
@@ -558,3 +558,6 @@ index 030f1727bd..096d8ed895 100644
  #ifdef NL_CURRENT_INDIRECT
  # define WEAK_POSTLOAD(postload) weak_extern (postload)
  #else
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0024-Define-DUMMY_LOCALE_T-if-not-defined.patch b/meta/recipes-core/glibc/glibc/0022-Define-DUMMY_LOCALE_T-if-not-defined.patch
similarity index 84%
rename from meta/recipes-core/glibc/glibc/0024-Define-DUMMY_LOCALE_T-if-not-defined.patch
rename to meta/recipes-core/glibc/glibc/0022-Define-DUMMY_LOCALE_T-if-not-defined.patch
index 15e460eb08..0e93183087 100644
--- a/meta/recipes-core/glibc/glibc/0024-Define-DUMMY_LOCALE_T-if-not-defined.patch
+++ b/meta/recipes-core/glibc/glibc/0022-Define-DUMMY_LOCALE_T-if-not-defined.patch
@@ -1,7 +1,7 @@
-From 067f71a381ce6626ef1179be3dd90c4ed2aa52fb Mon Sep 17 00:00:00 2001
+From ad5bc87134871b99e082e2449b8c1ce2f1375ef9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 20 Apr 2016 21:11:00 -0700
-Subject: [PATCH] Define DUMMY_LOCALE_T if not defined
+Subject: [PATCH 22/29] Define DUMMY_LOCALE_T if not defined
 
 This is a hack to fix building the locale bits on an older
 CentOs 5.X machine
@@ -27,3 +27,6 @@ index d76d9f7e8b..92b56d7df3 100644
  /* Use the internal textdomain used for libc messages.  */
  #define PACKAGE _libc_intl_domainname
  #ifndef VERSION
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0025-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch b/meta/recipes-core/glibc/glibc/0023-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
similarity index 95%
rename from meta/recipes-core/glibc/glibc/0025-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
rename to meta/recipes-core/glibc/glibc/0023-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
index 543f65d6ea..7cbf6811a1 100644
--- a/meta/recipes-core/glibc/glibc/0025-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
+++ b/meta/recipes-core/glibc/glibc/0023-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
@@ -1,7 +1,8 @@
-From 8f4b0bac85d14b184e08848b02de3f30775f05b1 Mon Sep 17 00:00:00 2001
+From c5fd8a3d336b8288f631fb6b6dd85f9d1076f25b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:42:06 -0700
-Subject: [PATCH] localedef --add-to-archive uses a hard-coded locale path
+Subject: [PATCH 23/29] localedef --add-to-archive uses a hard-coded locale
+ path
 
 it doesn't exist in normal use, and there's no way to pass an
 alternative filename.
@@ -78,3 +79,6 @@ index dccaf04e3b..ae0b7fe155 100644
  	    {
  	      if (readonly)
  		{
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch b/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
similarity index 88%
rename from meta/recipes-core/glibc/glibc/0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
rename to meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
index 5f6ee40f22..02e73594a0 100644
--- a/meta/recipes-core/glibc/glibc/0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
+++ b/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
@@ -1,7 +1,7 @@
-From 1dad746ce93928a57b2fe618c74722f710751826 Mon Sep 17 00:00:00 2001
+From dffa52364f8c54c455b2459ebe83f05cb6ffc9fc Mon Sep 17 00:00:00 2001
 From: Mark Hatle <mark.hatle@windriver.com>
 Date: Thu, 18 Aug 2016 14:07:58 -0500
-Subject: [PATCH] elf/dl-deps.c: Make _dl_build_local_scope breadth first
+Subject: [PATCH 24/29] elf/dl-deps.c: Make _dl_build_local_scope breadth first
 
 According to the ELF specification:
 
@@ -24,7 +24,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  1 file changed, 10 insertions(+), 4 deletions(-)
 
 diff --git a/elf/dl-deps.c b/elf/dl-deps.c
-index 5103a8a111..54cd80aaff 100644
+index b5a43232a7..8aa8f37fa3 100644
 --- a/elf/dl-deps.c
 +++ b/elf/dl-deps.c
 @@ -73,13 +73,19 @@ _dl_build_local_scope (struct link_map **list, struct link_map *map)
@@ -51,3 +51,6 @@ index 5103a8a111..54cd80aaff 100644
    return p - list;
  }
  
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0027-intl-Emit-no-lines-in-bison-generated-files.patch b/meta/recipes-core/glibc/glibc/0025-intl-Emit-no-lines-in-bison-generated-files.patch
similarity index 86%
rename from meta/recipes-core/glibc/glibc/0027-intl-Emit-no-lines-in-bison-generated-files.patch
rename to meta/recipes-core/glibc/glibc/0025-intl-Emit-no-lines-in-bison-generated-files.patch
index 2c317d58aa..700fb28874 100644
--- a/meta/recipes-core/glibc/glibc/0027-intl-Emit-no-lines-in-bison-generated-files.patch
+++ b/meta/recipes-core/glibc/glibc/0025-intl-Emit-no-lines-in-bison-generated-files.patch
@@ -1,7 +1,7 @@
-From 3c8d9eae83ab4f1677afc9b379f97114e8503363 Mon Sep 17 00:00:00 2001
+From bc3380877bd2a1f9368a913fa6a2ca1ee88fd95f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:44:00 -0700
-Subject: [PATCH] intl: Emit no lines in bison generated files
+Subject: [PATCH 25/29] intl: Emit no lines in bison generated files
 
 Improve reproducibility:
 Do not put any #line preprocessor commands in bison generated files.
@@ -29,3 +29,6 @@ index ce3072420f..58457840d9 100644
  
  $(inst_localedir)/locale.alias: locale.alias $(+force)
  	$(do-install)
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0028-inject-file-assembly-directives.patch b/meta/recipes-core/glibc/glibc/0026-inject-file-assembly-directives.patch
similarity index 66%
rename from meta/recipes-core/glibc/glibc/0028-inject-file-assembly-directives.patch
rename to meta/recipes-core/glibc/glibc/0026-inject-file-assembly-directives.patch
index e1a030d10c..89eef82e1b 100644
--- a/meta/recipes-core/glibc/glibc/0028-inject-file-assembly-directives.patch
+++ b/meta/recipes-core/glibc/glibc/0026-inject-file-assembly-directives.patch
@@ -1,7 +1,7 @@
-From 420454f7098b5445730caa855c37b8143bfccc1b Mon Sep 17 00:00:00 2001
+From cf043d56638883157dbfaa8c6a8e2f63a6f66280 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 29 Nov 2018 17:29:35 -0800
-Subject: [PATCH] inject file assembly directives
+Subject: [PATCH 26/29] inject file assembly directives
 
 Currently, non-IA builds are not reproducibile since build paths are
 being injected into the debug symbols. These are coming from the use of
@@ -25,13 +25,12 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- csu/abi-note.S                                | 2 ++
+ csu/abi-note.c                                | 2 ++
  sysdeps/aarch64/crti.S                        | 2 ++
- sysdeps/aarch64/crtn.S                        | 2 ++
+ sysdeps/aarch64/crtn.S                        | 1 +
  sysdeps/aarch64/dl-tlsdesc.S                  | 2 ++
  sysdeps/aarch64/dl-trampoline.S               | 2 ++
  sysdeps/aarch64/start.S                       | 2 ++
- sysdeps/arm/abi-note.S                        | 2 ++
  sysdeps/arm/crti.S                            | 2 ++
  sysdeps/arm/crtn.S                            | 2 ++
  sysdeps/arm/dl-tlsdesc.S                      | 2 ++
@@ -45,23 +44,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S   | 2 ++
  sysdeps/unix/sysv/linux/arm/libc-do-syscall.S | 2 ++
  sysdeps/unix/sysv/linux/powerpc/dl-brk.S      | 2 ++
- 20 files changed, 40 insertions(+)
+ 19 files changed, 37 insertions(+)
 
-diff --git a/csu/abi-note.S b/csu/abi-note.S
-index 2b4b5f8824..964843016c 100644
---- a/csu/abi-note.S
-+++ b/csu/abi-note.S
-@@ -56,6 +56,8 @@ offset	length	contents
- #include <config.h>
- #include <abi-tag.h>		/* OS-specific ABI tag value */
- 
-+	.file "abi-note.S"
-+
- /* The linker (GNU ld 2.8 and later) recognizes an allocated section whose
-    name begins with `.note' and creates a PT_NOTE program header entry
-    pointing at it. */
-diff --git a/sysdeps/aarch64/crti.S b/sysdeps/aarch64/crti.S
-index 1728eac37a..76a8ab590b 100644
 --- a/sysdeps/aarch64/crti.S
 +++ b/sysdeps/aarch64/crti.S
 @@ -50,6 +50,8 @@
@@ -73,21 +57,16 @@ index 1728eac37a..76a8ab590b 100644
  #if PREINIT_FUNCTION_WEAK
  	weak_extern (PREINIT_FUNCTION)
  #else
-diff --git a/sysdeps/aarch64/crtn.S b/sysdeps/aarch64/crtn.S
-index c3e97cc449..fc2e5c2df8 100644
 --- a/sysdeps/aarch64/crtn.S
 +++ b/sysdeps/aarch64/crtn.S
-@@ -37,6 +37,8 @@
- /* crtn.S puts function epilogues in the .init and .fini sections
+@@ -38,6 +38,7 @@
     corresponding to the prologues in crti.S. */
  
+ #include <sysdep.h>
 +	.file "crtn.S"
-+
+ 
  	.section .init,"ax",%progbits
  	ldp	x29, x30, [sp], 16
- 	RET
-diff --git a/sysdeps/aarch64/dl-tlsdesc.S b/sysdeps/aarch64/dl-tlsdesc.S
-index 557ad1d505..194a8531da 100644
 --- a/sysdeps/aarch64/dl-tlsdesc.S
 +++ b/sysdeps/aarch64/dl-tlsdesc.S
 @@ -22,6 +22,8 @@
@@ -99,8 +78,6 @@ index 557ad1d505..194a8531da 100644
  #define NSAVEDQREGPAIRS	16
  #define SAVE_Q_REGISTERS				\
  	stp	q0, q1,	[sp, #-32*NSAVEDQREGPAIRS]!;	\
-diff --git a/sysdeps/aarch64/dl-trampoline.S b/sysdeps/aarch64/dl-trampoline.S
-index 94e965c096..ba18742f3e 100644
 --- a/sysdeps/aarch64/dl-trampoline.S
 +++ b/sysdeps/aarch64/dl-trampoline.S
 @@ -21,6 +21,8 @@
@@ -112,8 +89,6 @@ index 94e965c096..ba18742f3e 100644
  #define ip0 x16
  #define ip0l PTR_REG (16)
  #define ip1 x17
-diff --git a/sysdeps/aarch64/start.S b/sysdeps/aarch64/start.S
-index d96cf57e2d..07a523978a 100644
 --- a/sysdeps/aarch64/start.S
 +++ b/sysdeps/aarch64/start.S
 @@ -18,6 +18,8 @@
@@ -125,18 +100,6 @@ index d96cf57e2d..07a523978a 100644
  /* This is the canonical entry point, usually the first thing in the text
     segment.
  
-diff --git a/sysdeps/arm/abi-note.S b/sysdeps/arm/abi-note.S
-index 07bd4c4619..7213b16f27 100644
---- a/sysdeps/arm/abi-note.S
-+++ b/sysdeps/arm/abi-note.S
-@@ -1,3 +1,5 @@
-+	.file "abi-note.S"
-+
- /* Tag_ABI_align8_preserved: This code preserves 8-byte
-    alignment in any callee.  */
- 	.eabi_attribute 25, 1
-diff --git a/sysdeps/arm/crti.S b/sysdeps/arm/crti.S
-index 8169783267..f56e0c85a6 100644
 --- a/sysdeps/arm/crti.S
 +++ b/sysdeps/arm/crti.S
 @@ -57,6 +57,8 @@
@@ -148,8 +111,6 @@ index 8169783267..f56e0c85a6 100644
  #if PREINIT_FUNCTION_WEAK
  	.p2align 2
  	.type call_weak_fn, %function
-diff --git a/sysdeps/arm/crtn.S b/sysdeps/arm/crtn.S
-index d60f9f05de..1e10ec439f 100644
 --- a/sysdeps/arm/crtn.S
 +++ b/sysdeps/arm/crtn.S
 @@ -37,6 +37,8 @@
@@ -161,8 +122,6 @@ index d60f9f05de..1e10ec439f 100644
  /* crtn.S puts function epilogues in the .init and .fini sections
     corresponding to the prologues in crti.S. */
  
-diff --git a/sysdeps/arm/dl-tlsdesc.S b/sysdeps/arm/dl-tlsdesc.S
-index 8415e47607..29c2cb8128 100644
 --- a/sysdeps/arm/dl-tlsdesc.S
 +++ b/sysdeps/arm/dl-tlsdesc.S
 @@ -21,6 +21,8 @@
@@ -174,8 +133,6 @@ index 8415e47607..29c2cb8128 100644
  	.text
  	@ emit debug information with cfi
  	@ use arm-specific pseudos for unwinding itself
-diff --git a/sysdeps/arm/dl-trampoline.S b/sysdeps/arm/dl-trampoline.S
-index a20baf555e..2dd3bef04e 100644
 --- a/sysdeps/arm/dl-trampoline.S
 +++ b/sysdeps/arm/dl-trampoline.S
 @@ -21,6 +21,8 @@
@@ -187,8 +144,6 @@ index a20baf555e..2dd3bef04e 100644
  	.text
  	.globl _dl_runtime_resolve
  	.type _dl_runtime_resolve, #function
-diff --git a/sysdeps/arm/start.S b/sysdeps/arm/start.S
-index 2ff56179d2..c118046ec6 100644
 --- a/sysdeps/arm/start.S
 +++ b/sysdeps/arm/start.S
 @@ -57,6 +57,8 @@
@@ -200,8 +155,6 @@ index 2ff56179d2..c118046ec6 100644
  /* Tag_ABI_align8_preserved: This code preserves 8-byte
     alignment in any callee.  */
  	.eabi_attribute 25, 1
-diff --git a/sysdeps/mips/start.S b/sysdeps/mips/start.S
-index fabc8080df..83c6b91d7d 100644
 --- a/sysdeps/mips/start.S
 +++ b/sysdeps/mips/start.S
 @@ -38,6 +38,8 @@
@@ -213,8 +166,6 @@ index fabc8080df..83c6b91d7d 100644
  #ifndef ENTRY_POINT
  #error ENTRY_POINT needs to be defined for start.S on MIPS/ELF.
  #endif
-diff --git a/sysdeps/powerpc/powerpc32/dl-start.S b/sysdeps/powerpc/powerpc32/dl-start.S
-index c15242d3bc..6ca27715a4 100644
 --- a/sysdeps/powerpc/powerpc32/dl-start.S
 +++ b/sysdeps/powerpc/powerpc32/dl-start.S
 @@ -18,6 +18,8 @@
@@ -226,8 +177,6 @@ index c15242d3bc..6ca27715a4 100644
  /* Initial entry point code for the dynamic linker.
     The C function `_dl_start' is the real entry point;
     its return value is the user program's entry point.	*/
-diff --git a/sysdeps/powerpc/powerpc32/start.S b/sysdeps/powerpc/powerpc32/start.S
-index b7b9a133a2..8df714f81a 100644
 --- a/sysdeps/powerpc/powerpc32/start.S
 +++ b/sysdeps/powerpc/powerpc32/start.S
 @@ -35,6 +35,8 @@
@@ -239,8 +188,6 @@ index b7b9a133a2..8df714f81a 100644
  /* We do not want .eh_frame info for crt1.o since crt1.o is linked
     before crtbegin.o, the file defining __EH_FRAME_BEGIN__.  */
  #undef cfi_startproc
-diff --git a/sysdeps/powerpc/powerpc64/start.S b/sysdeps/powerpc/powerpc64/start.S
-index 94bf771e83..cffb99500a 100644
 --- a/sysdeps/powerpc/powerpc64/start.S
 +++ b/sysdeps/powerpc/powerpc64/start.S
 @@ -35,6 +35,8 @@
@@ -252,8 +199,6 @@ index 94bf771e83..cffb99500a 100644
  /* We do not want .eh_frame info for crt1.o since crt1.o is linked
     before crtbegin.o, the file defining __EH_FRAME_BEGIN__.  */
  #undef cfi_startproc
-diff --git a/sysdeps/unix/sysv/linux/aarch64/__read_tp.S b/sysdeps/unix/sysv/linux/aarch64/__read_tp.S
-index 12e1131fe7..767e0d043b 100644
 --- a/sysdeps/unix/sysv/linux/aarch64/__read_tp.S
 +++ b/sysdeps/unix/sysv/linux/aarch64/__read_tp.S
 @@ -18,6 +18,8 @@
@@ -265,8 +210,6 @@ index 12e1131fe7..767e0d043b 100644
  	.hidden __read_tp
  ENTRY (__read_tp)
  	mrs	x0, tpidr_el0
-diff --git a/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S b/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S
-index 3b0d611039..4a7e476c37 100644
 --- a/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S
 +++ b/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S
 @@ -39,6 +39,8 @@
@@ -278,8 +221,6 @@ index 3b0d611039..4a7e476c37 100644
  	.hidden __aeabi_read_tp
  ENTRY (__aeabi_read_tp)
  #ifdef ARCH_HAS_HARD_TP
-diff --git a/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S b/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S
-index fb5e0c7d97..bd07bdb38b 100644
 --- a/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S
 +++ b/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S
 @@ -27,6 +27,8 @@
@@ -291,8 +232,6 @@ index fb5e0c7d97..bd07bdb38b 100644
  #if defined(__thumb__)
  	.thumb
  	.syntax unified
-diff --git a/sysdeps/unix/sysv/linux/powerpc/dl-brk.S b/sysdeps/unix/sysv/linux/powerpc/dl-brk.S
-index eeb96544e3..da182b28f8 100644
 --- a/sysdeps/unix/sysv/linux/powerpc/dl-brk.S
 +++ b/sysdeps/unix/sysv/linux/powerpc/dl-brk.S
 @@ -1 +1,3 @@
diff --git a/meta/recipes-core/glibc/glibc/0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch b/meta/recipes-core/glibc/glibc/0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
similarity index 92%
rename from meta/recipes-core/glibc/glibc/0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
rename to meta/recipes-core/glibc/glibc/0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
index c8c359f2b8..d2c88d2354 100644
--- a/meta/recipes-core/glibc/glibc/0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
+++ b/meta/recipes-core/glibc/glibc/0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
@@ -1,7 +1,7 @@
-From 66963ad83bdd3b075006ddca9dfe357aed181d6a Mon Sep 17 00:00:00 2001
+From 10aef8f0671d814aaf910ababc0225cf6f0a46e8 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <martin.jansa@gmail.com>
 Date: Mon, 17 Dec 2018 21:36:18 +0000
-Subject: [PATCH] locale: prevent maybe-uninitialized errors with -Os [BZ
+Subject: [PATCH 27/29] locale: prevent maybe-uninitialized errors with -Os [BZ
  #19444]
 
 Fixes following error when building for aarch64 with -Os:
@@ -51,3 +51,6 @@ index e071253f85..2889c395f1 100644
    const unsigned char *cp;
    const unsigned char *usrc;
  
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0009-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch b/meta/recipes-core/glibc/glibc/0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
similarity index 83%
rename from meta/recipes-core/glibc/glibc/0009-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
rename to meta/recipes-core/glibc/glibc/0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
index 456f91fb8e..25c046f5cd 100644
--- a/meta/recipes-core/glibc/glibc/0009-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
+++ b/meta/recipes-core/glibc/glibc/0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
@@ -1,7 +1,8 @@
-From 13beb1f428ec06778590bf526d6e641f73d5cf62 Mon Sep 17 00:00:00 2001
+From 70731329feb7ba20364aa37aed83d920de97f028 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:11:22 +0000
-Subject: [PATCH] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known names
+Subject: [PATCH 28/29] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known
+ names
 
 This bolts in a hook for OE to pass its own version of interpreter
 names into glibc especially for multilib case, where it differs from any
@@ -27,3 +28,6 @@ index 994a4426a1..baabf099b1 100644
  };
  
  static struct known_names known_libs[] =
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0030-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
similarity index 93%
rename from meta/recipes-core/glibc/glibc/0030-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
rename to meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index cbef2f2830..0ebf8a6183 100644
--- a/meta/recipes-core/glibc/glibc/0030-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -1,7 +1,7 @@
-From 9cb0a756b017f5961b70ac781d3eaec6c82513cb Mon Sep 17 00:00:00 2001
+From bf1c4b2f01c5f86bb770fd1711a69ea727e0f56e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 May 2020 17:05:45 -0700
-Subject: [PATCH] wordsize.h: Unify the header between arm and aarch64
+Subject: [PATCH 29/29] wordsize.h: Unify the header between arm and aarch64
 
 This helps OE multilibs to not sythesize this header which causes all
 kind of recursions and other issues since wordsize is fundamental header
@@ -65,3 +65,6 @@ index ee01841773..34fcdef1f1 100644
  #endif
  
  #define __WORDSIZE_TIME64_COMPAT32	0
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0030-Update-version-numbers-for-2.32-release.patch b/meta/recipes-core/glibc/glibc/0030-Update-version-numbers-for-2.32-release.patch
new file mode 100644
index 0000000000..164f66f2f9
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0030-Update-version-numbers-for-2.32-release.patch
@@ -0,0 +1,27 @@
+From 8598f95e146f009023debd8088558a71b15a89b4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 21 Jul 2020 13:59:16 -0700
+Subject: [PATCH 30/30] Update version numbers for 2.32 release
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/features.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/features.h b/include/features.h
+index b6ff1e9b7b..f3e62d3362 100644
+--- a/include/features.h
++++ b/include/features.h
+@@ -454,7 +454,7 @@
+ /* Major and minor version number of the GNU C library package.  Use
+    these macros to test for features in specific releases.  */
+ #define	__GLIBC__	2
+-#define	__GLIBC_MINOR__	31
++#define	__GLIBC_MINOR__	32
+ 
+ #define __GLIBC_PREREQ(maj, min) \
+ 	((__GLIBC__ << 16) + __GLIBC_MINOR__ >= ((maj) << 16) + (min))
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-6096.patch b/meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
deleted file mode 100644
index 9c26f76432..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From beea361050728138b82c57dda0c4810402d342b9 Mon Sep 17 00:00:00 2001
-From: Alexander Anisimov <a.anisimov@omprussia.ru>
-Date: Wed, 8 Jul 2020 14:18:31 +0200
-Subject: [PATCH] arm: CVE-2020-6096: Fix multiarch memcpy for negative length
- [BZ #25620]
-
-Unsigned branch instructions could be used for r2 to fix the wrong
-behavior when a negative length is passed to memcpy.
-This commit fixes the armv7 version.
-
-Upstream-Status: Backport
-CVE: CVE-2020-6096 patch #1
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- sysdeps/arm/armv7/multiarch/memcpy_impl.S | 22 +++++++++++-----------
- 1 file changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/sysdeps/arm/armv7/multiarch/memcpy_impl.S b/sysdeps/arm/armv7/multiarch/memcpy_impl.S
-index bf4ac7077f..379bb56fc9 100644
---- a/sysdeps/arm/armv7/multiarch/memcpy_impl.S
-+++ b/sysdeps/arm/armv7/multiarch/memcpy_impl.S
-@@ -268,7 +268,7 @@ ENTRY(memcpy)
- 
- 	mov	dst, dstin	/* Preserve dstin, we need to return it.  */
- 	cmp	count, #64
--	bge	.Lcpy_not_short
-+	bhs	.Lcpy_not_short
- 	/* Deal with small copies quickly by dropping straight into the
- 	   exit block.  */
- 
-@@ -351,10 +351,10 @@ ENTRY(memcpy)
- 
- 1:
- 	subs	tmp2, count, #64	/* Use tmp2 for count.  */
--	blt	.Ltail63aligned
-+	blo	.Ltail63aligned
- 
- 	cmp	tmp2, #512
--	bge	.Lcpy_body_long
-+	bhs	.Lcpy_body_long
- 
- .Lcpy_body_medium:			/* Count in tmp2.  */
- #ifdef USE_VFP
-@@ -378,7 +378,7 @@ ENTRY(memcpy)
- 	add	src, src, #64
- 	vstr	d1, [dst, #56]
- 	add	dst, dst, #64
--	bge	1b
-+	bhs	1b
- 	tst	tmp2, #0x3f
- 	beq	.Ldone
- 
-@@ -412,7 +412,7 @@ ENTRY(memcpy)
- 	ldrd	A_l, A_h, [src, #64]!
- 	strd	A_l, A_h, [dst, #64]!
- 	subs	tmp2, tmp2, #64
--	bge	1b
-+	bhs	1b
- 	tst	tmp2, #0x3f
- 	bne	1f
- 	ldr	tmp2,[sp], #FRAME_SIZE
-@@ -482,7 +482,7 @@ ENTRY(memcpy)
- 	add	src, src, #32
- 
- 	subs	tmp2, tmp2, #prefetch_lines * 64 * 2
--	blt	2f
-+	blo	2f
- 1:
- 	cpy_line_vfp	d3, 0
- 	cpy_line_vfp	d4, 64
-@@ -494,7 +494,7 @@ ENTRY(memcpy)
- 	add	dst, dst, #2 * 64
- 	add	src, src, #2 * 64
- 	subs	tmp2, tmp2, #prefetch_lines * 64
--	bge	1b
-+	bhs	1b
- 
- 2:
- 	cpy_tail_vfp	d3, 0
-@@ -615,8 +615,8 @@ ENTRY(memcpy)
- 1:
- 	pld	[src, #(3 * 64)]
- 	subs	count, count, #64
--	ldrmi	tmp2, [sp], #FRAME_SIZE
--	bmi	.Ltail63unaligned
-+	ldrlo	tmp2, [sp], #FRAME_SIZE
-+	blo	.Ltail63unaligned
- 	pld	[src, #(4 * 64)]
- 
- #ifdef USE_NEON
-@@ -633,7 +633,7 @@ ENTRY(memcpy)
- 	neon_load_multi d0-d3, src
- 	neon_load_multi d4-d7, src
- 	subs	count, count, #64
--	bmi	2f
-+	blo	2f
- 1:
- 	pld	[src, #(4 * 64)]
- 	neon_store_multi d0-d3, dst
-@@ -641,7 +641,7 @@ ENTRY(memcpy)
- 	neon_store_multi d4-d7, dst
- 	neon_load_multi d4-d7, src
- 	subs	count, count, #64
--	bpl	1b
-+	bhs	1b
- 2:
- 	neon_store_multi d0-d3, dst
- 	neon_store_multi d4-d7, dst
--- 
-2.17.1
-
diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch b/meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch
deleted file mode 100644
index 905e44c8e3..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch
+++ /dev/null
@@ -1,194 +0,0 @@
-From 79a4fa341b8a89cb03f84564fd72abaa1a2db394 Mon Sep 17 00:00:00 2001
-From: Evgeny Eremin <e.eremin@omprussia.ru>
-Date: Wed, 8 Jul 2020 14:18:19 +0200
-Subject: [PATCH] arm: CVE-2020-6096: fix memcpy and memmove for negative
- length [BZ #25620]
-
-Unsigned branch instructions could be used for r2 to fix the wrong
-behavior when a negative length is passed to memcpy and memmove.
-This commit fixes the generic arm implementation of memcpy amd memmove.
-
-Upstream-Status: Backport
-CVE: CVE-2020-6096 patch #2
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- sysdeps/arm/memcpy.S  | 24 ++++++++++--------------
- sysdeps/arm/memmove.S | 24 ++++++++++--------------
- 2 files changed, 20 insertions(+), 28 deletions(-)
-
-diff --git a/sysdeps/arm/memcpy.S b/sysdeps/arm/memcpy.S
-index 510e8adaf2..bcfbc51d99 100644
---- a/sysdeps/arm/memcpy.S
-+++ b/sysdeps/arm/memcpy.S
-@@ -68,7 +68,7 @@ ENTRY(memcpy)
- 		cfi_remember_state
- 
- 		subs	r2, r2, #4
--		blt	8f
-+		blo	8f
- 		ands	ip, r0, #3
- 	PLD(	pld	[r1, #0]		)
- 		bne	9f
-@@ -82,7 +82,7 @@ ENTRY(memcpy)
- 		cfi_rel_offset (r6, 4)
- 		cfi_rel_offset (r7, 8)
- 		cfi_rel_offset (r8, 12)
--		blt	5f
-+		blo	5f
- 
- 	CALGN(	ands	ip, r1, #31		)
- 	CALGN(	rsb	r3, ip, #32		)
-@@ -98,9 +98,9 @@ ENTRY(memcpy)
- #endif
- 
- 	PLD(	pld	[r1, #0]		)
--2:	PLD(	subs	r2, r2, #96		)
-+2:	PLD(	cmp	r2, #96			)
- 	PLD(	pld	[r1, #28]		)
--	PLD(	blt	4f			)
-+	PLD(	blo	4f			)
- 	PLD(	pld	[r1, #60]		)
- 	PLD(	pld	[r1, #92]		)
- 
-@@ -108,9 +108,7 @@ ENTRY(memcpy)
- 4:		ldmia	r1!, {r3, r4, r5, r6, r7, r8, ip, lr}
- 		subs	r2, r2, #32
- 		stmia	r0!, {r3, r4, r5, r6, r7, r8, ip, lr}
--		bge	3b
--	PLD(	cmn	r2, #96			)
--	PLD(	bge	4b			)
-+		bhs	3b
- 
- 5:		ands	ip, r2, #28
- 		rsb	ip, ip, #32
-@@ -222,7 +220,7 @@ ENTRY(memcpy)
- 		strbge	r4, [r0], #1
- 		subs	r2, r2, ip
- 		strb	lr, [r0], #1
--		blt	8b
-+		blo	8b
- 		ands	ip, r1, #3
- 		beq	1b
- 
-@@ -236,7 +234,7 @@ ENTRY(memcpy)
- 		.macro	forward_copy_shift pull push
- 
- 		subs	r2, r2, #28
--		blt	14f
-+		blo	14f
- 
- 	CALGN(	ands	ip, r1, #31		)
- 	CALGN(	rsb	ip, ip, #32		)
-@@ -253,9 +251,9 @@ ENTRY(memcpy)
- 		cfi_rel_offset (r10, 16)
- 
- 	PLD(	pld	[r1, #0]		)
--	PLD(	subs	r2, r2, #96		)
-+	PLD(	cmp	r2, #96			)
- 	PLD(	pld	[r1, #28]		)
--	PLD(	blt	13f			)
-+	PLD(	blo	13f			)
- 	PLD(	pld	[r1, #60]		)
- 	PLD(	pld	[r1, #92]		)
- 
-@@ -280,9 +278,7 @@ ENTRY(memcpy)
- 		mov	ip, ip, PULL #\pull
- 		orr	ip, ip, lr, PUSH #\push
- 		stmia	r0!, {r3, r4, r5, r6, r7, r8, r10, ip}
--		bge	12b
--	PLD(	cmn	r2, #96			)
--	PLD(	bge	13b			)
-+		bhs	12b
- 
- 		pop	{r5 - r8, r10}
- 		cfi_adjust_cfa_offset (-20)
-diff --git a/sysdeps/arm/memmove.S b/sysdeps/arm/memmove.S
-index 954037ef3a..0d07b76ee6 100644
---- a/sysdeps/arm/memmove.S
-+++ b/sysdeps/arm/memmove.S
-@@ -85,7 +85,7 @@ ENTRY(memmove)
- 		add	r1, r1, r2
- 		add	r0, r0, r2
- 		subs	r2, r2, #4
--		blt	8f
-+		blo	8f
- 		ands	ip, r0, #3
- 	PLD(	pld	[r1, #-4]		)
- 		bne	9f
-@@ -99,7 +99,7 @@ ENTRY(memmove)
- 		cfi_rel_offset (r6, 4)
- 		cfi_rel_offset (r7, 8)
- 		cfi_rel_offset (r8, 12)
--		blt	5f
-+		blo     5f
- 
- 	CALGN(	ands	ip, r1, #31		)
- 	CALGN(	sbcsne	r4, ip, r2		)  @ C is always set here
-@@ -114,9 +114,9 @@ ENTRY(memmove)
- #endif
- 
- 	PLD(	pld	[r1, #-4]		)
--2:	PLD(	subs	r2, r2, #96		)
-+2:	PLD(	cmp	r2, #96			)
- 	PLD(	pld	[r1, #-32]		)
--	PLD(	blt	4f			)
-+	PLD(    blo     4f                      )
- 	PLD(	pld	[r1, #-64]		)
- 	PLD(	pld	[r1, #-96]		)
- 
-@@ -124,9 +124,7 @@ ENTRY(memmove)
- 4:		ldmdb	r1!, {r3, r4, r5, r6, r7, r8, ip, lr}
- 		subs	r2, r2, #32
- 		stmdb	r0!, {r3, r4, r5, r6, r7, r8, ip, lr}
--		bge	3b
--	PLD(	cmn	r2, #96			)
--	PLD(	bge	4b			)
-+		bhs     3b
- 
- 5:		ands	ip, r2, #28
- 		rsb	ip, ip, #32
-@@ -237,7 +235,7 @@ ENTRY(memmove)
- 		strbge	r4, [r0, #-1]!
- 		subs	r2, r2, ip
- 		strb	lr, [r0, #-1]!
--		blt	8b
-+		blo	8b
- 		ands	ip, r1, #3
- 		beq	1b
- 
-@@ -251,7 +249,7 @@ ENTRY(memmove)
- 		.macro	backward_copy_shift push pull
- 
- 		subs	r2, r2, #28
--		blt	14f
-+		blo	14f
- 
- 	CALGN(	ands	ip, r1, #31		)
- 	CALGN(	rsb	ip, ip, #32		)
-@@ -268,9 +266,9 @@ ENTRY(memmove)
- 		cfi_rel_offset (r10, 16)
- 
- 	PLD(	pld	[r1, #-4]		)
--	PLD(	subs	r2, r2, #96		)
-+	PLD(	cmp	r2, #96			)
- 	PLD(	pld	[r1, #-32]		)
--	PLD(	blt	13f			)
-+	PLD(	blo	13f			)
- 	PLD(	pld	[r1, #-64]		)
- 	PLD(	pld	[r1, #-96]		)
- 
-@@ -295,9 +293,7 @@ ENTRY(memmove)
- 		mov     r4, r4, PUSH #\push
- 		orr     r4, r4, r3, PULL #\pull
- 		stmdb   r0!, {r4 - r8, r10, ip, lr}
--		bge	12b
--	PLD(	cmn	r2, #96			)
--	PLD(	bge	13b			)
-+		bhs	12b
- 
- 		pop	{r5 - r8, r10}
- 		cfi_adjust_cfa_offset (-20)
--- 
-2.17.1
-
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.32.bb
similarity index 69%
rename from meta/recipes-core/glibc/glibc_2.31.bb
rename to meta/recipes-core/glibc/glibc_2.32.bb
index 38563b1a7b..8168ba822c 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.32.bb
@@ -21,30 +21,28 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            \
            ${NATIVESDKFIXES} \
            file://0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
-           file://0009-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
-           file://0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch \
-           file://0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
-           file://0012-Quote-from-bug-1443-which-explains-what-the-patch-do.patch \
-           file://0013-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
-           file://0014-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
-           file://0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch \
-           file://0016-Add-unused-attribute.patch \
-           file://0017-yes-within-the-path-sets-wrong-config-variables.patch \
-           file://0018-timezone-re-written-tzselect-as-posix-sh.patch \
-           file://0019-Remove-bash-dependency-for-nscd-init-script.patch \
-           file://0020-eglibc-Cross-building-and-testing-instructions.patch \
-           file://0021-eglibc-Help-bootstrap-cross-toolchain.patch \
-           file://0022-eglibc-Resolve-__fpscr_values-on-SH4.patch \
-           file://0023-eglibc-Forward-port-cross-locale-generation-support.patch \
-           file://0024-Define-DUMMY_LOCALE_T-if-not-defined.patch \
-           file://0025-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
-           file://0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
-           file://0027-intl-Emit-no-lines-in-bison-generated-files.patch \
-           file://0028-inject-file-assembly-directives.patch \
-           file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
-           file://0030-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
-           file://CVE-2020-6096.patch \
-           file://CVE-2020-6096_2.patch \
+           file://0009-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch \
+           file://0010-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
+           file://0011-Quote-from-bug-1443-which-explains-what-the-patch-do.patch \
+           file://0012-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
+           file://0013-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
+           file://0014-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch \
+           file://0015-yes-within-the-path-sets-wrong-config-variables.patch \
+           file://0016-timezone-re-written-tzselect-as-posix-sh.patch \
+           file://0017-Remove-bash-dependency-for-nscd-init-script.patch \
+           file://0018-eglibc-Cross-building-and-testing-instructions.patch \
+           file://0019-eglibc-Help-bootstrap-cross-toolchain.patch \
+           file://0020-eglibc-Resolve-__fpscr_values-on-SH4.patch \
+           file://0021-eglibc-Forward-port-cross-locale-generation-support.patch \
+           file://0022-Define-DUMMY_LOCALE_T-if-not-defined.patch \
+           file://0023-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
+           file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
+           file://0025-intl-Emit-no-lines-in-bison-generated-files.patch \
+           file://0026-inject-file-assembly-directives.patch \
+           file://0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
+           file://0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
+           file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
+           file://0030-Update-version-numbers-for-2.32-release.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.27.0

