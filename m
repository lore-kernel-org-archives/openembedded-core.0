Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id A93A5771A3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 06:28:47 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id x1so32960133qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 22:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=M+3Og9WUCa5wGSMIiT8to0cQGvBWU/fyJfz9e8EwTEk=;
	b=xY7c4mKnjvyEnexalyXBcQAoNQQbX2FZBjoM9uFr1iKc36qEMVkb+eSwUbIPEs5eNz
	Oi1Ztp+ABJfUaFaePz1Io126OKFCjQ6yEylyitOSWLIWFAA/V9AxV1Z4mN9BqbfLQbr8
	ZEecLcvDaGk/c3AuqIJuaxiHZJ2M7MrHs2lBeU7XnXtaFxQPjspYuK8yX6BB/K/hG0VM
	LZg5ZNorjE5hzBOirvVLdIBcYo5ybQbEwvev58XcpUCNnJQsydwDREjosGWR5boruS2k
	fa2/0R6xWo6TpJ7ZFqpLtV+5Wk+TeP5RtAT0kG6tbNGg6KsDRWi+RAKVeaz9/pzX0qe9
	S3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=M+3Og9WUCa5wGSMIiT8to0cQGvBWU/fyJfz9e8EwTEk=;
	b=R5rtdfJwSm1oHaqUH4ZdzvJOcqsAU44KKPtYSwdHMruA89UZK4WhyLal/dS7VDKaaS
	wHkWiEpbnW6tnY+XJJInAT7eHnn6AQGyGGbyA4No7yY3mJP+r6NABMYh4eK5Tq+wIhwE
	ylF6bjitIzBQHcGTfs+8FlNU7LFrlyZD4+NY0Kz9vVNzksjPR8wyVr1h0d89BtIJw/5W
	BkTokf5S2zrRMARF1uMHoOoGq4uXrYx2F8rLors7mD5HP10hWXVg9O3H4EtTvIezzOKX
	Fc17skbT5HGeak+oCrf1TPPZu1C+8vC29c/F7WuzS1NqTpPAHiPBXqMVcEk07Uxb6Ky7
	D3Cw==
X-Gm-Message-State: AG10YOSv2HlRV8o4nCicghDIqc1DVwpXZcq7C21OqJEDEKedjCZn3daDcGXACBPcYx6fsA==
X-Received: by 10.55.203.72 with SMTP id d69mr15337055qkj.84.1454135327767;
	Fri, 29 Jan 2016 22:28:47 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	n83sm8289755qhn.20.2016.01.29.22.28.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 22:28:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Jan 2016 06:28:38 +0000
Message-Id: <803b00fd0f81c6611151df410482a6492489674e.1454135035.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <b92356866c603c832e859c26ea6d4f01a70aba3c.1454135035.git.raj.khem@gmail.com>
References: <b92356866c603c832e859c26ea6d4f01a70aba3c.1454135035.git.raj.khem@gmail.com>
In-Reply-To: <cover.1454135035.git.raj.khem@gmail.com>
References: <cover.1454135035.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] binutils: Upgrade to 2.26
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
X-List-Received-Date: Sat, 30 Jan 2016 06:28:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../{binutils-2.25.1.inc => binutils-2.26.inc}     |   10 +-
 ...n_2.25.1.bb => binutils-cross-canadian_2.26.bb} |    0
 ...tils-cross_2.25.1.bb => binutils-cross_2.26.bb} |    0
 ...rosssdk_2.25.1.bb => binutils-crosssdk_2.26.bb} |    0
 .../binutils/0001-Generate-relocatable-SDKs.patch  |   12 +-
 ...ure-widen-the-regexp-for-SH-architectures.patch |   14 +-
 .../0003-Point-scripts-location-to-libdir.patch    |   14 +-
 ...te-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |   12 +-
 .../0005-Explicitly-link-with-libm-on-uclibc.patch |   10 +-
 .../binutils/binutils/0006-Use-libtool-2.4.patch   | 2916 ++++++++++++++++----
 ...7-Add-the-armv5e-architecture-to-binutils.patch |   10 +-
 ...he-distro-compiler-point-to-the-wrong-ins.patch |   10 +-
 ...s-of-system-directories-when-cross-linki.patch} |   93 +-
 ...-rpath-in-libtool-when-sysroot-is-enabled.patch |    6 +-
 ...Change-default-emulation-for-mips64-linux.patch |   14 +-
 .../0012-Add-XLP-instructions-support.patch        |  146 +-
 ...rnal-error-in-do_print_to_mapfile-seen-wi.patch |   35 -
 ...4-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch |   25 -
 ...-list-so-that-symbols-not-in-the-list-are.patch |  131 -
 ...h-adds-IFUNC-support-for-arm-gold-backend.patch | 1004 -------
 .../binutils/add-thunderx-support-for-gas.patch    |   33 -
 .../binutils/binutils/binutils-octeon3.patch       |  272 --
 .../{binutils_2.25.1.bb => binutils_2.26.bb}       |    0
 24 files changed, 2587 insertions(+), 2182 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.25.1.inc => binutils-2.26.inc} (76%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.25.1.bb => binutils-cross-canadian_2.26.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.25.1.bb => binutils-cross_2.26.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.25.1.bb => binutils-crosssdk_2.26.bb} (100%)
 rename meta/recipes-devtools/binutils/binutils/{0009-Upstream-Status-Inappropriate-distribution-codesourc.patch => 0009-warn-for-uses-of-system-directories-when-cross-linki.patch} (82%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0013-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0014-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-are.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0016-This-patch-adds-IFUNC-support-for-arm-gold-backend.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/add-thunderx-support-for-gas.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch
 rename meta/recipes-devtools/binutils/{binutils_2.25.1.bb => binutils_2.26.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 9010127..5622f3e 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -24,7 +24,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "5.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-BINUVERSION ?= "2.25%"
+BINUVERSION ?= "2.26%"
 GDBVERSION ?= "7.10%"
 GLIBCVERSION ?= "2.22"
 UCLIBCVERSION ?= "1.0%"
diff --git a/meta/recipes-devtools/binutils/binutils-2.25.1.inc b/meta/recipes-devtools/binutils/binutils-2.26.inc
similarity index 76%
rename from meta/recipes-devtools/binutils/binutils-2.25.1.inc
rename to meta/recipes-devtools/binutils/binutils-2.26.inc
index dc23c4d..c955471 100644
--- a/meta/recipes-devtools/binutils/binutils-2.25.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.26.inc
@@ -18,7 +18,7 @@ BINUPV = "${@binutils_branch_version(d)}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV = "2bd25930221dea4bf33c13a89c111514491440e2"
+SRCREV = "3c9d874373f2189cb704999b0ba39b9bbca91a61"
 SRC_URI = "\
      git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
      file://0002-configure-widen-the-regexp-for-SH-architectures.patch \
@@ -28,16 +28,10 @@ SRC_URI = "\
      file://0006-Use-libtool-2.4.patch \
      file://0007-Add-the-armv5e-architecture-to-binutils.patch \
      file://0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch \
-     file://0009-Upstream-Status-Inappropriate-distribution-codesourc.patch \
+     file://0009-warn-for-uses-of-system-directories-when-cross-linki.patch \
      file://0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
      file://0011-Change-default-emulation-for-mips64-linux.patch \
      file://0012-Add-XLP-instructions-support.patch \
-     file://0013-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch \
-     file://0014-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch \
-     file://0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-are.patch \
-     file://0016-This-patch-adds-IFUNC-support-for-arm-gold-backend.patch \
-     file://binutils-octeon3.patch \
-     file://add-thunderx-support-for-gas.patch \
      "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.25.1.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.26.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.25.1.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.26.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.25.1.bb b/meta/recipes-devtools/binutils/binutils-cross_2.26.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.25.1.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.26.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.25.1.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.26.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.25.1.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.26.bb
diff --git a/meta/recipes-devtools/binutils/binutils/0001-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-Generate-relocatable-SDKs.patch
index 1e80c1f..f5cffff 100644
--- a/meta/recipes-devtools/binutils/binutils/0001-Generate-relocatable-SDKs.patch
+++ b/meta/recipes-devtools/binutils/binutils/0001-Generate-relocatable-SDKs.patch
@@ -1,7 +1,7 @@
-From f71ecf251f84b4bbc9b7a832d5cd4a8bae95d83b Mon Sep 17 00:00:00 2001
+From c2263f6e910f43637fb514de5c48e9ce6a8d55f1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:58:54 +0000
-Subject: [PATCH 01/13] Generate relocatable SDKs
+Subject: [PATCH 01/12] Generate relocatable SDKs
 
 This patch will modify the ELF linker scripts so that the crosssdk
 linker will generate binaries with a 4096 bytes PT_INTERP section. When the binaries
@@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index 499607a..075dd04 100755
+index a84d233..d12c4e2 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
 @@ -277,6 +277,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
@@ -43,10 +43,10 @@ index 499607a..075dd04 100755
  LD_FLAG=
  DATA_ALIGNMENT=${DATA_ALIGNMENT_}
 diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
-index 4368fd9..9f01e8c 100644
+index ec78c90..f9e7a31 100644
 --- a/ld/scripttempl/elf.sc
 +++ b/ld/scripttempl/elf.sc
-@@ -131,8 +131,8 @@ if test -n "${COMMONPAGESIZE}"; then
+@@ -136,8 +136,8 @@ if test -n "${COMMONPAGESIZE}"; then
    DATA_SEGMENT_END=". = DATA_SEGMENT_END (.);"
    DATA_SEGMENT_RELRO_END=". = DATA_SEGMENT_RELRO_END (${SEPARATE_GOTPLT-0}, .);"
  fi
@@ -58,5 +58,5 @@ index 4368fd9..9f01e8c 100644
  if test -z "$PLT"; then
    IPLT=".iplt         ${RELOCATING-0} : { *(.iplt) }"
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0002-configure-widen-the-regexp-for-SH-architectures.patch b/meta/recipes-devtools/binutils/binutils/0002-configure-widen-the-regexp-for-SH-architectures.patch
index 34e21d1..83995c4 100644
--- a/meta/recipes-devtools/binutils/binutils/0002-configure-widen-the-regexp-for-SH-architectures.patch
+++ b/meta/recipes-devtools/binutils/binutils/0002-configure-widen-the-regexp-for-SH-architectures.patch
@@ -1,7 +1,7 @@
-From dfbcfb0d71765b337e63562299a943043928d2d2 Mon Sep 17 00:00:00 2001
+From 301ad846e3a3ea0b49243c6276aa7dcc3fa5cc59 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:07:33 +0000
-Subject: [PATCH 02/13] configure: widen the regexp for SH architectures
+Subject: [PATCH 02/12] configure: widen the regexp for SH architectures
 
 gprof needs to know about uclibc
 
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 87677bc..e9f2f13 100755
+index 34b66f7..85414ab 100755
 --- a/configure
 +++ b/configure
-@@ -3341,7 +3341,7 @@ case "${target}" in
+@@ -3445,7 +3445,7 @@ case "${target}" in
      ;;
    s390-*-* | s390x-*-*)
      ;;
@@ -26,7 +26,7 @@ index 87677bc..e9f2f13 100755
      ;;
    sh64-*-* | sh5*-*-*)
      ;;
-@@ -3812,7 +3812,7 @@ case "${target}" in
+@@ -3939,7 +3939,7 @@ case "${target}" in
    or1k*-*-*)
      noconfigdirs="$noconfigdirs gdb"
      ;;
@@ -36,7 +36,7 @@ index 87677bc..e9f2f13 100755
        sh*-*-elf)
           ;;
 diff --git a/gprof/configure b/gprof/configure
-index b09c8fb..79961c5 100755
+index 2702da1..7dcd141 100755
 --- a/gprof/configure
 +++ b/gprof/configure
 @@ -5869,6 +5869,11 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
@@ -52,5 +52,5 @@ index b09c8fb..79961c5 100755
    if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
      lt_cv_deplibs_check_method='match_pattern /lib[^/]+(\.so\.[0-9]+\.[0-9]+|_pic\.a)$'
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0003-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0003-Point-scripts-location-to-libdir.patch
index f5ce767..935f949 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-Point-scripts-location-to-libdir.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-Point-scripts-location-to-libdir.patch
@@ -1,7 +1,7 @@
-From dfb1412da67bbfe3e993d107d0b5e392f44141ab Mon Sep 17 00:00:00 2001
+From 887db9238821b4f1f5f469f9c825ed9b2e2dc719 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:09:58 +0000
-Subject: [PATCH 03/13] Point scripts location to libdir
+Subject: [PATCH 03/12] Point scripts location to libdir
 
 Upstream-Status: Inappropriate [debian patch]
 
@@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index 9575f1f..84df0bf 100644
+index 0b3b049..3871c74 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
-@@ -54,7 +54,7 @@ endif
+@@ -57,7 +57,7 @@ endif
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.
@@ -25,10 +25,10 @@ index 9575f1f..84df0bf 100644
  EMUL = @EMUL@
  EMULATION_OFILES = @EMULATION_OFILES@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index 9f56ca1..272860f 100644
+index ed98f87..530e4c9 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
-@@ -388,7 +388,7 @@ AM_CFLAGS = $(WARN_CFLAGS)
+@@ -413,7 +413,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.
@@ -38,5 +38,5 @@ index 9f56ca1..272860f 100644
  BFDDIR = $(BASEDIR)/bfd
  INCDIR = $(BASEDIR)/include
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0004-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0004-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
index e3cd2a4..fb9bbd6 100644
--- a/meta/recipes-devtools/binutils/binutils/0004-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
+++ b/meta/recipes-devtools/binutils/binutils/0004-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
@@ -1,7 +1,7 @@
-From 3126608b8c95a792ade56cf62a531d935d391c50 Mon Sep 17 00:00:00 2001
+From 0d76940b5507406719635ee154a29e80a8cb1234 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:27:17 +0000
-Subject: [PATCH 04/13] Only generate an RPATH entry if LD_RUN_PATH is not
+Subject: [PATCH 04/12] Only generate an RPATH entry if LD_RUN_PATH is not
  empty
 
 for cases where -rpath isn't specified. debian (#151024)
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
-index 36dee8e..07bea52 100644
+index 0405d4f..73c5447 100644
 --- a/ld/emultempl/elf32.em
 +++ b/ld/emultempl/elf32.em
-@@ -1198,6 +1198,8 @@ fragment <<EOF
+@@ -1242,6 +1242,8 @@ fragment <<EOF
  	      && command_line.rpath == NULL)
  	    {
  	      lib_path = (const char *) getenv ("LD_RUN_PATH");
@@ -27,7 +27,7 @@ index 36dee8e..07bea52 100644
  	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
  						      force))
  		break;
-@@ -1461,6 +1463,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+@@ -1523,6 +1525,8 @@ gld${EMULATION_NAME}_before_allocation (void)
    rpath = command_line.rpath;
    if (rpath == NULL)
      rpath = (const char *) getenv ("LD_RUN_PATH");
@@ -37,5 +37,5 @@ index 36dee8e..07bea52 100644
    for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
      if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0005-Explicitly-link-with-libm-on-uclibc.patch b/meta/recipes-devtools/binutils/binutils/0005-Explicitly-link-with-libm-on-uclibc.patch
index 9bbd93e..9111abf 100644
--- a/meta/recipes-devtools/binutils/binutils/0005-Explicitly-link-with-libm-on-uclibc.patch
+++ b/meta/recipes-devtools/binutils/binutils/0005-Explicitly-link-with-libm-on-uclibc.patch
@@ -1,7 +1,7 @@
-From f1703bcc7a5c507e471e2630b5a2de129100315a Mon Sep 17 00:00:00 2001
+From 589cc10e54b95607d2728ee37e9387140bf5eb32 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:32:49 +0000
-Subject: [PATCH 05/13] Explicitly link with libm on uclibc
+Subject: [PATCH 05/12] Explicitly link with libm on uclibc
 
 Description:
 
@@ -31,10 +31,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/gas/configure.tgt b/gas/configure.tgt
-index 9abc768..1d92f55 100644
+index 0b490d4..086e0d2 100644
 --- a/gas/configure.tgt
 +++ b/gas/configure.tgt
-@@ -477,6 +477,12 @@ case ${generic_target} in
+@@ -487,6 +487,12 @@ case ${generic_target} in
    *-*-netware)				fmt=elf em=netware ;;
  esac
  
@@ -48,5 +48,5 @@ index 9abc768..1d92f55 100644
    aarch64 | alpha | arm | i386 | ia64 | microblaze | mips | ns32k | or1k | or1knd | pdp11 | ppc | sparc | z80 | z8k)
      bfd_gas=yes
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
index 62967ef..779efd4 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
@@ -1,35 +1,36 @@
-From 03eb9b4fe583e88a22fd8c25b43fbd9bafe21af6 Mon Sep 17 00:00:00 2001
+From 807b3164599359644dddd1c853a73a51165c026c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Mar 2015 01:34:41 +0000
-Subject: [PATCH 06/13] Use libtool 2.4
+Date: Fri, 15 Jan 2016 06:26:54 +0000
+Subject: [PATCH 06/12] Use libtool 2.4
 
-So we can get libtool sysroot support
-
-Upstream-Status: Pending
+get libtool sysroot support
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- bfd/configure        | 1320 +++++++++++++++++------
+Upstream-Status: Pending
+
+ bfd/configure        | 1322 +++++++++++++++++------
  bfd/configure.ac     |    2 +-
- binutils/configure   | 1318 +++++++++++++++++------
- configure            |    2 +-
- gas/configure        | 1318 +++++++++++++++++------
- gprof/configure      | 1323 +++++++++++++++++------
- ld/configure         | 1701 +++++++++++++++++++++--------
- libtool.m4           | 1086 +++++++++++++------
+ binutils/configure   | 1320 +++++++++++++++++------
+ configure            |    4 +-
+ gas/configure        | 1320 +++++++++++++++++------
+ gprof/configure      | 1325 +++++++++++++++++------
+ ld/configure         | 1695 +++++++++++++++++++++--------
+ libtool.m4           | 1080 +++++++++++++------
  ltmain.sh            | 2925 +++++++++++++++++++++++++++++++++-----------------
  ltoptions.m4         |    2 +-
  ltversion.m4         |   12 +-
  lt~obsolete.m4       |    2 +-
- opcodes/configure    | 1320 +++++++++++++++++------
+ opcodes/configure    | 1322 +++++++++++++++++------
  opcodes/configure.ac |    2 +-
- 14 files changed, 8952 insertions(+), 3381 deletions(-)
+ zlib/configure       | 1320 +++++++++++++++++------
+ 15 files changed, 9944 insertions(+), 3709 deletions(-)
 
 diff --git a/bfd/configure b/bfd/configure
-index 85e6b82..3d3dd88 100755
+index 217ac69..2ef4b9e 100755
 --- a/bfd/configure
 +++ b/bfd/configure
-@@ -668,6 +668,9 @@ OTOOL
+@@ -670,6 +670,9 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -39,7 +40,7 @@ index 85e6b82..3d3dd88 100755
  OBJDUMP
  LN_S
  NM
-@@ -780,6 +783,7 @@ enable_static
+@@ -782,6 +785,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -47,7 +48,7 @@ index 85e6b82..3d3dd88 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1456,6 +1460,8 @@ Optional Packages:
+@@ -1458,6 +1462,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -56,7 +57,7 @@ index 85e6b82..3d3dd88 100755
    --with-mmap             try using mmap for BFD input files if available
    --with-separate-debug-dir=DIR
                            Look for global separate debug info in DIR
-@@ -5386,8 +5392,8 @@ esac
+@@ -5388,8 +5394,8 @@ esac
  
  
  
@@ -67,7 +68,7 @@ index 85e6b82..3d3dd88 100755
  
  
  
-@@ -5427,7 +5433,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5429,7 +5435,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -76,7 +77,7 @@ index 85e6b82..3d3dd88 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6113,8 +6119,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6115,8 +6121,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -87,7 +88,7 @@ index 85e6b82..3d3dd88 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6163,6 +6169,80 @@ esac
+@@ -6165,6 +6171,80 @@ esac
  
  
  
@@ -168,7 +169,7 @@ index 85e6b82..3d3dd88 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -6179,6 +6259,11 @@ case $reload_flag in
+@@ -6181,6 +6261,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -180,7 +181,7 @@ index 85e6b82..3d3dd88 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6347,7 +6432,8 @@ mingw* | pw32*)
+@@ -6349,7 +6434,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -190,7 +191,7 @@ index 85e6b82..3d3dd88 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6501,6 +6587,21 @@ esac
+@@ -6503,6 +6589,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -212,7 +213,7 @@ index 85e6b82..3d3dd88 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6516,9 +6617,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6518,9 +6619,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -377,7 +378,7 @@ index 85e6b82..3d3dd88 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6534,7 +6788,7 @@ do
+@@ -6536,7 +6790,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -386,7 +387,7 @@ index 85e6b82..3d3dd88 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6554,11 +6808,15 @@ $as_echo "no" >&6; }
+@@ -6556,11 +6810,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -405,7 +406,7 @@ index 85e6b82..3d3dd88 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6574,7 +6832,7 @@ do
+@@ -6576,7 +6834,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -414,7 +415,7 @@ index 85e6b82..3d3dd88 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6593,6 +6851,10 @@ else
+@@ -6595,6 +6853,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -425,7 +426,7 @@ index 85e6b82..3d3dd88 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6604,16 +6866,72 @@ ac_tool_warned=yes ;;
+@@ -6606,16 +6868,72 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -502,7 +503,7 @@ index 85e6b82..3d3dd88 100755
  
  
  
-@@ -6955,8 +7273,8 @@ esac
+@@ -6957,8 +7275,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -513,7 +514,7 @@ index 85e6b82..3d3dd88 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6992,6 +7310,7 @@ for ac_symprfx in "" "_"; do
+@@ -6994,6 +7312,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -521,7 +522,7 @@ index 85e6b82..3d3dd88 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7033,6 +7352,18 @@ _LT_EOF
+@@ -7035,6 +7354,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -540,7 +541,7 @@ index 85e6b82..3d3dd88 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7044,7 +7375,7 @@ _LT_EOF
+@@ -7046,7 +7377,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -549,7 +550,7 @@ index 85e6b82..3d3dd88 100755
    const char *name;
    void       *address;
  }
-@@ -7070,8 +7401,8 @@ static const void *lt_preloaded_setup() {
+@@ -7072,8 +7403,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -560,7 +561,7 @@ index 85e6b82..3d3dd88 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7081,8 +7412,8 @@ _LT_EOF
+@@ -7083,8 +7414,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -571,7 +572,7 @@ index 85e6b82..3d3dd88 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7119,6 +7450,16 @@ else
+@@ -7121,6 +7452,16 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -588,7 +589,7 @@ index 85e6b82..3d3dd88 100755
  
  
  
-@@ -7140,6 +7481,45 @@ fi
+@@ -7142,6 +7483,45 @@ fi
  
  
  
@@ -634,7 +635,7 @@ index 85e6b82..3d3dd88 100755
  # Check whether --enable-libtool-lock was given.
  if test "${enable_libtool_lock+set}" = set; then :
    enableval=$enable_libtool_lock;
-@@ -7346,6 +7726,123 @@ esac
+@@ -7348,6 +7728,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -758,7 +759,7 @@ index 85e6b82..3d3dd88 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7909,6 +8406,8 @@ _LT_EOF
+@@ -7911,6 +8408,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -767,7 +768,7 @@ index 85e6b82..3d3dd88 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8073,7 +8572,8 @@ fi
+@@ -8075,7 +8574,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -777,7 +778,7 @@ index 85e6b82..3d3dd88 100755
  
  
  
-@@ -8162,7 +8662,7 @@ aix3*)
+@@ -8164,7 +8664,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -786,7 +787,7 @@ index 85e6b82..3d3dd88 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8460,8 +8960,6 @@ fi
+@@ -8462,8 +8962,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -795,7 +796,7 @@ index 85e6b82..3d3dd88 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8627,6 +9125,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8629,6 +9127,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -808,7 +809,7 @@ index 85e6b82..3d3dd88 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8689,7 +9193,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8691,7 +9195,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -817,7 +818,7 @@ index 85e6b82..3d3dd88 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8746,13 +9250,17 @@ case $host_os in
+@@ -8748,13 +9252,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -841,7 +842,7 @@ index 85e6b82..3d3dd88 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8813,6 +9321,11 @@ fi
+@@ -8815,6 +9323,11 @@ fi
  
  
  
@@ -853,7 +854,7 @@ index 85e6b82..3d3dd88 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9163,7 +9676,8 @@ _LT_EOF
+@@ -9165,7 +9678,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -863,16 +864,7 @@ index 85e6b82..3d3dd88 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9211,7 +9725,7 @@ _LT_EOF
-       if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
- 	 && test "$tmp_diet" = no
-       then
--	tmp_addflag=
-+	tmp_addflag=' $pic_flag'
- 	tmp_sharedflag='-shared'
- 	case $cc_basename,$host_cpu in
-         pgcc*)				# Portland Group C compiler
-@@ -9262,12 +9776,12 @@ _LT_EOF
+@@ -9264,12 +9778,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -887,7 +879,7 @@ index 85e6b82..3d3dd88 100755
  	  fi
  	  ;;
  	esac
-@@ -9281,8 +9795,8 @@ _LT_EOF
+@@ -9283,8 +9797,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -898,7 +890,7 @@ index 85e6b82..3d3dd88 100755
        fi
        ;;
  
-@@ -9300,8 +9814,8 @@ _LT_EOF
+@@ -9302,8 +9816,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -909,7 +901,7 @@ index 85e6b82..3d3dd88 100755
        else
  	ld_shlibs=no
        fi
-@@ -9347,8 +9861,8 @@ _LT_EOF
+@@ -9349,8 +9863,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -920,7 +912,7 @@ index 85e6b82..3d3dd88 100755
        else
  	ld_shlibs=no
        fi
-@@ -9478,7 +9992,13 @@ _LT_EOF
+@@ -9480,7 +9994,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -935,7 +927,7 @@ index 85e6b82..3d3dd88 100755
  /* end confdefs.h.  */
  
  int
-@@ -9491,22 +10011,29 @@ main ()
+@@ -9493,22 +10013,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -978,7 +970,7 @@ index 85e6b82..3d3dd88 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9518,7 +10045,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9520,7 +10047,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -993,7 +985,7 @@ index 85e6b82..3d3dd88 100755
  /* end confdefs.h.  */
  
  int
-@@ -9531,22 +10064,29 @@ main ()
+@@ -9533,22 +10066,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -1036,7 +1028,7 @@ index 85e6b82..3d3dd88 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9591,20 +10131,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9593,20 +10133,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -1114,7 +1106,7 @@ index 85e6b82..3d3dd88 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9665,7 +10248,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9667,7 +10250,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -1123,7 +1115,7 @@ index 85e6b82..3d3dd88 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9673,7 +10256,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9675,7 +10258,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -1132,7 +1124,7 @@ index 85e6b82..3d3dd88 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9689,7 +10272,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9691,7 +10274,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -1141,7 +1133,7 @@ index 85e6b82..3d3dd88 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9713,10 +10296,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9715,10 +10298,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -1154,7 +1146,7 @@ index 85e6b82..3d3dd88 100755
  	  ;;
  	esac
        else
-@@ -9795,23 +10378,36 @@ fi
+@@ -9797,23 +10380,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -1199,7 +1191,7 @@ index 85e6b82..3d3dd88 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9896,7 +10492,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9898,7 +10494,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -1208,7 +1200,7 @@ index 85e6b82..3d3dd88 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9915,9 +10511,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9917,9 +10513,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -1220,7 +1212,7 @@ index 85e6b82..3d3dd88 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10493,8 +11089,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10495,8 +11091,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -1232,7 +1224,7 @@ index 85e6b82..3d3dd88 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10527,13 +11124,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10529,13 +11126,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -1305,7 +1297,7 @@ index 85e6b82..3d3dd88 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10625,7 +11280,7 @@ haiku*)
+@@ -10627,7 +11282,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -1314,7 +1306,16 @@ index 85e6b82..3d3dd88 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11465,10 +12120,10 @@ else
+@@ -11423,7 +12078,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11426 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -11467,10 +12122,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -1327,7 +1328,16 @@ index 85e6b82..3d3dd88 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11571,10 +12226,10 @@ else
+@@ -11529,7 +12184,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11532 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -11573,10 +12228,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -1340,7 +1350,7 @@ index 85e6b82..3d3dd88 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15163,7 +15818,7 @@ SHARED_LDFLAGS=
+@@ -15121,7 +15776,7 @@ SHARED_LDFLAGS=
  if test "$enable_shared" = "yes"; then
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -1349,7 +1359,7 @@ index 85e6b82..3d3dd88 100755
    fi
  
  # More hacks to build DLLs on Windows.
-@@ -16780,13 +17435,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -16746,13 +17401,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -1370,7 +1380,7 @@ index 85e6b82..3d3dd88 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -16801,14 +17463,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -16767,14 +17429,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -1389,7 +1399,7 @@ index 85e6b82..3d3dd88 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -16841,12 +17506,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -16807,12 +17472,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -1403,7 +1413,7 @@ index 85e6b82..3d3dd88 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -16901,8 +17566,13 @@ reload_flag \
+@@ -16867,8 +17532,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -1417,7 +1427,7 @@ index 85e6b82..3d3dd88 100755
  STRIP \
  RANLIB \
  CC \
-@@ -16912,12 +17582,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -16878,12 +17548,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -1433,7 +1443,7 @@ index 85e6b82..3d3dd88 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -16933,7 +17605,6 @@ no_undefined_flag \
+@@ -16899,7 +17571,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -1441,7 +1451,7 @@ index 85e6b82..3d3dd88 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -16969,6 +17640,7 @@ module_cmds \
+@@ -16935,6 +17606,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -1449,7 +1459,7 @@ index 85e6b82..3d3dd88 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -17748,7 +18420,8 @@ $as_echo X"$file" |
+@@ -17714,7 +18386,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -1459,7 +1469,7 @@ index 85e6b82..3d3dd88 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -17851,19 +18524,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -17817,19 +18490,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -1503,7 +1513,7 @@ index 85e6b82..3d3dd88 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -17893,6 +18589,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -17859,6 +18555,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -1516,7 +1526,7 @@ index 85e6b82..3d3dd88 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -17902,6 +18604,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -17868,6 +18570,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -1526,7 +1536,7 @@ index 85e6b82..3d3dd88 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -18016,12 +18721,12 @@ with_gcc=$GCC
+@@ -17982,12 +18687,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -1542,7 +1552,7 @@ index 85e6b82..3d3dd88 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -18108,9 +18813,6 @@ inherit_rpath=$inherit_rpath
+@@ -18074,9 +18779,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -1552,7 +1562,7 @@ index 85e6b82..3d3dd88 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -18126,6 +18828,9 @@ include_expsyms=$lt_include_expsyms
+@@ -18092,6 +18794,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -1562,7 +1572,7 @@ index 85e6b82..3d3dd88 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -18158,210 +18863,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -18124,210 +18829,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -1937,10 +1947,10 @@ index 85e6b82..3d3dd88 100755
    chmod +x "$ofile"
  
 diff --git a/bfd/configure.ac b/bfd/configure.ac
-index ba98e39..88063cf 100644
+index 6f5e85f..44bd02c 100644
 --- a/bfd/configure.ac
 +++ b/bfd/configure.ac
-@@ -564,7 +564,7 @@ changequote(,)dnl
+@@ -567,7 +567,7 @@ changequote(,)dnl
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
  changequote([,])dnl
    if test -n "$x"; then
@@ -1950,10 +1960,10 @@ index ba98e39..88063cf 100644
  
  # More hacks to build DLLs on Windows.
 diff --git a/binutils/configure b/binutils/configure
-index be4b81c..6606a5f 100755
+index bbabdc6..9150d42 100755
 --- a/binutils/configure
 +++ b/binutils/configure
-@@ -655,8 +655,11 @@ OTOOL
+@@ -657,8 +657,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -1965,7 +1975,7 @@ index be4b81c..6606a5f 100755
  OBJDUMP
  LN_S
  NM
-@@ -767,6 +770,7 @@ enable_static
+@@ -769,6 +772,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -1973,16 +1983,16 @@ index be4b81c..6606a5f 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1439,6 +1443,8 @@ Optional Packages:
+@@ -1441,6 +1445,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
 +  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
 +                        (or the compiler's sysroot if not specified).
-   --with-zlib             include zlib support (auto/yes/no) default=auto
+   --with-system-zlib      use installed libz
    --with-gnu-ld           assume the C compiler uses GNU ld default=no
    --with-libiconv-prefix[=DIR]  search for libiconv in DIR/include and DIR/lib
-@@ -5153,8 +5159,8 @@ esac
+@@ -5155,8 +5161,8 @@ esac
  
  
  
@@ -1993,7 +2003,7 @@ index be4b81c..6606a5f 100755
  
  
  
-@@ -5194,7 +5200,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5196,7 +5202,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -2002,7 +2012,7 @@ index be4b81c..6606a5f 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5880,8 +5886,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5882,8 +5888,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -2013,7 +2023,7 @@ index be4b81c..6606a5f 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5930,6 +5936,80 @@ esac
+@@ -5932,6 +5938,80 @@ esac
  
  
  
@@ -2094,7 +2104,7 @@ index be4b81c..6606a5f 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -5946,6 +6026,11 @@ case $reload_flag in
+@@ -5948,6 +6028,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -2106,7 +2116,7 @@ index be4b81c..6606a5f 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6114,7 +6199,8 @@ mingw* | pw32*)
+@@ -6116,7 +6201,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -2116,7 +2126,7 @@ index be4b81c..6606a5f 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6268,6 +6354,21 @@ esac
+@@ -6270,6 +6356,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -2138,7 +2148,7 @@ index be4b81c..6606a5f 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6283,9 +6384,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6285,9 +6386,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -2152,9 +2162,7 @@ index be4b81c..6606a5f 100755
 +
 +
 +
- if test -n "$ac_tool_prefix"; then
--  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
--set dummy ${ac_tool_prefix}ar; ac_word=$2
++if test -n "$ac_tool_prefix"; then
 +  # Extract the first word of "${ac_tool_prefix}dlltool", so it can be a program name with args.
 +set dummy ${ac_tool_prefix}dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
@@ -2295,7 +2303,9 @@ index be4b81c..6606a5f 100755
 +
 +
 +
-+if test -n "$ac_tool_prefix"; then
+ if test -n "$ac_tool_prefix"; then
+-  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
+-set dummy ${ac_tool_prefix}ar; ac_word=$2
 +  for ac_prog in ar
 +  do
 +    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
@@ -2303,7 +2313,7 @@ index be4b81c..6606a5f 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6301,7 +6555,7 @@ do
+@@ -6303,7 +6557,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -2312,7 +2322,7 @@ index be4b81c..6606a5f 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6321,11 +6575,15 @@ $as_echo "no" >&6; }
+@@ -6323,11 +6577,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -2331,7 +2341,7 @@ index be4b81c..6606a5f 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6341,7 +6599,7 @@ do
+@@ -6343,7 +6601,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -2340,7 +2350,7 @@ index be4b81c..6606a5f 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6360,6 +6618,10 @@ else
+@@ -6362,6 +6620,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -2351,7 +2361,7 @@ index be4b81c..6606a5f 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6371,16 +6633,72 @@ ac_tool_warned=yes ;;
+@@ -6373,12 +6635,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -2363,17 +2373,13 @@ index be4b81c..6606a5f 100755
 -test -z "$AR_FLAGS" && AR_FLAGS=cru
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
-+
-+
-+
-+
-+
-+
-+
-+
-+
-+
-+
+ 
+ 
+ 
+@@ -6390,6 +6650,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+ 
+ 
+ 
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
 +if test "${lt_cv_ar_at_file+set}" = set; then :
@@ -2386,7 +2392,7 @@ index be4b81c..6606a5f 100755
 +int
 +main ()
 +{
- 
++
 +  ;
 +  return 0;
 +}
@@ -2412,23 +2418,30 @@ index be4b81c..6606a5f 100755
 +        fi
 +      fi
 +      rm -f conftest.* libconftest.a
- 
++
 +fi
 +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
- 
++
 +fi
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
 +$as_echo "$lt_cv_ar_at_file" >&6; }
- 
++
 +if test "x$lt_cv_ar_at_file" = xno; then
 +  archiver_list_spec=
 +else
 +  archiver_list_spec=$lt_cv_ar_at_file
 +fi
- 
- 
- 
-@@ -6722,8 +7040,8 @@ esac
++
++
++
++
++
++
++
+ if test -n "$ac_tool_prefix"; then
+   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
+ set dummy ${ac_tool_prefix}strip; ac_word=$2
+@@ -6724,8 +7042,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -2439,7 +2452,7 @@ index be4b81c..6606a5f 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6759,6 +7077,7 @@ for ac_symprfx in "" "_"; do
+@@ -6761,6 +7079,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -2447,7 +2460,7 @@ index be4b81c..6606a5f 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6800,6 +7119,18 @@ _LT_EOF
+@@ -6802,6 +7121,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -2466,7 +2479,7 @@ index be4b81c..6606a5f 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6811,7 +7142,7 @@ _LT_EOF
+@@ -6813,7 +7144,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -2475,7 +2488,7 @@ index be4b81c..6606a5f 100755
    const char *name;
    void       *address;
  }
-@@ -6837,8 +7168,8 @@ static const void *lt_preloaded_setup() {
+@@ -6839,8 +7170,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -2486,7 +2499,7 @@ index be4b81c..6606a5f 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6848,8 +7179,8 @@ _LT_EOF
+@@ -6850,8 +7181,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -2497,7 +2510,7 @@ index be4b81c..6606a5f 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6886,6 +7217,20 @@ else
+@@ -6888,6 +7219,21 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -2515,10 +2528,11 @@ index be4b81c..6606a5f 100755
 +
 +
 +
++
  
  
  
-@@ -6905,6 +7250,41 @@ fi
+@@ -6906,6 +7252,40 @@ fi
  
  
  
@@ -2556,11 +2570,10 @@ index be4b81c..6606a5f 100755
 +$as_echo "${lt_sysroot:-no}" >&6; }
 +
 +
-+
  
  
- # Check whether --enable-libtool-lock was given.
-@@ -7113,6 +7493,123 @@ esac
+ 
+@@ -7115,6 +7495,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -2684,7 +2697,7 @@ index be4b81c..6606a5f 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7676,6 +8173,8 @@ _LT_EOF
+@@ -7678,6 +8175,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -2693,7 +2706,7 @@ index be4b81c..6606a5f 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7871,7 +8370,8 @@ fi
+@@ -7873,7 +8372,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -2703,7 +2716,7 @@ index be4b81c..6606a5f 100755
  
  
  
-@@ -7960,7 +8460,7 @@ aix3*)
+@@ -7962,7 +8462,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -2712,7 +2725,7 @@ index be4b81c..6606a5f 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8258,8 +8758,6 @@ fi
+@@ -8260,8 +8760,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -2721,7 +2734,7 @@ index be4b81c..6606a5f 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8425,6 +8923,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8427,6 +8925,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -2734,7 +2747,7 @@ index be4b81c..6606a5f 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8487,7 +8991,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8489,7 +8993,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -2743,7 +2756,7 @@ index be4b81c..6606a5f 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8544,13 +9048,17 @@ case $host_os in
+@@ -8546,13 +9050,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -2767,7 +2780,7 @@ index be4b81c..6606a5f 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8611,6 +9119,11 @@ fi
+@@ -8613,6 +9121,11 @@ fi
  
  
  
@@ -2779,7 +2792,7 @@ index be4b81c..6606a5f 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8961,7 +9474,8 @@ _LT_EOF
+@@ -8963,7 +9476,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -2789,16 +2802,7 @@ index be4b81c..6606a5f 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9009,7 +9523,7 @@ _LT_EOF
-       if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
- 	 && test "$tmp_diet" = no
-       then
--	tmp_addflag=
-+	tmp_addflag=' $pic_flag'
- 	tmp_sharedflag='-shared'
- 	case $cc_basename,$host_cpu in
-         pgcc*)				# Portland Group C compiler
-@@ -9060,12 +9574,12 @@ _LT_EOF
+@@ -9062,12 +9576,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -2813,7 +2817,7 @@ index be4b81c..6606a5f 100755
  	  fi
  	  ;;
  	esac
-@@ -9079,8 +9593,8 @@ _LT_EOF
+@@ -9081,8 +9595,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -2824,7 +2828,7 @@ index be4b81c..6606a5f 100755
        fi
        ;;
  
-@@ -9098,8 +9612,8 @@ _LT_EOF
+@@ -9100,8 +9614,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -2835,7 +2839,7 @@ index be4b81c..6606a5f 100755
        else
  	ld_shlibs=no
        fi
-@@ -9145,8 +9659,8 @@ _LT_EOF
+@@ -9147,8 +9661,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -2846,7 +2850,7 @@ index be4b81c..6606a5f 100755
        else
  	ld_shlibs=no
        fi
-@@ -9276,7 +9790,13 @@ _LT_EOF
+@@ -9278,7 +9792,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -2861,7 +2865,7 @@ index be4b81c..6606a5f 100755
  /* end confdefs.h.  */
  
  int
-@@ -9289,22 +9809,29 @@ main ()
+@@ -9291,22 +9811,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -2904,7 +2908,7 @@ index be4b81c..6606a5f 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9316,7 +9843,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9318,7 +9845,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -2919,7 +2923,7 @@ index be4b81c..6606a5f 100755
  /* end confdefs.h.  */
  
  int
-@@ -9329,22 +9862,29 @@ main ()
+@@ -9331,22 +9864,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -2962,7 +2966,7 @@ index be4b81c..6606a5f 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9389,20 +9929,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9391,20 +9931,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -3040,7 +3044,7 @@ index be4b81c..6606a5f 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9463,7 +10046,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9465,7 +10048,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -3049,7 +3053,7 @@ index be4b81c..6606a5f 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9471,7 +10054,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9473,7 +10056,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -3058,7 +3062,7 @@ index be4b81c..6606a5f 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9487,7 +10070,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9489,7 +10072,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -3067,7 +3071,7 @@ index be4b81c..6606a5f 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9511,10 +10094,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9513,10 +10096,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -3080,7 +3084,7 @@ index be4b81c..6606a5f 100755
  	  ;;
  	esac
        else
-@@ -9593,23 +10176,36 @@ fi
+@@ -9595,23 +10178,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -3125,7 +3129,7 @@ index be4b81c..6606a5f 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9694,7 +10290,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9696,7 +10292,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -3134,7 +3138,7 @@ index be4b81c..6606a5f 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9713,9 +10309,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9715,9 +10311,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -3146,7 +3150,7 @@ index be4b81c..6606a5f 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10291,8 +10887,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10293,8 +10889,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -3158,7 +3162,7 @@ index be4b81c..6606a5f 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10325,13 +10922,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10327,13 +10924,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -3231,7 +3235,7 @@ index be4b81c..6606a5f 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10423,7 +11078,7 @@ haiku*)
+@@ -10425,7 +11080,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -3240,7 +3244,16 @@ index be4b81c..6606a5f 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11263,10 +11918,10 @@ else
+@@ -11221,7 +11876,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11224 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -11265,10 +11920,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -3253,7 +3266,16 @@ index be4b81c..6606a5f 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11369,10 +12024,10 @@ else
+@@ -11327,7 +11982,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11330 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -11371,10 +12026,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -3266,7 +3288,7 @@ index be4b81c..6606a5f 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15373,13 +16028,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -15354,13 +16009,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -3287,7 +3309,7 @@ index be4b81c..6606a5f 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15394,14 +16056,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -15375,14 +16037,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -3306,7 +3328,7 @@ index be4b81c..6606a5f 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15434,12 +16099,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -15415,12 +16080,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -3320,7 +3342,7 @@ index be4b81c..6606a5f 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15494,8 +16159,13 @@ reload_flag \
+@@ -15475,8 +16140,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -3334,7 +3356,7 @@ index be4b81c..6606a5f 100755
  STRIP \
  RANLIB \
  CC \
-@@ -15505,12 +16175,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -15486,12 +16156,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -3350,7 +3372,7 @@ index be4b81c..6606a5f 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15526,7 +16198,6 @@ no_undefined_flag \
+@@ -15507,7 +16179,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -3358,7 +3380,7 @@ index be4b81c..6606a5f 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15562,6 +16233,7 @@ module_cmds \
+@@ -15543,6 +16214,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -3366,7 +3388,7 @@ index be4b81c..6606a5f 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16319,7 +16991,8 @@ $as_echo X"$file" |
+@@ -16300,7 +16972,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -3376,7 +3398,7 @@ index be4b81c..6606a5f 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16422,19 +17095,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -16403,19 +17076,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -3420,7 +3442,7 @@ index be4b81c..6606a5f 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16464,6 +17160,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -16445,6 +17141,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -3433,7 +3455,7 @@ index be4b81c..6606a5f 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16473,6 +17175,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -16454,6 +17156,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -3443,7 +3465,7 @@ index be4b81c..6606a5f 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16587,12 +17292,12 @@ with_gcc=$GCC
+@@ -16568,12 +17273,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -3459,7 +3481,7 @@ index be4b81c..6606a5f 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16679,9 +17384,6 @@ inherit_rpath=$inherit_rpath
+@@ -16660,9 +17365,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -3469,7 +3491,7 @@ index be4b81c..6606a5f 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16697,6 +17399,9 @@ include_expsyms=$lt_include_expsyms
+@@ -16678,6 +17380,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -3479,7 +3501,7 @@ index be4b81c..6606a5f 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16729,210 +17434,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -16710,210 +17415,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -3854,23 +3876,32 @@ index be4b81c..6606a5f 100755
    chmod +x "$ofile"
  
 diff --git a/configure b/configure
-index e9f2f13..cbccb18 100755
+index 85414ab..34b66f7 100755
 --- a/configure
 +++ b/configure
-@@ -8041,7 +8041,7 @@ case " $build_configdirs " in
-     # For an installed makeinfo, we require it to be from texinfo 4.7 or
-     # higher, else we use the "missing" dummy.
-     if ${MAKEINFO} --version \
--       | egrep 'texinfo[^0-9]*(4\.([7-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null 2>&1; then
-+       | egrep 'texinfo[^0-9]*([1-3][0-9]|4.[4-9]|4.[1-9][0-9]+|[5-9])' >/dev/null 2>&1; then
-       :
-     else
-       MAKEINFO="$MISSING makeinfo"
+@@ -3445,7 +3445,7 @@ case "${target}" in
+     ;;
+   s390-*-* | s390x-*-*)
+     ;;
+-  sh*-*-* | sh[34]*-*-*)
++  sh-*-* | sh[34]*-*-*)
+     ;;
+   sh64-*-* | sh5*-*-*)
+     ;;
+@@ -3939,7 +3939,7 @@ case "${target}" in
+   or1k*-*-*)
+     noconfigdirs="$noconfigdirs gdb"
+     ;;
+-  sh*-*-* | sh64-*-*)
++  sh-*-* | sh64-*-*)
+     case "${target}" in
+       sh*-*-elf)
+          ;;
 diff --git a/gas/configure b/gas/configure
-index e9ba550..074886f 100755
+index f2864b7..1c2a665 100755
 --- a/gas/configure
 +++ b/gas/configure
-@@ -645,8 +645,11 @@ OTOOL
+@@ -647,8 +647,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -3882,7 +3913,7 @@ index e9ba550..074886f 100755
  OBJDUMP
  LN_S
  NM
-@@ -757,6 +760,7 @@ enable_static
+@@ -759,6 +762,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -3890,16 +3921,16 @@ index e9ba550..074886f 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1422,6 +1426,8 @@ Optional Packages:
+@@ -1427,6 +1431,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
 +  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
 +                        (or the compiler's sysroot if not specified).
-   --with-zlib             include zlib support (auto/yes/no) default=auto
+   --with-system-zlib      use installed libz
  
  Some influential environment variables:
-@@ -4901,8 +4907,8 @@ esac
+@@ -4906,8 +4912,8 @@ esac
  
  
  
@@ -3910,7 +3941,7 @@ index e9ba550..074886f 100755
  
  
  
-@@ -4942,7 +4948,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -4947,7 +4953,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -3919,7 +3950,7 @@ index e9ba550..074886f 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5628,8 +5634,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5633,8 +5639,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -3930,7 +3961,7 @@ index e9ba550..074886f 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5678,6 +5684,80 @@ esac
+@@ -5683,6 +5689,80 @@ esac
  
  
  
@@ -4011,7 +4042,7 @@ index e9ba550..074886f 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -5694,6 +5774,11 @@ case $reload_flag in
+@@ -5699,6 +5779,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -4023,7 +4054,7 @@ index e9ba550..074886f 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -5862,7 +5947,8 @@ mingw* | pw32*)
+@@ -5867,7 +5952,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -4033,7 +4064,7 @@ index e9ba550..074886f 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6016,6 +6102,21 @@ esac
+@@ -6021,6 +6107,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -4055,7 +4086,7 @@ index e9ba550..074886f 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6031,9 +6132,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6036,9 +6137,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -4220,7 +4251,7 @@ index e9ba550..074886f 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6049,7 +6303,7 @@ do
+@@ -6054,7 +6308,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -4229,7 +4260,7 @@ index e9ba550..074886f 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6069,11 +6323,15 @@ $as_echo "no" >&6; }
+@@ -6074,11 +6328,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -4248,7 +4279,7 @@ index e9ba550..074886f 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6089,7 +6347,7 @@ do
+@@ -6094,7 +6352,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -4257,7 +4288,7 @@ index e9ba550..074886f 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6108,6 +6366,10 @@ else
+@@ -6113,6 +6371,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -4268,7 +4299,7 @@ index e9ba550..074886f 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6119,12 +6381,10 @@ ac_tool_warned=yes ;;
+@@ -6124,12 +6386,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -4283,7 +4314,7 @@ index e9ba550..074886f 100755
  
  
  
-@@ -6136,6 +6396,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6141,6 +6401,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -4348,7 +4379,7 @@ index e9ba550..074886f 100755
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -6470,8 +6788,8 @@ esac
+@@ -6475,8 +6793,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -4359,7 +4390,7 @@ index e9ba550..074886f 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6507,6 +6825,7 @@ for ac_symprfx in "" "_"; do
+@@ -6512,6 +6830,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -4367,7 +4398,7 @@ index e9ba550..074886f 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6548,6 +6867,18 @@ _LT_EOF
+@@ -6553,6 +6872,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -4386,7 +4417,7 @@ index e9ba550..074886f 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6559,7 +6890,7 @@ _LT_EOF
+@@ -6564,7 +6895,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -4395,7 +4426,7 @@ index e9ba550..074886f 100755
    const char *name;
    void       *address;
  }
-@@ -6585,8 +6916,8 @@ static const void *lt_preloaded_setup() {
+@@ -6590,8 +6921,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -4406,7 +4437,7 @@ index e9ba550..074886f 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6596,8 +6927,8 @@ _LT_EOF
+@@ -6601,8 +6932,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -4417,7 +4448,7 @@ index e9ba550..074886f 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6634,6 +6965,21 @@ else
+@@ -6639,6 +6970,21 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -4439,7 +4470,7 @@ index e9ba550..074886f 100755
  
  
  
-@@ -6652,6 +6998,40 @@ fi
+@@ -6657,6 +7003,40 @@ fi
  
  
  
@@ -4480,7 +4511,7 @@ index e9ba550..074886f 100755
  
  
  
-@@ -6861,6 +7241,123 @@ esac
+@@ -6866,6 +7246,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -4604,7 +4635,7 @@ index e9ba550..074886f 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7424,6 +7921,8 @@ _LT_EOF
+@@ -7429,6 +7926,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -4613,7 +4644,7 @@ index e9ba550..074886f 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7619,7 +8118,8 @@ fi
+@@ -7624,7 +8123,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -4623,7 +4654,7 @@ index e9ba550..074886f 100755
  
  
  
-@@ -7708,7 +8208,7 @@ aix3*)
+@@ -7713,7 +8213,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -4632,7 +4663,7 @@ index e9ba550..074886f 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8006,8 +8506,6 @@ fi
+@@ -8011,8 +8511,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -4641,7 +4672,7 @@ index e9ba550..074886f 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8173,6 +8671,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8178,6 +8676,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -4654,7 +4685,7 @@ index e9ba550..074886f 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8235,7 +8739,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8240,7 +8744,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -4663,7 +4694,7 @@ index e9ba550..074886f 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8292,13 +8796,17 @@ case $host_os in
+@@ -8297,13 +8801,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -4687,7 +4718,7 @@ index e9ba550..074886f 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8359,6 +8867,11 @@ fi
+@@ -8364,6 +8872,11 @@ fi
  
  
  
@@ -4699,7 +4730,7 @@ index e9ba550..074886f 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8709,7 +9222,8 @@ _LT_EOF
+@@ -8714,7 +9227,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -4709,16 +4740,7 @@ index e9ba550..074886f 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8757,7 +9271,7 @@ _LT_EOF
-       if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
- 	 && test "$tmp_diet" = no
-       then
--	tmp_addflag=
-+	tmp_addflag=' $pic_flag'
- 	tmp_sharedflag='-shared'
- 	case $cc_basename,$host_cpu in
-         pgcc*)				# Portland Group C compiler
-@@ -8808,12 +9322,12 @@ _LT_EOF
+@@ -8813,12 +9327,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -4733,7 +4755,7 @@ index e9ba550..074886f 100755
  	  fi
  	  ;;
  	esac
-@@ -8827,8 +9341,8 @@ _LT_EOF
+@@ -8832,8 +9346,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -4744,7 +4766,7 @@ index e9ba550..074886f 100755
        fi
        ;;
  
-@@ -8846,8 +9360,8 @@ _LT_EOF
+@@ -8851,8 +9365,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4755,7 +4777,7 @@ index e9ba550..074886f 100755
        else
  	ld_shlibs=no
        fi
-@@ -8893,8 +9407,8 @@ _LT_EOF
+@@ -8898,8 +9412,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4766,7 +4788,7 @@ index e9ba550..074886f 100755
        else
  	ld_shlibs=no
        fi
-@@ -9024,7 +9538,13 @@ _LT_EOF
+@@ -9029,7 +9543,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -4781,7 +4803,7 @@ index e9ba550..074886f 100755
  /* end confdefs.h.  */
  
  int
-@@ -9037,22 +9557,29 @@ main ()
+@@ -9042,22 +9562,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4824,7 +4846,7 @@ index e9ba550..074886f 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9064,7 +9591,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9069,7 +9596,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -4839,7 +4861,7 @@ index e9ba550..074886f 100755
  /* end confdefs.h.  */
  
  int
-@@ -9077,22 +9610,29 @@ main ()
+@@ -9082,22 +9615,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4882,7 +4904,7 @@ index e9ba550..074886f 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9137,20 +9677,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9142,20 +9682,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -4960,7 +4982,7 @@ index e9ba550..074886f 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9211,7 +9794,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9216,7 +9799,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -4969,7 +4991,7 @@ index e9ba550..074886f 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9219,7 +9802,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9224,7 +9807,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -4978,7 +5000,7 @@ index e9ba550..074886f 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9235,7 +9818,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9240,7 +9823,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -4987,7 +5009,7 @@ index e9ba550..074886f 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9259,10 +9842,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9264,10 +9847,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -5000,7 +5022,7 @@ index e9ba550..074886f 100755
  	  ;;
  	esac
        else
-@@ -9341,23 +9924,36 @@ fi
+@@ -9346,23 +9929,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -5045,7 +5067,7 @@ index e9ba550..074886f 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9442,7 +10038,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9447,7 +10043,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -5054,7 +5076,7 @@ index e9ba550..074886f 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9461,9 +10057,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9466,9 +10062,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -5066,7 +5088,7 @@ index e9ba550..074886f 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10039,8 +10635,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10044,8 +10640,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -5078,7 +5100,7 @@ index e9ba550..074886f 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10073,13 +10670,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10078,13 +10675,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -5151,7 +5173,7 @@ index e9ba550..074886f 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10171,7 +10826,7 @@ haiku*)
+@@ -10176,7 +10831,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -5160,7 +5182,16 @@ index e9ba550..074886f 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11011,10 +11666,10 @@ else
+@@ -10972,7 +11627,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 10975 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -11016,10 +11671,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5173,7 +5204,16 @@ index e9ba550..074886f 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11117,10 +11772,10 @@ else
+@@ -11078,7 +11733,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11081 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -11122,10 +11777,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5186,7 +5226,7 @@ index e9ba550..074886f 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15274,13 +15929,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -15241,13 +15896,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -5207,7 +5247,7 @@ index e9ba550..074886f 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15295,14 +15957,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -15262,14 +15924,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -5226,7 +5266,7 @@ index e9ba550..074886f 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15335,12 +16000,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -15302,12 +15967,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -5240,7 +5280,7 @@ index e9ba550..074886f 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15395,8 +16060,13 @@ reload_flag \
+@@ -15362,8 +16027,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -5254,7 +5294,7 @@ index e9ba550..074886f 100755
  STRIP \
  RANLIB \
  CC \
-@@ -15406,12 +16076,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -15373,12 +16043,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -5270,7 +5310,7 @@ index e9ba550..074886f 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15427,7 +16099,6 @@ no_undefined_flag \
+@@ -15394,7 +16066,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -5278,7 +5318,7 @@ index e9ba550..074886f 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15463,6 +16134,7 @@ module_cmds \
+@@ -15430,6 +16101,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -5286,7 +5326,7 @@ index e9ba550..074886f 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16227,7 +16899,8 @@ $as_echo X"$file" |
+@@ -16194,7 +16866,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -5296,7 +5336,7 @@ index e9ba550..074886f 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16330,19 +17003,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -16297,19 +16970,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -5340,7 +5380,7 @@ index e9ba550..074886f 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16372,6 +17068,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -16339,6 +17035,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -5353,7 +5393,7 @@ index e9ba550..074886f 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16381,6 +17083,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -16348,6 +17050,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -5363,7 +5403,7 @@ index e9ba550..074886f 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16495,12 +17200,12 @@ with_gcc=$GCC
+@@ -16462,12 +17167,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -5379,7 +5419,7 @@ index e9ba550..074886f 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16587,9 +17292,6 @@ inherit_rpath=$inherit_rpath
+@@ -16554,9 +17259,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -5389,7 +5429,7 @@ index e9ba550..074886f 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16605,6 +17307,9 @@ include_expsyms=$lt_include_expsyms
+@@ -16572,6 +17274,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -5399,7 +5439,7 @@ index e9ba550..074886f 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16637,210 +17342,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -16604,210 +17309,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -5774,7 +5814,7 @@ index e9ba550..074886f 100755
    chmod +x "$ofile"
  
 diff --git a/gprof/configure b/gprof/configure
-index 79961c5..c4f6ac9 100755
+index 7dcd141..45b2592 100755
 --- a/gprof/configure
 +++ b/gprof/configure
 @@ -629,8 +629,11 @@ OTOOL
@@ -6628,15 +6668,6 @@ index 79961c5..c4f6ac9 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8692,7 +9201,7 @@ _LT_EOF
-       if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
- 	 && test "$tmp_diet" = no
-       then
--	tmp_addflag=
-+	tmp_addflag=' $pic_flag'
- 	tmp_sharedflag='-shared'
- 	case $cc_basename,$host_cpu in
-         pgcc*)				# Portland Group C compiler
 @@ -8743,12 +9252,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
@@ -7079,6 +7110,15 @@ index 79961c5..c4f6ac9 100755
    hardcode_into_libs=yes
    ;;
  
+@@ -10902,7 +11552,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 10900 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
 @@ -10946,10 +11596,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
@@ -7092,6 +7132,15 @@ index 79961c5..c4f6ac9 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
+@@ -11008,7 +11658,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11006 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
 @@ -11052,10 +11702,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
@@ -7693,10 +7742,10 @@ index 79961c5..c4f6ac9 100755
    chmod +x "$ofile"
  
 diff --git a/ld/configure b/ld/configure
-index 4408b0d..2fbaebf 100755
+index b900175..7a20e4e 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -654,8 +654,11 @@ OTOOL
+@@ -657,8 +657,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -7708,7 +7757,7 @@ index 4408b0d..2fbaebf 100755
  OBJDUMP
  LN_S
  NM
-@@ -776,6 +779,7 @@ enable_static
+@@ -779,6 +782,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -7716,7 +7765,7 @@ index 4408b0d..2fbaebf 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1453,6 +1457,8 @@ Optional Packages:
+@@ -1458,6 +1462,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -7724,8 +7773,8 @@ index 4408b0d..2fbaebf 100755
 +                        (or the compiler's sysroot if not specified).
    --with-lib-path=dir1:dir2...  set default LIB_PATH
    --with-sysroot=DIR Search for usr/lib et al within DIR.
-   --with-zlib             include zlib support (auto/yes/no) default=auto
-@@ -5645,8 +5651,8 @@ esac
+ 
+@@ -5649,8 +5655,8 @@ esac
  
  
  
@@ -7736,7 +7785,7 @@ index 4408b0d..2fbaebf 100755
  
  
  
-@@ -5686,7 +5692,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5690,7 +5696,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -7745,7 +7794,7 @@ index 4408b0d..2fbaebf 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6372,8 +6378,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6376,8 +6382,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -7756,7 +7805,7 @@ index 4408b0d..2fbaebf 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6422,6 +6428,80 @@ esac
+@@ -6426,6 +6432,80 @@ esac
  
  
  
@@ -7837,7 +7886,7 @@ index 4408b0d..2fbaebf 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -6438,6 +6518,11 @@ case $reload_flag in
+@@ -6442,6 +6522,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -7849,7 +7898,7 @@ index 4408b0d..2fbaebf 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6606,7 +6691,8 @@ mingw* | pw32*)
+@@ -6610,7 +6695,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -7859,7 +7908,7 @@ index 4408b0d..2fbaebf 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6760,6 +6846,21 @@ esac
+@@ -6764,6 +6850,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -7881,7 +7930,7 @@ index 4408b0d..2fbaebf 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6775,9 +6876,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6779,9 +6880,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -8046,7 +8095,7 @@ index 4408b0d..2fbaebf 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6793,7 +7047,7 @@ do
+@@ -6797,7 +7051,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -8055,7 +8104,7 @@ index 4408b0d..2fbaebf 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6813,11 +7067,15 @@ $as_echo "no" >&6; }
+@@ -6817,11 +7071,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -8074,7 +8123,7 @@ index 4408b0d..2fbaebf 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6833,7 +7091,7 @@ do
+@@ -6837,7 +7095,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -8083,7 +8132,7 @@ index 4408b0d..2fbaebf 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6852,6 +7110,10 @@ else
+@@ -6856,6 +7114,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -8094,7 +8143,7 @@ index 4408b0d..2fbaebf 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6863,12 +7125,12 @@ ac_tool_warned=yes ;;
+@@ -6867,12 +7129,12 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -8111,7 +8160,7 @@ index 4408b0d..2fbaebf 100755
  
  
  
-@@ -6878,6 +7140,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6882,6 +7144,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -8174,7 +8223,7 @@ index 4408b0d..2fbaebf 100755
  
  
  if test -n "$ac_tool_prefix"; then
-@@ -7214,8 +7532,8 @@ esac
+@@ -7218,8 +7536,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -8185,7 +8234,7 @@ index 4408b0d..2fbaebf 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7251,6 +7569,7 @@ for ac_symprfx in "" "_"; do
+@@ -7255,6 +7573,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -8193,7 +8242,7 @@ index 4408b0d..2fbaebf 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7292,6 +7611,18 @@ _LT_EOF
+@@ -7296,6 +7615,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -8212,7 +8261,7 @@ index 4408b0d..2fbaebf 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7303,7 +7634,7 @@ _LT_EOF
+@@ -7307,7 +7638,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -8221,7 +8270,7 @@ index 4408b0d..2fbaebf 100755
    const char *name;
    void       *address;
  }
-@@ -7329,8 +7660,8 @@ static const void *lt_preloaded_setup() {
+@@ -7333,8 +7664,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -8232,7 +8281,7 @@ index 4408b0d..2fbaebf 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7340,8 +7671,8 @@ _LT_EOF
+@@ -7344,8 +7675,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -8243,7 +8292,7 @@ index 4408b0d..2fbaebf 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7378,6 +7709,19 @@ else
+@@ -7382,6 +7713,19 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -8263,7 +8312,7 @@ index 4408b0d..2fbaebf 100755
  
  
  
-@@ -7398,6 +7742,42 @@ fi
+@@ -7402,6 +7746,42 @@ fi
  
  
  
@@ -8306,7 +8355,7 @@ index 4408b0d..2fbaebf 100755
  
  # Check whether --enable-libtool-lock was given.
  if test "${enable_libtool_lock+set}" = set; then :
-@@ -7605,6 +7985,123 @@ esac
+@@ -7609,6 +7989,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -8430,7 +8479,7 @@ index 4408b0d..2fbaebf 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -8168,6 +8665,8 @@ _LT_EOF
+@@ -8172,6 +8669,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -8439,7 +8488,7 @@ index 4408b0d..2fbaebf 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8236,6 +8735,16 @@ done
+@@ -8240,6 +8739,16 @@ done
  
  
  
@@ -8456,7 +8505,7 @@ index 4408b0d..2fbaebf 100755
  
  
  # Set options
-@@ -8364,7 +8873,8 @@ fi
+@@ -8368,7 +8877,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -8466,7 +8515,7 @@ index 4408b0d..2fbaebf 100755
  
  
  
-@@ -8453,7 +8963,7 @@ aix3*)
+@@ -8457,7 +8967,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -8475,7 +8524,7 @@ index 4408b0d..2fbaebf 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8751,8 +9261,6 @@ fi
+@@ -8755,8 +9265,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -8484,7 +8533,7 @@ index 4408b0d..2fbaebf 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8918,6 +9426,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8922,6 +9430,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -8497,7 +8546,7 @@ index 4408b0d..2fbaebf 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8980,7 +9494,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8984,7 +9498,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -8506,7 +8555,7 @@ index 4408b0d..2fbaebf 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -9037,13 +9551,17 @@ case $host_os in
+@@ -9041,13 +9555,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -8530,7 +8579,7 @@ index 4408b0d..2fbaebf 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9104,6 +9622,11 @@ fi
+@@ -9108,6 +9626,11 @@ fi
  
  
  
@@ -8542,7 +8591,7 @@ index 4408b0d..2fbaebf 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9454,7 +9977,8 @@ _LT_EOF
+@@ -9458,7 +9981,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -8552,16 +8601,7 @@ index 4408b0d..2fbaebf 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9502,7 +10026,7 @@ _LT_EOF
-       if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
- 	 && test "$tmp_diet" = no
-       then
--	tmp_addflag=
-+	tmp_addflag=' $pic_flag'
- 	tmp_sharedflag='-shared'
- 	case $cc_basename,$host_cpu in
-         pgcc*)				# Portland Group C compiler
-@@ -9553,12 +10077,12 @@ _LT_EOF
+@@ -9557,12 +10081,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -8576,7 +8616,7 @@ index 4408b0d..2fbaebf 100755
  	  fi
  	  ;;
  	esac
-@@ -9572,8 +10096,8 @@ _LT_EOF
+@@ -9576,8 +10100,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -8587,7 +8627,7 @@ index 4408b0d..2fbaebf 100755
        fi
        ;;
  
-@@ -9591,8 +10115,8 @@ _LT_EOF
+@@ -9595,8 +10119,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8598,7 +8638,7 @@ index 4408b0d..2fbaebf 100755
        else
  	ld_shlibs=no
        fi
-@@ -9638,8 +10162,8 @@ _LT_EOF
+@@ -9642,8 +10166,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8609,7 +8649,7 @@ index 4408b0d..2fbaebf 100755
        else
  	ld_shlibs=no
        fi
-@@ -9769,7 +10293,13 @@ _LT_EOF
+@@ -9773,7 +10297,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -8624,7 +8664,7 @@ index 4408b0d..2fbaebf 100755
  /* end confdefs.h.  */
  
  int
-@@ -9782,22 +10312,29 @@ main ()
+@@ -9786,22 +10316,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8667,7 +8707,7 @@ index 4408b0d..2fbaebf 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9809,7 +10346,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9813,7 +10350,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -8682,7 +8722,7 @@ index 4408b0d..2fbaebf 100755
  /* end confdefs.h.  */
  
  int
-@@ -9822,22 +10365,29 @@ main ()
+@@ -9826,22 +10369,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8725,7 +8765,7 @@ index 4408b0d..2fbaebf 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9881,21 +10431,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9885,21 +10435,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # When not using gcc, we currently assume that we are using
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
@@ -8805,7 +8845,7 @@ index 4408b0d..2fbaebf 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9956,7 +10549,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9960,7 +10553,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -8814,7 +8854,7 @@ index 4408b0d..2fbaebf 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9964,7 +10557,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9968,7 +10561,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -8823,7 +8863,7 @@ index 4408b0d..2fbaebf 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9980,7 +10573,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9984,7 +10577,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -8832,7 +8872,7 @@ index 4408b0d..2fbaebf 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10004,10 +10597,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10008,10 +10601,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -8845,7 +8885,7 @@ index 4408b0d..2fbaebf 100755
  	  ;;
  	esac
        else
-@@ -10086,23 +10679,36 @@ fi
+@@ -10090,23 +10683,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -8890,7 +8930,7 @@ index 4408b0d..2fbaebf 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10187,7 +10793,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10191,7 +10797,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -8899,7 +8939,7 @@ index 4408b0d..2fbaebf 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10206,9 +10812,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10210,9 +10816,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -8911,7 +8951,7 @@ index 4408b0d..2fbaebf 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10784,8 +11390,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10788,8 +11394,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -8923,7 +8963,7 @@ index 4408b0d..2fbaebf 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10818,13 +11425,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10822,13 +11429,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -8996,7 +9036,7 @@ index 4408b0d..2fbaebf 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10916,7 +11581,7 @@ haiku*)
+@@ -10920,7 +11585,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -9005,16 +9045,16 @@ index 4408b0d..2fbaebf 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11712,7 +12377,7 @@ else
+@@ -11716,7 +12381,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11715 "configure"
+-#line 11719 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11756,10 +12421,10 @@ else
+@@ -11760,10 +12425,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -9027,16 +9067,16 @@ index 4408b0d..2fbaebf 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11818,7 +12483,7 @@ else
+@@ -11822,7 +12487,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11821 "configure"
+-#line 11825 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11862,10 +12527,10 @@ else
+@@ -11866,10 +12531,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -9049,7 +9089,7 @@ index 4408b0d..2fbaebf 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12257,6 +12922,7 @@ $RM -r conftest*
+@@ -12261,6 +12926,7 @@ $RM -r conftest*
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -9057,7 +9097,7 @@ index 4408b0d..2fbaebf 100755
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -12274,6 +12940,7 @@ $RM -r conftest*
+@@ -12278,6 +12944,7 @@ $RM -r conftest*
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -9065,18 +9105,7 @@ index 4408b0d..2fbaebf 100755
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -12413,8 +13080,8 @@ with_gnu_ld=$lt_cv_prog_gnu_ld
-       # Check if GNU C++ uses GNU ld as the underlying linker, since the
-       # archiving commands below assume that GNU ld is being used.
-       if test "$with_gnu_ld" = yes; then
--        archive_cmds_CXX='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname -o $lib'
--        archive_expsym_cmds_CXX='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
-+        archive_cmds_CXX='$CC $pic_flag -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname -o $lib'
-+        archive_expsym_cmds_CXX='$CC $pic_flag -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
- 
-         hardcode_libdir_flag_spec_CXX='${wl}-rpath ${wl}$libdir'
-         export_dynamic_flag_spec_CXX='${wl}--export-dynamic'
-@@ -12556,7 +13223,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -12560,7 +13227,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -9091,7 +9120,7 @@ index 4408b0d..2fbaebf 100755
  /* end confdefs.h.  */
  
  int
-@@ -12569,22 +13242,29 @@ main ()
+@@ -12573,22 +13246,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9134,7 +9163,7 @@ index 4408b0d..2fbaebf 100755
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -12597,7 +13277,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12601,7 +13281,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -9149,7 +9178,7 @@ index 4408b0d..2fbaebf 100755
  /* end confdefs.h.  */
  
  int
-@@ -12610,22 +13296,29 @@ main ()
+@@ -12614,22 +13300,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9192,7 +9221,7 @@ index 4408b0d..2fbaebf 100755
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -12668,29 +13361,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12672,29 +13365,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -9291,7 +9320,7 @@ index 4408b0d..2fbaebf 100755
        darwin* | rhapsody*)
  
  
-@@ -12796,7 +13535,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12800,7 +13539,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
              ;;
            *)
              if test "$GXX" = yes; then
@@ -9300,7 +9329,7 @@ index 4408b0d..2fbaebf 100755
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -12867,10 +13606,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12871,10 +13610,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -9313,7 +9342,7 @@ index 4408b0d..2fbaebf 100755
  	            ;;
  	        esac
  	      fi
-@@ -12911,9 +13650,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12915,9 +13654,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -9325,7 +9354,7 @@ index 4408b0d..2fbaebf 100755
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -12983,20 +13722,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12987,20 +13726,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	      prelink_cmds_CXX='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -9350,7 +9379,7 @@ index 4408b0d..2fbaebf 100755
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -13191,7 +13930,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13195,7 +13934,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -9359,7 +9388,7 @@ index 4408b0d..2fbaebf 100755
  		  ;;
  	      esac
  
-@@ -13237,7 +13976,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13241,7 +13980,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
        solaris*)
          case $cc_basename in
@@ -9368,7 +9397,7 @@ index 4408b0d..2fbaebf 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13278,9 +14017,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13282,9 +14021,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -9380,7 +9409,7 @@ index 4408b0d..2fbaebf 100755
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -13415,6 +14154,13 @@ private:
+@@ -13419,6 +14158,13 @@ private:
  };
  _LT_EOF
  
@@ -9394,7 +9423,7 @@ index 4408b0d..2fbaebf 100755
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13428,7 +14174,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13432,7 +14178,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -9403,7 +9432,7 @@ index 4408b0d..2fbaebf 100755
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13437,13 +14183,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13441,13 +14187,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -9430,7 +9459,7 @@ index 4408b0d..2fbaebf 100755
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -13463,8 +14218,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13467,8 +14222,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -9441,7 +9470,7 @@ index 4408b0d..2fbaebf 100755
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -13500,6 +14257,7 @@ else
+@@ -13504,6 +14261,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -9449,7 +9478,7 @@ index 4408b0d..2fbaebf 100755
  
  # PORTME: override above test on systems where it is broken
  case $host_os in
-@@ -13535,7 +14293,7 @@ linux*)
+@@ -13539,7 +14297,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -9458,7 +9487,7 @@ index 4408b0d..2fbaebf 100755
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -13600,8 +14358,6 @@ fi
+@@ -13604,8 +14362,6 @@ fi
  lt_prog_compiler_pic_CXX=
  lt_prog_compiler_static_CXX=
  
@@ -9467,7 +9496,7 @@ index 4408b0d..2fbaebf 100755
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -13706,6 +14462,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -13710,6 +14466,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	  ;;
  	esac
  	;;
@@ -9479,7 +9508,7 @@ index 4408b0d..2fbaebf 100755
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -13858,7 +14619,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -13862,7 +14623,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	;;
        solaris*)
  	case $cc_basename in
@@ -9488,7 +9517,7 @@ index 4408b0d..2fbaebf 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    lt_prog_compiler_pic_CXX='-KPIC'
  	    lt_prog_compiler_static_CXX='-Bstatic'
-@@ -13923,10 +14684,17 @@ case $host_os in
+@@ -13927,10 +14688,17 @@ case $host_os in
      lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
      ;;
  esac
@@ -9509,7 +9538,7 @@ index 4408b0d..2fbaebf 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -13984,6 +14752,8 @@ fi
+@@ -13988,6 +14756,8 @@ fi
  
  
  
@@ -9518,7 +9547,7 @@ index 4408b0d..2fbaebf 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -14161,6 +14931,7 @@ fi
+@@ -14165,6 +14935,7 @@ fi
  $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
  
    export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -9526,7 +9555,7 @@ index 4408b0d..2fbaebf 100755
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -14175,15 +14946,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -14179,15 +14950,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -9552,7 +9581,7 @@ index 4408b0d..2fbaebf 100755
  
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
  $as_echo "$ld_shlibs_CXX" >&6; }
-@@ -14446,8 +15222,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14450,8 +15226,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -9564,7 +9593,7 @@ index 4408b0d..2fbaebf 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -14479,13 +15256,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14483,13 +15260,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -9637,7 +9666,7 @@ index 4408b0d..2fbaebf 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -14576,7 +15411,7 @@ haiku*)
+@@ -14580,7 +15415,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -9646,7 +9675,7 @@ index 4408b0d..2fbaebf 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -15035,6 +15870,7 @@ fi
+@@ -15039,6 +15874,7 @@ fi
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -9654,7 +9683,7 @@ index 4408b0d..2fbaebf 100755
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -17807,13 +18643,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -17952,13 +18788,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -9675,7 +9704,7 @@ index 4408b0d..2fbaebf 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17828,14 +18671,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17973,14 +18816,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -9694,7 +9723,7 @@ index 4408b0d..2fbaebf 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -17868,12 +18714,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -18013,12 +18859,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -9708,7 +9737,7 @@ index 4408b0d..2fbaebf 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -17912,8 +18758,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
+@@ -18057,8 +18903,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9718,7 +9747,7 @@ index 4408b0d..2fbaebf 100755
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -17940,12 +18786,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
+@@ -18085,12 +18931,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9732,7 +9761,7 @@ index 4408b0d..2fbaebf 100755
  file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
  hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
  compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -17983,8 +18829,13 @@ reload_flag \
+@@ -18128,8 +18974,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -9746,7 +9775,7 @@ index 4408b0d..2fbaebf 100755
  STRIP \
  RANLIB \
  CC \
-@@ -17994,12 +18845,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -18139,12 +18990,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -9762,7 +9791,7 @@ index 4408b0d..2fbaebf 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -18015,7 +18868,6 @@ no_undefined_flag \
+@@ -18160,7 +19013,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -9770,7 +9799,7 @@ index 4408b0d..2fbaebf 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -18037,8 +18889,8 @@ LD_CXX \
+@@ -18182,8 +19034,8 @@ LD_CXX \
  reload_flag_CXX \
  compiler_CXX \
  lt_prog_compiler_no_builtin_flag_CXX \
@@ -9780,7 +9809,7 @@ index 4408b0d..2fbaebf 100755
  lt_prog_compiler_static_CXX \
  lt_cv_prog_compiler_c_o_CXX \
  export_dynamic_flag_spec_CXX \
-@@ -18050,7 +18902,6 @@ no_undefined_flag_CXX \
+@@ -18195,7 +19047,6 @@ no_undefined_flag_CXX \
  hardcode_libdir_flag_spec_CXX \
  hardcode_libdir_flag_spec_ld_CXX \
  hardcode_libdir_separator_CXX \
@@ -9788,7 +9817,7 @@ index 4408b0d..2fbaebf 100755
  exclude_expsyms_CXX \
  include_expsyms_CXX \
  file_list_spec_CXX \
-@@ -18084,6 +18935,7 @@ module_cmds \
+@@ -18229,6 +19080,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -9796,7 +9825,7 @@ index 4408b0d..2fbaebf 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18098,7 +18950,8 @@ archive_expsym_cmds_CXX \
+@@ -18243,7 +19095,8 @@ archive_expsym_cmds_CXX \
  module_cmds_CXX \
  module_expsym_cmds_CXX \
  export_symbols_cmds_CXX \
@@ -9806,7 +9835,7 @@ index 4408b0d..2fbaebf 100755
      case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
      *[\\\\\\\`\\"\\\$]*)
        eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
-@@ -18891,7 +19744,8 @@ $as_echo X"$file" |
+@@ -19036,7 +19889,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -9816,7 +9845,7 @@ index 4408b0d..2fbaebf 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -18994,19 +19848,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -19139,19 +19993,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -9860,7 +9889,7 @@ index 4408b0d..2fbaebf 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -19036,6 +19913,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -19181,6 +20058,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -9873,7 +9902,7 @@ index 4408b0d..2fbaebf 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -19045,6 +19928,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -19190,6 +20073,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -9883,7 +9912,7 @@ index 4408b0d..2fbaebf 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -19159,12 +20045,12 @@ with_gcc=$GCC
+@@ -19304,12 +20190,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -9899,7 +9928,7 @@ index 4408b0d..2fbaebf 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -19251,9 +20137,6 @@ inherit_rpath=$inherit_rpath
+@@ -19396,9 +20282,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -9909,7 +9938,7 @@ index 4408b0d..2fbaebf 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -19269,6 +20152,9 @@ include_expsyms=$lt_include_expsyms
+@@ -19414,6 +20297,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -9919,7 +9948,7 @@ index 4408b0d..2fbaebf 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -19315,210 +20201,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -19460,210 +20346,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -10293,7 +10322,7 @@ index 4408b0d..2fbaebf 100755
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-@@ -19546,12 +20391,12 @@ with_gcc=$GCC_CXX
+@@ -19691,12 +20536,12 @@ with_gcc=$GCC_CXX
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
  
@@ -10309,7 +10338,7 @@ index 4408b0d..2fbaebf 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static_CXX
  
-@@ -19638,9 +20483,6 @@ inherit_rpath=$inherit_rpath_CXX
+@@ -19783,9 +20628,6 @@ inherit_rpath=$inherit_rpath_CXX
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs_CXX
  
@@ -10319,7 +10348,7 @@ index 4408b0d..2fbaebf 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols_CXX
  
-@@ -19656,6 +20498,9 @@ include_expsyms=$lt_include_expsyms_CXX
+@@ -19801,6 +20643,9 @@ include_expsyms=$lt_include_expsyms_CXX
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds_CXX
  
@@ -10330,7 +10359,7 @@ index 4408b0d..2fbaebf 100755
  file_list_spec=$lt_file_list_spec_CXX
  
 diff --git a/libtool.m4 b/libtool.m4
-index 797468f..02b15b3 100644
+index 4b2d30a..008d331 100644
 --- a/libtool.m4
 +++ b/libtool.m4
 @@ -1,7 +1,8 @@
@@ -11052,15 +11081,6 @@ index 797468f..02b15b3 100644
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          _LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -4459,7 +4731,7 @@ _LT_EOF
-       if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
- 	 && test "$tmp_diet" = no
-       then
--	tmp_addflag=
-+	tmp_addflag=' $pic_flag'
- 	tmp_sharedflag='-shared'
- 	case $cc_basename,$host_cpu in
-         pgcc*)				# Portland Group C compiler
 @@ -4510,12 +4782,12 @@ _LT_EOF
  	  _LT_TAGVAR(whole_archive_flag_spec, $1)='--whole-archive$convenience --no-whole-archive'
  	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
@@ -11347,17 +11367,6 @@ index 797468f..02b15b3 100644
    compiler=$CC
    _LT_TAGVAR(compiler, $1)=$CC
    _LT_CC_BASENAME([$compiler])
-@@ -5525,8 +5858,8 @@ if test "$_lt_caught_CXX_error" != yes; then
-       # Check if GNU C++ uses GNU ld as the underlying linker, since the
-       # archiving commands below assume that GNU ld is being used.
-       if test "$with_gnu_ld" = yes; then
--        _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname -o $lib'
--        _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
-+        _LT_TAGVAR(archive_cmds, $1)='$CC $pic_flag -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname -o $lib'
-+        _LT_TAGVAR(archive_expsym_cmds, $1)='$CC $pic_flag -shared -nostdlib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
- 
-         _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
-         _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}--export-dynamic'
 @@ -5667,7 +6000,7 @@ if test "$_lt_caught_CXX_error" != yes; then
            _LT_TAGVAR(allow_undefined_flag, $1)='-berok'
            # Determine the default libpath from the value encoded in an empty
@@ -17433,7 +17442,7 @@ index bf92b5e..c573da9 100644
  # These exist entirely to fool aclocal when bootstrapping libtool.
  #
 diff --git a/opcodes/configure b/opcodes/configure
-index c9c04ce..31141d9 100755
+index 1ff66fa..d20abf3 100755
 --- a/opcodes/configure
 +++ b/opcodes/configure
 @@ -648,6 +648,9 @@ OTOOL
@@ -18270,15 +18279,6 @@ index c9c04ce..31141d9 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8936,7 +9450,7 @@ _LT_EOF
-       if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
- 	 && test "$tmp_diet" = no
-       then
--	tmp_addflag=
-+	tmp_addflag=' $pic_flag'
- 	tmp_sharedflag='-shared'
- 	case $cc_basename,$host_cpu in
-         pgcc*)				# Portland Group C compiler
 @@ -8987,12 +9501,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
@@ -18721,6 +18721,15 @@ index c9c04ce..31141d9 100755
    hardcode_into_libs=yes
    ;;
  
+@@ -11146,7 +11801,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11149 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
 @@ -11190,10 +11845,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
@@ -18734,6 +18743,15 @@ index c9c04ce..31141d9 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
+@@ -11252,7 +11907,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11255 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
 @@ -11296,10 +11951,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
@@ -18747,7 +18765,7 @@ index c9c04ce..31141d9 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12450,7 +13105,7 @@ if test "$enable_shared" = "yes"; then
+@@ -12462,7 +13117,7 @@ if test "$enable_shared" = "yes"; then
  # since libbfd may not pull in the entirety of libiberty.
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -18756,7 +18774,7 @@ index c9c04ce..31141d9 100755
    fi
  
    case "${host}" in
-@@ -13422,13 +14077,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -13436,13 +14091,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -18777,7 +18795,7 @@ index c9c04ce..31141d9 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13443,14 +14105,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -13457,14 +14119,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -18796,7 +18814,7 @@ index c9c04ce..31141d9 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13483,12 +14148,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -13497,12 +14162,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -18810,7 +18828,7 @@ index c9c04ce..31141d9 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -13543,8 +14208,13 @@ reload_flag \
+@@ -13557,8 +14222,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -18824,7 +18842,7 @@ index c9c04ce..31141d9 100755
  STRIP \
  RANLIB \
  CC \
-@@ -13554,12 +14224,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -13568,12 +14238,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -18840,7 +18858,7 @@ index c9c04ce..31141d9 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -13575,7 +14247,6 @@ no_undefined_flag \
+@@ -13589,7 +14261,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -18848,7 +18866,7 @@ index c9c04ce..31141d9 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13611,6 +14282,7 @@ module_cmds \
+@@ -13625,6 +14296,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -18856,7 +18874,7 @@ index c9c04ce..31141d9 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -14367,7 +15039,8 @@ $as_echo X"$file" |
+@@ -14381,7 +15053,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -18866,7 +18884,7 @@ index c9c04ce..31141d9 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -14470,19 +15143,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -14484,19 +15157,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -18910,7 +18928,7 @@ index c9c04ce..31141d9 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14512,6 +15208,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -14526,6 +15222,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -18923,7 +18941,7 @@ index c9c04ce..31141d9 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -14521,6 +15223,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -14535,6 +15237,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -18933,7 +18951,7 @@ index c9c04ce..31141d9 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14635,12 +15340,12 @@ with_gcc=$GCC
+@@ -14649,12 +15354,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -18949,7 +18967,7 @@ index c9c04ce..31141d9 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -14727,9 +15432,6 @@ inherit_rpath=$inherit_rpath
+@@ -14741,9 +15446,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -18959,7 +18977,7 @@ index c9c04ce..31141d9 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -14745,6 +15447,9 @@ include_expsyms=$lt_include_expsyms
+@@ -14759,6 +15461,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -18969,7 +18987,7 @@ index c9c04ce..31141d9 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -14777,210 +15482,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -14791,210 +15496,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -19344,7 +19362,7 @@ index c9c04ce..31141d9 100755
    chmod +x "$ofile"
  
 diff --git a/opcodes/configure.ac b/opcodes/configure.ac
-index b93e855..43ba976 100644
+index 07e3162..c0c75d4 100644
 --- a/opcodes/configure.ac
 +++ b/opcodes/configure.ac
 @@ -167,7 +167,7 @@ changequote(,)dnl
@@ -19356,6 +19374,1922 @@ index b93e855..43ba976 100644
    fi
  
    case "${host}" in
+diff --git a/zlib/configure b/zlib/configure
+index 8378857..7584940 100755
+--- a/zlib/configure
++++ b/zlib/configure
+@@ -614,8 +614,11 @@ OTOOL
+ LIPO
+ NMEDIT
+ DSYMUTIL
++MANIFEST_TOOL
+ RANLIB
++ac_ct_AR
+ AR
++DLLTOOL
+ OBJDUMP
+ LN_S
+ NM
+@@ -736,6 +739,7 @@ enable_static
+ with_pic
+ enable_fast_install
+ with_gnu_ld
++with_libtool_sysroot
+ enable_libtool_lock
+ enable_host_shared
+ '
+@@ -1384,6 +1388,8 @@ Optional Packages:
+   --with-pic              try to use only PIC/non-PIC objects [default=use
+                           both]
+   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
++                        (or the compiler's sysroot if not specified).
+ 
+ Some influential environment variables:
+   CC          C compiler command
+@@ -3907,8 +3913,8 @@ esac
+ 
+ 
+ 
+-macro_version='2.2.7a'
+-macro_revision='1.3134'
++macro_version='2.4'
++macro_revision='1.3293'
+ 
+ 
+ 
+@@ -3948,7 +3954,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
+ $as_echo_n "checking how to print strings... " >&6; }
+ # Test print first, because it will be a builtin if present.
+-if test "X`print -r -- -n 2>/dev/null`" = X-n && \
++if test "X`( print -r -- -n ) 2>/dev/null`" = X-n && \
+    test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
+   ECHO='print -r --'
+ elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
+@@ -4764,8 +4770,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+ # Try some XSI features
+ xsi_shell=no
+ ( _lt_dummy="a/b/c"
+-  test "${_lt_dummy##*/},${_lt_dummy%/*},"${_lt_dummy%"$_lt_dummy"}, \
+-      = c,a/b,, \
++  test "${_lt_dummy##*/},${_lt_dummy%/*},${_lt_dummy#??}"${_lt_dummy%"$_lt_dummy"}, \
++      = c,a/b,b/c, \
+     && eval 'test $(( 1 + 1 )) -eq 2 \
+     && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
+   && xsi_shell=yes
+@@ -4814,6 +4820,80 @@ esac
+ 
+ 
+ 
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to $host format" >&5
++$as_echo_n "checking how to convert $build file names to $host format... " >&6; }
++if test "${lt_cv_to_host_file_cmd+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  case $host in
++  *-*-mingw* )
++    case $build in
++      *-*-mingw* ) # actually msys
++        lt_cv_to_host_file_cmd=func_convert_file_msys_to_w32
++        ;;
++      *-*-cygwin* )
++        lt_cv_to_host_file_cmd=func_convert_file_cygwin_to_w32
++        ;;
++      * ) # otherwise, assume *nix
++        lt_cv_to_host_file_cmd=func_convert_file_nix_to_w32
++        ;;
++    esac
++    ;;
++  *-*-cygwin* )
++    case $build in
++      *-*-mingw* ) # actually msys
++        lt_cv_to_host_file_cmd=func_convert_file_msys_to_cygwin
++        ;;
++      *-*-cygwin* )
++        lt_cv_to_host_file_cmd=func_convert_file_noop
++        ;;
++      * ) # otherwise, assume *nix
++        lt_cv_to_host_file_cmd=func_convert_file_nix_to_cygwin
++        ;;
++    esac
++    ;;
++  * ) # unhandled hosts (and "normal" native builds)
++    lt_cv_to_host_file_cmd=func_convert_file_noop
++    ;;
++esac
++
++fi
++
++to_host_file_cmd=$lt_cv_to_host_file_cmd
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_host_file_cmd" >&5
++$as_echo "$lt_cv_to_host_file_cmd" >&6; }
++
++
++
++
++
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to toolchain format" >&5
++$as_echo_n "checking how to convert $build file names to toolchain format... " >&6; }
++if test "${lt_cv_to_tool_file_cmd+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  #assume ordinary cross tools, or native build.
++lt_cv_to_tool_file_cmd=func_convert_file_noop
++case $host in
++  *-*-mingw* )
++    case $build in
++      *-*-mingw* ) # actually msys
++        lt_cv_to_tool_file_cmd=func_convert_file_msys_to_w32
++        ;;
++    esac
++    ;;
++esac
++
++fi
++
++to_tool_file_cmd=$lt_cv_to_tool_file_cmd
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_tool_file_cmd" >&5
++$as_echo "$lt_cv_to_tool_file_cmd" >&6; }
++
++
++
++
++
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
+ $as_echo_n "checking for $LD option to reload object files... " >&6; }
+ if test "${lt_cv_ld_reload_flag+set}" = set; then :
+@@ -4830,6 +4910,11 @@ case $reload_flag in
+ esac
+ reload_cmds='$LD$reload_flag -o $output$reload_objs'
+ case $host_os in
++  cygwin* | mingw* | pw32* | cegcc*)
++    if test "$GCC" != yes; then
++      reload_cmds=false
++    fi
++    ;;
+   darwin*)
+     if test "$GCC" = yes; then
+       reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
+@@ -4998,7 +5083,8 @@ mingw* | pw32*)
+     lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
+     lt_cv_file_magic_cmd='func_win32_libid'
+   else
+-    lt_cv_deplibs_check_method='file_magic file format pei*-i386(.*architecture: i386)?'
++    # Keep this pattern in sync with the one in func_win32_libid.
++    lt_cv_deplibs_check_method='file_magic file format (pei*-i386(.*architecture: i386)?|pe-arm-wince|pe-x86-64)'
+     lt_cv_file_magic_cmd='$OBJDUMP -f'
+   fi
+   ;;
+@@ -5152,6 +5238,21 @@ esac
+ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
+ $as_echo "$lt_cv_deplibs_check_method" >&6; }
++
++file_magic_glob=
++want_nocaseglob=no
++if test "$build" = "$host"; then
++  case $host_os in
++  mingw* | pw32*)
++    if ( shopt | grep nocaseglob ) >/dev/null 2>&1; then
++      want_nocaseglob=yes
++    else
++      file_magic_glob=`echo aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ | $SED -e "s/\(..\)/s\/[\1]\/[\1]\/g;/g"`
++    fi
++    ;;
++  esac
++fi
++
+ file_magic_cmd=$lt_cv_file_magic_cmd
+ deplibs_check_method=$lt_cv_deplibs_check_method
+ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -5167,9 +5268,163 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+ 
+ 
+ 
++
++
++
++
++
++
++
++
++
++
+ if test -n "$ac_tool_prefix"; then
+-  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
+-set dummy ${ac_tool_prefix}ar; ac_word=$2
++  # Extract the first word of "${ac_tool_prefix}dlltool", so it can be a program name with args.
++set dummy ${ac_tool_prefix}dlltool; ac_word=$2
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
++$as_echo_n "checking for $ac_word... " >&6; }
++if test "${ac_cv_prog_DLLTOOL+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  if test -n "$DLLTOOL"; then
++  ac_cv_prog_DLLTOOL="$DLLTOOL" # Let the user override the test.
++else
++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++for as_dir in $PATH
++do
++  IFS=$as_save_IFS
++  test -z "$as_dir" && as_dir=.
++    for ac_exec_ext in '' $ac_executable_extensions; do
++  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++    ac_cv_prog_DLLTOOL="${ac_tool_prefix}dlltool"
++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
++    break 2
++  fi
++done
++  done
++IFS=$as_save_IFS
++
++fi
++fi
++DLLTOOL=$ac_cv_prog_DLLTOOL
++if test -n "$DLLTOOL"; then
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $DLLTOOL" >&5
++$as_echo "$DLLTOOL" >&6; }
++else
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
++$as_echo "no" >&6; }
++fi
++
++
++fi
++if test -z "$ac_cv_prog_DLLTOOL"; then
++  ac_ct_DLLTOOL=$DLLTOOL
++  # Extract the first word of "dlltool", so it can be a program name with args.
++set dummy dlltool; ac_word=$2
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
++$as_echo_n "checking for $ac_word... " >&6; }
++if test "${ac_cv_prog_ac_ct_DLLTOOL+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  if test -n "$ac_ct_DLLTOOL"; then
++  ac_cv_prog_ac_ct_DLLTOOL="$ac_ct_DLLTOOL" # Let the user override the test.
++else
++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++for as_dir in $PATH
++do
++  IFS=$as_save_IFS
++  test -z "$as_dir" && as_dir=.
++    for ac_exec_ext in '' $ac_executable_extensions; do
++  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++    ac_cv_prog_ac_ct_DLLTOOL="dlltool"
++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
++    break 2
++  fi
++done
++  done
++IFS=$as_save_IFS
++
++fi
++fi
++ac_ct_DLLTOOL=$ac_cv_prog_ac_ct_DLLTOOL
++if test -n "$ac_ct_DLLTOOL"; then
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_DLLTOOL" >&5
++$as_echo "$ac_ct_DLLTOOL" >&6; }
++else
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
++$as_echo "no" >&6; }
++fi
++
++  if test "x$ac_ct_DLLTOOL" = x; then
++    DLLTOOL="false"
++  else
++    case $cross_compiling:$ac_tool_warned in
++yes:)
++{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
++$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
++ac_tool_warned=yes ;;
++esac
++    DLLTOOL=$ac_ct_DLLTOOL
++  fi
++else
++  DLLTOOL="$ac_cv_prog_DLLTOOL"
++fi
++
++test -z "$DLLTOOL" && DLLTOOL=dlltool
++
++
++
++
++
++
++
++
++
++
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to associate runtime and link libraries" >&5
++$as_echo_n "checking how to associate runtime and link libraries... " >&6; }
++if test "${lt_cv_sharedlib_from_linklib_cmd+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  lt_cv_sharedlib_from_linklib_cmd='unknown'
++
++case $host_os in
++cygwin* | mingw* | pw32* | cegcc*)
++  # two different shell functions defined in ltmain.sh
++  # decide which to use based on capabilities of $DLLTOOL
++  case `$DLLTOOL --help 2>&1` in
++  *--identify-strict*)
++    lt_cv_sharedlib_from_linklib_cmd=func_cygming_dll_for_implib
++    ;;
++  *)
++    lt_cv_sharedlib_from_linklib_cmd=func_cygming_dll_for_implib_fallback
++    ;;
++  esac
++  ;;
++*)
++  # fallback: assume linklib IS sharedlib
++  lt_cv_sharedlib_from_linklib_cmd="$ECHO"
++  ;;
++esac
++
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_sharedlib_from_linklib_cmd" >&5
++$as_echo "$lt_cv_sharedlib_from_linklib_cmd" >&6; }
++sharedlib_from_linklib_cmd=$lt_cv_sharedlib_from_linklib_cmd
++test -z "$sharedlib_from_linklib_cmd" && sharedlib_from_linklib_cmd=$ECHO
++
++
++
++
++
++
++
++
++if test -n "$ac_tool_prefix"; then
++  for ac_prog in ar
++  do
++    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
++set dummy $ac_tool_prefix$ac_prog; ac_word=$2
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+ $as_echo_n "checking for $ac_word... " >&6; }
+ if test "${ac_cv_prog_AR+set}" = set; then :
+@@ -5185,7 +5440,7 @@ do
+   test -z "$as_dir" && as_dir=.
+     for ac_exec_ext in '' $ac_executable_extensions; do
+   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+-    ac_cv_prog_AR="${ac_tool_prefix}ar"
++    ac_cv_prog_AR="$ac_tool_prefix$ac_prog"
+     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+     break 2
+   fi
+@@ -5205,11 +5460,15 @@ $as_echo "no" >&6; }
+ fi
+ 
+ 
++    test -n "$AR" && break
++  done
+ fi
+-if test -z "$ac_cv_prog_AR"; then
++if test -z "$AR"; then
+   ac_ct_AR=$AR
+-  # Extract the first word of "ar", so it can be a program name with args.
+-set dummy ar; ac_word=$2
++  for ac_prog in ar
++do
++  # Extract the first word of "$ac_prog", so it can be a program name with args.
++set dummy $ac_prog; ac_word=$2
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+ $as_echo_n "checking for $ac_word... " >&6; }
+ if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
+@@ -5225,7 +5484,7 @@ do
+   test -z "$as_dir" && as_dir=.
+     for ac_exec_ext in '' $ac_executable_extensions; do
+   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+-    ac_cv_prog_ac_ct_AR="ar"
++    ac_cv_prog_ac_ct_AR="$ac_prog"
+     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+     break 2
+   fi
+@@ -5244,6 +5503,10 @@ else
+ $as_echo "no" >&6; }
+ fi
+ 
++
++  test -n "$ac_ct_AR" && break
++done
++
+   if test "x$ac_ct_AR" = x; then
+     AR="false"
+   else
+@@ -5255,16 +5518,72 @@ ac_tool_warned=yes ;;
+ esac
+     AR=$ac_ct_AR
+   fi
+-else
+-  AR="$ac_cv_prog_AR"
+ fi
+ 
+-test -z "$AR" && AR=ar
+-test -z "$AR_FLAGS" && AR_FLAGS=cru
++: ${AR=ar}
++: ${AR_FLAGS=cru}
++
++
++
++
++
++
++
++
++
++
++
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
++$as_echo_n "checking for archiver @FILE support... " >&6; }
++if test "${lt_cv_ar_at_file+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  lt_cv_ar_at_file=no
++   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++
++int
++main ()
++{
+ 
++  ;
++  return 0;
++}
++_ACEOF
++if ac_fn_c_try_compile "$LINENO"; then :
++  echo conftest.$ac_objext > conftest.lst
++      lt_ar_try='$AR $AR_FLAGS libconftest.a @conftest.lst >&5'
++      { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$lt_ar_try\""; } >&5
++  (eval $lt_ar_try) 2>&5
++  ac_status=$?
++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
++  test $ac_status = 0; }
++      if test "$ac_status" -eq 0; then
++	# Ensure the archiver fails upon bogus file names.
++	rm -f conftest.$ac_objext libconftest.a
++	{ { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$lt_ar_try\""; } >&5
++  (eval $lt_ar_try) 2>&5
++  ac_status=$?
++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
++  test $ac_status = 0; }
++	if test "$ac_status" -ne 0; then
++          lt_cv_ar_at_file=@
++        fi
++      fi
++      rm -f conftest.* libconftest.a
+ 
++fi
++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+ 
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
++$as_echo "$lt_cv_ar_at_file" >&6; }
+ 
++if test "x$lt_cv_ar_at_file" = xno; then
++  archiver_list_spec=
++else
++  archiver_list_spec=$lt_cv_ar_at_file
++fi
+ 
+ 
+ 
+@@ -5606,8 +5925,8 @@ esac
+ lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
+ 
+ # Transform an extracted symbol line into symbol name and symbol address
+-lt_cv_sys_global_symbol_to_c_name_address="sed -n -e 's/^: \([^ ]*\) $/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\"\2\", (void *) \&\2},/p'"
+-lt_cv_sys_global_symbol_to_c_name_address_lib_prefix="sed -n -e 's/^: \([^ ]*\) $/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \(lib[^ ]*\)$/  {\"\2\", (void *) \&\2},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\"lib\2\", (void *) \&\2},/p'"
++lt_cv_sys_global_symbol_to_c_name_address="sed -n -e 's/^: \([^ ]*\)[ ]*$/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\"\2\", (void *) \&\2},/p'"
++lt_cv_sys_global_symbol_to_c_name_address_lib_prefix="sed -n -e 's/^: \([^ ]*\)[ ]*$/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \(lib[^ ]*\)$/  {\"\2\", (void *) \&\2},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\"lib\2\", (void *) \&\2},/p'"
+ 
+ # Handle CRLF in mingw tool chain
+ opt_cr=
+@@ -5643,6 +5962,7 @@ for ac_symprfx in "" "_"; do
+   else
+     lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
+   fi
++  lt_cv_sys_global_symbol_pipe="$lt_cv_sys_global_symbol_pipe | sed '/ __gnu_lto/d'"
+ 
+   # Check to see that the pipe works correctly.
+   pipe_works=no
+@@ -5684,6 +6004,18 @@ _LT_EOF
+       if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
+ 	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
+ 	  cat <<_LT_EOF > conftest.$ac_ext
++/* Keep this code in sync between libtool.m4, ltmain, lt_system.h, and tests.  */
++#if defined(_WIN32) || defined(__CYGWIN__) || defined(_WIN32_WCE)
++/* DATA imports from DLLs on WIN32 con't be const, because runtime
++   relocations are performed -- see ld's documentation on pseudo-relocs.  */
++# define LT_DLSYM_CONST
++#elif defined(__osf__)
++/* This system does not cope well with relocations in const data.  */
++# define LT_DLSYM_CONST
++#else
++# define LT_DLSYM_CONST const
++#endif
++
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
+@@ -5695,7 +6027,7 @@ _LT_EOF
+ 	  cat <<_LT_EOF >> conftest.$ac_ext
+ 
+ /* The mapping between symbol names and symbols.  */
+-const struct {
++LT_DLSYM_CONST struct {
+   const char *name;
+   void       *address;
+ }
+@@ -5721,8 +6053,8 @@ static const void *lt_preloaded_setup() {
+ _LT_EOF
+ 	  # Now try linking the two files.
+ 	  mv conftest.$ac_objext conftstm.$ac_objext
+-	  lt_save_LIBS="$LIBS"
+-	  lt_save_CFLAGS="$CFLAGS"
++	  lt_globsym_save_LIBS=$LIBS
++	  lt_globsym_save_CFLAGS=$CFLAGS
+ 	  LIBS="conftstm.$ac_objext"
+ 	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
+ 	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
+@@ -5732,8 +6064,8 @@ _LT_EOF
+   test $ac_status = 0; } && test -s conftest${ac_exeext}; then
+ 	    pipe_works=yes
+ 	  fi
+-	  LIBS="$lt_save_LIBS"
+-	  CFLAGS="$lt_save_CFLAGS"
++	  LIBS=$lt_globsym_save_LIBS
++	  CFLAGS=$lt_globsym_save_CFLAGS
+ 	else
+ 	  echo "cannot find nm_test_func in $nlist" >&5
+ 	fi
+@@ -5770,6 +6102,19 @@ else
+ $as_echo "ok" >&6; }
+ fi
+ 
++# Response file support.
++if test "$lt_cv_nm_interface" = "MS dumpbin"; then
++  nm_file_list_spec='@'
++elif $NM --help 2>/dev/null | grep '[@]FILE' >/dev/null; then
++  nm_file_list_spec='@'
++fi
++
++
++
++
++
++
++
+ 
+ 
+ 
+@@ -5790,6 +6135,41 @@ fi
+ 
+ 
+ 
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
++$as_echo_n "checking for sysroot... " >&6; }
++
++# Check whether --with-libtool-sysroot was given.
++if test "${with_libtool_sysroot+set}" = set; then :
++  withval=$with_libtool_sysroot;
++else
++  with_libtool_sysroot=no
++fi
++
++
++lt_sysroot=
++case ${with_libtool_sysroot} in #(
++ yes)
++   if test "$GCC" = yes; then
++     lt_sysroot=`$CC --print-sysroot 2>/dev/null`
++   fi
++   ;; #(
++ /*)
++   lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
++   ;; #(
++ no|'')
++   ;; #(
++ *)
++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
++$as_echo "${with_libtool_sysroot}" >&6; }
++   as_fn_error "The sysroot must be an absolute path." "$LINENO" 5
++   ;;
++esac
++
++ { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
++$as_echo "${lt_sysroot:-no}" >&6; }
++
++
++
+ 
+ 
+ # Check whether --enable-libtool-lock was given.
+@@ -6001,6 +6381,123 @@ esac
+ 
+ need_locks="$enable_libtool_lock"
+ 
++if test -n "$ac_tool_prefix"; then
++  # Extract the first word of "${ac_tool_prefix}mt", so it can be a program name with args.
++set dummy ${ac_tool_prefix}mt; ac_word=$2
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
++$as_echo_n "checking for $ac_word... " >&6; }
++if test "${ac_cv_prog_MANIFEST_TOOL+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  if test -n "$MANIFEST_TOOL"; then
++  ac_cv_prog_MANIFEST_TOOL="$MANIFEST_TOOL" # Let the user override the test.
++else
++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++for as_dir in $PATH
++do
++  IFS=$as_save_IFS
++  test -z "$as_dir" && as_dir=.
++    for ac_exec_ext in '' $ac_executable_extensions; do
++  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++    ac_cv_prog_MANIFEST_TOOL="${ac_tool_prefix}mt"
++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
++    break 2
++  fi
++done
++  done
++IFS=$as_save_IFS
++
++fi
++fi
++MANIFEST_TOOL=$ac_cv_prog_MANIFEST_TOOL
++if test -n "$MANIFEST_TOOL"; then
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $MANIFEST_TOOL" >&5
++$as_echo "$MANIFEST_TOOL" >&6; }
++else
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
++$as_echo "no" >&6; }
++fi
++
++
++fi
++if test -z "$ac_cv_prog_MANIFEST_TOOL"; then
++  ac_ct_MANIFEST_TOOL=$MANIFEST_TOOL
++  # Extract the first word of "mt", so it can be a program name with args.
++set dummy mt; ac_word=$2
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
++$as_echo_n "checking for $ac_word... " >&6; }
++if test "${ac_cv_prog_ac_ct_MANIFEST_TOOL+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  if test -n "$ac_ct_MANIFEST_TOOL"; then
++  ac_cv_prog_ac_ct_MANIFEST_TOOL="$ac_ct_MANIFEST_TOOL" # Let the user override the test.
++else
++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++for as_dir in $PATH
++do
++  IFS=$as_save_IFS
++  test -z "$as_dir" && as_dir=.
++    for ac_exec_ext in '' $ac_executable_extensions; do
++  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++    ac_cv_prog_ac_ct_MANIFEST_TOOL="mt"
++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
++    break 2
++  fi
++done
++  done
++IFS=$as_save_IFS
++
++fi
++fi
++ac_ct_MANIFEST_TOOL=$ac_cv_prog_ac_ct_MANIFEST_TOOL
++if test -n "$ac_ct_MANIFEST_TOOL"; then
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_MANIFEST_TOOL" >&5
++$as_echo "$ac_ct_MANIFEST_TOOL" >&6; }
++else
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
++$as_echo "no" >&6; }
++fi
++
++  if test "x$ac_ct_MANIFEST_TOOL" = x; then
++    MANIFEST_TOOL=":"
++  else
++    case $cross_compiling:$ac_tool_warned in
++yes:)
++{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
++$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
++ac_tool_warned=yes ;;
++esac
++    MANIFEST_TOOL=$ac_ct_MANIFEST_TOOL
++  fi
++else
++  MANIFEST_TOOL="$ac_cv_prog_MANIFEST_TOOL"
++fi
++
++test -z "$MANIFEST_TOOL" && MANIFEST_TOOL=mt
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if $MANIFEST_TOOL is a manifest tool" >&5
++$as_echo_n "checking if $MANIFEST_TOOL is a manifest tool... " >&6; }
++if test "${lt_cv_path_mainfest_tool+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  lt_cv_path_mainfest_tool=no
++  echo "$as_me:$LINENO: $MANIFEST_TOOL '-?'" >&5
++  $MANIFEST_TOOL '-?' 2>conftest.err > conftest.out
++  cat conftest.err >&5
++  if $GREP 'Manifest Tool' conftest.out > /dev/null; then
++    lt_cv_path_mainfest_tool=yes
++  fi
++  rm -f conftest*
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_path_mainfest_tool" >&5
++$as_echo "$lt_cv_path_mainfest_tool" >&6; }
++if test "x$lt_cv_path_mainfest_tool" != xyes; then
++  MANIFEST_TOOL=:
++fi
++
++
++
++
++
+ 
+   case $host_os in
+     rhapsody* | darwin*)
+@@ -6567,6 +7064,8 @@ _LT_EOF
+       $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
+       echo "$AR cru libconftest.a conftest.o" >&5
+       $AR cru libconftest.a conftest.o 2>&5
++      echo "$RANLIB libconftest.a" >&5
++      $RANLIB libconftest.a 2>&5
+       cat > conftest.c << _LT_EOF
+ int main() { return 0;}
+ _LT_EOF
+@@ -7030,7 +7529,8 @@ fi
+ LIBTOOL_DEPS="$ltmain"
+ 
+ # Always use our own libtool.
+-LIBTOOL='$(SHELL) $(top_builddir)/libtool'
++LIBTOOL='$(SHELL) $(top_builddir)'
++LIBTOOL="$LIBTOOL/${host_alias}-libtool"
+ 
+ 
+ 
+@@ -7119,7 +7619,7 @@ aix3*)
+ esac
+ 
+ # Global variables:
+-ofile=libtool
++ofile=${host_alias}-libtool
+ can_build_shared=yes
+ 
+ # All known linkers require a `.a' archive for static linking (except MSVC,
+@@ -7417,8 +7917,6 @@ fi
+ lt_prog_compiler_pic=
+ lt_prog_compiler_static=
+ 
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
+-$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+ 
+   if test "$GCC" = yes; then
+     lt_prog_compiler_wl='-Wl,'
+@@ -7584,6 +8082,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+ 	lt_prog_compiler_pic='--shared'
+ 	lt_prog_compiler_static='--static'
+ 	;;
++      nagfor*)
++	# NAG Fortran compiler
++	lt_prog_compiler_wl='-Wl,-Wl,,'
++	lt_prog_compiler_pic='-PIC'
++	lt_prog_compiler_static='-Bstatic'
++	;;
+       pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
+         # Portland Group compilers (*not* the Pentium gcc compiler,
+ 	# which looks to be a dead project)
+@@ -7646,7 +8150,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+       lt_prog_compiler_pic='-KPIC'
+       lt_prog_compiler_static='-Bstatic'
+       case $cc_basename in
+-      f77* | f90* | f95*)
++      f77* | f90* | f95* | sunf77* | sunf90* | sunf95*)
+ 	lt_prog_compiler_wl='-Qoption ld ';;
+       *)
+ 	lt_prog_compiler_wl='-Wl,';;
+@@ -7703,13 +8207,17 @@ case $host_os in
+     lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
+     ;;
+ esac
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_prog_compiler_pic" >&5
+-$as_echo "$lt_prog_compiler_pic" >&6; }
+-
+-
+-
+-
+ 
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
++$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
++if test "${lt_cv_prog_compiler_pic+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  lt_cv_prog_compiler_pic=$lt_prog_compiler_pic
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_prog_compiler_pic" >&5
++$as_echo "$lt_cv_prog_compiler_pic" >&6; }
++lt_prog_compiler_pic=$lt_cv_prog_compiler_pic
+ 
+ #
+ # Check to make sure the PIC flag actually works.
+@@ -7770,6 +8278,11 @@ fi
+ 
+ 
+ 
++
++
++
++
++
+ #
+ # Check to make sure the static flag actually works.
+ #
+@@ -8120,7 +8633,8 @@ _LT_EOF
+       allow_undefined_flag=unsupported
+       always_export_symbols=no
+       enable_shared_with_static_runtimes=yes
+-      export_symbols_cmds='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/'\'' | $SED -e '\''/^[AITW][ ]/s/.*[ ]//'\'' | sort | uniq > $export_symbols'
++      export_symbols_cmds='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/;s/^.*[ ]__nm__\([^ ]*\)[ ][^ ]*/\1 DATA/;/^I[ ]/d;/^[AITW][ ]/s/.* //'\'' | sort | uniq > $export_symbols'
++      exclude_expsyms='[_]+GLOBAL_OFFSET_TABLE_|[_]+GLOBAL__[FID]_.*|[_]+head_[A-Za-z0-9_]+_dll|[A-Za-z0-9_]+_dll_iname'
+ 
+       if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
+         archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
+@@ -8219,12 +8733,12 @@ _LT_EOF
+ 	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
+ 	  hardcode_libdir_flag_spec=
+ 	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
+-	  archive_cmds='$LD -shared $libobjs $deplibs $compiler_flags -soname $soname -o $lib'
++	  archive_cmds='$LD -shared $libobjs $deplibs $linker_flags -soname $soname -o $lib'
+ 	  if test "x$supports_anon_versioning" = xyes; then
+ 	    archive_expsym_cmds='echo "{ global:" > $output_objdir/$libname.ver~
+ 	      cat $export_symbols | sed -e "s/\(.*\)/\1;/" >> $output_objdir/$libname.ver~
+ 	      echo "local: *; };" >> $output_objdir/$libname.ver~
+-	      $LD -shared $libobjs $deplibs $compiler_flags -soname $soname -version-script $output_objdir/$libname.ver -o $lib'
++	      $LD -shared $libobjs $deplibs $linker_flags -soname $soname -version-script $output_objdir/$libname.ver -o $lib'
+ 	  fi
+ 	  ;;
+ 	esac
+@@ -8238,8 +8752,8 @@ _LT_EOF
+ 	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
+ 	wlarc=
+       else
+-	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+-	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
++	archive_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
++	archive_expsym_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+       fi
+       ;;
+ 
+@@ -8257,8 +8771,8 @@ _LT_EOF
+ 
+ _LT_EOF
+       elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
+-	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+-	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
++	archive_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
++	archive_expsym_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+       else
+ 	ld_shlibs=no
+       fi
+@@ -8304,8 +8818,8 @@ _LT_EOF
+ 
+     *)
+       if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
+-	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+-	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
++	archive_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
++	archive_expsym_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+       else
+ 	ld_shlibs=no
+       fi
+@@ -8435,7 +8949,13 @@ _LT_EOF
+ 	allow_undefined_flag='-berok'
+         # Determine the default libpath from the value encoded in an
+         # empty executable.
+-        if test x$gcc_no_link = xyes; then
++        if test "${lt_cv_aix_libpath+set}" = set; then
++  aix_libpath=$lt_cv_aix_libpath
++else
++  if test "${lt_cv_aix_libpath_+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  if test x$gcc_no_link = xyes; then
+   as_fn_error "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
+ fi
+ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -8451,22 +8971,29 @@ main ()
+ _ACEOF
+ if ac_fn_c_try_link "$LINENO"; then :
+ 
+-lt_aix_libpath_sed='
+-    /Import File Strings/,/^$/ {
+-	/^0/ {
+-	    s/^0  *\(.*\)$/\1/
+-	    p
+-	}
+-    }'
+-aix_libpath=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
+-# Check for a 64-bit object if we didn't find anything.
+-if test -z "$aix_libpath"; then
+-  aix_libpath=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
+-fi
++  lt_aix_libpath_sed='
++      /Import File Strings/,/^$/ {
++	  /^0/ {
++	      s/^0  *\([^ ]*\) *$/\1/
++	      p
++	  }
++      }'
++  lt_cv_aix_libpath_=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
++  # Check for a 64-bit object if we didn't find anything.
++  if test -z "$lt_cv_aix_libpath_"; then
++    lt_cv_aix_libpath_=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
++  fi
+ fi
+ rm -f core conftest.err conftest.$ac_objext \
+     conftest$ac_exeext conftest.$ac_ext
+-if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
++  if test -z "$lt_cv_aix_libpath_"; then
++    lt_cv_aix_libpath_="/usr/lib:/lib"
++  fi
++
++fi
++
++  aix_libpath=$lt_cv_aix_libpath_
++fi
+ 
+         hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
+         archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
+@@ -8478,7 +9005,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 	else
+ 	 # Determine the default libpath from the value encoded in an
+ 	 # empty executable.
+-	 if test x$gcc_no_link = xyes; then
++	 if test "${lt_cv_aix_libpath+set}" = set; then
++  aix_libpath=$lt_cv_aix_libpath
++else
++  if test "${lt_cv_aix_libpath_+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  if test x$gcc_no_link = xyes; then
+   as_fn_error "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
+ fi
+ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -8494,22 +9027,29 @@ main ()
+ _ACEOF
+ if ac_fn_c_try_link "$LINENO"; then :
+ 
+-lt_aix_libpath_sed='
+-    /Import File Strings/,/^$/ {
+-	/^0/ {
+-	    s/^0  *\(.*\)$/\1/
+-	    p
+-	}
+-    }'
+-aix_libpath=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
+-# Check for a 64-bit object if we didn't find anything.
+-if test -z "$aix_libpath"; then
+-  aix_libpath=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
+-fi
++  lt_aix_libpath_sed='
++      /Import File Strings/,/^$/ {
++	  /^0/ {
++	      s/^0  *\([^ ]*\) *$/\1/
++	      p
++	  }
++      }'
++  lt_cv_aix_libpath_=`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
++  # Check for a 64-bit object if we didn't find anything.
++  if test -z "$lt_cv_aix_libpath_"; then
++    lt_cv_aix_libpath_=`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt_aix_libpath_sed"`
++  fi
+ fi
+ rm -f core conftest.err conftest.$ac_objext \
+     conftest$ac_exeext conftest.$ac_ext
+-if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
++  if test -z "$lt_cv_aix_libpath_"; then
++    lt_cv_aix_libpath_="/usr/lib:/lib"
++  fi
++
++fi
++
++  aix_libpath=$lt_cv_aix_libpath_
++fi
+ 
+ 	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
+ 	  # Warning - without using the other run time loading flags,
+@@ -8554,20 +9094,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+       # Microsoft Visual C++.
+       # hardcode_libdir_flag_spec is actually meaningless, as there is
+       # no search path for DLLs.
+-      hardcode_libdir_flag_spec=' '
+-      allow_undefined_flag=unsupported
+-      # Tell ltmain to make .lib files, not .a files.
+-      libext=lib
+-      # Tell ltmain to make .dll files, not .so files.
+-      shrext_cmds=".dll"
+-      # FIXME: Setting linknames here is a bad hack.
+-      archive_cmds='$CC -o $lib $libobjs $compiler_flags `func_echo_all "$deplibs" | $SED '\''s/ -lc$//'\''` -link -dll~linknames='
+-      # The linker will automatically build a .lib file if we build a DLL.
+-      old_archive_from_new_cmds='true'
+-      # FIXME: Should let the user specify the lib program.
+-      old_archive_cmds='lib -OUT:$oldlib$oldobjs$old_deplibs'
+-      fix_srcfile_path='`cygpath -w "$srcfile"`'
+-      enable_shared_with_static_runtimes=yes
++      case $cc_basename in
++      cl*)
++	# Native MSVC
++	hardcode_libdir_flag_spec=' '
++	allow_undefined_flag=unsupported
++	always_export_symbols=yes
++	file_list_spec='@'
++	# Tell ltmain to make .lib files, not .a files.
++	libext=lib
++	# Tell ltmain to make .dll files, not .so files.
++	shrext_cmds=".dll"
++	# FIXME: Setting linknames here is a bad hack.
++	archive_cmds='$CC -o $output_objdir/$soname $libobjs $compiler_flags $deplibs -Wl,-dll~linknames='
++	archive_expsym_cmds='if test "x`$SED 1q $export_symbols`" = xEXPORTS; then
++	    sed -n -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' -e '1\\\!p' < $export_symbols > $output_objdir/$soname.exp;
++	  else
++	    sed -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' < $export_symbols > $output_objdir/$soname.exp;
++	  fi~
++	  $CC -o $tool_output_objdir$soname $libobjs $compiler_flags $deplibs "@$tool_output_objdir$soname.exp" -Wl,-DLL,-IMPLIB:"$tool_output_objdir$libname.dll.lib"~
++	  linknames='
++	# The linker will not automatically build a static lib if we build a DLL.
++	# _LT_TAGVAR(old_archive_from_new_cmds, )='true'
++	enable_shared_with_static_runtimes=yes
++	export_symbols_cmds='$NM $libobjs $convenience | $global_symbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1,DATA/'\'' | $SED -e '\''/^[AITW][ ]/s/.*[ ]//'\'' | sort | uniq > $export_symbols'
++	# Don't use ranlib
++	old_postinstall_cmds='chmod 644 $oldlib'
++	postlink_cmds='lt_outputfile="@OUTPUT@"~
++	  lt_tool_outputfile="@TOOL_OUTPUT@"~
++	  case $lt_outputfile in
++	    *.exe|*.EXE) ;;
++	    *)
++	      lt_outputfile="$lt_outputfile.exe"
++	      lt_tool_outputfile="$lt_tool_outputfile.exe"
++	      ;;
++	  esac~
++	  if test "$MANIFEST_TOOL" != ":" && test -f "$lt_outputfile.manifest"; then
++	    $MANIFEST_TOOL -manifest "$lt_tool_outputfile.manifest" -outputresource:"$lt_tool_outputfile" || exit 1;
++	    $RM "$lt_outputfile.manifest";
++	  fi'
++	;;
++      *)
++	# Assume MSVC wrapper
++	hardcode_libdir_flag_spec=' '
++	allow_undefined_flag=unsupported
++	# Tell ltmain to make .lib files, not .a files.
++	libext=lib
++	# Tell ltmain to make .dll files, not .so files.
++	shrext_cmds=".dll"
++	# FIXME: Setting linknames here is a bad hack.
++	archive_cmds='$CC -o $lib $libobjs $compiler_flags `func_echo_all "$deplibs" | $SED '\''s/ -lc$//'\''` -link -dll~linknames='
++	# The linker will automatically build a .lib file if we build a DLL.
++	old_archive_from_new_cmds='true'
++	# FIXME: Should let the user specify the lib program.
++	old_archive_cmds='lib -OUT:$oldlib$oldobjs$old_deplibs'
++	enable_shared_with_static_runtimes=yes
++	;;
++      esac
+       ;;
+ 
+     darwin* | rhapsody*)
+@@ -8628,7 +9211,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 
+     # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
+     freebsd* | dragonfly*)
+-      archive_cmds='$CC -shared -o $lib $libobjs $deplibs $compiler_flags'
++      archive_cmds='$CC -shared $pic_flag -o $lib $libobjs $deplibs $compiler_flags'
+       hardcode_libdir_flag_spec='-R$libdir'
+       hardcode_direct=yes
+       hardcode_shlibpath_var=no
+@@ -8636,7 +9219,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 
+     hpux9*)
+       if test "$GCC" = yes; then
+-	archive_cmds='$RM $output_objdir/$soname~$CC -shared -fPIC ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $libobjs $deplibs $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
++	archive_cmds='$RM $output_objdir/$soname~$CC -shared $pic_flag ${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $libobjs $deplibs $compiler_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
+       else
+ 	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
+       fi
+@@ -8652,7 +9235,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 
+     hpux10*)
+       if test "$GCC" = yes && test "$with_gnu_ld" = no; then
+-	archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
++	archive_cmds='$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
+       else
+ 	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
+       fi
+@@ -8676,10 +9259,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+ 	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+ 	  ;;
+ 	ia64*)
+-	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
++	  archive_cmds='$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
+ 	  ;;
+ 	*)
+-	  archive_cmds='$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
++	  archive_cmds='$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
+ 	  ;;
+ 	esac
+       else
+@@ -8758,26 +9341,39 @@ fi
+ 
+     irix5* | irix6* | nonstopux*)
+       if test "$GCC" = yes; then
+-	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
++	archive_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
+ 	# Try to use the -exported_symbol ld option, if it does not
+ 	# work, assume that -exports_file does not work either and
+ 	# implicitly export all symbols.
+-        save_LDFLAGS="$LDFLAGS"
+-        LDFLAGS="$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${wl}-update_registry ${wl}/dev/null"
+-        if test x$gcc_no_link = xyes; then
++	# This should be the same for all languages, so no per-tag cache variable.
++	{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the $host_os linker accepts -exported_symbol" >&5
++$as_echo_n "checking whether the $host_os linker accepts -exported_symbol... " >&6; }
++if test "${lt_cv_irix_exported_symbol+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  save_LDFLAGS="$LDFLAGS"
++	   LDFLAGS="$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${wl}-update_registry ${wl}/dev/null"
++	   if test x$gcc_no_link = xyes; then
+   as_fn_error "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
+ fi
+ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+-int foo(void) {}
++int foo (void) { return 0; }
+ _ACEOF
+ if ac_fn_c_try_link "$LINENO"; then :
+-  archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations ${wl}-exports_file ${wl}$export_symbols -o $lib'
+-
++  lt_cv_irix_exported_symbol=yes
++else
++  lt_cv_irix_exported_symbol=no
+ fi
+ rm -f core conftest.err conftest.$ac_objext \
+     conftest$ac_exeext conftest.$ac_ext
+-        LDFLAGS="$save_LDFLAGS"
++           LDFLAGS="$save_LDFLAGS"
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_irix_exported_symbol" >&5
++$as_echo "$lt_cv_irix_exported_symbol" >&6; }
++	if test "$lt_cv_irix_exported_symbol" = yes; then
++          archive_expsym_cmds='$CC -shared $pic_flag $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations ${wl}-exports_file ${wl}$export_symbols -o $lib'
++	fi
+       else
+ 	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
+ 	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
+@@ -8862,7 +9458,7 @@ rm -f core conftest.err conftest.$ac_objext \
+     osf4* | osf5*)	# as osf3* with the addition of -msym flag
+       if test "$GCC" = yes; then
+ 	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
+-	archive_cmds='$CC -shared${allow_undefined_flag} $libobjs $deplibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
++	archive_cmds='$CC -shared${allow_undefined_flag} $pic_flag $libobjs $deplibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
+ 	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
+       else
+ 	allow_undefined_flag=' -expect_unresolved \*'
+@@ -8881,9 +9477,9 @@ rm -f core conftest.err conftest.$ac_objext \
+       no_undefined_flag=' -z defs'
+       if test "$GCC" = yes; then
+ 	wlarc='${wl}'
+-	archive_cmds='$CC -shared ${wl}-z ${wl}text ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
++	archive_cmds='$CC -shared $pic_flag ${wl}-z ${wl}text ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
+ 	archive_expsym_cmds='echo "{ global:" > $lib.exp~cat $export_symbols | $SED -e "s/\(.*\)/\1;/" >> $lib.exp~echo "local: *; };" >> $lib.exp~
+-	  $CC -shared ${wl}-z ${wl}text ${wl}-M ${wl}$lib.exp ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
++	  $CC -shared $pic_flag ${wl}-z ${wl}text ${wl}-M ${wl}$lib.exp ${wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
+       else
+ 	case `$CC -V 2>&1` in
+ 	*"Compilers 5.0"*)
+@@ -9459,8 +10055,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+   need_version=no
+   need_lib_prefix=no
+ 
+-  case $GCC,$host_os in
+-  yes,cygwin* | yes,mingw* | yes,pw32* | yes,cegcc*)
++  case $GCC,$cc_basename in
++  yes,*)
++    # gcc
+     library_names_spec='$libname.dll.a'
+     # DLL is installed to $(libdir)/../bin by postinstall_cmds
+     postinstall_cmds='base_file=`basename \${file}`~
+@@ -9493,13 +10090,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+       library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
+       ;;
+     esac
++    dynamic_linker='Win32 ld.exe'
++    ;;
++
++  *,cl*)
++    # Native MSVC
++    libname_spec='$name'
++    soname_spec='${libname}`echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
++    library_names_spec='${libname}.dll.lib'
++
++    case $build_os in
++    mingw*)
++      sys_lib_search_path_spec=
++      lt_save_ifs=$IFS
++      IFS=';'
++      for lt_path in $LIB
++      do
++        IFS=$lt_save_ifs
++        # Let DOS variable expansion print the short 8.3 style file name.
++        lt_path=`cd "$lt_path" 2>/dev/null && cmd //C "for %i in (".") do @echo %~si"`
++        sys_lib_search_path_spec="$sys_lib_search_path_spec $lt_path"
++      done
++      IFS=$lt_save_ifs
++      # Convert to MSYS style.
++      sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | sed -e 's|\\\\|/|g' -e 's| \\([a-zA-Z]\\):| /\\1|g' -e 's|^ ||'`
++      ;;
++    cygwin*)
++      # Convert to unix form, then to dos form, then back to unix form
++      # but this time dos style (no spaces!) so that the unix form looks
++      # like /cygdrive/c/PROGRA~1:/cygdr...
++      sys_lib_search_path_spec=`cygpath --path --unix "$LIB"`
++      sys_lib_search_path_spec=`cygpath --path --dos "$sys_lib_search_path_spec" 2>/dev/null`
++      sys_lib_search_path_spec=`cygpath --path --unix "$sys_lib_search_path_spec" | $SED -e "s/$PATH_SEPARATOR/ /g"`
++      ;;
++    *)
++      sys_lib_search_path_spec="$LIB"
++      if $ECHO "$sys_lib_search_path_spec" | $GREP ';[c-zC-Z]:/' >/dev/null; then
++        # It is most probably a Windows format PATH.
++        sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | $SED -e 's/;/ /g'`
++      else
++        sys_lib_search_path_spec=`$ECHO "$sys_lib_search_path_spec" | $SED -e "s/$PATH_SEPARATOR/ /g"`
++      fi
++      # FIXME: find the short name or the path components, as spaces are
++      # common. (e.g. "Program Files" -> "PROGRA~1")
++      ;;
++    esac
++
++    # DLL is installed to $(libdir)/../bin by postinstall_cmds
++    postinstall_cmds='base_file=`basename \${file}`~
++      dlpath=`$SHELL 2>&1 -c '\''. $dir/'\''\${base_file}'\''i; echo \$dlname'\''`~
++      dldir=$destdir/`dirname \$dlpath`~
++      test -d \$dldir || mkdir -p \$dldir~
++      $install_prog $dir/$dlname \$dldir/$dlname'
++    postuninstall_cmds='dldll=`$SHELL 2>&1 -c '\''. $file; echo \$dlname'\''`~
++      dlpath=$dir/\$dldll~
++       $RM \$dlpath'
++    shlibpath_overrides_runpath=yes
++    dynamic_linker='Win32 link.exe'
+     ;;
+ 
+   *)
++    # Assume MSVC wrapper
+     library_names_spec='${libname}`echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext} $libname.lib'
++    dynamic_linker='Win32 ld.exe'
+     ;;
+   esac
+-  dynamic_linker='Win32 ld.exe'
+   # FIXME: first we should search . and the directory the executable is in
+   shlibpath_var=PATH
+   ;;
+@@ -9591,7 +10246,7 @@ haiku*)
+   soname_spec='${libname}${release}${shared_ext}$major'
+   shlibpath_var=LIBRARY_PATH
+   shlibpath_overrides_runpath=yes
+-  sys_lib_dlsearch_path_spec='/boot/home/config/lib /boot/common/lib /boot/beos/system/lib'
++  sys_lib_dlsearch_path_spec='/boot/home/config/lib /boot/common/lib /boot/system/lib'
+   hardcode_into_libs=yes
+   ;;
+ 
+@@ -10405,7 +11060,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 10408 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -10449,10 +11104,10 @@ else
+ /* When -fvisbility=hidden is used, assume the code has been annotated
+    correspondingly for the symbols needed.  */
+ #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
+-void fnord () __attribute__((visibility("default")));
++int fnord () __attribute__((visibility("default")));
+ #endif
+ 
+-void fnord () { int i=42; }
++int fnord () { return 42; }
+ int main ()
+ {
+   void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
+@@ -10511,7 +11166,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 10514 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -10555,10 +11210,10 @@ else
+ /* When -fvisbility=hidden is used, assume the code has been annotated
+    correspondingly for the symbols needed.  */
+ #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
+-void fnord () __attribute__((visibility("default")));
++int fnord () __attribute__((visibility("default")));
+ #endif
+ 
+-void fnord () { int i=42; }
++int fnord () { return 42; }
+ int main ()
+ {
+   void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
+@@ -11990,13 +12645,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+ lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
+ lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
+ lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
++lt_cv_to_host_file_cmd='`$ECHO "$lt_cv_to_host_file_cmd" | $SED "$delay_single_quote_subst"`'
++lt_cv_to_tool_file_cmd='`$ECHO "$lt_cv_to_tool_file_cmd" | $SED "$delay_single_quote_subst"`'
+ reload_flag='`$ECHO "$reload_flag" | $SED "$delay_single_quote_subst"`'
+ reload_cmds='`$ECHO "$reload_cmds" | $SED "$delay_single_quote_subst"`'
+ OBJDUMP='`$ECHO "$OBJDUMP" | $SED "$delay_single_quote_subst"`'
+ deplibs_check_method='`$ECHO "$deplibs_check_method" | $SED "$delay_single_quote_subst"`'
+ file_magic_cmd='`$ECHO "$file_magic_cmd" | $SED "$delay_single_quote_subst"`'
++file_magic_glob='`$ECHO "$file_magic_glob" | $SED "$delay_single_quote_subst"`'
++want_nocaseglob='`$ECHO "$want_nocaseglob" | $SED "$delay_single_quote_subst"`'
++DLLTOOL='`$ECHO "$DLLTOOL" | $SED "$delay_single_quote_subst"`'
++sharedlib_from_linklib_cmd='`$ECHO "$sharedlib_from_linklib_cmd" | $SED "$delay_single_quote_subst"`'
+ AR='`$ECHO "$AR" | $SED "$delay_single_quote_subst"`'
+ AR_FLAGS='`$ECHO "$AR_FLAGS" | $SED "$delay_single_quote_subst"`'
++archiver_list_spec='`$ECHO "$archiver_list_spec" | $SED "$delay_single_quote_subst"`'
+ STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
+ RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
+ old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
+@@ -12011,14 +12673,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+ lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
+ lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
+ lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
++nm_file_list_spec='`$ECHO "$nm_file_list_spec" | $SED "$delay_single_quote_subst"`'
++lt_sysroot='`$ECHO "$lt_sysroot" | $SED "$delay_single_quote_subst"`'
+ objdir='`$ECHO "$objdir" | $SED "$delay_single_quote_subst"`'
+ MAGIC_CMD='`$ECHO "$MAGIC_CMD" | $SED "$delay_single_quote_subst"`'
+ lt_prog_compiler_no_builtin_flag='`$ECHO "$lt_prog_compiler_no_builtin_flag" | $SED "$delay_single_quote_subst"`'
+-lt_prog_compiler_wl='`$ECHO "$lt_prog_compiler_wl" | $SED "$delay_single_quote_subst"`'
+ lt_prog_compiler_pic='`$ECHO "$lt_prog_compiler_pic" | $SED "$delay_single_quote_subst"`'
++lt_prog_compiler_wl='`$ECHO "$lt_prog_compiler_wl" | $SED "$delay_single_quote_subst"`'
+ lt_prog_compiler_static='`$ECHO "$lt_prog_compiler_static" | $SED "$delay_single_quote_subst"`'
+ lt_cv_prog_compiler_c_o='`$ECHO "$lt_cv_prog_compiler_c_o" | $SED "$delay_single_quote_subst"`'
+ need_locks='`$ECHO "$need_locks" | $SED "$delay_single_quote_subst"`'
++MANIFEST_TOOL='`$ECHO "$MANIFEST_TOOL" | $SED "$delay_single_quote_subst"`'
+ DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
+ NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
+ LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
+@@ -12051,12 +12716,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+ hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
+ inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
+ link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
+-fix_srcfile_path='`$ECHO "$fix_srcfile_path" | $SED "$delay_single_quote_subst"`'
+ always_export_symbols='`$ECHO "$always_export_symbols" | $SED "$delay_single_quote_subst"`'
+ export_symbols_cmds='`$ECHO "$export_symbols_cmds" | $SED "$delay_single_quote_subst"`'
+ exclude_expsyms='`$ECHO "$exclude_expsyms" | $SED "$delay_single_quote_subst"`'
+ include_expsyms='`$ECHO "$include_expsyms" | $SED "$delay_single_quote_subst"`'
+ prelink_cmds='`$ECHO "$prelink_cmds" | $SED "$delay_single_quote_subst"`'
++postlink_cmds='`$ECHO "$postlink_cmds" | $SED "$delay_single_quote_subst"`'
+ file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
+ variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
+ need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
+@@ -12111,8 +12776,13 @@ reload_flag \
+ OBJDUMP \
+ deplibs_check_method \
+ file_magic_cmd \
++file_magic_glob \
++want_nocaseglob \
++DLLTOOL \
++sharedlib_from_linklib_cmd \
+ AR \
+ AR_FLAGS \
++archiver_list_spec \
+ STRIP \
+ RANLIB \
+ CC \
+@@ -12122,12 +12792,14 @@ lt_cv_sys_global_symbol_pipe \
+ lt_cv_sys_global_symbol_to_cdecl \
+ lt_cv_sys_global_symbol_to_c_name_address \
+ lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
++nm_file_list_spec \
+ lt_prog_compiler_no_builtin_flag \
+-lt_prog_compiler_wl \
+ lt_prog_compiler_pic \
++lt_prog_compiler_wl \
+ lt_prog_compiler_static \
+ lt_cv_prog_compiler_c_o \
+ need_locks \
++MANIFEST_TOOL \
+ DSYMUTIL \
+ NMEDIT \
+ LIPO \
+@@ -12143,7 +12815,6 @@ no_undefined_flag \
+ hardcode_libdir_flag_spec \
+ hardcode_libdir_flag_spec_ld \
+ hardcode_libdir_separator \
+-fix_srcfile_path \
+ exclude_expsyms \
+ include_expsyms \
+ file_list_spec \
+@@ -12179,6 +12850,7 @@ module_cmds \
+ module_expsym_cmds \
+ export_symbols_cmds \
+ prelink_cmds \
++postlink_cmds \
+ postinstall_cmds \
+ postuninstall_cmds \
+ finish_cmds \
+@@ -12768,7 +13440,8 @@ $as_echo X"$file" |
+ # NOTE: Changes made to this file will be lost: look at ltmain.sh.
+ #
+ #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
+-#                 2006, 2007, 2008, 2009 Free Software Foundation, Inc.
++#                 2006, 2007, 2008, 2009, 2010 Free Software Foundation,
++#                 Inc.
+ #   Written by Gordon Matzigkeit, 1996
+ #
+ #   This file is part of GNU Libtool.
+@@ -12871,19 +13544,42 @@ SP2NL=$lt_lt_SP2NL
+ # turn newlines into spaces.
+ NL2SP=$lt_lt_NL2SP
+ 
++# convert \$build file names to \$host format.
++to_host_file_cmd=$lt_cv_to_host_file_cmd
++
++# convert \$build files to toolchain format.
++to_tool_file_cmd=$lt_cv_to_tool_file_cmd
++
+ # An object symbol dumper.
+ OBJDUMP=$lt_OBJDUMP
+ 
+ # Method to check whether dependent libraries are shared objects.
+ deplibs_check_method=$lt_deplibs_check_method
+ 
+-# Command to use when deplibs_check_method == "file_magic".
++# Command to use when deplibs_check_method = "file_magic".
+ file_magic_cmd=$lt_file_magic_cmd
+ 
++# How to find potential files when deplibs_check_method = "file_magic".
++file_magic_glob=$lt_file_magic_glob
++
++# Find potential files using nocaseglob when deplibs_check_method = "file_magic".
++want_nocaseglob=$lt_want_nocaseglob
++
++# DLL creation program.
++DLLTOOL=$lt_DLLTOOL
++
++# Command to associate shared and link libraries.
++sharedlib_from_linklib_cmd=$lt_sharedlib_from_linklib_cmd
++
+ # The archiver.
+ AR=$lt_AR
++
++# Flags to create an archive.
+ AR_FLAGS=$lt_AR_FLAGS
+ 
++# How to feed a file listing to the archiver.
++archiver_list_spec=$lt_archiver_list_spec
++
+ # A symbol stripping program.
+ STRIP=$lt_STRIP
+ 
+@@ -12913,6 +13609,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+ # Transform the output of nm in a C name address pair when lib prefix is needed.
+ global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
+ 
++# Specify filename containing input files for \$NM.
++nm_file_list_spec=$lt_nm_file_list_spec
++
++# The root where to search for dependent libraries,and in which our libraries should be installed.
++lt_sysroot=$lt_sysroot
++
+ # The name of the directory that contains temporary libtool files.
+ objdir=$objdir
+ 
+@@ -12922,6 +13624,9 @@ MAGIC_CMD=$MAGIC_CMD
+ # Must we lock files when doing compilation?
+ need_locks=$lt_need_locks
+ 
++# Manifest tool.
++MANIFEST_TOOL=$lt_MANIFEST_TOOL
++
+ # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
+ DSYMUTIL=$lt_DSYMUTIL
+ 
+@@ -13036,12 +13741,12 @@ with_gcc=$GCC
+ # Compiler flag to turn off builtin functions.
+ no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
+ 
+-# How to pass a linker flag through the compiler.
+-wl=$lt_lt_prog_compiler_wl
+-
+ # Additional compiler flags for building library objects.
+ pic_flag=$lt_lt_prog_compiler_pic
+ 
++# How to pass a linker flag through the compiler.
++wl=$lt_lt_prog_compiler_wl
++
+ # Compiler flag to prevent dynamic linking.
+ link_static_flag=$lt_lt_prog_compiler_static
+ 
+@@ -13128,9 +13833,6 @@ inherit_rpath=$inherit_rpath
+ # Whether libtool must link a program against all its dependency libraries.
+ link_all_deplibs=$link_all_deplibs
+ 
+-# Fix the shell variable \$srcfile for the compiler.
+-fix_srcfile_path=$lt_fix_srcfile_path
+-
+ # Set to "yes" if exported symbols are required.
+ always_export_symbols=$always_export_symbols
+ 
+@@ -13146,6 +13848,9 @@ include_expsyms=$lt_include_expsyms
+ # Commands necessary for linking programs (against libraries) with templates.
+ prelink_cmds=$lt_prelink_cmds
+ 
++# Commands necessary for finishing linking programs.
++postlink_cmds=$lt_postlink_cmds
++
+ # Specify filename containing input files.
+ file_list_spec=$lt_file_list_spec
+ 
+@@ -13178,210 +13883,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+   # if finds mixed CR/LF and LF-only lines.  Since sed operates in
+   # text mode, it properly converts lines to CR/LF.  This bash problem
+   # is reportedly fixed, but why not run on old versions too?
+-  sed '/^# Generated shell functions inserted here/q' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+-
+-  case $xsi_shell in
+-  yes)
+-    cat << \_LT_EOF >> "$cfgfile"
+-
+-# func_dirname file append nondir_replacement
+-# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
+-# otherwise set result to NONDIR_REPLACEMENT.
+-func_dirname ()
+-{
+-  case ${1} in
+-    */*) func_dirname_result="${1%/*}${2}" ;;
+-    *  ) func_dirname_result="${3}" ;;
+-  esac
+-}
+-
+-# func_basename file
+-func_basename ()
+-{
+-  func_basename_result="${1##*/}"
+-}
+-
+-# func_dirname_and_basename file append nondir_replacement
+-# perform func_basename and func_dirname in a single function
+-# call:
+-#   dirname:  Compute the dirname of FILE.  If nonempty,
+-#             add APPEND to the result, otherwise set result
+-#             to NONDIR_REPLACEMENT.
+-#             value returned in "$func_dirname_result"
+-#   basename: Compute filename of FILE.
+-#             value retuned in "$func_basename_result"
+-# Implementation must be kept synchronized with func_dirname
+-# and func_basename. For efficiency, we do not delegate to
+-# those functions but instead duplicate the functionality here.
+-func_dirname_and_basename ()
+-{
+-  case ${1} in
+-    */*) func_dirname_result="${1%/*}${2}" ;;
+-    *  ) func_dirname_result="${3}" ;;
+-  esac
+-  func_basename_result="${1##*/}"
+-}
+-
+-# func_stripname prefix suffix name
+-# strip PREFIX and SUFFIX off of NAME.
+-# PREFIX and SUFFIX must not contain globbing or regex special
+-# characters, hashes, percent signs, but SUFFIX may contain a leading
+-# dot (in which case that matches only a dot).
+-func_stripname ()
+-{
+-  # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are
+-  # positional parameters, so assign one to ordinary parameter first.
+-  func_stripname_result=${3}
+-  func_stripname_result=${func_stripname_result#"${1}"}
+-  func_stripname_result=${func_stripname_result%"${2}"}
+-}
+-
+-# func_opt_split
+-func_opt_split ()
+-{
+-  func_opt_split_opt=${1%%=*}
+-  func_opt_split_arg=${1#*=}
+-}
+-
+-# func_lo2o object
+-func_lo2o ()
+-{
+-  case ${1} in
+-    *.lo) func_lo2o_result=${1%.lo}.${objext} ;;
+-    *)    func_lo2o_result=${1} ;;
+-  esac
+-}
+-
+-# func_xform libobj-or-source
+-func_xform ()
+-{
+-  func_xform_result=${1%.*}.lo
+-}
+-
+-# func_arith arithmetic-term...
+-func_arith ()
+-{
+-  func_arith_result=$(( $* ))
+-}
+-
+-# func_len string
+-# STRING may not start with a hyphen.
+-func_len ()
+-{
+-  func_len_result=${#1}
+-}
+-
+-_LT_EOF
+-    ;;
+-  *) # Bourne compatible functions.
+-    cat << \_LT_EOF >> "$cfgfile"
+-
+-# func_dirname file append nondir_replacement
+-# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
+-# otherwise set result to NONDIR_REPLACEMENT.
+-func_dirname ()
+-{
+-  # Extract subdirectory from the argument.
+-  func_dirname_result=`$ECHO "${1}" | $SED "$dirname"`
+-  if test "X$func_dirname_result" = "X${1}"; then
+-    func_dirname_result="${3}"
+-  else
+-    func_dirname_result="$func_dirname_result${2}"
+-  fi
+-}
+-
+-# func_basename file
+-func_basename ()
+-{
+-  func_basename_result=`$ECHO "${1}" | $SED "$basename"`
+-}
+-
+-
+-# func_stripname prefix suffix name
+-# strip PREFIX and SUFFIX off of NAME.
+-# PREFIX and SUFFIX must not contain globbing or regex special
+-# characters, hashes, percent signs, but SUFFIX may contain a leading
+-# dot (in which case that matches only a dot).
+-# func_strip_suffix prefix name
+-func_stripname ()
+-{
+-  case ${2} in
+-    .*) func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%\\\\${2}\$%%"`;;
+-    *)  func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%${2}\$%%"`;;
+-  esac
+-}
+-
+-# sed scripts:
+-my_sed_long_opt='1s/^\(-[^=]*\)=.*/\1/;q'
+-my_sed_long_arg='1s/^-[^=]*=//'
+-
+-# func_opt_split
+-func_opt_split ()
+-{
+-  func_opt_split_opt=`$ECHO "${1}" | $SED "$my_sed_long_opt"`
+-  func_opt_split_arg=`$ECHO "${1}" | $SED "$my_sed_long_arg"`
+-}
+-
+-# func_lo2o object
+-func_lo2o ()
+-{
+-  func_lo2o_result=`$ECHO "${1}" | $SED "$lo2o"`
+-}
+-
+-# func_xform libobj-or-source
+-func_xform ()
+-{
+-  func_xform_result=`$ECHO "${1}" | $SED 's/\.[^.]*$/.lo/'`
+-}
+-
+-# func_arith arithmetic-term...
+-func_arith ()
+-{
+-  func_arith_result=`expr "$@"`
+-}
+-
+-# func_len string
+-# STRING may not start with a hyphen.
+-func_len ()
+-{
+-  func_len_result=`expr "$1" : ".*" 2>/dev/null || echo $max_cmd_len`
+-}
+-
+-_LT_EOF
+-esac
+-
+-case $lt_shell_append in
+-  yes)
+-    cat << \_LT_EOF >> "$cfgfile"
+-
+-# func_append var value
+-# Append VALUE to the end of shell variable VAR.
+-func_append ()
+-{
+-  eval "$1+=\$2"
+-}
+-_LT_EOF
+-    ;;
+-  *)
+-    cat << \_LT_EOF >> "$cfgfile"
+-
+-# func_append var value
+-# Append VALUE to the end of shell variable VAR.
+-func_append ()
+-{
+-  eval "$1=\$$1\$2"
+-}
+-
+-_LT_EOF
+-    ;;
+-  esac
+-
+-
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+-
+-  mv -f "$cfgfile" "$ofile" ||
++  sed '$q' "$ltmain" >> "$cfgfile" \
++     || (rm -f "$cfgfile"; exit 1)
++
++  if test x"$xsi_shell" = xyes; then
++  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
++func_dirname ()\
++{\
++\    case ${1} in\
++\      */*) func_dirname_result="${1%/*}${2}" ;;\
++\      *  ) func_dirname_result="${3}" ;;\
++\    esac\
++} # Extended-shell func_dirname implementation' "$cfgfile" > $cfgfile.tmp \
++  && mv -f "$cfgfile.tmp" "$cfgfile" \
++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
++test 0 -eq $? || _lt_function_replace_fail=:
++
++
++  sed -e '/^func_basename ()$/,/^} # func_basename /c\
++func_basename ()\
++{\
++\    func_basename_result="${1##*/}"\
++} # Extended-shell func_basename implementation' "$cfgfile" > $cfgfile.tmp \
++  && mv -f "$cfgfile.tmp" "$cfgfile" \
++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
++test 0 -eq $? || _lt_function_replace_fail=:
++
++
++  sed -e '/^func_dirname_and_basename ()$/,/^} # func_dirname_and_basename /c\
++func_dirname_and_basename ()\
++{\
++\    case ${1} in\
++\      */*) func_dirname_result="${1%/*}${2}" ;;\
++\      *  ) func_dirname_result="${3}" ;;\
++\    esac\
++\    func_basename_result="${1##*/}"\
++} # Extended-shell func_dirname_and_basename implementation' "$cfgfile" > $cfgfile.tmp \
++  && mv -f "$cfgfile.tmp" "$cfgfile" \
++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
++test 0 -eq $? || _lt_function_replace_fail=:
++
++
++  sed -e '/^func_stripname ()$/,/^} # func_stripname /c\
++func_stripname ()\
++{\
++\    # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are\
++\    # positional parameters, so assign one to ordinary parameter first.\
++\    func_stripname_result=${3}\
++\    func_stripname_result=${func_stripname_result#"${1}"}\
++\    func_stripname_result=${func_stripname_result%"${2}"}\
++} # Extended-shell func_stripname implementation' "$cfgfile" > $cfgfile.tmp \
++  && mv -f "$cfgfile.tmp" "$cfgfile" \
++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
++test 0 -eq $? || _lt_function_replace_fail=:
++
++
++  sed -e '/^func_split_long_opt ()$/,/^} # func_split_long_opt /c\
++func_split_long_opt ()\
++{\
++\    func_split_long_opt_name=${1%%=*}\
++\    func_split_long_opt_arg=${1#*=}\
++} # Extended-shell func_split_long_opt implementation' "$cfgfile" > $cfgfile.tmp \
++  && mv -f "$cfgfile.tmp" "$cfgfile" \
++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
++test 0 -eq $? || _lt_function_replace_fail=:
++
++
++  sed -e '/^func_split_short_opt ()$/,/^} # func_split_short_opt /c\
++func_split_short_opt ()\
++{\
++\    func_split_short_opt_arg=${1#??}\
++\    func_split_short_opt_name=${1%"$func_split_short_opt_arg"}\
++} # Extended-shell func_split_short_opt implementation' "$cfgfile" > $cfgfile.tmp \
++  && mv -f "$cfgfile.tmp" "$cfgfile" \
++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
++test 0 -eq $? || _lt_function_replace_fail=:
++
++
++  sed -e '/^func_lo2o ()$/,/^} # func_lo2o /c\
++func_lo2o ()\
++{\
++\    case ${1} in\
++\      *.lo) func_lo2o_result=${1%.lo}.${objext} ;;\
++\      *)    func_lo2o_result=${1} ;;\
++\    esac\
++} # Extended-shell func_lo2o implementation' "$cfgfile" > $cfgfile.tmp \
++  && mv -f "$cfgfile.tmp" "$cfgfile" \
++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
++test 0 -eq $? || _lt_function_replace_fail=:
++
++
++  sed -e '/^func_xform ()$/,/^} # func_xform /c\
++func_xform ()\
++{\
++    func_xform_result=${1%.*}.lo\
++} # Extended-shell func_xform implementation' "$cfgfile" > $cfgfile.tmp \
++  && mv -f "$cfgfile.tmp" "$cfgfile" \
++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
++test 0 -eq $? || _lt_function_replace_fail=:
++
++
++  sed -e '/^func_arith ()$/,/^} # func_arith /c\
++func_arith ()\
++{\
++    func_arith_result=$(( $* ))\
++} # Extended-shell func_arith implementation' "$cfgfile" > $cfgfile.tmp \
++  && mv -f "$cfgfile.tmp" "$cfgfile" \
++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
++test 0 -eq $? || _lt_function_replace_fail=:
++
++
++  sed -e '/^func_len ()$/,/^} # func_len /c\
++func_len ()\
++{\
++    func_len_result=${#1}\
++} # Extended-shell func_len implementation' "$cfgfile" > $cfgfile.tmp \
++  && mv -f "$cfgfile.tmp" "$cfgfile" \
++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
++test 0 -eq $? || _lt_function_replace_fail=:
++
++fi
++
++if test x"$lt_shell_append" = xyes; then
++  sed -e '/^func_append ()$/,/^} # func_append /c\
++func_append ()\
++{\
++    eval "${1}+=\\${2}"\
++} # Extended-shell func_append implementation' "$cfgfile" > $cfgfile.tmp \
++  && mv -f "$cfgfile.tmp" "$cfgfile" \
++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
++test 0 -eq $? || _lt_function_replace_fail=:
++
++
++  sed -e '/^func_append_quoted ()$/,/^} # func_append_quoted /c\
++func_append_quoted ()\
++{\
++\    func_quote_for_eval "${2}"\
++\    eval "${1}+=\\\\ \\$func_quote_for_eval_result"\
++} # Extended-shell func_append_quoted implementation' "$cfgfile" > $cfgfile.tmp \
++  && mv -f "$cfgfile.tmp" "$cfgfile" \
++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
++test 0 -eq $? || _lt_function_replace_fail=:
++
++
++  # Save a `func_append' function call where possible by direct use of '+='
++  sed -e 's%func_append \([a-zA-Z_]\{1,\}\) "%\1+="%g' $cfgfile > $cfgfile.tmp \
++    && mv -f "$cfgfile.tmp" "$cfgfile" \
++      || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
++  test 0 -eq $? || _lt_function_replace_fail=:
++else
++  # Save a `func_append' function call even when '+=' is not available
++  sed -e 's%func_append \([a-zA-Z_]\{1,\}\) "%\1="$\1%g' $cfgfile > $cfgfile.tmp \
++    && mv -f "$cfgfile.tmp" "$cfgfile" \
++      || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
++  test 0 -eq $? || _lt_function_replace_fail=:
++fi
++
++if test x"$_lt_function_replace_fail" = x":"; then
++  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
++$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
++fi
++
++
++   mv -f "$cfgfile" "$ofile" ||
+     (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
+   chmod +x "$ofile"
+ 
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch b/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
index a037634..0319ba6 100644
--- a/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
+++ b/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
@@ -1,7 +1,7 @@
-From 743f42aaecb1ab89eba0eaf5e88ed67bbf3ba304 Mon Sep 17 00:00:00 2001
+From 61789a45c6193519b9da9dd0fa9a94532faaa4a9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:37:10 +0000
-Subject: [PATCH 07/13] Add the armv5e architecture to binutils
+Subject: [PATCH 07/12] Add the armv5e architecture to binutils
 
 Binutils has a comment that indicates it is supposed to match gcc for
 all of the support "-march=" settings, but it was lacking the armv5e setting.
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/gas/config/tc-arm.c b/gas/config/tc-arm.c
-index 2db6c2d..ab48168 100644
+index 3bd4bc9..5d99921 100644
 --- a/gas/config/tc-arm.c
 +++ b/gas/config/tc-arm.c
-@@ -24463,6 +24463,7 @@ static const struct arm_arch_option_table arm_archs[] =
+@@ -24791,6 +24791,7 @@ static const struct arm_arch_option_table arm_archs[] =
    ARM_ARCH_OPT ("armv4t",	ARM_ARCH_V4T,	 FPU_ARCH_FPA),
    ARM_ARCH_OPT ("armv4txm",	ARM_ARCH_V4TxM,	 FPU_ARCH_FPA),
    ARM_ARCH_OPT ("armv5",	ARM_ARCH_V5,	 FPU_ARCH_VFP),
@@ -31,5 +31,5 @@ index 2db6c2d..ab48168 100644
    ARM_ARCH_OPT ("armv5txm",	ARM_ARCH_V5TxM,	 FPU_ARCH_VFP),
    ARM_ARCH_OPT ("armv5te",	ARM_ARCH_V5TE,	 FPU_ARCH_VFP),
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
index 0ae68fc..ad1901e 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
@@ -1,7 +1,7 @@
-From 4d3a9f6db604055348332b56889d466c058fa5f3 Mon Sep 17 00:00:00 2001
+From 0ccefb615b5316e71c1ed9bab80aa4eafb26167a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:39:01 +0000
-Subject: [PATCH 08/13] don't let the distro compiler point to the wrong
+Subject: [PATCH 08/12] don't let the distro compiler point to the wrong
  installation location
 
 Thanks to RP for helping find the source code causing the issue.
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
-index 9b87720..ff43f53 100644
+index 7d7e2f4..1aaaf0e 100644
 --- a/libiberty/Makefile.in
 +++ b/libiberty/Makefile.in
-@@ -361,7 +361,8 @@ install-strip: install
+@@ -364,7 +364,8 @@ install-strip: install
  # multilib-specific flags, it's overridden by FLAGS_TO_PASS from the
  # default multilib, so we have to take CFLAGS into account as well,
  # since it will be passed the multilib flags.
@@ -31,5 +31,5 @@ index 9b87720..ff43f53 100644
  	if test -n "${target_header_dir}"; then \
  		${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0009-Upstream-Status-Inappropriate-distribution-codesourc.patch b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
similarity index 82%
rename from meta/recipes-devtools/binutils/binutils/0009-Upstream-Status-Inappropriate-distribution-codesourc.patch
rename to meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
index f800796..b14ead0 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-Upstream-Status-Inappropriate-distribution-codesourc.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -1,15 +1,7 @@
-From e02e119b278c3f404e97669e7180cac944134c91 Mon Sep 17 00:00:00 2001
+From e5d18410cb07da09f854b9568f51a873f1166d2a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Mar 2015 01:41:04 +0000
-Subject: [PATCH 09/13] Upstream-Status: Inappropriate [distribution:
- codesourcery]
-
-Patch originally created by Mark Hatle, forward-ported to
-binutils 2.21 by Scott Garman.
-
-purpose:  warn for uses of system directories when cross linking
-
-Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
+Date: Fri, 15 Jan 2016 06:31:09 +0000
+Subject: [PATCH 09/12] warn for uses of system directories when cross linking
 
 2008-07-02  Joseph Myers  <joseph@codesourcery.com>
 
@@ -57,8 +49,10 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+Upstream-Status: Pending
+
  ld/config.in    |  3 +++
- ld/configure    | 14 ++++++++++++++
+ ld/configure    | 16 ++++++++++++++++
  ld/configure.ac | 10 ++++++++++
  ld/ld.h         |  8 ++++++++
  ld/ld.texinfo   | 12 ++++++++++++
@@ -66,13 +60,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ld/ldlex.h      |  2 ++
  ld/ldmain.c     |  2 ++
  ld/lexsup.c     | 16 ++++++++++++++++
- 9 files changed, 84 insertions(+)
+ 9 files changed, 86 insertions(+)
 
 diff --git a/ld/config.in b/ld/config.in
-index 2ab4844..766d23c 100644
+index 276fb77..35c58eb 100644
 --- a/ld/config.in
 +++ b/ld/config.in
-@@ -11,6 +11,9 @@
+@@ -14,6 +14,9 @@
     language is requested. */
  #undef ENABLE_NLS
  
@@ -83,18 +77,18 @@ index 2ab4844..766d23c 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index 2fbaebf..5726a08 100755
+index 7a20e4e..7cff36c 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -787,6 +787,7 @@ with_lib_path
+@@ -790,6 +790,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
 +enable_poison_system_directories
  enable_gold
  enable_got
- enable_werror
-@@ -1443,6 +1444,8 @@ Optional Features:
+ enable_compressed_debug_sections
+@@ -1446,6 +1447,8 @@ Optional Features:
    --disable-largefile     omit support for large files
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -103,8 +97,8 @@ index 2fbaebf..5726a08 100755
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -16323,7 +16326,18 @@ else
- fi
+@@ -16306,6 +16309,19 @@ fi
+ 
  
  
 +# Check whether --enable-poison-system-directories was given.
@@ -115,18 +109,19 @@ index 2fbaebf..5726a08 100755
 +fi
 +
 +if test "x${enable_poison_system_directories}" = "xyes"; then
- 
++
 +$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
 +
 +fi
- 
- # Check whether --enable-got was given.
- if test "${enable_got+set}" = set; then :
++
+ # Check whether --enable-gold was given.
+ if test "${enable_gold+set}" = set; then :
+   enableval=$enable_gold; case "${enableval}" in
 diff --git a/ld/configure.ac b/ld/configure.ac
-index 1bddfc9..e9edb7f 100644
+index 188172d..2cd8443 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
-@@ -94,6 +94,16 @@ AC_SUBST(use_sysroot)
+@@ -95,6 +95,16 @@ AC_SUBST(use_sysroot)
  AC_SUBST(TARGET_SYSTEM_ROOT)
  AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
  
@@ -144,12 +139,12 @@ index 1bddfc9..e9edb7f 100644
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
 diff --git a/ld/ld.h b/ld/ld.h
-index f773ce7..adba0f6 100644
+index d84ec4e..3476b26 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
-@@ -161,6 +161,14 @@ typedef struct {
-   /* If TRUE we'll just print the default output on stdout.  */
-   bfd_boolean print_output_format;
+@@ -164,6 +164,14 @@ typedef struct {
+   /* If set, display the target memory usage (per memory region).  */
+   bfd_boolean print_memory_usage;
  
 +  /* If TRUE (the default) warn for uses of system directories when
 +     cross linking.  */
@@ -163,10 +158,10 @@ index f773ce7..adba0f6 100644
    enum endian_enum endian;
  
 diff --git a/ld/ld.texinfo b/ld/ld.texinfo
-index 502582c..dae168a 100644
+index 1dd7492..fb1438e 100644
 --- a/ld/ld.texinfo
 +++ b/ld/ld.texinfo
-@@ -2212,6 +2212,18 @@ string identifying the original linked file does not change.
+@@ -2332,6 +2332,18 @@ string identifying the original linked file does not change.
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
@@ -186,7 +181,7 @@ index 502582c..dae168a 100644
  
  @c man end
 diff --git a/ld/ldfile.c b/ld/ldfile.c
-index 782ed7f..19a9ab4 100644
+index 96f9ecc..af231c0 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
 @@ -114,6 +114,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
@@ -214,23 +209,23 @@ index 782ed7f..19a9ab4 100644
  
  /* Try to open a BFD for a lang_input_statement.  */
 diff --git a/ld/ldlex.h b/ld/ldlex.h
-index e3e9b24..29487a3 100644
+index 6f11e7b..0ca3110 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
-@@ -140,6 +140,8 @@ enum option_values
-   OPTION_IGNORE_UNRESOLVED_SYMBOL,
-   OPTION_PUSH_STATE,
-   OPTION_POP_STATE,
+@@ -144,6 +144,8 @@ enum option_values
+   OPTION_PRINT_MEMORY_USAGE,
+   OPTION_REQUIRE_DEFINED_SYMBOL,
+   OPTION_ORPHAN_HANDLING,
 +  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
 +  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
  };
  
  /* The initial parser states.  */
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index 818d108..54c49f2 100644
+index bb0b9cc..a23c56c 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -266,6 +266,8 @@ main (int argc, char **argv)
+@@ -257,6 +257,8 @@ main (int argc, char **argv)
    command_line.warn_mismatch = TRUE;
    command_line.warn_search_mismatch = TRUE;
    command_line.check_section_addresses = -1;
@@ -240,12 +235,12 @@ index 818d108..54c49f2 100644
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 4812c97..21b49df 100644
+index 4cad209..173b17f 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
-@@ -513,6 +513,14 @@ static const struct ld_option ld_options[] =
-   { {"pop-state", no_argument, NULL, OPTION_POP_STATE},
-     '\0', NULL, N_("Pop state of flags governing input file handling"),
+@@ -530,6 +530,14 @@ static const struct ld_option ld_options[] =
+   { {"orphan-handling", required_argument, NULL, OPTION_ORPHAN_HANDLING},
+     '\0', N_("=MODE"), N_("Control how orphan sections are handled."),
      TWO_DASHES },
 +  { {"no-poison-system-directories", no_argument, NULL,
 +     OPTION_NO_POISON_SYSTEM_DIRECTORIES},
@@ -258,9 +253,9 @@ index 4812c97..21b49df 100644
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -1474,6 +1482,14 @@ parse_args (unsigned argc, char **argv)
- 	      free (oldp);
- 	    }
+@@ -1550,6 +1558,14 @@ parse_args (unsigned argc, char **argv)
+ 	    einfo (_("%P%F: invalid argument to option"
+ 		     " \"--orphan-handling\"\n"));
  	  break;
 +
 +	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
@@ -274,5 +269,5 @@ index 4812c97..21b49df 100644
      }
  
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
index 5451e74..49b19e9 100644
--- a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
+++ b/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
@@ -1,7 +1,7 @@
-From edbee9a68e1c2e11c059668aa1d13001d9f3de06 Mon Sep 17 00:00:00 2001
+From eff00547a91cad0b8ee9bf5b6030dfa48a5ea6ae Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:42:38 +0000
-Subject: [PATCH 10/13] Fix rpath in libtool when sysroot is enabled
+Subject: [PATCH 10/12] Fix rpath in libtool when sysroot is enabled
 
 Enabling sysroot support in libtool exposed a bug where the final
 library had an RPATH encoded into it which still pointed to the
@@ -48,5 +48,5 @@ index 70e856e..11ee684 100644
  	    if test -z "$hardcode_libdirs"; then
  	      hardcode_libdirs="$libdir"
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
index d9d57ee..905b7b3 100644
--- a/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
+++ b/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
@@ -1,7 +1,7 @@
-From 2a5e8813d3c5db3e2b7d9dfa2ab27cccd5111e53 Mon Sep 17 00:00:00 2001
+From b0bcabc83ba02f984d8c87d612c115c9ab7a9fce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:44:14 +0000
-Subject: [PATCH 11/13] Change default emulation for mips64*-*-linux
+Subject: [PATCH 11/12] Change default emulation for mips64*-*-linux
 
 we change the default emulations to be N64 instead of N32
 
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/bfd/config.bfd b/bfd/config.bfd
-index 7bcb92a..03d2c6f 100644
+index c5688cb..5c27b49 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -1062,12 +1062,12 @@ case "${targ}" in
+@@ -1087,12 +1087,12 @@ case "${targ}" in
      targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec mips_ecoff_be_vec mips_ecoff_le_vec"
      ;;
    mips64*el-*-linux*)
@@ -35,10 +35,10 @@ index 7bcb92a..03d2c6f 100644
    mips*el-*-linux*)
      targ_defvec=mips_elf32_trad_le_vec
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index 24e36d1..740b2ea 100644
+index 6b6bbf2..b45b1e5 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -476,11 +476,11 @@ mips*el-*-vxworks*)	targ_emul=elf32elmipvxworks
+@@ -509,11 +509,11 @@ mips*el-*-vxworks*)	targ_emul=elf32elmipvxworks
  mips*-*-vxworks*)	targ_emul=elf32ebmipvxworks
  		        targ_extra_emuls="elf32elmipvxworks" ;;
  mips*-*-windiss)	targ_emul=elf32mipswindiss ;;
@@ -55,5 +55,5 @@ index 24e36d1..740b2ea 100644
  mips*el-*-linux-*)	targ_emul=elf32ltsmip
  			targ_extra_emuls="elf32btsmip elf32ltsmipn32 elf64ltsmip elf32btsmipn32 elf64btsmip"
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch b/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch
index ecc37cc..01492b5 100644
--- a/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch
+++ b/meta/recipes-devtools/binutils/binutils/0012-Add-XLP-instructions-support.patch
@@ -1,7 +1,7 @@
-From 448329ea097447aee73d050045295c5a0ae8519e Mon Sep 17 00:00:00 2001
+From 10e0f42d258164a6a8c0c733518c79e114f5d702 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Mar 2015 01:51:05 +0000
-Subject: [PATCH 12/13] Add XLP instructions support
+Date: Fri, 15 Jan 2016 06:37:20 +0000
+Subject: [PATCH 12/12] Add XLP instructions support
 
 From 26adb06ce515aadfec08ce13109b4b98287f677b Mon Sep 17 00:00:00 2001
 From: Nebu Philips <nphilips@netlogicmicro.com>
@@ -10,34 +10,16 @@ Subject: [PATCH] Add support for Netlogic XLP
 
 Using the mipsisa64r2nlm target, add support for XLP from
 Netlogic. Also, update vendor name to NLM wherever applicable.
----
- bfd/aoutx.h           |    1 +
- bfd/archures.c        |    1 +
- bfd/bfd-in2.h         |    1 +
- bfd/config.bfd        |    5 +++++
- bfd/cpu-mips.c        |    6 ++++--
- bfd/elfxx-mips.c      |    8 ++++++++
- binutils/readelf.c    |    1 +
- gas/config/tc-mips.c  |    4 +++-
- gas/configure         |    3 +++
- gas/configure.tgt     |    2 +-
- include/elf/mips.h    |    1 +
- include/opcode/mips.h |   10 ++++++++--
- ld/configure.tgt      |    2 ++
- opcodes/mips-dis.c    |   12 +++++-------
- opcodes/mips-opc.c    |   33 +++++++++++++++++++++------------
- 15 files changed, 65 insertions(+), 25 deletions(-)
 
-Upstream-Status: Pending
+Use 0x00000080 for INSN_XLP, the value 0x00000040 has already been
+assigned to INSN_OCTEON3
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Use 0x00000080 for INSN_XLP, the value 0x00000040 has already been assigned
-to INSN_OCTEON3
-
 Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 ---
+Upstream-Status: Pending
+
  bfd/aoutx.h           |  1 +
  bfd/archures.c        |  1 +
  bfd/bfd-in2.h         |  1 +
@@ -56,7 +38,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  15 files changed, 65 insertions(+), 25 deletions(-)
 
 diff --git a/bfd/aoutx.h b/bfd/aoutx.h
-index 9385a98..a88df99 100644
+index f78b910..d0d8dd3 100644
 --- a/bfd/aoutx.h
 +++ b/bfd/aoutx.h
 @@ -802,6 +802,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,
@@ -68,34 +50,34 @@ index 9385a98..a88df99 100644
  	  arch_flags = M_MIPS2;
  	  break;
 diff --git a/bfd/archures.c b/bfd/archures.c
-index c9fd6c8..547bd09 100644
+index 51068b9..727741f 100644
 --- a/bfd/archures.c
 +++ b/bfd/archures.c
-@@ -180,6 +180,7 @@ DESCRIPTION
- .#define bfd_mach_mips_octeonp		6601
+@@ -181,6 +181,7 @@ DESCRIPTION
  .#define bfd_mach_mips_octeon2		6502
+ .#define bfd_mach_mips_octeon3          6503
  .#define bfd_mach_mips_xlr              887682   {* decimal 'XLR'  *}
 +.#define bfd_mach_mips_xlp              887680   {* decimal 'XLP'  *}
  .#define bfd_mach_mipsisa32             32
  .#define bfd_mach_mipsisa32r2           33
  .#define bfd_mach_mipsisa32r3           34
 diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
-index c7a2bb5..413b773 100644
+index 779ffbf..bf5a565 100644
 --- a/bfd/bfd-in2.h
 +++ b/bfd/bfd-in2.h
-@@ -1967,6 +1967,7 @@ enum bfd_architecture
- #define bfd_mach_mips_octeonp          6601
+@@ -1993,6 +1993,7 @@ enum bfd_architecture
  #define bfd_mach_mips_octeon2          6502
+ #define bfd_mach_mips_octeon3          6503
  #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'  */
 +#define bfd_mach_mips_xlp              887680   /* decimal 'XLP'  */
  #define bfd_mach_mipsisa32             32
  #define bfd_mach_mipsisa32r2           33
  #define bfd_mach_mipsisa32r3           34
 diff --git a/bfd/config.bfd b/bfd/config.bfd
-index 03d2c6f..27086db 100644
+index 5c27b49..d553039 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -1041,6 +1041,11 @@ case "${targ}" in
+@@ -1066,6 +1066,11 @@ case "${targ}" in
      targ_defvec=mips_elf32_le_vec
      targ_selvecs="mips_elf32_be_vec mips_elf64_be_vec mips_elf64_le_vec"
      ;;
@@ -108,12 +90,12 @@ index 03d2c6f..27086db 100644
      targ_defvec=mips_elf32_be_vec
      targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec"
 diff --git a/bfd/cpu-mips.c b/bfd/cpu-mips.c
-index b617aaa..19a99d1 100644
+index 8a9475d..de7e5a3 100644
 --- a/bfd/cpu-mips.c
 +++ b/bfd/cpu-mips.c
-@@ -103,7 +103,8 @@ enum
-   I_mipsocteonp,
+@@ -104,7 +104,8 @@ enum
    I_mipsocteon2,
+   I_mipsocteon3,
    I_xlr,
 -  I_micromips
 +  I_micromips,
@@ -121,9 +103,9 @@ index b617aaa..19a99d1 100644
  };
  
  #define NN(index) (&arch_info_struct[(index) + 1])
-@@ -153,7 +154,8 @@ static const bfd_arch_info_type arch_info_struct[] =
-   N (64, 64, bfd_mach_mips_octeonp,"mips:octeon+",  FALSE, NN(I_mipsocteonp)),
+@@ -155,7 +156,8 @@ static const bfd_arch_info_type arch_info_struct[] =
    N (64, 64, bfd_mach_mips_octeon2,"mips:octeon2",  FALSE, NN(I_mipsocteon2)),
+   N (64, 64, bfd_mach_mips_octeon3, "mips:octeon3",  FALSE, NN(I_mipsocteon3)),
    N (64, 64, bfd_mach_mips_xlr, "mips:xlr",       FALSE, NN(I_xlr)),
 -  N (64, 64, bfd_mach_mips_micromips,"mips:micromips",FALSE,0)
 +  N (64, 64, bfd_mach_mips_micromips,"mips:micromips",FALSE,NN(I_micromips)),
@@ -132,10 +114,10 @@ index b617aaa..19a99d1 100644
  
  /* The default architecture is mips:3000, but with a machine number of
 diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c
-index 0df7abf..d268e86 100644
+index 1f2f4a3..700afd3 100644
 --- a/bfd/elfxx-mips.c
 +++ b/bfd/elfxx-mips.c
-@@ -6608,6 +6608,9 @@ _bfd_elf_mips_mach (flagword flags)
+@@ -6605,6 +6605,9 @@ _bfd_elf_mips_mach (flagword flags)
      case E_MIPS_MACH_XLR:
        return bfd_mach_mips_xlr;
  
@@ -145,7 +127,7 @@ index 0df7abf..d268e86 100644
      default:
        switch (flags & EF_MIPS_ARCH)
  	{
-@@ -11878,6 +11881,10 @@ mips_set_isa_flags (bfd *abfd)
+@@ -11901,6 +11904,10 @@ mips_set_isa_flags (bfd *abfd)
        val = E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;
        break;
  
@@ -156,7 +138,7 @@ index 0df7abf..d268e86 100644
      case bfd_mach_mipsisa32:
        val = E_MIPS_ARCH_32;
        break;
-@@ -14765,6 +14772,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
+@@ -13931,6 +13938,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
    { bfd_mach_mips_octeonp, bfd_mach_mips_octeon },
    { bfd_mach_mips_octeon, bfd_mach_mipsisa64r2 },
    { bfd_mach_mips_loongson_3a, bfd_mach_mipsisa64r2 },
@@ -165,10 +147,10 @@ index 0df7abf..d268e86 100644
    /* MIPS64 extensions.  */
    { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },
 diff --git a/binutils/readelf.c b/binutils/readelf.c
-index 0c00b2f..6e9d5e4 100644
+index d5dd46f..66810cc 100644
 --- a/binutils/readelf.c
 +++ b/binutils/readelf.c
-@@ -2898,6 +2898,7 @@ get_machine_flags (unsigned e_flags, unsigned e_machine)
+@@ -3140,6 +3140,7 @@ get_machine_flags (unsigned e_flags, unsigned e_machine)
  	    case E_MIPS_MACH_OCTEON2: strcat (buf, ", octeon2"); break;
  	    case E_MIPS_MACH_OCTEON3: strcat (buf, ", octeon3"); break;
  	    case E_MIPS_MACH_XLR:  strcat (buf, ", xlr"); break;
@@ -177,10 +159,10 @@ index 0c00b2f..6e9d5e4 100644
  	    /* We simply ignore the field in this case to avoid confusion:
  	       MIPS ELF does not specify EF_MIPS_MACH, it is a GNU
 diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c
-index c3e3e2a..8d64344 100644
+index a2d45a4..75902c0 100644
 --- a/gas/config/tc-mips.c
 +++ b/gas/config/tc-mips.c
-@@ -551,6 +551,7 @@ static int mips_32bitmode = 0;
+@@ -552,6 +552,7 @@ static int mips_32bitmode = 0;
     || mips_opts.arch == CPU_RM7000                    \
     || mips_opts.arch == CPU_VR5500                    \
     || mips_opts.micromips                             \
@@ -188,7 +170,7 @@ index c3e3e2a..8d64344 100644
     )
  
  /* Whether the processor uses hardware interlocks to protect reads
-@@ -580,6 +581,7 @@ static int mips_32bitmode = 0;
+@@ -581,6 +582,7 @@ static int mips_32bitmode = 0;
      && mips_opts.isa != ISA_MIPS3)                    \
     || mips_opts.arch == CPU_R4300                     \
     || mips_opts.micromips                             \
@@ -196,20 +178,20 @@ index c3e3e2a..8d64344 100644
     )
  
  /* Whether the processor uses hardware interlocks to protect reads
-@@ -18682,7 +18684,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
+@@ -18702,7 +18704,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
    /* Broadcom XLP.
       XLP is mostly like XLR, with the prominent exception that it is
       MIPS64R2 rather than MIPS64.  */
 -  { "xlp",	      0, 0,			ISA_MIPS64R2, CPU_XLR },
 +  { "xlp",	      0, 0,			ISA_MIPS64R2, CPU_XLP },
  
-   /* End marker */
-   { NULL, 0, 0, 0, 0 }
+   /* i6400.  */
+   { "i6400",	      0, ASE_MSA,		ISA_MIPS64R6, CPU_MIPS64R6},
 diff --git a/gas/configure b/gas/configure
-index 074886f..8091f2f 100755
+index 1c2a665..c8010a8 100755
 --- a/gas/configure
 +++ b/gas/configure
-@@ -12808,6 +12808,9 @@ _ACEOF
+@@ -12826,6 +12826,9 @@ _ACEOF
  	  mipsisa64r6 | mipsisa64r6el)
  	    mips_cpu=mips64r6
  	    ;;
@@ -220,10 +202,10 @@ index 074886f..8091f2f 100755
  	    mips_cpu=r3900
  	    ;;
 diff --git a/gas/configure.tgt b/gas/configure.tgt
-index 1d92f55..06e8b4f 100644
+index 086e0d2..2b71270 100644
 --- a/gas/configure.tgt
 +++ b/gas/configure.tgt
-@@ -332,7 +332,7 @@ case ${generic_target} in
+@@ -339,7 +339,7 @@ case ${generic_target} in
    mips-*-sysv4*MP* | mips-*-gnu*)	fmt=elf em=tmips ;;
    mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
  					fmt=elf em=tmips ;;
@@ -233,7 +215,7 @@ index 1d92f55..06e8b4f 100644
    mips-*-openbsd*)			fmt=elf em=tmips ;;
  
 diff --git a/include/elf/mips.h b/include/elf/mips.h
-index 2ed6acd..e541f50 100644
+index 57de3bc..9ba141d 100644
 --- a/include/elf/mips.h
 +++ b/include/elf/mips.h
 @@ -285,6 +285,7 @@ END_RELOC_NUMBERS (R_MIPS_maxext)
@@ -245,10 +227,10 @@ index 2ed6acd..e541f50 100644
  #define E_MIPS_MACH_OCTEON3	0x008e0000
  #define E_MIPS_MACH_5400	0x00910000
 diff --git a/include/opcode/mips.h b/include/opcode/mips.h
-index ef26167..ef53ec6 100644
+index 9318fcc..9be5645 100644
 --- a/include/opcode/mips.h
 +++ b/include/opcode/mips.h
-@@ -1227,8 +1227,10 @@ static const unsigned int mips_isa_table[] = {
+@@ -1228,8 +1228,10 @@ static const unsigned int mips_isa_table[] = {
  #define INSN_LOONGSON_2F          0x80000000
  /* Loongson 3A.  */
  #define INSN_LOONGSON_3A          0x00000400
@@ -261,15 +243,15 @@ index ef26167..ef53ec6 100644
  
  /* DSP ASE */
  #define ASE_DSP			0x00000001
-@@ -1324,6 +1326,7 @@ static const unsigned int mips_isa_table[] = {
- #define CPU_OCTEONP	6601
+@@ -1326,6 +1328,7 @@ static const unsigned int mips_isa_table[] = {
  #define CPU_OCTEON2	6502
+ #define CPU_OCTEON3	6503
  #define CPU_XLR     	887682   	/* decimal 'XLR'   */
 +#define CPU_XLP         887680      /* decimal 'XLP'   */
  
  /* Return true if the given CPU is included in INSN_* mask MASK.  */
  
-@@ -1398,6 +1401,9 @@ cpu_is_member (int cpu, unsigned int mask)
+@@ -1403,6 +1406,9 @@ cpu_is_member (int cpu, unsigned int mask)
        return ((mask & INSN_ISA_MASK) == INSN_ISA32R6)
  	     || ((mask & INSN_ISA_MASK) == INSN_ISA64R6);
  
@@ -280,10 +262,10 @@ index ef26167..ef53ec6 100644
        return FALSE;
      }
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index 740b2ea..4df13a7 100644
+index b45b1e5..fb2f36a 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -462,6 +462,8 @@ mips*el-sde-elf*)	targ_emul=elf32ltsmip
+@@ -495,6 +495,8 @@ mips*el-sde-elf*)	targ_emul=elf32ltsmip
  mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
  			targ_emul=elf32btsmip
  			targ_extra_emuls="elf32ltsmip elf32btsmipn32 elf64btsmip elf32ltsmipn32 elf64ltsmip" ;;
@@ -293,10 +275,10 @@ index 740b2ea..4df13a7 100644
  			targ_extra_emuls="elf32lr5900"
  			targ_extra_libpath=$targ_extra_emuls ;;
 diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c
-index 1eb1d45..d6881af 100644
+index 8200920..40d9fe2 100644
 --- a/opcodes/mips-dis.c
 +++ b/opcodes/mips-dis.c
-@@ -655,13 +655,11 @@ const struct mips_arch_choice mips_arch_choices[] =
+@@ -648,13 +648,11 @@ const struct mips_arch_choice mips_arch_choices[] =
      mips_cp0sel_names_xlr, ARRAY_SIZE (mips_cp0sel_names_xlr),
      mips_cp1_names_mips3264, mips_hwr_names_numeric },
  
@@ -311,25 +293,25 @@ index 1eb1d45..d6881af 100644
 +    ISA_MIPS64R2 | INSN_XLP, 0,
 +    mips_cp0_names_mips3264r2,
 +    mips_cp0sel_names_mips3264r2, ARRAY_SIZE (mips_cp0sel_names_mips3264r2),
-+    mips_hwr_names_mips3264r2 },
++    mips_cp1_names_mips3264, mips_hwr_names_mips3264r2 },
  
    /* This entry, mips16, is here only for ISA/processor selection; do
       not print its name.  */
 diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c
-index 2c3bbad..9785a7e 100644
+index 402f887..3764836 100644
 --- a/opcodes/mips-opc.c
 +++ b/opcodes/mips-opc.c
-@@ -319,7 +319,8 @@ decode_mips_operand (const char *p)
- #define IOCT	(INSN_OCTEON | INSN_OCTEONP | INSN_OCTEON2)
- #define IOCTP	(INSN_OCTEONP | INSN_OCTEON2)
- #define IOCT2	INSN_OCTEON2
+@@ -320,7 +320,8 @@ decode_mips_operand (const char *p)
+ #define IOCTP	(INSN_OCTEONP | INSN_OCTEON2 | INSN_OCTEON3)
+ #define IOCT2	(INSN_OCTEON2 | INSN_OCTEON3)
+ #define IOCT3	INSN_OCTEON3
 -#define XLR     INSN_XLR
 +#define XLR	INSN_XLR
 +#define XLP	INSN_XLP
  #define IVIRT	ASE_VIRT
  #define IVIRT64	ASE_VIRT64
  
-@@ -956,6 +957,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -957,6 +958,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"clo",			"U,s",		0x70000021, 0xfc0007ff, WR_1|RD_2,		0,		I32|N55,	0,	I37 },
  {"clz",			"d,s",		0x00000050, 0xfc1f07ff, WR_1|RD_2,		0,		I37,		0,	0 },
  {"clz",			"U,s",		0x70000020, 0xfc0007ff, WR_1|RD_2,		0,		I32|N55,	0,	I37 },
@@ -337,7 +319,7 @@ index 2c3bbad..9785a7e 100644
  /* ctc0 is at the bottom of the table.  */
  {"ctc1",		"t,G",		0x44c00000, 0xffe007ff,	RD_1|WR_CC|CM,		0,		I1,		0,	0 },
  {"ctc1",		"t,S",		0x44c00000, 0xffe007ff,	RD_1|WR_CC|CM,		0,		I1,		0,	0 },
-@@ -988,12 +990,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -989,12 +991,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"daddiu",		"t,r,j",	0x64000000, 0xfc000000, WR_1|RD_2,		0,		I3,		0,	0 },
  {"daddu",		"d,v,t",	0x0000002d, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I3,		0,	0 },
  {"daddu",		"t,r,I",	0,    (int) M_DADDU_I,	INSN_MACRO,		0,		I3,		0,	0 },
@@ -352,7 +334,7 @@ index 2c3bbad..9785a7e 100644
  /* dctr and dctw are used on the r5000.  */
  {"dctr",		"o(b)",	 	0xbc050000, 0xfc1f0000, RD_2,			0,		I3,		0,	0 },
  {"dctw",		"o(b)",		0xbc090000, 0xfc1f0000, RD_2,			0,		I3,		0,	0 },
-@@ -1065,6 +1068,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1066,6 +1069,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"dmfc0",		"t,G,H",	0x40200000, 0xffe007f8,	WR_1|RD_C0|LC,		0,		I64,		0,	0 },
  {"dmfgc0",		"t,G",		0x40600100, 0xffe007ff, WR_1|RD_C0|LC,		0,		0,		IVIRT64, 0 },
  {"dmfgc0",		"t,G,H",	0x40600100, 0xffe007f8, WR_1|RD_C0|LC,		0,		0,		IVIRT64, 0 },
@@ -360,7 +342,7 @@ index 2c3bbad..9785a7e 100644
  {"dmt",			"",		0x41600bc1, 0xffffffff, TRAP,			0,		0,		MT32,	0 },
  {"dmt",			"t",		0x41600bc1, 0xffe0ffff, WR_1|TRAP,		0,		0,		MT32,	0 },
  {"dmtc0",		"t,G",		0x40a00000, 0xffe007ff,	RD_1|WR_C0|WR_CC|CM,	0,		I3,		0,	EE },
-@@ -1080,6 +1084,8 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1081,6 +1085,8 @@ const struct mips_opcode mips_builtin_opcodes[] =
  /* dmfc3 is at the bottom of the table.  */
  /* dmtc3 is at the bottom of the table.  */
  {"dmuh",		"d,s,t",	0x000000dc, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I69,		0,	0 },
@@ -369,7 +351,7 @@ index 2c3bbad..9785a7e 100644
  {"dmul",		"d,s,t",	0x0000009c, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I69,		0,	0 },
  {"dmul",		"d,v,t",	0x70000003, 0xfc0007ff, WR_1|RD_2|RD_3|WR_HILO,	0,		IOCT,		0,	0 },
  {"dmul",		"d,v,t",	0,    (int) M_DMUL,	INSN_MACRO,		0,		I3,		0,	M32|I69 },
-@@ -1229,9 +1235,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1234,9 +1240,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"ld",			"s,-b(+R)",	0xec180000, 0xfc1c0000, WR_1,			RD_pc,		I69,		0,	0 },
  {"ld",			"t,A(b)",	0,    (int) M_LD_AB,	INSN_MACRO,		0,		I1,		0,	0 },
  {"ld",			"t,o(b)",	0xdc000000, 0xfc000000, WR_1|RD_3|LM,		0,		I3,		0,	0 },
@@ -382,7 +364,7 @@ index 2c3bbad..9785a7e 100644
  {"ldc1",		"T,o(b)",	0xd4000000, 0xfc000000, WR_1|RD_3|CLD|FP_D,	0,		I2,		0,	SF },
  {"ldc1",		"E,o(b)",	0xd4000000, 0xfc000000, WR_1|RD_3|CLD|FP_D,	0,		I2,		0,	SF },
  {"ldc1",		"T,A(b)",	0,    (int) M_LDC1_AB,	INSN_MACRO,		INSN2_M_FP_D,	I2,		0,	SF },
-@@ -1396,7 +1402,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1401,7 +1407,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"mflo",		"d,9",		0x00000012, 0xff9f07ff, WR_1|RD_LO,		0,		0,		D32,	0 },
  {"mflo1",		"d",		0x70000012, 0xffff07ff,	WR_1|RD_LO,		0,		EE,		0,	0 },
  {"mflhxu",		"d",		0x00000052, 0xffff07ff,	WR_1|MOD_HILO,		0,		0,		SMT,	0 },
@@ -391,7 +373,7 @@ index 2c3bbad..9785a7e 100644
  {"mfsa",		"d",		0x00000028, 0xffff07ff,	WR_1,			0,		EE,		0,	0 },
  {"min.ob",		"X,Y,Q",	0x78000006, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		SB1,		MX,	0 },
  {"min.ob",		"D,S,Q",	0x48000006, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		N54,		0,	0 },
-@@ -1441,10 +1447,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1446,10 +1452,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
  /* move is at the top of the table.  */
  {"msgn.qh",		"X,Y,Q",	0x78200000, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		0,		MX,	0 },
  {"msgsnd",		"t",		0,    (int) M_MSGSND,	INSN_MACRO,		0,		XLR,		0,	0 },
@@ -407,16 +389,16 @@ index 2c3bbad..9785a7e 100644
  {"msub.d",		"D,R,S,T",	0x4c000029, 0xfc00003f, WR_1|RD_2|RD_3|RD_4|FP_D, 0,		I4_33,		0,	I37 },
  {"msub.d",		"D,S,T",	0x46200019, 0xffe0003f,	WR_1|RD_2|RD_3|FP_D,	0,		IL2E,		0,	0 },
  {"msub.d",		"D,S,T",	0x72200019, 0xffe0003f,	WR_1|RD_2|RD_3|FP_D,	0,		IL2F,		0,	0 },
-@@ -1494,7 +1503,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1499,7 +1508,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"mtlo",		"s,7",		0x00000013, 0xfc1fe7ff, RD_1|WR_LO,		0,		0,		D32,	0 },
  {"mtlo1",		"s",		0x70000013, 0xfc1fffff,	RD_1|WR_LO,		0,		EE,		0,	0 },
  {"mtlhx",		"s",		0x00000053, 0xfc1fffff,	RD_1|MOD_HILO,		0,		0,		SMT,	0 },
 -{"mtcr",		"t,s",		0x70000019, 0xfc00ffff, RD_1|RD_2,		0,		XLR,		0,	0 },
 +{"mtcr",		"t,s",		0x70000019, 0xfc00ffff, RD_1,			0,		XLR|XLP,	0,	0 },
  {"mtm0",		"s",		0x70000008, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
+ {"mtm0",    		"s,t",		0x70000008, 0xfc00ffff, RD_1|RD_2,		0,		IOCT3,		0,	0 },
  {"mtm1",		"s",		0x7000000c, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
- {"mtm2",		"s",		0x7000000d, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
-@@ -1924,9 +1933,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1936,9 +1945,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"suxc1",		"S,t(b)",	0x4c00000d, 0xfc0007ff, RD_1|RD_2|RD_3|SM|FP_D,	0,		I5_33|N55,	0,	I37},
  {"sw",			"t,o(b)",	0xac000000, 0xfc000000,	RD_1|RD_3|SM,		0,		I1,		0,	0 },
  {"sw",			"t,A(b)",	0,    (int) M_SW_AB,	INSN_MACRO,		0,		I1,		0,	0 },
@@ -430,5 +412,5 @@ index 2c3bbad..9785a7e 100644
  {"swc0",		"E,A(b)",	0,    (int) M_SWC0_AB,	INSN_MACRO,		0,		I1,		0,	IOCT|IOCTP|IOCT2|I37 },
  {"swc1",		"T,o(b)",	0xe4000000, 0xfc000000,	RD_1|RD_3|SM|FP_S,	0,		I1,		0,	0 },
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0013-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch b/meta/recipes-devtools/binutils/binutils/0013-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch
deleted file mode 100644
index aee01c0..0000000
--- a/meta/recipes-devtools/binutils/binutils/0013-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8e8f77ec2b6262e7d10af54700c340173d957267 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 27 Feb 2015 09:05:49 +0000
-Subject: [PATCH 13/13] Fix an internal error in do_print_to_mapfile seen with
- gold on arm
-
-This is due to missing implementation of do_print_to_mapfile for
-atrributea section (ARM.attributes), it started to show up after fix
-for PR gold/16980 was installed
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Submitted
----
- gold/attributes.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/gold/attributes.h b/gold/attributes.h
-index 2aa7a78..3d126e6 100644
---- a/gold/attributes.h
-+++ b/gold/attributes.h
-@@ -387,6 +387,10 @@ class Output_attributes_section_data : public Output_section_data
-   { }
- 
-  protected:
-+  // Write to a map file.
-+  void
-+  do_print_to_mapfile(Mapfile* mapfile) const
-+  { mapfile->print_output_data(this, _("** attributes")); }
-   // Write the data to the output file.
-   void
-   do_write(Output_file*);
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/binutils/binutils/0014-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch b/meta/recipes-devtools/binutils/binutils/0014-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch
deleted file mode 100644
index e024302..0000000
--- a/meta/recipes-devtools/binutils/binutils/0014-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From ebe26d855452d07e0152bd78d4966475d2de1de8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 5 Mar 2015 07:30:31 +0000
-Subject: [PATCH] gold/arm: Skip pic check for R_ARM_REL32
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gold/arm.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gold/arm.cc b/gold/arm.cc
-index 6c472bb..fb80435 100644
---- a/gold/arm.cc
-+++ b/gold/arm.cc
-@@ -7829,6 +7829,7 @@ Target_arm<big_endian>::Scan::check_non_pic(Relobj* object,
-     case elfcpp::R_ARM_TLS_DTPMOD32:
-     case elfcpp::R_ARM_TLS_DTPOFF32:
-     case elfcpp::R_ARM_TLS_TPOFF32:
-+    case elfcpp::R_ARM_REL32:
-       return;
- 
-     default:
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/binutils/binutils/0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-are.patch b/meta/recipes-devtools/binutils/binutils/0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-are.patch
deleted file mode 100644
index ee49c38..0000000
--- a/meta/recipes-devtools/binutils/binutils/0015-Fix-dynamic-list-so-that-symbols-not-in-the-list-are.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From e9c1bdad269c0c3352eebcc9481ed65144001b0b Mon Sep 17 00:00:00 2001
-From: Cary Coutant <ccoutant@google.com>
-Date: Mon, 16 Feb 2015 22:15:12 -0800
-Subject: [PATCH] Fix --dynamic-list so that symbols not in the list are still
- exported.
-
-In PR 13577, the complaint was that -Bsymbolic was overriding the binding
-behavior for symbols listed in the --dynamic-list by setting the DT_SYMBOLIC
-tag in the dynamic table. In reading the Gnu ld manual, I decided that
---dynamic-list should be mutually exclusive of -Bsymbolic, and modified
-gold so that --dynamic-list would treat symbols listed as preemptible,
-and all other symbols as internally bound. I was wrong.
-
-PR 16992 shows that with --dynamic-list (and not -Bsymbolic), a symbol
-not listed in the dynamic list is being internally bound within the
-shared library, but because it's still in the dynamic symbol table, we
-expose it to a COPY relocation, and things go really bad from there.
-
-(I can reproduce the same failure, simply by turning on -Bsymbolic-functions
-with the Gnu linker. Even though the symbol is bound internally, it's
-still exported to the dynamic symbol table, and is exposed to a COPY
-relocation.)
-
-I've backed out part of the fix for PR 13577, and -Bsymbolic (or
--Bsymbolic-functions) can now be used with --dynamic-list, but if the
-two are used together, we do not set DT_SYMBOLIC or DF_SYMBOLIC
-(this matches Gnu ld behavior). We now treat symbols listed in the
-dynamic list as premptible, but we do not automatically treat symbols
-not listed there as non-premptible.
-
-gold/
-	PR gold/13577
-	PR gold/16992
-	* layout.cc (Layout::finish_dynamic_section): Don't set DT_SYMBOLIC or
-	DF_SYMBOLIC if --dynamic-list option is used.
-	* options.cc (General_options::finalize): --dynamic-list is not
-	mutually exclusive with -Bsymbolic.
-	* symtab.h (Symbol::is_preemptible): Don't exclude dynamic symbols not
-	listed in --dynamic-list.
-	* testsuite/Makefile.am (dynamic_list_lib2.so): Add
-	-Bsymbolic-functions.
-	* testsuite/Makefile.in: Regenerate.
----
-Upstream-Status: Backport
-
- gold/ChangeLog             | 14 ++++++++++++++
- gold/layout.cc             |  3 ++-
- gold/options.cc            |  7 -------
- gold/symtab.h              |  6 ++----
- gold/testsuite/Makefile.am |  2 +-
- gold/testsuite/Makefile.in |  2 +-
- 6 files changed, 20 insertions(+), 14 deletions(-)
-
-diff --git a/gold/layout.cc b/gold/layout.cc
-index bcdaac8..7836640 100644
---- a/gold/layout.cc
-+++ b/gold/layout.cc
-@@ -4873,7 +4873,8 @@ Layout::finish_dynamic_section(const Input_objects* input_objects,
-     flags |= elfcpp::DF_STATIC_TLS;
-   if (parameters->options().origin())
-     flags |= elfcpp::DF_ORIGIN;
--  if (parameters->options().Bsymbolic())
-+  if (parameters->options().Bsymbolic()
-+      && !parameters->options().have_dynamic_list())
-     {
-       flags |= elfcpp::DF_SYMBOLIC;
-       // Add DT_SYMBOLIC for compatibility with older loaders.
-diff --git a/gold/options.cc b/gold/options.cc
-index 7eb8f27..7f1f69e 100644
---- a/gold/options.cc
-+++ b/gold/options.cc
-@@ -1200,13 +1200,6 @@ General_options::finalize()
-   // in the path, as appropriate.
-   this->add_sysroot();
- 
--  // --dynamic-list overrides -Bsymbolic and -Bsymbolic-functions.
--  if (this->have_dynamic_list())
--    {
--      this->set_Bsymbolic(false);
--      this->set_Bsymbolic_functions(false);
--    }
--
-   // Now that we've normalized the options, check for contradictory ones.
-   if (this->shared() && this->is_static())
-     gold_fatal(_("-shared and -static are incompatible"));
-diff --git a/gold/symtab.h b/gold/symtab.h
-index aa0cb68..9413360 100644
---- a/gold/symtab.h
-+++ b/gold/symtab.h
-@@ -604,10 +604,8 @@ class Symbol
-     if (parameters->options().in_dynamic_list(this->name()))
-       return true;
- 
--    // If the user used -Bsymbolic or provided a --dynamic-list script,
--    // then nothing (else) is preemptible.
--    if (parameters->options().Bsymbolic()
--        || parameters->options().have_dynamic_list())
-+    // If the user used -Bsymbolic, then nothing (else) is preemptible.
-+    if (parameters->options().Bsymbolic())
-       return false;
- 
-     // If the user used -Bsymbolic-functions, then functions are not
-diff --git a/gold/testsuite/Makefile.am b/gold/testsuite/Makefile.am
-index f767c21..7b73f9d 100644
---- a/gold/testsuite/Makefile.am
-+++ b/gold/testsuite/Makefile.am
-@@ -1518,7 +1518,7 @@ dynamic_list_lib1.o: dynamic_list_lib1.cc
- 	$(CXXCOMPILE) -c -fpic -o $@ $<
- 
- dynamic_list_lib2.so: gcctestdir/ld dynamic_list_lib2.o $(srcdir)/dynamic_list_2.t
--	$(CXXLINK) -Bgcctestdir/ -shared -Wl,--dynamic-list,$(srcdir)/dynamic_list_2.t dynamic_list_lib2.o
-+	$(CXXLINK) -Bgcctestdir/ -shared -Wl,-Bsymbolic-functions -Wl,--dynamic-list,$(srcdir)/dynamic_list_2.t dynamic_list_lib2.o
- dynamic_list_lib2.o: dynamic_list_lib2.cc
- 	$(CXXCOMPILE) -c -fpic -o $@ $<
- 
-diff --git a/gold/testsuite/Makefile.in b/gold/testsuite/Makefile.in
-index 217e472..b4ae3fd 100644
---- a/gold/testsuite/Makefile.in
-+++ b/gold/testsuite/Makefile.in
-@@ -5319,7 +5319,7 @@ uninstall-am:
- @GCC_TRUE@@NATIVE_LINKER_TRUE@	$(CXXCOMPILE) -c -fpic -o $@ $<
- 
- @GCC_TRUE@@NATIVE_LINKER_TRUE@dynamic_list_lib2.so: gcctestdir/ld dynamic_list_lib2.o $(srcdir)/dynamic_list_2.t
--@GCC_TRUE@@NATIVE_LINKER_TRUE@	$(CXXLINK) -Bgcctestdir/ -shared -Wl,--dynamic-list,$(srcdir)/dynamic_list_2.t dynamic_list_lib2.o
-+@GCC_TRUE@@NATIVE_LINKER_TRUE@	$(CXXLINK) -Bgcctestdir/ -shared -Wl,-Bsymbolic-functions -Wl,--dynamic-list,$(srcdir)/dynamic_list_2.t dynamic_list_lib2.o
- @GCC_TRUE@@NATIVE_LINKER_TRUE@dynamic_list_lib2.o: dynamic_list_lib2.cc
- @GCC_TRUE@@NATIVE_LINKER_TRUE@	$(CXXCOMPILE) -c -fpic -o $@ $<
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0016-This-patch-adds-IFUNC-support-for-arm-gold-backend.patch b/meta/recipes-devtools/binutils/binutils/0016-This-patch-adds-IFUNC-support-for-arm-gold-backend.patch
deleted file mode 100644
index dcac308..0000000
--- a/meta/recipes-devtools/binutils/binutils/0016-This-patch-adds-IFUNC-support-for-arm-gold-backend.patch
+++ /dev/null
@@ -1,1004 +0,0 @@
-From b780c9e06cabe6d8e301aaf46f33f116f3224021 Mon Sep 17 00:00:00 2001
-From: Han Shen <shenhan@google.com>
-Date: Thu, 29 Jan 2015 10:00:46 -0800
-Subject: [PATCH] This patch adds IFUNC support for arm gold backend.
-
-This is a feature required in chromeos arm development work.
-
-Tested:
-1) Built passed all-gold on x86_64 machine
-2) Tested with basic gold aarch64 ifunc unittests -
-   a) global ifunc, statically/non-statically linked
-   b) local ifunc, statically/non-statically linked
-   c) global/local, other shared library routine mixed,
-   statically/non-statically linked
-   d) arm/thumb mode ifunc
-   e) linking chrome browser passed
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- elfcpp/arm.h    |   5 +-
- gold/aarch64.cc |   2 +-
- gold/arm.cc     | 593 +++++++++++++++++++++++++++++++++++++++++++++++++++-----
- gold/output.h   |  11 ++
- 4 files changed, 561 insertions(+), 50 deletions(-)
-
-diff --git a/elfcpp/arm.h b/elfcpp/arm.h
-index 8c6b6bf..1c13dc9 100644
---- a/elfcpp/arm.h
-+++ b/elfcpp/arm.h
-@@ -192,11 +192,12 @@ enum
-   R_ARM_PRIVATE_14 = 126,
-   R_ARM_PRIVATE_15 = 127,
-   R_ARM_ME_TOO = 128,		// Obsolete
--  R_ARM_THM_TLS_DESCSEQ16 = 129,// Static	Thumb16	
-+  R_ARM_THM_TLS_DESCSEQ16 = 129,// Static	Thumb16
-   R_ARM_THM_TLS_DESCSEQ32 = 130,// Static	Thumb32
-   // 131 - 139			Unallocated
-   // 140 - 159			Dynamic		Reserved for future allocation
--  // 160 - 255			Unallocated
-+  R_ARM_IRELATIVE = 160,	// Dynamic
-+  // 161 - 255			Unallocated
- };
- 
- // e_flags values used for ARM.  We only support flags defined in AAELF.
-diff --git a/gold/aarch64.cc b/gold/aarch64.cc
-index afb9024..7fbbdbd 100644
---- a/gold/aarch64.cc
-+++ b/gold/aarch64.cc
-@@ -1226,7 +1226,7 @@ class Output_data_plt_aarch64 : public Output_section_data
-   // The number of PLT entries.
-   unsigned int count_;
- 
--  // Number of PLT entries with R_X86_64_IRELATIVE relocs.  These
-+  // Number of PLT entries with R_AARCH64_IRELATIVE relocs.  These
-   // follow the regular PLT entries.
-   unsigned int irelative_count_;
- 
-diff --git a/gold/arm.cc b/gold/arm.cc
-index 6c472bb..8719cc9 100644
---- a/gold/arm.cc
-+++ b/gold/arm.cc
-@@ -2119,8 +2119,8 @@ class Target_arm : public Sized_target<32, big_endian>
- 
-   Target_arm(const Target::Target_info* info = &arm_info)
-     : Sized_target<32, big_endian>(info),
--      got_(NULL), plt_(NULL), got_plt_(NULL), rel_dyn_(NULL),
--      copy_relocs_(elfcpp::R_ARM_COPY),
-+      got_(NULL), plt_(NULL), got_plt_(NULL), got_irelative_(NULL),
-+      rel_dyn_(NULL), rel_irelative_(NULL), copy_relocs_(elfcpp::R_ARM_COPY),
-       got_mod_index_offset_(-1U), tls_base_symbol_defined_(false),
-       stub_tables_(), stub_factory_(Stub_factory::get_instance()),
-       should_force_pic_veneer_(false),
-@@ -2258,6 +2258,18 @@ class Target_arm : public Sized_target<32, big_endian>
-   uint64_t
-   do_dynsym_value(const Symbol*) const;
- 
-+  // Return the plt address for globals. Since we have irelative plt entries,
-+  // address calculation is not as straightforward as plt_address + plt_offset.
-+  uint64_t
-+  do_plt_address_for_global(const Symbol* gsym) const
-+  { return this->plt_section()->address_for_global(gsym); }
-+
-+  // Return the plt address for locals. Since we have irelative plt entries,
-+  // address calculation is not as straightforward as plt_address + plt_offset.
-+  uint64_t
-+  do_plt_address_for_local(const Relobj* relobj, unsigned int symndx) const
-+  { return this->plt_section()->address_for_local(relobj, symndx); }
-+
-   // Relocate a section.
-   void
-   relocate_section(const Relocate_info<32, big_endian>*,
-@@ -2357,6 +2369,10 @@ class Target_arm : public Sized_target<32, big_endian>
-   unsigned int
-   plt_entry_size() const;
- 
-+  // Get the section to use for IRELATIVE relocations, create it if necessary.
-+  Reloc_section*
-+  rel_irelative_section(Layout*);
-+
-   // Map platform-specific reloc types
-   static unsigned int
-   get_real_reloc_type(unsigned int r_type);
-@@ -2448,8 +2464,11 @@ class Target_arm : public Sized_target<32, big_endian>
-  protected:
-   // Make the PLT-generator object.
-   Output_data_plt_arm<big_endian>*
--  make_data_plt(Layout* layout, Output_data_space* got_plt)
--  { return this->do_make_data_plt(layout, got_plt); }
-+  make_data_plt(Layout* layout,
-+		Arm_output_data_got<big_endian>* got,
-+		Output_data_space* got_plt,
-+		Output_data_space* got_irelative)
-+  { return this->do_make_data_plt(layout, got, got_plt, got_irelative); }
- 
-   // Make an ELF object.
-   Object*
-@@ -2530,9 +2549,14 @@ class Target_arm : public Sized_target<32, big_endian>
-   do_define_standard_symbols(Symbol_table*, Layout*);
- 
-   virtual Output_data_plt_arm<big_endian>*
--  do_make_data_plt(Layout* layout, Output_data_space* got_plt)
-+  do_make_data_plt(Layout* layout,
-+		   Arm_output_data_got<big_endian>* got,
-+		   Output_data_space* got_plt,
-+		   Output_data_space* got_irelative)
-   {
--    return new Output_data_plt_arm_standard<big_endian>(layout, got_plt);
-+    gold_assert(got_plt != NULL && got_irelative != NULL);
-+    return new Output_data_plt_arm_standard<big_endian>(
-+	layout, got, got_plt, got_irelative);
-   }
- 
-  private:
-@@ -2602,6 +2626,9 @@ class Target_arm : public Sized_target<32, big_endian>
-       if (sym->is_undefined() && !parameters->options().shared())
- 	return false;
- 
-+      if (sym->type() == elfcpp::STT_GNU_IFUNC)
-+	return true;
-+
-       return (!parameters->doing_static_link()
- 	      && (sym->type() == elfcpp::STT_FUNC
- 		  || sym->type() == elfcpp::STT_ARM_TFUNC)
-@@ -2613,6 +2640,11 @@ class Target_arm : public Sized_target<32, big_endian>
-     inline bool
-     possible_function_pointer_reloc(unsigned int r_type);
- 
-+    // Whether a plt entry is needed for ifunc.
-+    bool
-+    reloc_needs_plt_for_ifunc(Sized_relobj_file<32, big_endian>*,
-+			      unsigned int r_type);
-+
-     // Whether we have issued an error about a non-PIC compilation.
-     bool issued_non_pic_error_;
-   };
-@@ -2718,10 +2750,20 @@ class Target_arm : public Sized_target<32, big_endian>
-     return this->got_plt_;
-   }
- 
-+  // Create the PLT section.
-+  void
-+  make_plt_section(Symbol_table* symtab, Layout* layout);
-+
-   // Create a PLT entry for a global symbol.
-   void
-   make_plt_entry(Symbol_table*, Layout*, Symbol*);
- 
-+  // Create a PLT entry for a local STT_GNU_IFUNC symbol.
-+  void
-+  make_local_ifunc_plt_entry(Symbol_table*, Layout*,
-+			     Sized_relobj_file<32, big_endian>* relobj,
-+			     unsigned int local_sym_index);
-+
-   // Define the _TLS_MODULE_BASE_ symbol in the TLS segment.
-   void
-   define_tls_base_symbol(Symbol_table*, Layout*);
-@@ -2903,8 +2945,12 @@ class Target_arm : public Sized_target<32, big_endian>
-   Output_data_plt_arm<big_endian>* plt_;
-   // The GOT PLT section.
-   Output_data_space* got_plt_;
-+  // The GOT section for IRELATIVE relocations.
-+  Output_data_space* got_irelative_;
-   // The dynamic reloc section.
-   Reloc_section* rel_dyn_;
-+  // The section to use for IRELATIVE relocs.
-+  Reloc_section* rel_irelative_;
-   // Relocs saved to avoid a COPY reloc.
-   Copy_relocs<elfcpp::SHT_REL, 32, big_endian> copy_relocs_;
-   // Offset of the GOT entry for the TLS module index.
-@@ -4244,6 +4290,15 @@ Target_arm<big_endian>::got_section(Symbol_table* symtab, Layout* layout)
- 				    elfcpp::STB_LOCAL,
- 				    elfcpp::STV_HIDDEN, 0,
- 				    false, false);
-+
-+      // If there are any IRELATIVE relocations, they get GOT entries
-+      // in .got.plt after the jump slot entries.
-+      this->got_irelative_ = new Output_data_space(4, "** GOT IRELATIVE PLT");
-+      layout->add_output_section_data(".got", elfcpp::SHT_PROGBITS,
-+				      (elfcpp::SHF_ALLOC | elfcpp::SHF_WRITE),
-+				      this->got_irelative_,
-+				      got_order, is_got_relro);
-+
-     }
-   return this->got_;
- }
-@@ -4257,14 +4312,43 @@ Target_arm<big_endian>::rel_dyn_section(Layout* layout)
-   if (this->rel_dyn_ == NULL)
-     {
-       gold_assert(layout != NULL);
-+      // Create both relocation sections in the same place, so as to ensure
-+      // their relative order in the output section.
-       this->rel_dyn_ = new Reloc_section(parameters->options().combreloc());
-+      this->rel_irelative_ = new Reloc_section(false);
-       layout->add_output_section_data(".rel.dyn", elfcpp::SHT_REL,
- 				      elfcpp::SHF_ALLOC, this->rel_dyn_,
- 				      ORDER_DYNAMIC_RELOCS, false);
-+      layout->add_output_section_data(".rel.dyn", elfcpp::SHT_REL,
-+				      elfcpp::SHF_ALLOC, this->rel_irelative_,
-+				      ORDER_DYNAMIC_RELOCS, false);
-     }
-   return this->rel_dyn_;
- }
- 
-+
-+// Get the section to use for IRELATIVE relocs, creating it if necessary.  These
-+// go in .rela.dyn, but only after all other dynamic relocations.  They need to
-+// follow the other dynamic relocations so that they can refer to global
-+// variables initialized by those relocs.
-+
-+template<bool big_endian>
-+typename Target_arm<big_endian>::Reloc_section*
-+Target_arm<big_endian>::rel_irelative_section(Layout* layout)
-+{
-+  if (this->rel_irelative_ == NULL)
-+    {
-+      // Delegate the creation to rel_dyn_section so as to ensure their order in
-+      // the output section.
-+      this->rel_dyn_section(layout);
-+      gold_assert(this->rel_irelative_ != NULL
-+		  && (this->rel_dyn_->output_section()
-+		      == this->rel_irelative_->output_section()));
-+    }
-+  return this->rel_irelative_;
-+}
-+
-+
- // Insn_template methods.
- 
- // Return byte size of an instruction template.
-@@ -7221,24 +7305,80 @@ template<bool big_endian>
- class Output_data_plt_arm : public Output_section_data
- {
-  public:
-+  // Unlike aarch64, which records symbol value in "addend" field of relocations
-+  // and could be done at the same time an IRelative reloc is created for the
-+  // symbol, arm puts the symbol value into "GOT" table, which, however, is
-+  // issued later in Output_data_plt_arm::do_write(). So we have a struct here
-+  // to keep necessary symbol information for later use in do_write. We usually
-+  // have only a very limited number of ifuncs, so the extra data required here
-+  // is also limited.
-+
-+  struct IRelative_data
-+  {
-+    IRelative_data(Sized_symbol<32>* sized_symbol)
-+      : symbol_is_global_(true)
-+    {
-+      u_.global = sized_symbol;
-+    }
-+
-+    IRelative_data(Sized_relobj_file<32, big_endian>* relobj,
-+		   unsigned int index)
-+      : symbol_is_global_(false)
-+    {
-+      u_.local.relobj = relobj;
-+      u_.local.index = index;
-+    }
-+
-+    union
-+    {
-+      Sized_symbol<32>* global;
-+
-+      struct
-+      {
-+	Sized_relobj_file<32, big_endian>* relobj;
-+	unsigned int index;
-+      } local;
-+    } u_;
-+
-+    bool symbol_is_global_;
-+  };
-+
-   typedef Output_data_reloc<elfcpp::SHT_REL, true, 32, big_endian>
-     Reloc_section;
- 
--  Output_data_plt_arm(Layout*, uint64_t addralign, Output_data_space*);
-+  Output_data_plt_arm(Layout* layout, uint64_t addralign,
-+		      Arm_output_data_got<big_endian>* got,
-+		      Output_data_space* got_plt,
-+		      Output_data_space* got_irelative);
- 
-   // Add an entry to the PLT.
-   void
--  add_entry(Symbol* gsym);
-+  add_entry(Symbol_table* symtab, Layout* layout, Symbol* gsym);
-+
-+  // Add the relocation for a plt entry.
-+  void
-+  add_relocation(Symbol_table* symtab, Layout* layout,
-+		 Symbol* gsym, unsigned int got_offset);
-+
-+  // Add an entry to the PLT for a local STT_GNU_IFUNC symbol.
-+  unsigned int
-+  add_local_ifunc_entry(Symbol_table* symtab, Layout*,
-+			Sized_relobj_file<32, big_endian>* relobj,
-+			unsigned int local_sym_index);
- 
-   // Return the .rel.plt section data.
-   const Reloc_section*
-   rel_plt() const
-   { return this->rel_; }
- 
-+  // Return the PLT relocation container for IRELATIVE.
-+  Reloc_section*
-+  rel_irelative(Symbol_table*, Layout*);
-+
-   // Return the number of PLT entries.
-   unsigned int
-   entry_count() const
--  { return this->count_; }
-+  { return this->count_ + this->irelative_count_; }
- 
-   // Return the offset of the first non-reserved PLT entry.
-   unsigned int
-@@ -7250,6 +7390,14 @@ class Output_data_plt_arm : public Output_section_data
-   get_plt_entry_size() const
-   { return this->do_get_plt_entry_size(); }
- 
-+  // Return the PLT address for globals.
-+  uint32_t
-+  address_for_global(const Symbol*) const;
-+
-+  // Return the PLT address for locals.
-+  uint32_t
-+  address_for_local(const Relobj*, unsigned int symndx) const;
-+
-  protected:
-   // Fill in the first PLT entry.
-   void
-@@ -7298,19 +7446,37 @@ class Output_data_plt_arm : public Output_section_data
-   set_final_data_size()
-   {
-     this->set_data_size(this->first_plt_entry_offset()
--			+ this->count_ * this->get_plt_entry_size());
-+			+ ((this->count_ + this->irelative_count_)
-+			   * this->get_plt_entry_size()));
-   }
- 
-   // Write out the PLT data.
-   void
-   do_write(Output_file*);
- 
-+  // Record irelative symbol data.
-+  void insert_irelative_data(const IRelative_data& idata)
-+  { irelative_data_vec_.push_back(idata); }
-+
-   // The reloc section.
-   Reloc_section* rel_;
-+  // The IRELATIVE relocs, if necessary.  These must follow the
-+  // regular PLT relocations.
-+  Reloc_section* irelative_rel_;
-+  // The .got section.
-+  Arm_output_data_got<big_endian>* got_;
-   // The .got.plt section.
-   Output_data_space* got_plt_;
-+  // The part of the .got.plt section used for IRELATIVE relocs.
-+  Output_data_space* got_irelative_;
-   // The number of PLT entries.
-   unsigned int count_;
-+  // Number of PLT entries with R_ARM_IRELATIVE relocs.  These
-+  // follow the regular PLT entries.
-+  unsigned int irelative_count_;
-+  // Vector for irelative data.
-+  typedef std::vector<IRelative_data> IRelative_data_vec;
-+  IRelative_data_vec irelative_data_vec_;
- };
- 
- // Create the PLT section.  The ordinary .got section is an argument,
-@@ -7318,10 +7484,14 @@ class Output_data_plt_arm : public Output_section_data
- // section just for PLT entries.
- 
- template<bool big_endian>
--Output_data_plt_arm<big_endian>::Output_data_plt_arm(Layout* layout,
--						     uint64_t addralign,
--						     Output_data_space* got_plt)
--  : Output_section_data(addralign), got_plt_(got_plt), count_(0)
-+Output_data_plt_arm<big_endian>::Output_data_plt_arm(
-+    Layout* layout, uint64_t addralign,
-+    Arm_output_data_got<big_endian>* got,
-+    Output_data_space* got_plt,
-+    Output_data_space* got_irelative)
-+  : Output_section_data(addralign), irelative_rel_(NULL),
-+    got_(got), got_plt_(got_plt), got_irelative_(got_irelative),
-+    count_(0), irelative_count_(0)
- {
-   this->rel_ = new Reloc_section(false);
-   layout->add_output_section_data(".rel.plt", elfcpp::SHT_REL,
-@@ -7340,40 +7510,210 @@ Output_data_plt_arm<big_endian>::do_adjust_output_section(Output_section* os)
- 
- template<bool big_endian>
- void
--Output_data_plt_arm<big_endian>::add_entry(Symbol* gsym)
-+Output_data_plt_arm<big_endian>::add_entry(Symbol_table* symtab,
-+					   Layout* layout,
-+					   Symbol* gsym)
- {
-   gold_assert(!gsym->has_plt_offset());
- 
--  // Note that when setting the PLT offset we skip the initial
--  // reserved PLT entry.
--  gsym->set_plt_offset((this->count_) * this->get_plt_entry_size()
--		       + this->first_plt_entry_offset());
-+  unsigned int* entry_count;
-+  Output_section_data_build* got;
-+
-+  // We have 2 different types of plt entry here, normal and ifunc.
-+
-+  // For normal plt, the offset begins with first_plt_entry_offset(20), and the
-+  // 1st entry offset would be 20, the second 32, third 44 ... etc.
-+
-+  // For ifunc plt, the offset begins with 0. So the first offset would 0,
-+  // second 12, third 24 ... etc.
-+
-+  // IFunc plt entries *always* come after *normal* plt entries.
-+
-+  // Notice, when computing the plt address of a certain symbol, "plt_address +
-+  // plt_offset" is no longer correct. Use target->plt_address_for_global() or
-+  // target->plt_address_for_local() instead.
-+
-+  int begin_offset = 0;
-+  if (gsym->type() == elfcpp::STT_GNU_IFUNC
-+      && gsym->can_use_relative_reloc(false))
-+    {
-+      entry_count = &this->irelative_count_;
-+      got = this->got_irelative_;
-+      // For irelative plt entries, offset is relative to the end of normal plt
-+      // entries, so it starts from 0.
-+      begin_offset = 0;
-+      // Record symbol information.
-+      this->insert_irelative_data(
-+	  IRelative_data(symtab->get_sized_symbol<32>(gsym)));
-+    }
-+  else
-+    {
-+      entry_count = &this->count_;
-+      got = this->got_plt_;
-+      // Note that for normal plt entries, when setting the PLT offset we skip
-+      // the initial reserved PLT entry.
-+      begin_offset = this->first_plt_entry_offset();
-+    }
-+
-+  gsym->set_plt_offset(begin_offset
-+		       + (*entry_count) * this->get_plt_entry_size());
- 
--  ++this->count_;
-+  ++(*entry_count);
- 
--  section_offset_type got_offset = this->got_plt_->current_data_size();
-+  section_offset_type got_offset = got->current_data_size();
- 
-   // Every PLT entry needs a GOT entry which points back to the PLT
-   // entry (this will be changed by the dynamic linker, normally
-   // lazily when the function is called).
--  this->got_plt_->set_current_data_size(got_offset + 4);
-+  got->set_current_data_size(got_offset + 4);
- 
-   // Every PLT entry needs a reloc.
--  gsym->set_needs_dynsym_entry();
--  this->rel_->add_global(gsym, elfcpp::R_ARM_JUMP_SLOT, this->got_plt_,
--			 got_offset);
-+  this->add_relocation(symtab, layout, gsym, got_offset);
- 
-   // Note that we don't need to save the symbol.  The contents of the
-   // PLT are independent of which symbols are used.  The symbols only
-   // appear in the relocations.
- }
- 
-+// Add an entry to the PLT for a local STT_GNU_IFUNC symbol.  Return
-+// the PLT offset.
-+
-+template<bool big_endian>
-+unsigned int
-+Output_data_plt_arm<big_endian>::add_local_ifunc_entry(
-+    Symbol_table* symtab,
-+    Layout* layout,
-+    Sized_relobj_file<32, big_endian>* relobj,
-+    unsigned int local_sym_index)
-+{
-+  this->insert_irelative_data(IRelative_data(relobj, local_sym_index));
-+
-+  // Notice, when computingthe plt entry address, "plt_address + plt_offset" is
-+  // no longer correct. Use target->plt_address_for_local() instead.
-+  unsigned int plt_offset = this->irelative_count_ * this->get_plt_entry_size();
-+  ++this->irelative_count_;
-+
-+  section_offset_type got_offset = this->got_irelative_->current_data_size();
-+
-+  // Every PLT entry needs a GOT entry which points back to the PLT
-+  // entry.
-+  this->got_irelative_->set_current_data_size(got_offset + 4);
-+
-+
-+  // Every PLT entry needs a reloc.
-+  Reloc_section* rel = this->rel_irelative(symtab, layout);
-+  rel->add_symbolless_local_addend(relobj, local_sym_index,
-+				   elfcpp::R_ARM_IRELATIVE,
-+				   this->got_irelative_, got_offset);
-+  return plt_offset;
-+}
-+
-+
-+// Add the relocation for a PLT entry.
-+
-+template<bool big_endian>
-+void
-+Output_data_plt_arm<big_endian>::add_relocation(
-+    Symbol_table* symtab, Layout* layout, Symbol* gsym, unsigned int got_offset)
-+{
-+  if (gsym->type() == elfcpp::STT_GNU_IFUNC
-+      && gsym->can_use_relative_reloc(false))
-+    {
-+      Reloc_section* rel = this->rel_irelative(symtab, layout);
-+      rel->add_symbolless_global_addend(gsym, elfcpp::R_ARM_IRELATIVE,
-+					this->got_irelative_, got_offset);
-+    }
-+  else
-+    {
-+      gsym->set_needs_dynsym_entry();
-+      this->rel_->add_global(gsym, elfcpp::R_ARM_JUMP_SLOT, this->got_plt_,
-+			     got_offset);
-+    }
-+}
-+
-+
-+// Create the irelative relocation data.
-+
-+template<bool big_endian>
-+typename Output_data_plt_arm<big_endian>::Reloc_section*
-+Output_data_plt_arm<big_endian>::rel_irelative(Symbol_table* symtab,
-+						Layout* layout)
-+{
-+  if (this->irelative_rel_ == NULL)
-+    {
-+      // Since irelative relocations goes into 'rel.dyn', we delegate the
-+      // creation of irelative_rel_ to where rel_dyn section gets created.
-+      Target_arm<big_endian>* arm_target =
-+	  Target_arm<big_endian>::default_target();
-+      this->irelative_rel_ = arm_target->rel_irelative_section(layout);
-+
-+      // Make sure we have a place for the TLSDESC relocations, in
-+      // case we see any later on.
-+      // this->rel_tlsdesc(layout);
-+      if (parameters->doing_static_link())
-+	{
-+	  // A statically linked executable will only have a .rel.plt section to
-+	  // hold R_ARM_IRELATIVE relocs for STT_GNU_IFUNC symbols.  The library
-+	  // will use these symbols to locate the IRELATIVE relocs at program
-+	  // startup time.
-+	  symtab->define_in_output_data("__rel_iplt_start", NULL,
-+					Symbol_table::PREDEFINED,
-+					this->irelative_rel_, 0, 0,
-+					elfcpp::STT_NOTYPE, elfcpp::STB_GLOBAL,
-+					elfcpp::STV_HIDDEN, 0, false, true);
-+	  symtab->define_in_output_data("__rel_iplt_end", NULL,
-+					Symbol_table::PREDEFINED,
-+					this->irelative_rel_, 0, 0,
-+					elfcpp::STT_NOTYPE, elfcpp::STB_GLOBAL,
-+					elfcpp::STV_HIDDEN, 0, true, true);
-+	}
-+    }
-+  return this->irelative_rel_;
-+}
-+
-+
-+// Return the PLT address for a global symbol.
-+
-+template<bool big_endian>
-+uint32_t
-+Output_data_plt_arm<big_endian>::address_for_global(const Symbol* gsym) const
-+{
-+  uint64_t begin_offset = 0;
-+  if (gsym->type() == elfcpp::STT_GNU_IFUNC
-+      && gsym->can_use_relative_reloc(false))
-+    {
-+      begin_offset = (this->first_plt_entry_offset() +
-+		      this->count_ * this->get_plt_entry_size());
-+    }
-+  return this->address() + begin_offset + gsym->plt_offset();
-+}
-+
-+
-+// Return the PLT address for a local symbol.  These are always
-+// IRELATIVE relocs.
-+
-+template<bool big_endian>
-+uint32_t
-+Output_data_plt_arm<big_endian>::address_for_local(
-+    const Relobj* object,
-+    unsigned int r_sym) const
-+{
-+  return (this->address()
-+	  + this->first_plt_entry_offset()
-+	  + this->count_ * this->get_plt_entry_size()
-+	  + object->local_plt_offset(r_sym));
-+}
-+
-+
- template<bool big_endian>
- class Output_data_plt_arm_standard : public Output_data_plt_arm<big_endian>
- {
-  public:
--  Output_data_plt_arm_standard(Layout* layout, Output_data_space* got_plt)
--    : Output_data_plt_arm<big_endian>(layout, 4, got_plt)
-+  Output_data_plt_arm_standard(Layout* layout,
-+			       Arm_output_data_got<big_endian>* got,
-+			       Output_data_space* got_plt,
-+			       Output_data_space* got_irelative)
-+    : Output_data_plt_arm<big_endian>(layout, 4, got, got_plt, got_irelative)
-   { }
- 
-  protected:
-@@ -7485,8 +7825,11 @@ Output_data_plt_arm<big_endian>::do_write(Output_file* of)
-   unsigned char* const oview = of->get_output_view(offset, oview_size);
- 
-   const off_t got_file_offset = this->got_plt_->offset();
-+  gold_assert(got_file_offset + this->got_plt_->data_size()
-+	      == this->got_irelative_->offset());
-   const section_size_type got_size =
--    convert_to_section_size_type(this->got_plt_->data_size());
-+    convert_to_section_size_type(this->got_plt_->data_size()
-+				 + this->got_irelative_->data_size());
-   unsigned char* const got_view = of->get_output_view(got_file_offset,
- 						      got_size);
-   unsigned char* pov = oview;
-@@ -7505,7 +7848,8 @@ Output_data_plt_arm<big_endian>::do_write(Output_file* of)
- 
-   unsigned int plt_offset = this->first_plt_entry_offset();
-   unsigned int got_offset = 12;
--  const unsigned int count = this->count_;
-+  const unsigned int count = this->count_ + this->irelative_count_;
-+  gold_assert(this->irelative_count_ == this->irelative_data_vec_.size());
-   for (unsigned int i = 0;
-        i < count;
-        ++i,
-@@ -7518,8 +7862,33 @@ Output_data_plt_arm<big_endian>::do_write(Output_file* of)
-       this->fill_plt_entry(pov, got_address, plt_address,
- 			   got_offset, plt_offset);
- 
--      // Set the entry in the GOT.
--      elfcpp::Swap<32, big_endian>::writeval(got_pov, plt_address);
-+      Arm_address value;
-+      if (i < this->count_)
-+	{
-+	  // For non-irelative got entries, the value is the beginning of plt.
-+	  value = plt_address;
-+	}
-+      else
-+	{
-+	  // For irelative got entries, the value is the (global/local) symbol
-+	  // address.
-+	  const IRelative_data& idata =
-+	      this->irelative_data_vec_[i - this->count_];
-+	  if (idata.symbol_is_global_)
-+	    {
-+	      // Set the entry in the GOT for irelative symbols.  The content is
-+	      // the address of the ifunc, not the address of plt start.
-+	      const Sized_symbol<32>* sized_symbol = idata.u_.global;
-+	      gold_assert(sized_symbol->type() == elfcpp::STT_GNU_IFUNC);
-+	      value = sized_symbol->value();
-+	    }
-+	  else
-+	    {
-+	      value = idata.u_.local.relobj->local_symbol_value(
-+		  idata.u_.local.index, 0);
-+	    }
-+	}
-+      elfcpp::Swap<32, big_endian>::writeval(got_pov, value);
-     }
- 
-   gold_assert(static_cast<section_size_type>(pov - oview) == oview_size);
-@@ -7529,6 +7898,7 @@ Output_data_plt_arm<big_endian>::do_write(Output_file* of)
-   of->write_output_view(got_file_offset, got_size, got_view);
- }
- 
-+
- // Create a PLT entry for a global symbol.
- 
- template<bool big_endian>
-@@ -7540,20 +7910,58 @@ Target_arm<big_endian>::make_plt_entry(Symbol_table* symtab, Layout* layout,
-     return;
- 
-   if (this->plt_ == NULL)
-+    this->make_plt_section(symtab, layout);
-+
-+  this->plt_->add_entry(symtab, layout, gsym);
-+}
-+
-+
-+// Create the PLT section.
-+template<bool big_endian>
-+void
-+Target_arm<big_endian>::make_plt_section(
-+  Symbol_table* symtab, Layout* layout)
-+{
-+  if (this->plt_ == NULL)
-     {
--      // Create the GOT sections first.
-+      // Create the GOT section first.
-       this->got_section(symtab, layout);
- 
--      this->plt_ = this->make_data_plt(layout, this->got_plt_);
-+      // GOT for irelatives is create along with got.plt.
-+      gold_assert(this->got_ != NULL
-+		  && this->got_plt_ != NULL
-+		  && this->got_irelative_ != NULL);
-+      this->plt_ = this->make_data_plt(layout, this->got_, this->got_plt_,
-+				       this->got_irelative_);
- 
-       layout->add_output_section_data(".plt", elfcpp::SHT_PROGBITS,
- 				      (elfcpp::SHF_ALLOC
- 				       | elfcpp::SHF_EXECINSTR),
- 				      this->plt_, ORDER_PLT, false);
-     }
--  this->plt_->add_entry(gsym);
- }
- 
-+
-+// Make a PLT entry for a local STT_GNU_IFUNC symbol.
-+
-+template<bool big_endian>
-+void
-+Target_arm<big_endian>::make_local_ifunc_plt_entry(
-+    Symbol_table* symtab, Layout* layout,
-+    Sized_relobj_file<32, big_endian>* relobj,
-+    unsigned int local_sym_index)
-+{
-+  if (relobj->local_has_plt_offset(local_sym_index))
-+    return;
-+  if (this->plt_ == NULL)
-+    this->make_plt_section(symtab, layout);
-+  unsigned int plt_offset = this->plt_->add_local_ifunc_entry(symtab, layout,
-+							      relobj,
-+							      local_sym_index);
-+  relobj->set_local_plt_offset(local_sym_index, plt_offset);
-+}
-+
-+
- // Return the number of entries in the PLT.
- 
- template<bool big_endian>
-@@ -7823,6 +8231,7 @@ Target_arm<big_endian>::Scan::check_non_pic(Relobj* object,
-     case elfcpp::R_ARM_JUMP_SLOT:
-     case elfcpp::R_ARM_ABS32:
-     case elfcpp::R_ARM_ABS32_NOI:
-+    case elfcpp::R_ARM_IRELATIVE:
-     case elfcpp::R_ARM_PC24:
-     // FIXME: The following 3 types are not supported by Android's dynamic
-     // linker.
-@@ -7853,6 +8262,27 @@ Target_arm<big_endian>::Scan::check_non_pic(Relobj* object,
-     }
- }
- 
-+
-+// Return whether we need to make a PLT entry for a relocation of the
-+// given type against a STT_GNU_IFUNC symbol.
-+
-+template<bool big_endian>
-+bool
-+Target_arm<big_endian>::Scan::reloc_needs_plt_for_ifunc(
-+    Sized_relobj_file<32, big_endian>* object,
-+    unsigned int r_type)
-+{
-+  int flags = Scan::get_reference_flags(r_type);
-+  if (flags & Symbol::TLS_REF)
-+    {
-+      gold_error(_("%s: unsupported TLS reloc %u for IFUNC symbol"),
-+		 object->name().c_str(), r_type);
-+      return false;
-+    }
-+  return flags != 0;
-+}
-+
-+
- // Scan a relocation for a local symbol.
- // FIXME: This only handles a subset of relocation types used by Android
- // on ARM v5te devices.
-@@ -7874,6 +8304,15 @@ Target_arm<big_endian>::Scan::local(Symbol_table* symtab,
-     return;
- 
-   r_type = get_real_reloc_type(r_type);
-+
-+  // A local STT_GNU_IFUNC symbol may require a PLT entry.
-+  bool is_ifunc = lsym.get_st_type() == elfcpp::STT_GNU_IFUNC;
-+  if (is_ifunc && this->reloc_needs_plt_for_ifunc(object, r_type))
-+    {
-+      unsigned int r_sym = elfcpp::elf_r_sym<32>(reloc.get_r_info());
-+      target->make_local_ifunc_plt_entry(symtab, layout, object, r_sym);
-+    }
-+
-   switch (r_type)
-     {
-     case elfcpp::R_ARM_NONE:
-@@ -7898,7 +8337,7 @@ Target_arm<big_endian>::Scan::local(Symbol_table* symtab,
- 	  // we need to add check_non_pic(object, r_type) here.
- 	  rel_dyn->add_local_relative(object, r_sym, elfcpp::R_ARM_RELATIVE,
- 				      output_section, data_shndx,
--				      reloc.get_r_offset());
-+				      reloc.get_r_offset(), is_ifunc);
- 	}
-       break;
- 
-@@ -8265,6 +8704,11 @@ Target_arm<big_endian>::Scan::global(Symbol_table* symtab,
-       && strcmp(gsym->name(), "_GLOBAL_OFFSET_TABLE_") == 0)
-     target->got_section(symtab, layout);
- 
-+  // A STT_GNU_IFUNC symbol may require a PLT entry.
-+  if (gsym->type() == elfcpp::STT_GNU_IFUNC
-+      && this->reloc_needs_plt_for_ifunc(object, r_type))
-+    target->make_plt_entry(symtab, layout, gsym);
-+
-   r_type = get_real_reloc_type(r_type);
-   switch (r_type)
-     {
-@@ -8309,6 +8753,24 @@ Target_arm<big_endian>::Scan::global(Symbol_table* symtab,
- 	      }
- 	    else if ((r_type == elfcpp::R_ARM_ABS32
- 		      || r_type == elfcpp::R_ARM_ABS32_NOI)
-+		     && gsym->type() == elfcpp::STT_GNU_IFUNC
-+		     && gsym->can_use_relative_reloc(false)
-+		     && !gsym->is_from_dynobj()
-+		     && !gsym->is_undefined()
-+		     && !gsym->is_preemptible())
-+	      {
-+		// Use an IRELATIVE reloc for a locally defined STT_GNU_IFUNC
-+		// symbol. This makes a function address in a PIE executable
-+		// match the address in a shared library that it links against.
-+		Reloc_section* rel_irelative =
-+		    target->rel_irelative_section(layout);
-+		unsigned int r_type = elfcpp::R_ARM_IRELATIVE;
-+		rel_irelative->add_symbolless_global_addend(
-+		    gsym, r_type, output_section, object,
-+		    data_shndx, reloc.get_r_offset());
-+	      }
-+	    else if ((r_type == elfcpp::R_ARM_ABS32
-+		      || r_type == elfcpp::R_ARM_ABS32_NOI)
- 		     && gsym->can_use_relative_reloc(false))
- 	      {
- 		Reloc_section* rel_dyn = target->rel_dyn_section(layout);
-@@ -8442,7 +8904,13 @@ Target_arm<big_endian>::Scan::global(Symbol_table* symtab,
- 	Arm_output_data_got<big_endian>* got =
- 	  target->got_section(symtab, layout);
- 	if (gsym->final_value_is_known())
--	  got->add_global(gsym, GOT_TYPE_STANDARD);
-+	  {
-+	    // For a STT_GNU_IFUNC symbol we want the PLT address.
-+	    if (gsym->type() == elfcpp::STT_GNU_IFUNC)
-+	      got->add_global_plt(gsym, GOT_TYPE_STANDARD);
-+	    else
-+	      got->add_global(gsym, GOT_TYPE_STANDARD);
-+	  }
- 	else
- 	  {
- 	    // If this symbol is not fully resolved, we need to add a
-@@ -8452,12 +8920,29 @@ Target_arm<big_endian>::Scan::global(Symbol_table* symtab,
- 		|| gsym->is_undefined()
- 		|| gsym->is_preemptible()
- 		|| (gsym->visibility() == elfcpp::STV_PROTECTED
--		    && parameters->options().shared()))
-+		    && parameters->options().shared())
-+		|| (gsym->type() == elfcpp::STT_GNU_IFUNC
-+		    && parameters->options().output_is_position_independent()))
- 	      got->add_global_with_rel(gsym, GOT_TYPE_STANDARD,
- 				       rel_dyn, elfcpp::R_ARM_GLOB_DAT);
- 	    else
- 	      {
--		if (got->add_global(gsym, GOT_TYPE_STANDARD))
-+		// For a STT_GNU_IFUNC symbol we want to write the PLT
-+		// offset into the GOT, so that function pointer
-+		// comparisons work correctly.
-+		bool is_new;
-+		if (gsym->type() != elfcpp::STT_GNU_IFUNC)
-+		  is_new = got->add_global(gsym, GOT_TYPE_STANDARD);
-+		else
-+		  {
-+		    is_new = got->add_global_plt(gsym, GOT_TYPE_STANDARD);
-+		    // Tell the dynamic linker to use the PLT address
-+		    // when resolving relocations.
-+		    if (gsym->is_from_dynobj()
-+			&& !parameters->options().shared())
-+		      gsym->set_needs_dynsym_value();
-+		  }
-+		if (is_new)
- 		  rel_dyn->add_global_relative(
- 		      gsym, elfcpp::R_ARM_RELATIVE, got,
- 		      gsym->got_offset(GOT_TYPE_STANDARD));
-@@ -8919,8 +9404,7 @@ Target_arm<big_endian>::Relocate::relocate(
- 	  if (gsym->use_plt_offset(Scan::get_reference_flags(r_type)))
- 	    {
- 	      // This uses a PLT, change the symbol value.
--	      symval.set_output_value(target->plt_section()->address()
--				      + gsym->plt_offset());
-+	      symval.set_output_value(target->plt_address_for_global(gsym));
- 	      psymval = &symval;
- 	    }
- 	  else if (gsym->is_weak_undefined())
-@@ -8958,6 +9442,13 @@ Target_arm<big_endian>::Relocate::relocate(
- 	  elfcpp::Elf_types<32>::Elf_WXword r_info = rel.get_r_info();
- 	  unsigned int r_sym = elfcpp::elf_r_sym<32>(r_info);
- 	  thumb_bit = object->local_symbol_is_thumb_function(r_sym) ? 1 : 0;
-+
-+	  if (psymval->is_ifunc_symbol() && object->local_has_plt_offset(r_sym))
-+	    {
-+	      symval.set_output_value(
-+		  target->plt_address_for_local(object, r_sym));
-+	      psymval = &symval;
-+	    }
- 	}
-     }
-   else
-@@ -9936,7 +10427,7 @@ uint64_t
- Target_arm<big_endian>::do_dynsym_value(const Symbol* gsym) const
- {
-   gold_assert(gsym->is_from_dynobj() && gsym->has_plt_offset());
--  return this->plt_section()->address() + gsym->plt_offset();
-+  return this->plt_address_for_global(gsym);
- }
- 
- // Map platform-specific relocs to real relocs
-@@ -11083,8 +11574,7 @@ Target_arm<big_endian>::scan_reloc_for_stub(
-       if (gsym->use_plt_offset(Scan::get_reference_flags(r_type)))
- 	{
- 	  // This uses a PLT, change the symbol value.
--	  symval.set_output_value(this->plt_section()->address()
--				  + gsym->plt_offset());
-+	  symval.set_output_value(this->plt_address_for_global(gsym));
- 	  psymval = &symval;
- 	  target_is_thumb = false;
- 	}
-@@ -12187,8 +12677,13 @@ class Target_arm_nacl : public Target_arm<big_endian>
- 
-  protected:
-   virtual Output_data_plt_arm<big_endian>*
--  do_make_data_plt(Layout* layout, Output_data_space* got_plt)
--  { return new Output_data_plt_arm_nacl<big_endian>(layout, got_plt); }
-+  do_make_data_plt(
-+		   Layout* layout,
-+		   Arm_output_data_got<big_endian>* got,
-+		   Output_data_space* got_plt,
-+		   Output_data_space* got_irelative)
-+  { return new Output_data_plt_arm_nacl<big_endian>(
-+      layout, got, got_plt, got_irelative); }
- 
-  private:
-   static const Target::Target_info arm_nacl_info;
-@@ -12225,8 +12720,12 @@ template<bool big_endian>
- class Output_data_plt_arm_nacl : public Output_data_plt_arm<big_endian>
- {
-  public:
--  Output_data_plt_arm_nacl(Layout* layout, Output_data_space* got_plt)
--    : Output_data_plt_arm<big_endian>(layout, 16, got_plt)
-+  Output_data_plt_arm_nacl(
-+      Layout* layout,
-+      Arm_output_data_got<big_endian>* got,
-+      Output_data_space* got_plt,
-+      Output_data_space* got_irelative)
-+    : Output_data_plt_arm<big_endian>(layout, 16, got, got_plt, got_irelative)
-   { }
- 
-  protected:
-diff --git a/gold/output.h b/gold/output.h
-index ba0cdaa..599c2b7 100644
---- a/gold/output.h
-+++ b/gold/output.h
-@@ -1714,6 +1714,17 @@ class Output_data_reloc<elfcpp::SHT_REL, dynamic, size, big_endian>
- 				    address, true, true, false, false));
-   }
- 
-+  void
-+  add_local_relative(Sized_relobj<size, big_endian>* relobj,
-+		     unsigned int local_sym_index, unsigned int type,
-+		     Output_data* od, unsigned int shndx, Address address,
-+		     bool use_plt_offset)
-+  {
-+    this->add(od, Output_reloc_type(relobj, local_sym_index, type, shndx,
-+				    address, true, true, false,
-+				    use_plt_offset));
-+  }
-+
-   // Add a local relocation which does not use a symbol for the relocation,
-   // but which gets its addend from a symbol.
- 
--- 
-2.7.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/add-thunderx-support-for-gas.patch b/meta/recipes-devtools/binutils/binutils/add-thunderx-support-for-gas.patch
deleted file mode 100644
index 0f6875e..0000000
--- a/meta/recipes-devtools/binutils/binutils/add-thunderx-support-for-gas.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Add thunderx support to gas
-
-Upstream-Status: Submitted [https://sourceware.org/ml/binutils/2014-10/msg00170.html]
-
-Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
-
-Author: Andrew Pinski <apinski@cavium.com>
-Date: Mon, 20 Oct 2014 11:42:58 -0700
-
-    This patch adds -mcpu=thunderx support to gas.
-
-diff -Naurp git_org/gas/config/tc-aarch64.c git/gas/config/tc-aarch64.c
---- git_org/gas/config/tc-aarch64.c	2015-09-07 02:13:51.988973523 -0700
-+++ git/gas/config/tc-aarch64.c	2015-09-07 02:15:21.705981540 -0700
-@@ -7206,6 +7206,7 @@ static const struct aarch64_cpu_option_t
- 				 AARCH64_FEATURE_CRC), "Cortex-A57"},
-   {"cortex-a72", AARCH64_FEATURE (AARCH64_ARCH_V8,
- 				  AARCH64_FEATURE_CRC), "Cortex-A72"},
-+  {"thunderx",		AARCH64_ARCH_V8, "Cavium ThunderX"},				  
-   {"exynos-m1", AARCH64_FEATURE (AARCH64_ARCH_V8,
- 				 AARCH64_FEATURE_CRC | AARCH64_FEATURE_CRYPTO),
- 				 "Samsung Exynos M1"},
-diff -Naurp git_org/gas/doc/c-aarch64.texi git/gas/doc/c-aarch64.texi
---- git_org/gas/doc/c-aarch64.texi	2015-09-07 02:13:51.969973522 -0700
-+++ git/gas/doc/c-aarch64.texi	2015-09-07 02:16:03.364985262 -0700
-@@ -58,6 +58,7 @@ on the target processor.  The following
- @code{cortex-a53},
- @code{cortex-a57},
- @code{cortex-a72},
-+@code{thunderx},
- @code{exynos-m1},
- @code{xgene1},
- and
diff --git a/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch b/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch
deleted file mode 100644
index 4e8c69f..0000000
--- a/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch
+++ /dev/null
@@ -1,272 +0,0 @@
-Upstream-Status: Backport
-
-https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=2c62985659da21a3fe16062d211a7158f79ad2e9
-
-Signed-off-By: Armin Kuster <akuster@mvista.com>
-
-Index: git/bfd/archures.c
-===================================================================
---- git.orig/bfd/archures.c
-+++ git/bfd/archures.c
-@@ -179,6 +179,7 @@ DESCRIPTION
- .#define bfd_mach_mips_octeon		6501
- .#define bfd_mach_mips_octeonp		6601
- .#define bfd_mach_mips_octeon2		6502
-+.#define bfd_mach_mips_octeon3		6503
- .#define bfd_mach_mips_xlr              887682   {* decimal 'XLR'  *}
- .#define bfd_mach_mips_xlp              887680   {* decimal 'XLP'  *}
- .#define bfd_mach_mipsisa32             32
-Index: git/bfd/bfd-in2.h
-===================================================================
---- git.orig/bfd/bfd-in2.h
-+++ git/bfd/bfd-in2.h
-@@ -1969,6 +1969,7 @@ enum bfd_architecture
- #define bfd_mach_mips_octeon           6501
- #define bfd_mach_mips_octeonp          6601
- #define bfd_mach_mips_octeon2          6502
-+#define bfd_mach_mips_octeon3          6503
- #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'  */
- #define bfd_mach_mips_xlp              887680   /* decimal 'XLP'  */
- #define bfd_mach_mipsisa32             32
-Index: git/bfd/cpu-mips.c
-===================================================================
---- git.orig/bfd/cpu-mips.c
-+++ git/bfd/cpu-mips.c
-@@ -102,6 +102,7 @@ enum
-   I_mipsocteon,
-   I_mipsocteonp,
-   I_mipsocteon2,
-+  I_mipsocteon3,
-   I_xlr,
-   I_micromips,
-   I_xlp
-@@ -153,6 +154,7 @@ static const bfd_arch_info_type arch_inf
-   N (64, 64, bfd_mach_mips_octeon,"mips:octeon",  FALSE, NN(I_mipsocteon)),
-   N (64, 64, bfd_mach_mips_octeonp,"mips:octeon+",  FALSE, NN(I_mipsocteonp)),
-   N (64, 64, bfd_mach_mips_octeon2,"mips:octeon2",  FALSE, NN(I_mipsocteon2)),
-+  N (64, 64, bfd_mach_mips_octeon3,"mips:octeon3",  FALSE, NN(I_mipsocteon3)),
-   N (64, 64, bfd_mach_mips_xlr, "mips:xlr",       FALSE, NN(I_xlr)),
-   N (64, 64, bfd_mach_mips_micromips,"mips:micromips",FALSE,NN(I_micromips)),
-   N (64, 64, bfd_mach_mips_xlp, "mips:xlp",      FALSE, 0)
-Index: git/bfd/elfxx-mips.c
-===================================================================
---- git.orig/bfd/elfxx-mips.c
-+++ git/bfd/elfxx-mips.c
-@@ -6604,6 +6604,9 @@ _bfd_elf_mips_mach (flagword flags)
-     case E_MIPS_MACH_LS3A:
-       return bfd_mach_mips_loongson_3a;
- 
-+    case E_MIPS_MACH_OCTEON3:
-+      return bfd_mach_mips_octeon3;
-+
-     case E_MIPS_MACH_OCTEON2:
-       return bfd_mach_mips_octeon2;
- 
-@@ -11878,6 +11881,10 @@ mips_set_isa_flags (bfd *abfd)
-       val = E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON;
-       break;
- 
-+    case bfd_mach_mips_octeon3:
-+      val = E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON3;
-+      break;
-+
-     case bfd_mach_mips_xlr:
-       val = E_MIPS_ARCH_64 | E_MIPS_MACH_XLR;
-       break;
-@@ -14773,6 +14780,7 @@ struct mips_mach_extension
- static const struct mips_mach_extension mips_mach_extensions[] =
- {
-   /* MIPS64r2 extensions.  */
-+  { bfd_mach_mips_octeon3, bfd_mach_mips_octeon2 },
-   { bfd_mach_mips_octeon2, bfd_mach_mips_octeonp },
-   { bfd_mach_mips_octeonp, bfd_mach_mips_octeon },
-   { bfd_mach_mips_octeon, bfd_mach_mipsisa64r2 },
-Index: git/gas/config/tc-mips.c
-===================================================================
---- git.orig/gas/config/tc-mips.c
-+++ git/gas/config/tc-mips.c
-@@ -306,7 +306,7 @@ static unsigned int file_ase_explicit;
- unsigned long mips_gprmask;
- unsigned long mips_cprmask[4];
- 
--/* True if any MIPS16 code was produced.  */
-+/* 2True if any MIPS16 code was produced.  */
- static int file_ase_mips16;
- 
- #define ISA_SUPPORTS_MIPS16E (mips_opts.isa == ISA_MIPS32		\
-@@ -510,7 +510,8 @@ static int mips_32bitmode = 0;
- #define CPU_HAS_ROR(CPU)	CPU_HAS_DROR (CPU)
- 
- /* True if CPU is in the Octeon family */
--#define CPU_IS_OCTEON(CPU) ((CPU) == CPU_OCTEON || (CPU) == CPU_OCTEONP || (CPU) == CPU_OCTEON2)
-+#define CPU_IS_OCTEON(CPU) ((CPU) == CPU_OCTEON || (CPU) == CPU_OCTEONP \
-+                           || (CPU) == CPU_OCTEON2 || (CPU) == CPU_OCTEON3)
- 
- /* True if CPU has seq/sne and seqi/snei instructions.  */
- #define CPU_HAS_SEQ(CPU)	(CPU_IS_OCTEON (CPU))
-@@ -18677,6 +18678,7 @@ static const struct mips_cpu_info mips_c
-   { "octeon",	      0, 0,			ISA_MIPS64R2, CPU_OCTEON },
-   { "octeon+",	      0, 0,			ISA_MIPS64R2, CPU_OCTEONP },
-   { "octeon2",	      0, 0,			ISA_MIPS64R2, CPU_OCTEON2 },
-+  { "octeon3",        0, ASE_VIRT | ASE_VIRT64, ISA_MIPS64R2, CPU_OCTEON3 },
- 
-   /* RMI Xlr */
-   { "xlr",	      0, 0,			ISA_MIPS64,   CPU_XLR },
-Index: git/gas/doc/c-mips.texi
-===================================================================
---- git.orig/gas/doc/c-mips.texi
-+++ git/gas/doc/c-mips.texi
-@@ -382,6 +382,7 @@ loongson3a,
- octeon,
- octeon+,
- octeon2,
-+octeon3,
- xlr,
- xlp
- @end quotation
-Index: git/gas/testsuite/gas/mips/mips.exp
-===================================================================
---- git.orig/gas/testsuite/gas/mips/mips.exp
-+++ git/gas/testsuite/gas/mips/mips.exp
-@@ -1102,6 +1102,7 @@ if { [istarget mips*-*-vxworks*] } {
-     run_list_test_arches "octeon-ill"	[mips_arch_list_matching octeon]
-     run_dump_test_arches "octeon-pref"	[mips_arch_list_matching octeon]
-     run_dump_test_arches "octeon2"	[mips_arch_list_matching octeon2]
-+    run_dump_test_arches "octeon3"	[mips_arch_list_matching octeon3]
- 
-     run_dump_test "smartmips"
-     run_dump_test_arches "mips32-dsp"	[mips_arch_list_matching mips32r2 \
-Index: git/gas/testsuite/gas/mips/octeon3.d
-===================================================================
---- /dev/null
-+++ git/gas/testsuite/gas/mips/octeon3.d
-@@ -0,0 +1,20 @@
-+#objdump: -d -r --show-raw-insn
-+#name: MIPS octeon3 instructions
-+
-+.*: +file format .*mips.*
-+
-+Disassembly of section .text:
-+
-+[0-9a-f]+ <foo>:
-+.*:    71ec0008        mtm0    t3,t0
-+.*:    71a40008        mtm0    t1,a0
-+.*:    7083000c        mtm1    a0,v1
-+.*:    70e1000c        mtm1    a3,at
-+.*:    7022000d        mtm2    at,v0
-+.*:    7083000c        mtm1    a0,v1
-+.*:    70a20009        mtp0    a1,v0
-+.*:    70c40009        mtp0    a2,a0
-+.*:    7083000a        mtp1    a0,v1
-+.*:    70e1000a        mtp1    a3,at
-+.*:    7022000b        mtp2    at,v0
-+.*:    7083000a        mtp1    a0,v1
-Index: git/gas/testsuite/gas/mips/octeon3.s
-===================================================================
---- /dev/null
-+++ git/gas/testsuite/gas/mips/octeon3.s
-@@ -0,0 +1,22 @@
-++       .text
-+       .set noreorder
-+       .set noat
-+
-+foo:
-+        mtm0 $15,$12
-+        mtm0 $13,$4
-+
-+        mtm1 $4,$3
-+        mtm1 $7,$1
-+
-+        mtm2 $1,$2
-+        mtm1 $4,$3
-+
-+        mtp0 $5,$2
-+        mtp0 $6,$4
-+
-+        mtp1 $4,$3
-+        mtp1 $7,$1
-+
-+        mtp2 $1,$2
-+        mtp1 $4,$3
-Index: git/include/opcode/mips.h
-===================================================================
---- git.orig/include/opcode/mips.h
-+++ git/include/opcode/mips.h
-@@ -1196,6 +1196,7 @@ static const unsigned int mips_isa_table
- #define INSN_OCTEON		  0x00000800
- #define INSN_OCTEONP		  0x00000200
- #define INSN_OCTEON2		  0x00000100
-+#define INSN_OCTEON3		  0x00000040
- 
- /* MIPS R5900 instruction */
- #define INSN_5900                 0x00004000
-@@ -1325,6 +1326,7 @@ static const unsigned int mips_isa_table
- #define CPU_OCTEON	6501
- #define CPU_OCTEONP	6601
- #define CPU_OCTEON2	6502
-+#define CPU_OCTEON3	6503
- #define CPU_XLR     	887682   	/* decimal 'XLR'   */
- #define CPU_XLP         887680      /* decimal 'XLP'   */
- 
-@@ -1391,6 +1393,9 @@ cpu_is_member (int cpu, unsigned int mas
-     case CPU_OCTEON2:
-       return (mask & INSN_OCTEON2) != 0;
- 
-+    case CPU_OCTEON3:
-+      return (mask & INSN_OCTEON3) != 0;
-+
-     case CPU_XLR:
-       return (mask & INSN_XLR) != 0;
- 
-Index: git/opcodes/mips-dis.c
-===================================================================
---- git.orig/opcodes/mips-dis.c
-+++ git/opcodes/mips-dis.c
-@@ -649,6 +649,11 @@ const struct mips_arch_choice mips_arch_
-     ISA_MIPS64R2 | INSN_OCTEON2, 0, mips_cp0_names_numeric,
-     NULL, 0, mips_cp1_names_mips3264, mips_hwr_names_numeric },
- 
-+  { "octeon3",   1, bfd_mach_mips_octeon3, CPU_OCTEON3,
-+    ISA_MIPS64R2 | INSN_OCTEON3, ASE_VIRT | ASE_VIRT64,
-+    mips_cp0_names_numeric,
-+    NULL, 0, mips_cp1_names_mips3264, mips_hwr_names_numeric },
-+
-   { "xlr", 1, bfd_mach_mips_xlr, CPU_XLR,
-     ISA_MIPS64 | INSN_XLR, 0,
-     mips_cp0_names_xlr,
-Index: git/opcodes/mips-opc.c
-===================================================================
---- git.orig/opcodes/mips-opc.c
-+++ git/opcodes/mips-opc.c
-@@ -316,9 +316,10 @@ decode_mips_operand (const char *p)
- #define N5	(INSN_5400 | INSN_5500)
- #define N54	INSN_5400
- #define N55	INSN_5500
--#define IOCT	(INSN_OCTEON | INSN_OCTEONP | INSN_OCTEON2)
--#define IOCTP	(INSN_OCTEONP | INSN_OCTEON2)
--#define IOCT2	INSN_OCTEON2
-+#define IOCT	(INSN_OCTEON | INSN_OCTEONP | INSN_OCTEON2 | INSN_OCTEON3)
-+#define IOCTP	(INSN_OCTEONP | INSN_OCTEON2 | INSN_OCTEON3)
-+#define IOCT2	(INSN_OCTEON2 | INSN_OCTEON3)
-+#define IOCT3  INSN_OCTEON3
- #define XLR	INSN_XLR
- #define XLP	INSN_XLP
- #define IVIRT	ASE_VIRT
-@@ -1505,11 +1506,17 @@ const struct mips_opcode mips_builtin_op
- {"mtlhx",		"s",		0x00000053, 0xfc1fffff,	RD_1|MOD_HILO,		0,		0,		SMT,	0 },
- {"mtcr",		"t,s",		0x70000019, 0xfc00ffff, RD_1,			0,		XLR|XLP,	0,	0 },
- {"mtm0",		"s",		0x70000008, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
-+{"mtm0",                "s,t",          0x70000008, 0xfc00ffff, RD_1|RD_2,              0,              IOCT3,          0,      0 },
- {"mtm1",		"s",		0x7000000c, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
-+{"mtm1",                "s,t",          0x7000000c, 0xfc00ffff, RD_1|RD_2,              0,              IOCT3,          0,      0 },
- {"mtm2",		"s",		0x7000000d, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
-+{"mtm2",                "s,t",          0x7000000d, 0xfc00ffff, RD_1|RD_2,              0,              IOCT3,          0,      0 },
- {"mtp0",		"s",		0x70000009, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
-+{"mtp0",                "s,t",          0x70000009, 0xfc00ffff, RD_1|RD_2,              0,              IOCT3,          0,      0 },
- {"mtp1",		"s",		0x7000000a, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
-+{"mtp1",                "s,t",          0x7000000a, 0xfc00ffff, RD_1|RD_2,              0,              IOCT3,          0,      0 },
- {"mtp2",		"s",		0x7000000b, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
-+{"mtp2",                "s,t",          0x7000000b, 0xfc00ffff, RD_1|RD_2,              0,              IOCT3,          0,      0 },
- {"mtsa",		"s",		0x00000029, 0xfc1fffff,	RD_1,			0,		EE,		0,	0 },
- {"mtsab",		"s,j",		0x04180000, 0xfc1f0000,	RD_1,			0,		EE,		0,	0 },
- {"mtsah",		"s,j",		0x04190000, 0xfc1f0000,	RD_1,			0,		EE,		0,	0 },
diff --git a/meta/recipes-devtools/binutils/binutils_2.25.1.bb b/meta/recipes-devtools/binutils/binutils_2.26.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils_2.25.1.bb
rename to meta/recipes-devtools/binutils/binutils_2.26.bb
-- 
2.7.0


