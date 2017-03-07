Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 90EAD71A18
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 08:20:21 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id o126so24674760pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 00:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S+4VyN0zimoMc0dyLpbJGgly9KaH/c7dUww3oqPrcD4=;
	b=Z9hSsgbmDJ0YcXTTrOgC7i/dNXWJ09cKyoFL1F8+PGt+xff2NZfENivjic75vqN8Nq
	l5x9Uu6O2BkgyUYN7VQfTHMfZn9yaJhQ8GvQmtfF8wIEHNvZUyuy+ItWJBgKI2rpK9AD
	JSFABVdL6kTZte50o3cWRpiWq/vqBIvBtbvGpQuNiccP2XdIUcsvzMgPtViJNIc5/vHx
	0Hg3xnIOUrIOIttQfl7JSKXQZHzlI6eOa5fyl0KPfpW9cU0flSWFzdmohRb4XoUJUXPK
	jVUdr9CyHP3/pzgyU4aSzOC2aqmIS2ftKvQlUUnHAXNR7QC+RPDig+E6O17Dsnv133Du
	+S5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S+4VyN0zimoMc0dyLpbJGgly9KaH/c7dUww3oqPrcD4=;
	b=JnsMi0W/Z2RRFMpcguBAbZT1BgnIxHDlggI1KdhKh6tfoHFeeCcNJPiPDFIxzUm98c
	nZFtjKuFLU7h6yKagICNu8iQtlVy8anD2IiYtTbn10gZhGQny5dG/X8YZPNVxrPaDHq3
	LkZc7w/2MhgW7hkUNh07ySUhcsHRUIorK31M6qQUfrAxAIovUMqtJSqodCK64DCWi/kp
	LyrPNv7xFA4QhH0LRhXl65YRXLp4+zTiU8JGWsBdIR7gARNQ5L6Y5wIX5f4ikp9G0cAb
	1zAKyhzuqV1zo9V6PFkvujqwpOUC5i1wyjdqwKDkUuWZHOsAd8WXNG6VB7mw5QmbTOvY
	bmlg==
X-Gm-Message-State: AMke39mUkMusKw0xOgp4R9aJXOeHWXAeSxs/Mjt/ZThNp/qJrdk3Uc/idQg1zJLgcB4qPw==
X-Received: by 10.98.74.9 with SMTP id x9mr26562395pfa.29.1488874820047;
	Tue, 07 Mar 2017 00:20:20 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a8sm44104243pfa.30.2017.03.07.00.20.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Mar 2017 00:20:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Mar 2017 00:20:09 -0800
Message-Id: <20409d4b42b9861baf12d48b3eb9f052391eea34.1488874598.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1488874598.git.raj.khem@gmail.com>
References: <cover.1488874598.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] binutils: Upgrade to 2.28 release
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
X-List-Received-Date: Tue, 07 Mar 2017 08:20:21 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../{binutils-2.27.inc => binutils-2.28.inc}       |   33 +-
 ...ian_2.27.bb => binutils-cross-canadian_2.28.bb} |    0
 meta/recipes-devtools/binutils/binutils-cross.inc  |    2 +-
 ...nutils-cross_2.27.bb => binutils-cross_2.28.bb} |    0
 ...-crosssdk_2.27.bb => binutils-crosssdk_2.28.bb} |    2 +-
 ...utils-crosssdk-Generate-relocatable-SDKs.patch} |   16 +-
 ...01-ppc-apuinfo-for-spe-parsed-incorrectly.patch |   37 -
 ...ss-Do-not-generate-linker-script-directo.patch} |   26 +-
 ...03-gprof-add-uclibc-support-to-configure.patch} |   37 +-
 ...=> 0004-Point-scripts-location-to-libdir.patch} |   12 +-
 ...e-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} |   12 +-
 ...0006-Explicitly-link-with-libm-on-uclibc.patch} |   12 +-
 ...ibtool-2.4.patch => 0007-Use-libtool-2.4.patch} | 1046 ++++++++++----------
 ...-Add-the-armv5e-architecture-to-binutils.patch} |   10 +-
 ...e-distro-compiler-point-to-the-wrong-ins.patch} |   10 +-
 ...s-of-system-directories-when-cross-linki.patch} |   42 +-
 ...rpath-in-libtool-when-sysroot-is-enabled.patch} |    8 +-
 ...hange-default-emulation-for-mips64-linux.patch} |   14 +-
 ...tch => 0013-Add-support-for-Netlogic-XLP.patch} |   74 +-
 ...correct-assembling-for-ppc-wait-mnemonic.patch} |   12 +-
 ..._sections-check-to-only-consider-compact-.patch |   97 --
 .../0015-binutils-mips-gas-pic-relax-linkonce.diff |   65 --
 ...tch => 0015-sync-with-OE-libtool-changes.patch} |   57 +-
 ...lt-in-ARM-linker-when-trying-to-parse-a-b.patch |   31 -
 ...eration-of-alignment-frags-in-code-sectio.patch |  139 ---
 .../{binutils_2.27.bb => binutils_2.28.bb}         |    0
 27 files changed, 673 insertions(+), 1123 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.27.inc => binutils-2.28.inc} (47%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.27.bb => binutils-cross-canadian_2.28.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.27.bb => binutils-cross_2.28.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.27.bb => binutils-crosssdk_2.28.bb} (80%)
 rename meta/recipes-devtools/binutils/binutils/{0001-Generate-relocatable-SDKs.patch => 0001-binutils-crosssdk-Generate-relocatable-SDKs.patch} (84%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch
 rename meta/recipes-devtools/binutils/binutils/{no-tooldirpaths.patch => 0002-binutils-cross-Do-not-generate-linker-script-directo.patch} (75%)
 rename meta/recipes-devtools/binutils/binutils/{0002-configure-widen-the-regexp-for-SH-architectures.patch => 0003-gprof-add-uclibc-support-to-configure.patch} (42%)
 rename meta/recipes-devtools/binutils/binutils/{0003-Point-scripts-location-to-libdir.patch => 0004-Point-scripts-location-to-libdir.patch} (80%)
 rename meta/recipes-devtools/binutils/binutils/{0004-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch => 0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} (79%)
 rename meta/recipes-devtools/binutils/binutils/{0005-Explicitly-link-with-libm-on-uclibc.patch => 0006-Explicitly-link-with-libm-on-uclibc.patch} (84%)
 rename meta/recipes-devtools/binutils/binutils/{0006-Use-libtool-2.4.patch => 0007-Use-libtool-2.4.patch} (97%)
 rename meta/recipes-devtools/binutils/binutils/{0007-Add-the-armv5e-architecture-to-binutils.patch => 0008-Add-the-armv5e-architecture-to-binutils.patch} (83%)
 rename meta/recipes-devtools/binutils/binutils/{0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch => 0009-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch} (82%)
 rename meta/recipes-devtools/binutils/binutils/{0009-warn-for-uses-of-system-directories-when-cross-linki.patch => 0010-warn-for-uses-of-system-directories-when-cross-linki.patch} (90%)
 rename meta/recipes-devtools/binutils/binutils/{0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch => 0011-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch} (90%)
 rename meta/recipes-devtools/binutils/binutils/{0011-Change-default-emulation-for-mips64-linux.patch => 0012-Change-default-emulation-for-mips64-linux.patch} (88%)
 rename meta/recipes-devtools/binutils/binutils/{0012-Add-support-for-Netlogic-XLP.patch => 0013-Add-support-for-Netlogic-XLP.patch} (90%)
 rename meta/recipes-devtools/binutils/binutils/{0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch => 0014-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch} (76%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0015-binutils-mips-gas-pic-relax-linkonce.diff
 rename meta/recipes-devtools/binutils/binutils/{0014-libtool-remove-rpath.patch => 0015-sync-with-OE-libtool-changes.patch} (72%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
 rename meta/recipes-devtools/binutils/{binutils_2.27.bb => binutils_2.28.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index a4b06c94ca..3db16e8fbf 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -24,7 +24,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "6.3%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-BINUVERSION ?= "2.27%"
+BINUVERSION ?= "2.28%"
 GDBVERSION ?= "7.12%"
 GLIBCVERSION ?= "2.25"
 UCLIBCVERSION ?= "1.0%"
diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
similarity index 47%
rename from meta/recipes-devtools/binutils/binutils-2.27.inc
rename to meta/recipes-devtools/binutils/binutils-2.28.inc
index 5a65d91f8b..fcf30357f6 100644
--- a/meta/recipes-devtools/binutils/binutils-2.27.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -18,27 +18,22 @@ BINUPV = "${@binutils_branch_version(d)}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV = "5fe53ce37f9d9dd544ec8cc9e2863b68e1a61f4c"
+SRCREV = "354199c7692c1bed53a2a15f0e4d531457e95f17"
 SRC_URI = "\
      git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
-     file://0002-configure-widen-the-regexp-for-SH-architectures.patch \
-     file://0003-Point-scripts-location-to-libdir.patch \
-     file://0004-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
-     file://0005-Explicitly-link-with-libm-on-uclibc.patch \
-     file://0006-Use-libtool-2.4.patch \
-     file://0007-Add-the-armv5e-architecture-to-binutils.patch \
-     file://0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch \
-     file://0009-warn-for-uses-of-system-directories-when-cross-linki.patch \
-     file://0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
-     file://0011-Change-default-emulation-for-mips64-linux.patch \
-     file://0012-Add-support-for-Netlogic-XLP.patch \
-     file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
-     file://0014-libtool-remove-rpath.patch \
-     file://0015-binutils-mips-gas-pic-relax-linkonce.diff \
-     file://0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch \
-     file://0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch \
-     file://0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch \
-     file://0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch \
+     file://0003-gprof-add-uclibc-support-to-configure.patch \
+     file://0004-Point-scripts-location-to-libdir.patch \
+     file://0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
+     file://0006-Explicitly-link-with-libm-on-uclibc.patch \
+     file://0007-Use-libtool-2.4.patch \
+     file://0008-Add-the-armv5e-architecture-to-binutils.patch \
+     file://0009-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch \
+     file://0010-warn-for-uses-of-system-directories-when-cross-linki.patch \
+     file://0011-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
+     file://0012-Change-default-emulation-for-mips64-linux.patch \
+     file://0013-Add-support-for-Netlogic-XLP.patch \
+     file://0014-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
+     file://0015-sync-with-OE-libtool-changes.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.27.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.28.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.27.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.28.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 7ebd7e3093..5e6f468f2e 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -7,7 +7,7 @@ BPN = "binutils"
 INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
-SRC_URI += "file://no-tooldirpaths.patch"
+SRC_URI += "file://0002-binutils-cross-Do-not-generate-linker-script-directo.patch"
 
 # Specify lib-path else we use a load of search dirs which we don't use
 # and mean the linker scripts have to be relocated.
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.27.bb b/meta/recipes-devtools/binutils/binutils-cross_2.28.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.27.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.28.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.27.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.28.bb
similarity index 80%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.27.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.28.bb
index 62c03d7240..37f4d6d2e9 100644
--- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.27.bb
+++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.28.bb
@@ -6,7 +6,7 @@ PN = "binutils-crosssdk-${SDK_SYS}"
 
 PROVIDES = "virtual/${TARGET_PREFIX}binutils-crosssdk"
 
-SRC_URI += "file://0001-Generate-relocatable-SDKs.patch"
+SRC_URI += "file://0001-binutils-crosssdk-Generate-relocatable-SDKs.patch"
 
 do_configure_prepend () {
 	sed -i 's#/usr/local/lib /lib /usr/lib#${SDKPATHNATIVE}/lib ${SDKPATHNATIVE}/usr/lib /usr/local/lib /lib /usr/lib#' ${S}/ld/configure.tgt
diff --git a/meta/recipes-devtools/binutils/binutils/0001-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
similarity index 84%
rename from meta/recipes-devtools/binutils/binutils/0001-Generate-relocatable-SDKs.patch
rename to meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
index cad704a720..8fb1b4edea 100644
--- a/meta/recipes-devtools/binutils/binutils/0001-Generate-relocatable-SDKs.patch
+++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
@@ -1,7 +1,7 @@
-From 2dae6b137ce609fd008f2063034a4403d95484c5 Mon Sep 17 00:00:00 2001
+From 689d011688b5ff9481d4367bef3dea7a7b2867fb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:58:54 +0000
-Subject: [PATCH 01/13] Generate relocatable SDKs
+Subject: [PATCH 01/15] binutils-crosssdk: Generate relocatable SDKs
 
 This patch will modify the ELF linker scripts so that the crosssdk
 linker will generate binaries with a 4096 bytes PT_INTERP section. When the binaries
@@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index eb262e7..1a3b8bc 100755
+index b6940d376d..a42c4d7a4b 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
 @@ -277,6 +277,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
@@ -43,12 +43,12 @@ index eb262e7..1a3b8bc 100755
  LD_FLAG=
  DATA_ALIGNMENT=${DATA_ALIGNMENT_}
 diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
-index f0c6439..223c55f 100644
+index e65f9a3ccf..d99d2c1d2a 100644
 --- a/ld/scripttempl/elf.sc
 +++ b/ld/scripttempl/elf.sc
-@@ -136,8 +136,8 @@ if test -n "${COMMONPAGESIZE}"; then
-   DATA_SEGMENT_END=". = DATA_SEGMENT_END (.);"
-   DATA_SEGMENT_RELRO_END=". = DATA_SEGMENT_RELRO_END (${SEPARATE_GOTPLT-0}, .);"
+@@ -138,8 +138,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
+     DATA_SEGMENT_RELRO_END=". = DATA_SEGMENT_RELRO_END (${SEPARATE_GOTPLT-0}, .);"
+   fi
  fi
 -if test -z "${INITIAL_READONLY_SECTIONS}${CREATE_SHLIB}"; then
 -  INITIAL_READONLY_SECTIONS=".interp       ${RELOCATING-0} : { *(.interp) }"
@@ -58,5 +58,5 @@ index f0c6439..223c55f 100644
  if test -z "$PLT"; then
    IPLT=".iplt         ${RELOCATING-0} : { *(.iplt) }"
 -- 
-2.9.0
+2.12.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch b/meta/recipes-devtools/binutils/binutils/0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch
deleted file mode 100644
index d82a0b694c..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 8941017bc0226b60ce306d5271df15820ce66a53 Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Tue, 30 Aug 2016 20:57:32 +0930
-Subject: [PATCH] ppc apuinfo for spe parsed incorrectly
-Organization: O.S. Systems Software LTDA.
-
-apuinfo saying SPE resulted in mach = bfd_mach_ppc_vle due to a
-missing break.
-
-	PR 20531
-	* elf32-ppc.c (_bfd_elf_ppc_set_arch): Add missing "break".
-
-
-Backport from :
-https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=8941017b
-
-Upstream-Status: Backport
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- bfd/elf32-ppc.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/bfd/elf32-ppc.c b/bfd/elf32-ppc.c
-index 95ce1dc..e42ef1c 100644
---- a/bfd/elf32-ppc.c
-+++ b/bfd/elf32-ppc.c
-@@ -2246,6 +2246,7 @@ _bfd_elf_ppc_set_arch (bfd *abfd)
- 		case PPC_APUINFO_BRLOCK:
- 		  if (mach != bfd_mach_ppc_vle)
- 		    mach = bfd_mach_ppc_e500;
-+		  break;
- 
- 		case PPC_APUINFO_VLE:
- 		  mach = bfd_mach_ppc_vle;
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/binutils/binutils/no-tooldirpaths.patch b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
similarity index 75%
rename from meta/recipes-devtools/binutils/binutils/no-tooldirpaths.patch
rename to meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
index 2bfc8d4d26..14299fd1ae 100644
--- a/meta/recipes-devtools/binutils/binutils/no-tooldirpaths.patch
+++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
@@ -1,20 +1,31 @@
+From 7c7de107b4b0a507d2aeca3e3a86d01cb4b51360 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Mar 2017 23:37:05 -0800
+Subject: [PATCH 02/15] binutils-cross: Do not generate linker script
+ directories
+
 We don't place target libraries within ${exec_prefix}, we'd always place these
 within the target sysroot within the standard library directories. Worse, the
 append_to_lib_path code prefixes these paths with the sysroot which makes even
 less sense.
 
-These directories therefore don't make sense in our case and mean we have to 
-relocate all the linker scripts if they're present. Dropping them 
+These directories therefore don't make sense in our case and mean we have to
+relocate all the linker scripts if they're present. Dropping them
 gives a reasonable performance improvement/simplification.
 
 Upstream-Status: Inappropriate
 
 RP 2017/01/30
 
-Index: git/ld/genscripts.sh
-===================================================================
---- git.orig/ld/genscripts.sh
-+++ git/ld/genscripts.sh
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ld/genscripts.sh | 23 -----------------------
+ 1 file changed, 23 deletions(-)
+
+diff --git a/ld/genscripts.sh b/ld/genscripts.sh
+index a42c4d7a4b..d727b4d07e 100755
+--- a/ld/genscripts.sh
++++ b/ld/genscripts.sh
 @@ -189,29 +189,6 @@ append_to_lib_path()
    fi
  }
@@ -45,3 +56,6 @@ Index: git/ld/genscripts.sh
  if [ "x${LIB_PATH}" = "x" ] && [ "x${USE_LIBPATH}" = xyes ] ; then
    libs=${NATIVE_LIB_DIRS}
    if [ "x${NATIVE}" = "xyes" ] ; then
+-- 
+2.12.0
+
diff --git a/meta/recipes-devtools/binutils/binutils/0002-configure-widen-the-regexp-for-SH-architectures.patch b/meta/recipes-devtools/binutils/binutils/0003-gprof-add-uclibc-support-to-configure.patch
similarity index 42%
rename from meta/recipes-devtools/binutils/binutils/0002-configure-widen-the-regexp-for-SH-architectures.patch
rename to meta/recipes-devtools/binutils/binutils/0003-gprof-add-uclibc-support-to-configure.patch
index 8d7cf00d4b..eddb42b4e3 100644
--- a/meta/recipes-devtools/binutils/binutils/0002-configure-widen-the-regexp-for-SH-architectures.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-gprof-add-uclibc-support-to-configure.patch
@@ -1,45 +1,20 @@
-From e4cd40722f597dff39c7214fab1742dd5bcc67eb Mon Sep 17 00:00:00 2001
+From 7893d2b24d0303bda3a0049846489619ffd1387b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:07:33 +0000
-Subject: [PATCH 02/13] configure: widen the regexp for SH architectures
-
-gprof needs to know about uclibc
+Subject: [PATCH 03/15] gprof: add uclibc support to configure
 
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- configure       | 4 ++--
  gprof/configure | 5 +++++
- 2 files changed, 7 insertions(+), 2 deletions(-)
+ 1 file changed, 5 insertions(+)
 
-diff --git a/configure b/configure
-index ad3dfb7..2a74a77 100755
---- a/configure
-+++ b/configure
-@@ -3444,7 +3444,7 @@ case "${target}" in
-     ;;
-   s390-*-* | s390x-*-*)
-     ;;
--  sh-*-* | sh[34]*-*-*)
-+  sh*-*-* | sh[34]*-*-*)
-     ;;
-   sh64-*-* | sh5*-*-*)
-     ;;
-@@ -3946,7 +3946,7 @@ case "${target}" in
-   or1k*-*-*)
-     noconfigdirs="$noconfigdirs gdb"
-     ;;
--  sh-*-* | sh64-*-*)
-+  sh*-*-* | sh64-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
 diff --git a/gprof/configure b/gprof/configure
-index bf3ecaa..626e1c7 100755
+index 9e6b8f3525..38a4c0b0e5 100755
 --- a/gprof/configure
 +++ b/gprof/configure
-@@ -5873,6 +5873,11 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
+@@ -5874,6 +5874,11 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
    lt_cv_deplibs_check_method=pass_all
    ;;
  
@@ -52,5 +27,5 @@ index bf3ecaa..626e1c7 100755
    if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
      lt_cv_deplibs_check_method='match_pattern /lib[^/]+(\.so\.[0-9]+\.[0-9]+|_pic\.a)$'
 -- 
-2.9.0
+2.12.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0003-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
similarity index 80%
rename from meta/recipes-devtools/binutils/binutils/0003-Point-scripts-location-to-libdir.patch
rename to meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
index acc198b3ef..c6b9de7991 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-Point-scripts-location-to-libdir.patch
+++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
@@ -1,7 +1,7 @@
-From 93c49f6197bd59b2abbf04b3296bf10029b80f48 Mon Sep 17 00:00:00 2001
+From e34650c50574a8a39d694567ed607a63006b6f99 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:09:58 +0000
-Subject: [PATCH 03/13] Point scripts location to libdir
+Subject: [PATCH 04/15] Point scripts location to libdir
 
 Upstream-Status: Inappropriate [debian patch]
 
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index 0598923..b478ba7 100644
+index 15beaa7021..bbf9c671d8 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
 @@ -57,7 +57,7 @@ endif
@@ -25,10 +25,10 @@ index 0598923..b478ba7 100644
  EMUL = @EMUL@
  EMULATION_OFILES = @EMULATION_OFILES@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index 7c78198..5eb67e0 100644
+index 042b690ed6..37e7b25e9a 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
-@@ -451,7 +451,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
+@@ -452,7 +452,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.
@@ -38,5 +38,5 @@ index 7c78198..5eb67e0 100644
  BFDDIR = $(BASEDIR)/bfd
  INCDIR = $(BASEDIR)/include
 -- 
-2.9.0
+2.12.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0004-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
similarity index 79%
rename from meta/recipes-devtools/binutils/binutils/0004-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
rename to meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
index 28a17f3865..726f7020dd 100644
--- a/meta/recipes-devtools/binutils/binutils/0004-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
+++ b/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
@@ -1,7 +1,7 @@
-From 4ff83779de8621715c6c2a79cf7ed8d74ff2d7c5 Mon Sep 17 00:00:00 2001
+From 42292f5533bca904f230a8e03ceee1f84ef0c4ec Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:27:17 +0000
-Subject: [PATCH 04/13] Only generate an RPATH entry if LD_RUN_PATH is not
+Subject: [PATCH 05/15] Only generate an RPATH entry if LD_RUN_PATH is not
  empty
 
 for cases where -rpath isn't specified. debian (#151024)
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
-index 47fa549..f4c640e 100644
+index 84adaef6df..ab8c74257e 100644
 --- a/ld/emultempl/elf32.em
 +++ b/ld/emultempl/elf32.em
-@@ -1244,6 +1244,8 @@ fragment <<EOF
+@@ -1411,6 +1411,8 @@ fragment <<EOF
  	      && command_line.rpath == NULL)
  	    {
  	      lib_path = (const char *) getenv ("LD_RUN_PATH");
@@ -27,7 +27,7 @@ index 47fa549..f4c640e 100644
  	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
  						      force))
  		break;
-@@ -1525,6 +1527,8 @@ gld${EMULATION_NAME}_before_allocation (void)
+@@ -1692,6 +1694,8 @@ gld${EMULATION_NAME}_before_allocation (void)
    rpath = command_line.rpath;
    if (rpath == NULL)
      rpath = (const char *) getenv ("LD_RUN_PATH");
@@ -37,5 +37,5 @@ index 47fa549..f4c640e 100644
    for (abfd = link_info.input_bfds; abfd; abfd = abfd->link.next)
      if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
 -- 
-2.9.0
+2.12.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0005-Explicitly-link-with-libm-on-uclibc.patch b/meta/recipes-devtools/binutils/binutils/0006-Explicitly-link-with-libm-on-uclibc.patch
similarity index 84%
rename from meta/recipes-devtools/binutils/binutils/0005-Explicitly-link-with-libm-on-uclibc.patch
rename to meta/recipes-devtools/binutils/binutils/0006-Explicitly-link-with-libm-on-uclibc.patch
index 331f78221c..9770ca7f0f 100644
--- a/meta/recipes-devtools/binutils/binutils/0005-Explicitly-link-with-libm-on-uclibc.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-Explicitly-link-with-libm-on-uclibc.patch
@@ -1,7 +1,7 @@
-From 18a7ae169e8d55ace683357d1de6b07e4fdf797a Mon Sep 17 00:00:00 2001
+From 6a46bf151d7e53df8b5e7645a2d241967688368a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:32:49 +0000
-Subject: [PATCH 05/13] Explicitly link with libm on uclibc
+Subject: [PATCH 06/15] Explicitly link with libm on uclibc
 
 Description:
 
@@ -31,10 +31,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/gas/configure.tgt b/gas/configure.tgt
-index e2df659..1b9fd99 100644
+index 711d537e95..7cd2dc176a 100644
 --- a/gas/configure.tgt
 +++ b/gas/configure.tgt
-@@ -487,6 +487,12 @@ case ${generic_target} in
+@@ -494,6 +494,12 @@ case ${generic_target} in
    *-*-netware)				fmt=elf em=netware ;;
  esac
  
@@ -45,8 +45,8 @@ index e2df659..1b9fd99 100644
 +esac
 +
  case ${cpu_type} in
-   aarch64 | alpha | arm | i386 | ia64 | microblaze | mips | ns32k | or1k | or1knd | pdp11 | ppc | sparc | z80 | z8k)
+   aarch64 | alpha | arm | i386 | ia64 | microblaze | mips | ns32k | or1k | or1knd | pdp11 | ppc | riscv | sparc | z80 | z8k)
      bfd_gas=yes
 -- 
-2.9.0
+2.12.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch
similarity index 97%
rename from meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
rename to meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch
index f0fdf46ae5..6b7f753891 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch
@@ -1,18 +1,17 @@
-From 71adcde3648db47f7fa155db12810591ffd3ae34 Mon Sep 17 00:00:00 2001
+From 9a3651e120261c72090689ad770ad048b0baf506 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 14 Feb 2016 17:04:07 +0000
-Subject: [PATCH 06/13] Use libtool 2.4
+Date: Mon, 6 Mar 2017 23:28:33 -0800
+Subject: [PATCH 07/15] Use libtool 2.4
 
 get libtool sysroot support
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [ OE configuration Specific]
 
  bfd/configure        | 1318 +++++++++++++++++------
  bfd/configure.ac     |    2 +-
  binutils/configure   | 1316 +++++++++++++++++------
- configure            |    4 +-
  gas/configure        | 1314 +++++++++++++++++------
  gprof/configure      | 1321 +++++++++++++++++------
  ld/configure         | 1691 +++++++++++++++++++++--------
@@ -23,14 +22,14 @@ Upstream-Status: Pending
  lt~obsolete.m4       |    2 +-
  opcodes/configure    | 1318 +++++++++++++++++------
  opcodes/configure.ac |    2 +-
- zlib/configure       | 1320 +++++++++++++++++------
- 15 files changed, 9930 insertions(+), 3697 deletions(-)
+ zlib/configure       | 1316 +++++++++++++++++------
+ 14 files changed, 9926 insertions(+), 3693 deletions(-)
 
 diff --git a/bfd/configure b/bfd/configure
-index a437569..575a257 100755
+index f30bfabef3..fa1a545e9d 100755
 --- a/bfd/configure
 +++ b/bfd/configure
-@@ -671,6 +671,9 @@ OTOOL
+@@ -672,6 +672,9 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -40,7 +39,7 @@ index a437569..575a257 100755
  OBJDUMP
  LN_S
  NM
-@@ -784,6 +787,7 @@ enable_static
+@@ -785,6 +788,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -48,7 +47,7 @@ index a437569..575a257 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1460,6 +1464,8 @@ Optional Packages:
+@@ -1461,6 +1465,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -57,7 +56,7 @@ index a437569..575a257 100755
    --with-mmap             try using mmap for BFD input files if available
    --with-separate-debug-dir=DIR
                            Look for global separate debug info in DIR
-@@ -5392,8 +5398,8 @@ esac
+@@ -5393,8 +5399,8 @@ esac
  
  
  
@@ -68,7 +67,7 @@ index a437569..575a257 100755
  
  
  
-@@ -5433,7 +5439,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5434,7 +5440,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -77,7 +76,7 @@ index a437569..575a257 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6119,8 +6125,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6120,8 +6126,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -88,7 +87,7 @@ index a437569..575a257 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6169,6 +6175,80 @@ esac
+@@ -6170,6 +6176,80 @@ esac
  
  
  
@@ -169,7 +168,7 @@ index a437569..575a257 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -6185,6 +6265,11 @@ case $reload_flag in
+@@ -6186,6 +6266,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -181,7 +180,7 @@ index a437569..575a257 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6353,7 +6438,8 @@ mingw* | pw32*)
+@@ -6354,7 +6439,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -191,7 +190,7 @@ index a437569..575a257 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6507,6 +6593,21 @@ esac
+@@ -6508,6 +6594,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -213,7 +212,7 @@ index a437569..575a257 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6522,9 +6623,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6523,9 +6624,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -378,7 +377,7 @@ index a437569..575a257 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6540,7 +6794,7 @@ do
+@@ -6541,7 +6795,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -387,7 +386,7 @@ index a437569..575a257 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6560,11 +6814,15 @@ $as_echo "no" >&6; }
+@@ -6561,11 +6815,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -406,7 +405,7 @@ index a437569..575a257 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6580,7 +6838,7 @@ do
+@@ -6581,7 +6839,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -415,7 +414,7 @@ index a437569..575a257 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6599,6 +6857,10 @@ else
+@@ -6600,6 +6858,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -426,7 +425,7 @@ index a437569..575a257 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6610,16 +6872,72 @@ ac_tool_warned=yes ;;
+@@ -6611,16 +6873,72 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -503,7 +502,7 @@ index a437569..575a257 100755
  
  
  
-@@ -6961,8 +7279,8 @@ esac
+@@ -6962,8 +7280,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -514,7 +513,7 @@ index a437569..575a257 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6998,6 +7316,7 @@ for ac_symprfx in "" "_"; do
+@@ -6999,6 +7317,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -522,7 +521,7 @@ index a437569..575a257 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7039,6 +7358,18 @@ _LT_EOF
+@@ -7040,6 +7359,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -541,7 +540,7 @@ index a437569..575a257 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7050,7 +7381,7 @@ _LT_EOF
+@@ -7051,7 +7382,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -550,7 +549,7 @@ index a437569..575a257 100755
    const char *name;
    void       *address;
  }
-@@ -7076,8 +7407,8 @@ static const void *lt_preloaded_setup() {
+@@ -7077,8 +7408,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -561,7 +560,7 @@ index a437569..575a257 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7087,8 +7418,8 @@ _LT_EOF
+@@ -7088,8 +7419,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -572,7 +571,7 @@ index a437569..575a257 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7125,6 +7456,16 @@ else
+@@ -7126,6 +7457,16 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -589,7 +588,7 @@ index a437569..575a257 100755
  
  
  
-@@ -7146,6 +7487,45 @@ fi
+@@ -7147,6 +7488,45 @@ fi
  
  
  
@@ -635,7 +634,7 @@ index a437569..575a257 100755
  # Check whether --enable-libtool-lock was given.
  if test "${enable_libtool_lock+set}" = set; then :
    enableval=$enable_libtool_lock;
-@@ -7352,6 +7732,123 @@ esac
+@@ -7353,6 +7733,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -759,7 +758,7 @@ index a437569..575a257 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7915,6 +8412,8 @@ _LT_EOF
+@@ -7916,6 +8413,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -768,7 +767,7 @@ index a437569..575a257 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8079,7 +8578,8 @@ fi
+@@ -8080,7 +8579,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -778,7 +777,7 @@ index a437569..575a257 100755
  
  
  
-@@ -8168,7 +8668,7 @@ aix3*)
+@@ -8169,7 +8669,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -787,7 +786,7 @@ index a437569..575a257 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8466,8 +8966,6 @@ fi
+@@ -8467,8 +8967,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -796,7 +795,7 @@ index a437569..575a257 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8633,6 +9131,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8634,6 +9132,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -809,7 +808,7 @@ index a437569..575a257 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8695,7 +9199,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8696,7 +9200,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -818,7 +817,7 @@ index a437569..575a257 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8752,13 +9256,17 @@ case $host_os in
+@@ -8753,13 +9257,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -842,7 +841,7 @@ index a437569..575a257 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8819,6 +9327,11 @@ fi
+@@ -8820,6 +9328,11 @@ fi
  
  
  
@@ -854,7 +853,7 @@ index a437569..575a257 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9169,7 +9682,8 @@ _LT_EOF
+@@ -9170,7 +9683,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -864,7 +863,7 @@ index a437569..575a257 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9268,12 +9782,12 @@ _LT_EOF
+@@ -9269,12 +9783,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -879,7 +878,7 @@ index a437569..575a257 100755
  	  fi
  	  ;;
  	esac
-@@ -9287,8 +9801,8 @@ _LT_EOF
+@@ -9288,8 +9802,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -890,7 +889,7 @@ index a437569..575a257 100755
        fi
        ;;
  
-@@ -9306,8 +9820,8 @@ _LT_EOF
+@@ -9307,8 +9821,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -901,7 +900,7 @@ index a437569..575a257 100755
        else
  	ld_shlibs=no
        fi
-@@ -9353,8 +9867,8 @@ _LT_EOF
+@@ -9354,8 +9868,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -912,7 +911,7 @@ index a437569..575a257 100755
        else
  	ld_shlibs=no
        fi
-@@ -9484,7 +9998,13 @@ _LT_EOF
+@@ -9485,7 +9999,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -927,7 +926,7 @@ index a437569..575a257 100755
  /* end confdefs.h.  */
  
  int
-@@ -9497,22 +10017,29 @@ main ()
+@@ -9498,22 +10018,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -970,7 +969,7 @@ index a437569..575a257 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9524,7 +10051,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9525,7 +10052,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -985,7 +984,7 @@ index a437569..575a257 100755
  /* end confdefs.h.  */
  
  int
-@@ -9537,22 +10070,29 @@ main ()
+@@ -9538,22 +10071,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -1028,7 +1027,7 @@ index a437569..575a257 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9597,20 +10137,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9598,20 +10138,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -1106,7 +1105,7 @@ index a437569..575a257 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9671,7 +10254,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9672,7 +10255,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -1115,7 +1114,7 @@ index a437569..575a257 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9679,7 +10262,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9680,7 +10263,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -1124,7 +1123,7 @@ index a437569..575a257 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9695,7 +10278,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9696,7 +10279,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -1133,7 +1132,7 @@ index a437569..575a257 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9719,10 +10302,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9720,10 +10303,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -1146,7 +1145,7 @@ index a437569..575a257 100755
  	  ;;
  	esac
        else
-@@ -9801,23 +10384,36 @@ fi
+@@ -9802,23 +10385,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -1191,7 +1190,7 @@ index a437569..575a257 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9902,7 +10498,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9903,7 +10499,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -1200,7 +1199,7 @@ index a437569..575a257 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9921,9 +10517,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9922,9 +10518,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -1212,7 +1211,7 @@ index a437569..575a257 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10499,8 +11095,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10500,8 +11096,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -1224,7 +1223,7 @@ index a437569..575a257 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10533,13 +11130,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10534,13 +11131,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -1297,7 +1296,7 @@ index a437569..575a257 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10631,7 +11286,7 @@ haiku*)
+@@ -10632,7 +11287,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -1306,7 +1305,7 @@ index a437569..575a257 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11471,10 +12126,10 @@ else
+@@ -11472,10 +12127,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -1319,7 +1318,7 @@ index a437569..575a257 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11577,10 +12232,10 @@ else
+@@ -11578,10 +12233,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -1332,7 +1331,7 @@ index a437569..575a257 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14078,7 +14733,7 @@ SHARED_LDFLAGS=
+@@ -14122,7 +14777,7 @@ SHARED_LDFLAGS=
  if test "$enable_shared" = "yes"; then
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -1341,7 +1340,7 @@ index a437569..575a257 100755
    fi
  
  # More hacks to build DLLs on Windows.
-@@ -16789,13 +17444,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -16826,13 +17481,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -1362,7 +1361,7 @@ index a437569..575a257 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -16810,14 +17472,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -16847,14 +17509,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -1381,7 +1380,7 @@ index a437569..575a257 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -16850,12 +17515,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -16887,12 +17552,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -1395,7 +1394,7 @@ index a437569..575a257 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -16910,8 +17575,13 @@ reload_flag \
+@@ -16947,8 +17612,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -1409,7 +1408,7 @@ index a437569..575a257 100755
  STRIP \
  RANLIB \
  CC \
-@@ -16921,12 +17591,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -16958,12 +17628,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -1425,7 +1424,7 @@ index a437569..575a257 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -16942,7 +17614,6 @@ no_undefined_flag \
+@@ -16979,7 +17651,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -1433,7 +1432,7 @@ index a437569..575a257 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -16978,6 +17649,7 @@ module_cmds \
+@@ -17015,6 +17686,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -1441,7 +1440,7 @@ index a437569..575a257 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -17757,7 +18429,8 @@ $as_echo X"$file" |
+@@ -17794,7 +18466,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -1451,7 +1450,7 @@ index a437569..575a257 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -17860,19 +18533,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -17897,19 +18570,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -1495,7 +1494,7 @@ index a437569..575a257 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -17902,6 +18598,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -17939,6 +18635,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -1508,7 +1507,7 @@ index a437569..575a257 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -17911,6 +18613,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -17948,6 +18650,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -1518,7 +1517,7 @@ index a437569..575a257 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -18025,12 +18730,12 @@ with_gcc=$GCC
+@@ -18062,12 +18767,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -1534,7 +1533,7 @@ index a437569..575a257 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -18117,9 +18822,6 @@ inherit_rpath=$inherit_rpath
+@@ -18154,9 +18859,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -1544,7 +1543,7 @@ index a437569..575a257 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -18135,6 +18837,9 @@ include_expsyms=$lt_include_expsyms
+@@ -18172,6 +18874,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -1554,7 +1553,7 @@ index a437569..575a257 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -18167,210 +18872,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -18204,210 +18909,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -1929,7 +1928,7 @@ index a437569..575a257 100755
    chmod +x "$ofile"
  
 diff --git a/bfd/configure.ac b/bfd/configure.ac
-index 669cff7..5f57877 100644
+index 9a183c1628..3d8ea07836 100644
 --- a/bfd/configure.ac
 +++ b/bfd/configure.ac
 @@ -253,7 +253,7 @@ changequote(,)dnl
@@ -1942,10 +1941,10 @@ index 669cff7..5f57877 100644
  
  # More hacks to build DLLs on Windows.
 diff --git a/binutils/configure b/binutils/configure
-index 6cbf17c..6d20600 100755
+index 82119efe72..4a98918ce1 100755
 --- a/binutils/configure
 +++ b/binutils/configure
-@@ -658,8 +658,11 @@ OTOOL
+@@ -659,8 +659,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -1957,7 +1956,7 @@ index 6cbf17c..6d20600 100755
  OBJDUMP
  LN_S
  NM
-@@ -771,6 +774,7 @@ enable_static
+@@ -772,6 +775,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -1965,7 +1964,7 @@ index 6cbf17c..6d20600 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1443,6 +1447,8 @@ Optional Packages:
+@@ -1444,6 +1448,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -1974,7 +1973,7 @@ index 6cbf17c..6d20600 100755
    --with-system-zlib      use installed libz
    --with-gnu-ld           assume the C compiler uses GNU ld default=no
    --with-libiconv-prefix[=DIR]  search for libiconv in DIR/include and DIR/lib
-@@ -5159,8 +5165,8 @@ esac
+@@ -5160,8 +5166,8 @@ esac
  
  
  
@@ -1985,7 +1984,7 @@ index 6cbf17c..6d20600 100755
  
  
  
-@@ -5200,7 +5206,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5201,7 +5207,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -1994,7 +1993,7 @@ index 6cbf17c..6d20600 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5886,8 +5892,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5887,8 +5893,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -2005,7 +2004,7 @@ index 6cbf17c..6d20600 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5936,6 +5942,80 @@ esac
+@@ -5937,6 +5943,80 @@ esac
  
  
  
@@ -2086,7 +2085,7 @@ index 6cbf17c..6d20600 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -5952,6 +6032,11 @@ case $reload_flag in
+@@ -5953,6 +6033,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -2098,7 +2097,7 @@ index 6cbf17c..6d20600 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6120,7 +6205,8 @@ mingw* | pw32*)
+@@ -6121,7 +6206,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -2108,7 +2107,7 @@ index 6cbf17c..6d20600 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6274,6 +6360,21 @@ esac
+@@ -6275,6 +6361,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -2130,7 +2129,7 @@ index 6cbf17c..6d20600 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6289,9 +6390,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6290,9 +6391,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -2295,7 +2294,7 @@ index 6cbf17c..6d20600 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6307,7 +6561,7 @@ do
+@@ -6308,7 +6562,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -2304,7 +2303,7 @@ index 6cbf17c..6d20600 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6327,11 +6581,15 @@ $as_echo "no" >&6; }
+@@ -6328,11 +6582,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -2323,7 +2322,7 @@ index 6cbf17c..6d20600 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6347,7 +6605,7 @@ do
+@@ -6348,7 +6606,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -2332,7 +2331,7 @@ index 6cbf17c..6d20600 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6366,6 +6624,10 @@ else
+@@ -6367,6 +6625,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -2343,7 +2342,7 @@ index 6cbf17c..6d20600 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6377,12 +6639,10 @@ ac_tool_warned=yes ;;
+@@ -6378,12 +6640,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -2358,7 +2357,7 @@ index 6cbf17c..6d20600 100755
  
  
  
-@@ -6394,6 +6654,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6395,6 +6655,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -2423,7 +2422,7 @@ index 6cbf17c..6d20600 100755
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -6728,8 +7046,8 @@ esac
+@@ -6729,8 +7047,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -2434,7 +2433,7 @@ index 6cbf17c..6d20600 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6765,6 +7083,7 @@ for ac_symprfx in "" "_"; do
+@@ -6766,6 +7084,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -2442,7 +2441,7 @@ index 6cbf17c..6d20600 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6806,6 +7125,18 @@ _LT_EOF
+@@ -6807,6 +7126,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -2461,7 +2460,7 @@ index 6cbf17c..6d20600 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6817,7 +7148,7 @@ _LT_EOF
+@@ -6818,7 +7149,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -2470,7 +2469,7 @@ index 6cbf17c..6d20600 100755
    const char *name;
    void       *address;
  }
-@@ -6843,8 +7174,8 @@ static const void *lt_preloaded_setup() {
+@@ -6844,8 +7175,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -2481,7 +2480,7 @@ index 6cbf17c..6d20600 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6854,8 +7185,8 @@ _LT_EOF
+@@ -6855,8 +7186,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -2492,7 +2491,7 @@ index 6cbf17c..6d20600 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6892,6 +7223,21 @@ else
+@@ -6893,6 +7224,21 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -2555,7 +2554,7 @@ index 6cbf17c..6d20600 100755
  
  
  
-@@ -7119,6 +7499,123 @@ esac
+@@ -7120,6 +7500,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -2679,7 +2678,7 @@ index 6cbf17c..6d20600 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7682,6 +8179,8 @@ _LT_EOF
+@@ -7683,6 +8180,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -2688,7 +2687,7 @@ index 6cbf17c..6d20600 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7877,7 +8376,8 @@ fi
+@@ -7878,7 +8377,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -2698,7 +2697,7 @@ index 6cbf17c..6d20600 100755
  
  
  
-@@ -7966,7 +8466,7 @@ aix3*)
+@@ -7967,7 +8467,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -2707,7 +2706,7 @@ index 6cbf17c..6d20600 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8264,8 +8764,6 @@ fi
+@@ -8265,8 +8765,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -2716,7 +2715,7 @@ index 6cbf17c..6d20600 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8431,6 +8929,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8432,6 +8930,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -2729,7 +2728,7 @@ index 6cbf17c..6d20600 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8493,7 +8997,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8494,7 +8998,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -2738,7 +2737,7 @@ index 6cbf17c..6d20600 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8550,13 +9054,17 @@ case $host_os in
+@@ -8551,13 +9055,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -2762,7 +2761,7 @@ index 6cbf17c..6d20600 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8617,6 +9125,11 @@ fi
+@@ -8618,6 +9126,11 @@ fi
  
  
  
@@ -2774,7 +2773,7 @@ index 6cbf17c..6d20600 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8967,7 +9480,8 @@ _LT_EOF
+@@ -8968,7 +9481,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -2784,7 +2783,7 @@ index 6cbf17c..6d20600 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9066,12 +9580,12 @@ _LT_EOF
+@@ -9067,12 +9581,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -2799,7 +2798,7 @@ index 6cbf17c..6d20600 100755
  	  fi
  	  ;;
  	esac
-@@ -9085,8 +9599,8 @@ _LT_EOF
+@@ -9086,8 +9600,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -2810,7 +2809,7 @@ index 6cbf17c..6d20600 100755
        fi
        ;;
  
-@@ -9104,8 +9618,8 @@ _LT_EOF
+@@ -9105,8 +9619,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -2821,7 +2820,7 @@ index 6cbf17c..6d20600 100755
        else
  	ld_shlibs=no
        fi
-@@ -9151,8 +9665,8 @@ _LT_EOF
+@@ -9152,8 +9666,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -2832,7 +2831,7 @@ index 6cbf17c..6d20600 100755
        else
  	ld_shlibs=no
        fi
-@@ -9282,7 +9796,13 @@ _LT_EOF
+@@ -9283,7 +9797,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -2847,7 +2846,7 @@ index 6cbf17c..6d20600 100755
  /* end confdefs.h.  */
  
  int
-@@ -9295,22 +9815,29 @@ main ()
+@@ -9296,22 +9816,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -2890,7 +2889,7 @@ index 6cbf17c..6d20600 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9322,7 +9849,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9323,7 +9850,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -2905,7 +2904,7 @@ index 6cbf17c..6d20600 100755
  /* end confdefs.h.  */
  
  int
-@@ -9335,22 +9868,29 @@ main ()
+@@ -9336,22 +9869,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -2948,7 +2947,7 @@ index 6cbf17c..6d20600 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9395,20 +9935,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9396,20 +9936,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -3026,7 +3025,7 @@ index 6cbf17c..6d20600 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9469,7 +10052,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9470,7 +10053,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -3035,7 +3034,7 @@ index 6cbf17c..6d20600 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9477,7 +10060,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9478,7 +10061,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -3044,7 +3043,7 @@ index 6cbf17c..6d20600 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9493,7 +10076,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9494,7 +10077,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -3053,7 +3052,7 @@ index 6cbf17c..6d20600 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9517,10 +10100,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9518,10 +10101,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -3066,7 +3065,7 @@ index 6cbf17c..6d20600 100755
  	  ;;
  	esac
        else
-@@ -9599,23 +10182,36 @@ fi
+@@ -9600,23 +10183,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -3111,7 +3110,7 @@ index 6cbf17c..6d20600 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9700,7 +10296,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9701,7 +10297,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -3120,7 +3119,7 @@ index 6cbf17c..6d20600 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9719,9 +10315,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9720,9 +10316,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -3132,7 +3131,7 @@ index 6cbf17c..6d20600 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10297,8 +10893,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10298,8 +10894,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -3144,7 +3143,7 @@ index 6cbf17c..6d20600 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10331,13 +10928,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10332,13 +10929,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -3217,7 +3216,7 @@ index 6cbf17c..6d20600 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10429,7 +11084,7 @@ haiku*)
+@@ -10430,7 +11085,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -3226,7 +3225,7 @@ index 6cbf17c..6d20600 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11269,10 +11924,10 @@ else
+@@ -11270,10 +11925,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -3239,7 +3238,7 @@ index 6cbf17c..6d20600 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11375,10 +12030,10 @@ else
+@@ -11376,10 +12031,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -3252,7 +3251,7 @@ index 6cbf17c..6d20600 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15392,13 +16047,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -15436,13 +16091,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -3273,7 +3272,7 @@ index 6cbf17c..6d20600 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15413,14 +16075,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -15457,14 +16119,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -3292,7 +3291,7 @@ index 6cbf17c..6d20600 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15453,12 +16118,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -15497,12 +16162,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -3306,7 +3305,7 @@ index 6cbf17c..6d20600 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15513,8 +16178,13 @@ reload_flag \
+@@ -15557,8 +16222,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -3320,7 +3319,7 @@ index 6cbf17c..6d20600 100755
  STRIP \
  RANLIB \
  CC \
-@@ -15524,12 +16194,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -15568,12 +16238,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -3336,7 +3335,7 @@ index 6cbf17c..6d20600 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15545,7 +16217,6 @@ no_undefined_flag \
+@@ -15589,7 +16261,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -3344,7 +3343,7 @@ index 6cbf17c..6d20600 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15581,6 +16252,7 @@ module_cmds \
+@@ -15625,6 +16296,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -3352,7 +3351,7 @@ index 6cbf17c..6d20600 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16338,7 +17010,8 @@ $as_echo X"$file" |
+@@ -16382,7 +17054,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -3362,7 +3361,7 @@ index 6cbf17c..6d20600 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16441,19 +17114,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -16485,19 +17158,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -3406,7 +3405,7 @@ index 6cbf17c..6d20600 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16483,6 +17179,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -16527,6 +17223,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -3419,7 +3418,7 @@ index 6cbf17c..6d20600 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16492,6 +17194,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -16536,6 +17238,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -3429,7 +3428,7 @@ index 6cbf17c..6d20600 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16606,12 +17311,12 @@ with_gcc=$GCC
+@@ -16650,12 +17355,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -3445,7 +3444,7 @@ index 6cbf17c..6d20600 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16698,9 +17403,6 @@ inherit_rpath=$inherit_rpath
+@@ -16742,9 +17447,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -3455,7 +3454,7 @@ index 6cbf17c..6d20600 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16716,6 +17418,9 @@ include_expsyms=$lt_include_expsyms
+@@ -16760,6 +17462,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -3465,7 +3464,7 @@ index 6cbf17c..6d20600 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16748,210 +17453,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -16792,210 +17497,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -3839,33 +3838,11 @@ index 6cbf17c..6d20600 100755
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-diff --git a/configure b/configure
-index 2a74a77..ad3dfb7 100755
---- a/configure
-+++ b/configure
-@@ -3444,7 +3444,7 @@ case "${target}" in
-     ;;
-   s390-*-* | s390x-*-*)
-     ;;
--  sh*-*-* | sh[34]*-*-*)
-+  sh-*-* | sh[34]*-*-*)
-     ;;
-   sh64-*-* | sh5*-*-*)
-     ;;
-@@ -3946,7 +3946,7 @@ case "${target}" in
-   or1k*-*-*)
-     noconfigdirs="$noconfigdirs gdb"
-     ;;
--  sh*-*-* | sh64-*-*)
-+  sh-*-* | sh64-*-*)
-     case "${target}" in
-       sh*-*-elf)
-          ;;
 diff --git a/gas/configure b/gas/configure
-index f7753b8..45da030 100755
+index e574cb8514..a36f1ae161 100755
 --- a/gas/configure
 +++ b/gas/configure
-@@ -648,8 +648,11 @@ OTOOL
+@@ -650,8 +650,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -3877,7 +3854,7 @@ index f7753b8..45da030 100755
  OBJDUMP
  LN_S
  NM
-@@ -761,6 +764,7 @@ enable_static
+@@ -763,6 +766,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -3885,7 +3862,7 @@ index f7753b8..45da030 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -4919,8 +4923,8 @@ esac
+@@ -4921,8 +4925,8 @@ esac
  
  
  
@@ -3896,7 +3873,7 @@ index f7753b8..45da030 100755
  
  
  
-@@ -4960,7 +4964,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -4962,7 +4966,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -3905,7 +3882,7 @@ index f7753b8..45da030 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5646,8 +5650,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5648,8 +5652,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -3916,7 +3893,7 @@ index f7753b8..45da030 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5696,6 +5700,80 @@ esac
+@@ -5698,6 +5702,80 @@ esac
  
  
  
@@ -3997,7 +3974,7 @@ index f7753b8..45da030 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -5712,6 +5790,11 @@ case $reload_flag in
+@@ -5714,6 +5792,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -4009,7 +3986,7 @@ index f7753b8..45da030 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -5880,7 +5963,8 @@ mingw* | pw32*)
+@@ -5882,7 +5965,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -4019,7 +3996,7 @@ index f7753b8..45da030 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6034,6 +6118,21 @@ esac
+@@ -6036,6 +6120,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -4041,7 +4018,7 @@ index f7753b8..45da030 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6049,9 +6148,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6051,9 +6150,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -4206,7 +4183,7 @@ index f7753b8..45da030 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6067,7 +6319,7 @@ do
+@@ -6069,7 +6321,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -4215,7 +4192,7 @@ index f7753b8..45da030 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6087,11 +6339,15 @@ $as_echo "no" >&6; }
+@@ -6089,11 +6341,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -4234,7 +4211,7 @@ index f7753b8..45da030 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6107,7 +6363,7 @@ do
+@@ -6109,7 +6365,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -4243,7 +4220,7 @@ index f7753b8..45da030 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6126,6 +6382,10 @@ else
+@@ -6128,6 +6384,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -4254,7 +4231,7 @@ index f7753b8..45da030 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6137,12 +6397,10 @@ ac_tool_warned=yes ;;
+@@ -6139,12 +6399,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -4269,7 +4246,7 @@ index f7753b8..45da030 100755
  
  
  
-@@ -6154,6 +6412,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6156,6 +6414,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -4334,7 +4311,7 @@ index f7753b8..45da030 100755
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -6488,8 +6804,8 @@ esac
+@@ -6490,8 +6806,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -4345,7 +4322,7 @@ index f7753b8..45da030 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6525,6 +6841,7 @@ for ac_symprfx in "" "_"; do
+@@ -6527,6 +6843,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -4353,7 +4330,7 @@ index f7753b8..45da030 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6566,6 +6883,18 @@ _LT_EOF
+@@ -6568,6 +6885,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -4372,7 +4349,7 @@ index f7753b8..45da030 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6577,7 +6906,7 @@ _LT_EOF
+@@ -6579,7 +6908,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -4381,7 +4358,7 @@ index f7753b8..45da030 100755
    const char *name;
    void       *address;
  }
-@@ -6603,8 +6932,8 @@ static const void *lt_preloaded_setup() {
+@@ -6605,8 +6934,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -4392,7 +4369,7 @@ index f7753b8..45da030 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6614,8 +6943,8 @@ _LT_EOF
+@@ -6616,8 +6945,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -4403,7 +4380,7 @@ index f7753b8..45da030 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6652,6 +6981,21 @@ else
+@@ -6654,6 +6983,21 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -4425,7 +4402,7 @@ index f7753b8..45da030 100755
  
  
  
-@@ -6670,6 +7014,40 @@ fi
+@@ -6671,6 +7015,40 @@ fi
  
  
  
@@ -4466,7 +4443,7 @@ index f7753b8..45da030 100755
  
  
  
-@@ -6879,6 +7257,123 @@ esac
+@@ -6881,6 +7259,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -4590,7 +4567,7 @@ index f7753b8..45da030 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7442,6 +7937,8 @@ _LT_EOF
+@@ -7444,6 +7939,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -4599,7 +4576,7 @@ index f7753b8..45da030 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7637,7 +8134,8 @@ fi
+@@ -7639,7 +8136,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -4609,7 +4586,7 @@ index f7753b8..45da030 100755
  
  
  
-@@ -7726,7 +8224,7 @@ aix3*)
+@@ -7728,7 +8226,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -4618,7 +4595,7 @@ index f7753b8..45da030 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8024,8 +8522,6 @@ fi
+@@ -8026,8 +8524,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -4627,7 +4604,7 @@ index f7753b8..45da030 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8191,6 +8687,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8193,6 +8689,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -4640,7 +4617,7 @@ index f7753b8..45da030 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8253,7 +8755,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8255,7 +8757,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -4649,7 +4626,7 @@ index f7753b8..45da030 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8310,13 +8812,17 @@ case $host_os in
+@@ -8312,13 +8814,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -4673,7 +4650,7 @@ index f7753b8..45da030 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8377,6 +8883,11 @@ fi
+@@ -8379,6 +8885,11 @@ fi
  
  
  
@@ -4685,7 +4662,7 @@ index f7753b8..45da030 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8727,7 +9238,8 @@ _LT_EOF
+@@ -8729,7 +9240,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -4695,7 +4672,7 @@ index f7753b8..45da030 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8826,12 +9338,12 @@ _LT_EOF
+@@ -8828,12 +9340,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -4710,7 +4687,7 @@ index f7753b8..45da030 100755
  	  fi
  	  ;;
  	esac
-@@ -8845,8 +9357,8 @@ _LT_EOF
+@@ -8847,8 +9359,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -4721,7 +4698,7 @@ index f7753b8..45da030 100755
        fi
        ;;
  
-@@ -8864,8 +9376,8 @@ _LT_EOF
+@@ -8866,8 +9378,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4732,7 +4709,7 @@ index f7753b8..45da030 100755
        else
  	ld_shlibs=no
        fi
-@@ -8911,8 +9423,8 @@ _LT_EOF
+@@ -8913,8 +9425,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -4743,7 +4720,7 @@ index f7753b8..45da030 100755
        else
  	ld_shlibs=no
        fi
-@@ -9042,7 +9554,13 @@ _LT_EOF
+@@ -9044,7 +9556,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -4758,7 +4735,7 @@ index f7753b8..45da030 100755
  /* end confdefs.h.  */
  
  int
-@@ -9055,22 +9573,29 @@ main ()
+@@ -9057,22 +9575,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4801,7 +4778,7 @@ index f7753b8..45da030 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9082,7 +9607,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9084,7 +9609,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -4816,7 +4793,7 @@ index f7753b8..45da030 100755
  /* end confdefs.h.  */
  
  int
-@@ -9095,22 +9626,29 @@ main ()
+@@ -9097,22 +9628,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -4859,7 +4836,7 @@ index f7753b8..45da030 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9155,20 +9693,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9157,20 +9695,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -4937,7 +4914,7 @@ index f7753b8..45da030 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9229,7 +9810,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9231,7 +9812,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -4946,7 +4923,7 @@ index f7753b8..45da030 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9237,7 +9818,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9239,7 +9820,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -4955,7 +4932,7 @@ index f7753b8..45da030 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9253,7 +9834,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9255,7 +9836,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -4964,7 +4941,7 @@ index f7753b8..45da030 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9277,10 +9858,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9279,10 +9860,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -4977,7 +4954,7 @@ index f7753b8..45da030 100755
  	  ;;
  	esac
        else
-@@ -9359,23 +9940,36 @@ fi
+@@ -9361,23 +9942,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -5022,7 +4999,7 @@ index f7753b8..45da030 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9460,7 +10054,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9462,7 +10056,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -5031,7 +5008,7 @@ index f7753b8..45da030 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9479,9 +10073,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9481,9 +10075,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -5043,7 +5020,7 @@ index f7753b8..45da030 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10057,8 +10651,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10059,8 +10653,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -5055,7 +5032,7 @@ index f7753b8..45da030 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10091,13 +10686,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10093,13 +10688,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -5128,7 +5105,7 @@ index f7753b8..45da030 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10189,7 +10842,7 @@ haiku*)
+@@ -10191,7 +10844,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -5137,7 +5114,7 @@ index f7753b8..45da030 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11029,10 +11682,10 @@ else
+@@ -11031,10 +11684,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5150,7 +5127,7 @@ index f7753b8..45da030 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11135,10 +11788,10 @@ else
+@@ -11137,10 +11790,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -5163,7 +5140,7 @@ index f7753b8..45da030 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15350,13 +16003,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -15425,13 +16078,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -5184,7 +5161,7 @@ index f7753b8..45da030 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15371,14 +16031,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -15446,14 +16106,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -5203,7 +5180,7 @@ index f7753b8..45da030 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15411,12 +16074,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -15486,12 +16149,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -5217,7 +5194,7 @@ index f7753b8..45da030 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15471,8 +16134,13 @@ reload_flag \
+@@ -15546,8 +16209,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -5231,7 +5208,7 @@ index f7753b8..45da030 100755
  STRIP \
  RANLIB \
  CC \
-@@ -15482,12 +16150,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -15557,12 +16225,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -5247,7 +5224,7 @@ index f7753b8..45da030 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15503,7 +16173,6 @@ no_undefined_flag \
+@@ -15578,7 +16248,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -5255,7 +5232,7 @@ index f7753b8..45da030 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15539,6 +16208,7 @@ module_cmds \
+@@ -15614,6 +16283,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -5263,7 +5240,7 @@ index f7753b8..45da030 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16303,7 +16973,8 @@ $as_echo X"$file" |
+@@ -16378,7 +17048,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -5273,7 +5250,7 @@ index f7753b8..45da030 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16406,19 +17077,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -16481,19 +17152,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -5317,7 +5294,7 @@ index f7753b8..45da030 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16448,6 +17142,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -16523,6 +17217,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -5330,7 +5307,7 @@ index f7753b8..45da030 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16457,6 +17157,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -16532,6 +17232,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -5340,7 +5317,7 @@ index f7753b8..45da030 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16571,12 +17274,12 @@ with_gcc=$GCC
+@@ -16646,12 +17349,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -5356,7 +5333,7 @@ index f7753b8..45da030 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16663,9 +17366,6 @@ inherit_rpath=$inherit_rpath
+@@ -16738,9 +17441,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -5366,7 +5343,7 @@ index f7753b8..45da030 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16681,6 +17381,9 @@ include_expsyms=$lt_include_expsyms
+@@ -16756,6 +17456,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -5376,7 +5353,7 @@ index f7753b8..45da030 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16713,210 +17416,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -16788,210 +17491,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -5751,10 +5728,10 @@ index f7753b8..45da030 100755
    chmod +x "$ofile"
  
 diff --git a/gprof/configure b/gprof/configure
-index 626e1c7..a88719c 100755
+index 38a4c0b0e5..38d1f699c7 100755
 --- a/gprof/configure
 +++ b/gprof/configure
-@@ -630,8 +630,11 @@ OTOOL
+@@ -631,8 +631,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -5766,7 +5743,7 @@ index 626e1c7..a88719c 100755
  OBJDUMP
  LN_S
  NM
-@@ -743,6 +746,7 @@ enable_static
+@@ -744,6 +747,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -5774,7 +5751,7 @@ index 626e1c7..a88719c 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1401,6 +1405,8 @@ Optional Packages:
+@@ -1402,6 +1406,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -5783,7 +5760,7 @@ index 626e1c7..a88719c 100755
  
  Some influential environment variables:
    CC          C compiler command
-@@ -4835,8 +4841,8 @@ esac
+@@ -4836,8 +4842,8 @@ esac
  
  
  
@@ -5794,7 +5771,7 @@ index 626e1c7..a88719c 100755
  
  
  
-@@ -4876,7 +4882,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -4877,7 +4883,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -5803,7 +5780,7 @@ index 626e1c7..a88719c 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5562,8 +5568,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5563,8 +5569,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -5814,7 +5791,7 @@ index 626e1c7..a88719c 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5612,6 +5618,80 @@ esac
+@@ -5613,6 +5619,80 @@ esac
  
  
  
@@ -5895,7 +5872,7 @@ index 626e1c7..a88719c 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -5628,6 +5708,11 @@ case $reload_flag in
+@@ -5629,6 +5709,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -5907,7 +5884,7 @@ index 626e1c7..a88719c 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -5796,7 +5881,8 @@ mingw* | pw32*)
+@@ -5797,7 +5882,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -5917,7 +5894,7 @@ index 626e1c7..a88719c 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -5873,11 +5959,6 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
+@@ -5874,11 +5960,6 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
    lt_cv_deplibs_check_method=pass_all
    ;;
  
@@ -5929,7 +5906,7 @@ index 626e1c7..a88719c 100755
  netbsd*)
    if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
      lt_cv_deplibs_check_method='match_pattern /lib[^/]+(\.so\.[0-9]+\.[0-9]+|_pic\.a)$'
-@@ -5955,6 +6036,21 @@ esac
+@@ -5956,6 +6037,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -5951,7 +5928,7 @@ index 626e1c7..a88719c 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5970,9 +6066,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -5971,9 +6067,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -6116,7 +6093,7 @@ index 626e1c7..a88719c 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -5988,7 +6237,7 @@ do
+@@ -5989,7 +6238,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -6125,7 +6102,7 @@ index 626e1c7..a88719c 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6008,11 +6257,15 @@ $as_echo "no" >&6; }
+@@ -6009,11 +6258,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -6144,7 +6121,7 @@ index 626e1c7..a88719c 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6028,7 +6281,7 @@ do
+@@ -6029,7 +6282,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -6153,7 +6130,7 @@ index 626e1c7..a88719c 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6047,6 +6300,10 @@ else
+@@ -6048,6 +6301,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -6164,7 +6141,7 @@ index 626e1c7..a88719c 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6058,12 +6315,10 @@ ac_tool_warned=yes ;;
+@@ -6059,12 +6316,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -6179,7 +6156,7 @@ index 626e1c7..a88719c 100755
  
  
  
-@@ -6075,6 +6330,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6076,6 +6331,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -6244,7 +6221,7 @@ index 626e1c7..a88719c 100755
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -6409,8 +6722,8 @@ esac
+@@ -6410,8 +6723,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -6255,7 +6232,7 @@ index 626e1c7..a88719c 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6446,6 +6759,7 @@ for ac_symprfx in "" "_"; do
+@@ -6447,6 +6760,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -6263,7 +6240,7 @@ index 626e1c7..a88719c 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6487,6 +6801,18 @@ _LT_EOF
+@@ -6488,6 +6802,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -6282,7 +6259,7 @@ index 626e1c7..a88719c 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6498,7 +6824,7 @@ _LT_EOF
+@@ -6499,7 +6825,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -6291,7 +6268,7 @@ index 626e1c7..a88719c 100755
    const char *name;
    void       *address;
  }
-@@ -6524,8 +6850,8 @@ static const void *lt_preloaded_setup() {
+@@ -6525,8 +6851,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -6302,7 +6279,7 @@ index 626e1c7..a88719c 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6535,8 +6861,8 @@ _LT_EOF
+@@ -6536,8 +6862,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -6313,7 +6290,7 @@ index 626e1c7..a88719c 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6573,6 +6899,18 @@ else
+@@ -6574,6 +6900,18 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -6332,7 +6309,7 @@ index 626e1c7..a88719c 100755
  
  
  
-@@ -6594,6 +6932,43 @@ fi
+@@ -6595,6 +6933,43 @@ fi
  
  
  
@@ -6376,7 +6353,7 @@ index 626e1c7..a88719c 100755
  # Check whether --enable-libtool-lock was given.
  if test "${enable_libtool_lock+set}" = set; then :
    enableval=$enable_libtool_lock;
-@@ -6800,6 +7175,123 @@ esac
+@@ -6801,6 +7176,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -6500,7 +6477,7 @@ index 626e1c7..a88719c 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7363,6 +7855,8 @@ _LT_EOF
+@@ -7364,6 +7856,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -6509,7 +6486,7 @@ index 626e1c7..a88719c 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7558,7 +8052,8 @@ fi
+@@ -7559,7 +8053,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -6519,7 +6496,7 @@ index 626e1c7..a88719c 100755
  
  
  
-@@ -7647,7 +8142,7 @@ aix3*)
+@@ -7648,7 +8143,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -6528,7 +6505,7 @@ index 626e1c7..a88719c 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -7945,8 +8440,6 @@ fi
+@@ -7946,8 +8441,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -6537,7 +6514,7 @@ index 626e1c7..a88719c 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8112,6 +8605,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8113,6 +8606,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -6550,7 +6527,7 @@ index 626e1c7..a88719c 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8174,7 +8673,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8175,7 +8674,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -6559,7 +6536,7 @@ index 626e1c7..a88719c 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8231,13 +8730,17 @@ case $host_os in
+@@ -8232,13 +8731,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -6583,7 +6560,7 @@ index 626e1c7..a88719c 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8298,6 +8801,11 @@ fi
+@@ -8299,6 +8802,11 @@ fi
  
  
  
@@ -6595,7 +6572,7 @@ index 626e1c7..a88719c 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8648,7 +9156,8 @@ _LT_EOF
+@@ -8649,7 +9157,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -6605,7 +6582,7 @@ index 626e1c7..a88719c 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8747,12 +9256,12 @@ _LT_EOF
+@@ -8748,12 +9257,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -6620,7 +6597,7 @@ index 626e1c7..a88719c 100755
  	  fi
  	  ;;
  	esac
-@@ -8766,8 +9275,8 @@ _LT_EOF
+@@ -8767,8 +9276,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -6631,7 +6608,7 @@ index 626e1c7..a88719c 100755
        fi
        ;;
  
-@@ -8785,8 +9294,8 @@ _LT_EOF
+@@ -8786,8 +9295,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -6642,7 +6619,7 @@ index 626e1c7..a88719c 100755
        else
  	ld_shlibs=no
        fi
-@@ -8832,8 +9341,8 @@ _LT_EOF
+@@ -8833,8 +9342,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -6653,7 +6630,7 @@ index 626e1c7..a88719c 100755
        else
  	ld_shlibs=no
        fi
-@@ -8963,7 +9472,13 @@ _LT_EOF
+@@ -8964,7 +9473,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -6668,7 +6645,7 @@ index 626e1c7..a88719c 100755
  /* end confdefs.h.  */
  
  int
-@@ -8976,22 +9491,29 @@ main ()
+@@ -8977,22 +9492,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -6711,7 +6688,7 @@ index 626e1c7..a88719c 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9003,7 +9525,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9004,7 +9526,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -6726,7 +6703,7 @@ index 626e1c7..a88719c 100755
  /* end confdefs.h.  */
  
  int
-@@ -9016,22 +9544,29 @@ main ()
+@@ -9017,22 +9545,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -6769,7 +6746,7 @@ index 626e1c7..a88719c 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9076,20 +9611,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9077,20 +9612,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -6847,7 +6824,7 @@ index 626e1c7..a88719c 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9150,7 +9728,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9151,7 +9729,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -6856,7 +6833,7 @@ index 626e1c7..a88719c 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9158,7 +9736,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9159,7 +9737,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -6865,7 +6842,7 @@ index 626e1c7..a88719c 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9174,7 +9752,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9175,7 +9753,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -6874,7 +6851,7 @@ index 626e1c7..a88719c 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9198,10 +9776,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9199,10 +9777,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -6887,7 +6864,7 @@ index 626e1c7..a88719c 100755
  	  ;;
  	esac
        else
-@@ -9280,23 +9858,36 @@ fi
+@@ -9281,23 +9859,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -6932,7 +6909,7 @@ index 626e1c7..a88719c 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9381,7 +9972,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9382,7 +9973,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -6941,7 +6918,7 @@ index 626e1c7..a88719c 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9400,9 +9991,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9401,9 +9992,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -6953,7 +6930,7 @@ index 626e1c7..a88719c 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -9978,8 +10569,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -9979,8 +10570,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -6965,7 +6942,7 @@ index 626e1c7..a88719c 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10012,13 +10604,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10013,13 +10605,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -7038,7 +7015,7 @@ index 626e1c7..a88719c 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10110,7 +10760,7 @@ haiku*)
+@@ -10111,7 +10761,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -7047,7 +7024,7 @@ index 626e1c7..a88719c 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -10950,10 +11600,10 @@ else
+@@ -10951,10 +11601,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -7060,7 +7037,7 @@ index 626e1c7..a88719c 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11056,10 +11706,10 @@ else
+@@ -11057,10 +11707,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -7073,7 +7050,7 @@ index 626e1c7..a88719c 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12961,13 +13611,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -13005,13 +13655,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -7094,7 +7071,7 @@ index 626e1c7..a88719c 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -12982,14 +13639,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -13026,14 +13683,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -7113,7 +7090,7 @@ index 626e1c7..a88719c 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13022,12 +13682,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -13066,12 +13726,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -7127,7 +7104,7 @@ index 626e1c7..a88719c 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -13082,8 +13742,13 @@ reload_flag \
+@@ -13126,8 +13786,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -7141,7 +7118,7 @@ index 626e1c7..a88719c 100755
  STRIP \
  RANLIB \
  CC \
-@@ -13093,12 +13758,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -13137,12 +13802,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -7157,7 +7134,7 @@ index 626e1c7..a88719c 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -13114,7 +13781,6 @@ no_undefined_flag \
+@@ -13158,7 +13825,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -7165,7 +7142,7 @@ index 626e1c7..a88719c 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13150,6 +13816,7 @@ module_cmds \
+@@ -13194,6 +13860,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -7173,7 +7150,7 @@ index 626e1c7..a88719c 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -13906,7 +14573,8 @@ $as_echo X"$file" |
+@@ -13950,7 +14617,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -7183,7 +7160,7 @@ index 626e1c7..a88719c 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -14009,19 +14677,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -14053,19 +14721,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -7227,7 +7204,7 @@ index 626e1c7..a88719c 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14051,6 +14742,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -14095,6 +14786,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -7240,7 +7217,7 @@ index 626e1c7..a88719c 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -14060,6 +14757,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -14104,6 +14801,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -7250,7 +7227,7 @@ index 626e1c7..a88719c 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14174,12 +14874,12 @@ with_gcc=$GCC
+@@ -14218,12 +14918,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -7266,7 +7243,7 @@ index 626e1c7..a88719c 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -14266,9 +14966,6 @@ inherit_rpath=$inherit_rpath
+@@ -14310,9 +15010,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -7276,7 +7253,7 @@ index 626e1c7..a88719c 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -14284,6 +14981,9 @@ include_expsyms=$lt_include_expsyms
+@@ -14328,6 +15025,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -7286,7 +7263,7 @@ index 626e1c7..a88719c 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -14316,210 +15016,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -14360,210 +15060,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -7661,10 +7638,10 @@ index 626e1c7..a88719c 100755
    chmod +x "$ofile"
  
 diff --git a/ld/configure b/ld/configure
-index f9be51a..3df1149 100755
+index a16c6db059..4277b74bad 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -658,8 +658,11 @@ OTOOL
+@@ -659,8 +659,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -7676,7 +7653,7 @@ index f9be51a..3df1149 100755
  OBJDUMP
  LN_S
  NM
-@@ -781,6 +784,7 @@ enable_static
+@@ -782,6 +785,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -7684,7 +7661,7 @@ index f9be51a..3df1149 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1462,6 +1466,8 @@ Optional Packages:
+@@ -1463,6 +1467,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -7693,7 +7670,7 @@ index f9be51a..3df1149 100755
    --with-lib-path=dir1:dir2...  set default LIB_PATH
    --with-sysroot=DIR Search for usr/lib et al within DIR.
  
-@@ -5656,8 +5662,8 @@ esac
+@@ -5657,8 +5663,8 @@ esac
  
  
  
@@ -7704,7 +7681,7 @@ index f9be51a..3df1149 100755
  
  
  
-@@ -5697,7 +5703,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5698,7 +5704,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -7713,7 +7690,7 @@ index f9be51a..3df1149 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6383,8 +6389,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6384,8 +6390,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -7724,7 +7701,7 @@ index f9be51a..3df1149 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6433,6 +6439,80 @@ esac
+@@ -6434,6 +6440,80 @@ esac
  
  
  
@@ -7805,7 +7782,7 @@ index f9be51a..3df1149 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -6449,6 +6529,11 @@ case $reload_flag in
+@@ -6450,6 +6530,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -7817,7 +7794,7 @@ index f9be51a..3df1149 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6617,7 +6702,8 @@ mingw* | pw32*)
+@@ -6618,7 +6703,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -7827,7 +7804,7 @@ index f9be51a..3df1149 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6771,6 +6857,21 @@ esac
+@@ -6772,6 +6858,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -7849,7 +7826,7 @@ index f9be51a..3df1149 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6786,9 +6887,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6787,9 +6888,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -8014,7 +7991,7 @@ index f9be51a..3df1149 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6804,7 +7058,7 @@ do
+@@ -6805,7 +7059,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -8023,7 +8000,7 @@ index f9be51a..3df1149 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6824,11 +7078,15 @@ $as_echo "no" >&6; }
+@@ -6825,11 +7079,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -8042,7 +8019,7 @@ index f9be51a..3df1149 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6844,7 +7102,7 @@ do
+@@ -6845,7 +7103,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -8051,7 +8028,7 @@ index f9be51a..3df1149 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6863,6 +7121,10 @@ else
+@@ -6864,6 +7122,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -8062,7 +8039,7 @@ index f9be51a..3df1149 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6874,12 +7136,12 @@ ac_tool_warned=yes ;;
+@@ -6875,12 +7137,12 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -8079,7 +8056,7 @@ index f9be51a..3df1149 100755
  
  
  
-@@ -6889,6 +7151,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6890,6 +7152,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -8142,7 +8119,7 @@ index f9be51a..3df1149 100755
  
  
  if test -n "$ac_tool_prefix"; then
-@@ -7225,8 +7543,8 @@ esac
+@@ -7226,8 +7544,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -8153,7 +8130,7 @@ index f9be51a..3df1149 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7262,6 +7580,7 @@ for ac_symprfx in "" "_"; do
+@@ -7263,6 +7581,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -8161,7 +8138,7 @@ index f9be51a..3df1149 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7303,6 +7622,18 @@ _LT_EOF
+@@ -7304,6 +7623,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -8180,7 +8157,7 @@ index f9be51a..3df1149 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7314,7 +7645,7 @@ _LT_EOF
+@@ -7315,7 +7646,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -8189,7 +8166,7 @@ index f9be51a..3df1149 100755
    const char *name;
    void       *address;
  }
-@@ -7340,8 +7671,8 @@ static const void *lt_preloaded_setup() {
+@@ -7341,8 +7672,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -8200,7 +8177,7 @@ index f9be51a..3df1149 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7351,8 +7682,8 @@ _LT_EOF
+@@ -7352,8 +7683,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -8211,7 +8188,7 @@ index f9be51a..3df1149 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7389,6 +7720,19 @@ else
+@@ -7390,6 +7721,19 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -8231,7 +8208,7 @@ index f9be51a..3df1149 100755
  
  
  
-@@ -7409,6 +7753,42 @@ fi
+@@ -7410,6 +7754,42 @@ fi
  
  
  
@@ -8274,7 +8251,7 @@ index f9be51a..3df1149 100755
  
  # Check whether --enable-libtool-lock was given.
  if test "${enable_libtool_lock+set}" = set; then :
-@@ -7616,6 +7996,123 @@ esac
+@@ -7617,6 +7997,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -8398,7 +8375,7 @@ index f9be51a..3df1149 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -8179,6 +8676,8 @@ _LT_EOF
+@@ -8180,6 +8677,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -8407,7 +8384,7 @@ index f9be51a..3df1149 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8247,6 +8746,16 @@ done
+@@ -8248,6 +8747,16 @@ done
  
  
  
@@ -8424,7 +8401,7 @@ index f9be51a..3df1149 100755
  
  
  # Set options
-@@ -8375,7 +8884,8 @@ fi
+@@ -8376,7 +8885,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -8434,7 +8411,7 @@ index f9be51a..3df1149 100755
  
  
  
-@@ -8464,7 +8974,7 @@ aix3*)
+@@ -8465,7 +8975,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -8443,7 +8420,7 @@ index f9be51a..3df1149 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8762,8 +9272,6 @@ fi
+@@ -8763,8 +9273,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -8452,7 +8429,7 @@ index f9be51a..3df1149 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8929,6 +9437,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8930,6 +9438,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -8465,7 +8442,7 @@ index f9be51a..3df1149 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8991,7 +9505,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8992,7 +9506,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -8474,7 +8451,7 @@ index f9be51a..3df1149 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -9048,13 +9562,17 @@ case $host_os in
+@@ -9049,13 +9563,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -8498,7 +8475,7 @@ index f9be51a..3df1149 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9115,6 +9633,11 @@ fi
+@@ -9116,6 +9634,11 @@ fi
  
  
  
@@ -8510,7 +8487,7 @@ index f9be51a..3df1149 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9465,7 +9988,8 @@ _LT_EOF
+@@ -9466,7 +9989,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -8520,7 +8497,7 @@ index f9be51a..3df1149 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9564,12 +10088,12 @@ _LT_EOF
+@@ -9565,12 +10089,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -8535,7 +8512,7 @@ index f9be51a..3df1149 100755
  	  fi
  	  ;;
  	esac
-@@ -9583,8 +10107,8 @@ _LT_EOF
+@@ -9584,8 +10108,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -8546,7 +8523,7 @@ index f9be51a..3df1149 100755
        fi
        ;;
  
-@@ -9602,8 +10126,8 @@ _LT_EOF
+@@ -9603,8 +10127,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8557,7 +8534,7 @@ index f9be51a..3df1149 100755
        else
  	ld_shlibs=no
        fi
-@@ -9649,8 +10173,8 @@ _LT_EOF
+@@ -9650,8 +10174,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8568,7 +8545,7 @@ index f9be51a..3df1149 100755
        else
  	ld_shlibs=no
        fi
-@@ -9780,7 +10304,13 @@ _LT_EOF
+@@ -9781,7 +10305,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -8583,7 +8560,7 @@ index f9be51a..3df1149 100755
  /* end confdefs.h.  */
  
  int
-@@ -9793,22 +10323,29 @@ main ()
+@@ -9794,22 +10324,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8626,7 +8603,7 @@ index f9be51a..3df1149 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9820,7 +10357,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9821,7 +10358,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -8641,7 +8618,7 @@ index f9be51a..3df1149 100755
  /* end confdefs.h.  */
  
  int
-@@ -9833,22 +10376,29 @@ main ()
+@@ -9834,22 +10377,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8684,7 +8661,7 @@ index f9be51a..3df1149 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9892,21 +10442,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9893,21 +10443,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # When not using gcc, we currently assume that we are using
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
@@ -8764,7 +8741,7 @@ index f9be51a..3df1149 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9967,7 +10560,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9968,7 +10561,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -8773,7 +8750,7 @@ index f9be51a..3df1149 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9975,7 +10568,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9976,7 +10569,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -8782,7 +8759,7 @@ index f9be51a..3df1149 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9991,7 +10584,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9992,7 +10585,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -8791,7 +8768,7 @@ index f9be51a..3df1149 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10015,10 +10608,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -10016,10 +10609,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -8804,7 +8781,7 @@ index f9be51a..3df1149 100755
  	  ;;
  	esac
        else
-@@ -10097,23 +10690,36 @@ fi
+@@ -10098,23 +10691,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -8849,7 +8826,7 @@ index f9be51a..3df1149 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10198,7 +10804,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10199,7 +10805,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -8858,7 +8835,7 @@ index f9be51a..3df1149 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10217,9 +10823,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10218,9 +10824,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -8870,7 +8847,7 @@ index f9be51a..3df1149 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10795,8 +11401,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10796,8 +11402,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -8882,7 +8859,7 @@ index f9be51a..3df1149 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10829,13 +11436,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10830,13 +11437,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -8955,7 +8932,7 @@ index f9be51a..3df1149 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10927,7 +11592,7 @@ haiku*)
+@@ -10928,7 +11593,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -8964,7 +8941,7 @@ index f9be51a..3df1149 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11767,10 +12432,10 @@ else
+@@ -11768,10 +12433,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -8977,7 +8954,7 @@ index f9be51a..3df1149 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11873,10 +12538,10 @@ else
+@@ -11874,10 +12539,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -8990,7 +8967,7 @@ index f9be51a..3df1149 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12268,6 +12933,7 @@ $RM -r conftest*
+@@ -12269,6 +12934,7 @@ $RM -r conftest*
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -8998,7 +8975,7 @@ index f9be51a..3df1149 100755
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -12285,6 +12951,7 @@ $RM -r conftest*
+@@ -12286,6 +12952,7 @@ $RM -r conftest*
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -9006,7 +8983,7 @@ index f9be51a..3df1149 100755
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -12567,7 +13234,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -12568,7 +13235,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -9021,7 +8998,7 @@ index f9be51a..3df1149 100755
  /* end confdefs.h.  */
  
  int
-@@ -12580,22 +13253,29 @@ main ()
+@@ -12581,22 +13254,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9064,7 +9041,7 @@ index f9be51a..3df1149 100755
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -12608,7 +13288,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12609,7 +13289,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -9079,7 +9056,7 @@ index f9be51a..3df1149 100755
  /* end confdefs.h.  */
  
  int
-@@ -12621,22 +13307,29 @@ main ()
+@@ -12622,22 +13308,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9122,7 +9099,7 @@ index f9be51a..3df1149 100755
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -12679,29 +13372,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12680,29 +13373,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -9221,7 +9198,7 @@ index f9be51a..3df1149 100755
        darwin* | rhapsody*)
  
  
-@@ -12807,7 +13546,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12808,7 +13547,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
              ;;
            *)
              if test "$GXX" = yes; then
@@ -9230,7 +9207,7 @@ index f9be51a..3df1149 100755
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -12878,10 +13617,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12879,10 +13618,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -9243,7 +9220,7 @@ index f9be51a..3df1149 100755
  	            ;;
  	        esac
  	      fi
-@@ -12922,9 +13661,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12923,9 +13662,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -9255,7 +9232,7 @@ index f9be51a..3df1149 100755
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -12994,20 +13733,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12995,20 +13734,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	      prelink_cmds_CXX='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -9280,7 +9257,7 @@ index f9be51a..3df1149 100755
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -13202,7 +13941,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13203,7 +13942,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -9289,7 +9266,7 @@ index f9be51a..3df1149 100755
  		  ;;
  	      esac
  
-@@ -13248,7 +13987,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13249,7 +13988,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
        solaris*)
          case $cc_basename in
@@ -9298,7 +9275,7 @@ index f9be51a..3df1149 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13289,9 +14028,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13290,9 +14029,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -9310,7 +9287,7 @@ index f9be51a..3df1149 100755
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -13426,6 +14165,13 @@ private:
+@@ -13427,6 +14166,13 @@ private:
  };
  _LT_EOF
  
@@ -9324,7 +9301,7 @@ index f9be51a..3df1149 100755
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13439,7 +14185,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13440,7 +14186,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -9333,7 +9310,7 @@ index f9be51a..3df1149 100755
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13448,13 +14194,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13449,13 +14195,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -9360,7 +9337,7 @@ index f9be51a..3df1149 100755
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -13474,8 +14229,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13475,8 +14230,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -9371,7 +9348,7 @@ index f9be51a..3df1149 100755
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -13511,6 +14268,7 @@ else
+@@ -13512,6 +14269,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -9379,7 +9356,7 @@ index f9be51a..3df1149 100755
  
  # PORTME: override above test on systems where it is broken
  case $host_os in
-@@ -13546,7 +14304,7 @@ linux*)
+@@ -13547,7 +14305,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -9388,7 +9365,7 @@ index f9be51a..3df1149 100755
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -13611,8 +14369,6 @@ fi
+@@ -13612,8 +14370,6 @@ fi
  lt_prog_compiler_pic_CXX=
  lt_prog_compiler_static_CXX=
  
@@ -9397,7 +9374,7 @@ index f9be51a..3df1149 100755
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -13717,6 +14473,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -13718,6 +14474,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	  ;;
  	esac
  	;;
@@ -9409,7 +9386,7 @@ index f9be51a..3df1149 100755
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -13869,7 +14630,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -13870,7 +14631,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	;;
        solaris*)
  	case $cc_basename in
@@ -9418,7 +9395,7 @@ index f9be51a..3df1149 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    lt_prog_compiler_pic_CXX='-KPIC'
  	    lt_prog_compiler_static_CXX='-Bstatic'
-@@ -13934,10 +14695,17 @@ case $host_os in
+@@ -13935,10 +14696,17 @@ case $host_os in
      lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
      ;;
  esac
@@ -9439,7 +9416,7 @@ index f9be51a..3df1149 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -13995,6 +14763,8 @@ fi
+@@ -13996,6 +14764,8 @@ fi
  
  
  
@@ -9448,7 +9425,7 @@ index f9be51a..3df1149 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -14172,6 +14942,7 @@ fi
+@@ -14173,6 +14943,7 @@ fi
  $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
  
    export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -9456,7 +9433,7 @@ index f9be51a..3df1149 100755
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -14186,15 +14957,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -14187,15 +14958,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -9482,7 +9459,7 @@ index f9be51a..3df1149 100755
  
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
  $as_echo "$ld_shlibs_CXX" >&6; }
-@@ -14457,8 +15233,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14458,8 +15234,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -9494,7 +9471,7 @@ index f9be51a..3df1149 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -14490,13 +15267,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14491,13 +15268,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -9567,7 +9544,7 @@ index f9be51a..3df1149 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -14587,7 +15422,7 @@ haiku*)
+@@ -14588,7 +15423,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -9576,7 +9553,7 @@ index f9be51a..3df1149 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -15046,6 +15881,7 @@ fi
+@@ -15047,6 +15882,7 @@ fi
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -9584,7 +9561,7 @@ index f9be51a..3df1149 100755
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -17982,13 +18818,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -18026,13 +18862,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -9605,7 +9582,7 @@ index f9be51a..3df1149 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -18003,14 +18846,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -18047,14 +18890,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -9624,7 +9601,7 @@ index f9be51a..3df1149 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -18043,12 +18889,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -18087,12 +18933,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -9638,7 +9615,7 @@ index f9be51a..3df1149 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -18087,8 +18933,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
+@@ -18131,8 +18977,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9648,7 +9625,7 @@ index f9be51a..3df1149 100755
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18115,12 +18961,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
+@@ -18159,12 +19005,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9662,7 +9639,7 @@ index f9be51a..3df1149 100755
  file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
  hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
  compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18158,8 +19004,13 @@ reload_flag \
+@@ -18202,8 +19048,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -9676,7 +9653,7 @@ index f9be51a..3df1149 100755
  STRIP \
  RANLIB \
  CC \
-@@ -18169,12 +19020,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -18213,12 +19064,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -9692,7 +9669,7 @@ index f9be51a..3df1149 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -18190,7 +19043,6 @@ no_undefined_flag \
+@@ -18234,7 +19087,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -9700,7 +9677,7 @@ index f9be51a..3df1149 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -18212,8 +19064,8 @@ LD_CXX \
+@@ -18256,8 +19108,8 @@ LD_CXX \
  reload_flag_CXX \
  compiler_CXX \
  lt_prog_compiler_no_builtin_flag_CXX \
@@ -9710,7 +9687,7 @@ index f9be51a..3df1149 100755
  lt_prog_compiler_static_CXX \
  lt_cv_prog_compiler_c_o_CXX \
  export_dynamic_flag_spec_CXX \
-@@ -18225,7 +19077,6 @@ no_undefined_flag_CXX \
+@@ -18269,7 +19121,6 @@ no_undefined_flag_CXX \
  hardcode_libdir_flag_spec_CXX \
  hardcode_libdir_flag_spec_ld_CXX \
  hardcode_libdir_separator_CXX \
@@ -9718,7 +9695,7 @@ index f9be51a..3df1149 100755
  exclude_expsyms_CXX \
  include_expsyms_CXX \
  file_list_spec_CXX \
-@@ -18259,6 +19110,7 @@ module_cmds \
+@@ -18303,6 +19154,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -9726,7 +9703,7 @@ index f9be51a..3df1149 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18273,7 +19125,8 @@ archive_expsym_cmds_CXX \
+@@ -18317,7 +19169,8 @@ archive_expsym_cmds_CXX \
  module_cmds_CXX \
  module_expsym_cmds_CXX \
  export_symbols_cmds_CXX \
@@ -9736,7 +9713,7 @@ index f9be51a..3df1149 100755
      case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
      *[\\\\\\\`\\"\\\$]*)
        eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
-@@ -19066,7 +19919,8 @@ $as_echo X"$file" |
+@@ -19110,7 +19963,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -9746,7 +9723,7 @@ index f9be51a..3df1149 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -19169,19 +20023,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -19213,19 +20067,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -9790,7 +9767,7 @@ index f9be51a..3df1149 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -19211,6 +20088,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -19255,6 +20132,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -9803,7 +9780,7 @@ index f9be51a..3df1149 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -19220,6 +20103,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -19264,6 +20147,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -9813,7 +9790,7 @@ index f9be51a..3df1149 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -19334,12 +20220,12 @@ with_gcc=$GCC
+@@ -19378,12 +20264,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -9829,7 +9806,7 @@ index f9be51a..3df1149 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -19426,9 +20312,6 @@ inherit_rpath=$inherit_rpath
+@@ -19470,9 +20356,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -9839,7 +9816,7 @@ index f9be51a..3df1149 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -19444,6 +20327,9 @@ include_expsyms=$lt_include_expsyms
+@@ -19488,6 +20371,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -9849,7 +9826,7 @@ index f9be51a..3df1149 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -19490,210 +20376,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -19534,210 +20420,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -10223,7 +10200,7 @@ index f9be51a..3df1149 100755
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-@@ -19721,12 +20566,12 @@ with_gcc=$GCC_CXX
+@@ -19765,12 +20610,12 @@ with_gcc=$GCC_CXX
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
  
@@ -10239,7 +10216,7 @@ index f9be51a..3df1149 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static_CXX
  
-@@ -19813,9 +20658,6 @@ inherit_rpath=$inherit_rpath_CXX
+@@ -19857,9 +20702,6 @@ inherit_rpath=$inherit_rpath_CXX
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs_CXX
  
@@ -10249,7 +10226,7 @@ index f9be51a..3df1149 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols_CXX
  
-@@ -19831,6 +20673,9 @@ include_expsyms=$lt_include_expsyms_CXX
+@@ -19875,6 +20717,9 @@ include_expsyms=$lt_include_expsyms_CXX
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds_CXX
  
@@ -10260,7 +10237,7 @@ index f9be51a..3df1149 100755
  file_list_spec=$lt_file_list_spec_CXX
  
 diff --git a/libtool.m4 b/libtool.m4
-index 24d13f3..e45fdc6 100644
+index 24d13f3440..e45fdc6998 100644
 --- a/libtool.m4
 +++ b/libtool.m4
 @@ -1,7 +1,8 @@
@@ -12059,7 +12036,7 @@ index 24d13f3..e45fdc6 100644
 +         [0], [convert $build files to toolchain format])dnl
 +])# _LT_PATH_CONVERSION_FUNCTIONS
 diff --git a/ltmain.sh b/ltmain.sh
-index 9503ec8..70e856e 100644
+index 9503ec85d7..70e856e065 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
 @@ -1,10 +1,9 @@
@@ -16352,7 +16329,7 @@ index 9503ec8..70e856e 100644
  	      case "$perm_rpath " in
  	      *" $libdir "*) ;;
 -	      *) perm_rpath="$perm_rpath $libdir" ;;
-+	      *) func_append perm_rpath " $libdir" ;;
++	      *) func_apped perm_rpath " $libdir" ;;
  	      esac
  	    fi
  	  done
@@ -17289,7 +17266,7 @@ index 9503ec8..70e856e 100644
  if test -n "$exec_cmd"; then
    eval exec "$exec_cmd"
 diff --git a/ltoptions.m4 b/ltoptions.m4
-index 5ef12ce..17cfd51 100644
+index 5ef12ced2a..17cfd51c0b 100644
 --- a/ltoptions.m4
 +++ b/ltoptions.m4
 @@ -8,7 +8,7 @@
@@ -17302,7 +17279,7 @@ index 5ef12ce..17cfd51 100644
  # This is to help aclocal find these macros, as it can't see m4_define.
  AC_DEFUN([LTOPTIONS_VERSION], [m4_if([1])])
 diff --git a/ltversion.m4 b/ltversion.m4
-index bf87f77..9c7b5d4 100644
+index bf87f77132..9c7b5d4118 100644
 --- a/ltversion.m4
 +++ b/ltversion.m4
 @@ -7,17 +7,17 @@
@@ -17330,7 +17307,7 @@ index bf87f77..9c7b5d4 100644
  _LT_DECL(, macro_revision, 0)
  ])
 diff --git a/lt~obsolete.m4 b/lt~obsolete.m4
-index bf92b5e..c573da9 100644
+index bf92b5e079..c573da90c5 100644
 --- a/lt~obsolete.m4
 +++ b/lt~obsolete.m4
 @@ -7,7 +7,7 @@
@@ -17343,10 +17320,10 @@ index bf92b5e..c573da9 100644
  # These exist entirely to fool aclocal when bootstrapping libtool.
  #
 diff --git a/opcodes/configure b/opcodes/configure
-index f615634..a340983 100755
+index 0b352a454d..7eaea7db73 100755
 --- a/opcodes/configure
 +++ b/opcodes/configure
-@@ -649,6 +649,9 @@ OTOOL
+@@ -650,6 +650,9 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -17356,7 +17333,7 @@ index f615634..a340983 100755
  OBJDUMP
  LN_S
  NM
-@@ -762,6 +765,7 @@ enable_static
+@@ -763,6 +766,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -17364,7 +17341,7 @@ index f615634..a340983 100755
  enable_libtool_lock
  enable_targets
  enable_werror
-@@ -1422,6 +1426,8 @@ Optional Packages:
+@@ -1423,6 +1427,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -17373,7 +17350,7 @@ index f615634..a340983 100755
  
  Some influential environment variables:
    CC          C compiler command
-@@ -5114,8 +5120,8 @@ esac
+@@ -5115,8 +5121,8 @@ esac
  
  
  
@@ -17384,7 +17361,7 @@ index f615634..a340983 100755
  
  
  
-@@ -5155,7 +5161,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5156,7 +5162,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -17393,7 +17370,7 @@ index f615634..a340983 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5841,8 +5847,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5842,8 +5848,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -17404,7 +17381,7 @@ index f615634..a340983 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5891,6 +5897,80 @@ esac
+@@ -5892,6 +5898,80 @@ esac
  
  
  
@@ -17485,7 +17462,7 @@ index f615634..a340983 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -5907,6 +5987,11 @@ case $reload_flag in
+@@ -5908,6 +5988,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -17497,7 +17474,7 @@ index f615634..a340983 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6075,7 +6160,8 @@ mingw* | pw32*)
+@@ -6076,7 +6161,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -17507,7 +17484,7 @@ index f615634..a340983 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6229,6 +6315,21 @@ esac
+@@ -6230,6 +6316,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -17529,7 +17506,7 @@ index f615634..a340983 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6244,9 +6345,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6245,9 +6346,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -17694,7 +17671,7 @@ index f615634..a340983 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6262,7 +6516,7 @@ do
+@@ -6263,7 +6517,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -17703,7 +17680,7 @@ index f615634..a340983 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6282,11 +6536,15 @@ $as_echo "no" >&6; }
+@@ -6283,11 +6537,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -17722,7 +17699,7 @@ index f615634..a340983 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6302,7 +6560,7 @@ do
+@@ -6303,7 +6561,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -17731,7 +17708,7 @@ index f615634..a340983 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6321,6 +6579,10 @@ else
+@@ -6322,6 +6580,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -17742,7 +17719,7 @@ index f615634..a340983 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6332,16 +6594,72 @@ ac_tool_warned=yes ;;
+@@ -6333,16 +6595,72 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -17819,7 +17796,7 @@ index f615634..a340983 100755
  
  
  
-@@ -6683,8 +7001,8 @@ esac
+@@ -6684,8 +7002,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -17830,7 +17807,7 @@ index f615634..a340983 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6720,6 +7038,7 @@ for ac_symprfx in "" "_"; do
+@@ -6721,6 +7039,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -17838,7 +17815,7 @@ index f615634..a340983 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6761,6 +7080,18 @@ _LT_EOF
+@@ -6762,6 +7081,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -17857,7 +17834,7 @@ index f615634..a340983 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6772,7 +7103,7 @@ _LT_EOF
+@@ -6773,7 +7104,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -17866,7 +17843,7 @@ index f615634..a340983 100755
    const char *name;
    void       *address;
  }
-@@ -6798,8 +7129,8 @@ static const void *lt_preloaded_setup() {
+@@ -6799,8 +7130,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -17877,7 +17854,7 @@ index f615634..a340983 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6809,8 +7140,8 @@ _LT_EOF
+@@ -6810,8 +7141,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -17888,7 +17865,7 @@ index f615634..a340983 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6847,6 +7178,16 @@ else
+@@ -6848,6 +7179,16 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -17905,7 +17882,7 @@ index f615634..a340983 100755
  
  
  
-@@ -6868,6 +7209,45 @@ fi
+@@ -6869,6 +7210,45 @@ fi
  
  
  
@@ -17951,7 +17928,7 @@ index f615634..a340983 100755
  # Check whether --enable-libtool-lock was given.
  if test "${enable_libtool_lock+set}" = set; then :
    enableval=$enable_libtool_lock;
-@@ -7074,6 +7454,123 @@ esac
+@@ -7075,6 +7455,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -18075,7 +18052,7 @@ index f615634..a340983 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7637,6 +8134,8 @@ _LT_EOF
+@@ -7638,6 +8135,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -18084,7 +18061,7 @@ index f615634..a340983 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7802,7 +8301,8 @@ fi
+@@ -7803,7 +8302,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -18094,7 +18071,7 @@ index f615634..a340983 100755
  
  
  
-@@ -7891,7 +8391,7 @@ aix3*)
+@@ -7892,7 +8392,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -18103,7 +18080,7 @@ index f615634..a340983 100755
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8189,8 +8689,6 @@ fi
+@@ -8190,8 +8690,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -18112,7 +18089,7 @@ index f615634..a340983 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8356,6 +8854,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8357,6 +8855,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -18125,7 +18102,7 @@ index f615634..a340983 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8418,7 +8922,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8419,7 +8923,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -18134,7 +18111,7 @@ index f615634..a340983 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8475,13 +8979,17 @@ case $host_os in
+@@ -8476,13 +8980,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -18158,7 +18135,7 @@ index f615634..a340983 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8542,6 +9050,11 @@ fi
+@@ -8543,6 +9051,11 @@ fi
  
  
  
@@ -18170,7 +18147,7 @@ index f615634..a340983 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8892,7 +9405,8 @@ _LT_EOF
+@@ -8893,7 +9406,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -18180,7 +18157,7 @@ index f615634..a340983 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8991,12 +9505,12 @@ _LT_EOF
+@@ -8992,12 +9506,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -18195,7 +18172,7 @@ index f615634..a340983 100755
  	  fi
  	  ;;
  	esac
-@@ -9010,8 +9524,8 @@ _LT_EOF
+@@ -9011,8 +9525,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -18206,7 +18183,7 @@ index f615634..a340983 100755
        fi
        ;;
  
-@@ -9029,8 +9543,8 @@ _LT_EOF
+@@ -9030,8 +9544,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -18217,7 +18194,7 @@ index f615634..a340983 100755
        else
  	ld_shlibs=no
        fi
-@@ -9076,8 +9590,8 @@ _LT_EOF
+@@ -9077,8 +9591,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -18228,7 +18205,7 @@ index f615634..a340983 100755
        else
  	ld_shlibs=no
        fi
-@@ -9207,7 +9721,13 @@ _LT_EOF
+@@ -9208,7 +9722,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -18243,7 +18220,7 @@ index f615634..a340983 100755
  /* end confdefs.h.  */
  
  int
-@@ -9220,22 +9740,29 @@ main ()
+@@ -9221,22 +9741,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -18286,7 +18263,7 @@ index f615634..a340983 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9247,7 +9774,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9248,7 +9775,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -18301,7 +18278,7 @@ index f615634..a340983 100755
  /* end confdefs.h.  */
  
  int
-@@ -9260,22 +9793,29 @@ main ()
+@@ -9261,22 +9794,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -18344,7 +18321,7 @@ index f615634..a340983 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9320,20 +9860,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9321,20 +9861,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -18422,7 +18399,7 @@ index f615634..a340983 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9394,7 +9977,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9395,7 +9978,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -18431,7 +18408,7 @@ index f615634..a340983 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9402,7 +9985,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9403,7 +9986,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -18440,7 +18417,7 @@ index f615634..a340983 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9418,7 +10001,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9419,7 +10002,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -18449,7 +18426,7 @@ index f615634..a340983 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9442,10 +10025,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9443,10 +10026,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -18462,7 +18439,7 @@ index f615634..a340983 100755
  	  ;;
  	esac
        else
-@@ -9524,23 +10107,36 @@ fi
+@@ -9525,23 +10108,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -18507,7 +18484,7 @@ index f615634..a340983 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9625,7 +10221,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9626,7 +10222,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -18516,7 +18493,7 @@ index f615634..a340983 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9644,9 +10240,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9645,9 +10241,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -18528,7 +18505,7 @@ index f615634..a340983 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10222,8 +10818,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10223,8 +10819,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -18540,7 +18517,7 @@ index f615634..a340983 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10256,13 +10853,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10257,13 +10854,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -18613,7 +18590,7 @@ index f615634..a340983 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10354,7 +11009,7 @@ haiku*)
+@@ -10355,7 +11010,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -18622,7 +18599,7 @@ index f615634..a340983 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -11194,10 +11849,10 @@ else
+@@ -11195,10 +11850,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -18635,7 +18612,7 @@ index f615634..a340983 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11300,10 +11955,10 @@ else
+@@ -11301,10 +11956,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -18648,7 +18625,7 @@ index f615634..a340983 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12499,7 +13154,7 @@ if test "$enable_shared" = "yes"; then
+@@ -12543,7 +13198,7 @@ if test "$enable_shared" = "yes"; then
  # since libbfd may not pull in the entirety of libiberty.
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -18657,7 +18634,7 @@ index f615634..a340983 100755
    fi
  
    case "${host}" in
-@@ -13473,13 +14128,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -13518,13 +14173,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -18678,7 +18655,7 @@ index f615634..a340983 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13494,14 +14156,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -13539,14 +14201,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -18697,7 +18674,7 @@ index f615634..a340983 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13534,12 +14199,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -13579,12 +14244,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -18711,7 +18688,7 @@ index f615634..a340983 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -13594,8 +14259,13 @@ reload_flag \
+@@ -13639,8 +14304,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -18725,7 +18702,7 @@ index f615634..a340983 100755
  STRIP \
  RANLIB \
  CC \
-@@ -13605,12 +14275,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -13650,12 +14320,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -18741,7 +18718,7 @@ index f615634..a340983 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -13626,7 +14298,6 @@ no_undefined_flag \
+@@ -13671,7 +14343,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -18749,7 +18726,7 @@ index f615634..a340983 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13662,6 +14333,7 @@ module_cmds \
+@@ -13707,6 +14378,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -18757,7 +18734,7 @@ index f615634..a340983 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -14418,7 +15090,8 @@ $as_echo X"$file" |
+@@ -14463,7 +15135,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -18767,7 +18744,7 @@ index f615634..a340983 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -14521,19 +15194,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -14566,19 +15239,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -18811,7 +18788,7 @@ index f615634..a340983 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14563,6 +15259,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -14608,6 +15304,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -18824,7 +18801,7 @@ index f615634..a340983 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -14572,6 +15274,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -14617,6 +15319,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -18834,7 +18811,7 @@ index f615634..a340983 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14686,12 +15391,12 @@ with_gcc=$GCC
+@@ -14731,12 +15436,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -18850,7 +18827,7 @@ index f615634..a340983 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -14778,9 +15483,6 @@ inherit_rpath=$inherit_rpath
+@@ -14823,9 +15528,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -18860,7 +18837,7 @@ index f615634..a340983 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -14796,6 +15498,9 @@ include_expsyms=$lt_include_expsyms
+@@ -14841,6 +15543,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -18870,7 +18847,7 @@ index f615634..a340983 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -14828,210 +15533,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -14873,210 +15578,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -19245,7 +19222,7 @@ index f615634..a340983 100755
    chmod +x "$ofile"
  
 diff --git a/opcodes/configure.ac b/opcodes/configure.ac
-index c7f4783..f2e002d 100644
+index b9f5eb8a4f..a31b66a2f0 100644
 --- a/opcodes/configure.ac
 +++ b/opcodes/configure.ac
 @@ -167,7 +167,7 @@ changequote(,)dnl
@@ -19258,7 +19235,7 @@ index c7f4783..f2e002d 100644
  
    case "${host}" in
 diff --git a/zlib/configure b/zlib/configure
-index bba9fd2..25a2dae 100755
+index bed9e3ea2b..caef0b674e 100755
 --- a/zlib/configure
 +++ b/zlib/configure
 @@ -614,8 +614,11 @@ OTOOL
@@ -20542,15 +20519,6 @@ index bba9fd2..25a2dae 100755
    hardcode_into_libs=yes
    ;;
  
-@@ -10408,7 +11063,7 @@ else
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 10411 "configure"
-+#line $LINENO "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
 @@ -10452,10 +11107,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
@@ -20564,15 +20532,6 @@ index bba9fd2..25a2dae 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -10514,7 +11169,7 @@ else
-   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
-   lt_status=$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
--#line 10517 "configure"
-+#line $LINENO "configure"
- #include "confdefs.h"
- 
- #if HAVE_DLFCN_H
 @@ -10558,10 +11213,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
@@ -20586,7 +20545,7 @@ index bba9fd2..25a2dae 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11993,13 +12648,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -11992,13 +12647,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -20607,7 +20566,7 @@ index bba9fd2..25a2dae 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -12014,14 +12676,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -12013,14 +12675,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -20626,7 +20585,7 @@ index bba9fd2..25a2dae 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -12054,12 +12719,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -12053,12 +12718,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -20640,7 +20599,7 @@ index bba9fd2..25a2dae 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -12114,8 +12779,13 @@ reload_flag \
+@@ -12113,8 +12778,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -20654,7 +20613,7 @@ index bba9fd2..25a2dae 100755
  STRIP \
  RANLIB \
  CC \
-@@ -12125,12 +12795,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -12124,12 +12794,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -20670,7 +20629,7 @@ index bba9fd2..25a2dae 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -12146,7 +12818,6 @@ no_undefined_flag \
+@@ -12145,7 +12817,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -20678,7 +20637,7 @@ index bba9fd2..25a2dae 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -12182,6 +12853,7 @@ module_cmds \
+@@ -12181,6 +12852,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -20686,7 +20645,7 @@ index bba9fd2..25a2dae 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -12771,7 +13443,8 @@ $as_echo X"$file" |
+@@ -12770,7 +13442,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -20696,7 +20655,7 @@ index bba9fd2..25a2dae 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -12874,19 +13547,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -12873,19 +13546,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -20740,7 +20699,7 @@ index bba9fd2..25a2dae 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -12916,6 +13612,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -12915,6 +13611,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -20753,7 +20712,7 @@ index bba9fd2..25a2dae 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -12925,6 +13627,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -12924,6 +13626,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -20763,7 +20722,7 @@ index bba9fd2..25a2dae 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -13039,12 +13744,12 @@ with_gcc=$GCC
+@@ -13038,12 +13743,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -20779,7 +20738,7 @@ index bba9fd2..25a2dae 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -13131,9 +13836,6 @@ inherit_rpath=$inherit_rpath
+@@ -13130,9 +13835,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -20789,7 +20748,7 @@ index bba9fd2..25a2dae 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -13149,6 +13851,9 @@ include_expsyms=$lt_include_expsyms
+@@ -13148,6 +13850,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -20799,7 +20758,7 @@ index bba9fd2..25a2dae 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -13181,210 +13886,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -13180,210 +13885,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -21174,4 +21133,5 @@ index bba9fd2..25a2dae 100755
    chmod +x "$ofile"
  
 -- 
-2.9.0
+2.12.0
+
diff --git a/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch b/meta/recipes-devtools/binutils/binutils/0008-Add-the-armv5e-architecture-to-binutils.patch
similarity index 83%
rename from meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
rename to meta/recipes-devtools/binutils/binutils/0008-Add-the-armv5e-architecture-to-binutils.patch
index 795abf3659..449225a362 100644
--- a/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-Add-the-armv5e-architecture-to-binutils.patch
@@ -1,7 +1,7 @@
-From 9475aee8a702aa531737ec12dfd928d52951bc84 Mon Sep 17 00:00:00 2001
+From 9c313e8a15a7e7c5c0f2906e3218ed211563ac2a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:37:10 +0000
-Subject: [PATCH 07/13] Add the armv5e architecture to binutils
+Subject: [PATCH 08/15] Add the armv5e architecture to binutils
 
 Binutils has a comment that indicates it is supposed to match gcc for
 all of the support "-march=" settings, but it was lacking the armv5e setting.
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/gas/config/tc-arm.c b/gas/config/tc-arm.c
-index 73d0531..4b9e32f 100644
+index 60bda51070..eb6d0afd6e 100644
 --- a/gas/config/tc-arm.c
 +++ b/gas/config/tc-arm.c
-@@ -25421,6 +25421,7 @@ static const struct arm_arch_option_table arm_archs[] =
+@@ -25633,6 +25633,7 @@ static const struct arm_arch_option_table arm_archs[] =
    ARM_ARCH_OPT ("armv4t",	ARM_ARCH_V4T,	 FPU_ARCH_FPA),
    ARM_ARCH_OPT ("armv4txm",	ARM_ARCH_V4TxM,	 FPU_ARCH_FPA),
    ARM_ARCH_OPT ("armv5",	ARM_ARCH_V5,	 FPU_ARCH_VFP),
@@ -31,5 +31,5 @@ index 73d0531..4b9e32f 100644
    ARM_ARCH_OPT ("armv5txm",	ARM_ARCH_V5TxM,	 FPU_ARCH_VFP),
    ARM_ARCH_OPT ("armv5te",	ARM_ARCH_V5TE,	 FPU_ARCH_VFP),
 -- 
-2.9.0
+2.12.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0009-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
similarity index 82%
rename from meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
rename to meta/recipes-devtools/binutils/binutils/0009-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
index af524ced29..1c40593927 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
@@ -1,7 +1,7 @@
-From b2d277937d11f1ce1d581f48ff74a25822a052da Mon Sep 17 00:00:00 2001
+From 2be9b44a4a308e3ea42a027c4c3211170f10c9c0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:39:01 +0000
-Subject: [PATCH 08/13] don't let the distro compiler point to the wrong
+Subject: [PATCH 09/15] don't let the distro compiler point to the wrong
  installation location
 
 Thanks to RP for helping find the source code causing the issue.
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
-index c7a4568..f766b72 100644
+index 0ff9e45e45..42c32642b2 100644
 --- a/libiberty/Makefile.in
 +++ b/libiberty/Makefile.in
-@@ -364,7 +364,8 @@ install-strip: install
+@@ -366,7 +366,8 @@ install-strip: install
  # multilib-specific flags, it's overridden by FLAGS_TO_PASS from the
  # default multilib, so we have to take CFLAGS into account as well,
  # since it will be passed the multilib flags.
@@ -31,5 +31,5 @@ index c7a4568..f766b72 100644
  	if test -n "${target_header_dir}"; then \
  		${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
 -- 
-2.9.0
+2.12.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0010-warn-for-uses-of-system-directories-when-cross-linki.patch
similarity index 90%
rename from meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
rename to meta/recipes-devtools/binutils/binutils/0010-warn-for-uses-of-system-directories-when-cross-linki.patch
index 3c83e69e43..0774ad6f0c 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0010-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -1,7 +1,7 @@
-From 7ab8e318659eb5d9adc758c78d084a95560b93fd Mon Sep 17 00:00:00 2001
+From b1ab17abe4128684f19775448545176fb2a5e27e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Jan 2016 06:31:09 +0000
-Subject: [PATCH 09/13] warn for uses of system directories when cross linking
+Subject: [PATCH 10/15] warn for uses of system directories when cross linking
 
 2008-07-02  Joseph Myers  <joseph@codesourcery.com>
 
@@ -63,7 +63,7 @@ Upstream-Status: Pending
  9 files changed, 86 insertions(+)
 
 diff --git a/ld/config.in b/ld/config.in
-index 2c6d698..d3cb7e8 100644
+index 2c6d698b6c..d3cb7e882d 100644
 --- a/ld/config.in
 +++ b/ld/config.in
 @@ -17,6 +17,9 @@
@@ -77,10 +77,10 @@ index 2c6d698..d3cb7e8 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index 3df1149..0601c98 100755
+index 4277b74bad..63109644b6 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -792,6 +792,7 @@ with_lib_path
+@@ -793,6 +793,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -88,7 +88,7 @@ index 3df1149..0601c98 100755
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1449,6 +1450,8 @@ Optional Features:
+@@ -1450,6 +1451,8 @@ Optional Features:
    --disable-largefile     omit support for large files
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -97,7 +97,7 @@ index 3df1149..0601c98 100755
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -16313,6 +16316,19 @@ fi
+@@ -16314,6 +16317,19 @@ fi
  
  
  
@@ -118,7 +118,7 @@ index 3df1149..0601c98 100755
  if test "${enable_gold+set}" = set; then :
    enableval=$enable_gold; case "${enableval}" in
 diff --git a/ld/configure.ac b/ld/configure.ac
-index d17281f..9fb3db9 100644
+index 36a9f5083a..47f1d33fa5 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
 @@ -95,6 +95,16 @@ AC_SUBST(use_sysroot)
@@ -139,10 +139,10 @@ index d17281f..9fb3db9 100644
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
 diff --git a/ld/ld.h b/ld/ld.h
-index 85a48ad..a8fdddf 100644
+index 104bb8e237..74c914bdd5 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
-@@ -169,6 +169,14 @@ typedef struct
+@@ -172,6 +172,14 @@ typedef struct
    /* If set, display the target memory usage (per memory region).  */
    bfd_boolean print_memory_usage;
  
@@ -158,10 +158,10 @@ index 85a48ad..a8fdddf 100644
    enum endian_enum endian;
  
 diff --git a/ld/ld.texinfo b/ld/ld.texinfo
-index bc16764..838c75d 100644
+index d393acdd94..ba995b1e3a 100644
 --- a/ld/ld.texinfo
 +++ b/ld/ld.texinfo
-@@ -2357,6 +2357,18 @@ string identifying the original linked file does not change.
+@@ -2403,6 +2403,18 @@ string identifying the original linked file does not change.
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
@@ -181,7 +181,7 @@ index bc16764..838c75d 100644
  
  @c man end
 diff --git a/ld/ldfile.c b/ld/ldfile.c
-index e397737..013727b 100644
+index 0943bb2dfa..95874c75de 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
 @@ -114,6 +114,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
@@ -209,10 +209,10 @@ index e397737..013727b 100644
  
  /* Try to open a BFD for a lang_input_statement.  */
 diff --git a/ld/ldlex.h b/ld/ldlex.h
-index cf943e4..12cfcaa 100644
+index 3ecac2bc86..34117f43a5 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
-@@ -144,6 +144,8 @@ enum option_values
+@@ -146,6 +146,8 @@ enum option_values
    OPTION_PRINT_MEMORY_USAGE,
    OPTION_REQUIRE_DEFINED_SYMBOL,
    OPTION_ORPHAN_HANDLING,
@@ -222,10 +222,10 @@ index cf943e4..12cfcaa 100644
  
  /* The initial parser states.  */
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index e7a8dff..3ccf2af 100644
+index 1e48b1a2db..21f27bacf1 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -257,6 +257,8 @@ main (int argc, char **argv)
+@@ -270,6 +270,8 @@ main (int argc, char **argv)
    command_line.warn_mismatch = TRUE;
    command_line.warn_search_mismatch = TRUE;
    command_line.check_section_addresses = -1;
@@ -235,10 +235,10 @@ index e7a8dff..3ccf2af 100644
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 6d28e91..5c9da57 100644
+index 0b7d4976ac..dedc07a143 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
-@@ -530,6 +530,14 @@ static const struct ld_option ld_options[] =
+@@ -535,6 +535,14 @@ static const struct ld_option ld_options[] =
    { {"orphan-handling", required_argument, NULL, OPTION_ORPHAN_HANDLING},
      '\0', N_("=MODE"), N_("Control how orphan sections are handled."),
      TWO_DASHES },
@@ -253,7 +253,7 @@ index 6d28e91..5c9da57 100644
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -1550,6 +1558,14 @@ parse_args (unsigned argc, char **argv)
+@@ -1562,6 +1570,14 @@ parse_args (unsigned argc, char **argv)
  	    einfo (_("%P%F: invalid argument to option"
  		     " \"--orphan-handling\"\n"));
  	  break;
@@ -269,5 +269,5 @@ index 6d28e91..5c9da57 100644
      }
  
 -- 
-2.9.0
+2.12.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0011-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
similarity index 90%
rename from meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
rename to meta/recipes-devtools/binutils/binutils/0011-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
index e2f6a51a39..949ef51bdf 100644
--- a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
+++ b/meta/recipes-devtools/binutils/binutils/0011-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
@@ -1,7 +1,7 @@
-From 27fc7a4927ab92925a5be84217959d9f1c808ccc Mon Sep 17 00:00:00 2001
+From 4fe13a36997253a5c91bcb086aeb392ab2095f67 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:42:38 +0000
-Subject: [PATCH 10/13] Fix rpath in libtool when sysroot is enabled
+Subject: [PATCH 11/15] Fix rpath in libtool when sysroot is enabled
 
 Enabling sysroot support in libtool exposed a bug where the final
 library had an RPATH encoded into it which still pointed to the
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/ltmain.sh b/ltmain.sh
-index 70e856e..11ee684 100644
+index 70e856e065..11ee684ccc 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
 @@ -8035,9 +8035,11 @@ EOF
@@ -48,5 +48,5 @@ index 70e856e..11ee684 100644
  	    if test -z "$hardcode_libdirs"; then
  	      hardcode_libdirs="$libdir"
 -- 
-2.9.0
+2.12.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binutils/0012-Change-default-emulation-for-mips64-linux.patch
similarity index 88%
rename from meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
rename to meta/recipes-devtools/binutils/binutils/0012-Change-default-emulation-for-mips64-linux.patch
index 3fdb5eb927..2ac101c958 100644
--- a/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
+++ b/meta/recipes-devtools/binutils/binutils/0012-Change-default-emulation-for-mips64-linux.patch
@@ -1,7 +1,7 @@
-From 6b018e8129298dbd5b714e459ef0b3aef5bbce13 Mon Sep 17 00:00:00 2001
+From f43f832e0009caea6a3d5bcaa8f0a64d943072ea Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:44:14 +0000
-Subject: [PATCH 11/13] Change default emulation for mips64*-*-linux
+Subject: [PATCH 12/15] Change default emulation for mips64*-*-linux
 
 we change the default emulations to be N64 instead of N32
 
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/bfd/config.bfd b/bfd/config.bfd
-index b998830..ab17e72 100644
+index 1b28016b91..63596c2ebc 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -1101,12 +1101,12 @@ case "${targ}" in
+@@ -1183,12 +1183,12 @@ case "${targ}" in
      targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec mips_ecoff_be_vec mips_ecoff_le_vec"
      ;;
    mips64*el-*-linux*)
@@ -35,10 +35,10 @@ index b998830..ab17e72 100644
    mips*el-*-linux*)
      targ_defvec=mips_elf32_trad_le_vec
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index a3db909..212327c 100644
+index b85c6bb35a..4e77383a19 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -513,11 +513,11 @@ mips*el-*-vxworks*)	targ_emul=elf32elmipvxworks
+@@ -518,11 +518,11 @@ mips*el-*-vxworks*)	targ_emul=elf32elmipvxworks
  mips*-*-vxworks*)	targ_emul=elf32ebmipvxworks
  		        targ_extra_emuls="elf32elmipvxworks" ;;
  mips*-*-windiss)	targ_emul=elf32mipswindiss ;;
@@ -55,5 +55,5 @@ index a3db909..212327c 100644
  mips*el-*-linux-*)	targ_emul=elf32ltsmip
  			targ_extra_emuls="elf32btsmip elf32ltsmipn32 elf64ltsmip elf32btsmipn32 elf64btsmip"
 -- 
-2.9.0
+2.12.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch b/meta/recipes-devtools/binutils/binutils/0013-Add-support-for-Netlogic-XLP.patch
similarity index 90%
rename from meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
rename to meta/recipes-devtools/binutils/binutils/0013-Add-support-for-Netlogic-XLP.patch
index 8103347ba4..b03e04608d 100644
--- a/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
+++ b/meta/recipes-devtools/binutils/binutils/0013-Add-support-for-Netlogic-XLP.patch
@@ -1,7 +1,7 @@
-From c2e138f4ccdf8af81c18c8511c901d3deee696b5 Mon Sep 17 00:00:00 2001
+From fc6fa6a6e6e9e6e5ad7080785af31b4ea68f60c4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:06:19 +0000
-Subject: [PATCH 12/13] Add support for Netlogic XLP
+Subject: [PATCH 13/15] Add support for Netlogic XLP
 
 Patch From: Nebu Philips <nphilips@netlogicmicro.com>
 
@@ -26,16 +26,15 @@ Upstream-Status: Pending
  binutils/readelf.c    |  1 +
  gas/config/tc-mips.c  |  4 +++-
  gas/configure         |  3 +++
- gas/configure.tgt     |  2 +-
  include/elf/mips.h    |  1 +
  include/opcode/mips.h | 10 ++++++++--
  ld/configure.tgt      |  2 ++
  opcodes/mips-dis.c    | 12 +++++-------
  opcodes/mips-opc.c    | 33 +++++++++++++++++++++------------
- 15 files changed, 65 insertions(+), 25 deletions(-)
+ 14 files changed, 64 insertions(+), 24 deletions(-)
 
 diff --git a/bfd/aoutx.h b/bfd/aoutx.h
-index be0126a..4ca7e24 100644
+index d30e8b8fbc..913b499744 100644
 --- a/bfd/aoutx.h
 +++ b/bfd/aoutx.h
 @@ -812,6 +812,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,
@@ -47,7 +46,7 @@ index be0126a..4ca7e24 100644
  	  arch_flags = M_MIPS2;
  	  break;
 diff --git a/bfd/archures.c b/bfd/archures.c
-index 96c9109..5a30d02 100644
+index 6f35a5b2a7..d12cdf609a 100644
 --- a/bfd/archures.c
 +++ b/bfd/archures.c
 @@ -197,6 +197,7 @@ DESCRIPTION
@@ -59,10 +58,10 @@ index 96c9109..5a30d02 100644
  .#define bfd_mach_mipsisa32r2           33
  .#define bfd_mach_mipsisa32r3           34
 diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
-index 30513c4..5e8ed4c 100644
+index 6288c3bb4a..e9f9859a7b 100644
 --- a/bfd/bfd-in2.h
 +++ b/bfd/bfd-in2.h
-@@ -2008,6 +2008,7 @@ enum bfd_architecture
+@@ -2041,6 +2041,7 @@ enum bfd_architecture
  #define bfd_mach_mips_octeon2          6502
  #define bfd_mach_mips_octeon3          6503
  #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'  */
@@ -71,10 +70,10 @@ index 30513c4..5e8ed4c 100644
  #define bfd_mach_mipsisa32r2           33
  #define bfd_mach_mipsisa32r3           34
 diff --git a/bfd/config.bfd b/bfd/config.bfd
-index ab17e72..863be89 100644
+index 63596c2ebc..6e923fb0ed 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -1084,6 +1084,11 @@ case "${targ}" in
+@@ -1166,6 +1166,11 @@ case "${targ}" in
      targ_defvec=mips_elf32_le_vec
      targ_selvecs="mips_elf32_be_vec mips_elf64_be_vec mips_elf64_le_vec"
      ;;
@@ -87,7 +86,7 @@ index ab17e72..863be89 100644
      targ_defvec=mips_elf32_be_vec
      targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec"
 diff --git a/bfd/cpu-mips.c b/bfd/cpu-mips.c
-index d209fb6..b6a86ae 100644
+index b9ecdd6e55..df1bffc25b 100644
 --- a/bfd/cpu-mips.c
 +++ b/bfd/cpu-mips.c
 @@ -104,7 +104,8 @@ enum
@@ -111,10 +110,10 @@ index d209fb6..b6a86ae 100644
  
  /* The default architecture is mips:3000, but with a machine number of
 diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c
-index e47276b..71c30a0 100644
+index 723853f821..7b464211c3 100644
 --- a/bfd/elfxx-mips.c
 +++ b/bfd/elfxx-mips.c
-@@ -6646,6 +6646,9 @@ _bfd_elf_mips_mach (flagword flags)
+@@ -6787,6 +6787,9 @@ _bfd_elf_mips_mach (flagword flags)
      case E_MIPS_MACH_XLR:
        return bfd_mach_mips_xlr;
  
@@ -124,7 +123,7 @@ index e47276b..71c30a0 100644
      default:
        switch (flags & EF_MIPS_ARCH)
  	{
-@@ -11949,6 +11952,10 @@ mips_set_isa_flags (bfd *abfd)
+@@ -12106,6 +12109,10 @@ mips_set_isa_flags (bfd *abfd)
        val = E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;
        break;
  
@@ -135,7 +134,7 @@ index e47276b..71c30a0 100644
      case bfd_mach_mipsisa32:
        val = E_MIPS_ARCH_32;
        break;
-@@ -13975,6 +13982,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
+@@ -14135,6 +14142,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
    { bfd_mach_mips_octeonp, bfd_mach_mips_octeon },
    { bfd_mach_mips_octeon, bfd_mach_mipsisa64r2 },
    { bfd_mach_mips_loongson_3a, bfd_mach_mipsisa64r2 },
@@ -144,10 +143,10 @@ index e47276b..71c30a0 100644
    /* MIPS64 extensions.  */
    { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },
 diff --git a/binutils/readelf.c b/binutils/readelf.c
-index 274ddd1..d31558c 100644
+index 8dca490226..b5f577f5a1 100644
 --- a/binutils/readelf.c
 +++ b/binutils/readelf.c
-@@ -3230,6 +3230,7 @@ get_machine_flags (unsigned e_flags, unsigned e_machine)
+@@ -3261,6 +3261,7 @@ get_machine_flags (unsigned e_flags, unsigned e_machine)
  	    case E_MIPS_MACH_OCTEON2: strcat (buf, ", octeon2"); break;
  	    case E_MIPS_MACH_OCTEON3: strcat (buf, ", octeon3"); break;
  	    case E_MIPS_MACH_XLR:  strcat (buf, ", xlr"); break;
@@ -156,7 +155,7 @@ index 274ddd1..d31558c 100644
  	    /* We simply ignore the field in this case to avoid confusion:
  	       MIPS ELF does not specify EF_MIPS_MACH, it is a GNU
 diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c
-index eb8b26b..e59dce6 100644
+index e24e84df54..baf84e419d 100644
 --- a/gas/config/tc-mips.c
 +++ b/gas/config/tc-mips.c
 @@ -552,6 +552,7 @@ static int mips_32bitmode = 0;
@@ -175,7 +174,7 @@ index eb8b26b..e59dce6 100644
     )
  
  /* Whether the processor uses hardware interlocks to protect reads
-@@ -18858,7 +18860,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
+@@ -19409,7 +19411,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
    /* Broadcom XLP.
       XLP is mostly like XLR, with the prominent exception that it is
       MIPS64R2 rather than MIPS64.  */
@@ -185,10 +184,10 @@ index eb8b26b..e59dce6 100644
    /* MIPS 64 Release 6 */
    { "i6400",	      0, ASE_MSA,		ISA_MIPS64R6, CPU_MIPS64R6},
 diff --git a/gas/configure b/gas/configure
-index 45da030..aba89f7 100755
+index a36f1ae161..99f0a94e20 100755
 --- a/gas/configure
 +++ b/gas/configure
-@@ -12914,6 +12914,9 @@ _ACEOF
+@@ -12989,6 +12989,9 @@ _ACEOF
  	  mipsisa64r6 | mipsisa64r6el)
  	    mips_cpu=mips64r6
  	    ;;
@@ -198,21 +197,8 @@ index 45da030..aba89f7 100755
  	  mipstx39 | mipstx39el)
  	    mips_cpu=r3900
  	    ;;
-diff --git a/gas/configure.tgt b/gas/configure.tgt
-index 1b9fd99..a9f1977 100644
---- a/gas/configure.tgt
-+++ b/gas/configure.tgt
-@@ -339,7 +339,7 @@ case ${generic_target} in
-   mips-*-sysv4*MP* | mips-*-gnu*)	fmt=elf em=tmips ;;
-   mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
- 					fmt=elf em=tmips ;;
--  mips-*-elf* | mips-*-rtems*)		fmt=elf ;;
-+  mips-*-elf* | mips-*-rtems*)		fmt=elf em=tmips ;;
-   mips-*-netbsd*)			fmt=elf em=tmips ;;
-   mips-*-openbsd*)			fmt=elf em=tmips ;;
- 
 diff --git a/include/elf/mips.h b/include/elf/mips.h
-index 7e813de..d7d72c1 100644
+index 3e27b05122..81ea78a817 100644
 --- a/include/elf/mips.h
 +++ b/include/elf/mips.h
 @@ -290,6 +290,7 @@ END_RELOC_NUMBERS (R_MIPS_maxext)
@@ -224,10 +210,10 @@ index 7e813de..d7d72c1 100644
  #define E_MIPS_MACH_OCTEON3	0x008e0000
  #define E_MIPS_MACH_5400	0x00910000
 diff --git a/include/opcode/mips.h b/include/opcode/mips.h
-index b1d4ef6..f2c8e88 100644
+index 0d043d9520..450e9c2d67 100644
 --- a/include/opcode/mips.h
 +++ b/include/opcode/mips.h
-@@ -1232,8 +1232,10 @@ static const unsigned int mips_isa_table[] = {
+@@ -1244,8 +1244,10 @@ static const unsigned int mips_isa_table[] = {
  #define INSN_LOONGSON_2F          0x80000000
  /* Loongson 3A.  */
  #define INSN_LOONGSON_3A          0x00000400
@@ -240,7 +226,7 @@ index b1d4ef6..f2c8e88 100644
  
  /* DSP ASE */
  #define ASE_DSP			0x00000001
-@@ -1331,6 +1333,7 @@ static const unsigned int mips_isa_table[] = {
+@@ -1344,6 +1346,7 @@ static const unsigned int mips_isa_table[] = {
  #define CPU_OCTEON2	6502
  #define CPU_OCTEON3	6503
  #define CPU_XLR     	887682   	/* decimal 'XLR'   */
@@ -248,7 +234,7 @@ index b1d4ef6..f2c8e88 100644
  
  /* Return true if the given CPU is included in INSN_* mask MASK.  */
  
-@@ -1408,6 +1411,9 @@ cpu_is_member (int cpu, unsigned int mask)
+@@ -1421,6 +1424,9 @@ cpu_is_member (int cpu, unsigned int mask)
        return ((mask & INSN_ISA_MASK) == INSN_ISA32R6)
  	     || ((mask & INSN_ISA_MASK) == INSN_ISA64R6);
  
@@ -259,10 +245,10 @@ index b1d4ef6..f2c8e88 100644
        return FALSE;
      }
 diff --git a/ld/configure.tgt b/ld/configure.tgt
-index 212327c..212e09c 100644
+index 4e77383a19..8a81f7ac39 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -499,6 +499,8 @@ mips*el-sde-elf* | mips*el-mti-elf* | mips*el-img-elf*)
+@@ -504,6 +504,8 @@ mips*el-sde-elf* | mips*el-mti-elf* | mips*el-img-elf*)
  mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
  			targ_emul=elf32btsmip
  			targ_extra_emuls="elf32ltsmip elf32btsmipn32 elf64btsmip elf32ltsmipn32 elf64ltsmip" ;;
@@ -272,7 +258,7 @@ index 212327c..212e09c 100644
  			targ_extra_emuls="elf32lr5900"
  			targ_extra_libpath=$targ_extra_emuls ;;
 diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c
-index 3f874e7..9813d0e 100644
+index bb9912e462..70ecc51717 100644
 --- a/opcodes/mips-dis.c
 +++ b/opcodes/mips-dis.c
 @@ -648,13 +648,11 @@ const struct mips_arch_choice mips_arch_choices[] =
@@ -295,7 +281,7 @@ index 3f874e7..9813d0e 100644
    /* This entry, mips16, is here only for ISA/processor selection; do
       not print its name.  */
 diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c
-index a95eff1..99fb7bb 100644
+index 5cb8e7365f..f2074856a2 100644
 --- a/opcodes/mips-opc.c
 +++ b/opcodes/mips-opc.c
 @@ -320,7 +320,8 @@ decode_mips_operand (const char *p)
@@ -409,5 +395,5 @@ index a95eff1..99fb7bb 100644
  {"swc0",		"E,A(b)",	0,    (int) M_SWC0_AB,	INSN_MACRO,		0,		I1,		0,	IOCT|IOCTP|IOCT2|I37 },
  {"swc1",		"T,o(b)",	0xe4000000, 0xfc000000,	RD_1|RD_3|SM|FP_S,	0,		I1,		0,	0 },
 -- 
-2.9.0
+2.12.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0014-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
similarity index 76%
rename from meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
rename to meta/recipes-devtools/binutils/binutils/0014-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
index f314d6420d..bb95a0cb06 100644
--- a/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
+++ b/meta/recipes-devtools/binutils/binutils/0014-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
@@ -1,7 +1,7 @@
-From 0c04c3b626998c8e7b595381b35456428581f52a Mon Sep 17 00:00:00 2001
+From a9177150f808d7e6285e1011c85d0ce89037b553 Mon Sep 17 00:00:00 2001
 From: Zhenhua Luo <zhenhua.luo@nxp.com>
 Date: Sat, 11 Jun 2016 22:08:29 -0500
-Subject: [PATCH 13/13] fix the incorrect assembling for ppc wait mnemonic
+Subject: [PATCH 14/15] fix the incorrect assembling for ppc wait mnemonic
 
 Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
 
@@ -11,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
-index 8106ab7..ca4b0f3 100644
+index 30fd789182..f2708e2276 100644
 --- a/opcodes/ppc-opc.c
 +++ b/opcodes/ppc-opc.c
-@@ -4811,7 +4811,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+@@ -4876,7 +4876,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
  {"ldepx",	X(31,29),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
  
  {"waitasec",	X(31,30),      XRTRARB_MASK, POWER8,	POWER9,		{0}},
@@ -22,7 +22,7 @@ index 8106ab7..ca4b0f3 100644
  
  {"lwepx",	X(31,31),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
  
-@@ -4865,7 +4864,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+@@ -4930,7 +4929,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
  
  {"waitrsv",	X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
  {"waitimpl",	X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, 0,		{0}},
@@ -32,5 +32,5 @@ index 8106ab7..ca4b0f3 100644
  {"dcbstep",	XRT(31,63,0),	XRT_MASK,    E500MC|PPCA2, 0,		{RA0, RB}},
  
 -- 
-2.9.0
+2.12.0
 
diff --git a/meta/recipes-devtools/binutils/binutils/0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch b/meta/recipes-devtools/binutils/binutils/0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch
deleted file mode 100644
index f3e3a11b14..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 3d3424e9a8d6ad56160b98bf6e223c0346164468 Mon Sep 17 00:00:00 2001
-From: Matthew Fortune <matthew.fortune@imgtec.com>
-Date: Thu, 29 Sep 2016 11:13:46 +0100
-Subject: [PATCH] Refine .cfi_sections check to only consider compact eh_frame
-
-The .cfi_sections directive can be safely used multiple times
-with different sections named at any time unless the compact form
-of exception handling is requested after CFI information has
-been emitted.  Only the compact form of CFI information changes
-the way in which CFI is generated and therefore cannot be
-retrospectively requested after generating CFI information.
-
-gas/
-
-	PR gas/20648
-	* dw2gencfi.c (dot_cfi_sections): Refine the check for
-	inconsistent .cfi_sections to only consider compact vs non
-	compact forms.
-	* testsuite/gas/cfi/cfi-common-9.d: New file.
-	* testsuite/gas/cfi/cfi-common-9.s: New file.
-	* testsuite/gas/cfi/cfi.exp: Run new test.
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com
-
- gas/ChangeLog                        | 10 ++++++++++
- gas/dw2gencfi.c                      |  5 ++++-
- gas/testsuite/gas/cfi/cfi-common-9.d | 23 +++++++++++++++++++++++
- gas/testsuite/gas/cfi/cfi-common-9.s |  4 ++++
- gas/testsuite/gas/cfi/cfi.exp        |  1 +
- 5 files changed, 42 insertions(+), 1 deletion(-)
- create mode 100644 gas/testsuite/gas/cfi/cfi-common-9.d
- create mode 100644 gas/testsuite/gas/cfi/cfi-common-9.s
-
-Index: git/gas/dw2gencfi.c
-===================================================================
---- git.orig/gas/dw2gencfi.c
-+++ git/gas/dw2gencfi.c
-@@ -1244,7 +1244,10 @@ dot_cfi_sections (int ignored ATTRIBUTE_
-       }
- 
-   demand_empty_rest_of_line ();
--  if (cfi_sections_set && cfi_sections != sections)
-+  if (cfi_sections_set
-+      && (sections & (CFI_EMIT_eh_frame | CFI_EMIT_eh_frame_compact))
-+      && (cfi_sections & (CFI_EMIT_eh_frame | CFI_EMIT_eh_frame_compact))
-+	 != (sections & (CFI_EMIT_eh_frame | CFI_EMIT_eh_frame_compact)))
-     as_bad (_("inconsistent uses of .cfi_sections"));
-   cfi_sections = sections;
- }
-Index: git/gas/testsuite/gas/cfi/cfi-common-9.d
-===================================================================
---- /dev/null
-+++ git/gas/testsuite/gas/cfi/cfi-common-9.d
-@@ -0,0 +1,23 @@
-+#objdump: -Wf
-+#name: CFI common 9
-+#...
-+Contents of the .eh_frame section:
-+
-+00000000 0+0010 0+0000 CIE
-+  Version:               1
-+  Augmentation:          "zR"
-+  Code alignment factor: .*
-+  Data alignment factor: .*
-+  Return address column: .*
-+  Augmentation data:     [01]b
-+
-+  DW_CFA_nop
-+  DW_CFA_nop
-+  DW_CFA_nop
-+
-+00000014 0+00(10|18|1c|20) 0+0018 FDE cie=0+0000 pc=.*
-+
-+  DW_CFA_nop
-+  DW_CFA_nop
-+  DW_CFA_nop
-+#...
-Index: git/gas/testsuite/gas/cfi/cfi-common-9.s
-===================================================================
---- /dev/null
-+++ git/gas/testsuite/gas/cfi/cfi-common-9.s
-@@ -0,0 +1,4 @@
-+	.cfi_sections .eh_frame
-+	.cfi_startproc simple
-+	.cfi_sections .debug_frame
-+	.cfi_endproc
-Index: git/gas/testsuite/gas/cfi/cfi.exp
-===================================================================
---- git.orig/gas/testsuite/gas/cfi/cfi.exp
-+++ git/gas/testsuite/gas/cfi/cfi.exp
-@@ -135,4 +135,5 @@ if { ![istarget "hppa64*-*"] } then {
-     run_dump_test "cfi-common-6"
-   }
-   run_dump_test "cfi-common-7"
-+  run_dump_test "cfi-common-9"
- }
diff --git a/meta/recipes-devtools/binutils/binutils/0015-binutils-mips-gas-pic-relax-linkonce.diff b/meta/recipes-devtools/binutils/binutils/0015-binutils-mips-gas-pic-relax-linkonce.diff
deleted file mode 100644
index 78b971a996..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0015-binutils-mips-gas-pic-relax-linkonce.diff
+++ /dev/null
@@ -1,65 +0,0 @@
-Patch taken from Binutils Bugzilla:
-
-  https://sourceware.org/bugzilla/show_bug.cgi?id=20649
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
-Index: binutils/gas/config/tc-mips.c
-===================================================================
---- binutils.orig/gas/config/tc-mips.c	2016-09-29 05:12:31.000000000 +0100
-+++ binutils/gas/config/tc-mips.c	2016-09-29 20:05:13.257411084 +0100
-@@ -1353,7 +1353,7 @@ static void s_mips_stab (int);
- static void s_mips_weakext (int);
- static void s_mips_file (int);
- static void s_mips_loc (int);
--static bfd_boolean pic_need_relax (symbolS *, asection *);
-+static bfd_boolean pic_need_relax (symbolS *);
- static int relaxed_branch_length (fragS *, asection *, int);
- static int relaxed_micromips_16bit_branch_length (fragS *, asection *, int);
- static int relaxed_micromips_32bit_branch_length (fragS *, asection *, int);
-@@ -4258,6 +4258,8 @@ mips_move_text_labels (void)
-   mips_move_labels (seg_info (now_seg)->label_list, TRUE);
- }
- 
-+/* Duplicate the test for LINK_ONCE sections as in `adjust_reloc_syms'.  */
-+
- static bfd_boolean
- s_is_linkonce (symbolS *sym, segT from_seg)
- {
-@@ -14823,7 +14825,7 @@ mips_frob_file (void)
- 	 constants; we'll report an error for those later.  */
-       if (got16_reloc_p (l->fixp->fx_r_type)
- 	  && !(l->fixp->fx_addsy
--	       && pic_need_relax (l->fixp->fx_addsy, l->seg)))
-+	       && pic_need_relax (l->fixp->fx_addsy)))
- 	continue;
- 
-       /* Check quickly whether the next fixup happens to be a matching %lo.  */
-@@ -17043,7 +17045,7 @@ nopic_need_relax (symbolS *sym, int befo
- /* Return true if the given symbol should be considered local for SVR4 PIC.  */
- 
- static bfd_boolean
--pic_need_relax (symbolS *sym, asection *segtype)
-+pic_need_relax (symbolS *sym)
- {
-   asection *symsec;
- 
-@@ -17068,7 +17070,6 @@ pic_need_relax (symbolS *sym, asection *
-   return (!bfd_is_und_section (symsec)
- 	  && !bfd_is_abs_section (symsec)
- 	  && !bfd_is_com_section (symsec)
--	  && !s_is_linkonce (sym, segtype)
- 	  /* A global or weak symbol is treated as external.  */
- 	  && (!S_IS_WEAK (sym) && !S_IS_EXTERNAL (sym)));
- }
-@@ -17507,7 +17508,7 @@ md_estimate_size_before_relax (fragS *fr
-   if (mips_pic == NO_PIC)
-     change = nopic_need_relax (fragp->fr_symbol, 0);
-   else if (mips_pic == SVR4_PIC)
--    change = pic_need_relax (fragp->fr_symbol, segtype);
-+    change = pic_need_relax (fragp->fr_symbol);
-   else if (mips_pic == VXWORKS_PIC)
-     /* For vxworks, GOT16 relocations never have a corresponding LO16.  */
-     change = 0;
diff --git a/meta/recipes-devtools/binutils/binutils/0014-libtool-remove-rpath.patch b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
similarity index 72%
rename from meta/recipes-devtools/binutils/binutils/0014-libtool-remove-rpath.patch
rename to meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
index d56948f15d..1559038e50 100644
--- a/meta/recipes-devtools/binutils/binutils/0014-libtool-remove-rpath.patch
+++ b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
@@ -1,3 +1,8 @@
+From 58cdb28ed71cb57b4a0ea1b412a708fdb0f84c27 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Mon, 6 Mar 2017 23:33:27 -0800
+Subject: [PATCH 15/15] sync with OE libtool changes
+
 Apply these patches from our libtool patches as not only are redundant RPATHs a
 waste of space but they can cause incorrect linking when native packages are
 restored from sstate.
@@ -13,13 +18,18 @@ fool its detection code into thinking it should be included as an
 RPATH in the generated binary.  Normalize before comparision.
 
 Upstream-Status: Inappropriate
+
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ltmain.sh | 34 ++++++++++++++++++++++++++++------
+ 1 file changed, 28 insertions(+), 6 deletions(-)
 
 diff --git a/ltmain.sh b/ltmain.sh
-index 683317c..860a16a 100644
+index 11ee684ccc..3b19ac1532 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
-@@ -8053,8 +8053,14 @@ EOF
+@@ -8053,8 +8053,16 @@ EOF
  		  esac
  		fi
  	      else
@@ -27,8 +37,10 @@ index 683317c..860a16a 100644
 -		func_append dep_rpath " $flag"
 +                # We only want to hardcode in an rpath if it isn't in the
 +                # default dlsearch path.
++                func_normal_abspath "$libdir"
++                libdir_norm=$func_normal_abspath_result
 +	        case " $sys_lib_dlsearch_path " in
-+	        *" $libdir "*) ;;
++	        *" $libdir_norm "*) ;;
 +	        *) eval flag=\"$hardcode_libdir_flag_spec\"
 +                   func_append dep_rpath " $flag"
 +                   ;;
@@ -36,7 +48,7 @@ index 683317c..860a16a 100644
  	      fi
  	    elif test -n "$runpath_var"; then
  	      case "$perm_rpath " in
-@@ -8790,8 +8796,14 @@ EOF
+@@ -8790,8 +8798,16 @@ EOF
  	      esac
  	    fi
  	  else
@@ -44,8 +56,10 @@ index 683317c..860a16a 100644
 -	    func_append rpath " $flag"
 +            # We only want to hardcode in an rpath if it isn't in the
 +            # default dlsearch path.
++            func_normal_abspath "$libdir"
++            libdir_norm=$func_normal_abspath_result
 +	    case " $sys_lib_dlsearch_path " in
-+	    *" $libdir "*) ;;
++	    *" $libdir_norm "*) ;;
 +	    *) eval flag=\"$hardcode_libdir_flag_spec\"
 +               rpath+=" $flag"
 +               ;;
@@ -53,7 +67,7 @@ index 683317c..860a16a 100644
  	  fi
  	elif test -n "$runpath_var"; then
  	  case "$perm_rpath " in
-@@ -8841,8 +8853,14 @@ EOF
+@@ -8841,8 +8857,14 @@ EOF
  	      esac
  	    fi
  	  else
@@ -70,31 +84,6 @@ index 683317c..860a16a 100644
  	  fi
  	elif test -n "$runpath_var"; then
  	  case "$finalize_perm_rpath " in
-diff --git a/ltmain.sh b/ltmain.sh
-index 683317c..860a16a 100644
---- a/ltmain.sh
-+++ b/ltmain.sh
-@@ -8055,8 +8055,10 @@ EOF
- 	      else
-                 # We only want to hardcode in an rpath if it isn't in the
-                 # default dlsearch path.
-+                func_normal_abspath "$libdir"
-+                libdir_norm=$func_normal_abspath_result
- 	        case " $sys_lib_dlsearch_path " in
--	        *" $libdir "*) ;;
-+	        *" $libdir_norm "*) ;;
- 	        *) eval flag=\"$hardcode_libdir_flag_spec\"
-                    func_append dep_rpath " $flag"
-                    ;;
-@@ -8798,8 +8800,10 @@ EOF
- 	  else
-             # We only want to hardcode in an rpath if it isn't in the
-             # default dlsearch path.
-+            func_normal_abspath "$libdir"
-+            libdir_norm=$func_normal_abspath_result
- 	    case " $sys_lib_dlsearch_path " in
--	    *" $libdir "*) ;;
-+	    *" $libdir_norm "*) ;;
- 	    *) eval flag=\"$hardcode_libdir_flag_spec\"
-                rpath+=" $flag"
-                ;;
+-- 
+2.12.0
+
diff --git a/meta/recipes-devtools/binutils/binutils/0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch b/meta/recipes-devtools/binutils/binutils/0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch
deleted file mode 100644
index 33bf1e8f65..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 72b09de92cc597c53b1d762882b67a17fe56846c Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Tue, 23 Aug 2016 09:45:11 +0100
-Subject: [PATCH 16/16] Fix seg-fault in ARM linker when trying to parse a
- binary file.
-
-	* elf32-arm.c (elf32_arm_count_additional_relocs): Return zero if
-	there is no arm data associated with the section.
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- bfd/elf32-arm.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bfd/elf32-arm.c b/bfd/elf32-arm.c
-index 700bec3..3fab609 100644
---- a/bfd/elf32-arm.c
-+++ b/bfd/elf32-arm.c
-@@ -18207,7 +18207,7 @@ elf32_arm_count_additional_relocs (asection *sec)
- {
-   struct _arm_elf_section_data *arm_data;
-   arm_data = get_arm_elf_section_data (sec);
--  return arm_data->additional_reloc_count;
-+  return arm_data == NULL ? 0 : arm_data->additional_reloc_count;
- }
- 
- /* Called to set the sh_flags, sh_link and sh_info fields of OSECTION which
--- 
-2.10.1
-
diff --git a/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch b/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
deleted file mode 100644
index f8b46be697..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-From 4a4286465b5d6c28968bc2b29ae08daca7f219a3 Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Fri, 18 Nov 2016 11:42:48 -0800
-Subject: [PATCH] Fix the generation of alignment frags in code sections for AArch64.
-
-PR gas/20364
-* config/tc-aarch64.c (s_ltorg): Change the mapping state after
-aligning the frag.
-(aarch64_init): Treat rs_align frags in code sections as
-containing code, not data.
-* testsuite/gas/aarch64/pr20364.s: New test.
-* testsuite/gas/aarch64/pr20364.d: New test driver.
-
-Backporting the patch from binutils mainline
-https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=7ea12e5c3ad54da440c08f32da09534e63e515ca
-
-Upstream-Status: Backport
-
-Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
----
- gas/ChangeLog                       | 10 ++++++++++
- gas/config/tc-aarch64.c             | 10 +++++++---
- gas/testsuite/gas/aarch64/pr20364.d | 13 +++++++++++++
- gas/testsuite/gas/aarch64/pr20364.s | 28 ++++++++++++++++++++++++++++
- 4 files changed, 58 insertions(+), 3 deletions(-)
- create mode 100644 gas/testsuite/gas/aarch64/pr20364.d
- create mode 100644 gas/testsuite/gas/aarch64/pr20364.s
-
-diff --git a/gas/ChangeLog b/gas/ChangeLog
-index a39895a..fad06dc 100644
---- a/gas/ChangeLog
-+++ b/gas/ChangeLog
-@@ -1,3 +1,13 @@
-+2016-08-05  Nick Clifton  <nickc@redhat.com>
-+
-+	PR gas/20364
-+	* config/tc-aarch64.c (s_ltorg): Change the mapping state after
-+	aligning the frag.
-+	(aarch64_init): Treat rs_align frags in code sections as
-+	containing code, not data.
-+	* testsuite/gas/aarch64/pr20364.s: New test.
-+	* testsuite/gas/aarch64/pr20364.d: New test driver.
-+
- 2016-08-03  Tristan Gingold  <gingold@adacore.com>
- 
- 	* configure: Regenerate.
-diff --git a/gas/config/tc-aarch64.c b/gas/config/tc-aarch64.c
-index ddc40f2..74933cb 100644
---- a/gas/config/tc-aarch64.c
-+++ b/gas/config/tc-aarch64.c
-@@ -1736,13 +1736,13 @@ s_ltorg (int ignored ATTRIBUTE_UNUSED)
-       if (pool == NULL || pool->symbol == NULL || pool->next_free_entry == 0)
- 	continue;
- 
--      mapping_state (MAP_DATA);
--
-       /* Align pool as you have word accesses.
-          Only make a frag if we have to.  */
-       if (!need_pass_2)
- 	frag_align (align, 0, 0);
- 
-+      mapping_state (MAP_DATA);
-+
-       record_alignment (now_seg, align);
- 
-       sprintf (sym_name, "$$lit_\002%x", pool->id);
-@@ -6373,11 +6373,15 @@ aarch64_init_frag (fragS * fragP, int max_chars)
- 
-   switch (fragP->fr_type)
-     {
--    case rs_align:
-     case rs_align_test:
-     case rs_fill:
-       mapping_state_2 (MAP_DATA, max_chars);
-       break;
-+    case rs_align:
-+      /* PR 20364: We can get alignment frags in code sections,
-+	 so do not just assume that we should use the MAP_DATA state.  */
-+      mapping_state_2 (subseg_text_p (now_seg) ? MAP_INSN : MAP_DATA, max_chars);
-+      break;
-     case rs_align_code:
-       mapping_state_2 (MAP_INSN, max_chars);
-       break;
-diff --git a/gas/testsuite/gas/aarch64/pr20364.d b/gas/testsuite/gas/aarch64/pr20364.d
-new file mode 100644
-index 0000000..babcff1
---- /dev/null
-+++ b/gas/testsuite/gas/aarch64/pr20364.d
-@@ -0,0 +1,13 @@
-+# Check that ".align <size>, <fill>" does not set the mapping state to DATA, causing unnecessary frag generation.
-+#name: PR20364 
-+#objdump: -d
-+
-+.*:     file format .*
-+
-+Disassembly of section \.vectors:
-+
-+0+000 <.*>:
-+   0:	d2800000 	mov	x0, #0x0                   	// #0
-+   4:	94000000 	bl	0 <plat_report_exception>
-+   8:	17fffffe 	b	0 <bl1_exceptions>
-+
-diff --git a/gas/testsuite/gas/aarch64/pr20364.s b/gas/testsuite/gas/aarch64/pr20364.s
-new file mode 100644
-index 0000000..594ad7c
---- /dev/null
-+++ b/gas/testsuite/gas/aarch64/pr20364.s
-@@ -0,0 +1,28 @@
-+ .macro vector_base label
-+ .section .vectors, "ax"
-+ .align 11, 0
-+ \label:
-+ .endm
-+
-+ .macro vector_entry label
-+ .section .vectors, "ax"
-+ .align 7, 0
-+ \label:
-+ .endm
-+
-+ .macro check_vector_size since
-+   .if (. - \since) > (32 * 4)
-+     .error "Vector exceeds 32 instructions"
-+   .endif
-+ .endm
-+
-+ .globl bl1_exceptions
-+
-+vector_base bl1_exceptions
-+
-+vector_entry SynchronousExceptionSP0
-+ mov x0, #0x0
-+ bl plat_report_exception
-+ b SynchronousExceptionSP0
-+ check_vector_size SynchronousExceptionSP0
-+
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/binutils/binutils_2.27.bb b/meta/recipes-devtools/binutils/binutils_2.28.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils_2.27.bb
rename to meta/recipes-devtools/binutils/binutils_2.28.bb
-- 
2.12.0


