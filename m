Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DA0C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 01:29:22 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.2565.1753752555409293937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 18:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OHcguo7M;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-769b19eeb3fso183446b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 18:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753752554; x=1754357354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7DHpQEUDSmIlEMsqwY9/fF3OEKyFpzkYh663QMEEAk=;
        b=OHcguo7MFtxP2MhfKQgCo+EXiPbR9tSykm33QO5jZuK3eEPZ8jwGbA2sbO3ypPqlrY
         d+EBQAZAVTz7mpG2MW/Y2e0bIdnWo/0G0JJHniPVnVgmjrDtO0gqgf8VeEpZOAK49N8V
         ErAK0VAEwuvWixzRqHPmDnF+pil568W3pVIRo99HQQKJfHtvJr1sqAumZHNvc7UosJj1
         PIAd3fZrZaE3tG7+y4vEh2FXAU7paL50Ip1F21CJLzwQT+yXrx3fBieorsa+vzFh2YY3
         KDjEwqHyuncoEU3En3ES+XfumrRka9C3C136vdStCyJQGmkI4udlP6eQ6HeRYDXB4ctz
         3Q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753752554; x=1754357354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7DHpQEUDSmIlEMsqwY9/fF3OEKyFpzkYh663QMEEAk=;
        b=C13nIh/TDB60PIOzqQmv0yrZtLvNoBv2MTOCiIpGYQcg7szANsbrRMv8DNBPE6xF9L
         h3PaSUtX/NoeIsW4GpK4vT+2N6ekbG6nCjGgPrqrAYJOPdIelpum2SZtEj76wZaBuwnt
         gKOFZJSjYz6epDOYVY59vZKlz6iKssaw7pgNtN6hll+ttS6ALC+0KH3Fzq5hHDo+RMc1
         KAkw1eiB3bICybXMxUHx8r10Fojaww9jxZ9w7jMUgmvnMCCg/tduv4xDn1BMYK/6h4dm
         meRjE/L18dXT4KUpOsPLs4Rx3rYQ2yvU1lG19+Y/31Q3pjX2X6LeEQYN9u0iyx+V2yc5
         roOg==
X-Gm-Message-State: AOJu0Yy1IkjTrZa7GSOTVbfBnpABXOoxDDszd2DBfAThiSHLeEm5e19Z
	J+w+lJ5LsLZX1pvX7F4/md14XNe3KMmZi7hZnl3x8Nyz1WDEqcFJcWZtDq0ArpupXhg=
X-Gm-Gg: ASbGncv5J2mYGqOvS6wCQcEbqEis76mKG1fVHvwZz1BcRMcIdMilM6ok2M6Oxv5dlkW
	jGTzydsQLgKMWqE3R/QaywXGVmlAaAZ6rnZW0Z28D0x3YXk9BpFJARG+XBzq0Di4w1EWIN1s5rR
	rnTRmMNZatAYLn5R/KZe8681RpUmhYhZY9i8tzkzTTWiQGv9KDzZMC7zefrdpmA1Hy3DyNXb5Rr
	yZJvvH+F+NeARBdsCst3R5OoZtZJW7ZmwFwFfEanTte4a8tK9pnt0CulLy3zlYj15sJo1O3vyJ2
	ggiVuHAKqQaBMPipT3hg9V5elIEaVI+0vXnndOH4xQd+jgu2DNJJUTgrr2UYQ+V9IaqZC+RZ3qC
	rtsPo1lTPoActHv/llMEAIem5
X-Google-Smtp-Source: AGHT+IHvg8mlDirotAQz5OAuoFZwLM1e45cdYTNmALYxTwN7dvOm+/MVtcuXCvRHSzmzdxoj+tgs4w==
X-Received: by 2002:a05:6a00:1953:b0:748:31ed:ba8a with SMTP id d2e1a72fcca58-763386be3c8mr16837411b3a.15.1753752554300;
        Mon, 28 Jul 2025 18:29:14 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408c024c1sm6579573b3a.33.2025.07.28.18.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 18:29:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Upgrade to 2.42 release
Date: Mon, 28 Jul 2025 18:29:09 -0700
Message-ID: <20250729012911.2402010-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 01:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221024

* GCC 12.1 or later is now required to build the GNU C Library.
* GNU Binutils 2.39 or later is now required to build the GNU C Library.
* Support for lightweight stack guard pages via madvise and the
  MADV_GUARD_INSTALL flag has been added to pthread_create.
* This is major release, changelog [1]

[1] https://sourceware.org/pipermail/libc-announce/2025/000048.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...2.41.bb => cross-localedef-native_2.42.bb} |  0
 meta/recipes-core/glibc/glibc-common.inc      |  2 +-
 ...bc-locale_2.41.bb => glibc-locale_2.42.bb} |  0
 ...bc-mtrace_2.41.bb => glibc-mtrace_2.42.bb} |  0
 ...-scripts_2.41.bb => glibc-scripts_2.42.bb} |  0
 ...tsuite_2.41.bb => glibc-testsuite_2.42.bb} |  0
 meta/recipes-core/glibc/glibc-version.inc     |  8 ++--
 ...dd-hardlink-resolver-from-util-linux.patch |  2 +-
 ...dd-single-threaded-fast-path-to-rand.patch | 47 -------------------
 ...-fix-ups-hardlink-to-make-it-compile.patch |  2 +-
 ...Look-for-host-system-ld.so.cache-as-.patch |  8 ++--
 ...Fix-buffer-overrun-with-a-relocated-.patch |  6 +--
 ...Raise-the-size-of-arrays-containing-.patch | 26 +++++-----
 ...k-glibc-Allow-64-bit-atomics-for-x86.patch |  2 +-
 ...Make-relocatable-install-for-locales.patch |  6 +--
 ...Fall-back-to-faccessat-on-faccess2-r.patch |  2 +-
 ...the-path-sets-wrong-config-variables.patch |  6 +--
 ...ss-building-and-testing-instructions.patch |  2 +-
 ...glibc-Help-bootstrap-cross-toolchain.patch |  4 +-
 ...eglibc-Resolve-__fpscr_values-on-SH4.patch |  2 +-
 ...port-cross-locale-generation-support.patch |  6 +--
 ...-archive-uses-a-hard-coded-locale-pa.patch |  4 +-
 ...Do-not-ask-compiler-for-finding-arch.patch |  2 +-
 ...y-the-header-between-arm-and-aarch64.patch | 26 +++++-----
 ...h-printf-builtin-in-nscd-init-script.patch |  2 +-
 ...igure.ac-Set-libc_cv_rootsbindir-onl.patch |  2 +-
 ...ell-interpreter-overridable-in-tzsel.patch |  4 +-
 ...Use-bin-sh-default-shell-interpreter.patch |  2 +-
 ...d-failed-in-unprivileged-process-BZ-.patch |  2 +-
 ...build-time-paths-in-the-output-binar.patch |  4 +-
 ...u-tests-that-can-hang-in-oe-selftest.patch | 12 ++---
 ...e-prefix-map-from-CFLAGS-to-ASFLAGS.patch} | 14 ++++--
 .../glibc/{glibc_2.41.bb => glibc_2.42.bb}    |  3 +-
 34 files changed, 81 insertions(+), 129 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.41.bb => cross-localedef-native_2.42.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-locale_2.41.bb => glibc-locale_2.42.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.41.bb => glibc-mtrace_2.42.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.41.bb => glibc-scripts_2.42.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-testsuite_2.41.bb => glibc-testsuite_2.42.bb} (100%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-path-to-rand.patch
 rename meta/recipes-core/glibc/glibc/{0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch => 0024-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch} (60%)
 rename meta/recipes-core/glibc/{glibc_2.41.bb => glibc_2.42.bb} (97%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index c506bb3ad57..0fcbed9656f 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -11,7 +11,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "15.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-GLIBCVERSION ?= "2.41%"
+GLIBCVERSION ?= "2.42%"
 RUSTVERSION ?= "1.87.0%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.41.bb b/meta/recipes-core/glibc/cross-localedef-native_2.42.bb
similarity index 100%
rename from meta/recipes-core/glibc/cross-localedef-native_2.41.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.42.bb
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index fb62a4af94a..7422ede04d1 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -22,6 +22,6 @@ ARM_INSTRUCTION_SET:armv6 = "arm"
 #
 COMPATIBLE_HOST:libc-musl:class-target = "null"
 
-PV = "2.41+git"
+PV = "2.42+git"
 
 TOOLCHAIN = "gcc"
diff --git a/meta/recipes-core/glibc/glibc-locale_2.41.bb b/meta/recipes-core/glibc/glibc-locale_2.42.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.41.bb
rename to meta/recipes-core/glibc/glibc-locale_2.42.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.41.bb b/meta/recipes-core/glibc/glibc-mtrace_2.42.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.41.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.42.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.41.bb b/meta/recipes-core/glibc/glibc-scripts_2.42.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.41.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.42.bb
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.41.bb b/meta/recipes-core/glibc/glibc-testsuite_2.42.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-testsuite_2.41.bb
rename to meta/recipes-core/glibc/glibc-testsuite_2.42.bb
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index a2cfd0f308e..3a89e153bd3 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,7 +1,7 @@
-SRCBRANCH ?= "release/2.41/master"
-PV = "2.41+git"
-SRCREV_glibc ?= "6e489c17f827317bcf8544efefa65f13b5a079dc"
-SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
+SRCBRANCH ?= "release/2.42/master"
+PV = "2.42+git"
+SRCREV_glibc ?= "d2097651cc57834dbfcaa102ddfacae0d86cfb66"
+SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
 
diff --git a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
index dbe3ce8c32d..b63e05b2a3e 100644
--- a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
+++ b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
@@ -1,4 +1,4 @@
-From cecd20fa2ff3ee2bd887b1d427088f32678cc04f Mon Sep 17 00:00:00 2001
+From 47dfcfdc8399801ee18317ec155295eef33882ef Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 09:59:22 -0800
 Subject: [PATCH] localedef: Add hardlink resolver from util-linux
diff --git a/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-path-to-rand.patch b/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-path-to-rand.patch
deleted file mode 100644
index 736fc51f387..00000000000
--- a/meta/recipes-core/glibc/glibc/0001-stdlib-Add-single-threaded-fast-path-to-rand.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 4f54b0dfc16dbe0df86afccb90e447df5f7f571e Mon Sep 17 00:00:00 2001
-From: Wilco Dijkstra <wilco.dijkstra@arm.com>
-Date: Mon, 18 Mar 2024 15:18:20 +0000
-Subject: [PATCH] stdlib: Add single-threaded fast path to rand()
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Improve performance of rand() and __random() by adding a single-threaded
-fast path.  Bench-random-lock shows about 5x speedup on Neoverse V1.
-
-Upstream-Status: Backport [be0cfd848d9ad7378800d6302bc11467cf2b514f]
-
-Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
-Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
----
- stdlib/random.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/stdlib/random.c b/stdlib/random.c
-index 17cc61ba8f55..5d482a857065 100644
---- a/stdlib/random.c
-+++ b/stdlib/random.c
-@@ -51,6 +51,7 @@
-    SUCH DAMAGE.*/
- 
- #include <libc-lock.h>
-+#include <sys/single_threaded.h>
- #include <limits.h>
- #include <stddef.h>
- #include <stdlib.h>
-@@ -288,6 +289,12 @@ __random (void)
- {
-   int32_t retval;
- 
-+  if (SINGLE_THREAD_P)
-+    {
-+      (void) __random_r (&unsafe_state, &retval);
-+      return retval;
-+    }
-+
-   __libc_lock_lock (lock);
- 
-   (void) __random_r (&unsafe_state, &retval);
--- 
-2.34.1
-
diff --git a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
index 59d71a0d8b2..cbb0ad3ef9b 100644
--- a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
+++ b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
@@ -1,4 +1,4 @@
-From e31f032ae87ba38645c66dd7d2dfaa8606602e70 Mon Sep 17 00:00:00 2001
+From 5ca14c7ac7f389d8a1bf34bb49cdbb2029779dab Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 10:01:37 -0800
 Subject: [PATCH] localedef: fix-ups hardlink to make it compile
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index 0f7db0d5007..04ae8fda979 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,4 +1,4 @@
-From f794ec18764a59ad45e242092e2ae6f5e3b19761 Mon Sep 17 00:00:00 2001
+From 8c06fcbaf863f83b72445a8b2b70c62a5ae55fe7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 3 Feb 2024 13:54:16 -0800
 Subject: [PATCH] nativesdk-glibc: Look for host system ld.so.cache as well
@@ -30,10 +30,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index f905578a65..d4dd0fbc2a 100644
+index 00b9da9ec7..bb31af89da 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -2038,6 +2038,14 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2038,6 +2038,14 @@ _dl_map_new_object (struct link_map *loader, const char *name,
  			&loader->l_runpath_dirs, &realname, &fb, loader,
  			LA_SER_RUNPATH, &found_other_class);
  
@@ -48,7 +48,7 @@ index f905578a65..d4dd0fbc2a 100644
  #ifdef USE_LDCONFIG
        if (fd == -1
  	  && (__glibc_likely ((mode & __RTLD_SECURE) == 0)
-@@ -2096,14 +2104,6 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2096,14 +2104,6 @@ _dl_map_new_object (struct link_map *loader, const char *name,
  	}
  #endif
  
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index d9731a6fb73..25c824c3bcd 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,4 +1,4 @@
-From e8af7c91033875cfaf419c840d3283d71eb72d50 Mon Sep 17 00:00:00 2001
+From c89731d75a2c15be0c1402556407ddecccd3e561 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
 Subject: [PATCH] nativesdk-glibc: Fix buffer overrun with a relocated SDK
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index d4dd0fbc2a..0cd5221d6a 100644
+index bb31af89da..d331e0f01a 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -1749,7 +1749,19 @@ open_path (const char *name, size_t namelen, int mode,
+@@ -1750,7 +1750,19 @@ open_path (const char *name, size_t namelen, int mode,
         given on the command line when rtld is run directly.  */
      return -1;
  
diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index 0ee03c95d89..23163d307f4 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,4 +1,4 @@
-From d7c4488ff48992631e14a53c27252790eaefe928 Mon Sep 17 00:00:00 2001
+From 3bc3bbda6092b1b6d497d24e319a10b4c8c48caf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
 Subject: [PATCH] nativesdk-glibc: Raise the size of arrays containing dl paths
@@ -26,10 +26,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  8 files changed, 15 insertions(+), 10 deletions(-)
 
 diff --git a/elf/dl-cache.c b/elf/dl-cache.c
-index 300aa1b6dd..6df873e08b 100644
+index f9ca40de3f..407db2aa54 100644
 --- a/elf/dl-cache.c
 +++ b/elf/dl-cache.c
-@@ -336,6 +336,10 @@ search_cache (const char *string_table, uint32_t string_table_size,
+@@ -335,6 +335,10 @@ search_cache (const char *string_table, uint32_t string_table_size,
    return best;
  }
  
@@ -41,7 +41,7 @@ index 300aa1b6dd..6df873e08b 100644
  _dl_cache_libcmp (const char *p1, const char *p2)
  {
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 0cd5221d6a..9b9593f8d8 100644
+index d331e0f01a..ee024f7136 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -107,8 +107,8 @@ enum { ncapstr = 1, max_capstrlen = 0 };
@@ -56,11 +56,11 @@ index 0cd5221d6a..9b9593f8d8 100644
    SYSTEM_DIRS_LEN
  };
 diff --git a/elf/dl-usage.c b/elf/dl-usage.c
-index c6d13ac2ee..1dac82102d 100644
+index 31b27e5ea6..3cdb99caa7 100644
 --- a/elf/dl-usage.c
 +++ b/elf/dl-usage.c
-@@ -25,6 +25,8 @@
- #include <dl-procinfo.h>
+@@ -24,6 +24,8 @@
+ 
  #include <dl-hwcaps.h>
  
 +extern const char LD_SO_CACHE[4096] __attribute__ ((section (".ldsocache")));
@@ -68,7 +68,7 @@ index c6d13ac2ee..1dac82102d 100644
  void
  _dl_usage (const char *argv0, const char *wrong_option)
  {
-@@ -185,7 +187,7 @@ setting environment variables (which would be inherited by subprocesses).\n\
+@@ -184,7 +186,7 @@ setting environment variables (which would be inherited by subprocesses).\n\
    --list                list all dependencies and how they are resolved\n\
    --verify              verify that given object really is a dynamically linked\n\
                          object we can handle\n\
@@ -77,7 +77,7 @@ index c6d13ac2ee..1dac82102d 100644
    --library-path PATH   use given PATH instead of content of the environment\n\
                          variable LD_LIBRARY_PATH\n\
    --glibc-hwcaps-prepend LIST\n\
-@@ -204,7 +206,7 @@ setting environment variables (which would be inherited by subprocesses).\n\
+@@ -203,7 +205,7 @@ setting environment variables (which would be inherited by subprocesses).\n\
  \n\
  This program interpreter self-identifies as: " RTLD "\n\
  ",
@@ -98,10 +98,10 @@ index cc49e13c86..394c1ce0c5 100644
 +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
    = RUNTIME_LINKER;
 diff --git a/elf/ldconfig.c b/elf/ldconfig.c
-index 1432187e9b..0654e02389 100644
+index 39b154c72c..c1014b773b 100644
 --- a/elf/ldconfig.c
 +++ b/elf/ldconfig.c
-@@ -151,6 +151,8 @@ static struct argp argp =
+@@ -150,6 +150,8 @@ static struct argp argp =
    options, parse_opt, NULL, doc, NULL, more_help, NULL
  };
  
@@ -111,10 +111,10 @@ index 1432187e9b..0654e02389 100644
  static error_t
  parse_opt (int key, char *arg, struct argp_state *state)
 diff --git a/elf/rtld.c b/elf/rtld.c
-index f32058bba6..434ea6d0c5 100644
+index 493f9696ea..2ae4a5d28b 100644
 --- a/elf/rtld.c
 +++ b/elf/rtld.c
-@@ -190,6 +190,7 @@ dso_name_valid_for_suid (const char *p)
+@@ -189,6 +189,7 @@ dso_name_valid_for_suid (const char *p)
      }
    return *p != '\0';
  }
diff --git a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index 597923e7929..dc9e73832f3 100644
--- a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -1,4 +1,4 @@
-From 9b408439eb042c4fc5cb33c8929dea419bf25b41 Mon Sep 17 00:00:00 2001
+From 2152334c3be94993763c5abfb2911ace0b191cd1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:35:35 -0800
 Subject: [PATCH] nativesdk-glibc: Allow 64 bit atomics for x86
diff --git a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index 2886d461c81..ca1160bf781 100644
--- a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -1,4 +1,4 @@
-From 1a57ab6f7d602401396a18b0270498ff9228cf64 Mon Sep 17 00:00:00 2001
+From bfd7e42968f20a8c46716c4319def621e8c75d1e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:55:12 -0700
 Subject: [PATCH] nativesdk-glibc: Make relocatable install for locales
@@ -54,10 +54,10 @@ index 058a467cde..af62f3c304 100644
  /* Size of initial mapping window, optimal if large enough to
     cover the header plus the initial locale.  */
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index ab1b5e5659..92aef8d58e 100644
+index f503792d04..c71be7f4d9 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
-@@ -347,7 +347,7 @@ _nl_lookup_word (locale_t l, int category, int item)
+@@ -346,7 +346,7 @@ _nl_lookup_word (locale_t l, int category, int item)
  }
  
  /* Default search path if no LOCPATH environment variable.  */
diff --git a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch b/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
index 025ad153d64..e43c81203ab 100644
--- a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
+++ b/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
@@ -1,4 +1,4 @@
-From 789083eea1feb1249ec5817710552dc31653b36e Mon Sep 17 00:00:00 2001
+From bd5a7b22d32d47a7d3b9ae0deb6e2d196025e57c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 6 Mar 2021 14:48:56 -0800
 Subject: [PATCH] nativesdk-glibc: Fall back to faccessat on faccess2 returns
diff --git a/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
index dbb6d674d59..dfc734a707f 100644
--- a/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,4 +1,4 @@
-From 4a1ff3c313645aa425a0a87459c907dad1b9ca4b Mon Sep 17 00:00:00 2001
+From 8a67937e136ba22f062802c1df276604b3f58579 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
 Subject: [PATCH] 'yes' within the path sets wrong config variables
@@ -31,7 +31,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  mode change 100644 => 100755 sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
 
 diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
-index 4bd5496a4a..6c051369fb 100755
+index f364e65fe7..258a344620 100755
 --- a/sysdeps/aarch64/configure
 +++ b/sysdeps/aarch64/configure
 @@ -157,12 +157,12 @@ else case e in #(
@@ -50,7 +50,7 @@ index 4bd5496a4a..6c051369fb 100755
    libc_cv_aarch64_be=yes
  else case e in #(
 diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
-index 56d12d661d..80fca20873 100644
+index a9a1b747f1..879db7c57c 100644
 --- a/sysdeps/aarch64/configure.ac
 +++ b/sysdeps/aarch64/configure.ac
 @@ -13,8 +13,8 @@ AC_DEFINE(SUPPORT_STATIC_PIE)
diff --git a/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
index b1bed71f2b4..25330faef5c 100644
--- a/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,4 +1,4 @@
-From 7d158af5750b351b3b08e78bb6c5fe80e7cb36ba Mon Sep 17 00:00:00 2001
+From b8806cd4e2595bbad4d7c1e39554a382572e1e94 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
 Subject: [PATCH] eglibc: Cross building and testing instructions
diff --git a/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
index 13190125eb0..d5ad72d8dd7 100644
--- a/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,4 +1,4 @@
-From 435b57e8327555b273a52df672b2611050a8c579 Mon Sep 17 00:00:00 2001
+From 86e15dc8bc5c4756bc6fa9326226ada7721b8c3c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
 Subject: [PATCH] eglibc: Help bootstrap cross toolchain
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 include/stubs-bootstrap.h
 
 diff --git a/Makefile b/Makefile
-index 97b4328af8..5c20ed3cff 100644
+index cb927fb9f9..e62fb30d11 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -79,9 +79,18 @@ subdir-dirs = include
diff --git a/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
index 780aff1e7d1..92c1821dbf3 100644
--- a/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,4 +1,4 @@
-From 46937c30c52cf186609bee1ec927464d395afb30 Mon Sep 17 00:00:00 2001
+From 41d83a92776e77bf82461d0219ad9720702b20c4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
 Subject: [PATCH] eglibc: Resolve __fpscr_values on SH4
diff --git a/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
index 8f9bbb6cf37..0bad6d7ba87 100644
--- a/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,4 +1,4 @@
-From 68dcae2527a64a4448334fdfe27c7b6014589aae Mon Sep 17 00:00:00 2001
+From ac8410f1f87a9b93107a0d6a46707fbe4532d154 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
 Subject: [PATCH] eglibc: Forward port cross locale generation support
@@ -87,10 +87,10 @@ index 0000000000..538f3f5edb
 +    [LC_ALL] = sizeof ("LC_ALL") - 1
 +  };
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index 92aef8d58e..ae23b2f7fe 100644
+index c71be7f4d9..7e3cf2b920 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
-@@ -246,7 +246,7 @@ __libc_tsd_define (extern, locale_t, LOCALE)
+@@ -245,7 +245,7 @@ extern __thread locale_t __libc_tsd_LOCALE
     unused.  We can manage this playing some tricks with weak references.
     But with thread-local locale settings, it becomes quite ungainly unless
     we can use __thread variables.  So only in that case do we attempt this.  */
diff --git a/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch b/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
index 9448f360efd..62f7ca74c54 100644
--- a/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
+++ b/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
@@ -1,4 +1,4 @@
-From 194e83794369783287956fb12c7f8469e6b7d110 Mon Sep 17 00:00:00 2001
+From 1985a7225e52d8d56e2e48a5ecab83bba8178f21 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:42:06 -0700
 Subject: [PATCH] localedef --add-to-archive uses a hard-coded locale path
@@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/locale/programs/locarchive.c b/locale/programs/locarchive.c
-index 2c19f4fd29..b8495848c3 100644
+index ad025a819b..0ca7465bcc 100644
 --- a/locale/programs/locarchive.c
 +++ b/locale/programs/locarchive.c
 @@ -339,12 +339,24 @@ enlarge_archive (struct locarhandle *ah, const struct locarhead *head)
diff --git a/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch b/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch
index 0e00c046597..a8a0c177743 100644
--- a/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch
+++ b/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch
@@ -1,4 +1,4 @@
-From 7d7f6fcd4f4b6664bff75addc92bc7b8a86dc22d Mon Sep 17 00:00:00 2001
+From 947d62bf6a6d341aaba3143df4a644126d2c34f1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Aug 2020 14:31:16 -0700
 Subject: [PATCH] powerpc: Do not ask compiler for finding arch
diff --git a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index f40a8eff07a..52ba027c137 100644
--- a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -1,4 +1,4 @@
-From 2bd0ea2c8f9595414741ed523c6ca07630a4fc96 Mon Sep 17 00:00:00 2001
+From 14a3c302c1394781b19ff7fdb5c6f3c06aca5d51 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 May 2020 17:05:45 -0700
 Subject: [PATCH] wordsize.h: Unify the header between arm and aarch64
@@ -11,36 +11,32 @@ Upstream-Status: Inappropriate [ OE-Specific ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sysdeps/aarch64/bits/wordsize.h | 11 +++++++++--
+ sysdeps/aarch64/bits/wordsize.h | 14 ++++++++++++--
  sysdeps/arm/bits/wordsize.h     | 22 +---------------------
- 2 files changed, 10 insertions(+), 23 deletions(-)
+ 2 files changed, 13 insertions(+), 23 deletions(-)
  mode change 100644 => 120000 sysdeps/arm/bits/wordsize.h
 
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/aarch64/bits/wordsize.h
-index f56260c2de..391d79d5a8 100644
+index 33d0e20566..57bbda568e 100644
 --- a/sysdeps/aarch64/bits/wordsize.h
 +++ b/sysdeps/aarch64/bits/wordsize.h
-@@ -17,12 +17,19 @@
+@@ -17,5 +17,15 @@
     License along with the GNU C Library; if not, see
     <https://www.gnu.org/licenses/>.  */
  
--#ifdef __LP64__
+-#define __WORDSIZE			64
+-#define __WORDSIZE_TIME64_COMPAT32	0
 +#if defined (__aarch64__) && defined (__LP64__)
- # define __WORDSIZE			64
--#else
-+#elif defined (__aarch64__)
- # define __WORDSIZE			32
- # define __WORDSIZE32_SIZE_ULONG	1
- # define __WORDSIZE32_PTRDIFF_LONG	1
++# define __WORDSIZE			64
 +#else
 +# define __WORDSIZE			32
 +# define __WORDSIZE_TIME64_COMPAT32	1
 +# define __WORDSIZE32_SIZE_ULONG	0
 +# define __WORDSIZE32_PTRDIFF_LONG	0
- #endif
- 
++#endif
++
 +#ifdef __aarch64__
- #define __WORDSIZE_TIME64_COMPAT32	0
++# define __WORDSIZE_TIME64_COMPAT32	0
 +#endif
 diff --git a/sysdeps/arm/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
 deleted file mode 100644
diff --git a/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
index 2af39799bed..f0dead30052 100644
--- a/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
@@ -1,4 +1,4 @@
-From 7ef9358bbb184026914fb4d9ff479361b82bf6c9 Mon Sep 17 00:00:00 2001
+From 806d6d37765d3a1454720c194758304768171f95 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
 Subject: [PATCH] Replace echo with printf builtin in nscd init script
diff --git a/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch b/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
index ca30edd91c5..b0e4d587b83 100644
--- a/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
+++ b/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
@@ -1,4 +1,4 @@
-From c43c1758baddaff1fb82afc118f7dba23af12540 Mon Sep 17 00:00:00 2001
+From 6fca57088d013e22f9204570f72ac398b59b6689 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
 Subject: [PATCH] sysdeps/gnu/configure.ac: Set libc_cv_rootsbindir only if its
diff --git a/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch b/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
index 2e4c6ced9ed..b95c2eb6d82 100644
--- a/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
+++ b/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
@@ -1,4 +1,4 @@
-From a2179a1a5e0f6ded889d2c88cabb23c92b5a4b1e Mon Sep 17 00:00:00 2001
+From 7bab0da0d299f7c1cf4111b0da2510fe0bc83a01 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 9 Dec 2021 15:14:42 -0800
 Subject: [PATCH] timezone: Make shell interpreter overridable in tzselect.ksh
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 10 insertions(+)
 
 diff --git a/Makeconfig b/Makeconfig
-index d0108d2caa..75887b1334 100644
+index 7102d922b2..38a0b4a569 100644
 --- a/Makeconfig
 +++ b/Makeconfig
 @@ -309,6 +309,15 @@ ifndef sysincludedir
diff --git a/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch b/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
index e68e37b1254..ea4c0afb090 100644
--- a/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
+++ b/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
@@ -1,4 +1,4 @@
-From c86de3e8b739f20fd7211b66dc3c69b61d28d611 Mon Sep 17 00:00:00 2001
+From 38dc3d019fbfa6c4b15f242b46c95ad35f427594 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 15 Dec 2021 21:47:53 -0800
 Subject: [PATCH] tzselect.ksh: Use /bin/sh default shell interpreter
diff --git a/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
index f1391a095cb..09d5bf745e8 100644
--- a/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
+++ b/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
@@ -1,4 +1,4 @@
-From 06dd2eec0d57e1e2702069ee4c970c68fc4d3bcb Mon Sep 17 00:00:00 2001
+From 7c5d4f1c2161c0ff4fc0057ff0f1382bd784e06a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sun, 29 Aug 2021 20:49:16 +0800
 Subject: [PATCH] fix create thread failed in unprivileged process [BZ #28287]
diff --git a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch b/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
index a90814c63a5..9fa5d471adf 100644
--- a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
+++ b/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
@@ -1,4 +1,4 @@
-From cd66a5301c4d84e3dbc4e30fdb9e32b341e66b3d Mon Sep 17 00:00:00 2001
+From 662d544fbed823b9bf917058762ddb54bcee5f07 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 24 Jul 2022 07:07:29 -0700
 Subject: [PATCH] Avoid hardcoded build time paths in the output binaries
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/support/Makefile b/support/Makefile
-index 59a9974539..c3f7302bcb 100644
+index d41278eeab..657769418e 100644
 --- a/support/Makefile
 +++ b/support/Makefile
 @@ -238,9 +238,9 @@ libsupport-inhibit-o += .o
diff --git a/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch b/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
index 50d80ed577f..1dc2d694efb 100644
--- a/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
+++ b/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
@@ -1,4 +1,4 @@
-From 5395ccff4478d42fab7f2bd6ba7f7188bec09ddf Mon Sep 17 00:00:00 2001
+From 2630f675276f3be0d045f5ca7fd21b1e422a03f6 Mon Sep 17 00:00:00 2001
 From: Yash Shinde <Yash.Shinde@windriver.com>
 Date: Fri, 5 Apr 2024 08:24:36 -0700
 Subject: [PATCH] tests: Skip 2 qemu tests that can hang in oe-selftest
@@ -20,18 +20,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/sysdeps/unix/sysv/linux/Makefile b/sysdeps/unix/sysv/linux/Makefile
-index 8a755293b3..22dafcaad1 100644
+index c47cbdf428..1c4f3509ac 100644
 --- a/sysdeps/unix/sysv/linux/Makefile
 +++ b/sysdeps/unix/sysv/linux/Makefile
-@@ -228,7 +228,6 @@ tests += \
-   tst-rlimit-infinity \
+@@ -220,7 +220,6 @@ tests += \
    tst-sched-affinity-inheritance \
    tst-sched_setattr \
+   tst-sched_setattr-thread \
 -  tst-scm_rights \
    tst-sigtimedwait \
    tst-sync_file_range \
    tst-syscall-restart \
-@@ -240,6 +239,8 @@ tests += \
+@@ -232,6 +231,8 @@ tests += \
    tst-timerfd \
    tst-ttyname-direct \
    tst-ttyname-namespace \
@@ -40,7 +40,7 @@ index 8a755293b3..22dafcaad1 100644
    # tests
  
  # process_madvise requires CAP_SYS_ADMIN.
-@@ -282,9 +283,10 @@ tests-time64 += \
+@@ -274,9 +275,10 @@ tests-time64 += \
    tst-ntp_gettimex-time64 \
    tst-ppoll-time64 \
    tst-prctl-time64 \
diff --git a/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch b/meta/recipes-core/glibc/glibc/0024-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
similarity index 60%
rename from meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
rename to meta/recipes-core/glibc/glibc/0024-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
index b42b1864181..81e580fc722 100644
--- a/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
+++ b/meta/recipes-core/glibc/glibc/0024-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
@@ -1,24 +1,28 @@
-From 603e50d6b8ccadb32d59b0497f76629665c1794b Mon Sep 17 00:00:00 2001
+From 111cb0b1f7410eea49ed8869c74352a11cdcbf0f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 16 Apr 2025 19:51:01 -0700
 Subject: [PATCH] Propagate -ffile-prefix-map from CFLAGS to ASFLAGS.
 
-Upstream-Status: Submitted [https://sourceware.org/pipermail/libc-alpha/2025-April/165969.html]
+-ffile-prefix-map also implies -fdebug-prefix-map
+and some systems may use --ffile-prefix-map for building
+reprodubile systems
+
+Upstream-Status: Submitted [https://patchwork.sourceware.org/project/glibc/patch/20250429064632.2048954-1-raj.khem@gmail.com/]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Makeconfig | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makeconfig b/Makeconfig
-index e35c5cfe4e..7a19c731c6 100644
+index 38a0b4a569..21a6ee94c1 100644
 --- a/Makeconfig
 +++ b/Makeconfig
-@@ -1172,7 +1172,7 @@ endif
+@@ -1191,7 +1191,7 @@ endif
  
  # The assembler can generate debug information too.
  ifndef ASFLAGS
 -ASFLAGS := $(filter -g% -fdebug-prefix-map=%,$(CFLAGS))
 +ASFLAGS := $(filter -g% -fdebug-prefix-map=% -ffile-prefix-map=%,$(CFLAGS))
  endif
- override ASFLAGS += -Werror=undef $(ASFLAGS-config) $(asflags-cpu)
+ override ASFLAGS += -Werror=undef $(ASFLAGS-config) $(asflags-cpu) $(as-sframe)
  
diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/glibc/glibc_2.42.bb
similarity index 97%
rename from meta/recipes-core/glibc/glibc_2.41.bb
rename to meta/recipes-core/glibc/glibc_2.42.bb
index 0852bb4bdbe..56d974e8986 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.42.bb
@@ -53,8 +53,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
-           file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch \
-           file://0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
+           file://0024-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
 "
 B = "${WORKDIR}/build-${TARGET_SYS}"
 

