Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id E33F87888A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 04:32:13 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id k68so6266343pga.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 20:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zgZmsf3GTDMYOagHoZUpRWGBE0sFjBK4MVwRJHtW3zA=;
	b=ovUg1xMHEbRSKZYbJRO7O9eLyn4e7DNInWh7K+Ep4plZN28pC2vpJA4TYgqingStBx
	5MJ8IFymjVsnbs312LyOa0RBQrCdRUoZQNnz4+2YGcPSR5p0UtxAa/lSHKu0MzFRhRjm
	6EddPc/4nNJZs1kMBKEIU+YYk0UKPOcH7E9/YBG/ImJK6LXCXDMkwTQbp+wcBMbhYXUn
	PXIgVF/V6IaBPd1ChZwgfx49kG8pkXvHK98v+1qawIMNMLY8Y/lR8LWpe1FVh58XKZAg
	Rvb2b4WQCDASo6mkpq2kPacaQTbDbGQCQxtOLK8/BO8JeaKqWDbRrbN03F4Nm3673PKI
	cAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zgZmsf3GTDMYOagHoZUpRWGBE0sFjBK4MVwRJHtW3zA=;
	b=WFIca7Y6yCFNOZp3PxSFVHiVKa1TdvCk9CBj47RyvlGcsH2NEclOZMyoclEzl6sVXU
	6vjcbQsPYPx/imgTU6k3DnCYs/Pf/44869CrTRCyJ8Aw8uwgdJIC+w7xHcknPB2zx3j7
	9UV0TDcILDG4E6U60icfixNP1anX9hH2DJoc+Nf5oa+jLZVBlGBD5jvC2lJYanjF37ho
	eKOo0287tM/ZU0VKlC2dHPIRzFKqKS8kg5ciYNoDx5p4OFKSQYAgyGRALGz9F6HFatW7
	Goj9EYMXS8aWfdRV2p+QsX0KSdMzFTiFNCT+xdwtbOa7Mhey41Ze/mFba3WlUS5ZZezx
	dRPA==
X-Gm-Message-State: AKwxytc3CepjQ1c8RqP8ywZmkEqV3GPqjV09PGyAhtapDcwew6kYP0kC
	J0vzO+vYokC3dKfQOuzCpH0syQ==
X-Google-Smtp-Source: AH8x225uTZM5X3XySb30KzJSe18g+288zFLCkniaSfIfXNVxXnFmQe4IixNgzpZC0PEV51or+cG29w==
X-Received: by 2002:a17:902:61:: with SMTP id
	88-v6mr15171791pla.428.1517286734320; 
	Mon, 29 Jan 2018 20:32:14 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	u67sm1134233pfd.169.2018.01.29.20.32.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 20:32:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 20:31:56 -0800
Message-Id: <ffea6c04b1daafcc2889ee89e25dbd409ea43102.1517286478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <cover.1517286478.git.raj.khem@gmail.com>
References: <cover.1517286478.git.raj.khem@gmail.com>
Subject: [PATCH 8/8] binutils: Upgrade to 2.30 release
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
X-List-Received-Date: Tue, 30 Jan 2018 04:32:14 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 .../{binutils-2.29.1.inc => binutils-2.30.inc}     |  2 +-
 ...n_2.29.1.bb => binutils-cross-canadian_2.30.bb} |  0
 ...tils-cross_2.29.1.bb => binutils-cross_2.30.bb} |  0
 ...rosssdk_2.29.1.bb => binutils-crosssdk_2.30.bb} |  0
 ...nutils-crosssdk-Generate-relocatable-SDKs.patch | 14 ++---
 ...oss-Do-not-generate-linker-script-directo.patch |  6 +-
 ...ure-widen-the-regexp-for-SH-architectures.patch | 14 ++---
 .../0004-Point-scripts-location-to-libdir.patch    |  8 +--
 ...te-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch | 10 ++--
 .../binutils/binutils/0006-Use-libtool-2.4.patch   | 66 ++++++++------------
 ...7-Add-the-armv5e-architecture-to-binutils.patch |  8 +--
 ...he-distro-compiler-point-to-the-wrong-ins.patch |  6 +-
 ...es-of-system-directories-when-cross-linki.patch | 24 ++++----
 ...-rpath-in-libtool-when-sysroot-is-enabled.patch |  4 +-
 ...Change-default-emulation-for-mips64-linux.patch | 14 ++---
 .../0012-Add-support-for-Netlogic-XLP.patch        | 70 +++++++++++-----------
 ...ncorrect-assembling-for-ppc-wait-mnemonic.patch | 10 ++--
 .../binutils/0014-Detect-64-bit-MIPS-targets.patch |  6 +-
 .../0015-sync-with-OE-libtool-changes.patch        |  4 +-
 .../{binutils_2.29.1.bb => binutils_2.30.bb}       |  0
 21 files changed, 127 insertions(+), 141 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.29.1.inc => binutils-2.30.inc} (97%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.29.1.bb => binutils-cross-canadian_2.30.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.29.1.bb => binutils-cross_2.30.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.29.1.bb => binutils-crosssdk_2.30.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.29.1.bb => binutils_2.30.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 1787a8248d..98b1a2a7ba 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -24,7 +24,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "7.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-BINUVERSION ?= "2.29%"
+BINUVERSION ?= "2.30%"
 GDBVERSION ?= "8.0%"
 GLIBCVERSION ?= "2.26%"
 LINUXLIBCVERSION ?= "4.12%"
diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.30.inc
similarity index 97%
rename from meta/recipes-devtools/binutils/binutils-2.29.1.inc
rename to meta/recipes-devtools/binutils/binutils-2.30.inc
index 07a72e2b5a..74c65f5473 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.30.inc
@@ -18,7 +18,7 @@ BINUPV = "${@binutils_branch_version(d)}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "90276f15379d380761fc499da2ba24cfb3c12a94"
+SRCREV ?= "8db5daf9efe8a6174d3b10ac7bba8c178836e9ce"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.29.1.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.30.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.29.1.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.30.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.29.1.bb b/meta/recipes-devtools/binutils/binutils-cross_2.30.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.29.1.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.30.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.29.1.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.30.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.29.1.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.30.bb
diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
index 0b515d83c7..2df836057d 100644
--- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
+++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
@@ -1,4 +1,4 @@
-From 58ac9f95a3d83c29efaf7a8906fb6aefea8c8e79 Mon Sep 17 00:00:00 2001
+From 2e1b5e24a6759de7f73aa6060a574848d9131b5a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:58:54 +0000
 Subject: [PATCH 01/15] binutils-crosssdk: Generate relocatable SDKs
@@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index b6940d376d..a42c4d7a4b 100755
+index 8732422b3a..1f257e99ca 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
 @@ -277,6 +277,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
@@ -37,16 +37,16 @@ index b6940d376d..a42c4d7a4b 100755
  ( echo "/* Script for ld -Ur: link w/out relocation, do create constructors */"
    . ${CUSTOMIZER_SCRIPT}
    . ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
- ) | sed -e '/^ *$/d;s/[ 	]*$//' > ldscripts/${EMULATION_NAME}.xu
+ ) | sed -e '/^ *$/d;s/[	 ]*$//' > ldscripts/${EMULATION_NAME}.xu
 +unset PARTIAL_LINKING
  
- LD_FLAG=
  DATA_ALIGNMENT=${DATA_ALIGNMENT_}
+ RELOCATING=" "
 diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
-index d9138bc059..e48faeca43 100644
+index 9787ab5dac..0c8a93c2c8 100644
 --- a/ld/scripttempl/elf.sc
 +++ b/ld/scripttempl/elf.sc
-@@ -138,8 +138,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
+@@ -139,8 +139,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
      DATA_SEGMENT_RELRO_END=". = DATA_SEGMENT_RELRO_END (${SEPARATE_GOTPLT-0}, .);"
    fi
  fi
@@ -58,5 +58,5 @@ index d9138bc059..e48faeca43 100644
  if test -z "$PLT"; then
    IPLT=".iplt         ${RELOCATING-0} : { *(.iplt) }"
 -- 
-2.14.0
+2.16.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
index 370333d5d0..bac7fb2d1a 100644
--- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
+++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
@@ -1,4 +1,4 @@
-From 8f929c616208351d0971d7dfd7574d48d3144603 Mon Sep 17 00:00:00 2001
+From 58ddf38fa53abb48b69dd76e398c73451ad1a5eb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Mar 2017 23:37:05 -0800
 Subject: [PATCH 02/15] binutils-cross: Do not generate linker script
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 23 deletions(-)
 
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index a42c4d7a4b..d727b4d07e 100755
+index 1f257e99ca..1583b73a2b 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
 @@ -189,29 +189,6 @@ append_to_lib_path()
@@ -57,5 +57,5 @@ index a42c4d7a4b..d727b4d07e 100755
    libs=${NATIVE_LIB_DIRS}
    if [ "x${NATIVE}" = "xyes" ] ; then
 -- 
-2.14.0
+2.16.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch b/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch
index b6c09ccf19..306afe7018 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch
@@ -1,4 +1,4 @@
-From e5a806aae02a10290c71deb72f6294c98068368d Mon Sep 17 00:00:00 2001
+From 5089be88f670bcadf7db0e778894f900b2c05d7b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:07:33 +0000
 Subject: [PATCH 03/15] configure: widen the regexp for SH architectures
@@ -14,12 +14,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index be9dd89d9b..d8af155ab5 100755
+index 2d615a9996..c4ad45c06c 100755
 --- a/configure
 +++ b/configure
-@@ -3844,7 +3844,7 @@ case "${target}" in
-   or1k*-*-*)
-     noconfigdirs="$noconfigdirs gdb"
+@@ -3835,7 +3835,7 @@ case "${target}" in
+   nvptx*-*-*)
+     noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
      ;;
 -  sh-*-*)
 +  sh*-*-* | sh64-*-*)
@@ -27,7 +27,7 @@ index be9dd89d9b..d8af155ab5 100755
        sh*-*-elf)
           ;;
 diff --git a/gprof/configure b/gprof/configure
-index e71fe8b9e4..679e0dce77 100755
+index 1e25102976..6b43bf2b18 100755
 --- a/gprof/configure
 +++ b/gprof/configure
 @@ -5874,6 +5874,11 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
@@ -43,5 +43,5 @@ index e71fe8b9e4..679e0dce77 100755
    if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
      lt_cv_deplibs_check_method='match_pattern /lib[^/]+(\.so\.[0-9]+\.[0-9]+|_pic\.a)$'
 -- 
-2.14.0
+2.16.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
index 38eee30855..3e29c5815a 100644
--- a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
+++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
@@ -1,4 +1,4 @@
-From 3634ec3547bc0f8a5d1b8ad15365e2f836cda642 Mon Sep 17 00:00:00 2001
+From a0e893ea094c48fa803046ffa89e31907aee0597 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:09:58 +0000
 Subject: [PATCH 04/15] Point scripts location to libdir
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index 625347ff62..d5334d2681 100644
+index 6243c12528..3c5d6c8202 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
 @@ -57,7 +57,7 @@ endif
@@ -25,7 +25,7 @@ index 625347ff62..d5334d2681 100644
  EMUL = @EMUL@
  EMULATION_OFILES = @EMULATION_OFILES@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index ba251777b0..a2cf2282b5 100644
+index 760c037f9d..6dea692869 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
 @@ -446,7 +446,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
@@ -38,5 +38,5 @@ index ba251777b0..a2cf2282b5 100644
  BFDDIR = $(BASEDIR)/bfd
  INCDIR = $(BASEDIR)/include
 -- 
-2.14.0
+2.16.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
index 59150a2e4d..2f49969371 100644
--- a/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
+++ b/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
@@ -1,4 +1,4 @@
-From 9d37c8f68c07da63186cb993f1221f6c11eca422 Mon Sep 17 00:00:00 2001
+From 518abb195d0eb47d8eef581d7fd0a5fd9fa73f7d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:27:17 +0000
 Subject: [PATCH 05/15] Only generate an RPATH entry if LD_RUN_PATH is not
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
-index 9ac1840316..9dc4c149bc 100644
+index c0925fc9b9..7d7670a89f 100644
 --- a/ld/emultempl/elf32.em
 +++ b/ld/emultempl/elf32.em
-@@ -1463,6 +1463,8 @@ fragment <<EOF
+@@ -1470,6 +1470,8 @@ fragment <<EOF
  	      && command_line.rpath == NULL)
  	    {
  	      path = (const char *) getenv ("LD_RUN_PATH");
@@ -27,7 +27,7 @@ index 9ac1840316..9dc4c149bc 100644
  	      if (path
  		  && gld${EMULATION_NAME}_search_needed (path, &n, force))
  		break;
-@@ -1740,6 +1742,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+@@ -1750,6 +1752,8 @@ gld${EMULATION_NAME}_before_allocation (void)
    rpath = command_line.rpath;
    if (rpath == NULL)
      rpath = (const char *) getenv ("LD_RUN_PATH");
@@ -37,5 +37,5 @@ index 9ac1840316..9dc4c149bc 100644
    for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
      if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
 -- 
-2.14.0
+2.16.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
index e87efe653b..333e2ee176 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
@@ -1,4 +1,4 @@
-From 71c734bb3754319029dcfc898cedbade42274dcb Mon Sep 17 00:00:00 2001
+From fad053cc59baa6277182b0fc90415a214060ba99 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:04:07 +0000
 Subject: [PATCH 06/15] Use libtool 2.4
@@ -12,7 +12,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  bfd/configure        | 1318 +++++++++++++++++------
  bfd/configure.ac     |    2 +-
  binutils/configure   | 1316 +++++++++++++++++------
- configure            |    2 +-
  gas/configure        | 1314 +++++++++++++++++------
  gprof/configure      | 1321 +++++++++++++++++------
  ld/configure         | 1691 +++++++++++++++++++++--------
@@ -24,10 +23,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  opcodes/configure    | 1318 +++++++++++++++++------
  opcodes/configure.ac |    2 +-
  zlib/configure       | 1316 +++++++++++++++++------
- 15 files changed, 9927 insertions(+), 3694 deletions(-)
+ 14 files changed, 9926 insertions(+), 3693 deletions(-)
 
 diff --git a/bfd/configure b/bfd/configure
-index 48276594ed..3ece8943f3 100755
+index 6c2b24ebe3..5fdd723b7f 100755
 --- a/bfd/configure
 +++ b/bfd/configure
 @@ -672,6 +672,9 @@ OTOOL
@@ -1931,7 +1930,7 @@ index 48276594ed..3ece8943f3 100755
    chmod +x "$ofile"
  
 diff --git a/bfd/configure.ac b/bfd/configure.ac
-index 8fd03a7ea8..8816c3286c 100644
+index 2342f3faea..a6451fccda 100644
 --- a/bfd/configure.ac
 +++ b/bfd/configure.ac
 @@ -254,7 +254,7 @@ changequote(,)dnl
@@ -1944,7 +1943,7 @@ index 8fd03a7ea8..8816c3286c 100644
  
  # More hacks to build DLLs on Windows.
 diff --git a/binutils/configure b/binutils/configure
-index 22e1b1736e..321b63535b 100755
+index 5d9c9105a7..a65b2b4518 100755
 --- a/binutils/configure
 +++ b/binutils/configure
 @@ -659,8 +659,11 @@ OTOOL
@@ -3841,21 +3840,8 @@ index 22e1b1736e..321b63535b 100755
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-diff --git a/configure b/configure
-index d8af155ab5..005ed827ab 100755
---- a/configure
-+++ b/configure
-@@ -3844,7 +3844,7 @@ case "${target}" in
-   or1k*-*-*)
-     noconfigdirs="$noconfigdirs gdb"
-     ;;
--  sh*-*-* | sh64-*-*)
-+  sh-*-* | sh64-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
 diff --git a/gas/configure b/gas/configure
-index 93afb20c8f..81dd4cbd97 100755
+index fbac8f44d5..a40ac2144f 100755
 --- a/gas/configure
 +++ b/gas/configure
 @@ -650,8 +650,11 @@ OTOOL
@@ -5156,7 +5142,7 @@ index 93afb20c8f..81dd4cbd97 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15436,13 +16089,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -15437,13 +16090,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -5177,7 +5163,7 @@ index 93afb20c8f..81dd4cbd97 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15457,14 +16117,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -15458,14 +16118,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -5196,7 +5182,7 @@ index 93afb20c8f..81dd4cbd97 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15497,12 +16160,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -15498,12 +16161,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -5210,7 +5196,7 @@ index 93afb20c8f..81dd4cbd97 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15557,8 +16220,13 @@ reload_flag \
+@@ -15558,8 +16221,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -5224,7 +5210,7 @@ index 93afb20c8f..81dd4cbd97 100755
  STRIP \
  RANLIB \
  CC \
-@@ -15568,12 +16236,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -15569,12 +16237,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -5240,7 +5226,7 @@ index 93afb20c8f..81dd4cbd97 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15589,7 +16259,6 @@ no_undefined_flag \
+@@ -15590,7 +16260,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -5248,7 +5234,7 @@ index 93afb20c8f..81dd4cbd97 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15625,6 +16294,7 @@ module_cmds \
+@@ -15626,6 +16295,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -5256,7 +5242,7 @@ index 93afb20c8f..81dd4cbd97 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16389,7 +17059,8 @@ $as_echo X"$file" |
+@@ -16390,7 +17060,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -5266,7 +5252,7 @@ index 93afb20c8f..81dd4cbd97 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16492,19 +17163,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -16493,19 +17164,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -5310,7 +5296,7 @@ index 93afb20c8f..81dd4cbd97 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16534,6 +17228,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -16535,6 +17229,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -5323,7 +5309,7 @@ index 93afb20c8f..81dd4cbd97 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16543,6 +17243,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -16544,6 +17244,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -5333,7 +5319,7 @@ index 93afb20c8f..81dd4cbd97 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16657,12 +17360,12 @@ with_gcc=$GCC
+@@ -16658,12 +17361,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -5349,7 +5335,7 @@ index 93afb20c8f..81dd4cbd97 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16749,9 +17452,6 @@ inherit_rpath=$inherit_rpath
+@@ -16750,9 +17453,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -5359,7 +5345,7 @@ index 93afb20c8f..81dd4cbd97 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16767,6 +17467,9 @@ include_expsyms=$lt_include_expsyms
+@@ -16768,6 +17468,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -5369,7 +5355,7 @@ index 93afb20c8f..81dd4cbd97 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16799,210 +17502,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -16800,210 +17503,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -5744,7 +5730,7 @@ index 93afb20c8f..81dd4cbd97 100755
    chmod +x "$ofile"
  
 diff --git a/gprof/configure b/gprof/configure
-index 679e0dce77..ac4c016a63 100755
+index 6b43bf2b18..245ee48bc3 100755
 --- a/gprof/configure
 +++ b/gprof/configure
 @@ -631,8 +631,11 @@ OTOOL
@@ -7654,7 +7640,7 @@ index 679e0dce77..ac4c016a63 100755
    chmod +x "$ofile"
  
 diff --git a/ld/configure b/ld/configure
-index d7f66f8cdc..4e71511bd1 100755
+index 0cc6e8a50f..db8b998722 100755
 --- a/ld/configure
 +++ b/ld/configure
 @@ -655,8 +655,11 @@ OTOOL
@@ -17336,7 +17322,7 @@ index bf92b5e079..c573da90c5 100644
  # These exist entirely to fool aclocal when bootstrapping libtool.
  #
 diff --git a/opcodes/configure b/opcodes/configure
-index 17530f54b9..79b39611c2 100755
+index 4f29887098..2127d39288 100755
 --- a/opcodes/configure
 +++ b/opcodes/configure
 @@ -650,6 +650,9 @@ OTOOL
@@ -19240,7 +19226,7 @@ index 17530f54b9..79b39611c2 100755
    chmod +x "$ofile"
  
 diff --git a/opcodes/configure.ac b/opcodes/configure.ac
-index a9fbfd61f1..c43780f64d 100644
+index b07f3f3629..5a32d9b1fc 100644
 --- a/opcodes/configure.ac
 +++ b/opcodes/configure.ac
 @@ -167,7 +167,7 @@ changequote(,)dnl
@@ -21153,5 +21139,5 @@ index dc2d9ed383..ed9a492f5c 100755
    chmod +x "$ofile"
  
 -- 
-2.14.0
+2.16.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch b/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
index 88019606f7..4a5127380f 100644
--- a/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
+++ b/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
@@ -1,4 +1,4 @@
-From 2b87aad1741bc481dd0982f100ad5ea7f937bb61 Mon Sep 17 00:00:00 2001
+From 697903256e09533778baa8af66402c44d70219d9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:37:10 +0000
 Subject: [PATCH 07/15] Add the armv5e architecture to binutils
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/gas/config/tc-arm.c b/gas/config/tc-arm.c
-index a885efe4fc..735eaa7447 100644
+index ec50420518..a25d1721af 100644
 --- a/gas/config/tc-arm.c
 +++ b/gas/config/tc-arm.c
-@@ -25990,6 +25990,7 @@ static const struct arm_arch_option_table arm_archs[] =
+@@ -26195,6 +26195,7 @@ static const struct arm_arch_option_table arm_archs[] =
    ARM_ARCH_OPT ("armv4t",	ARM_ARCH_V4T,	 FPU_ARCH_FPA),
    ARM_ARCH_OPT ("armv4txm",	ARM_ARCH_V4TxM,	 FPU_ARCH_FPA),
    ARM_ARCH_OPT ("armv5",	ARM_ARCH_V5,	 FPU_ARCH_VFP),
@@ -31,5 +31,5 @@ index a885efe4fc..735eaa7447 100644
    ARM_ARCH_OPT ("armv5txm",	ARM_ARCH_V5TxM,	 FPU_ARCH_VFP),
    ARM_ARCH_OPT ("armv5te",	ARM_ARCH_V5TE,	 FPU_ARCH_VFP),
 -- 
-2.14.0
+2.16.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
index 30a22b504f..939be67b58 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
@@ -1,4 +1,4 @@
-From 331443a87a31ec504e5652fc099d9129a9a4deb8 Mon Sep 17 00:00:00 2001
+From 622d66634eb2e509d4126f5bdcab26de367241a1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:39:01 +0000
 Subject: [PATCH 08/15] don't let the distro compiler point to the wrong
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
-index 25cfa29ad5..ce67a710e3 100644
+index ed1b334c36..d4ffd8b57b 100644
 --- a/libiberty/Makefile.in
 +++ b/libiberty/Makefile.in
 @@ -364,7 +364,8 @@ install-strip: install
@@ -31,5 +31,5 @@ index 25cfa29ad5..ce67a710e3 100644
  	if test -n "${target_header_dir}"; then \
  		${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
 -- 
-2.14.0
+2.16.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
index e0e257880d..e75104722b 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -1,4 +1,4 @@
-From 0a4afdcf0700efd45963568e2d0049127cdf4434 Mon Sep 17 00:00:00 2001
+From 27e38ee92c24fca86b1c3f6ef156a1892dd06bfd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Jan 2016 06:31:09 +0000
 Subject: [PATCH 09/15] warn for uses of system directories when cross linking
@@ -77,7 +77,7 @@ index a846743da6..df3cd5fb60 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index 4e71511bd1..71c6ad1fd1 100755
+index db8b998722..489ead5c13 100755
 --- a/ld/configure
 +++ b/ld/configure
 @@ -789,6 +789,7 @@ with_lib_path
@@ -118,7 +118,7 @@ index 4e71511bd1..71c6ad1fd1 100755
  if test "${enable_gold+set}" = set; then :
    enableval=$enable_gold; case "${enableval}" in
 diff --git a/ld/configure.ac b/ld/configure.ac
-index 00080f85fd..3aa98e37fb 100644
+index bada1b50b0..d074a3820b 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
 @@ -95,6 +95,16 @@ AC_SUBST(use_sysroot)
@@ -139,10 +139,10 @@ index 00080f85fd..3aa98e37fb 100644
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
 diff --git a/ld/ld.h b/ld/ld.h
-index c6fa1247f0..01c373498f 100644
+index ba914b921e..9df17dab6c 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
-@@ -174,6 +174,14 @@ typedef struct
+@@ -180,6 +180,14 @@ typedef struct
       in the linker script.  */
    bfd_boolean force_group_allocation;
  
@@ -158,10 +158,10 @@ index c6fa1247f0..01c373498f 100644
    enum endian_enum endian;
  
 diff --git a/ld/ld.texinfo b/ld/ld.texinfo
-index ebe7e7b7bd..33aa2c62fa 100644
+index c89915f1aa..df430837e2 100644
 --- a/ld/ld.texinfo
 +++ b/ld/ld.texinfo
-@@ -2480,6 +2480,18 @@ string identifying the original linked file does not change.
+@@ -2498,6 +2498,18 @@ string identifying the original linked file does not change.
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
@@ -181,7 +181,7 @@ index ebe7e7b7bd..33aa2c62fa 100644
  
  @c man end
 diff --git a/ld/ldfile.c b/ld/ldfile.c
-index 3b37a0a3e2..5c85b01849 100644
+index 6532a57d96..f943f0b2e5 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
 @@ -116,6 +116,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
@@ -209,7 +209,7 @@ index 3b37a0a3e2..5c85b01849 100644
  
  /* Try to open a BFD for a lang_input_statement.  */
 diff --git a/ld/ldlex.h b/ld/ldlex.h
-index 5aa7f6bc3e..cb655e0399 100644
+index 140ed1d9da..9965cbc04f 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
 @@ -147,6 +147,8 @@ enum option_values
@@ -222,7 +222,7 @@ index 5aa7f6bc3e..cb655e0399 100644
  
  /* The initial parser states.  */
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index 2b09f20413..89e2a3a805 100644
+index c473ed24c3..adae0b4610 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
 @@ -261,6 +261,8 @@ main (int argc, char **argv)
@@ -235,7 +235,7 @@ index 2b09f20413..89e2a3a805 100644
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index effa277b16..e4929607e9 100644
+index f2191602d4..bccb3bdeef 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
 @@ -538,6 +538,14 @@ static const struct ld_option ld_options[] =
@@ -269,5 +269,5 @@ index effa277b16..e4929607e9 100644
      }
  
 -- 
-2.14.0
+2.16.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
index 496242efa4..33dfff9bd7 100644
--- a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
+++ b/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
@@ -1,4 +1,4 @@
-From 88fac08f1c472c612f381cbb9408756f2f58b4ff Mon Sep 17 00:00:00 2001
+From e205ae05c41a8cc8d47708f0a3b6f740e2bf2526 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:42:38 +0000
 Subject: [PATCH 10/15] Fix rpath in libtool when sysroot is enabled
@@ -48,5 +48,5 @@ index 70e856e065..11ee684ccc 100644
  	    if test -z "$hardcode_libdirs"; then
  	      hardcode_libdirs="$libdir"
 -- 
-2.14.0
+2.16.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
index ac87a2d1de..80fcbc1194 100644
--- a/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
+++ b/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
@@ -1,4 +1,4 @@
-From 497660bdbeb6788786553a5d733105f7f898dc62 Mon Sep 17 00:00:00 2001
+From 7978c1299021033c35c29c94e0997235f7ede248 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:44:14 +0000
 Subject: [PATCH 11/15] Change default emulation for mips64*-*-linux
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/bfd/config.bfd b/bfd/config.bfd
-index dc24aabad5..4511024f22 100644
+index f04a993f06..8777f96bd2 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -1186,12 +1186,12 @@ case "${targ}" in
+@@ -1189,12 +1189,12 @@ case "${targ}" in
      targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec mips_ecoff_be_vec mips_ecoff_le_vec"
      ;;
    mips64*el-*-linux*)
@@ -35,12 +35,12 @@ index dc24aabad5..4511024f22 100644
    mips*el-*-linux*)
      targ_defvec=mips_elf32_trad_le_vec
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index 47c719cd05..fe7b9238b2 100644
+index 6183a85b3d..1d78465590 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -530,11 +530,11 @@ mips*el-*-vxworks*)	targ_emul=elf32elmipvxworks
+@@ -535,11 +535,11 @@ mips*el-*-vxworks*)	targ_emul=elf32elmipvxworks
  mips*-*-vxworks*)	targ_emul=elf32ebmipvxworks
- 		        targ_extra_emuls="elf32elmipvxworks" ;;
+ 			targ_extra_emuls="elf32elmipvxworks" ;;
  mips*-*-windiss)	targ_emul=elf32mipswindiss ;;
 -mips64*el-*-linux-*)	targ_emul=elf32ltsmipn32
 -			targ_extra_emuls="elf32btsmipn32 elf32ltsmip elf32btsmip elf64ltsmip elf64btsmip"
@@ -55,5 +55,5 @@ index 47c719cd05..fe7b9238b2 100644
  mips*el-*-linux-*)	targ_emul=elf32ltsmip
  			targ_extra_emuls="elf32btsmip elf32ltsmipn32 elf64ltsmip elf32btsmipn32 elf64btsmip"
 -- 
-2.14.0
+2.16.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch b/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
index dc5e580739..1fefb680f8 100644
--- a/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
+++ b/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
@@ -1,4 +1,4 @@
-From 8c60a55d3678589d93739bd27fec216911d80968 Mon Sep 17 00:00:00 2001
+From 3b40bf584615f794b85fd50d4d0a5c0a1d2ee7bf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:06:19 +0000
 Subject: [PATCH 12/15] Add support for Netlogic XLP
@@ -34,7 +34,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  14 files changed, 61 insertions(+), 21 deletions(-)
 
 diff --git a/bfd/aoutx.h b/bfd/aoutx.h
-index 3d38fda14b..0aec49bbb3 100644
+index eec9c4ad2a..3bf0a71e63 100644
 --- a/bfd/aoutx.h
 +++ b/bfd/aoutx.h
 @@ -814,6 +814,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,
@@ -46,34 +46,34 @@ index 3d38fda14b..0aec49bbb3 100644
  	  arch_flags = M_MIPS2;
  	  break;
 diff --git a/bfd/archures.c b/bfd/archures.c
-index 433b95fa08..063b7943a1 100644
+index e83c57a2f3..3016ea1bae 100644
 --- a/bfd/archures.c
 +++ b/bfd/archures.c
 @@ -201,6 +201,7 @@ DESCRIPTION
- .#define bfd_mach_mips_octeon3          6503
- .#define bfd_mach_mips_xlr              887682   {* decimal 'XLR'  *}
- .#define bfd_mach_mips_interaptiv_mr2   736550   {* decimal 'IA2'  *}
-+.#define bfd_mach_mips_xlp              887680   {* decimal 'XLP'  *}
- .#define bfd_mach_mipsisa32             32
- .#define bfd_mach_mipsisa32r2           33
- .#define bfd_mach_mipsisa32r3           34
+ .#define bfd_mach_mips_octeon3		6503
+ .#define bfd_mach_mips_xlr		887682	 {* decimal 'XLR'.  *}
+ .#define bfd_mach_mips_interaptiv_mr2	736550	 {* decimal 'IA2'.  *}
++.#define bfd_mach_mips_xlp              887680   {* decimal 'XLP'.  *}
+ .#define bfd_mach_mipsisa32		32
+ .#define bfd_mach_mipsisa32r2		33
+ .#define bfd_mach_mipsisa32r3		34
 diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
-index d126aed086..2b753b3a93 100644
+index 42991e7848..27abc5d5a8 100644
 --- a/bfd/bfd-in2.h
 +++ b/bfd/bfd-in2.h
-@@ -2060,6 +2060,7 @@ enum bfd_architecture
+@@ -2062,6 +2062,7 @@ enum bfd_architecture
  #define bfd_mach_mips_octeon3          6503
- #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'  */
- #define bfd_mach_mips_interaptiv_mr2   736550   /* decimal 'IA2'  */
-+#define bfd_mach_mips_xlp              887680   /* decimal 'XLP'  */
+ #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'.  */
+ #define bfd_mach_mips_interaptiv_mr2   736550   /* decimal 'IA2'.  */
++#define bfd_mach_mips_xlp              887680   /* decimal 'XLP'.  */
  #define bfd_mach_mipsisa32             32
  #define bfd_mach_mipsisa32r2           33
  #define bfd_mach_mipsisa32r3           34
 diff --git a/bfd/config.bfd b/bfd/config.bfd
-index 4511024f22..f0f9072f10 100644
+index 8777f96bd2..7b80bda8c9 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -1169,6 +1169,11 @@ case "${targ}" in
+@@ -1172,6 +1172,11 @@ case "${targ}" in
      targ_defvec=mips_elf32_le_vec
      targ_selvecs="mips_elf32_be_vec mips_elf64_be_vec mips_elf64_le_vec"
      ;;
@@ -86,7 +86,7 @@ index 4511024f22..f0f9072f10 100644
      targ_defvec=mips_elf32_be_vec
      targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec"
 diff --git a/bfd/cpu-mips.c b/bfd/cpu-mips.c
-index 2493094bef..8375d1ae96 100644
+index cb50c64371..2b9d1d6ecf 100644
 --- a/bfd/cpu-mips.c
 +++ b/bfd/cpu-mips.c
 @@ -105,7 +105,8 @@ enum
@@ -100,7 +100,7 @@ index 2493094bef..8375d1ae96 100644
  
  #define NN(index) (&arch_info_struct[(index) + 1])
 @@ -158,7 +159,8 @@ static const bfd_arch_info_type arch_info_struct[] =
-   N (64, 64, bfd_mach_mips_xlr, "mips:xlr",       FALSE, NN(I_xlr)),
+   N (64, 64, bfd_mach_mips_xlr, "mips:xlr",	  FALSE, NN(I_xlr)),
    N (32, 32, bfd_mach_mips_interaptiv_mr2, "mips:interaptiv-mr2", FALSE,
       NN(I_interaptiv_mr2)),
 -  N (64, 64, bfd_mach_mips_micromips,"mips:micromips",FALSE,0)
@@ -110,10 +110,10 @@ index 2493094bef..8375d1ae96 100644
  
  /* The default architecture is mips:3000, but with a machine number of
 diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c
-index fddf68c816..354c85d00b 100644
+index 285401367d..14ebb5f175 100644
 --- a/bfd/elfxx-mips.c
 +++ b/bfd/elfxx-mips.c
-@@ -6796,6 +6796,9 @@ _bfd_elf_mips_mach (flagword flags)
+@@ -6806,6 +6806,9 @@ _bfd_elf_mips_mach (flagword flags)
      case E_MIPS_MACH_IAMR2:
        return bfd_mach_mips_interaptiv_mr2;
  
@@ -123,7 +123,7 @@ index fddf68c816..354c85d00b 100644
      default:
        switch (flags & EF_MIPS_ARCH)
  	{
-@@ -11956,6 +11959,10 @@ mips_set_isa_flags (bfd *abfd)
+@@ -11963,6 +11966,10 @@ mips_set_isa_flags (bfd *abfd)
        val = E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;
        break;
  
@@ -134,7 +134,7 @@ index fddf68c816..354c85d00b 100644
      case bfd_mach_mipsisa32:
        val = E_MIPS_ARCH_32;
        break;
-@@ -13989,6 +13996,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
+@@ -13936,6 +13943,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
    { bfd_mach_mips_octeonp, bfd_mach_mips_octeon },
    { bfd_mach_mips_octeon, bfd_mach_mipsisa64r2 },
    { bfd_mach_mips_loongson_3a, bfd_mach_mipsisa64r2 },
@@ -143,10 +143,10 @@ index fddf68c816..354c85d00b 100644
    /* MIPS64 extensions.  */
    { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },
 diff --git a/binutils/readelf.c b/binutils/readelf.c
-index 2b15f0f2cb..092744708e 100644
+index ae1cda9a7b..fed0387a94 100644
 --- a/binutils/readelf.c
 +++ b/binutils/readelf.c
-@@ -3335,6 +3335,7 @@ get_machine_flags (unsigned e_flags, unsigned e_machine)
+@@ -3370,6 +3370,7 @@ get_machine_flags (Filedata * filedata, unsigned e_flags, unsigned e_machine)
  	    case E_MIPS_MACH_OCTEON3: strcat (buf, ", octeon3"); break;
  	    case E_MIPS_MACH_XLR:  strcat (buf, ", xlr"); break;
  	    case E_MIPS_MACH_IAMR2:  strcat (buf, ", interaptiv-mr2"); break;
@@ -155,7 +155,7 @@ index 2b15f0f2cb..092744708e 100644
  	    /* We simply ignore the field in this case to avoid confusion:
  	       MIPS ELF does not specify EF_MIPS_MACH, it is a GNU
 diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c
-index 3804df2958..9576c986db 100644
+index c135131b59..d8fbda8e31 100644
 --- a/gas/config/tc-mips.c
 +++ b/gas/config/tc-mips.c
 @@ -552,6 +552,7 @@ static int mips_32bitmode = 0;
@@ -174,7 +174,7 @@ index 3804df2958..9576c986db 100644
     )
  
  /* Whether the processor uses hardware interlocks to protect reads
-@@ -19738,7 +19740,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
+@@ -19737,7 +19739,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
    /* Broadcom XLP.
       XLP is mostly like XLR, with the prominent exception that it is
       MIPS64R2 rather than MIPS64.  */
@@ -184,7 +184,7 @@ index 3804df2958..9576c986db 100644
    /* MIPS 64 Release 6 */
    { "i6400",	      0, ASE_MSA,		ISA_MIPS64R6, CPU_MIPS64R6},
 diff --git a/gas/configure b/gas/configure
-index 81dd4cbd97..95bdf3b19b 100755
+index a40ac2144f..65a6995243 100755
 --- a/gas/configure
 +++ b/gas/configure
 @@ -12989,6 +12989,9 @@ _ACEOF
@@ -198,7 +198,7 @@ index 81dd4cbd97..95bdf3b19b 100755
  	    mips_cpu=r3900
  	    ;;
 diff --git a/include/elf/mips.h b/include/elf/mips.h
-index a4bea43ff8..73d904e25f 100644
+index 9de0b4e175..74fc4f7e55 100644
 --- a/include/elf/mips.h
 +++ b/include/elf/mips.h
 @@ -290,6 +290,7 @@ END_RELOC_NUMBERS (R_MIPS_maxext)
@@ -210,7 +210,7 @@ index a4bea43ff8..73d904e25f 100644
  #define E_MIPS_MACH_OCTEON3	0x008e0000
  #define E_MIPS_MACH_5400	0x00910000
 diff --git a/include/opcode/mips.h b/include/opcode/mips.h
-index ceae9ec50a..276ee3c6c1 100644
+index 5eea72f139..90f6d57e15 100644
 --- a/include/opcode/mips.h
 +++ b/include/opcode/mips.h
 @@ -1259,6 +1259,8 @@ static const unsigned int mips_isa_table[] = {
@@ -241,10 +241,10 @@ index ceae9ec50a..276ee3c6c1 100644
        return FALSE;
      }
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index fe7b9238b2..2adf108b17 100644
+index 1d78465590..307e787b64 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -516,6 +516,8 @@ mips*el-sde-elf* | mips*el-mti-elf* | mips*el-img-elf*)
+@@ -521,6 +521,8 @@ mips*el-sde-elf* | mips*el-mti-elf* | mips*el-img-elf*)
  mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
  			targ_emul=elf32btsmip
  			targ_extra_emuls="elf32ltsmip elf32btsmipn32 elf64btsmip elf32ltsmipn32 elf64ltsmip" ;;
@@ -254,7 +254,7 @@ index fe7b9238b2..2adf108b17 100644
  			targ_extra_emuls="elf32lr5900"
  			targ_extra_libpath=$targ_extra_emuls ;;
 diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c
-index 45195007c1..4a80a05d19 100644
+index 984fcbb802..95b107d216 100644
 --- a/opcodes/mips-dis.c
 +++ b/opcodes/mips-dis.c
 @@ -655,13 +655,11 @@ const struct mips_arch_choice mips_arch_choices[] =
@@ -277,7 +277,7 @@ index 45195007c1..4a80a05d19 100644
    /* This entry, mips16, is here only for ISA/processor selection; do
       not print its name.  */
 diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c
-index 19fca408c9..d02069c528 100644
+index 180d613c93..65b7b8cc23 100644
 --- a/opcodes/mips-opc.c
 +++ b/opcodes/mips-opc.c
 @@ -328,6 +328,7 @@ decode_mips_operand (const char *p)
@@ -389,5 +389,5 @@ index 19fca408c9..d02069c528 100644
  {"swc0",		"E,A(b)",	0,    (int) M_SWC0_AB,	INSN_MACRO,		0,		I1,		0,	IOCT|IOCTP|IOCT2|I37 },
  {"swc1",		"T,o(b)",	0xe4000000, 0xfc000000,	RD_1|RD_3|SM|FP_S,	0,		I1,		0,	0 },
 -- 
-2.14.0
+2.16.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
index 247376b7ed..c3e1b13841 100644
--- a/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
+++ b/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
@@ -1,4 +1,4 @@
-From e46202becab625c6c08caf91e08ccbbc1bf799c4 Mon Sep 17 00:00:00 2001
+From 27ec22ca3cd56cfdf060d2e1f414bedce269b322 Mon Sep 17 00:00:00 2001
 From: Zhenhua Luo <zhenhua.luo@nxp.com>
 Date: Sat, 11 Jun 2016 22:08:29 -0500
 Subject: [PATCH 13/15] fix the incorrect assembling for ppc wait mnemonic
@@ -11,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
-index 426261ab21..0d35916cdd 100644
+index bb17f26c2e..dbdd762b4e 100644
 --- a/opcodes/ppc-opc.c
 +++ b/opcodes/ppc-opc.c
-@@ -4881,7 +4881,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+@@ -5338,7 +5338,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
  {"ldepx",	X(31,29),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
  
  {"waitasec",	X(31,30),      XRTRARB_MASK, POWER8,	POWER9,		{0}},
@@ -22,7 +22,7 @@ index 426261ab21..0d35916cdd 100644
  
  {"lwepx",	X(31,31),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
  
-@@ -4935,7 +4934,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+@@ -5392,7 +5391,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
  
  {"waitrsv",	X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
  {"waitimpl",	X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
@@ -32,5 +32,5 @@ index 426261ab21..0d35916cdd 100644
  {"dcbstep",	XRT(31,63,0),	XRT_MASK,    E500MC|PPCA2, 0,		{RA0, RB}},
  
 -- 
-2.14.0
+2.16.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch b/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch
index 42b1065f8d..cf3690f25d 100644
--- a/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch
+++ b/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch
@@ -1,4 +1,4 @@
-From bf20d5823662d1f2eb47de2cdfd173627a205b17 Mon Sep 17 00:00:00 2001
+From 7dfbd6889d868a09d695dd2736104848c1a9c9c3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 31 Mar 2017 11:42:03 -0700
 Subject: [PATCH 14/15] Detect 64-bit MIPS targets
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 14 insertions(+)
 
 diff --git a/gold/configure.tgt b/gold/configure.tgt
-index 3d63027297..c1f92a1360 100644
+index 8aef22a318..7030026ffa 100644
 --- a/gold/configure.tgt
 +++ b/gold/configure.tgt
 @@ -153,6 +153,13 @@ aarch64*-*)
@@ -46,5 +46,5 @@ index 3d63027297..c1f92a1360 100644
   targ_obj=mips
   targ_machine=EM_MIPS
 -- 
-2.14.0
+2.16.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
index 2c8900cb66..8c9fd237e7 100644
--- a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
+++ b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
@@ -1,4 +1,4 @@
-From 9b456a0e4f284fd41ac36595144ed44dc82410ee Mon Sep 17 00:00:00 2001
+From 298804f430939d6cc94b09732ee93e64c5e6be18 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Mar 2017 23:33:27 -0800
 Subject: [PATCH 15/15] sync with OE libtool changes
@@ -85,5 +85,5 @@ index 11ee684ccc..3b19ac1532 100644
  	elif test -n "$runpath_var"; then
  	  case "$finalize_perm_rpath " in
 -- 
-2.14.0
+2.16.1
 
diff --git a/meta/recipes-devtools/binutils/binutils_2.29.1.bb b/meta/recipes-devtools/binutils/binutils_2.30.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils_2.29.1.bb
rename to meta/recipes-devtools/binutils/binutils_2.30.bb
-- 
2.16.1


