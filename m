Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web12.36228.1601298362361119338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 06:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=e2wgozoC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id b13so386338qvl.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 06:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UUs4m4nXfDs+5TqxJKkeccpoF9yZUGQM2iKpfML55mQ=;
        b=e2wgozoCqkBC/xMTLUdjWvFMbaThi2L1iZckLtSaCUuzl8WTelY1DZ3j9V65L8onIC
         JIek9lVyiXJhuyVdxt02ruLvs8OAIieBJ9oICRG9CbK58UmMrquPS7lYpbsYR7UdCtCR
         AmYPyNDP6R6Wd3Cl6S/H4w/3nD0h7tHOwPBnDgpDJ+jcdLkEXVJF97L80nEmq7JmCpFh
         9s9AoQRbKHA2qkVxNYvAHpZ1zBkjuvirgnf58NPHN4FZ4XF5n0+utXfPbNDKmT8bbUl0
         9or54HHB3urKa2oqPtANmnBOxZoVZUusPpIWMcFzSQgC0n7iBnvOJuAyv3I4iqDjJvU3
         oYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UUs4m4nXfDs+5TqxJKkeccpoF9yZUGQM2iKpfML55mQ=;
        b=QTOZAn2f3N3JLJ/zHa+TPPoSN6+ROnlk0wsOYEsdnQ6Jx/8pbKgZ4re/k/KYmkwtiU
         MrH+vWwJ8G5vNh4eB7ilxq9TAVk9ZP3CuLCaQtwHE2tmncagEqCMjdByFUbknJFNj95w
         llusImUeLopPM4F4/gq/47rM7jkacNUU50pdRuc0dS8zY2uaM6jA5q9sgLy0ukwj9uqJ
         BwWYYGznQB2HzLwLwsvTJzDk+DzMQ6+TPLM9Lg2NFS4QqHddAwzoUMHfJ4dzpEYYJtxe
         V21R1csQgzAJMwYsIwEPWbp4MuvgRUcreNuMhg9vaMhBfyP79+38D/KTyZ1ehrfB4JsQ
         zq2Q==
X-Gm-Message-State: AOAM533+AVkwFe3a7Y1SPo0ZhhWG05hAJcEoxvUMxGUtcPDZWxzAIb0P
	Q1KR2nB5wCC/dP2/P7vmH1LHf5yRTS6H56Qx
X-Google-Smtp-Source: ABdhPJxnWn3E2QHQQ0DEcPq1dWGgFrQy+Z+DPWwYw1cU2vzZlFDe9lhCK7kGG5S1jlQuB+UHI+bZDw==
X-Received: by 2002:a0c:f6c4:: with SMTP id d4mr11559348qvo.41.1601298360210;
        Mon, 28 Sep 2020 06:06:00 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id f3sm1097663qtg.71.2020.09.28.06.05.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:05:59 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v4 1/6] Space-comma Cleanups
Date: Mon, 28 Sep 2020 09:05:46 -0400
Message-Id: <20200928130551.21346-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200928130551.21346-1-jon.mason@arm.com>
References: <20200928130551.21346-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multiple files have " ," instead of ", " in expressions.  This changes
them to conform to the way the rest of them are done.

Found and corrected via:
git ls-files | xargs sed --follow-symlinks -i 's/ ,d/, d/g'

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/classes/linuxloader.bbclass                 |  2 +-
 meta/classes/rootfs_rpm.bbclass                  |  2 +-
 meta/conf/machine/include/arm/arch-arm64.inc     | 10 +++++-----
 meta/conf/machine/include/arm/arch-armv4.inc     |  2 +-
 meta/conf/machine/include/arm/arch-armv5.inc     |  2 +-
 meta/conf/machine/include/arm/arch-armv6.inc     |  2 +-
 meta/conf/machine/include/arm/arch-armv6m.inc    |  2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc    |  2 +-
 meta/conf/machine/include/arm/arch-armv7ve.inc   |  2 +-
 meta/conf/machine/include/arm/arch-armv8-2a.inc  |  2 +-
 meta/conf/machine/include/arm/arch-armv8a.inc    |  2 +-
 meta/conf/machine/include/mips/arch-mips.inc     | 16 ++++++++--------
 meta/conf/machine/include/tune-arm1136jf-s.inc   |  2 +-
 meta/conf/machine/include/tune-arm1176jz-s.inc   |  2 +-
 meta/conf/machine/include/tune-arm920t.inc       |  2 +-
 meta/conf/machine/include/tune-arm926ejs.inc     |  2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc      |  2 +-
 meta/conf/machine/include/tune-cortexa15.inc     |  2 +-
 meta/conf/machine/include/tune-cortexa17.inc     |  2 +-
 meta/conf/machine/include/tune-cortexa5.inc      |  2 +-
 .../machine/include/tune-cortexa57-cortexa53.inc |  2 +-
 meta/conf/machine/include/tune-cortexa7.inc      |  2 +-
 .../machine/include/tune-cortexa72-cortexa53.inc |  2 +-
 .../machine/include/tune-cortexa73-cortexa53.inc |  2 +-
 meta/conf/machine/include/tune-cortexa8.inc      |  2 +-
 meta/conf/machine/include/tune-cortexa9.inc      |  2 +-
 meta/conf/machine/include/tune-ep9312.inc        |  2 +-
 meta/conf/machine/include/tune-iwmmxt.inc        |  2 +-
 meta/conf/machine/include/tune-strongarm1100.inc |  2 +-
 meta/conf/machine/include/tune-xscale.inc        |  2 +-
 meta/conf/machine/include/x86/arch-x86.inc       | 12 ++++++------
 meta/recipes-core/images/core-image-minimal.bb   |  2 +-
 .../qemu/qemu-system-native_5.1.0.bb             |  2 +-
 meta/recipes-devtools/qemu/qemu_5.1.0.bb         |  4 ++--
 meta/recipes-graphics/vulkan/vulkan-demos_git.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb     |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb  |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb  |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb     |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.8.bb     |  4 ++--
 meta/recipes-multimedia/libpng/libpng_1.6.37.bb  |  2 +-
 41 files changed, 60 insertions(+), 60 deletions(-)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index 176fd89fdb9b..720e5dfad4c5 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -4,7 +4,7 @@ def get_musl_loader_arch(d):
 
     targetarch = d.getVar("TARGET_ARCH")
     if targetarch.startswith("microblaze"):
-        ldso_arch = "microblaze${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '', 'el' ,d)}"
+        ldso_arch = "microblaze${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '', 'el', d)}"
     elif targetarch.startswith("mips"):
         ldso_arch = "mips${ABIEXTENSION}${MIPSPKGSFX_BYTE}${MIPSPKGSFX_R6}${MIPSPKGSFX_ENDIAN}${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}"
     elif targetarch == "powerpc":
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 51f89ea99023..82584f386cb0 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -9,7 +9,7 @@ export STAGING_INCDIR
 export STAGING_LIBDIR
 
 # Add 100Meg of extra space for dnf
-IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("PACKAGE_INSTALL", "dnf", " + 102400", "" ,d)}"
+IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("PACKAGE_INSTALL", "dnf", " + 102400", "", d)}"
 
 # Dnf is python based, so be sure python3-native is available to us.
 EXTRANATIVEPATH += "python3-native"
diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 6d5b22fff081..8a7de8e78f7e 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[aarch64] = "Enable instructions for aarch64"
 
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'aarch64:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'aarch64:', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "aarch64 aarch64_be"
@@ -32,7 +32,7 @@ TUNE_PKGARCH_32 = "${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EA
 ABIEXTENSION_32 = "eabi"
 TARGET_FPU_32 = "${@d.getVar('TUNE_CCARGS_MFLOAT') or 'soft'}"
 
-TUNE_ARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_ARCH_64}', '${TUNE_ARCH_32}' ,d)}"
-TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_PKGARCH_64}', '${TUNE_PKGARCH_32}' ,d)}"
-ABIEXTENSION = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${ABIEXTENSION_64}', '${ABIEXTENSION_32}' ,d)}"
-TARGET_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TARGET_FPU_64}', '${TARGET_FPU_32}' ,d)}"
+TUNE_ARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_ARCH_64}', '${TUNE_ARCH_32}', d)}"
+TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_PKGARCH_64}', '${TUNE_PKGARCH_32}', d)}"
+ABIEXTENSION = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${ABIEXTENSION_64}', '${ABIEXTENSION_32}', d)}"
+TARGET_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TARGET_FPU_64}', '${TARGET_FPU_32}', d)}"
diff --git a/meta/conf/machine/include/arm/arch-armv4.inc b/meta/conf/machine/include/arm/arch-armv4.inc
index 47a7ad2830f2..fac2bdf95229 100644
--- a/meta/conf/machine/include/arm/arch-armv4.inc
+++ b/meta/conf/machine/include/arm/arch-armv4.inc
@@ -10,7 +10,7 @@ FIX_V4BX_ARMV4 = "${@bb.utils.contains('TUNE_FEATURES', 'armv4', '--fix-v4bx', '
 FIX_V4BX_ARMV5 = "${@bb.utils.contains('TUNE_FEATURES', 'armv5', '', '${FIX_V4BX_ARMV4}', d)}"
 FIX_V4BX = "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '', '${FIX_V4BX_ARMV5}', d)}"
 TARGET_LD_KERNEL_ARCH += "${FIX_V4BX}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv4', 'armv4:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv4', 'armv4:', '', d)}"
 
 require conf/machine/include/arm/arch-arm.inc
 require conf/machine/include/arm/feature-arm-thumb.inc
diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
index f9068af9deb1..52d85901651c 100644
--- a/meta/conf/machine/include/arm/arch-armv5.inc
+++ b/meta/conf/machine/include/arm/arch-armv5.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5"
 TUNEVALID[armv5] = "Enable instructions for ARMv5"
 TUNECONFLICTS[armv5] = "armv4"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv5', ' -march=armv5t${ARMPKGSFX_DSP}', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv5', 'armv5:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv5', 'armv5:', '', d)}"
 
 require conf/machine/include/arm/arch-armv4.inc
 require conf/machine/include/arm/feature-arm-vfp.inc
diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
index 6c838e999cf2..7531890e2ebd 100644
--- a/meta/conf/machine/include/arm/arch-armv6.inc
+++ b/meta/conf/machine/include/arm/arch-armv6.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv6hf"
 TUNEVALID[armv6] = "Enable instructions for ARMv6"
 TUNECONFLICTS[armv6] = "armv4 armv5"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6', ' -march=armv6', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6', 'armv6:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6', 'armv6:', '', d)}"
 
 require conf/machine/include/arm/arch-armv5-dsp.inc
 
diff --git a/meta/conf/machine/include/arm/arch-armv6m.inc b/meta/conf/machine/include/arm/arch-armv6m.inc
index 68768106c6d7..739550d0051b 100755
--- a/meta/conf/machine/include/arm/arch-armv6m.inc
+++ b/meta/conf/machine/include/arm/arch-armv6m.inc
@@ -8,7 +8,7 @@ TUNECONFLICTS[armv6m] = "armv4 armv5 armv6 armv7a"
 # Use armv6s-m instead of armv6-m to avoid gcc bug "SVC is not permitted on this architecture".
 # SVC is a valid instruction.
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6m', ' -march=armv6s-m', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6m', 'armv6m:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6m', 'armv6m:', '', d)}"
 
 require conf/machine/include/arm/arch-armv5.inc
 
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
index 199e63f98ab4..d795b867fd51 100644
--- a/meta/conf/machine/include/arm/arch-armv7a.inc
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc
@@ -4,7 +4,7 @@ ARM_INSTRUCTION_SET ?= "thumb"
 TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
 TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', ' -march=armv7-a', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'armv7a:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'armv7a:', '', d)}"
 
 require conf/machine/include/arm/arch-armv6.inc
 require conf/machine/include/arm/feature-arm-neon.inc
diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
index fc172d0cb0c9..d9d92f612b53 100644
--- a/meta/conf/machine/include/arm/arch-armv7ve.inc
+++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7vethf"
 TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
 TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:', '', d)}"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
diff --git a/meta/conf/machine/include/arm/arch-armv8-2a.inc b/meta/conf/machine/include/arm/arch-armv8-2a.inc
index 1c095256d185..4129689cf973 100644
--- a/meta/conf/machine/include/arm/arch-armv8-2a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8-2a.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv8-2a"
 TUNEVALID[armv8-2a] = "Enable instructions for ARMv8-a"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', ' -march=armv8.2-a', '', d)}"
 # TUNE crypto will be handled by arch-armv8a.inc below
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', 'armv8-2a:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', 'armv8-2a:', '', d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
index f810a1e8fc98..6e92bdb7a429 100644
--- a/meta/conf/machine/include/arm/arch-armv8a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc
@@ -6,7 +6,7 @@ TUNEVALID[crc] = "Enable instructions for ARMv8-a Cyclic Redundancy Check (CRC)"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crc', '+crc', '', d)}"
 TUNEVALID[crypto] = "Enable instructions for ARMv8-a cryptographic"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', 'armv8a:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', 'armv8a:', '', d)}"
 
 require conf/machine/include/arm/arch-arm64.inc
 
diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index 2f625119cb13..b45989a77578 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -17,7 +17,7 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'o32', ' -mabi=32', '', d)
 
 TUNEVALID[n32] = "MIPS64 n32 ABI"
 TUNECONFLICTS[n32] = "o32 n64"
-ABIEXTENSION .= "${@bb.utils.filter('TUNE_FEATURES', 'n32' ,d)}"
+ABIEXTENSION .= "${@bb.utils.filter('TUNE_FEATURES', 'n32', d)}"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'n32', ' -mabi=n32', '', d)}"
 
 # user mode qemu doesn't support mips64 n32: "Invalid ELF image for this architecture"
@@ -52,13 +52,13 @@ TUNE_ARCH = "mips${MIPSPKGSFX_32R6}${MIPSPKGSFX_64R6}${MIPSPKGSFX_BYTE}${MIPSPKG
 TUNE_PKGARCH = "${MIPSPKGSFX_VARIANT_tune-${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}"
 
 # Various Global Machine Overrides
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n64', 'mipsarchn64${MIPSPKGSFX_ENDIAN2}:', '' ,d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'o32', 'mipsarcho32${MIPSPKGSFX_ENDIAN2}:', '' ,d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'mipsarchn32${MIPSPKGSFX_ENDIAN2}:', '' ,d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n64', 'mipsarchn64:', '' ,d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'o32', 'mipsarcho32:', '' ,d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'mipsarchn32:', '' ,d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'r6', 'mipsarchr6:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n64', 'mipsarchn64${MIPSPKGSFX_ENDIAN2}:', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'o32', 'mipsarcho32${MIPSPKGSFX_ENDIAN2}:', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'mipsarchn32${MIPSPKGSFX_ENDIAN2}:', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n64', 'mipsarchn64:', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'o32', 'mipsarcho32:', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'mipsarchn32:', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'r6', 'mipsarchr6:', '', d)}"
 MACHINEOVERRIDES =. "mipsarch${MIPSPKGSFX_ENDIAN2}:"
 MACHINEOVERRIDES =. "mipsarch:"
 
diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
index 173cb468ef14..2bb8c7c154de 100644
--- a/meta/conf/machine/include/tune-arm1136jf-s.inc
+++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv6.inc
 
 TUNEVALID[arm1136jfs] = "Enable arm1136jfs specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', ' -mcpu=arm1136jf-s', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', 'armv6:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', 'armv6:', '', d)}"
 
 AVAILTUNES += "arm1136jfs arm1136jfshf"
 ARMPKGARCH_tune-arm1136jfs = "arm1136jfs"
diff --git a/meta/conf/machine/include/tune-arm1176jz-s.inc b/meta/conf/machine/include/tune-arm1176jz-s.inc
index a63d5856981e..a74781f5e66d 100644
--- a/meta/conf/machine/include/tune-arm1176jz-s.inc
+++ b/meta/conf/machine/include/tune-arm1176jz-s.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv6.inc
 
 TUNEVALID[arm1176jzs] = "Enable arm1176jzs specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1176jzs', ' -mcpu=arm1176jz-s', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm1176jzs', 'armv6:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm1176jzs', 'armv6:', '', d)}"
 
 AVAILTUNES += "arm1176jzs"
 ARMPKGARCH_tune-arm1176jzs = "arm1176jzs"
diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
index 42e8ed2b516f..62a1a7e85882 100644
--- a/meta/conf/machine/include/tune-arm920t.inc
+++ b/meta/conf/machine/include/tune-arm920t.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[arm920t] = "Enable arm920t specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', ' -mcpu=arm920t', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', 'armv4:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', 'armv4:', '', d)}"
 
 AVAILTUNES += "arm920t"
 ARMPKGARCH_tune-arm920t = "arm920t"
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
index 563d53bc4e36..5f090ba2f87c 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[arm926ejs] = "Enable arm926ejs specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', ' -mcpu=arm926ej-s', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', 'armv5:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', 'armv5:', '', d)}"
 
 AVAILTUNES += "arm926ejs"
 ARMPKGARCH_tune-arm926ejs = "arm926ejs"
diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
index e03a8b86a098..6160664fd045 100644
--- a/meta/conf/machine/include/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/tune-arm9tdmi.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[arm9tdmi] = "Enable arm9tdmi specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', ' -mcpu=arm9tdmi', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', 'armv4:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', 'armv4:', '', d)}"
 
 AVAILTUNES += "arm9tdmi"
 ARMPKGARCH_tune-arm9tdmi = "arm9tdmi"
diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
index d53403af3561..0457c2d9fa81 100644
--- a/meta/conf/machine/include/tune-cortexa15.inc
+++ b/meta/conf/machine/include/tune-cortexa15.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mcpu=cortex-a15', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', 'armv7ve:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', 'armv7ve:', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon cortexa15-neon-vfpv4 cortexa15t-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
index 3ffc02bf9f2e..6a2107f653df 100644
--- a/meta/conf/machine/include/tune-cortexa17.inc
+++ b/meta/conf/machine/include/tune-cortexa17.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa17] = "Enable Cortex-A17 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mcpu=cortex-a17', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', 'armv7ve:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', 'armv7ve:', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa17 cortexa17t cortexa17-neon cortexa17t-neon cortexa17-neon-vfpv4 cortexa17t-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
index 496739e45492..923b758c41dc 100644
--- a/meta/conf/machine/include/tune-cortexa5.inc
+++ b/meta/conf/machine/include/tune-cortexa5.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mcpu=cortex-a5', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', 'armv7a:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', 'armv7a:', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon cortexa5-neon-vfpv4 cortexa5t-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
index 5880bf203231..d86be7272f99 100644
--- a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "cortexa57-cortexa53"
 TUNEVALID[cortexa57-cortexa53] = "Enable big.LITTLE Cortex-A57.Cortex-A53 specific processor optimizations"
 TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", " -mcpu=cortex-a57.cortex-a53", "", d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", "cortexa57-cortexa53:", "" ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", "cortexa57-cortexa53:", "", d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
index 34a77b4788a2..05081dcbd81c 100644
--- a/meta/conf/machine/include/tune-cortexa7.inc
+++ b/meta/conf/machine/include/tune-cortexa7.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mcpu=cortex-a7', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', 'armv7ve:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', 'armv7ve:', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon cortexa7-neon-vfpv4 cortexa7t-neon-vfpv4"
diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
index feb1df5c178d..64bb8337c399 100644
--- a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
@@ -3,7 +3,7 @@ DEFAULTTUNE ?= "cortexa72-cortexa53"
 TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE Cortex-A72.Cortex-A53 specific processor optimizations"
 TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mcpu=cortex-a72.cortex-a53", "", d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "" ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "", d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
 
diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
index 1c221999f408..4ec0f64d0ef9 100644
--- a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
+++ b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "cortexa73-cortexa53"
 
 TUNEVALID[cortexa73-cortexa53] = "Enable big.LITTLE Cortex-A73.Cortex-A53 specific processor optimizations"
 TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
-MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", "cortexa73-cortexa53:", "" ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", "cortexa73-cortexa53:", "", d)}"
 TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", " -mcpu=cortex-a73.cortex-a53", "", d)}"
 
 require conf/machine/include/arm/arch-armv8a.inc
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
index 6551ba495299..f27bfb8d67b7 100644
--- a/meta/conf/machine/include/tune-cortexa8.inc
+++ b/meta/conf/machine/include/tune-cortexa8.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', ' -mcpu=cortex-a8', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', 'armv7a:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', 'armv7a:', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon cortexa8t-neon"
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
index ecc7908cd76c..0eb8f3b9d36d 100644
--- a/meta/conf/machine/include/tune-cortexa9.inc
+++ b/meta/conf/machine/include/tune-cortexa9.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv7a.inc
 
 TUNEVALID[cortexa9] = "Enable Cortex-A9 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mcpu=cortex-a9', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', 'armv7a:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', 'armv7a:', '', d)}"
 
 # Little Endian base configs
 AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
index be20eb363b15..11fd266ba0ca 100644
--- a/meta/conf/machine/include/tune-ep9312.inc
+++ b/meta/conf/machine/include/tune-ep9312.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[ep9312] = "Enable Cirrus Logic EP9312 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', ' -march=ep9312 -mcpu=ep9312', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', 'armv4:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', 'armv4:', '', d)}"
 
 AVAILTUNES += "ep9312"
 ARMPKGARCH_tune-ep9312 = "ep9312"
diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
index 9a6cd23c99bb..81ff4c9ae205 100644
--- a/meta/conf/machine/include/tune-iwmmxt.inc
+++ b/meta/conf/machine/include/tune-iwmmxt.inc
@@ -7,7 +7,7 @@ require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -mcpu=iwmmxt', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', 'armv5:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', 'armv5:', '', d)}"
 
 AVAILTUNES += "iwmmxt"
 ARMPKGARCH_tune-iwmmxt = "iwmmxt"
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
index e978e925d2cc..947996584342 100644
--- a/meta/conf/machine/include/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/tune-strongarm1100.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv4.inc
 
 TUNEVALID[strongarm] = "Enable Strongarm 1100 series processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', ' -mcpu=strongarm1100', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', 'armv4:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', 'armv4:', '', d)}"
 
 AVAILTUNES += "strongarm"
 ARMPKGARCH_tune-strongarm = "strongarm"
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
index 19d5e13e6101..aeac36528401 100644
--- a/meta/conf/machine/include/tune-xscale.inc
+++ b/meta/conf/machine/include/tune-xscale.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv5-dsp.inc
 
 TUNEVALID[xscale] = "Enable PXA255/PXA26x Xscale specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'xscale', ' -mcpu=xscale', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'xscale', 'armv5:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'xscale', 'armv5:', '', d)}"
 
 AVAILTUNES += "xscale"
 ARMPKGARCH_tune-xscale = "xscale"
diff --git a/meta/conf/machine/include/x86/arch-x86.inc b/meta/conf/machine/include/x86/arch-x86.inc
index 70814b8d4d30..2edb360b7d9a 100644
--- a/meta/conf/machine/include/x86/arch-x86.inc
+++ b/meta/conf/machine/include/x86/arch-x86.inc
@@ -12,26 +12,26 @@ TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
 # ELF32 ABI
 TUNEVALID[m32] = "IA32 ELF32 standard ABI"
 TUNECONFLICTS[m32] = "m64 mx32"
-TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${X86ARCH32}', '' ,d)}"
+TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${X86ARCH32}', '', d)}"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'm32', ' -m32', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'm32', 'x86:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'm32', 'x86:', '', d)}"
 
 # x32 ABI
 TUNEVALID[mx32] = "IA32e (x86_64) ELF32 standard ABI"
 TUNECONFLICTS[mx32] = "m64 m32"
-TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '${X86ARCH64}', '' ,d)}"
-ABIEXTENSION .= "${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x32', '' ,d)}"
+TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '${X86ARCH64}', '', d)}"
+ABIEXTENSION .= "${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x32', '', d)}"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mx32', ' -mx32', '', d)}"
 TUNE_LDARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-m elf32_x86_64', '', d)}"
 TUNE_ASARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-x32', '', d)}"
 # user mode qemu doesn't support x32
 MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'qemu-usermode', '', d)}"
-MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x86-x32:', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x86-x32:', '', d)}"
 
 # ELF64 ABI
 TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
 TUNECONFLICTS[m64] = "m32 mx32"
-TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'm64', '${X86ARCH64}', '' ,d)}"
+TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'm64', '${X86ARCH64}', '', d)}"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'm64', ' -m64', '', d)}"
 
 # Default Tune configurations
diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 4630026aa9da..19f27f83950d 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -9,4 +9,4 @@ LICENSE = "MIT"
 inherit core-image
 
 IMAGE_ROOTFS_SIZE ?= "8192"
-IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "" ,d)}"
+IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_5.1.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_5.1.0.bb
index 7394385d30b0..222b55cbc6ee 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_5.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_5.1.0.bb
@@ -10,7 +10,7 @@ DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native bison-native"
 EXTRA_OECONF_append = " --target-list=${@get_qemu_system_target_list(d)}"
 
 PACKAGECONFIG ??= "fdt alsa kvm \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '' ,d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
 "
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
diff --git a/meta/recipes-devtools/qemu/qemu_5.1.0.bb b/meta/recipes-devtools/qemu/qemu_5.1.0.bb
index a4018cc4485d..599ff82fc124 100644
--- a/meta/recipes-devtools/qemu/qemu_5.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_5.1.0.bb
@@ -21,8 +21,8 @@ do_install_append_class-nativesdk() {
 PACKAGECONFIG ??= " \
     fdt sdl kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '' ,d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
 "
 PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '' ,d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '', d)} \
 "
diff --git a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
index 9484f010c0a3..4175a56157db 100644
--- a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
@@ -39,6 +39,6 @@ EXTRA_OECMAKE = "-DRESOURCE_INSTALL_DIR=${datadir}/vulkan-demos"
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
 
 # Can only pick one of [wayland,xcb]
-PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'xcb' ,d)}"
+PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'xcb', d)}"
 PACKAGECONFIG[wayland] = "-DUSE_WAYLAND_WSI=ON, -DUSE_WAYLAND_WSI=OFF, wayland"
 PACKAGECONFIG[xcb] = ",,libxcb"
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index c937173d0fde..fbc62f29c8f5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -49,6 +49,6 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 
 KERNEL_VERSION_SANITY_SKIP = "1"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 73876bb99e34..eded625bff82 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -41,4 +41,4 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
+KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index bc9040a3d827..aa01f06d3897 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -41,4 +41,4 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
+KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index fe9369196125..d06d653d7123 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -50,5 +50,5 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index 8a0b142c00d3..f8e72533f0f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -51,5 +51,5 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
index 8c53d1164208..edb2ac614614 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
@@ -20,7 +20,7 @@ BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 inherit autotools binconfig-disabled pkgconfig
 
 # Work around missing symbols
-EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
+EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off", d)}"
 
 PACKAGES =+ "${PN}-tools"
 
-- 
2.20.1

