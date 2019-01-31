Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 809537C42D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 18:11:55 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p8so1841297plo.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 10:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YnqYoTybllvJ02Cyr+CbaM8/gnkjbhDL74VnZ4OtDYc=;
	b=kzu4/P1An7n+dcl3jQnmRNrBZJ+dVvrU0CIHZKDSd3Tuew2gfkZeVg1aorM9rN0A0q
	vuNSyilhkgLbIShbNDPbQ72Cp2Ye9aq+SU4EizDvwGx46rzBSsbp0iC3p78N/7fkC1u+
	6QAWkLE5rjlQaYJ/lm08U1Hk+dbeO/4/N7WSk5bDmzdAfKUiWs7C0zIzbUhXJ3bd46VJ
	2eMnB6ERoM0oX3Fso1MGbFArYsHGAw4NGMxhNjnCx5uWTnO0jyIiKT8xdVnk/rieWJxi
	BvLyJ2v+JKD2DMAueiOBtw/r1sglqRNPjSwnui/kRXIRe2MJ6MFRSe//fgDXGsekWOxT
	7F/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YnqYoTybllvJ02Cyr+CbaM8/gnkjbhDL74VnZ4OtDYc=;
	b=PujyJvLsjVHWiyB/ptW4uNn3y3IHEdipxbMLcG1uUNIO/wRWPmfZFdOoiiBX/Xdwi0
	vXSsBzfw6OHP7odtHxJMo6p8G8eWSiBiz4e3HSeSET0RfCdPzlto2BDkxfIT1PRNpSzy
	w3Rgct2MGQ42/UjsMIi7IXjV03D9sjoJYhWWcCYlRJ6AowrJFyZxwb2Y7SzJjYBez5xu
	3el4jL72neGxFCbJiaRq9+3QtWbHQpV8qQeHPCEMmevr34nM3gRxF5zLR2bABidWfQEM
	mohNH9uJ4GoiBmxZLUkzfl+6RbKUpiC+i4U/aQ5KhRo0FRWLOMq9g2Us5S0icJ2aziJw
	sg5A==
X-Gm-Message-State: AJcUukdTLdUHaluChX6pbYvPQPeIQSfGjEm47k4yUtdcgxKmetmC9tkF
	elO4JofE8rcJU2dH4CMBPjFZrfP2
X-Google-Smtp-Source: ALg8bN70joGQNWZ1Q6zxO79N4cPxvEFEJwvgjwzhpfy0mF1w5REc37HcfBbpPoA5NX5IpXZpCrz4/g==
X-Received: by 2002:a17:902:a58a:: with SMTP id
	az10mr36458522plb.10.1548958314447; 
	Thu, 31 Jan 2019 10:11:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	w185sm8409192pfb.135.2019.01.31.10.11.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 10:11:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2019 10:11:44 -0800
Message-Id: <20190131181144.38107-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Pratyush Anand <panand@redhat.com>
Subject: [PATCH] glibc: Update to 2.29 release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2019 18:11:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 ...2.28.bb => cross-localedef-native_2.29.bb} |   8 +-
 meta/recipes-core/glibc/glibc-collateral.inc  |   1 +
 ...bc-locale_2.28.bb => glibc-locale_2.29.bb} |   0
 ...bc-mtrace_2.28.bb => glibc-mtrace_2.29.bb} |   0
 ...-scripts_2.28.bb => glibc-scripts_2.29.bb} |   0
 ...Look-for-host-system-ld.so.cache-as-.patch |  10 +-
 ...Fix-buffer-overrun-with-a-relocated-.patch |  10 +-
 ...Raise-the-size-of-arrays-containing-.patch |  26 +-
 ...k-glibc-Allow-64-bit-atomics-for-x86.patch |  39 ++-
 ...Make-relocatable-install-for-locales.patch |  13 +-
 ...5500-e6500-603e-fsqrt-implementation.patch |   7 +-
 ...RE_KNOWN_INTERPRETER_NAMES-to-known-.patch |  10 +-
 ...undefined-reference-to-__sqrt_finite.patch |   7 +-
 ...-are-now-inline-functions-and-call-o.patch |   9 +-
 ...443-which-explains-what-the-patch-do.patch |  10 +-
 ...m-err-tab.pl-with-specific-dirs-in-S.patch |  21 +-
 ...-are-now-inline-functions-and-call-o.patch |   9 +-
 ...igure.ac-handle-correctly-libc_cv_ro.patch |   7 +-
 .../glibc/0014-Add-unused-attribute.patch     |   9 +-
 ...the-path-sets-wrong-config-variables.patch |   7 +-
 ...zone-re-written-tzselect-as-posix-sh.patch |  13 +-
 ...bash-dependency-for-nscd-init-script.patch |   7 +-
 ...ss-building-and-testing-instructions.patch |   7 +-
 ...glibc-Help-bootstrap-cross-toolchain.patch |   9 +-
 ...0-eglibc-Clear-cache-lines-on-ppc8xx.patch |  11 +-
 ...eglibc-Resolve-__fpscr_values-on-SH4.patch |   9 +-
 ...port-cross-locale-generation-support.patch |  45 +--
 ...Define-DUMMY_LOCALE_T-if-not-defined.patch |   9 +-
 ...archive-uses-a-hard-coded-locale-pa.patch} |  29 +-
 ...e-_dl_build_local_scope-breadth-fir.patch} |   9 +-
 ...le-fix-hard-coded-reference-to-gcc-E.patch |  35 ---
 ...set-dl_load_write_lock-after-forking.patch |   9 +-
 ...ck-before-switching-to-malloc_atfork.patch |   9 +-
 ...sts.h-enum-definition-for-TRAP_HWBKP.patch |  66 -----
 ...t-no-lines-in-bison-generated-files.patch} |   9 +-
 ...029-inject-file-assembly-directives.patch} | 172 +++++++-----
 ...ybe-uninitialized-errors-with-Os-BZ.patch} |  36 +--
 ...prevent-maybe-uninitialized-errors-w.patch | 258 ------------------
 ...soft-fp-ignore-maybe-uninitialized-w.patch | 100 -------
 .../glibc/{glibc_2.28.bb => glibc_2.29.bb}    |  36 ++-
 41 files changed, 367 insertions(+), 716 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.28.bb => cross-localedef-native_2.29.bb} (90%)
 rename meta/recipes-core/glibc/{glibc-locale_2.28.bb => glibc-locale_2.29.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.28.bb => glibc-mtrace_2.29.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.28.bb => glibc-scripts_2.29.bb} (100%)
 rename meta/recipes-core/glibc/glibc/{0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch => 0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch} (80%)
 rename meta/recipes-core/glibc/glibc/{0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch => 0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch} (88%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch
 rename meta/recipes-core/glibc/glibc/{0030-intl-Emit-no-lines-in-bison-generated-files.patch => 0028-intl-Emit-no-lines-in-bison-generated-files.patch} (83%)
 rename meta/recipes-core/glibc/glibc/{0034-inject-file-assembly-directives.patch => 0029-inject-file-assembly-directives.patch} (78%)
 rename meta/recipes-core/glibc/glibc/{0033-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch => 0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch} (64%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors-w.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0032-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch
 rename meta/recipes-core/glibc/{glibc_2.28.bb => glibc_2.29.bb} (88%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 812b923fa2..cd6acf3219 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ GCCVERSION ?= "8.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.31%"
 GDBVERSION ?= "8.2%"
-GLIBCVERSION ?= "2.28%"
+GLIBCVERSION ?= "2.29%"
 LINUXLIBCVERSION ?= "4.19%"
 QEMUVERSION ?= "3.1%"
 GOVERSION ?= "1.11%"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.28.bb b/meta/recipes-core/glibc/cross-localedef-native_2.29.bb
similarity index 90%
rename from meta/recipes-core/glibc/cross-localedef-native_2.28.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.29.bb
index a05b94e3b3..edb4fd40dc 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.28.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.29.bb
@@ -21,8 +21,10 @@ SRCBRANCH ?= "release/${PV}/master"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
 
-SRCREV_glibc ?= "3c03baca37fdcb52c3881e653ca392bba7a99c2b"
-SRCREV_localedef ?= "c328777219ccc480be3112cf807217ca6b570b64"
+PV = "2.29"
+
+SRCREV_glibc ?= "56c86f5dd516284558e106d04b92875d5b623b7a"
+SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
@@ -34,7 +36,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-eglibc-Resolve-__fpscr_values-on-SH4.patch \
            file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
-           file://0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
+           file://0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
 "
 # Makes for a rather long rev (22 characters), but...
 #
diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/recipes-core/glibc/glibc-collateral.inc
index 536edfb040..b370df314f 100644
--- a/meta/recipes-core/glibc/glibc-collateral.inc
+++ b/meta/recipes-core/glibc/glibc-collateral.inc
@@ -21,3 +21,4 @@ do_install[depends] += "virtual/${MLPREFIX}libc:do_stash_locale"
 
 COMPATIBLE_HOST_libc-musl_class-target = "null"
 
+PV = "2.28.9000"
diff --git a/meta/recipes-core/glibc/glibc-locale_2.28.bb b/meta/recipes-core/glibc/glibc-locale_2.29.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.28.bb
rename to meta/recipes-core/glibc/glibc-locale_2.29.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.28.bb b/meta/recipes-core/glibc/glibc-mtrace_2.29.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.28.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.29.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.28.bb b/meta/recipes-core/glibc/glibc-scripts_2.29.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.28.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.29.bb
diff --git a/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index 5df26a8545..86ad9eaf1c 100644
--- a/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,7 +1,8 @@
-From bd51b3add89a5cb2d8f44029a1027c780b2afff5 Mon Sep 17 00:00:00 2001
+From 0cac7493366586e8f87e8459359c15f702ef8c81 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:48:24 +0000
-Subject: [PATCH] nativesdk-glibc: Look for host system ld.so.cache as well
+Subject: [PATCH 01/30] nativesdk-glibc: Look for host system ld.so.cache as
+ well
 
 Upstream-Status: Inappropriate [embedded specific]
 
@@ -30,7 +31,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index c51e4b3718..44bbb69dc4 100644
+index f972524421..e53c3a1b7b 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -2085,6 +2085,14 @@ _dl_map_object (struct link_map *loader, const char *name,
@@ -63,3 +64,6 @@ index c51e4b3718..44bbb69dc4 100644
        /* Add another newline when we are tracing the library loading.  */
        if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_LIBS))
  	_dl_debug_printf ("\n");
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index daadec76c7..f663e18edd 100644
--- a/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,7 +1,8 @@
-From fdc8a33ac2c81a0237b8a6d8b1aac7f1cdbb46af Mon Sep 17 00:00:00 2001
+From f275c04e263fc2ebf2eaad6ac1ab3c838647bb14 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
-Subject: [PATCH] nativesdk-glibc: Fix buffer overrun with a relocated SDK
+Subject: [PATCH 02/30] nativesdk-glibc: Fix buffer overrun with a relocated
+ SDK
 
 When ld-linux-*.so.2 is relocated to a path that is longer than the
 original fixed location, the dynamic loader will crash in open_path
@@ -21,7 +22,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 44bbb69dc4..74e2e5e962 100644
+index e53c3a1b7b..2bd9bc27f2 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -1785,7 +1785,19 @@ open_path (const char *name, size_t namelen, int mode,
@@ -44,3 +45,6 @@ index 44bbb69dc4..74e2e5e962 100644
    do
      {
        struct r_search_path_elem *this_dir = *dirs;
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index e082540303..fd909f644a 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,7 +1,8 @@
-From 055dd46b793168fb08e44913153010b088011ba2 Mon Sep 17 00:00:00 2001
+From 92df5673de18779b612609afa4f687e33e5ecb6e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
-Subject: [PATCH] nativesdk-glibc: Raise the size of arrays containing dl paths
+Subject: [PATCH 03/30] nativesdk-glibc: Raise the size of arrays containing dl
+ paths
 
 This patch puts the dynamic loader path in the binaries, SYSTEM_DIRS strings
 and lengths as well as ld.so.cache path in the dynamic loader to specific
@@ -25,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  7 files changed, 14 insertions(+), 10 deletions(-)
 
 diff --git a/elf/dl-cache.c b/elf/dl-cache.c
-index 6ee5153ff9..37a5f701fa 100644
+index d8d1e2344e..d2247bfc4f 100644
 --- a/elf/dl-cache.c
 +++ b/elf/dl-cache.c
 @@ -133,6 +133,10 @@ do									      \
@@ -40,7 +41,7 @@ index 6ee5153ff9..37a5f701fa 100644
  _dl_cache_libcmp (const char *p1, const char *p2)
  {
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 74e2e5e962..8f19186e1c 100644
+index 2bd9bc27f2..4170cc1a09 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -110,8 +110,8 @@ static size_t max_capstrlen attribute_relro;
@@ -55,7 +56,7 @@ index 74e2e5e962..8f19186e1c 100644
    SYSTEM_DIRS_LEN
  };
 diff --git a/elf/interp.c b/elf/interp.c
-index 9cd50c7291..fc2f39d73c 100644
+index 243829f5f7..0e74241703 100644
 --- a/elf/interp.c
 +++ b/elf/interp.c
 @@ -18,5 +18,5 @@
@@ -66,7 +67,7 @@ index 9cd50c7291..fc2f39d73c 100644
 +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
    = RUNTIME_LINKER;
 diff --git a/elf/ldconfig.c b/elf/ldconfig.c
-index fbdd814edf..9f4d8d69b1 100644
+index 206cd51df6..2fd4fb54ae 100644
 --- a/elf/ldconfig.c
 +++ b/elf/ldconfig.c
 @@ -168,6 +168,9 @@ static struct argp argp =
@@ -80,7 +81,7 @@ index fbdd814edf..9f4d8d69b1 100644
     a platform.  */
  static int
 diff --git a/elf/rtld.c b/elf/rtld.c
-index 1b0c74739f..a70a62d31e 100644
+index 5d97f41b7b..26c5fef929 100644
 --- a/elf/rtld.c
 +++ b/elf/rtld.c
 @@ -130,6 +130,7 @@ dso_name_valid_for_suid (const char *p)
@@ -107,7 +108,7 @@ index 1b0c74739f..a70a62d31e 100644
        ++_dl_skip_args;
        --_dl_argc;
 diff --git a/iconv/gconv_conf.c b/iconv/gconv_conf.c
-index f173cde71b..5c3205026f 100644
+index ae8937cba0..f321ee419e 100644
 --- a/iconv/gconv_conf.c
 +++ b/iconv/gconv_conf.c
 @@ -36,7 +36,7 @@
@@ -117,10 +118,10 @@ index f173cde71b..5c3205026f 100644
 -static const char default_gconv_path[] = GCONV_PATH;
 +static char default_gconv_path[4096] __attribute__ ((section (".gccrelocprefix"))) = GCONV_PATH;
  
- /* The path elements, as determined by the __gconv_get_path function.
-    All path elements end in a slash.  */
+ /* Type to represent search path.  */
+ struct path_elem
 diff --git a/sysdeps/generic/dl-cache.h b/sysdeps/generic/dl-cache.h
-index cf43f1cf3b..7f07adde53 100644
+index bc8b40331d..b0fdd2144b 100644
 --- a/sysdeps/generic/dl-cache.h
 +++ b/sysdeps/generic/dl-cache.h
 @@ -27,10 +27,6 @@
@@ -134,3 +135,6 @@ index cf43f1cf3b..7f07adde53 100644
  #ifndef add_system_dir
  # define add_system_dir(dir) add_dir (dir)
  #endif
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index 1ae2e33b4f..d6c9aac69d 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -1,7 +1,7 @@
-From a237553ccd15276462be2023057a017fa8ee5d7c Mon Sep 17 00:00:00 2001
+From ff0f4756f1a98202726c65745aca38354864e033 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:35:35 -0800
-Subject: [PATCH] nativesdk-glibc: Allow 64 bit atomics for x86
+Subject: [PATCH 04/30] nativesdk-glibc: Allow 64 bit atomics for x86
 
 The fix consist of allowing 64bit atomic ops for x86.
 This should be safe for i586 and newer CPUs.
@@ -13,19 +13,30 @@ Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sysdeps/i386/atomic-machine.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ sysdeps/x86/atomic-machine.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
 
-diff --git a/sysdeps/i386/atomic-machine.h b/sysdeps/i386/atomic-machine.h
-index 272da5dd8f..409c759f14 100644
---- a/sysdeps/i386/atomic-machine.h
-+++ b/sysdeps/i386/atomic-machine.h
-@@ -54,7 +54,7 @@ typedef uintmax_t uatomic_max_t;
- # endif
+diff --git a/sysdeps/x86/atomic-machine.h b/sysdeps/x86/atomic-machine.h
+index aa60ca4cd6..3e42e00183 100644
+--- a/sysdeps/x86/atomic-machine.h
++++ b/sysdeps/x86/atomic-machine.h
+@@ -58,15 +58,14 @@ typedef uintmax_t uatomic_max_t;
  #endif
  
--#define __HAVE_64B_ATOMICS 0
-+#define __HAVE_64B_ATOMICS 1
- #define USE_ATOMIC_COMPILER_BUILTINS 0
- #define ATOMIC_EXCHANGE_USES_CAS 0
+ #define USE_ATOMIC_COMPILER_BUILTINS	1
++# define __HAVE_64B_ATOMICS		1
  
+ #ifdef __x86_64__
+-# define __HAVE_64B_ATOMICS		1
+ # define SP_REG				"rsp"
+ # define SEG_REG			"fs"
+ # define BR_CONSTRAINT			"q"
+ # define IBR_CONSTRAINT			"iq"
+ #else
+-# define __HAVE_64B_ATOMICS		0
+ # define SP_REG				"esp"
+ # define SEG_REG			"gs"
+ # define BR_CONSTRAINT			"r"
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index b53f2ef2e2..9f9f503a1e 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -1,7 +1,7 @@
-From e1dc85af1800afa4fbf4eb5a59cc41025495af57 Mon Sep 17 00:00:00 2001
+From b2ec111dc3a42d9dce71c903524724ae82ff22d8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:55:12 -0700
-Subject: [PATCH] nativesdk-glibc: Make relocatable install for locales
+Subject: [PATCH 05/30] nativesdk-glibc: Make relocatable install for locales
 
 The glibc locale path is hard-coded to the install prefix, but in SDKs we need
 to be able to relocate the binaries.  Expand the strings to 4K and put them in a
@@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/locale/findlocale.c b/locale/findlocale.c
-index 872cadb5b9..dd651e07f5 100644
+index 9af605bd64..b2b0a3f93b 100644
 --- a/locale/findlocale.c
 +++ b/locale/findlocale.c
 @@ -56,7 +56,7 @@ struct __locale_data *const _nl_C[] attribute_hidden =
@@ -40,7 +40,7 @@ index 872cadb5b9..dd651e07f5 100644
    else
      /* We really have to load some data.  First see whether the name is
 diff --git a/locale/loadarchive.c b/locale/loadarchive.c
-index 516d30d8d1..9bfbe1a5dd 100644
+index 803c1cf2a4..9023f475b8 100644
 --- a/locale/loadarchive.c
 +++ b/locale/loadarchive.c
 @@ -42,7 +42,7 @@
@@ -53,7 +53,7 @@ index 516d30d8d1..9bfbe1a5dd 100644
  /* Size of initial mapping window, optimal if large enough to
     cover the header plus the initial locale.  */
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index 68822a6319..537bc35149 100644
+index 7c1cc3eecb..53cb8bfc59 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
 @@ -325,7 +325,7 @@ _nl_lookup_word (locale_t l, int category, int item)
@@ -65,3 +65,6 @@ index 68822a6319..537bc35149 100644
  
  /* Load the locale data for CATEGORY from the file specified by *NAME.
     If *NAME is "", use environment variables as specified by POSIX, and
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch b/meta/recipes-core/glibc/glibc/0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
index 971700a6df..a6dddebbc0 100644
--- a/meta/recipes-core/glibc/glibc/0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
+++ b/meta/recipes-core/glibc/glibc/0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
@@ -1,7 +1,7 @@
-From d23c577b0b70b34335971abaf3f50e617dda615e Mon Sep 17 00:00:00 2001
+From 4dc4b4f63dd79734078fa54446edb7fe2d9c74fa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:01:50 +0000
-Subject: [PATCH] fsl e500/e5500/e6500/603e fsqrt implementation
+Subject: [PATCH 06/30] fsl e500/e5500/e6500/603e fsqrt implementation
 
 Upstream-Status: Pending
 Signed-off-by: Edmar Wienskoski <edmar@freescale.com>
@@ -1579,3 +1579,6 @@ index 0000000000..04ff8cc181
 +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc64/e6500/fpu
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch b/meta/recipes-core/glibc/glibc/0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
index 4871346838..17ffc6fd48 100644
--- a/meta/recipes-core/glibc/glibc/0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
+++ b/meta/recipes-core/glibc/glibc/0007-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
@@ -1,7 +1,8 @@
-From d65f6ee214d7d91445fceabc6a5d6bf55b0e8d4b Mon Sep 17 00:00:00 2001
+From 5506296ef55a6e4916febab63805ddf2d5a5293c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:11:22 +0000
-Subject: [PATCH] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known names
+Subject: [PATCH 07/30] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known
+ names
 
 This bolts in a hook for OE to pass its own version of interpreter
 names into glibc especially for multilib case, where it differs from any
@@ -16,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/elf/readlib.c b/elf/readlib.c
-index 573c01476c..d8c7412287 100644
+index c9743e6692..6307f918fc 100644
 --- a/elf/readlib.c
 +++ b/elf/readlib.c
 @@ -51,6 +51,7 @@ static struct known_names interpreters[] =
@@ -27,3 +28,6 @@ index 573c01476c..d8c7412287 100644
  };
  
  static struct known_names known_libs[] =
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch b/meta/recipes-core/glibc/glibc/0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
index c0d96eb1f5..aacc9f2e3c 100644
--- a/meta/recipes-core/glibc/glibc/0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
+++ b/meta/recipes-core/glibc/glibc/0008-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
@@ -1,7 +1,7 @@
-From ee3aa1464f40c916c62cf326bf4c18f8b71a229b Mon Sep 17 00:00:00 2001
+From ea969d7767428d73823c91ad9955829bd66b9e58 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:15:07 +0000
-Subject: [PATCH] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
+Subject: [PATCH 08/30] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
 
 on ppc fixes the errors like below
 | ./.libs/libpulsecore-1.1.so: undefined reference to `__sqrt_finite'
@@ -203,3 +203,6 @@ index 26fa067abf..9d175122a8 100644
    return f_washf (b);
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index d0b47cd67b..b1d4413036 100644
--- a/meta/recipes-core/glibc/glibc/0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0009-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,8 +1,8 @@
-From 17e82d594b2d8d3a6998face953382f9d14fb046 Mon Sep 17 00:00:00 2001
+From a9e6ca45cdaf13ee595089a5a580d00a95a06bf1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:16:38 +0000
-Subject: [PATCH] __ieee754_sqrt{,f} are now inline functions and call out
- __slow versions
+Subject: [PATCH 09/30] __ieee754_sqrt{,f} are now inline functions and call
+ out __slow versions
 
 Upstream-Status: Pending
 
@@ -382,3 +382,6 @@ index 9d175122a8..10de1f0cc3 100644
 +}
 +
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch b/meta/recipes-core/glibc/glibc/0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
index 86ef3a1059..46d205808e 100644
--- a/meta/recipes-core/glibc/glibc/0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
+++ b/meta/recipes-core/glibc/glibc/0010-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
@@ -1,7 +1,8 @@
-From fe8d9b76e7c881cc0a0b728ea2bd637fafca0978 Mon Sep 17 00:00:00 2001
+From 50ad00401eb16bb88c57d95bc927deeec4033e01 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:20:09 +0000
-Subject: [PATCH] Quote from bug 1443 which explains what the patch does :
+Subject: [PATCH 10/30] Quote from bug 1443 which explains what the patch does
+ :
 
   We build some random program and link it with -lust.  When we run it,
   it dies with a SIGSEGV before reaching main().
@@ -44,7 +45,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sysdeps/arm/dl-machine.h b/sysdeps/arm/dl-machine.h
-index 1a4fd3f17b..a02c47571a 100644
+index 7a2f9d9b78..36a1dd1888 100644
 --- a/sysdeps/arm/dl-machine.h
 +++ b/sysdeps/arm/dl-machine.h
 @@ -510,7 +510,7 @@ elf_machine_rel (struct link_map *map, const Elf32_Rel *reloc,
@@ -56,3 +57,6 @@ index 1a4fd3f17b..a02c47571a 100644
  	  break;
  
  	case R_ARM_TLS_TPOFF32:
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/glibc/glibc/0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
index 32aae5cd53..293b72e79e 100644
--- a/meta/recipes-core/glibc/glibc/0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
+++ b/meta/recipes-core/glibc/glibc/0011-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
@@ -1,7 +1,7 @@
-From 3012cb839a64e7d5c621efa79b643d169290e6e9 Mon Sep 17 00:00:00 2001
+From a29a718890a3f32e7135f6b64b1a80c74f2d1454 Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Wed, 19 Dec 2012 04:39:57 -0600
-Subject: [PATCH] eglibc: run libm-err-tab.pl with specific dirs in ${S}
+Subject: [PATCH 11/30] eglibc: run libm-err-tab.pl with specific dirs in ${S}
 
 libm-err-tab.pl will parse all the files named "libm-test-ulps"
 in the given dir recursively. To avoid parsing the one in
@@ -18,16 +18,19 @@ Signed-off-by: Ting Liu <b28495@freescale.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/manual/Makefile b/manual/Makefile
-index c2756640a7..1b5bb16a96 100644
+index 4f76ee85d2..04b8c8c320 100644
 --- a/manual/Makefile
 +++ b/manual/Makefile
-@@ -102,7 +102,8 @@ $(objpfx)libm-err.texi: $(objpfx)stamp-libm-err
- $(objpfx)stamp-libm-err: libm-err-tab.pl $(wildcard $(foreach dir,$(sysdirs),\
- 						     $(dir)/libm-test-ulps))
+@@ -103,7 +103,8 @@ $(objpfx)stamp-libm-err: $(..)math/gen-libm-test.py \
+ 			 $(wildcard $(foreach dir,$(sysdirs),\
+ 						  $(dir)/libm-test-ulps))
  	pwd=`pwd`; \
--	$(PERL) $< $$pwd/.. > $(objpfx)libm-err-tmp
-+	$(PERL) $< $$pwd/../ports > $(objpfx)libm-err-tmp
-+	$(PERL) $< $$pwd/../sysdeps >> $(objpfx)libm-err-tmp
+-	$(PYTHON) $< -s $$pwd/.. -m $(objpfx)libm-err-tmp
++	$(PYTHON) $< -s $$pwd/../ports -m $(objpfx)libm-err-tmp
++	$(PYTHON) $< -s $$pwd/../sysdeps -m $(objpfx)libm-err-tmp
  	$(move-if-change) $(objpfx)libm-err-tmp $(objpfx)libm-err.texi
  	touch $@
  
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index 93395c389f..6e175b64d1 100644
--- a/meta/recipes-core/glibc/glibc/0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0012-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,8 +1,8 @@
-From 93ab69ae4c98303929ba9492130a021fa4a215be Mon Sep 17 00:00:00 2001
+From 777da88a819738683e4389580cfbfded2a83e87e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:24:46 +0000
-Subject: [PATCH] __ieee754_sqrt{,f} are now inline functions and call out
- __slow versions
+Subject: [PATCH 12/30] __ieee754_sqrt{,f} are now inline functions and call
+ out __slow versions
 
 Upstream-Status: Pending
 
@@ -56,3 +56,6 @@ index 812653558f..10de1f0cc3 100644
       float b;
  #endif
  {
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch b/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
index 9998691fa4..b5adecba06 100644
--- a/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
+++ b/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
@@ -1,7 +1,7 @@
-From a7bd8aa65f3f2755d6dbd0d5adbfd269c1fb0094 Mon Sep 17 00:00:00 2001
+From f98b1b9e6b569abd3594b4923ace0c966c9daece Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
-Subject: [PATCH] sysdeps/gnu/configure.ac: handle correctly
+Subject: [PATCH 13/30] sysdeps/gnu/configure.ac: handle correctly
  $libc_cv_rootsbindir
 
 Upstream-Status:Pending
@@ -37,3 +37,6 @@ index 634fe4de2a..3db1697f4f 100644
 +  test -n "$libc_cv_rootsbindir" || libc_cv_rootsbindir=/sbin
    ;;
  esac
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch b/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
index 9d6ab30e2c..1cd91475db 100644
--- a/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
+++ b/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
@@ -1,7 +1,7 @@
-From 2ce5bc6da23dcb402afdeb967fa44c39eecf6d37 Mon Sep 17 00:00:00 2001
+From b9cd992052550d4b2bba954099e221677a6652e7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:28:41 +0000
-Subject: [PATCH] Add unused attribute
+Subject: [PATCH 14/30] Add unused attribute
 
 Helps in avoiding gcc warning when header is is included in
 a source file which does not use both functions
@@ -17,7 +17,7 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/iconv/gconv_charset.h b/iconv/gconv_charset.h
-index 123e2a62ce..63cc83ec84 100644
+index 91e0ad3141..2e9549fe49 100644
 --- a/iconv/gconv_charset.h
 +++ b/iconv/gconv_charset.h
 @@ -21,7 +21,7 @@
@@ -29,3 +29,6 @@ index 123e2a62ce..63cc83ec84 100644
  strip (char *wp, const char *s)
  {
    int slash_count = 0;
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
index 0267e7a4ec..f2e1802392 100644
--- a/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,7 +1,7 @@
-From b382138c41ccf6079b44592f1e74f183ca8281bb Mon Sep 17 00:00:00 2001
+From e8a88fb3bb6ffcc43871a7caf7ad9c59bd183e50 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
-Subject: [PATCH] 'yes' within the path sets wrong config variables
+Subject: [PATCH 15/30] 'yes' within the path sets wrong config variables
 
 It seems that the 'AC_EGREP_CPP(yes...' example is quite popular
 but being such a short word to grep it is likely to produce
@@ -258,3 +258,6 @@ index f9cba6e15d..b21f72f1e4 100644
                         #endif
      ], libc_cv_ppc64_def_call_elf=yes, libc_cv_ppc64_def_call_elf=no)])
    if test $libc_cv_ppc64_def_call_elf = no; then
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch b/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
index 15453ec6ff..8a9fa4916c 100644
--- a/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
+++ b/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
@@ -1,7 +1,7 @@
-From 04fb7b93dc40c1f96ebc05d29a2f02f9e4f0d572 Mon Sep 17 00:00:00 2001
+From 10f470476dc947d7b950d6a66f7c06f500c96c60 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:33:03 +0000
-Subject: [PATCH] timezone: re-written tzselect as posix sh
+Subject: [PATCH 16/30] timezone: re-written tzselect as posix sh
 
 To avoid the bash dependency.
 
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/timezone/Makefile b/timezone/Makefile
-index 0194aba4a1..58e5405a05 100644
+index 493deca790..36e559e16c 100644
 --- a/timezone/Makefile
 +++ b/timezone/Makefile
 @@ -122,7 +122,7 @@ $(testdata)/XT%: testdata/XT%
@@ -28,10 +28,10 @@ index 0194aba4a1..58e5405a05 100644
  	    -e '/TZVERSION=/s|see_Makefile|"$(version)"|' \
  	    -e '/PKGVERSION=/s|=.*|="$(PKGVERSION)"|' \
 diff --git a/timezone/tzselect.ksh b/timezone/tzselect.ksh
-index d2c3a6d1dd..089679f306 100755
+index 18fce27e24..70745f9d36 100755
 --- a/timezone/tzselect.ksh
 +++ b/timezone/tzselect.ksh
-@@ -35,7 +35,7 @@ REPORT_BUGS_TO=tz@iana.org
+@@ -34,7 +34,7 @@ REPORT_BUGS_TO=tz@iana.org
  
  # Specify default values for environment variables if they are unset.
  : ${AWK=awk}
@@ -40,3 +40,6 @@ index d2c3a6d1dd..089679f306 100755
  
  # Output one argument as-is to standard output.
  # Safer than 'echo', which can mishandle '\' or leading '-'.
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
index 06d2cd1d25..a27759a39a 100644
--- a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
@@ -1,7 +1,7 @@
-From 7a2f244c0980a54ed74f9544ab44a7269ef12bce Mon Sep 17 00:00:00 2001
+From 809392d20fa9a9f8159242451f9969e65a658835 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
-Subject: [PATCH] Remove bash dependency for nscd init script
+Subject: [PATCH 17/30] Remove bash dependency for nscd init script
 
 The nscd init script uses #! /bin/bash but only really uses one bashism
 (translated strings), so remove them and switch the shell to #!/bin/sh.
@@ -70,3 +70,6 @@ index a882da7d8b..b02986ec15 100644
  	RETVAL=1
  	;;
  esac
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
index 29109a26ea..f80a3ee1d2 100644
--- a/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,7 +1,7 @@
-From 44a5c79efea09f5b990e524ec42abdeef444056a Mon Sep 17 00:00:00 2001
+From 016d6987600d49d3f45874096e943b97d1667539 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
-Subject: [PATCH] eglibc: Cross building and testing instructions
+Subject: [PATCH 18/30] eglibc: Cross building and testing instructions
 
 Ported from eglibc
 Upstream-Status: Pending
@@ -614,3 +614,6 @@ index 0000000000..b67b468466
 +- Some tests require access to libstdc++.so.6 and libgcc_s.so.1; we
 +  simply place copies of these libraries in the top GLIBC build
 +  directory.
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
index 71c2ab9180..603bf21888 100644
--- a/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,7 +1,7 @@
-From f4ec5527d562d38523abb8587a6c7532e9d21f8a Mon Sep 17 00:00:00 2001
+From 7e4423528d362cf6268b1902a8e30d710431f333 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
-Subject: [PATCH] eglibc: Help bootstrap cross toolchain
+Subject: [PATCH 19/30] eglibc: Help bootstrap cross toolchain
 
 Taken from EGLIBC, r1484 + r1525
 
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 include/stubs-bootstrap.h
 
 diff --git a/Makefile b/Makefile
-index d3f25a525a..ab383867e2 100644
+index 4a014d6eff..3a1f419bc3 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -70,9 +70,18 @@ subdir-dirs = include
@@ -95,3 +95,6 @@ index 0000000000..1d2b669aff
 +   difficult headers.  The <gnu/stubs.h> header depends, via the
 +   EGLIBC subdir 'stubs' make targets, on every .o file in EGLIBC, but
 +   an empty stubs.h like this will do fine for GCC.  */
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0020-eglibc-Clear-cache-lines-on-ppc8xx.patch b/meta/recipes-core/glibc/glibc/0020-eglibc-Clear-cache-lines-on-ppc8xx.patch
index 6e475a711e..985b17b583 100644
--- a/meta/recipes-core/glibc/glibc/0020-eglibc-Clear-cache-lines-on-ppc8xx.patch
+++ b/meta/recipes-core/glibc/glibc/0020-eglibc-Clear-cache-lines-on-ppc8xx.patch
@@ -1,7 +1,7 @@
-From 6c23660d035e71de0e20b40460ad3050bd057665 Mon Sep 17 00:00:00 2001
+From 8c4d7d70a84a69fe5e8d69539368aa11f8fe20aa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 15:15:09 -0800
-Subject: [PATCH] eglibc: Clear cache lines on ppc8xx
+Subject: [PATCH 20/30] eglibc: Clear cache lines on ppc8xx
 
 2007-06-13  Nathan Sidwell  <nathan@codesourcery.com>
             Mark Shinwell  <shinwell@codesourcery.com>
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 28 insertions(+), 2 deletions(-)
 
 diff --git a/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c b/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
-index 78051bc7bc..e24f442320 100644
+index b04ecc4a4c..75bda97241 100644
 --- a/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
 +++ b/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
 @@ -24,9 +24,21 @@ int __cache_line_size attribute_hidden;
@@ -48,7 +48,7 @@ index 78051bc7bc..e24f442320 100644
  	break;
  
 diff --git a/sysdeps/unix/sysv/linux/powerpc/libc-start.c b/sysdeps/unix/sysv/linux/powerpc/libc-start.c
-index f2ad0c355d..3e6773795e 100644
+index 4fd5f70700..1a21e4675c 100644
 --- a/sysdeps/unix/sysv/linux/powerpc/libc-start.c
 +++ b/sysdeps/unix/sysv/linux/powerpc/libc-start.c
 @@ -73,11 +73,25 @@ __libc_start_main (int argc, char **argv,
@@ -78,3 +78,6 @@ index f2ad0c355d..3e6773795e 100644
  	__cache_line_size = av->a_un.a_val;
  	break;
  #ifndef SHARED
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch
index 8aecf2624c..fb1b43b18c 100644
--- a/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0021-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,7 +1,7 @@
-From 55531ef57d04006c5a1e3b32a8e0410372f86007 Mon Sep 17 00:00:00 2001
+From 19f041215673d4499ee9b23805d5c224c4063689 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
-Subject: [PATCH] eglibc: Resolve __fpscr_values on SH4
+Subject: [PATCH 21/30] eglibc: Resolve __fpscr_values on SH4
 
 2010-09-29  Nobuhiro Iwamatsu  <iwamatsu@nigauri.org>
             Andrew Stubbs  <ams@codesourcery.com>
@@ -33,7 +33,7 @@ index e0938c4165..ca1d7da339 100644
      # a*
      alphasort64;
 diff --git a/sysdeps/unix/sysv/linux/sh/sysdep.S b/sysdeps/unix/sysv/linux/sh/sysdep.S
-index c4e28ffb98..648bae03d5 100644
+index 6ce36d6dd5..425811cc77 100644
 --- a/sysdeps/unix/sysv/linux/sh/sysdep.S
 +++ b/sysdeps/unix/sysv/linux/sh/sysdep.S
 @@ -30,3 +30,14 @@ ENTRY (__syscall_error)
@@ -51,3 +51,6 @@ index c4e28ffb98..648bae03d5 100644
 +       .long 0x80000
 +weak_alias (___fpscr_values, __fpscr_values)
 +
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
index aa62c6352c..a2d35d43ed 100644
--- a/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,7 +1,7 @@
-From 4bb23fbb07984b93fd14f353fd9325d927b0cd98 Mon Sep 17 00:00:00 2001
+From 1ae15f60a84f16187e06a05906f44a6658bae487 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
-Subject: [PATCH] eglibc: Forward port cross locale generation support
+Subject: [PATCH 22/30] eglibc: Forward port cross locale generation support
 
 Upstream-Status: Pending
 
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 locale/catnames.c
 
 diff --git a/locale/Makefile b/locale/Makefile
-index fd9972279b..176b3946de 100644
+index 764e751c36..866957fefa 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
 @@ -26,7 +26,8 @@ headers		= langinfo.h locale.h bits/locale.h \
@@ -91,7 +91,7 @@ index 0000000000..9fad357db1
 +    [LC_ALL] = sizeof ("LC_ALL") - 1
 +  };
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index 537bc35149..73ba20d695 100644
+index 53cb8bfc59..92c466200c 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
 @@ -224,7 +224,7 @@ __libc_tsd_define (extern, locale_t, LOCALE)
@@ -104,7 +104,7 @@ index 537bc35149..73ba20d695 100644
  # define NL_CURRENT_INDIRECT	1
  #endif
 diff --git a/locale/programs/charmap-dir.c b/locale/programs/charmap-dir.c
-index 34a8d32c92..cbb9436cd1 100644
+index 94c122df68..80e53e12c8 100644
 --- a/locale/programs/charmap-dir.c
 +++ b/locale/programs/charmap-dir.c
 @@ -18,7 +18,9 @@
@@ -150,7 +150,7 @@ index 34a8d32c92..cbb9436cd1 100644
    return NULL;
  }
 diff --git a/locale/programs/ld-collate.c b/locale/programs/ld-collate.c
-index d2eebcfdbb..c3718d6589 100644
+index bb4e2c539d..9d08d422c4 100644
 --- a/locale/programs/ld-collate.c
 +++ b/locale/programs/ld-collate.c
 @@ -349,7 +349,7 @@ new_element (struct locale_collate_t *collate, const char *mbs, size_t mbslen,
@@ -199,7 +199,7 @@ index d2eebcfdbb..c3718d6589 100644
  			 == runp->wcnext->wcs[runp->nwcs - 1] + 1));
  
 diff --git a/locale/programs/ld-ctype.c b/locale/programs/ld-ctype.c
-index f791e6b7e9..d809d6db7f 100644
+index 36fd08ba80..08155a27d6 100644
 --- a/locale/programs/ld-ctype.c
 +++ b/locale/programs/ld-ctype.c
 @@ -915,7 +915,7 @@ ctype_output (struct localedef_t *locale, const struct charmap_t *charmap,
@@ -281,7 +281,7 @@ index f791e6b7e9..d809d6db7f 100644
  	      srunp = srunp->next;
  	    }
 diff --git a/locale/programs/ld-time.c b/locale/programs/ld-time.c
-index a755792363..e8b2f85522 100644
+index 8e9849fdba..028d3efa9f 100644
 --- a/locale/programs/ld-time.c
 +++ b/locale/programs/ld-time.c
 @@ -220,8 +220,10 @@ No definition for %s category found"), "LC_TIME");
@@ -350,7 +350,7 @@ index a755792363..e8b2f85522 100644
  
  
 diff --git a/locale/programs/linereader.c b/locale/programs/linereader.c
-index 3525c8a43d..f8a7fd9c24 100644
+index ed3a9731d0..3178ea057a 100644
 --- a/locale/programs/linereader.c
 +++ b/locale/programs/linereader.c
 @@ -595,7 +595,7 @@ get_string (struct linereader *lr, const struct charmap_t *charmap,
@@ -363,18 +363,18 @@ index 3525c8a43d..f8a7fd9c24 100644
    size_t bufmax = 56;
  
 diff --git a/locale/programs/localedef.c b/locale/programs/localedef.c
-index d718d2e9f4..e0a3ad5a83 100644
+index b7bcef8248..efeced1e0f 100644
 --- a/locale/programs/localedef.c
 +++ b/locale/programs/localedef.c
-@@ -105,6 +105,7 @@ void (*argp_program_version_hook) (FILE *, struct argp_state *) = print_version;
- #define OPT_BIG_ENDIAN 401
+@@ -109,6 +109,7 @@ void (*argp_program_version_hook) (FILE *, struct argp_state *) = print_version;
  #define OPT_NO_WARN 402
  #define OPT_WARN 403
-+#define OPT_UINT32_ALIGN 404
+ #define OPT_NO_HARD_LINKS 404
++#define OPT_UINT32_ALIGN 405
  
  /* Definitions of arguments for argp functions.  */
  static const struct argp_option options[] =
-@@ -147,6 +148,8 @@ static const struct argp_option options[] =
+@@ -153,6 +154,8 @@ static const struct argp_option options[] =
      N_("Generate little-endian output") },
    { "big-endian", OPT_BIG_ENDIAN, NULL, 0,
      N_("Generate big-endian output") },
@@ -383,7 +383,7 @@ index d718d2e9f4..e0a3ad5a83 100644
    { NULL, 0, NULL, 0, NULL }
  };
  
-@@ -236,12 +239,14 @@ main (int argc, char *argv[])
+@@ -242,12 +245,14 @@ main (int argc, char *argv[])
       ctype locale.  (P1003.2 4.35.5.2)  */
    setlocale (LC_CTYPE, "POSIX");
  
@@ -398,9 +398,9 @@ index d718d2e9f4..e0a3ad5a83 100644
  
    /* Process charmap file.  */
    charmap = charmap_read (charmap_file, verbose, 1, be_quiet, 1);
-@@ -389,6 +394,9 @@ parse_opt (int key, char *arg, struct argp_state *state)
-       /* Enable the warnings.  */
-       set_warnings (arg, true);
+@@ -399,6 +404,9 @@ parse_opt (int key, char *arg, struct argp_state *state)
+       /* Do not hard link to other locales.  */
+       hard_links = false;
        break;
 +    case OPT_UINT32_ALIGN:
 +      uint32_align_mask = strtol (arg, NULL, 0) - 1;
@@ -409,7 +409,7 @@ index d718d2e9f4..e0a3ad5a83 100644
        force_output = 1;
        break;
 diff --git a/locale/programs/locfile.c b/locale/programs/locfile.c
-index 32e5f761f2..b41e77bd8d 100644
+index e4ba48e968..e7b0efe887 100644
 --- a/locale/programs/locfile.c
 +++ b/locale/programs/locfile.c
 @@ -544,6 +544,9 @@ compare_files (const char *filename1, const char *filename2, size_t size,
@@ -432,7 +432,7 @@ index 32e5f761f2..b41e77bd8d 100644
  
  /* Record that FILE's next element is the 32-bit integer VALUE.  */
 diff --git a/locale/programs/locfile.h b/locale/programs/locfile.h
-index 89b347c72d..a636fc2960 100644
+index c063fc097d..4e7465e55a 100644
 --- a/locale/programs/locfile.h
 +++ b/locale/programs/locfile.h
 @@ -71,6 +71,8 @@ extern void write_all_categories (struct localedef_t *definitions,
@@ -521,7 +521,7 @@ index 89b347c72d..a636fc2960 100644
 +
  #endif /* locfile.h */
 diff --git a/locale/setlocale.c b/locale/setlocale.c
-index e4de907e1f..b5d8f5c17d 100644
+index 9427a5ad28..8f4140d684 100644
 --- a/locale/setlocale.c
 +++ b/locale/setlocale.c
 @@ -64,36 +64,6 @@ static char *const _nl_current_used[] =
@@ -561,3 +561,6 @@ index e4de907e1f..b5d8f5c17d 100644
  #ifdef NL_CURRENT_INDIRECT
  # define WEAK_POSTLOAD(postload) weak_extern (postload)
  #else
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch b/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
index 68fad96410..0f7c5fdf72 100644
--- a/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
+++ b/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
@@ -1,7 +1,7 @@
-From 1b2ceb6c2414e3c98c7bcd029583287ced9f3159 Mon Sep 17 00:00:00 2001
+From 809c79b7d554a4ec83921df9d8773c99a03dc81c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 20 Apr 2016 21:11:00 -0700
-Subject: [PATCH] Define DUMMY_LOCALE_T if not defined
+Subject: [PATCH 23/30] Define DUMMY_LOCALE_T if not defined
 
 This is a hack to fix building the locale bits on an older
 CentOs 5.X machine
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/locale/programs/config.h b/locale/programs/config.h
-index 9956cd8446..04342f3644 100644
+index a1e6e0ec3c..7f75528eae 100644
 --- a/locale/programs/config.h
 +++ b/locale/programs/config.h
 @@ -19,6 +19,9 @@
@@ -27,3 +27,6 @@ index 9956cd8446..04342f3644 100644
  /* Use the internal textdomain used for libc messages.  */
  #define PACKAGE _libc_intl_domainname
  #ifndef VERSION
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch b/meta/recipes-core/glibc/glibc/0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
similarity index 80%
rename from meta/recipes-core/glibc/glibc/0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
rename to meta/recipes-core/glibc/glibc/0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
index e17f6aa3b9..c289e544ee 100644
--- a/meta/recipes-core/glibc/glibc/0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
+++ b/meta/recipes-core/glibc/glibc/0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
@@ -1,7 +1,8 @@
-From 865651d2496a90f7ae8e7cc19a2e54b6f17a8ad5 Mon Sep 17 00:00:00 2001
+From b2d1c9b4159bfd661a4996588d06d922491dfecb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:42:06 -0700
-Subject: [PATCH] localedef --add-to-archive uses a hard-coded locale path
+Subject: [PATCH 24/30] localedef --add-to-archive uses a hard-coded locale
+ path
 
 it doesn't exist in normal use, and there's no way to pass an
 alternative filename.
@@ -14,11 +15,11 @@ Upstream-Status: Inappropriate (OE-specific)
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- locale/programs/locarchive.c | 37 ++++++++++++++++++++++++++----------
- 1 file changed, 27 insertions(+), 10 deletions(-)
+ locale/programs/locarchive.c | 35 +++++++++++++++++++++++++----------
+ 1 file changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/locale/programs/locarchive.c b/locale/programs/locarchive.c
-index ca332a345f..91f62da662 100644
+index e6310b18be..f54a76eade 100644
 --- a/locale/programs/locarchive.c
 +++ b/locale/programs/locarchive.c
 @@ -340,12 +340,24 @@ enlarge_archive (struct locarhandle *ah, const struct locarhead *head)
@@ -34,7 +35,7 @@ index ca332a345f..91f62da662 100644
 -  if (output_prefix)
 -    memcpy (archivefname, output_prefix, prefix_len);
 -  strcpy (archivefname + prefix_len, ARCHIVE_NAME);
-+  if (envarchive != NULL) 
++  if (envarchive != NULL)
 +    {
 +      archivefname = xmalloc(strlen(envarchive) + 1);
 +      fname = xmalloc(strlen(envarchive) + sizeof (".XXXXXX"));
@@ -51,16 +52,7 @@ index ca332a345f..91f62da662 100644
    strcpy (stpcpy (fname, archivefname), ".XXXXXX");
  
    /* Not all of the old file has to be mapped.  Change this now this
-@@ -551,6 +563,8 @@ enlarge_archive (struct locarhandle *ah, const struct locarhead *head)
- 
-   /* Add the information for the new one.  */
-   *ah = new_ah;
-+  free(archivefname);
-+  free(fname);
- }
- 
- 
-@@ -569,10 +583,13 @@ open_archive (struct locarhandle *ah, bool readonly)
+@@ -569,10 +581,13 @@ open_archive (struct locarhandle *ah, bool readonly)
    /* If ah has a non-NULL fname open that otherwise open the default.  */
    if (archivefname == NULL)
      {
@@ -78,7 +70,7 @@ index ca332a345f..91f62da662 100644
      }
  
    while (1)
-@@ -585,7 +602,7 @@ open_archive (struct locarhandle *ah, bool readonly)
+@@ -585,7 +600,7 @@ open_archive (struct locarhandle *ah, bool readonly)
  	     the default locale archive we ignore the failure and
  	     list an empty archive, otherwise we print an error
  	     and exit.  */
@@ -87,3 +79,6 @@ index ca332a345f..91f62da662 100644
  	    {
  	      if (readonly)
  		{
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch b/meta/recipes-core/glibc/glibc/0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
similarity index 88%
rename from meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
rename to meta/recipes-core/glibc/glibc/0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
index 28cff2b90b..0ddd2e58b2 100644
--- a/meta/recipes-core/glibc/glibc/0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
+++ b/meta/recipes-core/glibc/glibc/0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
@@ -1,7 +1,7 @@
-From a6159c9486745664a5f116ee9cc45837021b7624 Mon Sep 17 00:00:00 2001
+From 804b05a034bfaf4e3427243e6baf736086822cd0 Mon Sep 17 00:00:00 2001
 From: Mark Hatle <mark.hatle@windriver.com>
 Date: Thu, 18 Aug 2016 14:07:58 -0500
-Subject: [PATCH] elf/dl-deps.c: Make _dl_build_local_scope breadth first
+Subject: [PATCH 25/30] elf/dl-deps.c: Make _dl_build_local_scope breadth first
 
 According to the ELF specification:
 
@@ -24,7 +24,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  1 file changed, 10 insertions(+), 4 deletions(-)
 
 diff --git a/elf/dl-deps.c b/elf/dl-deps.c
-index 9d9b1ba7f2..8414028c58 100644
+index e12c353158..9234daac05 100644
 --- a/elf/dl-deps.c
 +++ b/elf/dl-deps.c
 @@ -73,13 +73,19 @@ _dl_build_local_scope (struct link_map **list, struct link_map *map)
@@ -51,3 +51,6 @@ index 9d9b1ba7f2..8414028c58 100644
    return p - list;
  }
  
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch b/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch
deleted file mode 100644
index 4a7919ff5b..0000000000
--- a/meta/recipes-core/glibc/glibc/0025-locale-fix-hard-coded-reference-to-gcc-E.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6c6aecba19b3e7947100623532a41b6f16734ace Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
-Date: Mon, 22 Aug 2016 16:09:25 +0200
-Subject: [PATCH] locale: fix hard-coded reference to gcc -E
-
-When new version of compilers are published, they may not be compatible with
-older versions of software. This is particularly common when software is built
-with -Werror.
-
-Autotools provides a way for a user to specify the name of his compiler using a
-set of variables ($CC $CXX $CPP etc.). Those variables are used correctly when
-compiling glibc but the script used to generate transliterations in the locale/
-subdirectory directly calls the gcc binary to get the output of the
-preprocessor instead of using the $CPP variable provided by the build
-environment.
-
-This patch replaces the hard-coded reference to the gcc binary with the proper
-environment variable, thus allowing a user to override it.
-
-Upstream-Status: Submitted [https://sourceware.org/ml/libc-alpha/2016-08/msg00746.html]
----
- locale/gen-translit.pl | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/locale/gen-translit.pl b/locale/gen-translit.pl
-index 30d3f2f195..e97653017c 100644
---- a/locale/gen-translit.pl
-+++ b/locale/gen-translit.pl
-@@ -1,5 +1,5 @@
- #!/usr/bin/perl -w
--open F, "cat C-translit.h.in | gcc -E - |" || die "Cannot preprocess input file";
-+open F, 'cat C-translit.h.in | ${CPP:-gcc -E} - |' || die "Cannot preprocess input file";
- 
- 
- sub cstrlen {
diff --git a/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch b/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
index 71ddc1234b..70696b8d3c 100644
--- a/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
+++ b/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
@@ -1,7 +1,7 @@
-From efb0fca7db742f4195e1771d8ba4c7fba4938819 Mon Sep 17 00:00:00 2001
+From e6e6e5011611fa22186508a3ff8ed4215a529f1f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 27 Jan 2018 10:05:07 -0800
-Subject: [PATCH] reset dl_load_write_lock after forking
+Subject: [PATCH 26/30] reset dl_load_write_lock after forking
 
 The patch in this Bugzilla entry was requested by a customer:
 
@@ -20,7 +20,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/sysdeps/nptl/fork.c b/sysdeps/nptl/fork.c
-index ec56a827eb..0f48933ff1 100644
+index bd68f18b45..5c9bb44372 100644
 --- a/sysdeps/nptl/fork.c
 +++ b/sysdeps/nptl/fork.c
 @@ -130,9 +130,9 @@ __libc_fork (void)
@@ -35,3 +35,6 @@ index ec56a827eb..0f48933ff1 100644
        /* Run the handlers registered for the child.  */
        __run_fork_handlers (atfork_run_child);
      }
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch b/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
index dd37f2cd4d..5bc813a900 100644
--- a/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
+++ b/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
@@ -1,7 +1,7 @@
-From 6ea962e0946da7564a774b08dd3eda28d64e9e56 Mon Sep 17 00:00:00 2001
+From eb43af9afba3c2b499be6e71b69687d4e7c6272a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 27 Jan 2018 10:08:04 -0800
-Subject: [PATCH] Acquire ld.so lock before switching to malloc_atfork
+Subject: [PATCH 27/30] Acquire ld.so lock before switching to malloc_atfork
 
 The patch is from
   https://sourceware.org/bugzilla/show_bug.cgi?id=4578
@@ -32,7 +32,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 7 insertions(+)
 
 diff --git a/sysdeps/nptl/fork.c b/sysdeps/nptl/fork.c
-index 0f48933ff1..eef3f9669b 100644
+index 5c9bb44372..84a1a404b3 100644
 --- a/sysdeps/nptl/fork.c
 +++ b/sysdeps/nptl/fork.c
 @@ -25,6 +25,7 @@
@@ -63,3 +63,6 @@ index 0f48933ff1..eef3f9669b 100644
      }
  
    return pid;
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch b/meta/recipes-core/glibc/glibc/0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch
deleted file mode 100644
index fae8d0040d..0000000000
--- a/meta/recipes-core/glibc/glibc/0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 38fad3e5ab3b45c56810abd35fa11a72fa10b8f1 Mon Sep 17 00:00:00 2001
-From: Pratyush Anand <panand@redhat.com>
-Date: Wed, 22 Mar 2017 17:02:38 +0530
-Subject: [PATCH] bits/siginfo-consts.h: enum definition for TRAP_HWBKPT is
- missing
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Compile following linux kernel test code with latest glibc:
-
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/breakpoints/breakpoint_test_arm64.c
-
-and we get following error:
-breakpoint_test_arm64.c: In function ‘run_test’:
-breakpoint_test_arm64.c:171:25: error: ‘TRAP_HWBKPT’ undeclared (first use in this function)
-  if (siginfo.si_code != TRAP_HWBKPT) {
-                         ^
-I can compile test code by modifying my local
-/usr/include/bits/siginfo.h and test works great. Therefore, this patch
-will be needed in upstream glibc so that issue is fixed there as well.
-
-Signed-off-by: Pratyush Anand <panand@redhat.com>
-
-Upstream-Status: Submitted [https://sourceware.org/bugzilla/show_bug.cgi?id=21286]
----
- bits/siginfo-consts.h                         | 6 +++++-
- sysdeps/unix/sysv/linux/bits/siginfo-consts.h | 6 +++++-
- 2 files changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/bits/siginfo-consts.h b/bits/siginfo-consts.h
-index 7464c1882b..298314527a 100644
---- a/bits/siginfo-consts.h
-+++ b/bits/siginfo-consts.h
-@@ -106,8 +106,12 @@ enum
- {
-   TRAP_BRKPT = 1,		/* Process breakpoint.  */
- #  define TRAP_BRKPT	TRAP_BRKPT
--  TRAP_TRACE			/* Process trace trap.  */
-+  TRAP_TRACE,			/* Process trace trap.  */
- #  define TRAP_TRACE	TRAP_TRACE
-+  TRAP_BRANCH,			/* Process branch trap. */
-+# define TRAP_BRANCH	TRAP_BRANCH
-+  TRAP_HWBKPT			/* hardware breakpoint/watchpoint  */
-+# define TRAP_HWBKPT	TRAP_HWBKPT
- };
- # endif
- 
-diff --git a/sysdeps/unix/sysv/linux/bits/siginfo-consts.h b/sysdeps/unix/sysv/linux/bits/siginfo-consts.h
-index 193bd9c471..3fe852bc5f 100644
---- a/sysdeps/unix/sysv/linux/bits/siginfo-consts.h
-+++ b/sysdeps/unix/sysv/linux/bits/siginfo-consts.h
-@@ -141,8 +141,12 @@ enum
- {
-   TRAP_BRKPT = 1,		/* Process breakpoint.  */
- #  define TRAP_BRKPT	TRAP_BRKPT
--  TRAP_TRACE			/* Process trace trap.  */
-+  TRAP_TRACE,			/* Process trace trap.  */
- #  define TRAP_TRACE	TRAP_TRACE
-+  TRAP_BRANCH,			/* Process branch trap. */
-+# define TRAP_BRANCH	TRAP_BRANCH
-+  TRAP_HWBKPT			/* hardware breakpoint/watchpoint  */
-+# define TRAP_HWBKPT	TRAP_HWBKPT
- };
- # endif
- 
diff --git a/meta/recipes-core/glibc/glibc/0030-intl-Emit-no-lines-in-bison-generated-files.patch b/meta/recipes-core/glibc/glibc/0028-intl-Emit-no-lines-in-bison-generated-files.patch
similarity index 83%
rename from meta/recipes-core/glibc/glibc/0030-intl-Emit-no-lines-in-bison-generated-files.patch
rename to meta/recipes-core/glibc/glibc/0028-intl-Emit-no-lines-in-bison-generated-files.patch
index db97d91c99..0eb006ffb7 100644
--- a/meta/recipes-core/glibc/glibc/0030-intl-Emit-no-lines-in-bison-generated-files.patch
+++ b/meta/recipes-core/glibc/glibc/0028-intl-Emit-no-lines-in-bison-generated-files.patch
@@ -1,7 +1,7 @@
-From a54c15d0567d547137066f41b1b22eba4875c27b Mon Sep 17 00:00:00 2001
+From 39f910a4b8195d0538425aad7f0ebdc232b7a582 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:44:00 -0700
-Subject: [PATCH] intl: Emit no lines in bison generated files
+Subject: [PATCH 28/30] intl: Emit no lines in bison generated files
 
 Improve reproducibility:
 Do not put any #line preprocessor commands in bison generated files.
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/intl/Makefile b/intl/Makefile
-index 672edf1b38..d31888d013 100644
+index 9eea8d57e3..627dce4cf1 100644
 --- a/intl/Makefile
 +++ b/intl/Makefile
 @@ -155,7 +155,7 @@ $(objpfx)tst-gettext6.out: $(objpfx)tst-gettext.out
@@ -29,3 +29,6 @@ index 672edf1b38..d31888d013 100644
  
  $(inst_localedir)/locale.alias: locale.alias $(+force)
  	$(do-install)
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch b/meta/recipes-core/glibc/glibc/0029-inject-file-assembly-directives.patch
similarity index 78%
rename from meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch
rename to meta/recipes-core/glibc/glibc/0029-inject-file-assembly-directives.patch
index 55eba2d43e..2874fb5815 100644
--- a/meta/recipes-core/glibc/glibc/0034-inject-file-assembly-directives.patch
+++ b/meta/recipes-core/glibc/glibc/0029-inject-file-assembly-directives.patch
@@ -1,7 +1,12 @@
-Currently, non-IA builds are not reproducibile since build paths are 
+From 649bfb399265eb48a9fe8db1c2b5a31633c55152 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Nov 2018 17:29:35 -0800
+Subject: [PATCH 29/30] inject file assembly directives
+
+Currently, non-IA builds are not reproducibile since build paths are
 being injected into the debug symbols. These are coming from the use of
 .S assembler files during the glibc build. No STT_FILE section is added
-during the assembly but when linking, ld decides to add one to aid 
+during the assembly but when linking, ld decides to add one to aid
 debugging and ensure references between the different object files its
 linking remain clear.
 
@@ -18,8 +23,32 @@ RP
 
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ csu/abi-note.S                                | 2 ++
+ sysdeps/aarch64/crti.S                        | 2 ++
+ sysdeps/aarch64/crtn.S                        | 2 ++
+ sysdeps/aarch64/dl-tlsdesc.S                  | 2 ++
+ sysdeps/aarch64/dl-trampoline.S               | 2 ++
+ sysdeps/aarch64/start.S                       | 2 ++
+ sysdeps/arm/abi-note.S                        | 2 ++
+ sysdeps/arm/crti.S                            | 2 ++
+ sysdeps/arm/crtn.S                            | 2 ++
+ sysdeps/arm/dl-tlsdesc.S                      | 2 ++
+ sysdeps/arm/dl-trampoline.S                   | 2 ++
+ sysdeps/arm/start.S                           | 2 ++
+ sysdeps/mips/start.S                          | 2 ++
+ sysdeps/powerpc/powerpc32/dl-start.S          | 2 ++
+ sysdeps/powerpc/powerpc32/start.S             | 2 ++
+ sysdeps/powerpc/powerpc64/start.S             | 2 ++
+ sysdeps/unix/sysv/linux/aarch64/__read_tp.S   | 2 ++
+ sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S   | 2 ++
+ sysdeps/unix/sysv/linux/arm/libc-do-syscall.S | 2 ++
+ sysdeps/unix/sysv/linux/powerpc/dl-brk.S      | 2 ++
+ 20 files changed, 40 insertions(+)
+
 diff --git a/csu/abi-note.S b/csu/abi-note.S
-index 5d0ca7803d..8ce41581b1 100644
+index fa1f014a88..098731362a 100644
 --- a/csu/abi-note.S
 +++ b/csu/abi-note.S
 @@ -56,6 +56,8 @@ offset	length	contents
@@ -32,7 +61,7 @@ index 5d0ca7803d..8ce41581b1 100644
     name begins with `.note' and creates a PT_NOTE program header entry
     pointing at it. */
 diff --git a/sysdeps/aarch64/crti.S b/sysdeps/aarch64/crti.S
-index 2b213758b2..736f33e314 100644
+index d4e7dfcf5c..e0218df30c 100644
 --- a/sysdeps/aarch64/crti.S
 +++ b/sysdeps/aarch64/crti.S
 @@ -50,6 +50,8 @@
@@ -45,7 +74,7 @@ index 2b213758b2..736f33e314 100644
  	weak_extern (PREINIT_FUNCTION)
  #else
 diff --git a/sysdeps/aarch64/crtn.S b/sysdeps/aarch64/crtn.S
-index d72300af80..cb249bf3ca 100644
+index 363f752460..2fb06fba62 100644
 --- a/sysdeps/aarch64/crtn.S
 +++ b/sysdeps/aarch64/crtn.S
 @@ -37,6 +37,8 @@
@@ -57,34 +86,8 @@ index d72300af80..cb249bf3ca 100644
  	.section .init,"ax",%progbits
  	ldp	x29, x30, [sp], 16
  	RET
-diff --git a/sysdeps/aarch64/start.S b/sysdeps/aarch64/start.S
-index bad000f555..5957c028cd 100644
---- a/sysdeps/aarch64/start.S
-+++ b/sysdeps/aarch64/start.S
-@@ -18,6 +18,8 @@
- 
- #include <sysdep.h>
- 
-+	.file "start.S"
-+
- /* This is the canonical entry point, usually the first thing in the text
-    segment.
- 
-diff --git a/sysdeps/unix/sysv/linux/aarch64/__read_tp.S b/sysdeps/unix/sysv/linux/aarch64/__read_tp.S
-index 92fc0191a5..715bfcb9e4 100644
---- a/sysdeps/unix/sysv/linux/aarch64/__read_tp.S
-+++ b/sysdeps/unix/sysv/linux/aarch64/__read_tp.S
-@@ -18,6 +18,8 @@
- 
- #include <sysdep.h>
- 
-+	.file "__read_tp.S"
-+
- 	.hidden __read_tp
- ENTRY (__read_tp)
- 	mrs	x0, tpidr_el0
 diff --git a/sysdeps/aarch64/dl-tlsdesc.S b/sysdeps/aarch64/dl-tlsdesc.S
-index 43a62ef307..42f85cdde9 100644
+index 4abe6b82a3..8c44b2ff8a 100644
 --- a/sysdeps/aarch64/dl-tlsdesc.S
 +++ b/sysdeps/aarch64/dl-tlsdesc.S
 @@ -22,6 +22,8 @@
@@ -97,7 +100,7 @@ index 43a62ef307..42f85cdde9 100644
  #define SAVE_Q_REGISTERS				\
  	stp	q0, q1,	[sp, #-32*NSAVEDQREGPAIRS]!;	\
 diff --git a/sysdeps/aarch64/dl-trampoline.S b/sysdeps/aarch64/dl-trampoline.S
-index a86d0722d4..92edab1d01 100644
+index 19b117e8f9..38c78b5409 100644
 --- a/sysdeps/aarch64/dl-trampoline.S
 +++ b/sysdeps/aarch64/dl-trampoline.S
 @@ -21,6 +21,8 @@
@@ -109,6 +112,19 @@ index a86d0722d4..92edab1d01 100644
  #define ip0 x16
  #define ip0l PTR_REG (16)
  #define ip1 x17
+diff --git a/sysdeps/aarch64/start.S b/sysdeps/aarch64/start.S
+index f5e9b9c223..ae3e22a6a5 100644
+--- a/sysdeps/aarch64/start.S
++++ b/sysdeps/aarch64/start.S
+@@ -18,6 +18,8 @@
+ 
+ #include <sysdep.h>
+ 
++	.file "start.S"
++
+ /* This is the canonical entry point, usually the first thing in the text
+    segment.
+ 
 diff --git a/sysdeps/arm/abi-note.S b/sysdeps/arm/abi-note.S
 index 07bd4c4619..7213b16f27 100644
 --- a/sysdeps/arm/abi-note.S
@@ -120,7 +136,7 @@ index 07bd4c4619..7213b16f27 100644
     alignment in any callee.  */
  	.eabi_attribute 25, 1
 diff --git a/sysdeps/arm/crti.S b/sysdeps/arm/crti.S
-index a1424d0333..bca1dab256 100644
+index 26dbba66a3..dd84ecd566 100644
 --- a/sysdeps/arm/crti.S
 +++ b/sysdeps/arm/crti.S
 @@ -57,6 +57,8 @@
@@ -133,7 +149,7 @@ index a1424d0333..bca1dab256 100644
  	.p2align 2
  	.type call_weak_fn, %function
 diff --git a/sysdeps/arm/crtn.S b/sysdeps/arm/crtn.S
-index 26027693ce..65a0502826 100644
+index 8f91c8d88b..a87fe49e07 100644
 --- a/sysdeps/arm/crtn.S
 +++ b/sysdeps/arm/crtn.S
 @@ -37,6 +37,8 @@
@@ -146,7 +162,7 @@ index 26027693ce..65a0502826 100644
     corresponding to the prologues in crti.S. */
  
 diff --git a/sysdeps/arm/dl-tlsdesc.S b/sysdeps/arm/dl-tlsdesc.S
-index 056e17d52d..a98c68dfb9 100644
+index a929340b42..b724c9776d 100644
 --- a/sysdeps/arm/dl-tlsdesc.S
 +++ b/sysdeps/arm/dl-tlsdesc.S
 @@ -21,6 +21,8 @@
@@ -159,7 +175,7 @@ index 056e17d52d..a98c68dfb9 100644
  	@ emit debug information with cfi
  	@ use arm-specific pseudos for unwinding itself
 diff --git a/sysdeps/arm/dl-trampoline.S b/sysdeps/arm/dl-trampoline.S
-index c731b01286..4b37b25344 100644
+index 325cfcd2ce..4bfdcbce51 100644
 --- a/sysdeps/arm/dl-trampoline.S
 +++ b/sysdeps/arm/dl-trampoline.S
 @@ -21,6 +21,8 @@
@@ -172,7 +188,7 @@ index c731b01286..4b37b25344 100644
  	.globl _dl_runtime_resolve
  	.type _dl_runtime_resolve, #function
 diff --git a/sysdeps/arm/start.S b/sysdeps/arm/start.S
-index adef090717..d22e4128e0 100644
+index a05f8a4651..2f4374fcaa 100644
 --- a/sysdeps/arm/start.S
 +++ b/sysdeps/arm/start.S
 @@ -57,6 +57,8 @@
@@ -184,21 +200,8 @@ index adef090717..d22e4128e0 100644
  /* Tag_ABI_align8_preserved: This code preserves 8-byte
     alignment in any callee.  */
  	.eabi_attribute 25, 1
-diff --git a/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S b/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S
-index 871702317a..20a942dbac 100644
---- a/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S
-+++ b/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S
-@@ -39,6 +39,8 @@
-    a normal function call) in a high page of memory; tail call to the
-    helper.  */
- 
-+	.file "aeabi_read_tp.S"
-+
- 	.hidden __aeabi_read_tp
- ENTRY (__aeabi_read_tp)
- #ifdef ARCH_HAS_HARD_TP
 diff --git a/sysdeps/mips/start.S b/sysdeps/mips/start.S
-index a4c4ef0fae..d00fff31a8 100644
+index 8638e5b545..93f6564aec 100644
 --- a/sysdeps/mips/start.S
 +++ b/sysdeps/mips/start.S
 @@ -38,6 +38,8 @@
@@ -210,16 +213,21 @@ index a4c4ef0fae..d00fff31a8 100644
  #ifndef ENTRY_POINT
  #error ENTRY_POINT needs to be defined for start.S on MIPS/ELF.
  #endif
-diff --git a/sysdeps/unix/sysv/linux/powerpc/dl-brk.S b/sysdeps/unix/sysv/linux/powerpc/dl-brk.S
-index eeb96544e3..da182b28f8 100644
---- a/sysdeps/unix/sysv/linux/powerpc/dl-brk.S
-+++ b/sysdeps/unix/sysv/linux/powerpc/dl-brk.S
-@@ -1 +1,3 @@
-+	.file "dl-brk.S"
+diff --git a/sysdeps/powerpc/powerpc32/dl-start.S b/sysdeps/powerpc/powerpc32/dl-start.S
+index 99a10d643a..e47fc0d245 100644
+--- a/sysdeps/powerpc/powerpc32/dl-start.S
++++ b/sysdeps/powerpc/powerpc32/dl-start.S
+@@ -18,6 +18,8 @@
+ 
+ #include <sysdep.h>
+ 
++	.file "dl-start.S"
 +
- #include <brk.S>
+ /* Initial entry point code for the dynamic linker.
+    The C function `_dl_start' is the real entry point;
+    its return value is the user program's entry point.	*/
 diff --git a/sysdeps/powerpc/powerpc32/start.S b/sysdeps/powerpc/powerpc32/start.S
-index 5c10a22f8a..2b52627f27 100644
+index 172fb5a56b..ef1471b861 100644
 --- a/sysdeps/powerpc/powerpc32/start.S
 +++ b/sysdeps/powerpc/powerpc32/start.S
 @@ -35,6 +35,8 @@
@@ -232,7 +240,7 @@ index 5c10a22f8a..2b52627f27 100644
     before crtbegin.o, the file defining __EH_FRAME_BEGIN__.  */
  #undef cfi_startproc
 diff --git a/sysdeps/powerpc/powerpc64/start.S b/sysdeps/powerpc/powerpc64/start.S
-index bd7189310c..2e22b8472d 100644
+index 55fae68ad6..0cb608fe0f 100644
 --- a/sysdeps/powerpc/powerpc64/start.S
 +++ b/sysdeps/powerpc/powerpc64/start.S
 @@ -35,6 +35,8 @@
@@ -244,21 +252,34 @@ index bd7189310c..2e22b8472d 100644
  /* We do not want .eh_frame info for crt1.o since crt1.o is linked
     before crtbegin.o, the file defining __EH_FRAME_BEGIN__.  */
  #undef cfi_startproc
-diff --git a/sysdeps/powerpc/powerpc32/dl-start.S b/sysdeps/powerpc/powerpc32/dl-start.S
-index 244d87fb6d..14d3e2ce14 100644
---- a/sysdeps/powerpc/powerpc32/dl-start.S
-+++ b/sysdeps/powerpc/powerpc32/dl-start.S
+diff --git a/sysdeps/unix/sysv/linux/aarch64/__read_tp.S b/sysdeps/unix/sysv/linux/aarch64/__read_tp.S
+index 30a29b9fb0..07892b383f 100644
+--- a/sysdeps/unix/sysv/linux/aarch64/__read_tp.S
++++ b/sysdeps/unix/sysv/linux/aarch64/__read_tp.S
 @@ -18,6 +18,8 @@
  
  #include <sysdep.h>
  
-+	.file "dl-start.S"
++	.file "__read_tp.S"
 +
- /* Initial entry point code for the dynamic linker.
-    The C function `_dl_start' is the real entry point;
-    its return value is the user program's entry point.	*/
+ 	.hidden __read_tp
+ ENTRY (__read_tp)
+ 	mrs	x0, tpidr_el0
+diff --git a/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S b/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S
+index f64c4ffe8a..2da315ab08 100644
+--- a/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S
++++ b/sysdeps/unix/sysv/linux/arm/aeabi_read_tp.S
+@@ -39,6 +39,8 @@
+    a normal function call) in a high page of memory; tail call to the
+    helper.  */
+ 
++	.file "aeabi_read_tp.S"
++
+ 	.hidden __aeabi_read_tp
+ ENTRY (__aeabi_read_tp)
+ #ifdef ARCH_HAS_HARD_TP
 diff --git a/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S b/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S
-index d26ad1f8d3..a0de10bf81 100644
+index 0b6237ac55..8cda491c28 100644
 --- a/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S
 +++ b/sysdeps/unix/sysv/linux/arm/libc-do-syscall.S
 @@ -27,6 +27,8 @@
@@ -270,3 +291,14 @@ index d26ad1f8d3..a0de10bf81 100644
  #if defined(__thumb__)
  	.thumb
  	.syntax unified
+diff --git a/sysdeps/unix/sysv/linux/powerpc/dl-brk.S b/sysdeps/unix/sysv/linux/powerpc/dl-brk.S
+index eeb96544e3..da182b28f8 100644
+--- a/sysdeps/unix/sysv/linux/powerpc/dl-brk.S
++++ b/sysdeps/unix/sysv/linux/powerpc/dl-brk.S
+@@ -1 +1,3 @@
++	.file "dl-brk.S"
++
+ #include <brk.S>
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0033-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch b/meta/recipes-core/glibc/glibc/0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
similarity index 64%
rename from meta/recipes-core/glibc/glibc/0033-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
rename to meta/recipes-core/glibc/glibc/0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
index 31058ca91a..adc2424002 100644
--- a/meta/recipes-core/glibc/glibc/0033-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
+++ b/meta/recipes-core/glibc/glibc/0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch
@@ -1,7 +1,7 @@
-From cbada1a1b218c1ef61d0eb4363fad7598e6509d6 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 30 Sep 2018 09:16:48 +0000
-Subject: [PATCH] locale: prevent maybe-uninitialized errors with -Os [BZ
+From 6ddab9c8692e6a777c2e2e7a6ca26a65df7d2c5d Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Mon, 17 Dec 2018 21:36:18 +0000
+Subject: [PATCH 30/30] locale: prevent maybe-uninitialized errors with -Os [BZ
  #19444]
 
 Fixes following error when building for aarch64 with -Os:
@@ -21,34 +21,19 @@ Fixes following error when building for aarch64 with -Os:
 |    coll_seq seq1, seq2;
 |             ^~~~
 
-        Partial fix for [BZ #23716]
+        Partial fix for [BZ #19444]
         * locale/weight.h: Fix build with -Os.
 
-Work around the issue instead of removing -O like we do with
-SELECTED_OPTIMIZATION
-
-Upstream-Status: Submitted [https://www.sourceware.org/ml/libc-alpha/2018-09/msg00539.html]
+Upstream-Status: Submitted [https://patchwork.ozlabs.org/patch/1014766]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- ChangeLog       | 4 ++++
  locale/weight.h | 7 +++++++
- 2 files changed, 11 insertions(+)
+ 1 file changed, 7 insertions(+)
 
-diff --git a/ChangeLog b/ChangeLog
-index 216336edc9..84fbbf47ed 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,7 @@
-+2018-09-30  Martin Jansa  <Martin.Jansa@gmail.com>
-+	Partial fix for [BZ #23716]
-+	* locale/weight.h: Fix build with -Os.
-+
- 2018-09-30  Martin Jansa  <Martin.Jansa@gmail.com>
- 	Partial fix for [BZ #23716]
- 	* sysdeps/ieee754/soft-fp/s_fdiv.c: Fix build with -O.
 diff --git a/locale/weight.h b/locale/weight.h
-index 6028d3595e..10bcea25e5 100644
+index 7ca81498b2..d608ca70bb 100644
 --- a/locale/weight.h
 +++ b/locale/weight.h
 @@ -28,7 +28,14 @@ findidx (const int32_t *table,
@@ -66,3 +51,6 @@ index 6028d3595e..10bcea25e5 100644
    const unsigned char *cp;
    const unsigned char *usrc;
  
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors-w.patch b/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors-w.patch
deleted file mode 100644
index 61f55d4f83..0000000000
--- a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors-w.patch
+++ /dev/null
@@ -1,258 +0,0 @@
-From 546b46c309a52ed74dc906114b1e984bb9703d74 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 14 Sep 2018 23:23:03 +0000
-Subject: [PATCH] sysdeps/ieee754: prevent maybe-uninitialized errors with -O
- [BZ #19444]
-
-With -O included in CFLAGS it fails to build with:
-
-../sysdeps/ieee754/ldbl-96/e_jnl.c: In function '__ieee754_jnl':
-../sysdeps/ieee754/ldbl-96/e_jnl.c:146:20: error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-      b = invsqrtpi * temp / sqrtl (x);
-          ~~~~~~~~~~^~~~~~
-../sysdeps/ieee754/ldbl-96/e_jnl.c: In function '__ieee754_ynl':
-../sysdeps/ieee754/ldbl-96/e_jnl.c:375:16: error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-  b = invsqrtpi * temp / sqrtl (x);
-      ~~~~~~~~~~^~~~~~
-../sysdeps/ieee754/dbl-64/e_jn.c: In function '__ieee754_jn':
-../sysdeps/ieee754/dbl-64/e_jn.c:113:20: error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-      b = invsqrtpi * temp / sqrt (x);
-          ~~~~~~~~~~^~~~~~
-../sysdeps/ieee754/dbl-64/e_jn.c: In function '__ieee754_yn':
-../sysdeps/ieee754/dbl-64/e_jn.c:320:16: error: 'temp' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-  b = invsqrtpi * temp / sqrt (x);
-      ~~~~~~~~~~^~~~~~
-
-Build tested with Yocto for ARM, AARCH64, X86, X86_64, PPC, MIPS, MIPS64
-with -O, -O1, -Os.
-For soft-fp ARM it needs one more fix for -O1:
-https://sourceware.org/ml/libc-alpha/2018-09/msg00300.html
-For AARCH64 it needs one more fix in locale for -Os.
-
-        [BZ #23716]
-        * sysdeps/ieee754/dbl-96/e_jnl.c: Fix build with -O
-        * sysdeps/ieee754/ldbl-96/e_jnl.c: Likewise.
-        * sysdeps/ieee754/ldbl-128/e_jnl.c: Likewise.
-        * sysdeps/ieee754/ldbl-128ibm/e_jnl.c: Likewise.
-
-Work around the issue instead of removing -O like we do with
-SELECTED_OPTIMIZATION
-
-Upstream-Status: Submitted [https://www.sourceware.org/ml/libc-alpha/2018-09/msg00299.html]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- ChangeLog                           |  7 +++++++
- sysdeps/ieee754/dbl-64/e_jn.c       | 21 +++++++++++++++++++++
- sysdeps/ieee754/ldbl-128/e_jnl.c    | 21 +++++++++++++++++++++
- sysdeps/ieee754/ldbl-128ibm/e_jnl.c | 21 +++++++++++++++++++++
- sysdeps/ieee754/ldbl-96/e_jnl.c     | 21 +++++++++++++++++++++
- 5 files changed, 91 insertions(+)
-
-diff --git a/ChangeLog b/ChangeLog
-index 11a9b8d98e..922e916f2c 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,10 @@
-+2018-09-29  Martin Jansa  <Martin.Jansa@gmail.com>
-+	Partial fix for [BZ #23716]
-+	* sysdeps/ieee754/dbl-96/e_jnl.c: Fix build with -O
-+	* sysdeps/ieee754/ldbl-96/e_jnl.c: Likewise.
-+	* sysdeps/ieee754/ldbl-128/e_jnl.c: Likewise.
-+	* sysdeps/ieee754/ldbl-128ibm/e_jnl.c: Likewise.
-+
- 2018-09-28  Adhemerval Zanella  <adhemerval.zanella@linaro.org>
- 
- 	[BZ #23579]
-diff --git a/sysdeps/ieee754/dbl-64/e_jn.c b/sysdeps/ieee754/dbl-64/e_jn.c
-index 9181b22bb8..9ff52c737f 100644
---- a/sysdeps/ieee754/dbl-64/e_jn.c
-+++ b/sysdeps/ieee754/dbl-64/e_jn.c
-@@ -42,6 +42,7 @@
- #include <math-narrow-eval.h>
- #include <math_private.h>
- #include <math-underflow.h>
-+#include <libc-diag.h>
- 
- static const double
-   invsqrtpi = 5.64189583547756279280e-01, /* 0x3FE20DD7, 0x50429B6D */
-@@ -109,7 +110,17 @@ __ieee754_jn (int n, double x)
- 	      case 2: temp = -c - s; break;
- 	      case 3: temp = c - s; break;
- 	      }
-+	    /* With GCC 8 (and older) when compiling with -O the compiler
-+	       warns that the variable 'temp', may be used uninitialized.
-+	       The switch above covers all possible values of n & 3
-+	       but GCC without VRP enabled isn't able to figure out the
-+	       range of possible values is [0,3] as explained in:
-+	       https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69230
-+	       so it's false possitive with -O1 and lower. */
-+	    DIAG_PUSH_NEEDS_COMMENT;
-+	    DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
- 	    b = invsqrtpi * temp / sqrt (x);
-+	    DIAG_POP_NEEDS_COMMENT;
- 	  }
- 	else
- 	  {
-@@ -316,7 +327,17 @@ __ieee754_yn (int n, double x)
- 	  case 2: temp = -s + c; break;
- 	  case 3: temp = s + c; break;
- 	  }
-+	/* With GCC 8 (and older) when compiling with -O the compiler
-+	   warns that the variable 'temp', may be used uninitialized.
-+	   The switch above covers all possible values of n & 3
-+	   but GCC without VRP enabled isn't able to figure out the
-+	   range of possible values is [0,3] as explained in:
-+	   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69230
-+	   so it's false possitive with -O1 and lower. */
-+	DIAG_PUSH_NEEDS_COMMENT;
-+	DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
- 	b = invsqrtpi * temp / sqrt (x);
-+	DIAG_POP_NEEDS_COMMENT;
-       }
-     else
-       {
-diff --git a/sysdeps/ieee754/ldbl-128/e_jnl.c b/sysdeps/ieee754/ldbl-128/e_jnl.c
-index 7739eec291..8706a11575 100644
---- a/sysdeps/ieee754/ldbl-128/e_jnl.c
-+++ b/sysdeps/ieee754/ldbl-128/e_jnl.c
-@@ -61,6 +61,7 @@
- #include <math.h>
- #include <math_private.h>
- #include <math-underflow.h>
-+#include <libc-diag.h>
- 
- static const _Float128
-   invsqrtpi = L(5.6418958354775628694807945156077258584405E-1),
-@@ -150,7 +151,17 @@ __ieee754_jnl (int n, _Float128 x)
- 		temp = c - s;
- 		break;
- 	      }
-+	    /* With GCC 8 (and older) when compiling with -O the compiler
-+	       warns that the variable 'temp', may be used uninitialized.
-+	       The switch above covers all possible values of n & 3
-+	       but GCC without VRP enabled isn't able to figure out the
-+	       range of possible values is [0,3] as explained in:
-+	       https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69230
-+	       so it's false possitive with -O1 and lower. */
-+	    DIAG_PUSH_NEEDS_COMMENT;
-+	    DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
- 	    b = invsqrtpi * temp / sqrtl (x);
-+	    DIAG_POP_NEEDS_COMMENT;
- 	  }
- 	else
- 	  {
-@@ -386,7 +397,17 @@ __ieee754_ynl (int n, _Float128 x)
- 	    temp = s + c;
- 	    break;
- 	  }
-+	/* With GCC 8 (and older) when compiling with -O the compiler
-+	   warns that the variable 'temp', may be used uninitialized.
-+	   The switch above covers all possible values of n & 3
-+	   but GCC without VRP enabled isn't able to figure out the
-+	   range of possible values is [0,3] as explained in:
-+	   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69230
-+	   so it's false possitive with -O1 and lower. */
-+	DIAG_PUSH_NEEDS_COMMENT;
-+	DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
- 	b = invsqrtpi * temp / sqrtl (x);
-+	DIAG_POP_NEEDS_COMMENT;
-       }
-     else
-       {
-diff --git a/sysdeps/ieee754/ldbl-128ibm/e_jnl.c b/sysdeps/ieee754/ldbl-128ibm/e_jnl.c
-index 71b3addfba..3226d02309 100644
---- a/sysdeps/ieee754/ldbl-128ibm/e_jnl.c
-+++ b/sysdeps/ieee754/ldbl-128ibm/e_jnl.c
-@@ -61,6 +61,7 @@
- #include <math.h>
- #include <math_private.h>
- #include <math-underflow.h>
-+#include <libc-diag.h>
- 
- static const long double
-   invsqrtpi = 5.6418958354775628694807945156077258584405E-1L,
-@@ -150,7 +151,17 @@ __ieee754_jnl (int n, long double x)
- 		temp = c - s;
- 		break;
- 	      }
-+	    /* With GCC 8 (and older) when compiling with -O the compiler
-+	       warns that the variable 'temp', may be used uninitialized.
-+	       The switch above covers all possible values of n & 3
-+	       but GCC without VRP enabled isn't able to figure out the
-+	       range of possible values is [0,3] as explained in:
-+	       https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69230
-+	       so it's false possitive with -O1 and lower. */
-+	    DIAG_PUSH_NEEDS_COMMENT;
-+	    DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
- 	    b = invsqrtpi * temp / sqrtl (x);
-+	    DIAG_POP_NEEDS_COMMENT;
- 	  }
- 	else
- 	  {
-@@ -386,7 +397,17 @@ __ieee754_ynl (int n, long double x)
- 	    temp = s + c;
- 	    break;
- 	  }
-+	/* With GCC 8 (and older) when compiling with -O the compiler
-+	   warns that the variable 'temp', may be used uninitialized.
-+	   The switch above covers all possible values of n & 3
-+	   but GCC without VRP enabled isn't able to figure out the
-+	   range of possible values is [0,3] as explained in:
-+	   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69230
-+	   so it's false possitive with -O1 and lower. */
-+	DIAG_PUSH_NEEDS_COMMENT;
-+	DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
- 	b = invsqrtpi * temp / sqrtl (x);
-+	DIAG_POP_NEEDS_COMMENT;
-       }
-     else
-       {
-diff --git a/sysdeps/ieee754/ldbl-96/e_jnl.c b/sysdeps/ieee754/ldbl-96/e_jnl.c
-index 394921f564..da5c2cc93e 100644
---- a/sysdeps/ieee754/ldbl-96/e_jnl.c
-+++ b/sysdeps/ieee754/ldbl-96/e_jnl.c
-@@ -61,6 +61,7 @@
- #include <math.h>
- #include <math_private.h>
- #include <math-underflow.h>
-+#include <libc-diag.h>
- 
- static const long double
-   invsqrtpi = 5.64189583547756286948079e-1L, two = 2.0e0L, one = 1.0e0L;
-@@ -143,7 +144,17 @@ __ieee754_jnl (int n, long double x)
- 		temp = c - s;
- 		break;
- 	      }
-+	    /* With GCC 8 (and older) when compiling with -O the compiler
-+	       warns that the variable 'temp', may be used uninitialized.
-+	       The switch above covers all possible values of n & 3
-+	       but GCC without VRP enabled isn't able to figure out the
-+	       range of possible values is [0,3] as explained in:
-+	       https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69230
-+	       so it's false possitive with -O1 and lower. */
-+	    DIAG_PUSH_NEEDS_COMMENT;
-+	    DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
- 	    b = invsqrtpi * temp / sqrtl (x);
-+	    DIAG_POP_NEEDS_COMMENT;
- 	  }
- 	else
- 	  {
-@@ -372,7 +383,17 @@ __ieee754_ynl (int n, long double x)
- 	    temp = s + c;
- 	    break;
- 	  }
-+	/* With GCC 8 (and older) when compiling with -O the compiler
-+	   warns that the variable 'temp', may be used uninitialized.
-+	   The switch above covers all possible values of n & 3
-+	   but GCC without VRP enabled isn't able to figure out the
-+	   range of possible values is [0,3] as explained in:
-+	   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69230
-+	   so it's false possitive with -O1 and lower. */
-+	DIAG_PUSH_NEEDS_COMMENT;
-+	DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
- 	b = invsqrtpi * temp / sqrtl (x);
-+	DIAG_POP_NEEDS_COMMENT;
-       }
-     else
-       {
diff --git a/meta/recipes-core/glibc/glibc/0032-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch b/meta/recipes-core/glibc/glibc/0032-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch
deleted file mode 100644
index 99cd2509ec..0000000000
--- a/meta/recipes-core/glibc/glibc/0032-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 618668540e263c09b0eb28131dde7b4500158fd4 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sun, 16 Sep 2018 12:39:22 +0000
-Subject: [PATCH] sysdeps/ieee754/soft-fp: ignore maybe-uninitialized with -O
- [BZ #19444]
-
-* with -O, -O1, -Os it fails with:
-
-In file included from ../soft-fp/soft-fp.h:318,
-                 from ../sysdeps/ieee754/soft-fp/s_fdiv.c:28:
-../sysdeps/ieee754/soft-fp/s_fdiv.c: In function '__fdiv':
-../soft-fp/op-2.h:98:25: error: 'R_f1' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-        X##_f0 = (X##_f1 << (_FP_W_TYPE_SIZE - (N)) | X##_f0 >> (N) \
-                         ^~
-../sysdeps/ieee754/soft-fp/s_fdiv.c:38:14: note: 'R_f1' was declared here
-   FP_DECL_D (R);
-              ^
-../soft-fp/op-2.h:37:36: note: in definition of macro '_FP_FRAC_DECL_2'
-   _FP_W_TYPE X##_f0 _FP_ZERO_INIT, X##_f1 _FP_ZERO_INIT
-                                    ^
-../soft-fp/double.h:95:24: note: in expansion of macro '_FP_DECL'
- # define FP_DECL_D(X)  _FP_DECL (2, X)
-                        ^~~~~~~~
-../sysdeps/ieee754/soft-fp/s_fdiv.c:38:3: note: in expansion of macro 'FP_DECL_D'
-   FP_DECL_D (R);
-   ^~~~~~~~~
-../soft-fp/op-2.h:101:17: error: 'R_f0' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-       : (X##_f0 << (_FP_W_TYPE_SIZE - (N))) != 0)); \
-                 ^~
-../sysdeps/ieee754/soft-fp/s_fdiv.c:38:14: note: 'R_f0' was declared here
-   FP_DECL_D (R);
-              ^
-../soft-fp/op-2.h:37:14: note: in definition of macro '_FP_FRAC_DECL_2'
-   _FP_W_TYPE X##_f0 _FP_ZERO_INIT, X##_f1 _FP_ZERO_INIT
-              ^
-../soft-fp/double.h:95:24: note: in expansion of macro '_FP_DECL'
- # define FP_DECL_D(X)  _FP_DECL (2, X)
-                        ^~~~~~~~
-../sysdeps/ieee754/soft-fp/s_fdiv.c:38:3: note: in expansion of macro 'FP_DECL_D'
-   FP_DECL_D (R);
-   ^~~~~~~~~
-
-Build tested with Yocto for ARM, AARCH64, X86, X86_64, PPC, MIPS, MIPS64
-with -O, -O1, -Os.
-For AARCH64 it needs one more fix in locale for -Os.
-
-	Partial fix for [BZ #23716]
-	* sysdeps/ieee754/soft-fp/s_fdiv.c: Fix build with -O
-
-Work around the issue instead of removing -O like we do with
-SELECTED_OPTIMIZATION
-
-Upstream-Status: Submitted [https://www.sourceware.org/ml/libc-alpha/2018-09/msg00300.html]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- ChangeLog                        |  4 ++++
- sysdeps/ieee754/soft-fp/s_fdiv.c | 12 ++++++++++++
- 2 files changed, 16 insertions(+)
-
-diff --git a/ChangeLog b/ChangeLog
-index 922e916f2c..216336edc9 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,7 @@
-+2018-09-30  Martin Jansa  <Martin.Jansa@gmail.com>
-+	Partial fix for [BZ #23716]
-+	* sysdeps/ieee754/soft-fp/s_fdiv.c: Fix build with -O.
-+
- 2018-09-29  Martin Jansa  <Martin.Jansa@gmail.com>
- 	Partial fix for [BZ #23716]
- 	* sysdeps/ieee754/dbl-96/e_jnl.c: Fix build with -O
-diff --git a/sysdeps/ieee754/soft-fp/s_fdiv.c b/sysdeps/ieee754/soft-fp/s_fdiv.c
-index 341339f5ed..14655b77da 100644
---- a/sysdeps/ieee754/soft-fp/s_fdiv.c
-+++ b/sysdeps/ieee754/soft-fp/s_fdiv.c
-@@ -25,6 +25,16 @@
- #undef fdivl
- 
- #include <math-narrow.h>
-+
-+#include <libc-diag.h>
-+/* R_f[01] are not set in cases where it is not used in packing, but the
-+   compiler does not see that it is set in all cases where it is
-+   used, resulting in warnings that it may be used uninitialized.
-+   The location of the warning differs in different versions of GCC,
-+   it may be where R is defined using a macro or it may be where the
-+   macro is defined.  */
-+DIAG_PUSH_NEEDS_COMMENT;
-+DIAG_IGNORE_NEEDS_COMMENT (8, "-Wmaybe-uninitialized");
- #include <soft-fp.h>
- #include <single.h>
- #include <double.h>
-@@ -53,4 +63,6 @@ __fdiv (double x, double y)
-   CHECK_NARROW_DIV (ret, x, y);
-   return ret;
- }
-+DIAG_POP_NEEDS_COMMENT;
-+
- libm_alias_float_double (div)
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.29.bb
similarity index 88%
rename from meta/recipes-core/glibc/glibc_2.28.bb
rename to meta/recipes-core/glibc/glibc_2.29.bb
index cebd2d0c9f..362c172833 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.29.bb
@@ -7,13 +7,24 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=cfc0ed77a9f62fa62eded042ebe31d72 \
 
 DEPENDS += "gperf-native bison-native make-native"
 
-SRCREV ?= "044c96f0d5595aeb0bb4e79355081c5a7f4faca5"
+PV = "2.29"
+
+SRCREV ?= "56c86f5dd516284558e106d04b92875d5b623b7a"
 
 SRCBRANCH ?= "release/${PV}/master"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
 
+NATIVESDKFIXES ?= ""
+NATIVESDKFIXES_class-nativesdk = "\
+           file://0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch \
+           file://0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch \
+           file://0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch \
+           file://0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch \
+           file://0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch \
+"
+
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://etc/ld.so.conf \
            file://generate-supported.mk \
@@ -38,26 +49,13 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-eglibc-Resolve-__fpscr_values-on-SH4.patch \
            file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
-           file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
-           file://0025-locale-fix-hard-coded-reference-to-gcc-E.patch \
+           file://0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
+           file://0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
            file://0026-reset-dl_load_write_lock-after-forking.patch \
            file://0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch \
-           file://0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch \
-           file://0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
-           file://0030-intl-Emit-no-lines-in-bison-generated-files.patch \
-           file://0031-sysdeps-ieee754-prevent-maybe-uninitialized-errors-w.patch \
-           file://0032-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch \
-           file://0033-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
-           file://0034-inject-file-assembly-directives.patch \
-"
-
-NATIVESDKFIXES ?= ""
-NATIVESDKFIXES_class-nativesdk = "\
-           file://0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch \
-           file://0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch \
-           file://0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch \
-           file://0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch \
-           file://0005-nativesdk-glibc-Make-relocatable-install-for-locales.patch \
+           file://0028-intl-Emit-no-lines-in-bison-generated-files.patch \
+           file://0029-inject-file-assembly-directives.patch \
+           file://0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.20.1


