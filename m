Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2606102B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 18:09:38 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id 12so392062pjb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 10:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=k90EDD1p9B0TCKB2IcX8PBpSkWEGGOYxhxRFCXZ3yB4=;
	b=WhFg2OhA81v5/n7xYQe6bK6ska5bKkPY7wN0DEkRADHc3Og4kkUGphvqp+iCxO/56D
	X7OKnAnnggqdHFO9jPdQn8eksIclflBiqmiGqN+A/ANMgo1rr54toDRVvsiS7i4K4XxP
	CCJSkdkH17flOjAPxLLv+s87s46GejLYULI1oxM/bG6Omq1q6RHBQL1p+9YB5bGOXmFf
	M1rGueEK02At+donOivAJV4YDS2SpMH0cJmFXAj+yjTeY/fklqGFyZw6zZe+AERPlQ4V
	RA+OpboW7FrV9d/cFHZdeyquBRdAYxzkeOKhX2ugvh94PBH/yFABmDLlnxNwzvHQFT3y
	GAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=k90EDD1p9B0TCKB2IcX8PBpSkWEGGOYxhxRFCXZ3yB4=;
	b=niBgnm+iXD0GEiYeI37f0l+isT/9ziJb8Lsod8L+4/WTJozoMU1tyr7q3ED6uz5aew
	07Yzqid/G38Q4uo+t9vHZs2RNu+bUq96RZxwAlN6U5eP/rWtuKK6DOm8+9AkQd5Jh3Bz
	+S5o5LNABmAvxcm2zVv4q9Hin3CF8Dd38I3+YdydAm4u4ru7vtjIVAK/I5LMOCxrPdw/
	LoLRAYFoILcDG/jwdvTovlge4+6EdiEp8YjfsBg3kP2AkYjtMt5PZE4C4/JLNoWh9DXt
	kLEST5cM6aMPkKjcdr3Md+dvQYcew3hI+9pAoSXtIcOf0lywEsVnm8GoHtV1F3zeQUmd
	Yb3A==
X-Gm-Message-State: APjAAAUQ8y6KKv/zZJ/p+WZHFI+HgIjEI45wRrYvQLHm4+sKQH4goEc5
	4Wr0TBSqjs3TopMMLIZZj3gs+qlO7/I=
X-Google-Smtp-Source: APXvYqxK/Hf9AJxjHytlEHXvaBpZ8QgZSD1vmmZJ7OnPvwNa/KHI8eVP9b8yOMc4Pw9ijwUCZkyZnQ==
X-Received: by 2002:a17:90a:ba91:: with SMTP id
	t17mr10532639pjr.74.1582135776129; 
	Wed, 19 Feb 2020 10:09:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id b3sm294046pfr.88.2020.02.19.10.09.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 10:09:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 10:09:41 -0800
Message-Id: <20200219180941.3829153-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] binutils: Upgrade to 2.34 release
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
X-List-Received-Date: Wed, 19 Feb 2020 18:09:38 -0000
Content-Transfer-Encoding: 8bit

Details of changelog [1]
[1] https://lists.gnu.org/archive/html/info-gnu/2020-02/msg00000.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |    2 +-
 .../{binutils-2.33.inc => binutils-2.34.inc}  |   38 +-
 ....33.bb => binutils-cross-canadian_2.34.bb} |    0
 ...33.bb => binutils-cross-testsuite_2.34.bb} |    0
 ...s-cross_2.33.bb => binutils-cross_2.34.bb} |    0
 ...ssdk_2.33.bb => binutils-crosssdk_2.34.bb} |    0
 ...s-crosssdk-Generate-relocatable-SDKs.patch |   16 +-
 ...o-not-generate-linker-script-directo.patch |    4 +-
 ...k-Search-for-alternative-ld.so.conf.patch} |   75 +-
 ...den-the-regexp-for-SH-architectures.patch} |    8 +-
 ...05-Point-scripts-location-to-libdir.patch} |   10 +-
 ...RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} |   30 +-
 ...l-2.4.patch => 0007-Use-libtool-2.4.patch} | 1248 +++++++++--------
 ...tro-compiler-point-to-the-wrong-ins.patch} |    6 +-
 ...system-directories-when-cross-linki.patch} |   42 +-
 ...-in-libtool-when-sysroot-is-enabled.patch} |    2 +-
 ...-default-emulation-for-mips64-linux.patch} |   23 +-
 ...> 0012-Add-support-for-Netlogic-XLP.patch} |   89 +-
 ...ct-assembling-for-ppc-wait-mnemonic.patch} |    4 +-
 ... => 0014-Detect-64-bit-MIPS-targets.patch} |    4 +-
 ...> 0015-sync-with-OE-libtool-changes.patch} |    2 +-
 ...86_64-pep-for-producing-EFI-binarie.patch} |   20 +-
 .../binutils/binutils/CVE-2019-17450.patch    |   94 --
 .../binutils/binutils/CVE-2019-17451.patch    |   46 -
 .../{binutils_2.33.bb => binutils_2.34.bb}    |    2 +-
 25 files changed, 871 insertions(+), 894 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.33.inc => binutils-2.34.inc} (54%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.33.bb => binutils-cross-canadian_2.34.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.33.bb => binutils-cross-testsuite_2.34.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.33.bb => binutils-cross_2.34.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.33.bb => binutils-crosssdk_2.34.bb} (100%)
 rename meta/recipes-devtools/binutils/binutils/{nativesdk-relocation.patch => 0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch} (56%)
 rename meta/recipes-devtools/binutils/binutils/{0003-configure-widen-the-regexp-for-SH-architectures.patch => 0004-configure-widen-the-regexp-for-SH-architectures.patch} (86%)
 rename meta/recipes-devtools/binutils/binutils/{0004-Point-scripts-location-to-libdir.patch => 0005-Point-scripts-location-to-libdir.patch} (83%)
 rename meta/recipes-devtools/binutils/binutils/{0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch => 0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} (51%)
 rename meta/recipes-devtools/binutils/binutils/{0006-Use-libtool-2.4.patch => 0007-Use-libtool-2.4.patch} (97%)
 rename meta/recipes-devtools/binutils/binutils/{0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch => 0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch} (87%)
 rename meta/recipes-devtools/binutils/binutils/{0008-warn-for-uses-of-system-directories-when-cross-linki.patch => 0009-warn-for-uses-of-system-directories-when-cross-linki.patch} (86%)
 rename meta/recipes-devtools/binutils/binutils/{0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch => 0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch} (96%)
 rename meta/recipes-devtools/binutils/binutils/{0010-Change-default-emulation-for-mips64-linux.patch => 0011-Change-default-emulation-for-mips64-linux.patch} (80%)
 rename meta/recipes-devtools/binutils/binutils/{0011-Add-support-for-Netlogic-XLP.patch => 0012-Add-support-for-Netlogic-XLP.patch} (83%)
 rename meta/recipes-devtools/binutils/binutils/{0012-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch => 0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch} (91%)
 rename meta/recipes-devtools/binutils/binutils/{0013-Detect-64-bit-MIPS-targets.patch => 0014-Detect-64-bit-MIPS-targets.patch} (91%)
 rename meta/recipes-devtools/binutils/binutils/{0014-sync-with-OE-libtool-changes.patch => 0015-sync-with-OE-libtool-changes.patch} (97%)
 rename meta/recipes-devtools/binutils/binutils/{0015-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch => 0016-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch} (80%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch
 rename meta/recipes-devtools/binutils/{binutils_2.33.bb => binutils_2.34.bb} (94%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index f7f25cae93..7e94ec5d4b 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "10.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-BINUVERSION ?= "2.33%"
+BINUVERSION ?= "2.34%"
 GDBVERSION ?= "9.%"
 GLIBCVERSION ?= "2.31"
 LINUXLIBCVERSION ?= "5.4%"
diff --git a/meta/recipes-devtools/binutils/binutils-2.33.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
similarity index 54%
rename from meta/recipes-devtools/binutils/binutils-2.33.inc
rename to meta/recipes-devtools/binutils/binutils-2.34.inc
index 84a9ec8fc3..642f3aacc6 100644
--- a/meta/recipes-devtools/binutils/binutils-2.33.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -14,35 +14,33 @@ def binutils_branch_version(d):
     pvsplit = d.getVar('PV').split('.')
     return pvsplit[0] + "_" + pvsplit[1]
 
-# When upgrading to 2.33, please make sure there is no trailing .0, so
+# When upgrading to 2.35, please make sure there is no trailing .0, so
 # that upstream version check can work correctly.
-PV = "2.33.1"
-CVE_VERSION = "2.33"
+PV = "2.34"
+CVE_VERSION = "2.34"
 BINUPV = "${@binutils_branch_version(d)}"
 #BRANCH = "binutils-${BINUPV}-branch"
-BRANCH ?= "binutils-2_33-branch"
+BRANCH ?= "binutils-2_34-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "c656f9a430636a6a7fc7a08c0e08f0098a729a02"
+SRCREV ?= "e2b46ba142d9901897d8189422f0bcc28e5660b8"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${BRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-     file://0003-configure-widen-the-regexp-for-SH-architectures.patch \
-     file://0004-Point-scripts-location-to-libdir.patch \
-     file://0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
-     file://0006-Use-libtool-2.4.patch \
-     file://0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch \
-     file://0008-warn-for-uses-of-system-directories-when-cross-linki.patch \
-     file://0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
-     file://0010-Change-default-emulation-for-mips64-linux.patch \
-     file://0011-Add-support-for-Netlogic-XLP.patch \
-     file://0012-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
-     file://0013-Detect-64-bit-MIPS-targets.patch \
-     file://0014-sync-with-OE-libtool-changes.patch \
-     file://0015-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch \
-     file://CVE-2019-17450.patch \
-     file://CVE-2019-17451.patch \
+     file://0004-configure-widen-the-regexp-for-SH-architectures.patch \
+     file://0005-Point-scripts-location-to-libdir.patch \
+     file://0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
+     file://0007-Use-libtool-2.4.patch \
+     file://0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch \
+     file://0009-warn-for-uses-of-system-directories-when-cross-linki.patch \
+     file://0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
+     file://0011-Change-default-emulation-for-mips64-linux.patch \
+     file://0012-Add-support-for-Netlogic-XLP.patch \
+     file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
+     file://0014-Detect-64-bit-MIPS-targets.patch \
+     file://0015-sync-with-OE-libtool-changes.patch \
+     file://0016-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.33.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.34.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.33.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.34.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.33.bb b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.34.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-testsuite_2.33.bb
rename to meta/recipes-devtools/binutils/binutils-cross-testsuite_2.34.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.33.bb b/meta/recipes-devtools/binutils/binutils-cross_2.34.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.33.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.34.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.33.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.34.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.33.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.34.bb
diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
index 3a9461bf4a..93096d8583 100644
--- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
+++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
@@ -1,6 +1,6 @@
-From c9aed4cb3c02715b2ba1fc70949043849f202f46 Mon Sep 17 00:00:00 2001
+From aad3066ba21dfa2ccbbe8801d27f9f126d2977e0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 8 Dec 2019 00:31:35 -0800
+Date: Mon, 2 Mar 2015 01:58:54 +0000
 Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
 
 This patch will modify the ELF linker scripts so that the crosssdk
@@ -18,23 +18,23 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index cb2b081e9e..db2e9fd569 100755
+index 03392d265c..435689ea14 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
-@@ -325,6 +325,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
+@@ -304,6 +304,7 @@ DATA_ALIGNMENT_u="${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
  LD_FLAG=r
  DATA_ALIGNMENT=${DATA_ALIGNMENT_r}
  DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
 +PARTIAL_LINKING=" "
- ( echo "/* Script for ld -r: link without relocation */"
+ ( echo "/* Script for -r */"
    source_sh ${CUSTOMIZER_SCRIPT}
    source_sh ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
-@@ -333,10 +334,12 @@ DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
+@@ -312,10 +313,12 @@ DEFAULT_DATA_ALIGNMENT="ALIGN(${SEGMENT_SIZE})"
  LD_FLAG=u
  DATA_ALIGNMENT=${DATA_ALIGNMENT_u}
  CONSTRUCTING=" "
 +PARTIAL_LINKING=" "
- ( echo "/* Script for ld -Ur: link w/out relocation, do create constructors */"
+ ( echo "/* Script for -Ur */"
    source_sh ${CUSTOMIZER_SCRIPT}
    source_sh ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
  ) | sed -e '/^ *$/d;s/[	 ]*$//' > ldscripts/${EMULATION_NAME}.xu
@@ -43,7 +43,7 @@ index cb2b081e9e..db2e9fd569 100755
  DATA_ALIGNMENT=${DATA_ALIGNMENT_}
  RELOCATING=" "
 diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
-index f9f0f7d402..9e469dca86 100644
+index 0b8b32a440..ee6b71075d 100644
 --- a/ld/scripttempl/elf.sc
 +++ b/ld/scripttempl/elf.sc
 @@ -140,8 +140,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
index 1b499a4504..8fa38834d8 100644
--- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
+++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
@@ -1,4 +1,4 @@
-From 9fe5a2dd03fdf2986c89dd58ae48c0095f1c0411 Mon Sep 17 00:00:00 2001
+From c6595ed64bbb766f8e775d8ec6e498ca708e7a20 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Mar 2017 23:37:05 -0800
 Subject: [PATCH] binutils-cross: Do not generate linker script directories
@@ -22,7 +22,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 25 deletions(-)
 
 diff --git a/ld/genscripts.sh b/ld/genscripts.sh
-index c90f38a63c..97ad1a24d6 100755
+index 435689ea14..cff8a1467f 100755
 --- a/ld/genscripts.sh
 +++ b/ld/genscripts.sh
 @@ -235,31 +235,6 @@ append_to_lib_path()
diff --git a/meta/recipes-devtools/binutils/binutils/nativesdk-relocation.patch b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
similarity index 56%
rename from meta/recipes-devtools/binutils/binutils/nativesdk-relocation.patch
rename to meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
index 408f7d18b7..1579209fc2 100644
--- a/meta/recipes-devtools/binutils/binutils/nativesdk-relocation.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
@@ -1,4 +1,10 @@
-We need binutils to look at our ld.so.conf file within the SDK to ensure 
+From 1c0c1933d600bba07a5ffa9afcec799d8a8a9aa3 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 19 Feb 2020 09:51:16 -0800
+Subject: [PATCH] binutils-nativesdk: Search for alternative ld.so.conf in SDK
+ installation
+
+We need binutils to look at our ld.so.conf file within the SDK to ensure
 we search the SDK's libdirs as well as those from the host system.
 
 We therefore pass in the directory to the code using a define, then add
@@ -6,18 +12,27 @@ it to a section we relocate in a similar way to the way we relocate the
 gcc internal paths. This ensures that ld works correctly in our buildtools
 tarball.
 
-Standard sysroot relocation doesn't work since we're not in a sysroot, 
+Standard sysroot relocation doesn't work since we're not in a sysroot,
 we want to use both the host system and SDK libs.
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 2020/1/17
 Upstream-Status: Inappropriate [OE specific tweak]
 
-Index: git/ld/Makefile.am
-===================================================================
---- git.orig/ld/Makefile.am
-+++ git/ld/Makefile.am
-@@ -36,7 +36,8 @@ am__skipyacc =
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ld/Makefile.am | 3 ++-
+ ld/Makefile.in | 3 ++-
+ ld/ldelf.c     | 2 +-
+ ld/ldmain.c    | 1 +
+ ld/ldmain.h    | 1 +
+ 5 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/ld/Makefile.am b/ld/Makefile.am
+index 4a9b8404b7..1c132d3ce4 100644
+--- a/ld/Makefile.am
++++ b/ld/Makefile.am
+@@ -42,7 +42,8 @@ ZLIBINC = @zlibinc@
  
  ELF_CLFAGS=-DELF_LIST_OPTIONS=@elf_list_options@ \
  	   -DELF_SHLIB_LIST_OPTIONS=@elf_shlib_list_options@ \
@@ -27,12 +42,12 @@ Index: git/ld/Makefile.am
  WARN_CFLAGS = @WARN_CFLAGS@
  NO_WERROR = @NO_WERROR@
  AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
-Index: git/ld/Makefile.in
-===================================================================
---- git.orig/ld/Makefile.in
-+++ git/ld/Makefile.in
-@@ -546,7 +546,8 @@ am__skiplex =
- am__skipyacc = 
+diff --git a/ld/Makefile.in b/ld/Makefile.in
+index 46d9b14077..e453bc1b33 100644
+--- a/ld/Makefile.in
++++ b/ld/Makefile.in
+@@ -555,7 +555,8 @@ ZLIB = @zlibdir@ -lz
+ ZLIBINC = @zlibinc@
  ELF_CLFAGS = -DELF_LIST_OPTIONS=@elf_list_options@ \
  	   -DELF_SHLIB_LIST_OPTIONS=@elf_shlib_list_options@ \
 -	   -DELF_PLT_UNWIND_LIST_OPTIONS=@elf_plt_unwind_list_options@
@@ -41,24 +56,24 @@ Index: git/ld/Makefile.in
  
  AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
  @ENABLE_PLUGINS_FALSE@PLUGIN_C = 
-Index: git/ld/emultempl/elf32.em
-===================================================================
---- git.orig/ld/emultempl/elf32.em
-+++ git/ld/emultempl/elf32.em
-@@ -1024,7 +1024,7 @@ gld${EMULATION_NAME}_check_ld_so_conf (c
+diff --git a/ld/ldelf.c b/ld/ldelf.c
+index 2e27cf48a8..a095d6aac5 100644
+--- a/ld/ldelf.c
++++ b/ld/ldelf.c
+@@ -907,7 +907,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_needed_list *l, int force,
  
        info.path = NULL;
        info.len = info.alloc = 0;
--      tmppath = concat (ld_sysroot, "${prefix}/etc/ld.so.conf",
-+      tmppath = concat (ld_sysconfdir, "/ld.so.conf",
+-      tmppath = concat (ld_sysroot, prefix, "/etc/ld.so.conf",
++      tmppath = concat (ld_sysconfdir, "/etc/ld.so.conf",
  			(const char *) NULL);
-       if (!gld${EMULATION_NAME}_parse_ld_so_conf (&info, tmppath))
+       if (!ldelf_parse_ld_so_conf (&info, tmppath))
  	{
-Index: git/ld/ldmain.c
-===================================================================
---- git.orig/ld/ldmain.c
-+++ git/ld/ldmain.c
-@@ -68,6 +68,7 @@ char *program_name;
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index c4af10f4e9..da1ad17763 100644
+--- a/ld/ldmain.c
++++ b/ld/ldmain.c
+@@ -69,6 +69,7 @@ char *program_name;
  
  /* The prefix for system library directories.  */
  const char *ld_sysroot;
@@ -66,10 +81,10 @@ Index: git/ld/ldmain.c
  
  /* The canonical representation of ld_sysroot.  */
  char *ld_canon_sysroot;
-Index: git/ld/ldmain.h
-===================================================================
---- git.orig/ld/ldmain.h
-+++ git/ld/ldmain.h
+diff --git a/ld/ldmain.h b/ld/ldmain.h
+index 0f05821d1e..54c36a94ce 100644
+--- a/ld/ldmain.h
++++ b/ld/ldmain.h
 @@ -23,6 +23,7 @@
  
  extern char *program_name;
diff --git a/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch b/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
similarity index 86%
rename from meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch
rename to meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
index 4a6b107126..1fb94c0d96 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-configure-widen-the-regexp-for-SH-architectures.patch
+++ b/meta/recipes-devtools/binutils/binutils/0004-configure-widen-the-regexp-for-SH-architectures.patch
@@ -1,4 +1,4 @@
-From aecded290b2ec0b469c70fc6b062bd5ee6ba5e3a Mon Sep 17 00:00:00 2001
+From 06055c548063b61ac5124911936d59f4ac08cbf4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:07:33 +0000
 Subject: [PATCH] configure: widen the regexp for SH architectures
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 6a9719f609..001523eebf 100755
+index 91dc42f6c7..7c1b747e7c 100755
 --- a/configure
 +++ b/configure
-@@ -3865,7 +3865,7 @@ case "${target}" in
+@@ -3915,7 +3915,7 @@ case "${target}" in
    nvptx*-*-*)
      noconfigdirs="$noconfigdirs target-libssp target-libstdc++-v3 target-libobjc"
      ;;
@@ -27,7 +27,7 @@ index 6a9719f609..001523eebf 100755
        sh*-*-elf)
           ;;
 diff --git a/gprof/configure b/gprof/configure
-index cbb3aced46..b5eabceb77 100755
+index c23692e5c3..eb04fdcc89 100755
 --- a/gprof/configure
 +++ b/gprof/configure
 @@ -6162,6 +6162,11 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-location-to-libdir.patch
similarity index 83%
rename from meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
rename to meta/recipes-devtools/binutils/binutils/0005-Point-scripts-location-to-libdir.patch
index 8318bd3899..29abf9ff20 100644
--- a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
+++ b/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-location-to-libdir.patch
@@ -1,4 +1,4 @@
-From a9332107872ada73e72e92872ea2998a4e1495e0 Mon Sep 17 00:00:00 2001
+From 0aea6c1021b1fd33163416203b360611a489b4fe Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:09:58 +0000
 Subject: [PATCH] Point scripts location to libdir
@@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ld/Makefile.am b/ld/Makefile.am
-index ddc7a78368..6fa7bf2583 100644
+index 1c132d3ce4..8d82cf2e16 100644
 --- a/ld/Makefile.am
 +++ b/ld/Makefile.am
-@@ -63,7 +63,7 @@ endif
+@@ -64,7 +64,7 @@ endif
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.
@@ -25,10 +25,10 @@ index ddc7a78368..6fa7bf2583 100644
  EMUL = @EMUL@
  EMULATION_OFILES = @EMULATION_OFILES@
 diff --git a/ld/Makefile.in b/ld/Makefile.in
-index fdf06128b2..5c108b9e05 100644
+index e453bc1b33..2dcd72f809 100644
 --- a/ld/Makefile.in
 +++ b/ld/Makefile.in
-@@ -572,7 +572,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
+@@ -573,7 +573,7 @@ AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CLFAGS)
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.
diff --git a/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
similarity index 51%
rename from meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
rename to meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
index 214ae06344..3672644c76 100644
--- a/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
@@ -1,4 +1,4 @@
-From 65fb7a33aba30dec8690e0a237efaa3b9649154c Mon Sep 17 00:00:00 2001
+From c576d7d02314a8702aaea23a8275f8252e03427f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:27:17 +0000
 Subject: [PATCH] Only generate an RPATH entry if LD_RUN_PATH is not empty
@@ -10,21 +10,23 @@ Upstream-Status: Pending
 Signed-off-by: Chris Chimelis <chris@debian.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- ld/emultempl/elf32.em | 4 ++++
+ ld/ldelf.c | 4 ++++
  1 file changed, 4 insertions(+)
 
---- a/ld/emultempl/elf32.em
-+++ b/ld/emultempl/elf32.em
-@@ -1470,6 +1470,8 @@ fragment <<EOF
- 	      && command_line.rpath == NULL)
- 	    {
- 	      path = (const char *) getenv ("LD_RUN_PATH");
-+	      if ((path) && (strlen (path) == 0))
-+		path = NULL;
- 	      if (path
- 		  && gld${EMULATION_NAME}_search_needed (path, &n, force))
- 		break;
-@@ -1745,6 +1747,8 @@ gld${EMULATION_NAME}_before_allocation (
+diff --git a/ld/ldelf.c b/ld/ldelf.c
+index a095d6aac5..a2455a8793 100644
+--- a/ld/ldelf.c
++++ b/ld/ldelf.c
+@@ -1229,6 +1229,8 @@ ldelf_after_open (int use_libpath, int native, int is_linux, int is_freebsd,
+ 		  && command_line.rpath == NULL)
+ 		{
+ 		  path = (const char *) getenv ("LD_RUN_PATH");
++		  if ((path) && (strlen (path) == 0))
++		      path = NULL;
+ 		  if (path
+ 		      && ldelf_search_needed (path, &n, force,
+ 					      is_linux, elfsize))
+@@ -1573,6 +1575,8 @@ ldelf_before_allocation (char *audit, char *depaudit,
    rpath = command_line.rpath;
    if (rpath == NULL)
      rpath = (const char *) getenv ("LD_RUN_PATH");
diff --git a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch
similarity index 97%
rename from meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
rename to meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch
index 135eb8877c..666064e700 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch
@@ -1,4 +1,4 @@
-From 9cebc65f222dfd4e0b3072b53f46ffcf328e9fe4 Mon Sep 17 00:00:00 2001
+From f0eeda2eb6af107e2cac7549920e59d5fc44d54b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:04:07 +0000
 Subject: [PATCH] Use libtool 2.4
@@ -25,6 +25,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  zlib/configure       | 1320 ++++++++++++++-----
  14 files changed, 9940 insertions(+), 3705 deletions(-)
 
+diff --git a/bfd/configure b/bfd/configure
+index 7c0708e2f8..1e9e7b2711 100755
 --- a/bfd/configure
 +++ b/bfd/configure
 @@ -704,6 +704,9 @@ OTOOL
@@ -74,7 +76,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6420,8 +6426,8 @@ $as_echo_n "checking whether the shell u
+@@ -6420,8 +6426,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -210,7 +212,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6823,9 +6924,162 @@ test -z "$deplibs_check_method" && depli
+@@ -6821,11 +6922,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -224,6 +226,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +
 +
 +
+ 
+ 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -445,7 +449,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +
 +
 +
- 
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
 +if ${lt_cv_ar_at_file+:} false; then :
@@ -454,7 +458,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +  lt_cv_ar_at_file=no
 +   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
 +/* end confdefs.h.  */
- 
++
 +int
 +main ()
 +{
@@ -487,11 +491,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
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
@@ -547,7 +551,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    const char *name;
    void       *address;
  }
-@@ -7377,8 +7708,8 @@ static const void *lt_preloaded_setup()
+@@ -7377,8 +7708,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -569,7 +573,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7426,6 +7757,20 @@ else
+@@ -7426,6 +7757,16 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -583,17 +587,20 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -626,12 +633,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -793,7 +797,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8934,6 +9432,12 @@ $as_echo_n "checking for $compiler optio
+@@ -8934,6 +9432,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -806,7 +810,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8996,7 +9500,7 @@ $as_echo_n "checking for $compiler optio
+@@ -8996,7 +9500,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -967,7 +971,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9825,7 +10352,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9825,7 +10352,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -1025,7 +1029,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9898,20 +10438,63 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9898,20 +10438,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -1103,7 +1107,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        ;;
  
      darwin* | rhapsody*)
-@@ -9972,7 +10555,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9972,7 +10555,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -1112,7 +1116,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9980,7 +10563,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9980,7 +10563,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -1121,7 +1125,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9996,7 +10579,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9996,7 +10579,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -1130,7 +1134,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10020,10 +10603,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -10020,10 +10603,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -1188,7 +1192,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10203,7 +10799,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -10203,7 +10799,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -1197,7 +1201,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10222,9 +10818,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -10222,9 +10818,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -1347,7 +1351,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14554,7 +15209,7 @@ SHARED_LDFLAGS=
+@@ -14564,7 +15219,7 @@ SHARED_LDFLAGS=
  if test "$enable_shared" = "yes"; then
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -1356,7 +1360,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    fi
  
    case "${host}" in
-@@ -17177,13 +17832,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -17186,13 +17841,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -1377,7 +1381,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17198,14 +17860,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -17207,14 +17869,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -1396,7 +1400,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -17238,12 +17903,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -17247,12 +17912,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -1410,7 +1414,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -17298,8 +17963,13 @@ reload_flag \
+@@ -17307,8 +17972,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -1424,7 +1428,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  STRIP \
  RANLIB \
  CC \
-@@ -17309,12 +17979,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -17318,12 +17988,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -1440,7 +1444,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -17330,7 +18002,6 @@ no_undefined_flag \
+@@ -17339,7 +18011,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -1448,7 +1452,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -17366,6 +18037,7 @@ module_cmds \
+@@ -17375,6 +18046,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -1456,7 +1460,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18154,7 +18826,8 @@ $as_echo X"$file" |
+@@ -18163,7 +18835,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -1466,7 +1470,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -18257,19 +18930,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -18266,19 +18939,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -1510,7 +1514,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -18299,6 +18995,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -18308,6 +19004,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -1523,7 +1527,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -18308,6 +19010,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -18317,6 +19019,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -1533,7 +1537,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -18422,12 +19127,12 @@ with_gcc=$GCC
+@@ -18431,12 +19136,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -1549,7 +1553,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -18514,9 +19219,6 @@ inherit_rpath=$inherit_rpath
+@@ -18523,9 +19228,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -1559,7 +1563,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -18532,6 +19234,9 @@ include_expsyms=$lt_include_expsyms
+@@ -18541,6 +19243,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -1569,7 +1573,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -18564,210 +19269,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -18573,210 +19278,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -1771,9 +1775,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -1931,18 +1941,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
  
+diff --git a/bfd/configure.ac b/bfd/configure.ac
+index af4d4b8c13..a521738244 100644
 --- a/bfd/configure.ac
 +++ b/bfd/configure.ac
-@@ -290,7 +290,7 @@ changequote(,)dnl
+@@ -296,7 +296,7 @@ changequote(,)dnl
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
  changequote([,])dnl
    if test -n "$x"; then
@@ -1951,9 +1960,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    fi
  
    case "${host}" in
+diff --git a/binutils/configure b/binutils/configure
+index a8dfd4bd68..ab5f13ab2e 100755
 --- a/binutils/configure
 +++ b/binutils/configure
-@@ -689,8 +689,11 @@ OTOOL
+@@ -690,8 +690,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -1965,7 +1976,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  OBJDUMP
  LN_S
  NM
-@@ -807,6 +810,7 @@ enable_static
+@@ -808,6 +811,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -1973,16 +1984,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1483,6 +1487,8 @@ Optional Packages:
-   --with-pic              try to use only PIC/non-PIC objects [default=use
-                           both]
+@@ -1487,6 +1491,8 @@ Optional Packages:
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
+   --with-debuginfod       Enable debuginfo lookups with debuginfod
+                           (auto/yes/no)
 +  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
 +                        (or the compiler's sysroot if not specified).
    --with-system-zlib      use installed libz
    --with-gnu-ld           assume the C compiler uses GNU ld default=no
    --with-libiconv-prefix[=DIR]  search for libiconv in DIR/include and DIR/lib
-@@ -5457,8 +5463,8 @@ esac
+@@ -5461,8 +5467,8 @@ esac
  
  
  
@@ -1993,7 +2004,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  
-@@ -5498,7 +5504,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5502,7 +5508,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -2002,7 +2013,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6184,8 +6190,8 @@ $as_echo_n "checking whether the shell u
+@@ -6188,8 +6194,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -2013,7 +2024,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6234,6 +6240,80 @@ esac
+@@ -6238,6 +6244,80 @@ esac
  
  
  
@@ -2094,7 +2105,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6250,6 +6330,11 @@ case $reload_flag in
+@@ -6254,6 +6334,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -2106,7 +2117,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6418,7 +6503,8 @@ mingw* | pw32*)
+@@ -6422,7 +6507,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -2116,7 +2127,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6572,6 +6658,21 @@ esac
+@@ -6576,6 +6662,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -2138,7 +2149,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6587,9 +6688,162 @@ test -z "$deplibs_check_method" && depli
+@@ -6591,9 +6692,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -2303,7 +2314,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6605,7 +6859,7 @@ do
+@@ -6609,7 +6863,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -2312,7 +2323,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6625,11 +6879,15 @@ $as_echo "no" >&6; }
+@@ -6629,11 +6883,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -2331,7 +2342,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6645,7 +6903,7 @@ do
+@@ -6649,7 +6907,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -2340,7 +2351,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6664,6 +6922,10 @@ else
+@@ -6668,6 +6926,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -2351,7 +2362,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6675,12 +6937,10 @@ ac_tool_warned=yes ;;
+@@ -6679,12 +6941,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -2366,7 +2377,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  
-@@ -6692,6 +6952,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6696,6 +6956,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -2431,7 +2442,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -7026,8 +7344,8 @@ esac
+@@ -7030,8 +7348,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -2442,7 +2453,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7063,6 +7381,7 @@ for ac_symprfx in "" "_"; do
+@@ -7067,6 +7385,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -2450,7 +2461,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7104,6 +7423,18 @@ _LT_EOF
+@@ -7108,6 +7427,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -2469,7 +2480,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7115,7 +7446,7 @@ _LT_EOF
+@@ -7119,7 +7450,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -2478,7 +2489,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    const char *name;
    void       *address;
  }
-@@ -7141,8 +7472,8 @@ static const void *lt_preloaded_setup()
+@@ -7145,8 +7476,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -2489,7 +2500,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7152,8 +7483,8 @@ _LT_EOF
+@@ -7156,8 +7487,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -2500,7 +2511,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7190,6 +7521,18 @@ else
+@@ -7194,6 +7525,21 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -2516,13 +2527,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +
 +
 +
++
++
++
  
  
  
-@@ -7211,6 +7554,43 @@ fi
+@@ -7210,6 +7556,40 @@ fi
  
  
  
++
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -2555,15 +2571,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
-@@ -7417,6 +7797,123 @@ esac
+ 
+ 
+ 
+@@ -7421,6 +7801,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -2687,7 +2698,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7980,6 +8477,8 @@ _LT_EOF
+@@ -7984,6 +8481,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -2696,7 +2707,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8175,7 +8674,8 @@ fi
+@@ -8179,7 +8678,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -2706,7 +2717,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  
-@@ -8264,7 +8764,7 @@ aix3*)
+@@ -8268,7 +8768,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -2715,7 +2726,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8562,8 +9062,6 @@ fi
+@@ -8566,8 +9066,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -2724,7 +2735,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8729,6 +9227,12 @@ $as_echo_n "checking for $compiler optio
+@@ -8733,6 +9231,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -2737,7 +2748,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8791,7 +9295,7 @@ $as_echo_n "checking for $compiler optio
+@@ -8795,7 +9299,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -2746,7 +2757,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8848,13 +9352,17 @@ case $host_os in
+@@ -8852,13 +9356,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -2770,7 +2781,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8915,6 +9423,11 @@ fi
+@@ -8919,6 +9427,11 @@ fi
  
  
  
@@ -2782,7 +2793,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9265,7 +9778,8 @@ _LT_EOF
+@@ -9269,7 +9782,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -2792,7 +2803,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9364,12 +9878,12 @@ _LT_EOF
+@@ -9368,12 +9882,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -2807,7 +2818,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	  fi
  	  ;;
  	esac
-@@ -9383,8 +9897,8 @@ _LT_EOF
+@@ -9387,8 +9901,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -2818,7 +2829,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        fi
        ;;
  
-@@ -9402,8 +9916,8 @@ _LT_EOF
+@@ -9406,8 +9920,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -2829,7 +2840,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	ld_shlibs=no
        fi
-@@ -9449,8 +9963,8 @@ _LT_EOF
+@@ -9453,8 +9967,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -2840,7 +2851,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	ld_shlibs=no
        fi
-@@ -9580,7 +10094,13 @@ _LT_EOF
+@@ -9584,7 +10098,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -2855,7 +2866,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  /* end confdefs.h.  */
  
  int
-@@ -9593,22 +10113,29 @@ main ()
+@@ -9597,22 +10117,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -2898,7 +2909,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9620,7 +10147,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9624,7 +10151,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -2913,7 +2924,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  /* end confdefs.h.  */
  
  int
-@@ -9633,22 +10166,29 @@ main ()
+@@ -9637,22 +10170,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -2956,7 +2967,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9693,20 +10233,63 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9697,20 +10237,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -3034,7 +3045,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        ;;
  
      darwin* | rhapsody*)
-@@ -9767,7 +10350,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9771,7 +10354,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -3043,7 +3054,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9775,7 +10358,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9779,7 +10362,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -3052,7 +3063,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9791,7 +10374,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9795,7 +10378,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -3061,7 +3072,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9815,10 +10398,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9819,10 +10402,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -3074,7 +3085,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	  ;;
  	esac
        else
-@@ -9897,23 +10480,36 @@ fi
+@@ -9901,23 +10484,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -3119,7 +3130,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9998,7 +10594,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -10002,7 +10598,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -3128,7 +3139,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10017,9 +10613,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -10021,9 +10617,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -3140,7 +3151,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10595,8 +11191,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10599,8 +11195,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -3152,7 +3163,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10629,13 +11226,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10633,13 +11230,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -3225,7 +3236,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10727,7 +11382,7 @@ haiku*)
+@@ -10731,7 +11386,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -3234,16 +3245,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    hardcode_into_libs=yes
    ;;
  
-@@ -11523,7 +12178,7 @@ else
+@@ -11527,7 +12182,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11526 "configure"
+-#line 11530 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11567,10 +12222,10 @@ else
+@@ -11571,10 +12226,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -3256,16 +3267,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11629,7 +12284,7 @@ else
+@@ -11633,7 +12288,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11632 "configure"
+-#line 11636 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11673,10 +12328,10 @@ else
+@@ -11677,10 +12332,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -3278,7 +3289,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15936,13 +16591,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -16024,13 +16679,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -3299,7 +3310,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15957,14 +16619,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -16045,14 +16707,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -3318,7 +3329,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15997,12 +16662,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -16085,12 +16750,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -3332,7 +3343,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -16057,8 +16722,13 @@ reload_flag \
+@@ -16145,8 +16810,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -3346,7 +3357,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  STRIP \
  RANLIB \
  CC \
-@@ -16068,12 +16738,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -16156,12 +16826,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -3362,7 +3373,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -16089,7 +16761,6 @@ no_undefined_flag \
+@@ -16177,7 +16849,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -3370,7 +3381,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -16125,6 +16796,7 @@ module_cmds \
+@@ -16213,6 +16884,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -3378,7 +3389,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16891,7 +17563,8 @@ $as_echo X"$file" |
+@@ -16979,7 +17651,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -3388,7 +3399,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16994,19 +17667,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -17082,19 +17755,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -3432,7 +3443,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -17036,6 +17732,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -17124,6 +17820,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -3445,7 +3456,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -17045,6 +17747,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -17133,6 +17835,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -3455,7 +3466,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -17159,12 +17864,12 @@ with_gcc=$GCC
+@@ -17247,12 +17952,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -3471,7 +3482,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -17251,9 +17956,6 @@ inherit_rpath=$inherit_rpath
+@@ -17339,9 +18044,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -3481,7 +3492,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -17269,6 +17971,9 @@ include_expsyms=$lt_include_expsyms
+@@ -17357,6 +18059,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -3491,7 +3502,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -17301,210 +18006,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -17389,210 +18094,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -3693,9 +3704,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -3853,15 +3870,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
  
+diff --git a/gas/configure b/gas/configure
+index 60c1a055ae..0e0ce4c0e2 100755
 --- a/gas/configure
 +++ b/gas/configure
 @@ -681,8 +681,11 @@ OTOOL
@@ -3913,7 +3929,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6004,8 +6010,8 @@ $as_echo_n "checking whether the shell u
+@@ -6004,8 +6010,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -4049,7 +4065,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6407,9 +6508,162 @@ test -z "$deplibs_check_method" && depli
+@@ -6407,9 +6508,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -4063,9 +4079,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -4206,7 +4220,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -4389,7 +4405,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    const char *name;
    void       *address;
  }
-@@ -6961,8 +7292,8 @@ static const void *lt_preloaded_setup()
+@@ -6961,8 +7292,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -4411,7 +4427,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7010,6 +7341,19 @@ else
+@@ -7010,6 +7341,21 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -4428,13 +4444,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +
 +
 +
++
++
  
  
  
-@@ -7030,6 +7374,42 @@ fi
+@@ -7026,6 +7372,40 @@ fi
  
  
  
++
++
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -4467,13 +4487,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
 @@ -7237,6 +7617,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -4635,7 +4651,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8549,6 +9047,12 @@ $as_echo_n "checking for $compiler optio
+@@ -8549,6 +9047,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -4648,7 +4664,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8611,7 +9115,7 @@ $as_echo_n "checking for $compiler optio
+@@ -8611,7 +9115,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -4809,7 +4825,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9440,7 +9967,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9440,7 +9967,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -4867,7 +4883,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9513,20 +10053,63 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9513,20 +10053,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -4945,7 +4961,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        ;;
  
      darwin* | rhapsody*)
-@@ -9587,7 +10170,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9587,7 +10170,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -4954,7 +4970,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9595,7 +10178,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9595,7 +10178,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -4963,7 +4979,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9611,7 +10194,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9611,7 +10194,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -4972,7 +4988,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9635,10 +10218,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9635,10 +10218,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -5030,7 +5046,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9818,7 +10414,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9818,7 +10414,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -5039,7 +5055,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9837,9 +10433,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9837,9 +10433,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -5189,7 +5205,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15928,13 +16583,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -15928,13 +16583,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -5210,7 +5226,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15949,14 +16611,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -15949,14 +16611,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -5229,7 +5245,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15989,12 +16654,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -15989,12 +16654,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -5343,7 +5359,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -17035,6 +17731,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -17035,6 +17731,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -5604,9 +5620,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -5764,15 +5786,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
  
+diff --git a/gprof/configure b/gprof/configure
+index eb04fdcc89..2b70d84298 100755
 --- a/gprof/configure
 +++ b/gprof/configure
 @@ -662,8 +662,11 @@ OTOOL
@@ -5824,7 +5845,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5851,8 +5857,8 @@ $as_echo_n "checking whether the shell u
+@@ -5851,8 +5857,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -5972,7 +5993,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6259,9 +6355,162 @@ test -z "$deplibs_check_method" && depli
+@@ -6257,11 +6353,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -5986,6 +6007,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +
 +
 +
+ 
+ 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -6178,7 +6201,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6347,12 +6604,10 @@ ac_tool_warned=yes ;;
+@@ -6347,16 +6604,72 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -6190,13 +6213,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -test -z "$AR_FLAGS" && AR_FLAGS=cru
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
- 
- 
- 
-@@ -6364,6 +6619,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
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
 +if test "${lt_cv_ar_at_file+set}" = set; then :
@@ -6209,7 +6236,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +int
 +main ()
 +{
-+
+ 
 +  ;
 +  return 0;
 +}
@@ -6235,29 +6262,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
 @@ -6698,8 +7011,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
@@ -6305,7 +6325,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    const char *name;
    void       *address;
  }
-@@ -6813,8 +7139,8 @@ static const void *lt_preloaded_setup()
+@@ -6813,8 +7139,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -6327,7 +6347,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6862,6 +7188,17 @@ else
+@@ -6862,6 +7188,18 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -6342,13 +6362,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -6382,14 +6407,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -6551,7 +6571,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8401,6 +8894,12 @@ $as_echo_n "checking for $compiler optio
+@@ -8401,6 +8894,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -6564,7 +6584,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8463,7 +8962,7 @@ $as_echo_n "checking for $compiler optio
+@@ -8463,7 +8962,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -6725,7 +6745,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9292,7 +9814,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9292,7 +9814,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -6783,7 +6803,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9365,20 +9900,63 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9365,20 +9900,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -6861,7 +6881,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        ;;
  
      darwin* | rhapsody*)
-@@ -9439,7 +10017,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9439,7 +10017,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -6870,7 +6890,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9447,7 +10025,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9447,7 +10025,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -6879,7 +6899,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9463,7 +10041,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9463,7 +10041,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -6888,7 +6908,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9487,10 +10065,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9487,10 +10065,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -6946,7 +6966,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9670,7 +10261,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9670,7 +10261,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -6955,7 +6975,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9689,9 +10280,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9689,9 +10280,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -7087,7 +7107,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -13314,13 +13964,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -13314,13 +13964,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -7108,7 +7128,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13335,14 +13992,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -13335,14 +13992,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -7127,7 +7147,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13375,12 +14035,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -13375,12 +14035,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -7241,7 +7261,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14413,6 +15104,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -14413,6 +15104,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -7502,9 +7522,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -7662,18 +7688,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
  
+diff --git a/ld/configure b/ld/configure
+index 811134a503..f432f4637d 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -688,8 +688,11 @@ OTOOL
+@@ -691,8 +691,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -7685,7 +7710,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  OBJDUMP
  LN_S
  NM
-@@ -816,6 +819,7 @@ enable_static
+@@ -819,6 +822,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -7693,7 +7718,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1508,6 +1512,8 @@ Optional Packages:
+@@ -1512,6 +1516,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -7701,8 +7726,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +                        (or the compiler's sysroot if not specified).
    --with-lib-path=dir1:dir2...  set default LIB_PATH
    --with-sysroot=DIR Search for usr/lib et al within DIR.
- 
-@@ -5960,8 +5966,8 @@ esac
+   --with-system-zlib      use installed libz
+@@ -5965,8 +5971,8 @@ esac
  
  
  
@@ -7713,7 +7738,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  
-@@ -6001,7 +6007,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -6006,7 +6012,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -7722,7 +7747,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6687,8 +6693,8 @@ $as_echo_n "checking whether the shell u
+@@ -6692,8 +6698,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -7733,7 +7758,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6737,6 +6743,80 @@ esac
+@@ -6742,6 +6748,80 @@ esac
  
  
  
@@ -7814,7 +7839,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6753,6 +6833,11 @@ case $reload_flag in
+@@ -6758,6 +6838,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -7826,7 +7851,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6921,7 +7006,8 @@ mingw* | pw32*)
+@@ -6926,7 +7011,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -7836,7 +7861,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -7075,6 +7161,21 @@ esac
+@@ -7080,6 +7166,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -7858,7 +7883,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -7090,9 +7191,162 @@ test -z "$deplibs_check_method" && depli
+@@ -7095,9 +7196,162 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -8023,7 +8048,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -7108,7 +7362,7 @@ do
+@@ -7113,7 +7367,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -8032,7 +8057,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -7128,11 +7382,15 @@ $as_echo "no" >&6; }
+@@ -7133,11 +7387,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -8051,7 +8076,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -7148,7 +7406,7 @@ do
+@@ -7153,7 +7411,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -8060,7 +8085,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -7167,6 +7425,10 @@ else
+@@ -7172,6 +7430,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -8071,7 +8096,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -7178,12 +7440,11 @@ ac_tool_warned=yes ;;
+@@ -7183,12 +7445,12 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -8084,10 +8109,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
 +
++
  
  
  
-@@ -7194,6 +7455,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -7198,6 +7460,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -8147,11 +8173,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +
 +
 +
-+
+ 
  
  if test -n "$ac_tool_prefix"; then
-   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
-@@ -7529,8 +7847,8 @@ esac
+@@ -7534,8 +7852,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -8162,7 +8187,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7566,6 +7884,7 @@ for ac_symprfx in "" "_"; do
+@@ -7571,6 +7889,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -8170,7 +8195,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7607,6 +7926,18 @@ _LT_EOF
+@@ -7612,6 +7931,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -8189,7 +8214,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7618,7 +7949,7 @@ _LT_EOF
+@@ -7623,7 +7954,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -8198,7 +8223,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    const char *name;
    void       *address;
  }
-@@ -7644,8 +7975,8 @@ static const void *lt_preloaded_setup()
+@@ -7649,8 +7980,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -8209,7 +8234,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7655,8 +7986,8 @@ _LT_EOF
+@@ -7660,8 +7991,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -8220,7 +8245,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7693,6 +8024,13 @@ else
+@@ -7698,6 +8029,19 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -8231,10 +8256,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +  nm_file_list_spec='@'
 +fi
 +
++
++
++
++
++
++
  
  
  
-@@ -7714,6 +8052,48 @@ fi
+@@ -7714,6 +8058,42 @@ fi
  
  
  
@@ -8242,7 +8273,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +
 +
 +
-+
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
 +$as_echo_n "checking for sysroot... " >&6; }
 +
@@ -8275,15 +8305,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
-@@ -7920,6 +8300,123 @@ esac
+ 
+ 
+ 
+@@ -7925,6 +8305,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -8407,7 +8432,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -8483,6 +8980,8 @@ _LT_EOF
+@@ -8488,6 +8985,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -8416,7 +8441,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8551,6 +9050,16 @@ done
+@@ -8556,6 +9055,16 @@ done
  
  
  
@@ -8433,7 +8458,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  # Set options
-@@ -8679,7 +9188,8 @@ fi
+@@ -8684,7 +9193,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -8443,7 +8468,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  
-@@ -8768,7 +9278,7 @@ aix3*)
+@@ -8773,7 +9283,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -8452,7 +8477,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -9066,8 +9576,6 @@ fi
+@@ -9071,8 +9581,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -8461,7 +8486,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -9233,6 +9741,12 @@ $as_echo_n "checking for $compiler optio
+@@ -9238,6 +9746,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -8474,7 +8499,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -9295,7 +9809,7 @@ $as_echo_n "checking for $compiler optio
+@@ -9300,7 +9814,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -8483,7 +8508,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -9352,13 +9866,17 @@ case $host_os in
+@@ -9357,13 +9871,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -8507,7 +8532,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9419,6 +9937,11 @@ fi
+@@ -9424,6 +9942,11 @@ fi
  
  
  
@@ -8519,7 +8544,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9769,7 +10292,8 @@ _LT_EOF
+@@ -9774,7 +10297,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -8529,7 +8554,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9868,12 +10392,12 @@ _LT_EOF
+@@ -9873,12 +10397,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -8544,7 +8569,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	  fi
  	  ;;
  	esac
-@@ -9887,8 +10411,8 @@ _LT_EOF
+@@ -9892,8 +10416,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -8555,7 +8580,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        fi
        ;;
  
-@@ -9906,8 +10430,8 @@ _LT_EOF
+@@ -9911,8 +10435,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8566,7 +8591,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	ld_shlibs=no
        fi
-@@ -9953,8 +10477,8 @@ _LT_EOF
+@@ -9958,8 +10482,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -8577,7 +8602,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	ld_shlibs=no
        fi
-@@ -10084,7 +10608,13 @@ _LT_EOF
+@@ -10089,7 +10613,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -8592,7 +8617,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  /* end confdefs.h.  */
  
  int
-@@ -10097,22 +10627,29 @@ main ()
+@@ -10102,22 +10632,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8635,7 +8660,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -10124,7 +10661,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -10129,7 +10666,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -8650,7 +8675,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  /* end confdefs.h.  */
  
  int
-@@ -10137,22 +10680,29 @@ main ()
+@@ -10142,22 +10685,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -8693,10 +8718,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -10197,20 +10747,63 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -10201,21 +10751,64 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+       # When not using gcc, we currently assume that we are using
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
-       # no search path for DLLs.
+-      # no search path for DLLs.
 -      hardcode_libdir_flag_spec=' '
 -      allow_undefined_flag=unsupported
 -      # Tell ltmain to make .lib files, not .a files.
@@ -8711,6 +8737,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -      old_archive_cmds='lib -OUT:$oldlib$oldobjs$old_deplibs'
 -      fix_srcfile_path='`cygpath -w "$srcfile"`'
 -      enable_shared_with_static_runtimes=yes
++      # no search path for DLLs.
 +      case $cc_basename in
 +      cl*)
 +	# Native MSVC
@@ -8771,7 +8798,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        ;;
  
      darwin* | rhapsody*)
-@@ -10271,7 +10864,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -10276,7 +10869,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -8780,7 +8807,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -10279,7 +10872,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -10284,7 +10877,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -8789,7 +8816,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -10295,7 +10888,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -10300,7 +10893,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -8798,7 +8825,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -10319,10 +10912,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -10324,10 +10917,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -8811,7 +8838,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	  ;;
  	esac
        else
-@@ -10401,23 +10994,36 @@ fi
+@@ -10406,23 +10999,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -8856,7 +8883,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10502,7 +11108,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -10507,7 +11113,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -8865,7 +8892,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10521,9 +11127,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -10526,9 +11132,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -8877,7 +8904,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -11099,8 +11705,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -11104,8 +11710,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -8889,7 +8916,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -11133,13 +11740,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -11138,13 +11745,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -8962,7 +8989,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -11231,7 +11896,7 @@ haiku*)
+@@ -11236,7 +11901,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -8971,16 +8998,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    hardcode_into_libs=yes
    ;;
  
-@@ -12027,7 +12692,7 @@ else
+@@ -12032,7 +12697,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 12030 "configure"
+-#line 12035 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -12071,10 +12736,10 @@ else
+@@ -12076,10 +12741,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -8993,16 +9020,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12133,7 +12798,7 @@ else
+@@ -12138,7 +12803,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 12136 "configure"
+-#line 12141 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -12177,10 +12842,10 @@ else
+@@ -12182,10 +12847,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -9015,7 +9042,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12572,6 +13237,7 @@ $RM -r conftest*
+@@ -12577,6 +13242,7 @@ $RM -r conftest*
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -9023,7 +9050,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -12589,6 +13255,7 @@ $RM -r conftest*
+@@ -12594,6 +13260,7 @@ $RM -r conftest*
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -9031,7 +9058,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -12871,7 +13538,13 @@ $as_echo_n "checking whether the $compil
+@@ -12876,7 +13543,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -9046,7 +9073,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  /* end confdefs.h.  */
  
  int
-@@ -12884,22 +13557,29 @@ main ()
+@@ -12889,22 +13562,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9089,7 +9116,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -12912,7 +13592,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -12917,7 +13597,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -9104,7 +9131,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  /* end confdefs.h.  */
  
  int
-@@ -12925,22 +13611,29 @@ main ()
+@@ -12930,22 +13616,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -9147,7 +9174,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -12983,29 +13676,75 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -12988,29 +13681,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -9246,7 +9273,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        darwin* | rhapsody*)
  
  
-@@ -13111,7 +13850,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -13116,7 +13855,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
              ;;
            *)
              if test "$GXX" = yes; then
@@ -9255,7 +9282,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -13182,10 +13921,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -13187,10 +13926,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -9268,7 +9295,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	            ;;
  	        esac
  	      fi
-@@ -13226,9 +13965,9 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -13231,9 +13970,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -9280,7 +9307,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -13298,20 +14037,20 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -13303,20 +14042,20 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	      prelink_cmds_CXX='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -9305,7 +9332,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      archive_cmds_CXX='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -13506,7 +14245,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -13511,7 +14250,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -9314,7 +9341,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  		  ;;
  	      esac
  
-@@ -13552,7 +14291,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -13557,7 +14296,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
        solaris*)
          case $cc_basename in
@@ -9323,7 +9350,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13593,9 +14332,9 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -13598,9 +14337,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -9335,7 +9362,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -13730,6 +14469,13 @@ private:
+@@ -13735,6 +14474,13 @@ private:
  };
  _LT_EOF
  
@@ -9349,7 +9376,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13743,7 +14489,7 @@ if { { eval echo "\"\$as_me\":${as_linen
+@@ -13748,7 +14494,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -9358,7 +9385,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13752,13 +14498,22 @@ if { { eval echo "\"\$as_me\":${as_linen
+@@ -13757,13 +14503,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -9385,7 +9412,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -13778,8 +14533,10 @@ if { { eval echo "\"\$as_me\":${as_linen
+@@ -13783,8 +14538,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -9396,7 +9423,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -13815,6 +14572,7 @@ else
+@@ -13820,6 +14577,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -9404,7 +9431,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  # PORTME: override above test on systems where it is broken
  case $host_os in
-@@ -13850,7 +14608,7 @@ linux*)
+@@ -13855,7 +14613,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -9413,7 +9440,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -13915,8 +14673,6 @@ fi
+@@ -13920,8 +14678,6 @@ fi
  lt_prog_compiler_pic_CXX=
  lt_prog_compiler_static_CXX=
  
@@ -9422,7 +9449,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -14021,6 +14777,11 @@ $as_echo_n "checking for $compiler optio
+@@ -14026,6 +14782,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	  ;;
  	esac
  	;;
@@ -9434,7 +9461,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -14173,7 +14934,7 @@ $as_echo_n "checking for $compiler optio
+@@ -14178,7 +14939,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	;;
        solaris*)
  	case $cc_basename in
@@ -9443,7 +9470,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    lt_prog_compiler_pic_CXX='-KPIC'
  	    lt_prog_compiler_static_CXX='-Bstatic'
-@@ -14238,10 +14999,17 @@ case $host_os in
+@@ -14243,10 +15004,17 @@ case $host_os in
      lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
      ;;
  esac
@@ -9464,7 +9491,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -14299,6 +15067,8 @@ fi
+@@ -14304,6 +15072,8 @@ fi
  
  
  
@@ -9473,7 +9500,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #
  # Check to make sure the static flag actually works.
  #
-@@ -14476,6 +15246,7 @@ fi
+@@ -14481,6 +15251,7 @@ fi
  $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
  
    export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -9481,7 +9508,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -14490,15 +15261,20 @@ $as_echo_n "checking whether the $compil
+@@ -14495,15 +15266,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -9507,7 +9534,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
  $as_echo "$ld_shlibs_CXX" >&6; }
-@@ -14761,8 +15537,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14766,8 +15542,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -9519,7 +9546,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -14794,13 +15571,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14799,13 +15576,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -9592,7 +9619,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -14891,7 +15726,7 @@ haiku*)
+@@ -14896,7 +15731,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -9601,7 +9628,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    hardcode_into_libs=yes
    ;;
  
-@@ -15350,6 +16185,7 @@ fi
+@@ -15355,6 +16190,7 @@ fi
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -9609,7 +9636,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -18449,13 +19285,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -18477,13 +19313,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -9630,7 +9657,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -18470,14 +19313,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -18498,14 +19341,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -9649,7 +9676,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -18510,12 +19356,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -18538,12 +19384,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -9663,7 +9690,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -18554,8 +19400,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archi
+@@ -18582,8 +19428,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9673,7 +9700,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18582,12 +19428,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$har
+@@ -18610,12 +19456,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9687,7 +9714,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
  hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
  compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -18625,8 +19471,13 @@ reload_flag \
+@@ -18653,8 +19499,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -9701,7 +9728,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  STRIP \
  RANLIB \
  CC \
-@@ -18636,12 +19487,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -18664,12 +19515,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -9717,7 +9744,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -18657,7 +19510,6 @@ no_undefined_flag \
+@@ -18685,7 +19538,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -9725,7 +9752,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -18679,8 +19531,8 @@ LD_CXX \
+@@ -18707,8 +19559,8 @@ LD_CXX \
  reload_flag_CXX \
  compiler_CXX \
  lt_prog_compiler_no_builtin_flag_CXX \
@@ -9735,7 +9762,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  lt_prog_compiler_static_CXX \
  lt_cv_prog_compiler_c_o_CXX \
  export_dynamic_flag_spec_CXX \
-@@ -18692,7 +19544,6 @@ no_undefined_flag_CXX \
+@@ -18720,7 +19572,6 @@ no_undefined_flag_CXX \
  hardcode_libdir_flag_spec_CXX \
  hardcode_libdir_flag_spec_ld_CXX \
  hardcode_libdir_separator_CXX \
@@ -9743,7 +9770,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  exclude_expsyms_CXX \
  include_expsyms_CXX \
  file_list_spec_CXX \
-@@ -18726,6 +19577,7 @@ module_cmds \
+@@ -18754,6 +19605,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -9751,7 +9778,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18740,7 +19592,8 @@ archive_expsym_cmds_CXX \
+@@ -18768,7 +19620,8 @@ archive_expsym_cmds_CXX \
  module_cmds_CXX \
  module_expsym_cmds_CXX \
  export_symbols_cmds_CXX \
@@ -9761,7 +9788,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
      *[\\\\\\\`\\"\\\$]*)
        eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
-@@ -19505,7 +20358,8 @@ $as_echo X"$file" |
+@@ -19533,7 +20386,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -9771,7 +9798,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -19608,19 +20462,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -19636,19 +20490,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -9815,7 +9842,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -19650,6 +20527,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -19678,6 +20555,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -9828,7 +9855,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -19659,6 +20542,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -19687,6 +20570,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -9838,7 +9865,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -19773,12 +20659,12 @@ with_gcc=$GCC
+@@ -19801,12 +20687,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -9854,7 +9881,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -19865,9 +20751,6 @@ inherit_rpath=$inherit_rpath
+@@ -19893,9 +20779,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -9864,7 +9891,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -19883,6 +20766,9 @@ include_expsyms=$lt_include_expsyms
+@@ -19911,6 +20794,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -9874,7 +9901,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -19929,210 +20815,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -19957,210 +20843,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -10076,9 +10103,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -10236,16 +10269,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
  
-@@ -20160,12 +21005,12 @@ with_gcc=$GCC_CXX
+@@ -20188,12 +21033,12 @@ with_gcc=$GCC_CXX
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
  
@@ -10261,7 +10291,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static_CXX
  
-@@ -20252,9 +21097,6 @@ inherit_rpath=$inherit_rpath_CXX
+@@ -20280,9 +21125,6 @@ inherit_rpath=$inherit_rpath_CXX
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs_CXX
  
@@ -10271,7 +10301,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols_CXX
  
-@@ -20270,6 +21112,9 @@ include_expsyms=$lt_include_expsyms_CXX
+@@ -20298,6 +21140,9 @@ include_expsyms=$lt_include_expsyms_CXX
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds_CXX
  
@@ -10281,6 +10311,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec_CXX
  
+diff --git a/libtool.m4 b/libtool.m4
+index 434530059f..e45fdc6998 100644
 --- a/libtool.m4
 +++ b/libtool.m4
 @@ -1,7 +1,8 @@
@@ -10322,7 +10354,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  AC_SUBST(LIBTOOL)dnl
  
  _LT_SETUP
-@@ -166,10 +169,13 @@ _LT_DECL([], [exeext], [0], [Executable
+@@ -166,10 +169,13 @@ _LT_DECL([], [exeext], [0], [Executable file suffix (normally "")])dnl
  dnl
  m4_require([_LT_FILEUTILS_DEFAULTS])dnl
  m4_require([_LT_CHECK_SHELL_FEATURES])dnl
@@ -10345,7 +10377,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -632,7 +638,7 @@ m4_ifset([AC_PACKAGE_NAME], [AC_PACKAGE_
+@@ -632,7 +638,7 @@ m4_ifset([AC_PACKAGE_NAME], [AC_PACKAGE_NAME ])config.lt[]dnl
  m4_ifset([AC_PACKAGE_VERSION], [ AC_PACKAGE_VERSION])
  configured by $[0], generated by m4_PACKAGE_STRING.
  
@@ -10450,7 +10482,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -1161,6 +1177,39 @@ _LT_DECL([], [ECHO], [1], [An echo progr
+@@ -1161,6 +1177,39 @@ _LT_DECL([], [ECHO], [1], [An echo program that protects backslashes])
  ])# _LT_PROG_ECHO_BACKSLASH
  
  
@@ -10703,7 +10735,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -3174,7 +3336,11 @@ test -z "$deplibs_check_method" && depli
+@@ -3174,7 +3336,11 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  _LT_DECL([], [deplibs_check_method], [1],
      [Method to check whether dependent libraries are shared objects])
  _LT_DECL([], [file_magic_cmd], [1],
@@ -10831,7 +10863,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    const char *name;
    void       *address;
  }
-@@ -3510,15 +3750,15 @@ static const void *lt_preloaded_setup()
+@@ -3510,15 +3750,15 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -10865,7 +10897,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  _LT_DECL([global_symbol_pipe], [lt_cv_sys_global_symbol_pipe], [1],
      [Take the output of nm and produce a listing of raw symbols and C names])
  _LT_DECL([global_symbol_to_cdecl], [lt_cv_sys_global_symbol_to_cdecl], [1],
-@@ -3561,6 +3808,8 @@ _LT_DECL([global_symbol_to_c_name_addres
+@@ -3561,6 +3808,8 @@ _LT_DECL([global_symbol_to_c_name_address],
  _LT_DECL([global_symbol_to_c_name_address_lib_prefix],
      [lt_cv_sys_global_symbol_to_c_name_address_lib_prefix], [1],
      [Transform the output of nm in a C name address pair when lib prefix is needed])
@@ -10950,7 +10982,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #
  # Check to make sure the static flag actually works.
  #
-@@ -4213,6 +4477,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog
+@@ -4213,6 +4477,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog_compiler_static], [1],
  m4_defun([_LT_LINKER_SHLIBS],
  [AC_REQUIRE([LT_PATH_LD])dnl
  AC_REQUIRE([LT_PATH_NM])dnl
@@ -11272,7 +11304,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  if test -n "$CXX" && ( test "X$CXX" != "Xno" &&
      ( (test "X$CXX" = "Xg++" && `g++ -v >/dev/null 2>&1` ) ||
      (test "X$CXX" != "Xg++"))) ; then
-@@ -5487,6 +5818,7 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -5487,6 +5818,7 @@ if test "$_lt_caught_CXX_error" != yes; then
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -11280,7 +11312,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -5504,6 +5836,7 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -5504,6 +5836,7 @@ if test "$_lt_caught_CXX_error" != yes; then
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -11288,7 +11320,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    compiler=$CC
    _LT_TAGVAR(compiler, $1)=$CC
    _LT_CC_BASENAME([$compiler])
-@@ -5667,7 +6000,7 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -5667,7 +6000,7 @@ if test "$_lt_caught_CXX_error" != yes; then
            _LT_TAGVAR(allow_undefined_flag, $1)='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -11297,7 +11329,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
            _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  
            _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -5679,7 +6012,7 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -5679,7 +6012,7 @@ if test "$_lt_caught_CXX_error" != yes; then
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -11306,7 +11338,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
  	    # -berok will link without error, but may produce a broken library.
-@@ -5721,29 +6054,75 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -5721,29 +6054,75 @@ if test "$_lt_caught_CXX_error" != yes; then
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -11405,7 +11437,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        darwin* | rhapsody*)
          _LT_DARWIN_LINKER_FEATURES($1)
  	;;
-@@ -5818,7 +6197,7 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -5818,7 +6197,7 @@ if test "$_lt_caught_CXX_error" != yes; then
              ;;
            *)
              if test "$GXX" = yes; then
@@ -11414,7 +11446,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
              else
                # FIXME: insert proper C++ library support
                _LT_TAGVAR(ld_shlibs, $1)=no
-@@ -5889,10 +6268,10 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -5889,10 +6268,10 @@ if test "$_lt_caught_CXX_error" != yes; then
  	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -11427,7 +11459,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	            ;;
  	        esac
  	      fi
-@@ -5933,9 +6312,9 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -5933,9 +6312,9 @@ if test "$_lt_caught_CXX_error" != yes; then
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -11439,7 +11471,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	      fi
  	    fi
  	    _LT_TAGVAR(link_all_deplibs, $1)=yes
-@@ -6005,20 +6384,20 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -6005,20 +6384,20 @@ if test "$_lt_caught_CXX_error" != yes; then
  	      _LT_TAGVAR(prelink_cmds, $1)='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -11464,7 +11496,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -6213,7 +6592,7 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -6213,7 +6592,7 @@ if test "$_lt_caught_CXX_error" != yes; then
  	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -11473,7 +11505,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  		  ;;
  	      esac
  
-@@ -6259,7 +6638,7 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -6259,7 +6638,7 @@ if test "$_lt_caught_CXX_error" != yes; then
  
        solaris*)
          case $cc_basename in
@@ -11482,7 +11514,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	    # Sun C++ 4.2, 5.x and Centerline C++
              _LT_TAGVAR(archive_cmds_need_lc,$1)=yes
  	    _LT_TAGVAR(no_undefined_flag, $1)=' -zdefs'
-@@ -6300,9 +6679,9 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -6300,9 +6679,9 @@ if test "$_lt_caught_CXX_error" != yes; then
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -11494,7 +11526,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -6431,6 +6810,7 @@ if test "$_lt_caught_CXX_error" != yes;
+@@ -6431,6 +6810,7 @@ if test "$_lt_caught_CXX_error" != yes; then
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -11702,7 +11734,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ])# _LT_LANG_RC_CONFIG
  
  
-@@ -7101,6 +7536,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object
+@@ -7101,6 +7536,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object symbol dumper])
  AC_SUBST([OBJDUMP])
  ])
  
@@ -11729,7 +11761,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -7234,206 +7678,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn
+@@ -7234,206 +7678,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn newlines into spaces])dnl
  ])# _LT_CHECK_SHELL_FEATURES
  
  
@@ -11827,31 +11859,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -11868,22 +11875,23 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -11907,24 +11915,45 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -11972,7 +12001,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -11986,17 +12017,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -12082,6 +12110,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +_LT_DECL([to_tool_file_cmd], [lt_cv_to_tool_file_cmd],
 +         [0], [convert $build files to toolchain format])dnl
 +])# _LT_PATH_CONVERSION_FUNCTIONS
+diff --git a/ltmain.sh b/ltmain.sh
+index 9503ec85d7..70e856e065 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
 @@ -1,10 +1,9 @@
@@ -12513,7 +12543,31 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -12543,7 +12597,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -12559,34 +12615,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -12830,13 +12860,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -13557,7 +13587,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        "")
          # Generic help is extracted from the usage comments
          # at the start of this file.
-@@ -1659,8 +2327,8 @@ This mode accepts the following addition
+@@ -1659,8 +2327,8 @@ This mode accepts the following additional options:
  
    -o OUTPUT-FILE    set the output file name to OUTPUT-FILE
    -no-suppress      do not suppress compiler output for multiple passes
@@ -13568,7 +13598,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    -shared           do not build a \`.o' file suitable for static linking
    -static           only build a \`.o' file suitable for static linking
    -Wc,FLAG          pass FLAG directly to the compiler
-@@ -1804,7 +2472,7 @@ Otherwise, only FILE itself is deleted u
+@@ -1804,7 +2472,7 @@ Otherwise, only FILE itself is deleted using RM."
          ;;
  
        *)
@@ -13670,7 +13700,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +    do
 +      if test -d "$opt"; then
 +	func_append libdirs " $opt"
-+
+ 
 +      elif test -f "$opt"; then
 +	if func_lalib_unsafe_p "$opt"; then
 +	  func_append libs " $opt"
@@ -13690,7 +13720,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +      else
 +        sysroot_cmd=
 +      fi
- 
++
 +      # Remove sysroot references
 +      if $opt_dry_run; then
 +        for lib in $libs; do
@@ -14102,7 +14132,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  lt_${my_prefix}_LTX_preloaded_symbols[] =
  {\
    { \"$my_originator\", (void *) 0 },"
-@@ -2736,7 +3493,7 @@ static const void *lt_preloaded_setup()
+@@ -2736,7 +3493,7 @@ static const void *lt_preloaded_setup() {
  	for arg in $LTCFLAGS; do
  	  case $arg in
  	  -pie | -fpie | -fPIE) ;;
@@ -14631,7 +14661,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  */
  EOF
  	    cat <<"EOF"
-@@ -3462,22 +4272,13 @@ int setenv (const char *, const char *,
+@@ -3462,22 +4272,13 @@ int setenv (const char *, const char *, int);
    if (stale) { free ((void *) stale); stale = 0; } \
  } while (0)
  
@@ -14658,7 +14688,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  void *xmalloc (size_t num);
  char *xstrdup (const char *string);
-@@ -3487,7 +4288,10 @@ char *chase_symlinks (const char *pathsp
+@@ -3487,7 +4288,10 @@ char *chase_symlinks (const char *pathspec);
  int make_executable (const char *path);
  int check_executable (const char *path);
  char *strendzap (char *str, const char *pat);
@@ -14986,7 +15016,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    vfprintf (stderr, message, ap);
    fprintf (stderr, ".\n");
  
-@@ -3988,20 +4832,32 @@ lt_error_core (int exit_status, const ch
+@@ -3988,20 +4832,32 @@ lt_error_core (int exit_status, const char *mode,
  }
  
  void
@@ -15024,7 +15054,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    {
  #ifdef HAVE_SETENV
      /* always make a copy, for consistency with !HAVE_SETENV */
-@@ -4049,9 +4905,9 @@ lt_extend_str (const char *orig_value, c
+@@ -4049,9 +4905,9 @@ lt_extend_str (const char *orig_value, const char *add, int to_end)
  void
  lt_update_exe_path (const char *name, const char *value)
  {
@@ -15037,7 +15067,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    if (name && *name && value && *value)
      {
-@@ -4070,9 +4926,9 @@ lt_update_exe_path (const char *name, co
+@@ -4070,9 +4926,9 @@ lt_update_exe_path (const char *name, const char *value)
  void
  lt_update_lib_path (const char *name, const char *value)
  {
@@ -17310,6 +17340,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  if test -n "$exec_cmd"; then
    eval exec "$exec_cmd"
+diff --git a/ltoptions.m4 b/ltoptions.m4
+index 5ef12ced2a..17cfd51c0b 100644
 --- a/ltoptions.m4
 +++ b/ltoptions.m4
 @@ -8,7 +8,7 @@
@@ -17321,6 +17353,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  # This is to help aclocal find these macros, as it can't see m4_define.
  AC_DEFUN([LTOPTIONS_VERSION], [m4_if([1])])
+diff --git a/ltversion.m4 b/ltversion.m4
+index bf87f77132..9c7b5d4118 100644
 --- a/ltversion.m4
 +++ b/ltversion.m4
 @@ -7,17 +7,17 @@
@@ -17347,6 +17381,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  _LT_DECL(, macro_version, 0, [Which release of libtool.m4 was used?])
  _LT_DECL(, macro_revision, 0)
  ])
+diff --git a/lt~obsolete.m4 b/lt~obsolete.m4
+index bf92b5e079..c573da90c5 100644
 --- a/lt~obsolete.m4
 +++ b/lt~obsolete.m4
 @@ -7,7 +7,7 @@
@@ -17358,6 +17394,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  # These exist entirely to fool aclocal when bootstrapping libtool.
  #
+diff --git a/opcodes/configure b/opcodes/configure
+index 4723dcdc1e..223e14af28 100755
 --- a/opcodes/configure
 +++ b/opcodes/configure
 @@ -680,6 +680,9 @@ OTOOL
@@ -17407,7 +17445,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6130,8 +6136,8 @@ $as_echo_n "checking whether the shell u
+@@ -6130,8 +6136,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -17543,7 +17581,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6533,9 +6634,162 @@ test -z "$deplibs_check_method" && depli
+@@ -6531,11 +6632,164 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -17557,6 +17595,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +
 +
 +
+ 
+ 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -17756,7 +17796,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6621,12 +6883,11 @@ ac_tool_warned=yes ;;
+@@ -6621,16 +6883,72 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -17769,13 +17809,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
 +
- 
- 
- 
-@@ -6637,6 +6898,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
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
@@ -17788,7 +17831,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +int
 +main ()
 +{
-+
+ 
 +  ;
 +  return 0;
 +}
@@ -17814,28 +17857,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
+ 
+ 
 @@ -6972,8 +7290,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
@@ -17883,7 +17920,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    const char *name;
    void       *address;
  }
-@@ -7087,8 +7418,8 @@ static const void *lt_preloaded_setup()
+@@ -7087,8 +7418,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -17905,7 +17942,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7136,6 +7467,14 @@ else
+@@ -7136,6 +7467,16 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -17917,13 +17954,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +fi
 +
 +
++
++
  
  
  
-@@ -7157,6 +7496,47 @@ fi
+@@ -7152,6 +7493,45 @@ fi
  
  
  
++
++
++
 +
 +
 +
@@ -17960,14 +18002,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
 @@ -7363,6 +7743,123 @@ esac
  
  need_locks="$enable_libtool_lock"
@@ -18129,7 +18166,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8645,6 +9143,12 @@ $as_echo_n "checking for $compiler optio
+@@ -8645,6 +9143,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -18142,7 +18179,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8707,7 +9211,7 @@ $as_echo_n "checking for $compiler optio
+@@ -8707,7 +9211,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -18303,7 +18340,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9536,7 +10063,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9536,7 +10063,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -18361,7 +18398,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9609,20 +10149,63 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9609,20 +10149,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -18439,7 +18476,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        ;;
  
      darwin* | rhapsody*)
-@@ -9683,7 +10266,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9683,7 +10266,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -18448,7 +18485,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9691,7 +10274,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9691,7 +10274,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -18457,7 +18494,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9707,7 +10290,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9707,7 +10290,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -18466,7 +18503,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9731,10 +10314,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9731,10 +10314,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -18524,7 +18561,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9914,7 +10510,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9914,7 +10510,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -18533,7 +18570,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9933,9 +10529,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9933,9 +10529,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -18692,7 +18729,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    fi
  
    case "${host}" in
-@@ -13757,13 +14412,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -13756,13 +14411,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -18713,7 +18750,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13778,14 +14440,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -13777,14 +14439,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -18732,7 +18769,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13818,12 +14483,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -13817,12 +14482,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -18746,7 +18783,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -13878,8 +14543,13 @@ reload_flag \
+@@ -13877,8 +14542,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -18760,7 +18797,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  STRIP \
  RANLIB \
  CC \
-@@ -13889,12 +14559,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -13888,12 +14558,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -18776,7 +18813,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -13910,7 +14582,6 @@ no_undefined_flag \
+@@ -13909,7 +14581,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -18784,7 +18821,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13946,6 +14617,7 @@ module_cmds \
+@@ -13945,6 +14616,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -18792,7 +18829,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -14711,7 +15383,8 @@ $as_echo X"$file" |
+@@ -14710,7 +15382,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -18802,7 +18839,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -14814,19 +15487,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -14813,19 +15486,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -18846,7 +18883,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14856,6 +15552,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -14855,6 +15551,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -18859,7 +18896,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -14865,6 +15567,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -14864,6 +15566,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -18869,7 +18906,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14979,12 +15684,12 @@ with_gcc=$GCC
+@@ -14978,12 +15683,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -18885,7 +18922,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -15071,9 +15776,6 @@ inherit_rpath=$inherit_rpath
+@@ -15070,9 +15775,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -18895,7 +18932,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -15089,6 +15791,9 @@ include_expsyms=$lt_include_expsyms
+@@ -15088,6 +15790,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -18905,7 +18942,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -15121,210 +15826,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -15120,210 +15825,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -19107,9 +19144,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -19267,15 +19310,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
  
+diff --git a/opcodes/configure.ac b/opcodes/configure.ac
+index 00be9c88be..11c9e33e8c 100644
 --- a/opcodes/configure.ac
 +++ b/opcodes/configure.ac
 @@ -170,7 +170,7 @@ changequote(,)dnl
@@ -19287,6 +19329,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    fi
  
    case "${host}" in
+diff --git a/zlib/configure b/zlib/configure
+index 041cbdbf71..19d605fc85 100755
 --- a/zlib/configure
 +++ b/zlib/configure
 @@ -646,8 +646,11 @@ OTOOL
@@ -19338,7 +19382,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5004,8 +5010,8 @@ $as_echo_n "checking whether the shell u
+@@ -5004,8 +5010,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -19474,7 +19518,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5407,9 +5508,163 @@ test -z "$deplibs_check_method" && depli
+@@ -5405,11 +5506,165 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -19488,6 +19532,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +
 +
 +
+ 
+ 
  if test -n "$ac_tool_prefix"; then
 -  # Extract the first word of "${ac_tool_prefix}ar", so it can be a program name with args.
 -set dummy ${ac_tool_prefix}ar; ac_word=$2
@@ -19688,7 +19734,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -5495,12 +5758,10 @@ ac_tool_warned=yes ;;
+@@ -5495,16 +5758,72 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -19700,13 +19746,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -19719,7 +19769,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +int
 +main ()
 +{
-+
+ 
 +  ;
 +  return 0;
 +}
@@ -19745,29 +19795,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
  
@@ -19815,7 +19858,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    const char *name;
    void       *address;
  }
-@@ -5961,8 +6293,8 @@ static const void *lt_preloaded_setup()
+@@ -5961,8 +6293,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -19837,7 +19880,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6010,6 +6342,18 @@ else
+@@ -6010,6 +6342,19 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -19853,13 +19896,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -19892,13 +19939,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -20060,7 +20103,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -7823,6 +8321,12 @@ $as_echo_n "checking for $compiler optio
+@@ -7823,6 +8321,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -20073,7 +20116,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -7885,7 +8389,7 @@ $as_echo_n "checking for $compiler optio
+@@ -7885,7 +8389,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -20234,7 +20277,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -8717,7 +9244,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -8717,7 +9244,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -20292,7 +20335,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -8793,20 +9333,63 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -8793,20 +9333,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -20370,7 +20413,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        ;;
  
      darwin* | rhapsody*)
-@@ -8867,7 +9450,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -8867,7 +9450,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -20379,7 +20422,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -8875,7 +9458,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -8875,7 +9458,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -20388,7 +20431,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -8891,7 +9474,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -8891,7 +9474,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -20397,7 +20440,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -8915,10 +9498,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -8915,10 +9498,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -20458,7 +20501,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9101,7 +9697,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9101,7 +9697,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -20467,7 +20510,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9120,9 +9716,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9120,9 +9716,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -20617,7 +20660,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12267,13 +12922,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -12267,13 +12922,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -20638,7 +20681,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -12288,14 +12950,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -12288,14 +12950,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -20657,7 +20700,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -12328,12 +12993,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -12328,12 +12993,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -20771,7 +20814,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -13199,6 +13895,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -13199,6 +13895,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -21032,9 +21075,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
@@ -21192,11 +21241,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
diff --git a/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
similarity index 87%
rename from meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
rename to meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
index 5a195054f6..bfab66e637 100644
--- a/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
@@ -1,4 +1,4 @@
-From cd6151c8423a0550fd5758ce17664e34560a103c Mon Sep 17 00:00:00 2001
+From f83e86af1dd564997eecb688a6a3064fa01c3ad8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:39:01 +0000
 Subject: [PATCH] don't let the distro compiler point to the wrong installation
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
-index 0be45b4ae8..4817616bb2 100644
+index fe738d0db4..27d818f253 100644
 --- a/libiberty/Makefile.in
 +++ b/libiberty/Makefile.in
-@@ -364,7 +364,8 @@ install-strip: install
+@@ -365,7 +365,8 @@ install-strip: install
  # multilib-specific flags, it's overridden by FLAGS_TO_PASS from the
  # default multilib, so we have to take CFLAGS into account as well,
  # since it will be passed the multilib flags.
diff --git a/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
similarity index 86%
rename from meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
rename to meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
index 655cc375a9..445b2abc51 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -1,4 +1,4 @@
-From 8ee1a4986ea35bd1e8ab867c5639d5fdbd944d9f Mon Sep 17 00:00:00 2001
+From c573c8472678ac0eda411f2ec94d1213fbe49957 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Jan 2016 06:31:09 +0000
 Subject: [PATCH] warn for uses of system directories when cross linking
@@ -59,9 +59,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ld/ldfile.c     | 17 +++++++++++++++++
  ld/ldlex.h      |  2 ++
  ld/ldmain.c     |  2 ++
- ld/lexsup.c     | 16 ++++++++++++++++
- 9 files changed, 86 insertions(+)
+ ld/lexsup.c     | 15 +++++++++++++++
+ 9 files changed, 85 insertions(+)
 
+diff --git a/ld/config.in b/ld/config.in
+index d93c9b0830..5da2742bea 100644
 --- a/ld/config.in
 +++ b/ld/config.in
 @@ -31,6 +31,9 @@
@@ -74,9 +76,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  /* Additional extension a shared object might have. */
  #undef EXTRA_SHLIB_EXTENSION
  
+diff --git a/ld/configure b/ld/configure
+index f432f4637d..a9da3c115e 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -827,6 +827,7 @@ with_lib_path
+@@ -830,6 +830,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -84,7 +88,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1491,6 +1492,8 @@ Optional Features:
+@@ -1495,6 +1496,8 @@ Optional Features:
    --disable-largefile     omit support for large files
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -93,7 +97,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -16619,6 +16622,19 @@ fi
+@@ -16624,6 +16627,19 @@ fi
  
  
  
@@ -113,6 +117,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  # Check whether --enable-gold was given.
  if test "${enable_gold+set}" = set; then :
    enableval=$enable_gold; case "${enableval}" in
+diff --git a/ld/configure.ac b/ld/configure.ac
+index b5e849d84a..22e022ec03 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
 @@ -94,6 +94,16 @@ AC_SUBST(use_sysroot)
@@ -132,9 +138,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  dnl Use --enable-gold to decide if this linker should be the default.
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
+diff --git a/ld/ld.h b/ld/ld.h
+index 71fd781267..5c7843100b 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
-@@ -180,6 +180,14 @@ typedef struct
+@@ -166,6 +166,14 @@ typedef struct
       in the linker script.  */
    bfd_boolean force_group_allocation;
  
@@ -149,9 +157,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    /* Big or little endian as set on command line.  */
    enum endian_enum endian;
  
+diff --git a/ld/ld.texi b/ld/ld.texi
+index eb7bcb9933..3c73d445a0 100644
 --- a/ld/ld.texi
 +++ b/ld/ld.texi
-@@ -2557,6 +2557,18 @@ string identifying the original linked f
+@@ -2551,6 +2551,18 @@ string identifying the original linked file does not change.
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
@@ -170,9 +180,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  @end table
  
  @c man end
+diff --git a/ld/ldfile.c b/ld/ldfile.c
+index 411f7ddf97..17db16c2cc 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
-@@ -116,6 +116,23 @@ ldfile_add_library_path (const char *nam
+@@ -117,6 +117,23 @@ ldfile_add_library_path (const char *name, bfd_boolean cmdline)
      new_dirs->name = concat (ld_sysroot, name + strlen ("$SYSROOT"), (const char *) NULL);
    else
      new_dirs->name = xstrdup (name);
@@ -196,6 +208,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  }
  
  /* Try to open a BFD for a lang_input_statement.  */
+diff --git a/ld/ldlex.h b/ld/ldlex.h
+index 5287f19a7f..55096e4fc9 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
 @@ -150,6 +150,8 @@ enum option_values
@@ -207,9 +221,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  };
  
  /* The initial parser states.  */
+diff --git a/ld/ldmain.c b/ld/ldmain.c
+index da1ad17763..12d0b07d8a 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -270,6 +270,8 @@ main (int argc, char **argv)
+@@ -274,6 +274,8 @@ main (int argc, char **argv)
    command_line.warn_mismatch = TRUE;
    command_line.warn_search_mismatch = TRUE;
    command_line.check_section_addresses = -1;
@@ -218,9 +234,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
+diff --git a/ld/lexsup.c b/ld/lexsup.c
+index 3d15cc491d..0e8b4f2b7a 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
-@@ -549,6 +549,14 @@ static const struct ld_option ld_options
+@@ -550,6 +550,14 @@ static const struct ld_option ld_options[] =
    { {"no-print-map-discarded", no_argument, NULL, OPTION_NO_PRINT_MAP_DISCARDED},
      '\0', NULL, N_("Do not show discarded sections in map file output"),
      TWO_DASHES },
@@ -235,7 +253,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -1590,6 +1598,13 @@ parse_args (unsigned argc, char **argv)
+@@ -1603,6 +1611,13 @@ parse_args (unsigned argc, char **argv)
  
  	case OPTION_PRINT_MAP_DISCARDED:
  	  config.print_map_discarded = TRUE;
diff --git a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
similarity index 96%
rename from meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
rename to meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
index e63d278bcd..e4866bd841 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
+++ b/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
@@ -1,4 +1,4 @@
-From 903a43f07b7229adadff0f01d560646eb4b0e200 Mon Sep 17 00:00:00 2001
+From 546dac0fa4dd75faedbdee341eb760eb89b98bf2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:42:38 +0000
 Subject: [PATCH] Fix rpath in libtool when sysroot is enabled
diff --git a/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
similarity index 80%
rename from meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch
rename to meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
index e6b50dbcde..baf9891cc7 100644
--- a/meta/recipes-devtools/binutils/binutils/0010-Change-default-emulation-for-mips64-linux.patch
+++ b/meta/recipes-devtools/binutils/binutils/0011-Change-default-emulation-for-mips64-linux.patch
@@ -1,4 +1,4 @@
-From 84349ede307f61d624e5d97397074f5177a5bdc9 Mon Sep 17 00:00:00 2001
+From d955e4bf86aa95f2343bd104d9d481d78bc09339 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:44:14 +0000
 Subject: [PATCH] Change default emulation for mips64*-*-linux
@@ -13,9 +13,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ld/configure.tgt | 8 ++++----
  2 files changed, 8 insertions(+), 8 deletions(-)
 
+diff --git a/bfd/config.bfd b/bfd/config.bfd
+index b96931f52e..847f9f0ba9 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -915,12 +915,12 @@ case "${targ}" in
+@@ -911,12 +911,12 @@ case "${targ}" in
      targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec mips_ecoff_be_vec mips_ecoff_le_vec"
      ;;
    mips64*el-*-linux*)
@@ -32,21 +34,24 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      ;;
    mips*el-*-linux*)
      targ_defvec=mips_elf32_trad_le_vec
+diff --git a/ld/configure.tgt b/ld/configure.tgt
+index 23194e357f..f4f0eaf9b2 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -468,11 +468,11 @@ mips*el-*-vxworks*)	targ_emul=elf32elmip
- mips*-*-vxworks*)	targ_emul=elf32ebmipvxworks
- 			targ_extra_emuls="elf32elmipvxworks" ;;
- mips*-*-windiss)	targ_emul=elf32mipswindiss ;;
+@@ -541,12 +541,12 @@ mips*-*-vxworks*)	targ_emul=elf32ebmipvxworks
+ 			;;
+ mips*-*-windiss)	targ_emul=elf32mipswindiss
+ 			;;
 -mips64*el-*-linux-*)	targ_emul=elf32ltsmipn32
 -			targ_extra_emuls="elf32btsmipn32 elf32ltsmip elf32btsmip elf64ltsmip elf64btsmip"
 +mips64*el-*-linux-*)	targ_emul=elf64ltsmip
 +			targ_extra_emuls="elf32btsmipn32 elf32ltsmipn32 elf32ltsmip elf32btsmip elf64btsmip"
- 			targ_extra_libpath=$targ_extra_emuls ;;
+ 			targ_extra_libpath=$targ_extra_emuls
+ 			;;
 -mips64*-*-linux-*)	targ_emul=elf32btsmipn32
 -			targ_extra_emuls="elf32ltsmipn32 elf32btsmip elf32ltsmip elf64btsmip elf64ltsmip"
 +mips64*-*-linux-*)	targ_emul=elf64btsmip
 +			targ_extra_emuls="elf32btsmipn32 elf32ltsmipn32 elf32btsmip elf32ltsmip elf64ltsmip"
- 			targ_extra_libpath=$targ_extra_emuls ;;
+ 			targ_extra_libpath=$targ_extra_emuls
+ 			;;
  mips*el-*-linux-*)	targ_emul=elf32ltsmip
- 			targ_extra_emuls="elf32btsmip elf32ltsmipn32 elf64ltsmip elf32btsmipn32 elf64btsmip"
diff --git a/meta/recipes-devtools/binutils/binutils/0011-Add-support-for-Netlogic-XLP.patch b/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
similarity index 83%
rename from meta/recipes-devtools/binutils/binutils/0011-Add-support-for-Netlogic-XLP.patch
rename to meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
index b710752245..28c9e65e84 100644
--- a/meta/recipes-devtools/binutils/binutils/0011-Add-support-for-Netlogic-XLP.patch
+++ b/meta/recipes-devtools/binutils/binutils/0012-Add-support-for-Netlogic-XLP.patch
@@ -1,4 +1,4 @@
-From 97e0fdbf8e85a7e690ac09d01a2ae93ba00cfb5d Mon Sep 17 00:00:00 2001
+From bc4556085ab31f09b6555dff7fe1a4360f6f5cfc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:06:19 +0000
 Subject: [PATCH] Add support for Netlogic XLP
@@ -33,9 +33,11 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  opcodes/mips-opc.c    | 31 ++++++++++++++++++++-----------
  14 files changed, 62 insertions(+), 21 deletions(-)
 
+diff --git a/bfd/aoutx.h b/bfd/aoutx.h
+index fa3a9746b6..5078024fd5 100644
 --- a/bfd/aoutx.h
 +++ b/bfd/aoutx.h
-@@ -799,6 +799,7 @@ NAME (aout, machine_type) (enum bfd_arch
+@@ -799,6 +799,7 @@ NAME (aout, machine_type) (enum bfd_architecture arch,
  	case bfd_mach_mipsisa64r6:
  	case bfd_mach_mips_sb1:
  	case bfd_mach_mips_xlr:
@@ -43,6 +45,8 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  	  /* FIXME: These should be MIPS3, MIPS4, MIPS16, MIPS32, etc.  */
  	  arch_flags = M_MIPS2;
  	  break;
+diff --git a/bfd/archures.c b/bfd/archures.c
+index 232103817c..b2b3b8c124 100644
 --- a/bfd/archures.c
 +++ b/bfd/archures.c
 @@ -185,6 +185,7 @@ DESCRIPTION
@@ -53,9 +57,11 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  .#define bfd_mach_mipsisa32		32
  .#define bfd_mach_mipsisa32r2		33
  .#define bfd_mach_mipsisa32r3		34
+diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
+index 7c13bc8c91..2e453c50c1 100644
 --- a/bfd/bfd-in2.h
 +++ b/bfd/bfd-in2.h
-@@ -2125,6 +2125,7 @@ enum bfd_architecture
+@@ -1568,6 +1568,7 @@ enum bfd_architecture
  #define bfd_mach_mips_octeon3          6503
  #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'.  */
  #define bfd_mach_mips_interaptiv_mr2   736550   /* decimal 'IA2'.  */
@@ -63,9 +69,11 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  #define bfd_mach_mipsisa32             32
  #define bfd_mach_mipsisa32r2           33
  #define bfd_mach_mipsisa32r3           34
+diff --git a/bfd/config.bfd b/bfd/config.bfd
+index 847f9f0ba9..a12707f827 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -898,6 +898,11 @@ case "${targ}" in
+@@ -894,6 +894,11 @@ case "${targ}" in
      targ_defvec=mips_elf32_le_vec
      targ_selvecs="mips_elf32_be_vec mips_elf64_be_vec mips_elf64_le_vec"
      ;;
@@ -77,9 +85,11 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
    mips*-*-elf* | mips*-*-rtems* | mips*-*-windiss | mips*-*-none)
      targ_defvec=mips_elf32_be_vec
      targ_selvecs="mips_elf32_le_vec mips_elf64_be_vec mips_elf64_le_vec"
+diff --git a/bfd/cpu-mips.c b/bfd/cpu-mips.c
+index 802acb45f1..fd9ec4c0ad 100644
 --- a/bfd/cpu-mips.c
 +++ b/bfd/cpu-mips.c
-@@ -107,7 +107,8 @@ enum
+@@ -108,7 +108,8 @@ enum
    I_mipsocteon3,
    I_xlr,
    I_interaptiv_mr2,
@@ -89,16 +99,18 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  };
  
  #define NN(index) (&arch_info_struct[(index) + 1])
-@@ -162,7 +163,8 @@ static const bfd_arch_info_type arch_inf
-   N (64, 64, bfd_mach_mips_xlr, "mips:xlr",	  FALSE, NN(I_xlr)),
+@@ -163,7 +164,8 @@ static const bfd_arch_info_type arch_info_struct[] =
+   N (64, 64, bfd_mach_mips_xlr, "mips:xlr",	   FALSE, NN(I_xlr)),
    N (32, 32, bfd_mach_mips_interaptiv_mr2, "mips:interaptiv-mr2", FALSE,
       NN(I_interaptiv_mr2)),
--  N (64, 64, bfd_mach_mips_micromips,"mips:micromips",FALSE,0)
+-  N (64, 64, bfd_mach_mips_micromips, "mips:micromips", FALSE, NULL)
 +  N (64, 64, bfd_mach_mips_micromips, "mips:micromips", FALSE, NN(I_micromips)),
 +  N (64, 64, bfd_mach_mips_xlp, "mips:xlp", FALSE, NULL)
  };
  
  /* The default architecture is mips:3000, but with a machine number of
+diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c
+index d7e3aed3b6..7baeee9ee3 100644
 --- a/bfd/elfxx-mips.c
 +++ b/bfd/elfxx-mips.c
 @@ -6999,6 +6999,9 @@ _bfd_elf_mips_mach (flagword flags)
@@ -111,7 +123,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
      default:
        switch (flags & EF_MIPS_ARCH)
  	{
-@@ -12360,6 +12363,10 @@ mips_set_isa_flags (bfd *abfd)
+@@ -12355,6 +12358,10 @@ mips_set_isa_flags (bfd *abfd)
        val = E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;
        break;
  
@@ -122,7 +134,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
      case bfd_mach_mipsisa32:
        val = E_MIPS_ARCH_32;
        break;
-@@ -14394,6 +14401,7 @@ static const struct mips_mach_extension
+@@ -14379,6 +14386,7 @@ static const struct mips_mach_extension mips_mach_extensions[] =
    { bfd_mach_mips_gs264e, bfd_mach_mips_gs464e },
    { bfd_mach_mips_gs464e, bfd_mach_mips_gs464 },
    { bfd_mach_mips_gs464, bfd_mach_mipsisa64r2 },
@@ -130,9 +142,11 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  
    /* MIPS64 extensions.  */
    { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index 6b5bebe743..d15a7828db 100644
 --- a/binutils/readelf.c
 +++ b/binutils/readelf.c
-@@ -3446,6 +3446,7 @@ get_machine_flags (Filedata * filedata,
+@@ -3440,6 +3440,7 @@ get_machine_flags (Filedata * filedata, unsigned e_flags, unsigned e_machine)
  	    case E_MIPS_MACH_OCTEON3: strcat (buf, ", octeon3"); break;
  	    case E_MIPS_MACH_XLR:  strcat (buf, ", xlr"); break;
  	    case E_MIPS_MACH_IAMR2:  strcat (buf, ", interaptiv-mr2"); break;
@@ -140,6 +154,8 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  	    case 0:
  	    /* We simply ignore the field in this case to avoid confusion:
  	       MIPS ELF does not specify EF_MIPS_MACH, it is a GNU
+diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c
+index fc6898834e..2c7151ccdb 100644
 --- a/gas/config/tc-mips.c
 +++ b/gas/config/tc-mips.c
 @@ -568,6 +568,7 @@ static int mips_32bitmode = 0;
@@ -158,7 +174,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
     )
  
  /* Whether the processor uses hardware interlocks to protect reads
-@@ -20138,7 +20140,7 @@ static const struct mips_cpu_info mips_c
+@@ -20135,7 +20137,7 @@ static const struct mips_cpu_info mips_cpu_info_table[] =
    /* Broadcom XLP.
       XLP is mostly like XLR, with the prominent exception that it is
       MIPS64R2 rather than MIPS64.  */
@@ -167,6 +183,8 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  
    /* MIPS 64 Release 6.  */
    { "i6400",	      0, ASE_VIRT | ASE_MSA,	ISA_MIPS64R6, CPU_MIPS64R6},
+diff --git a/gas/configure b/gas/configure
+index 0e0ce4c0e2..09c23e9c6a 100755
 --- a/gas/configure
 +++ b/gas/configure
 @@ -13377,6 +13377,9 @@ _ACEOF
@@ -179,6 +197,8 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  	  mipstx39 | mipstx39el)
  	    mips_cpu=r3900
  	    ;;
+diff --git a/include/elf/mips.h b/include/elf/mips.h
+index d116b036b6..dceeb3f156 100644
 --- a/include/elf/mips.h
 +++ b/include/elf/mips.h
 @@ -290,6 +290,7 @@ END_RELOC_NUMBERS (R_MIPS_maxext)
@@ -189,9 +209,11 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  #define E_MIPS_MACH_OCTEON2	0x008d0000
  #define E_MIPS_MACH_OCTEON3	0x008e0000
  #define E_MIPS_MACH_5400	0x00910000
+diff --git a/include/opcode/mips.h b/include/opcode/mips.h
+index fd031f3758..a96a44df84 100644
 --- a/include/opcode/mips.h
 +++ b/include/opcode/mips.h
-@@ -1260,6 +1260,8 @@ static const unsigned int mips_isa_table
+@@ -1260,6 +1260,8 @@ static const unsigned int mips_isa_table[] = {
  #define INSN_XLR                 0x00000020
  /* Imagination interAptiv MR2.  */
  #define INSN_INTERAPTIV_MR2	  0x04000000
@@ -200,7 +222,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  
  /* DSP ASE */
  #define ASE_DSP			0x00000001
-@@ -1384,6 +1386,7 @@ static const unsigned int mips_isa_table
+@@ -1384,6 +1386,7 @@ static const unsigned int mips_isa_table[] = {
  #define CPU_OCTEON3	6503
  #define CPU_XLR     	887682   	/* decimal 'XLR'   */
  #define CPU_INTERAPTIV_MR2 736550	/* decimal 'IA2'  */
@@ -208,7 +230,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  
  /* Return true if the given CPU is included in INSN_* mask MASK.  */
  
-@@ -1461,6 +1464,9 @@ cpu_is_member (int cpu, unsigned int mas
+@@ -1461,6 +1464,9 @@ cpu_is_member (int cpu, unsigned int mask)
        return ((mask & INSN_ISA_MASK) == INSN_ISA32R6)
  	     || ((mask & INSN_ISA_MASK) == INSN_ISA64R6);
  
@@ -218,20 +240,25 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
      default:
        return FALSE;
      }
+diff --git a/ld/configure.tgt b/ld/configure.tgt
+index f4f0eaf9b2..0da3eca19c 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -454,6 +454,8 @@ mips*el-sde-elf* | mips*el-mti-elf* | mi
- mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
+@@ -520,6 +520,9 @@ mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
  			targ_emul=elf32btsmip
- 			targ_extra_emuls="elf32ltsmip elf32btsmipn32 elf64btsmip elf32ltsmipn32 elf64ltsmip" ;;
+ 			targ_extra_emuls="elf32ltsmip elf32btsmipn32 elf64btsmip elf32ltsmipn32 elf64ltsmip"
+ 			;;
 +mipsisa64*-*-elf*)	targ_emul=elf32btsmip
-+			targ_extra_emuls="elf32ltsmip elf64btsmip elf64ltsmip" ;;
++			targ_extra_emuls="elf32ltsmip elf64btsmip elf64ltsmip"
++			;;
  mips64*el-ps2-elf*)	targ_emul=elf32lr5900n32
  			targ_extra_emuls="elf32lr5900"
- 			targ_extra_libpath=$targ_extra_emuls ;;
+ 			targ_extra_libpath=$targ_extra_emuls
+diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c
+index 755bbe294b..ce22ef683a 100644
 --- a/opcodes/mips-dis.c
 +++ b/opcodes/mips-dis.c
-@@ -673,13 +673,11 @@ const struct mips_arch_choice mips_arch_
+@@ -674,13 +674,11 @@ const struct mips_arch_choice mips_arch_choices[] =
      mips_cp0sel_names_xlr, ARRAY_SIZE (mips_cp0sel_names_xlr),
      mips_cp1_names_mips3264, mips_hwr_names_numeric },
  
@@ -250,6 +277,8 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  
    /* This entry, mips16, is here only for ISA/processor selection; do
       not print its name.  */
+diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c
+index 5270aeefa8..d17dc78cd7 100644
 --- a/opcodes/mips-opc.c
 +++ b/opcodes/mips-opc.c
 @@ -328,6 +328,7 @@ decode_mips_operand (const char *p)
@@ -260,7 +289,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  #define IVIRT	ASE_VIRT
  #define IVIRT64	ASE_VIRT64
  
-@@ -990,6 +991,7 @@ const struct mips_opcode mips_builtin_op
+@@ -990,6 +991,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"clo",			"U,s",		0x70000021, 0xfc0007ff, WR_1|RD_2,		0,		I32|N55,	0,	I37 },
  {"clz",			"d,s",		0x00000050, 0xfc1f07ff, WR_1|RD_2,		0,		I37,		0,	0 },
  {"clz",			"U,s",		0x70000020, 0xfc0007ff, WR_1|RD_2,		0,		I32|N55,	0,	I37 },
@@ -268,7 +297,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  /* ctc0 is at the bottom of the table.  */
  {"ctc1",		"t,G",		0x44c00000, 0xffe007ff,	RD_1|WR_CC|CM,		0,		I1,		0,	0 },
  {"ctc1",		"t,S",		0x44c00000, 0xffe007ff,	RD_1|WR_CC|CM,		0,		I1,		0,	0 },
-@@ -1022,12 +1024,13 @@ const struct mips_opcode mips_builtin_op
+@@ -1022,12 +1024,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"daddiu",		"t,r,j",	0x64000000, 0xfc000000, WR_1|RD_2,		0,		I3,		0,	0 },
  {"daddu",		"d,v,t",	0x0000002d, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I3,		0,	0 },
  {"daddu",		"t,r,I",	0,    (int) M_DADDU_I,	INSN_MACRO,		0,		I3,		0,	0 },
@@ -283,7 +312,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  /* dctr and dctw are used on the r5000.  */
  {"dctr",		"o(b)",	 	0xbc050000, 0xfc1f0000, RD_2,			0,		I3,		0,	0 },
  {"dctw",		"o(b)",		0xbc090000, 0xfc1f0000, RD_2,			0,		I3,		0,	0 },
-@@ -1099,6 +1102,7 @@ const struct mips_opcode mips_builtin_op
+@@ -1099,6 +1102,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"dmfc0",		"t,G,H",	0x40200000, 0xffe007f8,	WR_1|RD_C0|LC,		0,		I64,		0,	0 },
  {"dmfgc0",		"t,G",		0x40600100, 0xffe007ff, WR_1|RD_C0|LC,		0,		0,		IVIRT64, 0 },
  {"dmfgc0",		"t,G,H",	0x40600100, 0xffe007f8, WR_1|RD_C0|LC,		0,		0,		IVIRT64, 0 },
@@ -291,7 +320,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  {"dmt",			"",		0x41600bc1, 0xffffffff, TRAP,			0,		0,		MT32,	0 },
  {"dmt",			"t",		0x41600bc1, 0xffe0ffff, WR_1|TRAP,		0,		0,		MT32,	0 },
  {"dmtc0",		"t,G",		0x40a00000, 0xffe007ff,	RD_1|WR_C0|WR_CC|CM,	0,		I3,		0,	EE },
-@@ -1114,6 +1118,8 @@ const struct mips_opcode mips_builtin_op
+@@ -1114,6 +1118,8 @@ const struct mips_opcode mips_builtin_opcodes[] =
  /* dmfc3 is at the bottom of the table.  */
  /* dmtc3 is at the bottom of the table.  */
  {"dmuh",		"d,s,t",	0x000000dc, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I69,		0,	0 },
@@ -300,7 +329,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  {"dmul",		"d,s,t",	0x0000009c, 0xfc0007ff, WR_1|RD_2|RD_3,		0,		I69,		0,	0 },
  {"dmul",		"d,v,t",	0x70000003, 0xfc0007ff, WR_1|RD_2|RD_3|WR_HILO,	0,		IOCT,		0,	0 },
  {"dmul",		"d,v,t",	0,    (int) M_DMUL,	INSN_MACRO,		0,		I3,		0,	M32|I69 },
-@@ -1267,9 +1273,9 @@ const struct mips_opcode mips_builtin_op
+@@ -1267,9 +1273,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"ld",			"s,-b(+R)",	0xec180000, 0xfc1c0000, WR_1,			RD_pc,		I69,		0,	0 },
  {"ld",			"t,A(b)",	0,    (int) M_LD_AB,	INSN_MACRO,		0,		I1,		0,	0 },
  {"ld",			"t,o(b)",	0xdc000000, 0xfc000000, WR_1|RD_3|LM,		0,		I3,		0,	0 },
@@ -313,7 +342,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  {"ldc1",		"T,o(b)",	0xd4000000, 0xfc000000, WR_1|RD_3|CLD|FP_D,	0,		I2,		0,	SF },
  {"ldc1",		"E,o(b)",	0xd4000000, 0xfc000000, WR_1|RD_3|CLD|FP_D,	0,		I2,		0,	SF },
  {"ldc1",		"T,A(b)",	0,    (int) M_LDC1_AB,	INSN_MACRO,		INSN2_M_FP_D,	I2,		0,	SF },
-@@ -1438,7 +1444,7 @@ const struct mips_opcode mips_builtin_op
+@@ -1438,7 +1444,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"mflo",		"d,9",		0x00000012, 0xff9f07ff, WR_1|RD_LO,		0,		0,		D32,	0 },
  {"mflo1",		"d",		0x70000012, 0xffff07ff,	WR_1|RD_LO,		0,		EE,		0,	0 },
  {"mflhxu",		"d",		0x00000052, 0xffff07ff,	WR_1|MOD_HILO,		0,		0,		SMT,	0 },
@@ -322,7 +351,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  {"mfsa",		"d",		0x00000028, 0xffff07ff,	WR_1,			0,		EE,		0,	0 },
  {"min.ob",		"X,Y,Q",	0x78000006, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		SB1,		MX,	0 },
  {"min.ob",		"D,S,Q",	0x48000006, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		N54,		0,	0 },
-@@ -1483,10 +1489,13 @@ const struct mips_opcode mips_builtin_op
+@@ -1483,10 +1489,13 @@ const struct mips_opcode mips_builtin_opcodes[] =
  /* move is at the top of the table.  */
  {"msgn.qh",		"X,Y,Q",	0x78200000, 0xfc20003f,	WR_1|RD_2|RD_3|FP_D,	0,		0,		MX,	0 },
  {"msgsnd",		"t",		0,    (int) M_MSGSND,	INSN_MACRO,		0,		XLR,		0,	0 },
@@ -338,7 +367,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  {"msub.d",		"D,R,S,T",	0x4c000029, 0xfc00003f, WR_1|RD_2|RD_3|RD_4|FP_D, 0,		I4_33,		0,	I37 },
  {"msub.d",		"D,S,T",	0x46200019, 0xffe0003f,	WR_1|RD_2|RD_3|FP_D,	0,		IL2E,		0,	0 },
  {"msub.d",		"D,S,T",	0x72200019, 0xffe0003f,	WR_1|RD_2|RD_3|FP_D,	0,		IL2F,		0,	0 },
-@@ -1536,7 +1545,7 @@ const struct mips_opcode mips_builtin_op
+@@ -1536,7 +1545,7 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"mtlo",		"s,7",		0x00000013, 0xfc1fe7ff, RD_1|WR_LO,		0,		0,		D32,	0 },
  {"mtlo1",		"s",		0x70000013, 0xfc1fffff,	RD_1|WR_LO,		0,		EE,		0,	0 },
  {"mtlhx",		"s",		0x00000053, 0xfc1fffff,	RD_1|MOD_HILO,		0,		0,		SMT,	0 },
@@ -347,7 +376,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  {"mtm0",		"s",		0x70000008, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
  {"mtm0",    		"s,t",		0x70000008, 0xfc00ffff, RD_1|RD_2,		0,		IOCT3,		0,	0 },
  {"mtm1",		"s",		0x7000000c, 0xfc1fffff, RD_1,			0,		IOCT,		0,	0 },
-@@ -1978,9 +1987,9 @@ const struct mips_opcode mips_builtin_op
+@@ -1978,9 +1987,9 @@ const struct mips_opcode mips_builtin_opcodes[] =
  {"suxc1",		"S,t(b)",	0x4c00000d, 0xfc0007ff, RD_1|RD_2|RD_3|SM|FP_D,	0,		I5_33|N55,	0,	I37},
  {"sw",			"t,o(b)",	0xac000000, 0xfc000000,	RD_1|RD_3|SM,		0,		I1,		0,	0 },
  {"sw",			"t,A(b)",	0,    (int) M_SW_AB,	INSN_MACRO,		0,		I1,		0,	0 },
diff --git a/meta/recipes-devtools/binutils/binutils/0012-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
similarity index 91%
rename from meta/recipes-devtools/binutils/binutils/0012-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
rename to meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
index f686763594..211f66ce26 100644
--- a/meta/recipes-devtools/binutils/binutils/0012-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
+++ b/meta/recipes-devtools/binutils/binutils/0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
@@ -1,4 +1,4 @@
-From f34aac4314b821396fe745013dc8ec8683ea2598 Mon Sep 17 00:00:00 2001
+From 283fbdb658af7c310c1fc477dd8ec572cca5de50 Mon Sep 17 00:00:00 2001
 From: Zhenhua Luo <zhenhua.luo@nxp.com>
 Date: Sat, 11 Jun 2016 22:08:29 -0500
 Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
@@ -11,7 +11,7 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
-index b56fe3e21a..696fe83a7b 100644
+index 7ef91d819b..145953d3c4 100644
 --- a/opcodes/ppc-opc.c
 +++ b/opcodes/ppc-opc.c
 @@ -5709,7 +5709,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
diff --git a/meta/recipes-devtools/binutils/binutils/0013-Detect-64-bit-MIPS-targets.patch b/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch
similarity index 91%
rename from meta/recipes-devtools/binutils/binutils/0013-Detect-64-bit-MIPS-targets.patch
rename to meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch
index 493b05026d..737d748d2c 100644
--- a/meta/recipes-devtools/binutils/binutils/0013-Detect-64-bit-MIPS-targets.patch
+++ b/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bit-MIPS-targets.patch
@@ -1,4 +1,4 @@
-From ebb74c39acb171fd24c2698646134ce88dd96a15 Mon Sep 17 00:00:00 2001
+From 06b3f6172eada20dd555e2bd2b34b7c055334033 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 31 Mar 2017 11:42:03 -0700
 Subject: [PATCH] Detect 64-bit MIPS targets
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 14 insertions(+)
 
 diff --git a/gold/configure.tgt b/gold/configure.tgt
-index 3e066edaa8..caf130ceda 100644
+index aa7ec552ae..470515062e 100644
 --- a/gold/configure.tgt
 +++ b/gold/configure.tgt
 @@ -153,6 +153,13 @@ aarch64*-*)
diff --git a/meta/recipes-devtools/binutils/binutils/0014-sync-with-OE-libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
similarity index 97%
rename from meta/recipes-devtools/binutils/binutils/0014-sync-with-OE-libtool-changes.patch
rename to meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
index ae5915d39b..7a3f7ee3b1 100644
--- a/meta/recipes-devtools/binutils/binutils/0014-sync-with-OE-libtool-changes.patch
+++ b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-changes.patch
@@ -1,4 +1,4 @@
-From 6bc49e9a581eb46265935ea2756a99faa7d0562e Mon Sep 17 00:00:00 2001
+From d23818d123461e6ebb90a6fac071cc9080bdd9ab Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Mar 2017 23:33:27 -0800
 Subject: [PATCH] sync with OE libtool changes
diff --git a/meta/recipes-devtools/binutils/binutils/0015-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch b/meta/recipes-devtools/binutils/binutils/0016-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch
similarity index 80%
rename from meta/recipes-devtools/binutils/binutils/0015-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch
rename to meta/recipes-devtools/binutils/binutils/0016-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch
index d25ce61626..c5a118a29a 100644
--- a/meta/recipes-devtools/binutils/binutils/0015-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch
+++ b/meta/recipes-devtools/binutils/binutils/0016-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch
@@ -1,4 +1,4 @@
-From a326a8feb445a5713ff3d17c55f43d5681e26585 Mon Sep 17 00:00:00 2001
+From 6658cad55384865d6795cbe436c7361a67d1ed95 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 29 Nov 2018 17:46:40 -0800
 Subject: [PATCH] binutils : enable x86_64-pep for producing EFI binaries on
@@ -19,9 +19,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ld/configure.tgt | 5 +++--
  2 files changed, 4 insertions(+), 3 deletions(-)
 
+diff --git a/bfd/config.bfd b/bfd/config.bfd
+index a12707f827..17f4cc5bea 100644
 --- a/bfd/config.bfd
 +++ b/bfd/config.bfd
-@@ -694,7 +694,7 @@ case "${targ}" in
+@@ -690,7 +690,7 @@ case "${targ}" in
      ;;
    x86_64-*-linux-*)
      targ_defvec=x86_64_elf64_vec
@@ -30,17 +32,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      want64=true
      ;;
    x86_64-*-nacl*)
+diff --git a/ld/configure.tgt b/ld/configure.tgt
+index 0da3eca19c..8d0b4b885d 100644
 --- a/ld/configure.tgt
 +++ b/ld/configure.tgt
-@@ -258,8 +258,9 @@ x86_64-*-linux-gnux32)	targ_emul=elf32_x
- 			tdir_elf_iamcu=`echo ${targ_alias} | sed -e 's/x86_64/i386/' -e 's/-linux-gnux32/-linux-gnu/'`
- 			tdir_elf_i386=`echo ${targ_alias} | sed -e 's/x86_64/i386/' -e 's/-linux-gnux32/-linux-gnu/'` ;;
+@@ -938,8 +938,9 @@ x86_64-*-linux-gnux32)	targ_emul=elf32_x86_64
+ 			tdir_elf_i386=`echo ${targ_alias} | sed -e 's/x86_64/i386/' -e 's/-linux-gnux32/-linux-gnu/'`
+ 			;;
  x86_64-*-linux-*)	targ_emul=elf_x86_64
 -			targ_extra_emuls="elf32_x86_64 elf_i386 elf_iamcu elf_l1om elf_k1om"
 -			targ_extra_libpath="elf_i386 elf32_x86_64 elf_l1om elf_k1om"
 +			targ_extra_emuls="elf32_x86_64 elf_i386 elf_iamcu elf_l1om elf_k1om i386pe i386pep"
 +			targ_extra_libpath="elf_i386 elf32_x86_64 elf_l1om elf_k1om i386pep"
 +			targ_extra_ofiles="deffilep.o pep-dll.o pe-dll.o"
- 			tdir_elf_i386=`echo ${targ_alias} | sed -e 's/x86_64/i386/'` ;;
- i[3-7]86-*-redox*)	targ_emul=elf_i386
- 			targ_extra_emuls=elf_x86_64 ;;
+ 			tdir_elf_i386=`echo ${targ_alias} | sed -e 's/x86_64/i386/'`
+ 			;;
+ x86_64-*-redox*)	targ_emul=elf_x86_64
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
deleted file mode 100644
index ce5b9f392d..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 09dd135df9ebc7a4b640537e23e26a03a288a789 Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Wed, 9 Oct 2019 00:07:29 +1030
-Subject: [PATCH] PR25078, stack overflow in function find_abstract_instance
-
-Selectively backporting fix for bfd/dwarf2.c, but not the ChangeLog
-file. There are newer versions of binutils, but none of them contain the
-commit fixing CVE-2019-17450, so backport it to master and zeus.
-
-Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=063c511bd79]
-CVE: CVE-2019-17450
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
-
-	PR 25078
-	* dwarf2.c (find_abstract_instance): Delete orig_info_ptr, add
-	recur_count.  Error on recur_count reaching 100 rather than
-	info_ptr matching orig_info_ptr.  Adjust calls.
-
----
- bfd/dwarf2.c | 35 +++++++++++++++++------------------
- 1 file changed, 17 insertions(+), 18 deletions(-)
-
---- a/bfd/dwarf2.c
-+++ b/bfd/dwarf2.c
-@@ -2812,13 +2812,13 @@ static bfd_boolean comp_unit_maybe_decod
- 						     struct dwarf2_debug *);
- 
- static bfd_boolean
--find_abstract_instance (struct comp_unit *   unit,
--			bfd_byte *           orig_info_ptr,
--			struct attribute *   attr_ptr,
--			const char **        pname,
--			bfd_boolean *        is_linkage,
--			char **              filename_ptr,
--			int *                linenumber_ptr)
-+find_abstract_instance (struct comp_unit *unit,
-+			struct attribute *attr_ptr,
-+			unsigned int recur_count,
-+			const char **pname,
-+			bfd_boolean *is_linkage,
-+			char **filename_ptr,
-+			int *linenumber_ptr)
- {
-   bfd *abfd = unit->abfd;
-   bfd_byte *info_ptr;
-@@ -2829,6 +2829,14 @@ find_abstract_instance (struct comp_unit
-   struct attribute attr;
-   const char *name = NULL;
- 
-+  if (recur_count == 100)
-+    {
-+      _bfd_error_handler
-+	(_("DWARF error: abstract instance recursion detected"));
-+      bfd_set_error (bfd_error_bad_value);
-+      return FALSE;
-+    }
-+
-   /* DW_FORM_ref_addr can reference an entry in a different CU. It
-      is an offset from the .debug_info section, not the current CU.  */
-   if (attr_ptr->form == DW_FORM_ref_addr)
-@@ -2962,15 +2970,6 @@ find_abstract_instance (struct comp_unit
- 					 info_ptr, info_ptr_end);
- 	      if (info_ptr == NULL)
- 		break;
--	      /* It doesn't ever make sense for DW_AT_specification to
--		 refer to the same DIE.  Stop simple recursion.  */
--	      if (info_ptr == orig_info_ptr)
--		{
--		  _bfd_error_handler
--		    (_("DWARF error: abstract instance recursion detected"));
--		  bfd_set_error (bfd_error_bad_value);
--		  return FALSE;
--		}
- 	      switch (attr.name)
- 		{
- 		case DW_AT_name:
-@@ -2984,7 +2983,7 @@ find_abstract_instance (struct comp_unit
- 		    }
- 		  break;
- 		case DW_AT_specification:
--		  if (!find_abstract_instance (unit, info_ptr, &attr,
-+		  if (!find_abstract_instance (unit, &attr, recur_count + 1,
- 					       &name, is_linkage,
- 					       filename_ptr, linenumber_ptr))
- 		    return FALSE;
-@@ -3200,7 +3199,7 @@ scan_unit_for_symbols (struct comp_unit
- 
- 		case DW_AT_abstract_origin:
- 		case DW_AT_specification:
--		  if (!find_abstract_instance (unit, info_ptr, &attr,
-+		  if (!find_abstract_instance (unit, &attr, 0,
- 					       &func->name,
- 					       &func->is_linkage,
- 					       &func->file,
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch
deleted file mode 100644
index 1fe05d310e..0000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 0192438051a7e781585647d5581a2a6f62fda362 Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Wed, 9 Oct 2019 10:47:13 +1030
-Subject: [PATCH] PR25070, SEGV in function _bfd_dwarf2_find_nearest_line
-
-Selectively backporting fix for bfd/dwarf2.c, but not the ChangeLog
-file. There are newer versions of binutils, but none of them contain the
-commit fixing CVE-2019-17451, so backport it to master and zeus.
-
-Upstream-Status: Backport
-[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=336bfbeb1848]
-CVE: CVE-2019-17451
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
-
-
-Evil testcase with two debug info sections, with sizes of 2aaaabac4ec1
-and ffffd5555453b140 result in a total size of 1.  Reading the first
-section of course overflows the buffer and tramples on other memory.
-
-	PR 25070
-	* dwarf2.c (_bfd_dwarf2_slurp_debug_info): Catch overflow of
-	total_size calculation.
----
- bfd/dwarf2.c | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
---- a/bfd/dwarf2.c
-+++ b/bfd/dwarf2.c
-@@ -4439,7 +4439,16 @@ _bfd_dwarf2_slurp_debug_info (bfd *abfd,
-       for (total_size = 0;
- 	   msec;
- 	   msec = find_debug_info (debug_bfd, debug_sections, msec))
--	total_size += msec->size;
-+	{
-+	  /* Catch PR25070 testcase overflowing size calculation here.  */
-+	  if (total_size + msec->size < total_size
-+	      || total_size + msec->size < msec->size)
-+	    {
-+	      bfd_set_error (bfd_error_no_memory);
-+	      return FALSE;
-+	    }
-+	  total_size += msec->size;
-+	}
- 
-       stash->info_ptr_memory = (bfd_byte *) bfd_malloc (total_size);
-       if (stash->info_ptr_memory == NULL)
diff --git a/meta/recipes-devtools/binutils/binutils_2.33.bb b/meta/recipes-devtools/binutils/binutils_2.34.bb
similarity index 94%
rename from meta/recipes-devtools/binutils/binutils_2.33.bb
rename to meta/recipes-devtools/binutils/binutils_2.34.bb
index 8bd2bf778c..eecad1863c 100644
--- a/meta/recipes-devtools/binutils/binutils_2.33.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.34.bb
@@ -51,7 +51,7 @@ do_install_class-native () {
 PACKAGE_BEFORE_PN += "libbfd"
 FILES_libbfd = "${libdir}/libbfd-*.so"
 
-SRC_URI_append_class-nativesdk =  " file://nativesdk-relocation.patch "
+SRC_URI_append_class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
 
 USE_ALTERNATIVES_FOR_class-nativesdk = ""
 FILES_${PN}_append_class-nativesdk = " ${bindir}"
-- 
2.25.1


