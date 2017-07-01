Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 67FBC78286
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 14:23:39 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id q86so80127582pfl.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jul 2017 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cH/bVQxZ47SgBhghUu4Wo3DmF1Sx9IIeNzx9lO4RY4M=;
	b=ozD6jU92S51CNL3QyLpWOTbAd1A4duWpXA45KrhYSrIyGxEeKMGNt13+3tRtTfFPQ5
	fAAHOoUFlI4rZob+oq2qeOJ1FcrwSnrXgsxVF8OVZFidgnmd1rWF7LCidqehECTNeoCU
	BzkadEF17id7s2eX+nrhJqUw6+UY3kGf8meypR6Cz95r1t09iF/LwhP6BgXEc4jBLt78
	Z7H9S1toVYfNc+uUKWUihKdNxjdMslbljaS6HuhRB7k/Gq8meY3Muus/rjAuMPR5eUzA
	Xle9csUj3mW8hkvNIeZl7c+ptDBqWTjBM6JsOKuEMI+aP5H+4ARaZ0c78BNbfAPNM80t
	LVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cH/bVQxZ47SgBhghUu4Wo3DmF1Sx9IIeNzx9lO4RY4M=;
	b=JBwnyee8DNGv73e27EctD0oOqK3JRa/xUeA+nUmhWjg/tOEuEGdSbMGhUnszKQ+VlF
	Z8rCLIi8wPIBlxIhEaQUP6UUh5BkZLEK/TlwwSxOhWnN5MOcVgVNhm/zYxHsFz2vLSDd
	/0QyS9nYM/NynEsT+b2SMcE1YuBLBuS+GujyCHnPMSmrWXF4XZ2RGClpNV4Hmj0NOg6B
	HN7QDyIMxpg5lqkbxRAbF1H/c+xB4dMdtyiIbd9gKo4SL+F7HFMMzSBPok9gfdXTb5gA
	X3VQv/sA2IF7C48clb+J3dShLjgtMly6McjMki45TiaHH06wcjl2T8PUIDtnu5FIRE0L
	Gi2w==
X-Gm-Message-State: AIVw111I7R5JawENatIrcZXU1i9EWIsgTOVvW4DCiSkwmr1BFIdgpO22
	qVj+NwrJ2LBr97uk
X-Received: by 10.101.77.6 with SMTP id i6mr1046524pgt.43.1498919020151;
	Sat, 01 Jul 2017 07:23:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	17sm25026909pfn.84.2017.07.01.07.23.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 07:23:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jul 2017 07:23:04 -0700
Message-Id: <fc69d8fa01166130596f7987a7700959b71fc941.1498893436.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498893436.git.raj.khem@gmail.com>
References: <cover.1498893436.git.raj.khem@gmail.com>
Subject: [PATCH 01/19] glibc: Upgrade to 2.25.90
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
X-List-Received-Date: Sat, 01 Jul 2017 14:23:40 -0000

Eventually it will be released as 2.26 final

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 ...e_2.25.bb => cross-localedef-native_2.25.90.bb} | 27 +++++-----
 ...bc-initial_2.25.bb => glibc-initial_2.25.90.bb} |  0
 ...libc-locale_2.25.bb => glibc-locale_2.25.90.bb} |  0
 ...libc-mtrace_2.25.bb => glibc-mtrace_2.25.90.bb} |  0
 ...bc-scripts_2.25.bb => glibc-scripts_2.25.90.bb} |  0
 ...libc-Look-for-host-system-ld.so.cache-as-.patch |  6 +--
 ...libc-Fix-buffer-overrun-with-a-relocated-.patch |  6 +--
 ...libc-Raise-the-size-of-arrays-containing-.patch | 34 ++++++-------
 ...ivesdk-glibc-Allow-64-bit-atomics-for-x86.patch | 11 +++--
 ...500-e5500-e6500-603e-fsqrt-implementation.patch | 42 ++++++++--------
 ...-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch |  6 +--
 ...-Fix-undefined-reference-to-__sqrt_finite.patch | 28 +++++------
 ...qrt-f-are-now-inline-functions-and-call-o.patch | 28 +++++------
 ...bug-1443-which-explains-what-the-patch-do.patch |  8 +--
 ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |  6 +--
 ...qrt-f-are-now-inline-functions-and-call-o.patch |  8 +--
 ...ersion-output-matching-grok-gold-s-output.patch | 44 -----------------
 ...configure.ac-handle-correctly-libc_cv_ro.patch} | 10 ++--
 ...ibute.patch => 0013-Add-unused-attribute.patch} |  8 +--
 ...hin-the-path-sets-wrong-config-variables.patch} | 30 ++++++------
 ...timezone-re-written-tzselect-as-posix-sh.patch} | 12 ++---
 ...ove-bash-dependency-for-nscd-init-script.patch} | 11 +++--
 ...-Cross-building-and-testing-instructions.patch} | 10 ++--
 ...18-eglibc-Help-bootstrap-cross-toolchain.patch} | 10 ++--
 ... 0019-eglibc-Clear-cache-lines-on-ppc8xx.patch} | 10 ++--
 ...020-eglibc-Resolve-__fpscr_values-on-SH4.patch} | 10 ++--
 ...atch => 0021-eglibc-Install-PIC-archives.patch} | 20 ++++----
 ...ard-port-cross-locale-generation-support.patch} | 36 +++++++-------
 ...023-Define-DUMMY_LOCALE_T-if-not-defined.patch} |  8 +--
 ...m.patch => 0024-local-dynamic-resolvconf.patch} | 57 ++++++++++++----------
 ...c-Make-_dl_build_local_scope-breadth-fir.patch} |  8 +--
 ...locale-fix-hard-coded-reference-to-gcc-E.patch} | 10 ++--
 .../glibc/{glibc_2.25.bb => glibc_2.25.90.bb}      | 36 +++++++-------
 34 files changed, 253 insertions(+), 289 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.25.bb => cross-localedef-native_2.25.90.bb} (61%)
 rename meta/recipes-core/glibc/{glibc-initial_2.25.bb => glibc-initial_2.25.90.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-locale_2.25.bb => glibc-locale_2.25.90.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.25.bb => glibc-mtrace_2.25.90.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.25.bb => glibc-scripts_2.25.90.bb} (100%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0012-Make-ld-version-output-matching-grok-gold-s-output.patch
 rename meta/recipes-core/glibc/glibc/{0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch => 0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch} (82%)
 rename meta/recipes-core/glibc/glibc/{0014-Add-unused-attribute.patch => 0013-Add-unused-attribute.patch} (82%)
 rename meta/recipes-core/glibc/glibc/{0015-yes-within-the-path-sets-wrong-config-variables.patch => 0014-yes-within-the-path-sets-wrong-config-variables.patch} (94%)
 rename meta/recipes-core/glibc/glibc/{0016-timezone-re-written-tzselect-as-posix-sh.patch => 0015-timezone-re-written-tzselect-as-posix-sh.patch} (81%)
 rename meta/recipes-core/glibc/glibc/{0017-Remove-bash-dependency-for-nscd-init-script.patch => 0016-Remove-bash-dependency-for-nscd-init-script.patch} (89%)
 rename meta/recipes-core/glibc/glibc/{0018-eglibc-Cross-building-and-testing-instructions.patch => 0017-eglibc-Cross-building-and-testing-instructions.patch} (99%)
 rename meta/recipes-core/glibc/glibc/{0019-eglibc-Help-bootstrap-cross-toolchain.patch => 0018-eglibc-Help-bootstrap-cross-toolchain.patch} (94%)
 rename meta/recipes-core/glibc/glibc/{0021-eglibc-Clear-cache-lines-on-ppc8xx.patch => 0019-eglibc-Clear-cache-lines-on-ppc8xx.patch} (94%)
 rename meta/recipes-core/glibc/glibc/{0022-eglibc-Resolve-__fpscr_values-on-SH4.patch => 0020-eglibc-Resolve-__fpscr_values-on-SH4.patch} (88%)
 rename meta/recipes-core/glibc/glibc/{0023-eglibc-Install-PIC-archives.patch => 0021-eglibc-Install-PIC-archives.patch} (90%)
 rename meta/recipes-core/glibc/glibc/{0024-eglibc-Forward-port-cross-locale-generation-support.patch => 0022-eglibc-Forward-port-cross-locale-generation-support.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0025-Define-DUMMY_LOCALE_T-if-not-defined.patch => 0023-Define-DUMMY_LOCALE_T-if-not-defined.patch} (80%)
 rename meta/recipes-core/glibc/glibc/{0020-eglibc-cherry-picked-from.patch => 0024-local-dynamic-resolvconf.patch} (49%)
 rename meta/recipes-core/glibc/glibc/{0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch => 0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch} (89%)
 rename meta/recipes-core/glibc/glibc/{0027-locale-fix-hard-coded-reference-to-gcc-E.patch => 0026-locale-fix-hard-coded-reference-to-gcc-E.patch} (82%)
 rename meta/recipes-core/glibc/{glibc_2.25.bb => glibc_2.25.90.bb} (80%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 424b8887cc..8ffb8ad046 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ GCCVERSION ?= "7.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.28%"
 GDBVERSION ?= "8.0%"
-GLIBCVERSION ?= "2.25"
+GLIBCVERSION ?= "2.25%"
 LINUXLIBCVERSION ?= "4.10%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.25.bb b/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
similarity index 61%
rename from meta/recipes-core/glibc/cross-localedef-native_2.25.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
index cbd16f7263..fbb77f039a 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.25.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
@@ -17,25 +17,26 @@ inherit autotools
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
-SRCBRANCH ?= "release/${PV}/master"
+#SRCBRANCH ?= "release/${PV}/master"
+SRCBRANCH ?= "master"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRCREV_glibc ?= "db0242e3023436757bbc7c488a779e6e3343db04"
-SRCREV_localedef ?= "29869b6dc11427c5bab839bdb155c85a7c644c71"
+SRCREV_glibc ?= "8466ee1cb7c2041d8471dad0aa53af35ab599012"
+SRCREV_localedef ?= "dfb4afe551c6c6e94f9cc85417bd1f582168c843"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
-           file://0016-timezone-re-written-tzselect-as-posix-sh.patch \
-           file://0017-Remove-bash-dependency-for-nscd-init-script.patch \
-           file://0018-eglibc-Cross-building-and-testing-instructions.patch \
-           file://0019-eglibc-Help-bootstrap-cross-toolchain.patch \
-           file://0020-eglibc-cherry-picked-from.patch \
-           file://0021-eglibc-Clear-cache-lines-on-ppc8xx.patch \
-           file://0022-eglibc-Resolve-__fpscr_values-on-SH4.patch \
-           file://0023-eglibc-Install-PIC-archives.patch \
-           file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
-           file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
+           file://0015-timezone-re-written-tzselect-as-posix-sh.patch \
+           file://0016-Remove-bash-dependency-for-nscd-init-script.patch \
+           file://0017-eglibc-Cross-building-and-testing-instructions.patch \
+           file://0018-eglibc-Help-bootstrap-cross-toolchain.patch \
+           file://0019-eglibc-Clear-cache-lines-on-ppc8xx.patch \
+           file://0020-eglibc-Resolve-__fpscr_values-on-SH4.patch \
+           file://0021-eglibc-Install-PIC-archives.patch \
+           file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
+           file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
+           file://0024-local-dynamic-resolvconf.patch \
 "
 # Makes for a rather long rev (22 characters), but...
 #
diff --git a/meta/recipes-core/glibc/glibc-initial_2.25.bb b/meta/recipes-core/glibc/glibc-initial_2.25.90.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-initial_2.25.bb
rename to meta/recipes-core/glibc/glibc-initial_2.25.90.bb
diff --git a/meta/recipes-core/glibc/glibc-locale_2.25.bb b/meta/recipes-core/glibc/glibc-locale_2.25.90.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.25.bb
rename to meta/recipes-core/glibc/glibc-locale_2.25.90.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.25.bb b/meta/recipes-core/glibc/glibc-mtrace_2.25.90.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.25.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.25.90.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.25.bb b/meta/recipes-core/glibc/glibc-scripts_2.25.90.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.25.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.25.90.bb
diff --git a/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index 0553f8a472..4493d07238 100644
--- a/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,4 +1,4 @@
-From 2727e58d1d269994de17cadb12195001b14585e7 Mon Sep 17 00:00:00 2001
+From 7ded71c14e1778b7f275b0cf396cc5e2b4c66835 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:48:24 +0000
 Subject: [PATCH 01/26] nativesdk-glibc: Look for host system ld.so.cache as
@@ -31,7 +31,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 51fb0d0..f503dbc 100644
+index c1b6d4ba0f..d7af9ebcbc 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -2054,6 +2054,14 @@ _dl_map_object (struct link_map *loader, const char *name,
@@ -65,5 +65,5 @@ index 51fb0d0..f503dbc 100644
        if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_LIBS))
  	_dl_debug_printf ("\n");
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index e5ef3410e9..e50e276ffb 100644
--- a/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,4 +1,4 @@
-From 1578f52647ec8804186d1944d4cd2095132efc39 Mon Sep 17 00:00:00 2001
+From 61efe175180a92ad7b0a173c3ac2eab0fd459ecb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
 Subject: [PATCH 02/26] nativesdk-glibc: Fix buffer overrun with a relocated
@@ -22,7 +22,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index f503dbc..3a3d112 100644
+index d7af9ebcbc..19c1db9948 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -1753,7 +1753,19 @@ open_path (const char *name, size_t namelen, int mode,
@@ -46,5 +46,5 @@ index f503dbc..3a3d112 100644
      {
        struct r_search_path_elem *this_dir = *dirs;
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index 9e207e44d9..f2952fd089 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,4 +1,4 @@
-From e53968d61804b6bab32ec6e13cc0b3cd57214796 Mon Sep 17 00:00:00 2001
+From d658dcbc36e392007643b4fcd167683676d42963 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
 Subject: [PATCH 03/26] nativesdk-glibc: Raise the size of arrays containing dl
@@ -26,10 +26,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  7 files changed, 14 insertions(+), 10 deletions(-)
 
 diff --git a/elf/dl-cache.c b/elf/dl-cache.c
-index cfa335e..daa12ec 100644
+index e9632da0b3..4de529d2cf 100644
 --- a/elf/dl-cache.c
 +++ b/elf/dl-cache.c
-@@ -132,6 +132,10 @@ do									      \
+@@ -133,6 +133,10 @@ do									      \
  while (0)
  
  
@@ -41,7 +41,7 @@ index cfa335e..daa12ec 100644
  internal_function
  _dl_cache_libcmp (const char *p1, const char *p2)
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 3a3d112..a1410e4 100644
+index 19c1db9948..70c259b400 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -106,8 +106,8 @@ static size_t max_capstrlen attribute_relro;
@@ -56,7 +56,7 @@ index 3a3d112..a1410e4 100644
    SYSTEM_DIRS_LEN
  };
 diff --git a/elf/interp.c b/elf/interp.c
-index 9448802..e7e8c70 100644
+index b6e8f04444..47c20415bc 100644
 --- a/elf/interp.c
 +++ b/elf/interp.c
 @@ -18,5 +18,5 @@
@@ -67,7 +67,7 @@ index 9448802..e7e8c70 100644
 +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
    = RUNTIME_LINKER;
 diff --git a/elf/ldconfig.c b/elf/ldconfig.c
-index 467ca82..631a2a9 100644
+index 99caf9e9bb..36ea5df5f1 100644
 --- a/elf/ldconfig.c
 +++ b/elf/ldconfig.c
 @@ -168,6 +168,9 @@ static struct argp argp =
@@ -81,18 +81,18 @@ index 467ca82..631a2a9 100644
     a platform.  */
  static int
 diff --git a/elf/rtld.c b/elf/rtld.c
-index 4ec25d7..e159c12 100644
+index 65647fb1c8..cd8381cb33 100644
 --- a/elf/rtld.c
 +++ b/elf/rtld.c
-@@ -99,6 +99,7 @@ uintptr_t __pointer_chk_guard_local
- strong_alias (__pointer_chk_guard_local, __pointer_chk_guard)
- #endif
- 
+@@ -128,6 +128,7 @@ dso_name_valid_for_suid (const char *p)
+     }
+   return *p != '\0';
+ }
 +extern const char LD_SO_CACHE[4096] __attribute__ ((section (".ldsocache")));
  
- /* List of auditing DSOs.  */
- static struct audit_list
-@@ -854,12 +855,12 @@ of this helper program; chances are you did not intend to run this program.\n\
+ /* LD_AUDIT variable contents.  Must be processed before the
+    audit_list below.  */
+@@ -999,12 +1000,12 @@ of this helper program; chances are you did not intend to run this program.\n\
    --list                list all dependencies and how they are resolved\n\
    --verify              verify that given object really is a dynamically linked\n\
  			object we can handle\n\
@@ -108,7 +108,7 @@ index 4ec25d7..e159c12 100644
        ++_dl_skip_args;
        --_dl_argc;
 diff --git a/iconv/gconv_conf.c b/iconv/gconv_conf.c
-index e235188..569f72e 100644
+index 5aa055de6e..b9a14b9bd3 100644
 --- a/iconv/gconv_conf.c
 +++ b/iconv/gconv_conf.c
 @@ -36,7 +36,7 @@
@@ -121,7 +121,7 @@ index e235188..569f72e 100644
  /* The path elements, as determined by the __gconv_get_path function.
     All path elements end in a slash.  */
 diff --git a/sysdeps/generic/dl-cache.h b/sysdeps/generic/dl-cache.h
-index eb2f900..505804e 100644
+index 1f0b8f629d..acbe68399d 100644
 --- a/sysdeps/generic/dl-cache.h
 +++ b/sysdeps/generic/dl-cache.h
 @@ -27,10 +27,6 @@
@@ -136,5 +136,5 @@ index eb2f900..505804e 100644
  # define add_system_dir(dir) add_dir (dir)
  #endif
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index 0926a110e0..2fd62ecacb 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -1,4 +1,4 @@
-From 0b95f34207ffed3aa53fa949662bfbccc7c864a4 Mon Sep 17 00:00:00 2001
+From 940be2630be0b2fe0efa84abf05fb7a8db910ee4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:35:35 -0800
 Subject: [PATCH 04/26] nativesdk-glibc: Allow 64 bit atomics for x86
@@ -10,13 +10,14 @@ It also makes the synchronization more efficient.
 Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
 ---
+Upstream-Status: Inappropriate [OE specific]
+
  sysdeps/i386/atomic-machine.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sysdeps/i386/atomic-machine.h b/sysdeps/i386/atomic-machine.h
-index ce62b33..4fe44ea 100644
+index 0e24200617..1532f52dec 100644
 --- a/sysdeps/i386/atomic-machine.h
 +++ b/sysdeps/i386/atomic-machine.h
 @@ -54,7 +54,7 @@ typedef uintmax_t uatomic_max_t;
@@ -26,8 +27,8 @@ index ce62b33..4fe44ea 100644
 -#define __HAVE_64B_ATOMICS 0
 +#define __HAVE_64B_ATOMICS 1
  #define USE_ATOMIC_COMPILER_BUILTINS 0
- 
+ #define ATOMIC_EXCHANGE_USES_CAS 0
  
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch b/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
index ee50000319..836a02a6b9 100644
--- a/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
+++ b/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
@@ -1,4 +1,4 @@
-From 77a7495376c7d0c5507c0ec99bf1568150339ef4 Mon Sep 17 00:00:00 2001
+From 18df7a38015400695bbda47648afb3ad8f2a36a5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:01:50 +0000
 Subject: [PATCH 05/26] fsl e500/e5500/e6500/603e fsqrt implementation
@@ -49,7 +49,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 diff --git a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
 new file mode 100644
-index 0000000..71e516d
+index 0000000000..71e516d1c8
 --- /dev/null
 +++ b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
@@ -189,7 +189,7 @@ index 0000000..71e516d
 +}
 diff --git a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
 new file mode 100644
-index 0000000..26fa067
+index 0000000000..26fa067abf
 --- /dev/null
 +++ b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
@@ -296,7 +296,7 @@ index 0000000..26fa067
 +}
 diff --git a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
 new file mode 100644
-index 0000000..71e516d
+index 0000000000..71e516d1c8
 --- /dev/null
 +++ b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
@@ -436,7 +436,7 @@ index 0000000..71e516d
 +}
 diff --git a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
 new file mode 100644
-index 0000000..26fa067
+index 0000000000..26fa067abf
 --- /dev/null
 +++ b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
@@ -543,7 +543,7 @@ index 0000000..26fa067
 +}
 diff --git a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
 new file mode 100644
-index 0000000..71e516d
+index 0000000000..71e516d1c8
 --- /dev/null
 +++ b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
@@ -683,7 +683,7 @@ index 0000000..71e516d
 +}
 diff --git a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
 new file mode 100644
-index 0000000..26fa067
+index 0000000000..26fa067abf
 --- /dev/null
 +++ b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
@@ -790,7 +790,7 @@ index 0000000..26fa067
 +}
 diff --git a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
 new file mode 100644
-index 0000000..71e516d
+index 0000000000..71e516d1c8
 --- /dev/null
 +++ b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
@@ -930,7 +930,7 @@ index 0000000..71e516d
 +}
 diff --git a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
 new file mode 100644
-index 0000000..26fa067
+index 0000000000..26fa067abf
 --- /dev/null
 +++ b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
@@ -1037,7 +1037,7 @@ index 0000000..26fa067
 +}
 diff --git a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
 new file mode 100644
-index 0000000..71e516d
+index 0000000000..71e516d1c8
 --- /dev/null
 +++ b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
@@ -1177,7 +1177,7 @@ index 0000000..71e516d
 +}
 diff --git a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
 new file mode 100644
-index 0000000..26fa067
+index 0000000000..26fa067abf
 --- /dev/null
 +++ b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
@@ -1284,7 +1284,7 @@ index 0000000..26fa067
 +}
 diff --git a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
 new file mode 100644
-index 0000000..71e516d
+index 0000000000..71e516d1c8
 --- /dev/null
 +++ b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
 @@ -0,0 +1,134 @@
@@ -1424,7 +1424,7 @@ index 0000000..71e516d
 +}
 diff --git a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
 new file mode 100644
-index 0000000..26fa067
+index 0000000000..26fa067abf
 --- /dev/null
 +++ b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
 @@ -0,0 +1,101 @@
@@ -1531,14 +1531,14 @@ index 0000000..26fa067
 +}
 diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies b/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
 new file mode 100644
-index 0000000..b103b4d
+index 0000000000..b103b4dea5
 --- /dev/null
 +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc32/603e/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc32/603e/fpu
 diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc32/e300c3/fpu/Implies b/sysdeps/unix/sysv/linux/powerpc/powerpc32/e300c3/fpu/Implies
 new file mode 100644
-index 0000000..64db17f
+index 0000000000..64db17fada
 --- /dev/null
 +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc32/e300c3/fpu/Implies
 @@ -0,0 +1,2 @@
@@ -1546,39 +1546,39 @@ index 0000000..64db17f
 +powerpc/powerpc32/603e/fpu
 diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies b/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
 new file mode 100644
-index 0000000..7eac5fc
+index 0000000000..7eac5fcf02
 --- /dev/null
 +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc32/e500mc/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc32/e500mc/fpu
 diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies b/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
 new file mode 100644
-index 0000000..264b2a7
+index 0000000000..264b2a7700
 --- /dev/null
 +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc32/e5500/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc32/e5500/fpu
 diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies b/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies
 new file mode 100644
-index 0000000..a259344
+index 0000000000..a25934467b
 --- /dev/null
 +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc32/e6500/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc32/e6500/fpu
 diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies b/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
 new file mode 100644
-index 0000000..a7bc854
+index 0000000000..a7bc854be8
 --- /dev/null
 +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/e5500/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc64/e5500/fpu
 diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies b/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies
 new file mode 100644
-index 0000000..04ff8cc
+index 0000000000..04ff8cc181
 --- /dev/null
 +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/e6500/fpu/Implies
 @@ -0,0 +1 @@
 +powerpc/powerpc64/e6500/fpu
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch b/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
index 9088d29c4a..40179eac4f 100644
--- a/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
+++ b/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
@@ -1,4 +1,4 @@
-From 520cb9e746af637cf01fea385b7f4ee4aadbdfdd Mon Sep 17 00:00:00 2001
+From 2f33f2bf967fac3836ba3f2d5d301515f0313f5e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:11:22 +0000
 Subject: [PATCH 06/26] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/elf/readlib.c b/elf/readlib.c
-index 8a66ffe..08d56fc 100644
+index d278a189b2..a84cb85158 100644
 --- a/elf/readlib.c
 +++ b/elf/readlib.c
 @@ -51,6 +51,7 @@ static struct known_names interpreters[] =
@@ -29,5 +29,5 @@ index 8a66ffe..08d56fc 100644
  
  static struct known_names known_libs[] =
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch b/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
index f33defe075..06031608d8 100644
--- a/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
+++ b/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
@@ -1,4 +1,4 @@
-From 64130262787d54e2e6695ae4ed8783bfec14ffef Mon Sep 17 00:00:00 2001
+From c88e79dbc8c2684a1f5e2023ce4e4a5ec5b17292 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:15:07 +0000
 Subject: [PATCH 07/26] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
@@ -36,7 +36,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  12 files changed, 12 insertions(+), 24 deletions(-)
 
 diff --git a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
-index 71e516d..1795fd6 100644
+index 71e516d1c8..1795fd6c3e 100644
 --- a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
 +++ b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
 @@ -39,14 +39,8 @@ static const float half = 0.5;
@@ -60,7 +60,7 @@ index 71e516d..1795fd6 100644
  }
 +strong_alias (__ieee754_sqrt, __sqrt_finite)
 diff --git a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
-index 26fa067..a917f31 100644
+index 26fa067abf..a917f313ab 100644
 --- a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
 +++ b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
 @@ -37,14 +37,8 @@ static const float threehalf = 1.5;
@@ -84,7 +84,7 @@ index 26fa067..a917f31 100644
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 diff --git a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
-index 71e516d..fc4a749 100644
+index 71e516d1c8..fc4a74990e 100644
 --- a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
 +++ b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
 @@ -132,3 +132,4 @@ __ieee754_sqrt (b)
@@ -93,7 +93,7 @@ index 71e516d..fc4a749 100644
  }
 +strong_alias (__ieee754_sqrt, __sqrt_finite)
 diff --git a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
-index 26fa067..9d17512 100644
+index 26fa067abf..9d175122a8 100644
 --- a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
 +++ b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
 @@ -99,3 +99,4 @@ __ieee754_sqrtf (b)
@@ -102,7 +102,7 @@ index 26fa067..9d17512 100644
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 diff --git a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
-index 71e516d..fc4a749 100644
+index 71e516d1c8..fc4a74990e 100644
 --- a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
 +++ b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
 @@ -132,3 +132,4 @@ __ieee754_sqrt (b)
@@ -111,7 +111,7 @@ index 71e516d..fc4a749 100644
  }
 +strong_alias (__ieee754_sqrt, __sqrt_finite)
 diff --git a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
-index 26fa067..9d17512 100644
+index 26fa067abf..9d175122a8 100644
 --- a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
 +++ b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
 @@ -99,3 +99,4 @@ __ieee754_sqrtf (b)
@@ -120,7 +120,7 @@ index 26fa067..9d17512 100644
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 diff --git a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
-index 71e516d..fc4a749 100644
+index 71e516d1c8..fc4a74990e 100644
 --- a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
 +++ b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
 @@ -132,3 +132,4 @@ __ieee754_sqrt (b)
@@ -129,7 +129,7 @@ index 71e516d..fc4a749 100644
  }
 +strong_alias (__ieee754_sqrt, __sqrt_finite)
 diff --git a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
-index 26fa067..9d17512 100644
+index 26fa067abf..9d175122a8 100644
 --- a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
 +++ b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
 @@ -99,3 +99,4 @@ __ieee754_sqrtf (b)
@@ -138,7 +138,7 @@ index 26fa067..9d17512 100644
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 diff --git a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
-index 71e516d..1795fd6 100644
+index 71e516d1c8..1795fd6c3e 100644
 --- a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
 +++ b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
 @@ -39,14 +39,8 @@ static const float half = 0.5;
@@ -162,7 +162,7 @@ index 71e516d..1795fd6 100644
  }
 +strong_alias (__ieee754_sqrt, __sqrt_finite)
 diff --git a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
-index 26fa067..a917f31 100644
+index 26fa067abf..a917f313ab 100644
 --- a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
 +++ b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
 @@ -37,14 +37,8 @@ static const float threehalf = 1.5;
@@ -186,7 +186,7 @@ index 26fa067..a917f31 100644
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 diff --git a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
-index 71e516d..fc4a749 100644
+index 71e516d1c8..fc4a74990e 100644
 --- a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
 +++ b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
 @@ -132,3 +132,4 @@ __ieee754_sqrt (b)
@@ -195,7 +195,7 @@ index 71e516d..fc4a749 100644
  }
 +strong_alias (__ieee754_sqrt, __sqrt_finite)
 diff --git a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
-index 26fa067..9d17512 100644
+index 26fa067abf..9d175122a8 100644
 --- a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
 +++ b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
 @@ -99,3 +99,4 @@ __ieee754_sqrtf (b)
@@ -204,5 +204,5 @@ index 26fa067..9d17512 100644
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index 26f65c5b17..65c29c6504 100644
--- a/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,4 +1,4 @@
-From 5afb0147e3e49c3b474404524014efe51b2bca5a Mon Sep 17 00:00:00 2001
+From ce6fc5c97284d6252a216f005d1da30baba9ff4c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:16:38 +0000
 Subject: [PATCH 08/26] __ieee754_sqrt{,f} are now inline functions and call
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  12 files changed, 114 insertions(+), 21 deletions(-)
 
 diff --git a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
-index 1795fd6..daa83f3 100644
+index 1795fd6c3e..daa83f3fe8 100644
 --- a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
 +++ b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrt.c
 @@ -40,7 +40,7 @@ static const float half = 0.5;
@@ -58,7 +58,7 @@ index 1795fd6..daa83f3 100644
 +
  strong_alias (__ieee754_sqrt, __sqrt_finite)
 diff --git a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
-index a917f31..b812cf1 100644
+index a917f313ab..b812cf1705 100644
 --- a/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
 +++ b/sysdeps/powerpc/powerpc32/603e/fpu/e_sqrtf.c
 @@ -38,7 +38,7 @@ static const float threehalf = 1.5;
@@ -82,7 +82,7 @@ index a917f31..b812cf1 100644
 +}
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 diff --git a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
-index fc4a749..7038a70 100644
+index fc4a74990e..7038a70b47 100644
 --- a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
 +++ b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrt.c
 @@ -41,10 +41,10 @@ static const float half = 0.5;
@@ -121,7 +121,7 @@ index fc4a749..7038a70 100644
 +
  strong_alias (__ieee754_sqrt, __sqrt_finite)
 diff --git a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
-index 9d17512..10de1f0 100644
+index 9d175122a8..10de1f0cc3 100644
 --- a/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
 +++ b/sysdeps/powerpc/powerpc32/e500mc/fpu/e_sqrtf.c
 @@ -39,10 +39,10 @@ static const float threehalf = 1.5;
@@ -151,7 +151,7 @@ index 9d17512..10de1f0 100644
 +
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 diff --git a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
-index fc4a749..7038a70 100644
+index fc4a74990e..7038a70b47 100644
 --- a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
 +++ b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrt.c
 @@ -41,10 +41,10 @@ static const float half = 0.5;
@@ -190,7 +190,7 @@ index fc4a749..7038a70 100644
 +
  strong_alias (__ieee754_sqrt, __sqrt_finite)
 diff --git a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
-index 9d17512..10de1f0 100644
+index 9d175122a8..10de1f0cc3 100644
 --- a/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
 +++ b/sysdeps/powerpc/powerpc32/e5500/fpu/e_sqrtf.c
 @@ -39,10 +39,10 @@ static const float threehalf = 1.5;
@@ -220,7 +220,7 @@ index 9d17512..10de1f0 100644
 +
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 diff --git a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
-index fc4a749..1c34244 100644
+index fc4a74990e..1c34244bd8 100644
 --- a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
 +++ b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
 @@ -132,4 +132,12 @@ __ieee754_sqrt (b)
@@ -237,7 +237,7 @@ index fc4a749..1c34244 100644
 +
  strong_alias (__ieee754_sqrt, __sqrt_finite)
 diff --git a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
-index 9d17512..8126535 100644
+index 9d175122a8..812653558f 100644
 --- a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
 +++ b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
 @@ -99,4 +99,12 @@ __ieee754_sqrtf (b)
@@ -254,7 +254,7 @@ index 9d17512..8126535 100644
 +
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 diff --git a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
-index 1795fd6..13a8197 100644
+index 1795fd6c3e..13a81973e3 100644
 --- a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
 +++ b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrt.c
 @@ -40,7 +40,7 @@ static const float half = 0.5;
@@ -289,7 +289,7 @@ index 1795fd6..13a8197 100644
 +
  strong_alias (__ieee754_sqrt, __sqrt_finite)
 diff --git a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
-index a917f31..fae2d81 100644
+index a917f313ab..fae2d81210 100644
 --- a/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
 +++ b/sysdeps/powerpc/powerpc64/e5500/fpu/e_sqrtf.c
 @@ -38,7 +38,7 @@ static const float threehalf = 1.5;
@@ -314,7 +314,7 @@ index a917f31..fae2d81 100644
 +
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 diff --git a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
-index fc4a749..7038a70 100644
+index fc4a74990e..7038a70b47 100644
 --- a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
 +++ b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrt.c
 @@ -41,10 +41,10 @@ static const float half = 0.5;
@@ -353,7 +353,7 @@ index fc4a749..7038a70 100644
 +
  strong_alias (__ieee754_sqrt, __sqrt_finite)
 diff --git a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
-index 9d17512..10de1f0 100644
+index 9d175122a8..10de1f0cc3 100644
 --- a/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
 +++ b/sysdeps/powerpc/powerpc64/e6500/fpu/e_sqrtf.c
 @@ -39,10 +39,10 @@ static const float threehalf = 1.5;
@@ -383,5 +383,5 @@ index 9d17512..10de1f0 100644
 +
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch b/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
index d416acde3e..d360981f4d 100644
--- a/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
+++ b/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
@@ -1,4 +1,4 @@
-From ddd51bb4e005432cb3c0f8f33822954408a9fee1 Mon Sep 17 00:00:00 2001
+From e0f64b26035fe05e60a24169ff53d490842c77fe Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:20:09 +0000
 Subject: [PATCH 09/26] Quote from bug 1443 which explains what the patch does
@@ -45,10 +45,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sysdeps/arm/dl-machine.h b/sysdeps/arm/dl-machine.h
-index 60eee00..7d54d5e 100644
+index 7053ead16e..0b1e1716b0 100644
 --- a/sysdeps/arm/dl-machine.h
 +++ b/sysdeps/arm/dl-machine.h
-@@ -499,7 +499,7 @@ elf_machine_rel (struct link_map *map, const Elf32_Rel *reloc,
+@@ -500,7 +500,7 @@ elf_machine_rel (struct link_map *map, const Elf32_Rel *reloc,
  
  	case R_ARM_TLS_DTPOFF32:
  	  if (sym != NULL)
@@ -58,5 +58,5 @@ index 60eee00..7d54d5e 100644
  
  	case R_ARM_TLS_TPOFF32:
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
index 276f1fa4c2..243d3d8b15 100644
--- a/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
+++ b/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
@@ -1,4 +1,4 @@
-From d7e74670825330f5421a55f5aa2a1ce6fda7d7fb Mon Sep 17 00:00:00 2001
+From 73b1d72054bd068927e23ade86d94ae24e716811 Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Wed, 19 Dec 2012 04:39:57 -0600
 Subject: [PATCH 10/26] eglibc: run libm-err-tab.pl with specific dirs in ${S}
@@ -18,7 +18,7 @@ Signed-off-by: Ting Liu <b28495@freescale.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/manual/Makefile b/manual/Makefile
-index f2f694f..e062833 100644
+index 4ed63a8ef3..e89919eb19 100644
 --- a/manual/Makefile
 +++ b/manual/Makefile
 @@ -105,7 +105,8 @@ $(objpfx)libm-err.texi: $(objpfx)stamp-libm-err
@@ -32,5 +32,5 @@ index f2f694f..e062833 100644
  	touch $@
  
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index 096dab5474..b0c410f9e3 100644
--- a/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,4 +1,4 @@
-From d6e2076571263e45c48889896d3d94ff576df2be Mon Sep 17 00:00:00 2001
+From 4a5206a25219b85f4cc3a2e3cc7379d95e54df56 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:24:46 +0000
 Subject: [PATCH 11/26] __ieee754_sqrt{,f} are now inline functions and call
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
-index 1c34244..7038a70 100644
+index 1c34244bd8..7038a70b47 100644
 --- a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
 +++ b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrt.c
 @@ -41,10 +41,10 @@ static const float half = 0.5;
@@ -40,7 +40,7 @@ index 1c34244..7038a70 100644
  #define FMADD(a_, c_, b_)                                               \
            ({ double __r;                                                \
 diff --git a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
-index 8126535..10de1f0 100644
+index 812653558f..10de1f0cc3 100644
 --- a/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
 +++ b/sysdeps/powerpc/powerpc32/e6500/fpu/e_sqrtf.c
 @@ -39,10 +39,10 @@ static const float threehalf = 1.5;
@@ -57,5 +57,5 @@ index 8126535..10de1f0 100644
  #endif
  {
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0012-Make-ld-version-output-matching-grok-gold-s-output.patch b/meta/recipes-core/glibc/glibc/0012-Make-ld-version-output-matching-grok-gold-s-output.patch
deleted file mode 100644
index 7728c61a9d..0000000000
--- a/meta/recipes-core/glibc/glibc/0012-Make-ld-version-output-matching-grok-gold-s-output.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From c0974c746e026650bef5d1940eb3f519765c77af Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 18 Mar 2015 00:25:45 +0000
-Subject: [PATCH 12/26] Make ld --version output matching grok gold's output
-
-adapted from from upstream branch roland/gold-vs-libc
-
-Upstream-Status: Backport
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure    | 2 +-
- configure.ac | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 5cf3230..391f29d 100755
---- a/configure
-+++ b/configure
-@@ -4555,7 +4555,7 @@ else
-   # Found it, now check the version.
-   { $as_echo "$as_me:${as_lineno-$LINENO}: checking version of $LD" >&5
- $as_echo_n "checking version of $LD... " >&6; }
--  ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
-+  ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU [Bbinutilsd][^.]* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
-   case $ac_prog_version in
-     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
-     2.1[0-9][0-9]*|2.2[2-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
-diff --git a/configure.ac b/configure.ac
-index d719fad..5b5877c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -990,7 +990,7 @@ AC_CHECK_PROG_VER(AS, $AS, --version,
- 		  [2.1[0-9][0-9]*|2.2[2-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*],
- 		  AS=: critic_missing="$critic_missing as")
- AC_CHECK_PROG_VER(LD, $LD, --version,
--		  [GNU ld.* \([0-9][0-9]*\.[0-9.]*\)],
-+		  [GNU [Bbinutilsd][^.]* \([0-9][0-9]*\.[0-9.]*\)],
- 		  [2.1[0-9][0-9]*|2.2[2-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*],
- 		  LD=: critic_missing="$critic_missing ld")
- 
--- 
-2.10.2
-
diff --git a/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch b/meta/recipes-core/glibc/glibc/0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
similarity index 82%
rename from meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
rename to meta/recipes-core/glibc/glibc/0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
index 1c81c729db..98f8a1bd98 100644
--- a/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
+++ b/meta/recipes-core/glibc/glibc/0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
@@ -1,7 +1,7 @@
-From 2a12eadfd7940b6b0913de8e95d851254cce7953 Mon Sep 17 00:00:00 2001
+From 1d94b2fa2db30a23e72ed5a315b4b9b12a8f4bd9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
-Subject: [PATCH 13/26] sysdeps/gnu/configure.ac: handle correctly
+Subject: [PATCH 12/26] sysdeps/gnu/configure.ac: handle correctly
  $libc_cv_rootsbindir
 
 Upstream-Status:Pending
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/sysdeps/gnu/configure b/sysdeps/gnu/configure
-index 71243ad..f578187 100644
+index 71243ad0c6..f578187576 100644
 --- a/sysdeps/gnu/configure
 +++ b/sysdeps/gnu/configure
 @@ -32,6 +32,6 @@ case "$prefix" in
@@ -26,7 +26,7 @@ index 71243ad..f578187 100644
    ;;
  esac
 diff --git a/sysdeps/gnu/configure.ac b/sysdeps/gnu/configure.ac
-index 634fe4d..3db1697 100644
+index 634fe4de2a..3db1697f4f 100644
 --- a/sysdeps/gnu/configure.ac
 +++ b/sysdeps/gnu/configure.ac
 @@ -21,6 +21,6 @@ case "$prefix" in
@@ -38,5 +38,5 @@ index 634fe4d..3db1697 100644
    ;;
  esac
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch b/meta/recipes-core/glibc/glibc/0013-Add-unused-attribute.patch
similarity index 82%
rename from meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
rename to meta/recipes-core/glibc/glibc/0013-Add-unused-attribute.patch
index b23e104ff8..8a283153f7 100644
--- a/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
+++ b/meta/recipes-core/glibc/glibc/0013-Add-unused-attribute.patch
@@ -1,7 +1,7 @@
-From ec4f7763b30603b7ba0b70bd7750e34d442821b3 Mon Sep 17 00:00:00 2001
+From 2e1f44eaf38732300cf3cb484b7437d1ba787bdf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:28:41 +0000
-Subject: [PATCH 14/26] Add unused attribute
+Subject: [PATCH 13/26] Add unused attribute
 
 Helps in avoiding gcc warning when header is is included in
 a source file which does not use both functions
@@ -17,7 +17,7 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/iconv/gconv_charset.h b/iconv/gconv_charset.h
-index 95cbce7..191a0dd 100644
+index 18d8bd6ae7..eb729da5d3 100644
 --- a/iconv/gconv_charset.h
 +++ b/iconv/gconv_charset.h
 @@ -21,7 +21,7 @@
@@ -30,5 +30,5 @@ index 95cbce7..191a0dd 100644
  {
    int slash_count = 0;
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0014-yes-within-the-path-sets-wrong-config-variables.patch
similarity index 94%
rename from meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
rename to meta/recipes-core/glibc/glibc/0014-yes-within-the-path-sets-wrong-config-variables.patch
index 98d425a7bd..ea1f366a9b 100644
--- a/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0014-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,7 +1,7 @@
-From 18d64951cbb68d8d75e8ef347cbd0e0a5c14604b Mon Sep 17 00:00:00 2001
+From 044579f48b760e5a8e42bf42e3ec8f8e5088f22e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
-Subject: [PATCH 15/26] 'yes' within the path sets wrong config variables
+Subject: [PATCH 14/26] 'yes' within the path sets wrong config variables
 
 It seems that the 'AC_EGREP_CPP(yes...' example is quite popular
 but being such a short word to grep it is likely to produce
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  12 files changed, 28 insertions(+), 28 deletions(-)
 
 diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
-index 5bd355a..3bc5537 100644
+index 5bd355a691..3bc5537bc0 100644
 --- a/sysdeps/aarch64/configure
 +++ b/sysdeps/aarch64/configure
 @@ -148,12 +148,12 @@ else
@@ -48,7 +48,7 @@ index 5bd355a..3bc5537 100644
  else
    libc_cv_aarch64_be=no
 diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
-index 7851dd4..6e92381 100644
+index 7851dd4dac..6e9238171f 100644
 --- a/sysdeps/aarch64/configure.ac
 +++ b/sysdeps/aarch64/configure.ac
 @@ -10,8 +10,8 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
@@ -63,7 +63,7 @@ index 7851dd4..6e92381 100644
    ], libc_cv_aarch64_be=yes, libc_cv_aarch64_be=no)])
  if test $libc_cv_aarch64_be = yes; then
 diff --git a/sysdeps/arm/configure b/sysdeps/arm/configure
-index 431e843..e152461 100644
+index 431e843b2b..e152461138 100644
 --- a/sysdeps/arm/configure
 +++ b/sysdeps/arm/configure
 @@ -151,12 +151,12 @@ else
@@ -82,7 +82,7 @@ index 431e843..e152461 100644
  else
    libc_cv_arm_pcs_vfp=no
 diff --git a/sysdeps/arm/configure.ac b/sysdeps/arm/configure.ac
-index 90cdd69..05a262b 100644
+index 90cdd69c75..05a262ba00 100644
 --- a/sysdeps/arm/configure.ac
 +++ b/sysdeps/arm/configure.ac
 @@ -15,8 +15,8 @@ AC_DEFINE(PI_STATIC_AND_HIDDEN)
@@ -97,7 +97,7 @@ index 90cdd69..05a262b 100644
    ], libc_cv_arm_pcs_vfp=yes, libc_cv_arm_pcs_vfp=no)])
  if test $libc_cv_arm_pcs_vfp = yes; then
 diff --git a/sysdeps/mips/configure b/sysdeps/mips/configure
-index 4e13248..f14af95 100644
+index 4e13248c03..f14af952d0 100644
 --- a/sysdeps/mips/configure
 +++ b/sysdeps/mips/configure
 @@ -143,11 +143,11 @@ else
@@ -115,7 +115,7 @@ index 4e13248..f14af95 100644
  else
    libc_cv_mips_nan2008=no
 diff --git a/sysdeps/mips/configure.ac b/sysdeps/mips/configure.ac
-index bcbdaff..ad3057f 100644
+index bcbdaffd9f..ad3057f4cc 100644
 --- a/sysdeps/mips/configure.ac
 +++ b/sysdeps/mips/configure.ac
 @@ -6,9 +6,9 @@ dnl position independent way.
@@ -131,7 +131,7 @@ index bcbdaff..ad3057f 100644
  if test x$libc_cv_mips_nan2008 = xyes; then
    AC_DEFINE(HAVE_MIPS_NAN2008)
 diff --git a/sysdeps/nios2/configure b/sysdeps/nios2/configure
-index 14c8a3a..dde3814 100644
+index 14c8a3a014..dde3814ef2 100644
 --- a/sysdeps/nios2/configure
 +++ b/sysdeps/nios2/configure
 @@ -142,12 +142,12 @@ else
@@ -150,7 +150,7 @@ index 14c8a3a..dde3814 100644
  else
    libc_cv_nios2_be=no
 diff --git a/sysdeps/nios2/configure.ac b/sysdeps/nios2/configure.ac
-index f05f438..dc86399 100644
+index f05f43802b..dc8639902d 100644
 --- a/sysdeps/nios2/configure.ac
 +++ b/sysdeps/nios2/configure.ac
 @@ -4,8 +4,8 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
@@ -165,7 +165,7 @@ index f05f438..dc86399 100644
    ], libc_cv_nios2_be=yes, libc_cv_nios2_be=no)])
  if test $libc_cv_nios2_be = yes; then
 diff --git a/sysdeps/unix/sysv/linux/mips/configure b/sysdeps/unix/sysv/linux/mips/configure
-index a5513fa..283b293 100644
+index a5513fad48..283b293ff3 100644
 --- a/sysdeps/unix/sysv/linux/mips/configure
 +++ b/sysdeps/unix/sysv/linux/mips/configure
 @@ -414,11 +414,11 @@ else
@@ -183,7 +183,7 @@ index a5513fa..283b293 100644
  else
    libc_cv_mips_nan2008=no
 diff --git a/sysdeps/unix/sysv/linux/mips/configure.ac b/sysdeps/unix/sysv/linux/mips/configure.ac
-index 9147aa4..7898e24 100644
+index 9147aa4582..7898e24738 100644
 --- a/sysdeps/unix/sysv/linux/mips/configure.ac
 +++ b/sysdeps/unix/sysv/linux/mips/configure.ac
 @@ -105,9 +105,9 @@ AC_COMPILE_IFELSE(
@@ -199,7 +199,7 @@ index 9147aa4..7898e24 100644
  
  libc_mips_nan=
 diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
-index af06970..27b8c1b 100644
+index 4e7fcf1d97..44a9cb3791 100644
 --- a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
 +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
 @@ -155,12 +155,12 @@ else
@@ -233,7 +233,7 @@ index af06970..27b8c1b 100644
  else
    libc_cv_ppc64_def_call_elf=no
 diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
-index 0822915..9a32fdd 100644
+index f9cba6e15d..b21f72f1e4 100644
 --- a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
 +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
 @@ -6,8 +6,8 @@ LIBC_SLIBDIR_RTLDDIR([lib64], [lib64])
@@ -259,5 +259,5 @@ index 0822915..9a32fdd 100644
      ], libc_cv_ppc64_def_call_elf=yes, libc_cv_ppc64_def_call_elf=no)])
    if test $libc_cv_ppc64_def_call_elf = no; then
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch b/meta/recipes-core/glibc/glibc/0015-timezone-re-written-tzselect-as-posix-sh.patch
similarity index 81%
rename from meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
rename to meta/recipes-core/glibc/glibc/0015-timezone-re-written-tzselect-as-posix-sh.patch
index 426a2c0c2d..35cd9d9c91 100644
--- a/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
+++ b/meta/recipes-core/glibc/glibc/0015-timezone-re-written-tzselect-as-posix-sh.patch
@@ -1,7 +1,7 @@
-From 2bed515b9f9f613ae0db9b9607d8fa60a4afca5b Mon Sep 17 00:00:00 2001
+From 25a728a6ea67336e688fd3796a9d6c5452ad4a15 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:33:03 +0000
-Subject: [PATCH 16/26] timezone: re-written tzselect as posix sh
+Subject: [PATCH 15/26] timezone: re-written tzselect as posix sh
 
 To avoid the bash dependency.
 
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/timezone/Makefile b/timezone/Makefile
-index dee7568..66a50be 100644
+index d6cc7ba357..e4ead6e1a7 100644
 --- a/timezone/Makefile
 +++ b/timezone/Makefile
-@@ -120,7 +120,7 @@ $(testdata)/XT%: testdata/XT%
+@@ -122,7 +122,7 @@ $(testdata)/XT%: testdata/XT%
  	cp $< $@
  
  $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
@@ -28,7 +28,7 @@ index dee7568..66a50be 100644
  	    -e '/TZVERSION=/s|see_Makefile|"$(version)"|' \
  	    -e '/PKGVERSION=/s|=.*|="$(PKGVERSION)"|' \
 diff --git a/timezone/tzselect.ksh b/timezone/tzselect.ksh
-index 2c3b2f4..0c04a61 100755
+index d2c3a6d1dd..089679f306 100755
 --- a/timezone/tzselect.ksh
 +++ b/timezone/tzselect.ksh
 @@ -35,7 +35,7 @@ REPORT_BUGS_TO=tz@iana.org
@@ -41,5 +41,5 @@ index 2c3b2f4..0c04a61 100755
  # Output one argument as-is to standard output.
  # Safer than 'echo', which can mishandle '\' or leading '-'.
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0016-Remove-bash-dependency-for-nscd-init-script.patch
similarity index 89%
rename from meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
rename to meta/recipes-core/glibc/glibc/0016-Remove-bash-dependency-for-nscd-init-script.patch
index e44be894f6..fb57f04100 100644
--- a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0016-Remove-bash-dependency-for-nscd-init-script.patch
@@ -1,20 +1,21 @@
-From c8814875b362efbfd778345d0d2777478bf11a30 Mon Sep 17 00:00:00 2001
+From 6663ac955bc90969f470b84ecd4a41da8b6561d3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
-Subject: [PATCH 17/26] Remove bash dependency for nscd init script
+Subject: [PATCH 16/26] Remove bash dependency for nscd init script
 
 The nscd init script uses #! /bin/bash but only really uses one bashism
 (translated strings), so remove them and switch the shell to #!/bin/sh.
 
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Inappropriate
 ---
+Upstream-Status: Pending
+
  nscd/nscd.init | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/nscd/nscd.init b/nscd/nscd.init
-index a882da7..b02986e 100644
+index a882da7d8b..b02986ec15 100644
 --- a/nscd/nscd.init
 +++ b/nscd/nscd.init
 @@ -1,4 +1,4 @@
@@ -70,5 +71,5 @@ index a882da7..b02986e 100644
  	;;
  esac
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0017-eglibc-Cross-building-and-testing-instructions.patch
similarity index 99%
rename from meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
rename to meta/recipes-core/glibc/glibc/0017-eglibc-Cross-building-and-testing-instructions.patch
index 2ec01f05c7..654a1ed743 100644
--- a/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0017-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,7 +1,7 @@
-From df96d6b61bb60f13cd3d4989d1afc56d705f4a33 Mon Sep 17 00:00:00 2001
+From 71276db217555ff4c215068a8c24a758e45997a1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
-Subject: [PATCH 18/26] eglibc: Cross building and testing instructions
+Subject: [PATCH 17/26] eglibc: Cross building and testing instructions
 
 Ported from eglibc
 Upstream-Status: Pending
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 diff --git a/GLIBC.cross-building b/GLIBC.cross-building
 new file mode 100644
-index 0000000..e6e0da1
+index 0000000000..e6e0da1aaf
 --- /dev/null
 +++ b/GLIBC.cross-building
 @@ -0,0 +1,383 @@
@@ -405,7 +405,7 @@ index 0000000..e6e0da1
 +    Hello, C++ world!
 diff --git a/GLIBC.cross-testing b/GLIBC.cross-testing
 new file mode 100644
-index 0000000..b67b468
+index 0000000000..b67b468466
 --- /dev/null
 +++ b/GLIBC.cross-testing
 @@ -0,0 +1,205 @@
@@ -615,5 +615,5 @@ index 0000000..b67b468
 +  simply place copies of these libraries in the top GLIBC build
 +  directory.
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0018-eglibc-Help-bootstrap-cross-toolchain.patch
similarity index 94%
rename from meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
rename to meta/recipes-core/glibc/glibc/0018-eglibc-Help-bootstrap-cross-toolchain.patch
index f5921bb7be..951e8d4aa8 100644
--- a/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0018-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,7 +1,7 @@
-From 2cb7e3cae4020f431d426ad1740bb25506cde899 Mon Sep 17 00:00:00 2001
+From bba4e2815d0243adda15c170a6b5daf76cf0708b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
-Subject: [PATCH 19/26] eglibc: Help bootstrap cross toolchain
+Subject: [PATCH 18/26] eglibc: Help bootstrap cross toolchain
 
 Taken from EGLIBC, r1484 + r1525
 
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 include/stubs-bootstrap.h
 
 diff --git a/Makefile b/Makefile
-index 1ae3281..26ab7bf 100644
+index 3e0ae6f43b..24dc66d17c 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -70,9 +70,18 @@ subdir-dirs = include
@@ -79,7 +79,7 @@ index 1ae3281..26ab7bf 100644
  # Since stubs.h is never needed when building the library, we simplify the
 diff --git a/include/stubs-bootstrap.h b/include/stubs-bootstrap.h
 new file mode 100644
-index 0000000..1d2b669
+index 0000000000..1d2b669aff
 --- /dev/null
 +++ b/include/stubs-bootstrap.h
 @@ -0,0 +1,12 @@
@@ -96,5 +96,5 @@ index 0000000..1d2b669
 +   EGLIBC subdir 'stubs' make targets, on every .o file in EGLIBC, but
 +   an empty stubs.h like this will do fine for GCC.  */
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0021-eglibc-Clear-cache-lines-on-ppc8xx.patch b/meta/recipes-core/glibc/glibc/0019-eglibc-Clear-cache-lines-on-ppc8xx.patch
similarity index 94%
rename from meta/recipes-core/glibc/glibc/0021-eglibc-Clear-cache-lines-on-ppc8xx.patch
rename to meta/recipes-core/glibc/glibc/0019-eglibc-Clear-cache-lines-on-ppc8xx.patch
index a9a73916f3..91b92f746c 100644
--- a/meta/recipes-core/glibc/glibc/0021-eglibc-Clear-cache-lines-on-ppc8xx.patch
+++ b/meta/recipes-core/glibc/glibc/0019-eglibc-Clear-cache-lines-on-ppc8xx.patch
@@ -1,7 +1,7 @@
-From 000ab518aa1269714bc0a9a4633b0a538fae91d9 Mon Sep 17 00:00:00 2001
+From 0089bf40b3c247a16d1aa55cc6618d41061cd51b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 15:15:09 -0800
-Subject: [PATCH 21/26] eglibc: Clear cache lines on ppc8xx
+Subject: [PATCH 19/26] eglibc: Clear cache lines on ppc8xx
 
 2007-06-13  Nathan Sidwell  <nathan@codesourcery.com>
             Mark Shinwell  <shinwell@codesourcery.com>
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 28 insertions(+), 2 deletions(-)
 
 diff --git a/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c b/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
-index 98ec2b3..b384ae0 100644
+index 23f5d5d388..7e45288db7 100644
 --- a/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
 +++ b/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
 @@ -24,9 +24,21 @@ int __cache_line_size attribute_hidden;
@@ -48,7 +48,7 @@ index 98ec2b3..b384ae0 100644
  	break;
  
 diff --git a/sysdeps/unix/sysv/linux/powerpc/libc-start.c b/sysdeps/unix/sysv/linux/powerpc/libc-start.c
-index 0efd297..8cc0ef8 100644
+index ad036c1e4b..afee56a3da 100644
 --- a/sysdeps/unix/sysv/linux/powerpc/libc-start.c
 +++ b/sysdeps/unix/sysv/linux/powerpc/libc-start.c
 @@ -73,11 +73,25 @@ __libc_start_main (int argc, char **argv,
@@ -79,5 +79,5 @@ index 0efd297..8cc0ef8 100644
  	break;
  #ifndef SHARED
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0022-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
similarity index 88%
rename from meta/recipes-core/glibc/glibc/0022-eglibc-Resolve-__fpscr_values-on-SH4.patch
rename to meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
index c0cd5b0d12..438a02f39f 100644
--- a/meta/recipes-core/glibc/glibc/0022-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,7 +1,7 @@
-From a50c6e80543fb4cbc589978c11fe846bf4a94492 Mon Sep 17 00:00:00 2001
+From 0c04427c68e661952b1094d079ee3c1420d4435c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
-Subject: [PATCH 22/26] eglibc: Resolve __fpscr_values on SH4
+Subject: [PATCH 20/26] eglibc: Resolve __fpscr_values on SH4
 
 2010-09-29  Nobuhiro Iwamatsu  <iwamatsu@nigauri.org>
             Andrew Stubbs  <ams@codesourcery.com>
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 12 insertions(+)
 
 diff --git a/sysdeps/unix/sysv/linux/sh/Versions b/sysdeps/unix/sysv/linux/sh/Versions
-index e0938c4..ca1d7da 100644
+index e0938c4165..ca1d7da339 100644
 --- a/sysdeps/unix/sysv/linux/sh/Versions
 +++ b/sysdeps/unix/sysv/linux/sh/Versions
 @@ -2,6 +2,7 @@ libc {
@@ -33,7 +33,7 @@ index e0938c4..ca1d7da 100644
      # a*
      alphasort64;
 diff --git a/sysdeps/unix/sysv/linux/sh/sysdep.S b/sysdeps/unix/sysv/linux/sh/sysdep.S
-index 0024d79..d1db7e4 100644
+index 5f11bc737b..2fd217b00b 100644
 --- a/sysdeps/unix/sysv/linux/sh/sysdep.S
 +++ b/sysdeps/unix/sysv/linux/sh/sysdep.S
 @@ -30,3 +30,14 @@ ENTRY (__syscall_error)
@@ -52,5 +52,5 @@ index 0024d79..d1db7e4 100644
 +weak_alias (___fpscr_values, __fpscr_values)
 +
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0023-eglibc-Install-PIC-archives.patch b/meta/recipes-core/glibc/glibc/0021-eglibc-Install-PIC-archives.patch
similarity index 90%
rename from meta/recipes-core/glibc/glibc/0023-eglibc-Install-PIC-archives.patch
rename to meta/recipes-core/glibc/glibc/0021-eglibc-Install-PIC-archives.patch
index c3e571f8a9..26c5edb2c9 100644
--- a/meta/recipes-core/glibc/glibc/0023-eglibc-Install-PIC-archives.patch
+++ b/meta/recipes-core/glibc/glibc/0021-eglibc-Install-PIC-archives.patch
@@ -1,7 +1,7 @@
-From 101568daf48d99e71b280a2fdd85460fe740d583 Mon Sep 17 00:00:00 2001
+From a0efe850b42b2a4351e0d6c7b025a47677375db9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:57:01 +0000
-Subject: [PATCH 23/26] eglibc: Install PIC archives
+Subject: [PATCH 21/26] eglibc: Install PIC archives
 
 Forward port from eglibc
 
@@ -29,10 +29,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 40 insertions(+), 2 deletions(-)
 
 diff --git a/Makerules b/Makerules
-index 61a0240..373e628 100644
+index 9bb707c168..74cbefb9ba 100644
 --- a/Makerules
 +++ b/Makerules
-@@ -762,6 +762,9 @@ ifeq ($(build-shared),yes)
+@@ -775,6 +775,9 @@ ifeq ($(build-shared),yes)
  $(common-objpfx)libc.so: $(common-objpfx)libc.map
  endif
  common-generated += libc.so libc_pic.os
@@ -42,7 +42,7 @@ index 61a0240..373e628 100644
  ifdef libc.so-version
  $(common-objpfx)libc.so$(libc.so-version): $(common-objpfx)libc.so
  	$(make-link)
-@@ -1004,6 +1007,7 @@ endif
+@@ -1026,6 +1029,7 @@ endif
  
  install: check-install-supported
  
@@ -50,7 +50,7 @@ index 61a0240..373e628 100644
  install: $(installed-libcs)
  $(installed-libcs): $(inst_libdir)/lib$(libprefix)%: lib $(+force)
  	$(make-target-directory)
-@@ -1032,6 +1036,22 @@ versioned := $(strip $(foreach so,$(install-lib.so),\
+@@ -1054,6 +1058,22 @@ versioned := $(strip $(foreach so,$(install-lib.so),\
  install-lib.so-versioned := $(filter $(versioned), $(install-lib.so))
  install-lib.so-unversioned := $(filter-out $(versioned), $(install-lib.so))
  
@@ -73,7 +73,7 @@ index 61a0240..373e628 100644
  # For versioned libraries, we install three files:
  #	$(inst_libdir)/libfoo.so	-- for linking, symlink or ld script
  #	$(inst_slibdir)/libfoo.so.NN	-- for loading by SONAME, symlink
-@@ -1275,9 +1295,22 @@ $(addprefix $(inst_includedir)/,$(headers-nonh)): $(inst_includedir)/%: \
+@@ -1298,9 +1318,22 @@ $(addprefix $(inst_includedir)/,$(headers-nonh)): $(inst_includedir)/%: \
  endif	# headers-nonh
  endif	# headers
  
@@ -97,7 +97,7 @@ index 61a0240..373e628 100644
  install-bin-nosubdir: $(addprefix $(inst_bindir)/,$(install-bin))
  install-bin-script-nosubdir: $(addprefix $(inst_bindir)/,$(install-bin-script))
  install-rootsbin-nosubdir: \
-@@ -1290,6 +1323,10 @@ install-data-nosubdir: $(addprefix $(inst_datadir)/,$(install-data))
+@@ -1313,6 +1346,10 @@ install-data-nosubdir: $(addprefix $(inst_datadir)/,$(install-data))
  install-headers-nosubdir: $(addprefix $(inst_includedir)/,$(headers))
  install-others-nosubdir: $(install-others)
  install-others-programs-nosubdir: $(install-others-programs)
@@ -108,7 +108,7 @@ index 61a0240..373e628 100644
  
  # We need all the `-nosubdir' targets so that `install' in the parent
  # doesn't depend on several things which each iterate over the subdirs.
-@@ -1299,7 +1336,8 @@ install-%:: install-%-nosubdir ;
+@@ -1322,7 +1359,8 @@ install-%:: install-%-nosubdir ;
  
  .PHONY: install install-no-libc.a-nosubdir
  install-no-libc.a-nosubdir: install-headers-nosubdir install-data-nosubdir \
@@ -119,5 +119,5 @@ index 61a0240..373e628 100644
  install-no-libc.a-nosubdir: install-bin-nosubdir install-bin-script-nosubdir \
  			    install-rootsbin-nosubdir install-sbin-nosubdir \
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0024-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
similarity index 96%
rename from meta/recipes-core/glibc/glibc/0024-eglibc-Forward-port-cross-locale-generation-support.patch
rename to meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
index 3399890de1..11eb9346ed 100644
--- a/meta/recipes-core/glibc/glibc/0024-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,7 +1,7 @@
-From 82516e3ed372f618c886a2de4f9498f597aa8a8b Mon Sep 17 00:00:00 2001
+From 6de1dc8197535dcf47e359a7860f58347ca08ef5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
-Subject: [PATCH 24/26] eglibc: Forward port cross locale generation support
+Subject: [PATCH 22/26] eglibc: Forward port cross locale generation support
 
 Upstream-Status: Pending
 
@@ -23,11 +23,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 locale/catnames.c
 
 diff --git a/locale/Makefile b/locale/Makefile
-index c5379e6..c98c675 100644
+index 98ee76272d..bc3afb2248 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
-@@ -25,7 +25,8 @@ include ../Makeconfig
- headers		= locale.h bits/locale.h langinfo.h xlocale.h
+@@ -26,7 +26,8 @@ headers		= langinfo.h locale.h bits/locale.h \
+ 		  bits/types/locale_t.h bits/types/__locale_t.h
  routines	= setlocale findlocale loadlocale loadarchive \
  		  localeconv nl_langinfo nl_langinfo_l mb_cur_max \
 -		  newlocale duplocale freelocale uselocale
@@ -38,7 +38,7 @@ index c5379e6..c98c675 100644
  		  address telephone measurement identification collate
 diff --git a/locale/catnames.c b/locale/catnames.c
 new file mode 100644
-index 0000000..9fad357
+index 0000000000..9fad357db1
 --- /dev/null
 +++ b/locale/catnames.c
 @@ -0,0 +1,48 @@
@@ -91,10 +91,10 @@ index 0000000..9fad357
 +    [LC_ALL] = sizeof ("LC_ALL") - 1
 +  };
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index 1f4da92..7f68935 100644
+index 4e1c8c568a..f7ed946f1c 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
-@@ -224,7 +224,7 @@ __libc_tsd_define (extern, __locale_t, LOCALE)
+@@ -224,7 +224,7 @@ __libc_tsd_define (extern, locale_t, LOCALE)
     unused.  We can manage this playing some tricks with weak references.
     But with thread-local locale settings, it becomes quite ungainly unless
     we can use __thread variables.  So only in that case do we attempt this.  */
@@ -104,7 +104,7 @@ index 1f4da92..7f68935 100644
  # define NL_CURRENT_INDIRECT	1
  #endif
 diff --git a/locale/programs/charmap-dir.c b/locale/programs/charmap-dir.c
-index 99fcd35..5e528dc 100644
+index e55ab86e28..0f87e6dd28 100644
 --- a/locale/programs/charmap-dir.c
 +++ b/locale/programs/charmap-dir.c
 @@ -19,7 +19,9 @@
@@ -150,7 +150,7 @@ index 99fcd35..5e528dc 100644
    return NULL;
  }
 diff --git a/locale/programs/ld-collate.c b/locale/programs/ld-collate.c
-index 1e125f6..3b2867f 100644
+index cec848cb7c..fcd768eb7d 100644
 --- a/locale/programs/ld-collate.c
 +++ b/locale/programs/ld-collate.c
 @@ -350,7 +350,7 @@ new_element (struct locale_collate_t *collate, const char *mbs, size_t mbslen,
@@ -199,7 +199,7 @@ index 1e125f6..3b2867f 100644
  			 == runp->wcnext->wcs[runp->nwcs - 1] + 1));
  
 diff --git a/locale/programs/ld-ctype.c b/locale/programs/ld-ctype.c
-index 0fd141c..68136e6 100644
+index df266c20d6..05c0152ec9 100644
 --- a/locale/programs/ld-ctype.c
 +++ b/locale/programs/ld-ctype.c
 @@ -926,7 +926,7 @@ ctype_output (struct localedef_t *locale, const struct charmap_t *charmap,
@@ -281,7 +281,7 @@ index 0fd141c..68136e6 100644
  	      srunp = srunp->next;
  	    }
 diff --git a/locale/programs/ld-time.c b/locale/programs/ld-time.c
-index 87531bc..5f2c266 100644
+index 32e9c41e35..6a61fcedeb 100644
 --- a/locale/programs/ld-time.c
 +++ b/locale/programs/ld-time.c
 @@ -215,8 +215,10 @@ No definition for %s category found"), "LC_TIME"));
@@ -350,7 +350,7 @@ index 87531bc..5f2c266 100644
  
  
 diff --git a/locale/programs/linereader.c b/locale/programs/linereader.c
-index b885f65..0afb631 100644
+index 52b340963a..1a8bce17b4 100644
 --- a/locale/programs/linereader.c
 +++ b/locale/programs/linereader.c
 @@ -595,7 +595,7 @@ get_string (struct linereader *lr, const struct charmap_t *charmap,
@@ -363,7 +363,7 @@ index b885f65..0afb631 100644
    size_t bufmax = 56;
  
 diff --git a/locale/programs/localedef.c b/locale/programs/localedef.c
-index b4c48f1..ed08d48 100644
+index 6acc1342c7..df87740f8b 100644
 --- a/locale/programs/localedef.c
 +++ b/locale/programs/localedef.c
 @@ -108,6 +108,7 @@ void (*argp_program_version_hook) (FILE *, struct argp_state *) = print_version;
@@ -409,7 +409,7 @@ index b4c48f1..ed08d48 100644
        force_output = 1;
        break;
 diff --git a/locale/programs/locfile.c b/locale/programs/locfile.c
-index 32f5cd2..02967b0 100644
+index 0990ef11be..683422c908 100644
 --- a/locale/programs/locfile.c
 +++ b/locale/programs/locfile.c
 @@ -544,6 +544,9 @@ compare_files (const char *filename1, const char *filename2, size_t size,
@@ -432,7 +432,7 @@ index 32f5cd2..02967b0 100644
  
  /* Record that FILE's next element is the 32-bit integer VALUE.  */
 diff --git a/locale/programs/locfile.h b/locale/programs/locfile.h
-index a3dd904..2c7763a 100644
+index 3407e13c13..0bb556caf8 100644
 --- a/locale/programs/locfile.h
 +++ b/locale/programs/locfile.h
 @@ -71,6 +71,8 @@ extern void write_all_categories (struct localedef_t *definitions,
@@ -521,7 +521,7 @@ index a3dd904..2c7763a 100644
 +
  #endif /* locfile.h */
 diff --git a/locale/setlocale.c b/locale/setlocale.c
-index 69b3141..1cef0be 100644
+index 19acc4b2c7..c89d3b87ad 100644
 --- a/locale/setlocale.c
 +++ b/locale/setlocale.c
 @@ -64,36 +64,6 @@ static char *const _nl_current_used[] =
@@ -562,5 +562,5 @@ index 69b3141..1cef0be 100644
  # define WEAK_POSTLOAD(postload) weak_extern (postload)
  #else
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0025-Define-DUMMY_LOCALE_T-if-not-defined.patch b/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
similarity index 80%
rename from meta/recipes-core/glibc/glibc/0025-Define-DUMMY_LOCALE_T-if-not-defined.patch
rename to meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
index 1f0f5d4da2..d3c7373dde 100644
--- a/meta/recipes-core/glibc/glibc/0025-Define-DUMMY_LOCALE_T-if-not-defined.patch
+++ b/meta/recipes-core/glibc/glibc/0023-Define-DUMMY_LOCALE_T-if-not-defined.patch
@@ -1,7 +1,7 @@
-From c2d8cdeab116caacdfedb35eeb3e743b44807bec Mon Sep 17 00:00:00 2001
+From c6b9fca34a9284b41500357c06b4de5b6431ab56 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 20 Apr 2016 21:11:00 -0700
-Subject: [PATCH 25/26] Define DUMMY_LOCALE_T if not defined
+Subject: [PATCH 23/26] Define DUMMY_LOCALE_T if not defined
 
 This is a hack to fix building the locale bits on an older
 CentOs 5.X machine
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/locale/programs/config.h b/locale/programs/config.h
-index f606365..0e5f8c3 100644
+index 5b416be0d8..79e66eed5e 100644
 --- a/locale/programs/config.h
 +++ b/locale/programs/config.h
 @@ -19,6 +19,9 @@
@@ -28,5 +28,5 @@ index f606365..0e5f8c3 100644
  #define PACKAGE _libc_intl_domainname
  #ifndef VERSION
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0020-eglibc-cherry-picked-from.patch b/meta/recipes-core/glibc/glibc/0024-local-dynamic-resolvconf.patch
similarity index 49%
rename from meta/recipes-core/glibc/glibc/0020-eglibc-cherry-picked-from.patch
rename to meta/recipes-core/glibc/glibc/0024-local-dynamic-resolvconf.patch
index 43445739b1..592ac7a552 100644
--- a/meta/recipes-core/glibc/glibc/0020-eglibc-cherry-picked-from.patch
+++ b/meta/recipes-core/glibc/glibc/0024-local-dynamic-resolvconf.patch
@@ -1,24 +1,27 @@
-From b2ed906ec864583b43379ef9ad2b5630c1232565 Mon Sep 17 00:00:00 2001
+From e77b519ebcd9fed263e963b5d4c201039b04eaea Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 31 Dec 2015 15:10:33 -0800
-Subject: [PATCH 20/26] eglibc: cherry-picked from
+Date: Fri, 23 Jun 2017 14:21:44 -0700
+Subject: [PATCH 24/26] local dynamic resolvconf
+
+Forwarded ported from eglibc
 
 http://www.eglibc.org/archives/patches/msg00772.html
 
-Not yet merged into glibc
+Fixes
+https://sourceware.org/bugzilla/show_bug.cgi?id=984
 
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- resolv/res_libc.c | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
+ resolv/res_libc.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/resolv/res_libc.c b/resolv/res_libc.c
-index a4b376f..3256e12 100644
+index 3d7b4f72d0..dac6de02f8 100644
 --- a/resolv/res_libc.c
 +++ b/resolv/res_libc.c
-@@ -21,11 +21,13 @@
+@@ -36,19 +36,20 @@
  #include <atomic.h>
  #include <limits.h>
  #include <sys/types.h>
@@ -27,12 +30,12 @@ index a4b376f..3256e12 100644
  #include <arpa/nameser.h>
  #include <resolv.h>
  #include <libc-lock.h>
+ #include <resolv-internal.h>
  
 +__libc_lock_define_initialized (static, lock);
- extern unsigned long long int __res_initstamp attribute_hidden;
  /* We have atomic increment operations on 64-bit platforms.  */
  #if __WORDSIZE == 64
-@@ -33,7 +35,6 @@ extern unsigned long long int __res_initstamp attribute_hidden;
+ # define atomicinclock(lock) (void) 0
  # define atomicincunlock(lock) (void) 0
  # define atomicinc(var) catomic_increment (&(var))
  #else
@@ -40,25 +43,27 @@ index a4b376f..3256e12 100644
  # define atomicinclock(lock) __libc_lock_lock (lock)
  # define atomicincunlock(lock) __libc_lock_unlock (lock)
  # define atomicinc(var) ++var
-@@ -92,7 +93,18 @@ res_init(void) {
+@@ -104,8 +105,20 @@ res_init (void)
  int
  __res_maybe_init (res_state resp, int preinit)
  {
-+	static time_t last_mtime;
-+	struct stat statbuf;
-+	int ret;
++  static time_t last_mtime;
++  struct stat statbuf;
++  int ret;
 +
- 	if (resp->options & RES_INIT) {
-+		ret = stat (_PATH_RESCONF, &statbuf);
-+		__libc_lock_lock (lock);
-+		if ((ret == 0) && (last_mtime != statbuf.st_mtime)) {
-+			last_mtime = statbuf.st_mtime;
-+			atomicinc (__res_initstamp);
-+		}
-+		__libc_lock_unlock (lock);
- 		if (__res_initstamp != resp->_u._ext.initstamp) {
- 			if (resp->nscount > 0)
- 				__res_iclose (resp, true);
+   if (resp->options & RES_INIT)
+     {
++      ret = stat (_PATH_RESCONF, &statbuf);
++      __libc_lock_lock (lock);
++      if ((ret == 0) && (last_mtime != statbuf.st_mtime))
++        {
++          last_mtime = statbuf.st_mtime;
++          atomicinc (__res_initstamp);
++        }
++      __libc_lock_unlock (lock);
+       if (__res_initstamp != resp->_u._ext.initstamp)
+         {
+           if (resp->nscount > 0)
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch b/meta/recipes-core/glibc/glibc/0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
similarity index 89%
rename from meta/recipes-core/glibc/glibc/0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
rename to meta/recipes-core/glibc/glibc/0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
index 852f5304ce..6c181c8843 100644
--- a/meta/recipes-core/glibc/glibc/0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
+++ b/meta/recipes-core/glibc/glibc/0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
@@ -1,7 +1,7 @@
-From fb315c197cca61299a6f6588ea3460145c255d06 Mon Sep 17 00:00:00 2001
+From ab21138ac31d14552e7bf3432a9f92a2e33b72c0 Mon Sep 17 00:00:00 2001
 From: Mark Hatle <mark.hatle@windriver.com>
 Date: Thu, 18 Aug 2016 14:07:58 -0500
-Subject: [PATCH 26/26] elf/dl-deps.c: Make _dl_build_local_scope breadth first
+Subject: [PATCH 25/26] elf/dl-deps.c: Make _dl_build_local_scope breadth first
 
 According to the ELF specification:
 
@@ -24,7 +24,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  1 file changed, 10 insertions(+), 4 deletions(-)
 
 diff --git a/elf/dl-deps.c b/elf/dl-deps.c
-index 6a82987..53be824 100644
+index 1b8bac6593..c616808f31 100644
 --- a/elf/dl-deps.c
 +++ b/elf/dl-deps.c
 @@ -73,13 +73,19 @@ _dl_build_local_scope (struct link_map **list, struct link_map *map)
@@ -52,5 +52,5 @@ index 6a82987..53be824 100644
  }
  
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc/0027-locale-fix-hard-coded-reference-to-gcc-E.patch b/meta/recipes-core/glibc/glibc/0026-locale-fix-hard-coded-reference-to-gcc-E.patch
similarity index 82%
rename from meta/recipes-core/glibc/glibc/0027-locale-fix-hard-coded-reference-to-gcc-E.patch
rename to meta/recipes-core/glibc/glibc/0026-locale-fix-hard-coded-reference-to-gcc-E.patch
index bce90557cf..08967925ab 100644
--- a/meta/recipes-core/glibc/glibc/0027-locale-fix-hard-coded-reference-to-gcc-E.patch
+++ b/meta/recipes-core/glibc/glibc/0026-locale-fix-hard-coded-reference-to-gcc-E.patch
@@ -1,7 +1,7 @@
-From a2fc86cb8d0366171f100ebd033aeb9609fa40de Mon Sep 17 00:00:00 2001
+From 84625a170eb3145eb27f3d348fcd9bad85cc2fa2 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
 Date: Mon, 22 Aug 2016 16:09:25 +0200
-Subject: [PATCH 27/27] locale: fix hard-coded reference to gcc -E
+Subject: [PATCH 26/26] locale: fix hard-coded reference to gcc -E
 
 When new version of compilers are published, they may not be compatible with
 older versions of software. This is particularly common when software is built
@@ -17,13 +17,13 @@ environment.
 This patch replaces the hard-coded reference to the gcc binary with the proper
 environment variable, thus allowing a user to override it.
 
-Upstream-Status: Submitted [https://sourceware.org/ml/libc-alpha/2016-08/msg00746.html]
+Upstream-Status : Submitted [https://sourceware.org/ml/libc-alpha/2016-08/msg00746.html]
 ---
  locale/gen-translit.pl | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/locale/gen-translit.pl b/locale/gen-translit.pl
-index 30d3f2f..e976530 100644
+index 30d3f2f195..e97653017c 100644
 --- a/locale/gen-translit.pl
 +++ b/locale/gen-translit.pl
 @@ -1,5 +1,5 @@
@@ -34,5 +34,5 @@ index 30d3f2f..e976530 100644
  
  sub cstrlen {
 -- 
-2.10.2
+2.13.2
 
diff --git a/meta/recipes-core/glibc/glibc_2.25.bb b/meta/recipes-core/glibc/glibc_2.25.90.bb
similarity index 80%
rename from meta/recipes-core/glibc/glibc_2.25.bb
rename to meta/recipes-core/glibc/glibc_2.25.90.bb
index c37438a2d1..b2f4db5181 100644
--- a/meta/recipes-core/glibc/glibc_2.25.bb
+++ b/meta/recipes-core/glibc/glibc_2.25.90.bb
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 DEPENDS += "gperf-native"
 
-SRCREV ?= "db0242e3023436757bbc7c488a779e6e3343db04"
+SRCREV ?= "8466ee1cb7c2041d8471dad0aa53af35ab599012"
 
-SRCBRANCH ?= "release/${PV}/master"
+#SRCBRANCH ?= "release/${PV}/master"
+SRCBRANCH ?= "master"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
@@ -26,22 +27,21 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch \
            file://0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
            file://0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch \
-           file://0012-Make-ld-version-output-matching-grok-gold-s-output.patch \
-           file://0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch \
-           file://0014-Add-unused-attribute.patch \
-           file://0015-yes-within-the-path-sets-wrong-config-variables.patch \
-           file://0016-timezone-re-written-tzselect-as-posix-sh.patch \
-           file://0017-Remove-bash-dependency-for-nscd-init-script.patch \
-           file://0018-eglibc-Cross-building-and-testing-instructions.patch \
-           file://0019-eglibc-Help-bootstrap-cross-toolchain.patch \
-           file://0020-eglibc-cherry-picked-from.patch \
-           file://0021-eglibc-Clear-cache-lines-on-ppc8xx.patch \
-           file://0022-eglibc-Resolve-__fpscr_values-on-SH4.patch \
-           file://0023-eglibc-Install-PIC-archives.patch \
-           file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
-           file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
-           file://0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
-           file://0027-locale-fix-hard-coded-reference-to-gcc-E.patch \
+           file://0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch \
+           file://0013-Add-unused-attribute.patch \
+           file://0014-yes-within-the-path-sets-wrong-config-variables.patch \
+           file://0015-timezone-re-written-tzselect-as-posix-sh.patch \
+           file://0016-Remove-bash-dependency-for-nscd-init-script.patch \
+           file://0017-eglibc-Cross-building-and-testing-instructions.patch \
+           file://0018-eglibc-Help-bootstrap-cross-toolchain.patch \
+           file://0019-eglibc-Clear-cache-lines-on-ppc8xx.patch \
+           file://0020-eglibc-Resolve-__fpscr_values-on-SH4.patch \
+           file://0021-eglibc-Install-PIC-archives.patch \
+           file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
+           file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
+           file://0024-local-dynamic-resolvconf.patch \
+           file://0025-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
+           file://0026-locale-fix-hard-coded-reference-to-gcc-E.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.13.2


