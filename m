Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2FDDC60043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 18:37:08 +0000 (UTC)
Received: by wmww144 with SMTP id w144so84862062wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 10:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0+g+eAL/nmUHF7FynFUJjIj0MpkESRB+jG5FiPePnaA=;
	b=z7DjM6Bcv8olYrDIcKMwqQ3ToQqkc+IV9qGzL08vWPLCLPcxHUysBvF5CMZ4axSKfX
	YmjzNw4HEtarT5zc9dPtODdAg2nNNXlOVbzPmgzRpLvldPuONqQMfKGJztap5PAXwNXm
	FmQZtFqxnNMU3qMLf2U8wTUn1dg0JLXhbWYF4X6JSffskCPkETnOGl532Q5E3XaJu3ng
	Uxgwnr9yCJLXYBEHhDBX5R27pBX4HHVCNZh2VBw/XTw0Df6zHN+4a2e+IJ5Ym5HWEuLe
	l/2E0e5w9tUa2CizyHymfu3rz9UDFxNwHiqzeoUyzvrdCgYrOY4EgLAXYbq27t/rcZJd
	Wgpg==
X-Received: by 10.28.63.204 with SMTP id m195mr5459624wma.11.1447871829375;
	Wed, 18 Nov 2015 10:37:09 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q141sm4554562wmg.3.2015.11.18.10.37.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Nov 2015 10:37:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 19:37:17 +0100
Message-Id: <1447871842-30347-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447864860.1472.56.camel@pbcl.net>
References: <1447864860.1472.56.camel@pbcl.net>
Subject: [PATCHv3 1/6] meta/conf/machine: use ' inside quoted values
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
X-List-Received-Date: Wed, 18 Nov 2015 18:37:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/arch-arm.inc         |  4 ++--
 meta/conf/machine/include/arm/arch-arm64.inc       | 14 ++++++-------
 meta/conf/machine/include/arm/arch-armv4.inc       | 10 ++++-----
 meta/conf/machine/include/arm/arch-armv5-dsp.inc   |  2 +-
 meta/conf/machine/include/arm/arch-armv5.inc       |  6 +++---
 meta/conf/machine/include/arm/arch-armv6.inc       |  4 ++--
 meta/conf/machine/include/arm/arch-armv7a.inc      |  4 ++--
 meta/conf/machine/include/arm/feature-arm-neon.inc |  4 ++--
 meta/conf/machine/include/arm/feature-arm-vfp.inc  | 16 +++++++--------
 meta/conf/machine/include/mips/arch-mips.inc       | 24 +++++++++++-----------
 meta/conf/machine/include/powerpc/arch-powerpc.inc | 10 ++++-----
 .../machine/include/powerpc/arch-powerpc64.inc     |  4 ++--
 meta/conf/machine/include/sh/arch-sh.inc           |  2 +-
 meta/conf/machine/include/tune-arm1136jf-s.inc     |  2 +-
 meta/conf/machine/include/tune-arm920t.inc         |  2 +-
 meta/conf/machine/include/tune-arm926ejs.inc       |  2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc        |  2 +-
 meta/conf/machine/include/tune-c3.inc              |  2 +-
 meta/conf/machine/include/tune-core2.inc           |  2 +-
 meta/conf/machine/include/tune-corei7.inc          |  2 +-
 meta/conf/machine/include/tune-cortexa15.inc       |  2 +-
 meta/conf/machine/include/tune-cortexa17.inc       |  2 +-
 meta/conf/machine/include/tune-cortexa5.inc        |  2 +-
 meta/conf/machine/include/tune-cortexa7.inc        |  2 +-
 meta/conf/machine/include/tune-cortexa8.inc        |  2 +-
 meta/conf/machine/include/tune-cortexa9.inc        |  2 +-
 meta/conf/machine/include/tune-cortexm1.inc        |  2 +-
 meta/conf/machine/include/tune-cortexm3.inc        |  4 ++--
 meta/conf/machine/include/tune-cortexr4.inc        |  4 ++--
 meta/conf/machine/include/tune-ep9312.inc          |  2 +-
 meta/conf/machine/include/tune-i586-nlp.inc        |  2 +-
 meta/conf/machine/include/tune-i586.inc            |  2 +-
 meta/conf/machine/include/tune-iwmmxt.inc          |  2 +-
 meta/conf/machine/include/tune-mips32.inc          |  2 +-
 meta/conf/machine/include/tune-mips32r2.inc        |  2 +-
 meta/conf/machine/include/tune-octeon.inc          |  4 ++--
 meta/conf/machine/include/tune-power5.inc          |  6 +++---
 meta/conf/machine/include/tune-power6.inc          |  6 +++---
 meta/conf/machine/include/tune-power7.inc          |  6 +++---
 meta/conf/machine/include/tune-ppc476.inc          |  4 ++--
 meta/conf/machine/include/tune-ppc603e.inc         |  4 ++--
 meta/conf/machine/include/tune-ppc7400.inc         |  4 ++--
 meta/conf/machine/include/tune-ppce300c2.inc       |  2 +-
 meta/conf/machine/include/tune-ppce300c3.inc       |  6 +++---
 meta/conf/machine/include/tune-ppce500.inc         |  8 ++++----
 meta/conf/machine/include/tune-ppce500mc.inc       |  4 ++--
 meta/conf/machine/include/tune-ppce500v2.inc       |  8 ++++----
 meta/conf/machine/include/tune-ppce5500.inc        |  4 ++--
 meta/conf/machine/include/tune-ppce6500.inc        |  6 +++---
 meta/conf/machine/include/tune-sh3.inc             |  2 +-
 meta/conf/machine/include/tune-sh4.inc             |  4 ++--
 meta/conf/machine/include/tune-strongarm1100.inc   |  2 +-
 meta/conf/machine/include/tune-thunderx.inc        |  2 +-
 meta/conf/machine/include/tune-xscale.inc          |  2 +-
 meta/conf/machine/include/x86/arch-x86.inc         | 20 +++++++++---------
 55 files changed, 128 insertions(+), 128 deletions(-)

diff --git a/meta/conf/machine/include/arm/arch-arm.inc b/meta/conf/machine/include/arm/arch-arm.inc
index 90b80c4..129fbfb 100644
--- a/meta/conf/machine/include/arm/arch-arm.inc
+++ b/meta/conf/machine/include/arm/arch-arm.inc
@@ -2,13 +2,13 @@
 TUNEVALID[bigendian] = "Enable big-endian mode."
 
 ARMPKGARCH = "${ARMPKGARCH_tune-${DEFAULTTUNE}}"
-ARMPKGSFX_ENDIAN = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "b", "", d)}"
+ARMPKGSFX_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'b', '', d)}"
 ARMPKGSFX_FPU ??= ""
 ARMPKGSFX_DSP ??= ""
 ARMPKGSFX_EABI ??= ""
 ARMPKGSFX_THUMB ??= ""
 
-TUNE_ARCH = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "armeb", "arm", d)}"
+TUNE_ARCH = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'armeb', 'arm', d)}"
 TUNE_PKGARCH = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
 
 ABIEXTENSION = "eabi"
diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 5376b87..866b71f 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[aarch64] = "Enable instructions for aarch64"
 
-MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", ":aarch64", "" ,d)}"
+MACHINEOVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', ':aarch64', '' ,d)}"
 
 # Little Endian base configs
 AVAILTUNES += "aarch64 aarch64_be"
@@ -18,19 +18,19 @@ BASE_LIB_tune-aarch64_be = "lib64"
 PACKAGE_EXTRA_ARCHS_tune-aarch64 = "aarch64"
 PACKAGE_EXTRA_ARCHS_tune-aarch64_be = "aarch64_be"
 
-ARMPKGSFX_ENDIAN_64 = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "_be", "", d)}"
+ARMPKGSFX_ENDIAN_64 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '_be', '', d)}"
 TUNE_ARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
 TUNE_PKGARCH_64 = "aarch64${ARMPKGSFX_ENDIAN_64}"
 ABIEXTENSION_64 = ""
 TARGET_FPU_64 = ""
 
 # Duplicated from arch-arm.inc
-TUNE_ARCH_32 = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "armeb", "arm", d)}"
+TUNE_ARCH_32 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'armeb', 'arm', d)}"
 TUNE_PKGARCH_32 = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGSFX_ENDIAN}${ARMPKGSFX_FPU}"
 ABIEXTENSION_32 = "eabi"
 TARGET_FPU_32 = "${@d.getVar('ARMPKGSFX_FPU', True).strip('-') or 'soft'}"
 
-TUNE_ARCH = "${@bb.utils.contains("TUNE_FEATURES", "aarch64", "${TUNE_ARCH_64}", "${TUNE_ARCH_32}" ,d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "aarch64", "${TUNE_PKGARCH_64}", "${TUNE_PKGARCH_32}" ,d)}"
-ABIEXTENSION = "${@bb.utils.contains("TUNE_FEATURES", "aarch64", "${ABIEXTENSION_64}", "${ABIEXTENSION_32}" ,d)}"
-TARGET_FPU = "${@bb.utils.contains("TUNE_FEATURES", "aarch64", "${TARGET_FPU_64}", "${TARGET_FPU_32}" ,d)}"
+TUNE_ARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_ARCH_64}', '${TUNE_ARCH_32}' ,d)}"
+TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_PKGARCH_64}', '${TUNE_PKGARCH_32}' ,d)}"
+ABIEXTENSION = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${ABIEXTENSION_64}', '${ABIEXTENSION_32}' ,d)}"
+TARGET_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TARGET_FPU_64}', '${TARGET_FPU_32}' ,d)}"
diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index 52c07a8..07e005d 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -2,15 +2,15 @@ DEFAULTTUNE ?= "armv4"
 
 TUNEVALID[arm] = "Enable ARM instruction set"
 TUNEVALID[armv4] = "Enable instructions for ARMv4"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv4", " -march=armv4${ARMPKGSFX_THUMB}", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv4', ' -march=armv4${ARMPKGSFX_THUMB}', '', d)}"
 # enable --fix-v4bx when we have armv4 in TUNE_FEATURES, but then disable it when we have also armv5 or thumb
 # maybe we should extend bb.utils.contains to support check for any checkvalues in value, now it does 
 # checkvalues.issubset(val) which cannot be used for negative test of foo neither bar in value
-FIX_V4BX_ARMV4 = "${@bb.utils.contains("TUNE_FEATURES", "armv4", "--fix-v4bx", "", d)}"
-FIX_V4BX_ARMV5 = "${@bb.utils.contains("TUNE_FEATURES", "armv5", "", "${FIX_V4BX_ARMV4}", d)}"
-FIX_V4BX = "${@bb.utils.contains("TUNE_FEATURES", "thumb", "", "${FIX_V4BX_ARMV5}", d)}"
+FIX_V4BX_ARMV4 = "${@bb.utils.contains('TUNE_FEATURES', 'armv4', '--fix-v4bx', '', d)}"
+FIX_V4BX_ARMV5 = "${@bb.utils.contains('TUNE_FEATURES', 'armv5', '', '${FIX_V4BX_ARMV4}', d)}"
+FIX_V4BX = "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '', '${FIX_V4BX_ARMV5}', d)}"
 TARGET_LD_KERNEL_ARCH += "${FIX_V4BX}"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "armv4", "armv4:", "" ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv4', 'armv4:', '' ,d)}"
 
 require conf/machine/include/arm/arch-arm.inc
 require conf/machine/include/arm/feature-arm-thumb.inc
diff --git a/meta/conf/machine/include/arm/arch-armv5-dsp.inc b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
index 524a62a..d132d92 100644
--- a/meta/conf/machine/include/arm/arch-armv5-dsp.inc
+++ b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
@@ -1,4 +1,4 @@
-ARMPKGSFX_DSP = "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "dsp" ], "e", "", d)}"
+ARMPKGSFX_DSP = "${@bb.utils.contains('TUNE_FEATURES', [ 'armv5', 'dsp' ], 'e', '', d)}"
 TUNEVALID[dsp] = "ARM DSP functionality"
 
 require conf/machine/include/arm/arch-armv5.inc
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index 5cceafa..bb5848c 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -2,10 +2,10 @@ DEFAULTTUNE ?= "armv5"
 
 TUNEVALID[armv5] = "Enable instructions for ARMv5"
 TUNECONFLICTS[armv5] = "armv4"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv5", " -march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "armv5", "armv5:", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv5', 'armv5:', '' ,d)}"
 
-ARMPKGSFX_DSP = "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "dsp" ], "e", "", d)}"
+ARMPKGSFX_DSP = "${@bb.utils.contains('TUNE_FEATURES', [ 'armv5', 'dsp' ], 'e', '', d)}"
 
 require conf/machine/include/arm/arch-armv4.inc
 require conf/machine/include/arm/feature-arm-vfp.inc
diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 4b0c5bf..9a3e19e 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -2,8 +2,8 @@ DEFAULTTUNE ?= "armv6"
 
 TUNEVALID[armv6] = "Enable instructions for ARMv6"
 TUNECONFLICTS[armv6] = "armv4 armv5"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv6", " -march=armv6", "", d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "armv6", "armv6:", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=armv6', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6', 'armv6:', '' ,d)}"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index d3b6f64..b962e4c 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -2,8 +2,8 @@ DEFAULTTUNE ?= "armv7a"
 
 TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
 TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv7a", " -march=armv7-a", "", d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "armv7a:", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=armv7-a', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'armv7a:', '' ,d)}"
 
 require conf/machine/include/arm/arch-armv6.inc
 require conf/machine/include/arm/feature-arm-neon.inc
diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta/conf/machine/include/arm/feature-arm-neon.inc
index e8b2b85..e9351f9 100644
--- a/meta/conf/machine/include/arm/feature-arm-neon.inc
+++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
@@ -1,3 +1,3 @@
 TUNEVALID[neon] = "Enable Neon SIMD accelerator unit."
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "neon", bb.utils.contains("TUNE_FEATURES", "vfpv4", " -mfpu=neon-vfpv4", " -mfpu=neon", d), "" , d)}"
-ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "neon", "-neon", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neon', bb.utils.contains('TUNE_FEATURES', 'vfpv4', ' -mfpu=neon-vfpv4', ' -mfpu=neon', d), '' , d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'neon', '-neon', '', d)}"
diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/conf/machine/include/arm/feature-arm-vfp.inc
index 3dfbeac..e23d377 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -1,17 +1,17 @@
 TUNEVALID[vfp] = "Enable Vector Floating Point (vfp) unit."
-ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", "-vfp", "" ,d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', '-vfp', '' ,d)}"
 
 TUNEVALID[vfpv3d16] = "Enable Vector Floating Point Version 3 with 16 registers (vfpv3-d16) unit."
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv3d16", " -mfpu=vfpv3-d16", "", d)}"
-ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv3d16", "-vfpv3d16", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16', ' -mfpu=vfpv3-d16', '', d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16', '-vfpv3d16', '' ,d)}"
 
 TUNEVALID[vfpv3] = "Enable Vector Floating Point Version 3 with 32 registers (vfpv3) unit."
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv3", " -mfpu=vfpv3", "", d)}"
-ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv3", "-vfpv3", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', ' -mfpu=vfpv3', '', d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', '-vfpv3', '' ,d)}"
 
 TUNEVALID[vfpv4] = "Enable Vector Floating Point Version 4 (vfpv4) unit."
-ARMPKGSFX_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "vfpv4", "-vfpv4", "" ,d)}"
+ARMPKGSFX_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', '-vfpv4', '' ,d)}"
 
 TUNEVALID[callconvention-hard] = "Enable EABI hard float call convention, requires VFP."
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
-ARMPKGSFX_EABI .= "${@bb.utils.contains("TUNE_FEATURES", [ "callconvention-hard", "vfp" ], "hf", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'vfp', bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', ' -mfloat-abi=hard', ' -mfloat-abi=softfp', d), '' ,d)}"
+ARMPKGSFX_EABI .= "${@bb.utils.contains('TUNE_FEATURES', [ 'callconvention-hard', 'vfp' ], 'hf', '', d)}"
diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index 02626d3..89d17e7 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -8,33 +8,33 @@ DEFAULTTUNE ?= "mips"
 
 # Endianess
 TUNEVALID[bigendian] = "Enable big-endian mode"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "bigendian", " -meb", " -mel", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', ' -meb', ' -mel', d)}"
 
 # ABI flags
 TUNEVALID[o32] = "MIPS o32 ABI"
 TUNECONFLICTS[o32] = "n32 n64"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "o32", " -mabi=32", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'o32', ' -mabi=32', '', d)}"
 
 TUNEVALID[n32] = "MIPS64 n32 ABI"
 TUNECONFLICTS[n32] = "o32 n64"
-ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "n32", "n32", "" ,d)}"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "n32", " -mabi=n32", "", d)}"
+ABIEXTENSION .= "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'n32', '' ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'n32', ' -mabi=n32', '', d)}"
 
 TUNEVALID[n64] = "MIPS64 n64 ABI"
 TUNECONFLICTS[n64] = "o32 n32"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "n64", " -mabi=64", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'n64', ' -mabi=64', '', d)}"
 
 # Floating point
 TUNEVALID[fpu-hard] = "Use hardware FPU"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", " -mhard-float", " -msoft-float", d)}"
-TARGET_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", "", "soft", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard', ' -mhard-float', ' -msoft-float', d)}"
+TARGET_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard', '', 'soft', d)}"
 
 # Package naming
-MIPSPKGSFX_ENDIAN = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "", "el", d)}"
-MIPSPKGSFX_BYTE = "${@bb.utils.contains("TUNE_FEATURES", "n64" , "64", "", d)}"
-MIPSPKGSFX_BYTE .= "${@bb.utils.contains("TUNE_FEATURES", "n32" , "64", "", d)}"
-MIPSPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard" , "", "-nf", d)}"
-MIPSPKGSFX_ABI = "${@bb.utils.contains("TUNE_FEATURES", "n32", "-n32", "", d)}"
+MIPSPKGSFX_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '', 'el', d)}"
+MIPSPKGSFX_BYTE = "${@bb.utils.contains('TUNE_FEATURES', 'n64' , '64', '', d)}"
+MIPSPKGSFX_BYTE .= "${@bb.utils.contains('TUNE_FEATURES', 'n32' , '64', '', d)}"
+MIPSPKGSFX_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard' , '', '-nf', d)}"
+MIPSPKGSFX_ABI = "${@bb.utils.contains('TUNE_FEATURES', 'n32', '-n32', '', d)}"
 
 TUNE_ARCH = "mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}"
 TUNE_PKGARCH = "${MIPSPKGSFX_VARIANT_tune-${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}"
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
index 036ca3c..9cf6b88 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
@@ -9,15 +9,15 @@ TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
 ABIEXTENSION ?= ""
 
 TUNEVALID[m32] = "Power ELF32 standard ABI"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "m32", " -m32", "", d)}"
-TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "powerpc", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'm32', ' -m32', '', d)}"
+TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'm32', 'powerpc', '', d)}"
 
 TUNEVALID[fpu-hard] = "Use hardware FPU."
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", " -mhard-float", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard', ' -mhard-float', '', d)}"
 
 TUNEVALID[fpu-soft] = "Use software FPU."
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", " -msoft-float", "", d)}"
-TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-soft', ' -msoft-float', '', d)}"
+TARGET_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-soft', 'soft', '', d)}"
 
 TUNEVALID[altivec] = "Altivec"
 
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index 8476dec..bfc107e 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -4,8 +4,8 @@ require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[m64] = "Power ELF64 standard ABI"
 TUNECONFLICTS[m64] = "m32 nf"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "m64", " -m64", "", d)}"
-TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'm64', ' -m64', '', d)}"
+TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', [ 'm64' ], 'powerpc64', '', d)}"
 
 AVAILTUNES += "powerpc64"
 TUNE_FEATURES_tune-powerpc64 ?= "m64 fpu-hard"
diff --git a/meta/conf/machine/include/sh/arch-sh.inc b/meta/conf/machine/include/sh/arch-sh.inc
index 64d4cac..bdfbf52 100644
--- a/meta/conf/machine/include/sh/arch-sh.inc
+++ b/meta/conf/machine/include/sh/arch-sh.inc
@@ -6,4 +6,4 @@ TUNE_ARCH = "${TUNE_ARCH_tune-${DEFAULTTUNE}}"
 TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
 
 TUNEVALID[bigendian] = "Enabled big-endian mode."
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "bigendian", " -mb", " -ml", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', ' -mb', ' -ml', d)}"
diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index 4a131b6..b750fe9 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv6"
 require conf/machine/include/arm/arch-armv6.inc
 
 TUNEVALID[arm1136jfs] = "Enable arm1136jfs specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "arm1136jfs", " -mtune=arm1136jf-s", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', ' -mtune=arm1136jf-s', '', d)}"
 
 AVAILTUNES += "arm1136jfs"
 ARMPKGARCH_tune-arm1136jfs = "arm1136jfs"
diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
index 0a2eae6..5e6d4cb 100644
--- a/meta/conf/machine/include/tune-arm920t.inc
+++ b/meta/conf/machine/include/tune-arm920t.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4t"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[arm920t] = "Enable arm920t specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "arm920t", " -mtune=arm920t", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', ' -mtune=arm920t', '', d)}"
 
 AVAILTUNES += "arm920t"
 ARMPKGARCH_tune-arm920t = "arm920t"
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index 335e4e0..e554941 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5te"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[arm926ejs] = "Enable arm926ejs specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", " -mtune=arm926ej-s", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', ' -mtune=arm926ej-s', '', d)}"
 
 AVAILTUNES += "arm926ejs"
 ARMPKGARCH_tune-arm926ejs = "arm926ejs"
diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
index dee57c9..ebac472 100644
--- a/meta/conf/machine/include/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/tune-arm9tdmi.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4t"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[arm9tdmi] = "Enable arm9tdmi specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "arm9tdmi", " -mtune=arm9tdmi", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', ' -mtune=arm9tdmi', '', d)}"
 
 AVAILTUNES += "arm9tdmi"
 ARMPKGARCH_tune-arm9tdmi = "arm9tdmi"
diff --git a/meta/conf/machine/include/tune-c3.inc b/meta/conf/machine/include/tune-c3.inc
index fafc28a..1b272b2 100644
--- a/meta/conf/machine/include/tune-c3.inc
+++ b/meta/conf/machine/include/tune-c3.inc
@@ -2,7 +2,7 @@ require conf/machine/include/x86/arch-x86.inc
 
 TUNEVALID[c3] = "VIA Cyrix III or VIA C3 specific optimizations"
 TUNECONFLICTS[c3] = "m64 mx32"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "c3", " -march=c3 -mtune=c3", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'c3', ' -march=c3 -mtune=c3', '', d)}"
 
 AVAILTUNES += "c3"
 TUNE_FEATURES_tune-c3 = "${TUNE_FEATURES_tune-x86} c3"
diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
index 9a4cb70..f4ba43f 100644
--- a/meta/conf/machine/include/tune-core2.inc
+++ b/meta/conf/machine/include/tune-core2.inc
@@ -16,7 +16,7 @@ require conf/machine/include/tune-i586.inc
 
 # Extra tune features
 TUNEVALID[core2] = "Enable core2 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "core2", " -march=core2 -mtune=core2 -msse3 -mfpmath=sse", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'core2', ' -march=core2 -mtune=core2 -msse3 -mfpmath=sse', '', d)}"
 
 # Extra tune selections
 AVAILTUNES += "core2-32"
diff --git a/meta/conf/machine/include/tune-corei7.inc b/meta/conf/machine/include/tune-corei7.inc
index 42cf932..d245d9f 100644
--- a/meta/conf/machine/include/tune-corei7.inc
+++ b/meta/conf/machine/include/tune-corei7.inc
@@ -13,7 +13,7 @@ require conf/machine/include/tune-core2.inc
 
 # Extra tune features
 TUNEVALID[corei7] = "Enable corei7 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "corei7", " -march=corei7 -mtune=corei7 -mfpmath=sse -msse4.2", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'corei7', ' -march=corei7 -mtune=corei7 -mfpmath=sse -msse4.2', '', d)}"
 
 # Extra tune selections
 AVAILTUNES += "corei7-32"
diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index 5529777..802161a 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa15", " -mtune=cortex-a15", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mtune=cortex-a15', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon"
diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
index bfc7126..e4d69a0 100644
--- a/meta/conf/machine/include/tune-cortexa17.inc
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa17] = "Enable Cortex-A17 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa17", " -mtune=cortex-a17", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mtune=cortex-a17', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa17 cortexa17t cortexa17-neon cortexa17t-neon"
diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
index 139e65c..c263dac 100644
--- a/meta/conf/machine/include/tune-cortexa5.inc
+++ b/meta/conf/machine/include/tune-cortexa5.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa5", " -mtune=cortex-a5", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mtune=cortex-a5', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon"
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index 9d06910..fa4d722 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa7", " -mtune=cortex-a7", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mtune=cortex-a7', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon"
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 771537f..5621a6b 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa8", " -mtune=cortex-a8", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', ' -mtune=cortex-a8', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon cortexa8t-neon"
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index 700394b..9f45667 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a-neon"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa9] = "Enable Cortex-A9 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa9", " -mtune=cortex-a9", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mtune=cortex-a9', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
diff --git a/meta/conf/machine/include/tune-cortexm1.inc b/meta/conf/machine/include/tune-cortexm1.inc
index 3b65279..794152a 100644
--- a/meta/conf/machine/include/tune-cortexm1.inc
+++ b/meta/conf/machine/include/tune-cortexm1.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexm1] = "Enable Cortex-M1 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexm1", " -mtune=cortex-m1", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm1', ' -mtune=cortex-m1', '', d)}"
 
 AVAILTUNES += "cortexm1"
 ARMPKGARCH_tune-cortexm1 = "cortexm1"
diff --git a/meta/conf/machine/include/tune-cortexm3.inc b/meta/conf/machine/include/tune-cortexm3.inc
index cbc4c0d..bf7f89e 100644
--- a/meta/conf/machine/include/tune-cortexm3.inc
+++ b/meta/conf/machine/include/tune-cortexm3.inc
@@ -3,10 +3,10 @@ DEFAULTTUNE ?= "cortexm3"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexm3] = "Enable Cortex-M3 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexm3", " -mtune=cortex-m3", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm3', ' -mtune=cortex-m3', '', d)}"
 
 TUNEVALID[armv7m] = "Enable Cortex-M3 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv7m", " -march=armv7-m", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', ' -march=armv7-m', '', d)}"
 
 AVAILTUNES += "cortexm3"
 ARMPKGARCH_tune-cortexm3 = "armv7m"
diff --git a/meta/conf/machine/include/tune-cortexr4.inc b/meta/conf/machine/include/tune-cortexr4.inc
index bde649f..a04573c 100644
--- a/meta/conf/machine/include/tune-cortexr4.inc
+++ b/meta/conf/machine/include/tune-cortexr4.inc
@@ -3,10 +3,10 @@ DEFAULTTUNE ?= "cortexr4"
 require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexr4] = "Enable Cortex-R4 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexr4", " -mtune=cortex-r4", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexr4', ' -mtune=cortex-r4', '', d)}"
 
 TUNEVALID[armv7r] = "Enable Cortex-R4 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "armv7r", " -march=armv7-r", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', ' -march=armv7-r', '', d)}"
 
 AVAILTUNES += "cortexr4"
 ARMPKGARCH_tune-cortexr4 = "armv7r"
diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
index b19b438..897b904 100644
--- a/meta/conf/machine/include/tune-ep9312.inc
+++ b/meta/conf/machine/include/tune-ep9312.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ep9312"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[ep9312] = "Enable Intel PXA27x specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ep9312", " -march=ep9312 -mtune=ep9312", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', ' -march=ep9312 -mtune=ep9312', '', d)}"
 
 AVAILTUNES += "ep9312"
 ARMPKGARCH_tune-ep9312 = "ep9312"
diff --git a/meta/conf/machine/include/tune-i586-nlp.inc b/meta/conf/machine/include/tune-i586-nlp.inc
index e30602b..88e5903 100644
--- a/meta/conf/machine/include/tune-i586-nlp.inc
+++ b/meta/conf/machine/include/tune-i586-nlp.inc
@@ -9,7 +9,7 @@ require conf/machine/include/x86/arch-x86.inc
 
 # x86 with no lock prefix
 TUNEVALID[i586-nlp] = "IA32 with Lock Prefix omitted"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "i586-nlp", " -march=i586 -Wa,-momit-lock-prefix=yes", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'i586-nlp', ' -march=i586 -Wa,-momit-lock-prefix=yes', '', d)}"
 
 # Quark tune feature
 AVAILTUNES = "i586-nlp-32"
diff --git a/meta/conf/machine/include/tune-i586.inc b/meta/conf/machine/include/tune-i586.inc
index 5fbb3c7..1ab17bd 100644
--- a/meta/conf/machine/include/tune-i586.inc
+++ b/meta/conf/machine/include/tune-i586.inc
@@ -4,7 +4,7 @@ require conf/machine/include/x86/arch-x86.inc
 
 # Extra tune features
 TUNEVALID[i586] = "Enable i586 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "i586", " -march=i586", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'i586', ' -march=i586', '', d)}"
 
 # Extra tune selections
 AVAILTUNES += "i586"
diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
index 748ca0d..15cce8d 100644
--- a/meta/conf/machine/include/tune-iwmmxt.inc
+++ b/meta/conf/machine/include/tune-iwmmxt.inc
@@ -6,7 +6,7 @@ DEFAULTTUNE ?= "iwmmxt"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "iwmmxt", " -march=iwmmxt -mtune=iwmmxt", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -march=iwmmxt -mtune=iwmmxt', '', d)}"
 
 AVAILTUNES += "iwmmxt"
 ARMPKGARCH_tune-iwmmxt = "iwmmxt"
diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
index ae326ce..ce0445f 100644
--- a/meta/conf/machine/include/tune-mips32.inc
+++ b/meta/conf/machine/include/tune-mips32.inc
@@ -4,7 +4,7 @@ require conf/machine/include/mips/arch-mips.inc
 
 TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
 TUNECONFLICTS[mips32] = "n64 n32"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "mips32", " -march=mips32", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mips32', ' -march=mips32', '', d)}"
 
 AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
 
diff --git a/meta/conf/machine/include/tune-mips32r2.inc b/meta/conf/machine/include/tune-mips32r2.inc
index c9deff8..0e95ec8 100644
--- a/meta/conf/machine/include/tune-mips32r2.inc
+++ b/meta/conf/machine/include/tune-mips32r2.inc
@@ -4,7 +4,7 @@ require conf/machine/include/tune-mips32.inc
 
 TUNEVALID[mips32r2] = "Enable mips32r2 specific processor optimizations"
 TUNECONFLICTS[mips32r2] = "n64 n32"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "mips32r2", " -march=mips32r2", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mips32r2', ' -march=mips32r2', '', d)}"
 
 AVAILTUNES += "mips32r2 mips32r2el"
 
diff --git a/meta/conf/machine/include/tune-octeon.inc b/meta/conf/machine/include/tune-octeon.inc
index f24d9db..b5deb8f 100644
--- a/meta/conf/machine/include/tune-octeon.inc
+++ b/meta/conf/machine/include/tune-octeon.inc
@@ -5,7 +5,7 @@ require conf/machine/include/tune-mips64.inc
 AVAILTUNES += "octeon2 octeon2_64 octeon3 octeon3_64"
 
 TUNEVALID[octeon2] = "Enable optimization related to octeon2 support"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "octeon2", " -march=octeon2 ", "",d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'octeon2', ' -march=octeon2 ', '',d)}"
 
 TUNE_FEATURES_tune-octeon2 = "${TUNE_FEATURES_tune-mips64-n32} octeon2"
 BASE_LIB_tune-octeon2 = "lib32"
@@ -19,7 +19,7 @@ PACKAGE_EXTRA_ARCHS_tune-octeon2_64 = "mips64 octeon2_64"
 
 
 TUNEVALID[octeon3] = "Enable optimization related to octeon3 support"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "octeon3", " -march=octeon3 ", "",d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'octeon3', ' -march=octeon3 ', '',d)}"
 
 TUNE_FEATURES_tune-octeon3 = "${TUNE_FEATURES_tune-mips64-n32} octeon3"
 BASE_LIB_tune-octeon3 = "lib32"
diff --git a/meta/conf/machine/include/tune-power5.inc b/meta/conf/machine/include/tune-power5.inc
index 30be869..a346c30 100644
--- a/meta/conf/machine/include/tune-power5.inc
+++ b/meta/conf/machine/include/tune-power5.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppc64p5"
 require conf/machine/include/powerpc/arch-powerpc64.inc
 
 TUNEVALID[power5] = "Enable IBM Power5 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "power5", " -mcpu=power5", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'power5', ' -mcpu=power5', '', d)}"
 
 AVAILTUNES += "ppcp5 ppc64p5"
 TUNE_FEATURES_tune-ppcp5 = "m32 fpu-hard power5 altivec"
@@ -17,5 +17,5 @@ TUNE_PKGARCH_tune-ppc64p5 = "ppc64p5"
 PACKAGE_EXTRA_ARCHS_tune-ppc64p5 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p5"
 
 # glibc configure options to get power5 specific library
-GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains("TUNE_FEATURES", "power5", "--with-cpu=power5", "", d)}"
-GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains("TUNE_FEATURES", "power5", "--with-cpu=power5", "", d)}"
+GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power5', '--with-cpu=power5', '', d)}"
+GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power5', '--with-cpu=power5', '', d)}"
diff --git a/meta/conf/machine/include/tune-power6.inc b/meta/conf/machine/include/tune-power6.inc
index 7563798..ee200f9 100644
--- a/meta/conf/machine/include/tune-power6.inc
+++ b/meta/conf/machine/include/tune-power6.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppcpr6"
 require conf/machine/include/powerpc/arch-powerpc64.inc
 
 TUNEVALID[power6] = "Enable IBM Power6 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "power6", " -mcpu=power6", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'power6', ' -mcpu=power6', '', d)}"
 
 AVAILTUNES += "ppcp6 ppc64p6"
 TUNE_FEATURES_tune-ppcp6 = "m32 fpu-hard power6 altivec"
@@ -17,5 +17,5 @@ TUNE_PKGARCH_tune-ppc64p6 = "ppc64p6"
 PACKAGE_EXTRA_ARCHS_tune-ppc64p6 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p6"
 
 # glibc configure options to get power6 specific library
-GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains("TUNE_FEATURES", "power6", "--with-cpu=power6", "", d)}"
-GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains("TUNE_FEATURES", "power6", "--with-cpu=power6", "", d)}"
+GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power6', '--with-cpu=power6', '', d)}"
+GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power6', '--with-cpu=power6', '', d)}"
diff --git a/meta/conf/machine/include/tune-power7.inc b/meta/conf/machine/include/tune-power7.inc
index 7069e75..3a27719 100644
--- a/meta/conf/machine/include/tune-power7.inc
+++ b/meta/conf/machine/include/tune-power7.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppcpr7"
 require conf/machine/include/powerpc/arch-powerpc64.inc
 
 TUNEVALID[power7] = "Enable IBM Power7 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "power7", " -mcpu=power7", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'power7', ' -mcpu=power7', '', d)}"
 
 AVAILTUNES += "ppcp7 ppc64p7"
 TUNE_FEATURES_tune-ppcp7 = "m32 fpu-hard power7 altivec"
@@ -17,5 +17,5 @@ TUNE_PKGARCH_tune-ppc64p7 = "ppc64p7"
 PACKAGE_EXTRA_ARCHS_tune-ppc64p7 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p7"
 
 # glibc configure options to get power7 specific library
-GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains("TUNE_FEATURES", "power7", "--with-cpu=power7", "", d)}"
-GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains("TUNE_FEATURES", "power7", "--with-cpu=power7", "", d)}"
+GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power7', '--with-cpu=power7', '', d)}"
+GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power7', '--with-cpu=power7', '', d)}"
diff --git a/meta/conf/machine/include/tune-ppc476.inc b/meta/conf/machine/include/tune-ppc476.inc
index 4ed185d..d0011ff 100644
--- a/meta/conf/machine/include/tune-ppc476.inc
+++ b/meta/conf/machine/include/tune-ppc476.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppc476"
 require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppc476] = "Enable ppc476 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ppc476", " -mcpu=476", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppc476', ' -mcpu=476', '', d)}"
 
 AVAILTUNES += "ppc476"
 TUNE_FEATURES_tune-ppc476 = "m32 fpu-hard ppc476"
@@ -11,4 +11,4 @@ TUNE_PKGARCH_tune-ppc476 = "ppc476"
 PACKAGE_EXTRA_ARCHS_tune-ppc476 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc476"
 
 # glibc configure options to get 476 specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc476", "-with-cpu=476", "", d)}"
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppc476', '-with-cpu=476', '', d)}"
diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
index d744a00..13f60dd 100644
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ b/meta/conf/machine/include/tune-ppc603e.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppc603e"
 require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", " -mcpu=603e", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', ' -mcpu=603e', '', d)}"
 
 AVAILTUNES += "ppc603e"
 TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
@@ -11,4 +11,4 @@ TUNE_PKGARCH_tune-ppc603e = "ppc603e"
 PACKAGE_EXTRA_ARCHS_tune-ppc603e = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc603e"
 
 # glibc configure options to get 603e specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "-with-cpu=603e", "", d)}"
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', '-with-cpu=603e', '', d)}"
diff --git a/meta/conf/machine/include/tune-ppc7400.inc b/meta/conf/machine/include/tune-ppc7400.inc
index 4ac0403..8bfda56 100644
--- a/meta/conf/machine/include/tune-ppc7400.inc
+++ b/meta/conf/machine/include/tune-ppc7400.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppc7400"
 require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppc7400] = "Enable ppc7400 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ppc7400", " -mcpu=7400", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppc7400', ' -mcpu=7400', '', d)}"
 
 AVAILTUNES += "ppc7400"
 TUNE_FEATURES_tune-ppc7400 = "m32 fpu-hard ppc7400 altivec"
@@ -11,4 +11,4 @@ TUNE_PKGARCH_tune-ppc7400 = "ppc7400"
 PACKAGE_EXTRA_ARCHS_tune-ppc7400 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc7400"
 
 # glibc configure options to get 7400 specific library (for sqrt)
-#GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc7400", "--with-cpu=power4", "", d)}"
+#GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppc7400', '--with-cpu=power4', '', d)}"
diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
index 05a9505..af21f60 100644
--- a/meta/conf/machine/include/tune-ppce300c2.inc
+++ b/meta/conf/machine/include/tune-ppce300c2.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppce300c2"
 require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce300c2] = "Enable ppce300c2 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", " -mcpu=e300c2", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce300c2', ' -mcpu=e300c2', '', d)}"
 
 AVAILTUNES += "ppce300c2"
 TUNE_FEATURES_tune-ppce300c2 = "m32 fpu-soft ppce300c2"
diff --git a/meta/conf/machine/include/tune-ppce300c3.inc b/meta/conf/machine/include/tune-ppce300c3.inc
index b19cf22..a3d836c 100644
--- a/meta/conf/machine/include/tune-ppce300c3.inc
+++ b/meta/conf/machine/include/tune-ppce300c3.inc
@@ -9,15 +9,15 @@ TUNEVALID[ppce300c3] = "Enable ppce300c3 specific processor optimizations"
 TUNE_FEATURES_tune-ppce300c3 = "${TUNE_FEATURES_tune-powerpc} ppce300c3"
 TUNE_PKGARCH_tune-ppce300c3 = "ppce300c3"
 PACKAGE_EXTRA_ARCHS_tune-ppce300c3 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce300c3"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3", " -mcpu=e300c3", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce300c3', ' -mcpu=e300c3', '', d)}"
 
 # glibc config options to make use of e300c3 (603e) specific sqrt/sqrtf routines
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3", "--with-cpu=e300c3", "", d)}"
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppce300c3', '--with-cpu=e300c3', '', d)}"
 
 # soft-float
 TUNEVALID[ppce300c3-nf] = "Enable ppce300c3 specific processor optimizations (no fpu)"
 TUNE_FEATURES_tune-ppce300c3-nf = "${TUNE_FEATURES_tune-powerpc-nf} ppce300c3-nf"
 TUNE_PKGARCH_tune-ppce300c3-nf = "ppce300c3-nf"
 PACKAGE_EXTRA_ARCHS_tune-ppce300c3-nf = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppce300c3-nf"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ppce300c3-nf", " -mcpu=e300c3", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce300c3-nf', ' -mcpu=e300c3', '', d)}"
 
diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
index 70c1f8b..96073d2 100644
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ b/meta/conf/machine/include/tune-ppce500.inc
@@ -3,15 +3,15 @@ DEFAULTTUNE ?= "ppce500"
 require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500] = "Enable ppce500 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500", " -mcpu=8540", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce500', ' -mcpu=8540', '', d)}"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500", "spe" ], " -mabi=spe -mspe -mfloat-gprs=single", "", d)}"
-TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500" , "spe" ], "ppc-efs", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', [ 'ppce500', 'spe' ], ' -mabi=spe -mspe -mfloat-gprs=single', '', d)}"
+TARGET_FPU .= "${@bb.utils.contains('TUNE_FEATURES', [ 'ppce500' , 'spe' ], 'ppc-efs', '', d)}"
 
 # spe is defined potentially in two places, so we want to be sure it will
 # only write spe once to the ABIEXTENSIONS field.
-SPEABIEXTENSION = "${@bb.utils.contains("TUNE_FEATURES", "spe", "spe", "", d)}"
+SPEABIEXTENSION = "${@bb.utils.contains('TUNE_FEATURES', 'spe', 'spe', '', d)}"
 ABIEXTENSION .= "${SPEABIEXTENSION}"
 
 AVAILTUNES += "ppce500"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
index 744d8e5..a1ca9be 100644
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/tune-ppce500mc.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppce500mc"
 require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", " -mcpu=e500mc", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce500mc', ' -mcpu=e500mc', '', d)}"
 
 AVAILTUNES += "ppce500mc"
 TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
@@ -11,4 +11,4 @@ TUNE_PKGARCH_tune-ppce500mc = "ppce500mc"
 PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce500mc"
 
 # glibc configure options to get e500mc specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "-with-cpu=e500mc", "", d)}"
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppce500mc', '-with-cpu=e500mc', '', d)}"
diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
index d014d70..20a5f25 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -3,15 +3,15 @@ DEFAULTTUNE ?= "ppce500v2"
 require conf/machine/include/powerpc/arch-powerpc.inc
 
 TUNEVALID[ppce500v2] = "Enable ppce500v2 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", " -mcpu=8548", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce500v2', ' -mcpu=8548', '', d)}"
 
 TUNEVALID[spe] = "Enable SPE ABI extensions"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500v2", "spe" ], " -mabi=spe -mspe -mfloat-gprs=double", "", d)}"
-TARGET_FPU .= "${@bb.utils.contains("TUNE_FEATURES", [ "ppce500v2" , "spe" ], "ppc-efd", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', [ 'ppce500v2', 'spe' ], ' -mabi=spe -mspe -mfloat-gprs=double', '', d)}"
+TARGET_FPU .= "${@bb.utils.contains('TUNE_FEATURES', [ 'ppce500v2' , 'spe' ], 'ppc-efd', '', d)}"
 
 # spe is defined potentially in two places, so we want to be sure it will
 # only write spe once to the ABIEXTENSIONS field.
-SPEABIEXTENSION = "${@bb.utils.contains("TUNE_FEATURES", "spe", "spe", "", d)}"
+SPEABIEXTENSION = "${@bb.utils.contains('TUNE_FEATURES', 'spe', 'spe', '', d)}"
 ABIEXTENSION .= "${SPEABIEXTENSION}"
 
 AVAILTUNES += "ppce500v2"
diff --git a/meta/conf/machine/include/tune-ppce5500.inc b/meta/conf/machine/include/tune-ppce5500.inc
index 25231ef..ace2614 100644
--- a/meta/conf/machine/include/tune-ppce5500.inc
+++ b/meta/conf/machine/include/tune-ppce5500.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppce5500"
 require conf/machine/include/powerpc/arch-powerpc64.inc
 
 TUNEVALID[e5500] = "Enable Freescale e5500 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "e5500", " -mcpu=e5500", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'e5500', ' -mcpu=e5500', '', d)}"
 
 AVAILTUNES += "ppce5500 ppc64e5500"
 TUNE_FEATURES_tune-ppce5500 = "m32 fpu-hard e5500"
@@ -17,4 +17,4 @@ TUNE_PKGARCH_tune-ppc64e5500 = "ppc64e5500"
 PACKAGE_EXTRA_ARCHS_tune-ppc64e5500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64e5500"
 
 # glibc configure options to get e5500 specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "e5500", "--with-cpu=e5500", "", d)}"
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'e5500', '--with-cpu=e5500', '', d)}"
diff --git a/meta/conf/machine/include/tune-ppce6500.inc b/meta/conf/machine/include/tune-ppce6500.inc
index ea743a3..da1e864 100644
--- a/meta/conf/machine/include/tune-ppce6500.inc
+++ b/meta/conf/machine/include/tune-ppce6500.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ppce6500"
 require conf/machine/include/powerpc/arch-powerpc64.inc
 
 TUNEVALID[e6500] = "Enable Freescale e6500 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "e6500", " -mcpu=e6500", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'e6500', ' -mcpu=e6500', '', d)}"
 
 AVAILTUNES += "ppce6500 ppc64e6500"
 TUNE_FEATURES_tune-ppce6500 = "m32 fpu-hard e6500 altivec"
@@ -17,5 +17,5 @@ TUNE_PKGARCH_tune-ppc64e6500 = "ppc64e6500"
 PACKAGE_EXTRA_ARCHS_tune-ppc64e6500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64e6500"
 
 # glibc configure options to get e6500 specific library
-GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains("TUNE_FEATURES", "e6500", "--with-cpu=e6500", "", d)}"
-GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains("TUNE_FEATURES", "e6500", "--with-cpu=e6500", "", d)}"
+GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'e6500', '--with-cpu=e6500', '', d)}"
+GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'e6500', '--with-cpu=e6500', '', d)}"
diff --git a/meta/conf/machine/include/tune-sh3.inc b/meta/conf/machine/include/tune-sh3.inc
index c5ed7ba..80df9a0 100644
--- a/meta/conf/machine/include/tune-sh3.inc
+++ b/meta/conf/machine/include/tune-sh3.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "sh3"
 require conf/machine/include/sh/arch-sh.inc
 
 TUNEVALID[sh3] = "Enable SH3 optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "sh3", " -m3", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'sh3', ' -m3', '', d)}"
 
 AVAILTUNES += "sh3 sh3eb"
 TUNE_FEATURES_tune-sh3 = "sh3"
diff --git a/meta/conf/machine/include/tune-sh4.inc b/meta/conf/machine/include/tune-sh4.inc
index 56e23b9..4160c30 100644
--- a/meta/conf/machine/include/tune-sh4.inc
+++ b/meta/conf/machine/include/tune-sh4.inc
@@ -4,13 +4,13 @@ DEFAULTTUNE ?= "sh4"
 require conf/machine/include/sh/arch-sh.inc
 
 TUNEVALID[sh4] = "Enable SH4 optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "sh4", " -m4", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'sh4', ' -m4', '', d)}"
 
 # NOTE: If you want to optimize to sh4a, conf/machine/include/tune-sh4a.inc.
 # But it is not compatible for sh4.
 # The binary optimized by m4a doesn't operate on sh4. It works on sh4a only.
 TUNEVALID[sh4a] = "Enable SH4a optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "sh4a", " -m4a", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'sh4a', ' -m4a', '', d)}"
 
 AVAILTUNES += "sh4 sh4eb sh4a sh4aeb"
 TUNE_FEATURES_tune-sh4 = "sh4"
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index ea2fba8..7b2fa8e 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4"
 require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[strongarm] = "Enable Strongarm 1100 series processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "strongarm", " -mtune=strongarm1100", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', ' -mtune=strongarm1100', '', d)}"
 
 AVAILTUNES += "strongarm"
 ARMPKGARCH_tune-strongarm = "strongarm"
diff --git a/meta/conf/machine/include/tune-thunderx.inc b/meta/conf/machine/include/tune-thunderx.inc
index 40de61d..4888d0c 100644
--- a/meta/conf/machine/include/tune-thunderx.inc
+++ b/meta/conf/machine/include/tune-thunderx.inc
@@ -5,7 +5,7 @@ AVAILTUNES += "thunderx thunderx_be"
 
 TUNEVALID[thunderx] = "Enable instructions for Cavium ThunderX"
 
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "thunderx", " -mcpu=thunderx ", "",d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thunderx', ' -mcpu=thunderx ', '',d)}"
 
 ARMPKGARCH_tune-thunderx ?= "thunderx"
 ARMPKGARCH_tune-thunderx_be ?= "thunderx_be"
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 0c5ca8d..2a0610f 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5te"
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[xscale] = "Enable PXA255/PXA26x Xscale specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "xscale", " -mtune=xscale", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'xscale', ' -mtune=xscale', '', d)}"
 
 AVAILTUNES += "xscale"
 ARMPKGARCH_tune-xscale = "xscale"
diff --git a/meta/conf/machine/include/x86/arch-x86.inc b/meta/conf/machine/include/x86/arch-x86.inc
index 298bddc..400da1a 100644
--- a/meta/conf/machine/include/x86/arch-x86.inc
+++ b/meta/conf/machine/include/x86/arch-x86.inc
@@ -12,24 +12,24 @@ TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
 # ELF32 ABI
 TUNEVALID[m32] = "IA32 ELF32 standard ABI"
 TUNECONFLICTS[m32] = "m64 mx32"
-TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "${X86ARCH32}", "" ,d)}"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "m32", " -m32", "", d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "m32", "x86:", "" ,d)}"
+TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${X86ARCH32}', '' ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'm32', ' -m32', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'm32', 'x86:', '' ,d)}"
 
 # x32 ABI
 TUNEVALID[mx32] = "IA32e (x86_64) ELF32 standard ABI"
 TUNECONFLICTS[mx32] = "m64 m32"
-TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "${X86ARCH64}", "" ,d)}"
-ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", " -mx32", "", d)}"
-TUNE_LDARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}"
-TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
+TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '${X86ARCH64}', '' ,d)}"
+ABIEXTENSION .= "${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x32', '' ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mx32', ' -mx32', '', d)}"
+TUNE_LDARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-m elf32_x86_64', '', d)}"
+TUNE_ASARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-x32', '', d)}"
 
 # ELF64 ABI
 TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
 TUNECONFLICTS[m64] = "m32 mx32"
-TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m64", "${X86ARCH64}", "" ,d)}"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "m64", " -m64", "", d)}"
+TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'm64', '${X86ARCH64}', '' ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'm64', ' -m64', '', d)}"
 
 # Default Tune configurations
 AVAILTUNES += "x86"
-- 
2.6.3


