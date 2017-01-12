Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B978E71C7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 20:20:59 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id b22so4840511pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 12:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wG2bIIIJrfORtCIV+S3PdS/65mlS17pJNWE2GWLFwX8=;
	b=r1XFMQ6bEVBRtdfEljmQiVp1o8E/AJBKPBvNaQY994/tERIJM9hRJdKS2b4ZaDz8MC
	pwkJuS8SEpeyj1anQmMUlDy7eJMMy/1TyHdjSi4TzUKxUeWMUjI7D/Q60EyER30m9MhD
	VbgX81+sV0imq1HCYl2F3HIKpw91GJFJ2OzTBuXIiZTxU8AwGPHQLLfAlefOa16x52+l
	0+vuVu7JwYVR0csvIaKZixzA6eXQrybSLSFg1PAUEA8glrKa3Ko8hYqTfC777nEOjXby
	Ts79LRWQrDURJmDK1KM29+MvsBLOrAO7xxQGEpynx0NjjWKpukoazm1nTr3GtB/WyVWd
	7dWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wG2bIIIJrfORtCIV+S3PdS/65mlS17pJNWE2GWLFwX8=;
	b=cssemF81hV8obgkheUht3G4JWsMYUMrA5bBqUhNMBmVAYKd6EQyaClZ+sb70DEQIVJ
	GJaxknn+vgZnHKyjmAeduGo1j97pd5CO9hdtk93xlUnhXmcOwkJGClONJFj7MhiEhBE0
	kXNJJrFDiFD+S//5HvvokMwT5p45KlMOPNRijWcGW15ZfG7WK4zL8IP5nxp6C2YhTV9d
	eToeYj/vVMF4mmNij17ZNiAbDRV/+pYUFlNnxKuabb4kHpVaENLpYUs2HJjogsfXqe+p
	LJtTG9KhOVI+6Hk4xx1M6r6Ul7rTQjMdmaYtPc9+2k84GytHghBkKSuycHE0siDe7x0F
	80OA==
X-Gm-Message-State: AIkVDXIitDi+KSiZYZLIJKvzwRAlFyXzJfEx3XKZ2G5YySB8K9OSIdr4PMlCzC0tdX3M5g==
X-Received: by 10.98.4.134 with SMTP id 128mr18794512pfe.156.1484252459096;
	Thu, 12 Jan 2017 12:20:59 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e184sm23698209pfc.28.2017.01.12.12.20.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jan 2017 12:20:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2017 12:20:50 -0800
Message-Id: <20170112202050.22808-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 2/2 V2] glibc: Upgrade to 2.25 snapshot
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
X-List-Received-Date: Thu, 12 Jan 2017 20:21:00 -0000

glibc 2.25 release is in freeze stage now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc        |   2 +-
 ...tive_2.24.bb => cross-localedef-native_2.25.bb} |   5 +-
 ...glibc-initial_2.24.bb => glibc-initial_2.25.bb} |   0
 .../{glibc-locale_2.24.bb => glibc-locale_2.25.bb} |   0
 .../{glibc-mtrace_2.24.bb => glibc-mtrace_2.25.bb} |   0
 ...glibc-scripts_2.24.bb => glibc-scripts_2.25.bb} |   0
 ...libc-Look-for-host-system-ld.so.cache-as-.patch |  12 +-
 ...libc-Fix-buffer-overrun-with-a-relocated-.patch |  10 +-
 ...libc-Raise-the-size-of-arrays-containing-.patch | 123 ++++++++-------------
 ...ivesdk-glibc-Allow-64-bit-atomics-for-x86.patch |   8 +-
 ...500-e5500-e6500-603e-fsqrt-implementation.patch |   6 +-
 ...-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch |   6 +-
 ...-Fix-undefined-reference-to-__sqrt_finite.patch |   6 +-
 ...qrt-f-are-now-inline-functions-and-call-o.patch |   6 +-
 ...bug-1443-which-explains-what-the-patch-do.patch |   6 +-
 ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |   6 +-
 ...qrt-f-are-now-inline-functions-and-call-o.patch |   6 +-
 ...ersion-output-matching-grok-gold-s-output.patch |  14 +--
 ...-configure.ac-handle-correctly-libc_cv_ro.patch |   6 +-
 .../glibc/glibc/0014-Add-unused-attribute.patch    |   6 +-
 ...thin-the-path-sets-wrong-config-variables.patch |   6 +-
 ...-timezone-re-written-tzselect-as-posix-sh.patch |   6 +-
 ...move-bash-dependency-for-nscd-init-script.patch |   8 +-
 ...c-Cross-building-and-testing-instructions.patch |   6 +-
 ...019-eglibc-Help-bootstrap-cross-toolchain.patch |  14 +--
 .../glibc/0020-eglibc-cherry-picked-from.patch     |   6 +-
 .../0021-eglibc-Clear-cache-lines-on-ppc8xx.patch  |   6 +-
 ...0022-eglibc-Resolve-__fpscr_values-on-SH4.patch |   6 +-
 .../glibc/0023-eglibc-Install-PIC-archives.patch   |  20 ++--
 ...ward-port-cross-locale-generation-support.patch |  18 +--
 ...0025-Define-DUMMY_LOCALE_T-if-not-defined.patch |   6 +-
 ...c-Make-_dl_build_local_scope-breadth-fir.patch} |   8 +-
 ...k-__startcontext-as-.cantunwind-bug-20435.patch |  46 --------
 ...locale-fix-hard-coded-reference-to-gcc-E.patch} |  17 ++-
 ...k-IFUNC-definition-in-unrelocated-shared-.patch |  98 ++++++++++++++++
 .../glibc/{glibc_2.24.bb => glibc_2.25.bb}         |  23 ++--
 36 files changed, 270 insertions(+), 252 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.24.bb => cross-localedef-native_2.25.bb} (94%)
 rename meta/recipes-core/glibc/{glibc-initial_2.24.bb => glibc-initial_2.25.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-locale_2.24.bb => glibc-locale_2.25.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.24.bb => glibc-mtrace_2.25.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.24.bb => glibc-scripts_2.25.bb} (100%)
 rename meta/recipes-core/glibc/glibc/{0026-build_local_scope.patch => 0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch} (88%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0027-arm-mark-__startcontext-as-.cantunwind-bug-20435.patch
 rename meta/recipes-core/glibc/glibc/{0001-locale-fix-hard-coded-reference-to-gcc-E.patch => 0027-locale-fix-hard-coded-reference-to-gcc-E.patch} (86%)
 create mode 100644 meta/recipes-core/glibc/glibc/0028-Revert-Check-IFUNC-definition-in-unrelocated-shared-.patch
 rename meta/recipes-core/glibc/{glibc_2.24.bb => glibc_2.25.bb} (92%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 7fceb58ee6..91143c4100 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ GCCVERSION ?= "6.3%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.27%"
 GDBVERSION ?= "7.12%"
-GLIBCVERSION ?= "2.24"
+GLIBCVERSION ?= "2.25"
 UCLIBCVERSION ?= "1.0%"
 LINUXLIBCVERSION ?= "4.8%"
 
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.24.bb b/meta/recipes-core/glibc/cross-localedef-native_2.25.bb
similarity index 94%
rename from meta/recipes-core/glibc/cross-localedef-native_2.24.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.25.bb
index d4cccedb43..82511b179c 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.25.bb
@@ -17,11 +17,12 @@ inherit autotools
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
-SRCBRANCH ?= "release/${PV}/master"
+#SRCBRANCH ?= "release/${PV}/master"
+SRCBRANCH ?= "master"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRCREV_glibc ?= "ea23815a795f72035262953dad5beb03e09c17dd"
+SRCREV_glibc ?= "bb440151433f0298e7a6786ccd30cd084812f897"
 SRCREV_localedef ?= "29869b6dc11427c5bab839bdb155c85a7c644c71"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
diff --git a/meta/recipes-core/glibc/glibc-initial_2.24.bb b/meta/recipes-core/glibc/glibc-initial_2.25.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-initial_2.24.bb
rename to meta/recipes-core/glibc/glibc-initial_2.25.bb
diff --git a/meta/recipes-core/glibc/glibc-locale_2.24.bb b/meta/recipes-core/glibc/glibc-locale_2.25.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.24.bb
rename to meta/recipes-core/glibc/glibc-locale_2.25.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.24.bb b/meta/recipes-core/glibc/glibc-mtrace_2.25.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.24.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.25.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.24.bb b/meta/recipes-core/glibc/glibc-scripts_2.25.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.24.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.25.bb
diff --git a/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index ca3375805d..0553f8a472 100644
--- a/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,7 +1,7 @@
-From 7e11aafc3a7cb873b3f648740c8acd379597e4d1 Mon Sep 17 00:00:00 2001
+From 2727e58d1d269994de17cadb12195001b14585e7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:48:24 +0000
-Subject: [PATCH 01/25] nativesdk-glibc: Look for host system ld.so.cache as
+Subject: [PATCH 01/26] nativesdk-glibc: Look for host system ld.so.cache as
  well
 
 Upstream-Status: Inappropriate [embedded specific]
@@ -31,10 +31,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index c0d6249..2c73105 100644
+index 51fb0d0..f503dbc 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -2094,6 +2094,14 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2054,6 +2054,14 @@ _dl_map_object (struct link_map *loader, const char *name,
              }
          }
  
@@ -49,7 +49,7 @@ index c0d6249..2c73105 100644
  #ifdef USE_LDCONFIG
        if (fd == -1
  	  && (__glibc_likely ((mode & __RTLD_SECURE) == 0)
-@@ -2152,14 +2160,6 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2112,14 +2120,6 @@ _dl_map_object (struct link_map *loader, const char *name,
  	}
  #endif
  
@@ -65,5 +65,5 @@ index c0d6249..2c73105 100644
        if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_LIBS))
  	_dl_debug_printf ("\n");
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index 5428468c5a..e5ef3410e9 100644
--- a/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,7 +1,7 @@
-From 5fd884dc28d5d84001fae8ffdd8be698bb84143e Mon Sep 17 00:00:00 2001
+From 1578f52647ec8804186d1944d4cd2095132efc39 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
-Subject: [PATCH 02/25] nativesdk-glibc: Fix buffer overrun with a relocated
+Subject: [PATCH 02/26] nativesdk-glibc: Fix buffer overrun with a relocated
  SDK
 
 When ld-linux-*.so.2 is relocated to a path that is longer than the
@@ -22,10 +22,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 2c73105..c7b8797 100644
+index f503dbc..3a3d112 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -1793,7 +1793,19 @@ open_path (const char *name, size_t namelen, int mode,
+@@ -1753,7 +1753,19 @@ open_path (const char *name, size_t namelen, int mode,
         given on the command line when rtld is run directly.  */
      return -1;
  
@@ -46,5 +46,5 @@ index 2c73105..c7b8797 100644
      {
        struct r_search_path_elem *this_dir = *dirs;
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index 7cba6cc367..9e207e44d9 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,7 +1,7 @@
-From c99892f2018cd7fa0f37b53e6cebec99fa036472 Mon Sep 17 00:00:00 2001
+From e53968d61804b6bab32ec6e13cc0b3cd57214796 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
-Subject: [PATCH 03/25] nativesdk-glibc: Raise the size of arrays containing dl
+Subject: [PATCH 03/26] nativesdk-glibc: Raise the size of arrays containing dl
  paths
 
 This patch puts the dynamic loader path in the binaries, SYSTEM_DIRS strings
@@ -21,13 +21,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  elf/interp.c               | 2 +-
  elf/ldconfig.c             | 3 +++
  elf/rtld.c                 | 5 +++--
+ iconv/gconv_conf.c         | 2 +-
  sysdeps/generic/dl-cache.h | 4 ----
- 6 files changed, 13 insertions(+), 9 deletions(-)
+ 7 files changed, 14 insertions(+), 10 deletions(-)
 
-Index: git/elf/dl-cache.c
-===================================================================
---- git.orig/elf/dl-cache.c
-+++ git/elf/dl-cache.c
+diff --git a/elf/dl-cache.c b/elf/dl-cache.c
+index cfa335e..daa12ec 100644
+--- a/elf/dl-cache.c
++++ b/elf/dl-cache.c
 @@ -132,6 +132,10 @@ do									      \
  while (0)
  
@@ -39,11 +40,11 @@ Index: git/elf/dl-cache.c
  int
  internal_function
  _dl_cache_libcmp (const char *p1, const char *p2)
-Index: git/elf/dl-load.c
-===================================================================
---- git.orig/elf/dl-load.c
-+++ git/elf/dl-load.c
-@@ -106,8 +106,8 @@ static size_t max_capstrlen attribute_re
+diff --git a/elf/dl-load.c b/elf/dl-load.c
+index 3a3d112..a1410e4 100644
+--- a/elf/dl-load.c
++++ b/elf/dl-load.c
+@@ -106,8 +106,8 @@ static size_t max_capstrlen attribute_relro;
  /* Get the generated information about the trusted directories.  */
  #include "trusted-dirs.h"
  
@@ -54,10 +55,10 @@ Index: git/elf/dl-load.c
  {
    SYSTEM_DIRS_LEN
  };
-Index: git/elf/interp.c
-===================================================================
---- git.orig/elf/interp.c
-+++ git/elf/interp.c
+diff --git a/elf/interp.c b/elf/interp.c
+index 9448802..e7e8c70 100644
+--- a/elf/interp.c
++++ b/elf/interp.c
 @@ -18,5 +18,5 @@
  
  #include <runtime-linker.h>
@@ -65,10 +66,10 @@ Index: git/elf/interp.c
 -const char __invoke_dynamic_linker__[] __attribute__ ((section (".interp")))
 +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
    = RUNTIME_LINKER;
-Index: git/elf/ldconfig.c
-===================================================================
---- git.orig/elf/ldconfig.c
-+++ git/elf/ldconfig.c
+diff --git a/elf/ldconfig.c b/elf/ldconfig.c
+index 467ca82..631a2a9 100644
+--- a/elf/ldconfig.c
++++ b/elf/ldconfig.c
 @@ -168,6 +168,9 @@ static struct argp argp =
    options, parse_opt, NULL, doc, NULL, more_help, NULL
  };
@@ -79,10 +80,10 @@ Index: git/elf/ldconfig.c
  /* Check if string corresponds to an important hardware capability or
     a platform.  */
  static int
-Index: git/elf/rtld.c
-===================================================================
---- git.orig/elf/rtld.c
-+++ git/elf/rtld.c
+diff --git a/elf/rtld.c b/elf/rtld.c
+index 4ec25d7..e159c12 100644
+--- a/elf/rtld.c
++++ b/elf/rtld.c
 @@ -99,6 +99,7 @@ uintptr_t __pointer_chk_guard_local
  strong_alias (__pointer_chk_guard_local, __pointer_chk_guard)
  #endif
@@ -91,7 +92,7 @@ Index: git/elf/rtld.c
  
  /* List of auditing DSOs.  */
  static struct audit_list
-@@ -873,12 +874,12 @@ of this helper program; chances are you
+@@ -854,12 +855,12 @@ of this helper program; chances are you did not intend to run this program.\n\
    --list                list all dependencies and how they are resolved\n\
    --verify              verify that given object really is a dynamically linked\n\
  			object we can handle\n\
@@ -106,10 +107,23 @@ Index: git/elf/rtld.c
  
        ++_dl_skip_args;
        --_dl_argc;
-Index: git/sysdeps/generic/dl-cache.h
-===================================================================
---- git.orig/sysdeps/generic/dl-cache.h
-+++ git/sysdeps/generic/dl-cache.h
+diff --git a/iconv/gconv_conf.c b/iconv/gconv_conf.c
+index e235188..569f72e 100644
+--- a/iconv/gconv_conf.c
++++ b/iconv/gconv_conf.c
+@@ -36,7 +36,7 @@
+ 
+ 
+ /* This is the default path where we look for module lists.  */
+-static const char default_gconv_path[] = GCONV_PATH;
++static char default_gconv_path[4096] __attribute__ ((section (".gccrelocprefix"))) = GCONV_PATH;
+ 
+ /* The path elements, as determined by the __gconv_get_path function.
+    All path elements end in a slash.  */
+diff --git a/sysdeps/generic/dl-cache.h b/sysdeps/generic/dl-cache.h
+index eb2f900..505804e 100644
+--- a/sysdeps/generic/dl-cache.h
++++ b/sysdeps/generic/dl-cache.h
 @@ -27,10 +27,6 @@
    ((flags) == 1 || (flags) == _DL_CACHE_DEFAULT_ID)
  #endif
@@ -121,51 +135,6 @@ Index: git/sysdeps/generic/dl-cache.h
  #ifndef add_system_dir
  # define add_system_dir(dir) add_dir (dir)
  #endif
-Index: git/iconv/gconv_conf.c
-===================================================================
---- git.orig/iconv/gconv_conf.c
-+++ git/iconv/gconv_conf.c
-@@ -36,7 +36,7 @@
- 
- 
- /* This is the default path where we look for module lists.  */
--static const char default_gconv_path[] = GCONV_PATH;
-+static char default_gconv_path[4096] __attribute__ ((section (".gccrelocprefix"))) = GCONV_PATH;
- 
- /* The path elements, as determined by the __gconv_get_path function.
-    All path elements end in a slash.  */
-Index: git/locale/findlocale.c
-===================================================================
---- git.orig/locale/findlocale.c
-+++ git/locale/findlocale.c
-@@ -56,7 +56,7 @@ struct __locale_data *const _nl_C[] attr
-    which are somehow addressed.  */
- struct loaded_l10nfile *_nl_locale_file_list[__LC_LAST];
- 
--const char _nl_default_locale_path[] attribute_hidden = COMPLOCALEDIR;
-+char _nl_default_locale_path[4096] __attribute__ ((section (".gccrelocprefix"))) attribute_hidden = COMPLOCALEDIR;
- 
- /* Checks if the name is actually present, that is, not NULL and not
-    empty.  */
-@@ -168,7 +168,7 @@ _nl_find_locale (const char *locale_path
- 
-       /* Nothing in the archive.  Set the default path to search below.  */
-       locale_path = _nl_default_locale_path;
--      locale_path_len = sizeof _nl_default_locale_path;
-+      locale_path_len = strlen(_nl_default_locale_path) + 1;
-     }
-   else
-     /* We really have to load some data.  First see whether the name is
-Index: git/locale/localeinfo.h
-===================================================================
---- git.orig/locale/localeinfo.h
-+++ git/locale/localeinfo.h
-@@ -322,7 +322,7 @@ _nl_lookup_word (locale_t l, int categor
- }
- 
- /* Default search path if no LOCPATH environment variable.  */
--extern const char _nl_default_locale_path[] attribute_hidden;
-+extern char _nl_default_locale_path[] attribute_hidden;
- 
- /* Load the locale data for CATEGORY from the file specified by *NAME.
-    If *NAME is "", use environment variables as specified by POSIX, and
+-- 
+2.10.2
+
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index 3127de68ec..b981f7bf7d 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -1,7 +1,7 @@
-From a56e7aa2fd10b178b9498f88a7a2ca8aad671a53 Mon Sep 17 00:00:00 2001
+From 0b95f34207ffed3aa53fa949662bfbccc7c864a4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:35:35 -0800
-Subject: [PATCH 04/25] nativesdk-glibc: Allow 64 bit atomics for x86
+Subject: [PATCH 04/26] nativesdk-glibc: Allow 64 bit atomics for x86
 
 The fix consist of allowing 64bit atomic ops for x86.
 This should be safe for i586 and newer CPUs.
@@ -11,8 +11,6 @@ Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
-
  sysdeps/i386/atomic-machine.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
@@ -30,5 +28,5 @@ index ce62b33..4fe44ea 100644
  
  
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch b/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
index dc0dfad9a8..ee50000319 100644
--- a/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
+++ b/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
@@ -1,7 +1,7 @@
-From 450473ce27b47cebec2c5c5b611a8c8bed41e6e8 Mon Sep 17 00:00:00 2001
+From 77a7495376c7d0c5507c0ec99bf1568150339ef4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:01:50 +0000
-Subject: [PATCH 05/25] fsl e500/e5500/e6500/603e fsqrt implementation
+Subject: [PATCH 05/26] fsl e500/e5500/e6500/603e fsqrt implementation
 
 Upstream-Status: Pending
 Signed-off-by: Edmar Wienskoski <edmar@freescale.com>
@@ -1580,5 +1580,5 @@ index 0000000..04ff8cc
 @@ -0,0 +1 @@
 +powerpc/powerpc64/e6500/fpu
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch b/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
index f267f66cde..9088d29c4a 100644
--- a/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
+++ b/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
@@ -1,7 +1,7 @@
-From bb065b78e9e0d3301e64a26e37550a657c885ebc Mon Sep 17 00:00:00 2001
+From 520cb9e746af637cf01fea385b7f4ee4aadbdfdd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:11:22 +0000
-Subject: [PATCH 06/25] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known
+Subject: [PATCH 06/26] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known
  names
 
 This bolts in a hook for OE to pass its own version of interpreter
@@ -29,5 +29,5 @@ index 8a66ffe..08d56fc 100644
  
  static struct known_names known_libs[] =
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch b/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
index 612e892e87..f33defe075 100644
--- a/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
+++ b/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
@@ -1,7 +1,7 @@
-From 4a91bbdb11a15f93094695bba4e0849c421fad48 Mon Sep 17 00:00:00 2001
+From 64130262787d54e2e6695ae4ed8783bfec14ffef Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:15:07 +0000
-Subject: [PATCH 07/25] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
+Subject: [PATCH 07/26] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
 
 on ppc fixes the errors like below
 | ./.libs/libpulsecore-1.1.so: undefined reference to `__sqrt_finite'
@@ -204,5 +204,5 @@ index 26fa067..9d17512 100644
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index 9e222b7b45..26f65c5b17 100644
--- a/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,7 +1,7 @@
-From ce2746a1560b4430d89d114e1b65c7be225b4c2a Mon Sep 17 00:00:00 2001
+From 5afb0147e3e49c3b474404524014efe51b2bca5a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:16:38 +0000
-Subject: [PATCH 08/25] __ieee754_sqrt{,f} are now inline functions and call
+Subject: [PATCH 08/26] __ieee754_sqrt{,f} are now inline functions and call
  out __slow versions
 
 Upstream-Status: Pending
@@ -383,5 +383,5 @@ index 9d17512..10de1f0 100644
 +
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch b/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
index 7aa74df239..d416acde3e 100644
--- a/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
+++ b/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
@@ -1,7 +1,7 @@
-From 1b61649e545de76dd79a5e2c39bb16d0c4623160 Mon Sep 17 00:00:00 2001
+From ddd51bb4e005432cb3c0f8f33822954408a9fee1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:20:09 +0000
-Subject: [PATCH 09/25] Quote from bug 1443 which explains what the patch does
+Subject: [PATCH 09/26] Quote from bug 1443 which explains what the patch does
  :
 
   We build some random program and link it with -lust.  When we run it,
@@ -58,5 +58,5 @@ index 60eee00..7d54d5e 100644
  
  	case R_ARM_TLS_TPOFF32:
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
index 14963a3577..276f1fa4c2 100644
--- a/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
+++ b/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
@@ -1,7 +1,7 @@
-From 91af416408b8718b004c83d93a6daa1f34cba48d Mon Sep 17 00:00:00 2001
+From d7e74670825330f5421a55f5aa2a1ce6fda7d7fb Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Wed, 19 Dec 2012 04:39:57 -0600
-Subject: [PATCH 10/25] eglibc: run libm-err-tab.pl with specific dirs in ${S}
+Subject: [PATCH 10/26] eglibc: run libm-err-tab.pl with specific dirs in ${S}
 
 libm-err-tab.pl will parse all the files named "libm-test-ulps"
 in the given dir recursively. To avoid parsing the one in
@@ -32,5 +32,5 @@ index f2f694f..e062833 100644
  	touch $@
  
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index e92d04c62b..096dab5474 100644
--- a/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,7 +1,7 @@
-From 6a71f688471fe0c85f8ad9afc4ee0723a20aae1d Mon Sep 17 00:00:00 2001
+From d6e2076571263e45c48889896d3d94ff576df2be Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:24:46 +0000
-Subject: [PATCH 11/25] __ieee754_sqrt{,f} are now inline functions and call
+Subject: [PATCH 11/26] __ieee754_sqrt{,f} are now inline functions and call
  out __slow versions
 
 Upstream-Status: Pending
@@ -57,5 +57,5 @@ index 8126535..10de1f0 100644
  #endif
  {
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0012-Make-ld-version-output-matching-grok-gold-s-output.patch b/meta/recipes-core/glibc/glibc/0012-Make-ld-version-output-matching-grok-gold-s-output.patch
index 4cba03f238..7728c61a9d 100644
--- a/meta/recipes-core/glibc/glibc/0012-Make-ld-version-output-matching-grok-gold-s-output.patch
+++ b/meta/recipes-core/glibc/glibc/0012-Make-ld-version-output-matching-grok-gold-s-output.patch
@@ -1,7 +1,7 @@
-From f9d024edb158659e403b51cc9d93da9bca6e5d7b Mon Sep 17 00:00:00 2001
+From c0974c746e026650bef5d1940eb3f519765c77af Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:25:45 +0000
-Subject: [PATCH 12/25] Make ld --version output matching grok gold's output
+Subject: [PATCH 12/26] Make ld --version output matching grok gold's output
 
 adapted from from upstream branch roland/gold-vs-libc
 
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 8fe5937..7888a3f 100755
+index 5cf3230..391f29d 100755
 --- a/configure
 +++ b/configure
-@@ -4482,7 +4482,7 @@ else
+@@ -4555,7 +4555,7 @@ else
    # Found it, now check the version.
    { $as_echo "$as_me:${as_lineno-$LINENO}: checking version of $LD" >&5
  $as_echo_n "checking version of $LD... " >&6; }
@@ -27,10 +27,10 @@ index 8fe5937..7888a3f 100755
      '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
      2.1[0-9][0-9]*|2.2[2-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
 diff --git a/configure.ac b/configure.ac
-index 3c766b7..6908a99 100644
+index d719fad..5b5877c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -944,7 +944,7 @@ AC_CHECK_PROG_VER(AS, $AS, --version,
+@@ -990,7 +990,7 @@ AC_CHECK_PROG_VER(AS, $AS, --version,
  		  [2.1[0-9][0-9]*|2.2[2-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*],
  		  AS=: critic_missing="$critic_missing as")
  AC_CHECK_PROG_VER(LD, $LD, --version,
@@ -40,5 +40,5 @@ index 3c766b7..6908a99 100644
  		  LD=: critic_missing="$critic_missing ld")
  
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch b/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
index 6a82f8d933..1c81c729db 100644
--- a/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
+++ b/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
@@ -1,7 +1,7 @@
-From 2ece12093c8ba4cf688d235f35d36f1feb02324c Mon Sep 17 00:00:00 2001
+From 2a12eadfd7940b6b0913de8e95d851254cce7953 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
-Subject: [PATCH 13/25] sysdeps/gnu/configure.ac: handle correctly
+Subject: [PATCH 13/26] sysdeps/gnu/configure.ac: handle correctly
  $libc_cv_rootsbindir
 
 Upstream-Status:Pending
@@ -38,5 +38,5 @@ index 634fe4d..3db1697 100644
    ;;
  esac
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch b/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
index d14a6d4cd5..b23e104ff8 100644
--- a/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
+++ b/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
@@ -1,7 +1,7 @@
-From 9fec083dc99d2b524090e1d098e03709eed64a72 Mon Sep 17 00:00:00 2001
+From ec4f7763b30603b7ba0b70bd7750e34d442821b3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:28:41 +0000
-Subject: [PATCH 14/25] Add unused attribute
+Subject: [PATCH 14/26] Add unused attribute
 
 Helps in avoiding gcc warning when header is is included in
 a source file which does not use both functions
@@ -30,5 +30,5 @@ index 95cbce7..191a0dd 100644
  {
    int slash_count = 0;
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
index 8ceccec419..98d425a7bd 100644
--- a/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,7 +1,7 @@
-From 1794a97cba0b09b726eebc565c783c7b7c22dfba Mon Sep 17 00:00:00 2001
+From 18d64951cbb68d8d75e8ef347cbd0e0a5c14604b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
-Subject: [PATCH 15/25] 'yes' within the path sets wrong config variables
+Subject: [PATCH 15/26] 'yes' within the path sets wrong config variables
 
 It seems that the 'AC_EGREP_CPP(yes...' example is quite popular
 but being such a short word to grep it is likely to produce
@@ -259,5 +259,5 @@ index 0822915..9a32fdd 100644
      ], libc_cv_ppc64_def_call_elf=yes, libc_cv_ppc64_def_call_elf=no)])
    if test $libc_cv_ppc64_def_call_elf = no; then
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch b/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
index e5b508330c..426a2c0c2d 100644
--- a/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
+++ b/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
@@ -1,7 +1,7 @@
-From fdb5c9c88e3d1bc5ae6ef9ebcfcf560d3c42f0a6 Mon Sep 17 00:00:00 2001
+From 2bed515b9f9f613ae0db9b9607d8fa60a4afca5b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:33:03 +0000
-Subject: [PATCH 16/25] timezone: re-written tzselect as posix sh
+Subject: [PATCH 16/26] timezone: re-written tzselect as posix sh
 
 To avoid the bash dependency.
 
@@ -41,5 +41,5 @@ index 2c3b2f4..0c04a61 100755
  # Output one argument as-is to standard output.
  # Safer than 'echo', which can mishandle '\' or leading '-'.
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
index c8da05dc6e..6c2506ccc3 100644
--- a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
@@ -1,7 +1,7 @@
-From 88ad88d014a5ee68b0e044d2def5ab13743c8ae0 Mon Sep 17 00:00:00 2001
+From c8814875b362efbfd778345d0d2777478bf11a30 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
-Subject: [PATCH 17/25] Remove bash dependency for nscd init script
+Subject: [PATCH 17/26] Remove bash dependency for nscd init script
 
 The nscd init script uses #! /bin/bash but only really uses one bashism
 (translated strings), so remove them and switch the shell to #!/bin/sh.
@@ -9,8 +9,6 @@ The nscd init script uses #! /bin/bash but only really uses one bashism
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
-
  nscd/nscd.init | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
 
@@ -71,5 +69,5 @@ index a882da7..b02986e 100644
  	;;
  esac
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
index 1750765247..2ec01f05c7 100644
--- a/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,7 +1,7 @@
-From 49c0ad7dc2e02e808ed150296a109b586c34115a Mon Sep 17 00:00:00 2001
+From df96d6b61bb60f13cd3d4989d1afc56d705f4a33 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
-Subject: [PATCH 18/25] eglibc: Cross building and testing instructions
+Subject: [PATCH 18/26] eglibc: Cross building and testing instructions
 
 Ported from eglibc
 Upstream-Status: Pending
@@ -615,5 +615,5 @@ index 0000000..b67b468
 +  simply place copies of these libraries in the top GLIBC build
 +  directory.
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
index f983d86a90..f5921bb7be 100644
--- a/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,7 +1,7 @@
-From e881face7a10354612bf634b44e09e3bc6462c67 Mon Sep 17 00:00:00 2001
+From 2cb7e3cae4020f431d426ad1740bb25506cde899 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
-Subject: [PATCH 19/25] eglibc: Help bootstrap cross toolchain
+Subject: [PATCH 19/26] eglibc: Help bootstrap cross toolchain
 
 Taken from EGLIBC, r1484 + r1525
 
@@ -29,10 +29,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 include/stubs-bootstrap.h
 
 diff --git a/Makefile b/Makefile
-index 32748b3..6d055ba 100644
+index 1ae3281..26ab7bf 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -69,9 +69,18 @@ subdir-dirs = include
+@@ -70,9 +70,18 @@ subdir-dirs = include
  vpath %.h $(subdir-dirs)
  
  # What to install.
@@ -52,7 +52,7 @@ index 32748b3..6d055ba 100644
  ifeq (yes,$(build-shared))
  headers += gnu/lib-names.h
  endif
-@@ -151,6 +160,16 @@ others: $(common-objpfx)testrun.sh
+@@ -152,6 +161,16 @@ others: $(common-objpfx)testrun.sh
  
  subdir-stubs := $(foreach dir,$(subdirs),$(common-objpfx)$(dir)/stubs)
  
@@ -69,7 +69,7 @@ index 32748b3..6d055ba 100644
  ifndef abi-variants
  installed-stubs = $(inst_includedir)/gnu/stubs.h
  else
-@@ -177,6 +196,7 @@ $(inst_includedir)/gnu/stubs.h: $(+force)
+@@ -178,6 +197,7 @@ $(inst_includedir)/gnu/stubs.h: $(+force)
  
  install-others-nosubdir: $(installed-stubs)
  endif
@@ -96,5 +96,5 @@ index 0000000..1d2b669
 +   EGLIBC subdir 'stubs' make targets, on every .o file in EGLIBC, but
 +   an empty stubs.h like this will do fine for GCC.  */
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0020-eglibc-cherry-picked-from.patch b/meta/recipes-core/glibc/glibc/0020-eglibc-cherry-picked-from.patch
index 30c4c69877..43445739b1 100644
--- a/meta/recipes-core/glibc/glibc/0020-eglibc-cherry-picked-from.patch
+++ b/meta/recipes-core/glibc/glibc/0020-eglibc-cherry-picked-from.patch
@@ -1,7 +1,7 @@
-From 723a31d3e2627211b39fbcc08f75b3c23c4096c5 Mon Sep 17 00:00:00 2001
+From b2ed906ec864583b43379ef9ad2b5630c1232565 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 15:10:33 -0800
-Subject: [PATCH 20/25] eglibc: cherry-picked from
+Subject: [PATCH 20/26] eglibc: cherry-picked from
 
 http://www.eglibc.org/archives/patches/msg00772.html
 
@@ -60,5 +60,5 @@ index a4b376f..3256e12 100644
  			if (resp->nscount > 0)
  				__res_iclose (resp, true);
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0021-eglibc-Clear-cache-lines-on-ppc8xx.patch b/meta/recipes-core/glibc/glibc/0021-eglibc-Clear-cache-lines-on-ppc8xx.patch
index 8931c9e250..a9a73916f3 100644
--- a/meta/recipes-core/glibc/glibc/0021-eglibc-Clear-cache-lines-on-ppc8xx.patch
+++ b/meta/recipes-core/glibc/glibc/0021-eglibc-Clear-cache-lines-on-ppc8xx.patch
@@ -1,7 +1,7 @@
-From 9699873820d0347c2f377f0d86bce615d87a5e47 Mon Sep 17 00:00:00 2001
+From 000ab518aa1269714bc0a9a4633b0a538fae91d9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 15:15:09 -0800
-Subject: [PATCH 21/25] eglibc: Clear cache lines on ppc8xx
+Subject: [PATCH 21/26] eglibc: Clear cache lines on ppc8xx
 
 2007-06-13  Nathan Sidwell  <nathan@codesourcery.com>
             Mark Shinwell  <shinwell@codesourcery.com>
@@ -79,5 +79,5 @@ index 0efd297..8cc0ef8 100644
  	break;
  #ifndef SHARED
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0022-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0022-eglibc-Resolve-__fpscr_values-on-SH4.patch
index f53f5ff87c..c0cd5b0d12 100644
--- a/meta/recipes-core/glibc/glibc/0022-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0022-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,7 +1,7 @@
-From 8904f4249c930d187e19c7e9d3e73c835d11e18f Mon Sep 17 00:00:00 2001
+From a50c6e80543fb4cbc589978c11fe846bf4a94492 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
-Subject: [PATCH 22/25] eglibc: Resolve __fpscr_values on SH4
+Subject: [PATCH 22/26] eglibc: Resolve __fpscr_values on SH4
 
 2010-09-29  Nobuhiro Iwamatsu  <iwamatsu@nigauri.org>
             Andrew Stubbs  <ams@codesourcery.com>
@@ -52,5 +52,5 @@ index 0024d79..d1db7e4 100644
 +weak_alias (___fpscr_values, __fpscr_values)
 +
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0023-eglibc-Install-PIC-archives.patch b/meta/recipes-core/glibc/glibc/0023-eglibc-Install-PIC-archives.patch
index f985f3ca14..c3e571f8a9 100644
--- a/meta/recipes-core/glibc/glibc/0023-eglibc-Install-PIC-archives.patch
+++ b/meta/recipes-core/glibc/glibc/0023-eglibc-Install-PIC-archives.patch
@@ -1,7 +1,7 @@
-From 1947f211fab4001e84bb52868cddbd401e597889 Mon Sep 17 00:00:00 2001
+From 101568daf48d99e71b280a2fdd85460fe740d583 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:57:01 +0000
-Subject: [PATCH 23/25] eglibc: Install PIC archives
+Subject: [PATCH 23/26] eglibc: Install PIC archives
 
 Forward port from eglibc
 
@@ -29,10 +29,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 40 insertions(+), 2 deletions(-)
 
 diff --git a/Makerules b/Makerules
-index 53eabfa..1cd2a53 100644
+index 61a0240..373e628 100644
 --- a/Makerules
 +++ b/Makerules
-@@ -694,6 +694,9 @@ ifeq ($(build-shared),yes)
+@@ -762,6 +762,9 @@ ifeq ($(build-shared),yes)
  $(common-objpfx)libc.so: $(common-objpfx)libc.map
  endif
  common-generated += libc.so libc_pic.os
@@ -42,7 +42,7 @@ index 53eabfa..1cd2a53 100644
  ifdef libc.so-version
  $(common-objpfx)libc.so$(libc.so-version): $(common-objpfx)libc.so
  	$(make-link)
-@@ -936,6 +939,7 @@ endif
+@@ -1004,6 +1007,7 @@ endif
  
  install: check-install-supported
  
@@ -50,7 +50,7 @@ index 53eabfa..1cd2a53 100644
  install: $(installed-libcs)
  $(installed-libcs): $(inst_libdir)/lib$(libprefix)%: lib $(+force)
  	$(make-target-directory)
-@@ -964,6 +968,22 @@ versioned := $(strip $(foreach so,$(install-lib.so),\
+@@ -1032,6 +1036,22 @@ versioned := $(strip $(foreach so,$(install-lib.so),\
  install-lib.so-versioned := $(filter $(versioned), $(install-lib.so))
  install-lib.so-unversioned := $(filter-out $(versioned), $(install-lib.so))
  
@@ -73,7 +73,7 @@ index 53eabfa..1cd2a53 100644
  # For versioned libraries, we install three files:
  #	$(inst_libdir)/libfoo.so	-- for linking, symlink or ld script
  #	$(inst_slibdir)/libfoo.so.NN	-- for loading by SONAME, symlink
-@@ -1206,9 +1226,22 @@ $(addprefix $(inst_includedir)/,$(headers-nonh)): $(inst_includedir)/%: \
+@@ -1275,9 +1295,22 @@ $(addprefix $(inst_includedir)/,$(headers-nonh)): $(inst_includedir)/%: \
  endif	# headers-nonh
  endif	# headers
  
@@ -97,7 +97,7 @@ index 53eabfa..1cd2a53 100644
  install-bin-nosubdir: $(addprefix $(inst_bindir)/,$(install-bin))
  install-bin-script-nosubdir: $(addprefix $(inst_bindir)/,$(install-bin-script))
  install-rootsbin-nosubdir: \
-@@ -1221,6 +1254,10 @@ install-data-nosubdir: $(addprefix $(inst_datadir)/,$(install-data))
+@@ -1290,6 +1323,10 @@ install-data-nosubdir: $(addprefix $(inst_datadir)/,$(install-data))
  install-headers-nosubdir: $(addprefix $(inst_includedir)/,$(headers))
  install-others-nosubdir: $(install-others)
  install-others-programs-nosubdir: $(install-others-programs)
@@ -108,7 +108,7 @@ index 53eabfa..1cd2a53 100644
  
  # We need all the `-nosubdir' targets so that `install' in the parent
  # doesn't depend on several things which each iterate over the subdirs.
-@@ -1230,7 +1267,8 @@ install-%:: install-%-nosubdir ;
+@@ -1299,7 +1336,8 @@ install-%:: install-%-nosubdir ;
  
  .PHONY: install install-no-libc.a-nosubdir
  install-no-libc.a-nosubdir: install-headers-nosubdir install-data-nosubdir \
@@ -119,5 +119,5 @@ index 53eabfa..1cd2a53 100644
  install-no-libc.a-nosubdir: install-bin-nosubdir install-bin-script-nosubdir \
  			    install-rootsbin-nosubdir install-sbin-nosubdir \
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0024-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0024-eglibc-Forward-port-cross-locale-generation-support.patch
index c45b557ab7..3399890de1 100644
--- a/meta/recipes-core/glibc/glibc/0024-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0024-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,7 +1,7 @@
-From 11d7633178301add26a24657e2f1596a2f7dddce Mon Sep 17 00:00:00 2001
+From 82516e3ed372f618c886a2de4f9498f597aa8a8b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
-Subject: [PATCH 24/25] eglibc: Forward port cross locale generation support
+Subject: [PATCH 24/26] eglibc: Forward port cross locale generation support
 
 Upstream-Status: Pending
 
@@ -91,7 +91,7 @@ index 0000000..9fad357
 +    [LC_ALL] = sizeof ("LC_ALL") - 1
 +  };
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index 94627f3..d0db77b 100644
+index 1f4da92..7f68935 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
 @@ -224,7 +224,7 @@ __libc_tsd_define (extern, __locale_t, LOCALE)
@@ -363,10 +363,10 @@ index b885f65..0afb631 100644
    size_t bufmax = 56;
  
 diff --git a/locale/programs/localedef.c b/locale/programs/localedef.c
-index 6becd9a..8ddd080 100644
+index b4c48f1..ed08d48 100644
 --- a/locale/programs/localedef.c
 +++ b/locale/programs/localedef.c
-@@ -114,6 +114,7 @@ void (*argp_program_version_hook) (FILE *, struct argp_state *) = print_version;
+@@ -108,6 +108,7 @@ void (*argp_program_version_hook) (FILE *, struct argp_state *) = print_version;
  #define OPT_LIST_ARCHIVE 309
  #define OPT_LITTLE_ENDIAN 400
  #define OPT_BIG_ENDIAN 401
@@ -374,7 +374,7 @@ index 6becd9a..8ddd080 100644
  
  /* Definitions of arguments for argp functions.  */
  static const struct argp_option options[] =
-@@ -150,6 +151,8 @@ static const struct argp_option options[] =
+@@ -143,6 +144,8 @@ static const struct argp_option options[] =
      N_("Generate little-endian output") },
    { "big-endian", OPT_BIG_ENDIAN, NULL, 0,
      N_("Generate big-endian output") },
@@ -383,7 +383,7 @@ index 6becd9a..8ddd080 100644
    { NULL, 0, NULL, 0, NULL }
  };
  
-@@ -239,12 +242,14 @@ main (int argc, char *argv[])
+@@ -232,12 +235,14 @@ main (int argc, char *argv[])
       ctype locale.  (P1003.2 4.35.5.2)  */
    setlocale (LC_CTYPE, "POSIX");
  
@@ -398,7 +398,7 @@ index 6becd9a..8ddd080 100644
  
    /* Process charmap file.  */
    charmap = charmap_read (charmap_file, verbose, 1, be_quiet, 1);
-@@ -338,6 +343,9 @@ parse_opt (int key, char *arg, struct argp_state *state)
+@@ -328,6 +333,9 @@ parse_opt (int key, char *arg, struct argp_state *state)
      case OPT_BIG_ENDIAN:
        set_big_endian (true);
        break;
@@ -562,5 +562,5 @@ index 69b3141..1cef0be 100644
  # define WEAK_POSTLOAD(postload) weak_extern (postload)
  #else
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0025-Define-DUMMY_LOCALE_T-if-not-defined.patch b/meta/recipes-core/glibc/glibc/0025-Define-DUMMY_LOCALE_T-if-not-defined.patch
index 9d60d02828..1f0f5d4da2 100644
--- a/meta/recipes-core/glibc/glibc/0025-Define-DUMMY_LOCALE_T-if-not-defined.patch
+++ b/meta/recipes-core/glibc/glibc/0025-Define-DUMMY_LOCALE_T-if-not-defined.patch
@@ -1,7 +1,7 @@
-From 89ec25290d34413ce5c8ba6c378e31dbae3a37c0 Mon Sep 17 00:00:00 2001
+From c2d8cdeab116caacdfedb35eeb3e743b44807bec Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 20 Apr 2016 21:11:00 -0700
-Subject: [PATCH 25/25] Define DUMMY_LOCALE_T if not defined
+Subject: [PATCH 25/26] Define DUMMY_LOCALE_T if not defined
 
 This is a hack to fix building the locale bits on an older
 CentOs 5.X machine
@@ -28,5 +28,5 @@ index f606365..0e5f8c3 100644
  #define PACKAGE _libc_intl_domainname
  #ifndef VERSION
 -- 
-2.8.2
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0026-build_local_scope.patch b/meta/recipes-core/glibc/glibc/0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
similarity index 88%
rename from meta/recipes-core/glibc/glibc/0026-build_local_scope.patch
rename to meta/recipes-core/glibc/glibc/0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
index 8e0cb83194..852f5304ce 100644
--- a/meta/recipes-core/glibc/glibc/0026-build_local_scope.patch
+++ b/meta/recipes-core/glibc/glibc/0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch
@@ -1,7 +1,7 @@
-From 6e4ec5a3c5fe63b6458036f18d43124de4a7e724 Mon Sep 17 00:00:00 2001
+From fb315c197cca61299a6f6588ea3460145c255d06 Mon Sep 17 00:00:00 2001
 From: Mark Hatle <mark.hatle@windriver.com>
 Date: Thu, 18 Aug 2016 14:07:58 -0500
-Subject: [PATCH] elf/dl-deps.c: Make _dl_build_local_scope breadth first
+Subject: [PATCH 26/26] elf/dl-deps.c: Make _dl_build_local_scope breadth first
 
 According to the ELF specification:
 
@@ -24,7 +24,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  1 file changed, 10 insertions(+), 4 deletions(-)
 
 diff --git a/elf/dl-deps.c b/elf/dl-deps.c
-index 6a82987..fc37c87 100644
+index 6a82987..53be824 100644
 --- a/elf/dl-deps.c
 +++ b/elf/dl-deps.c
 @@ -73,13 +73,19 @@ _dl_build_local_scope (struct link_map **list, struct link_map *map)
@@ -52,5 +52,5 @@ index 6a82987..fc37c87 100644
  }
  
 -- 
-2.5.5
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0027-arm-mark-__startcontext-as-.cantunwind-bug-20435.patch b/meta/recipes-core/glibc/glibc/0027-arm-mark-__startcontext-as-.cantunwind-bug-20435.patch
deleted file mode 100644
index 95067d37a5..0000000000
--- a/meta/recipes-core/glibc/glibc/0027-arm-mark-__startcontext-as-.cantunwind-bug-20435.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Backport patch to fix CVE-2016-6323 for glibc. And remove the section of
-ChangeLog which can't be applied.
-
-Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=9e2ff6c]
-CVE: CVE-2016-6323
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From 9e2ff6c9cc54c0b4402b8d49e4abe7000fde7617 Mon Sep 17 00:00:00 2001
-From: Andreas Schwab <schwab@suse.de>
-Date: Mon, 8 Aug 2016 09:29:18 +0200
-Subject: [PATCH] arm: mark __startcontext as .cantunwind (bug 20435)
-
-__startcontext marks the bottom of the call stack of the contexts created
-by makecontext.
----
- ChangeLog                                | 6 ++++++
- sysdeps/unix/sysv/linux/arm/setcontext.S | 7 +++++++
- 2 files changed, 13 insertions(+)
-
-diff --git a/sysdeps/unix/sysv/linux/arm/setcontext.S b/sysdeps/unix/sysv/linux/arm/setcontext.S
-index 603e508..d1f168f 100644
---- a/sysdeps/unix/sysv/linux/arm/setcontext.S
-+++ b/sysdeps/unix/sysv/linux/arm/setcontext.S
-@@ -86,12 +86,19 @@ weak_alias(__setcontext, setcontext)
- 
- 	/* Called when a makecontext() context returns.  Start the
- 	   context in R4 or fall through to exit().  */
-+	/* Unwind descriptors are looked up based on PC - 2, so we have to
-+	   make sure to mark the instruction preceding the __startcontext
-+	   label as .cantunwind.  */
-+	.fnstart
-+	.cantunwind
-+	nop
- ENTRY(__startcontext)
- 	movs    r0, r4
- 	bne     PLTJMP(__setcontext)
- 
- 	@ New context was 0 - exit
- 	b       PLTJMP(HIDDEN_JUMPTARGET(exit))
-+	.fnend
- END(__startcontext)
- 
- #ifdef PIC
--- 
-2.10.1
-
diff --git a/meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch b/meta/recipes-core/glibc/glibc/0027-locale-fix-hard-coded-reference-to-gcc-E.patch
similarity index 86%
rename from meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch
rename to meta/recipes-core/glibc/glibc/0027-locale-fix-hard-coded-reference-to-gcc-E.patch
index d5fce7371b..71c0bdcaea 100644
--- a/meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-gcc-E.patch
+++ b/meta/recipes-core/glibc/glibc/0027-locale-fix-hard-coded-reference-to-gcc-E.patch
@@ -1,30 +1,29 @@
-From 2c0ab83eb54c0e0fccbf261726dc03803b236079 Mon Sep 17 00:00:00 2001
+From a2fc86cb8d0366171f100ebd033aeb9609fa40de Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
 Date: Mon, 22 Aug 2016 16:09:25 +0200
-Subject: [PATCH] locale: fix hard-coded reference to gcc -E
+Subject: [PATCH 27/27] locale: fix hard-coded reference to gcc -E
 
-When new version of compilers are published, they may not be compatible with 
+When new version of compilers are published, they may not be compatible with
 older versions of software. This is particularly common when software is built
 with -Werror.
 
 Autotools provides a way for a user to specify the name of his compiler using a
 set of variables ($CC $CXX $CPP etc.). Those variables are used correctly when
 compiling glibc but the script used to generate transliterations in the locale/
-subdirectory directly calls the gcc binary to get the output of the 
-preprocessor instead of using the $CPP variable provided by the build 
-environment. 
+subdirectory directly calls the gcc binary to get the output of the
+preprocessor instead of using the $CPP variable provided by the build
+environment.
 
 This patch replaces the hard-coded reference to the gcc binary with the proper
 environment variable, thus allowing a user to override it.
 
 Upstream-Status : Submitted [https://sourceware.org/ml/libc-alpha/2016-08/msg00746.html]
-
 ---
  locale/gen-translit.pl | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/locale/gen-translit.pl b/locale/gen-translit.pl
-index 30d3f2f..7b287fa 100644
+index 30d3f2f..e976530 100644
 --- a/locale/gen-translit.pl
 +++ b/locale/gen-translit.pl
 @@ -1,5 +1,5 @@
@@ -35,5 +34,5 @@ index 30d3f2f..7b287fa 100644
  
  sub cstrlen {
 -- 
-2.9.3
+2.10.2
 
diff --git a/meta/recipes-core/glibc/glibc/0028-Revert-Check-IFUNC-definition-in-unrelocated-shared-.patch b/meta/recipes-core/glibc/glibc/0028-Revert-Check-IFUNC-definition-in-unrelocated-shared-.patch
new file mode 100644
index 0000000000..8c146c0f60
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0028-Revert-Check-IFUNC-definition-in-unrelocated-shared-.patch
@@ -0,0 +1,98 @@
+From ee65c9dde382e0235b6b53fa847b23d0097f554f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 12 Jan 2017 12:13:32 -0800
+Subject: [PATCH 28/28] Revert "Check IFUNC definition in unrelocated shared
+ library [BZ #20019]"
+
+This reverts commit 0e6d3adc60d8073397af6a320e594d98d7fbedde.
+
+Causes regression in OE a new tracker to fix it has been opened
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=21041
+---
+Upstream-Status: Inappropriate
+
+ ChangeLog                   |  7 -------
+ sysdeps/i386/dl-machine.h   | 18 +-----------------
+ sysdeps/x86_64/dl-machine.h | 18 +-----------------
+ 3 files changed, 2 insertions(+), 41 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index f06c02a3c6..11d718d561 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -4396,13 +4396,6 @@
+ 
+ 	* math/test-nan-overflow.c: Include stdlib.h for malloc.
+ 
+-2016-10-28  H.J. Lu  <hongjiu.lu@intel.com>
+-
+-	[BZ #20019]
+-	* sysdeps/i386/dl-machine.h (elf_machine_rel): Check IFUNC
+-	definition in unrelocated shared library.
+-	* sysdeps/x86_64/dl-machine.h (elf_machine_rela): Likewise.
+-
+ 2016-10-28  Florian Weimer  <fweimer@redhat.com>
+ 
+ 	[BZ #20729]
+diff --git a/sysdeps/i386/dl-machine.h b/sysdeps/i386/dl-machine.h
+index 6eca69d567..a9edb41aa6 100644
+--- a/sysdeps/i386/dl-machine.h
++++ b/sysdeps/i386/dl-machine.h
+@@ -321,23 +321,7 @@ elf_machine_rel (struct link_map *map, const Elf32_Rel *reloc,
+ 			       0)
+ 	  && __builtin_expect (sym->st_shndx != SHN_UNDEF, 1)
+ 	  && __builtin_expect (!skip_ifunc, 1))
+-	{
+-# ifndef RTLD_BOOTSTRAP
+-	  if (sym_map != map
+-	      && sym_map->l_type != lt_executable
+-	      && !sym_map->l_relocated)
+-	    {
+-	      const char *strtab
+-		= (const char *) D_PTR (map, l_info[DT_STRTAB]);
+-	      _dl_fatal_printf ("\
+-%s: Relink `%s' with `%s' for IFUNC symbol `%s'\n",
+-				RTLD_PROGNAME, map->l_name,
+-				sym_map->l_name,
+-				strtab + refsym->st_name);
+-	    }
+-# endif
+-	  value = ((Elf32_Addr (*) (void)) value) ();
+-	}
++	value = ((Elf32_Addr (*) (void)) value) ();
+ 
+       switch (r_type)
+ 	{
+diff --git a/sysdeps/x86_64/dl-machine.h b/sysdeps/x86_64/dl-machine.h
+index 3e7ae22c67..b3eb33f036 100644
+--- a/sysdeps/x86_64/dl-machine.h
++++ b/sysdeps/x86_64/dl-machine.h
+@@ -331,23 +331,7 @@ elf_machine_rela (struct link_map *map, const ElfW(Rela) *reloc,
+ 			       0)
+ 	  && __builtin_expect (sym->st_shndx != SHN_UNDEF, 1)
+ 	  && __builtin_expect (!skip_ifunc, 1))
+-	{
+-# ifndef RTLD_BOOTSTRAP
+-	  if (sym_map != map
+-	      && sym_map->l_type != lt_executable
+-	      && !sym_map->l_relocated)
+-	    {
+-	      const char *strtab
+-		= (const char *) D_PTR (map, l_info[DT_STRTAB]);
+-	      _dl_fatal_printf ("\
+-%s: Relink `%s' with `%s' for IFUNC symbol `%s'\n",
+-				RTLD_PROGNAME, map->l_name,
+-				sym_map->l_name,
+-				strtab + refsym->st_name);
+-	    }
+-# endif
+-	  value = ((ElfW(Addr) (*) (void)) value) ();
+-	}
++	value = ((ElfW(Addr) (*) (void)) value) ();
+ 
+       switch (r_type)
+ 	{
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.25.bb
similarity index 92%
rename from meta/recipes-core/glibc/glibc_2.24.bb
rename to meta/recipes-core/glibc/glibc_2.25.bb
index 475c13339a..a21fee0a1c 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.25.bb
@@ -7,14 +7,19 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 DEPENDS += "gperf-native"
 
-SRCREV ?= "ea23815a795f72035262953dad5beb03e09c17dd"
+SRCREV ?= "bb440151433f0298e7a6786ccd30cd084812f897"
 
-SRCBRANCH ?= "release/${PV}/master"
+#SRCBRANCH ?= "release/${PV}/master"
+SRCBRANCH ?= "master"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
+           file://etc/ld.so.conf \
+           file://generate-supported.mk \
+           \
+           ${NATIVESDKFIXES} \
            file://0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
            file://0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
            file://0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch \
@@ -36,17 +41,13 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-eglibc-Install-PIC-archives.patch \
            file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
-           file://0026-build_local_scope.patch \
-           file://0027-arm-mark-__startcontext-as-.cantunwind-bug-20435.patch \
+           file://0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
+           file://0027-locale-fix-hard-coded-reference-to-gcc-E.patch \
+           file://0028-Revert-Check-IFUNC-definition-in-unrelocated-shared-.patch \
 "
 
-SRC_URI += "\
-           file://etc/ld.so.conf \
-           file://generate-supported.mk \
-           file://0001-locale-fix-hard-coded-reference-to-gcc-E.patch \
-           "
-
-SRC_URI_append_class-nativesdk = "\
+NATIVESDKFIXES ?= ""
+NATIVESDKFIXES_class-nativesdk = "\
            file://0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch \
            file://0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch \
            file://0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch \
-- 
2.11.0


