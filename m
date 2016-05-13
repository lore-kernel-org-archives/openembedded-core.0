Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id A7C17738AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 16:47:02 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id gh9so8902954pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 09:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zkN+xWhAiBBA6o1uf8UXeOWZAy1wc/l/26eyCKq9TJQ=;
	b=iuF49UywH5jeIgzByGpQ2tm4mRZ6djxolnAl1xuuPw6P4qWNOSrbSPixHXxyUJS+2x
	g52ucmv8pwrDaZ7oLtOMXK0YMa1K7lfPd2jQ3aYckNld7LHnj3BHILfl0DvuCtIMe1zV
	dRho3TjhrHT2OctQdgP1pG+scrH0/hcxUZ0YWlFTwpE9CIP8CySnA3bsgykBkmKRKC1k
	ZGL2/UxkmY2sSwq+qNC0lwbxU0RJg+nCy6lo/1xUuFNHr5K5Db0TQPf3fxtDuUr4/x2M
	/IctvPPOVYZbicciu/FdKiStXbRYr27/t6leJE6Fi1DkVQ286tru7cqBQG/vTbUJmVeB
	oldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zkN+xWhAiBBA6o1uf8UXeOWZAy1wc/l/26eyCKq9TJQ=;
	b=j4DX9jHcgDoHvTS71xGcHJ9Z/LwtURkcrjDf95BNKdxmPQSW0PeDI3D/bQRkD66V+H
	evHD70RbI+xc2soap7bzVWkGm18MBrRa5U4LQEivv3xiBr5t/l1XJRFzXWOnLNdRxdVS
	u4VEj+ZJEWSzhRyEvNlLDyCn9B4S8KFcGjIIwivZ4WJYHzZpiCmEZwsIAtw6V4JLDCqt
	3vH/zseYgK4X6f44cllKxJPFmWxcHlxyUXaho89SjQEruZTkDRLj5NfrbSEyLYtHp+BJ
	TnWhzBss6E47+nWux9v+4fVdYApA3Fmi78cJn6yrDth6G2cszDgt/Vhz0ptPomz9F+ju
	G+EQ==
X-Gm-Message-State: AOPr4FXXqwNlvgZngwawPsAaZ1IwQm+k2eruOorO5E6uPm1wPtKU0vdGhlctedcvnMlprg==
X-Received: by 10.66.246.71 with SMTP id xu7mr24340538pac.17.1463158022858;
	Fri, 13 May 2016 09:47:02 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	uw2sm28725174pac.10.2016.05.13.09.47.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 09:47:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 09:46:49 -0700
Message-Id: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <cover.1463157783.git.raj.khem@gmail.com>
References: <cover.1463157783.git.raj.khem@gmail.com>
Subject: [PATCH 1/6] glibc: Add recipes for 2.24 release
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
X-List-Received-Date: Fri, 13 May 2016 16:47:07 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../fix_for_centos_5.8.patch                       | 18 --------
 ...tive_2.23.bb => cross-localedef-native_2.24.bb} | 18 ++++----
 ...glibc-initial_2.23.bb => glibc-initial_2.24.bb} |  0
 .../{glibc-locale_2.23.bb => glibc-locale_2.24.bb} |  0
 .../{glibc-mtrace_2.23.bb => glibc-mtrace_2.24.bb} |  0
 ...glibc-scripts_2.23.bb => glibc-scripts_2.24.bb} |  0
 ...libc-Look-for-host-system-ld.so.cache-as-.patch |  8 ++--
 ...libc-Fix-buffer-overrun-with-a-relocated-.patch |  8 ++--
 ...libc-Raise-the-size-of-arrays-containing-.patch | 34 ++++++---------
 ...ivesdk-glibc-Allow-64-bit-atomics-for-x86.patch | 10 +++--
 ...500-e5500-e6500-603e-fsqrt-implementation.patch |  6 +--
 ...-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch |  8 ++--
 ...-Fix-undefined-reference-to-__sqrt_finite.patch |  6 +--
 ...qrt-f-are-now-inline-functions-and-call-o.patch |  6 +--
 ...bug-1443-which-explains-what-the-patch-do.patch |  8 ++--
 ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch | 10 ++---
 ...qrt-f-are-now-inline-functions-and-call-o.patch |  6 +--
 ...ersion-output-matching-grok-gold-s-output.patch | 14 +++----
 ...-configure.ac-handle-correctly-libc_cv_ro.patch |  6 +--
 .../glibc/glibc/0014-Add-unused-attribute.patch    |  8 ++--
 ...thin-the-path-sets-wrong-config-variables.patch | 10 ++---
 ...-timezone-re-written-tzselect-as-posix-sh.patch | 16 ++++----
 ...move-bash-dependency-for-nscd-init-script.patch |  8 ++--
 ...c-Cross-building-and-testing-instructions.patch |  6 +--
 ...019-eglibc-Help-bootstrap-cross-toolchain.patch |  8 ++--
 .../glibc/0020-eglibc-cherry-picked-from.patch     | 18 ++++----
 .../0021-eglibc-Clear-cache-lines-on-ppc8xx.patch  | 10 ++---
 ...0022-eglibc-Resolve-__fpscr_values-on-SH4.patch |  8 ++--
 .../glibc/0023-eglibc-Install-PIC-archives.patch   |  8 ++--
 ...ard-port-cross-locale-generation-support.patch} | 30 +++++++-------
 ...0025-Define-DUMMY_LOCALE_T-if-not-defined.patch | 32 +++++++++++++++
 ...ing-SSE-make-sure-fpmath-is-not-set-to-us.patch | 48 ----------------------
 .../glibc/{glibc_2.23.bb => glibc_2.24.bb}         | 12 +++---
 33 files changed, 171 insertions(+), 217 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/cross-localedef-native/fix_for_centos_5.8.patch
 rename meta/recipes-core/glibc/{cross-localedef-native_2.23.bb => cross-localedef-native_2.24.bb} (84%)
 rename meta/recipes-core/glibc/{glibc-initial_2.23.bb => glibc-initial_2.24.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-locale_2.23.bb => glibc-locale_2.24.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.23.bb => glibc-mtrace_2.24.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.23.bb => glibc-scripts_2.24.bb} (100%)
 rename meta/recipes-core/glibc/glibc/{0025-eglibc-Forward-port-cross-locale-generation-support.patch => 0024-eglibc-Forward-port-cross-locale-generation-support.patch} (97%)
 create mode 100644 meta/recipes-core/glibc/glibc/0025-Define-DUMMY_LOCALE_T-if-not-defined.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-When-disabling-SSE-make-sure-fpmath-is-not-set-to-us.patch
 rename meta/recipes-core/glibc/{glibc_2.23.bb => glibc_2.24.bb} (93%)

diff --git a/meta/recipes-core/glibc/cross-localedef-native/fix_for_centos_5.8.patch b/meta/recipes-core/glibc/cross-localedef-native/fix_for_centos_5.8.patch
deleted file mode 100644
index 186a480..0000000
--- a/meta/recipes-core/glibc/cross-localedef-native/fix_for_centos_5.8.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Inappropriate [other]
-
-This is a hack to fix building the locale bits on an older
-CentOs 5.X machine
-
-Index: git/locale/programs/config.h
-===================================================================
---- git/locale/programs/config.h
-+++ git.orig/locale/programs/config.h
-@@ -19,6 +19,8 @@
- #ifndef _LD_CONFIG_H
- #define _LD_CONFIG_H	1
- 
-+#define DUMMY_LOCALE_T
-+
- /* Use the internal textdomain used for libc messages.  */
- #define PACKAGE _libc_intl_domainname
- #ifndef VERSION
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.23.bb b/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
similarity index 84%
rename from meta/recipes-core/glibc/cross-localedef-native_2.23.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.24.bb
index a6795ed..79c3132 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.23.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.24.bb
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-
 # Tell autotools that we're working in the localedef directory
 #
 AUTOTOOLS_SCRIPT_PATH = "${S}/localedef"
@@ -18,16 +17,16 @@ inherit autotools
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
-SRCBRANCH ?= "release/${PV}/master"
+#SRCBRANCH ?= "release/${PV}/master"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
+SRCBRANCH ?= "master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
+SRCREV_glibc ?= "1ac3eaa6bcc473a56340c24511786ff48a91293e"
+SRCREV_localedef ?= "29869b6dc11427c5bab839bdb155c85a7c644c71"
+
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
-           file://fix_for_centos_5.8.patch \
-           ${EGLIBCPATCHES} \
-"
-EGLIBCPATCHES = "\
            file://0016-timezone-re-written-tzselect-as-posix-sh.patch \
            file://0017-Remove-bash-dependency-for-nscd-init-script.patch \
            file://0018-eglibc-Cross-building-and-testing-instructions.patch \
@@ -36,12 +35,9 @@ EGLIBCPATCHES = "\
            file://0021-eglibc-Clear-cache-lines-on-ppc8xx.patch \
            file://0022-eglibc-Resolve-__fpscr_values-on-SH4.patch \
            file://0023-eglibc-Install-PIC-archives.patch \
-           file://0025-eglibc-Forward-port-cross-locale-generation-support.patch \
+           file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
+           file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
 "
-
-SRCREV_glibc ?= "e742928c1592b43db6809db4f39e67be151cdd27"
-SRCREV_localedef ?= "5a81ff9f06a7a808d4c3d37bbf34077a4c5902ed"
-
 # Makes for a rather long rev (22 characters), but...
 #
 SRCREV_FORMAT = "glibc_localedef"
diff --git a/meta/recipes-core/glibc/glibc-initial_2.23.bb b/meta/recipes-core/glibc/glibc-initial_2.24.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-initial_2.23.bb
rename to meta/recipes-core/glibc/glibc-initial_2.24.bb
diff --git a/meta/recipes-core/glibc/glibc-locale_2.23.bb b/meta/recipes-core/glibc/glibc-locale_2.24.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.23.bb
rename to meta/recipes-core/glibc/glibc-locale_2.24.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.23.bb b/meta/recipes-core/glibc/glibc-mtrace_2.24.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.23.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.24.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.23.bb b/meta/recipes-core/glibc/glibc-scripts_2.24.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.23.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.24.bb
diff --git a/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index 97c2800..ca33758 100644
--- a/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,7 +1,7 @@
-From 66d04e2cd8badb0984050e4e9f2732f47151fbbf Mon Sep 17 00:00:00 2001
+From 7e11aafc3a7cb873b3f648740c8acd379597e4d1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:48:24 +0000
-Subject: [PATCH 01/24] nativesdk-glibc: Look for host system ld.so.cache as
+Subject: [PATCH 01/25] nativesdk-glibc: Look for host system ld.so.cache as
  well
 
 Upstream-Status: Inappropriate [embedded specific]
@@ -31,7 +31,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 6fb615e..ee3d1e6 100644
+index c0d6249..2c73105 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -2094,6 +2094,14 @@ _dl_map_object (struct link_map *loader, const char *name,
@@ -65,5 +65,5 @@ index 6fb615e..ee3d1e6 100644
        if (__glibc_unlikely (GLRO(dl_debug_mask) & DL_DEBUG_LIBS))
  	_dl_debug_printf ("\n");
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index 473b894..5428468 100644
--- a/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,7 +1,7 @@
-From 179dc5f1e13c3ff96d5f21a2a78c089cf120ceb8 Mon Sep 17 00:00:00 2001
+From 5fd884dc28d5d84001fae8ffdd8be698bb84143e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
-Subject: [PATCH 02/24] nativesdk-glibc: Fix buffer overrun with a relocated
+Subject: [PATCH 02/25] nativesdk-glibc: Fix buffer overrun with a relocated
  SDK
 
 When ld-linux-*.so.2 is relocated to a path that is longer than the
@@ -22,7 +22,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index ee3d1e6..c4a42e9 100644
+index 2c73105..c7b8797 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -1793,7 +1793,19 @@ open_path (const char *name, size_t namelen, int mode,
@@ -46,5 +46,5 @@ index ee3d1e6..c4a42e9 100644
      {
        struct r_search_path_elem *this_dir = *dirs;
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index 60f9f17..23b9fcb 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,7 +1,7 @@
-From e76048898ae9aa49dc70d6f9b1bbc22082e61fe3 Mon Sep 17 00:00:00 2001
+From c99892f2018cd7fa0f37b53e6cebec99fa036472 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
-Subject: [PATCH 03/24] nativesdk-glibc: Raise the size of arrays containing dl
+Subject: [PATCH 03/25] nativesdk-glibc: Raise the size of arrays containing dl
  paths
 
 This patch puts the dynamic loader path in the binaries, SYSTEM_DIRS strings
@@ -25,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  6 files changed, 13 insertions(+), 9 deletions(-)
 
 diff --git a/elf/dl-cache.c b/elf/dl-cache.c
-index dec49bc..862f1d8 100644
+index cfa335e..daa12ec 100644
 --- a/elf/dl-cache.c
 +++ b/elf/dl-cache.c
 @@ -132,6 +132,10 @@ do									      \
@@ -40,7 +40,7 @@ index dec49bc..862f1d8 100644
  internal_function
  _dl_cache_libcmp (const char *p1, const char *p2)
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index c4a42e9..acf6c03 100644
+index c7b8797..37a1beb 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -106,8 +106,8 @@ static size_t max_capstrlen attribute_relro;
@@ -55,7 +55,7 @@ index c4a42e9..acf6c03 100644
    SYSTEM_DIRS_LEN
  };
 diff --git a/elf/interp.c b/elf/interp.c
-index 422ea95e..6d61a36 100644
+index 9448802..e7e8c70 100644
 --- a/elf/interp.c
 +++ b/elf/interp.c
 @@ -18,5 +18,5 @@
@@ -66,10 +66,10 @@ index 422ea95e..6d61a36 100644
 +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
    = RUNTIME_LINKER;
 diff --git a/elf/ldconfig.c b/elf/ldconfig.c
-index f54ec22..0e78a83 100644
+index 467ca82..631a2a9 100644
 --- a/elf/ldconfig.c
 +++ b/elf/ldconfig.c
-@@ -167,6 +167,9 @@ static struct argp argp =
+@@ -168,6 +168,9 @@ static struct argp argp =
    options, parse_opt, NULL, doc, NULL, more_help, NULL
  };
  
@@ -80,7 +80,7 @@ index f54ec22..0e78a83 100644
     a platform.  */
  static int
 diff --git a/elf/rtld.c b/elf/rtld.c
-index 52160df..80f0582 100644
+index 647661c..4e16a43 100644
 --- a/elf/rtld.c
 +++ b/elf/rtld.c
 @@ -99,6 +99,7 @@ uintptr_t __pointer_chk_guard_local
@@ -107,7 +107,7 @@ index 52160df..80f0582 100644
        ++_dl_skip_args;
        --_dl_argc;
 diff --git a/sysdeps/generic/dl-cache.h b/sysdeps/generic/dl-cache.h
-index 70d4aeb..5c726d0 100644
+index eb2f900..505804e 100644
 --- a/sysdeps/generic/dl-cache.h
 +++ b/sysdeps/generic/dl-cache.h
 @@ -27,10 +27,6 @@
@@ -121,16 +121,6 @@ index 70d4aeb..5c726d0 100644
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
+-- 
+2.8.2
+
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index 21f04a1..3127de6 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -1,7 +1,7 @@
-From 2e1638115f0f924ee8235eee9265047054c15cfd Mon Sep 17 00:00:00 2001
+From a56e7aa2fd10b178b9498f88a7a2ca8aad671a53 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:35:35 -0800
-Subject: [PATCH 04/24] nativesdk-glibc: Allow 64 bit atomics for x86
+Subject: [PATCH 04/25] nativesdk-glibc: Allow 64 bit atomics for x86
 
 The fix consist of allowing 64bit atomic ops for x86.
 This should be safe for i586 and newer CPUs.
@@ -11,11 +11,13 @@ Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  sysdeps/i386/atomic-machine.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sysdeps/i386/atomic-machine.h b/sysdeps/i386/atomic-machine.h
-index 59f3d34..6f6b7ff 100644
+index ce62b33..4fe44ea 100644
 --- a/sysdeps/i386/atomic-machine.h
 +++ b/sysdeps/i386/atomic-machine.h
 @@ -54,7 +54,7 @@ typedef uintmax_t uatomic_max_t;
@@ -28,5 +30,5 @@ index 59f3d34..6f6b7ff 100644
  
  
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch b/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
index ba8c92e..dc0dfad 100644
--- a/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
+++ b/meta/recipes-core/glibc/glibc/0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
@@ -1,7 +1,7 @@
-From 7ff57edfe24b4243373fcb896ee0b613938c1ec9 Mon Sep 17 00:00:00 2001
+From 450473ce27b47cebec2c5c5b611a8c8bed41e6e8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:01:50 +0000
-Subject: [PATCH 05/24] fsl e500/e5500/e6500/603e fsqrt implementation
+Subject: [PATCH 05/25] fsl e500/e5500/e6500/603e fsqrt implementation
 
 Upstream-Status: Pending
 Signed-off-by: Edmar Wienskoski <edmar@freescale.com>
@@ -1580,5 +1580,5 @@ index 0000000..04ff8cc
 @@ -0,0 +1 @@
 +powerpc/powerpc64/e6500/fpu
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch b/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
index 086a73d..f267f66 100644
--- a/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
+++ b/meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
@@ -1,7 +1,7 @@
-From 61129ef3ee735b300604f75d50e01cb29f4387f4 Mon Sep 17 00:00:00 2001
+From bb065b78e9e0d3301e64a26e37550a657c885ebc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:11:22 +0000
-Subject: [PATCH 06/24] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known
+Subject: [PATCH 06/25] readlib: Add OECORE_KNOWN_INTERPRETER_NAMES to known
  names
 
 This bolts in a hook for OE to pass its own version of interpreter
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/elf/readlib.c b/elf/readlib.c
-index 7fd5b8a..2f5da9f 100644
+index 8a66ffe..08d56fc 100644
 --- a/elf/readlib.c
 +++ b/elf/readlib.c
 @@ -51,6 +51,7 @@ static struct known_names interpreters[] =
@@ -29,5 +29,5 @@ index 7fd5b8a..2f5da9f 100644
  
  static struct known_names known_libs[] =
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch b/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
index 952784b..612e892 100644
--- a/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
+++ b/meta/recipes-core/glibc/glibc/0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
@@ -1,7 +1,7 @@
-From f936548decac99501f9a4c522a3211d16542fa49 Mon Sep 17 00:00:00 2001
+From 4a91bbdb11a15f93094695bba4e0849c421fad48 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:15:07 +0000
-Subject: [PATCH 07/24] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
+Subject: [PATCH 07/25] ppc/sqrt: Fix undefined reference to `__sqrt_finite'
 
 on ppc fixes the errors like below
 | ./.libs/libpulsecore-1.1.so: undefined reference to `__sqrt_finite'
@@ -204,5 +204,5 @@ index 26fa067..9d17512 100644
  }
 +strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index 8d513ab..9e222b7 100644
--- a/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,7 +1,7 @@
-From d02704895fdce917e337619a4414042f63edd88b Mon Sep 17 00:00:00 2001
+From ce2746a1560b4430d89d114e1b65c7be225b4c2a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:16:38 +0000
-Subject: [PATCH 08/24] __ieee754_sqrt{,f} are now inline functions and call
+Subject: [PATCH 08/25] __ieee754_sqrt{,f} are now inline functions and call
  out __slow versions
 
 Upstream-Status: Pending
@@ -383,5 +383,5 @@ index 9d17512..10de1f0 100644
 +
  strong_alias (__ieee754_sqrtf, __sqrtf_finite)
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch b/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
index 12f24fb..7aa74df 100644
--- a/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
+++ b/meta/recipes-core/glibc/glibc/0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
@@ -1,7 +1,7 @@
-From 502f061d846e58aac7aca67e4e0d6ba9e0763b17 Mon Sep 17 00:00:00 2001
+From 1b61649e545de76dd79a5e2c39bb16d0c4623160 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:20:09 +0000
-Subject: [PATCH 09/24] Quote from bug 1443 which explains what the patch does
+Subject: [PATCH 09/25] Quote from bug 1443 which explains what the patch does
  :
 
   We build some random program and link it with -lust.  When we run it,
@@ -45,7 +45,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sysdeps/arm/dl-machine.h b/sysdeps/arm/dl-machine.h
-index 6fb20bd..8805537 100644
+index 60eee00..7d54d5e 100644
 --- a/sysdeps/arm/dl-machine.h
 +++ b/sysdeps/arm/dl-machine.h
 @@ -499,7 +499,7 @@ elf_machine_rel (struct link_map *map, const Elf32_Rel *reloc,
@@ -58,5 +58,5 @@ index 6fb20bd..8805537 100644
  
  	case R_ARM_TLS_TPOFF32:
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch b/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
index 77bd7d1..14963a3 100644
--- a/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
+++ b/meta/recipes-core/glibc/glibc/0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
@@ -1,7 +1,7 @@
-From 69a3e30b49d28a7386d18725528652931510cbfc Mon Sep 17 00:00:00 2001
+From 91af416408b8718b004c83d93a6daa1f34cba48d Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Wed, 19 Dec 2012 04:39:57 -0600
-Subject: [PATCH 10/24] eglibc: run libm-err-tab.pl with specific dirs in ${S}
+Subject: [PATCH 10/25] eglibc: run libm-err-tab.pl with specific dirs in ${S}
 
 libm-err-tab.pl will parse all the files named "libm-test-ulps"
 in the given dir recursively. To avoid parsing the one in
@@ -10,7 +10,7 @@ ${S}/.pc/aarch64-0001-glibc-fsf-v1-eaf6f205.patch/ports/sysdeps/
 aarch64/libm-test-ulps), run libm-err-tab.pl with specific dirs
 in ${S}.
 
-Upstream-Status: Inappropriate [OE specific]
+Upstream-Status: inappropriate [OE specific]
 
 Signed-off-by: Ting Liu <b28495@freescale.com>
 ---
@@ -18,7 +18,7 @@ Signed-off-by: Ting Liu <b28495@freescale.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/manual/Makefile b/manual/Makefile
-index cdb6763..0b32a0a 100644
+index f2f694f..e062833 100644
 --- a/manual/Makefile
 +++ b/manual/Makefile
 @@ -105,7 +105,8 @@ $(objpfx)libm-err.texi: $(objpfx)stamp-libm-err
@@ -32,5 +32,5 @@ index cdb6763..0b32a0a 100644
  	touch $@
  
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch b/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
index 251e5f5..e92d04c 100644
--- a/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
+++ b/meta/recipes-core/glibc/glibc/0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
@@ -1,7 +1,7 @@
-From 4cf52971a841304aec30b2e975f81d7ad9d42ef0 Mon Sep 17 00:00:00 2001
+From 6a71f688471fe0c85f8ad9afc4ee0723a20aae1d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:24:46 +0000
-Subject: [PATCH 11/24] __ieee754_sqrt{,f} are now inline functions and call
+Subject: [PATCH 11/25] __ieee754_sqrt{,f} are now inline functions and call
  out __slow versions
 
 Upstream-Status: Pending
@@ -57,5 +57,5 @@ index 8126535..10de1f0 100644
  #endif
  {
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0012-Make-ld-version-output-matching-grok-gold-s-output.patch b/meta/recipes-core/glibc/glibc/0012-Make-ld-version-output-matching-grok-gold-s-output.patch
index 3208a0c..4cba03f 100644
--- a/meta/recipes-core/glibc/glibc/0012-Make-ld-version-output-matching-grok-gold-s-output.patch
+++ b/meta/recipes-core/glibc/glibc/0012-Make-ld-version-output-matching-grok-gold-s-output.patch
@@ -1,7 +1,7 @@
-From b356816d6e005ecda7adbed9627a4315ad39de39 Mon Sep 17 00:00:00 2001
+From f9d024edb158659e403b51cc9d93da9bca6e5d7b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:25:45 +0000
-Subject: [PATCH 12/24] Make ld --version output matching grok gold's output
+Subject: [PATCH 12/25] Make ld --version output matching grok gold's output
 
 adapted from from upstream branch roland/gold-vs-libc
 
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index aa05d49..6dabd11 100755
+index 8fe5937..7888a3f 100755
 --- a/configure
 +++ b/configure
-@@ -4486,7 +4486,7 @@ else
+@@ -4482,7 +4482,7 @@ else
    # Found it, now check the version.
    { $as_echo "$as_me:${as_lineno-$LINENO}: checking version of $LD" >&5
  $as_echo_n "checking version of $LD... " >&6; }
@@ -27,10 +27,10 @@ index aa05d49..6dabd11 100755
      '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
      2.1[0-9][0-9]*|2.2[2-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
 diff --git a/configure.ac b/configure.ac
-index ee7a3f1..b4b95b9 100644
+index 3c766b7..6908a99 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -948,7 +948,7 @@ AC_CHECK_PROG_VER(AS, $AS, --version,
+@@ -944,7 +944,7 @@ AC_CHECK_PROG_VER(AS, $AS, --version,
  		  [2.1[0-9][0-9]*|2.2[2-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*],
  		  AS=: critic_missing="$critic_missing as")
  AC_CHECK_PROG_VER(LD, $LD, --version,
@@ -40,5 +40,5 @@ index ee7a3f1..b4b95b9 100644
  		  LD=: critic_missing="$critic_missing ld")
  
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch b/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
index 82fa100..6a82f8d 100644
--- a/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
+++ b/meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
@@ -1,7 +1,7 @@
-From 10003d48f83f7a4f7fa562ed89af904a544b6323 Mon Sep 17 00:00:00 2001
+From 2ece12093c8ba4cf688d235f35d36f1feb02324c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
-Subject: [PATCH 13/24] sysdeps/gnu/configure.ac: handle correctly
+Subject: [PATCH 13/25] sysdeps/gnu/configure.ac: handle correctly
  $libc_cv_rootsbindir
 
 Upstream-Status:Pending
@@ -38,5 +38,5 @@ index 634fe4d..3db1697 100644
    ;;
  esac
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch b/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
index ea3e167..d14a6d4 100644
--- a/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
+++ b/meta/recipes-core/glibc/glibc/0014-Add-unused-attribute.patch
@@ -1,7 +1,7 @@
-From cafa8a7ef830e02cdbf928471e06d11054946940 Mon Sep 17 00:00:00 2001
+From 9fec083dc99d2b524090e1d098e03709eed64a72 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:28:41 +0000
-Subject: [PATCH 14/24] Add unused attribute
+Subject: [PATCH 14/25] Add unused attribute
 
 Helps in avoiding gcc warning when header is is included in
 a source file which does not use both functions
@@ -17,7 +17,7 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/iconv/gconv_charset.h b/iconv/gconv_charset.h
-index 80290bc..7890a8e 100644
+index 95cbce7..191a0dd 100644
 --- a/iconv/gconv_charset.h
 +++ b/iconv/gconv_charset.h
 @@ -21,7 +21,7 @@
@@ -30,5 +30,5 @@ index 80290bc..7890a8e 100644
  {
    int slash_count = 0;
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
index 90e12b8..8ceccec 100644
--- a/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0015-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,7 +1,7 @@
-From 4d6bead19874e519752ceeb2a15897ff2ffbe5e8 Mon Sep 17 00:00:00 2001
+From 1794a97cba0b09b726eebc565c783c7b7c22dfba Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
-Subject: [PATCH 15/24] 'yes' within the path sets wrong config variables
+Subject: [PATCH 15/25] 'yes' within the path sets wrong config variables
 
 It seems that the 'AC_EGREP_CPP(yes...' example is quite popular
 but being such a short word to grep it is likely to produce
@@ -165,7 +165,7 @@ index f05f438..dc86399 100644
    ], libc_cv_nios2_be=yes, libc_cv_nios2_be=no)])
  if test $libc_cv_nios2_be = yes; then
 diff --git a/sysdeps/unix/sysv/linux/mips/configure b/sysdeps/unix/sysv/linux/mips/configure
-index dee56aa..f2049ed 100644
+index a5513fa..283b293 100644
 --- a/sysdeps/unix/sysv/linux/mips/configure
 +++ b/sysdeps/unix/sysv/linux/mips/configure
 @@ -414,11 +414,11 @@ else
@@ -183,7 +183,7 @@ index dee56aa..f2049ed 100644
  else
    libc_cv_mips_nan2008=no
 diff --git a/sysdeps/unix/sysv/linux/mips/configure.ac b/sysdeps/unix/sysv/linux/mips/configure.ac
-index 45147c5..4224af1 100644
+index 9147aa4..7898e24 100644
 --- a/sysdeps/unix/sysv/linux/mips/configure.ac
 +++ b/sysdeps/unix/sysv/linux/mips/configure.ac
 @@ -105,9 +105,9 @@ AC_COMPILE_IFELSE(
@@ -259,5 +259,5 @@ index 0822915..9a32fdd 100644
      ], libc_cv_ppc64_def_call_elf=yes, libc_cv_ppc64_def_call_elf=no)])
    if test $libc_cv_ppc64_def_call_elf = no; then
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch b/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
index e51b611..e5b5083 100644
--- a/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
+++ b/meta/recipes-core/glibc/glibc/0016-timezone-re-written-tzselect-as-posix-sh.patch
@@ -1,7 +1,7 @@
-From 3e8586eb3509e2f0d6dfb74be8f89a30b06b56e9 Mon Sep 17 00:00:00 2001
+From fdb5c9c88e3d1bc5ae6ef9ebcfcf560d3c42f0a6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:33:03 +0000
-Subject: [PATCH 16/24] timezone: re-written tzselect as posix sh
+Subject: [PATCH 16/25] timezone: re-written tzselect as posix sh
 
 To avoid the bash dependency.
 
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/timezone/Makefile b/timezone/Makefile
-index 99566cb..b6e757e 100644
+index dee7568..66a50be 100644
 --- a/timezone/Makefile
 +++ b/timezone/Makefile
-@@ -122,7 +122,7 @@ $(testdata)/XT%: testdata/XT%
+@@ -120,7 +120,7 @@ $(testdata)/XT%: testdata/XT%
  	cp $< $@
  
  $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
@@ -28,7 +28,7 @@ index 99566cb..b6e757e 100644
  	    -e '/TZVERSION=/s|see_Makefile|"$(version)"|' \
  	    -e '/PKGVERSION=/s|=.*|="$(PKGVERSION)"|' \
 diff --git a/timezone/tzselect.ksh b/timezone/tzselect.ksh
-index 9d70691..25f45a8 100755
+index 2c3b2f4..0c04a61 100755
 --- a/timezone/tzselect.ksh
 +++ b/timezone/tzselect.ksh
 @@ -35,7 +35,7 @@ REPORT_BUGS_TO=tz@iana.org
@@ -38,8 +38,8 @@ index 9d70691..25f45a8 100755
 -: ${TZDIR=`pwd`}
 +: ${TZDIR=$(pwd)}
  
- # Check for awk Posix compliance.
- ($AWK -v x=y 'BEGIN { exit 123 }') </dev/null >/dev/null 2>&1
+ # Output one argument as-is to standard output.
+ # Safer than 'echo', which can mishandle '\' or leading '-'.
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
index 0c9ae6c..c8da05d 100644
--- a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
@@ -1,7 +1,7 @@
-From cd9d9fe7316f4ce4ca9d8e67e22f5718879535e4 Mon Sep 17 00:00:00 2001
+From 88ad88d014a5ee68b0e044d2def5ab13743c8ae0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
-Subject: [PATCH 17/24] Remove bash dependency for nscd init script
+Subject: [PATCH 17/25] Remove bash dependency for nscd init script
 
 The nscd init script uses #! /bin/bash but only really uses one bashism
 (translated strings), so remove them and switch the shell to #!/bin/sh.
@@ -9,6 +9,8 @@ The nscd init script uses #! /bin/bash but only really uses one bashism
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  nscd/nscd.init | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
 
@@ -69,5 +71,5 @@ index a882da7..b02986e 100644
  	;;
  esac
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
index e282e60..1750765 100644
--- a/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,7 +1,7 @@
-From 8f554f4a1beb39182aad9cd9b5e1da69464dff7e Mon Sep 17 00:00:00 2001
+From 49c0ad7dc2e02e808ed150296a109b586c34115a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
-Subject: [PATCH 18/24] eglibc: Cross building and testing instructions
+Subject: [PATCH 18/25] eglibc: Cross building and testing instructions
 
 Ported from eglibc
 Upstream-Status: Pending
@@ -615,5 +615,5 @@ index 0000000..b67b468
 +  simply place copies of these libraries in the top GLIBC build
 +  directory.
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
index c04e0a1..f983d86 100644
--- a/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,7 +1,7 @@
-From c2d49eab20db4ab02b6de62092fedc623d757146 Mon Sep 17 00:00:00 2001
+From e881face7a10354612bf634b44e09e3bc6462c67 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
-Subject: [PATCH 19/24] eglibc: Help bootstrap cross toolchain
+Subject: [PATCH 19/25] eglibc: Help bootstrap cross toolchain
 
 Taken from EGLIBC, r1484 + r1525
 
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 include/stubs-bootstrap.h
 
 diff --git a/Makefile b/Makefile
-index 9a01c93..a6ae003 100644
+index 32748b3..6d055ba 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -69,9 +69,18 @@ subdir-dirs = include
@@ -96,5 +96,5 @@ index 0000000..1d2b669
 +   EGLIBC subdir 'stubs' make targets, on every .o file in EGLIBC, but
 +   an empty stubs.h like this will do fine for GCC.  */
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0020-eglibc-cherry-picked-from.patch b/meta/recipes-core/glibc/glibc/0020-eglibc-cherry-picked-from.patch
index 4362efa..30c4c69 100644
--- a/meta/recipes-core/glibc/glibc/0020-eglibc-cherry-picked-from.patch
+++ b/meta/recipes-core/glibc/glibc/0020-eglibc-cherry-picked-from.patch
@@ -1,7 +1,7 @@
-From 588d936b9aa65e7cc8b1eb2cad1d209087db43a9 Mon Sep 17 00:00:00 2001
+From 723a31d3e2627211b39fbcc08f75b3c23c4096c5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 15:10:33 -0800
-Subject: [PATCH 20/24] eglibc: cherry-picked from
+Subject: [PATCH 20/25] eglibc: cherry-picked from
 
 http://www.eglibc.org/archives/patches/msg00772.html
 
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 13 insertions(+), 1 deletion(-)
 
 diff --git a/resolv/res_libc.c b/resolv/res_libc.c
-index a8394e0..981ac7c 100644
+index a4b376f..3256e12 100644
 --- a/resolv/res_libc.c
 +++ b/resolv/res_libc.c
-@@ -18,6 +18,7 @@
+@@ -21,11 +21,13 @@
  #include <atomic.h>
  #include <limits.h>
  #include <sys/types.h>
@@ -26,15 +26,13 @@ index a8394e0..981ac7c 100644
  #include <netinet/in.h>
  #include <arpa/nameser.h>
  #include <resolv.h>
-@@ -28,6 +29,7 @@
-    out) since res_init() should go into libc.so but the rest of that
-    file should not.  */
+ #include <libc-lock.h>
  
 +__libc_lock_define_initialized (static, lock);
  extern unsigned long long int __res_initstamp attribute_hidden;
  /* We have atomic increment operations on 64-bit platforms.  */
  #if __WORDSIZE == 64
-@@ -35,7 +37,6 @@ extern unsigned long long int __res_initstamp attribute_hidden;
+@@ -33,7 +35,6 @@ extern unsigned long long int __res_initstamp attribute_hidden;
  # define atomicincunlock(lock) (void) 0
  # define atomicinc(var) catomic_increment (&(var))
  #else
@@ -42,7 +40,7 @@ index a8394e0..981ac7c 100644
  # define atomicinclock(lock) __libc_lock_lock (lock)
  # define atomicincunlock(lock) __libc_lock_unlock (lock)
  # define atomicinc(var) ++var
-@@ -94,7 +95,18 @@ res_init(void) {
+@@ -92,7 +93,18 @@ res_init(void) {
  int
  __res_maybe_init (res_state resp, int preinit)
  {
@@ -62,5 +60,5 @@ index a8394e0..981ac7c 100644
  			if (resp->nscount > 0)
  				__res_iclose (resp, true);
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0021-eglibc-Clear-cache-lines-on-ppc8xx.patch b/meta/recipes-core/glibc/glibc/0021-eglibc-Clear-cache-lines-on-ppc8xx.patch
index 225f22f..8931c9e 100644
--- a/meta/recipes-core/glibc/glibc/0021-eglibc-Clear-cache-lines-on-ppc8xx.patch
+++ b/meta/recipes-core/glibc/glibc/0021-eglibc-Clear-cache-lines-on-ppc8xx.patch
@@ -1,7 +1,7 @@
-From b74e34e6f53816ad57b13ba6fd70a97db1bc1eae Mon Sep 17 00:00:00 2001
+From 9699873820d0347c2f377f0d86bce615d87a5e47 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 15:15:09 -0800
-Subject: [PATCH 21/24] eglibc: Clear cache lines on ppc8xx
+Subject: [PATCH 21/25] eglibc: Clear cache lines on ppc8xx
 
 2007-06-13  Nathan Sidwell  <nathan@codesourcery.com>
             Mark Shinwell  <shinwell@codesourcery.com>
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 28 insertions(+), 2 deletions(-)
 
 diff --git a/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c b/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
-index c2504ff..d50f1cb 100644
+index 98ec2b3..b384ae0 100644
 --- a/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
 +++ b/sysdeps/unix/sysv/linux/powerpc/dl-sysdep.c
 @@ -24,9 +24,21 @@ int __cache_line_size attribute_hidden;
@@ -48,7 +48,7 @@ index c2504ff..d50f1cb 100644
  	break;
  
 diff --git a/sysdeps/unix/sysv/linux/powerpc/libc-start.c b/sysdeps/unix/sysv/linux/powerpc/libc-start.c
-index 209a16d..5d8572d 100644
+index 0efd297..8cc0ef8 100644
 --- a/sysdeps/unix/sysv/linux/powerpc/libc-start.c
 +++ b/sysdeps/unix/sysv/linux/powerpc/libc-start.c
 @@ -73,11 +73,25 @@ __libc_start_main (int argc, char **argv,
@@ -79,5 +79,5 @@ index 209a16d..5d8572d 100644
  	break;
  #ifndef SHARED
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0022-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0022-eglibc-Resolve-__fpscr_values-on-SH4.patch
index 88b20f6..f53f5ff 100644
--- a/meta/recipes-core/glibc/glibc/0022-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0022-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,7 +1,7 @@
-From 8f483cb1f21ab6431ff99e8d30d56b91607ae918 Mon Sep 17 00:00:00 2001
+From 8904f4249c930d187e19c7e9d3e73c835d11e18f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
-Subject: [PATCH 22/24] eglibc: Resolve __fpscr_values on SH4
+Subject: [PATCH 22/25] eglibc: Resolve __fpscr_values on SH4
 
 2010-09-29  Nobuhiro Iwamatsu  <iwamatsu@nigauri.org>
             Andrew Stubbs  <ams@codesourcery.com>
@@ -33,7 +33,7 @@ index e0938c4..ca1d7da 100644
      # a*
      alphasort64;
 diff --git a/sysdeps/unix/sysv/linux/sh/sysdep.S b/sysdeps/unix/sysv/linux/sh/sysdep.S
-index a02b7e2..b9be326 100644
+index 0024d79..d1db7e4 100644
 --- a/sysdeps/unix/sysv/linux/sh/sysdep.S
 +++ b/sysdeps/unix/sysv/linux/sh/sysdep.S
 @@ -30,3 +30,14 @@ ENTRY (__syscall_error)
@@ -52,5 +52,5 @@ index a02b7e2..b9be326 100644
 +weak_alias (___fpscr_values, __fpscr_values)
 +
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0023-eglibc-Install-PIC-archives.patch b/meta/recipes-core/glibc/glibc/0023-eglibc-Install-PIC-archives.patch
index d95ea3b..f985f3c 100644
--- a/meta/recipes-core/glibc/glibc/0023-eglibc-Install-PIC-archives.patch
+++ b/meta/recipes-core/glibc/glibc/0023-eglibc-Install-PIC-archives.patch
@@ -1,7 +1,7 @@
-From 58d424884eed7efde6c90af0cd7c6c37cf9b444a Mon Sep 17 00:00:00 2001
+From 1947f211fab4001e84bb52868cddbd401e597889 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:57:01 +0000
-Subject: [PATCH 23/24] eglibc: Install PIC archives
+Subject: [PATCH 23/25] eglibc: Install PIC archives
 
 Forward port from eglibc
 
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 40 insertions(+), 2 deletions(-)
 
 diff --git a/Makerules b/Makerules
-index fa24030..1ff4634 100644
+index 53eabfa..1cd2a53 100644
 --- a/Makerules
 +++ b/Makerules
 @@ -694,6 +694,9 @@ ifeq ($(build-shared),yes)
@@ -119,5 +119,5 @@ index fa24030..1ff4634 100644
  install-no-libc.a-nosubdir: install-bin-nosubdir install-bin-script-nosubdir \
  			    install-rootsbin-nosubdir install-sbin-nosubdir \
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0025-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0024-eglibc-Forward-port-cross-locale-generation-support.patch
similarity index 97%
rename from meta/recipes-core/glibc/glibc/0025-eglibc-Forward-port-cross-locale-generation-support.patch
rename to meta/recipes-core/glibc/glibc/0024-eglibc-Forward-port-cross-locale-generation-support.patch
index 68d1119..c45b557 100644
--- a/meta/recipes-core/glibc/glibc/0025-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0024-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,7 +1,7 @@
-From a5695930aec68b3f501e475d8705cddbb63f695e Mon Sep 17 00:00:00 2001
+From 11d7633178301add26a24657e2f1596a2f7dddce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
-Subject: [PATCH 25/25] eglibc: Forward port cross locale generation support
+Subject: [PATCH 24/25] eglibc: Forward port cross locale generation support
 
 Upstream-Status: Pending
 
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 locale/catnames.c
 
 diff --git a/locale/Makefile b/locale/Makefile
-index 75afbe1..d32523b 100644
+index c5379e6..c98c675 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
 @@ -25,7 +25,8 @@ include ../Makeconfig
@@ -91,7 +91,7 @@ index 0000000..9fad357
 +    [LC_ALL] = sizeof ("LC_ALL") - 1
 +  };
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index 789da44..4ac9249 100644
+index 94627f3..d0db77b 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
 @@ -224,7 +224,7 @@ __libc_tsd_define (extern, __locale_t, LOCALE)
@@ -104,7 +104,7 @@ index 789da44..4ac9249 100644
  # define NL_CURRENT_INDIRECT	1
  #endif
 diff --git a/locale/programs/charmap-dir.c b/locale/programs/charmap-dir.c
-index cf7adea..ef3b811 100644
+index 99fcd35..5e528dc 100644
 --- a/locale/programs/charmap-dir.c
 +++ b/locale/programs/charmap-dir.c
 @@ -19,7 +19,9 @@
@@ -150,7 +150,7 @@ index cf7adea..ef3b811 100644
    return NULL;
  }
 diff --git a/locale/programs/ld-collate.c b/locale/programs/ld-collate.c
-index dc0fe30..3c88c6d 100644
+index 1e125f6..3b2867f 100644
 --- a/locale/programs/ld-collate.c
 +++ b/locale/programs/ld-collate.c
 @@ -350,7 +350,7 @@ new_element (struct locale_collate_t *collate, const char *mbs, size_t mbslen,
@@ -199,7 +199,7 @@ index dc0fe30..3c88c6d 100644
  			 == runp->wcnext->wcs[runp->nwcs - 1] + 1));
  
 diff --git a/locale/programs/ld-ctype.c b/locale/programs/ld-ctype.c
-index 3f464ef..b7b6b51 100644
+index 0fd141c..68136e6 100644
 --- a/locale/programs/ld-ctype.c
 +++ b/locale/programs/ld-ctype.c
 @@ -926,7 +926,7 @@ ctype_output (struct localedef_t *locale, const struct charmap_t *charmap,
@@ -281,7 +281,7 @@ index 3f464ef..b7b6b51 100644
  	      srunp = srunp->next;
  	    }
 diff --git a/locale/programs/ld-time.c b/locale/programs/ld-time.c
-index db490c6..75dc505 100644
+index 87531bc..5f2c266 100644
 --- a/locale/programs/ld-time.c
 +++ b/locale/programs/ld-time.c
 @@ -215,8 +215,10 @@ No definition for %s category found"), "LC_TIME"));
@@ -331,7 +331,7 @@ index db490c6..75dc505 100644
  		}
  	      else
  		time->era_entries[idx].wname =
-@@ -530,7 +532,16 @@ No definition for %s category found"), "LC_TIME"));
+@@ -534,7 +536,16 @@ No definition for %s category found"), "LC_TIME"));
    if (time->date_fmt == NULL)
      time->date_fmt = "%a %b %e %H:%M:%S %Z %Y";
    if (time->wdate_fmt == NULL)
@@ -350,7 +350,7 @@ index db490c6..75dc505 100644
  
  
 diff --git a/locale/programs/linereader.c b/locale/programs/linereader.c
-index 2e05130..653b68c 100644
+index b885f65..0afb631 100644
 --- a/locale/programs/linereader.c
 +++ b/locale/programs/linereader.c
 @@ -595,7 +595,7 @@ get_string (struct linereader *lr, const struct charmap_t *charmap,
@@ -363,7 +363,7 @@ index 2e05130..653b68c 100644
    size_t bufmax = 56;
  
 diff --git a/locale/programs/localedef.c b/locale/programs/localedef.c
-index fd6ca51..328d36c 100644
+index 6becd9a..8ddd080 100644
 --- a/locale/programs/localedef.c
 +++ b/locale/programs/localedef.c
 @@ -114,6 +114,7 @@ void (*argp_program_version_hook) (FILE *, struct argp_state *) = print_version;
@@ -409,7 +409,7 @@ index fd6ca51..328d36c 100644
        force_output = 1;
        break;
 diff --git a/locale/programs/locfile.c b/locale/programs/locfile.c
-index 33da52e..f790c4c 100644
+index 32f5cd2..02967b0 100644
 --- a/locale/programs/locfile.c
 +++ b/locale/programs/locfile.c
 @@ -544,6 +544,9 @@ compare_files (const char *filename1, const char *filename2, size_t size,
@@ -432,7 +432,7 @@ index 33da52e..f790c4c 100644
  
  /* Record that FILE's next element is the 32-bit integer VALUE.  */
 diff --git a/locale/programs/locfile.h b/locale/programs/locfile.h
-index 6fc441b..118b171 100644
+index a3dd904..2c7763a 100644
 --- a/locale/programs/locfile.h
 +++ b/locale/programs/locfile.h
 @@ -71,6 +71,8 @@ extern void write_all_categories (struct localedef_t *definitions,
@@ -521,7 +521,7 @@ index 6fc441b..118b171 100644
 +
  #endif /* locfile.h */
 diff --git a/locale/setlocale.c b/locale/setlocale.c
-index ead030d..b551332 100644
+index 69b3141..1cef0be 100644
 --- a/locale/setlocale.c
 +++ b/locale/setlocale.c
 @@ -64,36 +64,6 @@ static char *const _nl_current_used[] =
@@ -562,5 +562,5 @@ index ead030d..b551332 100644
  # define WEAK_POSTLOAD(postload) weak_extern (postload)
  #else
 -- 
-2.6.4
+2.8.2
 
diff --git a/meta/recipes-core/glibc/glibc/0025-Define-DUMMY_LOCALE_T-if-not-defined.patch b/meta/recipes-core/glibc/glibc/0025-Define-DUMMY_LOCALE_T-if-not-defined.patch
new file mode 100644
index 0000000..9d60d02
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0025-Define-DUMMY_LOCALE_T-if-not-defined.patch
@@ -0,0 +1,32 @@
+From 89ec25290d34413ce5c8ba6c378e31dbae3a37c0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 20 Apr 2016 21:11:00 -0700
+Subject: [PATCH 25/25] Define DUMMY_LOCALE_T if not defined
+
+This is a hack to fix building the locale bits on an older
+CentOs 5.X machine
+
+Upstream-Status: Inappropriate [other]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ locale/programs/config.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/locale/programs/config.h b/locale/programs/config.h
+index f606365..0e5f8c3 100644
+--- a/locale/programs/config.h
++++ b/locale/programs/config.h
+@@ -19,6 +19,9 @@
+ #ifndef _LD_CONFIG_H
+ #define _LD_CONFIG_H	1
+ 
++#ifndef DUMMY_LOCALE_T
++#define DUMMY_LOCALE_T
++#endif
+ /* Use the internal textdomain used for libc messages.  */
+ #define PACKAGE _libc_intl_domainname
+ #ifndef VERSION
+-- 
+2.8.2
+
diff --git a/meta/recipes-core/glibc/glibc/0026-When-disabling-SSE-make-sure-fpmath-is-not-set-to-us.patch b/meta/recipes-core/glibc/glibc/0026-When-disabling-SSE-make-sure-fpmath-is-not-set-to-us.patch
deleted file mode 100644
index 2b889a9..0000000
--- a/meta/recipes-core/glibc/glibc/0026-When-disabling-SSE-make-sure-fpmath-is-not-set-to-us.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 97fe7f1b23ea1f17533884b8fa7f7eb40087d558 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 5 Jan 2016 17:50:00 -0800
-Subject: [PATCH] When disabling SSE,  make sure -fpmath is not set to use SSE
- either
-
-This fixes errors when we inject sse options through CFLAGS and now
-that we have -Werror turned on by default this warning turns to become
-error on x86
-
-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -x c /dev/null -S
--mno-sse -mno-mmx
-
-generates warning
-/dev/null:1:0: warning: SSE instruction set disabled, using 387
-arithmetics
-
-where as
-
-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -x c /dev/null -S
--mno-sse -mno-mmx -mfpmath=387
-
-Generates no warnings
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- ChangeLog             | 5 +++++
- sysdeps/i386/Makefile | 2 +-
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/sysdeps/i386/Makefile b/sysdeps/i386/Makefile
-index 168512f..70153b3 100644
---- a/sysdeps/i386/Makefile
-+++ b/sysdeps/i386/Makefile
-@@ -89,7 +89,7 @@ ifeq ($(subdir),elf)
- # the first 3 mm/xmm/ymm/zmm registers are used to pass vector parameters
- # which must be preserved.
- CFLAGS-.os += $(if $(filter $(@F),$(patsubst %,%.os,$(all-rtld-routines))),\
--		   -mno-sse -mno-mmx)
-+		   -mno-sse -mno-mmx -mfpmath=387)
- 
- tests-special += $(objpfx)tst-ld-sse-use.out
- $(objpfx)tst-ld-sse-use.out: ../sysdeps/i386/tst-ld-sse-use.sh $(objpfx)ld.so
--- 
-2.6.4
-
diff --git a/meta/recipes-core/glibc/glibc_2.23.bb b/meta/recipes-core/glibc/glibc_2.24.bb
similarity index 93%
rename from meta/recipes-core/glibc/glibc_2.23.bb
rename to meta/recipes-core/glibc/glibc_2.24.bb
index 18f4066..77630e3 100644
--- a/meta/recipes-core/glibc/glibc_2.23.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 DEPENDS += "gperf-native"
 
-SRCREV ?= "e742928c1592b43db6809db4f39e67be151cdd27"
+SRCREV ?= "1ac3eaa6bcc473a56340c24511786ff48a91293e"
 
-SRCBRANCH ?= "release/${PV}/master"
+#SRCBRANCH ?= "release/${PV}/master"
+SRCBRANCH ?= "master"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
@@ -34,8 +35,8 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-eglibc-Clear-cache-lines-on-ppc8xx.patch \
            file://0022-eglibc-Resolve-__fpscr_values-on-SH4.patch \
            file://0023-eglibc-Install-PIC-archives.patch \
-           file://0025-eglibc-Forward-port-cross-locale-generation-support.patch \
-           file://0026-When-disabling-SSE-make-sure-fpmath-is-not-set-to-us.patch \
+           file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
+           file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
 "
 
 SRC_URI += "\
@@ -59,8 +60,7 @@ PACKAGES_DYNAMIC = ""
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
 
-GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN es_CR.ISO-8859-1"
-
+GLIBC_BROKEN_LOCALES = ""
 #
 # We will skip parsing glibc when target system C library selection is not glibc
 # this helps in easing out parsing for non-glibc system libraries
-- 
2.8.2


