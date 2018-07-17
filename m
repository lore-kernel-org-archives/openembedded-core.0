Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5766B74F9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 20:10:31 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id z8-v6so908559pgu.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 13:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/2DOgTG3mN1GsEtKMBCBUrxYoNEerFzCaq7IK6TObwM=;
	b=CVA23pSuqyZ0/k6dI4xP/BVoTHmPbzVkrfQSRmsT2S6cmt6zb/eiUhsNev0a8ETsPM
	kePYUplz87p3F76SH7QkhgJuasuUGYeKfYSeYz27bp3QHFjcwyuXDvxyNEElMgPiN83N
	qDNv+j3v211BUwk9RsB0L5h6pMMTtinJaIv6hoX2xSDC9RfrH+DkHR0dG0Bi8HHCzQSu
	dojmtrlzeqi9WHOWTY469A0fbqs3JDwywT9Ij6GMJ0JsJIhNQUbr/F5cUS3+Eh7I440X
	LLFQv1GIV5ZMRrwB2zc7ttjijBN30RvHNOgXy2JLuLiLWQxPEosu1epKLW9IvYuiHDru
	ZatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/2DOgTG3mN1GsEtKMBCBUrxYoNEerFzCaq7IK6TObwM=;
	b=ZHaQoWCXPVIGG769bLDS6Dr4iZ000pkvlJngs6l13Bni2fJwfL9svY1IUFljIyLEqx
	C9uMNLSt3wyn4xUZsmNXOUuGRJTMBPRvpC4gwZE1fxBHxs5TLAvGJ3MgBHhyUBJLKz8a
	a0UYNxlj01W+NZDTklNKR/oqU3Po2pf6Xn0s4/ARUUQImWKkXPCS74dZKtNCftgJ53aZ
	tMAdSMzI8n8GvA5lz1kApn/7EDlpGJJpeZobEnLJO9XYvCF2Ai2H2Fw2h9kHlk/dTdbS
	P335wanSK0l3jbymoNJ5I2PevyVkEJ+EHfrIrrgywCDRkWTXOOHCgs4ZIHMMxUSRwJvl
	G4MA==
X-Gm-Message-State: AOUpUlGpJsT7991/DIB9UNxwPQ6YXRWoh5OlyFHdTS9tpPhzw4a64gHQ
	A1/qlm5YonDZr7syZUYx8/3lzw==
X-Google-Smtp-Source: AAOMgpdGJkdJ4d/xfVk8ofLhNFHu6GzONJZPLWMBHGAsW1+3kyI/jrOaJ3hHUxfsGUgR64pLYzGLrQ==
X-Received: by 2002:a63:5d58:: with SMTP id
	o24-v6mr2980646pgm.349.1531858230598; 
	Tue, 17 Jul 2018 13:10:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1736])
	by smtp.gmail.com with ESMTPSA id
	y86-v6sm3993065pfk.84.2018.07.17.13.10.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 13:10:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 13:10:21 -0700
Message-Id: <20180717201021.1640-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] binutils: Upgrade to 2.31 release branch
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
X-List-Received-Date: Tue, 17 Jul 2018 20:10:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |    2 +-
 .../{binutils-2.30.inc => binutils-2.31.inc}  |    2 +-
 ....30.bb => binutils-cross-canadian_2.31.bb} |    0
 ...s-cross_2.30.bb => binutils-cross_2.31.bb} |    0
 ...ssdk_2.30.bb => binutils-crosssdk_2.31.bb} |    0
 ...s-crosssdk-Generate-relocatable-SDKs.patch |   12 +-
 ...o-not-generate-linker-script-directo.patch |   22 +-
 ...iden-the-regexp-for-SH-architectures.patch |   12 +-
 ...004-Point-scripts-location-to-libdir.patch |   10 +-
 ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |   10 +-
 .../binutils/0006-Use-libtool-2.4.patch       | 2296 +++++++++--------
 ...-the-armv5e-architecture-to-binutils.patch |    8 +-
 ...stro-compiler-point-to-the-wrong-ins.patch |    4 +-
 ...-system-directories-when-cross-linki.patch |   50 +-
 ...h-in-libtool-when-sysroot-is-enabled.patch |    4 +-
 ...e-default-emulation-for-mips64-linux.patch |   12 +-
 .../0012-Add-support-for-Netlogic-XLP.patch   |   80 +-
 ...ect-assembling-for-ppc-wait-mnemonic.patch |   10 +-
 .../0014-Detect-64-bit-MIPS-targets.patch     |    4 +-
 .../0015-sync-with-OE-libtool-changes.patch   |    4 +-
 .../{binutils_2.30.bb => binutils_2.31.bb}    |    0
 21 files changed, 1327 insertions(+), 1215 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.30.inc => binutils-2.31.inc} (97%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.30.bb => binutils-cross-canadian_2.31.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.30.bb => binutils-cross_2.31.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.30.bb => binutils-crosssdk_2.31.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.30.bb => binutils_2.31.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index cb17061706..24a21b5837 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -24,7 +24,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "8.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-BINUVERSION ?= "2.30%"
+BINUVERSION ?= "2.31%"
 GDBVERSION ?= "8.1%"
 GLIBCVERSION ?= "2.27%"
 LINUXLIBCVERSION ?= "4.15%"
diff --git a/meta/recipes-devtools/binutils/binutils-2.30.inc b/meta/recipes-devtools/binutils/binutils-2.31.inc
similarity index 97%
rename from meta/recipes-devtools/binutils/binutils-2.30.inc
rename to meta/recipes-devtools/binutils/binutils-2.31.inc
index 9c883acc52..ec9e9c330d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.30.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
@@ -18,7 +18,7 @@ BINUPV = "${@binutils_branch_version(d)}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "caa839fba66600a6c36d3639906ed9110b79c307"
+SRCREV ?= "f8b4d71490df766ca9c474f7ab9c82b3a8029a5a"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.30.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.31.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.30.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.31.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.30.bb b/meta/recipes-devtools/binutils/binutils-cross_2.31.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.30.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.31.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.30.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.31.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.30.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.31.bb
diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
index 2df836057d..6bdb407b1e 100644
--- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
+++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
@@ -1,4 +1,4 @@
-From 2e1b5e24a6759de7f73aa6060a574848d9131b5a Mon Sep 17 00:00:00 2001
+From 4a99f058030c86794bb96b582a7dbd631f963b06 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:58:54 +0000
 Subject: [PATCH 01/15] binutils-crosssdk: Generate relocatable SDKs
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index 8732422b3a..1f257e99ca 100755
+index 370b22269d..a5c367aa8f 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
-@@ -277,6 +277,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
+@@ -279,6 +279,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
  LD_FLAG=r
  DATA_ALIGNMENT=${DATA_ALIGNMENT_r}
  DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
@@ -29,7 +29,7 @@ index 8732422b3a..1f257e99ca 100755
  ( echo "/* Script for ld -r: link without relocation */"
    . ${CUSTOMIZER_SCRIPT}
    . ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
-@@ -285,10 +286,12 @@ DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
+@@ -287,10 +288,12 @@ DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
  LD_FLAG=u
  DATA_ALIGNMENT=${DATA_ALIGNMENT_u}
  CONSTRUCTING=" "
@@ -43,7 +43,7 @@ index 8732422b3a..1f257e99ca 100755
  DATA_ALIGNMENT=${DATA_ALIGNMENT_}
  RELOCATING=" "
 diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
-index 9787ab5dac..0c8a93c2c8 100644
+index 444aef2942..afa99f736d 100644
 --- a/ld/scripttempl/elf.sc
 +++ b/ld/scripttempl/elf.sc
 @@ -139,8 +139,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
@@ -58,5 +58,5 @@ index 9787ab5dac..0c8a93c2c8 100644
  if test -z "$PLT"; then
    IPLT=".iplt         ${RELOCATING-0} : { *(.iplt) }"
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
index bac7fb2d1a..0208213832 100644
--- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
+++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
@@ -1,4 +1,4 @@
-From 58ddf38fa53abb48b69dd76e398c73451ad1a5eb Mon Sep 17 00:00:00 2001
+From 6e78b1c88c040a742b7af82542ac7eb92eddda3d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Mar 2017 23:37:05 -0800
 Subject: [PATCH 02/15] binutils-cross: Do not generate linker script
@@ -19,14 +19,14 @@ RP 2017/01/30
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- ld/genscripts.sh | 23 -----------------------
- 1 file changed, 23 deletions(-)
+ ld/genscripts.sh | 25 -------------------------
+ 1 file changed, 25 deletions(-)
 
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index 1f257e99ca..1583b73a2b 100755
+index a5c367aa8f..6cc9eed976 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
-@@ -189,29 +189,6 @@ append_to_lib_path()
+@@ -189,31 +189,6 @@ append_to_lib_path()
    fi
  }
  
@@ -44,10 +44,12 @@ index 1f257e99ca..1583b73a2b 100755
 -    # because 64bit libraries may be in both places, depending on
 -    # cross-development setup method (e.g.: /usr/s390x-linux/lib64
 -    # vs. /usr/s390-linux/lib64)
--    case "${NATIVE}:${LIBPATH_SUFFIX}:${TOOL_LIB}" in
--      :* | *::* | *:*:*${LIBPATH_SUFFIX}) ;;
--      *) libs="${exec_prefix}/${target_alias}/lib${LIBPATH_SUFFIX}" ;;
--    esac
+-    for libpath_suffix in ${LIBPATH_SUFFIX}; do
+-      case "${NATIVE}:${libpath_suffix}:${TOOL_LIB}" in
+-	:* | *::* | *:*:*${libpath_suffix}) ;;
+-	*) libs="${exec_prefix}/${target_alias}/lib${libpath_suffix}" ;;
+-      esac
+-    done
 -    libs="${exec_prefix}/${TOOL_LIB}/lib ${libs}"
 -  fi
 -  append_to_lib_path ${libs}
@@ -57,5 +59,5 @@ index 1f257e99ca..1583b73a2b 100755
    libs=${NATIVE_LIB_DIRS}
    if [ "x${NATIVE}" = "xyes" ] ; then
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch b/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch
index 306afe7018..15193c10a6 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch
@@ -1,4 +1,4 @@
-From 5089be88f670bcadf7db0e778894f900b2c05d7b Mon Sep 17 00:00:00 2001
+From 4c6fd8f5eb9bc7c0d02f1a98ad86e395d4d2ab3b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:07:33 +0000
 Subject: [PATCH 03/15] configure: widen the regexp for SH architectures
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 2d615a9996..c4ad45c06c 100755
+index 08dd35c3ea..815e74ddb7 100755
 --- a/configure
 +++ b/configure
-@@ -3835,7 +3835,7 @@ case "${target}" in
+@@ -3855,7 +3855,7 @@ case "${target}" in
    nvptx*-*-*)
      noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
      ;;
@@ -27,10 +27,10 @@ index 2d615a9996..c4ad45c06c 100755
        sh*-*-elf)
           ;;
 diff --git a/gprof/configure b/gprof/configure
-index 1e25102976..6b43bf2b18 100755
+index 447cea7884..a730e20509 100755
 --- a/gprof/configure
 +++ b/gprof/configure
-@@ -5874,6 +5874,11 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
+@@ -6162,6 +6162,11 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
    lt_cv_deplibs_check_method=pass_all
    ;;
  
@@ -43,5 +43,5 @@ index 1e25102976..6b43bf2b18 100755
    if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
      lt_cv_deplibs_check_method='match_pattern /lib[^/]+(\.so\.[0-9]+\.[0-9]+|_pic\.a)$'
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
index 3e29c5815a..bf1c1be27d 100644
--- a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
+++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
@@ -1,4 +1,4 @@
-From a0e893ea094c48fa803046ffa89e31907aee0597 Mon Sep 17 00:00:00 2001
+From 48ad5292b10408d4e5d5739022753a7183a1cbb3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:09:58 +0000
 Subject: [PATCH 04/15] Point scripts location to libdir
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index 6243c12528..3c5d6c8202 100644
+index d86ad0940c..c95b0ef025 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
 @@ -57,7 +57,7 @@ endif
@@ -25,10 +25,10 @@ index 6243c12528..3c5d6c8202 100644
  EMUL = @EMUL@
  EMULATION_OFILES = @EMULATION_OFILES@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index 760c037f9d..6dea692869 100644
+index 4792b2b013..789df2d01b 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
-@@ -446,7 +446,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
+@@ -563,7 +563,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.
@@ -38,5 +38,5 @@ index 760c037f9d..6dea692869 100644
  BFDDIR = $(BASEDIR)/bfd
  INCDIR = $(BASEDIR)/include
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
index 2f49969371..1f589718ed 100644
--- a/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
+++ b/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
@@ -1,4 +1,4 @@
-From 518abb195d0eb47d8eef581d7fd0a5fd9fa73f7d Mon Sep 17 00:00:00 2001
+From 79e53510b1f9e16a21db312698fb1c1c442481e7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:27:17 +0000
 Subject: [PATCH 05/15] Only generate an RPATH entry if LD_RUN_PATH is not
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
-index c0925fc9b9..7d7670a89f 100644
+index 1ad9d6b6fa..6a025a45b4 100644
 --- a/ld/emultempl/elf32.em
 +++ b/ld/emultempl/elf32.em
-@@ -1470,6 +1470,8 @@ fragment <<EOF
+@@ -1471,6 +1471,8 @@ fragment <<EOF
  	      && command_line.rpath == NULL)
  	    {
  	      path = (const char *) getenv ("LD_RUN_PATH");
@@ -27,7 +27,7 @@ index c0925fc9b9..7d7670a89f 100644
  	      if (path
  		  && gld${EMULATION_NAME}_search_needed (path, &n, force))
  		break;
-@@ -1750,6 +1752,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+@@ -1751,6 +1753,8 @@ gld${EMULATION_NAME}_before_allocation (void)
    rpath = command_line.rpath;
    if (rpath == NULL)
      rpath = (const char *) getenv ("LD_RUN_PATH");
@@ -37,5 +37,5 @@ index c0925fc9b9..7d7670a89f 100644
    for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
      if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
index 333e2ee176..8550df0cb0 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
@@ -1,4 +1,4 @@
-From fad053cc59baa6277182b0fc90415a214060ba99 Mon Sep 17 00:00:00 2001
+From 11f6d2889725ad592ab789534ca9b858073df4d1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:04:07 +0000
 Subject: [PATCH 06/15] Use libtool 2.4
@@ -9,27 +9,27 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- bfd/configure        | 1318 +++++++++++++++++------
+ bfd/configure        | 1322 ++++++++++++++-----
  bfd/configure.ac     |    2 +-
- binutils/configure   | 1316 +++++++++++++++++------
- gas/configure        | 1314 +++++++++++++++++------
- gprof/configure      | 1321 +++++++++++++++++------
- ld/configure         | 1691 +++++++++++++++++++++--------
- libtool.m4           | 1080 +++++++++++++------
- ltmain.sh            | 2925 +++++++++++++++++++++++++++++++++-----------------
+ binutils/configure   | 1320 ++++++++++++++-----
+ gas/configure        | 1320 ++++++++++++++-----
+ gprof/configure      | 1327 ++++++++++++++-----
+ ld/configure         | 1695 ++++++++++++++++++------
+ libtool.m4           | 1080 +++++++++++-----
+ ltmain.sh            | 2925 ++++++++++++++++++++++++++++--------------
  ltoptions.m4         |    2 +-
  ltversion.m4         |   12 +-
  lt~obsolete.m4       |    2 +-
- opcodes/configure    | 1318 +++++++++++++++++------
+ opcodes/configure    | 1322 ++++++++++++++-----
  opcodes/configure.ac |    2 +-
- zlib/configure       | 1316 +++++++++++++++++------
- 14 files changed, 9926 insertions(+), 3693 deletions(-)
+ zlib/configure       | 1320 ++++++++++++++-----
+ 14 files changed, 9948 insertions(+), 3703 deletions(-)
 
-diff --git a/bfd/configure b/bfd/configure
-index 6c2b24ebe3..5fdd723b7f 100755
---- a/bfd/configure
-+++ b/bfd/configure
-@@ -672,6 +672,9 @@ OTOOL
+Index: git/bfd/configure
+===================================================================
+--- git.orig/bfd/configure
++++ git/bfd/configure
+@@ -704,6 +704,9 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -39,7 +39,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  OBJDUMP
  LN_S
  NM
-@@ -785,6 +788,7 @@ enable_static
+@@ -822,6 +825,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -47,7 +47,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1461,6 +1465,8 @@ Optional Packages:
+@@ -1504,6 +1508,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -56,7 +56,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
    --with-mmap             try using mmap for BFD input files if available
    --with-separate-debug-dir=DIR
                            Look for global separate debug info in DIR
-@@ -5393,8 +5399,8 @@ esac
+@@ -5693,8 +5699,8 @@ esac
  
  
  
@@ -67,7 +67,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  
  
  
-@@ -5434,7 +5440,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5734,7 +5740,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -76,7 +76,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6120,8 +6126,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6420,8 +6426,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -87,13 +87,13 @@ index 6c2b24ebe3..5fdd723b7f 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6170,6 +6176,80 @@ esac
+@@ -6470,6 +6476,80 @@ esac
  
  
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to $host format" >&5
 +$as_echo_n "checking how to convert $build file names to $host format... " >&6; }
-+if test "${lt_cv_to_host_file_cmd+set}" = set; then :
++if ${lt_cv_to_host_file_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  case $host in
@@ -140,7 +140,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to toolchain format" >&5
 +$as_echo_n "checking how to convert $build file names to toolchain format... " >&6; }
-+if test "${lt_cv_to_tool_file_cmd+set}" = set; then :
++if ${lt_cv_to_tool_file_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  #assume ordinary cross tools, or native build.
@@ -167,8 +167,8 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
- if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -6186,6 +6266,11 @@ case $reload_flag in
+ if ${lt_cv_ld_reload_flag+:} false; then :
+@@ -6486,6 +6566,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -180,7 +180,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6354,7 +6439,8 @@ mingw* | pw32*)
+@@ -6654,7 +6739,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -190,7 +190,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6508,6 +6594,21 @@ esac
+@@ -6808,6 +6894,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -212,7 +212,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6521,11 +6622,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6823,9 +6924,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -226,8 +226,6 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +
 +
 +
- 
- 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -235,7 +233,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +set dummy ${ac_tool_prefix}dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_DLLTOOL+set}" = set; then :
++if ${ac_cv_prog_DLLTOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$DLLTOOL"; then
@@ -247,7 +245,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_DLLTOOL="${ac_tool_prefix}dlltool"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -275,7 +273,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +set dummy dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_ac_ct_DLLTOOL+set}" = set; then :
++if ${ac_cv_prog_ac_ct_DLLTOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$ac_ct_DLLTOOL"; then
@@ -287,7 +285,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_ac_ct_DLLTOOL="dlltool"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -335,7 +333,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to associate runtime and link libraries" >&5
 +$as_echo_n "checking how to associate runtime and link libraries... " >&6; }
-+if test "${lt_cv_sharedlib_from_linklib_cmd+set}" = set; then :
++if ${lt_cv_sharedlib_from_linklib_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_sharedlib_from_linklib_cmd='unknown'
@@ -378,17 +376,17 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +set dummy $ac_tool_prefix$ac_prog; ac_word=$2
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
- if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6541,7 +6795,7 @@ do
+ if ${ac_cv_prog_AR+:} false; then :
+@@ -6841,7 +7095,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
-   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 -    ac_cv_prog_AR="${ac_tool_prefix}ar"
 +    ac_cv_prog_AR="$ac_tool_prefix$ac_prog"
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6561,11 +6815,15 @@ $as_echo "no" >&6; }
+@@ -6861,11 +7115,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -406,17 +404,17 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +set dummy $ac_prog; ac_word=$2
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
- if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6581,7 +6839,7 @@ do
+ if ${ac_cv_prog_ac_ct_AR+:} false; then :
+@@ -6881,7 +7139,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
-   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 -    ac_cv_prog_ac_ct_AR="ar"
 +    ac_cv_prog_ac_ct_AR="$ac_prog"
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6600,6 +6858,10 @@ else
+@@ -6900,6 +7158,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -427,7 +425,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6611,16 +6873,72 @@ ac_tool_warned=yes ;;
+@@ -6911,16 +7173,72 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -449,16 +447,16 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +
 +
 +
-+
+ 
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
-+if test "${lt_cv_ar_at_file+set}" = set; then :
++if ${lt_cv_ar_at_file+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_ar_at_file=no
 +   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 +/* end confdefs.h.  */
-+
+ 
 +int
 +main ()
 +{
@@ -491,11 +489,11 @@ index 6c2b24ebe3..5fdd723b7f 100755
  
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
@@ -504,7 +502,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  
  
  
-@@ -6962,8 +7280,8 @@ esac
+@@ -7262,8 +7580,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -515,7 +513,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6999,6 +7317,7 @@ for ac_symprfx in "" "_"; do
+@@ -7299,6 +7617,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -523,7 +521,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7040,6 +7359,18 @@ _LT_EOF
+@@ -7340,6 +7659,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -542,7 +540,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7051,7 +7382,7 @@ _LT_EOF
+@@ -7351,7 +7682,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -551,7 +549,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
    const char *name;
    void       *address;
  }
-@@ -7077,8 +7408,8 @@ static const void *lt_preloaded_setup() {
+@@ -7377,8 +7708,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -562,7 +560,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7088,8 +7419,8 @@ _LT_EOF
+@@ -7388,8 +7719,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -573,7 +571,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7126,6 +7457,16 @@ else
+@@ -7426,6 +7757,20 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -587,20 +585,17 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +
 +
 +
++
++
++
++
  
  
  
-@@ -7142,6 +7483,45 @@ fi
+@@ -7445,6 +7790,41 @@ fi
  
  
  
-+
-+
-+
-+
-+
-+
-+
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -627,16 +622,19 @@ index 6c2b24ebe3..5fdd723b7f 100755
 + *)
 +   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
 +$as_echo "${with_libtool_sysroot}" >&6; }
-+   as_fn_error "The sysroot must be an absolute path." "$LINENO" 5
++   as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
 +   ;;
 +esac
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
++
++
++
  
  
- 
-@@ -7353,6 +7733,123 @@ esac
+ # Check whether --enable-libtool-lock was given.
+@@ -7653,6 +8033,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -645,7 +643,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +set dummy ${ac_tool_prefix}mt; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_MANIFEST_TOOL+set}" = set; then :
++if ${ac_cv_prog_MANIFEST_TOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$MANIFEST_TOOL"; then
@@ -657,7 +655,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_MANIFEST_TOOL="${ac_tool_prefix}mt"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -685,7 +683,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +set dummy mt; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_ac_ct_MANIFEST_TOOL+set}" = set; then :
++if ${ac_cv_prog_ac_ct_MANIFEST_TOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$ac_ct_MANIFEST_TOOL"; then
@@ -697,7 +695,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_ac_ct_MANIFEST_TOOL="mt"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -735,7 +733,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +test -z "$MANIFEST_TOOL" && MANIFEST_TOOL=mt
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if $MANIFEST_TOOL is a manifest tool" >&5
 +$as_echo_n "checking if $MANIFEST_TOOL is a manifest tool... " >&6; }
-+if test "${lt_cv_path_mainfest_tool+set}" = set; then :
++if ${lt_cv_path_mainfest_tool+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_path_mainfest_tool=no
@@ -760,7 +758,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7916,6 +8413,8 @@ _LT_EOF
+@@ -8216,6 +8713,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -769,7 +767,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8080,7 +8579,8 @@ fi
+@@ -8380,7 +8879,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -779,7 +777,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  
  
  
-@@ -8169,7 +8669,7 @@ aix3*)
+@@ -8469,7 +8969,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -788,7 +786,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8467,8 +8967,6 @@ fi
+@@ -8767,8 +9267,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -797,7 +795,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8634,6 +9132,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8934,6 +9432,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -810,7 +808,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8696,7 +9200,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8996,7 +9500,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -819,7 +817,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8753,13 +9257,17 @@ case $host_os in
+@@ -9053,13 +9557,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -832,7 +830,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
 +$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
-+if test "${lt_cv_prog_compiler_pic+set}" = set; then :
++if ${lt_cv_prog_compiler_pic+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_prog_compiler_pic=$lt_prog_compiler_pic
@@ -843,7 +841,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8820,6 +9328,11 @@ fi
+@@ -9120,6 +9628,11 @@ fi
  
  
  
@@ -855,7 +853,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9170,7 +9683,8 @@ _LT_EOF
+@@ -9470,7 +9983,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -865,7 +863,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9269,12 +9783,12 @@ _LT_EOF
+@@ -9569,12 +10083,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -880,7 +878,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  	  fi
  	  ;;
  	esac
-@@ -9288,8 +9802,8 @@ _LT_EOF
+@@ -9588,8 +10102,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -891,7 +889,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
        fi
        ;;
  
-@@ -9307,8 +9821,8 @@ _LT_EOF
+@@ -9607,8 +10121,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -902,7 +900,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
        else
  	ld_shlibs=no
        fi
-@@ -9354,8 +9868,8 @@ _LT_EOF
+@@ -9654,8 +10168,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -913,7 +911,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
        else
  	ld_shlibs=no
        fi
-@@ -9485,7 +9999,13 @@ _LT_EOF
+@@ -9785,7 +10299,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -921,14 +919,14 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +        if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if test "${lt_cv_aix_libpath_+set}" = set; then :
++  if ${lt_cv_aix_libpath_+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
  int
-@@ -9498,22 +10018,29 @@ main ()
+@@ -9798,22 +10318,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -971,7 +969,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9525,7 +10052,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9825,7 +10352,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -979,14 +977,14 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +	 if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if test "${lt_cv_aix_libpath_+set}" = set; then :
++  if ${lt_cv_aix_libpath_+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
  int
-@@ -9538,22 +10071,29 @@ main ()
+@@ -9838,22 +10371,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -1029,7 +1027,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9598,20 +10138,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9898,20 +10438,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -1107,7 +1105,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9672,7 +10255,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9972,7 +10555,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -1116,7 +1114,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9680,7 +10263,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9980,7 +10563,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -1125,7 +1123,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9696,7 +10279,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9996,7 +10579,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -1134,7 +1132,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9720,10 +10303,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10020,10 +10603,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -1147,7 +1145,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  	  ;;
  	esac
        else
-@@ -9802,23 +10385,36 @@ fi
+@@ -10102,23 +10685,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -1162,7 +1160,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +	# This should be the same for all languages, so no per-tag cache variable.
 +	{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the $host_os linker accepts -exported_symbol" >&5
 +$as_echo_n "checking whether the $host_os linker accepts -exported_symbol... " >&6; }
-+if test "${lt_cv_irix_exported_symbol+set}" = set; then :
++if ${lt_cv_irix_exported_symbol+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  save_LDFLAGS="$LDFLAGS"
@@ -1192,7 +1190,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9903,7 +10499,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10203,7 +10799,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -1201,7 +1199,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9922,9 +10518,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10222,9 +10818,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -1213,7 +1211,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10500,8 +11096,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10800,8 +11396,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -1225,7 +1223,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10534,13 +11131,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10834,13 +11431,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -1298,7 +1296,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10632,7 +11287,7 @@ haiku*)
+@@ -10932,7 +11587,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -1307,7 +1305,16 @@ index 6c2b24ebe3..5fdd723b7f 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11472,10 +12127,10 @@ else
+@@ -11728,7 +12383,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11731 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -11772,10 +12427,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -1320,7 +1327,16 @@ index 6c2b24ebe3..5fdd723b7f 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11578,10 +12233,10 @@ else
+@@ -11834,7 +12489,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11837 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -11878,10 +12533,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -1333,7 +1349,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14172,7 +14827,7 @@ SHARED_LDFLAGS=
+@@ -14525,7 +15180,7 @@ SHARED_LDFLAGS=
  if test "$enable_shared" = "yes"; then
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -1342,7 +1358,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
    fi
  
  # More hacks to build DLLs on Windows.
-@@ -16879,13 +17534,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -17139,13 +17794,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -1363,7 +1379,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -16900,14 +17562,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17160,14 +17822,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -1382,7 +1398,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -16940,12 +17605,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -17200,12 +17865,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -1396,7 +1412,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -17000,8 +17665,13 @@ reload_flag \
+@@ -17260,8 +17925,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -1410,7 +1426,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  STRIP \
  RANLIB \
  CC \
-@@ -17011,12 +17681,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -17271,12 +17941,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -1426,7 +1442,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -17032,7 +17704,6 @@ no_undefined_flag \
+@@ -17292,7 +17964,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -1434,7 +1450,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -17068,6 +17739,7 @@ module_cmds \
+@@ -17328,6 +17999,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -1442,7 +1458,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -17847,7 +18519,8 @@ $as_echo X"$file" |
+@@ -18116,7 +18788,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -1452,7 +1468,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -17950,19 +18623,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -18219,19 +18892,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -1496,7 +1512,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -17992,6 +18688,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -18261,6 +18957,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -1509,7 +1525,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -18001,6 +18703,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -18270,6 +18972,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -1519,7 +1535,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -18115,12 +18820,12 @@ with_gcc=$GCC
+@@ -18384,12 +19089,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -1535,7 +1551,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -18207,9 +18912,6 @@ inherit_rpath=$inherit_rpath
+@@ -18476,9 +19181,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -1545,7 +1561,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -18225,6 +18927,9 @@ include_expsyms=$lt_include_expsyms
+@@ -18494,6 +19196,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -1555,7 +1571,7 @@ index 6c2b24ebe3..5fdd723b7f 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -18257,210 +18962,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -18526,210 +19231,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -1757,15 +1773,9 @@ index 6c2b24ebe3..5fdd723b7f 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -1923,17 +1933,20 @@ index 6c2b24ebe3..5fdd723b7f 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-diff --git a/bfd/configure.ac b/bfd/configure.ac
-index 2342f3faea..a6451fccda 100644
---- a/bfd/configure.ac
-+++ b/bfd/configure.ac
-@@ -254,7 +254,7 @@ changequote(,)dnl
+Index: git/bfd/configure.ac
+===================================================================
+--- git.orig/bfd/configure.ac
++++ git/bfd/configure.ac
+@@ -293,7 +293,7 @@ changequote(,)dnl
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
  changequote([,])dnl
    if test -n "$x"; then
@@ -1942,11 +1955,11 @@ index 2342f3faea..a6451fccda 100644
    fi
  
  # More hacks to build DLLs on Windows.
-diff --git a/binutils/configure b/binutils/configure
-index 5d9c9105a7..a65b2b4518 100755
---- a/binutils/configure
-+++ b/binutils/configure
-@@ -659,8 +659,11 @@ OTOOL
+Index: git/binutils/configure
+===================================================================
+--- git.orig/binutils/configure
++++ git/binutils/configure
+@@ -688,8 +688,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -1958,7 +1971,7 @@ index 5d9c9105a7..a65b2b4518 100755
  OBJDUMP
  LN_S
  NM
-@@ -772,6 +775,7 @@ enable_static
+@@ -806,6 +809,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -1966,7 +1979,7 @@ index 5d9c9105a7..a65b2b4518 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1444,6 +1448,8 @@ Optional Packages:
+@@ -1482,6 +1486,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -1975,7 +1988,7 @@ index 5d9c9105a7..a65b2b4518 100755
    --with-system-zlib      use installed libz
    --with-gnu-ld           assume the C compiler uses GNU ld default=no
    --with-libiconv-prefix[=DIR]  search for libiconv in DIR/include and DIR/lib
-@@ -5160,8 +5166,8 @@ esac
+@@ -5453,8 +5459,8 @@ esac
  
  
  
@@ -1986,7 +1999,7 @@ index 5d9c9105a7..a65b2b4518 100755
  
  
  
-@@ -5201,7 +5207,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5494,7 +5500,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -1995,7 +2008,7 @@ index 5d9c9105a7..a65b2b4518 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5887,8 +5893,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6180,8 +6186,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -2006,13 +2019,13 @@ index 5d9c9105a7..a65b2b4518 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5937,6 +5943,80 @@ esac
+@@ -6230,6 +6236,80 @@ esac
  
  
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to $host format" >&5
 +$as_echo_n "checking how to convert $build file names to $host format... " >&6; }
-+if test "${lt_cv_to_host_file_cmd+set}" = set; then :
++if ${lt_cv_to_host_file_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  case $host in
@@ -2059,7 +2072,7 @@ index 5d9c9105a7..a65b2b4518 100755
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to toolchain format" >&5
 +$as_echo_n "checking how to convert $build file names to toolchain format... " >&6; }
-+if test "${lt_cv_to_tool_file_cmd+set}" = set; then :
++if ${lt_cv_to_tool_file_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  #assume ordinary cross tools, or native build.
@@ -2086,8 +2099,8 @@ index 5d9c9105a7..a65b2b4518 100755
 +
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
- if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -5953,6 +6033,11 @@ case $reload_flag in
+ if ${lt_cv_ld_reload_flag+:} false; then :
+@@ -6246,6 +6326,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -2099,7 +2112,7 @@ index 5d9c9105a7..a65b2b4518 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6121,7 +6206,8 @@ mingw* | pw32*)
+@@ -6414,7 +6499,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -2109,7 +2122,7 @@ index 5d9c9105a7..a65b2b4518 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6275,6 +6361,21 @@ esac
+@@ -6568,6 +6654,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -2131,7 +2144,7 @@ index 5d9c9105a7..a65b2b4518 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6290,9 +6391,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6583,9 +6684,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -2150,7 +2163,7 @@ index 5d9c9105a7..a65b2b4518 100755
 +set dummy ${ac_tool_prefix}dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_DLLTOOL+set}" = set; then :
++if ${ac_cv_prog_DLLTOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$DLLTOOL"; then
@@ -2162,7 +2175,7 @@ index 5d9c9105a7..a65b2b4518 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_DLLTOOL="${ac_tool_prefix}dlltool"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -2190,7 +2203,7 @@ index 5d9c9105a7..a65b2b4518 100755
 +set dummy dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_ac_ct_DLLTOOL+set}" = set; then :
++if ${ac_cv_prog_ac_ct_DLLTOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$ac_ct_DLLTOOL"; then
@@ -2202,7 +2215,7 @@ index 5d9c9105a7..a65b2b4518 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_ac_ct_DLLTOOL="dlltool"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -2250,7 +2263,7 @@ index 5d9c9105a7..a65b2b4518 100755
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to associate runtime and link libraries" >&5
 +$as_echo_n "checking how to associate runtime and link libraries... " >&6; }
-+if test "${lt_cv_sharedlib_from_linklib_cmd+set}" = set; then :
++if ${lt_cv_sharedlib_from_linklib_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_sharedlib_from_linklib_cmd='unknown'
@@ -2295,17 +2308,17 @@ index 5d9c9105a7..a65b2b4518 100755
 +set dummy $ac_tool_prefix$ac_prog; ac_word=$2
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
- if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6308,7 +6562,7 @@ do
+ if ${ac_cv_prog_AR+:} false; then :
+@@ -6601,7 +6855,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
-   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 -    ac_cv_prog_AR="${ac_tool_prefix}ar"
 +    ac_cv_prog_AR="$ac_tool_prefix$ac_prog"
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6328,11 +6582,15 @@ $as_echo "no" >&6; }
+@@ -6621,11 +6875,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -2323,17 +2336,17 @@ index 5d9c9105a7..a65b2b4518 100755
 +set dummy $ac_prog; ac_word=$2
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
- if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6348,7 +6606,7 @@ do
+ if ${ac_cv_prog_ac_ct_AR+:} false; then :
+@@ -6641,7 +6899,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
-   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 -    ac_cv_prog_ac_ct_AR="ar"
 +    ac_cv_prog_ac_ct_AR="$ac_prog"
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6367,6 +6625,10 @@ else
+@@ -6660,6 +6918,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -2344,7 +2357,7 @@ index 5d9c9105a7..a65b2b4518 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6378,12 +6640,10 @@ ac_tool_warned=yes ;;
+@@ -6671,12 +6933,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -2359,13 +2372,13 @@ index 5d9c9105a7..a65b2b4518 100755
  
  
  
-@@ -6395,6 +6655,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6688,6 +6948,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
-+if test "${lt_cv_ar_at_file+set}" = set; then :
++if ${lt_cv_ar_at_file+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_ar_at_file=no
@@ -2424,7 +2437,7 @@ index 5d9c9105a7..a65b2b4518 100755
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -6729,8 +7047,8 @@ esac
+@@ -7022,8 +7340,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -2435,7 +2448,7 @@ index 5d9c9105a7..a65b2b4518 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6766,6 +7084,7 @@ for ac_symprfx in "" "_"; do
+@@ -7059,6 +7377,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -2443,7 +2456,7 @@ index 5d9c9105a7..a65b2b4518 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6807,6 +7126,18 @@ _LT_EOF
+@@ -7100,6 +7419,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -2462,7 +2475,7 @@ index 5d9c9105a7..a65b2b4518 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6818,7 +7149,7 @@ _LT_EOF
+@@ -7111,7 +7442,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -2471,7 +2484,7 @@ index 5d9c9105a7..a65b2b4518 100755
    const char *name;
    void       *address;
  }
-@@ -6844,8 +7175,8 @@ static const void *lt_preloaded_setup() {
+@@ -7137,8 +7468,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -2482,7 +2495,7 @@ index 5d9c9105a7..a65b2b4518 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6855,8 +7186,8 @@ _LT_EOF
+@@ -7148,8 +7479,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -2493,7 +2506,7 @@ index 5d9c9105a7..a65b2b4518 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6893,6 +7224,21 @@ else
+@@ -7186,6 +7517,18 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -2509,18 +2522,13 @@ index 5d9c9105a7..a65b2b4518 100755
 +
 +
 +
-+
-+
-+
  
  
  
-@@ -6908,6 +7254,40 @@ fi
+@@ -7207,6 +7550,43 @@ fi
  
  
  
-+
-+
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -2547,16 +2555,21 @@ index 5d9c9105a7..a65b2b4518 100755
 + *)
 +   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
 +$as_echo "${with_libtool_sysroot}" >&6; }
-+   as_fn_error "The sysroot must be an absolute path." "$LINENO" 5
++   as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
 +   ;;
 +esac
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
- 
- 
- 
-@@ -7120,6 +7500,123 @@ esac
++
++
++
++
++
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+   enableval=$enable_libtool_lock;
+@@ -7413,6 +7793,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -2565,7 +2578,7 @@ index 5d9c9105a7..a65b2b4518 100755
 +set dummy ${ac_tool_prefix}mt; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_MANIFEST_TOOL+set}" = set; then :
++if ${ac_cv_prog_MANIFEST_TOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$MANIFEST_TOOL"; then
@@ -2577,7 +2590,7 @@ index 5d9c9105a7..a65b2b4518 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_MANIFEST_TOOL="${ac_tool_prefix}mt"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -2605,7 +2618,7 @@ index 5d9c9105a7..a65b2b4518 100755
 +set dummy mt; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_ac_ct_MANIFEST_TOOL+set}" = set; then :
++if ${ac_cv_prog_ac_ct_MANIFEST_TOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$ac_ct_MANIFEST_TOOL"; then
@@ -2617,7 +2630,7 @@ index 5d9c9105a7..a65b2b4518 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_ac_ct_MANIFEST_TOOL="mt"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -2655,7 +2668,7 @@ index 5d9c9105a7..a65b2b4518 100755
 +test -z "$MANIFEST_TOOL" && MANIFEST_TOOL=mt
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if $MANIFEST_TOOL is a manifest tool" >&5
 +$as_echo_n "checking if $MANIFEST_TOOL is a manifest tool... " >&6; }
-+if test "${lt_cv_path_mainfest_tool+set}" = set; then :
++if ${lt_cv_path_mainfest_tool+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_path_mainfest_tool=no
@@ -2680,7 +2693,7 @@ index 5d9c9105a7..a65b2b4518 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7683,6 +8180,8 @@ _LT_EOF
+@@ -7976,6 +8473,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -2689,7 +2702,7 @@ index 5d9c9105a7..a65b2b4518 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7878,7 +8377,8 @@ fi
+@@ -8171,7 +8670,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -2699,7 +2712,7 @@ index 5d9c9105a7..a65b2b4518 100755
  
  
  
-@@ -7967,7 +8467,7 @@ aix3*)
+@@ -8260,7 +8760,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -2708,7 +2721,7 @@ index 5d9c9105a7..a65b2b4518 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8265,8 +8765,6 @@ fi
+@@ -8558,8 +9058,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -2717,7 +2730,7 @@ index 5d9c9105a7..a65b2b4518 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8432,6 +8930,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8725,6 +9223,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -2730,7 +2743,7 @@ index 5d9c9105a7..a65b2b4518 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8494,7 +8998,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8787,7 +9291,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -2739,7 +2752,7 @@ index 5d9c9105a7..a65b2b4518 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8551,13 +9055,17 @@ case $host_os in
+@@ -8844,13 +9348,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -2752,7 +2765,7 @@ index 5d9c9105a7..a65b2b4518 100755
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
 +$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
-+if test "${lt_cv_prog_compiler_pic+set}" = set; then :
++if ${lt_cv_prog_compiler_pic+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_prog_compiler_pic=$lt_prog_compiler_pic
@@ -2763,7 +2776,7 @@ index 5d9c9105a7..a65b2b4518 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8618,6 +9126,11 @@ fi
+@@ -8911,6 +9419,11 @@ fi
  
  
  
@@ -2775,7 +2788,7 @@ index 5d9c9105a7..a65b2b4518 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8968,7 +9481,8 @@ _LT_EOF
+@@ -9261,7 +9774,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -2785,7 +2798,7 @@ index 5d9c9105a7..a65b2b4518 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9067,12 +9581,12 @@ _LT_EOF
+@@ -9360,12 +9874,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -2800,7 +2813,7 @@ index 5d9c9105a7..a65b2b4518 100755
  	  fi
  	  ;;
  	esac
-@@ -9086,8 +9600,8 @@ _LT_EOF
+@@ -9379,8 +9893,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -2811,7 +2824,7 @@ index 5d9c9105a7..a65b2b4518 100755
        fi
        ;;
  
-@@ -9105,8 +9619,8 @@ _LT_EOF
+@@ -9398,8 +9912,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -2822,7 +2835,7 @@ index 5d9c9105a7..a65b2b4518 100755
        else
  	ld_shlibs=no
        fi
-@@ -9152,8 +9666,8 @@ _LT_EOF
+@@ -9445,8 +9959,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -2833,7 +2846,7 @@ index 5d9c9105a7..a65b2b4518 100755
        else
  	ld_shlibs=no
        fi
-@@ -9283,7 +9797,13 @@ _LT_EOF
+@@ -9576,7 +10090,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -2841,14 +2854,14 @@ index 5d9c9105a7..a65b2b4518 100755
 +        if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if test "${lt_cv_aix_libpath_+set}" = set; then :
++  if ${lt_cv_aix_libpath_+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
  int
-@@ -9296,22 +9816,29 @@ main ()
+@@ -9589,22 +10109,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -2891,7 +2904,7 @@ index 5d9c9105a7..a65b2b4518 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9323,7 +9850,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9616,7 +10143,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -2899,14 +2912,14 @@ index 5d9c9105a7..a65b2b4518 100755
 +	 if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if test "${lt_cv_aix_libpath_+set}" = set; then :
++  if ${lt_cv_aix_libpath_+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
  int
-@@ -9336,22 +9869,29 @@ main ()
+@@ -9629,22 +10162,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -2949,7 +2962,7 @@ index 5d9c9105a7..a65b2b4518 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9396,20 +9936,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9689,20 +10229,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -3027,7 +3040,7 @@ index 5d9c9105a7..a65b2b4518 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9470,7 +10053,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9763,7 +10346,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -3036,7 +3049,7 @@ index 5d9c9105a7..a65b2b4518 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9478,7 +10061,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9771,7 +10354,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -3045,7 +3058,7 @@ index 5d9c9105a7..a65b2b4518 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9494,7 +10077,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9787,7 +10370,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -3054,7 +3067,7 @@ index 5d9c9105a7..a65b2b4518 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9518,10 +10101,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9811,10 +10394,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -3067,7 +3080,7 @@ index 5d9c9105a7..a65b2b4518 100755
  	  ;;
  	esac
        else
-@@ -9600,23 +10183,36 @@ fi
+@@ -9893,23 +10476,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -3082,7 +3095,7 @@ index 5d9c9105a7..a65b2b4518 100755
 +	# This should be the same for all languages, so no per-tag cache variable.
 +	{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the $host_os linker accepts -exported_symbol" >&5
 +$as_echo_n "checking whether the $host_os linker accepts -exported_symbol... " >&6; }
-+if test "${lt_cv_irix_exported_symbol+set}" = set; then :
++if ${lt_cv_irix_exported_symbol+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  save_LDFLAGS="$LDFLAGS"
@@ -3112,7 +3125,7 @@ index 5d9c9105a7..a65b2b4518 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9701,7 +10297,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9994,7 +10590,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -3121,7 +3134,7 @@ index 5d9c9105a7..a65b2b4518 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9720,9 +10316,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10013,9 +10609,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -3133,7 +3146,7 @@ index 5d9c9105a7..a65b2b4518 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10298,8 +10894,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10591,8 +11187,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -3145,7 +3158,7 @@ index 5d9c9105a7..a65b2b4518 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10332,13 +10929,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10625,13 +11222,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -3218,7 +3231,7 @@ index 5d9c9105a7..a65b2b4518 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10430,7 +11085,7 @@ haiku*)
+@@ -10723,7 +11378,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -3227,7 +3240,16 @@ index 5d9c9105a7..a65b2b4518 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11270,10 +11925,10 @@ else
+@@ -11519,7 +12174,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11522 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -11563,10 +12218,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -3240,7 +3262,16 @@ index 5d9c9105a7..a65b2b4518 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11376,10 +12031,10 @@ else
+@@ -11625,7 +12280,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11628 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -11669,10 +12324,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -3253,7 +3284,7 @@ index 5d9c9105a7..a65b2b4518 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15446,13 +16101,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -15731,13 +16386,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -3274,7 +3305,7 @@ index 5d9c9105a7..a65b2b4518 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15467,14 +16129,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -15752,14 +16414,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -3293,7 +3324,7 @@ index 5d9c9105a7..a65b2b4518 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15507,12 +16172,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -15792,12 +16457,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -3307,7 +3338,7 @@ index 5d9c9105a7..a65b2b4518 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15567,8 +16232,13 @@ reload_flag \
+@@ -15852,8 +16517,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -3321,7 +3352,7 @@ index 5d9c9105a7..a65b2b4518 100755
  STRIP \
  RANLIB \
  CC \
-@@ -15578,12 +16248,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -15863,12 +16533,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -3337,7 +3368,7 @@ index 5d9c9105a7..a65b2b4518 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15599,7 +16271,6 @@ no_undefined_flag \
+@@ -15884,7 +16556,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -3345,7 +3376,7 @@ index 5d9c9105a7..a65b2b4518 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15635,6 +16306,7 @@ module_cmds \
+@@ -15920,6 +16591,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -3353,7 +3384,7 @@ index 5d9c9105a7..a65b2b4518 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16392,7 +17064,8 @@ $as_echo X"$file" |
+@@ -16686,7 +17358,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -3363,7 +3394,7 @@ index 5d9c9105a7..a65b2b4518 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16495,19 +17168,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -16789,19 +17462,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -3407,7 +3438,7 @@ index 5d9c9105a7..a65b2b4518 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16537,6 +17233,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -16831,6 +17527,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -3420,7 +3451,7 @@ index 5d9c9105a7..a65b2b4518 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16546,6 +17248,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -16840,6 +17542,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -3430,7 +3461,7 @@ index 5d9c9105a7..a65b2b4518 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16660,12 +17365,12 @@ with_gcc=$GCC
+@@ -16954,12 +17659,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -3446,7 +3477,7 @@ index 5d9c9105a7..a65b2b4518 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16752,9 +17457,6 @@ inherit_rpath=$inherit_rpath
+@@ -17046,9 +17751,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -3456,7 +3487,7 @@ index 5d9c9105a7..a65b2b4518 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16770,6 +17472,9 @@ include_expsyms=$lt_include_expsyms
+@@ -17064,6 +17766,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -3466,7 +3497,7 @@ index 5d9c9105a7..a65b2b4518 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16802,210 +17507,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -17096,210 +17801,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -3668,15 +3699,9 @@ index 5d9c9105a7..a65b2b4518 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -3834,17 +3859,20 @@ index 5d9c9105a7..a65b2b4518 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-diff --git a/gas/configure b/gas/configure
-index fbac8f44d5..a40ac2144f 100755
---- a/gas/configure
-+++ b/gas/configure
-@@ -650,8 +650,11 @@ OTOOL
+Index: git/gas/configure
+===================================================================
+--- git.orig/gas/configure
++++ git/gas/configure
+@@ -681,8 +681,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -3856,7 +3884,7 @@ index fbac8f44d5..a40ac2144f 100755
  OBJDUMP
  LN_S
  NM
-@@ -763,6 +766,7 @@ enable_static
+@@ -799,6 +802,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -3864,7 +3892,16 @@ index fbac8f44d5..a40ac2144f 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -4921,8 +4925,8 @@ esac
+@@ -1482,6 +1486,8 @@ Optional Packages:
+   --with-pic              try to use only PIC/non-PIC objects [default=use
+                           both]
+   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
++  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
++                        (or the compiler's sysroot if not specified).
+   --with-cpu=CPU          default cpu variant is CPU (currently only supported
+                           on ARC)
+   --with-system-zlib      use installed libz
+@@ -5269,8 +5275,8 @@ esac
  
  
  
@@ -3875,7 +3912,7 @@ index fbac8f44d5..a40ac2144f 100755
  
  
  
-@@ -4962,7 +4966,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5310,7 +5316,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -3884,7 +3921,7 @@ index fbac8f44d5..a40ac2144f 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5648,8 +5652,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5996,8 +6002,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -3895,13 +3932,13 @@ index fbac8f44d5..a40ac2144f 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5698,6 +5702,80 @@ esac
+@@ -6046,6 +6052,80 @@ esac
  
  
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to $host format" >&5
 +$as_echo_n "checking how to convert $build file names to $host format... " >&6; }
-+if test "${lt_cv_to_host_file_cmd+set}" = set; then :
++if ${lt_cv_to_host_file_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  case $host in
@@ -3948,7 +3985,7 @@ index fbac8f44d5..a40ac2144f 100755
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to toolchain format" >&5
 +$as_echo_n "checking how to convert $build file names to toolchain format... " >&6; }
-+if test "${lt_cv_to_tool_file_cmd+set}" = set; then :
++if ${lt_cv_to_tool_file_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  #assume ordinary cross tools, or native build.
@@ -3975,8 +4012,8 @@ index fbac8f44d5..a40ac2144f 100755
 +
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
- if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -5714,6 +5792,11 @@ case $reload_flag in
+ if ${lt_cv_ld_reload_flag+:} false; then :
+@@ -6062,6 +6142,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -3988,7 +4025,7 @@ index fbac8f44d5..a40ac2144f 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -5882,7 +5965,8 @@ mingw* | pw32*)
+@@ -6230,7 +6315,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -3998,7 +4035,7 @@ index fbac8f44d5..a40ac2144f 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6036,6 +6120,21 @@ esac
+@@ -6384,6 +6470,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -4020,7 +4057,7 @@ index fbac8f44d5..a40ac2144f 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6051,9 +6150,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6399,9 +6500,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -4034,12 +4071,14 @@ index fbac8f44d5..a40ac2144f 100755
 +
 +
 +
-+if test -n "$ac_tool_prefix"; then
+ if test -n "$ac_tool_prefix"; then
+-  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
+-set dummy ${ac_tool_prefix}ar; ac_word=$2
 +  # Extract the first word of "${ac_tool_prefix}dlltool", so it can be a program name with args.
 +set dummy ${ac_tool_prefix}dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_DLLTOOL+set}" = set; then :
++if ${ac_cv_prog_DLLTOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$DLLTOOL"; then
@@ -4051,7 +4090,7 @@ index fbac8f44d5..a40ac2144f 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_DLLTOOL="${ac_tool_prefix}dlltool"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -4079,7 +4118,7 @@ index fbac8f44d5..a40ac2144f 100755
 +set dummy dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_ac_ct_DLLTOOL+set}" = set; then :
++if ${ac_cv_prog_ac_ct_DLLTOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$ac_ct_DLLTOOL"; then
@@ -4091,7 +4130,7 @@ index fbac8f44d5..a40ac2144f 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_ac_ct_DLLTOOL="dlltool"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -4139,7 +4178,7 @@ index fbac8f44d5..a40ac2144f 100755
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to associate runtime and link libraries" >&5
 +$as_echo_n "checking how to associate runtime and link libraries... " >&6; }
-+if test "${lt_cv_sharedlib_from_linklib_cmd+set}" = set; then :
++if ${lt_cv_sharedlib_from_linklib_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_sharedlib_from_linklib_cmd='unknown'
@@ -4175,26 +4214,24 @@ index fbac8f44d5..a40ac2144f 100755
 +
 +
 +
- if test -n "$ac_tool_prefix"; then
--  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
--set dummy ${ac_tool_prefix}ar; ac_word=$2
++if test -n "$ac_tool_prefix"; then
 +  for ac_prog in ar
 +  do
 +    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
 +set dummy $ac_tool_prefix$ac_prog; ac_word=$2
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
- if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6069,7 +6321,7 @@ do
+ if ${ac_cv_prog_AR+:} false; then :
+@@ -6417,7 +6671,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
-   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 -    ac_cv_prog_AR="${ac_tool_prefix}ar"
 +    ac_cv_prog_AR="$ac_tool_prefix$ac_prog"
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6089,11 +6341,15 @@ $as_echo "no" >&6; }
+@@ -6437,11 +6691,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -4212,17 +4249,17 @@ index fbac8f44d5..a40ac2144f 100755
 +set dummy $ac_prog; ac_word=$2
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
- if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6109,7 +6365,7 @@ do
+ if ${ac_cv_prog_ac_ct_AR+:} false; then :
+@@ -6457,7 +6715,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
-   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 -    ac_cv_prog_ac_ct_AR="ar"
 +    ac_cv_prog_ac_ct_AR="$ac_prog"
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6128,6 +6384,10 @@ else
+@@ -6476,6 +6734,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -4233,7 +4270,7 @@ index fbac8f44d5..a40ac2144f 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6139,12 +6399,10 @@ ac_tool_warned=yes ;;
+@@ -6487,12 +6749,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -4248,13 +4285,13 @@ index fbac8f44d5..a40ac2144f 100755
  
  
  
-@@ -6156,6 +6414,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6504,6 +6764,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
-+if test "${lt_cv_ar_at_file+set}" = set; then :
++if ${lt_cv_ar_at_file+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_ar_at_file=no
@@ -4313,7 +4350,7 @@ index fbac8f44d5..a40ac2144f 100755
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -6490,8 +6806,8 @@ esac
+@@ -6838,8 +7156,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -4324,7 +4361,7 @@ index fbac8f44d5..a40ac2144f 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6527,6 +6843,7 @@ for ac_symprfx in "" "_"; do
+@@ -6875,6 +7193,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -4332,7 +4369,7 @@ index fbac8f44d5..a40ac2144f 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6568,6 +6885,18 @@ _LT_EOF
+@@ -6916,6 +7235,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -4351,7 +4388,7 @@ index fbac8f44d5..a40ac2144f 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6579,7 +6908,7 @@ _LT_EOF
+@@ -6927,7 +7258,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -4360,7 +4397,7 @@ index fbac8f44d5..a40ac2144f 100755
    const char *name;
    void       *address;
  }
-@@ -6605,8 +6934,8 @@ static const void *lt_preloaded_setup() {
+@@ -6953,8 +7284,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -4371,7 +4408,7 @@ index fbac8f44d5..a40ac2144f 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6616,8 +6945,8 @@ _LT_EOF
+@@ -6964,8 +7295,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -4382,7 +4419,7 @@ index fbac8f44d5..a40ac2144f 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6654,6 +6983,21 @@ else
+@@ -7002,6 +7333,19 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -4399,17 +4436,13 @@ index fbac8f44d5..a40ac2144f 100755
 +
 +
 +
-+
-+
  
  
  
-@@ -6669,6 +7013,40 @@ fi
+@@ -7022,6 +7366,42 @@ fi
  
  
  
-+
-+
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -4436,16 +4469,20 @@ index fbac8f44d5..a40ac2144f 100755
 + *)
 +   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
 +$as_echo "${with_libtool_sysroot}" >&6; }
-+   as_fn_error "The sysroot must be an absolute path." "$LINENO" 5
++   as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
 +   ;;
 +esac
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
++
++
++
++
  
- 
- 
-@@ -6881,6 +7259,123 @@ esac
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+@@ -7229,6 +7609,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -4454,7 +4491,7 @@ index fbac8f44d5..a40ac2144f 100755
 +set dummy ${ac_tool_prefix}mt; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_MANIFEST_TOOL+set}" = set; then :
++if ${ac_cv_prog_MANIFEST_TOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$MANIFEST_TOOL"; then
@@ -4466,7 +4503,7 @@ index fbac8f44d5..a40ac2144f 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_MANIFEST_TOOL="${ac_tool_prefix}mt"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -4494,7 +4531,7 @@ index fbac8f44d5..a40ac2144f 100755
 +set dummy mt; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_ac_ct_MANIFEST_TOOL+set}" = set; then :
++if ${ac_cv_prog_ac_ct_MANIFEST_TOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$ac_ct_MANIFEST_TOOL"; then
@@ -4506,7 +4543,7 @@ index fbac8f44d5..a40ac2144f 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_ac_ct_MANIFEST_TOOL="mt"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -4544,7 +4581,7 @@ index fbac8f44d5..a40ac2144f 100755
 +test -z "$MANIFEST_TOOL" && MANIFEST_TOOL=mt
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if $MANIFEST_TOOL is a manifest tool" >&5
 +$as_echo_n "checking if $MANIFEST_TOOL is a manifest tool... " >&6; }
-+if test "${lt_cv_path_mainfest_tool+set}" = set; then :
++if ${lt_cv_path_mainfest_tool+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_path_mainfest_tool=no
@@ -4569,7 +4606,7 @@ index fbac8f44d5..a40ac2144f 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7444,6 +7939,8 @@ _LT_EOF
+@@ -7792,6 +8289,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -4578,7 +4615,7 @@ index fbac8f44d5..a40ac2144f 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7639,7 +8136,8 @@ fi
+@@ -7987,7 +8486,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -4588,7 +4625,7 @@ index fbac8f44d5..a40ac2144f 100755
  
  
  
-@@ -7728,7 +8226,7 @@ aix3*)
+@@ -8076,7 +8576,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -4597,7 +4634,7 @@ index fbac8f44d5..a40ac2144f 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8026,8 +8524,6 @@ fi
+@@ -8374,8 +8874,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -4606,7 +4643,7 @@ index fbac8f44d5..a40ac2144f 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8193,6 +8689,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8541,6 +9039,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -4619,7 +4656,7 @@ index fbac8f44d5..a40ac2144f 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8255,7 +8757,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8603,7 +9107,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -4628,7 +4665,7 @@ index fbac8f44d5..a40ac2144f 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8312,13 +8814,17 @@ case $host_os in
+@@ -8660,13 +9164,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -4641,7 +4678,7 @@ index fbac8f44d5..a40ac2144f 100755
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
 +$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
-+if test "${lt_cv_prog_compiler_pic+set}" = set; then :
++if ${lt_cv_prog_compiler_pic+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_prog_compiler_pic=$lt_prog_compiler_pic
@@ -4652,7 +4689,7 @@ index fbac8f44d5..a40ac2144f 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8379,6 +8885,11 @@ fi
+@@ -8727,6 +9235,11 @@ fi
  
  
  
@@ -4664,7 +4701,7 @@ index fbac8f44d5..a40ac2144f 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8729,7 +9240,8 @@ _LT_EOF
+@@ -9077,7 +9590,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -4674,7 +4711,7 @@ index fbac8f44d5..a40ac2144f 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8828,12 +9340,12 @@ _LT_EOF
+@@ -9176,12 +9690,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -4689,7 +4726,7 @@ index fbac8f44d5..a40ac2144f 100755
  	  fi
  	  ;;
  	esac
-@@ -8847,8 +9359,8 @@ _LT_EOF
+@@ -9195,8 +9709,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -4700,7 +4737,7 @@ index fbac8f44d5..a40ac2144f 100755
        fi
        ;;
  
-@@ -8866,8 +9378,8 @@ _LT_EOF
+@@ -9214,8 +9728,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4711,7 +4748,7 @@ index fbac8f44d5..a40ac2144f 100755
        else
  	ld_shlibs=no
        fi
-@@ -8913,8 +9425,8 @@ _LT_EOF
+@@ -9261,8 +9775,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4722,7 +4759,7 @@ index fbac8f44d5..a40ac2144f 100755
        else
  	ld_shlibs=no
        fi
-@@ -9044,7 +9556,13 @@ _LT_EOF
+@@ -9392,7 +9906,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -4730,14 +4767,14 @@ index fbac8f44d5..a40ac2144f 100755
 +        if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if test "${lt_cv_aix_libpath_+set}" = set; then :
++  if ${lt_cv_aix_libpath_+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
  int
-@@ -9057,22 +9575,29 @@ main ()
+@@ -9405,22 +9925,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4780,7 +4817,7 @@ index fbac8f44d5..a40ac2144f 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9084,7 +9609,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9432,7 +9959,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -4788,14 +4825,14 @@ index fbac8f44d5..a40ac2144f 100755
 +	 if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if test "${lt_cv_aix_libpath_+set}" = set; then :
++  if ${lt_cv_aix_libpath_+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
  int
-@@ -9097,22 +9628,29 @@ main ()
+@@ -9445,22 +9978,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4838,7 +4875,7 @@ index fbac8f44d5..a40ac2144f 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9157,20 +9695,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9505,20 +10045,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -4916,7 +4953,7 @@ index fbac8f44d5..a40ac2144f 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9231,7 +9812,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9579,7 +10162,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -4925,7 +4962,7 @@ index fbac8f44d5..a40ac2144f 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9239,7 +9820,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9587,7 +10170,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -4934,7 +4971,7 @@ index fbac8f44d5..a40ac2144f 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9255,7 +9836,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9603,7 +10186,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -4943,7 +4980,7 @@ index fbac8f44d5..a40ac2144f 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9279,10 +9860,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9627,10 +10210,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -4956,7 +4993,7 @@ index fbac8f44d5..a40ac2144f 100755
  	  ;;
  	esac
        else
-@@ -9361,23 +9942,36 @@ fi
+@@ -9709,23 +10292,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -4971,7 +5008,7 @@ index fbac8f44d5..a40ac2144f 100755
 +	# This should be the same for all languages, so no per-tag cache variable.
 +	{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the $host_os linker accepts -exported_symbol" >&5
 +$as_echo_n "checking whether the $host_os linker accepts -exported_symbol... " >&6; }
-+if test "${lt_cv_irix_exported_symbol+set}" = set; then :
++if ${lt_cv_irix_exported_symbol+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  save_LDFLAGS="$LDFLAGS"
@@ -5001,7 +5038,7 @@ index fbac8f44d5..a40ac2144f 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9462,7 +10056,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9810,7 +10406,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -5010,7 +5047,7 @@ index fbac8f44d5..a40ac2144f 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9481,9 +10075,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9829,9 +10425,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -5022,7 +5059,7 @@ index fbac8f44d5..a40ac2144f 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10059,8 +10653,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10407,8 +11003,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -5034,7 +5071,7 @@ index fbac8f44d5..a40ac2144f 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10093,13 +10688,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10441,13 +11038,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -5107,7 +5144,7 @@ index fbac8f44d5..a40ac2144f 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10191,7 +10844,7 @@ haiku*)
+@@ -10539,7 +11194,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -5116,7 +5153,16 @@ index fbac8f44d5..a40ac2144f 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11031,10 +11684,10 @@ else
+@@ -11335,7 +11990,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11338 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -11379,10 +12034,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5129,7 +5175,16 @@ index fbac8f44d5..a40ac2144f 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11137,10 +11790,10 @@ else
+@@ -11441,7 +12096,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11444 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -11485,10 +12140,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5142,7 +5197,7 @@ index fbac8f44d5..a40ac2144f 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15437,13 +16090,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -15803,13 +16458,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -5163,7 +5218,7 @@ index fbac8f44d5..a40ac2144f 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15458,14 +16118,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -15824,14 +16486,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -5182,7 +5237,7 @@ index fbac8f44d5..a40ac2144f 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15498,12 +16161,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -15864,12 +16529,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -5196,7 +5251,7 @@ index fbac8f44d5..a40ac2144f 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15558,8 +16221,13 @@ reload_flag \
+@@ -15924,8 +16589,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -5210,7 +5265,7 @@ index fbac8f44d5..a40ac2144f 100755
  STRIP \
  RANLIB \
  CC \
-@@ -15569,12 +16237,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -15935,12 +16605,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -5226,7 +5281,7 @@ index fbac8f44d5..a40ac2144f 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15590,7 +16260,6 @@ no_undefined_flag \
+@@ -15956,7 +16628,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -5234,7 +5289,7 @@ index fbac8f44d5..a40ac2144f 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15626,6 +16295,7 @@ module_cmds \
+@@ -15992,6 +16663,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -5242,7 +5297,7 @@ index fbac8f44d5..a40ac2144f 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16390,7 +17060,8 @@ $as_echo X"$file" |
+@@ -16765,7 +17437,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -5252,7 +5307,7 @@ index fbac8f44d5..a40ac2144f 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16493,19 +17164,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -16868,19 +17541,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -5296,7 +5351,7 @@ index fbac8f44d5..a40ac2144f 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16535,6 +17229,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -16910,6 +17606,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -5309,7 +5364,7 @@ index fbac8f44d5..a40ac2144f 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16544,6 +17244,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -16919,6 +17621,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -5319,7 +5374,7 @@ index fbac8f44d5..a40ac2144f 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16658,12 +17361,12 @@ with_gcc=$GCC
+@@ -17033,12 +17738,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -5335,7 +5390,7 @@ index fbac8f44d5..a40ac2144f 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16750,9 +17453,6 @@ inherit_rpath=$inherit_rpath
+@@ -17125,9 +17830,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -5345,7 +5400,7 @@ index fbac8f44d5..a40ac2144f 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16768,6 +17468,9 @@ include_expsyms=$lt_include_expsyms
+@@ -17143,6 +17845,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -5355,7 +5410,7 @@ index fbac8f44d5..a40ac2144f 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16800,210 +17503,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -17175,210 +17880,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -5557,15 +5612,9 @@ index fbac8f44d5..a40ac2144f 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -5723,17 +5772,20 @@ index fbac8f44d5..a40ac2144f 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-diff --git a/gprof/configure b/gprof/configure
-index 6b43bf2b18..245ee48bc3 100755
---- a/gprof/configure
-+++ b/gprof/configure
-@@ -631,8 +631,11 @@ OTOOL
+Index: git/gprof/configure
+===================================================================
+--- git.orig/gprof/configure
++++ git/gprof/configure
+@@ -662,8 +662,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -5745,7 +5797,7 @@ index 6b43bf2b18..245ee48bc3 100755
  OBJDUMP
  LN_S
  NM
-@@ -744,6 +747,7 @@ enable_static
+@@ -780,6 +783,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -5753,7 +5805,7 @@ index 6b43bf2b18..245ee48bc3 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1402,6 +1406,8 @@ Optional Packages:
+@@ -1442,6 +1446,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -5762,7 +5814,7 @@ index 6b43bf2b18..245ee48bc3 100755
  
  Some influential environment variables:
    CC          C compiler command
-@@ -4836,8 +4842,8 @@ esac
+@@ -5124,8 +5130,8 @@ esac
  
  
  
@@ -5773,7 +5825,7 @@ index 6b43bf2b18..245ee48bc3 100755
  
  
  
-@@ -4877,7 +4883,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5165,7 +5171,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -5782,7 +5834,7 @@ index 6b43bf2b18..245ee48bc3 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5563,8 +5569,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5851,8 +5857,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -5793,13 +5845,13 @@ index 6b43bf2b18..245ee48bc3 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5613,6 +5619,80 @@ esac
+@@ -5901,6 +5907,80 @@ esac
  
  
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to $host format" >&5
 +$as_echo_n "checking how to convert $build file names to $host format... " >&6; }
-+if test "${lt_cv_to_host_file_cmd+set}" = set; then :
++if ${lt_cv_to_host_file_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  case $host in
@@ -5846,7 +5898,7 @@ index 6b43bf2b18..245ee48bc3 100755
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to toolchain format" >&5
 +$as_echo_n "checking how to convert $build file names to toolchain format... " >&6; }
-+if test "${lt_cv_to_tool_file_cmd+set}" = set; then :
++if ${lt_cv_to_tool_file_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  #assume ordinary cross tools, or native build.
@@ -5873,8 +5925,8 @@ index 6b43bf2b18..245ee48bc3 100755
 +
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
- if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -5629,6 +5709,11 @@ case $reload_flag in
+ if ${lt_cv_ld_reload_flag+:} false; then :
+@@ -5917,6 +5997,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -5886,7 +5938,7 @@ index 6b43bf2b18..245ee48bc3 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -5797,7 +5882,8 @@ mingw* | pw32*)
+@@ -6085,7 +6170,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -5896,7 +5948,7 @@ index 6b43bf2b18..245ee48bc3 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -5874,11 +5960,6 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
+@@ -6162,11 +6248,6 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
    lt_cv_deplibs_check_method=pass_all
    ;;
  
@@ -5908,7 +5960,7 @@ index 6b43bf2b18..245ee48bc3 100755
  netbsd*)
    if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
      lt_cv_deplibs_check_method='match_pattern /lib[^/]+(\.so\.[0-9]+\.[0-9]+|_pic\.a)$'
-@@ -5956,6 +6037,21 @@ esac
+@@ -6244,6 +6325,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -5930,7 +5982,7 @@ index 6b43bf2b18..245ee48bc3 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5971,9 +6067,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6259,9 +6355,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -5944,12 +5996,14 @@ index 6b43bf2b18..245ee48bc3 100755
 +
 +
 +
-+if test -n "$ac_tool_prefix"; then
+ if test -n "$ac_tool_prefix"; then
+-  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
+-set dummy ${ac_tool_prefix}ar; ac_word=$2
 +  # Extract the first word of "${ac_tool_prefix}dlltool", so it can be a program name with args.
 +set dummy ${ac_tool_prefix}dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_DLLTOOL+set}" = set; then :
++if ${ac_cv_prog_DLLTOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$DLLTOOL"; then
@@ -5961,7 +6015,7 @@ index 6b43bf2b18..245ee48bc3 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_DLLTOOL="${ac_tool_prefix}dlltool"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -5989,7 +6043,7 @@ index 6b43bf2b18..245ee48bc3 100755
 +set dummy dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_ac_ct_DLLTOOL+set}" = set; then :
++if ${ac_cv_prog_ac_ct_DLLTOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$ac_ct_DLLTOOL"; then
@@ -6001,7 +6055,7 @@ index 6b43bf2b18..245ee48bc3 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_ac_ct_DLLTOOL="dlltool"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -6049,7 +6103,7 @@ index 6b43bf2b18..245ee48bc3 100755
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to associate runtime and link libraries" >&5
 +$as_echo_n "checking how to associate runtime and link libraries... " >&6; }
-+if test "${lt_cv_sharedlib_from_linklib_cmd+set}" = set; then :
++if ${lt_cv_sharedlib_from_linklib_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_sharedlib_from_linklib_cmd='unknown'
@@ -6085,26 +6139,24 @@ index 6b43bf2b18..245ee48bc3 100755
 +
 +
 +
- if test -n "$ac_tool_prefix"; then
--  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
--set dummy ${ac_tool_prefix}ar; ac_word=$2
++if test -n "$ac_tool_prefix"; then
 +  for ac_prog in ar
 +  do
 +    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be a program name with args.
 +set dummy $ac_tool_prefix$ac_prog; ac_word=$2
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
- if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -5989,7 +6238,7 @@ do
+ if ${ac_cv_prog_AR+:} false; then :
+@@ -6277,7 +6526,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
-   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 -    ac_cv_prog_AR="${ac_tool_prefix}ar"
 +    ac_cv_prog_AR="$ac_tool_prefix$ac_prog"
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6009,11 +6258,15 @@ $as_echo "no" >&6; }
+@@ -6297,11 +6546,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -6122,17 +6174,17 @@ index 6b43bf2b18..245ee48bc3 100755
 +set dummy $ac_prog; ac_word=$2
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
- if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6029,7 +6282,7 @@ do
+ if ${ac_cv_prog_ac_ct_AR+:} false; then :
+@@ -6317,7 +6570,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
-   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 -    ac_cv_prog_ac_ct_AR="ar"
 +    ac_cv_prog_ac_ct_AR="$ac_prog"
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6048,6 +6301,10 @@ else
+@@ -6336,6 +6589,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -6143,7 +6195,7 @@ index 6b43bf2b18..245ee48bc3 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6059,12 +6316,10 @@ ac_tool_warned=yes ;;
+@@ -6347,16 +6604,72 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -6155,16 +6207,20 @@ index 6b43bf2b18..245ee48bc3 100755
 -test -z "$AR_FLAGS" && AR_FLAGS=cru
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
- 
- 
- 
-@@ -6076,6 +6331,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
- 
- 
- 
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
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
-+if test "${lt_cv_ar_at_file+set}" = set; then :
++if ${lt_cv_ar_at_file+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_ar_at_file=no
@@ -6174,7 +6230,7 @@ index 6b43bf2b18..245ee48bc3 100755
 +int
 +main ()
 +{
-+
+ 
 +  ;
 +  return 0;
 +}
@@ -6200,30 +6256,23 @@ index 6b43bf2b18..245ee48bc3 100755
 +        fi
 +      fi
 +      rm -f conftest.* libconftest.a
-+
+ 
 +fi
 +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
-+
+ 
 +fi
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
 +$as_echo "$lt_cv_ar_at_file" >&6; }
-+
+ 
 +if test "x$lt_cv_ar_at_file" = xno; then
 +  archiver_list_spec=
 +else
 +  archiver_list_spec=$lt_cv_ar_at_file
 +fi
-+
-+
-+
-+
-+
-+
-+
- if test -n "$ac_tool_prefix"; then
-   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
- set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -6410,8 +6723,8 @@ esac
+ 
+ 
+ 
+@@ -6698,8 +7011,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -6234,7 +6283,7 @@ index 6b43bf2b18..245ee48bc3 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6447,6 +6760,7 @@ for ac_symprfx in "" "_"; do
+@@ -6735,6 +7048,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -6242,7 +6291,7 @@ index 6b43bf2b18..245ee48bc3 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6488,6 +6802,18 @@ _LT_EOF
+@@ -6776,6 +7090,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -6261,7 +6310,7 @@ index 6b43bf2b18..245ee48bc3 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6499,7 +6825,7 @@ _LT_EOF
+@@ -6787,7 +7113,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -6270,7 +6319,7 @@ index 6b43bf2b18..245ee48bc3 100755
    const char *name;
    void       *address;
  }
-@@ -6525,8 +6851,8 @@ static const void *lt_preloaded_setup() {
+@@ -6813,8 +7139,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -6281,7 +6330,7 @@ index 6b43bf2b18..245ee48bc3 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6536,8 +6862,8 @@ _LT_EOF
+@@ -6824,8 +7150,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -6292,7 +6341,7 @@ index 6b43bf2b18..245ee48bc3 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6574,6 +6900,18 @@ else
+@@ -6862,6 +7188,17 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -6307,18 +6356,13 @@ index 6b43bf2b18..245ee48bc3 100755
 +
 +
 +
-+
  
  
  
-@@ -6590,6 +6928,43 @@ fi
+@@ -6883,6 +7220,44 @@ fi
  
  
  
-+
-+
-+
-+
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
@@ -6346,16 +6390,21 @@ index 6b43bf2b18..245ee48bc3 100755
 + *)
 +   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
 +$as_echo "${with_libtool_sysroot}" >&6; }
-+   as_fn_error "The sysroot must be an absolute path." "$LINENO" 5
++   as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
 +   ;;
 +esac
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
- 
- 
- 
-@@ -6801,6 +7176,123 @@ esac
++
++
++
++
++
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+   enableval=$enable_libtool_lock;
+@@ -7089,6 +7464,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -6364,7 +6413,7 @@ index 6b43bf2b18..245ee48bc3 100755
 +set dummy ${ac_tool_prefix}mt; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_MANIFEST_TOOL+set}" = set; then :
++if ${ac_cv_prog_MANIFEST_TOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$MANIFEST_TOOL"; then
@@ -6376,7 +6425,7 @@ index 6b43bf2b18..245ee48bc3 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_MANIFEST_TOOL="${ac_tool_prefix}mt"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -6404,7 +6453,7 @@ index 6b43bf2b18..245ee48bc3 100755
 +set dummy mt; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_ac_ct_MANIFEST_TOOL+set}" = set; then :
++if ${ac_cv_prog_ac_ct_MANIFEST_TOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$ac_ct_MANIFEST_TOOL"; then
@@ -6416,7 +6465,7 @@ index 6b43bf2b18..245ee48bc3 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_ac_ct_MANIFEST_TOOL="mt"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -6454,7 +6503,7 @@ index 6b43bf2b18..245ee48bc3 100755
 +test -z "$MANIFEST_TOOL" && MANIFEST_TOOL=mt
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if $MANIFEST_TOOL is a manifest tool" >&5
 +$as_echo_n "checking if $MANIFEST_TOOL is a manifest tool... " >&6; }
-+if test "${lt_cv_path_mainfest_tool+set}" = set; then :
++if ${lt_cv_path_mainfest_tool+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_path_mainfest_tool=no
@@ -6479,7 +6528,7 @@ index 6b43bf2b18..245ee48bc3 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7364,6 +7856,8 @@ _LT_EOF
+@@ -7652,6 +8144,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -6488,7 +6537,7 @@ index 6b43bf2b18..245ee48bc3 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7559,7 +8053,8 @@ fi
+@@ -7847,7 +8341,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -6498,7 +6547,7 @@ index 6b43bf2b18..245ee48bc3 100755
  
  
  
-@@ -7648,7 +8143,7 @@ aix3*)
+@@ -7936,7 +8431,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -6507,7 +6556,7 @@ index 6b43bf2b18..245ee48bc3 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -7946,8 +8441,6 @@ fi
+@@ -8234,8 +8729,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -6516,7 +6565,7 @@ index 6b43bf2b18..245ee48bc3 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8113,6 +8606,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8401,6 +8894,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -6529,7 +6578,7 @@ index 6b43bf2b18..245ee48bc3 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8175,7 +8674,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8463,7 +8962,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -6538,7 +6587,7 @@ index 6b43bf2b18..245ee48bc3 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8232,13 +8731,17 @@ case $host_os in
+@@ -8520,13 +9019,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -6551,7 +6600,7 @@ index 6b43bf2b18..245ee48bc3 100755
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
 +$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
-+if test "${lt_cv_prog_compiler_pic+set}" = set; then :
++if ${lt_cv_prog_compiler_pic+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_prog_compiler_pic=$lt_prog_compiler_pic
@@ -6562,7 +6611,7 @@ index 6b43bf2b18..245ee48bc3 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8299,6 +8802,11 @@ fi
+@@ -8587,6 +9090,11 @@ fi
  
  
  
@@ -6574,7 +6623,7 @@ index 6b43bf2b18..245ee48bc3 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8649,7 +9157,8 @@ _LT_EOF
+@@ -8937,7 +9445,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -6584,7 +6633,7 @@ index 6b43bf2b18..245ee48bc3 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8748,12 +9257,12 @@ _LT_EOF
+@@ -9036,12 +9545,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -6599,7 +6648,7 @@ index 6b43bf2b18..245ee48bc3 100755
  	  fi
  	  ;;
  	esac
-@@ -8767,8 +9276,8 @@ _LT_EOF
+@@ -9055,8 +9564,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -6610,7 +6659,7 @@ index 6b43bf2b18..245ee48bc3 100755
        fi
        ;;
  
-@@ -8786,8 +9295,8 @@ _LT_EOF
+@@ -9074,8 +9583,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -6621,7 +6670,7 @@ index 6b43bf2b18..245ee48bc3 100755
        else
  	ld_shlibs=no
        fi
-@@ -8833,8 +9342,8 @@ _LT_EOF
+@@ -9121,8 +9630,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -6632,7 +6681,7 @@ index 6b43bf2b18..245ee48bc3 100755
        else
  	ld_shlibs=no
        fi
-@@ -8964,7 +9473,13 @@ _LT_EOF
+@@ -9252,7 +9761,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -6640,14 +6689,14 @@ index 6b43bf2b18..245ee48bc3 100755
 +        if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if test "${lt_cv_aix_libpath_+set}" = set; then :
++  if ${lt_cv_aix_libpath_+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
  int
-@@ -8977,22 +9492,29 @@ main ()
+@@ -9265,22 +9780,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -6690,7 +6739,7 @@ index 6b43bf2b18..245ee48bc3 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9004,7 +9526,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9292,7 +9814,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -6698,14 +6747,14 @@ index 6b43bf2b18..245ee48bc3 100755
 +	 if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if test "${lt_cv_aix_libpath_+set}" = set; then :
++  if ${lt_cv_aix_libpath_+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
  int
-@@ -9017,22 +9545,29 @@ main ()
+@@ -9305,22 +9833,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -6748,7 +6797,7 @@ index 6b43bf2b18..245ee48bc3 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9077,20 +9612,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9365,20 +9900,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -6826,7 +6875,7 @@ index 6b43bf2b18..245ee48bc3 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9151,7 +9729,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9439,7 +10017,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -6835,7 +6884,7 @@ index 6b43bf2b18..245ee48bc3 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9159,7 +9737,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9447,7 +10025,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -6844,7 +6893,7 @@ index 6b43bf2b18..245ee48bc3 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9175,7 +9753,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9463,7 +10041,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -6853,7 +6902,7 @@ index 6b43bf2b18..245ee48bc3 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9199,10 +9777,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9487,10 +10065,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -6866,7 +6915,7 @@ index 6b43bf2b18..245ee48bc3 100755
  	  ;;
  	esac
        else
-@@ -9281,23 +9859,36 @@ fi
+@@ -9569,23 +10147,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -6881,7 +6930,7 @@ index 6b43bf2b18..245ee48bc3 100755
 +	# This should be the same for all languages, so no per-tag cache variable.
 +	{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the $host_os linker accepts -exported_symbol" >&5
 +$as_echo_n "checking whether the $host_os linker accepts -exported_symbol... " >&6; }
-+if test "${lt_cv_irix_exported_symbol+set}" = set; then :
++if ${lt_cv_irix_exported_symbol+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  save_LDFLAGS="$LDFLAGS"
@@ -6911,7 +6960,7 @@ index 6b43bf2b18..245ee48bc3 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9382,7 +9973,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9670,7 +10261,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -6920,7 +6969,7 @@ index 6b43bf2b18..245ee48bc3 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9401,9 +9992,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9689,9 +10280,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -6932,7 +6981,7 @@ index 6b43bf2b18..245ee48bc3 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -9979,8 +10570,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10267,8 +10858,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -6944,7 +6993,7 @@ index 6b43bf2b18..245ee48bc3 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10013,13 +10605,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10301,13 +10893,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -7017,7 +7066,7 @@ index 6b43bf2b18..245ee48bc3 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10111,7 +10761,7 @@ haiku*)
+@@ -10399,7 +11049,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -7026,7 +7075,16 @@ index 6b43bf2b18..245ee48bc3 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -10951,10 +11601,10 @@ else
+@@ -11195,7 +11845,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11193 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -11239,10 +11889,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -7039,7 +7097,16 @@ index 6b43bf2b18..245ee48bc3 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11057,10 +11707,10 @@ else
+@@ -11301,7 +11951,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11299 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -11345,10 +11995,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -7052,7 +7119,7 @@ index 6b43bf2b18..245ee48bc3 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -13005,13 +13655,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -13314,13 +13964,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -7073,7 +7140,7 @@ index 6b43bf2b18..245ee48bc3 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13026,14 +13683,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -13335,14 +13992,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -7092,7 +7159,7 @@ index 6b43bf2b18..245ee48bc3 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13066,12 +13726,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -13375,12 +14035,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -7106,7 +7173,7 @@ index 6b43bf2b18..245ee48bc3 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -13126,8 +13786,13 @@ reload_flag \
+@@ -13435,8 +14095,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -7120,7 +7187,7 @@ index 6b43bf2b18..245ee48bc3 100755
  STRIP \
  RANLIB \
  CC \
-@@ -13137,12 +13802,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -13446,12 +14111,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -7136,7 +7203,7 @@ index 6b43bf2b18..245ee48bc3 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -13158,7 +13825,6 @@ no_undefined_flag \
+@@ -13467,7 +14134,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -7144,7 +7211,7 @@ index 6b43bf2b18..245ee48bc3 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13194,6 +13860,7 @@ module_cmds \
+@@ -13503,6 +14169,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -7152,7 +7219,7 @@ index 6b43bf2b18..245ee48bc3 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -13950,7 +14617,8 @@ $as_echo X"$file" |
+@@ -14268,7 +14935,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -7162,7 +7229,7 @@ index 6b43bf2b18..245ee48bc3 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -14053,19 +14721,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -14371,19 +15039,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -7206,7 +7273,7 @@ index 6b43bf2b18..245ee48bc3 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14095,6 +14786,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -14413,6 +15104,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -7219,7 +7286,7 @@ index 6b43bf2b18..245ee48bc3 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -14104,6 +14801,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -14422,6 +15119,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -7229,7 +7296,7 @@ index 6b43bf2b18..245ee48bc3 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14218,12 +14918,12 @@ with_gcc=$GCC
+@@ -14536,12 +15236,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -7245,7 +7312,7 @@ index 6b43bf2b18..245ee48bc3 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -14310,9 +15010,6 @@ inherit_rpath=$inherit_rpath
+@@ -14628,9 +15328,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -7255,7 +7322,7 @@ index 6b43bf2b18..245ee48bc3 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -14328,6 +15025,9 @@ include_expsyms=$lt_include_expsyms
+@@ -14646,6 +15343,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -7265,7 +7332,7 @@ index 6b43bf2b18..245ee48bc3 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -14360,210 +15060,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -14678,210 +15378,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -7467,15 +7534,9 @@ index 6b43bf2b18..245ee48bc3 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -7633,17 +7694,20 @@ index 6b43bf2b18..245ee48bc3 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-diff --git a/ld/configure b/ld/configure
-index 0cc6e8a50f..db8b998722 100755
---- a/ld/configure
-+++ b/ld/configure
-@@ -655,8 +655,11 @@ OTOOL
+Index: git/ld/configure
+===================================================================
+--- git.orig/ld/configure
++++ git/ld/configure
+@@ -687,8 +687,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -7655,7 +7719,7 @@ index 0cc6e8a50f..db8b998722 100755
  OBJDUMP
  LN_S
  NM
-@@ -778,6 +781,7 @@ enable_static
+@@ -815,6 +818,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -7663,7 +7727,7 @@ index 0cc6e8a50f..db8b998722 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1464,6 +1468,8 @@ Optional Packages:
+@@ -1507,6 +1511,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -7672,7 +7736,7 @@ index 0cc6e8a50f..db8b998722 100755
    --with-lib-path=dir1:dir2...  set default LIB_PATH
    --with-sysroot=DIR Search for usr/lib et al within DIR.
  
-@@ -5658,8 +5664,8 @@ esac
+@@ -5959,8 +5965,8 @@ esac
  
  
  
@@ -7683,7 +7747,7 @@ index 0cc6e8a50f..db8b998722 100755
  
  
  
-@@ -5699,7 +5705,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -6000,7 +6006,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -7692,7 +7756,7 @@ index 0cc6e8a50f..db8b998722 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6385,8 +6391,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6686,8 +6692,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -7703,13 +7767,13 @@ index 0cc6e8a50f..db8b998722 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6435,6 +6441,80 @@ esac
+@@ -6736,6 +6742,80 @@ esac
  
  
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to $host format" >&5
 +$as_echo_n "checking how to convert $build file names to $host format... " >&6; }
-+if test "${lt_cv_to_host_file_cmd+set}" = set; then :
++if ${lt_cv_to_host_file_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  case $host in
@@ -7756,7 +7820,7 @@ index 0cc6e8a50f..db8b998722 100755
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to toolchain format" >&5
 +$as_echo_n "checking how to convert $build file names to toolchain format... " >&6; }
-+if test "${lt_cv_to_tool_file_cmd+set}" = set; then :
++if ${lt_cv_to_tool_file_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  #assume ordinary cross tools, or native build.
@@ -7783,8 +7847,8 @@ index 0cc6e8a50f..db8b998722 100755
 +
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
- if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -6451,6 +6531,11 @@ case $reload_flag in
+ if ${lt_cv_ld_reload_flag+:} false; then :
+@@ -6752,6 +6832,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -7796,7 +7860,7 @@ index 0cc6e8a50f..db8b998722 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6619,7 +6704,8 @@ mingw* | pw32*)
+@@ -6920,7 +7005,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -7806,7 +7870,7 @@ index 0cc6e8a50f..db8b998722 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6773,6 +6859,21 @@ esac
+@@ -7074,6 +7160,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -7828,7 +7892,7 @@ index 0cc6e8a50f..db8b998722 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6788,9 +6889,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -7089,9 +7190,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -7847,7 +7911,7 @@ index 0cc6e8a50f..db8b998722 100755
 +set dummy ${ac_tool_prefix}dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_DLLTOOL+set}" = set; then :
++if ${ac_cv_prog_DLLTOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$DLLTOOL"; then
@@ -7859,7 +7923,7 @@ index 0cc6e8a50f..db8b998722 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_DLLTOOL="${ac_tool_prefix}dlltool"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -7887,7 +7951,7 @@ index 0cc6e8a50f..db8b998722 100755
 +set dummy dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_ac_ct_DLLTOOL+set}" = set; then :
++if ${ac_cv_prog_ac_ct_DLLTOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$ac_ct_DLLTOOL"; then
@@ -7899,7 +7963,7 @@ index 0cc6e8a50f..db8b998722 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_ac_ct_DLLTOOL="dlltool"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -7947,7 +8011,7 @@ index 0cc6e8a50f..db8b998722 100755
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to associate runtime and link libraries" >&5
 +$as_echo_n "checking how to associate runtime and link libraries... " >&6; }
-+if test "${lt_cv_sharedlib_from_linklib_cmd+set}" = set; then :
++if ${lt_cv_sharedlib_from_linklib_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_sharedlib_from_linklib_cmd='unknown'
@@ -7992,17 +8056,17 @@ index 0cc6e8a50f..db8b998722 100755
 +set dummy $ac_tool_prefix$ac_prog; ac_word=$2
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
- if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6806,7 +7060,7 @@ do
+ if ${ac_cv_prog_AR+:} false; then :
+@@ -7107,7 +7361,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
-   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 -    ac_cv_prog_AR="${ac_tool_prefix}ar"
 +    ac_cv_prog_AR="$ac_tool_prefix$ac_prog"
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6826,11 +7080,15 @@ $as_echo "no" >&6; }
+@@ -7127,11 +7381,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -8020,17 +8084,17 @@ index 0cc6e8a50f..db8b998722 100755
 +set dummy $ac_prog; ac_word=$2
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
- if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6846,7 +7104,7 @@ do
+ if ${ac_cv_prog_ac_ct_AR+:} false; then :
+@@ -7147,7 +7405,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
-   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 -    ac_cv_prog_ac_ct_AR="ar"
 +    ac_cv_prog_ac_ct_AR="$ac_prog"
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6865,6 +7123,10 @@ else
+@@ -7166,6 +7424,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -8041,7 +8105,7 @@ index 0cc6e8a50f..db8b998722 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6876,12 +7138,12 @@ ac_tool_warned=yes ;;
+@@ -7177,12 +7439,11 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -8054,17 +8118,16 @@ index 0cc6e8a50f..db8b998722 100755
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
 +
-+
  
  
  
-@@ -6891,6 +7153,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -7193,6 +7454,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
-+if test "${lt_cv_ar_at_file+set}" = set; then :
++if ${lt_cv_ar_at_file+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_ar_at_file=no
@@ -8118,10 +8181,11 @@ index 0cc6e8a50f..db8b998722 100755
 +
 +
 +
- 
++
  
  if test -n "$ac_tool_prefix"; then
-@@ -7227,8 +7545,8 @@ esac
+   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
+@@ -7528,8 +7846,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -8132,7 +8196,7 @@ index 0cc6e8a50f..db8b998722 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7264,6 +7582,7 @@ for ac_symprfx in "" "_"; do
+@@ -7565,6 +7883,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -8140,7 +8204,7 @@ index 0cc6e8a50f..db8b998722 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7305,6 +7624,18 @@ _LT_EOF
+@@ -7606,6 +7925,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -8159,7 +8223,7 @@ index 0cc6e8a50f..db8b998722 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7316,7 +7647,7 @@ _LT_EOF
+@@ -7617,7 +7948,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -8168,7 +8232,7 @@ index 0cc6e8a50f..db8b998722 100755
    const char *name;
    void       *address;
  }
-@@ -7342,8 +7673,8 @@ static const void *lt_preloaded_setup() {
+@@ -7643,8 +7974,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -8179,7 +8243,7 @@ index 0cc6e8a50f..db8b998722 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7353,8 +7684,8 @@ _LT_EOF
+@@ -7654,8 +7985,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -8190,7 +8254,7 @@ index 0cc6e8a50f..db8b998722 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7391,6 +7722,19 @@ else
+@@ -7692,6 +8023,13 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -8201,19 +8265,14 @@ index 0cc6e8a50f..db8b998722 100755
 +  nm_file_list_spec='@'
 +fi
 +
-+
-+
-+
-+
-+
-+
  
  
  
-@@ -7404,6 +7748,42 @@ fi
+@@ -7713,6 +8051,48 @@ fi
  
  
  
++
 +
 +
 +
@@ -8244,16 +8303,21 @@ index 0cc6e8a50f..db8b998722 100755
 + *)
 +   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
 +$as_echo "${with_libtool_sysroot}" >&6; }
-+   as_fn_error "The sysroot must be an absolute path." "$LINENO" 5
++   as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
 +   ;;
 +esac
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
- 
- 
- 
-@@ -7618,6 +7998,123 @@ esac
++
++
++
++
++
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+   enableval=$enable_libtool_lock;
+@@ -7919,6 +8299,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -8262,7 +8326,7 @@ index 0cc6e8a50f..db8b998722 100755
 +set dummy ${ac_tool_prefix}mt; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_MANIFEST_TOOL+set}" = set; then :
++if ${ac_cv_prog_MANIFEST_TOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$MANIFEST_TOOL"; then
@@ -8274,7 +8338,7 @@ index 0cc6e8a50f..db8b998722 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_MANIFEST_TOOL="${ac_tool_prefix}mt"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -8302,7 +8366,7 @@ index 0cc6e8a50f..db8b998722 100755
 +set dummy mt; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_ac_ct_MANIFEST_TOOL+set}" = set; then :
++if ${ac_cv_prog_ac_ct_MANIFEST_TOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$ac_ct_MANIFEST_TOOL"; then
@@ -8314,7 +8378,7 @@ index 0cc6e8a50f..db8b998722 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_ac_ct_MANIFEST_TOOL="mt"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -8352,7 +8416,7 @@ index 0cc6e8a50f..db8b998722 100755
 +test -z "$MANIFEST_TOOL" && MANIFEST_TOOL=mt
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if $MANIFEST_TOOL is a manifest tool" >&5
 +$as_echo_n "checking if $MANIFEST_TOOL is a manifest tool... " >&6; }
-+if test "${lt_cv_path_mainfest_tool+set}" = set; then :
++if ${lt_cv_path_mainfest_tool+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_path_mainfest_tool=no
@@ -8377,7 +8441,7 @@ index 0cc6e8a50f..db8b998722 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -8181,6 +8678,8 @@ _LT_EOF
+@@ -8482,6 +8979,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -8386,7 +8450,7 @@ index 0cc6e8a50f..db8b998722 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8249,6 +8748,16 @@ done
+@@ -8550,6 +9049,16 @@ done
  
  
  
@@ -8403,7 +8467,7 @@ index 0cc6e8a50f..db8b998722 100755
  
  
  # Set options
-@@ -8377,7 +8886,8 @@ fi
+@@ -8678,7 +9187,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -8413,7 +8477,7 @@ index 0cc6e8a50f..db8b998722 100755
  
  
  
-@@ -8466,7 +8976,7 @@ aix3*)
+@@ -8767,7 +9277,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -8422,7 +8486,7 @@ index 0cc6e8a50f..db8b998722 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8764,8 +9274,6 @@ fi
+@@ -9065,8 +9575,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -8431,7 +8495,7 @@ index 0cc6e8a50f..db8b998722 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8931,6 +9439,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -9232,6 +9740,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -8444,7 +8508,7 @@ index 0cc6e8a50f..db8b998722 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8993,7 +9507,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -9294,7 +9808,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -8453,7 +8517,7 @@ index 0cc6e8a50f..db8b998722 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -9050,13 +9564,17 @@ case $host_os in
+@@ -9351,13 +9865,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -8466,7 +8530,7 @@ index 0cc6e8a50f..db8b998722 100755
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
 +$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
-+if test "${lt_cv_prog_compiler_pic+set}" = set; then :
++if ${lt_cv_prog_compiler_pic+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_prog_compiler_pic=$lt_prog_compiler_pic
@@ -8477,7 +8541,7 @@ index 0cc6e8a50f..db8b998722 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9117,6 +9635,11 @@ fi
+@@ -9418,6 +9936,11 @@ fi
  
  
  
@@ -8489,7 +8553,7 @@ index 0cc6e8a50f..db8b998722 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9467,7 +9990,8 @@ _LT_EOF
+@@ -9768,7 +10291,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -8499,7 +8563,7 @@ index 0cc6e8a50f..db8b998722 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9566,12 +10090,12 @@ _LT_EOF
+@@ -9867,12 +10391,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -8514,7 +8578,7 @@ index 0cc6e8a50f..db8b998722 100755
  	  fi
  	  ;;
  	esac
-@@ -9585,8 +10109,8 @@ _LT_EOF
+@@ -9886,8 +10410,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -8525,7 +8589,7 @@ index 0cc6e8a50f..db8b998722 100755
        fi
        ;;
  
-@@ -9604,8 +10128,8 @@ _LT_EOF
+@@ -9905,8 +10429,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8536,7 +8600,7 @@ index 0cc6e8a50f..db8b998722 100755
        else
  	ld_shlibs=no
        fi
-@@ -9651,8 +10175,8 @@ _LT_EOF
+@@ -9952,8 +10476,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8547,7 +8611,7 @@ index 0cc6e8a50f..db8b998722 100755
        else
  	ld_shlibs=no
        fi
-@@ -9782,7 +10306,13 @@ _LT_EOF
+@@ -10083,7 +10607,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -8555,14 +8619,14 @@ index 0cc6e8a50f..db8b998722 100755
 +        if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if test "${lt_cv_aix_libpath_+set}" = set; then :
++  if ${lt_cv_aix_libpath_+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
  int
-@@ -9795,22 +10325,29 @@ main ()
+@@ -10096,22 +10626,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8605,7 +8669,7 @@ index 0cc6e8a50f..db8b998722 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9822,7 +10359,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10123,7 +10660,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -8613,14 +8677,14 @@ index 0cc6e8a50f..db8b998722 100755
 +	 if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if test "${lt_cv_aix_libpath_+set}" = set; then :
++  if ${lt_cv_aix_libpath_+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
  int
-@@ -9835,22 +10378,29 @@ main ()
+@@ -10136,22 +10679,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8663,11 +8727,10 @@ index 0cc6e8a50f..db8b998722 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9894,21 +10444,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
-       # When not using gcc, we currently assume that we are using
+@@ -10196,20 +10746,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
--      # no search path for DLLs.
+       # no search path for DLLs.
 -      hardcode_libdir_flag_spec=' '
 -      allow_undefined_flag=unsupported
 -      # Tell ltmain to make .lib files, not .a files.
@@ -8682,7 +8745,6 @@ index 0cc6e8a50f..db8b998722 100755
 -      old_archive_cmds='lib -OUT:$oldlib$oldobjs$old_deplibs'
 -      fix_srcfile_path='`cygpath -w "$srcfile"`'
 -      enable_shared_with_static_runtimes=yes
-+      # no search path for DLLs.
 +      case $cc_basename in
 +      cl*)
 +	# Native MSVC
@@ -8743,7 +8805,7 @@ index 0cc6e8a50f..db8b998722 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9969,7 +10562,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10270,7 +10863,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -8752,7 +8814,7 @@ index 0cc6e8a50f..db8b998722 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9977,7 +10570,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10278,7 +10871,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -8761,7 +8823,7 @@ index 0cc6e8a50f..db8b998722 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9993,7 +10586,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10294,7 +10887,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -8770,7 +8832,7 @@ index 0cc6e8a50f..db8b998722 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10017,10 +10610,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10318,10 +10911,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -8783,7 +8845,7 @@ index 0cc6e8a50f..db8b998722 100755
  	  ;;
  	esac
        else
-@@ -10099,23 +10692,36 @@ fi
+@@ -10400,23 +10993,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -8798,7 +8860,7 @@ index 0cc6e8a50f..db8b998722 100755
 +	# This should be the same for all languages, so no per-tag cache variable.
 +	{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the $host_os linker accepts -exported_symbol" >&5
 +$as_echo_n "checking whether the $host_os linker accepts -exported_symbol... " >&6; }
-+if test "${lt_cv_irix_exported_symbol+set}" = set; then :
++if ${lt_cv_irix_exported_symbol+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  save_LDFLAGS="$LDFLAGS"
@@ -8828,7 +8890,7 @@ index 0cc6e8a50f..db8b998722 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10200,7 +10806,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10501,7 +11107,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -8837,7 +8899,7 @@ index 0cc6e8a50f..db8b998722 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10219,9 +10825,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10520,9 +11126,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -8849,7 +8911,7 @@ index 0cc6e8a50f..db8b998722 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10797,8 +11403,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -11098,8 +11704,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -8861,7 +8923,7 @@ index 0cc6e8a50f..db8b998722 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10831,13 +11438,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -11132,13 +11739,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -8934,7 +8996,7 @@ index 0cc6e8a50f..db8b998722 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10929,7 +11594,7 @@ haiku*)
+@@ -11230,7 +11895,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -8943,7 +9005,16 @@ index 0cc6e8a50f..db8b998722 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11769,10 +12434,10 @@ else
+@@ -12026,7 +12691,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 12029 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -12070,10 +12735,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -8956,7 +9027,16 @@ index 0cc6e8a50f..db8b998722 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11875,10 +12540,10 @@ else
+@@ -12132,7 +12797,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 12135 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -12176,10 +12841,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -8969,7 +9049,7 @@ index 0cc6e8a50f..db8b998722 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12270,6 +12935,7 @@ $RM -r conftest*
+@@ -12571,6 +13236,7 @@ $RM -r conftest*
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -8977,7 +9057,7 @@ index 0cc6e8a50f..db8b998722 100755
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -12287,6 +12953,7 @@ $RM -r conftest*
+@@ -12588,6 +13254,7 @@ $RM -r conftest*
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -8985,7 +9065,7 @@ index 0cc6e8a50f..db8b998722 100755
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -12569,7 +13236,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -12870,7 +13537,13 @@ $as_echo_n "checking whether the $compil
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -8993,14 +9073,14 @@ index 0cc6e8a50f..db8b998722 100755
 +          if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if test "${lt_cv_aix_libpath__CXX+set}" = set; then :
++  if ${lt_cv_aix_libpath__CXX+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
  int
-@@ -12582,22 +13255,29 @@ main ()
+@@ -12883,22 +13556,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9043,7 +9123,7 @@ index 0cc6e8a50f..db8b998722 100755
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -12610,7 +13290,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12911,7 +13591,13 @@ if test -z "$aix_libpath"; then aix_libp
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -9051,14 +9131,14 @@ index 0cc6e8a50f..db8b998722 100755
 +	    if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if test "${lt_cv_aix_libpath__CXX+set}" = set; then :
++  if ${lt_cv_aix_libpath__CXX+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
  int
-@@ -12623,22 +13309,29 @@ main ()
+@@ -12924,22 +13610,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9101,7 +9181,7 @@ index 0cc6e8a50f..db8b998722 100755
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -12681,29 +13374,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12982,29 +13675,75 @@ if test -z "$aix_libpath"; then aix_libp
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -9200,7 +9280,7 @@ index 0cc6e8a50f..db8b998722 100755
        darwin* | rhapsody*)
  
  
-@@ -12809,7 +13548,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13110,7 +13849,7 @@ if test -z "$aix_libpath"; then aix_libp
              ;;
            *)
              if test "$GXX" = yes; then
@@ -9209,7 +9289,7 @@ index 0cc6e8a50f..db8b998722 100755
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -12880,10 +13619,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13181,10 +13920,10 @@ if test -z "$aix_libpath"; then aix_libp
  	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -9222,7 +9302,7 @@ index 0cc6e8a50f..db8b998722 100755
  	            ;;
  	        esac
  	      fi
-@@ -12924,9 +13663,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13225,9 +13964,9 @@ if test -z "$aix_libpath"; then aix_libp
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -9234,7 +9314,7 @@ index 0cc6e8a50f..db8b998722 100755
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -12996,20 +13735,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13297,20 +14036,20 @@ if test -z "$aix_libpath"; then aix_libp
  	      prelink_cmds_CXX='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -9259,7 +9339,7 @@ index 0cc6e8a50f..db8b998722 100755
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -13204,7 +13943,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13505,7 +14244,7 @@ if test -z "$aix_libpath"; then aix_libp
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -9268,7 +9348,7 @@ index 0cc6e8a50f..db8b998722 100755
  		  ;;
  	      esac
  
-@@ -13250,7 +13989,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13551,7 +14290,7 @@ if test -z "$aix_libpath"; then aix_libp
  
        solaris*)
          case $cc_basename in
@@ -9277,7 +9357,7 @@ index 0cc6e8a50f..db8b998722 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13291,9 +14030,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13592,9 +14331,9 @@ if test -z "$aix_libpath"; then aix_libp
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -9289,7 +9369,7 @@ index 0cc6e8a50f..db8b998722 100755
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -13428,6 +14167,13 @@ private:
+@@ -13729,6 +14468,13 @@ private:
  };
  _LT_EOF
  
@@ -9303,7 +9383,7 @@ index 0cc6e8a50f..db8b998722 100755
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13441,7 +14187,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13742,7 +14488,7 @@ if { { eval echo "\"\$as_me\":${as_linen
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -9312,7 +9392,7 @@ index 0cc6e8a50f..db8b998722 100755
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13450,13 +14196,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13751,13 +14497,22 @@ if { { eval echo "\"\$as_me\":${as_linen
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -9339,7 +9419,7 @@ index 0cc6e8a50f..db8b998722 100755
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -13476,8 +14231,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13777,8 +14532,10 @@ if { { eval echo "\"\$as_me\":${as_linen
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -9350,7 +9430,7 @@ index 0cc6e8a50f..db8b998722 100755
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -13513,6 +14270,7 @@ else
+@@ -13814,6 +14571,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -9358,7 +9438,7 @@ index 0cc6e8a50f..db8b998722 100755
  
  # PORTME: override above test on systems where it is broken
  case $host_os in
-@@ -13548,7 +14306,7 @@ linux*)
+@@ -13849,7 +14607,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -9367,7 +9447,7 @@ index 0cc6e8a50f..db8b998722 100755
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -13613,8 +14371,6 @@ fi
+@@ -13914,8 +14672,6 @@ fi
  lt_prog_compiler_pic_CXX=
  lt_prog_compiler_static_CXX=
  
@@ -9376,7 +9456,7 @@ index 0cc6e8a50f..db8b998722 100755
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -13719,6 +14475,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -14020,6 +14776,11 @@ $as_echo_n "checking for $compiler optio
  	  ;;
  	esac
  	;;
@@ -9388,7 +9468,7 @@ index 0cc6e8a50f..db8b998722 100755
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -13871,7 +14632,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -14172,7 +14933,7 @@ $as_echo_n "checking for $compiler optio
  	;;
        solaris*)
  	case $cc_basename in
@@ -9397,7 +9477,7 @@ index 0cc6e8a50f..db8b998722 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    lt_prog_compiler_pic_CXX='-KPIC'
  	    lt_prog_compiler_static_CXX='-Bstatic'
-@@ -13936,10 +14697,17 @@ case $host_os in
+@@ -14237,10 +14998,17 @@ case $host_os in
      lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
      ;;
  esac
@@ -9407,7 +9487,7 @@ index 0cc6e8a50f..db8b998722 100755
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
 +$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
-+if test "${lt_cv_prog_compiler_pic_CXX+set}" = set; then :
++if ${lt_cv_prog_compiler_pic_CXX+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_prog_compiler_pic_CXX=$lt_prog_compiler_pic_CXX
@@ -9418,7 +9498,7 @@ index 0cc6e8a50f..db8b998722 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -13997,6 +14765,8 @@ fi
+@@ -14298,6 +15066,8 @@ fi
  
  
  
@@ -9427,7 +9507,7 @@ index 0cc6e8a50f..db8b998722 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -14174,6 +14944,7 @@ fi
+@@ -14475,6 +15245,7 @@ fi
  $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
  
    export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -9435,7 +9515,7 @@ index 0cc6e8a50f..db8b998722 100755
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -14188,15 +14959,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -14489,15 +15260,20 @@ $as_echo_n "checking whether the $compil
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -9461,7 +9541,7 @@ index 0cc6e8a50f..db8b998722 100755
  
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
  $as_echo "$ld_shlibs_CXX" >&6; }
-@@ -14459,8 +15235,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14760,8 +15536,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -9473,7 +9553,7 @@ index 0cc6e8a50f..db8b998722 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -14492,13 +15269,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14793,13 +15570,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -9546,7 +9626,7 @@ index 0cc6e8a50f..db8b998722 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -14589,7 +15424,7 @@ haiku*)
+@@ -14890,7 +15725,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -9555,7 +9635,7 @@ index 0cc6e8a50f..db8b998722 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -15048,6 +15883,7 @@ fi
+@@ -15349,6 +16184,7 @@ fi
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -9563,7 +9643,7 @@ index 0cc6e8a50f..db8b998722 100755
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -18083,13 +18919,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -18444,13 +19280,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -9584,7 +9664,7 @@ index 0cc6e8a50f..db8b998722 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -18104,14 +18947,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -18465,14 +19308,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -9603,7 +9683,7 @@ index 0cc6e8a50f..db8b998722 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -18144,12 +18990,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -18505,12 +19351,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -9617,7 +9697,7 @@ index 0cc6e8a50f..db8b998722 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -18188,8 +19034,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
+@@ -18549,8 +19395,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archi
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9627,7 +9707,7 @@ index 0cc6e8a50f..db8b998722 100755
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18216,12 +19062,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
+@@ -18577,12 +19423,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$har
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9641,7 +9721,7 @@ index 0cc6e8a50f..db8b998722 100755
  file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
  hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
  compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18259,8 +19105,13 @@ reload_flag \
+@@ -18620,8 +19466,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -9655,7 +9735,7 @@ index 0cc6e8a50f..db8b998722 100755
  STRIP \
  RANLIB \
  CC \
-@@ -18270,12 +19121,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -18631,12 +19482,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -9671,7 +9751,7 @@ index 0cc6e8a50f..db8b998722 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -18291,7 +19144,6 @@ no_undefined_flag \
+@@ -18652,7 +19505,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -9679,7 +9759,7 @@ index 0cc6e8a50f..db8b998722 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -18313,8 +19165,8 @@ LD_CXX \
+@@ -18674,8 +19526,8 @@ LD_CXX \
  reload_flag_CXX \
  compiler_CXX \
  lt_prog_compiler_no_builtin_flag_CXX \
@@ -9689,7 +9769,7 @@ index 0cc6e8a50f..db8b998722 100755
  lt_prog_compiler_static_CXX \
  lt_cv_prog_compiler_c_o_CXX \
  export_dynamic_flag_spec_CXX \
-@@ -18326,7 +19178,6 @@ no_undefined_flag_CXX \
+@@ -18687,7 +19539,6 @@ no_undefined_flag_CXX \
  hardcode_libdir_flag_spec_CXX \
  hardcode_libdir_flag_spec_ld_CXX \
  hardcode_libdir_separator_CXX \
@@ -9697,7 +9777,7 @@ index 0cc6e8a50f..db8b998722 100755
  exclude_expsyms_CXX \
  include_expsyms_CXX \
  file_list_spec_CXX \
-@@ -18360,6 +19211,7 @@ module_cmds \
+@@ -18721,6 +19572,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -9705,7 +9785,7 @@ index 0cc6e8a50f..db8b998722 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18374,7 +19226,8 @@ archive_expsym_cmds_CXX \
+@@ -18735,7 +19587,8 @@ archive_expsym_cmds_CXX \
  module_cmds_CXX \
  module_expsym_cmds_CXX \
  export_symbols_cmds_CXX \
@@ -9715,7 +9795,7 @@ index 0cc6e8a50f..db8b998722 100755
      case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
      *[\\\\\\\`\\"\\\$]*)
        eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
-@@ -19167,7 +20020,8 @@ $as_echo X"$file" |
+@@ -19539,7 +20392,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -9725,7 +9805,7 @@ index 0cc6e8a50f..db8b998722 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -19270,19 +20124,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -19642,19 +20496,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -9769,7 +9849,7 @@ index 0cc6e8a50f..db8b998722 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -19312,6 +20189,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -19684,6 +20561,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -9782,7 +9862,7 @@ index 0cc6e8a50f..db8b998722 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -19321,6 +20204,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -19693,6 +20576,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -9792,7 +9872,7 @@ index 0cc6e8a50f..db8b998722 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -19435,12 +20321,12 @@ with_gcc=$GCC
+@@ -19807,12 +20693,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -9808,7 +9888,7 @@ index 0cc6e8a50f..db8b998722 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -19527,9 +20413,6 @@ inherit_rpath=$inherit_rpath
+@@ -19899,9 +20785,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -9818,7 +9898,7 @@ index 0cc6e8a50f..db8b998722 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -19545,6 +20428,9 @@ include_expsyms=$lt_include_expsyms
+@@ -19917,6 +20800,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -9828,7 +9908,7 @@ index 0cc6e8a50f..db8b998722 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -19591,210 +20477,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -19963,210 +20849,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -10030,15 +10110,9 @@ index 0cc6e8a50f..db8b998722 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -10196,13 +10270,16 @@ index 0cc6e8a50f..db8b998722 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-@@ -19822,12 +20667,12 @@ with_gcc=$GCC_CXX
+@@ -20194,12 +21039,12 @@ with_gcc=$GCC_CXX
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
  
@@ -10218,7 +10295,7 @@ index 0cc6e8a50f..db8b998722 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static_CXX
  
-@@ -19914,9 +20759,6 @@ inherit_rpath=$inherit_rpath_CXX
+@@ -20286,9 +21131,6 @@ inherit_rpath=$inherit_rpath_CXX
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs_CXX
  
@@ -10228,7 +10305,7 @@ index 0cc6e8a50f..db8b998722 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols_CXX
  
-@@ -19932,6 +20774,9 @@ include_expsyms=$lt_include_expsyms_CXX
+@@ -20304,6 +21146,9 @@ include_expsyms=$lt_include_expsyms_CXX
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds_CXX
  
@@ -10238,10 +10315,10 @@ index 0cc6e8a50f..db8b998722 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec_CXX
  
-diff --git a/libtool.m4 b/libtool.m4
-index 24d13f3440..e45fdc6998 100644
---- a/libtool.m4
-+++ b/libtool.m4
+Index: git/libtool.m4
+===================================================================
+--- git.orig/libtool.m4
++++ git/libtool.m4
 @@ -1,7 +1,8 @@
  # libtool.m4 - Configure libtool for the host system. -*-Autoconf-*-
  #
@@ -10281,7 +10358,7 @@ index 24d13f3440..e45fdc6998 100644
  AC_SUBST(LIBTOOL)dnl
  
  _LT_SETUP
-@@ -166,10 +169,13 @@ _LT_DECL([], [exeext], [0], [Executable file suffix (normally "")])dnl
+@@ -166,10 +169,13 @@ _LT_DECL([], [exeext], [0], [Executable
  dnl
  m4_require([_LT_FILEUTILS_DEFAULTS])dnl
  m4_require([_LT_CHECK_SHELL_FEATURES])dnl
@@ -10304,7 +10381,7 @@ index 24d13f3440..e45fdc6998 100644
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -632,7 +638,7 @@ m4_ifset([AC_PACKAGE_NAME], [AC_PACKAGE_NAME ])config.lt[]dnl
+@@ -632,7 +638,7 @@ m4_ifset([AC_PACKAGE_NAME], [AC_PACKAGE_
  m4_ifset([AC_PACKAGE_VERSION], [ AC_PACKAGE_VERSION])
  configured by $[0], generated by m4_PACKAGE_STRING.
  
@@ -10360,7 +10437,7 @@ index 24d13f3440..e45fdc6998 100644
 +# Allow to override them for all tags through lt_cv_aix_libpath.
  m4_defun([_LT_SYS_MODULE_PATH_AIX],
  [m4_require([_LT_DECL_SED])dnl
--AC_LINK_IFELSE(AC_LANG_PROGRAM,[
+-AC_LINK_IFELSE([AC_LANG_SOURCE([AC_LANG_PROGRAM])],[
 -lt_aix_libpath_sed='
 -    /Import File Strings/,/^$/ {
 -	/^0/ {
@@ -10409,7 +10486,7 @@ index 24d13f3440..e45fdc6998 100644
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -1161,6 +1177,39 @@ _LT_DECL([], [ECHO], [1], [An echo program that protects backslashes])
+@@ -1161,6 +1177,39 @@ _LT_DECL([], [ECHO], [1], [An echo progr
  ])# _LT_PROG_ECHO_BACKSLASH
  
  
@@ -10662,7 +10739,7 @@ index 24d13f3440..e45fdc6998 100644
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -3174,7 +3336,11 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -3174,7 +3336,11 @@ test -z "$deplibs_check_method" && depli
  _LT_DECL([], [deplibs_check_method], [1],
      [Method to check whether dependent libraries are shared objects])
  _LT_DECL([], [file_magic_cmd], [1],
@@ -10790,7 +10867,7 @@ index 24d13f3440..e45fdc6998 100644
    const char *name;
    void       *address;
  }
-@@ -3510,15 +3750,15 @@ static const void *lt_preloaded_setup() {
+@@ -3510,15 +3750,15 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -10824,7 +10901,7 @@ index 24d13f3440..e45fdc6998 100644
  _LT_DECL([global_symbol_pipe], [lt_cv_sys_global_symbol_pipe], [1],
      [Take the output of nm and produce a listing of raw symbols and C names])
  _LT_DECL([global_symbol_to_cdecl], [lt_cv_sys_global_symbol_to_cdecl], [1],
-@@ -3561,6 +3808,8 @@ _LT_DECL([global_symbol_to_c_name_address],
+@@ -3561,6 +3808,8 @@ _LT_DECL([global_symbol_to_c_name_addres
  _LT_DECL([global_symbol_to_c_name_address_lib_prefix],
      [lt_cv_sys_global_symbol_to_c_name_address_lib_prefix], [1],
      [Transform the output of nm in a C name address pair when lib prefix is needed])
@@ -10909,7 +10986,7 @@ index 24d13f3440..e45fdc6998 100644
  #
  # Check to make sure the static flag actually works.
  #
-@@ -4213,6 +4477,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog_compiler_static], [1],
+@@ -4213,6 +4477,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog
  m4_defun([_LT_LINKER_SHLIBS],
  [AC_REQUIRE([LT_PATH_LD])dnl
  AC_REQUIRE([LT_PATH_NM])dnl
@@ -11156,7 +11233,7 @@ index 24d13f3440..e45fdc6998 100644
  	# implicitly export all symbols.
 -        save_LDFLAGS="$LDFLAGS"
 -        LDFLAGS="$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${wl}-update_registry ${wl}/dev/null"
--        AC_LINK_IFELSE(int foo(void) {},
+-        AC_LINK_IFELSE([AC_LANG_SOURCE([int foo(void) {}])],
 -          _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations ${wl}-exports_file ${wl}$export_symbols -o $lib'
 -        )
 -        LDFLAGS="$save_LDFLAGS"
@@ -11231,7 +11308,7 @@ index 24d13f3440..e45fdc6998 100644
  if test -n "$CXX" && ( test "X$CXX" != "Xno" &&
      ( (test "X$CXX" = "Xg++" && `g++ -v >/dev/null 2>&1` ) ||
      (test "X$CXX" != "Xg++"))) ; then
-@@ -5487,6 +5818,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5487,6 +5818,7 @@ if test "$_lt_caught_CXX_error" != yes;
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -11239,7 +11316,7 @@ index 24d13f3440..e45fdc6998 100644
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -5504,6 +5836,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5504,6 +5836,7 @@ if test "$_lt_caught_CXX_error" != yes;
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -11247,7 +11324,7 @@ index 24d13f3440..e45fdc6998 100644
    compiler=$CC
    _LT_TAGVAR(compiler, $1)=$CC
    _LT_CC_BASENAME([$compiler])
-@@ -5667,7 +6000,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5667,7 +6000,7 @@ if test "$_lt_caught_CXX_error" != yes;
            _LT_TAGVAR(allow_undefined_flag, $1)='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -11256,7 +11333,7 @@ index 24d13f3440..e45fdc6998 100644
            _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  
            _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -5679,7 +6012,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5679,7 +6012,7 @@ if test "$_lt_caught_CXX_error" != yes;
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -11265,7 +11342,7 @@ index 24d13f3440..e45fdc6998 100644
  	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
  	    # -berok will link without error, but may produce a broken library.
-@@ -5721,29 +6054,75 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5721,29 +6054,75 @@ if test "$_lt_caught_CXX_error" != yes;
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -11364,7 +11441,7 @@ index 24d13f3440..e45fdc6998 100644
        darwin* | rhapsody*)
          _LT_DARWIN_LINKER_FEATURES($1)
  	;;
-@@ -5818,7 +6197,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5818,7 +6197,7 @@ if test "$_lt_caught_CXX_error" != yes;
              ;;
            *)
              if test "$GXX" = yes; then
@@ -11373,7 +11450,7 @@ index 24d13f3440..e45fdc6998 100644
              else
                # FIXME: insert proper C++ library support
                _LT_TAGVAR(ld_shlibs, $1)=no
-@@ -5889,10 +6268,10 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5889,10 +6268,10 @@ if test "$_lt_caught_CXX_error" != yes;
  	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -11386,7 +11463,7 @@ index 24d13f3440..e45fdc6998 100644
  	            ;;
  	        esac
  	      fi
-@@ -5933,9 +6312,9 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5933,9 +6312,9 @@ if test "$_lt_caught_CXX_error" != yes;
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -11398,7 +11475,7 @@ index 24d13f3440..e45fdc6998 100644
  	      fi
  	    fi
  	    _LT_TAGVAR(link_all_deplibs, $1)=yes
-@@ -6005,20 +6384,20 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6005,20 +6384,20 @@ if test "$_lt_caught_CXX_error" != yes;
  	      _LT_TAGVAR(prelink_cmds, $1)='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -11423,7 +11500,7 @@ index 24d13f3440..e45fdc6998 100644
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -6213,7 +6592,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6213,7 +6592,7 @@ if test "$_lt_caught_CXX_error" != yes;
  	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -11432,7 +11509,7 @@ index 24d13f3440..e45fdc6998 100644
  		  ;;
  	      esac
  
-@@ -6259,7 +6638,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6259,7 +6638,7 @@ if test "$_lt_caught_CXX_error" != yes;
  
        solaris*)
          case $cc_basename in
@@ -11441,7 +11518,7 @@ index 24d13f3440..e45fdc6998 100644
  	    # Sun C++ 4.2, 5.x and Centerline C++
              _LT_TAGVAR(archive_cmds_need_lc,$1)=yes
  	    _LT_TAGVAR(no_undefined_flag, $1)=' -zdefs'
-@@ -6300,9 +6679,9 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6300,9 +6679,9 @@ if test "$_lt_caught_CXX_error" != yes;
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -11453,7 +11530,7 @@ index 24d13f3440..e45fdc6998 100644
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -6431,6 +6810,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6431,6 +6810,7 @@ if test "$_lt_caught_CXX_error" != yes;
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -11661,7 +11738,7 @@ index 24d13f3440..e45fdc6998 100644
  ])# _LT_LANG_RC_CONFIG
  
  
-@@ -7101,6 +7536,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object symbol dumper])
+@@ -7101,6 +7536,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object
  AC_SUBST([OBJDUMP])
  ])
  
@@ -11688,7 +11765,7 @@ index 24d13f3440..e45fdc6998 100644
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -7234,206 +7678,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn newlines into spaces])dnl
+@@ -7234,206 +7678,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn
  ])# _LT_CHECK_SHELL_FEATURES
  
  
@@ -11786,27 +11863,12 @@ index 24d13f3440..e45fdc6998 100644
 -{
 -  func_len_result=${#1}
 -}
-+# _LT_PROG_FUNCTION_REPLACE (FUNCNAME, REPLACEMENT-BODY)
-+# ------------------------------------------------------
-+# In `$cfgfile', look for function FUNCNAME delimited by `^FUNCNAME ()$' and
-+# '^} FUNCNAME ', and replace its body with REPLACEMENT-BODY.
-+m4_defun([_LT_PROG_FUNCTION_REPLACE],
-+[dnl {
-+sed -e '/^$1 ()$/,/^} # $1 /c\
-+$1 ()\
-+{\
-+m4_bpatsubsts([$2], [$], [\\], [^\([	 ]\)], [\\\1])
-+} # Extended-shell $1 implementation' "$cfgfile" > $cfgfile.tmp \
-+  && mv -f "$cfgfile.tmp" "$cfgfile" \
-+    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
-+test 0 -eq $? || _lt_function_replace_fail=:
-+])
- 
+-
 -_LT_EOF
 -    ;;
 -  *) # Bourne compatible functions.
 -    cat << \_LT_EOF >> "$cfgfile"
- 
+-
 -# func_dirname file append nondir_replacement
 -# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
 -# otherwise set result to NONDIR_REPLACEMENT.
@@ -11820,46 +11882,31 @@ index 24d13f3440..e45fdc6998 100644
 -    func_dirname_result="$func_dirname_result${2}"
 -  fi
 -}
-+# _LT_PROG_REPLACE_SHELLFNS
-+# -------------------------
-+# Replace existing portable implementations of several shell functions with
-+# equivalent extended shell implementations where those features are available..
-+m4_defun([_LT_PROG_REPLACE_SHELLFNS],
-+[if test x"$xsi_shell" = xyes; then
-+  _LT_PROG_FUNCTION_REPLACE([func_dirname], [dnl
-+    case ${1} in
-+      */*) func_dirname_result="${1%/*}${2}" ;;
-+      *  ) func_dirname_result="${3}" ;;
-+    esac])
-+
-+  _LT_PROG_FUNCTION_REPLACE([func_basename], [dnl
-+    func_basename_result="${1##*/}"])
-+
-+  _LT_PROG_FUNCTION_REPLACE([func_dirname_and_basename], [dnl
-+    case ${1} in
-+      */*) func_dirname_result="${1%/*}${2}" ;;
-+      *  ) func_dirname_result="${3}" ;;
-+    esac
-+    func_basename_result="${1##*/}"])
- 
+-
 -# func_basename file
 -func_basename ()
 -{
 -  func_basename_result=`$ECHO "${1}" | $SED "$basename"`
 -}
-+  _LT_PROG_FUNCTION_REPLACE([func_stripname], [dnl
-+    # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are
-+    # positional parameters, so assign one to ordinary parameter first.
-+    func_stripname_result=${3}
-+    func_stripname_result=${func_stripname_result#"${1}"}
-+    func_stripname_result=${func_stripname_result%"${2}"}])
++# _LT_PROG_FUNCTION_REPLACE (FUNCNAME, REPLACEMENT-BODY)
++# ------------------------------------------------------
++# In `$cfgfile', look for function FUNCNAME delimited by `^FUNCNAME ()$' and
++# '^} FUNCNAME ', and replace its body with REPLACEMENT-BODY.
++m4_defun([_LT_PROG_FUNCTION_REPLACE],
++[dnl {
++sed -e '/^$1 ()$/,/^} # $1 /c\
++$1 ()\
++{\
++m4_bpatsubsts([$2], [$], [\\], [^\([	 ]\)], [\\\1])
++} # Extended-shell $1 implementation' "$cfgfile" > $cfgfile.tmp \
++  && mv -f "$cfgfile.tmp" "$cfgfile" \
++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfgfile.tmp")
++test 0 -eq $? || _lt_function_replace_fail=:
++])
  
 -dnl func_dirname_and_basename
 -dnl A portable version of this function is already defined in general.m4sh
 -dnl so there is no need for it here.
-+  _LT_PROG_FUNCTION_REPLACE([func_split_long_opt], [dnl
-+    func_split_long_opt_name=${1%%=*}
-+    func_split_long_opt_arg=${1#*=}])
  
 -# func_stripname prefix suffix name
 -# strip PREFIX and SUFFIX off of NAME.
@@ -11874,13 +11921,46 @@ index 24d13f3440..e45fdc6998 100644
 -    *)  func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%${2}\$%%"`;;
 -  esac
 -}
-+  _LT_PROG_FUNCTION_REPLACE([func_split_short_opt], [dnl
-+    func_split_short_opt_arg=${1#??}
-+    func_split_short_opt_name=${1%"$func_split_short_opt_arg"}])
++# _LT_PROG_REPLACE_SHELLFNS
++# -------------------------
++# Replace existing portable implementations of several shell functions with
++# equivalent extended shell implementations where those features are available..
++m4_defun([_LT_PROG_REPLACE_SHELLFNS],
++[if test x"$xsi_shell" = xyes; then
++  _LT_PROG_FUNCTION_REPLACE([func_dirname], [dnl
++    case ${1} in
++      */*) func_dirname_result="${1%/*}${2}" ;;
++      *  ) func_dirname_result="${3}" ;;
++    esac])
++
++  _LT_PROG_FUNCTION_REPLACE([func_basename], [dnl
++    func_basename_result="${1##*/}"])
++
++  _LT_PROG_FUNCTION_REPLACE([func_dirname_and_basename], [dnl
++    case ${1} in
++      */*) func_dirname_result="${1%/*}${2}" ;;
++      *  ) func_dirname_result="${3}" ;;
++    esac
++    func_basename_result="${1##*/}"])
  
 -# sed scripts:
 -my_sed_long_opt='1s/^\(-[[^=]]*\)=.*/\1/;q'
 -my_sed_long_arg='1s/^-[[^=]]*=//'
++  _LT_PROG_FUNCTION_REPLACE([func_stripname], [dnl
++    # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are
++    # positional parameters, so assign one to ordinary parameter first.
++    func_stripname_result=${3}
++    func_stripname_result=${func_stripname_result#"${1}"}
++    func_stripname_result=${func_stripname_result%"${2}"}])
++
++  _LT_PROG_FUNCTION_REPLACE([func_split_long_opt], [dnl
++    func_split_long_opt_name=${1%%=*}
++    func_split_long_opt_arg=${1#*=}])
++
++  _LT_PROG_FUNCTION_REPLACE([func_split_short_opt], [dnl
++    func_split_short_opt_arg=${1#??}
++    func_split_short_opt_name=${1%"$func_split_short_opt_arg"}])
++
 +  _LT_PROG_FUNCTION_REPLACE([func_lo2o], [dnl
 +    case ${1} in
 +      *.lo) func_lo2o_result=${1%.lo}.${objext} ;;
@@ -11928,9 +12008,7 @@ index 24d13f3440..e45fdc6998 100644
 +    func_quote_for_eval "${2}"
 +dnl m4 expansion turns \\\\ into \\, and then the shell eval turns that into \
 +    eval "${1}+=\\\\ \\$func_quote_for_eval_result"])
- 
--_LT_EOF
--esac
++
 +  # Save a `func_append' function call where possible by direct use of '+='
 +  sed -e 's%func_append \([[a-zA-Z_]]\{1,\}\) "%\1+="%g' $cfgfile > $cfgfile.tmp \
 +    && mv -f "$cfgfile.tmp" "$cfgfile" \
@@ -11944,14 +12022,17 @@ index 24d13f3440..e45fdc6998 100644
 +  test 0 -eq $? || _lt_function_replace_fail=:
 +fi
  
--case $lt_shell_append in
--  yes)
--    cat << \_LT_EOF >> "$cfgfile"
+-_LT_EOF
+-esac
 +if test x"$_lt_function_replace_fail" = x":"; then
 +  AC_MSG_WARN([Unable to substitute extended shell functions in $ofile])
 +fi
 +])
  
+-case $lt_shell_append in
+-  yes)
+-    cat << \_LT_EOF >> "$cfgfile"
+-
 -# func_append var value
 -# Append VALUE to the end of shell variable VAR.
 -func_append ()
@@ -12037,10 +12118,10 @@ index 24d13f3440..e45fdc6998 100644
 +_LT_DECL([to_tool_file_cmd], [lt_cv_to_tool_file_cmd],
 +         [0], [convert $build files to toolchain format])dnl
 +])# _LT_PATH_CONVERSION_FUNCTIONS
-diff --git a/ltmain.sh b/ltmain.sh
-index 9503ec85d7..70e856e065 100644
---- a/ltmain.sh
-+++ b/ltmain.sh
+Index: git/ltmain.sh
+===================================================================
+--- git.orig/ltmain.sh
++++ git/ltmain.sh
 @@ -1,10 +1,9 @@
 -# Generated from ltmain.m4sh.
  
@@ -12470,31 +12551,7 @@ index 9503ec85d7..70e856e065 100644
 +$progname: of $PACKAGE $VERSION and run autoconf again.
 +_LT_EOF
 +    fi
- 
--  # Shorthand for --mode=foo, only valid as the first argument
--  case $1 in
--  clean|clea|cle|cl)
--    shift; set dummy --mode clean ${1+"$@"}; shift
--    ;;
--  compile|compil|compi|comp|com|co|c)
--    shift; set dummy --mode compile ${1+"$@"}; shift
--    ;;
--  execute|execut|execu|exec|exe|ex|e)
--    shift; set dummy --mode execute ${1+"$@"}; shift
--    ;;
--  finish|finis|fini|fin|fi|f)
--    shift; set dummy --mode finish ${1+"$@"}; shift
--    ;;
--  install|instal|insta|inst|ins|in|i)
--    shift; set dummy --mode install ${1+"$@"}; shift
--    ;;
--  link|lin|li|l)
--    shift; set dummy --mode link ${1+"$@"}; shift
--    ;;
--  uninstall|uninstal|uninsta|uninst|unins|unin|uni|un|u)
--    shift; set dummy --mode uninstall ${1+"$@"}; shift
--    ;;
--  esac
++
 +    exit $EXIT_MISMATCH
 +  fi
 +}
@@ -12524,9 +12581,7 @@ index 9503ec85d7..70e856e065 100644
 +  shift; set dummy --mode uninstall ${1+"$@"}; shift
 +  ;;
 +esac
- 
--  # Parse non-mode specific arguments:
--  while test "$#" -gt 0; do
++
 +
 +
 +# Option defaults:
@@ -12542,8 +12597,34 @@ index 9503ec85d7..70e856e065 100644
 +opt_verbose=:
 +opt_silent=false
 +opt_verbose=false
-+
-+
+ 
+-  # Shorthand for --mode=foo, only valid as the first argument
+-  case $1 in
+-  clean|clea|cle|cl)
+-    shift; set dummy --mode clean ${1+"$@"}; shift
+-    ;;
+-  compile|compil|compi|comp|com|co|c)
+-    shift; set dummy --mode compile ${1+"$@"}; shift
+-    ;;
+-  execute|execut|execu|exec|exe|ex|e)
+-    shift; set dummy --mode execute ${1+"$@"}; shift
+-    ;;
+-  finish|finis|fini|fin|fi|f)
+-    shift; set dummy --mode finish ${1+"$@"}; shift
+-    ;;
+-  install|instal|insta|inst|ins|in|i)
+-    shift; set dummy --mode install ${1+"$@"}; shift
+-    ;;
+-  link|lin|li|l)
+-    shift; set dummy --mode link ${1+"$@"}; shift
+-    ;;
+-  uninstall|uninstal|uninsta|uninst|unins|unin|uni|un|u)
+-    shift; set dummy --mode uninstall ${1+"$@"}; shift
+-    ;;
+-  esac
+ 
+-  # Parse non-mode specific arguments:
+-  while test "$#" -gt 0; do
 +# Parse options once, thoroughly.  This comes as soon as possible in the
 +# script to make things like `--version' happen as quickly as we can.
 +{
@@ -12787,13 +12868,13 @@ index 9503ec85d7..70e856e065 100644
 -  fi
 -}
 -
-+    # Darwin sucks
-+    eval std_shrext=\"$shrext_cmds\"
- 
+-
 -## ----------- ##
 -##    Main.    ##
 -## ----------- ##
--
++    # Darwin sucks
++    eval std_shrext=\"$shrext_cmds\"
+ 
 -$opt_help || {
 -  # Sanity checks first:
 -  func_check_version_match
@@ -13514,7 +13595,7 @@ index 9503ec85d7..70e856e065 100644
        "")
          # Generic help is extracted from the usage comments
          # at the start of this file.
-@@ -1659,8 +2327,8 @@ This mode accepts the following additional options:
+@@ -1659,8 +2327,8 @@ This mode accepts the following addition
  
    -o OUTPUT-FILE    set the output file name to OUTPUT-FILE
    -no-suppress      do not suppress compiler output for multiple passes
@@ -13525,7 +13606,7 @@ index 9503ec85d7..70e856e065 100644
    -shared           do not build a \`.o' file suitable for static linking
    -static           only build a \`.o' file suitable for static linking
    -Wc,FLAG          pass FLAG directly to the compiler
-@@ -1804,7 +2472,7 @@ Otherwise, only FILE itself is deleted using RM."
+@@ -1804,7 +2472,7 @@ Otherwise, only FILE itself is deleted u
          ;;
  
        *)
@@ -13627,7 +13708,7 @@ index 9503ec85d7..70e856e065 100644
 +    do
 +      if test -d "$opt"; then
 +	func_append libdirs " $opt"
- 
++
 +      elif test -f "$opt"; then
 +	if func_lalib_unsafe_p "$opt"; then
 +	  func_append libs " $opt"
@@ -13647,7 +13728,7 @@ index 9503ec85d7..70e856e065 100644
 +      else
 +        sysroot_cmd=
 +      fi
-+
+ 
 +      # Remove sysroot references
 +      if $opt_dry_run; then
 +        for lib in $libs; do
@@ -14059,7 +14140,7 @@ index 9503ec85d7..70e856e065 100644
  lt_${my_prefix}_LTX_preloaded_symbols[] =
  {\
    { \"$my_originator\", (void *) 0 },"
-@@ -2736,7 +3493,7 @@ static const void *lt_preloaded_setup() {
+@@ -2736,7 +3493,7 @@ static const void *lt_preloaded_setup()
  	for arg in $LTCFLAGS; do
  	  case $arg in
  	  -pie | -fpie | -fPIE) ;;
@@ -14588,7 +14669,7 @@ index 9503ec85d7..70e856e065 100644
  */
  EOF
  	    cat <<"EOF"
-@@ -3462,22 +4272,13 @@ int setenv (const char *, const char *, int);
+@@ -3462,22 +4272,13 @@ int setenv (const char *, const char *,
    if (stale) { free ((void *) stale); stale = 0; } \
  } while (0)
  
@@ -14615,7 +14696,7 @@ index 9503ec85d7..70e856e065 100644
  
  void *xmalloc (size_t num);
  char *xstrdup (const char *string);
-@@ -3487,7 +4288,10 @@ char *chase_symlinks (const char *pathspec);
+@@ -3487,7 +4288,10 @@ char *chase_symlinks (const char *pathsp
  int make_executable (const char *path);
  int check_executable (const char *path);
  char *strendzap (char *str, const char *pat);
@@ -14943,7 +15024,7 @@ index 9503ec85d7..70e856e065 100644
    vfprintf (stderr, message, ap);
    fprintf (stderr, ".\n");
  
-@@ -3988,20 +4832,32 @@ lt_error_core (int exit_status, const char *mode,
+@@ -3988,20 +4832,32 @@ lt_error_core (int exit_status, const ch
  }
  
  void
@@ -14981,7 +15062,7 @@ index 9503ec85d7..70e856e065 100644
    {
  #ifdef HAVE_SETENV
      /* always make a copy, for consistency with !HAVE_SETENV */
-@@ -4049,9 +4905,9 @@ lt_extend_str (const char *orig_value, const char *add, int to_end)
+@@ -4049,9 +4905,9 @@ lt_extend_str (const char *orig_value, c
  void
  lt_update_exe_path (const char *name, const char *value)
  {
@@ -14994,7 +15075,7 @@ index 9503ec85d7..70e856e065 100644
  
    if (name && *name && value && *value)
      {
-@@ -4070,9 +4926,9 @@ lt_update_exe_path (const char *name, const char *value)
+@@ -4070,9 +4926,9 @@ lt_update_exe_path (const char *name, co
  void
  lt_update_lib_path (const char *name, const char *value)
  {
@@ -17267,10 +17348,10 @@ index 9503ec85d7..70e856e065 100644
  
  if test -n "$exec_cmd"; then
    eval exec "$exec_cmd"
-diff --git a/ltoptions.m4 b/ltoptions.m4
-index 5ef12ced2a..17cfd51c0b 100644
---- a/ltoptions.m4
-+++ b/ltoptions.m4
+Index: git/ltoptions.m4
+===================================================================
+--- git.orig/ltoptions.m4
++++ git/ltoptions.m4
 @@ -8,7 +8,7 @@
  # unlimited permission to copy and/or distribute it, with or without
  # modifications, as long as this notice is preserved.
@@ -17280,10 +17361,10 @@ index 5ef12ced2a..17cfd51c0b 100644
  
  # This is to help aclocal find these macros, as it can't see m4_define.
  AC_DEFUN([LTOPTIONS_VERSION], [m4_if([1])])
-diff --git a/ltversion.m4 b/ltversion.m4
-index bf87f77132..9c7b5d4118 100644
---- a/ltversion.m4
-+++ b/ltversion.m4
+Index: git/ltversion.m4
+===================================================================
+--- git.orig/ltversion.m4
++++ git/ltversion.m4
 @@ -7,17 +7,17 @@
  # unlimited permission to copy and/or distribute it, with or without
  # modifications, as long as this notice is preserved.
@@ -17308,10 +17389,10 @@ index bf87f77132..9c7b5d4118 100644
  _LT_DECL(, macro_version, 0, [Which release of libtool.m4 was used?])
  _LT_DECL(, macro_revision, 0)
  ])
-diff --git a/lt~obsolete.m4 b/lt~obsolete.m4
-index bf92b5e079..c573da90c5 100644
---- a/lt~obsolete.m4
-+++ b/lt~obsolete.m4
+Index: git/lt~obsolete.m4
+===================================================================
+--- git.orig/lt~obsolete.m4
++++ git/lt~obsolete.m4
 @@ -7,7 +7,7 @@
  # unlimited permission to copy and/or distribute it, with or without
  # modifications, as long as this notice is preserved.
@@ -17321,11 +17402,11 @@ index bf92b5e079..c573da90c5 100644
  
  # These exist entirely to fool aclocal when bootstrapping libtool.
  #
-diff --git a/opcodes/configure b/opcodes/configure
-index 4f29887098..2127d39288 100755
---- a/opcodes/configure
-+++ b/opcodes/configure
-@@ -650,6 +650,9 @@ OTOOL
+Index: git/opcodes/configure
+===================================================================
+--- git.orig/opcodes/configure
++++ git/opcodes/configure
+@@ -681,6 +681,9 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -17335,7 +17416,7 @@ index 4f29887098..2127d39288 100755
  OBJDUMP
  LN_S
  NM
-@@ -763,6 +766,7 @@ enable_static
+@@ -799,6 +802,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -17343,7 +17424,7 @@ index 4f29887098..2127d39288 100755
  enable_libtool_lock
  enable_targets
  enable_werror
-@@ -1423,6 +1427,8 @@ Optional Packages:
+@@ -1463,6 +1467,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -17352,7 +17433,7 @@ index 4f29887098..2127d39288 100755
  
  Some influential environment variables:
    CC          C compiler command
-@@ -5115,8 +5121,8 @@ esac
+@@ -5404,8 +5410,8 @@ esac
  
  
  
@@ -17363,7 +17444,7 @@ index 4f29887098..2127d39288 100755
  
  
  
-@@ -5156,7 +5162,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5445,7 +5451,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -17372,7 +17453,7 @@ index 4f29887098..2127d39288 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5842,8 +5848,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6131,8 +6137,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -17383,13 +17464,13 @@ index 4f29887098..2127d39288 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5892,6 +5898,80 @@ esac
+@@ -6181,6 +6187,80 @@ esac
  
  
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to $host format" >&5
 +$as_echo_n "checking how to convert $build file names to $host format... " >&6; }
-+if test "${lt_cv_to_host_file_cmd+set}" = set; then :
++if ${lt_cv_to_host_file_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  case $host in
@@ -17436,7 +17517,7 @@ index 4f29887098..2127d39288 100755
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to toolchain format" >&5
 +$as_echo_n "checking how to convert $build file names to toolchain format... " >&6; }
-+if test "${lt_cv_to_tool_file_cmd+set}" = set; then :
++if ${lt_cv_to_tool_file_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  #assume ordinary cross tools, or native build.
@@ -17463,8 +17544,8 @@ index 4f29887098..2127d39288 100755
 +
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
- if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -5908,6 +5988,11 @@ case $reload_flag in
+ if ${lt_cv_ld_reload_flag+:} false; then :
+@@ -6197,6 +6277,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -17476,7 +17557,7 @@ index 4f29887098..2127d39288 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6076,7 +6161,8 @@ mingw* | pw32*)
+@@ -6365,7 +6450,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -17486,7 +17567,7 @@ index 4f29887098..2127d39288 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6230,6 +6316,21 @@ esac
+@@ -6519,6 +6605,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -17508,7 +17589,7 @@ index 4f29887098..2127d39288 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6243,11 +6344,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6534,9 +6635,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -17522,8 +17603,6 @@ index 4f29887098..2127d39288 100755
 +
 +
 +
- 
- 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -17531,7 +17610,7 @@ index 4f29887098..2127d39288 100755
 +set dummy ${ac_tool_prefix}dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_DLLTOOL+set}" = set; then :
++if ${ac_cv_prog_DLLTOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$DLLTOOL"; then
@@ -17543,7 +17622,7 @@ index 4f29887098..2127d39288 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_DLLTOOL="${ac_tool_prefix}dlltool"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -17571,7 +17650,7 @@ index 4f29887098..2127d39288 100755
 +set dummy dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_ac_ct_DLLTOOL+set}" = set; then :
++if ${ac_cv_prog_ac_ct_DLLTOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$ac_ct_DLLTOOL"; then
@@ -17583,7 +17662,7 @@ index 4f29887098..2127d39288 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_ac_ct_DLLTOOL="dlltool"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -17631,7 +17710,7 @@ index 4f29887098..2127d39288 100755
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to associate runtime and link libraries" >&5
 +$as_echo_n "checking how to associate runtime and link libraries... " >&6; }
-+if test "${lt_cv_sharedlib_from_linklib_cmd+set}" = set; then :
++if ${lt_cv_sharedlib_from_linklib_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_sharedlib_from_linklib_cmd='unknown'
@@ -17674,17 +17753,17 @@ index 4f29887098..2127d39288 100755
 +set dummy $ac_tool_prefix$ac_prog; ac_word=$2
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
- if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6263,7 +6517,7 @@ do
+ if ${ac_cv_prog_AR+:} false; then :
+@@ -6552,7 +6806,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
-   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 -    ac_cv_prog_AR="${ac_tool_prefix}ar"
 +    ac_cv_prog_AR="$ac_tool_prefix$ac_prog"
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6283,11 +6537,15 @@ $as_echo "no" >&6; }
+@@ -6572,11 +6826,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -17702,17 +17781,17 @@ index 4f29887098..2127d39288 100755
 +set dummy $ac_prog; ac_word=$2
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
- if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6303,7 +6561,7 @@ do
+ if ${ac_cv_prog_ac_ct_AR+:} false; then :
+@@ -6592,7 +6850,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
-   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 -    ac_cv_prog_ac_ct_AR="ar"
 +    ac_cv_prog_ac_ct_AR="$ac_prog"
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6322,6 +6580,10 @@ else
+@@ -6611,6 +6869,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -17723,7 +17802,7 @@ index 4f29887098..2127d39288 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6333,16 +6595,72 @@ ac_tool_warned=yes ;;
+@@ -6622,12 +6884,11 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -17736,19 +17815,16 @@ index 4f29887098..2127d39288 100755
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
 +
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
+@@ -6638,6 +6899,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+ 
+ 
+ 
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
-+if test "${lt_cv_ar_at_file+set}" = set; then :
++if ${lt_cv_ar_at_file+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_ar_at_file=no
@@ -17758,7 +17834,7 @@ index 4f29887098..2127d39288 100755
 +int
 +main ()
 +{
- 
++
 +  ;
 +  return 0;
 +}
@@ -17784,23 +17860,29 @@ index 4f29887098..2127d39288 100755
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
++
++
++
++
++
++
  
- 
- 
-@@ -6684,8 +7002,8 @@ esac
+ if test -n "$ac_tool_prefix"; then
+   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
+@@ -6973,8 +7291,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -17811,7 +17893,7 @@ index 4f29887098..2127d39288 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6721,6 +7039,7 @@ for ac_symprfx in "" "_"; do
+@@ -7010,6 +7328,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -17819,7 +17901,7 @@ index 4f29887098..2127d39288 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6762,6 +7081,18 @@ _LT_EOF
+@@ -7051,6 +7370,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -17838,7 +17920,7 @@ index 4f29887098..2127d39288 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6773,7 +7104,7 @@ _LT_EOF
+@@ -7062,7 +7393,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -17847,7 +17929,7 @@ index 4f29887098..2127d39288 100755
    const char *name;
    void       *address;
  }
-@@ -6799,8 +7130,8 @@ static const void *lt_preloaded_setup() {
+@@ -7088,8 +7419,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -17858,7 +17940,7 @@ index 4f29887098..2127d39288 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6810,8 +7141,8 @@ _LT_EOF
+@@ -7099,8 +7430,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -17869,7 +17951,7 @@ index 4f29887098..2127d39288 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6848,6 +7179,16 @@ else
+@@ -7137,6 +7468,14 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -17881,18 +17963,13 @@ index 4f29887098..2127d39288 100755
 +fi
 +
 +
-+
-+
  
  
  
-@@ -6864,6 +7205,45 @@ fi
+@@ -7158,6 +7497,47 @@ fi
  
  
  
-+
-+
-+
 +
 +
 +
@@ -17923,16 +18000,21 @@ index 4f29887098..2127d39288 100755
 + *)
 +   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
 +$as_echo "${with_libtool_sysroot}" >&6; }
-+   as_fn_error "The sysroot must be an absolute path." "$LINENO" 5
++   as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
 +   ;;
 +esac
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
- 
- 
- 
-@@ -7075,6 +7455,123 @@ esac
++
++
++
++
++
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+   enableval=$enable_libtool_lock;
+@@ -7364,6 +7744,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -17941,7 +18023,7 @@ index 4f29887098..2127d39288 100755
 +set dummy ${ac_tool_prefix}mt; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_MANIFEST_TOOL+set}" = set; then :
++if ${ac_cv_prog_MANIFEST_TOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$MANIFEST_TOOL"; then
@@ -17953,7 +18035,7 @@ index 4f29887098..2127d39288 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_MANIFEST_TOOL="${ac_tool_prefix}mt"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -17981,7 +18063,7 @@ index 4f29887098..2127d39288 100755
 +set dummy mt; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_ac_ct_MANIFEST_TOOL+set}" = set; then :
++if ${ac_cv_prog_ac_ct_MANIFEST_TOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$ac_ct_MANIFEST_TOOL"; then
@@ -17993,7 +18075,7 @@ index 4f29887098..2127d39288 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_ac_ct_MANIFEST_TOOL="mt"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -18031,7 +18113,7 @@ index 4f29887098..2127d39288 100755
 +test -z "$MANIFEST_TOOL" && MANIFEST_TOOL=mt
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if $MANIFEST_TOOL is a manifest tool" >&5
 +$as_echo_n "checking if $MANIFEST_TOOL is a manifest tool... " >&6; }
-+if test "${lt_cv_path_mainfest_tool+set}" = set; then :
++if ${lt_cv_path_mainfest_tool+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_path_mainfest_tool=no
@@ -18056,7 +18138,7 @@ index 4f29887098..2127d39288 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7638,6 +8135,8 @@ _LT_EOF
+@@ -7927,6 +8424,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -18065,7 +18147,7 @@ index 4f29887098..2127d39288 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7803,7 +8302,8 @@ fi
+@@ -8092,7 +8591,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -18075,7 +18157,7 @@ index 4f29887098..2127d39288 100755
  
  
  
-@@ -7892,7 +8392,7 @@ aix3*)
+@@ -8181,7 +8681,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -18084,7 +18166,7 @@ index 4f29887098..2127d39288 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8190,8 +8690,6 @@ fi
+@@ -8479,8 +8979,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -18093,7 +18175,7 @@ index 4f29887098..2127d39288 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8357,6 +8855,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8646,6 +9144,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -18106,7 +18188,7 @@ index 4f29887098..2127d39288 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8419,7 +8923,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8708,7 +9212,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -18115,7 +18197,7 @@ index 4f29887098..2127d39288 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8476,13 +8980,17 @@ case $host_os in
+@@ -8765,13 +9269,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -18128,7 +18210,7 @@ index 4f29887098..2127d39288 100755
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
 +$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
-+if test "${lt_cv_prog_compiler_pic+set}" = set; then :
++if ${lt_cv_prog_compiler_pic+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_prog_compiler_pic=$lt_prog_compiler_pic
@@ -18139,7 +18221,7 @@ index 4f29887098..2127d39288 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8543,6 +9051,11 @@ fi
+@@ -8832,6 +9340,11 @@ fi
  
  
  
@@ -18151,7 +18233,7 @@ index 4f29887098..2127d39288 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8893,7 +9406,8 @@ _LT_EOF
+@@ -9182,7 +9695,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -18161,7 +18243,7 @@ index 4f29887098..2127d39288 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8992,12 +9506,12 @@ _LT_EOF
+@@ -9281,12 +9795,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -18176,7 +18258,7 @@ index 4f29887098..2127d39288 100755
  	  fi
  	  ;;
  	esac
-@@ -9011,8 +9525,8 @@ _LT_EOF
+@@ -9300,8 +9814,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -18187,7 +18269,7 @@ index 4f29887098..2127d39288 100755
        fi
        ;;
  
-@@ -9030,8 +9544,8 @@ _LT_EOF
+@@ -9319,8 +9833,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -18198,7 +18280,7 @@ index 4f29887098..2127d39288 100755
        else
  	ld_shlibs=no
        fi
-@@ -9077,8 +9591,8 @@ _LT_EOF
+@@ -9366,8 +9880,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -18209,7 +18291,7 @@ index 4f29887098..2127d39288 100755
        else
  	ld_shlibs=no
        fi
-@@ -9208,7 +9722,13 @@ _LT_EOF
+@@ -9497,7 +10011,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -18217,14 +18299,14 @@ index 4f29887098..2127d39288 100755
 +        if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if test "${lt_cv_aix_libpath_+set}" = set; then :
++  if ${lt_cv_aix_libpath_+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
  int
-@@ -9221,22 +9741,29 @@ main ()
+@@ -9510,22 +10030,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -18267,7 +18349,7 @@ index 4f29887098..2127d39288 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9248,7 +9775,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9537,7 +10064,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -18275,14 +18357,14 @@ index 4f29887098..2127d39288 100755
 +	 if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if test "${lt_cv_aix_libpath_+set}" = set; then :
++  if ${lt_cv_aix_libpath_+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
  int
-@@ -9261,22 +9794,29 @@ main ()
+@@ -9550,22 +10083,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -18325,7 +18407,7 @@ index 4f29887098..2127d39288 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9321,20 +9861,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9610,20 +10150,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -18403,7 +18485,7 @@ index 4f29887098..2127d39288 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9395,7 +9978,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9684,7 +10267,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -18412,7 +18494,7 @@ index 4f29887098..2127d39288 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9403,7 +9986,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9692,7 +10275,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -18421,7 +18503,7 @@ index 4f29887098..2127d39288 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9419,7 +10002,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9708,7 +10291,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -18430,7 +18512,7 @@ index 4f29887098..2127d39288 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9443,10 +10026,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9732,10 +10315,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -18443,7 +18525,7 @@ index 4f29887098..2127d39288 100755
  	  ;;
  	esac
        else
-@@ -9525,23 +10108,36 @@ fi
+@@ -9814,23 +10397,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -18458,7 +18540,7 @@ index 4f29887098..2127d39288 100755
 +	# This should be the same for all languages, so no per-tag cache variable.
 +	{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the $host_os linker accepts -exported_symbol" >&5
 +$as_echo_n "checking whether the $host_os linker accepts -exported_symbol... " >&6; }
-+if test "${lt_cv_irix_exported_symbol+set}" = set; then :
++if ${lt_cv_irix_exported_symbol+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  save_LDFLAGS="$LDFLAGS"
@@ -18488,7 +18570,7 @@ index 4f29887098..2127d39288 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9626,7 +10222,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9915,7 +10511,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -18497,7 +18579,7 @@ index 4f29887098..2127d39288 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9645,9 +10241,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9934,9 +10530,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -18509,7 +18591,7 @@ index 4f29887098..2127d39288 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10223,8 +10819,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10512,8 +11108,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -18521,7 +18603,7 @@ index 4f29887098..2127d39288 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10257,13 +10854,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10546,13 +11143,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -18594,7 +18676,7 @@ index 4f29887098..2127d39288 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10355,7 +11010,7 @@ haiku*)
+@@ -10644,7 +11299,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -18603,7 +18685,16 @@ index 4f29887098..2127d39288 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11195,10 +11850,10 @@ else
+@@ -11440,7 +12095,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11443 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -11484,10 +12139,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -18616,7 +18707,16 @@ index 4f29887098..2127d39288 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11301,10 +11956,10 @@ else
+@@ -11546,7 +12201,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11549 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -11590,10 +12245,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -18629,7 +18729,7 @@ index 4f29887098..2127d39288 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12543,7 +13198,7 @@ if test "$enable_shared" = "yes"; then
+@@ -12831,7 +13486,7 @@ if test "$enable_shared" = "yes"; then
  # since libbfd may not pull in the entirety of libiberty.
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -18638,7 +18738,7 @@ index 4f29887098..2127d39288 100755
    fi
  
    case "${host}" in
-@@ -13520,13 +14175,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -13807,13 +14462,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -18659,7 +18759,7 @@ index 4f29887098..2127d39288 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13541,14 +14203,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -13828,14 +14490,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -18678,7 +18778,7 @@ index 4f29887098..2127d39288 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13581,12 +14246,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -13868,12 +14533,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -18692,7 +18792,7 @@ index 4f29887098..2127d39288 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -13641,8 +14306,13 @@ reload_flag \
+@@ -13928,8 +14593,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -18706,7 +18806,7 @@ index 4f29887098..2127d39288 100755
  STRIP \
  RANLIB \
  CC \
-@@ -13652,12 +14322,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -13939,12 +14609,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -18722,7 +18822,7 @@ index 4f29887098..2127d39288 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -13673,7 +14345,6 @@ no_undefined_flag \
+@@ -13960,7 +14632,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -18730,7 +18830,7 @@ index 4f29887098..2127d39288 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13709,6 +14380,7 @@ module_cmds \
+@@ -13996,6 +14667,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -18738,7 +18838,7 @@ index 4f29887098..2127d39288 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -14465,7 +15137,8 @@ $as_echo X"$file" |
+@@ -14761,7 +15433,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -18748,7 +18848,7 @@ index 4f29887098..2127d39288 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -14568,19 +15241,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -14864,19 +15537,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -18792,7 +18892,7 @@ index 4f29887098..2127d39288 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14610,6 +15306,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -14906,6 +15602,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -18805,7 +18905,7 @@ index 4f29887098..2127d39288 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -14619,6 +15321,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -14915,6 +15617,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -18815,7 +18915,7 @@ index 4f29887098..2127d39288 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14733,12 +15438,12 @@ with_gcc=$GCC
+@@ -15029,12 +15734,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -18831,7 +18931,7 @@ index 4f29887098..2127d39288 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -14825,9 +15530,6 @@ inherit_rpath=$inherit_rpath
+@@ -15121,9 +15826,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -18841,7 +18941,7 @@ index 4f29887098..2127d39288 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -14843,6 +15545,9 @@ include_expsyms=$lt_include_expsyms
+@@ -15139,6 +15841,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -18851,7 +18951,7 @@ index 4f29887098..2127d39288 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -14875,210 +15580,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -15171,210 +15876,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -19053,15 +19153,9 @@ index 4f29887098..2127d39288 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -19219,17 +19313,20 @@ index 4f29887098..2127d39288 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-diff --git a/opcodes/configure.ac b/opcodes/configure.ac
-index b07f3f3629..5a32d9b1fc 100644
---- a/opcodes/configure.ac
-+++ b/opcodes/configure.ac
-@@ -167,7 +167,7 @@ changequote(,)dnl
+Index: git/opcodes/configure.ac
+===================================================================
+--- git.orig/opcodes/configure.ac
++++ git/opcodes/configure.ac
+@@ -166,7 +166,7 @@ changequote(,)dnl
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
  changequote([,])dnl
    if test -n "$x"; then
@@ -19238,11 +19335,11 @@ index b07f3f3629..5a32d9b1fc 100644
    fi
  
    case "${host}" in
-diff --git a/zlib/configure b/zlib/configure
-index dc2d9ed383..ed9a492f5c 100755
---- a/zlib/configure
-+++ b/zlib/configure
-@@ -614,8 +614,11 @@ OTOOL
+Index: git/zlib/configure
+===================================================================
+--- git.orig/zlib/configure
++++ git/zlib/configure
+@@ -646,8 +646,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -19254,7 +19351,7 @@ index dc2d9ed383..ed9a492f5c 100755
  OBJDUMP
  LN_S
  NM
-@@ -737,6 +740,7 @@ enable_static
+@@ -774,6 +777,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -19262,7 +19359,7 @@ index dc2d9ed383..ed9a492f5c 100755
  enable_libtool_lock
  enable_host_shared
  '
-@@ -1385,6 +1389,8 @@ Optional Packages:
+@@ -1428,6 +1432,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -19271,7 +19368,7 @@ index dc2d9ed383..ed9a492f5c 100755
  
  Some influential environment variables:
    CC          C compiler command
-@@ -3910,8 +3916,8 @@ esac
+@@ -4147,8 +4153,8 @@ esac
  
  
  
@@ -19282,7 +19379,7 @@ index dc2d9ed383..ed9a492f5c 100755
  
  
  
-@@ -3951,7 +3957,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -4188,7 +4194,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -19291,7 +19388,7 @@ index dc2d9ed383..ed9a492f5c 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -4767,8 +4773,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5004,8 +5010,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -19302,13 +19399,13 @@ index dc2d9ed383..ed9a492f5c 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -4817,6 +4823,80 @@ esac
+@@ -5054,6 +5060,80 @@ esac
  
  
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to $host format" >&5
 +$as_echo_n "checking how to convert $build file names to $host format... " >&6; }
-+if test "${lt_cv_to_host_file_cmd+set}" = set; then :
++if ${lt_cv_to_host_file_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  case $host in
@@ -19355,7 +19452,7 @@ index dc2d9ed383..ed9a492f5c 100755
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to toolchain format" >&5
 +$as_echo_n "checking how to convert $build file names to toolchain format... " >&6; }
-+if test "${lt_cv_to_tool_file_cmd+set}" = set; then :
++if ${lt_cv_to_tool_file_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  #assume ordinary cross tools, or native build.
@@ -19382,8 +19479,8 @@ index dc2d9ed383..ed9a492f5c 100755
 +
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
- if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -4833,6 +4913,11 @@ case $reload_flag in
+ if ${lt_cv_ld_reload_flag+:} false; then :
+@@ -5070,6 +5150,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -19395,7 +19492,7 @@ index dc2d9ed383..ed9a492f5c 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -5001,7 +5086,8 @@ mingw* | pw32*)
+@@ -5238,7 +5323,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -19405,7 +19502,7 @@ index dc2d9ed383..ed9a492f5c 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -5155,6 +5241,21 @@ esac
+@@ -5392,6 +5478,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -19427,7 +19524,7 @@ index dc2d9ed383..ed9a492f5c 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5168,11 +5269,165 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -5407,9 +5508,163 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -19441,8 +19538,6 @@ index dc2d9ed383..ed9a492f5c 100755
 +
 +
 +
- 
- 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -19450,7 +19545,7 @@ index dc2d9ed383..ed9a492f5c 100755
 +set dummy ${ac_tool_prefix}dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_DLLTOOL+set}" = set; then :
++if ${ac_cv_prog_DLLTOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$DLLTOOL"; then
@@ -19462,7 +19557,7 @@ index dc2d9ed383..ed9a492f5c 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_DLLTOOL="${ac_tool_prefix}dlltool"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -19490,7 +19585,7 @@ index dc2d9ed383..ed9a492f5c 100755
 +set dummy dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_ac_ct_DLLTOOL+set}" = set; then :
++if ${ac_cv_prog_ac_ct_DLLTOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$ac_ct_DLLTOOL"; then
@@ -19502,7 +19597,7 @@ index dc2d9ed383..ed9a492f5c 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_ac_ct_DLLTOOL="dlltool"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -19550,7 +19645,7 @@ index dc2d9ed383..ed9a492f5c 100755
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to associate runtime and link libraries" >&5
 +$as_echo_n "checking how to associate runtime and link libraries... " >&6; }
-+if test "${lt_cv_sharedlib_from_linklib_cmd+set}" = set; then :
++if ${lt_cv_sharedlib_from_linklib_cmd+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_sharedlib_from_linklib_cmd='unknown'
@@ -19594,17 +19689,17 @@ index dc2d9ed383..ed9a492f5c 100755
 +set dummy $ac_tool_prefix$ac_prog; ac_word=$2
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
- if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -5188,7 +5443,7 @@ do
+ if ${ac_cv_prog_AR+:} false; then :
+@@ -5425,7 +5680,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
-   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 -    ac_cv_prog_AR="${ac_tool_prefix}ar"
 +    ac_cv_prog_AR="$ac_tool_prefix$ac_prog"
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -5208,11 +5463,15 @@ $as_echo "no" >&6; }
+@@ -5445,11 +5700,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -19622,17 +19717,17 @@ index dc2d9ed383..ed9a492f5c 100755
 +set dummy $ac_prog; ac_word=$2
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
- if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -5228,7 +5487,7 @@ do
+ if ${ac_cv_prog_ac_ct_AR+:} false; then :
+@@ -5465,7 +5724,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
-   if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 -    ac_cv_prog_ac_ct_AR="ar"
 +    ac_cv_prog_ac_ct_AR="$ac_prog"
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -5247,6 +5506,10 @@ else
+@@ -5484,6 +5743,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -19643,7 +19738,7 @@ index dc2d9ed383..ed9a492f5c 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -5258,16 +5521,72 @@ ac_tool_warned=yes ;;
+@@ -5495,12 +5758,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -19655,20 +19750,16 @@ index dc2d9ed383..ed9a492f5c 100755
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
+@@ -5512,6 +5773,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+ 
+ 
+ 
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
-+if test "${lt_cv_ar_at_file+set}" = set; then :
++if ${lt_cv_ar_at_file+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_ar_at_file=no
@@ -19678,7 +19769,7 @@ index dc2d9ed383..ed9a492f5c 100755
 +int
 +main ()
 +{
- 
++
 +  ;
 +  return 0;
 +}
@@ -19704,23 +19795,30 @@ index dc2d9ed383..ed9a492f5c 100755
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
-@@ -5609,8 +5928,8 @@ esac
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
+@@ -5846,8 +6165,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -19731,7 +19829,7 @@ index dc2d9ed383..ed9a492f5c 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -5646,6 +5965,7 @@ for ac_symprfx in "" "_"; do
+@@ -5883,6 +6202,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -19739,7 +19837,7 @@ index dc2d9ed383..ed9a492f5c 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -5687,6 +6007,18 @@ _LT_EOF
+@@ -5924,6 +6244,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -19758,7 +19856,7 @@ index dc2d9ed383..ed9a492f5c 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -5698,7 +6030,7 @@ _LT_EOF
+@@ -5935,7 +6267,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -19767,7 +19865,7 @@ index dc2d9ed383..ed9a492f5c 100755
    const char *name;
    void       *address;
  }
-@@ -5724,8 +6056,8 @@ static const void *lt_preloaded_setup() {
+@@ -5961,8 +6293,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -19778,7 +19876,7 @@ index dc2d9ed383..ed9a492f5c 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -5735,8 +6067,8 @@ _LT_EOF
+@@ -5972,8 +6304,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -19789,7 +19887,7 @@ index dc2d9ed383..ed9a492f5c 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -5773,6 +6105,19 @@ else
+@@ -6010,6 +6342,18 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -19805,17 +19903,13 @@ index dc2d9ed383..ed9a492f5c 100755
 +
 +
 +
-+
  
  
  
-@@ -5790,6 +6135,41 @@ fi
+@@ -6031,6 +6375,42 @@ fi
  
  
  
-+
-+
-+
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -19842,16 +19936,20 @@ index dc2d9ed383..ed9a492f5c 100755
 + *)
 +   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
 +$as_echo "${with_libtool_sysroot}" >&6; }
-+   as_fn_error "The sysroot must be an absolute path." "$LINENO" 5
++   as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
 +   ;;
 +esac
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
++
++
++
++
  
- 
- 
-@@ -6004,6 +6384,123 @@ esac
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+@@ -6241,6 +6621,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -19860,7 +19958,7 @@ index dc2d9ed383..ed9a492f5c 100755
 +set dummy ${ac_tool_prefix}mt; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_MANIFEST_TOOL+set}" = set; then :
++if ${ac_cv_prog_MANIFEST_TOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$MANIFEST_TOOL"; then
@@ -19872,7 +19970,7 @@ index dc2d9ed383..ed9a492f5c 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_MANIFEST_TOOL="${ac_tool_prefix}mt"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -19900,7 +19998,7 @@ index dc2d9ed383..ed9a492f5c 100755
 +set dummy mt; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if test "${ac_cv_prog_ac_ct_MANIFEST_TOOL+set}" = set; then :
++if ${ac_cv_prog_ac_ct_MANIFEST_TOOL+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$ac_ct_MANIFEST_TOOL"; then
@@ -19912,7 +20010,7 @@ index dc2d9ed383..ed9a492f5c 100755
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 +    ac_cv_prog_ac_ct_MANIFEST_TOOL="mt"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -19950,7 +20048,7 @@ index dc2d9ed383..ed9a492f5c 100755
 +test -z "$MANIFEST_TOOL" && MANIFEST_TOOL=mt
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if $MANIFEST_TOOL is a manifest tool" >&5
 +$as_echo_n "checking if $MANIFEST_TOOL is a manifest tool... " >&6; }
-+if test "${lt_cv_path_mainfest_tool+set}" = set; then :
++if ${lt_cv_path_mainfest_tool+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_path_mainfest_tool=no
@@ -19975,7 +20073,7 @@ index dc2d9ed383..ed9a492f5c 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -6570,6 +7067,8 @@ _LT_EOF
+@@ -6807,6 +7304,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -19984,7 +20082,7 @@ index dc2d9ed383..ed9a492f5c 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7033,7 +7532,8 @@ fi
+@@ -7269,7 +7768,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -19994,7 +20092,7 @@ index dc2d9ed383..ed9a492f5c 100755
  
  
  
-@@ -7122,7 +7622,7 @@ aix3*)
+@@ -7358,7 +7858,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -20003,7 +20101,7 @@ index dc2d9ed383..ed9a492f5c 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -7420,8 +7920,6 @@ fi
+@@ -7656,8 +8156,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -20012,7 +20110,7 @@ index dc2d9ed383..ed9a492f5c 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -7587,6 +8085,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -7823,6 +8321,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -20025,7 +20123,7 @@ index dc2d9ed383..ed9a492f5c 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -7649,7 +8153,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -7885,7 +8389,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -20034,7 +20132,7 @@ index dc2d9ed383..ed9a492f5c 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -7706,13 +8210,17 @@ case $host_os in
+@@ -7942,13 +8446,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -20047,7 +20145,7 @@ index dc2d9ed383..ed9a492f5c 100755
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
 +$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
-+if test "${lt_cv_prog_compiler_pic+set}" = set; then :
++if ${lt_cv_prog_compiler_pic+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_prog_compiler_pic=$lt_prog_compiler_pic
@@ -20058,7 +20156,7 @@ index dc2d9ed383..ed9a492f5c 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -7773,6 +8281,11 @@ fi
+@@ -8009,6 +8517,11 @@ fi
  
  
  
@@ -20070,7 +20168,7 @@ index dc2d9ed383..ed9a492f5c 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8123,7 +8636,8 @@ _LT_EOF
+@@ -8359,7 +8872,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -20080,7 +20178,7 @@ index dc2d9ed383..ed9a492f5c 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8222,12 +8736,12 @@ _LT_EOF
+@@ -8458,12 +8972,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -20095,7 +20193,7 @@ index dc2d9ed383..ed9a492f5c 100755
  	  fi
  	  ;;
  	esac
-@@ -8241,8 +8755,8 @@ _LT_EOF
+@@ -8477,8 +8991,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -20106,7 +20204,7 @@ index dc2d9ed383..ed9a492f5c 100755
        fi
        ;;
  
-@@ -8260,8 +8774,8 @@ _LT_EOF
+@@ -8496,8 +9010,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -20117,7 +20215,7 @@ index dc2d9ed383..ed9a492f5c 100755
        else
  	ld_shlibs=no
        fi
-@@ -8307,8 +8821,8 @@ _LT_EOF
+@@ -8543,8 +9057,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -20128,7 +20226,7 @@ index dc2d9ed383..ed9a492f5c 100755
        else
  	ld_shlibs=no
        fi
-@@ -8438,7 +8952,13 @@ _LT_EOF
+@@ -8674,7 +9188,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -20136,14 +20234,14 @@ index dc2d9ed383..ed9a492f5c 100755
 +        if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if test "${lt_cv_aix_libpath_+set}" = set; then :
++  if ${lt_cv_aix_libpath_+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test x$gcc_no_link = xyes; then
-   as_fn_error "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
+   as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
  fi
  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-@@ -8454,22 +8974,29 @@ main ()
+@@ -8690,22 +9210,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -20186,7 +20284,7 @@ index dc2d9ed383..ed9a492f5c 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -8481,7 +9008,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8717,7 +9244,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -20194,14 +20292,14 @@ index dc2d9ed383..ed9a492f5c 100755
 +	 if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if test "${lt_cv_aix_libpath_+set}" = set; then :
++  if ${lt_cv_aix_libpath_+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test x$gcc_no_link = xyes; then
-   as_fn_error "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
+   as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
  fi
  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
-@@ -8497,22 +9030,29 @@ main ()
+@@ -8733,22 +9266,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -20244,7 +20342,7 @@ index dc2d9ed383..ed9a492f5c 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -8557,20 +9097,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8793,20 +9333,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -20322,7 +20420,7 @@ index dc2d9ed383..ed9a492f5c 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -8631,7 +9214,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8867,7 +9450,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -20331,7 +20429,7 @@ index dc2d9ed383..ed9a492f5c 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -8639,7 +9222,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8875,7 +9458,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -20340,7 +20438,7 @@ index dc2d9ed383..ed9a492f5c 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -8655,7 +9238,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8891,7 +9474,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -20349,7 +20447,7 @@ index dc2d9ed383..ed9a492f5c 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -8679,10 +9262,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8915,10 +9498,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -20362,7 +20460,7 @@ index dc2d9ed383..ed9a492f5c 100755
  	  ;;
  	esac
        else
-@@ -8761,26 +9344,39 @@ fi
+@@ -8997,26 +9580,39 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -20377,13 +20475,13 @@ index dc2d9ed383..ed9a492f5c 100755
 +	# This should be the same for all languages, so no per-tag cache variable.
 +	{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the $host_os linker accepts -exported_symbol" >&5
 +$as_echo_n "checking whether the $host_os linker accepts -exported_symbol... " >&6; }
-+if test "${lt_cv_irix_exported_symbol+set}" = set; then :
++if ${lt_cv_irix_exported_symbol+:} false; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  save_LDFLAGS="$LDFLAGS"
 +	   LDFLAGS="$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${wl}-update_registry ${wl}/dev/null"
 +	   if test x$gcc_no_link = xyes; then
-   as_fn_error "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
+   as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLES." "$LINENO" 5
  fi
  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
@@ -20410,7 +20508,7 @@ index dc2d9ed383..ed9a492f5c 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -8865,7 +9461,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9101,7 +9697,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -20419,7 +20517,7 @@ index dc2d9ed383..ed9a492f5c 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -8884,9 +9480,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9120,9 +9716,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -20431,7 +20529,7 @@ index dc2d9ed383..ed9a492f5c 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -9462,8 +10058,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -9698,8 +10294,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -20443,7 +20541,7 @@ index dc2d9ed383..ed9a492f5c 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -9496,13 +10093,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -9732,13 +10329,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -20516,7 +20614,7 @@ index dc2d9ed383..ed9a492f5c 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -9594,7 +10249,7 @@ haiku*)
+@@ -9830,7 +10485,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -20525,7 +20623,16 @@ index dc2d9ed383..ed9a492f5c 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -10452,10 +11107,10 @@ else
+@@ -10644,7 +11299,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 10647 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -10688,10 +11343,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -20538,7 +20645,16 @@ index dc2d9ed383..ed9a492f5c 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -10558,10 +11213,10 @@ else
+@@ -10750,7 +11405,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 10753 "configure"
++#line $LINENO "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -10794,10 +11449,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -20551,7 +20667,7 @@ index dc2d9ed383..ed9a492f5c 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11992,13 +12647,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -12266,13 +12921,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -20572,7 +20688,7 @@ index dc2d9ed383..ed9a492f5c 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -12013,14 +12675,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -12287,14 +12949,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -20591,7 +20707,7 @@ index dc2d9ed383..ed9a492f5c 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -12053,12 +12718,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -12327,12 +12992,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -20605,7 +20721,7 @@ index dc2d9ed383..ed9a492f5c 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -12113,8 +12778,13 @@ reload_flag \
+@@ -12387,8 +13052,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -20619,7 +20735,7 @@ index dc2d9ed383..ed9a492f5c 100755
  STRIP \
  RANLIB \
  CC \
-@@ -12124,12 +12794,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -12398,12 +13068,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -20635,7 +20751,7 @@ index dc2d9ed383..ed9a492f5c 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -12145,7 +12817,6 @@ no_undefined_flag \
+@@ -12419,7 +13091,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -20643,7 +20759,7 @@ index dc2d9ed383..ed9a492f5c 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -12181,6 +12852,7 @@ module_cmds \
+@@ -12455,6 +13126,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -20651,7 +20767,7 @@ index dc2d9ed383..ed9a492f5c 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -12770,7 +13442,8 @@ $as_echo X"$file" |
+@@ -13053,7 +13725,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -20661,7 +20777,7 @@ index dc2d9ed383..ed9a492f5c 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -12873,19 +13546,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -13156,19 +13829,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -20705,7 +20821,7 @@ index dc2d9ed383..ed9a492f5c 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -12915,6 +13611,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -13198,6 +13894,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -20718,7 +20834,7 @@ index dc2d9ed383..ed9a492f5c 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -12924,6 +13626,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -13207,6 +13909,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -20728,7 +20844,7 @@ index dc2d9ed383..ed9a492f5c 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -13038,12 +13743,12 @@ with_gcc=$GCC
+@@ -13321,12 +14026,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -20744,7 +20860,7 @@ index dc2d9ed383..ed9a492f5c 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -13130,9 +13835,6 @@ inherit_rpath=$inherit_rpath
+@@ -13413,9 +14118,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -20754,7 +20870,7 @@ index dc2d9ed383..ed9a492f5c 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -13148,6 +13850,9 @@ include_expsyms=$lt_include_expsyms
+@@ -13431,6 +14133,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -20764,7 +20880,7 @@ index dc2d9ed383..ed9a492f5c 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -13180,210 +13885,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -13463,210 +14168,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -20966,15 +21082,9 @@ index dc2d9ed383..ed9a492f5c 100755
 -_LT_EOF
 -    ;;
 -  esac
--
--
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
--
--  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
-+
+ 
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -21132,12 +21242,12 @@ index dc2d9ed383..ed9a492f5c 100755
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
-+
-+
+ 
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+ 
+-  mv -f "$cfgfile" "$ofile" ||
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
--- 
-2.16.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch b/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
index 4a5127380f..18ef6bb7ff 100644
--- a/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
+++ b/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
@@ -1,4 +1,4 @@
-From 697903256e09533778baa8af66402c44d70219d9 Mon Sep 17 00:00:00 2001
+From ef50d848d983f81e4a86dd3eef4933e3579336f1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:37:10 +0000
 Subject: [PATCH 07/15] Add the armv5e architecture to binutils
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/gas/config/tc-arm.c b/gas/config/tc-arm.c
-index ec50420518..a25d1721af 100644
+index 3f5384e1c7..8d5bc145af 100644
 --- a/gas/config/tc-arm.c
 +++ b/gas/config/tc-arm.c
-@@ -26195,6 +26195,7 @@ static const struct arm_arch_option_table arm_archs[] =
+@@ -26294,6 +26294,7 @@ static const struct arm_arch_option_table arm_archs[] =
    ARM_ARCH_OPT ("armv4t",	ARM_ARCH_V4T,	 FPU_ARCH_FPA),
    ARM_ARCH_OPT ("armv4txm",	ARM_ARCH_V4TxM,	 FPU_ARCH_FPA),
    ARM_ARCH_OPT ("armv5",	ARM_ARCH_V5,	 FPU_ARCH_VFP),
@@ -31,5 +31,5 @@ index ec50420518..a25d1721af 100644
    ARM_ARCH_OPT ("armv5txm",	ARM_ARCH_V5TxM,	 FPU_ARCH_VFP),
    ARM_ARCH_OPT ("armv5te",	ARM_ARCH_V5TE,	 FPU_ARCH_VFP),
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
index 939be67b58..6999ed9c94 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
@@ -1,4 +1,4 @@
-From 622d66634eb2e509d4126f5bdcab26de367241a1 Mon Sep 17 00:00:00 2001
+From ca25d55cef8398bad508c2b2be29aea5aa3c4d26 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:39:01 +0000
 Subject: [PATCH 08/15] don't let the distro compiler point to the wrong
@@ -31,5 +31,5 @@ index ed1b334c36..d4ffd8b57b 100644
  	if test -n "${target_header_dir}"; then \
  		${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
index e75104722b..9a9e319621 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -1,4 +1,4 @@
-From 27e38ee92c24fca86b1c3f6ef156a1892dd06bfd Mon Sep 17 00:00:00 2001
+From a3667059fc0d52d890b505bed0e5050ea3d7002e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Jan 2016 06:31:09 +0000
 Subject: [PATCH 09/15] warn for uses of system directories when cross linking
@@ -55,7 +55,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ld/configure    | 16 ++++++++++++++++
  ld/configure.ac | 10 ++++++++++
  ld/ld.h         |  8 ++++++++
- ld/ld.texinfo   | 12 ++++++++++++
+ ld/ld.texi      | 12 ++++++++++++
  ld/ldfile.c     | 17 +++++++++++++++++
  ld/ldlex.h      |  2 ++
  ld/ldmain.c     |  2 ++
@@ -63,10 +63,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  9 files changed, 86 insertions(+)
 
 diff --git a/ld/config.in b/ld/config.in
-index a846743da6..df3cd5fb60 100644
+index d93c9b0830..5da2742bea 100644
 --- a/ld/config.in
 +++ b/ld/config.in
-@@ -27,6 +27,9 @@
+@@ -31,6 +31,9 @@
     language is requested. */
  #undef ENABLE_NLS
  
@@ -77,10 +77,10 @@ index a846743da6..df3cd5fb60 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index db8b998722..489ead5c13 100755
+index 2b291f0da8..facc386563 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -789,6 +789,7 @@ with_lib_path
+@@ -826,6 +826,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -88,7 +88,7 @@ index db8b998722..489ead5c13 100755
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1448,6 +1449,8 @@ Optional Features:
+@@ -1490,6 +1491,8 @@ Optional Features:
    --disable-largefile     omit support for large files
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -97,7 +97,7 @@ index db8b998722..489ead5c13 100755
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -16315,6 +16318,19 @@ fi
+@@ -16618,6 +16621,19 @@ fi
  
  
  
@@ -118,10 +118,10 @@ index db8b998722..489ead5c13 100755
  if test "${enable_gold+set}" = set; then :
    enableval=$enable_gold; case "${enableval}" in
 diff --git a/ld/configure.ac b/ld/configure.ac
-index bada1b50b0..d074a3820b 100644
+index d10c553650..9f1b57b120 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
-@@ -95,6 +95,16 @@ AC_SUBST(use_sysroot)
+@@ -94,6 +94,16 @@ AC_SUBST(use_sysroot)
  AC_SUBST(TARGET_SYSTEM_ROOT)
  AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
  
@@ -157,11 +157,11 @@ index ba914b921e..9df17dab6c 100644
    /* Big or little endian as set on command line.  */
    enum endian_enum endian;
  
-diff --git a/ld/ld.texinfo b/ld/ld.texinfo
-index c89915f1aa..df430837e2 100644
---- a/ld/ld.texinfo
-+++ b/ld/ld.texinfo
-@@ -2498,6 +2498,18 @@ string identifying the original linked file does not change.
+diff --git a/ld/ld.texi b/ld/ld.texi
+index b9fe2324da..43486605e0 100644
+--- a/ld/ld.texi
++++ b/ld/ld.texi
+@@ -2479,6 +2479,18 @@ string identifying the original linked file does not change.
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
@@ -181,7 +181,7 @@ index c89915f1aa..df430837e2 100644
  
  @c man end
 diff --git a/ld/ldfile.c b/ld/ldfile.c
-index 6532a57d96..f943f0b2e5 100644
+index a72ff13526..dc5148f748 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
 @@ -116,6 +116,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
@@ -209,10 +209,10 @@ index 6532a57d96..f943f0b2e5 100644
  
  /* Try to open a BFD for a lang_input_statement.  */
 diff --git a/ld/ldlex.h b/ld/ldlex.h
-index 140ed1d9da..9965cbc04f 100644
+index 04d6fd5f96..d7df005bb2 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
-@@ -147,6 +147,8 @@ enum option_values
+@@ -148,6 +148,8 @@ enum option_values
    OPTION_REQUIRE_DEFINED_SYMBOL,
    OPTION_ORPHAN_HANDLING,
    OPTION_FORCE_GROUP_ALLOCATION,
@@ -222,10 +222,10 @@ index 140ed1d9da..9965cbc04f 100644
  
  /* The initial parser states.  */
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index c473ed24c3..adae0b4610 100644
+index f31eeb29c3..25f8497888 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -261,6 +261,8 @@ main (int argc, char **argv)
+@@ -268,6 +268,8 @@ main (int argc, char **argv)
    command_line.warn_mismatch = TRUE;
    command_line.warn_search_mismatch = TRUE;
    command_line.check_section_addresses = -1;
@@ -235,10 +235,10 @@ index c473ed24c3..adae0b4610 100644
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index f2191602d4..bccb3bdeef 100644
+index 86a033a383..4a40d48020 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
-@@ -538,6 +538,14 @@ static const struct ld_option ld_options[] =
+@@ -543,6 +543,14 @@ static const struct ld_option ld_options[] =
    { {"orphan-handling", required_argument, NULL, OPTION_ORPHAN_HANDLING},
      '\0', N_("=MODE"), N_("Control how orphan sections are handled."),
      TWO_DASHES },
@@ -253,8 +253,8 @@ index f2191602d4..bccb3bdeef 100644
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -1568,6 +1576,14 @@ parse_args (unsigned argc, char **argv)
- 	    einfo (_("%P%F: invalid argument to option"
+@@ -1577,6 +1585,14 @@ parse_args (unsigned argc, char **argv)
+ 	    einfo (_("%F%P: invalid argument to option"
  		     " \"--orphan-handling\"\n"));
  	  break;
 +
@@ -269,5 +269,5 @@ index f2191602d4..bccb3bdeef 100644
      }
  
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
index 33dfff9bd7..8fc00ff456 100644
--- a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
+++ b/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
@@ -1,4 +1,4 @@
-From e205ae05c41a8cc8d47708f0a3b6f740e2bf2526 Mon Sep 17 00:00:00 2001
+From 9e1d8f9a657a8bd48048c2ea6407cf60b723bd68 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:42:38 +0000
 Subject: [PATCH 10/15] Fix rpath in libtool when sysroot is enabled
@@ -48,5 +48,5 @@ index 70e856e065..11ee684ccc 100644
  	    if test -z "$hardcode_libdirs"; then
  	      hardcode_libdirs="$libdir"
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
index 80fcbc1194..2e93b129dd 100644
--- a/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
+++ b/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
@@ -1,4 +1,4 @@
-From 7978c1299021033c35c29c94e0997235f7ede248 Mon Sep 17 00:00:00 2001
+From 2d2e2fcdd9646849716ee99d8d3e5d72ae8889bc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:44:14 +0000
 Subject: [PATCH 11/15] Change default emulation for mips64*-*-linux
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/bfd/config.bfd b/bfd/config.bfd
-index f04a993f06..8777f96bd2 100644
+index 6391f35684..8a11c0680a 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -1189,12 +1189,12 @@ case "${targ}" in
+@@ -913,12 +913,12 @@ case "${targ}" in
      targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec mips_ecoff_be_vec mips_ecoff_le_vec"
      ;;
    mips64*el-*-linux*)
@@ -35,10 +35,10 @@ index f04a993f06..8777f96bd2 100644
    mips*el-*-linux*)
      targ_defvec=mips_elf32_trad_le_vec
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index 6183a85b3d..1d78465590 100644
+index fad8b2e5c8..7fb2168503 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -535,11 +535,11 @@ mips*el-*-vxworks*)	targ_emul=elf32elmipvxworks
+@@ -464,11 +464,11 @@ mips*el-*-vxworks*)	targ_emul=elf32elmipvxworks
  mips*-*-vxworks*)	targ_emul=elf32ebmipvxworks
  			targ_extra_emuls="elf32elmipvxworks" ;;
  mips*-*-windiss)	targ_emul=elf32mipswindiss ;;
@@ -55,5 +55,5 @@ index 6183a85b3d..1d78465590 100644
  mips*el-*-linux-*)	targ_emul=elf32ltsmip
  			targ_extra_emuls="elf32btsmip elf32ltsmipn32 elf64ltsmip elf32btsmipn32 elf64btsmip"
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch b/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
index 1fefb680f8..4d64bd53f8 100644
--- a/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
+++ b/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
@@ -1,4 +1,4 @@
-From 3b40bf584615f794b85fd50d4d0a5c0a1d2ee7bf Mon Sep 17 00:00:00 2001
+From 96ff7570c29f792c466a933529fefda9b8e97994 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:06:19 +0000
 Subject: [PATCH 12/15] Add support for Netlogic XLP
@@ -34,10 +34,10 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  14 files changed, 61 insertions(+), 21 deletions(-)
 
 diff --git a/bfd/aoutx.h b/bfd/aoutx.h
-index eec9c4ad2a..3bf0a71e63 100644
+index 023843b0be..46246fec2d 100644
 --- a/bfd/aoutx.h
 +++ b/bfd/aoutx.h
-@@ -814,6 +814,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,
+@@ -798,6 +798,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,
  	case bfd_mach_mipsisa64r6:
  	case bfd_mach_mips_sb1:
  	case bfd_mach_mips_xlr:
@@ -46,10 +46,10 @@ index eec9c4ad2a..3bf0a71e63 100644
  	  arch_flags = M_MIPS2;
  	  break;
 diff --git a/bfd/archures.c b/bfd/archures.c
-index e83c57a2f3..3016ea1bae 100644
+index 282e983086..b38b05d132 100644
 --- a/bfd/archures.c
 +++ b/bfd/archures.c
-@@ -201,6 +201,7 @@ DESCRIPTION
+@@ -183,6 +183,7 @@ DESCRIPTION
  .#define bfd_mach_mips_octeon3		6503
  .#define bfd_mach_mips_xlr		887682	 {* decimal 'XLR'.  *}
  .#define bfd_mach_mips_interaptiv_mr2	736550	 {* decimal 'IA2'.  *}
@@ -58,10 +58,10 @@ index e83c57a2f3..3016ea1bae 100644
  .#define bfd_mach_mipsisa32r2		33
  .#define bfd_mach_mipsisa32r3		34
 diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
-index 42991e7848..27abc5d5a8 100644
+index 93745bd3fd..326e9e49ed 100644
 --- a/bfd/bfd-in2.h
 +++ b/bfd/bfd-in2.h
-@@ -2062,6 +2062,7 @@ enum bfd_architecture
+@@ -2054,6 +2054,7 @@ enum bfd_architecture
  #define bfd_mach_mips_octeon3          6503
  #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'.  */
  #define bfd_mach_mips_interaptiv_mr2   736550   /* decimal 'IA2'.  */
@@ -70,10 +70,10 @@ index 42991e7848..27abc5d5a8 100644
  #define bfd_mach_mipsisa32r2           33
  #define bfd_mach_mipsisa32r3           34
 diff --git a/bfd/config.bfd b/bfd/config.bfd
-index 8777f96bd2..7b80bda8c9 100644
+index 8a11c0680a..c882421343 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -1172,6 +1172,11 @@ case "${targ}" in
+@@ -896,6 +896,11 @@ case "${targ}" in
      targ_defvec=mips_elf32_le_vec
      targ_selvecs="mips_elf32_be_vec mips_elf64_be_vec mips_elf64_le_vec"
      ;;
@@ -110,10 +110,10 @@ index cb50c64371..2b9d1d6ecf 100644
  
  /* The default architecture is mips:3000, but with a machine number of
 diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c
-index 285401367d..14ebb5f175 100644
+index d91942301c..5d1bd3f0b1 100644
 --- a/bfd/elfxx-mips.c
 +++ b/bfd/elfxx-mips.c
-@@ -6806,6 +6806,9 @@ _bfd_elf_mips_mach (flagword flags)
+@@ -6805,6 +6805,9 @@ _bfd_elf_mips_mach (flagword flags)
      case E_MIPS_MACH_IAMR2:
        return bfd_mach_mips_interaptiv_mr2;
  
@@ -123,7 +123,7 @@ index 285401367d..14ebb5f175 100644
      default:
        switch (flags & EF_MIPS_ARCH)
  	{
-@@ -11963,6 +11966,10 @@ mips_set_isa_flags (bfd *abfd)
+@@ -12003,6 +12006,10 @@ mips_set_isa_flags (bfd *abfd)
        val = E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;
        break;
  
@@ -134,7 +134,7 @@ index 285401367d..14ebb5f175 100644
      case bfd_mach_mipsisa32:
        val = E_MIPS_ARCH_32;
        break;
-@@ -13936,6 +13943,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
+@@ -13992,6 +13999,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
    { bfd_mach_mips_octeonp, bfd_mach_mips_octeon },
    { bfd_mach_mips_octeon, bfd_mach_mipsisa64r2 },
    { bfd_mach_mips_loongson_3a, bfd_mach_mipsisa64r2 },
@@ -143,10 +143,10 @@ index 285401367d..14ebb5f175 100644
    /* MIPS64 extensions.  */
    { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },
 diff --git a/binutils/readelf.c b/binutils/readelf.c
-index ae1cda9a7b..fed0387a94 100644
+index 2b78db219b..7a7178925f 100644
 --- a/binutils/readelf.c
 +++ b/binutils/readelf.c
-@@ -3370,6 +3370,7 @@ get_machine_flags (Filedata * filedata, unsigned e_flags, unsigned e_machine)
+@@ -3403,6 +3403,7 @@ get_machine_flags (Filedata * filedata, unsigned e_flags, unsigned e_machine)
  	    case E_MIPS_MACH_OCTEON3: strcat (buf, ", octeon3"); break;
  	    case E_MIPS_MACH_XLR:  strcat (buf, ", xlr"); break;
  	    case E_MIPS_MACH_IAMR2:  strcat (buf, ", interaptiv-mr2"); break;
@@ -155,7 +155,7 @@ index ae1cda9a7b..fed0387a94 100644
  	    /* We simply ignore the field in this case to avoid confusion:
  	       MIPS ELF does not specify EF_MIPS_MACH, it is a GNU
 diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c
-index c135131b59..d8fbda8e31 100644
+index 59df787155..48537226c0 100644
 --- a/gas/config/tc-mips.c
 +++ b/gas/config/tc-mips.c
 @@ -552,6 +552,7 @@ static int mips_32bitmode = 0;
@@ -174,7 +174,7 @@ index c135131b59..d8fbda8e31 100644
     )
  
  /* Whether the processor uses hardware interlocks to protect reads
-@@ -19737,7 +19739,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
+@@ -19778,7 +19780,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
    /* Broadcom XLP.
       XLP is mostly like XLR, with the prominent exception that it is
       MIPS64R2 rather than MIPS64.  */
@@ -184,10 +184,10 @@ index c135131b59..d8fbda8e31 100644
    /* MIPS 64 Release 6 */
    { "i6400",	      0, ASE_MSA,		ISA_MIPS64R6, CPU_MIPS64R6},
 diff --git a/gas/configure b/gas/configure
-index a40ac2144f..65a6995243 100755
+index 134278fa25..2fdca147a1 100755
 --- a/gas/configure
 +++ b/gas/configure
-@@ -12989,6 +12989,9 @@ _ACEOF
+@@ -13336,6 +13336,9 @@ _ACEOF
  	  mipsisa64r6 | mipsisa64r6el)
  	    mips_cpu=mips64r6
  	    ;;
@@ -198,7 +198,7 @@ index a40ac2144f..65a6995243 100755
  	    mips_cpu=r3900
  	    ;;
 diff --git a/include/elf/mips.h b/include/elf/mips.h
-index 9de0b4e175..74fc4f7e55 100644
+index 4e2cde3279..c329f38929 100644
 --- a/include/elf/mips.h
 +++ b/include/elf/mips.h
 @@ -290,6 +290,7 @@ END_RELOC_NUMBERS (R_MIPS_maxext)
@@ -210,10 +210,10 @@ index 9de0b4e175..74fc4f7e55 100644
  #define E_MIPS_MACH_OCTEON3	0x008e0000
  #define E_MIPS_MACH_5400	0x00910000
 diff --git a/include/opcode/mips.h b/include/opcode/mips.h
-index 5eea72f139..90f6d57e15 100644
+index 1ab1780567..74f457b579 100644
 --- a/include/opcode/mips.h
 +++ b/include/opcode/mips.h
-@@ -1259,6 +1259,8 @@ static const unsigned int mips_isa_table[] = {
+@@ -1262,6 +1262,8 @@ static const unsigned int mips_isa_table[] = {
  #define INSN_XLR                 0x00000020
  /* Imagination interAptiv MR2.  */
  #define INSN_INTERAPTIV_MR2	  0x04000000
@@ -222,7 +222,7 @@ index 5eea72f139..90f6d57e15 100644
  
  /* DSP ASE */
  #define ASE_DSP			0x00000001
-@@ -1365,6 +1367,7 @@ static const unsigned int mips_isa_table[] = {
+@@ -1373,6 +1375,7 @@ static const unsigned int mips_isa_table[] = {
  #define CPU_OCTEON3	6503
  #define CPU_XLR     	887682   	/* decimal 'XLR'   */
  #define CPU_INTERAPTIV_MR2 736550	/* decimal 'IA2'  */
@@ -230,7 +230,7 @@ index 5eea72f139..90f6d57e15 100644
  
  /* Return true if the given CPU is included in INSN_* mask MASK.  */
  
-@@ -1445,6 +1448,9 @@ cpu_is_member (int cpu, unsigned int mask)
+@@ -1453,6 +1456,9 @@ cpu_is_member (int cpu, unsigned int mask)
        return ((mask & INSN_ISA_MASK) == INSN_ISA32R6)
  	     || ((mask & INSN_ISA_MASK) == INSN_ISA64R6);
  
@@ -241,10 +241,10 @@ index 5eea72f139..90f6d57e15 100644
        return FALSE;
      }
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index 1d78465590..307e787b64 100644
+index 7fb2168503..a1db7adfe2 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -521,6 +521,8 @@ mips*el-sde-elf* | mips*el-mti-elf* | mips*el-img-elf*)
+@@ -450,6 +450,8 @@ mips*el-sde-elf* | mips*el-mti-elf* | mips*el-img-elf*)
  mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
  			targ_emul=elf32btsmip
  			targ_extra_emuls="elf32ltsmip elf32btsmipn32 elf64btsmip elf32ltsmipn32 elf64ltsmip" ;;
@@ -254,10 +254,10 @@ index 1d78465590..307e787b64 100644
  			targ_extra_emuls="elf32lr5900"
  			targ_extra_libpath=$targ_extra_emuls ;;
 diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c
-index 984fcbb802..95b107d216 100644
+index bbf21328e8..38e487c16f 100644
 --- a/opcodes/mips-dis.c
 +++ b/opcodes/mips-dis.c
-@@ -655,13 +655,11 @@ const struct mips_arch_choice mips_arch_choices[] =
+@@ -656,13 +656,11 @@ const struct mips_arch_choice mips_arch_choices[] =
      mips_cp0sel_names_xlr, ARRAY_SIZE (mips_cp0sel_names_xlr),
      mips_cp1_names_mips3264, mips_hwr_names_numeric },
  
@@ -277,10 +277,10 @@ index 984fcbb802..95b107d216 100644
    /* This entry, mips16, is here only for ISA/processor selection; do
       not print its name.  */
 diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c
-index 180d613c93..65b7b8cc23 100644
+index 1cbcbc6abc..e1fbdc89de 100644
 --- a/opcodes/mips-opc.c
 +++ b/opcodes/mips-opc.c
-@@ -328,6 +328,7 @@ decode_mips_operand (const char *p)
+@@ -329,6 +329,7 @@ decode_mips_operand (const char *p)
  #define IOCT3	INSN_OCTEON3
  #define XLR     INSN_XLR
  #define IAMR2	INSN_INTERAPTIV_MR2
@@ -288,7 +288,7 @@ index 180d613c93..65b7b8cc23 100644
  #define IVIRT	ASE_VIRT
  #define IVIRT64	ASE_VIRT64
  
-@@ -966,6 +967,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -974,6 +975,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"clo",			"U,s",		0x70000021, 0xfc0007ff, WR_1|RD_2,		0,		I32|N55,	0,	I37 },
  {"clz",			"d,s",		0x00000050, 0xfc1f07ff, WR_1|RD_2,		0,		I37,		0,	0 },
  {"clz",			"U,s",		0x70000020, 0xfc0007ff, WR_1|RD_2,		0,		I32|N55,	0,	I37 },
@@ -296,7 +296,7 @@ index 180d613c93..65b7b8cc23 100644
  /* ctc0 is at the bottom of the table.  */
  {"ctc1",		"t,G",		0x44c00000, 0xffe007ff,	RD_1|WR_CC|CM,		0,		I1,		0,	0 },
  {"ctc1",		"t,S",		0x44c00000, 0xffe007ff,	RD_1|WR_CC|CM,		0,		I1,		0,	0 },
-@@ -998,12 +1000,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1006,12 +1008,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"daddiu",		"t,r,j",	0x64000000, 0xfc000000, WR_1|RD_2,		0,		I3,		0,	0 },
  {"daddu",		"d,v,t",	0x0000002d, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I3,		0,	0 },
  {"daddu",		"t,r,I",	0,    (int) M_DADDU_I,	INSN_MACRO,		0,		I3,		0,	0 },
@@ -311,7 +311,7 @@ index 180d613c93..65b7b8cc23 100644
  /* dctr and dctw are used on the r5000.  */
  {"dctr",		"o(b)",	 	0xbc050000, 0xfc1f0000, RD_2,			0,		I3,		0,	0 },
  {"dctw",		"o(b)",		0xbc090000, 0xfc1f0000, RD_2,			0,		I3,		0,	0 },
-@@ -1075,6 +1078,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1083,6 +1086,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"dmfc0",		"t,G,H",	0x40200000, 0xffe007f8,	WR_1|RD_C0|LC,		0,		I64,		0,	0 },
  {"dmfgc0",		"t,G",		0x40600100, 0xffe007ff, WR_1|RD_C0|LC,		0,		0,		IVIRT64, 0 },
  {"dmfgc0",		"t,G,H",	0x40600100, 0xffe007f8, WR_1|RD_C0|LC,		0,		0,		IVIRT64, 0 },
@@ -319,7 +319,7 @@ index 180d613c93..65b7b8cc23 100644
  {"dmt",			"",		0x41600bc1, 0xffffffff, TRAP,			0,		0,		MT32,	0 },
  {"dmt",			"t",		0x41600bc1, 0xffe0ffff, WR_1|TRAP,		0,		0,		MT32,	0 },
  {"dmtc0",		"t,G",		0x40a00000, 0xffe007ff,	RD_1|WR_C0|WR_CC|CM,	0,		I3,		0,	EE },
-@@ -1090,6 +1094,8 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1098,6 +1102,8 @@ const struct mips_opcode mips_builtin_opcodes[] =
  /* dmfc3 is at the bottom of the table.  */
  /* dmtc3 is at the bottom of the table.  */
  {"dmuh",		"d,s,t",	0x000000dc, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I69,		0,	0 },
@@ -328,7 +328,7 @@ index 180d613c93..65b7b8cc23 100644
  {"dmul",		"d,s,t",	0x0000009c, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I69,		0,	0 },
  {"dmul",		"d,v,t",	0x70000003, 0xfc0007ff, WR_1|RD_2|RD_3|WR_HILO,	0,		IOCT,		0,	0 },
  {"dmul",		"d,v,t",	0,    (int) M_DMUL,	INSN_MACRO,		0,		I3,		0,	M32|I69 },
-@@ -1243,9 +1249,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1251,9 +1257,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"ld",			"s,-b(+R)",	0xec180000, 0xfc1c0000, WR_1,			RD_pc,		I69,		0,	0 },
  {"ld",			"t,A(b)",	0,    (int) M_LD_AB,	INSN_MACRO,		0,		I1,		0,	0 },
  {"ld",			"t,o(b)",	0xdc000000, 0xfc000000, WR_1|RD_3|LM,		0,		I3,		0,	0 },
@@ -341,7 +341,7 @@ index 180d613c93..65b7b8cc23 100644
  {"ldc1",		"T,o(b)",	0xd4000000, 0xfc000000, WR_1|RD_3|CLD|FP_D,	0,		I2,		0,	SF },
  {"ldc1",		"E,o(b)",	0xd4000000, 0xfc000000, WR_1|RD_3|CLD|FP_D,	0,		I2,		0,	SF },
  {"ldc1",		"T,A(b)",	0,    (int) M_LDC1_AB,	INSN_MACRO,		INSN2_M_FP_D,	I2,		0,	SF },
-@@ -1410,7 +1416,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1418,7 +1424,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"mflo",		"d,9",		0x00000012, 0xff9f07ff, WR_1|RD_LO,		0,		0,		D32,	0 },
  {"mflo1",		"d",		0x70000012, 0xffff07ff,	WR_1|RD_LO,		0,		EE,		0,	0 },
  {"mflhxu",		"d",		0x00000052, 0xffff07ff,	WR_1|MOD_HILO,		0,		0,		SMT,	0 },
@@ -350,7 +350,7 @@ index 180d613c93..65b7b8cc23 100644
  {"mfsa",		"d",		0x00000028, 0xffff07ff,	WR_1,			0,		EE,		0,	0 },
  {"min.ob",		"X,Y,Q",	0x78000006, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		SB1,		MX,	0 },
  {"min.ob",		"D,S,Q",	0x48000006, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		N54,		0,	0 },
-@@ -1455,10 +1461,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1463,10 +1469,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
  /* move is at the top of the table.  */
  {"msgn.qh",		"X,Y,Q",	0x78200000, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		0,		MX,	0 },
  {"msgsnd",		"t",		0,    (int) M_MSGSND,	INSN_MACRO,		0,		XLR,		0,	0 },
@@ -366,7 +366,7 @@ index 180d613c93..65b7b8cc23 100644
  {"msub.d",		"D,R,S,T",	0x4c000029, 0xfc00003f, WR_1|RD_2|RD_3|RD_4|FP_D, 0,		I4_33,		0,	I37 },
  {"msub.d",		"D,S,T",	0x46200019, 0xffe0003f,	WR_1|RD_2|RD_3|FP_D,	0,		IL2E,		0,	0 },
  {"msub.d",		"D,S,T",	0x72200019, 0xffe0003f,	WR_1|RD_2|RD_3|FP_D,	0,		IL2F,		0,	0 },
-@@ -1508,7 +1517,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1516,7 +1525,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"mtlo",		"s,7",		0x00000013, 0xfc1fe7ff, RD_1|WR_LO,		0,		0,		D32,	0 },
  {"mtlo1",		"s",		0x70000013, 0xfc1fffff,	RD_1|WR_LO,		0,		EE,		0,	0 },
  {"mtlhx",		"s",		0x00000053, 0xfc1fffff,	RD_1|MOD_HILO,		0,		0,		SMT,	0 },
@@ -375,7 +375,7 @@ index 180d613c93..65b7b8cc23 100644
  {"mtm0",		"s",		0x70000008, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
  {"mtm0",    		"s,t",		0x70000008, 0xfc00ffff, RD_1|RD_2,		0,		IOCT3,		0,	0 },
  {"mtm1",		"s",		0x7000000c, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
-@@ -1945,9 +1954,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1953,9 +1962,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"suxc1",		"S,t(b)",	0x4c00000d, 0xfc0007ff, RD_1|RD_2|RD_3|SM|FP_D,	0,		I5_33|N55,	0,	I37},
  {"sw",			"t,o(b)",	0xac000000, 0xfc000000,	RD_1|RD_3|SM,		0,		I1,		0,	0 },
  {"sw",			"t,A(b)",	0,    (int) M_SW_AB,	INSN_MACRO,		0,		I1,		0,	0 },
@@ -389,5 +389,5 @@ index 180d613c93..65b7b8cc23 100644
  {"swc0",		"E,A(b)",	0,    (int) M_SWC0_AB,	INSN_MACRO,		0,		I1,		0,	IOCT|IOCTP|IOCT2|I37 },
  {"swc1",		"T,o(b)",	0xe4000000, 0xfc000000,	RD_1|RD_3|SM|FP_S,	0,		I1,		0,	0 },
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
index c3e1b13841..c9ffdada91 100644
--- a/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
+++ b/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
@@ -1,4 +1,4 @@
-From 27ec22ca3cd56cfdf060d2e1f414bedce269b322 Mon Sep 17 00:00:00 2001
+From d45455db35db5693c5efe0e1b384295e4c0db998 Mon Sep 17 00:00:00 2001
 From: Zhenhua Luo <zhenhua.luo@nxp.com>
 Date: Sat, 11 Jun 2016 22:08:29 -0500
 Subject: [PATCH 13/15] fix the incorrect assembling for ppc wait mnemonic
@@ -11,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
-index bb17f26c2e..dbdd762b4e 100644
+index 4a0fca5f0a..49f72fc35c 100644
 --- a/opcodes/ppc-opc.c
 +++ b/opcodes/ppc-opc.c
-@@ -5338,7 +5338,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+@@ -5351,7 +5351,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
  {"ldepx",	X(31,29),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
  
  {"waitasec",	X(31,30),      XRTRARB_MASK, POWER8,	POWER9,		{0}},
@@ -22,7 +22,7 @@ index bb17f26c2e..dbdd762b4e 100644
  
  {"lwepx",	X(31,31),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
  
-@@ -5392,7 +5391,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+@@ -5405,7 +5404,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
  
  {"waitrsv",	X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
  {"waitimpl",	X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
@@ -32,5 +32,5 @@ index bb17f26c2e..dbdd762b4e 100644
  {"dcbstep",	XRT(31,63,0),	XRT_MASK,    E500MC|PPCA2, 0,		{RA0, RB}},
  
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch b/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch
index cf3690f25d..6197df6d5a 100644
--- a/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch
+++ b/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch
@@ -1,4 +1,4 @@
-From 7dfbd6889d868a09d695dd2736104848c1a9c9c3 Mon Sep 17 00:00:00 2001
+From 9af90cfc35ff1fe78755578861473039836c467a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 31 Mar 2017 11:42:03 -0700
 Subject: [PATCH 14/15] Detect 64-bit MIPS targets
@@ -46,5 +46,5 @@ index 8aef22a318..7030026ffa 100644
   targ_obj=mips
   targ_machine=EM_MIPS
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
index 8c9fd237e7..7dc8ba8c37 100644
--- a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
+++ b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
@@ -1,4 +1,4 @@
-From 298804f430939d6cc94b09732ee93e64c5e6be18 Mon Sep 17 00:00:00 2001
+From f9e26bd29b5f017ea1307b51b5036063bff78600 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Mar 2017 23:33:27 -0800
 Subject: [PATCH 15/15] sync with OE libtool changes
@@ -85,5 +85,5 @@ index 11ee684ccc..3b19ac1532 100644
  	elif test -n "$runpath_var"; then
  	  case "$finalize_perm_rpath " in
 -- 
-2.16.1
+2.18.0
 
diff --git a/meta/recipes-devtools/binutils/binutils_2.30.bb b/meta/recipes-devtools/binutils/binutils_2.31.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils_2.30.bb
rename to meta/recipes-devtools/binutils/binutils_2.31.bb
-- 
2.18.0


