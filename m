Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D1BC25B08
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 05:43:45 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.8550.1660023824864191875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 22:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kg9MS4L3;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id x10so10451203plb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 22:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=/40Rk1Wnsj/oMsXno3AKm1zOU2lATkE59D14/FdoOhs=;
        b=Kg9MS4L3cYzSZYdeZuL2RBC826Nh5fC07zt0Z0SQ9sgFYg9u4uiy/bzBCCGZZEIGMB
         l13MzKiE4O+EQ7Hh2hQydKxf6IYJuad5VFLsVw21DVRuwJeTfRLt6zynqNhMbSmgnwkJ
         5Oa8/s0f24axSBbW1SewWoWo0Ca7SYHZOykWjpA8swsLkEUZ3VO/5IGYu3QhFP6TPNHl
         NRDyVH/mNMy77Gd6KwgnM8TF4u5iRbXrVzyjE2c51XOJQVm3zn+wySjJG9kbFm3ALTXC
         r1uHh6NKMFqi3jPBlZNLXs7ZTIriNLYSCsbO6ndZ5YbPfCxSw7ciD+qdNG6ozc/UHQ7P
         CQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=/40Rk1Wnsj/oMsXno3AKm1zOU2lATkE59D14/FdoOhs=;
        b=vG6enOdc82Br47TSrxad63QWoG4A9FLPyQUMEIZq5QDR71ZnooAxvwWFPGL6e9tAoJ
         MxtAuhF/1bbhoonCaFwj47jKtd2IWo0Zw67fcoR1ozKGe8koPzXueYOgV1WdCJO8DXKN
         TEk2KKyjK3gQlF2yVp+Knn0YGs45Cw0WZx47xM3Ije/BewcLn8YtLj23qPL/HEy1dJq8
         R/aGZ/3lh9YWY575qLdjVNdQPLYGColOhEbUUCrFCOQk3hA/goVwGaf6xpxlUDSmDRZC
         xuxNgUbLUX4EmWKMNh6qMlDaRTnsckO9Sa+mgM+a4MBwewvwnycg+F9GQ6fv1AfjN2r+
         cmXQ==
X-Gm-Message-State: ACgBeo0OsGrKJPX6faptgm01CjPe9C512AJNwxbuFWWNyox8lm4M33v8
	b0m7Ep9BCbCtaADeBGRr+6eyAWa2x+c=
X-Google-Smtp-Source: 
 AA6agR5j5YpOpSOzwL8KuXz/uMppF2BgssHzCIKRtvh2OcVLfJKRmJSnx/4o+8vY71xpZWiVuU9CvQ==
X-Received: by 2002:a17:90b:4acd:b0:1f4:cf0c:7a68 with SMTP id
 mh13-20020a17090b4acd00b001f4cf0c7a68mr24141154pjb.178.1660023822845;
        Mon, 08 Aug 2022 22:43:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 x64-20020a17090a6c4600b001f7a4ea4fd5sm273155pjj.39.2022.08.08.22.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 22:43:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH V3 1/2] glibc: Bump to 2.36
Date: Mon,  8 Aug 2022 22:43:39 -0700
Message-Id: <20220809054340.822999-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 05:43:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169135

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
v2: Add DEBUG_BUILD fixes
v3: Update SRCREV to latest on 2.36 branch

 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...2.35.bb => cross-localedef-native_2.36.bb} |  4 +-
 meta/recipes-core/glibc/glibc-common.inc      |  2 +-
 ...bc-locale_2.35.bb => glibc-locale_2.36.bb} |  0
 ...bc-mtrace_2.35.bb => glibc-mtrace_2.36.bb} |  0
 ...-scripts_2.35.bb => glibc-scripts_2.36.bb} |  0
 ...libc-tests_2.35.bb => glibc-tests_2.36.bb} |  1 -
 ...tsuite_2.35.bb => glibc-testsuite_2.36.bb} |  0
 meta/recipes-core/glibc/glibc-version.inc     |  6 +--
 ...dd-hardlink-resolver-from-util-linux.patch |  2 +-
 ...-fix-ups-hardlink-to-make-it-compile.patch |  2 +-
 ...Look-for-host-system-ld.so.cache-as-.patch |  8 ++--
 ...Fix-buffer-overrun-with-a-relocated-.patch |  6 +--
 ...Raise-the-size-of-arrays-containing-.patch | 22 ++++-----
 ...k-glibc-Allow-64-bit-atomics-for-x86.patch |  6 +--
 ...Make-relocatable-install-for-locales.patch | 12 ++---
 ...Fall-back-to-faccessat-on-faccess2-r.patch |  4 +-
 ...the-path-sets-wrong-config-variables.patch | 30 ++++++------
 ...ss-building-and-testing-instructions.patch |  2 +-
 ...glibc-Help-bootstrap-cross-toolchain.patch |  8 ++--
 ...eglibc-Resolve-__fpscr_values-on-SH4.patch |  4 +-
 ...port-cross-locale-generation-support.patch | 46 +++++++++----------
 ...-archive-uses-a-hard-coded-locale-pa.patch |  4 +-
 ...ybe-uninitialized-errors-with-Os-BZ.patch} |  6 +--
 ...E_KNOWN_INTERPRETER_NAMES-to-known-.patch} |  4 +-
 ...o-not-ask-compiler-for-finding-arch.patch} |  2 +-
 ...y-the-header-between-arm-and-aarch64.patch | 19 ++++----
 ...-printf-builtin-in-nscd-init-script.patch} |  4 +-
 ...gure.ac-Set-libc_cv_rootsbindir-onl.patch} |  7 +--
 ...ll-interpreter-overridable-in-tzsel.patch} | 10 ++--
 ...Use-bin-sh-default-shell-interpreter.patch | 27 +++++++++++
 ...-failed-in-unprivileged-process-BZ-.patch} |  6 +--
 ...uild-time-paths-in-the-output-binar.patch} | 23 +++++++---
 ...ement-a-useful-version-of-_startup_.patch} |  8 ++--
 .../glibc/{glibc_2.35.bb => glibc_2.36.bb}    | 19 ++++----
 35 files changed, 169 insertions(+), 137 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.35.bb => cross-localedef-native_2.36.bb} (94%)
 rename meta/recipes-core/glibc/{glibc-locale_2.35.bb => glibc-locale_2.36.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.35.bb => glibc-mtrace_2.36.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.35.bb => glibc-scripts_2.36.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-tests_2.35.bb => glibc-tests_2.36.bb} (98%)
 rename meta/recipes-core/glibc/{glibc-testsuite_2.35.bb => glibc-testsuite_2.36.bb} (100%)
 rename meta/recipes-core/glibc/glibc/{0016-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch => 0015-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch} (93%)
 rename meta/recipes-core/glibc/glibc/{0017-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch => 0016-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch} (89%)
 rename meta/recipes-core/glibc/glibc/{0019-powerpc-Do-not-ask-compiler-for-finding-arch.patch => 0017-powerpc-Do-not-ask-compiler-for-finding-arch.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0021-Replace-echo-with-printf-builtin-in-nscd-init-script.patch => 0019-Replace-echo-with-printf-builtin-in-nscd-init-script.patch} (91%)
 rename meta/recipes-core/glibc/glibc/{0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch => 0020-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch} (84%)
 rename meta/recipes-core/glibc/glibc/{0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch => 0021-timezone-Make-shell-interpreter-overridable-in-tzsel.patch} (80%)
 create mode 100644 meta/recipes-core/glibc/glibc/0022-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
 rename meta/recipes-core/glibc/glibc/{0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch => 0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{reproducible-paths.patch => 0024-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch} (50%)
 rename meta/recipes-core/glibc/glibc/{0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch => 0025-Revert-Linux-Implement-a-useful-version-of-_startup_.patch} (97%)
 rename meta/recipes-core/glibc/{glibc_2.35.bb => glibc_2.36.bb} (87%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 00e345d98f2..9bc6d4ede89 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -20,7 +20,7 @@ GCCVERSION ?= "12.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.39%"
 GDBVERSION ?= "12.%"
-GLIBCVERSION ?= "2.35"
+GLIBCVERSION ?= "2.36"
 LINUXLIBCVERSION ?= "5.19%"
 QEMUVERSION ?= "7.0%"
 GOVERSION ?= "1.18%"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.35.bb b/meta/recipes-core/glibc/cross-localedef-native_2.36.bb
similarity index 94%
rename from meta/recipes-core/glibc/cross-localedef-native_2.35.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.36.bb
index b7b54e9ccc5..f4ea76380e8 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.35.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.36.bb
@@ -30,8 +30,8 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0012-eglibc-Resolve-__fpscr_values-on-SH4.patch \
            file://0013-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
-           file://0021-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
-           file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
+           file://0019-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
+           file://0021-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            "
 # Makes for a rather long rev (22 characters), but...
 #
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index 90a6a534f31..fba172d9686 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -22,4 +22,4 @@ ARM_INSTRUCTION_SET:armv6 = "arm"
 #
 COMPATIBLE_HOST:libc-musl:class-target = "null"
 
-PV = "2.35"
+PV = "2.36"
diff --git a/meta/recipes-core/glibc/glibc-locale_2.35.bb b/meta/recipes-core/glibc/glibc-locale_2.36.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.35.bb
rename to meta/recipes-core/glibc/glibc-locale_2.36.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.35.bb b/meta/recipes-core/glibc/glibc-mtrace_2.36.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.35.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.36.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.35.bb b/meta/recipes-core/glibc/glibc-scripts_2.36.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.35.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.36.bb
diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb b/meta/recipes-core/glibc/glibc-tests_2.36.bb
similarity index 98%
rename from meta/recipes-core/glibc/glibc-tests_2.35.bb
rename to meta/recipes-core/glibc/glibc-tests_2.36.bb
index 96d0569ff67..aca9675ebbe 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.35.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.36.bb
@@ -5,7 +5,6 @@ inherit ptest features_check
 REQUIRED_DISTRO_FEATURES = "ptest"
 
 SRC_URI:append = " \
-	file://reproducible-paths.patch \
 	file://run-ptest \
 "
 
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.35.bb b/meta/recipes-core/glibc/glibc-testsuite_2.36.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-testsuite_2.35.bb
rename to meta/recipes-core/glibc/glibc-testsuite_2.36.bb
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index ccb41e5af62..f6cdbbf2414 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
-SRCBRANCH ?= "release/2.35/master"
-PV = "2.35"
-SRCREV_glibc ?= "0e5b239f45992e4b54c6f946ecb0c410afc8bb08"
+SRCBRANCH ?= "release/2.36/master"
+PV = "2.36"
+SRCREV_glibc ?= "ac47d8f6cf9744139adb12f540fb9cc610cac579"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
index 546fe582149..dfbd700c5fa 100644
--- a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
+++ b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
@@ -1,4 +1,4 @@
-From 8778429a3345bb5c0361332cf5103f394717a396 Mon Sep 17 00:00:00 2001
+From c6dca721df6dd8c39ffe16e61623516bd8742d39 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 09:59:22 -0800
 Subject: [PATCH] localedef: Add hardlink resolver from util-linux
diff --git a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
index 94a05cf954d..57f1a36455f 100644
--- a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
+++ b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
@@ -1,4 +1,4 @@
-From 87a69126d97bb8d5d52e34e451b4a7076efd6bed Mon Sep 17 00:00:00 2001
+From 3e391efa9b179ae886dd0942202bd2a6698e2679 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 10:01:37 -0800
 Subject: [PATCH] localedef: fix-ups hardlink to make it compile
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index 9a605078b93..4eb23bd0e56 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,4 +1,4 @@
-From 752b0d32fc96728ee624dbd62bf23e034d8d2aed Mon Sep 17 00:00:00 2001
+From a74ac72e6a25121c99f3875cf0245a435729e897 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:48:24 +0000
 Subject: [PATCH] nativesdk-glibc: Look for host system ld.so.cache as well
@@ -30,10 +30,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 721593135e..39c4657fa2 100644
+index 1ad0868dad..c5e235d918 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -2208,6 +2208,14 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2109,6 +2109,14 @@ _dl_map_object (struct link_map *loader, const char *name,
              }
          }
  
@@ -48,7 +48,7 @@ index 721593135e..39c4657fa2 100644
  #ifdef USE_LDCONFIG
        if (fd == -1
  	  && (__glibc_likely ((mode & __RTLD_SECURE) == 0)
-@@ -2266,14 +2274,6 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2167,14 +2175,6 @@ _dl_map_object (struct link_map *loader, const char *name,
  	}
  #endif
  
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index da288d6ccfc..7eaf70b780f 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,4 +1,4 @@
-From 2f7407697f2a905fedb98037152e7830f73bc6c6 Mon Sep 17 00:00:00 2001
+From d2f16ab250dbb93ae21e9e9286ddf696141db735 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
 Subject: [PATCH] nativesdk-glibc: Fix buffer overrun with a relocated SDK
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 39c4657fa2..daa3af6c51 100644
+index c5e235d918..ce3cbfa3c4 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -1904,7 +1904,19 @@ open_path (const char *name, size_t namelen, int mode,
+@@ -1809,7 +1809,19 @@ open_path (const char *name, size_t namelen, int mode,
         given on the command line when rtld is run directly.  */
      return -1;
  
diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index 14bcaf3ef9e..1fb76202c57 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,4 +1,4 @@
-From 88a31cd08801df53249963f3b26c7dbcee6ae2f8 Mon Sep 17 00:00:00 2001
+From 2d41508ed1059df2df9994d35d870be2005f575f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
 Subject: [PATCH] nativesdk-glibc: Raise the size of arrays containing dl paths
@@ -26,10 +26,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  8 files changed, 16 insertions(+), 10 deletions(-)
 
 diff --git a/elf/dl-cache.c b/elf/dl-cache.c
-index 2b8da8650d..3d9787bda4 100644
+index 8bbf110d02..c02a95d9b5 100644
 --- a/elf/dl-cache.c
 +++ b/elf/dl-cache.c
-@@ -355,6 +355,10 @@ search_cache (const char *string_table, uint32_t string_table_size,
+@@ -352,6 +352,10 @@ search_cache (const char *string_table, uint32_t string_table_size,
    return best;
  }
  
@@ -41,7 +41,7 @@ index 2b8da8650d..3d9787bda4 100644
  _dl_cache_libcmp (const char *p1, const char *p2)
  {
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index daa3af6c51..e323952993 100644
+index ce3cbfa3c4..e116db24a1 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -117,8 +117,8 @@ enum { ncapstr = 1, max_capstrlen = 0 };
@@ -56,7 +56,7 @@ index daa3af6c51..e323952993 100644
    SYSTEM_DIRS_LEN
  };
 diff --git a/elf/dl-usage.c b/elf/dl-usage.c
-index 5ad3a72559..88f26d3692 100644
+index 98d8c98948..77ca98cbf9 100644
 --- a/elf/dl-usage.c
 +++ b/elf/dl-usage.c
 @@ -25,6 +25,8 @@
@@ -87,7 +87,7 @@ index 5ad3a72559..88f26d3692 100644
    print_hwcaps_subdirectories (state);
    print_legacy_hwcap_directories ();
 diff --git a/elf/interp.c b/elf/interp.c
-index 91966702ca..dc86c20e83 100644
+index d82af036d1..9d282b2769 100644
 --- a/elf/interp.c
 +++ b/elf/interp.c
 @@ -18,5 +18,5 @@
@@ -98,7 +98,7 @@ index 91966702ca..dc86c20e83 100644
 +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
    = RUNTIME_LINKER;
 diff --git a/elf/ldconfig.c b/elf/ldconfig.c
-index 101d56ac8e..33debef60a 100644
+index 9394ac6438..7f66b1a460 100644
 --- a/elf/ldconfig.c
 +++ b/elf/ldconfig.c
 @@ -176,6 +176,9 @@ static struct argp argp =
@@ -112,10 +112,10 @@ index 101d56ac8e..33debef60a 100644
     a platform.  */
  static int
 diff --git a/elf/rtld.c b/elf/rtld.c
-index 4b09e84b0d..56d93ff616 100644
+index cbbaf4a331..d2d27a0127 100644
 --- a/elf/rtld.c
 +++ b/elf/rtld.c
-@@ -193,6 +193,7 @@ dso_name_valid_for_suid (const char *p)
+@@ -189,6 +189,7 @@ dso_name_valid_for_suid (const char *p)
      }
    return *p != '\0';
  }
@@ -124,7 +124,7 @@ index 4b09e84b0d..56d93ff616 100644
  static void
  audit_list_init (struct audit_list *list)
 diff --git a/iconv/gconv_conf.c b/iconv/gconv_conf.c
-index 077082af66..46b6152455 100644
+index f069e28323..6288f715ba 100644
 --- a/iconv/gconv_conf.c
 +++ b/iconv/gconv_conf.c
 @@ -35,7 +35,7 @@
@@ -137,7 +137,7 @@ index 077082af66..46b6152455 100644
  /* Type to represent search path.  */
  struct path_elem
 diff --git a/sysdeps/generic/dl-cache.h b/sysdeps/generic/dl-cache.h
-index 964d50a486..94bf68ca9d 100644
+index 93d4bea930..5249176441 100644
 --- a/sysdeps/generic/dl-cache.h
 +++ b/sysdeps/generic/dl-cache.h
 @@ -34,10 +34,6 @@
diff --git a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index 493b2daad37..c66bcf80c04 100644
--- a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -1,4 +1,4 @@
-From a1fbd7ef1da02f334ff72c52cb11116164649067 Mon Sep 17 00:00:00 2001
+From 946d1cadf0bb54216409e8e0eb09be3e96044dbf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:35:35 -0800
 Subject: [PATCH] nativesdk-glibc: Allow 64 bit atomics for x86
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/sysdeps/x86/atomic-machine.h b/sysdeps/x86/atomic-machine.h
-index 2692d94a92..9d39bfdbd5 100644
+index f24f1c71ed..574487ca54 100644
 --- a/sysdeps/x86/atomic-machine.h
 +++ b/sysdeps/x86/atomic-machine.h
-@@ -52,19 +52,14 @@ typedef uintmax_t uatomic_max_t;
+@@ -26,19 +26,14 @@
  #define LOCK_PREFIX "lock;"
  
  #define USE_ATOMIC_COMPILER_BUILTINS	1
diff --git a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index b40d2bdef69..dc24c0240e6 100644
--- a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -1,4 +1,4 @@
-From bf1603b3d73f64de777be00f7e55f2cfef596102 Mon Sep 17 00:00:00 2001
+From ce4e796fa8bd2df962cf7a0e4bc69ab6181e4ebf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:55:12 -0700
 Subject: [PATCH] nativesdk-glibc: Make relocatable install for locales
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 8 insertions(+), 7 deletions(-)
 
 diff --git a/locale/findlocale.c b/locale/findlocale.c
-index 5986373edd..856ba9afc0 100644
+index fc433b61d8..d6f030f13c 100644
 --- a/locale/findlocale.c
 +++ b/locale/findlocale.c
 @@ -55,7 +55,7 @@ struct __locale_data *const _nl_C[] attribute_hidden =
@@ -41,7 +41,7 @@ index 5986373edd..856ba9afc0 100644
    else
      /* We really have to load some data.  First see whether the name is
 diff --git a/locale/loadarchive.c b/locale/loadarchive.c
-index 512769eaec..436619091b 100644
+index fcc4913319..62cae8c6c0 100644
 --- a/locale/loadarchive.c
 +++ b/locale/loadarchive.c
 @@ -42,7 +42,7 @@
@@ -54,10 +54,10 @@ index 512769eaec..436619091b 100644
  /* Size of initial mapping window, optimal if large enough to
     cover the header plus the initial locale.  */
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index b3d4da0185..22f9dc1140 100644
+index fd43033a19..3dc26272a0 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
-@@ -331,7 +331,7 @@ _nl_lookup_word (locale_t l, int category, int item)
+@@ -347,7 +347,7 @@ _nl_lookup_word (locale_t l, int category, int item)
  }
  
  /* Default search path if no LOCPATH environment variable.  */
@@ -67,7 +67,7 @@ index b3d4da0185..22f9dc1140 100644
  /* Load the locale data for CATEGORY from the file specified by *NAME.
     If *NAME is "", use environment variables as specified by POSIX, and
 diff --git a/locale/programs/locale.c b/locale/programs/locale.c
-index e9275d6b83..a9109155e5 100644
+index 1b51b50d68..87c9049444 100644
 --- a/locale/programs/locale.c
 +++ b/locale/programs/locale.c
 @@ -631,6 +631,7 @@ nameentcmp (const void *a, const void *b)
diff --git a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch b/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
index a47dd5331a5..4d080726f8f 100644
--- a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
+++ b/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
@@ -1,4 +1,4 @@
-From 78b2e81940561069faf7698931a033784f794e40 Mon Sep 17 00:00:00 2001
+From 95508f06f13604ed96f28d18eb1670ea1ed02063 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 6 Mar 2021 14:48:56 -0800
 Subject: [PATCH] nativesdk-glibc: Fall back to faccessat on faccess2 returns
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/sysdeps/unix/sysv/linux/faccessat.c b/sysdeps/unix/sysv/linux/faccessat.c
-index 13160d3249..ee3ddc9b79 100644
+index 1378bb2db8..19f2044172 100644
 --- a/sysdeps/unix/sysv/linux/faccessat.c
 +++ b/sysdeps/unix/sysv/linux/faccessat.c
 @@ -30,7 +30,11 @@ __faccessat (int fd, const char *file, int mode, int flag)
diff --git a/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
index 77644a2ee31..6b80ad3e64e 100644
--- a/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,4 +1,4 @@
-From f6e96a95212bc1fef57b9594a7dddc0c20639873 Mon Sep 17 00:00:00 2001
+From 07655aaa14f9d1f3a521caadde2936067ce84b07 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
 Subject: [PATCH] 'yes' within the path sets wrong config variables
@@ -29,10 +29,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  12 files changed, 28 insertions(+), 28 deletions(-)
 
 diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
-index 4c1fac49f3..597314f476 100644
+index bf972122b1..f9397b8d6e 100644
 --- a/sysdeps/aarch64/configure
 +++ b/sysdeps/aarch64/configure
-@@ -157,12 +157,12 @@ else
+@@ -152,12 +152,12 @@ else
    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  #ifdef __AARCH64EB__
@@ -48,10 +48,10 @@ index 4c1fac49f3..597314f476 100644
  else
    libc_cv_aarch64_be=no
 diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
-index 3347c13fa1..4af163c0b6 100644
+index 51253d9802..ba36a0e8b4 100644
 --- a/sysdeps/aarch64/configure.ac
 +++ b/sysdeps/aarch64/configure.ac
-@@ -17,8 +17,8 @@ AC_DEFINE(SUPPORT_STATIC_PIE)
+@@ -13,8 +13,8 @@ AC_DEFINE(SUPPORT_STATIC_PIE)
  # the dynamic linker via %ifdef.
  AC_CACHE_CHECK([for big endian],
    [libc_cv_aarch64_be],
@@ -63,10 +63,10 @@ index 3347c13fa1..4af163c0b6 100644
    ], libc_cv_aarch64_be=yes, libc_cv_aarch64_be=no)])
  if test $libc_cv_aarch64_be = yes; then
 diff --git a/sysdeps/arm/configure b/sysdeps/arm/configure
-index 431e843b2b..e152461138 100644
+index 5b0237e521..969fc9fe95 100644
 --- a/sysdeps/arm/configure
 +++ b/sysdeps/arm/configure
-@@ -151,12 +151,12 @@ else
+@@ -148,12 +148,12 @@ else
    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  #ifdef __ARM_PCS_VFP
@@ -82,10 +82,10 @@ index 431e843b2b..e152461138 100644
  else
    libc_cv_arm_pcs_vfp=no
 diff --git a/sysdeps/arm/configure.ac b/sysdeps/arm/configure.ac
-index 90cdd69c75..05a262ba00 100644
+index 5172e30bbe..f06dedd7c5 100644
 --- a/sysdeps/arm/configure.ac
 +++ b/sysdeps/arm/configure.ac
-@@ -15,8 +15,8 @@ AC_DEFINE(PI_STATIC_AND_HIDDEN)
+@@ -10,8 +10,8 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
  # the dynamic linker via %ifdef.
  AC_CACHE_CHECK([whether the compiler is using the ARM hard-float ABI],
    [libc_cv_arm_pcs_vfp],
@@ -97,10 +97,10 @@ index 90cdd69c75..05a262ba00 100644
    ], libc_cv_arm_pcs_vfp=yes, libc_cv_arm_pcs_vfp=no)])
  if test $libc_cv_arm_pcs_vfp = yes; then
 diff --git a/sysdeps/mips/configure b/sysdeps/mips/configure
-index 4e13248c03..f14af952d0 100644
+index 3f4d9e9759..888453c70b 100644
 --- a/sysdeps/mips/configure
 +++ b/sysdeps/mips/configure
-@@ -143,11 +143,11 @@ else
+@@ -145,11 +145,11 @@ else
  /* end confdefs.h.  */
  dnl
  #ifdef __mips_nan2008
@@ -115,11 +115,11 @@ index 4e13248c03..f14af952d0 100644
  else
    libc_cv_mips_nan2008=no
 diff --git a/sysdeps/mips/configure.ac b/sysdeps/mips/configure.ac
-index bcbdaffd9f..ad3057f4cc 100644
+index d3cd780d78..250223d206 100644
 --- a/sysdeps/mips/configure.ac
 +++ b/sysdeps/mips/configure.ac
 @@ -6,9 +6,9 @@ dnl position independent way.
- dnl AC_DEFINE(PI_STATIC_AND_HIDDEN)
+ AC_DEFINE(HIDDEN_VAR_NEEDS_DYNAMIC_RELOC)
  
  AC_CACHE_CHECK([whether the compiler is using the 2008 NaN encoding],
 -  libc_cv_mips_nan2008, [AC_EGREP_CPP(yes, [dnl
@@ -131,7 +131,7 @@ index bcbdaffd9f..ad3057f4cc 100644
  if test x$libc_cv_mips_nan2008 = xyes; then
    AC_DEFINE(HAVE_MIPS_NAN2008)
 diff --git a/sysdeps/nios2/configure b/sysdeps/nios2/configure
-index 14c8a3a014..dde3814ef2 100644
+index b3cd28349e..f47e5a5adc 100644
 --- a/sysdeps/nios2/configure
 +++ b/sysdeps/nios2/configure
 @@ -142,12 +142,12 @@ else
@@ -150,7 +150,7 @@ index 14c8a3a014..dde3814ef2 100644
  else
    libc_cv_nios2_be=no
 diff --git a/sysdeps/nios2/configure.ac b/sysdeps/nios2/configure.ac
-index f05f43802b..dc8639902d 100644
+index f738e9a7ed..4085851cbc 100644
 --- a/sysdeps/nios2/configure.ac
 +++ b/sysdeps/nios2/configure.ac
 @@ -4,8 +4,8 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
diff --git a/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
index 295fa315d89..ba8696d6542 100644
--- a/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,4 +1,4 @@
-From d6300e80c7c010fa7ca33e36e826151558cec498 Mon Sep 17 00:00:00 2001
+From 9373891f13f3550f9b3f896c34ac152efd369ca9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
 Subject: [PATCH] eglibc: Cross building and testing instructions
diff --git a/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
index 9e00da894db..1f6ff1f1fab 100644
--- a/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,4 +1,4 @@
-From 1c8044544d2cbdc529910a3ed6eba4b0ce7ae549 Mon Sep 17 00:00:00 2001
+From 7f2fd574646cb5ecbbc09372a2d8580ab72ec158 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
 Subject: [PATCH] eglibc: Help bootstrap cross toolchain
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 include/stubs-bootstrap.h
 
 diff --git a/Makefile b/Makefile
-index a49870d3d1..81673d7645 100644
+index 179dd478ff..55cfb740bf 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -79,9 +79,18 @@ subdir-dirs = include
@@ -52,7 +52,7 @@ index a49870d3d1..81673d7645 100644
  ifeq (yes,$(build-shared))
  headers += gnu/lib-names.h
  endif
-@@ -420,6 +429,16 @@ others: $(common-objpfx)testrun.sh $(common-objpfx)debugglibc.sh
+@@ -421,6 +430,16 @@ others: $(common-objpfx)testrun.sh $(common-objpfx)debugglibc.sh
  
  subdir-stubs := $(foreach dir,$(subdirs),$(common-objpfx)$(dir)/stubs)
  
@@ -69,7 +69,7 @@ index a49870d3d1..81673d7645 100644
  ifndef abi-variants
  installed-stubs = $(inst_includedir)/gnu/stubs.h
  else
-@@ -446,6 +465,7 @@ $(inst_includedir)/gnu/stubs.h: $(+force)
+@@ -447,6 +466,7 @@ $(inst_includedir)/gnu/stubs.h: $(+force)
  
  install-others-nosubdir: $(installed-stubs)
  endif
diff --git a/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
index 03c81bfbd77..399e14faf41 100644
--- a/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,4 +1,4 @@
-From e5999ffd1b8690c2902a6406c07f51023a6bf7ec Mon Sep 17 00:00:00 2001
+From 9f1803a2f91d59a9478ca4d8d93e1de5c62671e5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
 Subject: [PATCH] eglibc: Resolve __fpscr_values on SH4
@@ -33,7 +33,7 @@ index 9c734ff755..974e33b4b1 100644
      # a*
      alphasort64;
 diff --git a/sysdeps/unix/sysv/linux/sh/sysdep.S b/sysdeps/unix/sysv/linux/sh/sysdep.S
-index a18fbb2e8b..59421bfbb0 100644
+index c5e3a7a365..35120031c4 100644
 --- a/sysdeps/unix/sysv/linux/sh/sysdep.S
 +++ b/sysdeps/unix/sysv/linux/sh/sysdep.S
 @@ -30,3 +30,14 @@ ENTRY (__syscall_error)
diff --git a/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
index 48bb062e09a..7d891557bf1 100644
--- a/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,4 +1,4 @@
-From 99ae3189430eaa5472b2117e5a999109a6ca9251 Mon Sep 17 00:00:00 2001
+From 2c6449014151a4bcd4b253b2acc920f0b3d6b13f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
 Subject: [PATCH] eglibc: Forward port cross locale generation support
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 locale/catnames.c
 
 diff --git a/locale/Makefile b/locale/Makefile
-index b7c60681fa..07c606cde3 100644
+index eb55750496..b0461ac4b9 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
 @@ -26,7 +26,8 @@ headers		= langinfo.h locale.h bits/locale.h \
@@ -89,10 +89,10 @@ index 0000000000..538f3f5edb
 +    [LC_ALL] = sizeof ("LC_ALL") - 1
 +  };
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index 22f9dc1140..fa31b3c5ea 100644
+index 3dc26272a0..b667d32c23 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
-@@ -230,7 +230,7 @@ __libc_tsd_define (extern, locale_t, LOCALE)
+@@ -246,7 +246,7 @@ __libc_tsd_define (extern, locale_t, LOCALE)
     unused.  We can manage this playing some tricks with weak references.
     But with thread-local locale settings, it becomes quite ungainly unless
     we can use __thread variables.  So only in that case do we attempt this.  */
@@ -102,7 +102,7 @@ index 22f9dc1140..fa31b3c5ea 100644
  # define NL_CURRENT_INDIRECT	1
  #endif
 diff --git a/locale/programs/charmap-dir.c b/locale/programs/charmap-dir.c
-index 4841bfd05d..ffcba1fd79 100644
+index 396a0d76c0..91f4a765ee 100644
 --- a/locale/programs/charmap-dir.c
 +++ b/locale/programs/charmap-dir.c
 @@ -18,7 +18,9 @@
@@ -148,7 +148,7 @@ index 4841bfd05d..ffcba1fd79 100644
    return NULL;
  }
 diff --git a/locale/programs/ld-collate.c b/locale/programs/ld-collate.c
-index 06a5203334..84b3ff4166 100644
+index 992814491d..da4dde4663 100644
 --- a/locale/programs/ld-collate.c
 +++ b/locale/programs/ld-collate.c
 @@ -352,7 +352,7 @@ new_element (struct locale_collate_t *collate, const char *mbs, size_t mbslen,
@@ -160,7 +160,7 @@ index 06a5203334..84b3ff4166 100644
        uint32_t zero = 0;
        /* Handle <U0000> as a single character.  */
        if (nwcs == 0)
-@@ -1783,8 +1783,7 @@ symbol `%s' has the same encoding as"), (*eptr)->name);
+@@ -1776,8 +1776,7 @@ symbol `%s' has the same encoding as"), (*eptr)->name);
  
  	      if ((*eptr)->nwcs == runp->nwcs)
  		{
@@ -170,7 +170,7 @@ index 06a5203334..84b3ff4166 100644
  
  		  if (c == 0)
  		    {
-@@ -2011,9 +2010,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
+@@ -2004,9 +2003,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
  	     one consecutive entry.  */
  	  if (runp->wcnext != NULL
  	      && runp->nwcs == runp->wcnext->nwcs
@@ -183,7 +183,7 @@ index 06a5203334..84b3ff4166 100644
  	      && (runp->wcs[runp->nwcs - 1]
  		  == runp->wcnext->wcs[runp->nwcs - 1] + 1))
  	    {
-@@ -2037,9 +2036,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
+@@ -2030,9 +2029,9 @@ add_to_tablewc (uint32_t ch, struct element_t *runp)
  		runp = runp->wcnext;
  	      while (runp->wcnext != NULL
  		     && runp->nwcs == runp->wcnext->nwcs
@@ -197,7 +197,7 @@ index 06a5203334..84b3ff4166 100644
  			 == runp->wcnext->wcs[runp->nwcs - 1] + 1));
  
 diff --git a/locale/programs/ld-ctype.c b/locale/programs/ld-ctype.c
-index 07b64ac5a1..70b49ab733 100644
+index c6749dbd82..ac99777925 100644
 --- a/locale/programs/ld-ctype.c
 +++ b/locale/programs/ld-ctype.c
 @@ -914,7 +914,7 @@ ctype_output (struct localedef_t *locale, const struct charmap_t *charmap,
@@ -229,7 +229,7 @@ index 07b64ac5a1..70b49ab733 100644
  	  handle_digits = 1;
  	  goto read_charclass;
  
-@@ -3903,8 +3903,7 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
+@@ -3876,8 +3876,7 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
  
  	  while (idx < number)
  	    {
@@ -239,7 +239,7 @@ index 07b64ac5a1..70b49ab733 100644
  	      if (res == 0)
  		{
  		  replace = 1;
-@@ -3941,11 +3940,11 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
+@@ -3914,11 +3913,11 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
        for (size_t cnt = 0; cnt < number; ++cnt)
  	{
  	  struct translit_to_t *srunp;
@@ -253,7 +253,7 @@ index 07b64ac5a1..70b49ab733 100644
  	      srunp = srunp->next;
  	    }
  	  /* Plus one for the extra NUL character marking the end of
-@@ -3969,18 +3968,18 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
+@@ -3942,18 +3941,18 @@ allocate_arrays (struct locale_ctype_t *ctype, const struct charmap_t *charmap,
  	  ctype->translit_from_idx[cnt] = from_len;
  	  ctype->translit_to_idx[cnt] = to_len;
  
@@ -279,7 +279,7 @@ index 07b64ac5a1..70b49ab733 100644
  	      srunp = srunp->next;
  	    }
 diff --git a/locale/programs/ld-time.c b/locale/programs/ld-time.c
-index e6f320d2b3..c6631ad101 100644
+index b58fecfcee..a4d70e0780 100644
 --- a/locale/programs/ld-time.c
 +++ b/locale/programs/ld-time.c
 @@ -219,8 +219,10 @@ No definition for %s category found"), "LC_TIME");
@@ -348,20 +348,20 @@ index e6f320d2b3..c6631ad101 100644
  
  
 diff --git a/locale/programs/linereader.c b/locale/programs/linereader.c
-index a1f22b28ed..cbd3b40ceb 100644
+index 0460074a0c..31a7151f66 100644
 --- a/locale/programs/linereader.c
 +++ b/locale/programs/linereader.c
-@@ -594,7 +594,7 @@ get_string (struct linereader *lr, const struct charmap_t *charmap,
+@@ -776,7 +776,7 @@ get_string (struct linereader *lr, const struct charmap_t *charmap,
  {
    int return_widestr = lr->return_widestr;
-   char *buf;
+   struct lr_buffer lrb;
 -  wchar_t *buf2 = NULL;
 +  uint32_t *buf2 = NULL;
-   size_t bufact;
-   size_t bufmax = 56;
+ 
+   lr_buffer_init (&lrb);
  
 diff --git a/locale/programs/localedef.c b/locale/programs/localedef.c
-index f0da25e9e5..5d9e01cda2 100644
+index 35a092a111..94712bf114 100644
 --- a/locale/programs/localedef.c
 +++ b/locale/programs/localedef.c
 @@ -108,6 +108,7 @@ void (*argp_program_version_hook) (FILE *, struct argp_state *) = print_version;
@@ -407,7 +407,7 @@ index f0da25e9e5..5d9e01cda2 100644
        force_output = 1;
        break;
 diff --git a/locale/programs/locfile.c b/locale/programs/locfile.c
-index 1427b518a9..dafa84a20b 100644
+index 8fa74dce60..8d5aca6d9e 100644
 --- a/locale/programs/locfile.c
 +++ b/locale/programs/locfile.c
 @@ -543,6 +543,9 @@ compare_files (const char *filename1, const char *filename2, size_t size,
@@ -430,7 +430,7 @@ index 1427b518a9..dafa84a20b 100644
  
  /* Record that FILE's next element is the 32-bit integer VALUE.  */
 diff --git a/locale/programs/locfile.h b/locale/programs/locfile.h
-index cbc20fe88d..ae88e6d0af 100644
+index 57b2211e2f..e9498c6c7e 100644
 --- a/locale/programs/locfile.h
 +++ b/locale/programs/locfile.h
 @@ -70,6 +70,8 @@ extern void write_all_categories (struct localedef_t *definitions,
@@ -519,7 +519,7 @@ index cbc20fe88d..ae88e6d0af 100644
 +
  #endif /* locfile.h */
 diff --git a/locale/setlocale.c b/locale/setlocale.c
-index 19ed85ae8e..f28ca11446 100644
+index 56c14d8533..6aac00503e 100644
 --- a/locale/setlocale.c
 +++ b/locale/setlocale.c
 @@ -63,35 +63,6 @@ static char *const _nl_current_used[] =
diff --git a/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch b/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
index eae1ee89074..c47025af3b0 100644
--- a/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
+++ b/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
@@ -1,4 +1,4 @@
-From 32c2e23ad29f63f57f544daf1a59259147cd1008 Mon Sep 17 00:00:00 2001
+From 8ebf6708ba54147b44f5638b93f123fd55d4c37e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:42:06 -0700
 Subject: [PATCH] localedef --add-to-archive uses a hard-coded locale path
@@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/locale/programs/locarchive.c b/locale/programs/locarchive.c
-index 477499bd40..fe7b5ff60c 100644
+index eeb2fa6ffe..15274b0191 100644
 --- a/locale/programs/locarchive.c
 +++ b/locale/programs/locarchive.c
 @@ -339,12 +339,24 @@ enlarge_archive (struct locarhandle *ah, const struct locarhead *head)
diff --git a/meta/recipes-core/glibc/glibc/0016-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch b/meta/recipes-core/glibc/glibc/0015-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
similarity index 93%
rename from meta/recipes-core/glibc/glibc/0016-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
rename to meta/recipes-core/glibc/glibc/0015-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
index 4e51036ce58..933fa0eb3f5 100644
--- a/meta/recipes-core/glibc/glibc/0016-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
+++ b/meta/recipes-core/glibc/glibc/0015-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
@@ -1,4 +1,4 @@
-From c59bc6eb421ad3310c43951a11d2561bbf34e95e Mon Sep 17 00:00:00 2001
+From bd2b87eaa2e99310f5439df95bea12a48dc978bf Mon Sep 17 00:00:00 2001
 From: Martin Jansa <martin.jansa@gmail.com>
 Date: Mon, 17 Dec 2018 21:36:18 +0000
 Subject: [PATCH] locale: prevent maybe-uninitialized errors with -Os [BZ
@@ -33,7 +33,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/locale/weight.h b/locale/weight.h
-index 076529c0ba..2ac83657f7 100644
+index 8be2d220f8..4a4d5aa6b2 100644
 --- a/locale/weight.h
 +++ b/locale/weight.h
 @@ -27,7 +27,14 @@ findidx (const int32_t *table,
@@ -46,7 +46,7 @@ index 076529c0ba..2ac83657f7 100644
 +     as described in comments in locale/weightwc.h.  */
 +  DIAG_PUSH_NEEDS_COMMENT;
 +  DIAG_IGNORE_Os_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
-   int_fast32_t i = table[*(*cpp)++];
+   int32_t i = table[*(*cpp)++];
 +  DIAG_POP_NEEDS_COMMENT;
    const unsigned char *cp;
    const unsigned char *usrc;
diff --git a/meta/recipes-core/glibc/glibc/0017-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch b/meta/recipes-core/glibc/glibc/0016-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
similarity index 89%
rename from meta/recipes-core/glibc/glibc/0017-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
rename to meta/recipes-core/glibc/glibc/0016-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
index 77a2bab87db..f45951ae2ce 100644
--- a/meta/recipes-core/glibc/glibc/0017-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
+++ b/meta/recipes-core/glibc/glibc/0016-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
@@ -1,4 +1,4 @@
-From 9f4fcec5662bfa6f8aa6a36dda6f4c05f6e30e51 Mon Sep 17 00:00:00 2001
+From 58dd1336c1c32716f4f0938bf18f2ddfbe9305ca Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:11:22 +0000
 Subject: [PATCH] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known names
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/elf/readlib.c b/elf/readlib.c
-index 64b20d7804..50318158fb 100644
+index ed42fbd48e..777f6c80be 100644
 --- a/elf/readlib.c
 +++ b/elf/readlib.c
 @@ -49,6 +49,7 @@ static struct known_names interpreters[] =
diff --git a/meta/recipes-core/glibc/glibc/0019-powerpc-Do-not-ask-compiler-for-finding-arch.patch b/meta/recipes-core/glibc/glibc/0017-powerpc-Do-not-ask-compiler-for-finding-arch.patch
similarity index 96%
rename from meta/recipes-core/glibc/glibc/0019-powerpc-Do-not-ask-compiler-for-finding-arch.patch
rename to meta/recipes-core/glibc/glibc/0017-powerpc-Do-not-ask-compiler-for-finding-arch.patch
index 4313c6860fc..cb6f7dc3d05 100644
--- a/meta/recipes-core/glibc/glibc/0019-powerpc-Do-not-ask-compiler-for-finding-arch.patch
+++ b/meta/recipes-core/glibc/glibc/0017-powerpc-Do-not-ask-compiler-for-finding-arch.patch
@@ -1,4 +1,4 @@
-From eb44466ec976d800bb697b10775efa28f22ec216 Mon Sep 17 00:00:00 2001
+From 93c5b86fae5e42e148e5182466eb0ac26298159c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Aug 2020 14:31:16 -0700
 Subject: [PATCH] powerpc: Do not ask compiler for finding arch
diff --git a/meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index 3b2d638b5fe..996471a5202 100644
--- a/meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -1,7 +1,7 @@
-From 4d6bce6b106d9d9a629aadba74d74cd8a500ccbf Mon Sep 17 00:00:00 2001
+From e2dba281429384cc22a73a58eaf79459e64be266 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 May 2020 17:05:45 -0700
-Subject: [PATCH 18/24] wordsize.h: Unify the header between arm and aarch64
+Subject: [PATCH] wordsize.h: Unify the header between arm and aarch64
 
 This helps OE multilibs to not sythesize this header which causes all
 kind of recursions and other issues since wordsize is fundamental header
@@ -11,10 +11,10 @@ Upstream-Status: Inappropriate [ OE-Specific ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sysdeps/aarch64/bits/wordsize.h          |  8 ++++++--
- sysdeps/{aarch64 => arm}/bits/wordsize.h | 10 +++++++---
- 2 files changed, 13 insertions(+), 5 deletions(-)
- copy sysdeps/{aarch64 => arm}/bits/wordsize.h (80%)
+ sysdeps/aarch64/bits/wordsize.h          | 8 ++++++--
+ sysdeps/{aarch64 => arm}/bits/wordsize.h | 8 ++++++--
+ 2 files changed, 12 insertions(+), 4 deletions(-)
+ copy sysdeps/{aarch64 => arm}/bits/wordsize.h (85%)
 
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/aarch64/bits/wordsize.h
 index 4635431f0e..5ef0ed21f3 100644
@@ -40,10 +40,10 @@ index 4635431f0e..5ef0ed21f3 100644
  
  #define __WORDSIZE_TIME64_COMPAT32	0
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
-similarity index 80%
+similarity index 85%
 copy from sysdeps/aarch64/bits/wordsize.h
 copy to sysdeps/arm/bits/wordsize.h
-index 4635431f0e..34fcdef1f1 100644
+index 4635431f0e..5ef0ed21f3 100644
 --- a/sysdeps/aarch64/bits/wordsize.h
 +++ b/sysdeps/arm/bits/wordsize.h
 @@ -17,12 +17,16 @@
@@ -65,6 +65,3 @@ index 4635431f0e..34fcdef1f1 100644
  #endif
  
  #define __WORDSIZE_TIME64_COMPAT32	0
--- 
-2.34.1
-
diff --git a/meta/recipes-core/glibc/glibc/0021-Replace-echo-with-printf-builtin-in-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0019-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
similarity index 91%
rename from meta/recipes-core/glibc/glibc/0021-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
rename to meta/recipes-core/glibc/glibc/0019-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
index 42c498bbc88..5181cfec610 100644
--- a/meta/recipes-core/glibc/glibc/0021-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0019-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
@@ -1,4 +1,4 @@
-From 77fbd98f551d5b2cd338aa7f524e5ed980edb65e Mon Sep 17 00:00:00 2001
+From 97a71e1dd07ba6721464150b03fd67823b6271e2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
 Subject: [PATCH] Replace echo with printf builtin in nscd init script
@@ -8,7 +8,7 @@ since it uses bash specific extentions namely (translated strings)
 and echo -n command, replace echo with printf and
 switch the shell interpreter to #!/bin/sh.
 
-Upstream-Status: Submitted [https://patchwork.sourceware.org/project/glibc/patch/20211209203557.1318333-1-raj.khem@gmail.com/]
+Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-core/glibc/glibc/0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch b/meta/recipes-core/glibc/glibc/0020-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
similarity index 84%
rename from meta/recipes-core/glibc/glibc/0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
rename to meta/recipes-core/glibc/glibc/0020-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
index 5ac9d6d3a13..396f33216db 100644
--- a/meta/recipes-core/glibc/glibc/0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
+++ b/meta/recipes-core/glibc/glibc/0020-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
@@ -1,11 +1,12 @@
-From 5d1384d86fc44404ca32c6fda2d46ec357337c91 Mon Sep 17 00:00:00 2001
+From 3b5b6079512af8af50d0a43d4c1c218f5ba1b302 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
-Subject: [PATCH] sysdeps/gnu/configure.ac: Set libc_cv_rootsbindir only if its empty
+Subject: [PATCH] sysdeps/gnu/configure.ac: Set libc_cv_rootsbindir only if its
+ empty
 
 This ensures that it can be set in build environment
 
-Upstream-Status: Submitted [https://patchwork.sourceware.org/project/glibc/patch/20211209203557.1318333-2-raj.khem@gmail.com/]
+Upstream-Status: Pending
 Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-core/glibc/glibc/0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch b/meta/recipes-core/glibc/glibc/0021-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
similarity index 80%
rename from meta/recipes-core/glibc/glibc/0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
rename to meta/recipes-core/glibc/glibc/0021-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
index e5e6ceba60c..2f4e92dffad 100644
--- a/meta/recipes-core/glibc/glibc/0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
+++ b/meta/recipes-core/glibc/glibc/0021-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
@@ -1,4 +1,4 @@
-From c0f251c58655e3377fe1c67a026c21ef68d2abcf Mon Sep 17 00:00:00 2001
+From 8d5ff7357354394b958321204b75e3855781aefe Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 9 Dec 2021 15:14:42 -0800
 Subject: [PATCH] timezone: Make shell interpreter overridable in tzselect.ksh
@@ -6,7 +6,7 @@ Subject: [PATCH] timezone: Make shell interpreter overridable in tzselect.ksh
 define new macro called KSHELL which can be used to define default shell
 use Bash by default
 
-Upstream-Status: Submitted [https://patchwork.sourceware.org/project/glibc/patch/20211209234015.1554552-1-raj.khem@gmail.com/]
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Makeconfig        | 9 +++++++++
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 10 insertions(+)
 
 diff --git a/Makeconfig b/Makeconfig
-index 775bf12b65..7b9a8f0a94 100644
+index ba70321af1..4b643768d9 100644
 --- a/Makeconfig
 +++ b/Makeconfig
 @@ -293,6 +293,15 @@ ifndef sysincludedir
@@ -34,10 +34,10 @@ index 775bf12b65..7b9a8f0a94 100644
  # Commands to install files.
  ifndef INSTALL_DATA
 diff --git a/timezone/Makefile b/timezone/Makefile
-index c624a189b3..dc8f5277de 100644
+index a789c22d26..3e69409a94 100644
 --- a/timezone/Makefile
 +++ b/timezone/Makefile
-@@ -127,6 +127,7 @@ $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
+@@ -134,6 +134,7 @@ $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
  	    -e '/TZVERSION=/s|see_Makefile|"$(version)"|' \
  	    -e '/PKGVERSION=/s|=.*|="$(PKGVERSION)"|' \
  	    -e '/REPORT_BUGS_TO=/s|=.*|="$(REPORT_BUGS_TO)"|' \
diff --git a/meta/recipes-core/glibc/glibc/0022-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch b/meta/recipes-core/glibc/glibc/0022-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
new file mode 100644
index 00000000000..c409327f955
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0022-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
@@ -0,0 +1,27 @@
+From ba1365f19ccc8378f2fcff892721187537479884 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 15 Dec 2021 21:47:53 -0800
+Subject: [PATCH] tzselect.ksh: Use /bin/sh default shell interpreter
+
+checkbashism reports no issues with tzselect.ksh, therefore using
+/bin/sh instead of /bin/bash should be safe and portable across systems
+which don't ship bash ( embedded systems )
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Cc: Paul Eggert <eggert@cs.ucla.edu>
+---
+ timezone/tzselect.ksh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/timezone/tzselect.ksh b/timezone/tzselect.ksh
+index 18fce27e24..cc08efb0fb 100755
+--- a/timezone/tzselect.ksh
++++ b/timezone/tzselect.ksh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ # Ask the user about the time zone, and output the resulting TZ value to stdout.
+ # Interact with the user via stderr and stdin.
+ 
diff --git a/meta/recipes-core/glibc/glibc/0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
similarity index 96%
rename from meta/recipes-core/glibc/glibc/0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
rename to meta/recipes-core/glibc/glibc/0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
index b431ea168d8..7b0965f6bd0 100644
--- a/meta/recipes-core/glibc/glibc/0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
+++ b/meta/recipes-core/glibc/glibc/0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
@@ -1,4 +1,4 @@
-From 6609858239b8f94e12c19eac0cec425511d1211f Mon Sep 17 00:00:00 2001
+From ffbb37732807e180b14a21d1bf79ad5038252c02 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sun, 29 Aug 2021 20:49:16 +0800
 Subject: [PATCH] fix create thread failed in unprivileged process [BZ #28287]
@@ -66,6 +66,7 @@ patch
 [2] https://sourceware.org/pipermail/libc-alpha/2021-August/130590.html
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  sysdeps/unix/sysv/linux/clone-internal.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -83,6 +84,3 @@ index a71effcbd3..a0569113aa 100644
      return ret;
  
    /* NB: Restore errno since errno may be checked against non-zero
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/reproducible-paths.patch b/meta/recipes-core/glibc/glibc/0024-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
similarity index 50%
rename from meta/recipes-core/glibc/glibc/reproducible-paths.patch
rename to meta/recipes-core/glibc/glibc/0024-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
index 0754dca62b0..7983d1f6a71 100644
--- a/meta/recipes-core/glibc/glibc/reproducible-paths.patch
+++ b/meta/recipes-core/glibc/glibc/0024-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
@@ -1,14 +1,23 @@
-Avoid hardcoded build time paths in the output binaries by replacing the compile
-definitions with the output locations.
+From f873e25e29684cbbf7b141d9c6ee725268505c29 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Sun, 24 Jul 2022 07:07:29 -0700
+Subject: [PATCH] Avoid hardcoded build time paths in the output binaries
+
+replace the compile definitions with the output locations.
 
 Upstream-Status: Inappropriate [would need reworking somehow to be acceptable upstream]
+
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ support/Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
-Index: git/support/Makefile
-===================================================================
---- git.orig/support/Makefile
-+++ git/support/Makefile
-@@ -216,9 +216,9 @@ libsupport-inhibit-o += .o
+diff --git a/support/Makefile b/support/Makefile
+index 9b50eac117..4c24d9f61a 100644
+--- a/support/Makefile
++++ b/support/Makefile
+@@ -218,9 +218,9 @@ libsupport-inhibit-o += .o
  endif
  
  CFLAGS-support_paths.c = \
diff --git a/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch b/meta/recipes-core/glibc/glibc/0025-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
similarity index 97%
rename from meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
rename to meta/recipes-core/glibc/glibc/0025-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
index 2421a636055..19825983399 100644
--- a/meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
+++ b/meta/recipes-core/glibc/glibc/0025-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
@@ -1,13 +1,13 @@
-From 6b8959add09e425df262bf9178b39ca35bc4003c Mon Sep 17 00:00:00 2001
+From 18b04419d5984f5c6c89fab5e72fcdd1942491cb Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 24 Jul 2022 19:41:41 +0200
+Date: Sun, 7 Aug 2022 12:51:48 +0200
 Subject: [PATCH] Revert "Linux: Implement a useful version of _startup_fatal"
 
-This reverts commit 2d05ba7f8ef979947e910a37ae8115a816eb4d08.
+This reverts commit a2a6bce7d7e52c1c34369a7da62c501cc350bc31.
+
 Upstream-Status: Inappropriate [temporary work around]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
 ---
  sysdeps/unix/sysv/linux/i386/startup.h | 23 ++++++++++++---
  sysdeps/unix/sysv/linux/ia64/startup.h | 22 ---------------
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.36.bb
similarity index 87%
rename from meta/recipes-core/glibc/glibc_2.35.bb
rename to meta/recipes-core/glibc/glibc_2.36.bb
index df847e76bff..c64b65db3e3 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.36.bb
@@ -40,16 +40,17 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0012-eglibc-Resolve-__fpscr_values-on-SH4.patch \
            file://0013-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
-           file://0016-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
-           file://0017-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
+           file://0015-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
+           file://0016-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
+           file://0017-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
            file://0018-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
-           file://0019-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
-           file://0021-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
-           file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
-           file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
-           file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
-           \
-           file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
+           file://0019-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
+           file://0020-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
+           file://0021-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
+           file://0022-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
+           file://0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
+           file://0024-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
+           file://0025-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.37.1


