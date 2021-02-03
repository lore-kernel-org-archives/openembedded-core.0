Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.938.1612378807413132541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 11:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u3w45arQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id o20so442880pfu.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 11:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wKv1ThNx/7jCEUux0Gnk3AZDuO8/fUuOTnS4CAhyfcE=;
        b=u3w45arQR8g/3R0NwGW1Y/rGbGEUjQZhgK6GpC6W1LPqErT8hgvo1BDwO8JxhnYM+S
         M81GV201sGjGz8OLpe8QNvTbBMmAml2GpJSjEsltdda4VobKd6jOUMAIxJPSbdb4jb9o
         kW7WklKW2w4KKjpalukJnOSroEFRIhoADx3mxCxAvs5WiO4VETUQJdBGTSWM4wLlF/xC
         kYgTqz4p0TK7fDoNoXCVJBG1zc/q15VZLsFJdXFb68qp38nmisVZTG1l6kcwDDLyGRH+
         iu4HG2mqTVfgcx+Uo/sjneM1TdHdbKlJC7/qdZEfOuojlAykky6GdcFRl+0/zLHDeU33
         Vhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wKv1ThNx/7jCEUux0Gnk3AZDuO8/fUuOTnS4CAhyfcE=;
        b=gNW9hOwPqnsHt4SGSmLOgaGm26uhzcIpN+xACDldPiUH+1/ZEl62dYfYX4am60d1Db
         51ekafeAJSaSLpf3/gnrkmoCilyZ4DJrKAyFsGfxBgb15xfMXBcGQ4uR+MCe8gq6On5I
         kGE2sNQ9E3uMdYItQNZNdO+0p++Ka7T3s07pXd7rQU9n4cogADfv07q6fPp8l9p+vyf9
         cT3EZkUPhvvh/CAo3SNVCzU0dpfvJncQc9ACPhqaouW9fcHGIN/xwcRq/2LPrt6pTHG3
         3wCHNInwY25omuzFNuOQTnThszfOtXduWJ/hbu4gy655eREnYrd3BD2jcq/B7UxUuXqK
         z4ag==
X-Gm-Message-State: AOAM533rwY2cagPP1Cp8SjeSZkQ1/bjyMenq0oUim4628QuzuHpVeToX
	uaTro/DDKcT6USILRTxPYA2VELiR+kEnrQ==
X-Google-Smtp-Source: ABdhPJwB2ZpGpANvt8BtKRL+vj8IdCxHe0WHeMerQRBRGrFqfRKb5vyb3J+zmtGGIur8Gzf1XY/spQ==
X-Received: by 2002:a05:6a00:158b:b029:1d1:f9c9:84ca with SMTP id u11-20020a056a00158bb02901d1f9c984camr3144942pfk.46.1612378804098;
        Wed, 03 Feb 2021 11:00:04 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2914])
        by smtp.gmail.com with ESMTPSA id z2sm3661321pgl.49.2021.02.03.11.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 11:00:02 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2] glibc: Upgrade to 2.33
Date: Wed,  3 Feb 2021 10:59:59 -0800
Message-Id: <20210203185959.1372087-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop backported patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 ...2.32.bb => cross-localedef-native_2.33.bb} |   0
 meta/recipes-core/glibc/glibc-common.inc      |   2 +-
 ...bc-locale_2.32.bb => glibc-locale_2.33.bb} |   0
 ...bc-mtrace_2.32.bb => glibc-mtrace_2.33.bb} |   0
 ...-scripts_2.32.bb => glibc-scripts_2.33.bb} |   0
 ...tsuite_2.32.bb => glibc-testsuite_2.33.bb} |   0
 meta/recipes-core/glibc/glibc-version.inc     |   6 +-
 ...dd-hardlink-resolver-from-util-linux.patch |   7 +-
 ...-fix-ups-hardlink-to-make-it-compile.patch |   7 +-
 ...Look-for-host-system-ld.so.cache-as-.patch |  22 +--
 ...Fix-buffer-overrun-with-a-relocated-.patch |  12 +-
 ...Raise-the-size-of-arrays-containing-.patch |  88 +++++-----
 ...k-glibc-Allow-64-bit-atomics-for-x86.patch |  13 +-
 ...Make-relocatable-install-for-locales.patch |  15 +-
 ...5500-e6500-603e-fsqrt-implementation.patch |   7 +-
 ...undefined-reference-to-__sqrt_finite.patch |   7 +-
 ...-are-now-inline-functions-and-call-o.patch |   9 +-
 ...443-which-explains-what-the-patch-do.patch |  10 +-
 ...m-err-tab.pl-with-specific-dirs-in-S.patch |   9 +-
 ...-are-now-inline-functions-and-call-o.patch |   9 +-
 ...igure.ac-handle-correctly-libc_cv_ro.patch |   7 +-
 ...the-path-sets-wrong-config-variables.patch |  19 +--
 ...zone-re-written-tzselect-as-posix-sh.patch |  11 +-
 ...bash-dependency-for-nscd-init-script.patch |   7 +-
 ...ss-building-and-testing-instructions.patch |   7 +-
 ...glibc-Help-bootstrap-cross-toolchain.patch |  13 +-
 ...eglibc-Resolve-__fpscr_values-on-SH4.patch |   9 +-
 ...port-cross-locale-generation-support.patch |  29 ++--
 ...Define-DUMMY_LOCALE_T-if-not-defined.patch |   9 +-
 ...-archive-uses-a-hard-coded-locale-pa.patch |  10 +-
 ...ke-_dl_build_local_scope-breadth-fir.patch |   9 +-
 ...it-no-lines-in-bison-generated-files.patch |   9 +-
 ...aybe-uninitialized-errors-with-Os-BZ.patch |   9 +-
 ...RE_KNOWN_INTERPRETER_NAMES-to-known-.patch |  10 +-
 ...y-the-header-between-arm-and-aarch64.patch |  29 ++--
 ...Do-not-ask-compiler-for-finding-arch.patch |   7 +-
 ...-adjtime-with-NULL-argument-BZ-26833.patch | 110 -------------
 .../glibc/glibc/CVE-2019-25013.patch          | 137 ----------------
 .../glibc/glibc/CVE-2020-27618.patch          |  91 ----------
 .../glibc/glibc/CVE-2020-29562.patch          | 155 ------------------
 .../glibc/glibc/CVE-2020-29573.patch          |  56 -------
 .../glibc/{glibc_2.32.bb => glibc_2.33.bb}    |   5 -
 43 files changed, 175 insertions(+), 798 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.32.bb => cross-localedef-native_2.33.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-locale_2.32.bb => glibc-locale_2.33.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.32.bb => glibc-mtrace_2.33.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.32.bb => glibc-scripts_2.33.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-testsuite_2.32.bb => glibc-testsuite_2.33.bb} (100%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0031-linux-Allow-adjtime-with-NULL-argument-BZ-26833.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-27618.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-29562.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-29573.patch
 rename meta/recipes-core/glibc/{glibc_2.32.bb => glibc_2.33.bb} (95%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index ba6e360b30..8df328dc0d 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -20,7 +20,7 @@ GCCVERSION ?= "10.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.36%"
 GDBVERSION ?= "10.%"
-GLIBCVERSION ?= "2.32"
+GLIBCVERSION ?= "2.33"
 LINUXLIBCVERSION ?= "5.10%"
 QEMUVERSION ?= "5.2%"
 GOVERSION ?= "1.15%"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.32.bb b/meta/recipes-core/glibc/cross-localedef-native_2.33.bb
similarity index 100%
rename from meta/recipes-core/glibc/cross-localedef-native_2.32.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.33.bb
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index 027c700998..41ff7e9a19 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -22,4 +22,4 @@ ARM_INSTRUCTION_SET_armv6 = "arm"
 #
 COMPATIBLE_HOST_libc-musl_class-target = "null"
 
-PV = "2.32"
+PV = "2.33"
diff --git a/meta/recipes-core/glibc/glibc-locale_2.32.bb b/meta/recipes-core/glibc/glibc-locale_2.33.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.32.bb
rename to meta/recipes-core/glibc/glibc-locale_2.33.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.32.bb b/meta/recipes-core/glibc/glibc-mtrace_2.33.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.32.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.33.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.32.bb b/meta/recipes-core/glibc/glibc-scripts_2.33.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.32.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.33.bb
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.32.bb b/meta/recipes-core/glibc/glibc-testsuite_2.33.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-testsuite_2.32.bb
rename to meta/recipes-core/glibc/glibc-testsuite_2.33.bb
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 1566056297..3a95173175 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
-SRCBRANCH ?= "release/2.32/master"
-PV = "2.32"
-SRCREV_glibc ?= "3de512be7ea6053255afed6154db9ee31d4e557a"
+SRCBRANCH ?= "release/2.33/master"
+PV = "2.33"
+SRCREV_glibc ?= "9826b03b747b841f5fc6de2054bf1ef3f5c4bdf3"
 SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
index e0ec1887dc..f96da83a9b 100644
--- a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
+++ b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
@@ -1,7 +1,7 @@
-From 5db90855621a81d02f1434d5602cefea8c45de1c Mon Sep 17 00:00:00 2001
+From d1f1671034a222417f9a829dcaa4f0c3d4f8954d Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 09:59:22 -0800
-Subject: [PATCH 01/29] localedef: Add hardlink resolver from util-linux
+Subject: [PATCH] localedef: Add hardlink resolver from util-linux
 
 The hard link resolver that is built into localedef cannot be run in
 parallel.  It will search sibling directories (which are be processed
@@ -1128,6 +1128,3 @@ index 0000000000..0129a85e2e
 +}
 +
 +#endif
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
index 05b76803b4..3dc4582f47 100644
--- a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
+++ b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
@@ -1,7 +1,7 @@
-From ab022ce3c1c01fd6c850f541a33efd0cacabe052 Mon Sep 17 00:00:00 2001
+From 14d256e2db009f8bac9a265e8393d7ed25050df9 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 10:01:37 -0800
-Subject: [PATCH 02/29] localedef: fix-ups hardlink to make it compile
+Subject: [PATCH] localedef: fix-ups hardlink to make it compile
 
 Upstream-Status: Pending
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
@@ -236,6 +236,3 @@ index 63615896b0..726e6dd948 100644
  				}
  				continue;
  			}
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index 743994f2db..c4718a106f 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,8 +1,7 @@
-From de4322ef6d4dc9fc3ee9b69af1c10edbc64a66a3 Mon Sep 17 00:00:00 2001
+From 32a4b8ae046fe4bb1b19f61378d079d44deaede7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:48:24 +0000
-Subject: [PATCH 03/29] nativesdk-glibc: Look for host system ld.so.cache as
- well
+Subject: [PATCH] nativesdk-glibc: Look for host system ld.so.cache as well
 
 Upstream-Status: Inappropriate [embedded specific]
 
@@ -31,10 +30,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index e39980fb19..565b039b23 100644
+index 9e2089cfaa..ad01674027 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -2160,6 +2160,14 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2175,6 +2175,14 @@ _dl_map_object (struct link_map *loader, const char *name,
              }
          }
  
@@ -42,14 +41,14 @@ index e39980fb19..565b039b23 100644
 +      if (fd == -1
 +	  && ((l = loader ?: GL(dl_ns)[nsid]._ns_loaded) == NULL
 +	   || __builtin_expect (!(l->l_flags_1 & DF_1_NODEFLIB), 1))
-+	 && rtld_search_dirs.dirs != (void *) -1)
-+	fd = open_path (name, namelen, mode & __RTLD_SECURE, &rtld_search_dirs,
++	 && __rtld_search_dirs.dirs != (void *) -1)
++	fd = open_path (name, namelen, mode & __RTLD_SECURE, &__rtld_search_dirs,
 +			&realname, &fb, l, LA_SER_DEFAULT, &found_other_class);
 +      /* Finally try ld.so.cache */
  #ifdef USE_LDCONFIG
        if (fd == -1
  	  && (__glibc_likely ((mode & __RTLD_SECURE) == 0)
-@@ -2218,14 +2226,6 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2233,14 +2241,6 @@ _dl_map_object (struct link_map *loader, const char *name,
  	}
  #endif
  
@@ -57,13 +56,10 @@ index e39980fb19..565b039b23 100644
 -      if (fd == -1
 -	  && ((l = loader ?: GL(dl_ns)[nsid]._ns_loaded) == NULL
 -	      || __glibc_likely (!(l->l_flags_1 & DF_1_NODEFLIB)))
--	  && rtld_search_dirs.dirs != (void *) -1)
--	fd = open_path (name, namelen, mode, &rtld_search_dirs,
+-	  && __rtld_search_dirs.dirs != (void *) -1)
+-	fd = open_path (name, namelen, mode, &__rtld_search_dirs,
 -			&realname, &fb, l, LA_SER_DEFAULT, &found_other_class);
 -
        /* Add another newline when we are tracing the library loading.  */
        if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_LIBS))
  	_dl_debug_printf ("\n");
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index a3b5b7750c..a8e625d24c 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,8 +1,7 @@
-From 258c44e4ecffd830cb89d0016d45b2bac765f559 Mon Sep 17 00:00:00 2001
+From aa8393bff257e4badfd208b88473ead175c69362 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
-Subject: [PATCH 04/29] nativesdk-glibc: Fix buffer overrun with a relocated
- SDK
+Subject: [PATCH] nativesdk-glibc: Fix buffer overrun with a relocated SDK
 
 When ld-linux-*.so.2 is relocated to a path that is longer than the
 original fixed location, the dynamic loader will crash in open_path
@@ -22,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 565b039b23..e1b3486549 100644
+index ad01674027..f455207e79 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -1860,7 +1860,19 @@ open_path (const char *name, size_t namelen, int mode,
+@@ -1871,7 +1871,19 @@ open_path (const char *name, size_t namelen, int mode,
         given on the command line when rtld is run directly.  */
      return -1;
  
@@ -45,6 +44,3 @@ index 565b039b23..e1b3486549 100644
    do
      {
        struct r_search_path_elem *this_dir = *dirs;
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index 2073576aac..197caae921 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,8 +1,7 @@
-From 19cd858f5f04a6ac584fbd89a2fbc51791263b85 Mon Sep 17 00:00:00 2001
+From 3ea08e491a8494ff03e598b5e0fc2d8131e75da9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
-Subject: [PATCH 05/29] nativesdk-glibc: Raise the size of arrays containing dl
- paths
+Subject: [PATCH] nativesdk-glibc: Raise the size of arrays containing dl paths
 
 This patch puts the dynamic loader path in the binaries, SYSTEM_DIRS strings
 and lengths as well as ld.so.cache path in the dynamic loader to specific
@@ -18,20 +17,21 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  elf/dl-cache.c             | 4 ++++
  elf/dl-load.c              | 4 ++--
+ elf/dl-usage.c             | 6 ++++--
  elf/interp.c               | 2 +-
  elf/ldconfig.c             | 3 +++
- elf/rtld.c                 | 5 +++--
+ elf/rtld.c                 | 1 +
  iconv/gconv_conf.c         | 2 +-
  sysdeps/generic/dl-cache.h | 4 ----
- 7 files changed, 14 insertions(+), 10 deletions(-)
+ 8 files changed, 16 insertions(+), 10 deletions(-)
 
 diff --git a/elf/dl-cache.c b/elf/dl-cache.c
-index 93d185e788..e115b18756 100644
+index 32f3bef5ea..71f3a82dc0 100644
 --- a/elf/dl-cache.c
 +++ b/elf/dl-cache.c
-@@ -133,6 +133,10 @@ do									      \
- while (0)
- 
+@@ -359,6 +359,10 @@ search_cache (const char *string_table, uint32_t string_table_size,
+   return best;
+ }
  
 +const char LD_SO_CACHE[4096] __attribute__ ((section (".ldsocache"))) =
 +		SYSCONFDIR "/ld.so.cache";
@@ -41,10 +41,10 @@ index 93d185e788..e115b18756 100644
  _dl_cache_libcmp (const char *p1, const char *p2)
  {
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index e1b3486549..5226d0c4fa 100644
+index f455207e79..a144e24fcf 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -111,8 +111,8 @@ static size_t max_capstrlen attribute_relro;
+@@ -115,8 +115,8 @@ enum { ncapstr = 1, max_capstrlen = 0 };
     gen-trusted-dirs.awk.  */
  #include "trusted-dirs.h"
  
@@ -55,8 +55,39 @@ index e1b3486549..5226d0c4fa 100644
  {
    SYSTEM_DIRS_LEN
  };
+diff --git a/elf/dl-usage.c b/elf/dl-usage.c
+index 6e26818bd7..f09e8b93e5 100644
+--- a/elf/dl-usage.c
++++ b/elf/dl-usage.c
+@@ -25,6 +25,8 @@
+ #include <dl-procinfo.h>
+ #include <dl-hwcaps.h>
+ 
++extern const char LD_SO_CACHE[4096] __attribute__ ((section (".ldsocache")));
++
+ void
+ _dl_usage (const char *argv0, const char *wrong_option)
+ {
+@@ -244,7 +246,7 @@ setting environment variables (which would be inherited by subprocesses).\n\
+   --list                list all dependencies and how they are resolved\n\
+   --verify              verify that given object really is a dynamically linked\n\
+                         object we can handle\n\
+-  --inhibit-cache       Do not use " LD_SO_CACHE "\n\
++  --inhibit-cache       Do not use %s\n\
+   --library-path PATH   use given PATH instead of content of the environment\n\
+                         variable LD_LIBRARY_PATH\n\
+   --glibc-hwcaps-prepend LIST\n\
+@@ -266,7 +268,7 @@ setting environment variables (which would be inherited by subprocesses).\n\
+ \n\
+ This program interpreter self-identifies as: " RTLD "\n\
+ ",
+-              argv0);
++              argv0, LD_SO_CACHE);
+   print_search_path_for_help (state);
+   print_hwcaps_subdirectories (state);
+   print_legacy_hwcap_directories ();
 diff --git a/elf/interp.c b/elf/interp.c
-index 331cc1df48..885b2d9476 100644
+index 91966702ca..dc86c20e83 100644
 --- a/elf/interp.c
 +++ b/elf/interp.c
 @@ -18,5 +18,5 @@
@@ -67,10 +98,10 @@ index 331cc1df48..885b2d9476 100644
 +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
    = RUNTIME_LINKER;
 diff --git a/elf/ldconfig.c b/elf/ldconfig.c
-index 0c090dca15..6bb6e0fe72 100644
+index 28ed637a29..5d38a60c5d 100644
 --- a/elf/ldconfig.c
 +++ b/elf/ldconfig.c
-@@ -171,6 +171,9 @@ static struct argp argp =
+@@ -176,6 +176,9 @@ static struct argp argp =
    options, parse_opt, NULL, doc, NULL, more_help, NULL
  };
  
@@ -81,10 +112,10 @@ index 0c090dca15..6bb6e0fe72 100644
     a platform.  */
  static int
 diff --git a/elf/rtld.c b/elf/rtld.c
-index 5b882163fa..db407b5d8b 100644
+index 596b6ac3d9..1ccd33f668 100644
 --- a/elf/rtld.c
 +++ b/elf/rtld.c
-@@ -217,6 +217,7 @@ dso_name_valid_for_suid (const char *p)
+@@ -185,6 +185,7 @@ dso_name_valid_for_suid (const char *p)
      }
    return *p != '\0';
  }
@@ -92,24 +123,8 @@ index 5b882163fa..db407b5d8b 100644
  
  static void
  audit_list_init (struct audit_list *list)
-@@ -1286,13 +1287,13 @@ of this helper program; chances are you did not intend to run this program.\n\
-   --list                list all dependencies and how they are resolved\n\
-   --verify              verify that given object really is a dynamically linked\n\
- 			object we can handle\n\
--  --inhibit-cache       Do not use " LD_SO_CACHE "\n\
-+  --inhibit-cache       Do not use %s\n\
-   --library-path PATH   use given PATH instead of content of the environment\n\
- 			variable LD_LIBRARY_PATH\n\
-   --inhibit-rpath LIST  ignore RUNPATH and RPATH information in object names\n\
- 			in LIST\n\
-   --audit LIST          use objects named in LIST as auditors\n\
--  --preload LIST        preload objects named in LIST\n");
-+  --preload LIST        preload objects named in LIST\n", LD_SO_CACHE);
- 
-       ++_dl_skip_args;
-       --_dl_argc;
 diff --git a/iconv/gconv_conf.c b/iconv/gconv_conf.c
-index 735bd1f2d5..25100ba666 100644
+index 682f949834..7eed87bc9d 100644
 --- a/iconv/gconv_conf.c
 +++ b/iconv/gconv_conf.c
 @@ -36,7 +36,7 @@
@@ -122,10 +137,10 @@ index 735bd1f2d5..25100ba666 100644
  /* Type to represent search path.  */
  struct path_elem
 diff --git a/sysdeps/generic/dl-cache.h b/sysdeps/generic/dl-cache.h
-index 6b310e9e15..3877311df4 100644
+index 964d50a486..94bf68ca9d 100644
 --- a/sysdeps/generic/dl-cache.h
 +++ b/sysdeps/generic/dl-cache.h
-@@ -27,10 +27,6 @@
+@@ -34,10 +34,6 @@
    ((flags) == 1 || (flags) == _DL_CACHE_DEFAULT_ID)
  #endif
  
@@ -136,6 +151,3 @@ index 6b310e9e15..3877311df4 100644
  #ifndef add_system_dir
  # define add_system_dir(dir) add_dir (dir)
  #endif
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index 372dca727e..172ade8d97 100644
--- a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -1,7 +1,7 @@
-From bd0486cab67c3441210aed48caab67418610a765 Mon Sep 17 00:00:00 2001
+From 19e3e45eb1838ee80af13c3d27fcff446773211e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:35:35 -0800
-Subject: [PATCH 06/29] nativesdk-glibc: Allow 64 bit atomics for x86
+Subject: [PATCH] nativesdk-glibc: Allow 64 bit atomics for x86
 
 The fix consist of allowing 64bit atomic ops for x86.
 This should be safe for i586 and newer CPUs.
@@ -17,11 +17,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/sysdeps/x86/atomic-machine.h b/sysdeps/x86/atomic-machine.h
-index bb49648374..aa08d3c0a7 100644
+index 695222e4fa..9d39bfdbd5 100644
 --- a/sysdeps/x86/atomic-machine.h
 +++ b/sysdeps/x86/atomic-machine.h
-@@ -58,15 +58,14 @@ typedef uintmax_t uatomic_max_t;
- #endif
+@@ -52,15 +52,14 @@ typedef uintmax_t uatomic_max_t;
+ #define LOCK_PREFIX "lock;"
  
  #define USE_ATOMIC_COMPILER_BUILTINS	1
 +# define __HAVE_64B_ATOMICS		1
@@ -37,6 +37,3 @@ index bb49648374..aa08d3c0a7 100644
  # define SP_REG				"esp"
  # define SEG_REG			"gs"
  # define BR_CONSTRAINT			"r"
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index 729ce1b42d..14697567c2 100644
--- a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -1,7 +1,7 @@
-From 9a8bf11ea375a2fe5eddb30bc10943e64d3b96a4 Mon Sep 17 00:00:00 2001
+From 732d4f4954fe60718870048d0583a20a7a8a8540 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:55:12 -0700
-Subject: [PATCH 07/29] nativesdk-glibc: Make relocatable install for locales
+Subject: [PATCH] nativesdk-glibc: Make relocatable install for locales
 
 The glibc locale path is hard-coded to the install prefix, but in SDKs we need
 to be able to relocate the binaries.  Expand the strings to 4K and put them in a
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 8 insertions(+), 7 deletions(-)
 
 diff --git a/locale/findlocale.c b/locale/findlocale.c
-index 9cd3b71a6d..84272310e0 100644
+index ab09122b0c..f42cc75780 100644
 --- a/locale/findlocale.c
 +++ b/locale/findlocale.c
 @@ -56,7 +56,7 @@ struct __locale_data *const _nl_C[] attribute_hidden =
@@ -41,7 +41,7 @@ index 9cd3b71a6d..84272310e0 100644
    else
      /* We really have to load some data.  First see whether the name is
 diff --git a/locale/loadarchive.c b/locale/loadarchive.c
-index ba0fe45648..9737fd4cda 100644
+index 4177fc8972..40247b1e68 100644
 --- a/locale/loadarchive.c
 +++ b/locale/loadarchive.c
 @@ -42,7 +42,7 @@
@@ -54,7 +54,7 @@ index ba0fe45648..9737fd4cda 100644
  /* Size of initial mapping window, optimal if large enough to
     cover the header plus the initial locale.  */
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index 1bfe22aa7f..fdc283c69a 100644
+index b3d4da0185..22f9dc1140 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
 @@ -331,7 +331,7 @@ _nl_lookup_word (locale_t l, int category, int item)
@@ -67,7 +67,7 @@ index 1bfe22aa7f..fdc283c69a 100644
  /* Load the locale data for CATEGORY from the file specified by *NAME.
     If *NAME is "", use environment variables as specified by POSIX, and
 diff --git a/locale/programs/locale.c b/locale/programs/locale.c
-index e2e309c2a1..61a92cdcd1 100644
+index 575b208e82..5ec630c3a4 100644
 --- a/locale/programs/locale.c
 +++ b/locale/programs/locale.c
 @@ -632,6 +632,7 @@ nameentcmp (const void *a, const void *b)
@@ -98,6 +98,3 @@ index e2e309c2a1..61a92cdcd1 100644
  
  	  locrec = (struct locrecent *) (addr + names[cnt].locrec_offset);
  
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch b/meta/recipes-core/glibc/glibc/0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
index 5e3b3e2d7b..2162bf38c2 100644
--- a/meta/recipes-core/glibc/glibc/0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
+++ b/meta/recipes-core/glibc/glibc/0008-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
@@ -1,7 +1,7 @@
-From 59b0a78ae706a540dbd8905bc97c875220d6aeb2 Mon Sep 17 00:00:00 2001
+From 3d58330390a7d4f4ed32f4a9c25628af3e0dd5c1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:01:50 +0000
-Subject: [PATCH 08/29] fsl e500/e5500/e6500/603e fsqrt implementation
+Subject: [PATCH] fsl e500/e5500/e6500/603e fsqrt implementation
 
 Upstream-Status: Pending
 Signed-off-by: Edmar Wienskoski <edmar@freescale.com>
@@ -1579,6 +1579,3 @@ index 0000000000..04ff8cc181
 +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc64/e6500/fpu
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0009-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch b/meta/recipes-core/glibc/glibc/0009-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
index a94ed207f5..0c8bf94a75 100644
--- a/meta/recipes-core/glibc/glibc/0009-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
+++ b/meta/recipes-core/glibc/glibc/0009-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
@@ -1,7 +1,7 @@
-From 78f67f016ca9e3f7a37af86cf6e400cf17cf1d05 Mon Sep 17 00:00:00 2001
+From 3b5fe5b1a7390cde0f07351415e3891f62d1f7e0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:15:07 +0000
-Subject: [PATCH 09/29] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
+Subject: [PATCH] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
 
 on ppc fixes the errors like below
 | ./.libs/libpulsecore-1.1.so: undefined reference to `__sqrt_finite'
@@ -203,6 +203,3 @@ index 26fa067abf..9d175122a8 100644
    return f_washf (b);
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0010-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0010-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index 743bea1433..cadaa0b2e2 100644
--- a/meta/recipes-core/glibc/glibc/0010-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0010-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,8 +1,8 @@
-From 670b5d70ab62b42ab02a8e18b8fcee2879b8c4a0 Mon Sep 17 00:00:00 2001
+From 6b6e1dcd707017598ea3bdc2d91a761943b62218 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:16:38 +0000
-Subject: [PATCH 10/29] __ieee754_sqrt{,f} are now inline functions and call
- out __slow versions
+Subject: [PATCH] __ieee754_sqrt{,f} are now inline functions and call out
+ __slow versions
 
 Upstream-Status: Pending
 
@@ -382,6 +382,3 @@ index 9d175122a8..10de1f0cc3 100644
 +}
 +
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0011-Quote-from-bug-1443-which-explains-what-the-patch-do.patch b/meta/recipes-core/glibc/glibc/0011-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
index a9280b7c34..e4c78b5c79 100644
--- a/meta/recipes-core/glibc/glibc/0011-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
+++ b/meta/recipes-core/glibc/glibc/0011-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
@@ -1,8 +1,7 @@
-From de7a7c04a92dbc5d35cb37e47c471e12784cc95e Mon Sep 17 00:00:00 2001
+From 297bac9429260f8df495b81d3fae8ae4c6913f5f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:20:09 +0000
-Subject: [PATCH 11/29] Quote from bug 1443 which explains what the patch does
- :
+Subject: [PATCH] Quote from bug 1443 which explains what the patch does :
 
   We build some random program and link it with -lust.  When we run it,
   it dies with a SIGSEGV before reaching main().
@@ -45,7 +44,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sysdeps/arm/dl-machine.h b/sysdeps/arm/dl-machine.h
-index 90856779b1..a29bb86c56 100644
+index ff5e09e207..d68bfe5cbe 100644
 --- a/sysdeps/arm/dl-machine.h
 +++ b/sysdeps/arm/dl-machine.h
 @@ -510,7 +510,7 @@ elf_machine_rel (struct link_map *map, const Elf32_Rel *reloc,
@@ -57,6 +56,3 @@ index 90856779b1..a29bb86c56 100644
  	  break;
  
  	case R_ARM_TLS_TPOFF32:
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0012-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/glibc/glibc/0012-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
index ab07455ade..c5e8e6473a 100644
--- a/meta/recipes-core/glibc/glibc/0012-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
+++ b/meta/recipes-core/glibc/glibc/0012-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
@@ -1,7 +1,7 @@
-From c8807899367e64d803585e7dd4b56a1085d5893b Mon Sep 17 00:00:00 2001
+From f389babf3c920e68b7d7391556a78ebf62a21ebe Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Wed, 19 Dec 2012 04:39:57 -0600
-Subject: [PATCH 12/29] eglibc: run libm-err-tab.pl with specific dirs in ${S}
+Subject: [PATCH] eglibc: run libm-err-tab.pl with specific dirs in ${S}
 
 libm-err-tab.pl will parse all the files named "libm-test-ulps"
 in the given dir recursively. To avoid parsing the one in
@@ -18,7 +18,7 @@ Signed-off-by: Ting Liu <b28495@freescale.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/manual/Makefile b/manual/Makefile
-index c61e11dcd7..5d859e6f84 100644
+index e83444341e..aa2645bc55 100644
 --- a/manual/Makefile
 +++ b/manual/Makefile
 @@ -103,7 +103,8 @@ $(objpfx)stamp-libm-err: $(..)math/gen-libm-test.py \
@@ -31,6 +31,3 @@ index c61e11dcd7..5d859e6f84 100644
  	$(move-if-change) $(objpfx)libm-err-tmp $(objpfx)libm-err.texi
  	touch $@
  
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0013-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0013-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index d875825ff9..7f362cace0 100644
--- a/meta/recipes-core/glibc/glibc/0013-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0013-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,8 +1,8 @@
-From 86fea3409b89f9d8884053a519282f2f30d7ea87 Mon Sep 17 00:00:00 2001
+From 4b0d41a315e66f688fef7b0c2e2b6ce9fa16ec93 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:24:46 +0000
-Subject: [PATCH 13/29] __ieee754_sqrt{,f} are now inline functions and call
- out __slow versions
+Subject: [PATCH] __ieee754_sqrt{,f} are now inline functions and call out
+ __slow versions
 
 Upstream-Status: Pending
 
@@ -56,6 +56,3 @@ index 812653558f..10de1f0cc3 100644
       float b;
  #endif
  {
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0014-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch b/meta/recipes-core/glibc/glibc/0014-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
index 954534bae2..4da0e003c0 100644
--- a/meta/recipes-core/glibc/glibc/0014-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
+++ b/meta/recipes-core/glibc/glibc/0014-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
@@ -1,7 +1,7 @@
-From a3c4f67fb3cb02855073a9cdbcf2881fb53144f0 Mon Sep 17 00:00:00 2001
+From c062a462fee53a30a85d693c8288b5bd8fe4ec6e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
-Subject: [PATCH 14/29] sysdeps/gnu/configure.ac: handle correctly
+Subject: [PATCH] sysdeps/gnu/configure.ac: handle correctly
  $libc_cv_rootsbindir
 
 Upstream-Status:Pending
@@ -37,6 +37,3 @@ index 634fe4de2a..3db1697f4f 100644
 +  test -n "$libc_cv_rootsbindir" || libc_cv_rootsbindir=/sbin
    ;;
  esac
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
index 04a9bf01c4..15e83f8917 100644
--- a/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,7 +1,7 @@
-From 17a602b89cbe53a5a92d0153ccb013a737f028cb Mon Sep 17 00:00:00 2001
+From 0bd39d8907953f18e01742f42b24647ac7689d0a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
-Subject: [PATCH 15/29] 'yes' within the path sets wrong config variables
+Subject: [PATCH] 'yes' within the path sets wrong config variables
 
 It seems that the 'AC_EGREP_CPP(yes...' example is quite popular
 but being such a short word to grep it is likely to produce
@@ -29,10 +29,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  12 files changed, 28 insertions(+), 28 deletions(-)
 
 diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
-index ac3cf6fd36..32add94df9 100644
+index 83c3a23e44..a68c946277 100644
 --- a/sysdeps/aarch64/configure
 +++ b/sysdeps/aarch64/configure
-@@ -148,12 +148,12 @@ else
+@@ -157,12 +157,12 @@ else
    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  #ifdef __AARCH64EB__
@@ -48,10 +48,10 @@ index ac3cf6fd36..32add94df9 100644
  else
    libc_cv_aarch64_be=no
 diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
-index 8b042d6d05..3cdd262951 100644
+index 66f755078a..a32b265bbe 100644
 --- a/sysdeps/aarch64/configure.ac
 +++ b/sysdeps/aarch64/configure.ac
-@@ -10,8 +10,8 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
+@@ -17,8 +17,8 @@ AC_DEFINE(SUPPORT_STATIC_PIE)
  # the dynamic linker via %ifdef.
  AC_CACHE_CHECK([for big endian],
    [libc_cv_aarch64_be],
@@ -165,7 +165,7 @@ index f05f43802b..dc8639902d 100644
    ], libc_cv_nios2_be=yes, libc_cv_nios2_be=no)])
  if test $libc_cv_nios2_be = yes; then
 diff --git a/sysdeps/unix/sysv/linux/mips/configure b/sysdeps/unix/sysv/linux/mips/configure
-index 25f98e0c7b..e95bfae359 100644
+index f25f2a3a65..1b7483e6c6 100644
 --- a/sysdeps/unix/sysv/linux/mips/configure
 +++ b/sysdeps/unix/sysv/linux/mips/configure
 @@ -414,11 +414,11 @@ else
@@ -183,7 +183,7 @@ index 25f98e0c7b..e95bfae359 100644
  else
    libc_cv_mips_nan2008=no
 diff --git a/sysdeps/unix/sysv/linux/mips/configure.ac b/sysdeps/unix/sysv/linux/mips/configure.ac
-index 3db1b32b08..f8cd375ebc 100644
+index 049a0f4bdf..005526d4e8 100644
 --- a/sysdeps/unix/sysv/linux/mips/configure.ac
 +++ b/sysdeps/unix/sysv/linux/mips/configure.ac
 @@ -105,9 +105,9 @@ AC_COMPILE_IFELSE(
@@ -258,6 +258,3 @@ index f9cba6e15d..b21f72f1e4 100644
                         #endif
      ], libc_cv_ppc64_def_call_elf=yes, libc_cv_ppc64_def_call_elf=no)])
    if test $libc_cv_ppc64_def_call_elf = no; then
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch b/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
index cd072018e5..79bd704153 100644
--- a/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
+++ b/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
@@ -1,7 +1,7 @@
-From 4762386b599f5c3287310a69ad3555e0129e0c51 Mon Sep 17 00:00:00 2001
+From 3feb4213628f1485000ffe1d3fd26e37a7b14336 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:33:03 +0000
-Subject: [PATCH 16/29] timezone: re-written tzselect as posix sh
+Subject: [PATCH] timezone: re-written tzselect as posix sh
 
 To avoid the bash dependency.
 
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/timezone/Makefile b/timezone/Makefile
-index 75f38df527..74e1ab7ff7 100644
+index 395abfeebd..2d939edf75 100644
 --- a/timezone/Makefile
 +++ b/timezone/Makefile
-@@ -122,7 +122,7 @@ $(testdata)/XT%: testdata/XT%
+@@ -123,7 +123,7 @@ $(testdata)/XT%: testdata/XT%
  	cp $< $@
  
  $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
@@ -40,6 +40,3 @@ index 18fce27e24..70745f9d36 100755
  
  # Output one argument as-is to standard output.
  # Safer than 'echo', which can mishandle '\' or leading '-'.
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
index 57907fe660..c32d70b593 100644
--- a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
@@ -1,7 +1,7 @@
-From dac46c07736a799fc82be03aa546b2d24c19ad78 Mon Sep 17 00:00:00 2001
+From f6119b98a9caa80642d69a97edc98f57ecef5c3c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
-Subject: [PATCH 17/29] Remove bash dependency for nscd init script
+Subject: [PATCH] Remove bash dependency for nscd init script
 
 The nscd init script uses #! /bin/bash but only really uses one bashism
 (translated strings), so remove them and switch the shell to #!/bin/sh.
@@ -70,6 +70,3 @@ index a882da7d8b..b02986ec15 100644
  	RETVAL=1
  	;;
  esac
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
index 58d41ffe04..826e5af465 100644
--- a/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,7 +1,7 @@
-From 0bd1dedf77194151397c53b12e0355c2edb8bccc Mon Sep 17 00:00:00 2001
+From 060ba13b5ac5e90517d540f009ebdcdcf62f9685 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
-Subject: [PATCH 18/29] eglibc: Cross building and testing instructions
+Subject: [PATCH] eglibc: Cross building and testing instructions
 
 Ported from eglibc
 Upstream-Status: Pending
@@ -614,6 +614,3 @@ index 0000000000..b67b468466
 +- Some tests require access to libstdc++.so.6 and libgcc_s.so.1; we
 +  simply place copies of these libraries in the top GLIBC build
 +  directory.
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
index f633079f34..afac2e04f6 100644
--- a/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,7 +1,7 @@
-From 5591b7653411da26fa2939352e50ea4121b327e6 Mon Sep 17 00:00:00 2001
+From f13c2f525e9bc82ce13e4cf486f7fe0831fc3fac Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
-Subject: [PATCH 19/29] eglibc: Help bootstrap cross toolchain
+Subject: [PATCH] eglibc: Help bootstrap cross toolchain
 
 Taken from EGLIBC, r1484 + r1525
 
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 include/stubs-bootstrap.h
 
 diff --git a/Makefile b/Makefile
-index 6dcfe40c25..bc37c32e5a 100644
+index 50f99ca611..31eed15f02 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -79,9 +79,18 @@ subdir-dirs = include
@@ -52,7 +52,7 @@ index 6dcfe40c25..bc37c32e5a 100644
  ifeq (yes,$(build-shared))
  headers += gnu/lib-names.h
  endif
-@@ -407,6 +416,16 @@ others: $(common-objpfx)testrun.sh $(common-objpfx)debugglibc.sh
+@@ -416,6 +425,16 @@ others: $(common-objpfx)testrun.sh $(common-objpfx)debugglibc.sh
  
  subdir-stubs := $(foreach dir,$(subdirs),$(common-objpfx)$(dir)/stubs)
  
@@ -69,7 +69,7 @@ index 6dcfe40c25..bc37c32e5a 100644
  ifndef abi-variants
  installed-stubs = $(inst_includedir)/gnu/stubs.h
  else
-@@ -433,6 +452,7 @@ $(inst_includedir)/gnu/stubs.h: $(+force)
+@@ -442,6 +461,7 @@ $(inst_includedir)/gnu/stubs.h: $(+force)
  
  install-others-nosubdir: $(installed-stubs)
  endif
@@ -95,6 +95,3 @@ index 0000000000..1d2b669aff
 +   difficult headers.  The <gnu/stubs.h> header depends, via the
 +   EGLIBC subdir 'stubs' make targets, on every .o file in EGLIBC, but
 +   an empty stubs.h like this will do fine for GCC.  */
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
index bb21c54721..9a610c6703 100644
--- a/meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,7 +1,7 @@
-From d3451c186f96c6b2434a4ac9304c01730bf22061 Mon Sep 17 00:00:00 2001
+From 330c4e50e28e29c31fb8d6ab39cdbb2af4d3def7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
-Subject: [PATCH 20/29] eglibc: Resolve __fpscr_values on SH4
+Subject: [PATCH] eglibc: Resolve __fpscr_values on SH4
 
 2010-09-29  Nobuhiro Iwamatsu  <iwamatsu@nigauri.org>
             Andrew Stubbs  <ams@codesourcery.com>
@@ -33,7 +33,7 @@ index e0938c4165..ca1d7da339 100644
      # a*
      alphasort64;
 diff --git a/sysdeps/unix/sysv/linux/sh/sysdep.S b/sysdeps/unix/sysv/linux/sh/sysdep.S
-index 85ff3f900e..7743b8d57a 100644
+index a18fbb2e8b..59421bfbb0 100644
 --- a/sysdeps/unix/sysv/linux/sh/sysdep.S
 +++ b/sysdeps/unix/sysv/linux/sh/sysdep.S
 @@ -30,3 +30,14 @@ ENTRY (__syscall_error)
@@ -51,6 +51,3 @@ index 85ff3f900e..7743b8d57a 100644
 +       .long 0x80000
 +weak_alias (___fpscr_values, __fpscr_values)
 +
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0021-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0021-eglibc-Forward-port-cross-locale-generation-support.patch
index 7fe5db0c2a..0b2f020fdd 100644
--- a/meta/recipes-core/glibc/glibc/0021-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0021-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,7 +1,7 @@
-From e4b8abdc2d884d721fd89d67b689546f2f780924 Mon Sep 17 00:00:00 2001
+From 557ed640b26bd208ce8d4a6fd725b124893668d7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
-Subject: [PATCH 21/29] eglibc: Forward port cross locale generation support
+Subject: [PATCH] eglibc: Forward port cross locale generation support
 
 Upstream-Status: Pending
 
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 locale/catnames.c
 
 diff --git a/locale/Makefile b/locale/Makefile
-index 49c0c78c7d..ebfcf4f4da 100644
+index b7c60681fa..07c606cde3 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
 @@ -26,7 +26,8 @@ headers		= langinfo.h locale.h bits/locale.h \
@@ -89,7 +89,7 @@ index 0000000000..538f3f5edb
 +    [LC_ALL] = sizeof ("LC_ALL") - 1
 +  };
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index fdc283c69a..4eeed35f90 100644
+index 22f9dc1140..fa31b3c5ea 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
 @@ -230,7 +230,7 @@ __libc_tsd_define (extern, locale_t, LOCALE)
@@ -102,7 +102,7 @@ index fdc283c69a..4eeed35f90 100644
  # define NL_CURRENT_INDIRECT	1
  #endif
 diff --git a/locale/programs/charmap-dir.c b/locale/programs/charmap-dir.c
-index 1a526a240d..0fb2daf936 100644
+index 4841bfd05d..ffcba1fd79 100644
 --- a/locale/programs/charmap-dir.c
 +++ b/locale/programs/charmap-dir.c
 @@ -18,7 +18,9 @@
@@ -148,7 +148,7 @@ index 1a526a240d..0fb2daf936 100644
    return NULL;
  }
 diff --git a/locale/programs/ld-collate.c b/locale/programs/ld-collate.c
-index feb1a11258..5a8e522470 100644
+index 0af21e05e2..4980b0c52f 100644
 --- a/locale/programs/ld-collate.c
 +++ b/locale/programs/ld-collate.c
 @@ -349,7 +349,7 @@ new_element (struct locale_collate_t *collate, const char *mbs, size_t mbslen,
@@ -197,7 +197,7 @@ index feb1a11258..5a8e522470 100644
  			 == runp->wcnext->wcs[runp->nwcs - 1] + 1));
  
 diff --git a/locale/programs/ld-ctype.c b/locale/programs/ld-ctype.c
-index 3328093d0e..d58fb0f4b7 100644
+index 2fb579bbbf..d0be99581c 100644
 --- a/locale/programs/ld-ctype.c
 +++ b/locale/programs/ld-ctype.c
 @@ -915,7 +915,7 @@ ctype_output (struct localedef_t *locale, const struct charmap_t *charmap,
@@ -279,7 +279,7 @@ index 3328093d0e..d58fb0f4b7 100644
  	      srunp = srunp->next;
  	    }
 diff --git a/locale/programs/ld-time.c b/locale/programs/ld-time.c
-index f7db873adb..fec3773c9d 100644
+index dcd2a2386d..6814740325 100644
 --- a/locale/programs/ld-time.c
 +++ b/locale/programs/ld-time.c
 @@ -220,8 +220,10 @@ No definition for %s category found"), "LC_TIME");
@@ -348,7 +348,7 @@ index f7db873adb..fec3773c9d 100644
  
  
 diff --git a/locale/programs/linereader.c b/locale/programs/linereader.c
-index 7ebd933801..5753750756 100644
+index 96d3ab66db..3af379d2c3 100644
 --- a/locale/programs/linereader.c
 +++ b/locale/programs/linereader.c
 @@ -595,7 +595,7 @@ get_string (struct linereader *lr, const struct charmap_t *charmap,
@@ -361,7 +361,7 @@ index 7ebd933801..5753750756 100644
    size_t bufmax = 56;
  
 diff --git a/locale/programs/localedef.c b/locale/programs/localedef.c
-index b048bd05b9..fed15c42ec 100644
+index 832c8fd1fc..fe689b3ae1 100644
 --- a/locale/programs/localedef.c
 +++ b/locale/programs/localedef.c
 @@ -109,6 +109,7 @@ void (*argp_program_version_hook) (FILE *, struct argp_state *) = print_version;
@@ -407,7 +407,7 @@ index b048bd05b9..fed15c42ec 100644
        force_output = 1;
        break;
 diff --git a/locale/programs/locfile.c b/locale/programs/locfile.c
-index eb2f4634da..d387147323 100644
+index 0f1affa1d4..7d86fae801 100644
 --- a/locale/programs/locfile.c
 +++ b/locale/programs/locfile.c
 @@ -544,6 +544,9 @@ compare_files (const char *filename1, const char *filename2, size_t size,
@@ -430,7 +430,7 @@ index eb2f4634da..d387147323 100644
  
  /* Record that FILE's next element is the 32-bit integer VALUE.  */
 diff --git a/locale/programs/locfile.h b/locale/programs/locfile.h
-index 7ea10038b4..0888c09762 100644
+index c986d599ec..222a779176 100644
 --- a/locale/programs/locfile.h
 +++ b/locale/programs/locfile.h
 @@ -71,6 +71,8 @@ extern void write_all_categories (struct localedef_t *definitions,
@@ -519,7 +519,7 @@ index 7ea10038b4..0888c09762 100644
 +
  #endif /* locfile.h */
 diff --git a/locale/setlocale.c b/locale/setlocale.c
-index 030f1727bd..096d8ed895 100644
+index 19ed85ae8e..f28ca11446 100644
 --- a/locale/setlocale.c
 +++ b/locale/setlocale.c
 @@ -63,35 +63,6 @@ static char *const _nl_current_used[] =
@@ -558,6 +558,3 @@ index 030f1727bd..096d8ed895 100644
  #ifdef NL_CURRENT_INDIRECT
  # define WEAK_POSTLOAD(postload) weak_extern (postload)
  #else
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0022-Define-DUMMY_LOCALE_T-if-not-defined.patch b/meta/recipes-core/glibc/glibc/0022-Define-DUMMY_LOCALE_T-if-not-defined.patch
index 0e93183087..33d912d356 100644
--- a/meta/recipes-core/glibc/glibc/0022-Define-DUMMY_LOCALE_T-if-not-defined.patch
+++ b/meta/recipes-core/glibc/glibc/0022-Define-DUMMY_LOCALE_T-if-not-defined.patch
@@ -1,7 +1,7 @@
-From ad5bc87134871b99e082e2449b8c1ce2f1375ef9 Mon Sep 17 00:00:00 2001
+From c8df3cf4556d8d78a98675865395ce42f3b67109 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 20 Apr 2016 21:11:00 -0700
-Subject: [PATCH 22/29] Define DUMMY_LOCALE_T if not defined
+Subject: [PATCH] Define DUMMY_LOCALE_T if not defined
 
 This is a hack to fix building the locale bits on an older
 CentOs 5.X machine
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/locale/programs/config.h b/locale/programs/config.h
-index d76d9f7e8b..92b56d7df3 100644
+index 2edcf3696c..5350101e38 100644
 --- a/locale/programs/config.h
 +++ b/locale/programs/config.h
 @@ -19,6 +19,9 @@
@@ -27,6 +27,3 @@ index d76d9f7e8b..92b56d7df3 100644
  /* Use the internal textdomain used for libc messages.  */
  #define PACKAGE _libc_intl_domainname
  #ifndef VERSION
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0023-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch b/meta/recipes-core/glibc/glibc/0023-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
index 7cbf6811a1..a5a7a0cad7 100644
--- a/meta/recipes-core/glibc/glibc/0023-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
+++ b/meta/recipes-core/glibc/glibc/0023-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
@@ -1,8 +1,7 @@
-From c5fd8a3d336b8288f631fb6b6dd85f9d1076f25b Mon Sep 17 00:00:00 2001
+From 2ec233ce078b74030de9195096058cd502fdc395 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:42:06 -0700
-Subject: [PATCH 23/29] localedef --add-to-archive uses a hard-coded locale
- path
+Subject: [PATCH] localedef --add-to-archive uses a hard-coded locale path
 
 it doesn't exist in normal use, and there's no way to pass an
 alternative filename.
@@ -19,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/locale/programs/locarchive.c b/locale/programs/locarchive.c
-index dccaf04e3b..ae0b7fe155 100644
+index 6bb189ae37..0711c5c44e 100644
 --- a/locale/programs/locarchive.c
 +++ b/locale/programs/locarchive.c
 @@ -340,12 +340,24 @@ enlarge_archive (struct locarhandle *ah, const struct locarhead *head)
@@ -79,6 +78,3 @@ index dccaf04e3b..ae0b7fe155 100644
  	    {
  	      if (readonly)
  		{
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch b/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
index 02e73594a0..d2691e1ee7 100644
--- a/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
+++ b/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
@@ -1,7 +1,7 @@
-From dffa52364f8c54c455b2459ebe83f05cb6ffc9fc Mon Sep 17 00:00:00 2001
+From f8289aa320b00f6db43213979cceab2325a7a611 Mon Sep 17 00:00:00 2001
 From: Mark Hatle <mark.hatle@windriver.com>
 Date: Thu, 18 Aug 2016 14:07:58 -0500
-Subject: [PATCH 24/29] elf/dl-deps.c: Make _dl_build_local_scope breadth first
+Subject: [PATCH] elf/dl-deps.c: Make _dl_build_local_scope breadth first
 
 According to the ELF specification:
 
@@ -24,7 +24,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  1 file changed, 10 insertions(+), 4 deletions(-)
 
 diff --git a/elf/dl-deps.c b/elf/dl-deps.c
-index b5a43232a7..8aa8f37fa3 100644
+index 087a49b212..c09f9334f2 100644
 --- a/elf/dl-deps.c
 +++ b/elf/dl-deps.c
 @@ -73,13 +73,19 @@ _dl_build_local_scope (struct link_map **list, struct link_map *map)
@@ -51,6 +51,3 @@ index b5a43232a7..8aa8f37fa3 100644
    return p - list;
  }
  
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0025-intl-Emit-no-lines-in-bison-generated-files.patch b/meta/recipes-core/glibc/glibc/0025-intl-Emit-no-lines-in-bison-generated-files.patch
index 700fb28874..32f8fd22b8 100644
--- a/meta/recipes-core/glibc/glibc/0025-intl-Emit-no-lines-in-bison-generated-files.patch
+++ b/meta/recipes-core/glibc/glibc/0025-intl-Emit-no-lines-in-bison-generated-files.patch
@@ -1,7 +1,7 @@
-From bc3380877bd2a1f9368a913fa6a2ca1ee88fd95f Mon Sep 17 00:00:00 2001
+From 3156464f9a95bf1dafd2e22d19d7bf89c520acc1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:44:00 -0700
-Subject: [PATCH 25/29] intl: Emit no lines in bison generated files
+Subject: [PATCH] intl: Emit no lines in bison generated files
 
 Improve reproducibility:
 Do not put any #line preprocessor commands in bison generated files.
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/intl/Makefile b/intl/Makefile
-index ce3072420f..58457840d9 100644
+index 93478d87e8..b27a7935eb 100644
 --- a/intl/Makefile
 +++ b/intl/Makefile
 @@ -155,7 +155,7 @@ $(objpfx)tst-gettext6.out: $(objpfx)tst-gettext.out
@@ -29,6 +29,3 @@ index ce3072420f..58457840d9 100644
  
  $(inst_localedir)/locale.alias: locale.alias $(+force)
  	$(do-install)
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch b/meta/recipes-core/glibc/glibc/0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
index d2c88d2354..782d931f22 100644
--- a/meta/recipes-core/glibc/glibc/0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
+++ b/meta/recipes-core/glibc/glibc/0027-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
@@ -1,7 +1,7 @@
-From 10aef8f0671d814aaf910ababc0225cf6f0a46e8 Mon Sep 17 00:00:00 2001
+From 881f5b8134afd9a30049b93fc79dda7a44947a5f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <martin.jansa@gmail.com>
 Date: Mon, 17 Dec 2018 21:36:18 +0000
-Subject: [PATCH 27/29] locale: prevent maybe-uninitialized errors with -Os [BZ
+Subject: [PATCH] locale: prevent maybe-uninitialized errors with -Os [BZ
  #19444]
 
 Fixes following error when building for aarch64 with -Os:
@@ -33,7 +33,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/locale/weight.h b/locale/weight.h
-index e071253f85..2889c395f1 100644
+index 723e1fefda..f5798d379a 100644
 --- a/locale/weight.h
 +++ b/locale/weight.h
 @@ -28,7 +28,14 @@ findidx (const int32_t *table,
@@ -51,6 +51,3 @@ index e071253f85..2889c395f1 100644
    const unsigned char *cp;
    const unsigned char *usrc;
  
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch b/meta/recipes-core/glibc/glibc/0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
index 25c046f5cd..d273cab4a3 100644
--- a/meta/recipes-core/glibc/glibc/0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
+++ b/meta/recipes-core/glibc/glibc/0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
@@ -1,8 +1,7 @@
-From 70731329feb7ba20364aa37aed83d920de97f028 Mon Sep 17 00:00:00 2001
+From b4e0a034b12b313dcb82d22341bef6a66b3e9ef9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:11:22 +0000
-Subject: [PATCH 28/29] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known
- names
+Subject: [PATCH] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known names
 
 This bolts in a hook for OE to pass its own version of interpreter
 names into glibc especially for multilib case, where it differs from any
@@ -17,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/elf/readlib.c b/elf/readlib.c
-index 994a4426a1..baabf099b1 100644
+index 7383c23249..e97ea9449d 100644
 --- a/elf/readlib.c
 +++ b/elf/readlib.c
 @@ -51,6 +51,7 @@ static struct known_names interpreters[] =
@@ -28,6 +27,3 @@ index 994a4426a1..baabf099b1 100644
  };
  
  static struct known_names known_libs[] =
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index 0ebf8a6183..791029c4c0 100644
--- a/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -1,7 +1,7 @@
-From bf1c4b2f01c5f86bb770fd1711a69ea727e0f56e Mon Sep 17 00:00:00 2001
+From 2ae3ff3ae28abb1d0d100b4722da7ff188de9a30 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 May 2020 17:05:45 -0700
-Subject: [PATCH 29/29] wordsize.h: Unify the header between arm and aarch64
+Subject: [PATCH] wordsize.h: Unify the header between arm and aarch64
 
 This helps OE multilibs to not sythesize this header which causes all
 kind of recursions and other issues since wordsize is fundamental header
@@ -11,13 +11,13 @@ Upstream-Status: Inappropriate [ OE-Specific ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sysdeps/aarch64/bits/wordsize.h          | 8 ++++++--
- sysdeps/{aarch64 => arm}/bits/wordsize.h | 8 ++++++--
- 2 files changed, 12 insertions(+), 4 deletions(-)
- copy sysdeps/{aarch64 => arm}/bits/wordsize.h (85%)
+ sysdeps/aarch64/bits/wordsize.h          |  8 ++++++--
+ sysdeps/{aarch64 => arm}/bits/wordsize.h | 10 +++++++---
+ 2 files changed, 13 insertions(+), 5 deletions(-)
+ copy sysdeps/{aarch64 => arm}/bits/wordsize.h (80%)
 
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/aarch64/bits/wordsize.h
-index ee01841773..34fcdef1f1 100644
+index 91da566b74..9a754514b3 100644
 --- a/sysdeps/aarch64/bits/wordsize.h
 +++ b/sysdeps/aarch64/bits/wordsize.h
 @@ -17,12 +17,16 @@
@@ -40,12 +40,20 @@ index ee01841773..34fcdef1f1 100644
  
  #define __WORDSIZE_TIME64_COMPAT32	0
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
-similarity index 85%
+similarity index 80%
 copy from sysdeps/aarch64/bits/wordsize.h
 copy to sysdeps/arm/bits/wordsize.h
-index ee01841773..34fcdef1f1 100644
+index 91da566b74..34fcdef1f1 100644
 --- a/sysdeps/aarch64/bits/wordsize.h
 +++ b/sysdeps/arm/bits/wordsize.h
+@@ -1,6 +1,6 @@
+ /* Determine the wordsize from the preprocessor defines.
+ 
+-   Copyright (C) 2016-2021 Free Software Foundation, Inc.
++   Copyright (C) 2016-2020 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
 @@ -17,12 +17,16 @@
     License along with the GNU C Library; if not, see
     <https://www.gnu.org/licenses/>.  */
@@ -65,6 +73,3 @@ index ee01841773..34fcdef1f1 100644
  #endif
  
  #define __WORDSIZE_TIME64_COMPAT32	0
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch b/meta/recipes-core/glibc/glibc/0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch
index a764552361..5ef1ac2ed7 100644
--- a/meta/recipes-core/glibc/glibc/0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch
+++ b/meta/recipes-core/glibc/glibc/0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch
@@ -1,7 +1,7 @@
-From 8b1d521290218df8ceeaf2e6ee44a54b19d8d328 Mon Sep 17 00:00:00 2001
+From 5cc14938f05ae1354c8062f017a21f39d5fc9729 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Aug 2020 14:31:16 -0700
-Subject: [PATCH 30/30] powerpc: Do not ask compiler for finding arch
+Subject: [PATCH] powerpc: Do not ask compiler for finding arch
 
 This does not work well in cross compiling environments like OE
 and moreover it uses its own -mcpu/-march options via cflags
@@ -46,6 +46,3 @@ index 6c63bd8257..3e925f1d48 100644
    # Note if you add patterns here you must ensure that an appropriate
    # directory exists in sysdeps/powerpc.  Likewise, if we find a
    # cpu, don't let the generic configure append extra compiler options.
--- 
-2.28.0
-
diff --git a/meta/recipes-core/glibc/glibc/0031-linux-Allow-adjtime-with-NULL-argument-BZ-26833.patch b/meta/recipes-core/glibc/glibc/0031-linux-Allow-adjtime-with-NULL-argument-BZ-26833.patch
deleted file mode 100644
index a458a2a223..0000000000
--- a/meta/recipes-core/glibc/glibc/0031-linux-Allow-adjtime-with-NULL-argument-BZ-26833.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 75a193b7611bade31a150dfcc528b973e3d46231 Mon Sep 17 00:00:00 2001
-From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Date: Mon, 2 Nov 2020 16:18:29 -0300
-Subject: [PATCH] linux: Allow adjtime with NULL argument [BZ #26833]
-
-The adjtime interface allows return the amount of time remaining
-from any previous adjustment that has not yet been completed by
-passing a NULL as first argument.  This was introduced with y2038
-support 0308077e3a.
-
-Checked on i686-linux-gnu.
-
-Reviewed-by: Lukasz Majewski <lukma@denx.de>
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=75a193b7611bade31a150dfcc528b973e3d46231]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- sysdeps/unix/sysv/linux/adjtime.c | 11 +++++---
- time/Makefile                     |  3 ++-
- time/tst-adjtime.c                | 44 +++++++++++++++++++++++++++++++
- 3 files changed, 54 insertions(+), 4 deletions(-)
- create mode 100644 time/tst-adjtime.c
-
-diff --git a/sysdeps/unix/sysv/linux/adjtime.c b/sysdeps/unix/sysv/linux/adjtime.c
-index 3f9a4ea2eb..6d1d1b6af2 100644
---- a/sysdeps/unix/sysv/linux/adjtime.c
-+++ b/sysdeps/unix/sysv/linux/adjtime.c
-@@ -68,11 +68,16 @@ libc_hidden_def (__adjtime64)
- int
- __adjtime (const struct timeval *itv, struct timeval *otv)
- {
--  struct __timeval64 itv64, otv64;
-+  struct __timeval64 itv64, *pitv64 = NULL;
-+  struct __timeval64 otv64;
-   int retval;
- 
--  itv64 = valid_timeval_to_timeval64 (*itv);
--  retval = __adjtime64 (&itv64, otv != NULL ? &otv64 : NULL);
-+  if (itv != NULL)
-+    {
-+      itv64 = valid_timeval_to_timeval64 (*itv);
-+      pitv64 = &itv64;
-+    }
-+  retval = __adjtime64 (pitv64, otv != NULL ? &otv64 : NULL);
-   if (otv != NULL)
-     *otv = valid_timeval64_to_timeval (otv64);
- 
-diff --git a/time/Makefile b/time/Makefile
-index 26aa835166..f27a75a115 100644
---- a/time/Makefile
-+++ b/time/Makefile
-@@ -47,7 +47,8 @@ tests	:= test_time clocktest tst-posixtz tst-strptime tst_wcsftime \
- 	   tst-mktime3 tst-strptime2 bug-asctime bug-asctime_r bug-mktime1 \
- 	   tst-strptime3 bug-getdate1 tst-strptime-whitespace tst-ftime \
- 	   tst-tzname tst-y2039 bug-mktime4 tst-strftime2 tst-strftime3 \
--	   tst-clock tst-clock2 tst-clock_nanosleep tst-cpuclock1
-+	   tst-clock tst-clock2 tst-clock_nanosleep tst-cpuclock1 \
-+	   tst-adjtime
- 
- include ../Rules
- 
-diff --git a/time/tst-adjtime.c b/time/tst-adjtime.c
-new file mode 100644
-index 0000000000..ae2b37cdab
---- /dev/null
-+++ b/time/tst-adjtime.c
-@@ -0,0 +1,44 @@
-+/* Basic tests for adjtime.
-+   Copyright (C) 2020 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <sys/time.h>
-+#include <stdlib.h>
-+
-+#include <errno.h>
-+#include <support/check.h>
-+
-+
-+static int
-+do_test (void)
-+{
-+  /* Check if the interface allows getting the amount of time remaining
-+     from any previous adjustment that has not yet been completed.  This
-+     is a non-privileged function of adjtime.  */
-+  struct timeval tv;
-+  int r = adjtime (NULL, &tv);
-+  if (r == -1)
-+    {
-+      if (errno == ENOSYS)
-+	FAIL_UNSUPPORTED ("adjtime unsupported");
-+      FAIL_EXIT1 ("adjtime (NULL, ...) failed: %m");
-+    }
-+
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch b/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
deleted file mode 100644
index 987e959db2..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From ee7a3144c9922808181009b7b3e50e852fb4999b Mon Sep 17 00:00:00 2001
-From: Andreas Schwab <schwab@suse.de>
-Date: Mon, 21 Dec 2020 08:56:43 +0530
-Subject: [PATCH] Fix buffer overrun in EUC-KR conversion module (bz #24973)
-
-The byte 0xfe as input to the EUC-KR conversion denotes a user-defined
-area and is not allowed.  The from_euc_kr function used to skip two bytes
-when told to skip over the unknown designation, potentially running over
-the buffer end.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=ee7a3144c9922808181009b7b3e50e852fb4999b]
-CVE: CVE-2019-25013
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
----
- iconvdata/Makefile      |  3 ++-
- iconvdata/bug-iconv13.c | 53 +++++++++++++++++++++++++++++++++++++++++
- iconvdata/euc-kr.c      |  6 +----
- iconvdata/ksc5601.h     |  6 ++---
- 4 files changed, 59 insertions(+), 9 deletions(-)
- create mode 100644 iconvdata/bug-iconv13.c
-
-diff --git a/iconvdata/Makefile b/iconvdata/Makefile
-index 4ec2741cdc..85009f3390 100644
---- a/iconvdata/Makefile
-+++ b/iconvdata/Makefile
-@@ -73,7 +73,8 @@ modules.so := $(addsuffix .so, $(modules))
- ifeq (yes,$(build-shared))
- tests = bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug-iconv4 \
- 	tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9 \
--	bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4
-+	bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4 \
-+	bug-iconv13
- ifeq ($(have-thread-library),yes)
- tests += bug-iconv3
- endif
-diff --git a/iconvdata/bug-iconv13.c b/iconvdata/bug-iconv13.c
-new file mode 100644
-index 0000000000..87aaff398e
---- /dev/null
-+++ b/iconvdata/bug-iconv13.c
-@@ -0,0 +1,53 @@
-+/* bug 24973: Test EUC-KR module
-+   Copyright (C) 2020 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <errno.h>
-+#include <iconv.h>
-+#include <stdio.h>
-+#include <support/check.h>
-+
-+static int
-+do_test (void)
-+{
-+  iconv_t cd = iconv_open ("UTF-8//IGNORE", "EUC-KR");
-+  TEST_VERIFY_EXIT (cd != (iconv_t) -1);
-+
-+  /* 0xfe (->0x7e : row 94) and 0xc9 (->0x49 : row 41) are user-defined
-+     areas, which are not allowed and should be skipped over due to
-+     //IGNORE.  The trailing 0xfe also is an incomplete sequence, which
-+     should be checked first.  */
-+  char input[4] = { '\xc9', '\xa1', '\0', '\xfe' };
-+  char *inptr = input;
-+  size_t insize = sizeof (input);
-+  char output[4];
-+  char *outptr = output;
-+  size_t outsize = sizeof (output);
-+
-+  /* This used to crash due to buffer overrun.  */
-+  TEST_VERIFY (iconv (cd, &inptr, &insize, &outptr, &outsize) == (size_t) -1);
-+  TEST_VERIFY (errno == EINVAL);
-+  /* The conversion should produce one character, the converted null
-+     character.  */
-+  TEST_VERIFY (sizeof (output) - outsize == 1);
-+
-+  TEST_VERIFY_EXIT (iconv_close (cd) != -1);
-+
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
-diff --git a/iconvdata/euc-kr.c b/iconvdata/euc-kr.c
-index b0d56cf3ee..1045bae926 100644
---- a/iconvdata/euc-kr.c
-+++ b/iconvdata/euc-kr.c
-@@ -80,11 +80,7 @@ euckr_from_ucs4 (uint32_t ch, unsigned char *cp)
- 									      \
-     if (ch <= 0x9f)							      \
-       ++inptr;								      \
--    /* 0xfe(->0x7e : row 94) and 0xc9(->0x59 : row 41) are		      \
--       user-defined areas.  */						      \
--    else if (__builtin_expect (ch == 0xa0, 0)				      \
--	     || __builtin_expect (ch > 0xfe, 0)				      \
--	     || __builtin_expect (ch == 0xc9, 0))			      \
-+    else if (__glibc_unlikely (ch == 0xa0))				      \
-       {									      \
- 	/* This is illegal.  */						      \
- 	STANDARD_FROM_LOOP_ERR_HANDLER (1);				      \
-diff --git a/iconvdata/ksc5601.h b/iconvdata/ksc5601.h
-index d3eb3a4ff8..f5cdc72797 100644
---- a/iconvdata/ksc5601.h
-+++ b/iconvdata/ksc5601.h
-@@ -50,15 +50,15 @@ ksc5601_to_ucs4 (const unsigned char **s, size_t avail, unsigned char offset)
-   unsigned char ch2;
-   int idx;
- 
-+  if (avail < 2)
-+    return 0;
-+
-   /* row 94(0x7e) and row 41(0x49) are user-defined area in KS C 5601 */
- 
-   if (ch < offset || (ch - offset) <= 0x20 || (ch - offset) >= 0x7e
-       || (ch - offset) == 0x49)
-     return __UNKNOWN_10646_CHAR;
- 
--  if (avail < 2)
--    return 0;
--
-   ch2 = (*s)[1];
-   if (ch2 < offset || (ch2 - offset) <= 0x20 || (ch2 - offset) >= 0x7f)
-     return __UNKNOWN_10646_CHAR;
--- 
-2.27.0
-
diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-27618.patch b/meta/recipes-core/glibc/glibc/CVE-2020-27618.patch
deleted file mode 100644
index bf32238357..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2020-27618.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 20e6c868c29f5a6121cbb88f3387bb9b884a4206 Mon Sep 17 00:00:00 2001
-From: Arjun Shankar <arjun@redhat.com>
-Date: Wed, 4 Nov 2020 12:19:38 +0100
-Subject: [PATCH] iconv: Accept redundant shift sequences in IBM1364 [BZ
- #26224]
-
-The IBM1364, IBM1371, IBM1388, IBM1390 and IBM1399 character sets
-share converter logic (iconvdata/ibm1364.c) which would reject
-redundant shift sequences when processing input in these character
-sets.  This led to a hang in the iconv program (CVE-2020-27618).
-
-This commit adjusts the converter to ignore redundant shift sequences
-and adds test cases for iconv_prog hangs that would be triggered upon
-their rejection.  This brings the implementation in line with other
-converters that also ignore redundant shift sequences (e.g. IBM930
-etc., fixed in commit 692de4b3960d).
-
-Reviewed-by: Carlos O'Donell <carlos@redhat.com>
-
-Upstream-Status: Backport
-[https://sourceware.org/git/?p=glibc.git;a=commit;
-h=9a99c682144bdbd40792ebf822fe9264e0376fb5]
-
-CVE: CVE-2020-27618
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
----
- iconv/tst-iconv_prog.sh | 16 ++++++++++------
- iconvdata/ibm1364.c     | 14 ++------------
- 2 files changed, 12 insertions(+), 18 deletions(-)
-
-diff --git a/iconv/tst-iconv_prog.sh b/iconv/tst-iconv_prog.sh
-index 8298136b7f..d8db7b335c 100644
---- a/iconv/tst-iconv_prog.sh
-+++ b/iconv/tst-iconv_prog.sh
-@@ -102,12 +102,16 @@ hangarray=(
- "\x00\x80;-c;IBM1161;UTF-8//TRANSLIT//IGNORE"
- "\x00\xdb;-c;IBM1162;UTF-8//TRANSLIT//IGNORE"
- "\x00\x70;-c;IBM12712;UTF-8//TRANSLIT//IGNORE"
--# These are known hangs that are yet to be fixed:
--# "\x00\x0f;-c;IBM1364;UTF-8"
--# "\x00\x0f;-c;IBM1371;UTF-8"
--# "\x00\x0f;-c;IBM1388;UTF-8"
--# "\x00\x0f;-c;IBM1390;UTF-8"
--# "\x00\x0f;-c;IBM1399;UTF-8"
-+"\x00\x0f;-c;IBM1364;UTF-8"
-+"\x0e\x0e;-c;IBM1364;UTF-8"
-+"\x00\x0f;-c;IBM1371;UTF-8"
-+"\x0e\x0e;-c;IBM1371;UTF-8"
-+"\x00\x0f;-c;IBM1388;UTF-8"
-+"\x0e\x0e;-c;IBM1388;UTF-8"
-+"\x00\x0f;-c;IBM1390;UTF-8"
-+"\x0e\x0e;-c;IBM1390;UTF-8"
-+"\x00\x0f;-c;IBM1399;UTF-8"
-+"\x0e\x0e;-c;IBM1399;UTF-8"
- "\x00\x53;-c;IBM16804;UTF-8//TRANSLIT//IGNORE"
- "\x00\x41;-c;IBM274;UTF-8//TRANSLIT//IGNORE"
- "\x00\x41;-c;IBM275;UTF-8//TRANSLIT//IGNORE"
-diff --git a/iconvdata/ibm1364.c b/iconvdata/ibm1364.c
-index 49e7267ab4..521f0825b7 100644
---- a/iconvdata/ibm1364.c
-+++ b/iconvdata/ibm1364.c
-@@ -158,24 +158,14 @@ enum
- 									      \
-     if (__builtin_expect (ch, 0) == SO)					      \
-       {									      \
--	/* Shift OUT, change to DBCS converter.  */			      \
--	if (curcs == db)						      \
--	  {								      \
--	    result = __GCONV_ILLEGAL_INPUT;				      \
--	    break;							      \
--	  }								      \
-+	/* Shift OUT, change to DBCS converter (redundant escape okay).  */   \
- 	curcs = db;							      \
- 	++inptr;							      \
- 	continue;							      \
-       }									      \
-     if (__builtin_expect (ch, 0) == SI)					      \
-       {									      \
--	/* Shift IN, change to SBCS converter.  */			      \
--	if (curcs == sb)						      \
--	  {								      \
--	    result = __GCONV_ILLEGAL_INPUT;				      \
--	    break;							      \
--	  }								      \
-+	/* Shift IN, change to SBCS converter (redundant escape okay).  */    \
- 	curcs = sb;							      \
- 	++inptr;							      \
- 	continue;							      \
--- 
-2.29.2
-
diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-29562.patch b/meta/recipes-core/glibc/glibc/CVE-2020-29562.patch
deleted file mode 100644
index 134b4e3613..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2020-29562.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-From 228edd356f03bf62dcf2b1335f25d43c602ee68d Mon Sep 17 00:00:00 2001
-From: Michael Colavita <mcolavita@fb.com>
-Date: Thu, 19 Nov 2020 11:44:40 -0500
-Subject: [PATCH] iconv: Fix incorrect UCS4 inner loop bounds (BZ#26923)
-
-Previously, in UCS4 conversion routines we limit the number of
-characters we examine to the minimum of the number of characters in the
-input and the number of characters in the output. This is not the
-correct behavior when __GCONV_IGNORE_ERRORS is set, as we do not consume
-an output character when we skip a code unit. Instead, track the input
-and output pointers and terminate the loop when either reaches its
-limit.
-
-This resolves assertion failures when resetting the input buffer in a step of
-iconv, which assumes that the input will be fully consumed given sufficient
-output space.
-
-Upstream-Status: Backport [git://sourceware.org/git/glibc.git]
-CVE: CVE-2020-29562
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- iconv/Makefile       |  2 +-
- iconv/gconv_simple.c | 16 ++++----------
- iconv/tst-iconv8.c   | 50 ++++++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 55 insertions(+), 13 deletions(-)
- create mode 100644 iconv/tst-iconv8.c
-
-diff --git a/iconv/Makefile b/iconv/Makefile
-index 30bf996d3a..f9b51e23ec 100644
---- a/iconv/Makefile
-+++ b/iconv/Makefile
-@@ -44,7 +44,7 @@ CFLAGS-linereader.c += -DNO_TRANSLITERATION
- CFLAGS-simple-hash.c += -I../locale
- 
- tests	= tst-iconv1 tst-iconv2 tst-iconv3 tst-iconv4 tst-iconv5 tst-iconv6 \
--	  tst-iconv7 tst-iconv-mt tst-iconv-opt
-+	  tst-iconv7 tst-iconv8 tst-iconv-mt tst-iconv-opt
- 
- others		= iconv_prog iconvconfig
- install-others-programs	= $(inst_bindir)/iconv
-diff --git a/iconv/gconv_simple.c b/iconv/gconv_simple.c
-index d4797fba17..963b29f246 100644
---- a/iconv/gconv_simple.c
-+++ b/iconv/gconv_simple.c
-@@ -239,11 +239,9 @@ ucs4_internal_loop (struct __gconv_step *step,
-   int flags = step_data->__flags;
-   const unsigned char *inptr = *inptrp;
-   unsigned char *outptr = *outptrp;
--  size_t n_convert = MIN (inend - inptr, outend - outptr) / 4;
-   int result;
--  size_t cnt;
- 
--  for (cnt = 0; cnt < n_convert; ++cnt, inptr += 4)
-+  for (; inptr + 4 <= inend && outptr + 4 <= outend; inptr += 4)
-     {
-       uint32_t inval;
- 
-@@ -307,11 +305,9 @@ ucs4_internal_loop_unaligned (struct __gconv_step *step,
-   int flags = step_data->__flags;
-   const unsigned char *inptr = *inptrp;
-   unsigned char *outptr = *outptrp;
--  size_t n_convert = MIN (inend - inptr, outend - outptr) / 4;
-   int result;
--  size_t cnt;
- 
--  for (cnt = 0; cnt < n_convert; ++cnt, inptr += 4)
-+  for (; inptr + 4 <= inend && outptr + 4 <= outend; inptr += 4)
-     {
-       if (__glibc_unlikely (inptr[0] > 0x80))
- 	{
-@@ -613,11 +609,9 @@ ucs4le_internal_loop (struct __gconv_step *step,
-   int flags = step_data->__flags;
-   const unsigned char *inptr = *inptrp;
-   unsigned char *outptr = *outptrp;
--  size_t n_convert = MIN (inend - inptr, outend - outptr) / 4;
-   int result;
--  size_t cnt;
- 
--  for (cnt = 0; cnt < n_convert; ++cnt, inptr += 4)
-+  for (; inptr + 4 <= inend && outptr + 4 <= outend; inptr += 4)
-     {
-       uint32_t inval;
- 
-@@ -684,11 +678,9 @@ ucs4le_internal_loop_unaligned (struct __gconv_step *step,
-   int flags = step_data->__flags;
-   const unsigned char *inptr = *inptrp;
-   unsigned char *outptr = *outptrp;
--  size_t n_convert = MIN (inend - inptr, outend - outptr) / 4;
-   int result;
--  size_t cnt;
- 
--  for (cnt = 0; cnt < n_convert; ++cnt, inptr += 4)
-+  for (; inptr + 4 <= inend && outptr + 4 <= outend; inptr += 4)
-     {
-       if (__glibc_unlikely (inptr[3] > 0x80))
- 	{
-diff --git a/iconv/tst-iconv8.c b/iconv/tst-iconv8.c
-new file mode 100644
-index 0000000000..0b92b19f66
---- /dev/null
-+++ b/iconv/tst-iconv8.c
-@@ -0,0 +1,50 @@
-+/* Test iconv behavior on UCS4 conversions with //IGNORE.
-+   Copyright (C) 2020 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+/* Derived from BZ #26923 */
-+#include <errno.h>
-+#include <iconv.h>
-+#include <stdio.h>
-+#include <support/check.h>
-+
-+static int
-+do_test (void)
-+{
-+  iconv_t cd = iconv_open ("UTF-8//IGNORE", "ISO-10646/UCS4/");
-+  TEST_VERIFY_EXIT (cd != (iconv_t) -1);
-+
-+  /*
-+   * Convert sequence beginning with an irreversible character into buffer that
-+   * is too small.
-+   */
-+  char input[12] = "\xe1\x80\xa1" "AAAAAAAAA";
-+  char *inptr = input;
-+  size_t insize = sizeof (input);
-+  char output[6];
-+  char *outptr = output;
-+  size_t outsize = sizeof (output);
-+
-+  TEST_VERIFY (iconv (cd, &inptr, &insize, &outptr, &outsize) == -1);
-+  TEST_VERIFY (errno == E2BIG);
-+
-+  TEST_VERIFY_EXIT (iconv_close (cd) != -1);
-+
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
--- 
-2.17.0
-
diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-29573.patch b/meta/recipes-core/glibc/glibc/CVE-2020-29573.patch
deleted file mode 100644
index 0f54d72cad..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2020-29573.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 681900d29683722b1cb0a8e565a0585846ec5a61 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Tue, 22 Sep 2020 19:07:48 +0200
-Subject: [PATCH] x86: Harden printf against non-normal long double values (bug
- 26649)
-
-The behavior of isnan/__builtin_isnan on bit patterns that do not
-correspond to something that the CPU would produce from valid inputs
-is currently under-defined in the toolchain. (The GCC built-in and
-glibc disagree.)
-
-The isnan check in PRINTF_FP_FETCH in stdio-common/printf_fp.c
-assumes the GCC behavior that returns true for non-normal numbers
-which are not specified as NaN. (The glibc implementation returns
-false for such numbers.)
-
-At present, passing non-normal numbers to __mpn_extract_long_double
-causes this function to produce irregularly shaped multi-precision
-integers, triggering undefined behavior in __printf_fp_l.
-
-With GCC 10 and glibc 2.32, this behavior is not visible because
-__builtin_isnan is used, which avoids calling
-__mpn_extract_long_double in this case.  This commit updates the
-implementation of __mpn_extract_long_double so that regularly shaped
-multi-precision integers are produced in this case, avoiding
-undefined behavior in __printf_fp_l.
-
-Upstream-Status: Backport [git://sourceware.org/git/glibc.git]
-CVE: CVE-2020-29573
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- sysdeps/i386/ldbl2mpn.c                  |  8 ++++
- 1 files changed, 8 insertions(+)
-
-diff --git a/sysdeps/i386/ldbl2mpn.c b/sysdeps/i386/ldbl2mpn.c
-index ec8464eef7..23afedfb67 100644
---- a/sysdeps/i386/ldbl2mpn.c
-+++ b/sysdeps/i386/ldbl2mpn.c
-@@ -115,6 +115,14 @@ __mpn_extract_long_double (mp_ptr res_ptr, mp_size_t size,
- 	   && res_ptr[N - 1] == 0)
-     /* Pseudo zero.  */
-     *expt = 0;
-+  else
-+    /* Unlike other floating point formats, the most significant bit
-+       is explicit and expected to be set for normal numbers.  Set it
-+       in case it is cleared in the input.  Otherwise, callers will
-+       not be able to produce the expected multi-precision integer
-+       layout by shifting.  */
-+    res_ptr[N - 1] |= (mp_limb_t) 1 << (LDBL_MANT_DIG - 1
-+					- ((N - 1) * BITS_PER_MP_LIMB));
- 
-   return N;
- }
--- 
-2.17.0
-
diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/glibc/glibc_2.33.bb
similarity index 95%
rename from meta/recipes-core/glibc/glibc_2.32.bb
rename to meta/recipes-core/glibc/glibc_2.33.bb
index 2d9c707a0b..2259d60196 100644
--- a/meta/recipes-core/glibc/glibc_2.32.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -42,11 +42,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
            file://0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
-           file://0031-linux-Allow-adjtime-with-NULL-argument-BZ-26833.patch \
-           file://CVE-2020-29562.patch \
-           file://CVE-2020-29573.patch \
-           file://CVE-2019-25013.patch \
-           file://CVE-2020-27618.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.30.0

