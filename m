Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 360127C254
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 19:59:29 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id d72so387565pga.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 11:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TLW+6Tzy1hGElR4Kkk6HKeEmlBHx3Phkw2pC+R7VCXI=;
	b=dz0h+I2CWrSGGKxxRkWVyQVpK/SgfBZeKZPJrPJVAeroj3aLcP4s5v78YrE6SAgdSE
	by92lzdvT36EnnW0SotgcujwPUNmYPF6u8BXnsvqkMEpec5XJ/KNOq8R4Nx+JAr5oXHw
	K2QVj8UQ6PZLfB9+/H8sag7yVHuPHCiAwis3X+8II6LMdLH+zt9cRRXhM2JXYPp/06dp
	dBPhNXrBPAaCQbo+TVcd24O8b6hHsMoEs3jbfihW7qcikDjIWyB17toVw7W12b86wX9a
	ulzI9fSe6bNcExza1OFGldgom5xah2H+iz4Uc/T3FcyYmfp9lQTiX+DWszwewihssOBn
	K9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TLW+6Tzy1hGElR4Kkk6HKeEmlBHx3Phkw2pC+R7VCXI=;
	b=lvTT3pg5hecKHB2mYdnYBUC3g3KLfA3H8l4bbDyF2h74WawNSiQJNChpKZQY9HItTt
	pgr7vSMWm6saoyFOzPFBdYJ5G7fgXE63kL2vo2CeBp5hpdfAg6ICxjaV/WqalMrLJB+d
	ZBIlN/NJK/dLf19yZjI7BAClTxcZgfeZqgWiNTdEXIZU356wCqHb6fkluheLXMWLVcMo
	vpG8opOkroOep55D2TEhIOO29D/BwUX/trt8/74Xg7mjUw+rMgP+j8HBYAGqKeQutSBH
	+J3AZ3M/M3sQKvQ+b7K7nGg81gUG5WdDI5RWG27/xlne3h6ll6CBoRKYzpqIXifW38PN
	sYDw==
X-Gm-Message-State: AHQUAuZ4p7Q/65YRfHEWR4b7ep2cSwf6SfyFfYaQs6h06Sl9KUxvc1is
	fIK8F3pcjpdRi+iYErLxDAXi/GfT
X-Google-Smtp-Source: AHgI3IbQB+axGMiMLL3CH1FT4kcBHNdaKXlxxKpNjNKYx88K3q8yZv/iV3ymoyWvQYckQfIBzW434Q==
X-Received: by 2002:a63:d34a:: with SMTP id u10mr981633pgi.301.1549310368618; 
	Mon, 04 Feb 2019 11:59:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1609])
	by smtp.gmail.com with ESMTPSA id
	w128sm1307486pfw.79.2019.02.04.11.59.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 11:59:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 11:59:18 -0800
Message-Id: <20190204195918.8726-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190204195918.8726-1-raj.khem@gmail.com>
References: <20190204195918.8726-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH 2/2] binutils: Upgrade to binutils 2.32
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
X-List-Received-Date: Mon, 04 Feb 2019 19:59:29 -0000
Content-Transfer-Encoding: 8bit

Changes
https://sourceware.org/ml/binutils/2019-02/msg00010.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |    2 +-
 .../{binutils-2.31.inc => binutils-2.32.inc}  |   36 +-
 ....31.bb => binutils-cross-canadian_2.32.bb} |    0
 ...s-cross_2.31.bb => binutils-cross_2.32.bb} |    0
 ...ssdk_2.31.bb => binutils-crosssdk_2.32.bb} |    0
 ...s-crosssdk-Generate-relocatable-SDKs.patch |   12 +-
 ...o-not-generate-linker-script-directo.patch |    8 +-
 ...iden-the-regexp-for-SH-architectures.patch |   10 +-
 ...004-Point-scripts-location-to-libdir.patch |    8 +-
 ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |    8 +-
 .../binutils/0006-Use-libtool-2.4.patch       | 1425 ++++++++---------
 ...-the-armv5e-architecture-to-binutils.patch |   35 -
 ...tro-compiler-point-to-the-wrong-ins.patch} |    8 +-
 ...system-directories-when-cross-linki.patch} |   26 +-
 ...-in-libtool-when-sysroot-is-enabled.patch} |    6 +-
 ...-default-emulation-for-mips64-linux.patch} |   14 +-
 ...> 0011-Add-support-for-Netlogic-XLP.patch} |   98 +-
 ...ct-assembling-for-ppc-wait-mnemonic.patch} |   12 +-
 ... => 0013-Detect-64-bit-MIPS-targets.patch} |    8 +-
 ...> 0014-sync-with-OE-libtool-changes.patch} |    6 +-
 ...86_64-pep-for-producing-EFI-binarie.patch} |   26 +-
 ...essed-header-alignment-correctly-by-.patch |  332 ----
 ...nt-of-uncompressed-section-from-ch_a.patch |  200 ---
 .../binutils/binutils/CVE-2018-17358.patch    |  121 --
 .../binutils/binutils/CVE-2018-17360.patch    |   45 -
 .../binutils/binutils/CVE-2018-18309.patch    |  251 ---
 .../binutils/binutils/CVE-2018-18605.patch    |   29 -
 .../binutils/binutils/CVE-2018-18606.patch    |   50 -
 .../binutils/binutils/CVE-2018-18607.patch    |   56 -
 .../binutils/binutils/clang-bfd-fix.patch     |   30 -
 .../{binutils_2.31.bb => binutils_2.32.bb}    |    0
 31 files changed, 858 insertions(+), 2004 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.31.inc => binutils-2.32.inc} (54%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.31.bb => binutils-cross-canadian_2.32.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.31.bb => binutils-cross_2.32.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.31.bb => binutils-crosssdk_2.32.bb} (100%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
 rename meta/recipes-devtools/binutils/binutils/{0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch => 0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch} (85%)
 rename meta/recipes-devtools/binutils/binutils/{0009-warn-for-uses-of-system-directories-when-cross-linki.patch => 0008-warn-for-uses-of-system-directories-when-cross-linki.patch} (94%)
 rename meta/recipes-devtools/binutils/binutils/{0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch => 0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch} (92%)
 rename meta/recipes-devtools/binutils/binutils/{0011-Change-default-emulation-for-mips64-linux.patch => 0010-Change-default-emulation-for-mips64-linux.patch} (88%)
 rename meta/recipes-devtools/binutils/binutils/{0012-Add-support-for-Netlogic-XLP.patch => 0011-Add-support-for-Netlogic-XLP.patch} (86%)
 rename meta/recipes-devtools/binutils/binutils/{0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch => 0012-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch} (76%)
 rename meta/recipes-devtools/binutils/binutils/{0014-Detect-64-bit-MIPS-targets.patch => 0013-Detect-64-bit-MIPS-targets.patch} (86%)
 rename meta/recipes-devtools/binutils/binutils/{0015-sync-with-OE-libtool-changes.patch => 0014-sync-with-OE-libtool-changes.patch} (95%)
 rename meta/recipes-devtools/binutils/binutils/{0016-add-i386pep-emulation-for-x86_64.patch => 0015-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch} (74%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0022-Handle-ELF-compressed-header-alignment-correctly-by-.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0023-gold-Get-alignment-of-uncompressed-section-from-ch_a.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-17358.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-17360.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-18309.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-18605.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-18606.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-18607.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/clang-bfd-fix.patch
 rename meta/recipes-devtools/binutils/{binutils_2.31.bb => binutils_2.32.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index cd6acf3219..5d71825889 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -20,7 +20,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "8.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-BINUVERSION ?= "2.31%"
+BINUVERSION ?= "2.32%"
 GDBVERSION ?= "8.2%"
 GLIBCVERSION ?= "2.29%"
 LINUXLIBCVERSION ?= "4.19%"
diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
similarity index 54%
rename from meta/recipes-devtools/binutils/binutils-2.31.inc
rename to meta/recipes-devtools/binutils/binutils-2.32.inc
index 62acec500e..7423986815 100644
--- a/meta/recipes-devtools/binutils/binutils-2.31.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -14,38 +14,30 @@ def binutils_branch_version(d):
     pvsplit = d.getVar('PV').split('.')
     return pvsplit[0] + "_" + pvsplit[1]
 
+PV = "2.32.0"
 BINUPV = "${@binutils_branch_version(d)}"
-PV .= ".1"
+#BRANCH = "binutils-${BINUPV}-branch"
+BRANCH ?= "binutils-2_32-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "c909e7afdc4710851a53e86ebed8cea3879b26e5"
-BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git"
+SRCREV ?= "b8c1f608db9ef3edd483d21a921d1fbedc71df6f"
+BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${BRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
      file://0003-configure-widen-the-regexp-for-SH-architectures.patch \
      file://0004-Point-scripts-location-to-libdir.patch \
      file://0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0006-Use-libtool-2.4.patch \
-     file://0007-Add-the-armv5e-architecture-to-binutils.patch \
-     file://0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch \
-     file://0009-warn-for-uses-of-system-directories-when-cross-linki.patch \
-     file://0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
-     file://0011-Change-default-emulation-for-mips64-linux.patch \
-     file://0012-Add-support-for-Netlogic-XLP.patch \
-     file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
-     file://0014-Detect-64-bit-MIPS-targets.patch \
-     file://0015-sync-with-OE-libtool-changes.patch \
-     file://0016-add-i386pep-emulation-for-x86_64.patch \
-     file://0022-Handle-ELF-compressed-header-alignment-correctly-by-.patch \
-     file://0023-gold-Get-alignment-of-uncompressed-section-from-ch_a.patch \
-     file://clang-bfd-fix.patch \
-     file://CVE-2018-17358.patch \
-     file://CVE-2018-17360.patch \
-     file://CVE-2018-18309.patch \
-     file://CVE-2018-18605.patch \
-     file://CVE-2018-18606.patch \
-     file://CVE-2018-18607.patch \
+     file://0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch \
+     file://0008-warn-for-uses-of-system-directories-when-cross-linki.patch \
+     file://0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
+     file://0010-Change-default-emulation-for-mips64-linux.patch \
+     file://0011-Add-support-for-Netlogic-XLP.patch \
+     file://0012-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
+     file://0013-Detect-64-bit-MIPS-targets.patch \
+     file://0014-sync-with-OE-libtool-changes.patch \
+     file://0015-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.31.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.32.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.31.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.32.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.31.bb b/meta/recipes-devtools/binutils/binutils-cross_2.32.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.31.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.32.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.31.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.32.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.31.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.32.bb
diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
index 6bdb407b1e..6581bad119 100644
--- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
+++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
@@ -1,4 +1,4 @@
-From 4a99f058030c86794bb96b582a7dbd631f963b06 Mon Sep 17 00:00:00 2001
+From 5bcd884f8af5106d0fa380c42cffe07f3c993ed2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:58:54 +0000
 Subject: [PATCH 01/15] binutils-crosssdk: Generate relocatable SDKs
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index 370b22269d..a5c367aa8f 100755
+index 77ddbbc8f8..d789e77943 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
-@@ -279,6 +279,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
+@@ -310,6 +310,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
  LD_FLAG=r
  DATA_ALIGNMENT=${DATA_ALIGNMENT_r}
  DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
@@ -29,7 +29,7 @@ index 370b22269d..a5c367aa8f 100755
  ( echo "/* Script for ld -r: link without relocation */"
    . ${CUSTOMIZER_SCRIPT}
    . ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
-@@ -287,10 +288,12 @@ DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
+@@ -318,10 +319,12 @@ DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
  LD_FLAG=u
  DATA_ALIGNMENT=${DATA_ALIGNMENT_u}
  CONSTRUCTING=" "
@@ -43,7 +43,7 @@ index 370b22269d..a5c367aa8f 100755
  DATA_ALIGNMENT=${DATA_ALIGNMENT_}
  RELOCATING=" "
 diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
-index 444aef2942..afa99f736d 100644
+index bd7584120e..8bbe052d4b 100644
 --- a/ld/scripttempl/elf.sc
 +++ b/ld/scripttempl/elf.sc
 @@ -139,8 +139,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
@@ -58,5 +58,5 @@ index 444aef2942..afa99f736d 100644
  if test -z "$PLT"; then
    IPLT=".iplt         ${RELOCATING-0} : { *(.iplt) }"
 -- 
-2.18.0
+2.20.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
index 0208213832..32537d4b58 100644
--- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
+++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
@@ -1,4 +1,4 @@
-From 6e78b1c88c040a742b7af82542ac7eb92eddda3d Mon Sep 17 00:00:00 2001
+From 11927913560fc5a5d51af3bc5eb8ad62a86c9840 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Mar 2017 23:37:05 -0800
 Subject: [PATCH 02/15] binutils-cross: Do not generate linker script
@@ -23,10 +23,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 25 deletions(-)
 
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index a5c367aa8f..6cc9eed976 100755
+index d789e77943..144e2e8736 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
-@@ -189,31 +189,6 @@ append_to_lib_path()
+@@ -220,31 +220,6 @@ append_to_lib_path()
    fi
  }
  
@@ -59,5 +59,5 @@ index a5c367aa8f..6cc9eed976 100755
    libs=${NATIVE_LIB_DIRS}
    if [ "x${NATIVE}" = "xyes" ] ; then
 -- 
-2.18.0
+2.20.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch b/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch
index 15193c10a6..a30138295a 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch
@@ -1,4 +1,4 @@
-From 4c6fd8f5eb9bc7c0d02f1a98ad86e395d4d2ab3b Mon Sep 17 00:00:00 2001
+From da3939de6fb36da2c6484f14f08a37be195d9dc3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:07:33 +0000
 Subject: [PATCH 03/15] configure: widen the regexp for SH architectures
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 08dd35c3ea..815e74ddb7 100755
+index 3747645961..78b5240101 100755
 --- a/configure
 +++ b/configure
-@@ -3855,7 +3855,7 @@ case "${target}" in
+@@ -3861,7 +3861,7 @@ case "${target}" in
    nvptx*-*-*)
      noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
      ;;
@@ -27,7 +27,7 @@ index 08dd35c3ea..815e74ddb7 100755
        sh*-*-elf)
           ;;
 diff --git a/gprof/configure b/gprof/configure
-index 447cea7884..a730e20509 100755
+index f84efaba20..ab32bab2b6 100755
 --- a/gprof/configure
 +++ b/gprof/configure
 @@ -6162,6 +6162,11 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
@@ -43,5 +43,5 @@ index 447cea7884..a730e20509 100755
    if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
      lt_cv_deplibs_check_method='match_pattern /lib[^/]+(\.so\.[0-9]+\.[0-9]+|_pic\.a)$'
 -- 
-2.18.0
+2.20.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
index bf1c1be27d..f8e352228f 100644
--- a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
+++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
@@ -1,4 +1,4 @@
-From 48ad5292b10408d4e5d5739022753a7183a1cbb3 Mon Sep 17 00:00:00 2001
+From fc1ff860fd88fa2d0584bd19181c880a76331a8d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:09:58 +0000
 Subject: [PATCH 04/15] Point scripts location to libdir
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index d86ad0940c..c95b0ef025 100644
+index c2c798b4fe..d7faf19271 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
 @@ -57,7 +57,7 @@ endif
@@ -25,7 +25,7 @@ index d86ad0940c..c95b0ef025 100644
  EMUL = @EMUL@
  EMULATION_OFILES = @EMULATION_OFILES@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index 4792b2b013..789df2d01b 100644
+index fc687fc516..8b14f5236c 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
 @@ -563,7 +563,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
@@ -38,5 +38,5 @@ index 4792b2b013..789df2d01b 100644
  BFDDIR = $(BASEDIR)/bfd
  INCDIR = $(BASEDIR)/include
 -- 
-2.18.0
+2.20.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
index 1f589718ed..1bad53175e 100644
--- a/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
+++ b/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
@@ -1,4 +1,4 @@
-From 79e53510b1f9e16a21db312698fb1c1c442481e7 Mon Sep 17 00:00:00 2001
+From 66861bff389434e3454c7650ee29fade7a1cc5ed Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:27:17 +0000
 Subject: [PATCH 05/15] Only generate an RPATH entry if LD_RUN_PATH is not
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
-index 1ad9d6b6fa..6a025a45b4 100644
+index f4f7ad6b4e..cfd787ff28 100644
 --- a/ld/emultempl/elf32.em
 +++ b/ld/emultempl/elf32.em
 @@ -1471,6 +1471,8 @@ fragment <<EOF
@@ -27,7 +27,7 @@ index 1ad9d6b6fa..6a025a45b4 100644
  	      if (path
  		  && gld${EMULATION_NAME}_search_needed (path, &n, force))
  		break;
-@@ -1751,6 +1753,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+@@ -1746,6 +1748,8 @@ gld${EMULATION_NAME}_before_allocation (void)
    rpath = command_line.rpath;
    if (rpath == NULL)
      rpath = (const char *) getenv ("LD_RUN_PATH");
@@ -37,5 +37,5 @@ index 1ad9d6b6fa..6a025a45b4 100644
    for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
      if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
 -- 
-2.18.0
+2.20.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
index 8550df0cb0..f0c4d251bd 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
@@ -1,4 +1,4 @@
-From 11f6d2889725ad592ab789534ca9b858073df4d1 Mon Sep 17 00:00:00 2001
+From 418527a2971d4e77a87085400397090d89fc5c94 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:04:07 +0000
 Subject: [PATCH 06/15] Use libtool 2.4
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  bfd/configure.ac     |    2 +-
  binutils/configure   | 1320 ++++++++++++++-----
  gas/configure        | 1320 ++++++++++++++-----
- gprof/configure      | 1327 ++++++++++++++-----
+ gprof/configure      | 1321 ++++++++++++++-----
  ld/configure         | 1695 ++++++++++++++++++------
  libtool.m4           | 1080 +++++++++++-----
  ltmain.sh            | 2925 ++++++++++++++++++++++++++++--------------
@@ -23,12 +23,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  opcodes/configure    | 1322 ++++++++++++++-----
  opcodes/configure.ac |    2 +-
  zlib/configure       | 1320 ++++++++++++++-----
- 14 files changed, 9948 insertions(+), 3703 deletions(-)
+ 14 files changed, 9940 insertions(+), 3705 deletions(-)
 
-Index: git/bfd/configure
-===================================================================
---- git.orig/bfd/configure
-+++ git/bfd/configure
+diff --git a/bfd/configure b/bfd/configure
+index 17960684f8..925fb401f2 100755
+--- a/bfd/configure
++++ b/bfd/configure
 @@ -704,6 +704,9 @@ OTOOL
  LIPO
  NMEDIT
@@ -76,7 +76,7 @@ Index: git/bfd/configure
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6420,8 +6426,8 @@ $as_echo_n "checking whether the shell u
+@@ -6420,8 +6426,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -212,7 +212,7 @@ Index: git/bfd/configure
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6823,9 +6924,162 @@ test -z "$deplibs_check_method" && depli
+@@ -6821,11 +6922,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -226,6 +226,8 @@ Index: git/bfd/configure
 +
 +
 +
+ 
+ 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -447,7 +449,7 @@ Index: git/bfd/configure
 +
 +
 +
- 
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
 +if ${lt_cv_ar_at_file+:} false; then :
@@ -456,7 +458,7 @@ Index: git/bfd/configure
 +  lt_cv_ar_at_file=no
 +   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 +/* end confdefs.h.  */
- 
++
 +int
 +main ()
 +{
@@ -489,11 +491,11 @@ Index: git/bfd/configure
  
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
@@ -549,7 +551,7 @@ Index: git/bfd/configure
    const char *name;
    void       *address;
  }
-@@ -7377,8 +7708,8 @@ static const void *lt_preloaded_setup()
+@@ -7377,8 +7708,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -571,7 +573,7 @@ Index: git/bfd/configure
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7426,6 +7757,20 @@ else
+@@ -7426,6 +7757,16 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -585,17 +587,20 @@ Index: git/bfd/configure
 +
 +
 +
-+
-+
-+
-+
  
  
  
-@@ -7445,6 +7790,41 @@ fi
+@@ -7442,6 +7783,45 @@ fi
  
  
  
++
++
++
++
++
++
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -628,12 +633,9 @@ Index: git/bfd/configure
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
-+
-+
-+
  
  
- # Check whether --enable-libtool-lock was given.
+ 
 @@ -7653,6 +8033,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -795,7 +797,7 @@ Index: git/bfd/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8934,6 +9432,12 @@ $as_echo_n "checking for $compiler optio
+@@ -8934,6 +9432,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -808,7 +810,7 @@ Index: git/bfd/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8996,7 +9500,7 @@ $as_echo_n "checking for $compiler optio
+@@ -8996,7 +9500,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -969,7 +971,7 @@ Index: git/bfd/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9825,7 +10352,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9825,7 +10352,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -1027,7 +1029,7 @@ Index: git/bfd/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9898,20 +10438,63 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9898,20 +10438,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -1105,7 +1107,7 @@ Index: git/bfd/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9972,7 +10555,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9972,7 +10555,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -1114,7 +1116,7 @@ Index: git/bfd/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9980,7 +10563,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9980,7 +10563,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -1123,7 +1125,7 @@ Index: git/bfd/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9996,7 +10579,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9996,7 +10579,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -1132,7 +1134,7 @@ Index: git/bfd/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10020,10 +10603,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -10020,10 +10603,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -1190,7 +1192,7 @@ Index: git/bfd/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10203,7 +10799,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -10203,7 +10799,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -1199,7 +1201,7 @@ Index: git/bfd/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10222,9 +10818,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -10222,9 +10818,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -1358,7 +1360,7 @@ Index: git/bfd/configure
    fi
  
  # More hacks to build DLLs on Windows.
-@@ -17139,13 +17794,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -17142,13 +17797,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -1379,7 +1381,7 @@ Index: git/bfd/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17160,14 +17822,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -17163,14 +17825,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -1398,7 +1400,7 @@ Index: git/bfd/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -17200,12 +17865,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -17203,12 +17868,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -1412,7 +1414,7 @@ Index: git/bfd/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -17260,8 +17925,13 @@ reload_flag \
+@@ -17263,8 +17928,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -1426,7 +1428,7 @@ Index: git/bfd/configure
  STRIP \
  RANLIB \
  CC \
-@@ -17271,12 +17941,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -17274,12 +17944,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -1442,7 +1444,7 @@ Index: git/bfd/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -17292,7 +17964,6 @@ no_undefined_flag \
+@@ -17295,7 +17967,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -1450,7 +1452,7 @@ Index: git/bfd/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -17328,6 +17999,7 @@ module_cmds \
+@@ -17331,6 +18002,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -1458,7 +1460,7 @@ Index: git/bfd/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18116,7 +18788,8 @@ $as_echo X"$file" |
+@@ -18119,7 +18791,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -1468,7 +1470,7 @@ Index: git/bfd/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -18219,19 +18892,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -18222,19 +18895,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -1512,7 +1514,7 @@ Index: git/bfd/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -18261,6 +18957,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -18264,6 +18960,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -1525,7 +1527,7 @@ Index: git/bfd/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -18270,6 +18972,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -18273,6 +18975,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -1535,7 +1537,7 @@ Index: git/bfd/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -18384,12 +19089,12 @@ with_gcc=$GCC
+@@ -18387,12 +19092,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -1551,7 +1553,7 @@ Index: git/bfd/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -18476,9 +19181,6 @@ inherit_rpath=$inherit_rpath
+@@ -18479,9 +19184,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -1561,7 +1563,7 @@ Index: git/bfd/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -18494,6 +19196,9 @@ include_expsyms=$lt_include_expsyms
+@@ -18497,6 +19199,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -1571,7 +1573,7 @@ Index: git/bfd/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -18526,210 +19231,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -18529,210 +19234,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -1773,9 +1775,15 @@ Index: git/bfd/configure
 -_LT_EOF
 -    ;;
 -  esac
+-
+-
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+-
+-  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
- 
++
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -1933,19 +1941,16 @@ Index: git/bfd/configure
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
- 
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
- 
--  mv -f "$cfgfile" "$ofile" ||
++
++
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: git/bfd/configure.ac
-===================================================================
---- git.orig/bfd/configure.ac
-+++ git/bfd/configure.ac
+diff --git a/bfd/configure.ac b/bfd/configure.ac
+index eda38ea086..7cdf9c8146 100644
+--- a/bfd/configure.ac
++++ b/bfd/configure.ac
 @@ -293,7 +293,7 @@ changequote(,)dnl
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
  changequote([,])dnl
@@ -1955,11 +1960,11 @@ Index: git/bfd/configure.ac
    fi
  
  # More hacks to build DLLs on Windows.
-Index: git/binutils/configure
-===================================================================
---- git.orig/binutils/configure
-+++ git/binutils/configure
-@@ -688,8 +688,11 @@ OTOOL
+diff --git a/binutils/configure b/binutils/configure
+index 38128e146d..c74f797996 100755
+--- a/binutils/configure
++++ b/binutils/configure
+@@ -689,8 +689,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -1971,7 +1976,7 @@ Index: git/binutils/configure
  OBJDUMP
  LN_S
  NM
-@@ -806,6 +809,7 @@ enable_static
+@@ -807,6 +810,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -1979,7 +1984,7 @@ Index: git/binutils/configure
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1482,6 +1486,8 @@ Optional Packages:
+@@ -1483,6 +1487,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -1988,7 +1993,7 @@ Index: git/binutils/configure
    --with-system-zlib      use installed libz
    --with-gnu-ld           assume the C compiler uses GNU ld default=no
    --with-libiconv-prefix[=DIR]  search for libiconv in DIR/include and DIR/lib
-@@ -5453,8 +5459,8 @@ esac
+@@ -5457,8 +5463,8 @@ esac
  
  
  
@@ -1999,7 +2004,7 @@ Index: git/binutils/configure
  
  
  
-@@ -5494,7 +5500,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5498,7 +5504,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -2008,7 +2013,7 @@ Index: git/binutils/configure
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6180,8 +6186,8 @@ $as_echo_n "checking whether the shell u
+@@ -6184,8 +6190,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -2019,7 +2024,7 @@ Index: git/binutils/configure
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6230,6 +6236,80 @@ esac
+@@ -6234,6 +6240,80 @@ esac
  
  
  
@@ -2100,7 +2105,7 @@ Index: git/binutils/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6246,6 +6326,11 @@ case $reload_flag in
+@@ -6250,6 +6330,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -2112,7 +2117,7 @@ Index: git/binutils/configure
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6414,7 +6499,8 @@ mingw* | pw32*)
+@@ -6418,7 +6503,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -2122,7 +2127,7 @@ Index: git/binutils/configure
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6568,6 +6654,21 @@ esac
+@@ -6572,6 +6658,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -2144,7 +2149,7 @@ Index: git/binutils/configure
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6583,9 +6684,162 @@ test -z "$deplibs_check_method" && depli
+@@ -6587,9 +6688,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -2309,7 +2314,7 @@ Index: git/binutils/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6601,7 +6855,7 @@ do
+@@ -6605,7 +6859,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -2318,7 +2323,7 @@ Index: git/binutils/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6621,11 +6875,15 @@ $as_echo "no" >&6; }
+@@ -6625,11 +6879,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -2337,7 +2342,7 @@ Index: git/binutils/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6641,7 +6899,7 @@ do
+@@ -6645,7 +6903,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -2346,7 +2351,7 @@ Index: git/binutils/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6660,6 +6918,10 @@ else
+@@ -6664,6 +6922,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -2357,7 +2362,7 @@ Index: git/binutils/configure
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6671,12 +6933,10 @@ ac_tool_warned=yes ;;
+@@ -6675,12 +6937,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -2372,7 +2377,7 @@ Index: git/binutils/configure
  
  
  
-@@ -6688,6 +6948,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6692,6 +6952,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -2437,7 +2442,7 @@ Index: git/binutils/configure
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -7022,8 +7340,8 @@ esac
+@@ -7026,8 +7344,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -2448,7 +2453,7 @@ Index: git/binutils/configure
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7059,6 +7377,7 @@ for ac_symprfx in "" "_"; do
+@@ -7063,6 +7381,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -2456,7 +2461,7 @@ Index: git/binutils/configure
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7100,6 +7419,18 @@ _LT_EOF
+@@ -7104,6 +7423,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -2475,7 +2480,7 @@ Index: git/binutils/configure
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7111,7 +7442,7 @@ _LT_EOF
+@@ -7115,7 +7446,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -2484,7 +2489,7 @@ Index: git/binutils/configure
    const char *name;
    void       *address;
  }
-@@ -7137,8 +7468,8 @@ static const void *lt_preloaded_setup()
+@@ -7141,8 +7472,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -2495,7 +2500,7 @@ Index: git/binutils/configure
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7148,8 +7479,8 @@ _LT_EOF
+@@ -7152,8 +7483,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -2506,7 +2511,7 @@ Index: git/binutils/configure
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7186,6 +7517,18 @@ else
+@@ -7190,6 +7521,21 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -2522,13 +2527,18 @@ Index: git/binutils/configure
 +
 +
 +
++
++
++
  
  
  
-@@ -7207,6 +7550,43 @@ fi
+@@ -7206,6 +7552,40 @@ fi
  
  
  
++
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -2561,15 +2571,10 @@ Index: git/binutils/configure
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
-@@ -7413,6 +7793,123 @@ esac
+ 
+ 
+ 
+@@ -7417,6 +7797,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -2693,7 +2698,7 @@ Index: git/binutils/configure
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7976,6 +8473,8 @@ _LT_EOF
+@@ -7980,6 +8477,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -2702,7 +2707,7 @@ Index: git/binutils/configure
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8171,7 +8670,8 @@ fi
+@@ -8175,7 +8674,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -2712,7 +2717,7 @@ Index: git/binutils/configure
  
  
  
-@@ -8260,7 +8760,7 @@ aix3*)
+@@ -8264,7 +8764,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -2721,7 +2726,7 @@ Index: git/binutils/configure
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8558,8 +9058,6 @@ fi
+@@ -8562,8 +9062,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -2730,7 +2735,7 @@ Index: git/binutils/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8725,6 +9223,12 @@ $as_echo_n "checking for $compiler optio
+@@ -8729,6 +9227,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -2743,7 +2748,7 @@ Index: git/binutils/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8787,7 +9291,7 @@ $as_echo_n "checking for $compiler optio
+@@ -8791,7 +9295,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -2752,7 +2757,7 @@ Index: git/binutils/configure
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8844,13 +9348,17 @@ case $host_os in
+@@ -8848,13 +9352,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -2776,7 +2781,7 @@ Index: git/binutils/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8911,6 +9419,11 @@ fi
+@@ -8915,6 +9423,11 @@ fi
  
  
  
@@ -2788,7 +2793,7 @@ Index: git/binutils/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9261,7 +9774,8 @@ _LT_EOF
+@@ -9265,7 +9778,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -2798,7 +2803,7 @@ Index: git/binutils/configure
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9360,12 +9874,12 @@ _LT_EOF
+@@ -9364,12 +9878,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -2813,7 +2818,7 @@ Index: git/binutils/configure
  	  fi
  	  ;;
  	esac
-@@ -9379,8 +9893,8 @@ _LT_EOF
+@@ -9383,8 +9897,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -2824,7 +2829,7 @@ Index: git/binutils/configure
        fi
        ;;
  
-@@ -9398,8 +9912,8 @@ _LT_EOF
+@@ -9402,8 +9916,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -2835,7 +2840,7 @@ Index: git/binutils/configure
        else
  	ld_shlibs=no
        fi
-@@ -9445,8 +9959,8 @@ _LT_EOF
+@@ -9449,8 +9963,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -2846,7 +2851,7 @@ Index: git/binutils/configure
        else
  	ld_shlibs=no
        fi
-@@ -9576,7 +10090,13 @@ _LT_EOF
+@@ -9580,7 +10094,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -2861,7 +2866,7 @@ Index: git/binutils/configure
  /* end confdefs.h.  */
  
  int
-@@ -9589,22 +10109,29 @@ main ()
+@@ -9593,22 +10113,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -2904,7 +2909,7 @@ Index: git/binutils/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9616,7 +10143,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9620,7 +10147,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -2919,7 +2924,7 @@ Index: git/binutils/configure
  /* end confdefs.h.  */
  
  int
-@@ -9629,22 +10162,29 @@ main ()
+@@ -9633,22 +10166,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -2962,7 +2967,7 @@ Index: git/binutils/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9689,20 +10229,63 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9693,20 +10233,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -3040,7 +3045,7 @@ Index: git/binutils/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9763,7 +10346,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9767,7 +10350,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -3049,7 +3054,7 @@ Index: git/binutils/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9771,7 +10354,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9775,7 +10358,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -3058,7 +3063,7 @@ Index: git/binutils/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9787,7 +10370,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9791,7 +10374,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -3067,7 +3072,7 @@ Index: git/binutils/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9811,10 +10394,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9815,10 +10398,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -3080,7 +3085,7 @@ Index: git/binutils/configure
  	  ;;
  	esac
        else
-@@ -9893,23 +10476,36 @@ fi
+@@ -9897,23 +10480,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -3125,7 +3130,7 @@ Index: git/binutils/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9994,7 +10590,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9998,7 +10594,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -3134,7 +3139,7 @@ Index: git/binutils/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10013,9 +10609,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -10017,9 +10613,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -3146,7 +3151,7 @@ Index: git/binutils/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10591,8 +11187,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10595,8 +11191,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -3158,7 +3163,7 @@ Index: git/binutils/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10625,13 +11222,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10629,13 +11226,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -3231,7 +3236,7 @@ Index: git/binutils/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10723,7 +11378,7 @@ haiku*)
+@@ -10727,7 +11382,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -3240,16 +3245,16 @@ Index: git/binutils/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11519,7 +12174,7 @@ else
+@@ -11523,7 +12178,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11522 "configure"
+-#line 11526 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11563,10 +12218,10 @@ else
+@@ -11567,10 +12222,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -3262,16 +3267,16 @@ Index: git/binutils/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11625,7 +12280,7 @@ else
+@@ -11629,7 +12284,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11628 "configure"
+-#line 11632 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11669,10 +12324,10 @@ else
+@@ -11673,10 +12328,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -3284,7 +3289,7 @@ Index: git/binutils/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15731,13 +16386,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -15936,13 +16591,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -3305,7 +3310,7 @@ Index: git/binutils/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15752,14 +16414,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -15957,14 +16619,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -3324,7 +3329,7 @@ Index: git/binutils/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15792,12 +16457,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -15997,12 +16662,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -3338,7 +3343,7 @@ Index: git/binutils/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15852,8 +16517,13 @@ reload_flag \
+@@ -16057,8 +16722,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -3352,7 +3357,7 @@ Index: git/binutils/configure
  STRIP \
  RANLIB \
  CC \
-@@ -15863,12 +16533,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -16068,12 +16738,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -3368,7 +3373,7 @@ Index: git/binutils/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15884,7 +16556,6 @@ no_undefined_flag \
+@@ -16089,7 +16761,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -3376,7 +3381,7 @@ Index: git/binutils/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15920,6 +16591,7 @@ module_cmds \
+@@ -16125,6 +16796,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -3384,7 +3389,7 @@ Index: git/binutils/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16686,7 +17358,8 @@ $as_echo X"$file" |
+@@ -16891,7 +17563,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -3394,7 +3399,7 @@ Index: git/binutils/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16789,19 +17462,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -16994,19 +17667,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -3438,7 +3443,7 @@ Index: git/binutils/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16831,6 +17527,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -17036,6 +17732,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -3451,7 +3456,7 @@ Index: git/binutils/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16840,6 +17542,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -17045,6 +17747,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -3461,7 +3466,7 @@ Index: git/binutils/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16954,12 +17659,12 @@ with_gcc=$GCC
+@@ -17159,12 +17864,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -3477,7 +3482,7 @@ Index: git/binutils/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -17046,9 +17751,6 @@ inherit_rpath=$inherit_rpath
+@@ -17251,9 +17956,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -3487,7 +3492,7 @@ Index: git/binutils/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -17064,6 +17766,9 @@ include_expsyms=$lt_include_expsyms
+@@ -17269,6 +17971,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -3497,7 +3502,7 @@ Index: git/binutils/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -17096,210 +17801,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -17301,210 +18006,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -3699,9 +3704,15 @@ Index: git/binutils/configure
 -_LT_EOF
 -    ;;
 -  esac
+-
+-
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+-
+-  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
- 
++
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -3859,19 +3870,16 @@ Index: git/binutils/configure
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
- 
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
- 
--  mv -f "$cfgfile" "$ofile" ||
++
++
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: git/gas/configure
-===================================================================
---- git.orig/gas/configure
-+++ git/gas/configure
+diff --git a/gas/configure b/gas/configure
+index 64de9f19da..a82fde7fa8 100755
+--- a/gas/configure
++++ b/gas/configure
 @@ -681,8 +681,11 @@ OTOOL
  LIPO
  NMEDIT
@@ -3892,7 +3900,7 @@ Index: git/gas/configure
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1482,6 +1486,8 @@ Optional Packages:
+@@ -1487,6 +1491,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -3901,7 +3909,7 @@ Index: git/gas/configure
    --with-cpu=CPU          default cpu variant is CPU (currently only supported
                            on ARC)
    --with-system-zlib      use installed libz
-@@ -5269,8 +5275,8 @@ esac
+@@ -5274,8 +5280,8 @@ esac
  
  
  
@@ -3912,7 +3920,7 @@ Index: git/gas/configure
  
  
  
-@@ -5310,7 +5316,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5315,7 +5321,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -3921,7 +3929,7 @@ Index: git/gas/configure
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5996,8 +6002,8 @@ $as_echo_n "checking whether the shell u
+@@ -6001,8 +6007,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -3932,7 +3940,7 @@ Index: git/gas/configure
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6046,6 +6052,80 @@ esac
+@@ -6051,6 +6057,80 @@ esac
  
  
  
@@ -4013,7 +4021,7 @@ Index: git/gas/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6062,6 +6142,11 @@ case $reload_flag in
+@@ -6067,6 +6147,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -4025,7 +4033,7 @@ Index: git/gas/configure
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6230,7 +6315,8 @@ mingw* | pw32*)
+@@ -6235,7 +6320,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -4035,7 +4043,7 @@ Index: git/gas/configure
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6384,6 +6470,21 @@ esac
+@@ -6389,6 +6475,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -4057,7 +4065,7 @@ Index: git/gas/configure
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6399,9 +6500,162 @@ test -z "$deplibs_check_method" && depli
+@@ -6404,9 +6505,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -4071,9 +4079,7 @@ Index: git/gas/configure
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
@@ -4214,7 +4220,9 @@ Index: git/gas/configure
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
@@ -4222,7 +4230,7 @@ Index: git/gas/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6417,7 +6671,7 @@ do
+@@ -6422,7 +6676,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -4231,7 +4239,7 @@ Index: git/gas/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6437,11 +6691,15 @@ $as_echo "no" >&6; }
+@@ -6442,11 +6696,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -4250,7 +4258,7 @@ Index: git/gas/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6457,7 +6715,7 @@ do
+@@ -6462,7 +6720,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -4259,7 +4267,7 @@ Index: git/gas/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6476,6 +6734,10 @@ else
+@@ -6481,6 +6739,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -4270,7 +4278,7 @@ Index: git/gas/configure
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6487,12 +6749,10 @@ ac_tool_warned=yes ;;
+@@ -6492,12 +6754,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -4285,7 +4293,7 @@ Index: git/gas/configure
  
  
  
-@@ -6504,6 +6764,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6509,6 +6769,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -4350,7 +4358,7 @@ Index: git/gas/configure
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -6838,8 +7156,8 @@ esac
+@@ -6843,8 +7161,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -4361,7 +4369,7 @@ Index: git/gas/configure
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6875,6 +7193,7 @@ for ac_symprfx in "" "_"; do
+@@ -6880,6 +7198,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -4369,7 +4377,7 @@ Index: git/gas/configure
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6916,6 +7235,18 @@ _LT_EOF
+@@ -6921,6 +7240,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -4388,7 +4396,7 @@ Index: git/gas/configure
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6927,7 +7258,7 @@ _LT_EOF
+@@ -6932,7 +7263,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -4397,7 +4405,7 @@ Index: git/gas/configure
    const char *name;
    void       *address;
  }
-@@ -6953,8 +7284,8 @@ static const void *lt_preloaded_setup()
+@@ -6958,8 +7289,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -4408,7 +4416,7 @@ Index: git/gas/configure
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6964,8 +7295,8 @@ _LT_EOF
+@@ -6969,8 +7300,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -4419,7 +4427,7 @@ Index: git/gas/configure
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7002,6 +7333,19 @@ else
+@@ -7007,6 +7338,21 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -4436,13 +4444,17 @@ Index: git/gas/configure
 +
 +
 +
++
++
  
  
  
-@@ -7022,6 +7366,42 @@ fi
+@@ -7023,6 +7369,40 @@ fi
  
  
  
++
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -4475,14 +4487,10 @@ Index: git/gas/configure
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
-+
-+
-+
-+
  
- # Check whether --enable-libtool-lock was given.
- if test "${enable_libtool_lock+set}" = set; then :
-@@ -7229,6 +7609,123 @@ esac
+ 
+ 
+@@ -7234,6 +7614,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -4606,7 +4614,7 @@ Index: git/gas/configure
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7792,6 +8289,8 @@ _LT_EOF
+@@ -7797,6 +8294,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -4615,7 +4623,7 @@ Index: git/gas/configure
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7987,7 +8486,8 @@ fi
+@@ -7992,7 +8491,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -4625,7 +4633,7 @@ Index: git/gas/configure
  
  
  
-@@ -8076,7 +8576,7 @@ aix3*)
+@@ -8081,7 +8581,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -4634,7 +4642,7 @@ Index: git/gas/configure
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8374,8 +8874,6 @@ fi
+@@ -8379,8 +8879,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -4643,7 +4651,7 @@ Index: git/gas/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8541,6 +9039,12 @@ $as_echo_n "checking for $compiler optio
+@@ -8546,6 +9044,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -4656,7 +4664,7 @@ Index: git/gas/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8603,7 +9107,7 @@ $as_echo_n "checking for $compiler optio
+@@ -8608,7 +9112,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -4665,7 +4673,7 @@ Index: git/gas/configure
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8660,13 +9164,17 @@ case $host_os in
+@@ -8665,13 +9169,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -4689,7 +4697,7 @@ Index: git/gas/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8727,6 +9235,11 @@ fi
+@@ -8732,6 +9240,11 @@ fi
  
  
  
@@ -4701,7 +4709,7 @@ Index: git/gas/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9077,7 +9590,8 @@ _LT_EOF
+@@ -9082,7 +9595,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -4711,7 +4719,7 @@ Index: git/gas/configure
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9176,12 +9690,12 @@ _LT_EOF
+@@ -9181,12 +9695,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -4726,7 +4734,7 @@ Index: git/gas/configure
  	  fi
  	  ;;
  	esac
-@@ -9195,8 +9709,8 @@ _LT_EOF
+@@ -9200,8 +9714,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -4737,7 +4745,7 @@ Index: git/gas/configure
        fi
        ;;
  
-@@ -9214,8 +9728,8 @@ _LT_EOF
+@@ -9219,8 +9733,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4748,7 +4756,7 @@ Index: git/gas/configure
        else
  	ld_shlibs=no
        fi
-@@ -9261,8 +9775,8 @@ _LT_EOF
+@@ -9266,8 +9780,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4759,7 +4767,7 @@ Index: git/gas/configure
        else
  	ld_shlibs=no
        fi
-@@ -9392,7 +9906,13 @@ _LT_EOF
+@@ -9397,7 +9911,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -4774,7 +4782,7 @@ Index: git/gas/configure
  /* end confdefs.h.  */
  
  int
-@@ -9405,22 +9925,29 @@ main ()
+@@ -9410,22 +9930,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4817,7 +4825,7 @@ Index: git/gas/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9432,7 +9959,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9437,7 +9964,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -4832,7 +4840,7 @@ Index: git/gas/configure
  /* end confdefs.h.  */
  
  int
-@@ -9445,22 +9978,29 @@ main ()
+@@ -9450,22 +9983,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4875,7 +4883,7 @@ Index: git/gas/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9505,20 +10045,63 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9510,20 +10050,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -4953,7 +4961,7 @@ Index: git/gas/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9579,7 +10162,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9584,7 +10167,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -4962,7 +4970,7 @@ Index: git/gas/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9587,7 +10170,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9592,7 +10175,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -4971,7 +4979,7 @@ Index: git/gas/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9603,7 +10186,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9608,7 +10191,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -4980,7 +4988,7 @@ Index: git/gas/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9627,10 +10210,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9632,10 +10215,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -4993,7 +5001,7 @@ Index: git/gas/configure
  	  ;;
  	esac
        else
-@@ -9709,23 +10292,36 @@ fi
+@@ -9714,23 +10297,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -5038,7 +5046,7 @@ Index: git/gas/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9810,7 +10406,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9815,7 +10411,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -5047,7 +5055,7 @@ Index: git/gas/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9829,9 +10425,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9834,9 +10430,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -5059,7 +5067,7 @@ Index: git/gas/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10407,8 +11003,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10412,8 +11008,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -5071,7 +5079,7 @@ Index: git/gas/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10441,13 +11038,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10446,13 +11043,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -5144,7 +5152,7 @@ Index: git/gas/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10539,7 +11194,7 @@ haiku*)
+@@ -10544,7 +11199,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -5153,16 +5161,16 @@ Index: git/gas/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11335,7 +11990,7 @@ else
+@@ -11340,7 +11995,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11338 "configure"
+-#line 11343 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11379,10 +12034,10 @@ else
+@@ -11384,10 +12039,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5175,16 +5183,16 @@ Index: git/gas/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11441,7 +12096,7 @@ else
+@@ -11446,7 +12101,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11444 "configure"
+-#line 11449 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11485,10 +12140,10 @@ else
+@@ -11490,10 +12145,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5197,7 +5205,7 @@ Index: git/gas/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15803,13 +16458,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -15896,13 +16551,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -5218,7 +5226,7 @@ Index: git/gas/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15824,14 +16486,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -15917,14 +16579,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -5237,7 +5245,7 @@ Index: git/gas/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15864,12 +16529,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -15957,12 +16622,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -5251,7 +5259,7 @@ Index: git/gas/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15924,8 +16589,13 @@ reload_flag \
+@@ -16017,8 +16682,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -5265,7 +5273,7 @@ Index: git/gas/configure
  STRIP \
  RANLIB \
  CC \
-@@ -15935,12 +16605,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -16028,12 +16698,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -5281,7 +5289,7 @@ Index: git/gas/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15956,7 +16628,6 @@ no_undefined_flag \
+@@ -16049,7 +16721,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -5289,7 +5297,7 @@ Index: git/gas/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15992,6 +16663,7 @@ module_cmds \
+@@ -16085,6 +16756,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -5297,7 +5305,7 @@ Index: git/gas/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16765,7 +17437,8 @@ $as_echo X"$file" |
+@@ -16858,7 +17530,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -5307,7 +5315,7 @@ Index: git/gas/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16868,19 +17541,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -16961,19 +17634,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -5351,7 +5359,7 @@ Index: git/gas/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16910,6 +17606,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -17003,6 +17699,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -5364,7 +5372,7 @@ Index: git/gas/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16919,6 +17621,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -17012,6 +17714,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -5374,7 +5382,7 @@ Index: git/gas/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -17033,12 +17738,12 @@ with_gcc=$GCC
+@@ -17126,12 +17831,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -5390,7 +5398,7 @@ Index: git/gas/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -17125,9 +17830,6 @@ inherit_rpath=$inherit_rpath
+@@ -17218,9 +17923,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -5400,7 +5408,7 @@ Index: git/gas/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -17143,6 +17845,9 @@ include_expsyms=$lt_include_expsyms
+@@ -17236,6 +17938,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -5410,7 +5418,7 @@ Index: git/gas/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -17175,210 +17880,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -17268,210 +17973,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -5612,9 +5620,15 @@ Index: git/gas/configure
 -_LT_EOF
 -    ;;
 -  esac
+-
+-
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+-
+-  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
- 
++
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -5772,19 +5786,16 @@ Index: git/gas/configure
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
- 
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
- 
--  mv -f "$cfgfile" "$ofile" ||
++
++
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: git/gprof/configure
-===================================================================
---- git.orig/gprof/configure
-+++ git/gprof/configure
+diff --git a/gprof/configure b/gprof/configure
+index ab32bab2b6..5119c6019f 100755
+--- a/gprof/configure
++++ b/gprof/configure
 @@ -662,8 +662,11 @@ OTOOL
  LIPO
  NMEDIT
@@ -5834,7 +5845,7 @@ Index: git/gprof/configure
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5851,8 +5857,8 @@ $as_echo_n "checking whether the shell u
+@@ -5851,8 +5857,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -5851,7 +5862,7 @@ Index: git/gprof/configure
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to $host format" >&5
 +$as_echo_n "checking how to convert $build file names to $host format... " >&6; }
-+if ${lt_cv_to_host_file_cmd+:} false; then :
++if test "${lt_cv_to_host_file_cmd+set}" = set; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  case $host in
@@ -5898,7 +5909,7 @@ Index: git/gprof/configure
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build file names to toolchain format" >&5
 +$as_echo_n "checking how to convert $build file names to toolchain format... " >&6; }
-+if ${lt_cv_to_tool_file_cmd+:} false; then :
++if test "${lt_cv_to_tool_file_cmd+set}" = set; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  #assume ordinary cross tools, or native build.
@@ -5982,7 +5993,7 @@ Index: git/gprof/configure
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6259,9 +6355,162 @@ test -z "$deplibs_check_method" && depli
+@@ -6257,11 +6353,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -5996,6 +6007,8 @@ Index: git/gprof/configure
 +
 +
 +
+ 
+ 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -6003,7 +6016,7 @@ Index: git/gprof/configure
 +set dummy ${ac_tool_prefix}dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if ${ac_cv_prog_DLLTOOL+:} false; then :
++if test "${ac_cv_prog_DLLTOOL+set}" = set; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$DLLTOOL"; then
@@ -6015,7 +6028,7 @@ Index: git/gprof/configure
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
++  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
 +    ac_cv_prog_DLLTOOL="${ac_tool_prefix}dlltool"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -6043,7 +6056,7 @@ Index: git/gprof/configure
 +set dummy dlltool; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if ${ac_cv_prog_ac_ct_DLLTOOL+:} false; then :
++if test "${ac_cv_prog_ac_ct_DLLTOOL+set}" = set; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$ac_ct_DLLTOOL"; then
@@ -6055,7 +6068,7 @@ Index: git/gprof/configure
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
++  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
 +    ac_cv_prog_ac_ct_DLLTOOL="dlltool"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -6103,7 +6116,7 @@ Index: git/gprof/configure
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to associate runtime and link libraries" >&5
 +$as_echo_n "checking how to associate runtime and link libraries... " >&6; }
-+if ${lt_cv_sharedlib_from_linklib_cmd+:} false; then :
++if test "${lt_cv_sharedlib_from_linklib_cmd+set}" = set; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_sharedlib_from_linklib_cmd='unknown'
@@ -6147,11 +6160,13 @@ Index: git/gprof/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6277,7 +6526,7 @@ do
+@@ -6276,8 +6525,8 @@ do
+   IFS=$as_save_IFS
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
-   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
+-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 -    ac_cv_prog_AR="${ac_tool_prefix}ar"
++  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
 +    ac_cv_prog_AR="$ac_tool_prefix$ac_prog"
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
@@ -6175,15 +6190,6 @@ Index: git/gprof/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6317,7 +6570,7 @@ do
-   test -z "$as_dir" && as_dir=.
-     for ac_exec_ext in '' $ac_executable_extensions; do
-   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
--    ac_cv_prog_ac_ct_AR="ar"
-+    ac_cv_prog_ac_ct_AR="$ac_prog"
-     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
-     break 2
-   fi
 @@ -6336,6 +6589,10 @@ else
  $as_echo "no" >&6; }
  fi
@@ -6220,7 +6226,7 @@ Index: git/gprof/configure
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
-+if ${lt_cv_ar_at_file+:} false; then :
++if test "${lt_cv_ar_at_file+set}" = set; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_ar_at_file=no
@@ -6319,7 +6325,7 @@ Index: git/gprof/configure
    const char *name;
    void       *address;
  }
-@@ -6813,8 +7139,8 @@ static const void *lt_preloaded_setup()
+@@ -6813,8 +7139,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -6341,7 +6347,7 @@ Index: git/gprof/configure
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6862,6 +7188,17 @@ else
+@@ -6862,6 +7188,18 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -6356,13 +6362,18 @@ Index: git/gprof/configure
 +
 +
 +
++
  
  
  
-@@ -6883,6 +7220,44 @@ fi
+@@ -6878,6 +7216,43 @@ fi
  
  
  
++
++
++
++
 +
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
@@ -6390,20 +6401,15 @@ Index: git/gprof/configure
 + *)
 +   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysroot}" >&5
 +$as_echo "${with_libtool_sysroot}" >&6; }
-+   as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
++   as_fn_error "The sysroot must be an absolute path." "$LINENO" 5
 +   ;;
 +esac
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
 @@ -7089,6 +7464,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -6413,7 +6419,7 @@ Index: git/gprof/configure
 +set dummy ${ac_tool_prefix}mt; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if ${ac_cv_prog_MANIFEST_TOOL+:} false; then :
++if test "${ac_cv_prog_MANIFEST_TOOL+set}" = set; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$MANIFEST_TOOL"; then
@@ -6425,7 +6431,7 @@ Index: git/gprof/configure
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
++  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
 +    ac_cv_prog_MANIFEST_TOOL="${ac_tool_prefix}mt"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -6453,7 +6459,7 @@ Index: git/gprof/configure
 +set dummy mt; ac_word=$2
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
 +$as_echo_n "checking for $ac_word... " >&6; }
-+if ${ac_cv_prog_ac_ct_MANIFEST_TOOL+:} false; then :
++if test "${ac_cv_prog_ac_ct_MANIFEST_TOOL+set}" = set; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  if test -n "$ac_ct_MANIFEST_TOOL"; then
@@ -6465,7 +6471,7 @@ Index: git/gprof/configure
 +  IFS=$as_save_IFS
 +  test -z "$as_dir" && as_dir=.
 +    for ac_exec_ext in '' $ac_executable_extensions; do
-+  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
++  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
 +    ac_cv_prog_ac_ct_MANIFEST_TOOL="mt"
 +    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 +    break 2
@@ -6503,7 +6509,7 @@ Index: git/gprof/configure
 +test -z "$MANIFEST_TOOL" && MANIFEST_TOOL=mt
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if $MANIFEST_TOOL is a manifest tool" >&5
 +$as_echo_n "checking if $MANIFEST_TOOL is a manifest tool... " >&6; }
-+if ${lt_cv_path_mainfest_tool+:} false; then :
++if test "${lt_cv_path_mainfest_tool+set}" = set; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_path_mainfest_tool=no
@@ -6565,7 +6571,7 @@ Index: git/gprof/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8401,6 +8894,12 @@ $as_echo_n "checking for $compiler optio
+@@ -8401,6 +8894,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -6578,7 +6584,7 @@ Index: git/gprof/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8463,7 +8962,7 @@ $as_echo_n "checking for $compiler optio
+@@ -8463,7 +8962,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -6600,7 +6606,7 @@ Index: git/gprof/configure
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option to produce PIC" >&5
 +$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
-+if ${lt_cv_prog_compiler_pic+:} false; then :
++if test "${lt_cv_prog_compiler_pic+set}" = set; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  lt_cv_prog_compiler_pic=$lt_prog_compiler_pic
@@ -6689,7 +6695,7 @@ Index: git/gprof/configure
 +        if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if ${lt_cv_aix_libpath_+:} false; then :
++  if test "${lt_cv_aix_libpath_+set}" = set; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
@@ -6739,7 +6745,7 @@ Index: git/gprof/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9292,7 +9814,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9292,7 +9814,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -6747,7 +6753,7 @@ Index: git/gprof/configure
 +	 if test "${lt_cv_aix_libpath+set}" = set; then
 +  aix_libpath=$lt_cv_aix_libpath
 +else
-+  if ${lt_cv_aix_libpath_+:} false; then :
++  if test "${lt_cv_aix_libpath_+set}" = set; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
@@ -6797,7 +6803,7 @@ Index: git/gprof/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9365,20 +9900,63 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9365,20 +9900,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -6875,7 +6881,7 @@ Index: git/gprof/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9439,7 +10017,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9439,7 +10017,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -6884,7 +6890,7 @@ Index: git/gprof/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9447,7 +10025,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9447,7 +10025,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -6893,7 +6899,7 @@ Index: git/gprof/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9463,7 +10041,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9463,7 +10041,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -6902,7 +6908,7 @@ Index: git/gprof/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9487,10 +10065,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9487,10 +10065,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -6930,7 +6936,7 @@ Index: git/gprof/configure
 +	# This should be the same for all languages, so no per-tag cache variable.
 +	{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the $host_os linker accepts -exported_symbol" >&5
 +$as_echo_n "checking whether the $host_os linker accepts -exported_symbol... " >&6; }
-+if ${lt_cv_irix_exported_symbol+:} false; then :
++if test "${lt_cv_irix_exported_symbol+set}" = set; then :
 +  $as_echo_n "(cached) " >&6
 +else
 +  save_LDFLAGS="$LDFLAGS"
@@ -6960,7 +6966,7 @@ Index: git/gprof/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9670,7 +10261,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9670,7 +10261,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -6969,7 +6975,7 @@ Index: git/gprof/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9689,9 +10280,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9689,9 +10280,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -7075,15 +7081,6 @@ Index: git/gprof/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11195,7 +11845,7 @@ else
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 11193 "configure"
-+#line $LINENO "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
 @@ -11239,10 +11889,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
@@ -7097,15 +7094,6 @@ Index: git/gprof/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11301,7 +11951,7 @@ else
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 11299 "configure"
-+#line $LINENO "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
 @@ -11345,10 +11995,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
@@ -7119,7 +7107,7 @@ Index: git/gprof/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -13314,13 +13964,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -13314,13 +13964,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -7140,7 +7128,7 @@ Index: git/gprof/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13335,14 +13992,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -13335,14 +13992,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -7159,7 +7147,7 @@ Index: git/gprof/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13375,12 +14035,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -13375,12 +14035,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -7273,7 +7261,7 @@ Index: git/gprof/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14413,6 +15104,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -14413,6 +15104,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -7534,9 +7522,15 @@ Index: git/gprof/configure
 -_LT_EOF
 -    ;;
 -  esac
+-
+-
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+-
+-  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
- 
++
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -7694,19 +7688,16 @@ Index: git/gprof/configure
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
- 
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
- 
--  mv -f "$cfgfile" "$ofile" ||
++
++
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: git/ld/configure
-===================================================================
---- git.orig/ld/configure
-+++ git/ld/configure
+diff --git a/ld/configure b/ld/configure
+index bc09e7ef81..43c391c2b3 100755
+--- a/ld/configure
++++ b/ld/configure
 @@ -687,8 +687,11 @@ OTOOL
  LIPO
  NMEDIT
@@ -7756,7 +7747,7 @@ Index: git/ld/configure
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6686,8 +6692,8 @@ $as_echo_n "checking whether the shell u
+@@ -6686,8 +6692,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -7892,7 +7883,7 @@ Index: git/ld/configure
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -7089,9 +7190,162 @@ test -z "$deplibs_check_method" && depli
+@@ -7089,9 +7190,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -8105,7 +8096,7 @@ Index: git/ld/configure
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -7177,12 +7439,11 @@ ac_tool_warned=yes ;;
+@@ -7177,12 +7439,12 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -8118,10 +8109,11 @@ Index: git/ld/configure
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
 +
++
  
  
  
-@@ -7193,6 +7454,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -7192,6 +7454,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -8180,11 +8172,10 @@ Index: git/ld/configure
 +
 +
 +
-+
 +
  
+ 
  if test -n "$ac_tool_prefix"; then
-   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
 @@ -7528,8 +7846,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
@@ -8232,7 +8223,7 @@ Index: git/ld/configure
    const char *name;
    void       *address;
  }
-@@ -7643,8 +7974,8 @@ static const void *lt_preloaded_setup()
+@@ -7643,8 +7974,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -8254,7 +8245,7 @@ Index: git/ld/configure
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7692,6 +8023,13 @@ else
+@@ -7692,6 +8023,19 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -8265,10 +8256,16 @@ Index: git/ld/configure
 +  nm_file_list_spec='@'
 +fi
 +
++
++
++
++
++
++
  
  
  
-@@ -7713,6 +8051,48 @@ fi
+@@ -7708,6 +8052,42 @@ fi
  
  
  
@@ -8276,7 +8273,6 @@ Index: git/ld/configure
 +
 +
 +
-+
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -8309,14 +8305,9 @@ Index: git/ld/configure
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
 @@ -7919,6 +8299,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -8495,7 +8486,7 @@ Index: git/ld/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -9232,6 +9740,12 @@ $as_echo_n "checking for $compiler optio
+@@ -9232,6 +9740,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -8508,7 +8499,7 @@ Index: git/ld/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -9294,7 +9808,7 @@ $as_echo_n "checking for $compiler optio
+@@ -9294,7 +9808,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -8669,7 +8660,7 @@ Index: git/ld/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -10123,7 +10660,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -10123,7 +10660,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -8727,10 +8718,11 @@ Index: git/ld/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -10196,20 +10746,63 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -10195,21 +10745,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+       # When not using gcc, we currently assume that we are using
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
-       # no search path for DLLs.
+-      # no search path for DLLs.
 -      hardcode_libdir_flag_spec=' '
 -      allow_undefined_flag=unsupported
 -      # Tell ltmain to make .lib files, not .a files.
@@ -8745,6 +8737,7 @@ Index: git/ld/configure
 -      old_archive_cmds='lib -OUT:$oldlib$oldobjs$old_deplibs'
 -      fix_srcfile_path='`cygpath -w "$srcfile"`'
 -      enable_shared_with_static_runtimes=yes
++      # no search path for DLLs.
 +      case $cc_basename in
 +      cl*)
 +	# Native MSVC
@@ -8805,7 +8798,7 @@ Index: git/ld/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -10270,7 +10863,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -10270,7 +10863,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -8814,7 +8807,7 @@ Index: git/ld/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -10278,7 +10871,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -10278,7 +10871,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -8823,7 +8816,7 @@ Index: git/ld/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -10294,7 +10887,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -10294,7 +10887,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -8832,7 +8825,7 @@ Index: git/ld/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10318,10 +10911,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -10318,10 +10911,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -8890,7 +8883,7 @@ Index: git/ld/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10501,7 +11107,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -10501,7 +11107,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -8899,7 +8892,7 @@ Index: git/ld/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10520,9 +11126,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -10520,9 +11126,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -9065,7 +9058,7 @@ Index: git/ld/configure
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -12870,7 +13537,13 @@ $as_echo_n "checking whether the $compil
+@@ -12870,7 +13537,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -9123,7 +9116,7 @@ Index: git/ld/configure
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -12911,7 +13591,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -12911,7 +13591,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -9181,7 +9174,7 @@ Index: git/ld/configure
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -12982,29 +13675,75 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -12982,29 +13675,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -9280,7 +9273,7 @@ Index: git/ld/configure
        darwin* | rhapsody*)
  
  
-@@ -13110,7 +13849,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -13110,7 +13849,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
              ;;
            *)
              if test "$GXX" = yes; then
@@ -9289,7 +9282,7 @@ Index: git/ld/configure
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -13181,10 +13920,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -13181,10 +13920,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -9302,7 +9295,7 @@ Index: git/ld/configure
  	            ;;
  	        esac
  	      fi
-@@ -13225,9 +13964,9 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -13225,9 +13964,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -9314,7 +9307,7 @@ Index: git/ld/configure
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -13297,20 +14036,20 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -13297,20 +14036,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	      prelink_cmds_CXX='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -9339,7 +9332,7 @@ Index: git/ld/configure
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -13505,7 +14244,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -13505,7 +14244,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -9348,7 +9341,7 @@ Index: git/ld/configure
  		  ;;
  	      esac
  
-@@ -13551,7 +14290,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -13551,7 +14290,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
        solaris*)
          case $cc_basename in
@@ -9357,7 +9350,7 @@ Index: git/ld/configure
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13592,9 +14331,9 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -13592,9 +14331,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -9383,7 +9376,7 @@ Index: git/ld/configure
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13742,7 +14488,7 @@ if { { eval echo "\"\$as_me\":${as_linen
+@@ -13742,7 +14488,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -9392,7 +9385,7 @@ Index: git/ld/configure
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13751,13 +14497,22 @@ if { { eval echo "\"\$as_me\":${as_linen
+@@ -13751,13 +14497,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -9419,7 +9412,7 @@ Index: git/ld/configure
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -13777,8 +14532,10 @@ if { { eval echo "\"\$as_me\":${as_linen
+@@ -13777,8 +14532,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -9456,7 +9449,7 @@ Index: git/ld/configure
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -14020,6 +14776,11 @@ $as_echo_n "checking for $compiler optio
+@@ -14020,6 +14776,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	  ;;
  	esac
  	;;
@@ -9468,7 +9461,7 @@ Index: git/ld/configure
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -14172,7 +14933,7 @@ $as_echo_n "checking for $compiler optio
+@@ -14172,7 +14933,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	;;
        solaris*)
  	case $cc_basename in
@@ -9515,7 +9508,7 @@ Index: git/ld/configure
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -14489,15 +15260,20 @@ $as_echo_n "checking whether the $compil
+@@ -14489,15 +15260,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -9643,7 +9636,7 @@ Index: git/ld/configure
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -18444,13 +19280,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -18444,13 +19280,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -9664,7 +9657,7 @@ Index: git/ld/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -18465,14 +19308,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -18465,14 +19308,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -9683,7 +9676,7 @@ Index: git/ld/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -18505,12 +19351,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -18505,12 +19351,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -9697,7 +9690,7 @@ Index: git/ld/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -18549,8 +19395,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archi
+@@ -18549,8 +19395,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9707,7 +9700,7 @@ Index: git/ld/configure
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18577,12 +19423,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$har
+@@ -18577,12 +19423,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9849,7 +9842,7 @@ Index: git/ld/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -19684,6 +20561,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -19684,6 +20561,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -10110,9 +10103,15 @@ Index: git/ld/configure
 -_LT_EOF
 -    ;;
 -  esac
+-
+-
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+-
+-  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
- 
++
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -10270,11 +10269,8 @@ Index: git/ld/configure
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
- 
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
- 
--  mv -f "$cfgfile" "$ofile" ||
++
++
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
@@ -10315,10 +10311,10 @@ Index: git/ld/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec_CXX
  
-Index: git/libtool.m4
-===================================================================
---- git.orig/libtool.m4
-+++ git/libtool.m4
+diff --git a/libtool.m4 b/libtool.m4
+index 434530059f..e45fdc6998 100644
+--- a/libtool.m4
++++ b/libtool.m4
 @@ -1,7 +1,8 @@
  # libtool.m4 - Configure libtool for the host system. -*-Autoconf-*-
  #
@@ -10358,7 +10354,7 @@ Index: git/libtool.m4
  AC_SUBST(LIBTOOL)dnl
  
  _LT_SETUP
-@@ -166,10 +169,13 @@ _LT_DECL([], [exeext], [0], [Executable
+@@ -166,10 +169,13 @@ _LT_DECL([], [exeext], [0], [Executable file suffix (normally "")])dnl
  dnl
  m4_require([_LT_FILEUTILS_DEFAULTS])dnl
  m4_require([_LT_CHECK_SHELL_FEATURES])dnl
@@ -10381,7 +10377,7 @@ Index: git/libtool.m4
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -632,7 +638,7 @@ m4_ifset([AC_PACKAGE_NAME], [AC_PACKAGE_
+@@ -632,7 +638,7 @@ m4_ifset([AC_PACKAGE_NAME], [AC_PACKAGE_NAME ])config.lt[]dnl
  m4_ifset([AC_PACKAGE_VERSION], [ AC_PACKAGE_VERSION])
  configured by $[0], generated by m4_PACKAGE_STRING.
  
@@ -10486,7 +10482,7 @@ Index: git/libtool.m4
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -1161,6 +1177,39 @@ _LT_DECL([], [ECHO], [1], [An echo progr
+@@ -1161,6 +1177,39 @@ _LT_DECL([], [ECHO], [1], [An echo program that protects backslashes])
  ])# _LT_PROG_ECHO_BACKSLASH
  
  
@@ -10739,7 +10735,7 @@ Index: git/libtool.m4
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -3174,7 +3336,11 @@ test -z "$deplibs_check_method" && depli
+@@ -3174,7 +3336,11 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  _LT_DECL([], [deplibs_check_method], [1],
      [Method to check whether dependent libraries are shared objects])
  _LT_DECL([], [file_magic_cmd], [1],
@@ -10867,7 +10863,7 @@ Index: git/libtool.m4
    const char *name;
    void       *address;
  }
-@@ -3510,15 +3750,15 @@ static const void *lt_preloaded_setup()
+@@ -3510,15 +3750,15 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -10901,7 +10897,7 @@ Index: git/libtool.m4
  _LT_DECL([global_symbol_pipe], [lt_cv_sys_global_symbol_pipe], [1],
      [Take the output of nm and produce a listing of raw symbols and C names])
  _LT_DECL([global_symbol_to_cdecl], [lt_cv_sys_global_symbol_to_cdecl], [1],
-@@ -3561,6 +3808,8 @@ _LT_DECL([global_symbol_to_c_name_addres
+@@ -3561,6 +3808,8 @@ _LT_DECL([global_symbol_to_c_name_address],
  _LT_DECL([global_symbol_to_c_name_address_lib_prefix],
      [lt_cv_sys_global_symbol_to_c_name_address_lib_prefix], [1],
      [Transform the output of nm in a C name address pair when lib prefix is needed])
@@ -10986,7 +10982,7 @@ Index: git/libtool.m4
  #
  # Check to make sure the static flag actually works.
  #
-@@ -4213,6 +4477,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog
+@@ -4213,6 +4477,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog_compiler_static], [1],
  m4_defun([_LT_LINKER_SHLIBS],
  [AC_REQUIRE([LT_PATH_LD])dnl
  AC_REQUIRE([LT_PATH_NM])dnl
@@ -11308,7 +11304,7 @@ Index: git/libtool.m4
  if test -n "$CXX" && ( test "X$CXX" != "Xno" &&
      ( (test "X$CXX" = "Xg++" && `g++ -v >/dev/null 2>&1` ) ||
      (test "X$CXX" != "Xg++"))) ; then
-@@ -5487,6 +5818,7 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -5487,6 +5818,7 @@ if test "$_lt_caught_CXX_error" != yes; then
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -11316,7 +11312,7 @@ Index: git/libtool.m4
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -5504,6 +5836,7 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -5504,6 +5836,7 @@ if test "$_lt_caught_CXX_error" != yes; then
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -11324,7 +11320,7 @@ Index: git/libtool.m4
    compiler=$CC
    _LT_TAGVAR(compiler, $1)=$CC
    _LT_CC_BASENAME([$compiler])
-@@ -5667,7 +6000,7 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -5667,7 +6000,7 @@ if test "$_lt_caught_CXX_error" != yes; then
            _LT_TAGVAR(allow_undefined_flag, $1)='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -11333,7 +11329,7 @@ Index: git/libtool.m4
            _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  
            _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -5679,7 +6012,7 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -5679,7 +6012,7 @@ if test "$_lt_caught_CXX_error" != yes; then
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -11342,7 +11338,7 @@ Index: git/libtool.m4
  	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
  	    # -berok will link without error, but may produce a broken library.
-@@ -5721,29 +6054,75 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -5721,29 +6054,75 @@ if test "$_lt_caught_CXX_error" != yes; then
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -11441,7 +11437,7 @@ Index: git/libtool.m4
        darwin* | rhapsody*)
          _LT_DARWIN_LINKER_FEATURES($1)
  	;;
-@@ -5818,7 +6197,7 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -5818,7 +6197,7 @@ if test "$_lt_caught_CXX_error" != yes; then
              ;;
            *)
              if test "$GXX" = yes; then
@@ -11450,7 +11446,7 @@ Index: git/libtool.m4
              else
                # FIXME: insert proper C++ library support
                _LT_TAGVAR(ld_shlibs, $1)=no
-@@ -5889,10 +6268,10 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -5889,10 +6268,10 @@ if test "$_lt_caught_CXX_error" != yes; then
  	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -11463,7 +11459,7 @@ Index: git/libtool.m4
  	            ;;
  	        esac
  	      fi
-@@ -5933,9 +6312,9 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -5933,9 +6312,9 @@ if test "$_lt_caught_CXX_error" != yes; then
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -11475,7 +11471,7 @@ Index: git/libtool.m4
  	      fi
  	    fi
  	    _LT_TAGVAR(link_all_deplibs, $1)=yes
-@@ -6005,20 +6384,20 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -6005,20 +6384,20 @@ if test "$_lt_caught_CXX_error" != yes; then
  	      _LT_TAGVAR(prelink_cmds, $1)='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -11500,7 +11496,7 @@ Index: git/libtool.m4
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -6213,7 +6592,7 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -6213,7 +6592,7 @@ if test "$_lt_caught_CXX_error" != yes; then
  	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -11509,7 +11505,7 @@ Index: git/libtool.m4
  		  ;;
  	      esac
  
-@@ -6259,7 +6638,7 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -6259,7 +6638,7 @@ if test "$_lt_caught_CXX_error" != yes; then
  
        solaris*)
          case $cc_basename in
@@ -11518,7 +11514,7 @@ Index: git/libtool.m4
  	    # Sun C++ 4.2, 5.x and Centerline C++
              _LT_TAGVAR(archive_cmds_need_lc,$1)=yes
  	    _LT_TAGVAR(no_undefined_flag, $1)=' -zdefs'
-@@ -6300,9 +6679,9 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -6300,9 +6679,9 @@ if test "$_lt_caught_CXX_error" != yes; then
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -11530,7 +11526,7 @@ Index: git/libtool.m4
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -6431,6 +6810,7 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -6431,6 +6810,7 @@ if test "$_lt_caught_CXX_error" != yes; then
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -11738,7 +11734,7 @@ Index: git/libtool.m4
  ])# _LT_LANG_RC_CONFIG
  
  
-@@ -7101,6 +7536,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object
+@@ -7101,6 +7536,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object symbol dumper])
  AC_SUBST([OBJDUMP])
  ])
  
@@ -11765,7 +11761,7 @@ Index: git/libtool.m4
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -7234,206 +7678,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn
+@@ -7234,206 +7678,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn newlines into spaces])dnl
  ])# _LT_CHECK_SHELL_FEATURES
  
  
@@ -11863,31 +11859,6 @@ Index: git/libtool.m4
 -{
 -  func_len_result=${#1}
 -}
--
--_LT_EOF
--    ;;
--  *) # Bourne compatible functions.
--    cat << \_LT_EOF >> "$cfgfile"
--
--# func_dirname file append nondir_replacement
--# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
--# otherwise set result to NONDIR_REPLACEMENT.
--func_dirname ()
--{
--  # Extract subdirectory from the argument.
--  func_dirname_result=`$ECHO "${1}" | $SED "$dirname"`
--  if test "X$func_dirname_result" = "X${1}"; then
--    func_dirname_result="${3}"
--  else
--    func_dirname_result="$func_dirname_result${2}"
--  fi
--}
--
--# func_basename file
--func_basename ()
--{
--  func_basename_result=`$ECHO "${1}" | $SED "$basename"`
--}
 +# _LT_PROG_FUNCTION_REPLACE (FUNCNAME, REPLACEMENT-BODY)
 +# ------------------------------------------------------
 +# In `$cfgfile', look for function FUNCNAME delimited by `^FUNCNAME ()$' and
@@ -11904,22 +11875,23 @@ Index: git/libtool.m4
 +test 0 -eq $? || _lt_function_replace_fail=:
 +])
  
--dnl func_dirname_and_basename
--dnl A portable version of this function is already defined in general.m4sh
--dnl so there is no need for it here.
+-_LT_EOF
+-    ;;
+-  *) # Bourne compatible functions.
+-    cat << \_LT_EOF >> "$cfgfile"
  
--# func_stripname prefix suffix name
--# strip PREFIX and SUFFIX off of NAME.
--# PREFIX and SUFFIX must not contain globbing or regex special
--# characters, hashes, percent signs, but SUFFIX may contain a leading
--# dot (in which case that matches only a dot).
--# func_strip_suffix prefix name
--func_stripname ()
+-# func_dirname file append nondir_replacement
+-# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
+-# otherwise set result to NONDIR_REPLACEMENT.
+-func_dirname ()
 -{
--  case ${2} in
--    .*) func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%\\\\${2}\$%%"`;;
--    *)  func_stripname_result=`$ECHO "${3}" | $SED "s%^${1}%%; s%${2}\$%%"`;;
--  esac
+-  # Extract subdirectory from the argument.
+-  func_dirname_result=`$ECHO "${1}" | $SED "$dirname"`
+-  if test "X$func_dirname_result" = "X${1}"; then
+-    func_dirname_result="${3}"
+-  else
+-    func_dirname_result="$func_dirname_result${2}"
+-  fi
 -}
 +# _LT_PROG_REPLACE_SHELLFNS
 +# -------------------------
@@ -11943,24 +11915,45 @@ Index: git/libtool.m4
 +    esac
 +    func_basename_result="${1##*/}"])
  
--# sed scripts:
--my_sed_long_opt='1s/^\(-[[^=]]*\)=.*/\1/;q'
--my_sed_long_arg='1s/^-[[^=]]*=//'
+-# func_basename file
+-func_basename ()
+-{
+-  func_basename_result=`$ECHO "${1}" | $SED "$basename"`
+-}
 +  _LT_PROG_FUNCTION_REPLACE([func_stripname], [dnl
 +    # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are
 +    # positional parameters, so assign one to ordinary parameter first.
 +    func_stripname_result=${3}
 +    func_stripname_result=${func_stripname_result#"${1}"}
 +    func_stripname_result=${func_stripname_result%"${2}"}])
-+
+ 
+-dnl func_dirname_and_basename
+-dnl A portable version of this function is already defined in general.m4sh
+-dnl so there is no need for it here.
 +  _LT_PROG_FUNCTION_REPLACE([func_split_long_opt], [dnl
 +    func_split_long_opt_name=${1%%=*}
 +    func_split_long_opt_arg=${1#*=}])
-+
+ 
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
 +  _LT_PROG_FUNCTION_REPLACE([func_split_short_opt], [dnl
 +    func_split_short_opt_arg=${1#??}
 +    func_split_short_opt_name=${1%"$func_split_short_opt_arg"}])
-+
+ 
+-# sed scripts:
+-my_sed_long_opt='1s/^\(-[[^=]]*\)=.*/\1/;q'
+-my_sed_long_arg='1s/^-[[^=]]*=//'
 +  _LT_PROG_FUNCTION_REPLACE([func_lo2o], [dnl
 +    case ${1} in
 +      *.lo) func_lo2o_result=${1%.lo}.${objext} ;;
@@ -12008,7 +12001,9 @@ Index: git/libtool.m4
 +    func_quote_for_eval "${2}"
 +dnl m4 expansion turns \\\\ into \\, and then the shell eval turns that into \
 +    eval "${1}+=\\\\ \\$func_quote_for_eval_result"])
-+
+ 
+-_LT_EOF
+-esac
 +  # Save a `func_append' function call where possible by direct use of '+='
 +  sed -e 's%func_append \([[a-zA-Z_]]\{1,\}\) "%\1+="%g' $cfgfile > $cfgfile.tmp \
 +    && mv -f "$cfgfile.tmp" "$cfgfile" \
@@ -12022,17 +12017,14 @@ Index: git/libtool.m4
 +  test 0 -eq $? || _lt_function_replace_fail=:
 +fi
  
--_LT_EOF
--esac
+-case $lt_shell_append in
+-  yes)
+-    cat << \_LT_EOF >> "$cfgfile"
 +if test x"$_lt_function_replace_fail" = x":"; then
 +  AC_MSG_WARN([Unable to substitute extended shell functions in $ofile])
 +fi
 +])
  
--case $lt_shell_append in
--  yes)
--    cat << \_LT_EOF >> "$cfgfile"
--
 -# func_append var value
 -# Append VALUE to the end of shell variable VAR.
 -func_append ()
@@ -12118,10 +12110,10 @@ Index: git/libtool.m4
 +_LT_DECL([to_tool_file_cmd], [lt_cv_to_tool_file_cmd],
 +         [0], [convert $build files to toolchain format])dnl
 +])# _LT_PATH_CONVERSION_FUNCTIONS
-Index: git/ltmain.sh
-===================================================================
---- git.orig/ltmain.sh
-+++ git/ltmain.sh
+diff --git a/ltmain.sh b/ltmain.sh
+index 9503ec85d7..70e856e065 100644
+--- a/ltmain.sh
++++ b/ltmain.sh
 @@ -1,10 +1,9 @@
 -# Generated from ltmain.m4sh.
  
@@ -12551,7 +12543,31 @@ Index: git/ltmain.sh
 +$progname: of $PACKAGE $VERSION and run autoconf again.
 +_LT_EOF
 +    fi
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
 +    exit $EXIT_MISMATCH
 +  fi
 +}
@@ -12581,7 +12597,9 @@ Index: git/ltmain.sh
 +  shift; set dummy --mode uninstall ${1+"$@"}; shift
 +  ;;
 +esac
-+
+ 
+-  # Parse non-mode specific arguments:
+-  while test "$#" -gt 0; do
 +
 +
 +# Option defaults:
@@ -12597,34 +12615,8 @@ Index: git/ltmain.sh
 +opt_verbose=:
 +opt_silent=false
 +opt_verbose=false
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
- 
--  # Parse non-mode specific arguments:
--  while test "$#" -gt 0; do
++
++
 +# Parse options once, thoroughly.  This comes as soon as possible in the
 +# script to make things like `--version' happen as quickly as we can.
 +{
@@ -12868,13 +12860,13 @@ Index: git/ltmain.sh
 -  fi
 -}
 -
--
--## ----------- ##
--##    Main.    ##
--## ----------- ##
 +    # Darwin sucks
 +    eval std_shrext=\"$shrext_cmds\"
  
+-## ----------- ##
+-##    Main.    ##
+-## ----------- ##
+-
 -$opt_help || {
 -  # Sanity checks first:
 -  func_check_version_match
@@ -13595,7 +13587,7 @@ Index: git/ltmain.sh
        "")
          # Generic help is extracted from the usage comments
          # at the start of this file.
-@@ -1659,8 +2327,8 @@ This mode accepts the following addition
+@@ -1659,8 +2327,8 @@ This mode accepts the following additional options:
  
    -o OUTPUT-FILE    set the output file name to OUTPUT-FILE
    -no-suppress      do not suppress compiler output for multiple passes
@@ -13606,7 +13598,7 @@ Index: git/ltmain.sh
    -shared           do not build a \`.o' file suitable for static linking
    -static           only build a \`.o' file suitable for static linking
    -Wc,FLAG          pass FLAG directly to the compiler
-@@ -1804,7 +2472,7 @@ Otherwise, only FILE itself is deleted u
+@@ -1804,7 +2472,7 @@ Otherwise, only FILE itself is deleted using RM."
          ;;
  
        *)
@@ -13708,7 +13700,7 @@ Index: git/ltmain.sh
 +    do
 +      if test -d "$opt"; then
 +	func_append libdirs " $opt"
-+
+ 
 +      elif test -f "$opt"; then
 +	if func_lalib_unsafe_p "$opt"; then
 +	  func_append libs " $opt"
@@ -13728,7 +13720,7 @@ Index: git/ltmain.sh
 +      else
 +        sysroot_cmd=
 +      fi
- 
++
 +      # Remove sysroot references
 +      if $opt_dry_run; then
 +        for lib in $libs; do
@@ -14140,7 +14132,7 @@ Index: git/ltmain.sh
  lt_${my_prefix}_LTX_preloaded_symbols[] =
  {\
    { \"$my_originator\", (void *) 0 },"
-@@ -2736,7 +3493,7 @@ static const void *lt_preloaded_setup()
+@@ -2736,7 +3493,7 @@ static const void *lt_preloaded_setup() {
  	for arg in $LTCFLAGS; do
  	  case $arg in
  	  -pie | -fpie | -fPIE) ;;
@@ -14669,7 +14661,7 @@ Index: git/ltmain.sh
  */
  EOF
  	    cat <<"EOF"
-@@ -3462,22 +4272,13 @@ int setenv (const char *, const char *,
+@@ -3462,22 +4272,13 @@ int setenv (const char *, const char *, int);
    if (stale) { free ((void *) stale); stale = 0; } \
  } while (0)
  
@@ -14696,7 +14688,7 @@ Index: git/ltmain.sh
  
  void *xmalloc (size_t num);
  char *xstrdup (const char *string);
-@@ -3487,7 +4288,10 @@ char *chase_symlinks (const char *pathsp
+@@ -3487,7 +4288,10 @@ char *chase_symlinks (const char *pathspec);
  int make_executable (const char *path);
  int check_executable (const char *path);
  char *strendzap (char *str, const char *pat);
@@ -15024,7 +15016,7 @@ Index: git/ltmain.sh
    vfprintf (stderr, message, ap);
    fprintf (stderr, ".\n");
  
-@@ -3988,20 +4832,32 @@ lt_error_core (int exit_status, const ch
+@@ -3988,20 +4832,32 @@ lt_error_core (int exit_status, const char *mode,
  }
  
  void
@@ -15062,7 +15054,7 @@ Index: git/ltmain.sh
    {
  #ifdef HAVE_SETENV
      /* always make a copy, for consistency with !HAVE_SETENV */
-@@ -4049,9 +4905,9 @@ lt_extend_str (const char *orig_value, c
+@@ -4049,9 +4905,9 @@ lt_extend_str (const char *orig_value, const char *add, int to_end)
  void
  lt_update_exe_path (const char *name, const char *value)
  {
@@ -15075,7 +15067,7 @@ Index: git/ltmain.sh
  
    if (name && *name && value && *value)
      {
-@@ -4070,9 +4926,9 @@ lt_update_exe_path (const char *name, co
+@@ -4070,9 +4926,9 @@ lt_update_exe_path (const char *name, const char *value)
  void
  lt_update_lib_path (const char *name, const char *value)
  {
@@ -17348,10 +17340,10 @@ Index: git/ltmain.sh
  
  if test -n "$exec_cmd"; then
    eval exec "$exec_cmd"
-Index: git/ltoptions.m4
-===================================================================
---- git.orig/ltoptions.m4
-+++ git/ltoptions.m4
+diff --git a/ltoptions.m4 b/ltoptions.m4
+index 5ef12ced2a..17cfd51c0b 100644
+--- a/ltoptions.m4
++++ b/ltoptions.m4
 @@ -8,7 +8,7 @@
  # unlimited permission to copy and/or distribute it, with or without
  # modifications, as long as this notice is preserved.
@@ -17361,10 +17353,10 @@ Index: git/ltoptions.m4
  
  # This is to help aclocal find these macros, as it can't see m4_define.
  AC_DEFUN([LTOPTIONS_VERSION], [m4_if([1])])
-Index: git/ltversion.m4
-===================================================================
---- git.orig/ltversion.m4
-+++ git/ltversion.m4
+diff --git a/ltversion.m4 b/ltversion.m4
+index bf87f77132..9c7b5d4118 100644
+--- a/ltversion.m4
++++ b/ltversion.m4
 @@ -7,17 +7,17 @@
  # unlimited permission to copy and/or distribute it, with or without
  # modifications, as long as this notice is preserved.
@@ -17389,10 +17381,10 @@ Index: git/ltversion.m4
  _LT_DECL(, macro_version, 0, [Which release of libtool.m4 was used?])
  _LT_DECL(, macro_revision, 0)
  ])
-Index: git/lt~obsolete.m4
-===================================================================
---- git.orig/lt~obsolete.m4
-+++ git/lt~obsolete.m4
+diff --git a/lt~obsolete.m4 b/lt~obsolete.m4
+index bf92b5e079..c573da90c5 100644
+--- a/lt~obsolete.m4
++++ b/lt~obsolete.m4
 @@ -7,7 +7,7 @@
  # unlimited permission to copy and/or distribute it, with or without
  # modifications, as long as this notice is preserved.
@@ -17402,11 +17394,11 @@ Index: git/lt~obsolete.m4
  
  # These exist entirely to fool aclocal when bootstrapping libtool.
  #
-Index: git/opcodes/configure
-===================================================================
---- git.orig/opcodes/configure
-+++ git/opcodes/configure
-@@ -681,6 +681,9 @@ OTOOL
+diff --git a/opcodes/configure b/opcodes/configure
+index 853849ee58..5f74ecf7da 100755
+--- a/opcodes/configure
++++ b/opcodes/configure
+@@ -680,6 +680,9 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -17416,7 +17408,7 @@ Index: git/opcodes/configure
  OBJDUMP
  LN_S
  NM
-@@ -799,6 +802,7 @@ enable_static
+@@ -798,6 +801,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -17424,7 +17416,7 @@ Index: git/opcodes/configure
  enable_libtool_lock
  enable_targets
  enable_werror
-@@ -1463,6 +1467,8 @@ Optional Packages:
+@@ -1462,6 +1466,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -17433,7 +17425,7 @@ Index: git/opcodes/configure
  
  Some influential environment variables:
    CC          C compiler command
-@@ -5404,8 +5410,8 @@ esac
+@@ -5403,8 +5409,8 @@ esac
  
  
  
@@ -17444,7 +17436,7 @@ Index: git/opcodes/configure
  
  
  
-@@ -5445,7 +5451,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5444,7 +5450,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -17453,7 +17445,7 @@ Index: git/opcodes/configure
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6131,8 +6137,8 @@ $as_echo_n "checking whether the shell u
+@@ -6130,8 +6136,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -17464,7 +17456,7 @@ Index: git/opcodes/configure
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6181,6 +6187,80 @@ esac
+@@ -6180,6 +6186,80 @@ esac
  
  
  
@@ -17545,7 +17537,7 @@ Index: git/opcodes/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6197,6 +6277,11 @@ case $reload_flag in
+@@ -6196,6 +6276,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -17557,7 +17549,7 @@ Index: git/opcodes/configure
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6365,7 +6450,8 @@ mingw* | pw32*)
+@@ -6364,7 +6449,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -17567,7 +17559,7 @@ Index: git/opcodes/configure
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6519,6 +6605,21 @@ esac
+@@ -6518,6 +6604,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -17589,7 +17581,7 @@ Index: git/opcodes/configure
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6534,9 +6635,162 @@ test -z "$deplibs_check_method" && depli
+@@ -6531,11 +6632,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -17603,6 +17595,8 @@ Index: git/opcodes/configure
 +
 +
 +
+ 
+ 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -17754,7 +17748,7 @@ Index: git/opcodes/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6552,7 +6806,7 @@ do
+@@ -6551,7 +6805,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -17763,7 +17757,7 @@ Index: git/opcodes/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6572,11 +6826,15 @@ $as_echo "no" >&6; }
+@@ -6571,11 +6825,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -17782,7 +17776,7 @@ Index: git/opcodes/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6592,7 +6850,7 @@ do
+@@ -6591,7 +6849,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -17791,7 +17785,7 @@ Index: git/opcodes/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6611,6 +6869,10 @@ else
+@@ -6610,6 +6868,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -17802,7 +17796,7 @@ Index: git/opcodes/configure
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6622,12 +6884,11 @@ ac_tool_warned=yes ;;
+@@ -6621,16 +6883,72 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -17815,13 +17809,16 @@ Index: git/opcodes/configure
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
 +
- 
- 
- 
-@@ -6638,6 +6899,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
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
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
 +if ${lt_cv_ar_at_file+:} false; then :
@@ -17834,7 +17831,7 @@ Index: git/opcodes/configure
 +int
 +main ()
 +{
-+
+ 
 +  ;
 +  return 0;
 +}
@@ -17860,29 +17857,23 @@ Index: git/opcodes/configure
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
  
- if test -n "$ac_tool_prefix"; then
-   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
-@@ -6973,8 +7291,8 @@ esac
+ 
+ 
+@@ -6972,8 +7290,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -17893,7 +17884,7 @@ Index: git/opcodes/configure
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7010,6 +7328,7 @@ for ac_symprfx in "" "_"; do
+@@ -7009,6 +7327,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -17901,7 +17892,7 @@ Index: git/opcodes/configure
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7051,6 +7370,18 @@ _LT_EOF
+@@ -7050,6 +7369,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -17920,7 +17911,7 @@ Index: git/opcodes/configure
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7062,7 +7393,7 @@ _LT_EOF
+@@ -7061,7 +7392,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -17929,7 +17920,7 @@ Index: git/opcodes/configure
    const char *name;
    void       *address;
  }
-@@ -7088,8 +7419,8 @@ static const void *lt_preloaded_setup()
+@@ -7087,8 +7418,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -17940,7 +17931,7 @@ Index: git/opcodes/configure
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7099,8 +7430,8 @@ _LT_EOF
+@@ -7098,8 +7429,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -17951,7 +17942,7 @@ Index: git/opcodes/configure
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7137,6 +7468,14 @@ else
+@@ -7136,6 +7467,16 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -17963,13 +17954,18 @@ Index: git/opcodes/configure
 +fi
 +
 +
++
++
  
  
  
-@@ -7158,6 +7497,47 @@ fi
+@@ -7152,6 +7493,45 @@ fi
  
  
  
++
++
++
 +
 +
 +
@@ -18006,15 +18002,10 @@ Index: git/opcodes/configure
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
-@@ -7364,6 +7744,123 @@ esac
+ 
+ 
+ 
+@@ -7363,6 +7743,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -18138,7 +18129,7 @@ Index: git/opcodes/configure
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7927,6 +8424,8 @@ _LT_EOF
+@@ -7926,6 +8423,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -18147,7 +18138,7 @@ Index: git/opcodes/configure
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8092,7 +8591,8 @@ fi
+@@ -8091,7 +8590,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -18157,7 +18148,7 @@ Index: git/opcodes/configure
  
  
  
-@@ -8181,7 +8681,7 @@ aix3*)
+@@ -8180,7 +8680,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -18166,7 +18157,7 @@ Index: git/opcodes/configure
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8479,8 +8979,6 @@ fi
+@@ -8478,8 +8978,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -18175,7 +18166,7 @@ Index: git/opcodes/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8646,6 +9144,12 @@ $as_echo_n "checking for $compiler optio
+@@ -8645,6 +9143,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -18188,7 +18179,7 @@ Index: git/opcodes/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8708,7 +9212,7 @@ $as_echo_n "checking for $compiler optio
+@@ -8707,7 +9211,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -18197,7 +18188,7 @@ Index: git/opcodes/configure
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8765,13 +9269,17 @@ case $host_os in
+@@ -8764,13 +9268,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -18221,7 +18212,7 @@ Index: git/opcodes/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8832,6 +9340,11 @@ fi
+@@ -8831,6 +9339,11 @@ fi
  
  
  
@@ -18233,7 +18224,7 @@ Index: git/opcodes/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9182,7 +9695,8 @@ _LT_EOF
+@@ -9181,7 +9694,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -18243,7 +18234,7 @@ Index: git/opcodes/configure
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9281,12 +9795,12 @@ _LT_EOF
+@@ -9280,12 +9794,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -18258,7 +18249,7 @@ Index: git/opcodes/configure
  	  fi
  	  ;;
  	esac
-@@ -9300,8 +9814,8 @@ _LT_EOF
+@@ -9299,8 +9813,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -18269,7 +18260,7 @@ Index: git/opcodes/configure
        fi
        ;;
  
-@@ -9319,8 +9833,8 @@ _LT_EOF
+@@ -9318,8 +9832,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -18280,7 +18271,7 @@ Index: git/opcodes/configure
        else
  	ld_shlibs=no
        fi
-@@ -9366,8 +9880,8 @@ _LT_EOF
+@@ -9365,8 +9879,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -18291,7 +18282,7 @@ Index: git/opcodes/configure
        else
  	ld_shlibs=no
        fi
-@@ -9497,7 +10011,13 @@ _LT_EOF
+@@ -9496,7 +10010,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -18306,7 +18297,7 @@ Index: git/opcodes/configure
  /* end confdefs.h.  */
  
  int
-@@ -9510,22 +10030,29 @@ main ()
+@@ -9509,22 +10029,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -18349,7 +18340,7 @@ Index: git/opcodes/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9537,7 +10064,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9536,7 +10063,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -18364,7 +18355,7 @@ Index: git/opcodes/configure
  /* end confdefs.h.  */
  
  int
-@@ -9550,22 +10083,29 @@ main ()
+@@ -9549,22 +10082,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -18407,7 +18398,7 @@ Index: git/opcodes/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9610,20 +10150,63 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9609,20 +10149,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -18485,7 +18476,7 @@ Index: git/opcodes/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9684,7 +10267,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9683,7 +10266,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -18494,7 +18485,7 @@ Index: git/opcodes/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9692,7 +10275,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9691,7 +10274,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -18503,7 +18494,7 @@ Index: git/opcodes/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9708,7 +10291,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9707,7 +10290,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -18512,7 +18503,7 @@ Index: git/opcodes/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9732,10 +10315,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9731,10 +10314,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -18525,7 +18516,7 @@ Index: git/opcodes/configure
  	  ;;
  	esac
        else
-@@ -9814,23 +10397,36 @@ fi
+@@ -9813,23 +10396,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -18570,7 +18561,7 @@ Index: git/opcodes/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9915,7 +10511,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9914,7 +10510,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -18579,7 +18570,7 @@ Index: git/opcodes/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9934,9 +10530,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9933,9 +10529,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -18591,7 +18582,7 @@ Index: git/opcodes/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10512,8 +11108,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10511,8 +11107,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -18603,7 +18594,7 @@ Index: git/opcodes/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10546,13 +11143,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10545,13 +11142,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -18676,7 +18667,7 @@ Index: git/opcodes/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10644,7 +11299,7 @@ haiku*)
+@@ -10643,7 +11298,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -18685,16 +18676,16 @@ Index: git/opcodes/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11440,7 +12095,7 @@ else
+@@ -11439,7 +12094,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11443 "configure"
+-#line 11442 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11484,10 +12139,10 @@ else
+@@ -11483,10 +12138,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -18707,16 +18698,16 @@ Index: git/opcodes/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11546,7 +12201,7 @@ else
+@@ -11545,7 +12200,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11549 "configure"
+-#line 11548 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11590,10 +12245,10 @@ else
+@@ -11589,10 +12244,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -18729,7 +18720,7 @@ Index: git/opcodes/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12831,7 +13486,7 @@ if test "$enable_shared" = "yes"; then
+@@ -12779,7 +13434,7 @@ if test "$enable_shared" = "yes"; then
  # since libbfd may not pull in the entirety of libiberty.
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -18738,7 +18729,7 @@ Index: git/opcodes/configure
    fi
  
    case "${host}" in
-@@ -13807,13 +14462,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -13756,13 +14411,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -18759,7 +18750,7 @@ Index: git/opcodes/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13828,14 +14490,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -13777,14 +14439,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -18778,7 +18769,7 @@ Index: git/opcodes/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13868,12 +14533,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -13817,12 +14482,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -18792,7 +18783,7 @@ Index: git/opcodes/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -13928,8 +14593,13 @@ reload_flag \
+@@ -13877,8 +14542,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -18806,7 +18797,7 @@ Index: git/opcodes/configure
  STRIP \
  RANLIB \
  CC \
-@@ -13939,12 +14609,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -13888,12 +14558,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -18822,7 +18813,7 @@ Index: git/opcodes/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -13960,7 +14632,6 @@ no_undefined_flag \
+@@ -13909,7 +14581,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -18830,7 +18821,7 @@ Index: git/opcodes/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13996,6 +14667,7 @@ module_cmds \
+@@ -13945,6 +14616,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -18838,7 +18829,7 @@ Index: git/opcodes/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -14761,7 +15433,8 @@ $as_echo X"$file" |
+@@ -14710,7 +15382,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -18848,7 +18839,7 @@ Index: git/opcodes/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -14864,19 +15537,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -14813,19 +15486,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -18892,7 +18883,7 @@ Index: git/opcodes/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14906,6 +15602,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -14855,6 +15551,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -18905,7 +18896,7 @@ Index: git/opcodes/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -14915,6 +15617,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -14864,6 +15566,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -18915,7 +18906,7 @@ Index: git/opcodes/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -15029,12 +15734,12 @@ with_gcc=$GCC
+@@ -14978,12 +15683,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -18931,7 +18922,7 @@ Index: git/opcodes/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -15121,9 +15826,6 @@ inherit_rpath=$inherit_rpath
+@@ -15070,9 +15775,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -18941,7 +18932,7 @@ Index: git/opcodes/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -15139,6 +15841,9 @@ include_expsyms=$lt_include_expsyms
+@@ -15088,6 +15790,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -18951,7 +18942,7 @@ Index: git/opcodes/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -15171,210 +15876,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -15120,210 +15825,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -19153,9 +19144,15 @@ Index: git/opcodes/configure
 -_LT_EOF
 -    ;;
 -  esac
+-
+-
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+-
+-  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
- 
++
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -19313,20 +19310,17 @@ Index: git/opcodes/configure
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
- 
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
- 
--  mv -f "$cfgfile" "$ofile" ||
++
++
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: git/opcodes/configure.ac
-===================================================================
---- git.orig/opcodes/configure.ac
-+++ git/opcodes/configure.ac
-@@ -166,7 +166,7 @@ changequote(,)dnl
+diff --git a/opcodes/configure.ac b/opcodes/configure.ac
+index 4eb19005e8..19a57608b9 100644
+--- a/opcodes/configure.ac
++++ b/opcodes/configure.ac
+@@ -170,7 +170,7 @@ changequote(,)dnl
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
  changequote([,])dnl
    if test -n "$x"; then
@@ -19335,10 +19329,10 @@ Index: git/opcodes/configure.ac
    fi
  
    case "${host}" in
-Index: git/zlib/configure
-===================================================================
---- git.orig/zlib/configure
-+++ git/zlib/configure
+diff --git a/zlib/configure b/zlib/configure
+index 041cbdbf71..19d605fc85 100755
+--- a/zlib/configure
++++ b/zlib/configure
 @@ -646,8 +646,11 @@ OTOOL
  LIPO
  NMEDIT
@@ -19388,7 +19382,7 @@ Index: git/zlib/configure
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5004,8 +5010,8 @@ $as_echo_n "checking whether the shell u
+@@ -5004,8 +5010,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -19524,7 +19518,7 @@ Index: git/zlib/configure
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5407,9 +5508,163 @@ test -z "$deplibs_check_method" && depli
+@@ -5405,11 +5506,165 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -19538,6 +19532,8 @@ Index: git/zlib/configure
 +
 +
 +
+ 
+ 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -19738,7 +19734,7 @@ Index: git/zlib/configure
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -5495,12 +5758,10 @@ ac_tool_warned=yes ;;
+@@ -5495,16 +5758,72 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -19750,13 +19746,17 @@ Index: git/zlib/configure
 -test -z "$AR_FLAGS" && AR_FLAGS=cru
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
- 
- 
- 
-@@ -5512,6 +5773,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
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
 +if ${lt_cv_ar_at_file+:} false; then :
@@ -19769,7 +19769,7 @@ Index: git/zlib/configure
 +int
 +main ()
 +{
-+
+ 
 +  ;
 +  return 0;
 +}
@@ -19795,29 +19795,22 @@ Index: git/zlib/configure
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
+ 
+ 
+ 
 @@ -5846,8 +6165,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
@@ -19865,7 +19858,7 @@ Index: git/zlib/configure
    const char *name;
    void       *address;
  }
-@@ -5961,8 +6293,8 @@ static const void *lt_preloaded_setup()
+@@ -5961,8 +6293,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -19887,7 +19880,7 @@ Index: git/zlib/configure
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6010,6 +6342,18 @@ else
+@@ -6010,6 +6342,19 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -19903,13 +19896,17 @@ Index: git/zlib/configure
 +
 +
 +
++
  
  
  
-@@ -6031,6 +6375,42 @@ fi
+@@ -6027,6 +6372,41 @@ fi
  
  
  
++
++
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -19942,13 +19939,9 @@ Index: git/zlib/configure
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
-+
-+
-+
-+
  
- # Check whether --enable-libtool-lock was given.
- if test "${enable_libtool_lock+set}" = set; then :
+ 
+ 
 @@ -6241,6 +6621,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -20110,7 +20103,7 @@ Index: git/zlib/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -7823,6 +8321,12 @@ $as_echo_n "checking for $compiler optio
+@@ -7823,6 +8321,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -20123,7 +20116,7 @@ Index: git/zlib/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -7885,7 +8389,7 @@ $as_echo_n "checking for $compiler optio
+@@ -7885,7 +8389,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -20284,7 +20277,7 @@ Index: git/zlib/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -8717,7 +9244,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -8717,7 +9244,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -20342,7 +20335,7 @@ Index: git/zlib/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -8793,20 +9333,63 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -8793,20 +9333,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -20420,7 +20413,7 @@ Index: git/zlib/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -8867,7 +9450,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -8867,7 +9450,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -20429,7 +20422,7 @@ Index: git/zlib/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -8875,7 +9458,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -8875,7 +9458,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -20438,7 +20431,7 @@ Index: git/zlib/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -8891,7 +9474,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -8891,7 +9474,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -20447,7 +20440,7 @@ Index: git/zlib/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -8915,10 +9498,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -8915,10 +9498,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -20508,7 +20501,7 @@ Index: git/zlib/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9101,7 +9697,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9101,7 +9697,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -20517,7 +20510,7 @@ Index: git/zlib/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9120,9 +9716,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9120,9 +9716,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -20667,7 +20660,7 @@ Index: git/zlib/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12266,13 +12921,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -12267,13 +12922,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -20688,7 +20681,7 @@ Index: git/zlib/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -12287,14 +12949,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -12288,14 +12950,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -20707,7 +20700,7 @@ Index: git/zlib/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -12327,12 +12992,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -12328,12 +12993,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -20721,7 +20714,7 @@ Index: git/zlib/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -12387,8 +13052,13 @@ reload_flag \
+@@ -12388,8 +13053,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -20735,7 +20728,7 @@ Index: git/zlib/configure
  STRIP \
  RANLIB \
  CC \
-@@ -12398,12 +13068,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -12399,12 +13069,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -20751,7 +20744,7 @@ Index: git/zlib/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -12419,7 +13091,6 @@ no_undefined_flag \
+@@ -12420,7 +13092,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -20759,7 +20752,7 @@ Index: git/zlib/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -12455,6 +13126,7 @@ module_cmds \
+@@ -12456,6 +13127,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -20767,7 +20760,7 @@ Index: git/zlib/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -13053,7 +13725,8 @@ $as_echo X"$file" |
+@@ -13054,7 +13726,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -20777,7 +20770,7 @@ Index: git/zlib/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -13156,19 +13829,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -13157,19 +13830,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -20821,7 +20814,7 @@ Index: git/zlib/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -13198,6 +13894,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -13199,6 +13895,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -20834,7 +20827,7 @@ Index: git/zlib/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -13207,6 +13909,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -13208,6 +13910,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -20844,7 +20837,7 @@ Index: git/zlib/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -13321,12 +14026,12 @@ with_gcc=$GCC
+@@ -13322,12 +14027,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -20860,7 +20853,7 @@ Index: git/zlib/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -13413,9 +14118,6 @@ inherit_rpath=$inherit_rpath
+@@ -13414,9 +14119,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -20870,7 +20863,7 @@ Index: git/zlib/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -13431,6 +14133,9 @@ include_expsyms=$lt_include_expsyms
+@@ -13432,6 +14134,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -20880,7 +20873,7 @@ Index: git/zlib/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -13463,210 +14168,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -13464,210 +14169,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -21082,9 +21075,15 @@ Index: git/zlib/configure
 -_LT_EOF
 -    ;;
 -  esac
+-
+-
+-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
+-    || (rm -f "$cfgfile"; exit 1)
+-
+-  mv -f "$cfgfile" "$ofile" ||
 +  sed '$q' "$ltmain" >> "$cfgfile" \
 +     || (rm -f "$cfgfile"; exit 1)
- 
++
 +  if test x"$xsi_shell" = xyes; then
 +  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
 +func_dirname ()\
@@ -21242,12 +21241,12 @@ Index: git/zlib/configure
 +  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitute extended shell functions in $ofile" >&5
 +$as_echo "$as_me: WARNING: Unable to substitute extended shell functions in $ofile" >&2;}
 +fi
- 
--  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >> "$cfgfile" \
--    || (rm -f "$cfgfile"; exit 1)
- 
--  mv -f "$cfgfile" "$ofile" ||
++
++
 +   mv -f "$cfgfile" "$ofile" ||
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch b/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
deleted file mode 100644
index 18ef6bb7ff..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ef50d848d983f81e4a86dd3eef4933e3579336f1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Mar 2015 01:37:10 +0000
-Subject: [PATCH 07/15] Add the armv5e architecture to binutils
-
-Binutils has a comment that indicates it is supposed to match gcc for
-all of the support "-march=" settings, but it was lacking the armv5e setting.
-This was a simple way to add it, as thumb instructions shouldn't be generated
-by the compiler anyway.
-
-Upstream-Status: Denied
-Upstream maintainer indicated that we should not be using armv5e, even
-though it is a legal archicture defined by our gcc.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gas/config/tc-arm.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gas/config/tc-arm.c b/gas/config/tc-arm.c
-index 3f5384e1c7..8d5bc145af 100644
---- a/gas/config/tc-arm.c
-+++ b/gas/config/tc-arm.c
-@@ -26294,6 +26294,7 @@ static const struct arm_arch_option_table arm_archs[] =
-   ARM_ARCH_OPT ("armv4t",	ARM_ARCH_V4T,	 FPU_ARCH_FPA),
-   ARM_ARCH_OPT ("armv4txm",	ARM_ARCH_V4TxM,	 FPU_ARCH_FPA),
-   ARM_ARCH_OPT ("armv5",	ARM_ARCH_V5,	 FPU_ARCH_VFP),
-+  ARM_ARCH_OPT ("armv5e",	ARM_ARCH_V5TE,	 FPU_ARCH_VFP),
-   ARM_ARCH_OPT ("armv5t",	ARM_ARCH_V5T,	 FPU_ARCH_VFP),
-   ARM_ARCH_OPT ("armv5txm",	ARM_ARCH_V5TxM,	 FPU_ARCH_VFP),
-   ARM_ARCH_OPT ("armv5te",	ARM_ARCH_V5TE,	 FPU_ARCH_VFP),
--- 
-2.18.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
similarity index 85%
rename from meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
rename to meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
index 6999ed9c94..a2c6312d0a 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
+++ b/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
@@ -1,7 +1,7 @@
-From ca25d55cef8398bad508c2b2be29aea5aa3c4d26 Mon Sep 17 00:00:00 2001
+From 8cb013106c379e81fe40cfdf486d9805c9e276ad Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:39:01 +0000
-Subject: [PATCH 08/15] don't let the distro compiler point to the wrong
+Subject: [PATCH 07/15] don't let the distro compiler point to the wrong
  installation location
 
 Thanks to RP for helping find the source code causing the issue.
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
-index ed1b334c36..d4ffd8b57b 100644
+index 0be45b4ae8..4817616bb2 100644
 --- a/libiberty/Makefile.in
 +++ b/libiberty/Makefile.in
 @@ -364,7 +364,8 @@ install-strip: install
@@ -31,5 +31,5 @@ index ed1b334c36..d4ffd8b57b 100644
  	if test -n "${target_header_dir}"; then \
  		${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
 -- 
-2.18.0
+2.20.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
similarity index 94%
rename from meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
rename to meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
index 9a9e319621..9727821b1f 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -1,7 +1,7 @@
-From a3667059fc0d52d890b505bed0e5050ea3d7002e Mon Sep 17 00:00:00 2001
+From 98f68c0892ba4bbd53b0a0a4cbbdf0b7197e0320 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Jan 2016 06:31:09 +0000
-Subject: [PATCH 09/15] warn for uses of system directories when cross linking
+Subject: [PATCH 08/15] warn for uses of system directories when cross linking
 
 2008-07-02  Joseph Myers  <joseph@codesourcery.com>
 
@@ -77,7 +77,7 @@ index d93c9b0830..5da2742bea 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index 2b291f0da8..facc386563 100755
+index 43c391c2b3..ff9f6b3c02 100755
 --- a/ld/configure
 +++ b/ld/configure
 @@ -826,6 +826,7 @@ with_lib_path
@@ -118,7 +118,7 @@ index 2b291f0da8..facc386563 100755
  if test "${enable_gold+set}" = set; then :
    enableval=$enable_gold; case "${enableval}" in
 diff --git a/ld/configure.ac b/ld/configure.ac
-index d10c553650..9f1b57b120 100644
+index d335f21091..7f692d9387 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
 @@ -94,6 +94,16 @@ AC_SUBST(use_sysroot)
@@ -139,7 +139,7 @@ index d10c553650..9f1b57b120 100644
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
 diff --git a/ld/ld.h b/ld/ld.h
-index ba914b921e..9df17dab6c 100644
+index b97d977f37..f3bbd2d55d 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
 @@ -180,6 +180,14 @@ typedef struct
@@ -158,10 +158,10 @@ index ba914b921e..9df17dab6c 100644
    enum endian_enum endian;
  
 diff --git a/ld/ld.texi b/ld/ld.texi
-index b9fe2324da..43486605e0 100644
+index 5179af3e0e..f78bf74682 100644
 --- a/ld/ld.texi
 +++ b/ld/ld.texi
-@@ -2479,6 +2479,18 @@ string identifying the original linked file does not change.
+@@ -2524,6 +2524,18 @@ string identifying the original linked file does not change.
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
@@ -181,7 +181,7 @@ index b9fe2324da..43486605e0 100644
  
  @c man end
 diff --git a/ld/ldfile.c b/ld/ldfile.c
-index a72ff13526..dc5148f748 100644
+index fcadc08c73..63e295ce8a 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
 @@ -116,6 +116,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
@@ -209,7 +209,7 @@ index a72ff13526..dc5148f748 100644
  
  /* Try to open a BFD for a lang_input_statement.  */
 diff --git a/ld/ldlex.h b/ld/ldlex.h
-index 04d6fd5f96..d7df005bb2 100644
+index 32853debe4..8135361c49 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
 @@ -148,6 +148,8 @@ enum option_values
@@ -222,10 +222,10 @@ index 04d6fd5f96..d7df005bb2 100644
  
  /* The initial parser states.  */
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index f31eeb29c3..25f8497888 100644
+index 77cdbd0dd2..725512f126 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -268,6 +268,8 @@ main (int argc, char **argv)
+@@ -269,6 +269,8 @@ main (int argc, char **argv)
    command_line.warn_mismatch = TRUE;
    command_line.warn_search_mismatch = TRUE;
    command_line.check_section_addresses = -1;
@@ -235,7 +235,7 @@ index f31eeb29c3..25f8497888 100644
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 86a033a383..4a40d48020 100644
+index 88e85c73f4..eed1b71456 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
 @@ -543,6 +543,14 @@ static const struct ld_option ld_options[] =
@@ -269,5 +269,5 @@ index 86a033a383..4a40d48020 100644
      }
  
 -- 
-2.18.0
+2.20.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
similarity index 92%
rename from meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
rename to meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
index 8fc00ff456..b6b1e7a672 100644
--- a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
@@ -1,7 +1,7 @@
-From 9e1d8f9a657a8bd48048c2ea6407cf60b723bd68 Mon Sep 17 00:00:00 2001
+From 2cd5613a86f8772f9d7f188532718363668ed99d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:42:38 +0000
-Subject: [PATCH 10/15] Fix rpath in libtool when sysroot is enabled
+Subject: [PATCH 09/15] Fix rpath in libtool when sysroot is enabled
 
 Enabling sysroot support in libtool exposed a bug where the final
 library had an RPATH encoded into it which still pointed to the
@@ -48,5 +48,5 @@ index 70e856e065..11ee684ccc 100644
  	    if test -z "$hardcode_libdirs"; then
  	      hardcode_libdirs="$libdir"
 -- 
-2.18.0
+2.20.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch
similarity index 88%
rename from meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
rename to meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch
index 2e93b129dd..ba5e4c2ce5 100644
--- a/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
+++ b/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch
@@ -1,7 +1,7 @@
-From 2d2e2fcdd9646849716ee99d8d3e5d72ae8889bc Mon Sep 17 00:00:00 2001
+From d540e95d05cd7c4b8924ac7b257c14ae0105d0ab Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:44:14 +0000
-Subject: [PATCH 11/15] Change default emulation for mips64*-*-linux
+Subject: [PATCH 10/15] Change default emulation for mips64*-*-linux
 
 we change the default emulations to be N64 instead of N32
 
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/bfd/config.bfd b/bfd/config.bfd
-index 6391f35684..8a11c0680a 100644
+index 0e1ddb659c..cc65547588 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -913,12 +913,12 @@ case "${targ}" in
+@@ -919,12 +919,12 @@ case "${targ}" in
      targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec mips_ecoff_be_vec mips_ecoff_le_vec"
      ;;
    mips64*el-*-linux*)
@@ -35,10 +35,10 @@ index 6391f35684..8a11c0680a 100644
    mips*el-*-linux*)
      targ_defvec=mips_elf32_trad_le_vec
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index fad8b2e5c8..7fb2168503 100644
+index beba17ef51..917be6f8eb 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -464,11 +464,11 @@ mips*el-*-vxworks*)	targ_emul=elf32elmipvxworks
+@@ -468,11 +468,11 @@ mips*el-*-vxworks*)	targ_emul=elf32elmipvxworks
  mips*-*-vxworks*)	targ_emul=elf32ebmipvxworks
  			targ_extra_emuls="elf32elmipvxworks" ;;
  mips*-*-windiss)	targ_emul=elf32mipswindiss ;;
@@ -55,5 +55,5 @@ index fad8b2e5c8..7fb2168503 100644
  mips*el-*-linux-*)	targ_emul=elf32ltsmip
  			targ_extra_emuls="elf32btsmip elf32ltsmipn32 elf64ltsmip elf32btsmipn32 elf64btsmip"
 -- 
-2.18.0
+2.20.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch b/meta/recipes-devtools/binutils/binutils/0011-Add-support-for-Netlogic-XLP.patch
similarity index 86%
rename from meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
rename to meta/recipes-devtools/binutils/binutils/0011-Add-support-for-Netlogic-XLP.patch
index 4d64bd53f8..20c5ed6308 100644
--- a/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
+++ b/meta/recipes-devtools/binutils/binutils/0011-Add-support-for-Netlogic-XLP.patch
@@ -1,7 +1,7 @@
-From 96ff7570c29f792c466a933529fefda9b8e97994 Mon Sep 17 00:00:00 2001
+From e4a0cd30c7e9334ed507c93014a8b2d1315ff937 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:06:19 +0000
-Subject: [PATCH 12/15] Add support for Netlogic XLP
+Subject: [PATCH 11/15] Add support for Netlogic XLP
 
 Patch From: Nebu Philips <nphilips@netlogicmicro.com>
 
@@ -34,10 +34,10 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  14 files changed, 61 insertions(+), 21 deletions(-)
 
 diff --git a/bfd/aoutx.h b/bfd/aoutx.h
-index 023843b0be..46246fec2d 100644
+index e5d8dcf390..2cc74a2d61 100644
 --- a/bfd/aoutx.h
 +++ b/bfd/aoutx.h
-@@ -798,6 +798,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,
+@@ -799,6 +799,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,
  	case bfd_mach_mipsisa64r6:
  	case bfd_mach_mips_sb1:
  	case bfd_mach_mips_xlr:
@@ -46,10 +46,10 @@ index 023843b0be..46246fec2d 100644
  	  arch_flags = M_MIPS2;
  	  break;
 diff --git a/bfd/archures.c b/bfd/archures.c
-index 282e983086..b38b05d132 100644
+index 647cf0d8d4..7e1d0c810f 100644
 --- a/bfd/archures.c
 +++ b/bfd/archures.c
-@@ -183,6 +183,7 @@ DESCRIPTION
+@@ -185,6 +185,7 @@ DESCRIPTION
  .#define bfd_mach_mips_octeon3		6503
  .#define bfd_mach_mips_xlr		887682	 {* decimal 'XLR'.  *}
  .#define bfd_mach_mips_interaptiv_mr2	736550	 {* decimal 'IA2'.  *}
@@ -58,10 +58,10 @@ index 282e983086..b38b05d132 100644
  .#define bfd_mach_mipsisa32r2		33
  .#define bfd_mach_mipsisa32r3		34
 diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
-index 93745bd3fd..326e9e49ed 100644
+index e25da50aaf..e251d7e7aa 100644
 --- a/bfd/bfd-in2.h
 +++ b/bfd/bfd-in2.h
-@@ -2054,6 +2054,7 @@ enum bfd_architecture
+@@ -2084,6 +2084,7 @@ enum bfd_architecture
  #define bfd_mach_mips_octeon3          6503
  #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'.  */
  #define bfd_mach_mips_interaptiv_mr2   736550   /* decimal 'IA2'.  */
@@ -70,10 +70,10 @@ index 93745bd3fd..326e9e49ed 100644
  #define bfd_mach_mipsisa32r2           33
  #define bfd_mach_mipsisa32r3           34
 diff --git a/bfd/config.bfd b/bfd/config.bfd
-index 8a11c0680a..c882421343 100644
+index cc65547588..3614ff79d4 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -896,6 +896,11 @@ case "${targ}" in
+@@ -902,6 +902,11 @@ case "${targ}" in
      targ_defvec=mips_elf32_le_vec
      targ_selvecs="mips_elf32_be_vec mips_elf64_be_vec mips_elf64_le_vec"
      ;;
@@ -86,10 +86,10 @@ index 8a11c0680a..c882421343 100644
      targ_defvec=mips_elf32_be_vec
      targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec"
 diff --git a/bfd/cpu-mips.c b/bfd/cpu-mips.c
-index cb50c64371..2b9d1d6ecf 100644
+index b359491305..61a3e7aaca 100644
 --- a/bfd/cpu-mips.c
 +++ b/bfd/cpu-mips.c
-@@ -105,7 +105,8 @@ enum
+@@ -107,7 +107,8 @@ enum
    I_mipsocteon3,
    I_xlr,
    I_interaptiv_mr2,
@@ -99,7 +99,7 @@ index cb50c64371..2b9d1d6ecf 100644
  };
  
  #define NN(index) (&arch_info_struct[(index) + 1])
-@@ -158,7 +159,8 @@ static const bfd_arch_info_type arch_info_struct[] =
+@@ -162,7 +163,8 @@ static const bfd_arch_info_type arch_info_struct[] =
    N (64, 64, bfd_mach_mips_xlr, "mips:xlr",	  FALSE, NN(I_xlr)),
    N (32, 32, bfd_mach_mips_interaptiv_mr2, "mips:interaptiv-mr2", FALSE,
       NN(I_interaptiv_mr2)),
@@ -110,10 +110,10 @@ index cb50c64371..2b9d1d6ecf 100644
  
  /* The default architecture is mips:3000, but with a machine number of
 diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c
-index d91942301c..5d1bd3f0b1 100644
+index 5998bc43a8..0d5795222b 100644
 --- a/bfd/elfxx-mips.c
 +++ b/bfd/elfxx-mips.c
-@@ -6805,6 +6805,9 @@ _bfd_elf_mips_mach (flagword flags)
+@@ -6919,6 +6919,9 @@ _bfd_elf_mips_mach (flagword flags)
      case E_MIPS_MACH_IAMR2:
        return bfd_mach_mips_interaptiv_mr2;
  
@@ -123,7 +123,7 @@ index d91942301c..5d1bd3f0b1 100644
      default:
        switch (flags & EF_MIPS_ARCH)
  	{
-@@ -12003,6 +12006,10 @@ mips_set_isa_flags (bfd *abfd)
+@@ -12199,6 +12202,10 @@ mips_set_isa_flags (bfd *abfd)
        val = E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;
        break;
  
@@ -134,19 +134,19 @@ index d91942301c..5d1bd3f0b1 100644
      case bfd_mach_mipsisa32:
        val = E_MIPS_ARCH_32;
        break;
-@@ -13992,6 +13999,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
-   { bfd_mach_mips_octeonp, bfd_mach_mips_octeon },
-   { bfd_mach_mips_octeon, bfd_mach_mipsisa64r2 },
-   { bfd_mach_mips_loongson_3a, bfd_mach_mipsisa64r2 },
+@@ -14214,6 +14221,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
+   { bfd_mach_mips_gs264e, bfd_mach_mips_gs464e },
+   { bfd_mach_mips_gs464e, bfd_mach_mips_gs464 },
+   { bfd_mach_mips_gs464, bfd_mach_mipsisa64r2 },
 +  { bfd_mach_mips_xlp, bfd_mach_mipsisa64r2 },
  
    /* MIPS64 extensions.  */
    { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },
 diff --git a/binutils/readelf.c b/binutils/readelf.c
-index 2b78db219b..7a7178925f 100644
+index b13eb6a43b..9df3742682 100644
 --- a/binutils/readelf.c
 +++ b/binutils/readelf.c
-@@ -3403,6 +3403,7 @@ get_machine_flags (Filedata * filedata, unsigned e_flags, unsigned e_machine)
+@@ -3412,6 +3412,7 @@ get_machine_flags (Filedata * filedata, unsigned e_flags, unsigned e_machine)
  	    case E_MIPS_MACH_OCTEON3: strcat (buf, ", octeon3"); break;
  	    case E_MIPS_MACH_XLR:  strcat (buf, ", xlr"); break;
  	    case E_MIPS_MACH_IAMR2:  strcat (buf, ", interaptiv-mr2"); break;
@@ -155,10 +155,10 @@ index 2b78db219b..7a7178925f 100644
  	    /* We simply ignore the field in this case to avoid confusion:
  	       MIPS ELF does not specify EF_MIPS_MACH, it is a GNU
 diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c
-index 59df787155..48537226c0 100644
+index ae55904229..d6882712f5 100644
 --- a/gas/config/tc-mips.c
 +++ b/gas/config/tc-mips.c
-@@ -552,6 +552,7 @@ static int mips_32bitmode = 0;
+@@ -554,6 +554,7 @@ static int mips_32bitmode = 0;
     || mips_opts.arch == CPU_RM7000                    \
     || mips_opts.arch == CPU_VR5500                    \
     || mips_opts.micromips                             \
@@ -166,7 +166,7 @@ index 59df787155..48537226c0 100644
     )
  
  /* Whether the processor uses hardware interlocks to protect reads
-@@ -581,6 +582,7 @@ static int mips_32bitmode = 0;
+@@ -583,6 +584,7 @@ static int mips_32bitmode = 0;
      && mips_opts.isa != ISA_MIPS3)                    \
     || mips_opts.arch == CPU_R4300                     \
     || mips_opts.micromips                             \
@@ -174,7 +174,7 @@ index 59df787155..48537226c0 100644
     )
  
  /* Whether the processor uses hardware interlocks to protect reads
-@@ -19778,7 +19780,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
+@@ -19867,7 +19869,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
    /* Broadcom XLP.
       XLP is mostly like XLR, with the prominent exception that it is
       MIPS64R2 rather than MIPS64.  */
@@ -184,10 +184,10 @@ index 59df787155..48537226c0 100644
    /* MIPS 64 Release 6 */
    { "i6400",	      0, ASE_MSA,		ISA_MIPS64R6, CPU_MIPS64R6},
 diff --git a/gas/configure b/gas/configure
-index 134278fa25..2fdca147a1 100755
+index a82fde7fa8..afc77c347a 100755
 --- a/gas/configure
 +++ b/gas/configure
-@@ -13336,6 +13336,9 @@ _ACEOF
+@@ -13364,6 +13364,9 @@ _ACEOF
  	  mipsisa64r6 | mipsisa64r6el)
  	    mips_cpu=mips64r6
  	    ;;
@@ -198,7 +198,7 @@ index 134278fa25..2fdca147a1 100755
  	    mips_cpu=r3900
  	    ;;
 diff --git a/include/elf/mips.h b/include/elf/mips.h
-index 4e2cde3279..c329f38929 100644
+index b76d450ae2..7cddb365ad 100644
 --- a/include/elf/mips.h
 +++ b/include/elf/mips.h
 @@ -290,6 +290,7 @@ END_RELOC_NUMBERS (R_MIPS_maxext)
@@ -210,10 +210,10 @@ index 4e2cde3279..c329f38929 100644
  #define E_MIPS_MACH_OCTEON3	0x008e0000
  #define E_MIPS_MACH_5400	0x00910000
 diff --git a/include/opcode/mips.h b/include/opcode/mips.h
-index 1ab1780567..74f457b579 100644
+index abd52c8980..53b6752a1c 100644
 --- a/include/opcode/mips.h
 +++ b/include/opcode/mips.h
-@@ -1262,6 +1262,8 @@ static const unsigned int mips_isa_table[] = {
+@@ -1260,6 +1260,8 @@ static const unsigned int mips_isa_table[] = {
  #define INSN_XLR                 0x00000020
  /* Imagination interAptiv MR2.  */
  #define INSN_INTERAPTIV_MR2	  0x04000000
@@ -222,7 +222,7 @@ index 1ab1780567..74f457b579 100644
  
  /* DSP ASE */
  #define ASE_DSP			0x00000001
-@@ -1373,6 +1375,7 @@ static const unsigned int mips_isa_table[] = {
+@@ -1381,6 +1383,7 @@ static const unsigned int mips_isa_table[] = {
  #define CPU_OCTEON3	6503
  #define CPU_XLR     	887682   	/* decimal 'XLR'   */
  #define CPU_INTERAPTIV_MR2 736550	/* decimal 'IA2'  */
@@ -230,7 +230,7 @@ index 1ab1780567..74f457b579 100644
  
  /* Return true if the given CPU is included in INSN_* mask MASK.  */
  
-@@ -1453,6 +1456,9 @@ cpu_is_member (int cpu, unsigned int mask)
+@@ -1458,6 +1461,9 @@ cpu_is_member (int cpu, unsigned int mask)
        return ((mask & INSN_ISA_MASK) == INSN_ISA32R6)
  	     || ((mask & INSN_ISA_MASK) == INSN_ISA64R6);
  
@@ -241,10 +241,10 @@ index 1ab1780567..74f457b579 100644
        return FALSE;
      }
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index 7fb2168503..a1db7adfe2 100644
+index 917be6f8eb..347df6c3f6 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -450,6 +450,8 @@ mips*el-sde-elf* | mips*el-mti-elf* | mips*el-img-elf*)
+@@ -454,6 +454,8 @@ mips*el-sde-elf* | mips*el-mti-elf* | mips*el-img-elf*)
  mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
  			targ_emul=elf32btsmip
  			targ_extra_emuls="elf32ltsmip elf32btsmipn32 elf64btsmip elf32ltsmipn32 elf64ltsmip" ;;
@@ -254,10 +254,10 @@ index 7fb2168503..a1db7adfe2 100644
  			targ_extra_emuls="elf32lr5900"
  			targ_extra_libpath=$targ_extra_emuls ;;
 diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c
-index bbf21328e8..38e487c16f 100644
+index 0dd85e3779..1ea708dde7 100644
 --- a/opcodes/mips-dis.c
 +++ b/opcodes/mips-dis.c
-@@ -656,13 +656,11 @@ const struct mips_arch_choice mips_arch_choices[] =
+@@ -673,13 +673,11 @@ const struct mips_arch_choice mips_arch_choices[] =
      mips_cp0sel_names_xlr, ARRAY_SIZE (mips_cp0sel_names_xlr),
      mips_cp1_names_mips3264, mips_hwr_names_numeric },
  
@@ -277,10 +277,10 @@ index bbf21328e8..38e487c16f 100644
    /* This entry, mips16, is here only for ISA/processor selection; do
       not print its name.  */
 diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c
-index 1cbcbc6abc..e1fbdc89de 100644
+index 837da6bd99..d3ea5b8877 100644
 --- a/opcodes/mips-opc.c
 +++ b/opcodes/mips-opc.c
-@@ -329,6 +329,7 @@ decode_mips_operand (const char *p)
+@@ -328,6 +328,7 @@ decode_mips_operand (const char *p)
  #define IOCT3	INSN_OCTEON3
  #define XLR     INSN_XLR
  #define IAMR2	INSN_INTERAPTIV_MR2
@@ -288,7 +288,7 @@ index 1cbcbc6abc..e1fbdc89de 100644
  #define IVIRT	ASE_VIRT
  #define IVIRT64	ASE_VIRT64
  
-@@ -974,6 +975,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -989,6 +990,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"clo",			"U,s",		0x70000021, 0xfc0007ff, WR_1|RD_2,		0,		I32|N55,	0,	I37 },
  {"clz",			"d,s",		0x00000050, 0xfc1f07ff, WR_1|RD_2,		0,		I37,		0,	0 },
  {"clz",			"U,s",		0x70000020, 0xfc0007ff, WR_1|RD_2,		0,		I32|N55,	0,	I37 },
@@ -296,7 +296,7 @@ index 1cbcbc6abc..e1fbdc89de 100644
  /* ctc0 is at the bottom of the table.  */
  {"ctc1",		"t,G",		0x44c00000, 0xffe007ff,	RD_1|WR_CC|CM,		0,		I1,		0,	0 },
  {"ctc1",		"t,S",		0x44c00000, 0xffe007ff,	RD_1|WR_CC|CM,		0,		I1,		0,	0 },
-@@ -1006,12 +1008,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1021,12 +1023,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"daddiu",		"t,r,j",	0x64000000, 0xfc000000, WR_1|RD_2,		0,		I3,		0,	0 },
  {"daddu",		"d,v,t",	0x0000002d, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I3,		0,	0 },
  {"daddu",		"t,r,I",	0,    (int) M_DADDU_I,	INSN_MACRO,		0,		I3,		0,	0 },
@@ -311,7 +311,7 @@ index 1cbcbc6abc..e1fbdc89de 100644
  /* dctr and dctw are used on the r5000.  */
  {"dctr",		"o(b)",	 	0xbc050000, 0xfc1f0000, RD_2,			0,		I3,		0,	0 },
  {"dctw",		"o(b)",		0xbc090000, 0xfc1f0000, RD_2,			0,		I3,		0,	0 },
-@@ -1083,6 +1086,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1098,6 +1101,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"dmfc0",		"t,G,H",	0x40200000, 0xffe007f8,	WR_1|RD_C0|LC,		0,		I64,		0,	0 },
  {"dmfgc0",		"t,G",		0x40600100, 0xffe007ff, WR_1|RD_C0|LC,		0,		0,		IVIRT64, 0 },
  {"dmfgc0",		"t,G,H",	0x40600100, 0xffe007f8, WR_1|RD_C0|LC,		0,		0,		IVIRT64, 0 },
@@ -319,7 +319,7 @@ index 1cbcbc6abc..e1fbdc89de 100644
  {"dmt",			"",		0x41600bc1, 0xffffffff, TRAP,			0,		0,		MT32,	0 },
  {"dmt",			"t",		0x41600bc1, 0xffe0ffff, WR_1|TRAP,		0,		0,		MT32,	0 },
  {"dmtc0",		"t,G",		0x40a00000, 0xffe007ff,	RD_1|WR_C0|WR_CC|CM,	0,		I3,		0,	EE },
-@@ -1098,6 +1102,8 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1113,6 +1117,8 @@ const struct mips_opcode mips_builtin_opcodes[] =
  /* dmfc3 is at the bottom of the table.  */
  /* dmtc3 is at the bottom of the table.  */
  {"dmuh",		"d,s,t",	0x000000dc, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I69,		0,	0 },
@@ -328,7 +328,7 @@ index 1cbcbc6abc..e1fbdc89de 100644
  {"dmul",		"d,s,t",	0x0000009c, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I69,		0,	0 },
  {"dmul",		"d,v,t",	0x70000003, 0xfc0007ff, WR_1|RD_2|RD_3|WR_HILO,	0,		IOCT,		0,	0 },
  {"dmul",		"d,v,t",	0,    (int) M_DMUL,	INSN_MACRO,		0,		I3,		0,	M32|I69 },
-@@ -1251,9 +1257,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1266,9 +1272,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"ld",			"s,-b(+R)",	0xec180000, 0xfc1c0000, WR_1,			RD_pc,		I69,		0,	0 },
  {"ld",			"t,A(b)",	0,    (int) M_LD_AB,	INSN_MACRO,		0,		I1,		0,	0 },
  {"ld",			"t,o(b)",	0xdc000000, 0xfc000000, WR_1|RD_3|LM,		0,		I3,		0,	0 },
@@ -341,7 +341,7 @@ index 1cbcbc6abc..e1fbdc89de 100644
  {"ldc1",		"T,o(b)",	0xd4000000, 0xfc000000, WR_1|RD_3|CLD|FP_D,	0,		I2,		0,	SF },
  {"ldc1",		"E,o(b)",	0xd4000000, 0xfc000000, WR_1|RD_3|CLD|FP_D,	0,		I2,		0,	SF },
  {"ldc1",		"T,A(b)",	0,    (int) M_LDC1_AB,	INSN_MACRO,		INSN2_M_FP_D,	I2,		0,	SF },
-@@ -1418,7 +1424,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1433,7 +1439,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"mflo",		"d,9",		0x00000012, 0xff9f07ff, WR_1|RD_LO,		0,		0,		D32,	0 },
  {"mflo1",		"d",		0x70000012, 0xffff07ff,	WR_1|RD_LO,		0,		EE,		0,	0 },
  {"mflhxu",		"d",		0x00000052, 0xffff07ff,	WR_1|MOD_HILO,		0,		0,		SMT,	0 },
@@ -350,7 +350,7 @@ index 1cbcbc6abc..e1fbdc89de 100644
  {"mfsa",		"d",		0x00000028, 0xffff07ff,	WR_1,			0,		EE,		0,	0 },
  {"min.ob",		"X,Y,Q",	0x78000006, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		SB1,		MX,	0 },
  {"min.ob",		"D,S,Q",	0x48000006, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		N54,		0,	0 },
-@@ -1463,10 +1469,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1478,10 +1484,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
  /* move is at the top of the table.  */
  {"msgn.qh",		"X,Y,Q",	0x78200000, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		0,		MX,	0 },
  {"msgsnd",		"t",		0,    (int) M_MSGSND,	INSN_MACRO,		0,		XLR,		0,	0 },
@@ -366,7 +366,7 @@ index 1cbcbc6abc..e1fbdc89de 100644
  {"msub.d",		"D,R,S,T",	0x4c000029, 0xfc00003f, WR_1|RD_2|RD_3|RD_4|FP_D, 0,		I4_33,		0,	I37 },
  {"msub.d",		"D,S,T",	0x46200019, 0xffe0003f,	WR_1|RD_2|RD_3|FP_D,	0,		IL2E,		0,	0 },
  {"msub.d",		"D,S,T",	0x72200019, 0xffe0003f,	WR_1|RD_2|RD_3|FP_D,	0,		IL2F,		0,	0 },
-@@ -1516,7 +1525,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1531,7 +1540,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"mtlo",		"s,7",		0x00000013, 0xfc1fe7ff, RD_1|WR_LO,		0,		0,		D32,	0 },
  {"mtlo1",		"s",		0x70000013, 0xfc1fffff,	RD_1|WR_LO,		0,		EE,		0,	0 },
  {"mtlhx",		"s",		0x00000053, 0xfc1fffff,	RD_1|MOD_HILO,		0,		0,		SMT,	0 },
@@ -375,7 +375,7 @@ index 1cbcbc6abc..e1fbdc89de 100644
  {"mtm0",		"s",		0x70000008, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
  {"mtm0",    		"s,t",		0x70000008, 0xfc00ffff, RD_1|RD_2,		0,		IOCT3,		0,	0 },
  {"mtm1",		"s",		0x7000000c, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
-@@ -1953,9 +1962,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
+@@ -1968,9 +1977,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"suxc1",		"S,t(b)",	0x4c00000d, 0xfc0007ff, RD_1|RD_2|RD_3|SM|FP_D,	0,		I5_33|N55,	0,	I37},
  {"sw",			"t,o(b)",	0xac000000, 0xfc000000,	RD_1|RD_3|SM,		0,		I1,		0,	0 },
  {"sw",			"t,A(b)",	0,    (int) M_SW_AB,	INSN_MACRO,		0,		I1,		0,	0 },
@@ -389,5 +389,5 @@ index 1cbcbc6abc..e1fbdc89de 100644
  {"swc0",		"E,A(b)",	0,    (int) M_SWC0_AB,	INSN_MACRO,		0,		I1,		0,	IOCT|IOCTP|IOCT2|I37 },
  {"swc1",		"T,o(b)",	0xe4000000, 0xfc000000,	RD_1|RD_3|SM|FP_S,	0,		I1,		0,	0 },
 -- 
-2.18.0
+2.20.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0012-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
similarity index 76%
rename from meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
rename to meta/recipes-devtools/binutils/binutils/0012-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
index c9ffdada91..6a3b78f227 100644
--- a/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
+++ b/meta/recipes-devtools/binutils/binutils/0012-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
@@ -1,7 +1,7 @@
-From d45455db35db5693c5efe0e1b384295e4c0db998 Mon Sep 17 00:00:00 2001
+From e48767a0298e6ccf53d83fecc93bb6d26b595897 Mon Sep 17 00:00:00 2001
 From: Zhenhua Luo <zhenhua.luo@nxp.com>
 Date: Sat, 11 Jun 2016 22:08:29 -0500
-Subject: [PATCH 13/15] fix the incorrect assembling for ppc wait mnemonic
+Subject: [PATCH 12/15] fix the incorrect assembling for ppc wait mnemonic
 
 Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
 
@@ -11,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
-index 4a0fca5f0a..49f72fc35c 100644
+index 3032631d4e..142f096ef4 100644
 --- a/opcodes/ppc-opc.c
 +++ b/opcodes/ppc-opc.c
-@@ -5351,7 +5351,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+@@ -5325,7 +5325,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
  {"ldepx",	X(31,29),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
  
  {"waitasec",	X(31,30),      XRTRARB_MASK, POWER8,	POWER9,		{0}},
@@ -22,7 +22,7 @@ index 4a0fca5f0a..49f72fc35c 100644
  
  {"lwepx",	X(31,31),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
  
-@@ -5405,7 +5404,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+@@ -5379,7 +5378,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
  
  {"waitrsv",	X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
  {"waitimpl",	X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
@@ -32,5 +32,5 @@ index 4a0fca5f0a..49f72fc35c 100644
  {"dcbstep",	XRT(31,63,0),	XRT_MASK,    E500MC|PPCA2, 0,		{RA0, RB}},
  
 -- 
-2.18.0
+2.20.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch b/meta/recipes-devtools/binutils/binutils/0013-Detect-64-bit-MIPS-targets.patch
similarity index 86%
rename from meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch
rename to meta/recipes-devtools/binutils/binutils/0013-Detect-64-bit-MIPS-targets.patch
index 6197df6d5a..d929179de2 100644
--- a/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch
+++ b/meta/recipes-devtools/binutils/binutils/0013-Detect-64-bit-MIPS-targets.patch
@@ -1,7 +1,7 @@
-From 9af90cfc35ff1fe78755578861473039836c467a Mon Sep 17 00:00:00 2001
+From 6587e7b8e7730dda20d8c47cabe9f7f8397efa3c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 31 Mar 2017 11:42:03 -0700
-Subject: [PATCH 14/15] Detect 64-bit MIPS targets
+Subject: [PATCH 13/15] Detect 64-bit MIPS targets
 
 Add mips64 target triplets and default to N64
 
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 14 insertions(+)
 
 diff --git a/gold/configure.tgt b/gold/configure.tgt
-index 8aef22a318..7030026ffa 100644
+index 3e066edaa8..caf130ceda 100644
 --- a/gold/configure.tgt
 +++ b/gold/configure.tgt
 @@ -153,6 +153,13 @@ aarch64*-*)
@@ -46,5 +46,5 @@ index 8aef22a318..7030026ffa 100644
   targ_obj=mips
   targ_machine=EM_MIPS
 -- 
-2.18.0
+2.20.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0014-sync-with-OE-libtool-changes.patch
similarity index 95%
rename from meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
rename to meta/recipes-devtools/binutils/binutils/0014-sync-with-OE-libtool-changes.patch
index 7dc8ba8c37..65ba10a553 100644
--- a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
+++ b/meta/recipes-devtools/binutils/binutils/0014-sync-with-OE-libtool-changes.patch
@@ -1,7 +1,7 @@
-From f9e26bd29b5f017ea1307b51b5036063bff78600 Mon Sep 17 00:00:00 2001
+From b7729343206fa196b9a11747a92b3cf563277056 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Mar 2017 23:33:27 -0800
-Subject: [PATCH 15/15] sync with OE libtool changes
+Subject: [PATCH 14/15] sync with OE libtool changes
 
 Apply these patches from our libtool patches as not only are redundant RPATHs a
 waste of space but they can cause incorrect linking when native packages are
@@ -85,5 +85,5 @@ index 11ee684ccc..3b19ac1532 100644
  	elif test -n "$runpath_var"; then
  	  case "$finalize_perm_rpath " in
 -- 
-2.18.0
+2.20.1
 
diff --git a/meta/recipes-devtools/binutils/binutils/0016-add-i386pep-emulation-for-x86_64.patch b/meta/recipes-devtools/binutils/binutils/0015-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch
similarity index 74%
rename from meta/recipes-devtools/binutils/binutils/0016-add-i386pep-emulation-for-x86_64.patch
rename to meta/recipes-devtools/binutils/binutils/0015-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch
index 9f20784eba..bfde561dee 100644
--- a/meta/recipes-devtools/binutils/binutils/0016-add-i386pep-emulation-for-x86_64.patch
+++ b/meta/recipes-devtools/binutils/binutils/0015-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch
@@ -1,4 +1,8 @@
-binutils : enable x86_64-pep for producing EFI binaries on x86-64
+From d5d783903e335302e562bac8da1a083338d75b25 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Nov 2018 17:46:40 -0800
+Subject: [PATCH 15/15] binutils : enable x86_64-pep for producing EFI binaries
+ on x86-64
 
 Add x86_64-pep emulation support to the set enabled for x86_64 targets
 to enable the linker to produce Portable Executables for EFI binaries.
@@ -6,15 +10,20 @@ to enable the linker to produce Portable Executables for EFI binaries.
 Enables building the x86-64 EFI variant of the Xen hypervisor for
 the OpenXT Project.
 
-Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
-
 Upstream-Status: Inappropriate [OE configuration specific]
+
+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+ bfd/config.bfd   | 2 +-
+ ld/configure.tgt | 5 +++--
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
 diff --git a/bfd/config.bfd b/bfd/config.bfd
-index c882421..dc705b6 100644
+index 3614ff79d4..aef144803a 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -688,7 +688,7 @@ case "${targ}" in
+@@ -694,7 +694,7 @@ case "${targ}" in
      ;;
    x86_64-*-linux-*)
      targ_defvec=x86_64_elf64_vec
@@ -24,10 +33,10 @@ index c882421..dc705b6 100644
      ;;
    x86_64-*-nacl*)
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index a1db7ad..65a984a 100644
+index 347df6c3f6..1e37d747a9 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -253,8 +253,9 @@ x86_64-*-linux-gnux32)	targ_emul=elf32_x86_64
+@@ -257,8 +257,9 @@ x86_64-*-linux-gnux32)	targ_emul=elf32_x86_64
  			tdir_elf_iamcu=`echo ${targ_alias} | sed -e 's/x86_64/i386/' -e 's/-linux-gnux32/-linux-gnu/'`
  			tdir_elf_i386=`echo ${targ_alias} | sed -e 's/x86_64/i386/' -e 's/-linux-gnux32/-linux-gnu/'` ;;
  x86_64-*-linux-*)	targ_emul=elf_x86_64
@@ -39,3 +48,6 @@ index a1db7ad..65a984a 100644
  			tdir_elf_i386=`echo ${targ_alias} | sed -e 's/x86_64/i386/'` ;;
  i[3-7]86-*-redox*)	targ_emul=elf_i386
  			targ_extra_emuls=elf_x86_64 ;;
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/binutils/binutils/0022-Handle-ELF-compressed-header-alignment-correctly-by-.patch b/meta/recipes-devtools/binutils/binutils/0022-Handle-ELF-compressed-header-alignment-correctly-by-.patch
deleted file mode 100644
index 650de9b9a3..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0022-Handle-ELF-compressed-header-alignment-correctly-by-.patch
+++ /dev/null
@@ -1,332 +0,0 @@
-From bb9c8cc3c5f4ffd6019a8c53adead429954162e1 Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Tue, 27 Nov 2018 11:59:10 +0000
-Subject: [PATCH 1/2] Handle ELF compressed header alignment correctly by
- setting up the section alignment correctly for the Elf32_Chdr or Elf64_Chdr
- type and respect the ch_addralign field when decompressing the section data.
-
-	PR binutils/23919
-binutils* readelf.c (dump_sections_as_strings): Remove bogus addralign check.
-	(dump_sections_as_bytes): Likewise.
-	(load_specific_debug_sections): Likewise.
-	* testsuite/binutils-all/dw2-3.rS: Adjust alignment.
-	* testsuite/binutils-all/dw2-3.rt: Likewise.
-
-bfd	* bfd.c (bfd_update_compression_header): Explicitly set alignment.
-	(bfd_check_compression_header): Add uncompressed_alignment_power
-	argument. Check ch_addralign is a power of 2.
-	* bfd-in2.h: Regenerated.
-	* compress.c (bfd_compress_section_contents): Get and set
-	orig_uncompressed_alignment_pow if section is decompressed.
-	(bfd_is_section_compressed_with_header): Add and get
-	uncompressed_align_pow_p argument.
-	(bfd_is_section_compressed): Add uncompressed_align_power argument
-	to bfd_is_section_compressed_with_header call.
-	(bfd_init_section_decompress_status): Get and set
-	uncompressed_alignment_power.
-	* elf.c (_bfd_elf_make_section_from_shdr): Add
-	uncompressed_align_power argument to
-	bfd_is_section_compressed_with_header call.
----
- bfd/bfd-in2.h                            |  6 ++--
- bfd/bfd.c                                | 20 ++++++++++----
- bfd/compress.c                           | 35 +++++++++++++++++-------
- bfd/elf.c                                |  5 ++--
- binutils/readelf.c                       | 18 ------------
- binutils/testsuite/binutils-all/dw2-3.rS |  2 +-
- binutils/testsuite/binutils-all/dw2-3.rt |  2 +-
- 7 files changed, 49 insertions(+), 39 deletions(-)
-
-Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=4207142d6a5d2359170c5f9a140fc1a2351fbda9]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
-index f53dbb5e8c..d0c2190d0b 100644
---- a/bfd/bfd-in2.h
-+++ b/bfd/bfd-in2.h
-@@ -7279,7 +7279,8 @@ void bfd_update_compression_header
- 
- bfd_boolean bfd_check_compression_header
-    (bfd *abfd, bfd_byte *contents, asection *sec,
--    bfd_size_type *uncompressed_size);
-+    bfd_size_type *uncompressed_size,
-+    unsigned int *uncompressed_alignment_power);
- 
- int bfd_get_compression_header_size (bfd *abfd, asection *sec);
- 
-@@ -7855,7 +7856,8 @@ void bfd_cache_section_contents
- bfd_boolean bfd_is_section_compressed_with_header
-    (bfd *abfd, asection *section,
-     int *compression_header_size_p,
--    bfd_size_type *uncompressed_size_p);
-+    bfd_size_type *uncompressed_size_p,
-+    unsigned int *uncompressed_alignment_power_p);
- 
- bfd_boolean bfd_is_section_compressed
-    (bfd *abfd, asection *section);
-diff --git a/bfd/bfd.c b/bfd/bfd.c
-index 851710401e..ea10d7b185 100644
---- a/bfd/bfd.c
-+++ b/bfd/bfd.c
-@@ -2332,6 +2332,8 @@ bfd_update_compression_header (bfd *abfd, bfd_byte *contents,
- 		  bfd_put_32 (abfd, sec->size, &echdr->ch_size);
- 		  bfd_put_32 (abfd, 1 << sec->alignment_power,
- 			      &echdr->ch_addralign);
-+		  /* bfd_log2 (alignof (Elf32_Chdr)) */
-+		  bfd_set_section_alignment (abfd, sec, 2);
- 		}
- 	      else
- 		{
-@@ -2342,6 +2344,8 @@ bfd_update_compression_header (bfd *abfd, bfd_byte *contents,
- 		  bfd_put_64 (abfd, sec->size, &echdr->ch_size);
- 		  bfd_put_64 (abfd, 1 << sec->alignment_power,
- 			      &echdr->ch_addralign);
-+		  /* bfd_log2 (alignof (Elf64_Chdr)) */
-+		  bfd_set_section_alignment (abfd, sec, 3);
- 		}
- 	    }
- 	  else
-@@ -2354,6 +2358,8 @@ bfd_update_compression_header (bfd *abfd, bfd_byte *contents,
- 		 order.  */
- 	      memcpy (contents, "ZLIB", 4);
- 	      bfd_putb64 (sec->size, contents + 4);
-+	      /* No way to keep the original alignment, just use 1 always. */
-+	      bfd_set_section_alignment (abfd, sec, 0);
- 	    }
- 	}
-     }
-@@ -2368,12 +2374,14 @@ bfd_update_compression_header (bfd *abfd, bfd_byte *contents,
-    SYNOPSIS
- 	bfd_boolean bfd_check_compression_header
- 	  (bfd *abfd, bfd_byte *contents, asection *sec,
--	  bfd_size_type *uncompressed_size);
-+	  bfd_size_type *uncompressed_size,
-+	  unsigned int *uncompressed_alignment_power);
- 
- DESCRIPTION
- 	Check the compression header at CONTENTS of SEC in ABFD and
--	store the uncompressed size in UNCOMPRESSED_SIZE if the
--	compression header is valid.
-+	store the uncompressed size in UNCOMPRESSED_SIZE and the
-+	uncompressed data alignment in UNCOMPRESSED_ALIGNMENT_POWER
-+	if the compression header is valid.
- 
- RETURNS
- 	Return TRUE if the compression header is valid.
-@@ -2382,7 +2390,8 @@ RETURNS
- bfd_boolean
- bfd_check_compression_header (bfd *abfd, bfd_byte *contents,
- 			      asection *sec,
--			      bfd_size_type *uncompressed_size)
-+			      bfd_size_type *uncompressed_size,
-+			      unsigned int *uncompressed_alignment_power)
- {
-   if (bfd_get_flavour (abfd) == bfd_target_elf_flavour
-       && (elf_section_flags (sec) & SHF_COMPRESSED) != 0)
-@@ -2404,9 +2413,10 @@ bfd_check_compression_header (bfd *abfd, bfd_byte *contents,
- 	  chdr.ch_addralign = bfd_get_64 (abfd, &echdr->ch_addralign);
- 	}
-       if (chdr.ch_type == ELFCOMPRESS_ZLIB
--	  && chdr.ch_addralign == 1U << sec->alignment_power)
-+	  && chdr.ch_addralign == (1U << bfd_log2 (chdr.ch_addralign)))
- 	{
- 	  *uncompressed_size = chdr.ch_size;
-+	  *uncompressed_alignment_power = bfd_log2 (chdr.ch_addralign);
- 	  return TRUE;
- 	}
-     }
-diff --git a/bfd/compress.c b/bfd/compress.c
-index 53e566e498..97ea624eb8 100644
---- a/bfd/compress.c
-+++ b/bfd/compress.c
-@@ -84,11 +84,13 @@ bfd_compress_section_contents (bfd *abfd, sec_ptr sec,
-   int zlib_size = 0;
-   int orig_compression_header_size;
-   bfd_size_type orig_uncompressed_size;
-+  unsigned int orig_uncompressed_alignment_pow;
-   int header_size = bfd_get_compression_header_size (abfd, NULL);
-   bfd_boolean compressed
-     = bfd_is_section_compressed_with_header (abfd, sec,
- 					     &orig_compression_header_size,
--					     &orig_uncompressed_size);
-+					     &orig_uncompressed_size,
-+					     &orig_uncompressed_alignment_pow);
- 
-   /* Either ELF compression header or the 12-byte, "ZLIB" + 8-byte size,
-      overhead in .zdebug* section.  */
-@@ -153,6 +155,9 @@ bfd_compress_section_contents (bfd *abfd, sec_ptr sec,
- 	      return 0;
- 	    }
- 	  free (uncompressed_buffer);
-+	  bfd_set_section_alignment (abfd, sec,
-+				     orig_uncompressed_alignment_pow);
-+
- 	  sec->contents = buffer;
- 	  sec->compress_status = COMPRESS_SECTION_DONE;
- 	  return orig_uncompressed_size;
-@@ -364,20 +369,24 @@ SYNOPSIS
- 	bfd_boolean bfd_is_section_compressed_with_header
- 	  (bfd *abfd, asection *section,
- 	  int *compression_header_size_p,
--	  bfd_size_type *uncompressed_size_p);
-+	  bfd_size_type *uncompressed_size_p,
-+	  unsigned int *uncompressed_alignment_power_p);
- 
- DESCRIPTION
- 	Return @code{TRUE} if @var{section} is compressed.  Compression
--	header size is returned in @var{compression_header_size_p} and
--	uncompressed size is returned in @var{uncompressed_size_p}.  If
--	compression is unsupported, compression header size is returned
--	with -1 and uncompressed size is returned with 0.
-+	header size is returned in @var{compression_header_size_p},
-+	uncompressed size is returned in @var{uncompressed_size_p}
-+	and the uncompressed data alignement power is returned in
-+	@var{uncompressed_align_pow_p}.  If compression is
-+	unsupported, compression header size is returned with -1
-+	and uncompressed size is returned with 0.
- */
- 
- bfd_boolean
- bfd_is_section_compressed_with_header (bfd *abfd, sec_ptr sec,
- 				       int *compression_header_size_p,
--				       bfd_size_type *uncompressed_size_p)
-+				       bfd_size_type *uncompressed_size_p,
-+				       unsigned int *uncompressed_align_pow_p)
- {
-   bfd_byte header[MAX_COMPRESSION_HEADER_SIZE];
-   int compression_header_size;
-@@ -412,7 +421,8 @@ bfd_is_section_compressed_with_header (bfd *abfd, sec_ptr sec,
-       if (compression_header_size != 0)
- 	{
- 	  if (!bfd_check_compression_header (abfd, header, sec,
--					     uncompressed_size_p))
-+					     uncompressed_size_p,
-+					     uncompressed_align_pow_p))
- 	    compression_header_size = -1;
- 	}
-       /* Check for the pathalogical case of a debug string section that
-@@ -449,9 +459,11 @@ bfd_is_section_compressed (bfd *abfd, sec_ptr sec)
- {
-   int compression_header_size;
-   bfd_size_type uncompressed_size;
-+  unsigned int uncompressed_align_power;
-   return (bfd_is_section_compressed_with_header (abfd, sec,
- 						 &compression_header_size,
--						 &uncompressed_size)
-+						 &uncompressed_size,
-+						 &uncompressed_align_power)
- 	  && compression_header_size >= 0
- 	  && uncompressed_size > 0);
- }
-@@ -480,6 +492,7 @@ bfd_init_section_decompress_status (bfd *abfd, sec_ptr sec)
-   int compression_header_size;
-   int header_size;
-   bfd_size_type uncompressed_size;
-+  unsigned int uncompressed_alignment_power = 0;
- 
-   compression_header_size = bfd_get_compression_header_size (abfd, sec);
-   if (compression_header_size > MAX_COMPRESSION_HEADER_SIZE)
-@@ -508,7 +521,8 @@ bfd_init_section_decompress_status (bfd *abfd, sec_ptr sec)
-       uncompressed_size = bfd_getb64 (header + 4);
-     }
-   else if (!bfd_check_compression_header (abfd, header, sec,
--					 &uncompressed_size))
-+					  &uncompressed_size,
-+					  &uncompressed_alignment_power))
-     {
-       bfd_set_error (bfd_error_wrong_format);
-       return FALSE;
-@@ -516,6 +530,7 @@ bfd_init_section_decompress_status (bfd *abfd, sec_ptr sec)
- 
-   sec->compressed_size = sec->size;
-   sec->size = uncompressed_size;
-+  bfd_set_section_alignment (abfd, sec, uncompressed_alignment_power);
-   sec->compress_status = DECOMPRESS_SECTION_SIZED;
- 
-   return TRUE;
-diff --git a/bfd/elf.c b/bfd/elf.c
-index 828241d48a..c4f131ddcf 100644
---- a/bfd/elf.c
-+++ b/bfd/elf.c
-@@ -1177,11 +1177,12 @@ _bfd_elf_make_section_from_shdr (bfd *abfd,
-       enum { nothing, compress, decompress } action = nothing;
-       int compression_header_size;
-       bfd_size_type uncompressed_size;
-+      unsigned int uncompressed_align_power;
-       bfd_boolean compressed
- 	= bfd_is_section_compressed_with_header (abfd, newsect,
- 						 &compression_header_size,
--						 &uncompressed_size);
--
-+						 &uncompressed_size,
-+						 &uncompressed_align_power);
-       if (compressed)
- 	{
- 	  /* Compressed section.  Check if we should decompress.  */
-diff --git a/binutils/readelf.c b/binutils/readelf.c
-index f4df697a7d..4b0efa884f 100644
---- a/binutils/readelf.c
-+++ b/binutils/readelf.c
-@@ -13345,12 +13345,6 @@ dump_section_as_strings (Elf_Internal_Shdr * section, Filedata * filedata)
- 		    printable_section_name (filedata, section), chdr.ch_type);
- 	      return FALSE;
- 	    }
--	  else if (chdr.ch_addralign != section->sh_addralign)
--	    {
--	      warn (_("compressed section '%s' is corrupted\n"),
--		    printable_section_name (filedata, section));
--	      return FALSE;
--	    }
- 	  uncompressed_size = chdr.ch_size;
- 	  start += compression_header_size;
- 	  new_size -= compression_header_size;
-@@ -13492,12 +13486,6 @@ dump_section_as_bytes (Elf_Internal_Shdr *  section,
- 		    printable_section_name (filedata, section), chdr.ch_type);
- 	      return FALSE;
- 	    }
--	  else if (chdr.ch_addralign != section->sh_addralign)
--	    {
--	      warn (_("compressed section '%s' is corrupted\n"),
--		    printable_section_name (filedata, section));
--	      return FALSE;
--	    }
- 	  uncompressed_size = chdr.ch_size;
- 	  start += compression_header_size;
- 	  new_size -= compression_header_size;
-@@ -13667,12 +13655,6 @@ load_specific_debug_section (enum dwarf_section_display_enum  debug,
- 		    section->name, chdr.ch_type);
- 	      return FALSE;
- 	    }
--	  else if (chdr.ch_addralign != sec->sh_addralign)
--	    {
--	      warn (_("compressed section '%s' is corrupted\n"),
--		    section->name);
--	      return FALSE;
--	    }
- 	  uncompressed_size = chdr.ch_size;
- 	  start += compression_header_size;
- 	  size -= compression_header_size;
-diff --git a/binutils/testsuite/binutils-all/dw2-3.rS b/binutils/testsuite/binutils-all/dw2-3.rS
-index f1637e9149..86bc73d9a2 100644
---- a/binutils/testsuite/binutils-all/dw2-3.rS
-+++ b/binutils/testsuite/binutils-all/dw2-3.rS
-@@ -1,3 +1,3 @@
- #...
-- +\[[ 0-9]+\] .debug_info +(PROGBITS|MIPS_DWARF) +0+ +[0-9a-f]+ +[0-9a-f]+ [0-9a-f]+ +C +0 +0 +1
-+ +\[[ 0-9]+\] .debug_info +(PROGBITS|MIPS_DWARF) +0+ +[0-9a-f]+ +[0-9a-f]+ [0-9a-f]+ +C +0 +0 +(4|8)
- #pass
-diff --git a/binutils/testsuite/binutils-all/dw2-3.rt b/binutils/testsuite/binutils-all/dw2-3.rt
-index f59cbaa22b..74e7f8deca 100644
---- a/binutils/testsuite/binutils-all/dw2-3.rt
-+++ b/binutils/testsuite/binutils-all/dw2-3.rt
-@@ -1,6 +1,6 @@
- #...
-  +\[[ 0-9]+\] .debug_info
-- +(PROGBITS|MIPS_DWARF) +0+ +[0-9a-f]+ +[0-9a-f]+ +[0-9a-f]+ +0 +0 +1
-+ +(PROGBITS|MIPS_DWARF) +0+ +[0-9a-f]+ +[0-9a-f]+ +[0-9a-f]+ +0 +0 +(4|8)
-  +\[0+800\]: COMPRESSED
-  +ZLIB, 0+9d, 1
- #pass
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0023-gold-Get-alignment-of-uncompressed-section-from-ch_a.patch b/meta/recipes-devtools/binutils/binutils/0023-gold-Get-alignment-of-uncompressed-section-from-ch_a.patch
deleted file mode 100644
index 1f072a6057..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0023-gold-Get-alignment-of-uncompressed-section-from-ch_a.patch
+++ /dev/null
@@ -1,200 +0,0 @@
-From 0261ec511ac07177fa488133e0bb3c03860977b3 Mon Sep 17 00:00:00 2001
-From: "H.J. Lu" <hjl.tools@gmail.com>
-Date: Sun, 2 Dec 2018 05:42:36 -0800
-Subject: [PATCH 2/2] gold: Get alignment of uncompressed section from
- ch_addralign
-
-The ELF compression header has a field (ch_addralign) that is set to
-the alignment of the uncompressed section. This way the section itself
-can have a different alignment than the decompressed section.  Update
-decompress_input_section to get alignment of the decompressed section
-and use it when merging decompressed strings.
-
-	PR binutils/23919
-	* merge.cc (Output_merge_string<Char_type>::do_add_input_section):
-	Get addralign from decompressed_section_contents.
-	* object.cc (build_compressed_section_map): Set info.addralign.
-	(Object::decompressed_section_contents): Add a palign
-	argument and store p->second.addralign in *palign if it isn't
-	NULL.
-	* object.h (Compressed_section_info): Add addralign.
-	(section_is_compressed): Add a palign argument, default it
-	to NULL, store p->second.addralign in *palign if it isn't NULL.
-	(Object::decompressed_section_contents): Likewise.
-	* output.cc (Output_section::add_input_section): Get addralign
-	from section_is_compressed.
----
- gold/merge.cc  |  8 +++++---
- gold/object.cc | 11 +++++++++--
- gold/object.h  |  8 ++++++--
- gold/output.cc | 11 ++++++-----
- 4 files changed, 26 insertions(+), 12 deletions(-)
-
-Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5f6c22aee74f17393b82934a5682d985672e011a]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-
-diff --git a/gold/merge.cc b/gold/merge.cc
-index de00ee9ae9..d7de11789f 100644
---- a/gold/merge.cc
-+++ b/gold/merge.cc
-@@ -440,9 +440,11 @@ Output_merge_string<Char_type>::do_add_input_section(Relobj* object,
- {
-   section_size_type sec_len;
-   bool is_new;
-+  uint64_t addralign = this->addralign();
-   const unsigned char* pdata = object->decompressed_section_contents(shndx,
- 								     &sec_len,
--								     &is_new);
-+								     &is_new,
-+								     &addralign);
- 
-   const Char_type* p = reinterpret_cast<const Char_type*>(pdata);
-   const Char_type* pend = p + sec_len / sizeof(Char_type);
-@@ -494,7 +496,7 @@ Output_merge_string<Char_type>::do_add_input_section(Relobj* object,
-   // aligned, so each string within the section must retain the same
-   // modulo.
-   uintptr_t init_align_modulo = (reinterpret_cast<uintptr_t>(pdata)
--				 & (this->addralign() - 1));
-+				 & (addralign - 1));
-   bool has_misaligned_strings = false;
- 
-   while (p < pend)
-@@ -503,7 +505,7 @@ Output_merge_string<Char_type>::do_add_input_section(Relobj* object,
- 
-       // Within merge input section each string must be aligned.
-       if (len != 0
--	  && ((reinterpret_cast<uintptr_t>(p) & (this->addralign() - 1))
-+	  && ((reinterpret_cast<uintptr_t>(p) & (addralign - 1))
- 	      != init_align_modulo))
- 	  has_misaligned_strings = true;
- 
-diff --git a/gold/object.cc b/gold/object.cc
-index 374340fa16..711793e5e4 100644
---- a/gold/object.cc
-+++ b/gold/object.cc
-@@ -751,11 +751,13 @@ build_compressed_section_map(
- 	      const unsigned char* contents =
- 		  obj->section_contents(i, &len, false);
- 	      uint64_t uncompressed_size;
-+	      Compressed_section_info info;
- 	      if (is_zcompressed)
- 		{
- 		  // Skip over the ".zdebug" prefix.
- 		  name += 7;
- 		  uncompressed_size = get_uncompressed_size(contents, len);
-+		  info.addralign = shdr.get_sh_addralign();
- 		}
- 	      else
- 		{
-@@ -763,8 +765,8 @@ build_compressed_section_map(
- 		  name += 6;
- 		  elfcpp::Chdr<size, big_endian> chdr(contents);
- 		  uncompressed_size = chdr.get_ch_size();
-+		  info.addralign = chdr.get_ch_addralign();
- 		}
--	      Compressed_section_info info;
- 	      info.size = convert_to_section_size_type(uncompressed_size);
- 	      info.flag = shdr.get_sh_flags();
- 	      info.contents = NULL;
-@@ -3060,7 +3062,8 @@ const unsigned char*
- Object::decompressed_section_contents(
-     unsigned int shndx,
-     section_size_type* plen,
--    bool* is_new)
-+    bool* is_new,
-+    uint64_t* palign)
- {
-   section_size_type buffer_size;
-   const unsigned char* buffer = this->do_section_contents(shndx, &buffer_size,
-@@ -3087,6 +3090,8 @@ Object::decompressed_section_contents(
-     {
-       *plen = uncompressed_size;
-       *is_new = false;
-+      if (palign != NULL)
-+	*palign = p->second.addralign;
-       return p->second.contents;
-     }
- 
-@@ -3108,6 +3113,8 @@ Object::decompressed_section_contents(
-   // once in this pass.
-   *plen = uncompressed_size;
-   *is_new = true;
-+  if (palign != NULL)
-+    *palign = p->second.addralign;
-   return uncompressed_data;
- }
- 
-diff --git a/gold/object.h b/gold/object.h
-index 0b786a5471..b99548463d 100644
---- a/gold/object.h
-+++ b/gold/object.h
-@@ -373,6 +373,7 @@ struct Compressed_section_info
- {
-   section_size_type size;
-   elfcpp::Elf_Xword flag;
-+  uint64_t addralign;
-   const unsigned char* contents;
- };
- typedef std::map<unsigned int, Compressed_section_info> Compressed_section_map;
-@@ -808,7 +809,8 @@ class Object
- 
-   bool
-   section_is_compressed(unsigned int shndx,
--			section_size_type* uncompressed_size) const
-+			section_size_type* uncompressed_size,
-+			elfcpp::Elf_Xword* palign = NULL) const
-   {
-     if (this->compressed_sections_ == NULL)
-       return false;
-@@ -818,6 +820,8 @@ class Object
-       {
- 	if (uncompressed_size != NULL)
- 	  *uncompressed_size = p->second.size;
-+	if (palign != NULL)
-+	  *palign = p->second.addralign;
- 	return true;
-       }
-     return false;
-@@ -828,7 +832,7 @@ class Object
-   // by the caller.
-   const unsigned char*
-   decompressed_section_contents(unsigned int shndx, section_size_type* plen,
--				bool* is_cached);
-+				bool* is_cached, uint64_t* palign = NULL);
- 
-   // Discard any buffers of decompressed sections.  This is done
-   // at the end of the Add_symbols task.
-diff --git a/gold/output.cc b/gold/output.cc
-index 1701db1c99..75ac3bcf97 100644
---- a/gold/output.cc
-+++ b/gold/output.cc
-@@ -2448,7 +2448,13 @@ Output_section::add_input_section(Layout* layout,
- 				  unsigned int reloc_shndx,
- 				  bool have_sections_script)
- {
-+  section_size_type input_section_size = shdr.get_sh_size();
-+  section_size_type uncompressed_size;
-   elfcpp::Elf_Xword addralign = shdr.get_sh_addralign();
-+  if (object->section_is_compressed(shndx, &uncompressed_size,
-+				    &addralign))
-+    input_section_size = uncompressed_size;
-+
-   if ((addralign & (addralign - 1)) != 0)
-     {
-       object->error(_("invalid alignment %lu for section \"%s\""),
-@@ -2498,11 +2504,6 @@ Output_section::add_input_section(Layout* layout,
- 	}
-     }
- 
--  section_size_type input_section_size = shdr.get_sh_size();
--  section_size_type uncompressed_size;
--  if (object->section_is_compressed(shndx, &uncompressed_size))
--    input_section_size = uncompressed_size;
--
-   off_t offset_in_section;
- 
-   if (this->has_fixed_layout())
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-17358.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-17358.patch
deleted file mode 100644
index d5a1ea1dc4..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2018-17358.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From 30838132997e6a3cfe3ec11c58b32b22f6f6b102 Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Thu, 20 Sep 2018 15:29:17 +0930
-Subject: [PATCH] Bug 23686, two segment faults in nm
-
-Fixes the bugs exposed by the testcases in the PR, plus two more bugs
-I noticed when looking at _bfd_stab_section_find_nearest_line.
-
-	PR 23686
-	* dwarf2.c (read_section): Error when attempting to malloc
-	"(bfd_size_type) -1".
-	* syms.c (_bfd_stab_section_find_nearest_line): Bounds check
-	function_name.  Bounds check reloc address.  Formatting.  Ensure
-	.stabstr zero terminated.
-CVE: CVE-2018-17358 and CVE-2018-17359
-Upstream-Status: Backport
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- bfd/ChangeLog |  9 +++++++++
- bfd/dwarf2.c  |  9 ++++++++-
- bfd/syms.c    | 22 ++++++++++++++++------
- 3 files changed, 33 insertions(+), 7 deletions(-)
-
---- a/bfd/dwarf2.c
-+++ b/bfd/dwarf2.c
-@@ -527,6 +527,7 @@ read_section (bfd *	      abfd,
-   asection *msec;
-   const char *section_name = sec->uncompressed_name;
-   bfd_byte *contents = *section_buffer;
-+  bfd_size_type amt;
- 
-   /* The section may have already been read.  */
-   if (contents == NULL)
-@@ -549,7 +550,13 @@ read_section (bfd *	      abfd,
-       *section_size = msec->rawsize ? msec->rawsize : msec->size;
-       /* Paranoia - alloc one extra so that we can make sure a string
- 	 section is NUL terminated.  */
--      contents = (bfd_byte *) bfd_malloc (*section_size + 1);
-+      amt = *section_size + 1;
-+      if (amt == 0)
-+	{
-+	  bfd_set_error (bfd_error_no_memory);
-+	  return FALSE;
-+	}
-+      contents = (bfd_byte *) bfd_malloc (amt);
-       if (contents == NULL)
- 	return FALSE;
-       if (syms
---- a/bfd/syms.c
-+++ b/bfd/syms.c
-@@ -1035,6 +1035,10 @@ _bfd_stab_section_find_nearest_line (bfd
- 					 0, strsize))
- 	return FALSE;
- 
-+      /* Stab strings ought to be nul terminated.  Ensure the last one
-+	 is, to prevent running off the end of the buffer.  */
-+      info->strs[strsize - 1] = 0;
-+
-       /* If this is a relocatable object file, we have to relocate
- 	 the entries in .stab.  This should always be simple 32 bit
- 	 relocations against symbols defined in this object file, so
-@@ -1073,7 +1077,8 @@ _bfd_stab_section_find_nearest_line (bfd
- 		  || r->howto->bitsize != 32
- 		  || r->howto->pc_relative
- 		  || r->howto->bitpos != 0
--		  || r->howto->dst_mask != 0xffffffff)
-+		  || r->howto->dst_mask != 0xffffffff
-+		  || r->address * bfd_octets_per_byte (abfd) + 4 > stabsize)
- 		{
- 		  _bfd_error_handler
- 		    (_("unsupported .stab relocation"));
-@@ -1195,7 +1200,8 @@ _bfd_stab_section_find_nearest_line (bfd
- 		{
- 		  nul_fun = stab;
- 		  nul_str = str;
--		  if (file_name >= (char *) info->strs + strsize || file_name < (char *) str)
-+		  if (file_name >= (char *) info->strs + strsize
-+		      || file_name < (char *) str)
- 		    file_name = NULL;
- 		  if (stab + STABSIZE + TYPEOFF < info->stabs + stabsize
- 		      && *(stab + STABSIZE + TYPEOFF) == (bfd_byte) N_SO)
-@@ -1206,7 +1212,8 @@ _bfd_stab_section_find_nearest_line (bfd
- 		      directory_name = file_name;
- 		      file_name = ((char *) str
- 				   + bfd_get_32 (abfd, stab + STRDXOFF));
--		      if (file_name >= (char *) info->strs + strsize || file_name < (char *) str)
-+		      if (file_name >= (char *) info->strs + strsize
-+			  || file_name < (char *) str)
- 			file_name = NULL;
- 		    }
- 		}
-@@ -1217,7 +1224,8 @@ _bfd_stab_section_find_nearest_line (bfd
- 	      file_name = (char *) str + bfd_get_32 (abfd, stab + STRDXOFF);
- 	      /* PR 17512: file: 0c680a1f.  */
- 	      /* PR 17512: file: 5da8aec4.  */
--	      if (file_name >= (char *) info->strs + strsize || file_name < (char *) str)
-+	      if (file_name >= (char *) info->strs + strsize
-+		  || file_name < (char *) str)
- 		file_name = NULL;
- 	      break;
- 
-@@ -1226,7 +1234,8 @@ _bfd_stab_section_find_nearest_line (bfd
- 	      function_name = (char *) str + bfd_get_32 (abfd, stab + STRDXOFF);
- 	      if (function_name == (char *) str)
- 		continue;
--	      if (function_name >= (char *) info->strs + strsize)
-+	      if (function_name >= (char *) info->strs + strsize
-+		  || function_name < (char *) str)
- 		function_name = NULL;
- 
- 	      nul_fun = NULL;
-@@ -1335,7 +1344,8 @@ _bfd_stab_section_find_nearest_line (bfd
- 	  if (val <= offset)
- 	    {
- 	      file_name = (char *) str + bfd_get_32 (abfd, stab + STRDXOFF);
--	      if (file_name >= (char *) info->strs + strsize || file_name < (char *) str)
-+	      if (file_name >= (char *) info->strs + strsize
-+		  || file_name < (char *) str)
- 		file_name = NULL;
- 	      *pline = 0;
- 	    }
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-17360.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-17360.patch
deleted file mode 100644
index 45c637967b..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2018-17360.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From cf93e9c2cf8f8b2566f8fc86e961592b51b5980d Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Thu, 20 Sep 2018 18:23:17 +0930
-Subject: [PATCH] PR23685, buffer overflow
-
-	PR 23685
-	* peXXigen.c (pe_print_edata): Correct export address table
-	overflow checks.  Check dataoff against section size too.
-
-CVE: CVE-2018-17360
-Upstream-Status: Backport
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- bfd/ChangeLog  |  6 ++++++
- bfd/peXXigen.c | 11 ++++++-----
- 2 files changed, 12 insertions(+), 5 deletions(-)
-
---- a/bfd/peXXigen.c
-+++ b/bfd/peXXigen.c
-@@ -1661,7 +1661,8 @@ pe_print_edata (bfd * abfd, void * vfile
- 
-       dataoff = addr - section->vma;
-       datasize = extra->DataDirectory[PE_EXPORT_TABLE].Size;
--      if (datasize > section->size - dataoff)
-+      if (dataoff > section->size
-+	  || datasize > section->size - dataoff)
- 	{
- 	  fprintf (file,
- 		   _("\nThere is an export table in %s, but it does not fit into that section\n"),
-@@ -1778,11 +1779,11 @@ pe_print_edata (bfd * abfd, void * vfile
- 	  edt.base);
- 
-   /* PR 17512: Handle corrupt PE binaries.  */
--  if (edt.eat_addr + (edt.num_functions * 4) - adj >= datasize
-+  /* PR 17512 file: 140-165018-0.004.  */
-+  if (edt.eat_addr - adj >= datasize
-       /* PR 17512: file: 092b1829 */
--      || (edt.num_functions * 4) < edt.num_functions
--      /* PR 17512 file: 140-165018-0.004.  */
--      || data + edt.eat_addr - adj < data)
-+      || (edt.num_functions + 1) * 4 < edt.num_functions
-+      || edt.eat_addr - adj + (edt.num_functions + 1) * 4 > datasize)
-     fprintf (file, _("\tInvalid Export Address Table rva (0x%lx) or entry count (0x%lx)\n"),
- 	     (long) edt.eat_addr,
- 	     (long) edt.num_functions);
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-18309.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-18309.patch
deleted file mode 100644
index 010e6b5d53..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2018-18309.patch
+++ /dev/null
@@ -1,251 +0,0 @@
-From 0930cb3021b8078b34cf216e79eb8608d017864f Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Sat, 13 Oct 2018 22:03:02 +1030
-Subject: [PATCH] _bfd_clear_contents bounds checking
-
-This PR shows a fuzzed binary triggering a segfault via a bad
-relocation in .debug_line.  It turns out that unlike normal
-relocations applied to a section, the linker applies those with
-symbols from discarded sections via _bfd_clear_contents without
-checking that the relocation is within the section bounds.  The same
-thing now happens when reading debug sections since commit
-a4cd947aca23, the PR23425 fix.
-
-	PR 23770
-	PR 23425
-	* reloc.c (_bfd_clear_contents): Replace "location" param with
-	"buf" and "off".  Bounds check "off".  Return status.
-	* cofflink.c (_bfd_coff_generic_relocate_section): Update
-	_bfd_clear_contents call.
-	* elf-bfd.h (RELOC_AGAINST_DISCARDED_SECTION): Likewise.
-	* elf32-arc.c (elf_arc_relocate_section): Likewise.
-	* elf32-i386.c (elf_i386_relocate_section): Likewise.
-	* elf32-metag.c (metag_final_link_relocate): Likewise.
-	* elf32-nds32.c (nds32_elf_get_relocated_section_contents): Likewise.
-	* elf32-ppc.c (ppc_elf_relocate_section): Likewise.
-	* elf32-visium.c (visium_elf_relocate_section): Likewise.
-	* elf64-ppc.c (ppc64_elf_relocate_section): Likewise.
-	* elf64-x86-64.c *(elf_x86_64_relocate_section): Likewise.
-	* libbfd-in.h (_bfd_clear_contents): Update prototype.
-	* libbfd.h: Regenerate.
-
-Upstream-Status: Backport
-CVE: CVE-2018-18605
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- bfd/ChangeLog      | 20 ++++++++++++++++++++
- bfd/cofflink.c     |  2 +-
- bfd/elf-bfd.h      |  2 +-
- bfd/elf32-arc.c    |  2 +-
- bfd/elf32-i386.c   |  2 +-
- bfd/elf32-metag.c  |  2 +-
- bfd/elf32-nds32.c  |  8 ++++----
- bfd/elf32-ppc.c    |  2 +-
- bfd/elf32-visium.c |  2 +-
- bfd/elf64-ppc.c    |  2 +-
- bfd/elf64-x86-64.c |  2 +-
- bfd/libbfd-in.h    |  4 ++--
- bfd/libbfd.h       |  4 ++--
- bfd/reloc.c        | 19 +++++++++++++------
- 14 files changed, 50 insertions(+), 23 deletions(-)
-
---- a/bfd/cofflink.c
-+++ b/bfd/cofflink.c
-@@ -3080,7 +3080,7 @@ _bfd_coff_generic_relocate_section (bfd
-       if (sec != NULL && discarded_section (sec))
- 	{
- 	  _bfd_clear_contents (howto, input_bfd, input_section,
--			       contents + (rel->r_vaddr - input_section->vma));
-+			       contents, rel->r_vaddr - input_section->vma);
- 	  continue;
- 	}
- 
---- a/bfd/elf-bfd.h
-+++ b/bfd/elf-bfd.h
-@@ -2811,7 +2811,7 @@ extern asection _bfd_elf_large_com_secti
-   {									\
-     int i_;								\
-     _bfd_clear_contents (howto, input_bfd, input_section,		\
--			 contents + rel[index].r_offset);		\
-+			 contents, rel[index].r_offset);		\
- 									\
-     if (bfd_link_relocatable (info)					\
- 	&& (input_section->flags & SEC_DEBUGGING))			\
---- a/bfd/elf32-arc.c
-+++ b/bfd/elf32-arc.c
-@@ -1552,7 +1552,7 @@ elf_arc_relocate_section (bfd *			  outp
-       if (sec != NULL && discarded_section (sec))
- 	{
- 	  _bfd_clear_contents (howto, input_bfd, input_section,
--			       contents + rel->r_offset);
-+			       contents, rel->r_offset);
- 	  rel->r_info = 0;
- 	  rel->r_addend = 0;
- 
---- a/bfd/elf32-i386.c
-+++ b/bfd/elf32-i386.c
-@@ -2197,7 +2197,7 @@ elf_i386_relocate_section (bfd *output_b
-       if (sec != NULL && discarded_section (sec))
- 	{
- 	  _bfd_clear_contents (howto, input_bfd, input_section,
--			       contents + rel->r_offset);
-+			       contents, rel->r_offset);
- 	  wrel->r_offset = rel->r_offset;
- 	  wrel->r_info = 0;
- 	  wrel->r_addend = 0;
---- a/bfd/elf32-metag.c
-+++ b/bfd/elf32-metag.c
-@@ -1396,7 +1396,7 @@ metag_final_link_relocate (reloc_howto_t
- 					      rel, relend, howto, contents) \
-   {									\
-     _bfd_clear_contents (howto, input_bfd, input_section,		\
--			 contents + rel->r_offset);			\
-+			 contents, rel->r_offset);			\
- 									\
-     if (bfd_link_relocatable (info)					\
- 	&& (input_section->flags & SEC_DEBUGGING))			\
---- a/bfd/elf32-nds32.c
-+++ b/bfd/elf32-nds32.c
-@@ -12582,14 +12582,14 @@ nds32_elf_get_relocated_section_contents
- 	  symbol = *(*parent)->sym_ptr_ptr;
- 	  if (symbol->section && discarded_section (symbol->section))
- 	    {
--	      bfd_byte *p;
-+	      bfd_vma off;
- 	      static reloc_howto_type none_howto
- 		= HOWTO (0, 0, 0, 0, FALSE, 0, complain_overflow_dont, NULL,
- 			 "unused", FALSE, 0, 0, FALSE);
- 
--	      p = data + (*parent)->address * bfd_octets_per_byte (input_bfd);
--	      _bfd_clear_contents ((*parent)->howto, input_bfd, input_section,
--				   p);
-+	      off = (*parent)->address * bfd_octets_per_byte (input_bfd);
-+	      _bfd_clear_contents ((*parent)->howto, input_bfd,
-+				   input_section, data, off);
- 	      (*parent)->sym_ptr_ptr = bfd_abs_section_ptr->symbol_ptr_ptr;
- 	      (*parent)->addend = 0;
- 	      (*parent)->howto = &none_howto;
---- a/bfd/elf32-ppc.c
-+++ b/bfd/elf32-ppc.c
-@@ -8232,7 +8232,7 @@ ppc_elf_relocate_section (bfd *output_bf
- 	    howto = ppc_elf_howto_table[r_type];
- 
- 	  _bfd_clear_contents (howto, input_bfd, input_section,
--			       contents + rel->r_offset);
-+			       contents, rel->r_offset);
- 	  wrel->r_offset = rel->r_offset;
- 	  wrel->r_info = 0;
- 	  wrel->r_addend = 0;
---- a/bfd/elf32-visium.c
-+++ b/bfd/elf32-visium.c
-@@ -621,7 +621,7 @@ visium_elf_relocate_section (bfd *output
- 	     or sections discarded by a linker script, we just want the
- 	     section contents zeroed.  Avoid any special processing.  */
- 	  _bfd_clear_contents (howto, input_bfd, input_section,
--			       contents + rel->r_offset);
-+			       contents, rel->r_offset);
- 
- 	  rel->r_info = 0;
- 	  rel->r_addend = 0;
---- a/bfd/elf64-ppc.c
-+++ b/bfd/elf64-ppc.c
-@@ -14074,7 +14074,7 @@ ppc64_elf_relocate_section (bfd *output_
- 	{
- 	  _bfd_clear_contents (ppc64_elf_howto_table[r_type],
- 			       input_bfd, input_section,
--			       contents + rel->r_offset);
-+			       contents, rel->r_offset);
- 	  wrel->r_offset = rel->r_offset;
- 	  wrel->r_info = 0;
- 	  wrel->r_addend = 0;
---- a/bfd/elf64-x86-64.c
-+++ b/bfd/elf64-x86-64.c
-@@ -2490,7 +2490,7 @@ elf_x86_64_relocate_section (bfd *output
-       if (sec != NULL && discarded_section (sec))
- 	{
- 	  _bfd_clear_contents (howto, input_bfd, input_section,
--			       contents + rel->r_offset);
-+			       contents, rel->r_offset);
- 	  wrel->r_offset = rel->r_offset;
- 	  wrel->r_info = 0;
- 	  wrel->r_addend = 0;
---- a/bfd/libbfd-in.h
-+++ b/bfd/libbfd-in.h
-@@ -696,8 +696,8 @@ extern bfd_reloc_status_type _bfd_reloca
-   (reloc_howto_type *, bfd *, bfd_vma, bfd_byte *) ATTRIBUTE_HIDDEN;
- 
- /* Clear a given location using a given howto.  */
--extern void _bfd_clear_contents
--  (reloc_howto_type *, bfd *, asection *, bfd_byte *) ATTRIBUTE_HIDDEN;
-+extern bfd_reloc_status_type _bfd_clear_contents
-+  (reloc_howto_type *, bfd *, asection *, bfd_byte *, bfd_vma) ATTRIBUTE_HIDDEN;
- 
- /* Link stabs in sections in the first pass.  */
- 
---- a/bfd/libbfd.h
-+++ b/bfd/libbfd.h
-@@ -701,8 +701,8 @@ extern bfd_reloc_status_type _bfd_reloca
-   (reloc_howto_type *, bfd *, bfd_vma, bfd_byte *) ATTRIBUTE_HIDDEN;
- 
- /* Clear a given location using a given howto.  */
--extern void _bfd_clear_contents
--  (reloc_howto_type *, bfd *, asection *, bfd_byte *) ATTRIBUTE_HIDDEN;
-+extern bfd_reloc_status_type _bfd_clear_contents
-+  (reloc_howto_type *, bfd *, asection *, bfd_byte *, bfd_vma) ATTRIBUTE_HIDDEN;
- 
- /* Link stabs in sections in the first pass.  */
- 
---- a/bfd/reloc.c
-+++ b/bfd/reloc.c
-@@ -1613,16 +1613,22 @@ _bfd_relocate_contents (reloc_howto_type
-    relocations against discarded symbols, to make ignorable debug or unwind
-    information more obvious.  */
- 
--void
-+bfd_reloc_status_type
- _bfd_clear_contents (reloc_howto_type *howto,
- 		     bfd *input_bfd,
- 		     asection *input_section,
--		     bfd_byte *location)
-+		     bfd_byte *buf,
-+		     bfd_vma off)
- {
-   int size;
-   bfd_vma x = 0;
-+  bfd_byte *location;
-+
-+  if (!bfd_reloc_offset_in_range (howto, input_bfd, input_section, off))
-+    return bfd_reloc_outofrange;
- 
-   /* Get the value we are going to relocate.  */
-+  location = buf + off;
-   size = bfd_get_reloc_size (howto);
-   switch (size)
-     {
-@@ -1681,6 +1687,7 @@ _bfd_clear_contents (reloc_howto_type *h
- #endif
-       break;
-     }
-+  return bfd_reloc_ok;
- }
- 
- /*
-@@ -8268,14 +8275,14 @@ bfd_generic_get_relocated_section_conten
- 
- 	  if (symbol->section && discarded_section (symbol->section))
- 	    {
--	      bfd_byte *p;
-+	      bfd_vma off;
- 	      static reloc_howto_type none_howto
- 		= HOWTO (0, 0, 0, 0, FALSE, 0, complain_overflow_dont, NULL,
- 			 "unused", FALSE, 0, 0, FALSE);
- 
--	      p = data + (*parent)->address * bfd_octets_per_byte (input_bfd);
--	      _bfd_clear_contents ((*parent)->howto, input_bfd, input_section,
--				   p);
-+	      off = (*parent)->address * bfd_octets_per_byte (input_bfd);
-+	      _bfd_clear_contents ((*parent)->howto, input_bfd,
-+				   input_section, data, off);
- 	      (*parent)->sym_ptr_ptr = bfd_abs_section_ptr->symbol_ptr_ptr;
- 	      (*parent)->addend = 0;
- 	      (*parent)->howto = &none_howto;
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-18605.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-18605.patch
deleted file mode 100644
index a117f95df1..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2018-18605.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From ab419ddbb2cdd17ca83618990f2cacf904ce1d61 Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Tue, 23 Oct 2018 18:29:24 +1030
-Subject: [PATCH] PR23804, buffer overflow in sec_merge_hash_lookup
-
-	PR 23804
-	* merge.c (_bfd_add_merge_section): Don't attempt to merge
-	sections where size is not a multiple of entsize.
-
-Upstream-Status: Backport
-CVE: CVE-2018-18605
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- bfd/ChangeLog | 6 ++++++
- bfd/merge.c   | 3 +++
- 2 files changed, 9 insertions(+)
-
---- a/bfd/merge.c
-+++ b/bfd/merge.c
-@@ -376,6 +376,9 @@ _bfd_add_merge_section (bfd *abfd, void
-       || sec->entsize == 0)
-     return TRUE;
- 
-+  if (sec->size % sec->entsize != 0)
-+    return TRUE;
-+
-   if ((sec->flags & SEC_RELOC) != 0)
-     {
-       /* We aren't prepared to handle relocations in merged sections.  */
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-18606.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-18606.patch
deleted file mode 100644
index 325c339b88..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2018-18606.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 45a0eaf77022963d639d6d19871dbab7b79703fc Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Tue, 23 Oct 2018 19:02:06 +1030
-Subject: [PATCH] PR23806, NULL pointer dereference in merge_strings
-
-	PR 23806
-	* merge.c (_bfd_add_merge_section): Don't attempt to merge
-	sections with ridiculously large alignments.
-
-Upstream-Status: Backport
-CVE: CVE-2018-18606
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- bfd/ChangeLog |  6 ++++++
- bfd/merge.c   | 15 +++++++++++----
- 2 files changed, 17 insertions(+), 4 deletions(-)
-
---- a/bfd/merge.c
-+++ b/bfd/merge.c
-@@ -24,6 +24,7 @@
-    as used in ELF SHF_MERGE.  */
- 
- #include "sysdep.h"
-+#include <limits.h>
- #include "bfd.h"
- #include "elf-bfd.h"
- #include "libbfd.h"
-@@ -385,12 +386,18 @@ _bfd_add_merge_section (bfd *abfd, void
-       return TRUE;
-     }
- 
--  align = sec->alignment_power;
--  if ((sec->entsize < (unsigned) 1 << align
-+#ifndef CHAR_BIT
-+#define CHAR_BIT 8
-+#endif
-+  if (sec->alignment_power >= sizeof (align) * CHAR_BIT)
-+    return TRUE;
-+
-+  align = 1u << sec->alignment_power;
-+  if ((sec->entsize < align
-        && ((sec->entsize & (sec->entsize - 1))
- 	   || !(sec->flags & SEC_STRINGS)))
--      || (sec->entsize > (unsigned) 1 << align
--	  && (sec->entsize & (((unsigned) 1 << align) - 1))))
-+      || (sec->entsize > align
-+	  && (sec->entsize & (align - 1))))
-     {
-       /* Sanity check.  If string character size is smaller than
- 	 alignment, then we require character size to be a power
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-18607.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-18607.patch
deleted file mode 100644
index 902a90dbc3..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2018-18607.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 102def4da826b3d9e169741421e5e67e8731909a Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Tue, 23 Oct 2018 18:30:22 +1030
-Subject: [PATCH] PR23805, NULL pointer dereference in elf_link_input_bfd
-
-	PR 23805
-	* elflink.c (elf_link_input_bfd): Don't segfault on finding
-	STT_TLS symbols without any TLS sections.  Instead, change the
-	symbol type to STT_NOTYPE.
-
-Upstream-Status: Backport
-CVE: CVE-2018-18606
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- bfd/ChangeLog |  7 +++++++
- bfd/elflink.c | 20 ++++++++++++++------
- 2 files changed, 21 insertions(+), 6 deletions(-)
-
---- a/bfd/elflink.c
-+++ b/bfd/elflink.c
-@@ -10496,8 +10496,11 @@ elf_link_input_bfd (struct elf_final_lin
- 	  if (ELF_ST_TYPE (osym.st_info) == STT_TLS)
- 	    {
- 	      /* STT_TLS symbols are relative to PT_TLS segment base.  */
--	      BFD_ASSERT (elf_hash_table (flinfo->info)->tls_sec != NULL);
--	      osym.st_value -= elf_hash_table (flinfo->info)->tls_sec->vma;
-+	      if (elf_hash_table (flinfo->info)->tls_sec != NULL)
-+		osym.st_value -= elf_hash_table (flinfo->info)->tls_sec->vma;
-+	      else
-+		osym.st_info = ELF_ST_INFO (ELF_ST_BIND (osym.st_info),
-+					    STT_NOTYPE);
- 	    }
- 	}
- 
-@@ -11053,12 +11056,17 @@ elf_link_input_bfd (struct elf_final_lin
- 			      sym.st_value += osec->vma;
- 			      if (ELF_ST_TYPE (sym.st_info) == STT_TLS)
- 				{
-+				  struct elf_link_hash_table *htab
-+				    = elf_hash_table (flinfo->info);
-+
- 				  /* STT_TLS symbols are relative to PT_TLS
- 				     segment base.  */
--				  BFD_ASSERT (elf_hash_table (flinfo->info)
--					      ->tls_sec != NULL);
--				  sym.st_value -= (elf_hash_table (flinfo->info)
--						   ->tls_sec->vma);
-+				  if (htab->tls_sec != NULL)
-+				    sym.st_value -= htab->tls_sec->vma;
-+				  else
-+				    sym.st_info
-+				      = ELF_ST_INFO (ELF_ST_BIND (sym.st_info),
-+						     STT_NOTYPE);
- 				}
- 			    }
- 
diff --git a/meta/recipes-devtools/binutils/binutils/clang-bfd-fix.patch b/meta/recipes-devtools/binutils/binutils/clang-bfd-fix.patch
deleted file mode 100644
index 29c0d48fed..0000000000
--- a/meta/recipes-devtools/binutils/binutils/clang-bfd-fix.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Fix compiler error seen with clang, The return value of this
-function is not checked anywhere so in a way its useless but
-still technically correct to return a value here
-
-Fixes
-
-../../bfd/reloc.c:1638:7: error: non-void function '_bfd_clear_contents' should return a value [-Wreturn-type]
-      return;
-      ^
-1 error generated.
-
-It has been fixed in master along with a larger cleanup and fix for relocations
-
-https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=1dc9e2d63e37839ff1768346b2e3f52e338baba5
-
-Upstream-Status: Backport [Fixes differently]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/bfd/reloc.c
-+++ b/bfd/reloc.c
-@@ -1629,7 +1629,7 @@ _bfd_clear_contents (reloc_howto_type *h
-     default:
-       abort ();
-     case 0:
--      return;
-+      return 0;
-     case 1:
-       x = bfd_get_8 (input_bfd, location);
-       break;
diff --git a/meta/recipes-devtools/binutils/binutils_2.31.bb b/meta/recipes-devtools/binutils/binutils_2.32.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils_2.31.bb
rename to meta/recipes-devtools/binutils/binutils_2.32.bb
-- 
2.20.1


