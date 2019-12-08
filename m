Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 297007D00E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2019 08:38:17 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id k3so4882471pgc.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Dec 2019 00:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eTG7puXYNZS16t2Va5js3tnfetxzjajr3W+10wjph2w=;
	b=XtJTweR+7tfsIFpx23hL5YPxu2dCTDIZ0h0asgxDLuyCpotgb8d1wFdAI096aAYSHJ
	GKsRE5EYGfKG5x7XMjPOqUpvJNWi8qhl4yfLSpDL68irYymzG7fteZwCPMtQyXxLx/cr
	dOFXsJQPqIqPcvUTXssDEii5Tiwu9PIzy50yRJ225EInrtF/GBq/ZDYGkgU/78DKEQjJ
	w9irJjU+OBY3J5Sssab2lhGb9rs+heXlvOaZSOAHHvOjfpU76BWDdPlXHJyGYbShrtci
	tUz/tIKi3vh2YEXCozEexDThGwARg36s1dU3QxS5uEh9srTbtf0Vg9lk5vTe00jwoELL
	1ZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eTG7puXYNZS16t2Va5js3tnfetxzjajr3W+10wjph2w=;
	b=gtVwTcqDCQR9YJXdyH94wZQsV8wmR+LoZGKBUlE9Ce/rIcVlFxH1U+sBrLLINtpDgt
	PxnTYv7eplhW1ajtQe3Bf6eopiAdf+uDuxMN5qGyc0JdJbf/8xlavGYfZG1T2779Zlb+
	mlFR+H0MWlqJNOWayjlqKuSIalxCWN1sXM+rv027XGx/Q5/LVG6DwlvbKxFiQNhvoluE
	WOlgWotEeS19hnQpFiuZKA5iwfnAcJUf358z7OiflbdHNq1U0UTQGAkUvK0gw0+07eCo
	m5jovVVILMEAe1OA70YBZQZNqhOVSXFiKa5b4oJ4zo1VYHeoP6zCm4tUzWycAXxbzz34
	yV3w==
X-Gm-Message-State: APjAAAXkxZrXiKmfCs+hQcCrNNKIROyOZDhngIArzpGh1umCUCK9wxAr
	hWrtkeFclFk4bgqmrttkIe74N+D/X50=
X-Google-Smtp-Source: APXvYqx7JEIEbUtH8SgFLgXK5l7XA687Y9K699RDnxx0wTF/L9XbMqKyCAGA5hzSpsFQ7xd6SOgCUA==
X-Received: by 2002:a63:c849:: with SMTP id l9mr13083889pgi.330.1575794294921; 
	Sun, 08 Dec 2019 00:38:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id
	d85sm22865086pfd.146.2019.12.08.00.38.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 00:38:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Dec 2019 00:37:59 -0800
Message-Id: <20191208083759.797930-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] binutils: Upgrade to 2.33.1
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
X-List-Received-Date: Sun, 08 Dec 2019 08:38:17 -0000
Content-Transfer-Encoding: 8bit

Drop CVE patches which are already available on binutils-2_33-branch
Forward port rest of the patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |    2 +-
 .../{binutils-2.32.inc => binutils-2.33.inc}  |   16 +-
 ....32.bb => binutils-cross-canadian_2.33.bb} |    0
 ...32.bb => binutils-cross-testsuite_2.33.bb} |    0
 ...s-cross_2.32.bb => binutils-cross_2.33.bb} |    0
 ...ssdk_2.32.bb => binutils-crosssdk_2.33.bb} |    0
 ...s-crosssdk-Generate-relocatable-SDKs.patch |   27 +-
 ...o-not-generate-linker-script-directo.patch |   12 +-
 ...iden-the-regexp-for-SH-architectures.patch |   13 +-
 ...004-Point-scripts-location-to-libdir.patch |   15 +-
 ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |   16 +-
 .../binutils/0006-Use-libtool-2.4.patch       | 1247 ++++++++---------
 ...stro-compiler-point-to-the-wrong-ins.patch |    9 +-
 ...-system-directories-when-cross-linki.patch |   60 +-
 ...h-in-libtool-when-sysroot-is-enabled.patch |    7 +-
 ...e-default-emulation-for-mips64-linux.patch |   14 +-
 .../0011-Add-support-for-Netlogic-XLP.patch   |   99 +-
 ...ect-assembling-for-ppc-wait-mnemonic.patch |   13 +-
 .../0013-Detect-64-bit-MIPS-targets.patch     |    7 +-
 .../0014-sync-with-OE-libtool-changes.patch   |    7 +-
 ...x86_64-pep-for-producing-EFI-binarie.patch |   15 +-
 .../binutils/binutils/CVE-2019-12972.patch    |   51 -
 .../binutils/binutils/CVE-2019-14250.patch    |   33 -
 .../binutils/binutils/CVE-2019-14444.patch    |   28 -
 .../binutils/binutils/CVE-2019-17450.patch    |   17 +-
 .../binutils/binutils/CVE-2019-17451.patch    |    7 +-
 .../binutils/binutils/CVE-2019-9071.patch     |  165 ---
 .../binutils/binutils/CVE-2019-9074.patch     |   68 -
 .../binutils/binutils/CVE-2019-9075.patch     |  119 --
 .../binutils/binutils/CVE-2019-9076.patch     |   49 -
 .../binutils/binutils/CVE-2019-9077.patch     |   37 -
 .../{binutils_2.32.bb => binutils_2.33.bb}    |    0
 32 files changed, 719 insertions(+), 1434 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.32.inc => binutils-2.33.inc} (84%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.32.bb => binutils-cross-canadian_2.33.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.32.bb => binutils-cross-testsuite_2.33.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.32.bb => binutils-cross_2.33.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.32.bb => binutils-crosssdk_2.33.bb} (100%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-14250.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9074.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9075.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9076.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9077.patch
 rename meta/recipes-devtools/binutils/{binutils_2.32.bb => binutils_2.33.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index c6c4cf7ce0..8bea58a98e 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "9.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-BINUVERSION ?= "2.32%"
+BINUVERSION ?= "2.33%"
 GDBVERSION ?= "8.3%"
 GLIBCVERSION ?= "2.30%"
 LINUXLIBCVERSION ?= "5.2%"
diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.33.inc
similarity index 84%
rename from meta/recipes-devtools/binutils/binutils-2.32.inc
rename to meta/recipes-devtools/binutils/binutils-2.33.inc
index 349c3e1154..84a9ec8fc3 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.33.inc
@@ -16,15 +16,15 @@ def binutils_branch_version(d):
 
 # When upgrading to 2.33, please make sure there is no trailing .0, so
 # that upstream version check can work correctly.
-PV = "2.32.0"
-CVE_VERSION = "2.32"
+PV = "2.33.1"
+CVE_VERSION = "2.33"
 BINUPV = "${@binutils_branch_version(d)}"
 #BRANCH = "binutils-${BINUPV}-branch"
-BRANCH ?= "binutils-2_32-branch"
+BRANCH ?= "binutils-2_33-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "b8c1f608db9ef3edd483d21a921d1fbedc71df6f"
+SRCREV ?= "c656f9a430636a6a7fc7a08c0e08f0098a729a02"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${BRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
@@ -41,14 +41,6 @@ SRC_URI = "\
      file://0013-Detect-64-bit-MIPS-targets.patch \
      file://0014-sync-with-OE-libtool-changes.patch \
      file://0015-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch \
-     file://CVE-2019-9074.patch \
-     file://CVE-2019-9075.patch \
-     file://CVE-2019-9076.patch \
-     file://CVE-2019-9077.patch \
-     file://CVE-2019-9071.patch \
-     file://CVE-2019-12972.patch \
-     file://CVE-2019-14250.patch \
-     file://CVE-2019-14444.patch \
      file://CVE-2019-17450.patch \
      file://CVE-2019-17451.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.32.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.33.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.32.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.33.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.32.bb b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.33.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-testsuite_2.32.bb
rename to meta/recipes-devtools/binutils/binutils-cross-testsuite_2.33.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.32.bb b/meta/recipes-devtools/binutils/binutils-cross_2.33.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.32.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.33.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.32.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.33.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.32.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.33.bb
diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
index 6581bad119..3a9461bf4a 100644
--- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
+++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
@@ -1,7 +1,7 @@
-From 5bcd884f8af5106d0fa380c42cffe07f3c993ed2 Mon Sep 17 00:00:00 2001
+From c9aed4cb3c02715b2ba1fc70949043849f202f46 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Mar 2015 01:58:54 +0000
-Subject: [PATCH 01/15] binutils-crosssdk: Generate relocatable SDKs
+Date: Sun, 8 Dec 2019 00:31:35 -0800
+Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
 
 This patch will modify the ELF linker scripts so that the crosssdk
 linker will generate binaries with a 4096 bytes PT_INTERP section. When the binaries
@@ -18,35 +18,35 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index 77ddbbc8f8..d789e77943 100755
+index cb2b081e9e..db2e9fd569 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
-@@ -310,6 +310,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
+@@ -325,6 +325,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
  LD_FLAG=r
  DATA_ALIGNMENT=${DATA_ALIGNMENT_r}
  DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
 +PARTIAL_LINKING=" "
  ( echo "/* Script for ld -r: link without relocation */"
-   . ${CUSTOMIZER_SCRIPT}
-   . ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
-@@ -318,10 +319,12 @@ DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
+   source_sh ${CUSTOMIZER_SCRIPT}
+   source_sh ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
+@@ -333,10 +334,12 @@ DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
  LD_FLAG=u
  DATA_ALIGNMENT=${DATA_ALIGNMENT_u}
  CONSTRUCTING=" "
 +PARTIAL_LINKING=" "
  ( echo "/* Script for ld -Ur: link w/out relocation, do create constructors */"
-   . ${CUSTOMIZER_SCRIPT}
-   . ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
+   source_sh ${CUSTOMIZER_SCRIPT}
+   source_sh ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
  ) | sed -e '/^ *$/d;s/[	 ]*$//' > ldscripts/${EMULATION_NAME}.xu
 +unset PARTIAL_LINKING
  
  DATA_ALIGNMENT=${DATA_ALIGNMENT_}
  RELOCATING=" "
 diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
-index bd7584120e..8bbe052d4b 100644
+index f9f0f7d402..9e469dca86 100644
 --- a/ld/scripttempl/elf.sc
 +++ b/ld/scripttempl/elf.sc
-@@ -139,8 +139,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
+@@ -140,8 +140,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
      DATA_SEGMENT_RELRO_END=". = DATA_SEGMENT_RELRO_END (${SEPARATE_GOTPLT-0}, .);"
    fi
  fi
@@ -57,6 +57,3 @@ index bd7584120e..8bbe052d4b 100644
  fi
  if test -z "$PLT"; then
    IPLT=".iplt         ${RELOCATING-0} : { *(.iplt) }"
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
index 32537d4b58..1b499a4504 100644
--- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
+++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
@@ -1,8 +1,7 @@
-From 11927913560fc5a5d51af3bc5eb8ad62a86c9840 Mon Sep 17 00:00:00 2001
+From 9fe5a2dd03fdf2986c89dd58ae48c0095f1c0411 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Mar 2017 23:37:05 -0800
-Subject: [PATCH 02/15] binutils-cross: Do not generate linker script
- directories
+Subject: [PATCH] binutils-cross: Do not generate linker script directories
 
 We don't place target libraries within ${exec_prefix}, we'd always place these
 within the target sysroot within the standard library directories. Worse, the
@@ -23,10 +22,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 25 deletions(-)
 
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index d789e77943..144e2e8736 100755
+index c90f38a63c..97ad1a24d6 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
-@@ -220,31 +220,6 @@ append_to_lib_path()
+@@ -235,31 +235,6 @@ append_to_lib_path()
    fi
  }
  
@@ -58,6 +57,3 @@ index d789e77943..144e2e8736 100755
  if [ "x${LIB_PATH}" = "x" ] && [ "x${USE_LIBPATH}" = xyes ] ; then
    libs=${NATIVE_LIB_DIRS}
    if [ "x${NATIVE}" = "xyes" ] ; then
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch b/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch
index a30138295a..4a6b107126 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch
@@ -1,7 +1,7 @@
-From da3939de6fb36da2c6484f14f08a37be195d9dc3 Mon Sep 17 00:00:00 2001
+From aecded290b2ec0b469c70fc6b062bd5ee6ba5e3a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:07:33 +0000
-Subject: [PATCH 03/15] configure: widen the regexp for SH architectures
+Subject: [PATCH] configure: widen the regexp for SH architectures
 
 gprof needs to know about uclibc
 
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 3747645961..78b5240101 100755
+index 6a9719f609..001523eebf 100755
 --- a/configure
 +++ b/configure
-@@ -3861,7 +3861,7 @@ case "${target}" in
+@@ -3865,7 +3865,7 @@ case "${target}" in
    nvptx*-*-*)
      noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
      ;;
@@ -27,7 +27,7 @@ index 3747645961..78b5240101 100755
        sh*-*-elf)
           ;;
 diff --git a/gprof/configure b/gprof/configure
-index f84efaba20..ab32bab2b6 100755
+index cbb3aced46..b5eabceb77 100755
 --- a/gprof/configure
 +++ b/gprof/configure
 @@ -6162,6 +6162,11 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
@@ -42,6 +42,3 @@ index f84efaba20..ab32bab2b6 100755
  netbsd*)
    if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
      lt_cv_deplibs_check_method='match_pattern /lib[^/]+(\.so\.[0-9]+\.[0-9]+|_pic\.a)$'
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
index f8e352228f..8318bd3899 100644
--- a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
+++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
@@ -1,7 +1,7 @@
-From fc1ff860fd88fa2d0584bd19181c880a76331a8d Mon Sep 17 00:00:00 2001
+From a9332107872ada73e72e92872ea2998a4e1495e0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:09:58 +0000
-Subject: [PATCH 04/15] Point scripts location to libdir
+Subject: [PATCH] Point scripts location to libdir
 
 Upstream-Status: Inappropriate [debian patch]
 
@@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index c2c798b4fe..d7faf19271 100644
+index ddc7a78368..6fa7bf2583 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
-@@ -57,7 +57,7 @@ endif
+@@ -63,7 +63,7 @@ endif
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.
@@ -25,10 +25,10 @@ index c2c798b4fe..d7faf19271 100644
  EMUL = @EMUL@
  EMULATION_OFILES = @EMULATION_OFILES@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index fc687fc516..8b14f5236c 100644
+index fdf06128b2..5c108b9e05 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
-@@ -563,7 +563,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
+@@ -572,7 +572,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.
@@ -37,6 +37,3 @@ index fc687fc516..8b14f5236c 100644
  BASEDIR = $(srcdir)/..
  BFDDIR = $(BASEDIR)/bfd
  INCDIR = $(BASEDIR)/include
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
index 1bad53175e..214ae06344 100644
--- a/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
+++ b/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
@@ -1,8 +1,7 @@
-From 66861bff389434e3454c7650ee29fade7a1cc5ed Mon Sep 17 00:00:00 2001
+From 65fb7a33aba30dec8690e0a237efaa3b9649154c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:27:17 +0000
-Subject: [PATCH 05/15] Only generate an RPATH entry if LD_RUN_PATH is not
- empty
+Subject: [PATCH] Only generate an RPATH entry if LD_RUN_PATH is not empty
 
 for cases where -rpath isn't specified. debian (#151024)
 
@@ -14,20 +13,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ld/emultempl/elf32.em | 4 ++++
  1 file changed, 4 insertions(+)
 
-diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
-index f4f7ad6b4e..cfd787ff28 100644
 --- a/ld/emultempl/elf32.em
 +++ b/ld/emultempl/elf32.em
-@@ -1471,6 +1471,8 @@ fragment <<EOF
+@@ -1470,6 +1470,8 @@ fragment <<EOF
  	      && command_line.rpath == NULL)
  	    {
  	      path = (const char *) getenv ("LD_RUN_PATH");
 +	      if ((path) && (strlen (path) == 0))
-+		  path = NULL;
++		path = NULL;
  	      if (path
  		  && gld${EMULATION_NAME}_search_needed (path, &n, force))
  		break;
-@@ -1746,6 +1748,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+@@ -1745,6 +1747,8 @@ gld${EMULATION_NAME}_before_allocation (
    rpath = command_line.rpath;
    if (rpath == NULL)
      rpath = (const char *) getenv ("LD_RUN_PATH");
@@ -36,6 +33,3 @@ index f4f7ad6b4e..cfd787ff28 100644
  
    for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
      if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
index f0c4d251bd..135eb8877c 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
@@ -1,7 +1,7 @@
-From 418527a2971d4e77a87085400397090d89fc5c94 Mon Sep 17 00:00:00 2001
+From 9cebc65f222dfd4e0b3072b53f46ffcf328e9fe4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:04:07 +0000
-Subject: [PATCH 06/15] Use libtool 2.4
+Subject: [PATCH] Use libtool 2.4
 
 get libtool sysroot support
 
@@ -25,8 +25,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  zlib/configure       | 1320 ++++++++++++++-----
  14 files changed, 9940 insertions(+), 3705 deletions(-)
 
-diff --git a/bfd/configure b/bfd/configure
-index 17960684f8..925fb401f2 100755
 --- a/bfd/configure
 +++ b/bfd/configure
 @@ -704,6 +704,9 @@ OTOOL
@@ -76,7 +74,7 @@ index 17960684f8..925fb401f2 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6420,8 +6426,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6420,8 +6426,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -212,7 +210,7 @@ index 17960684f8..925fb401f2 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6821,11 +6922,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6823,9 +6924,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -226,8 +224,6 @@ index 17960684f8..925fb401f2 100755
 +
 +
 +
- 
- 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -449,7 +445,7 @@ index 17960684f8..925fb401f2 100755
 +
 +
 +
-+
+ 
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
 +if ${lt_cv_ar_at_file+:} false; then :
@@ -458,7 +454,7 @@ index 17960684f8..925fb401f2 100755
 +  lt_cv_ar_at_file=no
 +   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 +/* end confdefs.h.  */
-+
+ 
 +int
 +main ()
 +{
@@ -491,11 +487,11 @@ index 17960684f8..925fb401f2 100755
  
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
@@ -551,7 +547,7 @@ index 17960684f8..925fb401f2 100755
    const char *name;
    void       *address;
  }
-@@ -7377,8 +7708,8 @@ static const void *lt_preloaded_setup() {
+@@ -7377,8 +7708,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -573,7 +569,7 @@ index 17960684f8..925fb401f2 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7426,6 +7757,16 @@ else
+@@ -7426,6 +7757,20 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -587,20 +583,17 @@ index 17960684f8..925fb401f2 100755
 +
 +
 +
++
++
++
++
  
  
  
-@@ -7442,6 +7783,45 @@ fi
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
@@ -633,9 +626,12 @@ index 17960684f8..925fb401f2 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
++
++
++
  
  
- 
+ # Check whether --enable-libtool-lock was given.
 @@ -7653,6 +8033,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -797,7 +793,7 @@ index 17960684f8..925fb401f2 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8934,6 +9432,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8934,6 +9432,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -810,7 +806,7 @@ index 17960684f8..925fb401f2 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8996,7 +9500,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8996,7 +9500,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -971,7 +967,7 @@ index 17960684f8..925fb401f2 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9825,7 +10352,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9825,7 +10352,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -1029,7 +1025,7 @@ index 17960684f8..925fb401f2 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9898,20 +10438,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9898,20 +10438,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -1107,7 +1103,7 @@ index 17960684f8..925fb401f2 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9972,7 +10555,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9972,7 +10555,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -1116,7 +1112,7 @@ index 17960684f8..925fb401f2 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9980,7 +10563,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9980,7 +10563,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -1125,7 +1121,7 @@ index 17960684f8..925fb401f2 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9996,7 +10579,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9996,7 +10579,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -1134,7 +1130,7 @@ index 17960684f8..925fb401f2 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10020,10 +10603,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10020,10 +10603,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -1192,7 +1188,7 @@ index 17960684f8..925fb401f2 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10203,7 +10799,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10203,7 +10799,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -1201,7 +1197,7 @@ index 17960684f8..925fb401f2 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10222,9 +10818,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10222,9 +10818,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -1351,7 +1347,7 @@ index 17960684f8..925fb401f2 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14525,7 +15180,7 @@ SHARED_LDFLAGS=
+@@ -14554,7 +15209,7 @@ SHARED_LDFLAGS=
  if test "$enable_shared" = "yes"; then
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -1359,8 +1355,8 @@ index 17960684f8..925fb401f2 100755
 +    SHARED_LIBADD="`pwd`/../libiberty/pic/libiberty.a"
    fi
  
- # More hacks to build DLLs on Windows.
-@@ -17142,13 +17797,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+   case "${host}" in
+@@ -17177,13 +17832,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -1381,7 +1377,7 @@ index 17960684f8..925fb401f2 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17163,14 +17825,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17198,14 +17860,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -1400,7 +1396,7 @@ index 17960684f8..925fb401f2 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -17203,12 +17868,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -17238,12 +17903,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -1414,7 +1410,7 @@ index 17960684f8..925fb401f2 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -17263,8 +17928,13 @@ reload_flag \
+@@ -17298,8 +17963,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -1428,7 +1424,7 @@ index 17960684f8..925fb401f2 100755
  STRIP \
  RANLIB \
  CC \
-@@ -17274,12 +17944,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -17309,12 +17979,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -1444,7 +1440,7 @@ index 17960684f8..925fb401f2 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -17295,7 +17967,6 @@ no_undefined_flag \
+@@ -17330,7 +18002,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -1452,7 +1448,7 @@ index 17960684f8..925fb401f2 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -17331,6 +18002,7 @@ module_cmds \
+@@ -17366,6 +18037,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -1460,7 +1456,7 @@ index 17960684f8..925fb401f2 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18119,7 +18791,8 @@ $as_echo X"$file" |
+@@ -18154,7 +18826,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -1470,7 +1466,7 @@ index 17960684f8..925fb401f2 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -18222,19 +18895,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -18257,19 +18930,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -1514,7 +1510,7 @@ index 17960684f8..925fb401f2 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -18264,6 +18960,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -18299,6 +18995,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -1527,7 +1523,7 @@ index 17960684f8..925fb401f2 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -18273,6 +18975,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -18308,6 +19010,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -1537,7 +1533,7 @@ index 17960684f8..925fb401f2 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -18387,12 +19092,12 @@ with_gcc=$GCC
+@@ -18422,12 +19127,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -1553,7 +1549,7 @@ index 17960684f8..925fb401f2 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -18479,9 +19184,6 @@ inherit_rpath=$inherit_rpath
+@@ -18514,9 +19219,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -1563,7 +1559,7 @@ index 17960684f8..925fb401f2 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -18497,6 +19199,9 @@ include_expsyms=$lt_include_expsyms
+@@ -18532,6 +19234,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -1573,7 +1569,7 @@ index 17960684f8..925fb401f2 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -18529,210 +19234,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -18564,210 +19269,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -1775,15 +1771,9 @@ index 17960684f8..925fb401f2 100755
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
@@ -1941,17 +1931,18 @@ index 17960684f8..925fb401f2 100755
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
-index eda38ea086..7cdf9c8146 100644
 --- a/bfd/configure.ac
 +++ b/bfd/configure.ac
-@@ -293,7 +293,7 @@ changequote(,)dnl
+@@ -290,7 +290,7 @@ changequote(,)dnl
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
  changequote([,])dnl
    if test -n "$x"; then
@@ -1959,9 +1950,7 @@ index eda38ea086..7cdf9c8146 100644
 +    SHARED_LIBADD="`pwd`/../libiberty/pic/libiberty.a"
    fi
  
- # More hacks to build DLLs on Windows.
-diff --git a/binutils/configure b/binutils/configure
-index 38128e146d..c74f797996 100755
+   case "${host}" in
 --- a/binutils/configure
 +++ b/binutils/configure
 @@ -689,8 +689,11 @@ OTOOL
@@ -2013,7 +2002,7 @@ index 38128e146d..c74f797996 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6184,8 +6190,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6184,8 +6190,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -2149,7 +2138,7 @@ index 38128e146d..c74f797996 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6587,9 +6688,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6587,9 +6688,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -2489,7 +2478,7 @@ index 38128e146d..c74f797996 100755
    const char *name;
    void       *address;
  }
-@@ -7141,8 +7472,8 @@ static const void *lt_preloaded_setup() {
+@@ -7141,8 +7472,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -2511,7 +2500,7 @@ index 38128e146d..c74f797996 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7190,6 +7521,21 @@ else
+@@ -7190,6 +7521,18 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -2527,18 +2516,13 @@ index 38128e146d..c74f797996 100755
 +
 +
 +
-+
-+
-+
  
  
  
-@@ -7206,6 +7552,40 @@ fi
+@@ -7211,6 +7554,43 @@ fi
  
  
  
-+
-+
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -2571,9 +2555,14 @@ index 38128e146d..c74f797996 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
- 
- 
- 
++
++
++
++
++
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+   enableval=$enable_libtool_lock;
 @@ -7417,6 +7797,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -2735,7 +2724,7 @@ index 38128e146d..c74f797996 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8729,6 +9227,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8729,6 +9227,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -2748,7 +2737,7 @@ index 38128e146d..c74f797996 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8791,7 +9295,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8791,7 +9295,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -2909,7 +2898,7 @@ index 38128e146d..c74f797996 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9620,7 +10147,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9620,7 +10147,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -2967,7 +2956,7 @@ index 38128e146d..c74f797996 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9693,20 +10233,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9693,20 +10233,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -3045,7 +3034,7 @@ index 38128e146d..c74f797996 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9767,7 +10350,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9767,7 +10350,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -3054,7 +3043,7 @@ index 38128e146d..c74f797996 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9775,7 +10358,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9775,7 +10358,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -3063,7 +3052,7 @@ index 38128e146d..c74f797996 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9791,7 +10374,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9791,7 +10374,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -3072,7 +3061,7 @@ index 38128e146d..c74f797996 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9815,10 +10398,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9815,10 +10398,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -3130,7 +3119,7 @@ index 38128e146d..c74f797996 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9998,7 +10594,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9998,7 +10594,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -3139,7 +3128,7 @@ index 38128e146d..c74f797996 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10017,9 +10613,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10017,9 +10613,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -3289,7 +3278,7 @@ index 38128e146d..c74f797996 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15936,13 +16591,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -15936,13 +16591,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -3310,7 +3299,7 @@ index 38128e146d..c74f797996 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15957,14 +16619,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -15957,14 +16619,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -3329,7 +3318,7 @@ index 38128e146d..c74f797996 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15997,12 +16662,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -15997,12 +16662,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -3443,7 +3432,7 @@ index 38128e146d..c74f797996 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -17036,6 +17732,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -17036,6 +17732,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -3704,15 +3693,9 @@ index 38128e146d..c74f797996 100755
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
@@ -3870,14 +3853,15 @@ index 38128e146d..c74f797996 100755
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
-index 64de9f19da..a82fde7fa8 100755
 --- a/gas/configure
 +++ b/gas/configure
 @@ -681,8 +681,11 @@ OTOOL
@@ -3900,7 +3884,7 @@ index 64de9f19da..a82fde7fa8 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1487,6 +1491,8 @@ Optional Packages:
+@@ -1490,6 +1494,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -3909,7 +3893,7 @@ index 64de9f19da..a82fde7fa8 100755
    --with-cpu=CPU          default cpu variant is CPU (currently only supported
                            on ARC)
    --with-system-zlib      use installed libz
-@@ -5274,8 +5280,8 @@ esac
+@@ -5277,8 +5283,8 @@ esac
  
  
  
@@ -3920,7 +3904,7 @@ index 64de9f19da..a82fde7fa8 100755
  
  
  
-@@ -5315,7 +5321,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5318,7 +5324,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -3929,7 +3913,7 @@ index 64de9f19da..a82fde7fa8 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6001,8 +6007,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6004,8 +6010,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -3940,7 +3924,7 @@ index 64de9f19da..a82fde7fa8 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6051,6 +6057,80 @@ esac
+@@ -6054,6 +6060,80 @@ esac
  
  
  
@@ -4021,7 +4005,7 @@ index 64de9f19da..a82fde7fa8 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6067,6 +6147,11 @@ case $reload_flag in
+@@ -6070,6 +6150,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -4033,7 +4017,7 @@ index 64de9f19da..a82fde7fa8 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6235,7 +6320,8 @@ mingw* | pw32*)
+@@ -6238,7 +6323,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -4043,7 +4027,7 @@ index 64de9f19da..a82fde7fa8 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6389,6 +6475,21 @@ esac
+@@ -6392,6 +6478,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -4065,7 +4049,7 @@ index 64de9f19da..a82fde7fa8 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6404,9 +6505,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6407,9 +6508,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -4079,7 +4063,9 @@ index 64de9f19da..a82fde7fa8 100755
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
@@ -4220,9 +4206,7 @@ index 64de9f19da..a82fde7fa8 100755
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
@@ -4230,7 +4214,7 @@ index 64de9f19da..a82fde7fa8 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6422,7 +6676,7 @@ do
+@@ -6425,7 +6679,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -4239,7 +4223,7 @@ index 64de9f19da..a82fde7fa8 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6442,11 +6696,15 @@ $as_echo "no" >&6; }
+@@ -6445,11 +6699,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -4258,7 +4242,7 @@ index 64de9f19da..a82fde7fa8 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6462,7 +6720,7 @@ do
+@@ -6465,7 +6723,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -4267,7 +4251,7 @@ index 64de9f19da..a82fde7fa8 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6481,6 +6739,10 @@ else
+@@ -6484,6 +6742,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -4278,7 +4262,7 @@ index 64de9f19da..a82fde7fa8 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6492,12 +6754,10 @@ ac_tool_warned=yes ;;
+@@ -6495,12 +6757,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -4293,7 +4277,7 @@ index 64de9f19da..a82fde7fa8 100755
  
  
  
-@@ -6509,6 +6769,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6512,6 +6772,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -4358,7 +4342,7 @@ index 64de9f19da..a82fde7fa8 100755
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -6843,8 +7161,8 @@ esac
+@@ -6846,8 +7164,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -4369,7 +4353,7 @@ index 64de9f19da..a82fde7fa8 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6880,6 +7198,7 @@ for ac_symprfx in "" "_"; do
+@@ -6883,6 +7201,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -4377,7 +4361,7 @@ index 64de9f19da..a82fde7fa8 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6921,6 +7240,18 @@ _LT_EOF
+@@ -6924,6 +7243,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -4396,7 +4380,7 @@ index 64de9f19da..a82fde7fa8 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6932,7 +7263,7 @@ _LT_EOF
+@@ -6935,7 +7266,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -4405,7 +4389,7 @@ index 64de9f19da..a82fde7fa8 100755
    const char *name;
    void       *address;
  }
-@@ -6958,8 +7289,8 @@ static const void *lt_preloaded_setup() {
+@@ -6961,8 +7292,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -4416,7 +4400,7 @@ index 64de9f19da..a82fde7fa8 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6969,8 +7300,8 @@ _LT_EOF
+@@ -6972,8 +7303,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -4427,7 +4411,7 @@ index 64de9f19da..a82fde7fa8 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7007,6 +7338,21 @@ else
+@@ -7010,6 +7341,19 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -4444,17 +4428,13 @@ index 64de9f19da..a82fde7fa8 100755
 +
 +
 +
-+
-+
  
  
  
-@@ -7023,6 +7369,40 @@ fi
+@@ -7030,6 +7374,42 @@ fi
  
  
  
-+
-+
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -4487,10 +4467,14 @@ index 64de9f19da..a82fde7fa8 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
++
++
++
++
  
- 
- 
-@@ -7234,6 +7614,123 @@ esac
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+@@ -7237,6 +7617,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -4614,7 +4598,7 @@ index 64de9f19da..a82fde7fa8 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7797,6 +8294,8 @@ _LT_EOF
+@@ -7800,6 +8297,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -4623,7 +4607,7 @@ index 64de9f19da..a82fde7fa8 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7992,7 +8491,8 @@ fi
+@@ -7995,7 +8494,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -4633,7 +4617,7 @@ index 64de9f19da..a82fde7fa8 100755
  
  
  
-@@ -8081,7 +8581,7 @@ aix3*)
+@@ -8084,7 +8584,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -4642,7 +4626,7 @@ index 64de9f19da..a82fde7fa8 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8379,8 +8879,6 @@ fi
+@@ -8382,8 +8882,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -4651,7 +4635,7 @@ index 64de9f19da..a82fde7fa8 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8546,6 +9044,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8549,6 +9047,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -4664,7 +4648,7 @@ index 64de9f19da..a82fde7fa8 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8608,7 +9112,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8611,7 +9115,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -4673,7 +4657,7 @@ index 64de9f19da..a82fde7fa8 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8665,13 +9169,17 @@ case $host_os in
+@@ -8668,13 +9172,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -4697,7 +4681,7 @@ index 64de9f19da..a82fde7fa8 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8732,6 +9240,11 @@ fi
+@@ -8735,6 +9243,11 @@ fi
  
  
  
@@ -4709,7 +4693,7 @@ index 64de9f19da..a82fde7fa8 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9082,7 +9595,8 @@ _LT_EOF
+@@ -9085,7 +9598,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -4719,7 +4703,7 @@ index 64de9f19da..a82fde7fa8 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9181,12 +9695,12 @@ _LT_EOF
+@@ -9184,12 +9698,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -4734,7 +4718,7 @@ index 64de9f19da..a82fde7fa8 100755
  	  fi
  	  ;;
  	esac
-@@ -9200,8 +9714,8 @@ _LT_EOF
+@@ -9203,8 +9717,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -4745,7 +4729,7 @@ index 64de9f19da..a82fde7fa8 100755
        fi
        ;;
  
-@@ -9219,8 +9733,8 @@ _LT_EOF
+@@ -9222,8 +9736,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4756,7 +4740,7 @@ index 64de9f19da..a82fde7fa8 100755
        else
  	ld_shlibs=no
        fi
-@@ -9266,8 +9780,8 @@ _LT_EOF
+@@ -9269,8 +9783,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4767,7 +4751,7 @@ index 64de9f19da..a82fde7fa8 100755
        else
  	ld_shlibs=no
        fi
-@@ -9397,7 +9911,13 @@ _LT_EOF
+@@ -9400,7 +9914,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -4782,7 +4766,7 @@ index 64de9f19da..a82fde7fa8 100755
  /* end confdefs.h.  */
  
  int
-@@ -9410,22 +9930,29 @@ main ()
+@@ -9413,22 +9933,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4825,7 +4809,7 @@ index 64de9f19da..a82fde7fa8 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9437,7 +9964,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9440,7 +9967,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -4840,7 +4824,7 @@ index 64de9f19da..a82fde7fa8 100755
  /* end confdefs.h.  */
  
  int
-@@ -9450,22 +9983,29 @@ main ()
+@@ -9453,22 +9986,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4883,7 +4867,7 @@ index 64de9f19da..a82fde7fa8 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9510,20 +10050,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9513,20 +10053,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -4961,7 +4945,7 @@ index 64de9f19da..a82fde7fa8 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9584,7 +10167,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9587,7 +10170,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -4970,7 +4954,7 @@ index 64de9f19da..a82fde7fa8 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9592,7 +10175,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9595,7 +10178,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -4979,7 +4963,7 @@ index 64de9f19da..a82fde7fa8 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9608,7 +10191,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9611,7 +10194,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -4988,7 +4972,7 @@ index 64de9f19da..a82fde7fa8 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9632,10 +10215,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9635,10 +10218,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -5001,7 +4985,7 @@ index 64de9f19da..a82fde7fa8 100755
  	  ;;
  	esac
        else
-@@ -9714,23 +10297,36 @@ fi
+@@ -9717,23 +10300,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -5046,7 +5030,7 @@ index 64de9f19da..a82fde7fa8 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9815,7 +10411,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9818,7 +10414,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -5055,7 +5039,7 @@ index 64de9f19da..a82fde7fa8 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9834,9 +10430,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9837,9 +10433,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -5067,7 +5051,7 @@ index 64de9f19da..a82fde7fa8 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10412,8 +11008,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10415,8 +11011,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -5079,7 +5063,7 @@ index 64de9f19da..a82fde7fa8 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10446,13 +11043,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10449,13 +11046,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -5152,7 +5136,7 @@ index 64de9f19da..a82fde7fa8 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10544,7 +11199,7 @@ haiku*)
+@@ -10547,7 +11202,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -5161,16 +5145,16 @@ index 64de9f19da..a82fde7fa8 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11340,7 +11995,7 @@ else
+@@ -11343,7 +11998,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11343 "configure"
+-#line 11346 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11384,10 +12039,10 @@ else
+@@ -11387,10 +12042,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5183,16 +5167,16 @@ index 64de9f19da..a82fde7fa8 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11446,7 +12101,7 @@ else
+@@ -11449,7 +12104,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11449 "configure"
+-#line 11452 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11490,10 +12145,10 @@ else
+@@ -11493,10 +12148,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5205,7 +5189,7 @@ index 64de9f19da..a82fde7fa8 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15896,13 +16551,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -15928,13 +16583,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -5226,7 +5210,7 @@ index 64de9f19da..a82fde7fa8 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15917,14 +16579,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -15949,14 +16611,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -5245,7 +5229,7 @@ index 64de9f19da..a82fde7fa8 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15957,12 +16622,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -15989,12 +16654,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -5259,7 +5243,7 @@ index 64de9f19da..a82fde7fa8 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -16017,8 +16682,13 @@ reload_flag \
+@@ -16049,8 +16714,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -5273,7 +5257,7 @@ index 64de9f19da..a82fde7fa8 100755
  STRIP \
  RANLIB \
  CC \
-@@ -16028,12 +16698,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -16060,12 +16730,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -5289,7 +5273,7 @@ index 64de9f19da..a82fde7fa8 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -16049,7 +16721,6 @@ no_undefined_flag \
+@@ -16081,7 +16753,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -5297,7 +5281,7 @@ index 64de9f19da..a82fde7fa8 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -16085,6 +16756,7 @@ module_cmds \
+@@ -16117,6 +16788,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -5305,7 +5289,7 @@ index 64de9f19da..a82fde7fa8 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16858,7 +17530,8 @@ $as_echo X"$file" |
+@@ -16890,7 +17562,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -5315,7 +5299,7 @@ index 64de9f19da..a82fde7fa8 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16961,19 +17634,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -16993,19 +17666,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -5359,7 +5343,7 @@ index 64de9f19da..a82fde7fa8 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -17003,6 +17699,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -17035,6 +17731,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -5372,7 +5356,7 @@ index 64de9f19da..a82fde7fa8 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -17012,6 +17714,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -17044,6 +17746,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -5382,7 +5366,7 @@ index 64de9f19da..a82fde7fa8 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -17126,12 +17831,12 @@ with_gcc=$GCC
+@@ -17158,12 +17863,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -5398,7 +5382,7 @@ index 64de9f19da..a82fde7fa8 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -17218,9 +17923,6 @@ inherit_rpath=$inherit_rpath
+@@ -17250,9 +17955,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -5408,7 +5392,7 @@ index 64de9f19da..a82fde7fa8 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -17236,6 +17938,9 @@ include_expsyms=$lt_include_expsyms
+@@ -17268,6 +17970,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -5418,7 +5402,7 @@ index 64de9f19da..a82fde7fa8 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -17268,210 +17973,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -17300,210 +18005,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -5620,15 +5604,9 @@ index 64de9f19da..a82fde7fa8 100755
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
@@ -5786,14 +5764,15 @@ index 64de9f19da..a82fde7fa8 100755
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
-index ab32bab2b6..5119c6019f 100755
 --- a/gprof/configure
 +++ b/gprof/configure
 @@ -662,8 +662,11 @@ OTOOL
@@ -5845,7 +5824,7 @@ index ab32bab2b6..5119c6019f 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5851,8 +5857,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5851,8 +5857,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -5993,7 +5972,7 @@ index ab32bab2b6..5119c6019f 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6257,11 +6353,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6259,9 +6355,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -6007,8 +5986,6 @@ index ab32bab2b6..5119c6019f 100755
 +
 +
 +
- 
- 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -6201,7 +6178,7 @@ index ab32bab2b6..5119c6019f 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6347,16 +6604,72 @@ ac_tool_warned=yes ;;
+@@ -6347,12 +6604,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -6213,17 +6190,13 @@ index ab32bab2b6..5119c6019f 100755
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
+@@ -6364,6 +6619,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+ 
+ 
+ 
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
 +if test "${lt_cv_ar_at_file+set}" = set; then :
@@ -6236,7 +6209,7 @@ index ab32bab2b6..5119c6019f 100755
 +int
 +main ()
 +{
- 
++
 +  ;
 +  return 0;
 +}
@@ -6262,22 +6235,29 @@ index ab32bab2b6..5119c6019f 100755
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
 @@ -6698,8 +7011,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
@@ -6325,7 +6305,7 @@ index ab32bab2b6..5119c6019f 100755
    const char *name;
    void       *address;
  }
-@@ -6813,8 +7139,8 @@ static const void *lt_preloaded_setup() {
+@@ -6813,8 +7139,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -6347,7 +6327,7 @@ index ab32bab2b6..5119c6019f 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6862,6 +7188,18 @@ else
+@@ -6862,6 +7188,17 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -6362,18 +6342,13 @@ index ab32bab2b6..5119c6019f 100755
 +
 +
 +
-+
  
  
  
-@@ -6878,6 +7216,43 @@ fi
+@@ -6883,6 +7220,44 @@ fi
  
  
  
-+
-+
-+
-+
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
@@ -6407,9 +6382,14 @@ index ab32bab2b6..5119c6019f 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
- 
- 
- 
++
++
++
++
++
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+   enableval=$enable_libtool_lock;
 @@ -7089,6 +7464,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -6571,7 +6551,7 @@ index ab32bab2b6..5119c6019f 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8401,6 +8894,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8401,6 +8894,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -6584,7 +6564,7 @@ index ab32bab2b6..5119c6019f 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8463,7 +8962,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8463,7 +8962,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -6745,7 +6725,7 @@ index ab32bab2b6..5119c6019f 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9292,7 +9814,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9292,7 +9814,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -6803,7 +6783,7 @@ index ab32bab2b6..5119c6019f 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9365,20 +9900,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9365,20 +9900,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -6881,7 +6861,7 @@ index ab32bab2b6..5119c6019f 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9439,7 +10017,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9439,7 +10017,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -6890,7 +6870,7 @@ index ab32bab2b6..5119c6019f 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9447,7 +10025,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9447,7 +10025,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -6899,7 +6879,7 @@ index ab32bab2b6..5119c6019f 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9463,7 +10041,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9463,7 +10041,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -6908,7 +6888,7 @@ index ab32bab2b6..5119c6019f 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9487,10 +10065,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9487,10 +10065,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -6966,7 +6946,7 @@ index ab32bab2b6..5119c6019f 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9670,7 +10261,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9670,7 +10261,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -6975,7 +6955,7 @@ index ab32bab2b6..5119c6019f 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9689,9 +10280,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9689,9 +10280,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -7107,7 +7087,7 @@ index ab32bab2b6..5119c6019f 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -13314,13 +13964,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -13314,13 +13964,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -7128,7 +7108,7 @@ index ab32bab2b6..5119c6019f 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13335,14 +13992,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -13335,14 +13992,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -7147,7 +7127,7 @@ index ab32bab2b6..5119c6019f 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13375,12 +14035,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -13375,12 +14035,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -7261,7 +7241,7 @@ index ab32bab2b6..5119c6019f 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14413,6 +15104,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -14413,6 +15104,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -7522,15 +7502,9 @@ index ab32bab2b6..5119c6019f 100755
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
@@ -7688,17 +7662,18 @@ index ab32bab2b6..5119c6019f 100755
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
-index bc09e7ef81..43c391c2b3 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -687,8 +687,11 @@ OTOOL
+@@ -688,8 +688,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -7710,7 +7685,7 @@ index bc09e7ef81..43c391c2b3 100755
  OBJDUMP
  LN_S
  NM
-@@ -815,6 +818,7 @@ enable_static
+@@ -816,6 +819,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -7718,7 +7693,7 @@ index bc09e7ef81..43c391c2b3 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1507,6 +1511,8 @@ Optional Packages:
+@@ -1508,6 +1512,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -7727,7 +7702,7 @@ index bc09e7ef81..43c391c2b3 100755
    --with-lib-path=dir1:dir2...  set default LIB_PATH
    --with-sysroot=DIR Search for usr/lib et al within DIR.
  
-@@ -5959,8 +5965,8 @@ esac
+@@ -5960,8 +5966,8 @@ esac
  
  
  
@@ -7738,7 +7713,7 @@ index bc09e7ef81..43c391c2b3 100755
  
  
  
-@@ -6000,7 +6006,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -6001,7 +6007,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -7747,7 +7722,7 @@ index bc09e7ef81..43c391c2b3 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6686,8 +6692,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6687,8 +6693,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -7758,7 +7733,7 @@ index bc09e7ef81..43c391c2b3 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6736,6 +6742,80 @@ esac
+@@ -6737,6 +6743,80 @@ esac
  
  
  
@@ -7839,7 +7814,7 @@ index bc09e7ef81..43c391c2b3 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6752,6 +6832,11 @@ case $reload_flag in
+@@ -6753,6 +6833,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -7851,7 +7826,7 @@ index bc09e7ef81..43c391c2b3 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6920,7 +7005,8 @@ mingw* | pw32*)
+@@ -6921,7 +7006,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -7861,7 +7836,7 @@ index bc09e7ef81..43c391c2b3 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -7074,6 +7160,21 @@ esac
+@@ -7075,6 +7161,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -7883,7 +7858,7 @@ index bc09e7ef81..43c391c2b3 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -7089,9 +7190,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -7090,9 +7191,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -8048,7 +8023,7 @@ index bc09e7ef81..43c391c2b3 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -7107,7 +7361,7 @@ do
+@@ -7108,7 +7362,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -8057,7 +8032,7 @@ index bc09e7ef81..43c391c2b3 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -7127,11 +7381,15 @@ $as_echo "no" >&6; }
+@@ -7128,11 +7382,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -8076,7 +8051,7 @@ index bc09e7ef81..43c391c2b3 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -7147,7 +7405,7 @@ do
+@@ -7148,7 +7406,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -8085,7 +8060,7 @@ index bc09e7ef81..43c391c2b3 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -7166,6 +7424,10 @@ else
+@@ -7167,6 +7425,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -8096,7 +8071,7 @@ index bc09e7ef81..43c391c2b3 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -7177,12 +7439,12 @@ ac_tool_warned=yes ;;
+@@ -7178,12 +7440,11 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -8109,11 +8084,10 @@ index bc09e7ef81..43c391c2b3 100755
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
 +
-+
  
  
  
-@@ -7192,6 +7454,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -7194,6 +7455,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -8173,10 +8147,11 @@ index bc09e7ef81..43c391c2b3 100755
 +
 +
 +
- 
++
  
  if test -n "$ac_tool_prefix"; then
-@@ -7528,8 +7846,8 @@ esac
+   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
+@@ -7529,8 +7847,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -8187,7 +8162,7 @@ index bc09e7ef81..43c391c2b3 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7565,6 +7883,7 @@ for ac_symprfx in "" "_"; do
+@@ -7566,6 +7884,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -8195,7 +8170,7 @@ index bc09e7ef81..43c391c2b3 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7606,6 +7925,18 @@ _LT_EOF
+@@ -7607,6 +7926,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -8214,7 +8189,7 @@ index bc09e7ef81..43c391c2b3 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7617,7 +7948,7 @@ _LT_EOF
+@@ -7618,7 +7949,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -8223,7 +8198,7 @@ index bc09e7ef81..43c391c2b3 100755
    const char *name;
    void       *address;
  }
-@@ -7643,8 +7974,8 @@ static const void *lt_preloaded_setup() {
+@@ -7644,8 +7975,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -8234,7 +8209,7 @@ index bc09e7ef81..43c391c2b3 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7654,8 +7985,8 @@ _LT_EOF
+@@ -7655,8 +7986,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -8245,7 +8220,7 @@ index bc09e7ef81..43c391c2b3 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7692,6 +8023,19 @@ else
+@@ -7693,6 +8024,13 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -8256,16 +8231,10 @@ index bc09e7ef81..43c391c2b3 100755
 +  nm_file_list_spec='@'
 +fi
 +
-+
-+
-+
-+
-+
-+
  
  
  
-@@ -7708,6 +8052,42 @@ fi
+@@ -7714,6 +8052,48 @@ fi
  
  
  
@@ -8273,6 +8242,7 @@ index bc09e7ef81..43c391c2b3 100755
 +
 +
 +
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -8305,10 +8275,15 @@ index bc09e7ef81..43c391c2b3 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
- 
- 
- 
-@@ -7919,6 +8299,123 @@ esac
++
++
++
++
++
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+   enableval=$enable_libtool_lock;
+@@ -7920,6 +8300,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -8432,7 +8407,7 @@ index bc09e7ef81..43c391c2b3 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -8482,6 +8979,8 @@ _LT_EOF
+@@ -8483,6 +8980,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -8441,7 +8416,7 @@ index bc09e7ef81..43c391c2b3 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8550,6 +9049,16 @@ done
+@@ -8551,6 +9050,16 @@ done
  
  
  
@@ -8458,7 +8433,7 @@ index bc09e7ef81..43c391c2b3 100755
  
  
  # Set options
-@@ -8678,7 +9187,8 @@ fi
+@@ -8679,7 +9188,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -8468,7 +8443,7 @@ index bc09e7ef81..43c391c2b3 100755
  
  
  
-@@ -8767,7 +9277,7 @@ aix3*)
+@@ -8768,7 +9278,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -8477,7 +8452,7 @@ index bc09e7ef81..43c391c2b3 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -9065,8 +9575,6 @@ fi
+@@ -9066,8 +9576,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -8486,7 +8461,7 @@ index bc09e7ef81..43c391c2b3 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -9232,6 +9740,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -9233,6 +9741,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -8499,7 +8474,7 @@ index bc09e7ef81..43c391c2b3 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -9294,7 +9808,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -9295,7 +9809,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -8508,7 +8483,7 @@ index bc09e7ef81..43c391c2b3 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -9351,13 +9865,17 @@ case $host_os in
+@@ -9352,13 +9866,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -8532,7 +8507,7 @@ index bc09e7ef81..43c391c2b3 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9418,6 +9936,11 @@ fi
+@@ -9419,6 +9937,11 @@ fi
  
  
  
@@ -8544,7 +8519,7 @@ index bc09e7ef81..43c391c2b3 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9768,7 +10291,8 @@ _LT_EOF
+@@ -9769,7 +10292,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -8554,7 +8529,7 @@ index bc09e7ef81..43c391c2b3 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9867,12 +10391,12 @@ _LT_EOF
+@@ -9868,12 +10392,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -8569,7 +8544,7 @@ index bc09e7ef81..43c391c2b3 100755
  	  fi
  	  ;;
  	esac
-@@ -9886,8 +10410,8 @@ _LT_EOF
+@@ -9887,8 +10411,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -8580,7 +8555,7 @@ index bc09e7ef81..43c391c2b3 100755
        fi
        ;;
  
-@@ -9905,8 +10429,8 @@ _LT_EOF
+@@ -9906,8 +10430,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8591,7 +8566,7 @@ index bc09e7ef81..43c391c2b3 100755
        else
  	ld_shlibs=no
        fi
-@@ -9952,8 +10476,8 @@ _LT_EOF
+@@ -9953,8 +10477,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8602,7 +8577,7 @@ index bc09e7ef81..43c391c2b3 100755
        else
  	ld_shlibs=no
        fi
-@@ -10083,7 +10607,13 @@ _LT_EOF
+@@ -10084,7 +10608,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -8617,7 +8592,7 @@ index bc09e7ef81..43c391c2b3 100755
  /* end confdefs.h.  */
  
  int
-@@ -10096,22 +10626,29 @@ main ()
+@@ -10097,22 +10627,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8660,7 +8635,7 @@ index bc09e7ef81..43c391c2b3 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -10123,7 +10660,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10124,7 +10661,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -8675,7 +8650,7 @@ index bc09e7ef81..43c391c2b3 100755
  /* end confdefs.h.  */
  
  int
-@@ -10136,22 +10679,29 @@ main ()
+@@ -10137,22 +10680,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8718,11 +8693,10 @@ index bc09e7ef81..43c391c2b3 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -10195,21 +10745,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
-       # When not using gcc, we currently assume that we are using
+@@ -10197,20 +10747,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
--      # no search path for DLLs.
+       # no search path for DLLs.
 -      hardcode_libdir_flag_spec=' '
 -      allow_undefined_flag=unsupported
 -      # Tell ltmain to make .lib files, not .a files.
@@ -8737,7 +8711,6 @@ index bc09e7ef81..43c391c2b3 100755
 -      old_archive_cmds='lib -OUT:$oldlib$oldobjs$old_deplibs'
 -      fix_srcfile_path='`cygpath -w "$srcfile"`'
 -      enable_shared_with_static_runtimes=yes
-+      # no search path for DLLs.
 +      case $cc_basename in
 +      cl*)
 +	# Native MSVC
@@ -8798,7 +8771,7 @@ index bc09e7ef81..43c391c2b3 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -10270,7 +10863,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10271,7 +10864,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -8807,7 +8780,7 @@ index bc09e7ef81..43c391c2b3 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -10278,7 +10871,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10279,7 +10872,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -8816,7 +8789,7 @@ index bc09e7ef81..43c391c2b3 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -10294,7 +10887,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10295,7 +10888,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -8825,7 +8798,7 @@ index bc09e7ef81..43c391c2b3 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10318,10 +10911,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10319,10 +10912,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -8838,7 +8811,7 @@ index bc09e7ef81..43c391c2b3 100755
  	  ;;
  	esac
        else
-@@ -10400,23 +10993,36 @@ fi
+@@ -10401,23 +10994,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -8883,7 +8856,7 @@ index bc09e7ef81..43c391c2b3 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10501,7 +11107,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10502,7 +11108,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -8892,7 +8865,7 @@ index bc09e7ef81..43c391c2b3 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10520,9 +11126,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10521,9 +11127,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -8904,7 +8877,7 @@ index bc09e7ef81..43c391c2b3 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -11098,8 +11704,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -11099,8 +11705,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -8916,7 +8889,7 @@ index bc09e7ef81..43c391c2b3 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -11132,13 +11739,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -11133,13 +11740,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -8989,7 +8962,7 @@ index bc09e7ef81..43c391c2b3 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -11230,7 +11895,7 @@ haiku*)
+@@ -11231,7 +11896,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -8998,16 +8971,16 @@ index bc09e7ef81..43c391c2b3 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -12026,7 +12691,7 @@ else
+@@ -12027,7 +12692,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 12029 "configure"
+-#line 12030 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -12070,10 +12735,10 @@ else
+@@ -12071,10 +12736,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -9020,16 +8993,16 @@ index bc09e7ef81..43c391c2b3 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12132,7 +12797,7 @@ else
+@@ -12133,7 +12798,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 12135 "configure"
+-#line 12136 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -12176,10 +12841,10 @@ else
+@@ -12177,10 +12842,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -9042,7 +9015,7 @@ index bc09e7ef81..43c391c2b3 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12571,6 +13236,7 @@ $RM -r conftest*
+@@ -12572,6 +13237,7 @@ $RM -r conftest*
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -9050,7 +9023,7 @@ index bc09e7ef81..43c391c2b3 100755
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -12588,6 +13254,7 @@ $RM -r conftest*
+@@ -12589,6 +13255,7 @@ $RM -r conftest*
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -9058,7 +9031,7 @@ index bc09e7ef81..43c391c2b3 100755
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -12870,7 +13537,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -12871,7 +13538,13 @@ $as_echo_n "checking whether the $compil
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -9073,7 +9046,7 @@ index bc09e7ef81..43c391c2b3 100755
  /* end confdefs.h.  */
  
  int
-@@ -12883,22 +13556,29 @@ main ()
+@@ -12884,22 +13557,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9116,7 +9089,7 @@ index bc09e7ef81..43c391c2b3 100755
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -12911,7 +13591,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12912,7 +13592,13 @@ if test -z "$aix_libpath"; then aix_libp
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -9131,7 +9104,7 @@ index bc09e7ef81..43c391c2b3 100755
  /* end confdefs.h.  */
  
  int
-@@ -12924,22 +13610,29 @@ main ()
+@@ -12925,22 +13611,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9174,7 +9147,7 @@ index bc09e7ef81..43c391c2b3 100755
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -12982,29 +13675,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12983,29 +13676,75 @@ if test -z "$aix_libpath"; then aix_libp
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -9273,7 +9246,7 @@ index bc09e7ef81..43c391c2b3 100755
        darwin* | rhapsody*)
  
  
-@@ -13110,7 +13849,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13111,7 +13850,7 @@ if test -z "$aix_libpath"; then aix_libp
              ;;
            *)
              if test "$GXX" = yes; then
@@ -9282,7 +9255,7 @@ index bc09e7ef81..43c391c2b3 100755
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -13181,10 +13920,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13182,10 +13921,10 @@ if test -z "$aix_libpath"; then aix_libp
  	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -9295,7 +9268,7 @@ index bc09e7ef81..43c391c2b3 100755
  	            ;;
  	        esac
  	      fi
-@@ -13225,9 +13964,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13226,9 +13965,9 @@ if test -z "$aix_libpath"; then aix_libp
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -9307,7 +9280,7 @@ index bc09e7ef81..43c391c2b3 100755
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -13297,20 +14036,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13298,20 +14037,20 @@ if test -z "$aix_libpath"; then aix_libp
  	      prelink_cmds_CXX='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -9332,7 +9305,7 @@ index bc09e7ef81..43c391c2b3 100755
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -13505,7 +14244,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13506,7 +14245,7 @@ if test -z "$aix_libpath"; then aix_libp
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -9341,7 +9314,7 @@ index bc09e7ef81..43c391c2b3 100755
  		  ;;
  	      esac
  
-@@ -13551,7 +14290,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13552,7 +14291,7 @@ if test -z "$aix_libpath"; then aix_libp
  
        solaris*)
          case $cc_basename in
@@ -9350,7 +9323,7 @@ index bc09e7ef81..43c391c2b3 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13592,9 +14331,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13593,9 +14332,9 @@ if test -z "$aix_libpath"; then aix_libp
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -9362,7 +9335,7 @@ index bc09e7ef81..43c391c2b3 100755
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -13729,6 +14468,13 @@ private:
+@@ -13730,6 +14469,13 @@ private:
  };
  _LT_EOF
  
@@ -9376,7 +9349,7 @@ index bc09e7ef81..43c391c2b3 100755
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13742,7 +14488,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13743,7 +14489,7 @@ if { { eval echo "\"\$as_me\":${as_linen
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -9385,7 +9358,7 @@ index bc09e7ef81..43c391c2b3 100755
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13751,13 +14497,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13752,13 +14498,22 @@ if { { eval echo "\"\$as_me\":${as_linen
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -9412,7 +9385,7 @@ index bc09e7ef81..43c391c2b3 100755
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -13777,8 +14532,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13778,8 +14533,10 @@ if { { eval echo "\"\$as_me\":${as_linen
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -9423,7 +9396,7 @@ index bc09e7ef81..43c391c2b3 100755
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -13814,6 +14571,7 @@ else
+@@ -13815,6 +14572,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -9431,7 +9404,7 @@ index bc09e7ef81..43c391c2b3 100755
  
  # PORTME: override above test on systems where it is broken
  case $host_os in
-@@ -13849,7 +14607,7 @@ linux*)
+@@ -13850,7 +14608,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -9440,7 +9413,7 @@ index bc09e7ef81..43c391c2b3 100755
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -13914,8 +14672,6 @@ fi
+@@ -13915,8 +14673,6 @@ fi
  lt_prog_compiler_pic_CXX=
  lt_prog_compiler_static_CXX=
  
@@ -9449,7 +9422,7 @@ index bc09e7ef81..43c391c2b3 100755
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -14020,6 +14776,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -14021,6 +14777,11 @@ $as_echo_n "checking for $compiler optio
  	  ;;
  	esac
  	;;
@@ -9461,7 +9434,7 @@ index bc09e7ef81..43c391c2b3 100755
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -14172,7 +14933,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -14173,7 +14934,7 @@ $as_echo_n "checking for $compiler optio
  	;;
        solaris*)
  	case $cc_basename in
@@ -9470,7 +9443,7 @@ index bc09e7ef81..43c391c2b3 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    lt_prog_compiler_pic_CXX='-KPIC'
  	    lt_prog_compiler_static_CXX='-Bstatic'
-@@ -14237,10 +14998,17 @@ case $host_os in
+@@ -14238,10 +14999,17 @@ case $host_os in
      lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
      ;;
  esac
@@ -9491,7 +9464,7 @@ index bc09e7ef81..43c391c2b3 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -14298,6 +15066,8 @@ fi
+@@ -14299,6 +15067,8 @@ fi
  
  
  
@@ -9500,7 +9473,7 @@ index bc09e7ef81..43c391c2b3 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -14475,6 +15245,7 @@ fi
+@@ -14476,6 +15246,7 @@ fi
  $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
  
    export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -9508,7 +9481,7 @@ index bc09e7ef81..43c391c2b3 100755
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -14489,15 +15260,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -14490,15 +15261,20 @@ $as_echo_n "checking whether the $compil
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -9534,7 +9507,7 @@ index bc09e7ef81..43c391c2b3 100755
  
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
  $as_echo "$ld_shlibs_CXX" >&6; }
-@@ -14760,8 +15536,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14761,8 +15537,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -9546,7 +9519,7 @@ index bc09e7ef81..43c391c2b3 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -14793,13 +15570,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14794,13 +15571,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -9619,7 +9592,7 @@ index bc09e7ef81..43c391c2b3 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -14890,7 +15725,7 @@ haiku*)
+@@ -14891,7 +15726,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -9628,7 +9601,7 @@ index bc09e7ef81..43c391c2b3 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -15349,6 +16184,7 @@ fi
+@@ -15350,6 +16185,7 @@ fi
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -9636,7 +9609,7 @@ index bc09e7ef81..43c391c2b3 100755
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -18444,13 +19280,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -18449,13 +19285,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -9657,7 +9630,7 @@ index bc09e7ef81..43c391c2b3 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -18465,14 +19308,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -18470,14 +19313,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -9676,7 +9649,7 @@ index bc09e7ef81..43c391c2b3 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -18505,12 +19351,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -18510,12 +19356,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -9690,7 +9663,7 @@ index bc09e7ef81..43c391c2b3 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -18549,8 +19395,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
+@@ -18554,8 +19400,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archi
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9700,7 +9673,7 @@ index bc09e7ef81..43c391c2b3 100755
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18577,12 +19423,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
+@@ -18582,12 +19428,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$har
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9714,7 +9687,7 @@ index bc09e7ef81..43c391c2b3 100755
  file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
  hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
  compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18620,8 +19466,13 @@ reload_flag \
+@@ -18625,8 +19471,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -9728,7 +9701,7 @@ index bc09e7ef81..43c391c2b3 100755
  STRIP \
  RANLIB \
  CC \
-@@ -18631,12 +19482,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -18636,12 +19487,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -9744,7 +9717,7 @@ index bc09e7ef81..43c391c2b3 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -18652,7 +19505,6 @@ no_undefined_flag \
+@@ -18657,7 +19510,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -9752,7 +9725,7 @@ index bc09e7ef81..43c391c2b3 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -18674,8 +19526,8 @@ LD_CXX \
+@@ -18679,8 +19531,8 @@ LD_CXX \
  reload_flag_CXX \
  compiler_CXX \
  lt_prog_compiler_no_builtin_flag_CXX \
@@ -9762,7 +9735,7 @@ index bc09e7ef81..43c391c2b3 100755
  lt_prog_compiler_static_CXX \
  lt_cv_prog_compiler_c_o_CXX \
  export_dynamic_flag_spec_CXX \
-@@ -18687,7 +19539,6 @@ no_undefined_flag_CXX \
+@@ -18692,7 +19544,6 @@ no_undefined_flag_CXX \
  hardcode_libdir_flag_spec_CXX \
  hardcode_libdir_flag_spec_ld_CXX \
  hardcode_libdir_separator_CXX \
@@ -9770,7 +9743,7 @@ index bc09e7ef81..43c391c2b3 100755
  exclude_expsyms_CXX \
  include_expsyms_CXX \
  file_list_spec_CXX \
-@@ -18721,6 +19572,7 @@ module_cmds \
+@@ -18726,6 +19577,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -9778,7 +9751,7 @@ index bc09e7ef81..43c391c2b3 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18735,7 +19587,8 @@ archive_expsym_cmds_CXX \
+@@ -18740,7 +19592,8 @@ archive_expsym_cmds_CXX \
  module_cmds_CXX \
  module_expsym_cmds_CXX \
  export_symbols_cmds_CXX \
@@ -9788,7 +9761,7 @@ index bc09e7ef81..43c391c2b3 100755
      case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
      *[\\\\\\\`\\"\\\$]*)
        eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
-@@ -19539,7 +20392,8 @@ $as_echo X"$file" |
+@@ -19505,7 +20358,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -9798,7 +9771,7 @@ index bc09e7ef81..43c391c2b3 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -19642,19 +20496,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -19608,19 +20462,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -9842,7 +9815,7 @@ index bc09e7ef81..43c391c2b3 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -19684,6 +20561,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -19650,6 +20527,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -9855,7 +9828,7 @@ index bc09e7ef81..43c391c2b3 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -19693,6 +20576,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -19659,6 +20542,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -9865,7 +9838,7 @@ index bc09e7ef81..43c391c2b3 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -19807,12 +20693,12 @@ with_gcc=$GCC
+@@ -19773,12 +20659,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -9881,7 +9854,7 @@ index bc09e7ef81..43c391c2b3 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -19899,9 +20785,6 @@ inherit_rpath=$inherit_rpath
+@@ -19865,9 +20751,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -9891,7 +9864,7 @@ index bc09e7ef81..43c391c2b3 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -19917,6 +20800,9 @@ include_expsyms=$lt_include_expsyms
+@@ -19883,6 +20766,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -9901,7 +9874,7 @@ index bc09e7ef81..43c391c2b3 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -19963,210 +20849,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -19929,210 +20815,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -10103,15 +10076,9 @@ index bc09e7ef81..43c391c2b3 100755
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
@@ -10269,13 +10236,16 @@ index bc09e7ef81..43c391c2b3 100755
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
  
-@@ -20194,12 +21039,12 @@ with_gcc=$GCC_CXX
+@@ -20160,12 +21005,12 @@ with_gcc=$GCC_CXX
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
  
@@ -10291,7 +10261,7 @@ index bc09e7ef81..43c391c2b3 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static_CXX
  
-@@ -20286,9 +21131,6 @@ inherit_rpath=$inherit_rpath_CXX
+@@ -20252,9 +21097,6 @@ inherit_rpath=$inherit_rpath_CXX
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs_CXX
  
@@ -10301,7 +10271,7 @@ index bc09e7ef81..43c391c2b3 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols_CXX
  
-@@ -20304,6 +21146,9 @@ include_expsyms=$lt_include_expsyms_CXX
+@@ -20270,6 +21112,9 @@ include_expsyms=$lt_include_expsyms_CXX
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds_CXX
  
@@ -10311,8 +10281,6 @@ index bc09e7ef81..43c391c2b3 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec_CXX
  
-diff --git a/libtool.m4 b/libtool.m4
-index 434530059f..e45fdc6998 100644
 --- a/libtool.m4
 +++ b/libtool.m4
 @@ -1,7 +1,8 @@
@@ -10354,7 +10322,7 @@ index 434530059f..e45fdc6998 100644
  AC_SUBST(LIBTOOL)dnl
  
  _LT_SETUP
-@@ -166,10 +169,13 @@ _LT_DECL([], [exeext], [0], [Executable file suffix (normally "")])dnl
+@@ -166,10 +169,13 @@ _LT_DECL([], [exeext], [0], [Executable
  dnl
  m4_require([_LT_FILEUTILS_DEFAULTS])dnl
  m4_require([_LT_CHECK_SHELL_FEATURES])dnl
@@ -10377,7 +10345,7 @@ index 434530059f..e45fdc6998 100644
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -632,7 +638,7 @@ m4_ifset([AC_PACKAGE_NAME], [AC_PACKAGE_NAME ])config.lt[]dnl
+@@ -632,7 +638,7 @@ m4_ifset([AC_PACKAGE_NAME], [AC_PACKAGE_
  m4_ifset([AC_PACKAGE_VERSION], [ AC_PACKAGE_VERSION])
  configured by $[0], generated by m4_PACKAGE_STRING.
  
@@ -10482,7 +10450,7 @@ index 434530059f..e45fdc6998 100644
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -1161,6 +1177,39 @@ _LT_DECL([], [ECHO], [1], [An echo program that protects backslashes])
+@@ -1161,6 +1177,39 @@ _LT_DECL([], [ECHO], [1], [An echo progr
  ])# _LT_PROG_ECHO_BACKSLASH
  
  
@@ -10735,7 +10703,7 @@ index 434530059f..e45fdc6998 100644
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -3174,7 +3336,11 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -3174,7 +3336,11 @@ test -z "$deplibs_check_method" && depli
  _LT_DECL([], [deplibs_check_method], [1],
      [Method to check whether dependent libraries are shared objects])
  _LT_DECL([], [file_magic_cmd], [1],
@@ -10863,7 +10831,7 @@ index 434530059f..e45fdc6998 100644
    const char *name;
    void       *address;
  }
-@@ -3510,15 +3750,15 @@ static const void *lt_preloaded_setup() {
+@@ -3510,15 +3750,15 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -10897,7 +10865,7 @@ index 434530059f..e45fdc6998 100644
  _LT_DECL([global_symbol_pipe], [lt_cv_sys_global_symbol_pipe], [1],
      [Take the output of nm and produce a listing of raw symbols and C names])
  _LT_DECL([global_symbol_to_cdecl], [lt_cv_sys_global_symbol_to_cdecl], [1],
-@@ -3561,6 +3808,8 @@ _LT_DECL([global_symbol_to_c_name_address],
+@@ -3561,6 +3808,8 @@ _LT_DECL([global_symbol_to_c_name_addres
  _LT_DECL([global_symbol_to_c_name_address_lib_prefix],
      [lt_cv_sys_global_symbol_to_c_name_address_lib_prefix], [1],
      [Transform the output of nm in a C name address pair when lib prefix is needed])
@@ -10982,7 +10950,7 @@ index 434530059f..e45fdc6998 100644
  #
  # Check to make sure the static flag actually works.
  #
-@@ -4213,6 +4477,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog_compiler_static], [1],
+@@ -4213,6 +4477,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog
  m4_defun([_LT_LINKER_SHLIBS],
  [AC_REQUIRE([LT_PATH_LD])dnl
  AC_REQUIRE([LT_PATH_NM])dnl
@@ -11304,7 +11272,7 @@ index 434530059f..e45fdc6998 100644
  if test -n "$CXX" && ( test "X$CXX" != "Xno" &&
      ( (test "X$CXX" = "Xg++" && `g++ -v >/dev/null 2>&1` ) ||
      (test "X$CXX" != "Xg++"))) ; then
-@@ -5487,6 +5818,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5487,6 +5818,7 @@ if test "$_lt_caught_CXX_error" != yes;
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -11312,7 +11280,7 @@ index 434530059f..e45fdc6998 100644
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -5504,6 +5836,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5504,6 +5836,7 @@ if test "$_lt_caught_CXX_error" != yes;
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -11320,7 +11288,7 @@ index 434530059f..e45fdc6998 100644
    compiler=$CC
    _LT_TAGVAR(compiler, $1)=$CC
    _LT_CC_BASENAME([$compiler])
-@@ -5667,7 +6000,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5667,7 +6000,7 @@ if test "$_lt_caught_CXX_error" != yes;
            _LT_TAGVAR(allow_undefined_flag, $1)='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -11329,7 +11297,7 @@ index 434530059f..e45fdc6998 100644
            _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  
            _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -5679,7 +6012,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5679,7 +6012,7 @@ if test "$_lt_caught_CXX_error" != yes;
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -11338,7 +11306,7 @@ index 434530059f..e45fdc6998 100644
  	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
  	    # -berok will link without error, but may produce a broken library.
-@@ -5721,29 +6054,75 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5721,29 +6054,75 @@ if test "$_lt_caught_CXX_error" != yes;
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -11437,7 +11405,7 @@ index 434530059f..e45fdc6998 100644
        darwin* | rhapsody*)
          _LT_DARWIN_LINKER_FEATURES($1)
  	;;
-@@ -5818,7 +6197,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5818,7 +6197,7 @@ if test "$_lt_caught_CXX_error" != yes;
              ;;
            *)
              if test "$GXX" = yes; then
@@ -11446,7 +11414,7 @@ index 434530059f..e45fdc6998 100644
              else
                # FIXME: insert proper C++ library support
                _LT_TAGVAR(ld_shlibs, $1)=no
-@@ -5889,10 +6268,10 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5889,10 +6268,10 @@ if test "$_lt_caught_CXX_error" != yes;
  	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -11459,7 +11427,7 @@ index 434530059f..e45fdc6998 100644
  	            ;;
  	        esac
  	      fi
-@@ -5933,9 +6312,9 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -5933,9 +6312,9 @@ if test "$_lt_caught_CXX_error" != yes;
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -11471,7 +11439,7 @@ index 434530059f..e45fdc6998 100644
  	      fi
  	    fi
  	    _LT_TAGVAR(link_all_deplibs, $1)=yes
-@@ -6005,20 +6384,20 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6005,20 +6384,20 @@ if test "$_lt_caught_CXX_error" != yes;
  	      _LT_TAGVAR(prelink_cmds, $1)='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -11496,7 +11464,7 @@ index 434530059f..e45fdc6998 100644
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -6213,7 +6592,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6213,7 +6592,7 @@ if test "$_lt_caught_CXX_error" != yes;
  	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -11505,7 +11473,7 @@ index 434530059f..e45fdc6998 100644
  		  ;;
  	      esac
  
-@@ -6259,7 +6638,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6259,7 +6638,7 @@ if test "$_lt_caught_CXX_error" != yes;
  
        solaris*)
          case $cc_basename in
@@ -11514,7 +11482,7 @@ index 434530059f..e45fdc6998 100644
  	    # Sun C++ 4.2, 5.x and Centerline C++
              _LT_TAGVAR(archive_cmds_need_lc,$1)=yes
  	    _LT_TAGVAR(no_undefined_flag, $1)=' -zdefs'
-@@ -6300,9 +6679,9 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6300,9 +6679,9 @@ if test "$_lt_caught_CXX_error" != yes;
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -11526,7 +11494,7 @@ index 434530059f..e45fdc6998 100644
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -6431,6 +6810,7 @@ if test "$_lt_caught_CXX_error" != yes; then
+@@ -6431,6 +6810,7 @@ if test "$_lt_caught_CXX_error" != yes;
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -11734,7 +11702,7 @@ index 434530059f..e45fdc6998 100644
  ])# _LT_LANG_RC_CONFIG
  
  
-@@ -7101,6 +7536,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object symbol dumper])
+@@ -7101,6 +7536,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object
  AC_SUBST([OBJDUMP])
  ])
  
@@ -11761,7 +11729,7 @@ index 434530059f..e45fdc6998 100644
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -7234,206 +7678,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn newlines into spaces])dnl
+@@ -7234,206 +7678,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn
  ])# _LT_CHECK_SHELL_FEATURES
  
  
@@ -11859,6 +11827,31 @@ index 434530059f..e45fdc6998 100644
 -{
 -  func_len_result=${#1}
 -}
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
 +# _LT_PROG_FUNCTION_REPLACE (FUNCNAME, REPLACEMENT-BODY)
 +# ------------------------------------------------------
 +# In `$cfgfile', look for function FUNCNAME delimited by `^FUNCNAME ()$' and
@@ -11875,23 +11868,22 @@ index 434530059f..e45fdc6998 100644
 +test 0 -eq $? || _lt_function_replace_fail=:
 +])
  
--_LT_EOF
--    ;;
--  *) # Bourne compatible functions.
--    cat << \_LT_EOF >> "$cfgfile"
+-dnl func_dirname_and_basename
+-dnl A portable version of this function is already defined in general.m4sh
+-dnl so there is no need for it here.
  
--# func_dirname file append nondir_replacement
--# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
--# otherwise set result to NONDIR_REPLACEMENT.
--func_dirname ()
+-# func_stripname prefix suffix name
+-# strip PREFIX and SUFFIX off of NAME.
+-# PREFIX and SUFFIX must not contain globbing or regex special
+-# characters, hashes, percent signs, but SUFFIX may contain a leading
+-# dot (in which case that matches only a dot).
+-# func_strip_suffix prefix name
+-func_stripname ()
 -{
--  # Extract subdirectory from the argument.
--  func_dirname_result=`$ECHO "${1}" | $SED "$dirname"`
--  if test "X$func_dirname_result" = "X${1}"; then
--    func_dirname_result="${3}"
--  else
--    func_dirname_result="$func_dirname_result${2}"
--  fi
+-  case ${2} in
+-    .*) func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%\\\\${2}\$%%"`;;
+-    *)  func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%${2}\$%%"`;;
+-  esac
 -}
 +# _LT_PROG_REPLACE_SHELLFNS
 +# -------------------------
@@ -11915,45 +11907,24 @@ index 434530059f..e45fdc6998 100644
 +    esac
 +    func_basename_result="${1##*/}"])
  
--# func_basename file
--func_basename ()
--{
--  func_basename_result=`$ECHO "${1}" | $SED "$basename"`
--}
+-# sed scripts:
+-my_sed_long_opt='1s/^\(-[[^=]]*\)=.*/\1/;q'
+-my_sed_long_arg='1s/^-[[^=]]*=//'
 +  _LT_PROG_FUNCTION_REPLACE([func_stripname], [dnl
 +    # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are
 +    # positional parameters, so assign one to ordinary parameter first.
 +    func_stripname_result=${3}
 +    func_stripname_result=${func_stripname_result#"${1}"}
 +    func_stripname_result=${func_stripname_result%"${2}"}])
- 
--dnl func_dirname_and_basename
--dnl A portable version of this function is already defined in general.m4sh
--dnl so there is no need for it here.
++
 +  _LT_PROG_FUNCTION_REPLACE([func_split_long_opt], [dnl
 +    func_split_long_opt_name=${1%%=*}
 +    func_split_long_opt_arg=${1#*=}])
- 
--# func_stripname prefix suffix name
--# strip PREFIX and SUFFIX off of NAME.
--# PREFIX and SUFFIX must not contain globbing or regex special
--# characters, hashes, percent signs, but SUFFIX may contain a leading
--# dot (in which case that matches only a dot).
--# func_strip_suffix prefix name
--func_stripname ()
--{
--  case ${2} in
--    .*) func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%\\\\${2}\$%%"`;;
--    *)  func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%${2}\$%%"`;;
--  esac
--}
++
 +  _LT_PROG_FUNCTION_REPLACE([func_split_short_opt], [dnl
 +    func_split_short_opt_arg=${1#??}
 +    func_split_short_opt_name=${1%"$func_split_short_opt_arg"}])
- 
--# sed scripts:
--my_sed_long_opt='1s/^\(-[[^=]]*\)=.*/\1/;q'
--my_sed_long_arg='1s/^-[[^=]]*=//'
++
 +  _LT_PROG_FUNCTION_REPLACE([func_lo2o], [dnl
 +    case ${1} in
 +      *.lo) func_lo2o_result=${1%.lo}.${objext} ;;
@@ -12001,9 +11972,7 @@ index 434530059f..e45fdc6998 100644
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
@@ -12017,14 +11986,17 @@ index 434530059f..e45fdc6998 100644
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
@@ -12110,8 +12082,6 @@ index 434530059f..e45fdc6998 100644
 +_LT_DECL([to_tool_file_cmd], [lt_cv_to_tool_file_cmd],
 +         [0], [convert $build files to toolchain format])dnl
 +])# _LT_PATH_CONVERSION_FUNCTIONS
-diff --git a/ltmain.sh b/ltmain.sh
-index 9503ec85d7..70e856e065 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
 @@ -1,10 +1,9 @@
@@ -12543,31 +12513,7 @@ index 9503ec85d7..70e856e065 100644
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
@@ -12597,9 +12543,7 @@ index 9503ec85d7..70e856e065 100644
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
@@ -12615,8 +12559,34 @@ index 9503ec85d7..70e856e065 100644
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
@@ -12860,13 +12830,13 @@ index 9503ec85d7..70e856e065 100644
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
@@ -13587,7 +13557,7 @@ index 9503ec85d7..70e856e065 100644
        "")
          # Generic help is extracted from the usage comments
          # at the start of this file.
-@@ -1659,8 +2327,8 @@ This mode accepts the following additional options:
+@@ -1659,8 +2327,8 @@ This mode accepts the following addition
  
    -o OUTPUT-FILE    set the output file name to OUTPUT-FILE
    -no-suppress      do not suppress compiler output for multiple passes
@@ -13598,7 +13568,7 @@ index 9503ec85d7..70e856e065 100644
    -shared           do not build a \`.o' file suitable for static linking
    -static           only build a \`.o' file suitable for static linking
    -Wc,FLAG          pass FLAG directly to the compiler
-@@ -1804,7 +2472,7 @@ Otherwise, only FILE itself is deleted using RM."
+@@ -1804,7 +2472,7 @@ Otherwise, only FILE itself is deleted u
          ;;
  
        *)
@@ -13700,7 +13670,7 @@ index 9503ec85d7..70e856e065 100644
 +    do
 +      if test -d "$opt"; then
 +	func_append libdirs " $opt"
- 
++
 +      elif test -f "$opt"; then
 +	if func_lalib_unsafe_p "$opt"; then
 +	  func_append libs " $opt"
@@ -13720,7 +13690,7 @@ index 9503ec85d7..70e856e065 100644
 +      else
 +        sysroot_cmd=
 +      fi
-+
+ 
 +      # Remove sysroot references
 +      if $opt_dry_run; then
 +        for lib in $libs; do
@@ -14132,7 +14102,7 @@ index 9503ec85d7..70e856e065 100644
  lt_${my_prefix}_LTX_preloaded_symbols[] =
  {\
    { \"$my_originator\", (void *) 0 },"
-@@ -2736,7 +3493,7 @@ static const void *lt_preloaded_setup() {
+@@ -2736,7 +3493,7 @@ static const void *lt_preloaded_setup()
  	for arg in $LTCFLAGS; do
  	  case $arg in
  	  -pie | -fpie | -fPIE) ;;
@@ -14661,7 +14631,7 @@ index 9503ec85d7..70e856e065 100644
  */
  EOF
  	    cat <<"EOF"
-@@ -3462,22 +4272,13 @@ int setenv (const char *, const char *, int);
+@@ -3462,22 +4272,13 @@ int setenv (const char *, const char *,
    if (stale) { free ((void *) stale); stale = 0; } \
  } while (0)
  
@@ -14688,7 +14658,7 @@ index 9503ec85d7..70e856e065 100644
  
  void *xmalloc (size_t num);
  char *xstrdup (const char *string);
-@@ -3487,7 +4288,10 @@ char *chase_symlinks (const char *pathspec);
+@@ -3487,7 +4288,10 @@ char *chase_symlinks (const char *pathsp
  int make_executable (const char *path);
  int check_executable (const char *path);
  char *strendzap (char *str, const char *pat);
@@ -15016,7 +14986,7 @@ index 9503ec85d7..70e856e065 100644
    vfprintf (stderr, message, ap);
    fprintf (stderr, ".\n");
  
-@@ -3988,20 +4832,32 @@ lt_error_core (int exit_status, const char *mode,
+@@ -3988,20 +4832,32 @@ lt_error_core (int exit_status, const ch
  }
  
  void
@@ -15054,7 +15024,7 @@ index 9503ec85d7..70e856e065 100644
    {
  #ifdef HAVE_SETENV
      /* always make a copy, for consistency with !HAVE_SETENV */
-@@ -4049,9 +4905,9 @@ lt_extend_str (const char *orig_value, const char *add, int to_end)
+@@ -4049,9 +4905,9 @@ lt_extend_str (const char *orig_value, c
  void
  lt_update_exe_path (const char *name, const char *value)
  {
@@ -15067,7 +15037,7 @@ index 9503ec85d7..70e856e065 100644
  
    if (name && *name && value && *value)
      {
-@@ -4070,9 +4926,9 @@ lt_update_exe_path (const char *name, const char *value)
+@@ -4070,9 +4926,9 @@ lt_update_exe_path (const char *name, co
  void
  lt_update_lib_path (const char *name, const char *value)
  {
@@ -17340,8 +17310,6 @@ index 9503ec85d7..70e856e065 100644
  
  if test -n "$exec_cmd"; then
    eval exec "$exec_cmd"
-diff --git a/ltoptions.m4 b/ltoptions.m4
-index 5ef12ced2a..17cfd51c0b 100644
 --- a/ltoptions.m4
 +++ b/ltoptions.m4
 @@ -8,7 +8,7 @@
@@ -17353,8 +17321,6 @@ index 5ef12ced2a..17cfd51c0b 100644
  
  # This is to help aclocal find these macros, as it can't see m4_define.
  AC_DEFUN([LTOPTIONS_VERSION], [m4_if([1])])
-diff --git a/ltversion.m4 b/ltversion.m4
-index bf87f77132..9c7b5d4118 100644
 --- a/ltversion.m4
 +++ b/ltversion.m4
 @@ -7,17 +7,17 @@
@@ -17381,8 +17347,6 @@ index bf87f77132..9c7b5d4118 100644
  _LT_DECL(, macro_version, 0, [Which release of libtool.m4 was used?])
  _LT_DECL(, macro_revision, 0)
  ])
-diff --git a/lt~obsolete.m4 b/lt~obsolete.m4
-index bf92b5e079..c573da90c5 100644
 --- a/lt~obsolete.m4
 +++ b/lt~obsolete.m4
 @@ -7,7 +7,7 @@
@@ -17394,8 +17358,6 @@ index bf92b5e079..c573da90c5 100644
  
  # These exist entirely to fool aclocal when bootstrapping libtool.
  #
-diff --git a/opcodes/configure b/opcodes/configure
-index 853849ee58..5f74ecf7da 100755
 --- a/opcodes/configure
 +++ b/opcodes/configure
 @@ -680,6 +680,9 @@ OTOOL
@@ -17445,7 +17407,7 @@ index 853849ee58..5f74ecf7da 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6130,8 +6136,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6130,8 +6136,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -17581,7 +17543,7 @@ index 853849ee58..5f74ecf7da 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6531,11 +6632,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6533,9 +6634,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -17595,8 +17557,6 @@ index 853849ee58..5f74ecf7da 100755
 +
 +
 +
- 
- 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -17796,7 +17756,7 @@ index 853849ee58..5f74ecf7da 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6621,16 +6883,72 @@ ac_tool_warned=yes ;;
+@@ -6621,12 +6883,11 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -17809,16 +17769,13 @@ index 853849ee58..5f74ecf7da 100755
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
+@@ -6637,6 +6898,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+ 
+ 
+ 
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
 +if ${lt_cv_ar_at_file+:} false; then :
@@ -17831,7 +17788,7 @@ index 853849ee58..5f74ecf7da 100755
 +int
 +main ()
 +{
- 
++
 +  ;
 +  return 0;
 +}
@@ -17857,22 +17814,28 @@ index 853849ee58..5f74ecf7da 100755
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
+ if test -n "$ac_tool_prefix"; then
+   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
 @@ -6972,8 +7290,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
@@ -17920,7 +17883,7 @@ index 853849ee58..5f74ecf7da 100755
    const char *name;
    void       *address;
  }
-@@ -7087,8 +7418,8 @@ static const void *lt_preloaded_setup() {
+@@ -7087,8 +7418,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -17942,7 +17905,7 @@ index 853849ee58..5f74ecf7da 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7136,6 +7467,16 @@ else
+@@ -7136,6 +7467,14 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -17954,18 +17917,13 @@ index 853849ee58..5f74ecf7da 100755
 +fi
 +
 +
-+
-+
  
  
  
-@@ -7152,6 +7493,45 @@ fi
+@@ -7157,6 +7496,47 @@ fi
  
  
  
-+
-+
-+
 +
 +
 +
@@ -18002,9 +17960,14 @@ index 853849ee58..5f74ecf7da 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
- 
- 
- 
++
++
++
++
++
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
+   enableval=$enable_libtool_lock;
 @@ -7363,6 +7743,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -18166,7 +18129,7 @@ index 853849ee58..5f74ecf7da 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8645,6 +9143,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8645,6 +9143,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -18179,7 +18142,7 @@ index 853849ee58..5f74ecf7da 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8707,7 +9211,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8707,7 +9211,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -18340,7 +18303,7 @@ index 853849ee58..5f74ecf7da 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9536,7 +10063,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9536,7 +10063,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -18398,7 +18361,7 @@ index 853849ee58..5f74ecf7da 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9609,20 +10149,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9609,20 +10149,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -18476,7 +18439,7 @@ index 853849ee58..5f74ecf7da 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9683,7 +10266,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9683,7 +10266,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -18485,7 +18448,7 @@ index 853849ee58..5f74ecf7da 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9691,7 +10274,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9691,7 +10274,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -18494,7 +18457,7 @@ index 853849ee58..5f74ecf7da 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9707,7 +10290,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9707,7 +10290,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -18503,7 +18466,7 @@ index 853849ee58..5f74ecf7da 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9731,10 +10314,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9731,10 +10314,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -18561,7 +18524,7 @@ index 853849ee58..5f74ecf7da 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9914,7 +10510,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9914,7 +10510,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -18570,7 +18533,7 @@ index 853849ee58..5f74ecf7da 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9933,9 +10529,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9933,9 +10529,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -18729,7 +18692,7 @@ index 853849ee58..5f74ecf7da 100755
    fi
  
    case "${host}" in
-@@ -13756,13 +14411,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -13757,13 +14412,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -18750,7 +18713,7 @@ index 853849ee58..5f74ecf7da 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13777,14 +14439,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -13778,14 +14440,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -18769,7 +18732,7 @@ index 853849ee58..5f74ecf7da 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13817,12 +14482,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -13818,12 +14483,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -18783,7 +18746,7 @@ index 853849ee58..5f74ecf7da 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -13877,8 +14542,13 @@ reload_flag \
+@@ -13878,8 +14543,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -18797,7 +18760,7 @@ index 853849ee58..5f74ecf7da 100755
  STRIP \
  RANLIB \
  CC \
-@@ -13888,12 +14558,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -13889,12 +14559,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -18813,7 +18776,7 @@ index 853849ee58..5f74ecf7da 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -13909,7 +14581,6 @@ no_undefined_flag \
+@@ -13910,7 +14582,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -18821,7 +18784,7 @@ index 853849ee58..5f74ecf7da 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13945,6 +14616,7 @@ module_cmds \
+@@ -13946,6 +14617,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -18829,7 +18792,7 @@ index 853849ee58..5f74ecf7da 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -14710,7 +15382,8 @@ $as_echo X"$file" |
+@@ -14711,7 +15383,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -18839,7 +18802,7 @@ index 853849ee58..5f74ecf7da 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -14813,19 +15486,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -14814,19 +15487,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -18883,7 +18846,7 @@ index 853849ee58..5f74ecf7da 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14855,6 +15551,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -14856,6 +15552,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -18896,7 +18859,7 @@ index 853849ee58..5f74ecf7da 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -14864,6 +15566,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -14865,6 +15567,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -18906,7 +18869,7 @@ index 853849ee58..5f74ecf7da 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14978,12 +15683,12 @@ with_gcc=$GCC
+@@ -14979,12 +15684,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -18922,7 +18885,7 @@ index 853849ee58..5f74ecf7da 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -15070,9 +15775,6 @@ inherit_rpath=$inherit_rpath
+@@ -15071,9 +15776,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -18932,7 +18895,7 @@ index 853849ee58..5f74ecf7da 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -15088,6 +15790,9 @@ include_expsyms=$lt_include_expsyms
+@@ -15089,6 +15791,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -18942,7 +18905,7 @@ index 853849ee58..5f74ecf7da 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -15120,210 +15825,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -15121,210 +15826,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -19144,15 +19107,9 @@ index 853849ee58..5f74ecf7da 100755
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
@@ -19310,14 +19267,15 @@ index 853849ee58..5f74ecf7da 100755
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
-index 4eb19005e8..19a57608b9 100644
 --- a/opcodes/configure.ac
 +++ b/opcodes/configure.ac
 @@ -170,7 +170,7 @@ changequote(,)dnl
@@ -19329,8 +19287,6 @@ index 4eb19005e8..19a57608b9 100644
    fi
  
    case "${host}" in
-diff --git a/zlib/configure b/zlib/configure
-index 041cbdbf71..19d605fc85 100755
 --- a/zlib/configure
 +++ b/zlib/configure
 @@ -646,8 +646,11 @@ OTOOL
@@ -19382,7 +19338,7 @@ index 041cbdbf71..19d605fc85 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5004,8 +5010,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5004,8 +5010,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -19518,7 +19474,7 @@ index 041cbdbf71..19d605fc85 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5405,11 +5506,165 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -5407,9 +5508,163 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -19532,8 +19488,6 @@ index 041cbdbf71..19d605fc85 100755
 +
 +
 +
- 
- 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -19734,7 +19688,7 @@ index 041cbdbf71..19d605fc85 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -5495,16 +5758,72 @@ ac_tool_warned=yes ;;
+@@ -5495,12 +5758,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -19746,17 +19700,13 @@ index 041cbdbf71..19d605fc85 100755
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
 +if ${lt_cv_ar_at_file+:} false; then :
@@ -19769,7 +19719,7 @@ index 041cbdbf71..19d605fc85 100755
 +int
 +main ()
 +{
- 
++
 +  ;
 +  return 0;
 +}
@@ -19795,22 +19745,29 @@ index 041cbdbf71..19d605fc85 100755
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
 @@ -5846,8 +6165,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
@@ -19858,7 +19815,7 @@ index 041cbdbf71..19d605fc85 100755
    const char *name;
    void       *address;
  }
-@@ -5961,8 +6293,8 @@ static const void *lt_preloaded_setup() {
+@@ -5961,8 +6293,8 @@ static const void *lt_preloaded_setup()
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -19880,7 +19837,7 @@ index 041cbdbf71..19d605fc85 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6010,6 +6342,19 @@ else
+@@ -6010,6 +6342,18 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -19896,17 +19853,13 @@ index 041cbdbf71..19d605fc85 100755
 +
 +
 +
-+
  
  
  
-@@ -6027,6 +6372,41 @@ fi
+@@ -6031,6 +6375,42 @@ fi
  
  
  
-+
-+
-+
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -19939,9 +19892,13 @@ index 041cbdbf71..19d605fc85 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
++
++
++
++
  
- 
- 
+ # Check whether --enable-libtool-lock was given.
+ if test "${enable_libtool_lock+set}" = set; then :
 @@ -6241,6 +6621,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -20103,7 +20060,7 @@ index 041cbdbf71..19d605fc85 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -7823,6 +8321,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -7823,6 +8321,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -20116,7 +20073,7 @@ index 041cbdbf71..19d605fc85 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -7885,7 +8389,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -7885,7 +8389,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -20277,7 +20234,7 @@ index 041cbdbf71..19d605fc85 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -8717,7 +9244,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8717,7 +9244,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -20335,7 +20292,7 @@ index 041cbdbf71..19d605fc85 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -8793,20 +9333,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8793,20 +9333,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -20413,7 +20370,7 @@ index 041cbdbf71..19d605fc85 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -8867,7 +9450,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8867,7 +9450,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -20422,7 +20379,7 @@ index 041cbdbf71..19d605fc85 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -8875,7 +9458,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8875,7 +9458,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -20431,7 +20388,7 @@ index 041cbdbf71..19d605fc85 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -8891,7 +9474,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8891,7 +9474,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -20440,7 +20397,7 @@ index 041cbdbf71..19d605fc85 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -8915,10 +9498,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8915,10 +9498,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -20501,7 +20458,7 @@ index 041cbdbf71..19d605fc85 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9101,7 +9697,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9101,7 +9697,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -20510,7 +20467,7 @@ index 041cbdbf71..19d605fc85 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9120,9 +9716,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9120,9 +9716,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -20660,7 +20617,7 @@ index 041cbdbf71..19d605fc85 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12267,13 +12922,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -12267,13 +12922,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -20681,7 +20638,7 @@ index 041cbdbf71..19d605fc85 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -12288,14 +12950,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -12288,14 +12950,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -20700,7 +20657,7 @@ index 041cbdbf71..19d605fc85 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -12328,12 +12993,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -12328,12 +12993,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -20814,7 +20771,7 @@ index 041cbdbf71..19d605fc85 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -13199,6 +13895,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -13199,6 +13895,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -21075,15 +21032,9 @@ index 041cbdbf71..19d605fc85 100755
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
@@ -21241,12 +21192,12 @@ index 041cbdbf71..19d605fc85 100755
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
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
index a2c6312d0a..5a195054f6 100644
--- a/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
+++ b/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
@@ -1,8 +1,8 @@
-From 8cb013106c379e81fe40cfdf486d9805c9e276ad Mon Sep 17 00:00:00 2001
+From cd6151c8423a0550fd5758ce17664e34560a103c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:39:01 +0000
-Subject: [PATCH 07/15] don't let the distro compiler point to the wrong
- installation location
+Subject: [PATCH] don't let the distro compiler point to the wrong installation
+ location
 
 Thanks to RP for helping find the source code causing the issue.
 
@@ -30,6 +30,3 @@ index 0be45b4ae8..4817616bb2 100644
  install_to_libdir: all
  	if test -n "${target_header_dir}"; then \
  		${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
index 9727821b1f..655cc375a9 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -1,7 +1,7 @@
-From 98f68c0892ba4bbd53b0a0a4cbbdf0b7197e0320 Mon Sep 17 00:00:00 2001
+From 8ee1a4986ea35bd1e8ab867c5639d5fdbd944d9f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Jan 2016 06:31:09 +0000
-Subject: [PATCH 08/15] warn for uses of system directories when cross linking
+Subject: [PATCH] warn for uses of system directories when cross linking
 
 2008-07-02  Joseph Myers  <joseph@codesourcery.com>
 
@@ -62,8 +62,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ld/lexsup.c     | 16 ++++++++++++++++
  9 files changed, 86 insertions(+)
 
-diff --git a/ld/config.in b/ld/config.in
-index d93c9b0830..5da2742bea 100644
 --- a/ld/config.in
 +++ b/ld/config.in
 @@ -31,6 +31,9 @@
@@ -76,11 +74,9 @@ index d93c9b0830..5da2742bea 100644
  /* Additional extension a shared object might have. */
  #undef EXTRA_SHLIB_EXTENSION
  
-diff --git a/ld/configure b/ld/configure
-index 43c391c2b3..ff9f6b3c02 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -826,6 +826,7 @@ with_lib_path
+@@ -827,6 +827,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -88,7 +84,7 @@ index 43c391c2b3..ff9f6b3c02 100755
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1490,6 +1491,8 @@ Optional Features:
+@@ -1491,6 +1492,8 @@ Optional Features:
    --disable-largefile     omit support for large files
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -97,7 +93,7 @@ index 43c391c2b3..ff9f6b3c02 100755
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -16618,6 +16621,19 @@ fi
+@@ -16619,6 +16622,19 @@ fi
  
  
  
@@ -117,8 +113,6 @@ index 43c391c2b3..ff9f6b3c02 100755
  # Check whether --enable-gold was given.
  if test "${enable_gold+set}" = set; then :
    enableval=$enable_gold; case "${enableval}" in
-diff --git a/ld/configure.ac b/ld/configure.ac
-index d335f21091..7f692d9387 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
 @@ -94,6 +94,16 @@ AC_SUBST(use_sysroot)
@@ -138,8 +132,6 @@ index d335f21091..7f692d9387 100644
  dnl Use --enable-gold to decide if this linker should be the default.
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
-diff --git a/ld/ld.h b/ld/ld.h
-index b97d977f37..f3bbd2d55d 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
 @@ -180,6 +180,14 @@ typedef struct
@@ -157,11 +149,9 @@ index b97d977f37..f3bbd2d55d 100644
    /* Big or little endian as set on command line.  */
    enum endian_enum endian;
  
-diff --git a/ld/ld.texi b/ld/ld.texi
-index 5179af3e0e..f78bf74682 100644
 --- a/ld/ld.texi
 +++ b/ld/ld.texi
-@@ -2524,6 +2524,18 @@ string identifying the original linked file does not change.
+@@ -2557,6 +2557,18 @@ string identifying the original linked f
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
@@ -180,11 +170,9 @@ index 5179af3e0e..f78bf74682 100644
  @end table
  
  @c man end
-diff --git a/ld/ldfile.c b/ld/ldfile.c
-index fcadc08c73..63e295ce8a 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
-@@ -116,6 +116,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
+@@ -116,6 +116,23 @@ ldfile_add_library_path (const char *nam
      new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
    else
      new_dirs->name = xstrdup (name);
@@ -208,24 +196,20 @@ index fcadc08c73..63e295ce8a 100644
  }
  
  /* Try to open a BFD for a lang_input_statement.  */
-diff --git a/ld/ldlex.h b/ld/ldlex.h
-index 32853debe4..8135361c49 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
-@@ -148,6 +148,8 @@ enum option_values
-   OPTION_REQUIRE_DEFINED_SYMBOL,
-   OPTION_ORPHAN_HANDLING,
+@@ -150,6 +150,8 @@ enum option_values
    OPTION_FORCE_GROUP_ALLOCATION,
+   OPTION_PRINT_MAP_DISCARDED,
+   OPTION_NO_PRINT_MAP_DISCARDED,
 +  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
 +  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
  };
  
  /* The initial parser states.  */
-diff --git a/ld/ldmain.c b/ld/ldmain.c
-index 77cdbd0dd2..725512f126 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -269,6 +269,8 @@ main (int argc, char **argv)
+@@ -270,6 +270,8 @@ main (int argc, char **argv)
    command_line.warn_mismatch = TRUE;
    command_line.warn_search_mismatch = TRUE;
    command_line.check_section_addresses = -1;
@@ -234,13 +218,11 @@ index 77cdbd0dd2..725512f126 100644
  
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
-diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 88e85c73f4..eed1b71456 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
-@@ -543,6 +543,14 @@ static const struct ld_option ld_options[] =
-   { {"orphan-handling", required_argument, NULL, OPTION_ORPHAN_HANDLING},
-     '\0', N_("=MODE"), N_("Control how orphan sections are handled."),
+@@ -549,6 +549,14 @@ static const struct ld_option ld_options
+   { {"no-print-map-discarded", no_argument, NULL, OPTION_NO_PRINT_MAP_DISCARDED},
+     '\0', NULL, N_("Do not show discarded sections in map file output"),
      TWO_DASHES },
 +  { {"no-poison-system-directories", no_argument, NULL,
 +     OPTION_NO_POISON_SYSTEM_DIRECTORIES},
@@ -253,10 +235,10 @@ index 88e85c73f4..eed1b71456 100644
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -1577,6 +1585,14 @@ parse_args (unsigned argc, char **argv)
- 	    einfo (_("%F%P: invalid argument to option"
- 		     " \"--orphan-handling\"\n"));
- 	  break;
+@@ -1590,6 +1598,13 @@ parse_args (unsigned argc, char **argv)
+ 
+ 	case OPTION_PRINT_MAP_DISCARDED:
+ 	  config.print_map_discarded = TRUE;
 +
 +	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
 +	  command_line.poison_system_directories = FALSE;
@@ -264,10 +246,6 @@ index 88e85c73f4..eed1b71456 100644
 +
 +	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
 +	  command_line.error_poison_system_directories = TRUE;
-+	  break;
+ 	  break;
  	}
      }
- 
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
index b6b1e7a672..e63d278bcd 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
@@ -1,7 +1,7 @@
-From 2cd5613a86f8772f9d7f188532718363668ed99d Mon Sep 17 00:00:00 2001
+From 903a43f07b7229adadff0f01d560646eb4b0e200 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:42:38 +0000
-Subject: [PATCH 09/15] Fix rpath in libtool when sysroot is enabled
+Subject: [PATCH] Fix rpath in libtool when sysroot is enabled
 
 Enabling sysroot support in libtool exposed a bug where the final
 library had an RPATH encoded into it which still pointed to the
@@ -47,6 +47,3 @@ index 70e856e065..11ee684ccc 100644
  	  if test -n "$hardcode_libdir_separator"; then
  	    if test -z "$hardcode_libdirs"; then
  	      hardcode_libdirs="$libdir"
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch
index 5f4ac72f48..e6b50dbcde 100644
--- a/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch
+++ b/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch
@@ -1,7 +1,7 @@
-From 958a49749b772660d3bafb80748829cba6bed065 Mon Sep 17 00:00:00 2001
+From 84349ede307f61d624e5d97397074f5177a5bdc9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:44:14 +0000
-Subject: [PATCH 10/15] Change default emulation for mips64*-*-linux
+Subject: [PATCH] Change default emulation for mips64*-*-linux
 
 we change the default emulations to be N64 instead of N32
 
@@ -13,11 +13,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ld/configure.tgt | 8 ++++----
  2 files changed, 8 insertions(+), 8 deletions(-)
 
-diff --git a/bfd/config.bfd b/bfd/config.bfd
-index 0e1ddb659c..d4f50f0a8d 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -919,12 +919,12 @@ case "${targ}" in
+@@ -915,12 +915,12 @@ case "${targ}" in
      targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec mips_ecoff_be_vec mips_ecoff_le_vec"
      ;;
    mips64*el-*-linux*)
@@ -30,15 +28,13 @@ index 0e1ddb659c..d4f50f0a8d 100644
 -    targ_defvec=mips_elf32_ntrad_be_vec
 -    targ_selvecs="mips_elf32_ntrad_le_vec mips_elf32_trad_be_vec mips_elf32_trad_le_vec mips_elf64_trad_be_vec mips_elf64_trad_le_vec"
 +    targ_defvec=mips_elf64_trad_be_vec
-+    targ_selvecs="mips_elf32_ntrad_be_vec mips_elf32_ntrad_le_vec mips_elf32_trad_be_vec mips_elf32_trad_le_vec mips_elf64_trad_le_vec"
++    targ_selvecs="mips_elf32_ntrad_be_vec mips_elf32_ntrad_be_vec mips_elf32_trad_be_vec mips_elf32_trad_le_vec mips_elf64_trad_le_vec"
      ;;
    mips*el-*-linux*)
      targ_defvec=mips_elf32_trad_le_vec
-diff --git a/ld/configure.tgt b/ld/configure.tgt
-index beba17ef51..917be6f8eb 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -468,11 +468,11 @@ mips*el-*-vxworks*)	targ_emul=elf32elmipvxworks
+@@ -468,11 +468,11 @@ mips*el-*-vxworks*)	targ_emul=elf32elmip
  mips*-*-vxworks*)	targ_emul=elf32ebmipvxworks
  			targ_extra_emuls="elf32elmipvxworks" ;;
  mips*-*-windiss)	targ_emul=elf32mipswindiss ;;
diff --git a/meta/recipes-devtools/binutils/binutils/0011-Add-support-for-Netlogic-XLP.patch b/meta/recipes-devtools/binutils/binutils/0011-Add-support-for-Netlogic-XLP.patch
index 20c5ed6308..b710752245 100644
--- a/meta/recipes-devtools/binutils/binutils/0011-Add-support-for-Netlogic-XLP.patch
+++ b/meta/recipes-devtools/binutils/binutils/0011-Add-support-for-Netlogic-XLP.patch
@@ -1,7 +1,7 @@
-From e4a0cd30c7e9334ed507c93014a8b2d1315ff937 Mon Sep 17 00:00:00 2001
+From 97e0fdbf8e85a7e690ac09d01a2ae93ba00cfb5d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:06:19 +0000
-Subject: [PATCH 11/15] Add support for Netlogic XLP
+Subject: [PATCH] Add support for Netlogic XLP
 
 Patch From: Nebu Philips <nphilips@netlogicmicro.com>
 
@@ -28,16 +28,14 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  gas/configure         |  3 +++
  include/elf/mips.h    |  1 +
  include/opcode/mips.h |  6 ++++++
- ld/configure.tgt      |  2 ++
+ ld/configure.tgt      |  3 +++
  opcodes/mips-dis.c    | 12 +++++-------
  opcodes/mips-opc.c    | 31 ++++++++++++++++++++-----------
- 14 files changed, 61 insertions(+), 21 deletions(-)
+ 14 files changed, 62 insertions(+), 21 deletions(-)
 
-diff --git a/bfd/aoutx.h b/bfd/aoutx.h
-index e5d8dcf390..2cc74a2d61 100644
 --- a/bfd/aoutx.h
 +++ b/bfd/aoutx.h
-@@ -799,6 +799,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,
+@@ -799,6 +799,7 @@ NAME (aout, machine_type) (enum bfd_arch
  	case bfd_mach_mipsisa64r6:
  	case bfd_mach_mips_sb1:
  	case bfd_mach_mips_xlr:
@@ -45,8 +43,6 @@ index e5d8dcf390..2cc74a2d61 100644
  	  /* FIXME: These should be MIPS3, MIPS4, MIPS16, MIPS32, etc.  */
  	  arch_flags = M_MIPS2;
  	  break;
-diff --git a/bfd/archures.c b/bfd/archures.c
-index 647cf0d8d4..7e1d0c810f 100644
 --- a/bfd/archures.c
 +++ b/bfd/archures.c
 @@ -185,6 +185,7 @@ DESCRIPTION
@@ -57,11 +53,9 @@ index 647cf0d8d4..7e1d0c810f 100644
  .#define bfd_mach_mipsisa32		32
  .#define bfd_mach_mipsisa32r2		33
  .#define bfd_mach_mipsisa32r3		34
-diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
-index e25da50aaf..e251d7e7aa 100644
 --- a/bfd/bfd-in2.h
 +++ b/bfd/bfd-in2.h
-@@ -2084,6 +2084,7 @@ enum bfd_architecture
+@@ -2125,6 +2125,7 @@ enum bfd_architecture
  #define bfd_mach_mips_octeon3          6503
  #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'.  */
  #define bfd_mach_mips_interaptiv_mr2   736550   /* decimal 'IA2'.  */
@@ -69,11 +63,9 @@ index e25da50aaf..e251d7e7aa 100644
  #define bfd_mach_mipsisa32             32
  #define bfd_mach_mipsisa32r2           33
  #define bfd_mach_mipsisa32r3           34
-diff --git a/bfd/config.bfd b/bfd/config.bfd
-index cc65547588..3614ff79d4 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -902,6 +902,11 @@ case "${targ}" in
+@@ -898,6 +898,11 @@ case "${targ}" in
      targ_defvec=mips_elf32_le_vec
      targ_selvecs="mips_elf32_be_vec mips_elf64_be_vec mips_elf64_le_vec"
      ;;
@@ -85,8 +77,6 @@ index cc65547588..3614ff79d4 100644
    mips*-*-elf* | mips*-*-rtems* | mips*-*-windiss | mips*-*-none)
      targ_defvec=mips_elf32_be_vec
      targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec"
-diff --git a/bfd/cpu-mips.c b/bfd/cpu-mips.c
-index b359491305..61a3e7aaca 100644
 --- a/bfd/cpu-mips.c
 +++ b/bfd/cpu-mips.c
 @@ -107,7 +107,8 @@ enum
@@ -99,21 +89,19 @@ index b359491305..61a3e7aaca 100644
  };
  
  #define NN(index) (&arch_info_struct[(index) + 1])
-@@ -162,7 +163,8 @@ static const bfd_arch_info_type arch_info_struct[] =
+@@ -162,7 +163,8 @@ static const bfd_arch_info_type arch_inf
    N (64, 64, bfd_mach_mips_xlr, "mips:xlr",	  FALSE, NN(I_xlr)),
    N (32, 32, bfd_mach_mips_interaptiv_mr2, "mips:interaptiv-mr2", FALSE,
       NN(I_interaptiv_mr2)),
 -  N (64, 64, bfd_mach_mips_micromips,"mips:micromips",FALSE,0)
-+  N (64, 64, bfd_mach_mips_micromips,"mips:micromips",FALSE,NN(I_micromips)),
-+  N (64, 64, bfd_mach_mips_xlp, "mips:xlp",      FALSE, 0)
++  N (64, 64, bfd_mach_mips_micromips, "mips:micromips", FALSE, NN(I_micromips)),
++  N (64, 64, bfd_mach_mips_xlp, "mips:xlp", FALSE, NULL)
  };
  
  /* The default architecture is mips:3000, but with a machine number of
-diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c
-index 5998bc43a8..0d5795222b 100644
 --- a/bfd/elfxx-mips.c
 +++ b/bfd/elfxx-mips.c
-@@ -6919,6 +6919,9 @@ _bfd_elf_mips_mach (flagword flags)
+@@ -6999,6 +6999,9 @@ _bfd_elf_mips_mach (flagword flags)
      case E_MIPS_MACH_IAMR2:
        return bfd_mach_mips_interaptiv_mr2;
  
@@ -123,7 +111,7 @@ index 5998bc43a8..0d5795222b 100644
      default:
        switch (flags & EF_MIPS_ARCH)
  	{
-@@ -12199,6 +12202,10 @@ mips_set_isa_flags (bfd *abfd)
+@@ -12360,6 +12363,10 @@ mips_set_isa_flags (bfd *abfd)
        val = E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;
        break;
  
@@ -134,7 +122,7 @@ index 5998bc43a8..0d5795222b 100644
      case bfd_mach_mipsisa32:
        val = E_MIPS_ARCH_32;
        break;
-@@ -14214,6 +14221,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
+@@ -14394,6 +14401,7 @@ static const struct mips_mach_extension
    { bfd_mach_mips_gs264e, bfd_mach_mips_gs464e },
    { bfd_mach_mips_gs464e, bfd_mach_mips_gs464 },
    { bfd_mach_mips_gs464, bfd_mach_mipsisa64r2 },
@@ -142,11 +130,9 @@ index 5998bc43a8..0d5795222b 100644
  
    /* MIPS64 extensions.  */
    { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },
-diff --git a/binutils/readelf.c b/binutils/readelf.c
-index b13eb6a43b..9df3742682 100644
 --- a/binutils/readelf.c
 +++ b/binutils/readelf.c
-@@ -3412,6 +3412,7 @@ get_machine_flags (Filedata * filedata, unsigned e_flags, unsigned e_machine)
+@@ -3446,6 +3446,7 @@ get_machine_flags (Filedata * filedata,
  	    case E_MIPS_MACH_OCTEON3: strcat (buf, ", octeon3"); break;
  	    case E_MIPS_MACH_XLR:  strcat (buf, ", xlr"); break;
  	    case E_MIPS_MACH_IAMR2:  strcat (buf, ", interaptiv-mr2"); break;
@@ -154,11 +140,9 @@ index b13eb6a43b..9df3742682 100644
  	    case 0:
  	    /* We simply ignore the field in this case to avoid confusion:
  	       MIPS ELF does not specify EF_MIPS_MACH, it is a GNU
-diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c
-index ae55904229..d6882712f5 100644
 --- a/gas/config/tc-mips.c
 +++ b/gas/config/tc-mips.c
-@@ -554,6 +554,7 @@ static int mips_32bitmode = 0;
+@@ -568,6 +568,7 @@ static int mips_32bitmode = 0;
     || mips_opts.arch == CPU_RM7000                    \
     || mips_opts.arch == CPU_VR5500                    \
     || mips_opts.micromips                             \
@@ -166,7 +150,7 @@ index ae55904229..d6882712f5 100644
     )
  
  /* Whether the processor uses hardware interlocks to protect reads
-@@ -583,6 +584,7 @@ static int mips_32bitmode = 0;
+@@ -597,6 +598,7 @@ static int mips_32bitmode = 0;
      && mips_opts.isa != ISA_MIPS3)                    \
     || mips_opts.arch == CPU_R4300                     \
     || mips_opts.micromips                             \
@@ -174,20 +158,18 @@ index ae55904229..d6882712f5 100644
     )
  
  /* Whether the processor uses hardware interlocks to protect reads
-@@ -19867,7 +19869,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
+@@ -20138,7 +20140,7 @@ static const struct mips_cpu_info mips_c
    /* Broadcom XLP.
       XLP is mostly like XLR, with the prominent exception that it is
       MIPS64R2 rather than MIPS64.  */
 -  { "xlp",	      0, 0,			ISA_MIPS64R2, CPU_XLR },
 +  { "xlp",	      0, 0,			ISA_MIPS64R2, CPU_XLP },
  
-   /* MIPS 64 Release 6 */
-   { "i6400",	      0, ASE_MSA,		ISA_MIPS64R6, CPU_MIPS64R6},
-diff --git a/gas/configure b/gas/configure
-index a82fde7fa8..afc77c347a 100755
+   /* MIPS 64 Release 6.  */
+   { "i6400",	      0, ASE_VIRT | ASE_MSA,	ISA_MIPS64R6, CPU_MIPS64R6},
 --- a/gas/configure
 +++ b/gas/configure
-@@ -13364,6 +13364,9 @@ _ACEOF
+@@ -13377,6 +13377,9 @@ _ACEOF
  	  mipsisa64r6 | mipsisa64r6el)
  	    mips_cpu=mips64r6
  	    ;;
@@ -197,8 +179,6 @@ index a82fde7fa8..afc77c347a 100755
  	  mipstx39 | mipstx39el)
  	    mips_cpu=r3900
  	    ;;
-diff --git a/include/elf/mips.h b/include/elf/mips.h
-index b76d450ae2..7cddb365ad 100644
 --- a/include/elf/mips.h
 +++ b/include/elf/mips.h
 @@ -290,6 +290,7 @@ END_RELOC_NUMBERS (R_MIPS_maxext)
@@ -209,11 +189,9 @@ index b76d450ae2..7cddb365ad 100644
  #define E_MIPS_MACH_OCTEON2	0x008d0000
  #define E_MIPS_MACH_OCTEON3	0x008e0000
  #define E_MIPS_MACH_5400	0x00910000
-diff --git a/include/opcode/mips.h b/include/opcode/mips.h
-index abd52c8980..53b6752a1c 100644
 --- a/include/opcode/mips.h
 +++ b/include/opcode/mips.h
-@@ -1260,6 +1260,8 @@ static const unsigned int mips_isa_table[] = {
+@@ -1260,6 +1260,8 @@ static const unsigned int mips_isa_table
  #define INSN_XLR                 0x00000020
  /* Imagination interAptiv MR2.  */
  #define INSN_INTERAPTIV_MR2	  0x04000000
@@ -222,7 +200,7 @@ index abd52c8980..53b6752a1c 100644
  
  /* DSP ASE */
  #define ASE_DSP			0x00000001
-@@ -1381,6 +1383,7 @@ static const unsigned int mips_isa_table[] = {
+@@ -1384,6 +1386,7 @@ static const unsigned int mips_isa_table
  #define CPU_OCTEON3	6503
  #define CPU_XLR     	887682   	/* decimal 'XLR'   */
  #define CPU_INTERAPTIV_MR2 736550	/* decimal 'IA2'  */
@@ -230,7 +208,7 @@ index abd52c8980..53b6752a1c 100644
  
  /* Return true if the given CPU is included in INSN_* mask MASK.  */
  
-@@ -1458,6 +1461,9 @@ cpu_is_member (int cpu, unsigned int mask)
+@@ -1461,6 +1464,9 @@ cpu_is_member (int cpu, unsigned int mas
        return ((mask & INSN_ISA_MASK) == INSN_ISA32R6)
  	     || ((mask & INSN_ISA_MASK) == INSN_ISA64R6);
  
@@ -240,11 +218,9 @@ index abd52c8980..53b6752a1c 100644
      default:
        return FALSE;
      }
-diff --git a/ld/configure.tgt b/ld/configure.tgt
-index 917be6f8eb..347df6c3f6 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -454,6 +454,8 @@ mips*el-sde-elf* | mips*el-mti-elf* | mips*el-img-elf*)
+@@ -454,6 +454,8 @@ mips*el-sde-elf* | mips*el-mti-elf* | mi
  mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
  			targ_emul=elf32btsmip
  			targ_extra_emuls="elf32ltsmip elf32btsmipn32 elf64btsmip elf32ltsmipn32 elf64ltsmip" ;;
@@ -253,11 +229,9 @@ index 917be6f8eb..347df6c3f6 100644
  mips64*el-ps2-elf*)	targ_emul=elf32lr5900n32
  			targ_extra_emuls="elf32lr5900"
  			targ_extra_libpath=$targ_extra_emuls ;;
-diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c
-index 0dd85e3779..1ea708dde7 100644
 --- a/opcodes/mips-dis.c
 +++ b/opcodes/mips-dis.c
-@@ -673,13 +673,11 @@ const struct mips_arch_choice mips_arch_choices[] =
+@@ -673,13 +673,11 @@ const struct mips_arch_choice mips_arch_
      mips_cp0sel_names_xlr, ARRAY_SIZE (mips_cp0sel_names_xlr),
      mips_cp1_names_mips3264, mips_hwr_names_numeric },
  
@@ -276,8 +250,6 @@ index 0dd85e3779..1ea708dde7 100644
  
    /* This entry, mips16, is here only for ISA/processor selection; do
       not print its name.  */
-diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c
-index 837da6bd99..d3ea5b8877 100644
 --- a/opcodes/mips-opc.c
 +++ b/opcodes/mips-opc.c
 @@ -328,6 +328,7 @@ decode_mips_operand (const char *p)
@@ -288,7 +260,7 @@ index 837da6bd99..d3ea5b8877 100644
  #define IVIRT	ASE_VIRT
  #define IVIRT64	ASE_VIRT64
  
-@@ -989,6 +990,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -990,6 +991,7 @@ const struct mips_opcode mips_builtin_op
  {"clo",			"U,s",		0x70000021, 0xfc0007ff, WR_1|RD_2,		0,		I32|N55,	0,	I37 },
  {"clz",			"d,s",		0x00000050, 0xfc1f07ff, WR_1|RD_2,		0,		I37,		0,	0 },
  {"clz",			"U,s",		0x70000020, 0xfc0007ff, WR_1|RD_2,		0,		I32|N55,	0,	I37 },
@@ -296,7 +268,7 @@ index 837da6bd99..d3ea5b8877 100644
  /* ctc0 is at the bottom of the table.  */
  {"ctc1",		"t,G",		0x44c00000, 0xffe007ff,	RD_1|WR_CC|CM,		0,		I1,		0,	0 },
  {"ctc1",		"t,S",		0x44c00000, 0xffe007ff,	RD_1|WR_CC|CM,		0,		I1,		0,	0 },
-@@ -1021,12 +1023,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1022,12 +1024,13 @@ const struct mips_opcode mips_builtin_op
  {"daddiu",		"t,r,j",	0x64000000, 0xfc000000, WR_1|RD_2,		0,		I3,		0,	0 },
  {"daddu",		"d,v,t",	0x0000002d, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I3,		0,	0 },
  {"daddu",		"t,r,I",	0,    (int) M_DADDU_I,	INSN_MACRO,		0,		I3,		0,	0 },
@@ -311,7 +283,7 @@ index 837da6bd99..d3ea5b8877 100644
  /* dctr and dctw are used on the r5000.  */
  {"dctr",		"o(b)",	 	0xbc050000, 0xfc1f0000, RD_2,			0,		I3,		0,	0 },
  {"dctw",		"o(b)",		0xbc090000, 0xfc1f0000, RD_2,			0,		I3,		0,	0 },
-@@ -1098,6 +1101,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1099,6 +1102,7 @@ const struct mips_opcode mips_builtin_op
  {"dmfc0",		"t,G,H",	0x40200000, 0xffe007f8,	WR_1|RD_C0|LC,		0,		I64,		0,	0 },
  {"dmfgc0",		"t,G",		0x40600100, 0xffe007ff, WR_1|RD_C0|LC,		0,		0,		IVIRT64, 0 },
  {"dmfgc0",		"t,G,H",	0x40600100, 0xffe007f8, WR_1|RD_C0|LC,		0,		0,		IVIRT64, 0 },
@@ -319,7 +291,7 @@ index 837da6bd99..d3ea5b8877 100644
  {"dmt",			"",		0x41600bc1, 0xffffffff, TRAP,			0,		0,		MT32,	0 },
  {"dmt",			"t",		0x41600bc1, 0xffe0ffff, WR_1|TRAP,		0,		0,		MT32,	0 },
  {"dmtc0",		"t,G",		0x40a00000, 0xffe007ff,	RD_1|WR_C0|WR_CC|CM,	0,		I3,		0,	EE },
-@@ -1113,6 +1117,8 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1114,6 +1118,8 @@ const struct mips_opcode mips_builtin_op
  /* dmfc3 is at the bottom of the table.  */
  /* dmtc3 is at the bottom of the table.  */
  {"dmuh",		"d,s,t",	0x000000dc, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I69,		0,	0 },
@@ -328,7 +300,7 @@ index 837da6bd99..d3ea5b8877 100644
  {"dmul",		"d,s,t",	0x0000009c, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I69,		0,	0 },
  {"dmul",		"d,v,t",	0x70000003, 0xfc0007ff, WR_1|RD_2|RD_3|WR_HILO,	0,		IOCT,		0,	0 },
  {"dmul",		"d,v,t",	0,    (int) M_DMUL,	INSN_MACRO,		0,		I3,		0,	M32|I69 },
-@@ -1266,9 +1272,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1267,9 +1273,9 @@ const struct mips_opcode mips_builtin_op
  {"ld",			"s,-b(+R)",	0xec180000, 0xfc1c0000, WR_1,			RD_pc,		I69,		0,	0 },
  {"ld",			"t,A(b)",	0,    (int) M_LD_AB,	INSN_MACRO,		0,		I1,		0,	0 },
  {"ld",			"t,o(b)",	0xdc000000, 0xfc000000, WR_1|RD_3|LM,		0,		I3,		0,	0 },
@@ -341,7 +313,7 @@ index 837da6bd99..d3ea5b8877 100644
  {"ldc1",		"T,o(b)",	0xd4000000, 0xfc000000, WR_1|RD_3|CLD|FP_D,	0,		I2,		0,	SF },
  {"ldc1",		"E,o(b)",	0xd4000000, 0xfc000000, WR_1|RD_3|CLD|FP_D,	0,		I2,		0,	SF },
  {"ldc1",		"T,A(b)",	0,    (int) M_LDC1_AB,	INSN_MACRO,		INSN2_M_FP_D,	I2,		0,	SF },
-@@ -1433,7 +1439,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1438,7 +1444,7 @@ const struct mips_opcode mips_builtin_op
  {"mflo",		"d,9",		0x00000012, 0xff9f07ff, WR_1|RD_LO,		0,		0,		D32,	0 },
  {"mflo1",		"d",		0x70000012, 0xffff07ff,	WR_1|RD_LO,		0,		EE,		0,	0 },
  {"mflhxu",		"d",		0x00000052, 0xffff07ff,	WR_1|MOD_HILO,		0,		0,		SMT,	0 },
@@ -350,7 +322,7 @@ index 837da6bd99..d3ea5b8877 100644
  {"mfsa",		"d",		0x00000028, 0xffff07ff,	WR_1,			0,		EE,		0,	0 },
  {"min.ob",		"X,Y,Q",	0x78000006, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		SB1,		MX,	0 },
  {"min.ob",		"D,S,Q",	0x48000006, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		N54,		0,	0 },
-@@ -1478,10 +1484,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1483,10 +1489,13 @@ const struct mips_opcode mips_builtin_op
  /* move is at the top of the table.  */
  {"msgn.qh",		"X,Y,Q",	0x78200000, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		0,		MX,	0 },
  {"msgsnd",		"t",		0,    (int) M_MSGSND,	INSN_MACRO,		0,		XLR,		0,	0 },
@@ -366,7 +338,7 @@ index 837da6bd99..d3ea5b8877 100644
  {"msub.d",		"D,R,S,T",	0x4c000029, 0xfc00003f, WR_1|RD_2|RD_3|RD_4|FP_D, 0,		I4_33,		0,	I37 },
  {"msub.d",		"D,S,T",	0x46200019, 0xffe0003f,	WR_1|RD_2|RD_3|FP_D,	0,		IL2E,		0,	0 },
  {"msub.d",		"D,S,T",	0x72200019, 0xffe0003f,	WR_1|RD_2|RD_3|FP_D,	0,		IL2F,		0,	0 },
-@@ -1531,7 +1540,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1536,7 +1545,7 @@ const struct mips_opcode mips_builtin_op
  {"mtlo",		"s,7",		0x00000013, 0xfc1fe7ff, RD_1|WR_LO,		0,		0,		D32,	0 },
  {"mtlo1",		"s",		0x70000013, 0xfc1fffff,	RD_1|WR_LO,		0,		EE,		0,	0 },
  {"mtlhx",		"s",		0x00000053, 0xfc1fffff,	RD_1|MOD_HILO,		0,		0,		SMT,	0 },
@@ -375,7 +347,7 @@ index 837da6bd99..d3ea5b8877 100644
  {"mtm0",		"s",		0x70000008, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
  {"mtm0",    		"s,t",		0x70000008, 0xfc00ffff, RD_1|RD_2,		0,		IOCT3,		0,	0 },
  {"mtm1",		"s",		0x7000000c, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
-@@ -1968,9 +1977,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1978,9 +1987,9 @@ const struct mips_opcode mips_builtin_op
  {"suxc1",		"S,t(b)",	0x4c00000d, 0xfc0007ff, RD_1|RD_2|RD_3|SM|FP_D,	0,		I5_33|N55,	0,	I37},
  {"sw",			"t,o(b)",	0xac000000, 0xfc000000,	RD_1|RD_3|SM,		0,		I1,		0,	0 },
  {"sw",			"t,A(b)",	0,    (int) M_SW_AB,	INSN_MACRO,		0,		I1,		0,	0 },
@@ -388,6 +360,3 @@ index 837da6bd99..d3ea5b8877 100644
  {"swc0",		"E,o(b)",	0xe0000000, 0xfc000000,	RD_3|RD_C0|SM,		0,		I1,		0,	IOCT|IOCTP|IOCT2|I37 },
  {"swc0",		"E,A(b)",	0,    (int) M_SWC0_AB,	INSN_MACRO,		0,		I1,		0,	IOCT|IOCTP|IOCT2|I37 },
  {"swc1",		"T,o(b)",	0xe4000000, 0xfc000000,	RD_1|RD_3|SM|FP_S,	0,		I1,		0,	0 },
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0012-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0012-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
index 6a3b78f227..f686763594 100644
--- a/meta/recipes-devtools/binutils/binutils/0012-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
+++ b/meta/recipes-devtools/binutils/binutils/0012-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
@@ -1,7 +1,7 @@
-From e48767a0298e6ccf53d83fecc93bb6d26b595897 Mon Sep 17 00:00:00 2001
+From f34aac4314b821396fe745013dc8ec8683ea2598 Mon Sep 17 00:00:00 2001
 From: Zhenhua Luo <zhenhua.luo@nxp.com>
 Date: Sat, 11 Jun 2016 22:08:29 -0500
-Subject: [PATCH 12/15] fix the incorrect assembling for ppc wait mnemonic
+Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
 
 Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
 
@@ -11,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
-index 3032631d4e..142f096ef4 100644
+index b56fe3e21a..696fe83a7b 100644
 --- a/opcodes/ppc-opc.c
 +++ b/opcodes/ppc-opc.c
-@@ -5325,7 +5325,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+@@ -5709,7 +5709,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
  {"ldepx",	X(31,29),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
  
  {"waitasec",	X(31,30),      XRTRARB_MASK, POWER8,	POWER9,		{0}},
@@ -22,7 +22,7 @@ index 3032631d4e..142f096ef4 100644
  
  {"lwepx",	X(31,31),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
  
-@@ -5379,7 +5378,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+@@ -5763,7 +5762,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
  
  {"waitrsv",	X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
  {"waitimpl",	X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
@@ -31,6 +31,3 @@ index 3032631d4e..142f096ef4 100644
  
  {"dcbstep",	XRT(31,63,0),	XRT_MASK,    E500MC|PPCA2, 0,		{RA0, RB}},
  
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0013-Detect-64-bit-MIPS-targets.patch b/meta/recipes-devtools/binutils/binutils/0013-Detect-64-bit-MIPS-targets.patch
index d929179de2..493b05026d 100644
--- a/meta/recipes-devtools/binutils/binutils/0013-Detect-64-bit-MIPS-targets.patch
+++ b/meta/recipes-devtools/binutils/binutils/0013-Detect-64-bit-MIPS-targets.patch
@@ -1,7 +1,7 @@
-From 6587e7b8e7730dda20d8c47cabe9f7f8397efa3c Mon Sep 17 00:00:00 2001
+From ebb74c39acb171fd24c2698646134ce88dd96a15 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 31 Mar 2017 11:42:03 -0700
-Subject: [PATCH 13/15] Detect 64-bit MIPS targets
+Subject: [PATCH] Detect 64-bit MIPS targets
 
 Add mips64 target triplets and default to N64
 
@@ -45,6 +45,3 @@ index 3e066edaa8..caf130ceda 100644
  mips*-*-*)
   targ_obj=mips
   targ_machine=EM_MIPS
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0014-sync-with-OE-libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0014-sync-with-OE-libtool-changes.patch
index 65ba10a553..ae5915d39b 100644
--- a/meta/recipes-devtools/binutils/binutils/0014-sync-with-OE-libtool-changes.patch
+++ b/meta/recipes-devtools/binutils/binutils/0014-sync-with-OE-libtool-changes.patch
@@ -1,7 +1,7 @@
-From b7729343206fa196b9a11747a92b3cf563277056 Mon Sep 17 00:00:00 2001
+From 6bc49e9a581eb46265935ea2756a99faa7d0562e Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Mar 2017 23:33:27 -0800
-Subject: [PATCH 14/15] sync with OE libtool changes
+Subject: [PATCH] sync with OE libtool changes
 
 Apply these patches from our libtool patches as not only are redundant RPATHs a
 waste of space but they can cause incorrect linking when native packages are
@@ -84,6 +84,3 @@ index 11ee684ccc..3b19ac1532 100644
  	  fi
  	elif test -n "$runpath_var"; then
  	  case "$finalize_perm_rpath " in
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0015-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch b/meta/recipes-devtools/binutils/binutils/0015-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch
index bfde561dee..d25ce61626 100644
--- a/meta/recipes-devtools/binutils/binutils/0015-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch
+++ b/meta/recipes-devtools/binutils/binutils/0015-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch
@@ -1,8 +1,8 @@
-From d5d783903e335302e562bac8da1a083338d75b25 Mon Sep 17 00:00:00 2001
+From a326a8feb445a5713ff3d17c55f43d5681e26585 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 29 Nov 2018 17:46:40 -0800
-Subject: [PATCH 15/15] binutils : enable x86_64-pep for producing EFI binaries
- on x86-64
+Subject: [PATCH] binutils : enable x86_64-pep for producing EFI binaries on
+ x86-64
 
 Add x86_64-pep emulation support to the set enabled for x86_64 targets
 to enable the linker to produce Portable Executables for EFI binaries.
@@ -19,8 +19,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ld/configure.tgt | 5 +++--
  2 files changed, 4 insertions(+), 3 deletions(-)
 
-diff --git a/bfd/config.bfd b/bfd/config.bfd
-index 3614ff79d4..aef144803a 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
 @@ -694,7 +694,7 @@ case "${targ}" in
@@ -32,11 +30,9 @@ index 3614ff79d4..aef144803a 100644
      want64=true
      ;;
    x86_64-*-nacl*)
-diff --git a/ld/configure.tgt b/ld/configure.tgt
-index 347df6c3f6..1e37d747a9 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -257,8 +257,9 @@ x86_64-*-linux-gnux32)	targ_emul=elf32_x86_64
+@@ -258,8 +258,9 @@ x86_64-*-linux-gnux32)	targ_emul=elf32_x
  			tdir_elf_iamcu=`echo ${targ_alias} | sed -e 's/x86_64/i386/' -e 's/-linux-gnux32/-linux-gnu/'`
  			tdir_elf_i386=`echo ${targ_alias} | sed -e 's/x86_64/i386/' -e 's/-linux-gnux32/-linux-gnu/'` ;;
  x86_64-*-linux-*)	targ_emul=elf_x86_64
@@ -48,6 +44,3 @@ index 347df6c3f6..1e37d747a9 100644
  			tdir_elf_i386=`echo ${targ_alias} | sed -e 's/x86_64/i386/'` ;;
  i[3-7]86-*-redox*)	targ_emul=elf_i386
  			targ_extra_emuls=elf_x86_64 ;;
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch
deleted file mode 100644
index 07d1d65467..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 30bcc01478433a1cb05b36dc5c4beef7d2c89b5b Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Fri, 21 Jun 2019 11:51:38 +0930
-Subject: [PATCH] PR24689, string table corruption
-
-The testcase in the PR had a e_shstrndx section of type SHT_GROUP.
-hdr->contents were initialized by setup_group rather than being read
-from the file, thus last byte was not zero and string dereference ran
-off the end of the buffer.
-
-	PR 24689
-	* elfcode.h (elf_object_p): Check type of e_shstrndx section.
-
-Upstream-Status: Backport
-CVE: CVE-2019-12972
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- bfd/ChangeLog | 5 +++++
- bfd/elfcode.h | 3 ++-
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/bfd/ChangeLog b/bfd/ChangeLog
-index 91f09e6346..e66fb40a2c 100644
---- a/bfd/ChangeLog
-+++ b/bfd/ChangeLog
-@@ -1,3 +1,8 @@
-+2019-06-21  Alan Modra  <amodra@gmail.com>
-+
-+	PR 24689
-+	* elfcode.h (elf_object_p): Check type of e_shstrndx section.
-+
- 2019-02-20  Alan Modra  <amodra@gmail.com>
- 
- 	PR 24236
-diff --git a/bfd/elfcode.h b/bfd/elfcode.h
-index ec5ea766de..a35a629087 100644
---- a/bfd/elfcode.h
-+++ b/bfd/elfcode.h
-@@ -755,7 +755,8 @@ elf_object_p (bfd *abfd)
-   /* A further sanity check.  */
-   if (i_ehdrp->e_shnum != 0)
-     {
--      if (i_ehdrp->e_shstrndx >= elf_numsections (abfd))
-+      if (i_ehdrp->e_shstrndx >= elf_numsections (abfd)
-+	  || i_shdrp[i_ehdrp->e_shstrndx].sh_type != SHT_STRTAB)
- 	{
- 	  /* PR 2257:
- 	     We used to just goto got_wrong_format_error here
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-14250.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-14250.patch
deleted file mode 100644
index c915a832b0..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2019-14250.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From df78be05daf4eb07f60f50ec1080cb979af32ec0 Mon Sep 17 00:00:00 2001
-From: marxin <marxin@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Tue, 23 Jul 2019 07:33:32 +0000
-Subject: [PATCH] libiberty: Check zero value shstrndx in simple-object-elf.c
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@273718 138bc75d-0d04-0410-961f-82ee72b054a4
-
-CVE: CVE-2019-14250
-Upstream-Status: Backport [from gcc: https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=273718]
-[Removed Changelog entry]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
-diff --git a/libiberty/simple-object-elf.c b/libiberty/simple-object-elf.c
-index 502388991a08..bdee963634d6 100644
---- a/libiberty/simple-object-elf.c
-+++ b/libiberty/simple-object-elf.c
-@@ -548,7 +548,15 @@ simple_object_elf_match (unsigned char header[SIMPLE_OBJECT_MATCH_HEADER_LEN],
-       XDELETE (eor);
-       return NULL;
-     }
--
-+  
-+  if (eor->shstrndx == 0)
-+    {
-+      *errmsg = "invalid ELF shstrndx == 0";
-+      *err = 0;
-+      XDELETE (eor);
-+      return NULL;
-+    }
-+  
-   return (void *) eor;
- }
- 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch
deleted file mode 100644
index 85b9a9f916..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e17869db99195849826eaaf5d2d0eb2cfdd7a2a7 Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Mon, 5 Aug 2019 10:40:35 +0100
-Subject: [PATCH] Catch potential integer overflow in readelf when processing
- corrupt binaries.
-
-	PR 24829
-	* readelf.c (apply_relocations): Catch potential integer overflow
-	whilst checking reloc location against section size.
-
-CVE: CVE-2019-14444
-Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=e17869db99195849826eaaf5d2d0eb2cfdd7a2a7]
-[Removed Changelog entry]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
-diff --git a/binutils/readelf.c b/binutils/readelf.c
-index b896ad9f406..e785fde43e7 100644
---- a/binutils/readelf.c
-+++ b/binutils/readelf.c
-@@ -13366,7 +13366,7 @@ apply_relocations (Filedata *                 filedata,
- 	    }
- 
- 	  rloc = start + rp->r_offset;
--	  if ((rloc + reloc_size) > end || (rloc < start))
-+	  if (rloc >= end || (rloc + reloc_size) > end || (rloc < start))
- 	    {
- 	      warn (_("skipping invalid relocation offset 0x%lx in section %s\n"),
- 		    (unsigned long) rp->r_offset,
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
index a6ce0b9a8a..ce5b9f392d 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
@@ -20,12 +20,10 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  bfd/dwarf2.c | 35 +++++++++++++++++------------------
  1 file changed, 17 insertions(+), 18 deletions(-)
 
-diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
-index 0b4e485582..20ec9e2e56 100644
 --- a/bfd/dwarf2.c
 +++ b/bfd/dwarf2.c
-@@ -2803,13 +2803,13 @@ lookup_symbol_in_variable_table (struct comp_unit *unit,
- }
+@@ -2812,13 +2812,13 @@ static bfd_boolean comp_unit_maybe_decod
+ 						     struct dwarf2_debug *);
  
  static bfd_boolean
 -find_abstract_instance (struct comp_unit *   unit,
@@ -45,7 +43,7 @@ index 0b4e485582..20ec9e2e56 100644
  {
    bfd *abfd = unit->abfd;
    bfd_byte *info_ptr;
-@@ -2820,6 +2820,14 @@ find_abstract_instance (struct comp_unit *   unit,
+@@ -2829,6 +2829,14 @@ find_abstract_instance (struct comp_unit
    struct attribute attr;
    const char *name = NULL;
  
@@ -60,7 +58,7 @@ index 0b4e485582..20ec9e2e56 100644
    /* DW_FORM_ref_addr can reference an entry in a different CU. It
       is an offset from the .debug_info section, not the current CU.  */
    if (attr_ptr->form == DW_FORM_ref_addr)
-@@ -2939,15 +2947,6 @@ find_abstract_instance (struct comp_unit *   unit,
+@@ -2962,15 +2970,6 @@ find_abstract_instance (struct comp_unit
  					 info_ptr, info_ptr_end);
  	      if (info_ptr == NULL)
  		break;
@@ -76,7 +74,7 @@ index 0b4e485582..20ec9e2e56 100644
  	      switch (attr.name)
  		{
  		case DW_AT_name:
-@@ -2961,7 +2960,7 @@ find_abstract_instance (struct comp_unit *   unit,
+@@ -2984,7 +2983,7 @@ find_abstract_instance (struct comp_unit
  		    }
  		  break;
  		case DW_AT_specification:
@@ -85,7 +83,7 @@ index 0b4e485582..20ec9e2e56 100644
  					       &name, is_linkage,
  					       filename_ptr, linenumber_ptr))
  		    return FALSE;
-@@ -3175,7 +3174,7 @@ scan_unit_for_symbols (struct comp_unit *unit)
+@@ -3200,7 +3199,7 @@ scan_unit_for_symbols (struct comp_unit
  
  		case DW_AT_abstract_origin:
  		case DW_AT_specification:
@@ -94,6 +92,3 @@ index 0b4e485582..20ec9e2e56 100644
  					       &func->name,
  					       &func->is_linkage,
  					       &func->file,
--- 
-2.23.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch
index b36a532668..1fe05d310e 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch
@@ -24,11 +24,9 @@ section of course overflows the buffer and tramples on other memory.
  bfd/dwarf2.c | 11 ++++++++++-
  1 file changed, 10 insertions(+), 1 deletion(-)
 
-diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
-index 0b4e485582..a91597b1d0 100644
 --- a/bfd/dwarf2.c
 +++ b/bfd/dwarf2.c
-@@ -4426,7 +4426,16 @@ _bfd_dwarf2_slurp_debug_info (bfd *abfd, bfd *debug_bfd,
+@@ -4439,7 +4439,16 @@ _bfd_dwarf2_slurp_debug_info (bfd *abfd,
        for (total_size = 0;
  	   msec;
  	   msec = find_debug_info (debug_bfd, debug_sections, msec))
@@ -46,6 +44,3 @@ index 0b4e485582..a91597b1d0 100644
  
        stash->info_ptr_memory = (bfd_byte *) bfd_malloc (total_size);
        if (stash->info_ptr_memory == NULL)
--- 
-2.23.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
deleted file mode 100644
index f02539942f..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
+++ /dev/null
@@ -1,165 +0,0 @@
-From c1202057eb9161a86af27d867703235fee7b7555 Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Wed, 10 Apr 2019 15:49:36 +0100
-Subject: [PATCH] Pull in patch for libiberty that fixes a stack exhaustion bug
- when demangling a pathalogically constructed mangled name.
-
-	PR 89394
-	* cp-demangle.c (cplus_demangle_fill_name): Reject negative
-	lengths.
-	(d_count_templates_scopes): Replace num_templates and num_scopes
-	parameters with a struct d_print_info pointer parameter.  Adjust
-	body of the function accordingly.  Add recursion counter and check
-	that the recursion limit is not reached.
-	(d_print_init): Pass dpi parameter to d_count_templates_scopes.
-	Reset recursion counter afterwards, unless the recursion limit was
-	reached.
-
-CVE: CVE-2019-9071
-CVE: CVE-2019-9070
-Upstream-Status: Backport
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- ChangeLog               | 16 ++++++++++++++
- libiberty/cp-demangle.c | 48 ++++++++++++++++++++++-------------------
- 2 files changed, 42 insertions(+), 22 deletions(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index cd631a15b6..4df3aaa62c 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,19 @@
-+2019-04-10  Nick Clifton  <nickc@redhat.com>
-+
-+	* libiberty: Sync with gcc.  Bring in:
-+	2019-04-10  Nick Clifton  <nickc@redhat.com>
-+
-+	PR 89394
-+	* cp-demangle.c (cplus_demangle_fill_name): Reject negative
-+	lengths.
-+	(d_count_templates_scopes): Replace num_templates and num_scopes
-+	parameters with a struct d_print_info pointer parameter.  Adjust
-+	body of the function accordingly.  Add recursion counter and check
-+	that the recursion limit is not reached.
-+	(d_print_init): Pass dpi parameter to d_count_templates_scopes.
-+	Reset recursion counter afterwards, unless the recursion limit was
-+	reached.
-+
- 2018-06-24  Nick Clifton  <nickc@redhat.com>
- 
- 	2.32 branch created.
-diff --git a/libiberty/cp-demangle.c b/libiberty/cp-demangle.c
-index b34b485692..779b4e763a 100644
---- a/libiberty/cp-demangle.c
-+++ b/libiberty/cp-demangle.c
-@@ -861,7 +861,7 @@ CP_STATIC_IF_GLIBCPP_V3
- int
- cplus_demangle_fill_name (struct demangle_component *p, const char *s, int len)
- {
--  if (p == NULL || s == NULL || len == 0)
-+  if (p == NULL || s == NULL || len <= 0)
-     return 0;
-   p->d_printing = 0;
-   p->type = DEMANGLE_COMPONENT_NAME;
-@@ -4061,7 +4061,7 @@ d_growable_string_callback_adapter (const char *s, size_t l, void *opaque)
-    are larger than the actual numbers encountered.  */
- 
- static void
--d_count_templates_scopes (int *num_templates, int *num_scopes,
-+d_count_templates_scopes (struct d_print_info *dpi,
- 			  const struct demangle_component *dc)
- {
-   if (dc == NULL)
-@@ -4081,13 +4081,13 @@ d_count_templates_scopes (int *num_templates, int *num_scopes,
-       break;
- 
-     case DEMANGLE_COMPONENT_TEMPLATE:
--      (*num_templates)++;
-+      dpi->num_copy_templates++;
-       goto recurse_left_right;
- 
-     case DEMANGLE_COMPONENT_REFERENCE:
-     case DEMANGLE_COMPONENT_RVALUE_REFERENCE:
-       if (d_left (dc)->type == DEMANGLE_COMPONENT_TEMPLATE_PARAM)
--	(*num_scopes)++;
-+	dpi->num_saved_scopes++;
-       goto recurse_left_right;
- 
-     case DEMANGLE_COMPONENT_QUAL_NAME:
-@@ -4152,42 +4152,42 @@ d_count_templates_scopes (int *num_templates, int *num_scopes,
-     case DEMANGLE_COMPONENT_TAGGED_NAME:
-     case DEMANGLE_COMPONENT_CLONE:
-     recurse_left_right:
--      d_count_templates_scopes (num_templates, num_scopes,
--				d_left (dc));
--      d_count_templates_scopes (num_templates, num_scopes,
--				d_right (dc));
-+      /* PR 89394 - Check for too much recursion.  */
-+      if (dpi->recursion > DEMANGLE_RECURSION_LIMIT)
-+	/* FIXME: There ought to be a way to report to the
-+	   user that the recursion limit has been reached.  */
-+	return;
-+
-+      ++ dpi->recursion;
-+      d_count_templates_scopes (dpi, d_left (dc));
-+      d_count_templates_scopes (dpi, d_right (dc));
-+      -- dpi->recursion;
-       break;
- 
-     case DEMANGLE_COMPONENT_CTOR:
--      d_count_templates_scopes (num_templates, num_scopes,
--				dc->u.s_ctor.name);
-+      d_count_templates_scopes (dpi, dc->u.s_ctor.name);
-       break;
- 
-     case DEMANGLE_COMPONENT_DTOR:
--      d_count_templates_scopes (num_templates, num_scopes,
--				dc->u.s_dtor.name);
-+      d_count_templates_scopes (dpi, dc->u.s_dtor.name);
-       break;
- 
-     case DEMANGLE_COMPONENT_EXTENDED_OPERATOR:
--      d_count_templates_scopes (num_templates, num_scopes,
--				dc->u.s_extended_operator.name);
-+      d_count_templates_scopes (dpi, dc->u.s_extended_operator.name);
-       break;
- 
-     case DEMANGLE_COMPONENT_FIXED_TYPE:
--      d_count_templates_scopes (num_templates, num_scopes,
--                                dc->u.s_fixed.length);
-+      d_count_templates_scopes (dpi, dc->u.s_fixed.length);
-       break;
- 
-     case DEMANGLE_COMPONENT_GLOBAL_CONSTRUCTORS:
-     case DEMANGLE_COMPONENT_GLOBAL_DESTRUCTORS:
--      d_count_templates_scopes (num_templates, num_scopes,
--				d_left (dc));
-+      d_count_templates_scopes (dpi, d_left (dc));
-       break;
- 
-     case DEMANGLE_COMPONENT_LAMBDA:
-     case DEMANGLE_COMPONENT_DEFAULT_ARG:
--      d_count_templates_scopes (num_templates, num_scopes,
--				dc->u.s_unary_num.sub);
-+      d_count_templates_scopes (dpi, dc->u.s_unary_num.sub);
-       break;
-     }
- }
-@@ -4222,8 +4222,12 @@ d_print_init (struct d_print_info *dpi, demangle_callbackref callback,
-   dpi->next_copy_template = 0;
-   dpi->num_copy_templates = 0;
- 
--  d_count_templates_scopes (&dpi->num_copy_templates,
--			    &dpi->num_saved_scopes, dc);
-+  d_count_templates_scopes (dpi, dc);
-+  /* If we did not reach the recursion limit, then reset the
-+     current recursion value back to 0, so that we can print
-+     the templates.  */
-+  if (dpi->recursion < DEMANGLE_RECURSION_LIMIT)
-+    dpi->recursion = 0;
-   dpi->num_copy_templates *= dpi->num_saved_scopes;
- 
-   dpi->current_template = NULL;
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9074.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9074.patch
deleted file mode 100644
index a11a51200e..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2019-9074.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From e2ebb3906432dcca2727186ad79415f920730fb2 Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Tue, 19 Feb 2019 22:48:44 +1030
-Subject: [PATCH] PR24235, Read memory violation in pei-x86_64.c
-
-	PR 24235
-	* pei-x86_64.c (pex64_bfd_print_pdata_section): Correct checks
-	attempting to prevent read past end of section.
-
-Upstream-Status: Backport [https://github.com/bminor/binutils-gdb/commit/179f2db0d9c397d7dd8a59907b84208b79f7f48c]
-CVE: CVE-2019-9074
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- bfd/ChangeLog    | 6 ++++++
- bfd/pei-x86_64.c | 9 ++++-----
- 2 files changed, 10 insertions(+), 5 deletions(-)
-
-diff --git a/bfd/ChangeLog b/bfd/ChangeLog
-index dd2c741..cbf30de 100644
---- a/bfd/ChangeLog
-+++ b/bfd/ChangeLog
-@@ -1,3 +1,9 @@
-+2019-02-19  Alan Modra  <amodra@gmail.com>
-+
-+	PR 24235
-+	* pei-x86_64.c (pex64_bfd_print_pdata_section): Correct checks
-+	attempting to prevent read past end of section.
-+
- 2019-02-04  Nick Clifton  <nickc@redhat.com>
- 
- 	* development.sh (experimental) Set to false.
-diff --git a/bfd/pei-x86_64.c b/bfd/pei-x86_64.c
-index ff1093c..7e75104 100644
---- a/bfd/pei-x86_64.c
-+++ b/bfd/pei-x86_64.c
-@@ -541,7 +541,7 @@ pex64_bfd_print_pdata_section (bfd *abfd, void *vfile, asection *pdata_section)
-   /* virt_size might be zero for objects.  */
-   if (stop == 0 && strcmp (abfd->xvec->name, "pe-x86-64") == 0)
-     {
--      stop = (datasize / onaline) * onaline;
-+      stop = datasize;
-       virt_size_is_zero = TRUE;
-     }
-   else if (datasize < stop)
-@@ -551,8 +551,8 @@ pex64_bfd_print_pdata_section (bfd *abfd, void *vfile, asection *pdata_section)
- 		 _("Warning: %s section size (%ld) is smaller than virtual size (%ld)\n"),
- 		 pdata_section->name, (unsigned long) datasize,
- 		 (unsigned long) stop);
--	/* Be sure not to read passed datasize.  */
--	stop = datasize / onaline;
-+	/* Be sure not to read past datasize.  */
-+	stop = datasize;
-       }
- 
-   /* Display functions table.  */
-@@ -724,8 +724,7 @@ pex64_bfd_print_pdata_section (bfd *abfd, void *vfile, asection *pdata_section)
- 	      altent += imagebase;
- 
- 	      if (altent >= pdata_vma
--		  && (altent + PDATA_ROW_SIZE <= pdata_vma
--		      + pei_section_data (abfd, pdata_section)->virt_size))
-+		  && altent - pdata_vma + PDATA_ROW_SIZE <= stop)
- 		{
- 		  pex64_get_runtime_function
- 		    (abfd, &arf, &pdata[altent - pdata_vma]);
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9075.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9075.patch
deleted file mode 100644
index bcb1310f16..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2019-9075.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From 8abac8031ed369a2734b1cdb7df28a39a54b4b49 Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Wed, 20 Feb 2019 08:21:24 +1030
-Subject: [PATCH] PR24236, Heap buffer overflow in
- _bfd_archive_64_bit_slurp_armap
-
-	PR 24236
-	* archive64.c (_bfd_archive_64_bit_slurp_armap): Move code adding
-	sentinel NUL to string buffer nearer to loop where it is used.
-	Don't go past sentinel when scanning strings, and don't write
-	NUL again.
-	* archive.c (do_slurp_coff_armap): Simplify string handling to
-	archive64.c style.
-
-Upstream-Status: Backport [https://github.com/bminor/binutils-gdb/commit/8abac8031ed369a2734b1cdb7df28a39a54b4b49]
-CVE: CVE-2019-9075
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com> 
----
- bfd/ChangeLog   | 10 ++++++++++
- bfd/archive.c   | 17 +++++++----------
- bfd/archive64.c | 10 +++++-----
- 3 files changed, 22 insertions(+), 15 deletions(-)
-
-diff --git a/bfd/ChangeLog b/bfd/ChangeLog
-index 72c87c7..e39bb12 100644
---- a/bfd/ChangeLog
-+++ b/bfd/ChangeLog
-@@ -1,3 +1,13 @@
-+2019-02-20  Alan Modra  <amodra@gmail.com>
-+
-+	PR 24236
-+	* archive64.c (_bfd_archive_64_bit_slurp_armap): Move code adding
-+	sentinel NUL to string buffer nearer to loop where it is used.
-+	Don't go past sentinel when scanning strings, and don't write
-+	NUL again.
-+	* archive.c (do_slurp_coff_armap): Simplify string handling to
-+	archive64.c style.
-+
- 2019-02-19  Alan Modra  <amodra@gmail.com>
- 
- 	PR 24235
-diff --git a/bfd/archive.c b/bfd/archive.c
-index d2d9b72..68a92a3 100644
---- a/bfd/archive.c
-+++ b/bfd/archive.c
-@@ -1012,6 +1012,7 @@ do_slurp_coff_armap (bfd *abfd)
-   int *raw_armap, *rawptr;
-   struct artdata *ardata = bfd_ardata (abfd);
-   char *stringbase;
-+  char *stringend;
-   bfd_size_type stringsize;
-   bfd_size_type parsed_size;
-   carsym *carsyms;
-@@ -1071,22 +1072,18 @@ do_slurp_coff_armap (bfd *abfd)
-     }
- 
-   /* OK, build the carsyms.  */
--  for (i = 0; i < nsymz && stringsize > 0; i++)
-+  stringend = stringbase + stringsize;
-+  *stringend = 0;
-+  for (i = 0; i < nsymz; i++)
-     {
--      bfd_size_type len;
--
-       rawptr = raw_armap + i;
-       carsyms->file_offset = swap ((bfd_byte *) rawptr);
-       carsyms->name = stringbase;
--      /* PR 17512: file: 4a1d50c1.  */
--      len = strnlen (stringbase, stringsize);
--      if (len < stringsize)
--	len ++;
--      stringbase += len;
--      stringsize -= len;
-+      stringbase += strlen (stringbase);
-+      if (stringbase != stringend)
-+	++stringbase;
-       carsyms++;
-     }
--  *stringbase = 0;
- 
-   ardata->symdef_count = nsymz;
-   ardata->first_file_filepos = bfd_tell (abfd);
-diff --git a/bfd/archive64.c b/bfd/archive64.c
-index 312bf82..42f6ed9 100644
---- a/bfd/archive64.c
-+++ b/bfd/archive64.c
-@@ -100,8 +100,6 @@ _bfd_archive_64_bit_slurp_armap (bfd *abfd)
-     return FALSE;
-   carsyms = ardata->symdefs;
-   stringbase = ((char *) ardata->symdefs) + carsym_size;
--  stringbase[stringsize] = 0;
--  stringend = stringbase + stringsize;
- 
-   raw_armap = (bfd_byte *) bfd_alloc (abfd, ptrsize);
-   if (raw_armap == NULL)
-@@ -115,15 +113,17 @@ _bfd_archive_64_bit_slurp_armap (bfd *abfd)
-       goto release_raw_armap;
-     }
- 
-+  stringend = stringbase + stringsize;
-+  *stringend = 0;
-   for (i = 0; i < nsymz; i++)
-     {
-       carsyms->file_offset = bfd_getb64 (raw_armap + i * 8);
-       carsyms->name = stringbase;
--      if (stringbase < stringend)
--	stringbase += strlen (stringbase) + 1;
-+      stringbase += strlen (stringbase);
-+      if (stringbase != stringend)
-+	++stringbase;
-       ++carsyms;
-     }
--  *stringbase = '\0';
- 
-   ardata->symdef_count = nsymz;
-   ardata->first_file_filepos = bfd_tell (abfd);
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9076.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9076.patch
deleted file mode 100644
index ec8cde2503..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2019-9076.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 9f841c583880eb6d0194455c1583a766f853e628 Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Wed, 20 Feb 2019 12:06:31 +1030
-Subject: [PATCH] PR24233, Out of memory
-
-	PR 24233
-	* objdump.c (dump_bfd_private_header): Print warning if
-	bfd_print_private_bfd_data returns false.
-
-Upstream-Status: Backport [https://github.com/bminor/binutils-gdb/commit/7d272a55caebfc26ab2e15d1e9439bac978b9bb7]
-CVE: CVE-2019-9076
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- binutils/ChangeLog | 6 ++++++
- binutils/objdump.c | 4 +++-
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/binutils/ChangeLog b/binutils/ChangeLog
-index f837c37..d5dd7cb 100644
---- a/binutils/ChangeLog
-+++ b/binutils/ChangeLog
-@@ -1,3 +1,9 @@
-+2019-02-20  Alan Modra  <amodra@gmail.com>
-+
-+	PR 24233
-+	* objdump.c (dump_bfd_private_header): Print warning if
-+	bfd_print_private_bfd_data returns false.
-+
- 2019-02-02  Nick Clifton  <nickc@redhat.com>
- 
- 	* configure: Regenerate.
-diff --git a/binutils/objdump.c b/binutils/objdump.c
-index 8725390..7d0c6a4 100644
---- a/binutils/objdump.c
-+++ b/binutils/objdump.c
-@@ -3178,7 +3178,9 @@ dump_bfd_header (bfd *abfd)
- static void
- dump_bfd_private_header (bfd *abfd)
- {
--  bfd_print_private_bfd_data (abfd, stdout);
-+  if (!bfd_print_private_bfd_data (abfd, stdout))
-+    non_fatal (_("warning: private headers incomplete: %s"),
-+	       bfd_errmsg (bfd_get_error ()));
- }
- 
- static void
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9077.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9077.patch
deleted file mode 100644
index 11ecb71b2e..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2019-9077.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f7bbc8890de45df6eda0ddef5dd04f835f54eecf Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Wed, 20 Feb 2019 17:03:47 +0000
-Subject: [PATCH] Fix a illegal memory access fault when parsing a corrupt MIPS
- option section using readelf.
-
-	PR 24243
-	* readelf.c (process_mips_specific): Check for an options section
-	that is too small to even contain a single option.
-
-Upstream-Status: Backport [https://github.com/bminor/binutils-gdb/commit/7fc0c668f2aceb8582d74db1ad2528e2bba8a921]
-CVE: CVE-2019-9077
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- binutils/readelf.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/binutils/readelf.c b/binutils/readelf.c
-index 9df3742..18ab806 100644
---- a/binutils/readelf.c
-+++ b/binutils/readelf.c
-@@ -16179,6 +16179,12 @@ process_mips_specific (Filedata * filedata)
- 	  error (_("No MIPS_OPTIONS header found\n"));
- 	  return FALSE;
- 	}
-+      /* PR 24243  */
-+      if (sect->sh_size < sizeof (* eopt))
-+	{
-+	  error (_("The MIPS options section is too small.\n"));
-+	  return FALSE;
-+	}
- 
-       eopt = (Elf_External_Options *) get_data (NULL, filedata, options_offset, 1,
-                                                 sect->sh_size, _("options"));
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/binutils/binutils_2.32.bb b/meta/recipes-devtools/binutils/binutils_2.33.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils_2.32.bb
rename to meta/recipes-devtools/binutils/binutils_2.33.bb
-- 
2.24.0


