Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 08FFD781D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 14:39:13 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id h68so3919439pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BtBERUcG1H135ZFV52jA9LZl4nCRHy6yXE7jJXLOgVg=;
	b=ItxZkVj5h+H2d+eV2RqmPPc3fMKzWU1i1Fen+pRQg3AV4AjKawmnGHx8GBpjiUrkkp
	WZrYt87sBw2JnjcOzxV9r/WdoGJ/G4uJURsDEBxVS3gtc52L+5LyirhffJ6tqZwd3e9v
	qGCqFv696rXKQUEkbGEWZulpItYc9/AShFdtjKLPhVSYevpMxLqrBTUB+IQ9iJLv/f2+
	jUjl3OkBAduYhpS7xTbwbT1Yl+j8NN0mFUInMUZczSqPJkuInVoEckvbspdkOBeRT/M6
	q1poz5I5sisYigvSDzI4rEGXfpK0HfnxMhfEtN2SyOCvn7QUdfikhyRsUtCiw16bEbJh
	/Ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BtBERUcG1H135ZFV52jA9LZl4nCRHy6yXE7jJXLOgVg=;
	b=FHOmjz2NzKvPReMQeESQgHn4XaVUw7+gPpg6rDZzDvwscvD5BnoKYZ0WRCsizkE8oM
	iZknlhenHTaEgUJ/EvvLPIzfJ6KETrSNk31KLE/US4gGbk9cwpOJVCYbxeSQ4Y9lMoYU
	m4oWOwf7NvmjY2CTSpH+hYV1KJHYiQVfHErS/VsPHEig/TQEKuSJ6lCSsWUl67Uzaw/a
	CKN83g12JSIq1w6yI09+i18BXXKfsFC8K7HUqXAhJlNmzBqp6Y/WjOKKNdGHGXsjyf1u
	V7SMr3iqVdSQt1NP38DujhSP7sKQck8vPAoD5JbFM1dhKi9zqHeYrvWG5XgOvxwUxOy7
	ASAg==
X-Gm-Message-State: AHYfb5j2/5ILPQnrGMeffz/lcm6M4aMZR0zizdXCWQJafU//1AY0febn
	r76VgpiR1hxTeDFK
X-Received: by 10.84.229.8 with SMTP id b8mr13127274plk.93.1502375953886;
	Thu, 10 Aug 2017 07:39:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8e89])
	by smtp.gmail.com with ESMTPSA id
	e67sm11737549pfd.122.2017.08.10.07.39.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Aug 2017 07:39:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Aug 2017 07:38:59 -0700
Message-Id: <20170810143859.17122-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.0
Subject: [PATCH] binutils: Upgrade to 2.29
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
X-List-Received-Date: Thu, 10 Aug 2017 14:39:14 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc        |   2 +-
 .../{binutils-2.28.inc => binutils-2.29.inc}       |  29 +-
 ...ian_2.28.bb => binutils-cross-canadian_2.29.bb} |   0
 ...nutils-cross_2.28.bb => binutils-cross_2.29.bb} |   0
 ...-crosssdk_2.28.bb => binutils-crosssdk_2.29.bb} |   0
 ...nutils-crosssdk-Generate-relocatable-SDKs.patch |   6 +-
 ...oss-Do-not-generate-linker-script-directo.patch |   4 +-
 ...ure-widen-the-regexp-for-SH-architectures.patch |  47 ++
 .../0004-Point-scripts-location-to-libdir.patch    |  10 +-
 ...te-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |  20 +-
 ...ibtool-2.4.patch => 0006-Use-libtool-2.4.patch} | 504 +++++++++++----------
 ...-Add-the-armv5e-architecture-to-binutils.patch} |  10 +-
 ...e-distro-compiler-point-to-the-wrong-ins.patch} |  10 +-
 ...s-of-system-directories-when-cross-linki.patch} |  58 +--
 ...rpath-in-libtool-when-sysroot-is-enabled.patch} |   6 +-
 ...hange-default-emulation-for-mips64-linux.patch} |  14 +-
 ...tch => 0012-Add-support-for-Netlogic-XLP.patch} | 134 +++---
 ...correct-assembling-for-ppc-wait-mnemonic.patch} |  12 +-
 ...patch => 0014-Detect-64-bit-MIPS-targets.patch} |   6 +-
 .../0015-sync-with-OE-libtool-changes.patch        |   4 +-
 ...-lookup-of-file-line-information-for-erro.patch |  75 ---
 ...segfault-in-_bfd_dwarf2_find_nearest_line.patch |  33 --
 .../binutils/binutils/CVE-2017-6965.patch          | 109 -----
 .../binutils/binutils/CVE-2017-6966.patch          | 221 ---------
 .../binutils/binutils/CVE-2017-6969.patch          |  43 --
 .../binutils/binutils/CVE-2017-6969_2.patch        | 104 -----
 .../binutils/binutils/CVE-2017-7209.patch          |  48 --
 .../binutils/binutils/CVE-2017-7210.patch          |  56 ---
 .../{binutils_2.28.bb => binutils_2.29.bb}         |   0
 29 files changed, 471 insertions(+), 1094 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.28.inc => binutils-2.29.inc} (57%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.28.bb => binutils-cross-canadian_2.29.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.28.bb => binutils-cross_2.29.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.28.bb => binutils-crosssdk_2.29.bb} (100%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch
 rename meta/recipes-devtools/binutils/binutils/{0007-Use-libtool-2.4.patch => 0006-Use-libtool-2.4.patch} (98%)
 rename meta/recipes-devtools/binutils/binutils/{0008-Add-the-armv5e-architecture-to-binutils.patch => 0007-Add-the-armv5e-architecture-to-binutils.patch} (83%)
 rename meta/recipes-devtools/binutils/binutils/{0009-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch => 0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch} (82%)
 rename meta/recipes-devtools/binutils/binutils/{0010-warn-for-uses-of-system-directories-when-cross-linki.patch => 0009-warn-for-uses-of-system-directories-when-cross-linki.patch} (87%)
 rename meta/recipes-devtools/binutils/binutils/{0011-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch => 0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch} (92%)
 rename meta/recipes-devtools/binutils/binutils/{0012-Change-default-emulation-for-mips64-linux.patch => 0011-Change-default-emulation-for-mips64-linux.patch} (88%)
 rename meta/recipes-devtools/binutils/binutils/{0013-Add-support-for-Netlogic-XLP.patch => 0012-Add-support-for-Netlogic-XLP.patch} (82%)
 rename meta/recipes-devtools/binutils/binutils/{0014-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch => 0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch} (76%)
 rename meta/recipes-devtools/binutils/binutils/{0016-Detect-64-bit-MIPS-targets.patch => 0014-Detect-64-bit-MIPS-targets.patch} (89%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0017-bfd-Improve-lookup-of-file-line-information-for-erro.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0018-PR-21409-segfault-in-_bfd_dwarf2_find_nearest_line.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-6965.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-6966.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-6969.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-6969_2.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7209.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7210.patch
 rename meta/recipes-devtools/binutils/{binutils_2.28.bb => binutils_2.29.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 2754136405..4a820a0939 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -24,7 +24,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "7.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-BINUVERSION ?= "2.28%"
+BINUVERSION ?= "2.29%"
 GDBVERSION ?= "8.0%"
 GLIBCVERSION ?= "2.26%"
 LINUXLIBCVERSION ?= "4.10%"
diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.29.inc
similarity index 57%
rename from meta/recipes-devtools/binutils/binutils-2.28.inc
rename to meta/recipes-devtools/binutils/binutils-2.29.inc
index 477bcb2564..8e38093946 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.inc
@@ -18,29 +18,22 @@ BINUPV = "${@binutils_branch_version(d)}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV = "7ea1464297eadebe62aae92ad9bebb33f92c2454"
+SRCREV = "dd241688aee3712803a917315df089f4c714b5ef"
 SRC_URI = "\
      git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
+     file://0003-configure-widen-the-regexp-for-SH-architectures.patch \
      file://0004-Point-scripts-location-to-libdir.patch \
      file://0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
-     file://0007-Use-libtool-2.4.patch \
-     file://0008-Add-the-armv5e-architecture-to-binutils.patch \
-     file://0009-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch \
-     file://0010-warn-for-uses-of-system-directories-when-cross-linki.patch \
-     file://0011-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
-     file://0012-Change-default-emulation-for-mips64-linux.patch \
-     file://0013-Add-support-for-Netlogic-XLP.patch \
-     file://0014-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
+     file://0006-Use-libtool-2.4.patch \
+     file://0007-Add-the-armv5e-architecture-to-binutils.patch \
+     file://0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch \
+     file://0009-warn-for-uses-of-system-directories-when-cross-linki.patch \
+     file://0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
+     file://0011-Change-default-emulation-for-mips64-linux.patch \
+     file://0012-Add-support-for-Netlogic-XLP.patch \
+     file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
+     file://0014-Detect-64-bit-MIPS-targets.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
-     file://0016-Detect-64-bit-MIPS-targets.patch \
-     file://CVE-2017-6965.patch \
-     file://CVE-2017-6966.patch \
-     file://0017-bfd-Improve-lookup-of-file-line-information-for-erro.patch \
-     file://0018-PR-21409-segfault-in-_bfd_dwarf2_find_nearest_line.patch \
-     file://CVE-2017-6969.patch \
-     file://CVE-2017-6969_2.patch \
-     file://CVE-2017-7209.patch \
-     file://CVE-2017-7210.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.28.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.29.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.28.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.29.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.28.bb b/meta/recipes-devtools/binutils/binutils-cross_2.29.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.28.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.29.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.28.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.29.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.28.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.29.bb
diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
index 8fb1b4edea..0b515d83c7 100644
--- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
+++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
@@ -1,4 +1,4 @@
-From 689d011688b5ff9481d4367bef3dea7a7b2867fb Mon Sep 17 00:00:00 2001
+From 58ac9f95a3d83c29efaf7a8906fb6aefea8c8e79 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:58:54 +0000
 Subject: [PATCH 01/15] binutils-crosssdk: Generate relocatable SDKs
@@ -43,7 +43,7 @@ index b6940d376d..a42c4d7a4b 100755
  LD_FLAG=
  DATA_ALIGNMENT=${DATA_ALIGNMENT_}
 diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
-index e65f9a3ccf..d99d2c1d2a 100644
+index d9138bc059..e48faeca43 100644
 --- a/ld/scripttempl/elf.sc
 +++ b/ld/scripttempl/elf.sc
 @@ -138,8 +138,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
@@ -58,5 +58,5 @@ index e65f9a3ccf..d99d2c1d2a 100644
  if test -z "$PLT"; then
    IPLT=".iplt         ${RELOCATING-0} : { *(.iplt) }"
 -- 
-2.12.0
+2.14.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
index 14299fd1ae..370333d5d0 100644
--- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
+++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
@@ -1,4 +1,4 @@
-From 7c7de107b4b0a507d2aeca3e3a86d01cb4b51360 Mon Sep 17 00:00:00 2001
+From 8f929c616208351d0971d7dfd7574d48d3144603 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Mar 2017 23:37:05 -0800
 Subject: [PATCH 02/15] binutils-cross: Do not generate linker script
@@ -57,5 +57,5 @@ index a42c4d7a4b..d727b4d07e 100755
    libs=${NATIVE_LIB_DIRS}
    if [ "x${NATIVE}" = "xyes" ] ; then
 -- 
-2.12.0
+2.14.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch b/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch
new file mode 100644
index 0000000000..b6c09ccf19
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch
@@ -0,0 +1,47 @@
+From e5a806aae02a10290c71deb72f6294c98068368d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 2 Mar 2015 01:07:33 +0000
+Subject: [PATCH 03/15] configure: widen the regexp for SH architectures
+
+gprof needs to know about uclibc
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure       | 2 +-
+ gprof/configure | 5 +++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index be9dd89d9b..d8af155ab5 100755
+--- a/configure
++++ b/configure
+@@ -3844,7 +3844,7 @@ case "${target}" in
+   or1k*-*-*)
+     noconfigdirs="$noconfigdirs gdb"
+     ;;
+-  sh-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+diff --git a/gprof/configure b/gprof/configure
+index e71fe8b9e4..679e0dce77 100755
+--- a/gprof/configure
++++ b/gprof/configure
+@@ -5874,6 +5874,11 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+ 
++linux-uclibc*)
++  lt_cv_deplibs_check_method=pass_all
++  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
++  ;;
++
+ netbsd*)
+   if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
+     lt_cv_deplibs_check_method='match_pattern /lib[^/]+(\.so\.[0-9]+\.[0-9]+|_pic\.a)$'
+-- 
+2.14.0
+
diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
index c6b9de7991..38eee30855 100644
--- a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
+++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
@@ -1,4 +1,4 @@
-From e34650c50574a8a39d694567ed607a63006b6f99 Mon Sep 17 00:00:00 2001
+From 3634ec3547bc0f8a5d1b8ad15365e2f836cda642 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:09:58 +0000
 Subject: [PATCH 04/15] Point scripts location to libdir
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index 15beaa7021..bbf9c671d8 100644
+index 625347ff62..d5334d2681 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
 @@ -57,7 +57,7 @@ endif
@@ -25,10 +25,10 @@ index 15beaa7021..bbf9c671d8 100644
  EMUL = @EMUL@
  EMULATION_OFILES = @EMULATION_OFILES@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index 042b690ed6..37e7b25e9a 100644
+index ba251777b0..a2cf2282b5 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
-@@ -452,7 +452,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
+@@ -446,7 +446,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.
@@ -38,5 +38,5 @@ index 042b690ed6..37e7b25e9a 100644
  BFDDIR = $(BASEDIR)/bfd
  INCDIR = $(BASEDIR)/include
 -- 
-2.12.0
+2.14.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
index 726f7020dd..59150a2e4d 100644
--- a/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
+++ b/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
@@ -1,4 +1,4 @@
-From 42292f5533bca904f230a8e03ceee1f84ef0c4ec Mon Sep 17 00:00:00 2001
+From 9d37c8f68c07da63186cb993f1221f6c11eca422 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:27:17 +0000
 Subject: [PATCH 05/15] Only generate an RPATH entry if LD_RUN_PATH is not
@@ -15,19 +15,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
-index 84adaef6df..ab8c74257e 100644
+index 9ac1840316..9dc4c149bc 100644
 --- a/ld/emultempl/elf32.em
 +++ b/ld/emultempl/elf32.em
-@@ -1411,6 +1411,8 @@ fragment <<EOF
+@@ -1463,6 +1463,8 @@ fragment <<EOF
  	      && command_line.rpath == NULL)
  	    {
- 	      lib_path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((lib_path) && (strlen (lib_path) == 0))
-+		  lib_path = NULL;
- 	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
- 						      force))
+ 	      path = (const char *) getenv ("LD_RUN_PATH");
++	      if ((path) && (strlen (path) == 0))
++		  path = NULL;
+ 	      if (path
+ 		  && gld${EMULATION_NAME}_search_needed (path, &n, force))
  		break;
-@@ -1692,6 +1694,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+@@ -1740,6 +1742,8 @@ gld${EMULATION_NAME}_before_allocation (void)
    rpath = command_line.rpath;
    if (rpath == NULL)
      rpath = (const char *) getenv ("LD_RUN_PATH");
@@ -37,5 +37,5 @@ index 84adaef6df..ab8c74257e 100644
    for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
      if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
 -- 
-2.12.0
+2.14.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
similarity index 98%
rename from meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch
rename to meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
index 4f0ef101db..e87efe653b 100644
--- a/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
@@ -1,17 +1,18 @@
-From 9a3651e120261c72090689ad770ad048b0baf506 Mon Sep 17 00:00:00 2001
+From 71c734bb3754319029dcfc898cedbade42274dcb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 Mar 2017 23:28:33 -0800
-Subject: [PATCH 07/15] Use libtool 2.4
+Date: Sun, 14 Feb 2016 17:04:07 +0000
+Subject: [PATCH 06/15] Use libtool 2.4
 
 get libtool sysroot support
 
+Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Inappropriate [ OE configuration Specific]
-
  bfd/configure        | 1318 +++++++++++++++++------
  bfd/configure.ac     |    2 +-
  binutils/configure   | 1316 +++++++++++++++++------
+ configure            |    2 +-
  gas/configure        | 1314 +++++++++++++++++------
  gprof/configure      | 1321 +++++++++++++++++------
  ld/configure         | 1691 +++++++++++++++++++++--------
@@ -23,10 +24,10 @@ Upstream-Status: Inappropriate [ OE configuration Specific]
  opcodes/configure    | 1318 +++++++++++++++++------
  opcodes/configure.ac |    2 +-
  zlib/configure       | 1316 +++++++++++++++++------
- 14 files changed, 9926 insertions(+), 3693 deletions(-)
+ 15 files changed, 9927 insertions(+), 3694 deletions(-)
 
 diff --git a/bfd/configure b/bfd/configure
-index f30bfabef3..fa1a545e9d 100755
+index 48276594ed..3ece8943f3 100755
 --- a/bfd/configure
 +++ b/bfd/configure
 @@ -672,6 +672,9 @@ OTOOL
@@ -212,7 +213,7 @@ index f30bfabef3..fa1a545e9d 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6523,9 +6624,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6521,11 +6622,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -226,6 +227,8 @@ index f30bfabef3..fa1a545e9d 100755
 +
 +
 +
+ 
+ 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -588,10 +591,15 @@ index f30bfabef3..fa1a545e9d 100755
  
  
  
-@@ -7147,6 +7488,45 @@ fi
+@@ -7142,6 +7483,45 @@ fi
  
  
  
++
++
++
++
++
 +
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
@@ -626,14 +634,9 @@ index f30bfabef3..fa1a545e9d 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
-+
-+
-+
-+
-+
- # Check whether --enable-libtool-lock was given.
- if test "${enable_libtool_lock+set}" = set; then :
-   enableval=$enable_libtool_lock;
+ 
+ 
+ 
 @@ -7353,6 +7733,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -1331,7 +1334,7 @@ index f30bfabef3..fa1a545e9d 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14122,7 +14777,7 @@ SHARED_LDFLAGS=
+@@ -14172,7 +14827,7 @@ SHARED_LDFLAGS=
  if test "$enable_shared" = "yes"; then
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -1340,7 +1343,7 @@ index f30bfabef3..fa1a545e9d 100755
    fi
  
  # More hacks to build DLLs on Windows.
-@@ -16826,13 +17481,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -16879,13 +17534,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -1361,7 +1364,7 @@ index f30bfabef3..fa1a545e9d 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -16847,14 +17509,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -16900,14 +17562,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -1380,7 +1383,7 @@ index f30bfabef3..fa1a545e9d 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -16887,12 +17552,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -16940,12 +17605,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -1394,7 +1397,7 @@ index f30bfabef3..fa1a545e9d 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -16947,8 +17612,13 @@ reload_flag \
+@@ -17000,8 +17665,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -1408,7 +1411,7 @@ index f30bfabef3..fa1a545e9d 100755
  STRIP \
  RANLIB \
  CC \
-@@ -16958,12 +17628,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -17011,12 +17681,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -1424,7 +1427,7 @@ index f30bfabef3..fa1a545e9d 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -16979,7 +17651,6 @@ no_undefined_flag \
+@@ -17032,7 +17704,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -1432,7 +1435,7 @@ index f30bfabef3..fa1a545e9d 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -17015,6 +17686,7 @@ module_cmds \
+@@ -17068,6 +17739,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -1440,7 +1443,7 @@ index f30bfabef3..fa1a545e9d 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -17794,7 +18466,8 @@ $as_echo X"$file" |
+@@ -17847,7 +18519,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -1450,7 +1453,7 @@ index f30bfabef3..fa1a545e9d 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -17897,19 +18570,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -17950,19 +18623,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -1494,7 +1497,7 @@ index f30bfabef3..fa1a545e9d 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -17939,6 +18635,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -17992,6 +18688,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -1507,7 +1510,7 @@ index f30bfabef3..fa1a545e9d 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -17948,6 +18650,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -18001,6 +18703,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -1517,7 +1520,7 @@ index f30bfabef3..fa1a545e9d 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -18062,12 +18767,12 @@ with_gcc=$GCC
+@@ -18115,12 +18820,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -1533,7 +1536,7 @@ index f30bfabef3..fa1a545e9d 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -18154,9 +18859,6 @@ inherit_rpath=$inherit_rpath
+@@ -18207,9 +18912,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -1543,7 +1546,7 @@ index f30bfabef3..fa1a545e9d 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -18172,6 +18874,9 @@ include_expsyms=$lt_include_expsyms
+@@ -18225,6 +18927,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -1553,7 +1556,7 @@ index f30bfabef3..fa1a545e9d 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -18204,210 +18909,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -18257,210 +18962,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -1928,10 +1931,10 @@ index f30bfabef3..fa1a545e9d 100755
    chmod +x "$ofile"
  
 diff --git a/bfd/configure.ac b/bfd/configure.ac
-index 9a183c1628..3d8ea07836 100644
+index 8fd03a7ea8..8816c3286c 100644
 --- a/bfd/configure.ac
 +++ b/bfd/configure.ac
-@@ -253,7 +253,7 @@ changequote(,)dnl
+@@ -254,7 +254,7 @@ changequote(,)dnl
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
  changequote([,])dnl
    if test -n "$x"; then
@@ -1941,7 +1944,7 @@ index 9a183c1628..3d8ea07836 100644
  
  # More hacks to build DLLs on Windows.
 diff --git a/binutils/configure b/binutils/configure
-index 82119efe72..4a98918ce1 100755
+index 22e1b1736e..321b63535b 100755
 --- a/binutils/configure
 +++ b/binutils/configure
 @@ -659,8 +659,11 @@ OTOOL
@@ -2513,10 +2516,12 @@ index 82119efe72..4a98918ce1 100755
  
  
  
-@@ -6910,6 +7256,40 @@ fi
+@@ -6908,6 +7254,40 @@ fi
  
  
  
++
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -2549,8 +2554,6 @@ index 82119efe72..4a98918ce1 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
-+
-+
  
  
  
@@ -3251,7 +3254,7 @@ index 82119efe72..4a98918ce1 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15436,13 +16091,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -15446,13 +16101,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -3272,7 +3275,7 @@ index 82119efe72..4a98918ce1 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15457,14 +16119,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -15467,14 +16129,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -3291,7 +3294,7 @@ index 82119efe72..4a98918ce1 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15497,12 +16162,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -15507,12 +16172,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -3305,7 +3308,7 @@ index 82119efe72..4a98918ce1 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15557,8 +16222,13 @@ reload_flag \
+@@ -15567,8 +16232,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -3319,7 +3322,7 @@ index 82119efe72..4a98918ce1 100755
  STRIP \
  RANLIB \
  CC \
-@@ -15568,12 +16238,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -15578,12 +16248,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -3335,7 +3338,7 @@ index 82119efe72..4a98918ce1 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15589,7 +16261,6 @@ no_undefined_flag \
+@@ -15599,7 +16271,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -3343,7 +3346,7 @@ index 82119efe72..4a98918ce1 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15625,6 +16296,7 @@ module_cmds \
+@@ -15635,6 +16306,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -3351,7 +3354,7 @@ index 82119efe72..4a98918ce1 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16382,7 +17054,8 @@ $as_echo X"$file" |
+@@ -16392,7 +17064,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -3361,7 +3364,7 @@ index 82119efe72..4a98918ce1 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16485,19 +17158,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -16495,19 +17168,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -3405,7 +3408,7 @@ index 82119efe72..4a98918ce1 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16527,6 +17223,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -16537,6 +17233,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -3418,7 +3421,7 @@ index 82119efe72..4a98918ce1 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16536,6 +17238,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -16546,6 +17248,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -3428,7 +3431,7 @@ index 82119efe72..4a98918ce1 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16650,12 +17355,12 @@ with_gcc=$GCC
+@@ -16660,12 +17365,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -3444,7 +3447,7 @@ index 82119efe72..4a98918ce1 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16742,9 +17447,6 @@ inherit_rpath=$inherit_rpath
+@@ -16752,9 +17457,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -3454,7 +3457,7 @@ index 82119efe72..4a98918ce1 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16760,6 +17462,9 @@ include_expsyms=$lt_include_expsyms
+@@ -16770,6 +17472,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -3464,7 +3467,7 @@ index 82119efe72..4a98918ce1 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16792,210 +17497,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -16802,210 +17507,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -3838,8 +3841,21 @@ index 82119efe72..4a98918ce1 100755
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
+diff --git a/configure b/configure
+index d8af155ab5..005ed827ab 100755
+--- a/configure
++++ b/configure
+@@ -3844,7 +3844,7 @@ case "${target}" in
+   or1k*-*-*)
+     noconfigdirs="$noconfigdirs gdb"
+     ;;
+-  sh*-*-* | sh64-*-*)
++  sh-*-* | sh64-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
 diff --git a/gas/configure b/gas/configure
-index e574cb8514..a36f1ae161 100755
+index 93afb20c8f..81dd4cbd97 100755
 --- a/gas/configure
 +++ b/gas/configure
 @@ -650,8 +650,11 @@ OTOOL
@@ -4402,10 +4418,12 @@ index e574cb8514..a36f1ae161 100755
  
  
  
-@@ -6671,6 +7015,40 @@ fi
+@@ -6669,6 +7013,40 @@ fi
  
  
  
++
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -4438,8 +4456,6 @@ index e574cb8514..a36f1ae161 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
-+
-+
  
  
  
@@ -5140,7 +5156,7 @@ index e574cb8514..a36f1ae161 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15425,13 +16078,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -15436,13 +16089,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -5161,7 +5177,7 @@ index e574cb8514..a36f1ae161 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15446,14 +16106,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -15457,14 +16117,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -5180,7 +5196,7 @@ index e574cb8514..a36f1ae161 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15486,12 +16149,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -15497,12 +16160,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -5194,7 +5210,7 @@ index e574cb8514..a36f1ae161 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15546,8 +16209,13 @@ reload_flag \
+@@ -15557,8 +16220,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -5208,7 +5224,7 @@ index e574cb8514..a36f1ae161 100755
  STRIP \
  RANLIB \
  CC \
-@@ -15557,12 +16225,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -15568,12 +16236,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -5224,7 +5240,7 @@ index e574cb8514..a36f1ae161 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15578,7 +16248,6 @@ no_undefined_flag \
+@@ -15589,7 +16259,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -5232,7 +5248,7 @@ index e574cb8514..a36f1ae161 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15614,6 +16283,7 @@ module_cmds \
+@@ -15625,6 +16294,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -5240,7 +5256,7 @@ index e574cb8514..a36f1ae161 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16378,7 +17048,8 @@ $as_echo X"$file" |
+@@ -16389,7 +17059,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -5250,7 +5266,7 @@ index e574cb8514..a36f1ae161 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16481,19 +17152,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -16492,19 +17163,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -5294,7 +5310,7 @@ index e574cb8514..a36f1ae161 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16523,6 +17217,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -16534,6 +17228,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -5307,7 +5323,7 @@ index e574cb8514..a36f1ae161 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16532,6 +17232,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -16543,6 +17243,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -5317,7 +5333,7 @@ index e574cb8514..a36f1ae161 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16646,12 +17349,12 @@ with_gcc=$GCC
+@@ -16657,12 +17360,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -5333,7 +5349,7 @@ index e574cb8514..a36f1ae161 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16738,9 +17441,6 @@ inherit_rpath=$inherit_rpath
+@@ -16749,9 +17452,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -5343,7 +5359,7 @@ index e574cb8514..a36f1ae161 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16756,6 +17456,9 @@ include_expsyms=$lt_include_expsyms
+@@ -16767,6 +17467,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -5353,7 +5369,7 @@ index e574cb8514..a36f1ae161 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16788,210 +17491,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -16799,210 +17502,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -5728,7 +5744,7 @@ index e574cb8514..a36f1ae161 100755
    chmod +x "$ofile"
  
 diff --git a/gprof/configure b/gprof/configure
-index 38a4c0b0e5..38d1f699c7 100755
+index 679e0dce77..ac4c016a63 100755
 --- a/gprof/configure
 +++ b/gprof/configure
 @@ -631,8 +631,11 @@ OTOOL
@@ -5894,6 +5910,18 @@ index 38a4c0b0e5..38d1f699c7 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
+@@ -5874,11 +5960,6 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+ 
+-linux-uclibc*)
+-  lt_cv_deplibs_check_method=pass_all
+-  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
+-  ;;
+-
+ netbsd*)
+   if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
+     lt_cv_deplibs_check_method='match_pattern /lib[^/]+(\.so\.[0-9]+\.[0-9]+|_pic\.a)$'
 @@ -5956,6 +6037,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
@@ -6297,10 +6325,15 @@ index 38a4c0b0e5..38d1f699c7 100755
  
  
  
-@@ -6595,6 +6933,43 @@ fi
+@@ -6590,6 +6928,43 @@ fi
  
  
  
++
++
++
++
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -6333,14 +6366,9 @@ index 38a4c0b0e5..38d1f699c7 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
-+
-+
-+
-+
-+
- # Check whether --enable-libtool-lock was given.
- if test "${enable_libtool_lock+set}" = set; then :
-   enableval=$enable_libtool_lock;
+ 
+ 
+ 
 @@ -6801,6 +7176,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -7626,10 +7654,10 @@ index 38a4c0b0e5..38d1f699c7 100755
    chmod +x "$ofile"
  
 diff --git a/ld/configure b/ld/configure
-index a16c6db059..4277b74bad 100755
+index d7f66f8cdc..4e71511bd1 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -659,8 +659,11 @@ OTOOL
+@@ -655,8 +655,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -7641,7 +7669,7 @@ index a16c6db059..4277b74bad 100755
  OBJDUMP
  LN_S
  NM
-@@ -782,6 +785,7 @@ enable_static
+@@ -778,6 +781,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -7649,7 +7677,7 @@ index a16c6db059..4277b74bad 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1463,6 +1467,8 @@ Optional Packages:
+@@ -1464,6 +1468,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -7658,7 +7686,7 @@ index a16c6db059..4277b74bad 100755
    --with-lib-path=dir1:dir2...  set default LIB_PATH
    --with-sysroot=DIR Search for usr/lib et al within DIR.
  
-@@ -5657,8 +5663,8 @@ esac
+@@ -5658,8 +5664,8 @@ esac
  
  
  
@@ -7669,7 +7697,7 @@ index a16c6db059..4277b74bad 100755
  
  
  
-@@ -5698,7 +5704,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5699,7 +5705,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -7678,7 +7706,7 @@ index a16c6db059..4277b74bad 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6384,8 +6390,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6385,8 +6391,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -7689,7 +7717,7 @@ index a16c6db059..4277b74bad 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6434,6 +6440,80 @@ esac
+@@ -6435,6 +6441,80 @@ esac
  
  
  
@@ -7770,7 +7798,7 @@ index a16c6db059..4277b74bad 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -6450,6 +6530,11 @@ case $reload_flag in
+@@ -6451,6 +6531,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -7782,7 +7810,7 @@ index a16c6db059..4277b74bad 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6618,7 +6703,8 @@ mingw* | pw32*)
+@@ -6619,7 +6704,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -7792,7 +7820,7 @@ index a16c6db059..4277b74bad 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6772,6 +6858,21 @@ esac
+@@ -6773,6 +6859,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -7814,7 +7842,7 @@ index a16c6db059..4277b74bad 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6787,9 +6888,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6788,9 +6889,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -7979,7 +8007,7 @@ index a16c6db059..4277b74bad 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6805,7 +7059,7 @@ do
+@@ -6806,7 +7060,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -7988,7 +8016,7 @@ index a16c6db059..4277b74bad 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6825,11 +7079,15 @@ $as_echo "no" >&6; }
+@@ -6826,11 +7080,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -8007,7 +8035,7 @@ index a16c6db059..4277b74bad 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6845,7 +7103,7 @@ do
+@@ -6846,7 +7104,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -8016,7 +8044,7 @@ index a16c6db059..4277b74bad 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6864,6 +7122,10 @@ else
+@@ -6865,6 +7123,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -8027,7 +8055,7 @@ index a16c6db059..4277b74bad 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6875,12 +7137,12 @@ ac_tool_warned=yes ;;
+@@ -6876,12 +7138,12 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -8044,7 +8072,7 @@ index a16c6db059..4277b74bad 100755
  
  
  
-@@ -6890,6 +7152,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6891,6 +7153,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -8107,7 +8135,7 @@ index a16c6db059..4277b74bad 100755
  
  
  if test -n "$ac_tool_prefix"; then
-@@ -7226,8 +7544,8 @@ esac
+@@ -7227,8 +7545,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -8118,7 +8146,7 @@ index a16c6db059..4277b74bad 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7263,6 +7581,7 @@ for ac_symprfx in "" "_"; do
+@@ -7264,6 +7582,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -8126,7 +8154,7 @@ index a16c6db059..4277b74bad 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7304,6 +7623,18 @@ _LT_EOF
+@@ -7305,6 +7624,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -8145,7 +8173,7 @@ index a16c6db059..4277b74bad 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7315,7 +7646,7 @@ _LT_EOF
+@@ -7316,7 +7647,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -8154,7 +8182,7 @@ index a16c6db059..4277b74bad 100755
    const char *name;
    void       *address;
  }
-@@ -7341,8 +7672,8 @@ static const void *lt_preloaded_setup() {
+@@ -7342,8 +7673,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -8165,7 +8193,7 @@ index a16c6db059..4277b74bad 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7352,8 +7683,8 @@ _LT_EOF
+@@ -7353,8 +7684,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -8176,7 +8204,7 @@ index a16c6db059..4277b74bad 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7390,6 +7721,19 @@ else
+@@ -7391,6 +7722,19 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -8196,10 +8224,14 @@ index a16c6db059..4277b74bad 100755
  
  
  
-@@ -7410,6 +7754,42 @@ fi
+@@ -7404,6 +7748,42 @@ fi
  
  
  
++
++
++
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -8232,14 +8264,10 @@ index a16c6db059..4277b74bad 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
-+
-+
-+
-+
  
- # Check whether --enable-libtool-lock was given.
- if test "${enable_libtool_lock+set}" = set; then :
-@@ -7617,6 +7997,123 @@ esac
+ 
+ 
+@@ -7618,6 +7998,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -8363,7 +8391,7 @@ index a16c6db059..4277b74bad 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -8180,6 +8677,8 @@ _LT_EOF
+@@ -8181,6 +8678,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -8372,7 +8400,7 @@ index a16c6db059..4277b74bad 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8248,6 +8747,16 @@ done
+@@ -8249,6 +8748,16 @@ done
  
  
  
@@ -8389,7 +8417,7 @@ index a16c6db059..4277b74bad 100755
  
  
  # Set options
-@@ -8376,7 +8885,8 @@ fi
+@@ -8377,7 +8886,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -8399,7 +8427,7 @@ index a16c6db059..4277b74bad 100755
  
  
  
-@@ -8465,7 +8975,7 @@ aix3*)
+@@ -8466,7 +8976,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -8408,7 +8436,7 @@ index a16c6db059..4277b74bad 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8763,8 +9273,6 @@ fi
+@@ -8764,8 +9274,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -8417,7 +8445,7 @@ index a16c6db059..4277b74bad 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8930,6 +9438,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8931,6 +9439,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -8430,7 +8458,7 @@ index a16c6db059..4277b74bad 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8992,7 +9506,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8993,7 +9507,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -8439,7 +8467,7 @@ index a16c6db059..4277b74bad 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -9049,13 +9563,17 @@ case $host_os in
+@@ -9050,13 +9564,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -8463,7 +8491,7 @@ index a16c6db059..4277b74bad 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9116,6 +9634,11 @@ fi
+@@ -9117,6 +9635,11 @@ fi
  
  
  
@@ -8475,7 +8503,7 @@ index a16c6db059..4277b74bad 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9466,7 +9989,8 @@ _LT_EOF
+@@ -9467,7 +9990,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -8485,7 +8513,7 @@ index a16c6db059..4277b74bad 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9565,12 +10089,12 @@ _LT_EOF
+@@ -9566,12 +10090,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -8500,7 +8528,7 @@ index a16c6db059..4277b74bad 100755
  	  fi
  	  ;;
  	esac
-@@ -9584,8 +10108,8 @@ _LT_EOF
+@@ -9585,8 +10109,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -8511,7 +8539,7 @@ index a16c6db059..4277b74bad 100755
        fi
        ;;
  
-@@ -9603,8 +10127,8 @@ _LT_EOF
+@@ -9604,8 +10128,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8522,7 +8550,7 @@ index a16c6db059..4277b74bad 100755
        else
  	ld_shlibs=no
        fi
-@@ -9650,8 +10174,8 @@ _LT_EOF
+@@ -9651,8 +10175,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8533,7 +8561,7 @@ index a16c6db059..4277b74bad 100755
        else
  	ld_shlibs=no
        fi
-@@ -9781,7 +10305,13 @@ _LT_EOF
+@@ -9782,7 +10306,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -8548,7 +8576,7 @@ index a16c6db059..4277b74bad 100755
  /* end confdefs.h.  */
  
  int
-@@ -9794,22 +10324,29 @@ main ()
+@@ -9795,22 +10325,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8591,7 +8619,7 @@ index a16c6db059..4277b74bad 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9821,7 +10358,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9822,7 +10359,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -8606,7 +8634,7 @@ index a16c6db059..4277b74bad 100755
  /* end confdefs.h.  */
  
  int
-@@ -9834,22 +10377,29 @@ main ()
+@@ -9835,22 +10378,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8649,7 +8677,7 @@ index a16c6db059..4277b74bad 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9893,21 +10443,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9894,21 +10444,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # When not using gcc, we currently assume that we are using
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
@@ -8729,7 +8757,7 @@ index a16c6db059..4277b74bad 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9968,7 +10561,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9969,7 +10562,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -8738,7 +8766,7 @@ index a16c6db059..4277b74bad 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9976,7 +10569,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9977,7 +10570,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -8747,7 +8775,7 @@ index a16c6db059..4277b74bad 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9992,7 +10585,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9993,7 +10586,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -8756,7 +8784,7 @@ index a16c6db059..4277b74bad 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10016,10 +10609,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10017,10 +10610,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -8769,7 +8797,7 @@ index a16c6db059..4277b74bad 100755
  	  ;;
  	esac
        else
-@@ -10098,23 +10691,36 @@ fi
+@@ -10099,23 +10692,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -8814,7 +8842,7 @@ index a16c6db059..4277b74bad 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10199,7 +10805,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10200,7 +10806,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -8823,7 +8851,7 @@ index a16c6db059..4277b74bad 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10218,9 +10824,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10219,9 +10825,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -8835,7 +8863,7 @@ index a16c6db059..4277b74bad 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10796,8 +11402,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10797,8 +11403,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -8847,7 +8875,7 @@ index a16c6db059..4277b74bad 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10830,13 +11437,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10831,13 +11438,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -8920,7 +8948,7 @@ index a16c6db059..4277b74bad 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10928,7 +11593,7 @@ haiku*)
+@@ -10929,7 +11594,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -8929,7 +8957,7 @@ index a16c6db059..4277b74bad 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11768,10 +12433,10 @@ else
+@@ -11769,10 +12434,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -8942,7 +8970,7 @@ index a16c6db059..4277b74bad 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11874,10 +12539,10 @@ else
+@@ -11875,10 +12540,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -8955,7 +8983,7 @@ index a16c6db059..4277b74bad 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12269,6 +12934,7 @@ $RM -r conftest*
+@@ -12270,6 +12935,7 @@ $RM -r conftest*
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -8963,7 +8991,7 @@ index a16c6db059..4277b74bad 100755
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -12286,6 +12952,7 @@ $RM -r conftest*
+@@ -12287,6 +12953,7 @@ $RM -r conftest*
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -8971,7 +8999,7 @@ index a16c6db059..4277b74bad 100755
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -12568,7 +13235,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -12569,7 +13236,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -8986,7 +9014,7 @@ index a16c6db059..4277b74bad 100755
  /* end confdefs.h.  */
  
  int
-@@ -12581,22 +13254,29 @@ main ()
+@@ -12582,22 +13255,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9029,7 +9057,7 @@ index a16c6db059..4277b74bad 100755
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -12609,7 +13289,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12610,7 +13290,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -9044,7 +9072,7 @@ index a16c6db059..4277b74bad 100755
  /* end confdefs.h.  */
  
  int
-@@ -12622,22 +13308,29 @@ main ()
+@@ -12623,22 +13309,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9087,7 +9115,7 @@ index a16c6db059..4277b74bad 100755
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -12680,29 +13373,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12681,29 +13374,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -9186,7 +9214,7 @@ index a16c6db059..4277b74bad 100755
        darwin* | rhapsody*)
  
  
-@@ -12808,7 +13547,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12809,7 +13548,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
              ;;
            *)
              if test "$GXX" = yes; then
@@ -9195,7 +9223,7 @@ index a16c6db059..4277b74bad 100755
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -12879,10 +13618,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12880,10 +13619,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -9208,7 +9236,7 @@ index a16c6db059..4277b74bad 100755
  	            ;;
  	        esac
  	      fi
-@@ -12923,9 +13662,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12924,9 +13663,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -9220,7 +9248,7 @@ index a16c6db059..4277b74bad 100755
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -12995,20 +13734,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12996,20 +13735,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	      prelink_cmds_CXX='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -9245,7 +9273,7 @@ index a16c6db059..4277b74bad 100755
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -13203,7 +13942,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13204,7 +13943,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -9254,7 +9282,7 @@ index a16c6db059..4277b74bad 100755
  		  ;;
  	      esac
  
-@@ -13249,7 +13988,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13250,7 +13989,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
        solaris*)
          case $cc_basename in
@@ -9263,7 +9291,7 @@ index a16c6db059..4277b74bad 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13290,9 +14029,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13291,9 +14030,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -9275,7 +9303,7 @@ index a16c6db059..4277b74bad 100755
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -13427,6 +14166,13 @@ private:
+@@ -13428,6 +14167,13 @@ private:
  };
  _LT_EOF
  
@@ -9289,7 +9317,7 @@ index a16c6db059..4277b74bad 100755
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13440,7 +14186,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13441,7 +14187,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -9298,7 +9326,7 @@ index a16c6db059..4277b74bad 100755
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13449,13 +14195,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13450,13 +14196,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -9325,7 +9353,7 @@ index a16c6db059..4277b74bad 100755
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -13475,8 +14230,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13476,8 +14231,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -9336,7 +9364,7 @@ index a16c6db059..4277b74bad 100755
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -13512,6 +14269,7 @@ else
+@@ -13513,6 +14270,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -9344,7 +9372,7 @@ index a16c6db059..4277b74bad 100755
  
  # PORTME: override above test on systems where it is broken
  case $host_os in
-@@ -13547,7 +14305,7 @@ linux*)
+@@ -13548,7 +14306,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -9353,7 +9381,7 @@ index a16c6db059..4277b74bad 100755
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -13612,8 +14370,6 @@ fi
+@@ -13613,8 +14371,6 @@ fi
  lt_prog_compiler_pic_CXX=
  lt_prog_compiler_static_CXX=
  
@@ -9362,7 +9390,7 @@ index a16c6db059..4277b74bad 100755
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -13718,6 +14474,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -13719,6 +14475,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	  ;;
  	esac
  	;;
@@ -9374,7 +9402,7 @@ index a16c6db059..4277b74bad 100755
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -13870,7 +14631,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -13871,7 +14632,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	;;
        solaris*)
  	case $cc_basename in
@@ -9383,7 +9411,7 @@ index a16c6db059..4277b74bad 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    lt_prog_compiler_pic_CXX='-KPIC'
  	    lt_prog_compiler_static_CXX='-Bstatic'
-@@ -13935,10 +14696,17 @@ case $host_os in
+@@ -13936,10 +14697,17 @@ case $host_os in
      lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
      ;;
  esac
@@ -9404,7 +9432,7 @@ index a16c6db059..4277b74bad 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -13996,6 +14764,8 @@ fi
+@@ -13997,6 +14765,8 @@ fi
  
  
  
@@ -9413,7 +9441,7 @@ index a16c6db059..4277b74bad 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -14173,6 +14943,7 @@ fi
+@@ -14174,6 +14944,7 @@ fi
  $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
  
    export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -9421,7 +9449,7 @@ index a16c6db059..4277b74bad 100755
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -14187,15 +14958,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -14188,15 +14959,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -9447,7 +9475,7 @@ index a16c6db059..4277b74bad 100755
  
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
  $as_echo "$ld_shlibs_CXX" >&6; }
-@@ -14458,8 +15234,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14459,8 +15235,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -9459,7 +9487,7 @@ index a16c6db059..4277b74bad 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -14491,13 +15268,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14492,13 +15269,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -9532,7 +9560,7 @@ index a16c6db059..4277b74bad 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -14588,7 +15423,7 @@ haiku*)
+@@ -14589,7 +15424,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -9541,7 +9569,7 @@ index a16c6db059..4277b74bad 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -15047,6 +15882,7 @@ fi
+@@ -15048,6 +15883,7 @@ fi
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -9549,7 +9577,7 @@ index a16c6db059..4277b74bad 100755
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -18026,13 +18862,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -18083,13 +18919,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -9570,7 +9598,7 @@ index a16c6db059..4277b74bad 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -18047,14 +18890,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -18104,14 +18947,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -9589,7 +9617,7 @@ index a16c6db059..4277b74bad 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -18087,12 +18933,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -18144,12 +18990,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -9603,7 +9631,7 @@ index a16c6db059..4277b74bad 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -18131,8 +18977,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
+@@ -18188,8 +19034,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9613,7 +9641,7 @@ index a16c6db059..4277b74bad 100755
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18159,12 +19005,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
+@@ -18216,12 +19062,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9627,7 +9655,7 @@ index a16c6db059..4277b74bad 100755
  file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
  hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
  compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18202,8 +19048,13 @@ reload_flag \
+@@ -18259,8 +19105,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -9641,7 +9669,7 @@ index a16c6db059..4277b74bad 100755
  STRIP \
  RANLIB \
  CC \
-@@ -18213,12 +19064,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -18270,12 +19121,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -9657,7 +9685,7 @@ index a16c6db059..4277b74bad 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -18234,7 +19087,6 @@ no_undefined_flag \
+@@ -18291,7 +19144,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -9665,7 +9693,7 @@ index a16c6db059..4277b74bad 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -18256,8 +19108,8 @@ LD_CXX \
+@@ -18313,8 +19165,8 @@ LD_CXX \
  reload_flag_CXX \
  compiler_CXX \
  lt_prog_compiler_no_builtin_flag_CXX \
@@ -9675,7 +9703,7 @@ index a16c6db059..4277b74bad 100755
  lt_prog_compiler_static_CXX \
  lt_cv_prog_compiler_c_o_CXX \
  export_dynamic_flag_spec_CXX \
-@@ -18269,7 +19121,6 @@ no_undefined_flag_CXX \
+@@ -18326,7 +19178,6 @@ no_undefined_flag_CXX \
  hardcode_libdir_flag_spec_CXX \
  hardcode_libdir_flag_spec_ld_CXX \
  hardcode_libdir_separator_CXX \
@@ -9683,7 +9711,7 @@ index a16c6db059..4277b74bad 100755
  exclude_expsyms_CXX \
  include_expsyms_CXX \
  file_list_spec_CXX \
-@@ -18303,6 +19154,7 @@ module_cmds \
+@@ -18360,6 +19211,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -9691,7 +9719,7 @@ index a16c6db059..4277b74bad 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18317,7 +19169,8 @@ archive_expsym_cmds_CXX \
+@@ -18374,7 +19226,8 @@ archive_expsym_cmds_CXX \
  module_cmds_CXX \
  module_expsym_cmds_CXX \
  export_symbols_cmds_CXX \
@@ -9701,7 +9729,7 @@ index a16c6db059..4277b74bad 100755
      case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
      *[\\\\\\\`\\"\\\$]*)
        eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
-@@ -19110,7 +19963,8 @@ $as_echo X"$file" |
+@@ -19167,7 +20020,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -9711,7 +9739,7 @@ index a16c6db059..4277b74bad 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -19213,19 +20067,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -19270,19 +20124,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -9755,7 +9783,7 @@ index a16c6db059..4277b74bad 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -19255,6 +20132,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -19312,6 +20189,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -9768,7 +9796,7 @@ index a16c6db059..4277b74bad 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -19264,6 +20147,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -19321,6 +20204,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -9778,7 +9806,7 @@ index a16c6db059..4277b74bad 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -19378,12 +20264,12 @@ with_gcc=$GCC
+@@ -19435,12 +20321,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -9794,7 +9822,7 @@ index a16c6db059..4277b74bad 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -19470,9 +20356,6 @@ inherit_rpath=$inherit_rpath
+@@ -19527,9 +20413,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -9804,7 +9832,7 @@ index a16c6db059..4277b74bad 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -19488,6 +20371,9 @@ include_expsyms=$lt_include_expsyms
+@@ -19545,6 +20428,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -9814,7 +9842,7 @@ index a16c6db059..4277b74bad 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -19534,210 +20420,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -19591,210 +20477,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -10188,7 +10216,7 @@ index a16c6db059..4277b74bad 100755
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-@@ -19765,12 +20610,12 @@ with_gcc=$GCC_CXX
+@@ -19822,12 +20667,12 @@ with_gcc=$GCC_CXX
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
  
@@ -10204,7 +10232,7 @@ index a16c6db059..4277b74bad 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static_CXX
  
-@@ -19857,9 +20702,6 @@ inherit_rpath=$inherit_rpath_CXX
+@@ -19914,9 +20759,6 @@ inherit_rpath=$inherit_rpath_CXX
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs_CXX
  
@@ -10214,7 +10242,7 @@ index a16c6db059..4277b74bad 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols_CXX
  
-@@ -19875,6 +20717,9 @@ include_expsyms=$lt_include_expsyms_CXX
+@@ -19932,6 +20774,9 @@ include_expsyms=$lt_include_expsyms_CXX
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds_CXX
  
@@ -17308,7 +17336,7 @@ index bf92b5e079..c573da90c5 100644
  # These exist entirely to fool aclocal when bootstrapping libtool.
  #
 diff --git a/opcodes/configure b/opcodes/configure
-index 0b352a454d..7eaea7db73 100755
+index 17530f54b9..79b39611c2 100755
 --- a/opcodes/configure
 +++ b/opcodes/configure
 @@ -650,6 +650,9 @@ OTOOL
@@ -17494,7 +17522,7 @@ index 0b352a454d..7eaea7db73 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6245,9 +6346,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6243,11 +6344,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -17508,6 +17536,8 @@ index 0b352a454d..7eaea7db73 100755
 +
 +
 +
+ 
+ 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -17870,10 +17900,15 @@ index 0b352a454d..7eaea7db73 100755
  
  
  
-@@ -6869,6 +7210,45 @@ fi
+@@ -6864,6 +7205,45 @@ fi
  
  
  
++
++
++
++
++
 +
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
@@ -17908,14 +17943,9 @@ index 0b352a454d..7eaea7db73 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
-+
-+
-+
-+
-+
- # Check whether --enable-libtool-lock was given.
- if test "${enable_libtool_lock+set}" = set; then :
-   enableval=$enable_libtool_lock;
+ 
+ 
+ 
 @@ -7075,6 +7455,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -18622,7 +18652,7 @@ index 0b352a454d..7eaea7db73 100755
    fi
  
    case "${host}" in
-@@ -13518,13 +14173,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -13520,13 +14175,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -18643,7 +18673,7 @@ index 0b352a454d..7eaea7db73 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13539,14 +14201,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -13541,14 +14203,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -18662,7 +18692,7 @@ index 0b352a454d..7eaea7db73 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13579,12 +14244,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -13581,12 +14246,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -18676,7 +18706,7 @@ index 0b352a454d..7eaea7db73 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -13639,8 +14304,13 @@ reload_flag \
+@@ -13641,8 +14306,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -18690,7 +18720,7 @@ index 0b352a454d..7eaea7db73 100755
  STRIP \
  RANLIB \
  CC \
-@@ -13650,12 +14320,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -13652,12 +14322,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -18706,7 +18736,7 @@ index 0b352a454d..7eaea7db73 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -13671,7 +14343,6 @@ no_undefined_flag \
+@@ -13673,7 +14345,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -18714,7 +18744,7 @@ index 0b352a454d..7eaea7db73 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13707,6 +14378,7 @@ module_cmds \
+@@ -13709,6 +14380,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -18722,7 +18752,7 @@ index 0b352a454d..7eaea7db73 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -14463,7 +15135,8 @@ $as_echo X"$file" |
+@@ -14465,7 +15137,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -18732,7 +18762,7 @@ index 0b352a454d..7eaea7db73 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -14566,19 +15239,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -14568,19 +15241,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -18776,7 +18806,7 @@ index 0b352a454d..7eaea7db73 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14608,6 +15304,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -14610,6 +15306,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -18789,7 +18819,7 @@ index 0b352a454d..7eaea7db73 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -14617,6 +15319,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -14619,6 +15321,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -18799,7 +18829,7 @@ index 0b352a454d..7eaea7db73 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14731,12 +15436,12 @@ with_gcc=$GCC
+@@ -14733,12 +15438,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -18815,7 +18845,7 @@ index 0b352a454d..7eaea7db73 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -14823,9 +15528,6 @@ inherit_rpath=$inherit_rpath
+@@ -14825,9 +15530,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -18825,7 +18855,7 @@ index 0b352a454d..7eaea7db73 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -14841,6 +15543,9 @@ include_expsyms=$lt_include_expsyms
+@@ -14843,6 +15545,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -18835,7 +18865,7 @@ index 0b352a454d..7eaea7db73 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -14873,210 +15578,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -14875,210 +15580,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -19210,7 +19240,7 @@ index 0b352a454d..7eaea7db73 100755
    chmod +x "$ofile"
  
 diff --git a/opcodes/configure.ac b/opcodes/configure.ac
-index b9f5eb8a4f..a31b66a2f0 100644
+index a9fbfd61f1..c43780f64d 100644
 --- a/opcodes/configure.ac
 +++ b/opcodes/configure.ac
 @@ -167,7 +167,7 @@ changequote(,)dnl
@@ -19223,7 +19253,7 @@ index b9f5eb8a4f..a31b66a2f0 100644
  
    case "${host}" in
 diff --git a/zlib/configure b/zlib/configure
-index bed9e3ea2b..caef0b674e 100755
+index dc2d9ed383..ed9a492f5c 100755
 --- a/zlib/configure
 +++ b/zlib/configure
 @@ -614,8 +614,11 @@ OTOOL
@@ -19411,7 +19441,7 @@ index bed9e3ea2b..caef0b674e 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5170,9 +5271,163 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -5168,11 +5269,165 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -19425,6 +19455,8 @@ index bed9e3ea2b..caef0b674e 100755
 +
 +
 +
+ 
+ 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -19791,10 +19823,13 @@ index bed9e3ea2b..caef0b674e 100755
  
  
  
-@@ -5793,6 +6138,41 @@ fi
+@@ -5790,6 +6135,41 @@ fi
  
  
  
++
++
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -19827,12 +19862,9 @@ index bed9e3ea2b..caef0b674e 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
-+
-+
-+
  
  
- # Check whether --enable-libtool-lock was given.
+ 
 @@ -6004,6 +6384,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -21121,5 +21153,5 @@ index bed9e3ea2b..caef0b674e 100755
    chmod +x "$ofile"
  
 -- 
-2.12.0
+2.14.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0008-Add-the-armv5e-architecture-to-binutils.patch b/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
similarity index 83%
rename from meta/recipes-devtools/binutils/binutils/0008-Add-the-armv5e-architecture-to-binutils.patch
rename to meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
index 449225a362..88019606f7 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-Add-the-armv5e-architecture-to-binutils.patch
+++ b/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
@@ -1,7 +1,7 @@
-From 9c313e8a15a7e7c5c0f2906e3218ed211563ac2a Mon Sep 17 00:00:00 2001
+From 2b87aad1741bc481dd0982f100ad5ea7f937bb61 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:37:10 +0000
-Subject: [PATCH 08/15] Add the armv5e architecture to binutils
+Subject: [PATCH 07/15] Add the armv5e architecture to binutils
 
 Binutils has a comment that indicates it is supposed to match gcc for
 all of the support "-march=" settings, but it was lacking the armv5e setting.
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/gas/config/tc-arm.c b/gas/config/tc-arm.c
-index 60bda51070..eb6d0afd6e 100644
+index a885efe4fc..735eaa7447 100644
 --- a/gas/config/tc-arm.c
 +++ b/gas/config/tc-arm.c
-@@ -25633,6 +25633,7 @@ static const struct arm_arch_option_table arm_archs[] =
+@@ -25990,6 +25990,7 @@ static const struct arm_arch_option_table arm_archs[] =
    ARM_ARCH_OPT ("armv4t",	ARM_ARCH_V4T,	 FPU_ARCH_FPA),
    ARM_ARCH_OPT ("armv4txm",	ARM_ARCH_V4TxM,	 FPU_ARCH_FPA),
    ARM_ARCH_OPT ("armv5",	ARM_ARCH_V5,	 FPU_ARCH_VFP),
@@ -31,5 +31,5 @@ index 60bda51070..eb6d0afd6e 100644
    ARM_ARCH_OPT ("armv5txm",	ARM_ARCH_V5TxM,	 FPU_ARCH_VFP),
    ARM_ARCH_OPT ("armv5te",	ARM_ARCH_V5TE,	 FPU_ARCH_VFP),
 -- 
-2.12.0
+2.14.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0009-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
similarity index 82%
rename from meta/recipes-devtools/binutils/binutils/0009-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
rename to meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
index 1c40593927..30a22b504f 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
@@ -1,7 +1,7 @@
-From 2be9b44a4a308e3ea42a027c4c3211170f10c9c0 Mon Sep 17 00:00:00 2001
+From 331443a87a31ec504e5652fc099d9129a9a4deb8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:39:01 +0000
-Subject: [PATCH 09/15] don't let the distro compiler point to the wrong
+Subject: [PATCH 08/15] don't let the distro compiler point to the wrong
  installation location
 
 Thanks to RP for helping find the source code causing the issue.
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
-index 0ff9e45e45..42c32642b2 100644
+index 25cfa29ad5..ce67a710e3 100644
 --- a/libiberty/Makefile.in
 +++ b/libiberty/Makefile.in
-@@ -366,7 +366,8 @@ install-strip: install
+@@ -364,7 +364,8 @@ install-strip: install
  # multilib-specific flags, it's overridden by FLAGS_TO_PASS from the
  # default multilib, so we have to take CFLAGS into account as well,
  # since it will be passed the multilib flags.
@@ -31,5 +31,5 @@ index 0ff9e45e45..42c32642b2 100644
  	if test -n "${target_header_dir}"; then \
  		${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
 -- 
-2.12.0
+2.14.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0010-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
similarity index 87%
rename from meta/recipes-devtools/binutils/binutils/0010-warn-for-uses-of-system-directories-when-cross-linki.patch
rename to meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
index 0774ad6f0c..e0e257880d 100644
--- a/meta/recipes-devtools/binutils/binutils/0010-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -1,7 +1,7 @@
-From b1ab17abe4128684f19775448545176fb2a5e27e Mon Sep 17 00:00:00 2001
+From 0a4afdcf0700efd45963568e2d0049127cdf4434 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Jan 2016 06:31:09 +0000
-Subject: [PATCH 10/15] warn for uses of system directories when cross linking
+Subject: [PATCH 09/15] warn for uses of system directories when cross linking
 
 2008-07-02  Joseph Myers  <joseph@codesourcery.com>
 
@@ -45,12 +45,12 @@ Subject: [PATCH 10/15] warn for uses of system directories when cross linking
     ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of /lib,
     /usr/lib, /usr/local/lib or /usr/X11R6/lib.
 
+Upstream-Status: Pending
+
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
-
  ld/config.in    |  3 +++
  ld/configure    | 16 ++++++++++++++++
  ld/configure.ac | 10 ++++++++++
@@ -63,10 +63,10 @@ Upstream-Status: Pending
  9 files changed, 86 insertions(+)
 
 diff --git a/ld/config.in b/ld/config.in
-index 2c6d698b6c..d3cb7e882d 100644
+index a846743da6..df3cd5fb60 100644
 --- a/ld/config.in
 +++ b/ld/config.in
-@@ -17,6 +17,9 @@
+@@ -27,6 +27,9 @@
     language is requested. */
  #undef ENABLE_NLS
  
@@ -77,10 +77,10 @@ index 2c6d698b6c..d3cb7e882d 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index 4277b74bad..63109644b6 100755
+index 4e71511bd1..71c6ad1fd1 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -793,6 +793,7 @@ with_lib_path
+@@ -789,6 +789,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -88,7 +88,7 @@ index 4277b74bad..63109644b6 100755
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1450,6 +1451,8 @@ Optional Features:
+@@ -1448,6 +1449,8 @@ Optional Features:
    --disable-largefile     omit support for large files
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -97,7 +97,7 @@ index 4277b74bad..63109644b6 100755
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -16314,6 +16317,19 @@ fi
+@@ -16315,6 +16318,19 @@ fi
  
  
  
@@ -118,7 +118,7 @@ index 4277b74bad..63109644b6 100755
  if test "${enable_gold+set}" = set; then :
    enableval=$enable_gold; case "${enableval}" in
 diff --git a/ld/configure.ac b/ld/configure.ac
-index 36a9f5083a..47f1d33fa5 100644
+index 00080f85fd..3aa98e37fb 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
 @@ -95,6 +95,16 @@ AC_SUBST(use_sysroot)
@@ -139,12 +139,12 @@ index 36a9f5083a..47f1d33fa5 100644
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
 diff --git a/ld/ld.h b/ld/ld.h
-index 104bb8e237..74c914bdd5 100644
+index c6fa1247f0..01c373498f 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
-@@ -172,6 +172,14 @@ typedef struct
-   /* If set, display the target memory usage (per memory region).  */
-   bfd_boolean print_memory_usage;
+@@ -174,6 +174,14 @@ typedef struct
+      in the linker script.  */
+   bfd_boolean force_group_allocation;
  
 +  /* If TRUE (the default) warn for uses of system directories when
 +     cross linking.  */
@@ -158,10 +158,10 @@ index 104bb8e237..74c914bdd5 100644
    enum endian_enum endian;
  
 diff --git a/ld/ld.texinfo b/ld/ld.texinfo
-index d393acdd94..ba995b1e3a 100644
+index ebe7e7b7bd..33aa2c62fa 100644
 --- a/ld/ld.texinfo
 +++ b/ld/ld.texinfo
-@@ -2403,6 +2403,18 @@ string identifying the original linked file does not change.
+@@ -2480,6 +2480,18 @@ string identifying the original linked file does not change.
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
@@ -181,11 +181,11 @@ index d393acdd94..ba995b1e3a 100644
  
  @c man end
 diff --git a/ld/ldfile.c b/ld/ldfile.c
-index 0943bb2dfa..95874c75de 100644
+index 3b37a0a3e2..5c85b01849 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
-@@ -114,6 +114,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
-     new_dirs->name = concat (ld_sysroot, name + 1, (const char *) NULL);
+@@ -116,6 +116,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
+     new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
    else
      new_dirs->name = xstrdup (name);
 +
@@ -209,23 +209,23 @@ index 0943bb2dfa..95874c75de 100644
  
  /* Try to open a BFD for a lang_input_statement.  */
 diff --git a/ld/ldlex.h b/ld/ldlex.h
-index 3ecac2bc86..34117f43a5 100644
+index 5aa7f6bc3e..cb655e0399 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
-@@ -146,6 +146,8 @@ enum option_values
-   OPTION_PRINT_MEMORY_USAGE,
+@@ -147,6 +147,8 @@ enum option_values
    OPTION_REQUIRE_DEFINED_SYMBOL,
    OPTION_ORPHAN_HANDLING,
+   OPTION_FORCE_GROUP_ALLOCATION,
 +  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
 +  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
  };
  
  /* The initial parser states.  */
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index 1e48b1a2db..21f27bacf1 100644
+index 2b09f20413..89e2a3a805 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -270,6 +270,8 @@ main (int argc, char **argv)
+@@ -261,6 +261,8 @@ main (int argc, char **argv)
    command_line.warn_mismatch = TRUE;
    command_line.warn_search_mismatch = TRUE;
    command_line.check_section_addresses = -1;
@@ -235,10 +235,10 @@ index 1e48b1a2db..21f27bacf1 100644
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 0b7d4976ac..dedc07a143 100644
+index effa277b16..e4929607e9 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
-@@ -535,6 +535,14 @@ static const struct ld_option ld_options[] =
+@@ -538,6 +538,14 @@ static const struct ld_option ld_options[] =
    { {"orphan-handling", required_argument, NULL, OPTION_ORPHAN_HANDLING},
      '\0', N_("=MODE"), N_("Control how orphan sections are handled."),
      TWO_DASHES },
@@ -253,7 +253,7 @@ index 0b7d4976ac..dedc07a143 100644
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -1562,6 +1570,14 @@ parse_args (unsigned argc, char **argv)
+@@ -1568,6 +1576,14 @@ parse_args (unsigned argc, char **argv)
  	    einfo (_("%P%F: invalid argument to option"
  		     " \"--orphan-handling\"\n"));
  	  break;
@@ -269,5 +269,5 @@ index 0b7d4976ac..dedc07a143 100644
      }
  
 -- 
-2.12.0
+2.14.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0011-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
similarity index 92%
rename from meta/recipes-devtools/binutils/binutils/0011-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
rename to meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
index 949ef51bdf..496242efa4 100644
--- a/meta/recipes-devtools/binutils/binutils/0011-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
+++ b/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
@@ -1,7 +1,7 @@
-From 4fe13a36997253a5c91bcb086aeb392ab2095f67 Mon Sep 17 00:00:00 2001
+From 88fac08f1c472c612f381cbb9408756f2f58b4ff Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:42:38 +0000
-Subject: [PATCH 11/15] Fix rpath in libtool when sysroot is enabled
+Subject: [PATCH 10/15] Fix rpath in libtool when sysroot is enabled
 
 Enabling sysroot support in libtool exposed a bug where the final
 library had an RPATH encoded into it which still pointed to the
@@ -48,5 +48,5 @@ index 70e856e065..11ee684ccc 100644
  	    if test -z "$hardcode_libdirs"; then
  	      hardcode_libdirs="$libdir"
 -- 
-2.12.0
+2.14.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0012-Change-default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
similarity index 88%
rename from meta/recipes-devtools/binutils/binutils/0012-Change-default-emulation-for-mips64-linux.patch
rename to meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
index 2ac101c958..ac87a2d1de 100644
--- a/meta/recipes-devtools/binutils/binutils/0012-Change-default-emulation-for-mips64-linux.patch
+++ b/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
@@ -1,7 +1,7 @@
-From f43f832e0009caea6a3d5bcaa8f0a64d943072ea Mon Sep 17 00:00:00 2001
+From 497660bdbeb6788786553a5d733105f7f898dc62 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:44:14 +0000
-Subject: [PATCH 12/15] Change default emulation for mips64*-*-linux
+Subject: [PATCH 11/15] Change default emulation for mips64*-*-linux
 
 we change the default emulations to be N64 instead of N32
 
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/bfd/config.bfd b/bfd/config.bfd
-index 1b28016b91..63596c2ebc 100644
+index dc24aabad5..4511024f22 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -1183,12 +1183,12 @@ case "${targ}" in
+@@ -1186,12 +1186,12 @@ case "${targ}" in
      targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec mips_ecoff_be_vec mips_ecoff_le_vec"
      ;;
    mips64*el-*-linux*)
@@ -35,10 +35,10 @@ index 1b28016b91..63596c2ebc 100644
    mips*el-*-linux*)
      targ_defvec=mips_elf32_trad_le_vec
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index b85c6bb35a..4e77383a19 100644
+index 47c719cd05..fe7b9238b2 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -518,11 +518,11 @@ mips*el-*-vxworks*)	targ_emul=elf32elmipvxworks
+@@ -530,11 +530,11 @@ mips*el-*-vxworks*)	targ_emul=elf32elmipvxworks
  mips*-*-vxworks*)	targ_emul=elf32ebmipvxworks
  		        targ_extra_emuls="elf32elmipvxworks" ;;
  mips*-*-windiss)	targ_emul=elf32mipswindiss ;;
@@ -55,5 +55,5 @@ index b85c6bb35a..4e77383a19 100644
  mips*el-*-linux-*)	targ_emul=elf32ltsmip
  			targ_extra_emuls="elf32btsmip elf32ltsmipn32 elf64ltsmip elf32btsmipn32 elf64btsmip"
 -- 
-2.12.0
+2.14.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0013-Add-support-for-Netlogic-XLP.patch b/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
similarity index 82%
rename from meta/recipes-devtools/binutils/binutils/0013-Add-support-for-Netlogic-XLP.patch
rename to meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
index b03e04608d..dc5e580739 100644
--- a/meta/recipes-devtools/binutils/binutils/0013-Add-support-for-Netlogic-XLP.patch
+++ b/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
@@ -1,7 +1,7 @@
-From fc6fa6a6e6e9e6e5ad7080785af31b4ea68f60c4 Mon Sep 17 00:00:00 2001
+From 8c60a55d3678589d93739bd27fec216911d80968 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:06:19 +0000
-Subject: [PATCH 13/15] Add support for Netlogic XLP
+Subject: [PATCH 12/15] Add support for Netlogic XLP
 
 Patch From: Nebu Philips <nphilips@netlogicmicro.com>
 
@@ -11,12 +11,12 @@ Netlogic. Also, update vendor name to NLM wherever applicable.
 Use 0x00000080 for INSN_XLP, the value 0x00000040 has already been
 assigned to INSN_OCTEON3
 
+Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 ---
-Upstream-Status: Pending
-
  bfd/aoutx.h           |  1 +
  bfd/archures.c        |  1 +
  bfd/bfd-in2.h         |  1 +
@@ -27,17 +27,17 @@ Upstream-Status: Pending
  gas/config/tc-mips.c  |  4 +++-
  gas/configure         |  3 +++
  include/elf/mips.h    |  1 +
- include/opcode/mips.h | 10 ++++++++--
+ include/opcode/mips.h |  6 ++++++
  ld/configure.tgt      |  2 ++
  opcodes/mips-dis.c    | 12 +++++-------
- opcodes/mips-opc.c    | 33 +++++++++++++++++++++------------
- 14 files changed, 64 insertions(+), 24 deletions(-)
+ opcodes/mips-opc.c    | 31 ++++++++++++++++++++-----------
+ 14 files changed, 61 insertions(+), 21 deletions(-)
 
 diff --git a/bfd/aoutx.h b/bfd/aoutx.h
-index d30e8b8fbc..913b499744 100644
+index 3d38fda14b..0aec49bbb3 100644
 --- a/bfd/aoutx.h
 +++ b/bfd/aoutx.h
-@@ -812,6 +812,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,
+@@ -814,6 +814,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,
  	case bfd_mach_mipsisa64r6:
  	case bfd_mach_mips_sb1:
  	case bfd_mach_mips_xlr:
@@ -46,34 +46,34 @@ index d30e8b8fbc..913b499744 100644
  	  arch_flags = M_MIPS2;
  	  break;
 diff --git a/bfd/archures.c b/bfd/archures.c
-index 6f35a5b2a7..d12cdf609a 100644
+index 433b95fa08..063b7943a1 100644
 --- a/bfd/archures.c
 +++ b/bfd/archures.c
-@@ -197,6 +197,7 @@ DESCRIPTION
- .#define bfd_mach_mips_octeon2		6502
+@@ -201,6 +201,7 @@ DESCRIPTION
  .#define bfd_mach_mips_octeon3          6503
  .#define bfd_mach_mips_xlr              887682   {* decimal 'XLR'  *}
+ .#define bfd_mach_mips_interaptiv_mr2   736550   {* decimal 'IA2'  *}
 +.#define bfd_mach_mips_xlp              887680   {* decimal 'XLP'  *}
  .#define bfd_mach_mipsisa32             32
  .#define bfd_mach_mipsisa32r2           33
  .#define bfd_mach_mipsisa32r3           34
 diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
-index 6288c3bb4a..e9f9859a7b 100644
+index d126aed086..2b753b3a93 100644
 --- a/bfd/bfd-in2.h
 +++ b/bfd/bfd-in2.h
-@@ -2041,6 +2041,7 @@ enum bfd_architecture
- #define bfd_mach_mips_octeon2          6502
+@@ -2060,6 +2060,7 @@ enum bfd_architecture
  #define bfd_mach_mips_octeon3          6503
  #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'  */
+ #define bfd_mach_mips_interaptiv_mr2   736550   /* decimal 'IA2'  */
 +#define bfd_mach_mips_xlp              887680   /* decimal 'XLP'  */
  #define bfd_mach_mipsisa32             32
  #define bfd_mach_mipsisa32r2           33
  #define bfd_mach_mipsisa32r3           34
 diff --git a/bfd/config.bfd b/bfd/config.bfd
-index 63596c2ebc..6e923fb0ed 100644
+index 4511024f22..f0f9072f10 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -1166,6 +1166,11 @@ case "${targ}" in
+@@ -1169,6 +1169,11 @@ case "${targ}" in
      targ_defvec=mips_elf32_le_vec
      targ_selvecs="mips_elf32_be_vec mips_elf64_be_vec mips_elf64_le_vec"
      ;;
@@ -86,23 +86,23 @@ index 63596c2ebc..6e923fb0ed 100644
      targ_defvec=mips_elf32_be_vec
      targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec"
 diff --git a/bfd/cpu-mips.c b/bfd/cpu-mips.c
-index b9ecdd6e55..df1bffc25b 100644
+index 2493094bef..8375d1ae96 100644
 --- a/bfd/cpu-mips.c
 +++ b/bfd/cpu-mips.c
-@@ -104,7 +104,8 @@ enum
-   I_mipsocteon2,
+@@ -105,7 +105,8 @@ enum
    I_mipsocteon3,
    I_xlr,
+   I_interaptiv_mr2,
 -  I_micromips
 +  I_micromips,
 +  I_xlp
  };
  
  #define NN(index) (&arch_info_struct[(index) + 1])
-@@ -155,7 +156,8 @@ static const bfd_arch_info_type arch_info_struct[] =
-   N (64, 64, bfd_mach_mips_octeon2,"mips:octeon2",  FALSE, NN(I_mipsocteon2)),
-   N (64, 64, bfd_mach_mips_octeon3, "mips:octeon3",  FALSE, NN(I_mipsocteon3)),
+@@ -158,7 +159,8 @@ static const bfd_arch_info_type arch_info_struct[] =
    N (64, 64, bfd_mach_mips_xlr, "mips:xlr",       FALSE, NN(I_xlr)),
+   N (32, 32, bfd_mach_mips_interaptiv_mr2, "mips:interaptiv-mr2", FALSE,
+      NN(I_interaptiv_mr2)),
 -  N (64, 64, bfd_mach_mips_micromips,"mips:micromips",FALSE,0)
 +  N (64, 64, bfd_mach_mips_micromips,"mips:micromips",FALSE,NN(I_micromips)),
 +  N (64, 64, bfd_mach_mips_xlp, "mips:xlp",      FALSE, 0)
@@ -110,20 +110,20 @@ index b9ecdd6e55..df1bffc25b 100644
  
  /* The default architecture is mips:3000, but with a machine number of
 diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c
-index 723853f821..7b464211c3 100644
+index fddf68c816..354c85d00b 100644
 --- a/bfd/elfxx-mips.c
 +++ b/bfd/elfxx-mips.c
-@@ -6787,6 +6787,9 @@ _bfd_elf_mips_mach (flagword flags)
-     case E_MIPS_MACH_XLR:
-       return bfd_mach_mips_xlr;
+@@ -6796,6 +6796,9 @@ _bfd_elf_mips_mach (flagword flags)
+     case E_MIPS_MACH_IAMR2:
+       return bfd_mach_mips_interaptiv_mr2;
  
-+	case E_MIPS_MACH_XLP:
++    case E_MIPS_MACH_XLP:
 +      return bfd_mach_mips_xlp;
 +
      default:
        switch (flags & EF_MIPS_ARCH)
  	{
-@@ -12106,6 +12109,10 @@ mips_set_isa_flags (bfd *abfd)
+@@ -11956,6 +11959,10 @@ mips_set_isa_flags (bfd *abfd)
        val = E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;
        break;
  
@@ -134,7 +134,7 @@ index 723853f821..7b464211c3 100644
      case bfd_mach_mipsisa32:
        val = E_MIPS_ARCH_32;
        break;
-@@ -14135,6 +14142,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
+@@ -13989,6 +13996,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
    { bfd_mach_mips_octeonp, bfd_mach_mips_octeon },
    { bfd_mach_mips_octeon, bfd_mach_mipsisa64r2 },
    { bfd_mach_mips_loongson_3a, bfd_mach_mipsisa64r2 },
@@ -143,19 +143,19 @@ index 723853f821..7b464211c3 100644
    /* MIPS64 extensions.  */
    { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },
 diff --git a/binutils/readelf.c b/binutils/readelf.c
-index 8dca490226..b5f577f5a1 100644
+index 2b15f0f2cb..092744708e 100644
 --- a/binutils/readelf.c
 +++ b/binutils/readelf.c
-@@ -3261,6 +3261,7 @@ get_machine_flags (unsigned e_flags, unsigned e_machine)
- 	    case E_MIPS_MACH_OCTEON2: strcat (buf, ", octeon2"); break;
+@@ -3335,6 +3335,7 @@ get_machine_flags (unsigned e_flags, unsigned e_machine)
  	    case E_MIPS_MACH_OCTEON3: strcat (buf, ", octeon3"); break;
  	    case E_MIPS_MACH_XLR:  strcat (buf, ", xlr"); break;
-+		case E_MIPS_MACH_XLP:  strcat (buf, ", xlp"); break;
+ 	    case E_MIPS_MACH_IAMR2:  strcat (buf, ", interaptiv-mr2"); break;
++	    case E_MIPS_MACH_XLP:  strcat (buf, ", xlp"); break;
  	    case 0:
  	    /* We simply ignore the field in this case to avoid confusion:
  	       MIPS ELF does not specify EF_MIPS_MACH, it is a GNU
 diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c
-index e24e84df54..baf84e419d 100644
+index 3804df2958..9576c986db 100644
 --- a/gas/config/tc-mips.c
 +++ b/gas/config/tc-mips.c
 @@ -552,6 +552,7 @@ static int mips_32bitmode = 0;
@@ -174,7 +174,7 @@ index e24e84df54..baf84e419d 100644
     )
  
  /* Whether the processor uses hardware interlocks to protect reads
-@@ -19409,7 +19411,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
+@@ -19738,7 +19740,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
    /* Broadcom XLP.
       XLP is mostly like XLR, with the prominent exception that it is
       MIPS64R2 rather than MIPS64.  */
@@ -184,7 +184,7 @@ index e24e84df54..baf84e419d 100644
    /* MIPS 64 Release 6 */
    { "i6400",	      0, ASE_MSA,		ISA_MIPS64R6, CPU_MIPS64R6},
 diff --git a/gas/configure b/gas/configure
-index a36f1ae161..99f0a94e20 100755
+index 81dd4cbd97..95bdf3b19b 100755
 --- a/gas/configure
 +++ b/gas/configure
 @@ -12989,6 +12989,9 @@ _ACEOF
@@ -198,7 +198,7 @@ index a36f1ae161..99f0a94e20 100755
  	    mips_cpu=r3900
  	    ;;
 diff --git a/include/elf/mips.h b/include/elf/mips.h
-index 3e27b05122..81ea78a817 100644
+index a4bea43ff8..73d904e25f 100644
 --- a/include/elf/mips.h
 +++ b/include/elf/mips.h
 @@ -290,6 +290,7 @@ END_RELOC_NUMBERS (R_MIPS_maxext)
@@ -210,31 +210,27 @@ index 3e27b05122..81ea78a817 100644
  #define E_MIPS_MACH_OCTEON3	0x008e0000
  #define E_MIPS_MACH_5400	0x00910000
 diff --git a/include/opcode/mips.h b/include/opcode/mips.h
-index 0d043d9520..450e9c2d67 100644
+index ceae9ec50a..276ee3c6c1 100644
 --- a/include/opcode/mips.h
 +++ b/include/opcode/mips.h
-@@ -1244,8 +1244,10 @@ static const unsigned int mips_isa_table[] = {
- #define INSN_LOONGSON_2F          0x80000000
- /* Loongson 3A.  */
- #define INSN_LOONGSON_3A          0x00000400
--/* RMI Xlr instruction */
--#define INSN_XLR                 0x00000020
-+/* Netlogic Xlr instruction */
-+#define INSN_XLR		0x00000020
+@@ -1259,6 +1259,8 @@ static const unsigned int mips_isa_table[] = {
+ #define INSN_XLR                 0x00000020
+ /* Imagination interAptiv MR2.  */
+ #define INSN_INTERAPTIV_MR2	  0x04000000
 +/* Netlogic XlP instruction */
 +#define INSN_XLP		0x00000080
  
  /* DSP ASE */
  #define ASE_DSP			0x00000001
-@@ -1344,6 +1346,7 @@ static const unsigned int mips_isa_table[] = {
- #define CPU_OCTEON2	6502
+@@ -1365,6 +1367,7 @@ static const unsigned int mips_isa_table[] = {
  #define CPU_OCTEON3	6503
  #define CPU_XLR     	887682   	/* decimal 'XLR'   */
+ #define CPU_INTERAPTIV_MR2 736550	/* decimal 'IA2'  */
 +#define CPU_XLP         887680      /* decimal 'XLP'   */
  
  /* Return true if the given CPU is included in INSN_* mask MASK.  */
  
-@@ -1421,6 +1424,9 @@ cpu_is_member (int cpu, unsigned int mask)
+@@ -1445,6 +1448,9 @@ cpu_is_member (int cpu, unsigned int mask)
        return ((mask & INSN_ISA_MASK) == INSN_ISA32R6)
  	     || ((mask & INSN_ISA_MASK) == INSN_ISA64R6);
  
@@ -245,10 +241,10 @@ index 0d043d9520..450e9c2d67 100644
        return FALSE;
      }
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index 4e77383a19..8a81f7ac39 100644
+index fe7b9238b2..2adf108b17 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -504,6 +504,8 @@ mips*el-sde-elf* | mips*el-mti-elf* | mips*el-img-elf*)
+@@ -516,6 +516,8 @@ mips*el-sde-elf* | mips*el-mti-elf* | mips*el-img-elf*)
  mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
  			targ_emul=elf32btsmip
  			targ_extra_emuls="elf32ltsmip elf32btsmipn32 elf64btsmip elf32ltsmipn32 elf64ltsmip" ;;
@@ -258,10 +254,10 @@ index 4e77383a19..8a81f7ac39 100644
  			targ_extra_emuls="elf32lr5900"
  			targ_extra_libpath=$targ_extra_emuls ;;
 diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c
-index bb9912e462..70ecc51717 100644
+index 45195007c1..4a80a05d19 100644
 --- a/opcodes/mips-dis.c
 +++ b/opcodes/mips-dis.c
-@@ -648,13 +648,11 @@ const struct mips_arch_choice mips_arch_choices[] =
+@@ -655,13 +655,11 @@ const struct mips_arch_choice mips_arch_choices[] =
      mips_cp0sel_names_xlr, ARRAY_SIZE (mips_cp0sel_names_xlr),
      mips_cp1_names_mips3264, mips_hwr_names_numeric },
  
@@ -281,20 +277,18 @@ index bb9912e462..70ecc51717 100644
    /* This entry, mips16, is here only for ISA/processor selection; do
       not print its name.  */
 diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c
-index 5cb8e7365f..f2074856a2 100644
+index 19fca408c9..d02069c528 100644
 --- a/opcodes/mips-opc.c
 +++ b/opcodes/mips-opc.c
-@@ -320,7 +320,8 @@ decode_mips_operand (const char *p)
- #define IOCTP	(INSN_OCTEONP | INSN_OCTEON2 | INSN_OCTEON3)
- #define IOCT2	(INSN_OCTEON2 | INSN_OCTEON3)
+@@ -328,6 +328,7 @@ decode_mips_operand (const char *p)
  #define IOCT3	INSN_OCTEON3
--#define XLR     INSN_XLR
-+#define XLR	INSN_XLR
+ #define XLR     INSN_XLR
+ #define IAMR2	INSN_INTERAPTIV_MR2
 +#define XLP	INSN_XLP
  #define IVIRT	ASE_VIRT
  #define IVIRT64	ASE_VIRT64
  
-@@ -958,6 +959,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -966,6 +967,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"clo",			"U,s",		0x70000021, 0xfc0007ff, WR_1|RD_2,		0,		I32|N55,	0,	I37 },
  {"clz",			"d,s",		0x00000050, 0xfc1f07ff, WR_1|RD_2,		0,		I37,		0,	0 },
  {"clz",			"U,s",		0x70000020, 0xfc0007ff, WR_1|RD_2,		0,		I32|N55,	0,	I37 },
@@ -302,7 +296,7 @@ index 5cb8e7365f..f2074856a2 100644
  /* ctc0 is at the bottom of the table.  */
  {"ctc1",		"t,G",		0x44c00000, 0xffe007ff,	RD_1|WR_CC|CM,		0,		I1,		0,	0 },
  {"ctc1",		"t,S",		0x44c00000, 0xffe007ff,	RD_1|WR_CC|CM,		0,		I1,		0,	0 },
-@@ -990,12 +992,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -998,12 +1000,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"daddiu",		"t,r,j",	0x64000000, 0xfc000000, WR_1|RD_2,		0,		I3,		0,	0 },
  {"daddu",		"d,v,t",	0x0000002d, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I3,		0,	0 },
  {"daddu",		"t,r,I",	0,    (int) M_DADDU_I,	INSN_MACRO,		0,		I3,		0,	0 },
@@ -317,7 +311,7 @@ index 5cb8e7365f..f2074856a2 100644
  /* dctr and dctw are used on the r5000.  */
  {"dctr",		"o(b)",	 	0xbc050000, 0xfc1f0000, RD_2,			0,		I3,		0,	0 },
  {"dctw",		"o(b)",		0xbc090000, 0xfc1f0000, RD_2,			0,		I3,		0,	0 },
-@@ -1067,6 +1070,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1075,6 +1078,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"dmfc0",		"t,G,H",	0x40200000, 0xffe007f8,	WR_1|RD_C0|LC,		0,		I64,		0,	0 },
  {"dmfgc0",		"t,G",		0x40600100, 0xffe007ff, WR_1|RD_C0|LC,		0,		0,		IVIRT64, 0 },
  {"dmfgc0",		"t,G,H",	0x40600100, 0xffe007f8, WR_1|RD_C0|LC,		0,		0,		IVIRT64, 0 },
@@ -325,7 +319,7 @@ index 5cb8e7365f..f2074856a2 100644
  {"dmt",			"",		0x41600bc1, 0xffffffff, TRAP,			0,		0,		MT32,	0 },
  {"dmt",			"t",		0x41600bc1, 0xffe0ffff, WR_1|TRAP,		0,		0,		MT32,	0 },
  {"dmtc0",		"t,G",		0x40a00000, 0xffe007ff,	RD_1|WR_C0|WR_CC|CM,	0,		I3,		0,	EE },
-@@ -1082,6 +1086,8 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1090,6 +1094,8 @@ const struct mips_opcode mips_builtin_opcodes[] =
  /* dmfc3 is at the bottom of the table.  */
  /* dmtc3 is at the bottom of the table.  */
  {"dmuh",		"d,s,t",	0x000000dc, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I69,		0,	0 },
@@ -334,7 +328,7 @@ index 5cb8e7365f..f2074856a2 100644
  {"dmul",		"d,s,t",	0x0000009c, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I69,		0,	0 },
  {"dmul",		"d,v,t",	0x70000003, 0xfc0007ff, WR_1|RD_2|RD_3|WR_HILO,	0,		IOCT,		0,	0 },
  {"dmul",		"d,v,t",	0,    (int) M_DMUL,	INSN_MACRO,		0,		I3,		0,	M32|I69 },
-@@ -1235,9 +1241,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1243,9 +1249,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"ld",			"s,-b(+R)",	0xec180000, 0xfc1c0000, WR_1,			RD_pc,		I69,		0,	0 },
  {"ld",			"t,A(b)",	0,    (int) M_LD_AB,	INSN_MACRO,		0,		I1,		0,	0 },
  {"ld",			"t,o(b)",	0xdc000000, 0xfc000000, WR_1|RD_3|LM,		0,		I3,		0,	0 },
@@ -347,7 +341,7 @@ index 5cb8e7365f..f2074856a2 100644
  {"ldc1",		"T,o(b)",	0xd4000000, 0xfc000000, WR_1|RD_3|CLD|FP_D,	0,		I2,		0,	SF },
  {"ldc1",		"E,o(b)",	0xd4000000, 0xfc000000, WR_1|RD_3|CLD|FP_D,	0,		I2,		0,	SF },
  {"ldc1",		"T,A(b)",	0,    (int) M_LDC1_AB,	INSN_MACRO,		INSN2_M_FP_D,	I2,		0,	SF },
-@@ -1402,7 +1408,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1410,7 +1416,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"mflo",		"d,9",		0x00000012, 0xff9f07ff, WR_1|RD_LO,		0,		0,		D32,	0 },
  {"mflo1",		"d",		0x70000012, 0xffff07ff,	WR_1|RD_LO,		0,		EE,		0,	0 },
  {"mflhxu",		"d",		0x00000052, 0xffff07ff,	WR_1|MOD_HILO,		0,		0,		SMT,	0 },
@@ -356,7 +350,7 @@ index 5cb8e7365f..f2074856a2 100644
  {"mfsa",		"d",		0x00000028, 0xffff07ff,	WR_1,			0,		EE,		0,	0 },
  {"min.ob",		"X,Y,Q",	0x78000006, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		SB1,		MX,	0 },
  {"min.ob",		"D,S,Q",	0x48000006, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		N54,		0,	0 },
-@@ -1447,10 +1453,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1455,10 +1461,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
  /* move is at the top of the table.  */
  {"msgn.qh",		"X,Y,Q",	0x78200000, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		0,		MX,	0 },
  {"msgsnd",		"t",		0,    (int) M_MSGSND,	INSN_MACRO,		0,		XLR,		0,	0 },
@@ -372,7 +366,7 @@ index 5cb8e7365f..f2074856a2 100644
  {"msub.d",		"D,R,S,T",	0x4c000029, 0xfc00003f, WR_1|RD_2|RD_3|RD_4|FP_D, 0,		I4_33,		0,	I37 },
  {"msub.d",		"D,S,T",	0x46200019, 0xffe0003f,	WR_1|RD_2|RD_3|FP_D,	0,		IL2E,		0,	0 },
  {"msub.d",		"D,S,T",	0x72200019, 0xffe0003f,	WR_1|RD_2|RD_3|FP_D,	0,		IL2F,		0,	0 },
-@@ -1500,7 +1509,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1508,7 +1517,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"mtlo",		"s,7",		0x00000013, 0xfc1fe7ff, RD_1|WR_LO,		0,		0,		D32,	0 },
  {"mtlo1",		"s",		0x70000013, 0xfc1fffff,	RD_1|WR_LO,		0,		EE,		0,	0 },
  {"mtlhx",		"s",		0x00000053, 0xfc1fffff,	RD_1|MOD_HILO,		0,		0,		SMT,	0 },
@@ -381,7 +375,7 @@ index 5cb8e7365f..f2074856a2 100644
  {"mtm0",		"s",		0x70000008, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
  {"mtm0",    		"s,t",		0x70000008, 0xfc00ffff, RD_1|RD_2,		0,		IOCT3,		0,	0 },
  {"mtm1",		"s",		0x7000000c, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
-@@ -1937,9 +1946,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1945,9 +1954,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"suxc1",		"S,t(b)",	0x4c00000d, 0xfc0007ff, RD_1|RD_2|RD_3|SM|FP_D,	0,		I5_33|N55,	0,	I37},
  {"sw",			"t,o(b)",	0xac000000, 0xfc000000,	RD_1|RD_3|SM,		0,		I1,		0,	0 },
  {"sw",			"t,A(b)",	0,    (int) M_SW_AB,	INSN_MACRO,		0,		I1,		0,	0 },
@@ -395,5 +389,5 @@ index 5cb8e7365f..f2074856a2 100644
  {"swc0",		"E,A(b)",	0,    (int) M_SWC0_AB,	INSN_MACRO,		0,		I1,		0,	IOCT|IOCTP|IOCT2|I37 },
  {"swc1",		"T,o(b)",	0xe4000000, 0xfc000000,	RD_1|RD_3|SM|FP_S,	0,		I1,		0,	0 },
 -- 
-2.12.0
+2.14.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0014-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
similarity index 76%
rename from meta/recipes-devtools/binutils/binutils/0014-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
rename to meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
index bb95a0cb06..247376b7ed 100644
--- a/meta/recipes-devtools/binutils/binutils/0014-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
+++ b/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
@@ -1,7 +1,7 @@
-From a9177150f808d7e6285e1011c85d0ce89037b553 Mon Sep 17 00:00:00 2001
+From e46202becab625c6c08caf91e08ccbbc1bf799c4 Mon Sep 17 00:00:00 2001
 From: Zhenhua Luo <zhenhua.luo@nxp.com>
 Date: Sat, 11 Jun 2016 22:08:29 -0500
-Subject: [PATCH 14/15] fix the incorrect assembling for ppc wait mnemonic
+Subject: [PATCH 13/15] fix the incorrect assembling for ppc wait mnemonic
 
 Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
 
@@ -11,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
-index 30fd789182..f2708e2276 100644
+index 426261ab21..0d35916cdd 100644
 --- a/opcodes/ppc-opc.c
 +++ b/opcodes/ppc-opc.c
-@@ -4876,7 +4876,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+@@ -4881,7 +4881,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
  {"ldepx",	X(31,29),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
  
  {"waitasec",	X(31,30),      XRTRARB_MASK, POWER8,	POWER9,		{0}},
@@ -22,7 +22,7 @@ index 30fd789182..f2708e2276 100644
  
  {"lwepx",	X(31,31),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
  
-@@ -4930,7 +4929,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+@@ -4935,7 +4934,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
  
  {"waitrsv",	X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
  {"waitimpl",	X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
@@ -32,5 +32,5 @@ index 30fd789182..f2708e2276 100644
  {"dcbstep",	XRT(31,63,0),	XRT_MASK,    E500MC|PPCA2, 0,		{RA0, RB}},
  
 -- 
-2.12.0
+2.14.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0016-Detect-64-bit-MIPS-targets.patch b/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch
similarity index 89%
rename from meta/recipes-devtools/binutils/binutils/0016-Detect-64-bit-MIPS-targets.patch
rename to meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch
index 1b2eb8485c..42b1065f8d 100644
--- a/meta/recipes-devtools/binutils/binutils/0016-Detect-64-bit-MIPS-targets.patch
+++ b/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch
@@ -1,7 +1,7 @@
-From c3ebde5d8cc3b0092966b4d725cad7cfd074fd8d Mon Sep 17 00:00:00 2001
+From bf20d5823662d1f2eb47de2cdfd173627a205b17 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 31 Mar 2017 11:42:03 -0700
-Subject: [PATCH 16/16] Detect 64-bit MIPS targets
+Subject: [PATCH 14/15] Detect 64-bit MIPS targets
 
 Add mips64 target triplets and default to N64
 
@@ -46,5 +46,5 @@ index 3d63027297..c1f92a1360 100644
   targ_obj=mips
   targ_machine=EM_MIPS
 -- 
-2.12.1
+2.14.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
index 1559038e50..2c8900cb66 100644
--- a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
+++ b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
@@ -1,4 +1,4 @@
-From 58cdb28ed71cb57b4a0ea1b412a708fdb0f84c27 Mon Sep 17 00:00:00 2001
+From 9b456a0e4f284fd41ac36595144ed44dc82410ee Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Mar 2017 23:33:27 -0800
 Subject: [PATCH 15/15] sync with OE libtool changes
@@ -85,5 +85,5 @@ index 11ee684ccc..3b19ac1532 100644
  	elif test -n "$runpath_var"; then
  	  case "$finalize_perm_rpath " in
 -- 
-2.12.0
+2.14.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0017-bfd-Improve-lookup-of-file-line-information-for-erro.patch b/meta/recipes-devtools/binutils/binutils/0017-bfd-Improve-lookup-of-file-line-information-for-erro.patch
deleted file mode 100644
index 23ad10ab4a..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0017-bfd-Improve-lookup-of-file-line-information-for-erro.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 3239a4231ff79bf8b67b8faaf414b1667486167c Mon Sep 17 00:00:00 2001
-From: Andrew Burgess <andrew.burgess@embecosm.com>
-Date: Mon, 19 Dec 2016 15:27:59 +0000
-Subject: [PATCH] bfd: Improve lookup of file / line information for errors
-
-When looking up file and line information (used from the linker to
-report error messages) if no symbol is passed in, then use the symbol
-list to look for a matching symbol.
-
-If a matching symbol is found then use this to look up the file / line
-information.
-
-This should improve errors when looking up file / line information for
-data sections.  Hopefully we should find a matching data symbol, which
-should, in turn (we hope) match a DW_TAG_variable in the DWARF, this
-should allow us to give accurate file / line errors for data symbols.
-
-As the hope is to find a matching DW_TAG_variable in the DWARF then we
-ignore section symbols, and prefer global symbols to locals.
-
-CVE: CVE-2017-8392
-Upstream-Status: Accepted
-
-Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
----
- bfd/dwarf2.c                   | 32 ++++++++++++++++++++++++++++++++
- 1 files changed, 32 insertions(+)
-
-
-diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
-index 03447a9..9bb8126 100644
---- a/bfd/dwarf2.c
-+++ b/bfd/dwarf2.c
-@@ -4155,6 +4155,38 @@ _bfd_dwarf2_find_nearest_line (bfd *abfd,
-     {
-       BFD_ASSERT (section != NULL && functionname_ptr != NULL);
-       addr = offset;
-+
-+      /* If we have no SYMBOL but the section we're looking at is not a
-+         code section, then take a look through the list of symbols to see
-+         if we have a symbol at the address we're looking for.  If we do
-+         then use this to look up line information.  This will allow us to
-+         give file and line results for data symbols.  We exclude code
-+         symbols here, if we look up a function symbol and then look up the
-+         line information we'll actually return the line number for the
-+         opening '{' rather than the function definition line.  This is
-+         because looking up by symbol uses the line table, in which the
-+         first line for a function is usually the opening '{', while
-+         looking up the function by section + offset uses the
-+         DW_AT_decl_line from the function DW_TAG_subprogram for the line,
-+         which will be the line of the function name.  */
-+      if ((section->flags & SEC_CODE) == 0)
-+	{
-+	  asymbol **tmp;
-+
-+	  for (tmp = symbols; (*tmp) != NULL; ++tmp)
-+	    if ((*tmp)->the_bfd == abfd
-+		&& (*tmp)->section == section
-+		&& (*tmp)->value == offset
-+		&& ((*tmp)->flags & BSF_SECTION_SYM) == 0)
-+	      {
-+		symbol = *tmp;
-+		do_line = TRUE;
-+                /* For local symbols, keep going in the hope we find a
-+                   global.  */
-+                if ((symbol->flags & BSF_GLOBAL) != 0)
-+                  break;
-+	      }
-+	}
-     }
- 
-   if (section->output_section)
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0018-PR-21409-segfault-in-_bfd_dwarf2_find_nearest_line.patch b/meta/recipes-devtools/binutils/binutils/0018-PR-21409-segfault-in-_bfd_dwarf2_find_nearest_line.patch
deleted file mode 100644
index acb37df168..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0018-PR-21409-segfault-in-_bfd_dwarf2_find_nearest_line.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 97e83a100aa8250be783304bfe0429761c6e6b6b Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Sun, 23 Apr 2017 13:55:49 +0930
-Subject: [PATCH] PR 21409, segfault in _bfd_dwarf2_find_nearest_line
-
-	PR 21409
-	* dwarf2.c (_bfd_dwarf2_find_nearest_line): Don't segfault when
-	no symbols.
-
-CVE: CVE-2017-8392
-Upstream-Status: Accepted
-
-Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
----
- bfd/dwarf2.c  | 2 +-
- 1 files changed, 1 insertions(+), 1 deletion(-)
-
-diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
-index 132a674..0ef3e1f 100644
---- a/bfd/dwarf2.c
-+++ b/bfd/dwarf2.c
-@@ -4205,7 +4205,7 @@ _bfd_dwarf2_find_nearest_line (bfd *abfd,
-          looking up the function by section + offset uses the
-          DW_AT_decl_line from the function DW_TAG_subprogram for the line,
-          which will be the line of the function name.  */
--      if ((section->flags & SEC_CODE) == 0)
-+      if (symbols != NULL && (section->flags & SEC_CODE) == 0)
- 	{
- 	  asymbol **tmp;
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-6965.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-6965.patch
deleted file mode 100644
index 6697d4bc95..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2017-6965.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From bdc5166c274b842f83f8328e7cfaaf80fd29934e Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Mon, 13 Feb 2017 13:08:32 +0000
-Subject: [PATCH 1/2] Fix readelf writing to illegal addresses whilst
- processing corrupt input files containing symbol-difference relocations.
-
-	PR binutils/21137
-	* readelf.c (target_specific_reloc_handling): Add end parameter.
-	Check for buffer overflow before writing relocated values.
-	(apply_relocations): Pass end to target_specific_reloc_handling.
-
-(cherry pick from commit 03f7786e2f440b9892b1c34a58fb26222ce1b493)
-Upstream-Status: Backport [master]
-CVE: CVE-2017-6965
-
-Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
----
- binutils/ChangeLog |  7 +++++++
- binutils/readelf.c | 30 +++++++++++++++++++++++++-----
- 2 files changed, 32 insertions(+), 5 deletions(-)
-
-diff --git a/binutils/readelf.c b/binutils/readelf.c
-index b5f577f5a1..8cdaae3b8c 100644
---- a/binutils/readelf.c
-+++ b/binutils/readelf.c
-@@ -11585,6 +11585,7 @@ process_syminfo (FILE * file ATTRIBUTE_UNUSED)
- static bfd_boolean
- target_specific_reloc_handling (Elf_Internal_Rela * reloc,
- 				unsigned char *     start,
-+				unsigned char *     end,
- 				Elf_Internal_Sym *  symtab)
- {
-   unsigned int reloc_type = get_reloc_type (reloc->r_info);
-@@ -11625,13 +11626,19 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
- 	  handle_sym_diff:
- 	    if (saved_sym != NULL)
- 	      {
-+		int reloc_size = reloc_type == 1 ? 4 : 2;
- 		bfd_vma value;
- 
- 		value = reloc->r_addend
- 		  + (symtab[get_reloc_symindex (reloc->r_info)].st_value
- 		     - saved_sym->st_value);
- 
--		byte_put (start + reloc->r_offset, value, reloc_type == 1 ? 4 : 2);
-+		if (start + reloc->r_offset + reloc_size >= end)
-+		  /* PR 21137 */
-+		  error (_("MSP430 sym diff reloc writes past end of section (%p vs %p)\n"),
-+			 start + reloc->r_offset + reloc_size, end);
-+		else
-+		  byte_put (start + reloc->r_offset, value, reloc_size);
- 
- 		saved_sym = NULL;
- 		return TRUE;
-@@ -11662,13 +11669,18 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
- 	  case 2: /* R_MN10300_16 */
- 	    if (saved_sym != NULL)
- 	      {
-+		int reloc_size = reloc_type == 1 ? 4 : 2;
- 		bfd_vma value;
- 
- 		value = reloc->r_addend
- 		  + (symtab[get_reloc_symindex (reloc->r_info)].st_value
- 		     - saved_sym->st_value);
- 
--		byte_put (start + reloc->r_offset, value, reloc_type == 1 ? 4 : 2);
-+		if (start + reloc->r_offset + reloc_size >= end)
-+		  error (_("MN10300 sym diff reloc writes past end of section (%p vs %p)\n"),
-+			 start + reloc->r_offset + reloc_size, end);
-+		else
-+		  byte_put (start + reloc->r_offset, value, reloc_size);
- 
- 		saved_sym = NULL;
- 		return TRUE;
-@@ -11703,12 +11715,20 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
- 	    break;
- 
- 	  case 0x41: /* R_RL78_ABS32.  */
--	    byte_put (start + reloc->r_offset, value, 4);
-+	    if (start + reloc->r_offset + 4 >= end)
-+	      error (_("RL78 sym diff reloc writes past end of section (%p vs %p)\n"),
-+		     start + reloc->r_offset + 2, end);
-+	    else
-+	      byte_put (start + reloc->r_offset, value, 4);
- 	    value = 0;
- 	    return TRUE;
- 
- 	  case 0x43: /* R_RL78_ABS16.  */
--	    byte_put (start + reloc->r_offset, value, 2);
-+	    if (start + reloc->r_offset + 2 >= end)
-+	      error (_("RL78 sym diff reloc writes past end of section (%p vs %p)\n"),
-+		     start + reloc->r_offset + 2, end);
-+	    else
-+	      byte_put (start + reloc->r_offset, value, 2);
- 	    value = 0;
- 	    return TRUE;
- 
-@@ -12325,7 +12345,7 @@ apply_relocations (void *                     file,
- 
- 	  reloc_type = get_reloc_type (rp->r_info);
- 
--	  if (target_specific_reloc_handling (rp, start, symtab))
-+	  if (target_specific_reloc_handling (rp, start, end, symtab))
- 	    continue;
- 	  else if (is_none_reloc (reloc_type))
- 	    continue;
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-6966.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-6966.patch
deleted file mode 100644
index 206e493b6e..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2017-6966.patch
+++ /dev/null
@@ -1,221 +0,0 @@
-From 383ec757d27652448d1511169e1133f486abf54f Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Mon, 13 Feb 2017 14:03:22 +0000
-Subject: [PATCH] Fix read-after-free error in readelf when processing
- multiple, relocated sections in an MSP430 binary.
-
-	PR binutils/21139
-	* readelf.c (target_specific_reloc_handling): Add num_syms
-	parameter.  Check for symbol table overflow before accessing
-	symbol value.  If reloc pointer is NULL, discard all saved state.
-	(apply_relocations): Pass num_syms to target_specific_reloc_handling.
-	Call target_specific_reloc_handling with a NULL reloc pointer
-	after processing all of the relocs.
-
-(cherry pick from commit f84ce13b6708801ca1d6289b7c4003e2f5a6d7f9)
-Upstream-Status: Backport [master]
-CVE: CVE-2017-6966
-
-Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
----
- binutils/ChangeLog |  10 +++++
- binutils/readelf.c | 109 +++++++++++++++++++++++++++++++++++++++++------------
- 2 files changed, 94 insertions(+), 25 deletions(-)
-
-diff --git a/binutils/readelf.c b/binutils/readelf.c
-index 8cdaae3b8c..7c158c6342 100644
---- a/binutils/readelf.c
-+++ b/binutils/readelf.c
-@@ -11580,15 +11580,27 @@ process_syminfo (FILE * file ATTRIBUTE_UNUSED)
- 
- /* Check to see if the given reloc needs to be handled in a target specific
-    manner.  If so then process the reloc and return TRUE otherwise return
--   FALSE.  */
-+   FALSE.
-+
-+   If called with reloc == NULL, then this is a signal that reloc processing
-+   for the current section has finished, and any saved state should be
-+   discarded.  */
- 
- static bfd_boolean
- target_specific_reloc_handling (Elf_Internal_Rela * reloc,
- 				unsigned char *     start,
- 				unsigned char *     end,
--				Elf_Internal_Sym *  symtab)
-+				Elf_Internal_Sym *  symtab,
-+				unsigned long       num_syms)
- {
--  unsigned int reloc_type = get_reloc_type (reloc->r_info);
-+  unsigned int reloc_type = 0;
-+  unsigned long sym_index = 0;
-+
-+  if (reloc)
-+    {
-+      reloc_type = get_reloc_type (reloc->r_info);
-+      sym_index = get_reloc_symindex (reloc->r_info);
-+    }
- 
-   switch (elf_header.e_machine)
-     {
-@@ -11597,6 +11609,12 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
-       {
- 	static Elf_Internal_Sym * saved_sym = NULL;
- 
-+	if (reloc == NULL)
-+	  {
-+	    saved_sym = NULL;
-+	    return TRUE;
-+	  }
-+
- 	switch (reloc_type)
- 	  {
- 	  case 10: /* R_MSP430_SYM_DIFF */
-@@ -11604,7 +11622,12 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
- 	      break;
- 	    /* Fall through.  */
- 	  case 21: /* R_MSP430X_SYM_DIFF */
--	    saved_sym = symtab + get_reloc_symindex (reloc->r_info);
-+	    /* PR 21139.  */
-+	    if (sym_index >= num_syms)
-+	      error (_("MSP430 SYM_DIFF reloc contains invalid symbol index %lu\n"),
-+		     sym_index);
-+	    else
-+	      saved_sym = symtab + sym_index;
- 	    return TRUE;
- 
- 	  case 1: /* R_MSP430_32 or R_MSP430_ABS32 */
-@@ -11629,16 +11652,21 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
- 		int reloc_size = reloc_type == 1 ? 4 : 2;
- 		bfd_vma value;
- 
--		value = reloc->r_addend
--		  + (symtab[get_reloc_symindex (reloc->r_info)].st_value
--		     - saved_sym->st_value);
--
--		if (start + reloc->r_offset + reloc_size >= end)
--		  /* PR 21137 */
--		  error (_("MSP430 sym diff reloc writes past end of section (%p vs %p)\n"),
--			 start + reloc->r_offset + reloc_size, end);
-+		if (sym_index >= num_syms)
-+		  error (_("MSP430 reloc contains invalid symbol index %lu\n"),
-+			 sym_index);
- 		else
--		  byte_put (start + reloc->r_offset, value, reloc_size);
-+		  {
-+		    value = reloc->r_addend + (symtab[sym_index].st_value
-+					       - saved_sym->st_value);
-+
-+		    if (start + reloc->r_offset + reloc_size >= end)
-+		      /* PR 21137 */
-+		      error (_("MSP430 sym diff reloc writes past end of section (%p vs %p)\n"),
-+			     start + reloc->r_offset + reloc_size, end);
-+		    else
-+		      byte_put (start + reloc->r_offset, value, reloc_size);
-+		  }
- 
- 		saved_sym = NULL;
- 		return TRUE;
-@@ -11658,13 +11686,24 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
-       {
- 	static Elf_Internal_Sym * saved_sym = NULL;
- 
-+	if (reloc == NULL)
-+	  {
-+	    saved_sym = NULL;
-+	    return TRUE;
-+	  }
-+
- 	switch (reloc_type)
- 	  {
- 	  case 34: /* R_MN10300_ALIGN */
- 	    return TRUE;
- 	  case 33: /* R_MN10300_SYM_DIFF */
--	    saved_sym = symtab + get_reloc_symindex (reloc->r_info);
-+	    if (sym_index >= num_syms)
-+	      error (_("MN10300_SYM_DIFF reloc contains invalid symbol index %lu\n"),
-+		     sym_index);
-+	    else
-+	      saved_sym = symtab + sym_index;
- 	    return TRUE;
-+
- 	  case 1: /* R_MN10300_32 */
- 	  case 2: /* R_MN10300_16 */
- 	    if (saved_sym != NULL)
-@@ -11672,15 +11711,20 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
- 		int reloc_size = reloc_type == 1 ? 4 : 2;
- 		bfd_vma value;
- 
--		value = reloc->r_addend
--		  + (symtab[get_reloc_symindex (reloc->r_info)].st_value
--		     - saved_sym->st_value);
--
--		if (start + reloc->r_offset + reloc_size >= end)
--		  error (_("MN10300 sym diff reloc writes past end of section (%p vs %p)\n"),
--			 start + reloc->r_offset + reloc_size, end);
-+		if (sym_index >= num_syms)
-+		  error (_("MN10300 reloc contains invalid symbol index %lu\n"),
-+			 sym_index);
- 		else
--		  byte_put (start + reloc->r_offset, value, reloc_size);
-+		  {
-+		    value = reloc->r_addend + (symtab[sym_index].st_value
-+					       - saved_sym->st_value);
-+
-+		    if (start + reloc->r_offset + reloc_size >= end)
-+		      error (_("MN10300 sym diff reloc writes past end of section (%p vs %p)\n"),
-+			     start + reloc->r_offset + reloc_size, end);
-+		    else
-+		      byte_put (start + reloc->r_offset, value, reloc_size);
-+		  }
- 
- 		saved_sym = NULL;
- 		return TRUE;
-@@ -11700,12 +11744,24 @@ target_specific_reloc_handling (Elf_Internal_Rela * reloc,
- 	static bfd_vma saved_sym2 = 0;
- 	static bfd_vma value;
- 
-+	if (reloc == NULL)
-+	  {
-+	    saved_sym1 = saved_sym2 = 0;
-+	    return TRUE;
-+	  }
-+
- 	switch (reloc_type)
- 	  {
- 	  case 0x80: /* R_RL78_SYM.  */
- 	    saved_sym1 = saved_sym2;
--	    saved_sym2 = symtab[get_reloc_symindex (reloc->r_info)].st_value;
--	    saved_sym2 += reloc->r_addend;
-+	    if (sym_index >= num_syms)
-+	      error (_("RL78_SYM reloc contains invalid symbol index %lu\n"),
-+		     sym_index);
-+	    else
-+	      {
-+		saved_sym2 = symtab[sym_index].st_value;
-+		saved_sym2 += reloc->r_addend;
-+	      }
- 	    return TRUE;
- 
- 	  case 0x83: /* R_RL78_OPsub.  */
-@@ -12345,7 +12401,7 @@ apply_relocations (void *                     file,
- 
- 	  reloc_type = get_reloc_type (rp->r_info);
- 
--	  if (target_specific_reloc_handling (rp, start, end, symtab))
-+	  if (target_specific_reloc_handling (rp, start, end, symtab, num_syms))
- 	    continue;
- 	  else if (is_none_reloc (reloc_type))
- 	    continue;
-@@ -12441,6 +12497,9 @@ apply_relocations (void *                     file,
- 	}
- 
-       free (symtab);
-+      /* Let the target specific reloc processing code know that
-+	 we have finished with these relocs.  */
-+      target_specific_reloc_handling (NULL, NULL, NULL, NULL, 0);
- 
-       if (relocs_return)
- 	{
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-6969.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-6969.patch
deleted file mode 100644
index 7dfa3d87c3..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2017-6969.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1d9a2696903fc59d6a936f4ab4e4407ef329d066 Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Fri, 17 Feb 2017 15:59:45 +0000
-Subject: Fix illegal memory accesses in readelf when parsing
- a corrupt binary.
-
-	PR binutils/21156
-	* readelf.c (find_section_in_set): Test for invalid section
-	indicies.
-
-CVE: CVE-2017-6969
-Upstream-Status: Backport [master]
-
-Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
----
- binutils/ChangeLog |  6 ++++++
- binutils/readelf.c | 10 ++++++++--
- 2 files changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/binutils/readelf.c b/binutils/readelf.c
-index 7c158c6342..4960491c5c 100644
---- a/binutils/readelf.c
-+++ b/binutils/readelf.c
-@@ -675,8 +675,14 @@ find_section_in_set (const char * name, unsigned int * set)
-   if (set != NULL)
-     {
-       while ((i = *set++) > 0)
--	if (streq (SECTION_NAME (section_headers + i), name))
--	  return section_headers + i;
-+	{
-+	  /* See PR 21156 for a reproducer.  */
-+	  if (i >= elf_header.e_shnum)
-+	    continue; /* FIXME: Should we issue an error message ?  */
-+
-+	  if (streq (SECTION_NAME (section_headers + i), name))
-+	    return section_headers + i;
-+	}
-     }
- 
-   return find_section (name);
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-6969_2.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-6969_2.patch
deleted file mode 100644
index 5409511a7c..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2017-6969_2.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From ef81126314f67472a46db9581530fbf5ccb6b3f2 Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Mon, 20 Feb 2017 14:40:39 +0000
-Subject: Fix another memory access error in readelf when
- parsing a corrupt binary.
-
-	PR binutils/21156
-	* dwarf.c (cu_tu_indexes_read): Move into...
-	(load_cu_tu_indexes): ... here.  Change the variable into
-	tri-state.  Change the function into boolean, returning
-	false if the indicies could not be loaded.
-	(find_cu_tu_set): Return NULL if the indicies could not be
-	loaded.
-
-CVE: CVE-2017-6969
-Upstream-Status: Backport [master]
-
-Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
----
- binutils/ChangeLog | 10 ++++++++++
- binutils/dwarf.c   | 34 ++++++++++++++++++++--------------
- 2 files changed, 30 insertions(+), 14 deletions(-)
-
-diff --git a/binutils/dwarf.c b/binutils/dwarf.c
-index 0184a7ab2e..6d879c9b61 100644
---- a/binutils/dwarf.c
-+++ b/binutils/dwarf.c
-@@ -76,7 +76,6 @@ int dwarf_check = 0;
-    as a zero-terminated list of section indexes comprising one set of debug
-    sections from a .dwo file.  */
- 
--static int cu_tu_indexes_read = 0;
- static unsigned int *shndx_pool = NULL;
- static unsigned int shndx_pool_size = 0;
- static unsigned int shndx_pool_used = 0;
-@@ -99,7 +98,7 @@ static int tu_count = 0;
- static struct cu_tu_set *cu_sets = NULL;
- static struct cu_tu_set *tu_sets = NULL;
- 
--static void load_cu_tu_indexes (void *file);
-+static bfd_boolean load_cu_tu_indexes (void *);
- 
- /* Values for do_debug_lines.  */
- #define FLAG_DEBUG_LINES_RAW	 1
-@@ -2715,7 +2714,7 @@ load_debug_info (void * file)
-     return num_debug_info_entries;
- 
-   /* If this is a DWARF package file, load the CU and TU indexes.  */
--  load_cu_tu_indexes (file);
-+  (void) load_cu_tu_indexes (file);
- 
-   if (load_debug_section (info, file)
-       && process_debug_info (&debug_displays [info].section, file, abbrev, 1, 0))
-@@ -7378,21 +7377,27 @@ process_cu_tu_index (struct dwarf_section *section, int do_display)
-    section sets that we can use to associate a .debug_info.dwo section
-    with its associated .debug_abbrev.dwo section in a .dwp file.  */
- 
--static void
-+static bfd_boolean
- load_cu_tu_indexes (void *file)
- {
-+  static int cu_tu_indexes_read = -1; /* Tri-state variable.  */
-+
-   /* If we have already loaded (or tried to load) the CU and TU indexes
-      then do not bother to repeat the task.  */
--  if (cu_tu_indexes_read)
--    return;
--
--  if (load_debug_section (dwp_cu_index, file))
--    process_cu_tu_index (&debug_displays [dwp_cu_index].section, 0);
--
--  if (load_debug_section (dwp_tu_index, file))
--    process_cu_tu_index (&debug_displays [dwp_tu_index].section, 0);
-+  if (cu_tu_indexes_read == -1)
-+    {
-+      cu_tu_indexes_read = TRUE;
-+  
-+      if (load_debug_section (dwp_cu_index, file))
-+	if (! process_cu_tu_index (&debug_displays [dwp_cu_index].section, 0))
-+	  cu_tu_indexes_read = FALSE;
-+
-+      if (load_debug_section (dwp_tu_index, file))
-+	if (! process_cu_tu_index (&debug_displays [dwp_tu_index].section, 0))
-+	  cu_tu_indexes_read = FALSE;
-+    }
- 
--  cu_tu_indexes_read = 1;
-+  return (bfd_boolean) cu_tu_indexes_read;
- }
- 
- /* Find the set of sections that includes section SHNDX.  */
-@@ -7402,7 +7407,8 @@ find_cu_tu_set (void *file, unsigned int shndx)
- {
-   unsigned int i;
- 
--  load_cu_tu_indexes (file);
-+  if (! load_cu_tu_indexes (file))
-+    return NULL;
- 
-   /* Find SHNDX in the shndx pool.  */
-   for (i = 0; i < shndx_pool_used; i++)
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-7209.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-7209.patch
deleted file mode 100644
index b14441b4e3..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2017-7209.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From b2706ceadac7239e7b02d43f05100fc6538b0d65 Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Mon, 13 Feb 2017 15:04:37 +0000
-Subject: Fix invalid read of section contents whilst processing a corrupt binary.
-
-	PR binutils/21135
-	* readelf.c (dump_section_as_bytes): Handle the case where
-	uncompress_section_contents returns false.
-
-CVE: CVE-2017-7209
-Upstream-Status: Backport[master]
-
-Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
----
- binutils/ChangeLog |  6 ++++++
- binutils/readelf.c | 16 ++++++++++++----
- 2 files changed, 18 insertions(+), 4 deletions(-)
-
-diff --git a/binutils/readelf.c b/binutils/readelf.c
-index 4960491c5c..f0e7b080e8 100644
---- a/binutils/readelf.c
-+++ b/binutils/readelf.c
-@@ -12803,10 +12803,18 @@ dump_section_as_bytes (Elf_Internal_Shdr * section,
- 	  new_size -= 12;
- 	}
- 
--      if (uncompressed_size
--	  && uncompress_section_contents (& start, uncompressed_size,
--					  & new_size))
--	section_size = new_size;
-+      if (uncompressed_size)
-+	{
-+	  if (uncompress_section_contents (& start, uncompressed_size,
-+					   & new_size))
-+	    section_size = new_size;
-+	  else
-+	    {
-+	      error (_("Unable to decompress section %s\n"),
-+		     printable_section_name (section));
-+	      return;
-+	    }
-+	}
-     }
- 
-   if (relocate)
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-7210.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-7210.patch
deleted file mode 100644
index f8ad32f4f8..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2017-7210.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 4da598a472e1d298825035e452e3bc68f714311c Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Tue, 14 Feb 2017 14:07:29 +0000
-Subject: Fix handling of corrupt STABS enum type strings.
-
-	PR binutils/21157
-	* stabs.c (parse_stab_enum_type): Check for corrupt NAME:VALUE
-	pairs.
-	(parse_number): Exit early if passed an empty string.
-
-CVE: CVE-2017-7210
-Upstream-Status: Backport [master]
-
-Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
----
- binutils/ChangeLog |  7 +++++++
- binutils/stabs.c   | 14 +++++++++++++-
- 2 files changed, 20 insertions(+), 1 deletion(-)
-
-diff --git a/binutils/stabs.c b/binutils/stabs.c
-index f5c5d2d8e0..5d013cc361 100644
---- a/binutils/stabs.c
-+++ b/binutils/stabs.c
-@@ -232,6 +232,10 @@ parse_number (const char **pp, bfd_boolean *poverflow)
- 
-   orig = *pp;
- 
-+  /* Stop early if we are passed an empty string.  */
-+  if (*orig == 0)
-+    return (bfd_vma) 0;
-+
-   errno = 0;
-   ul = strtoul (*pp, (char **) pp, 0);
-   if (ul + 1 != 0 || errno == 0)
-@@ -1975,9 +1979,17 @@ parse_stab_enum_type (void *dhandle, const char **pp)
-       bfd_signed_vma val;
- 
-       p = *pp;
--      while (*p != ':')
-+      while (*p != ':' && *p != 0)
- 	++p;
- 
-+      if (*p == 0)
-+	{
-+	  bad_stab (orig);
-+	  free (names);
-+	  free (values);
-+	  return DEBUG_TYPE_NULL;
-+	}
-+
-       name = savestring (*pp, p - *pp);
- 
-       *pp = p + 1;
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/binutils/binutils_2.28.bb b/meta/recipes-devtools/binutils/binutils_2.29.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils_2.28.bb
rename to meta/recipes-devtools/binutils/binutils_2.29.bb
-- 
2.14.0


