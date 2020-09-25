Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.5581.1601062100972474667
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 12:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=hMneUaYI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id v123so3943432qkd.9
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 12:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=w55cJeA2FI2TbkPnxDFQCEN3RDE62eMIYewdENtsDlQ=;
        b=hMneUaYIfEdfGqe0UWYq0IKkXrNURh1g/EjLjIPwbqCXcvTasiiXhGrf9I01dycUqM
         6PD+HJv0X6EAns4JB4RkxeU9XTnHbGuiwZ0jbu7gQzCV9QuARqGkA9r8bEa34g6yFp9/
         4mrbuaiISstSbR1CKas5sgWxKCI0iib+NI2fhU5sHyt/L9Y7t0oofe1P4UB49G/ejCgu
         SyzYWF93GmozyMvnX2cB4k1v/H8ovEhlGsQZmppuyjS6SR5FOOvi5yyHgP5srOcU96Av
         69SETtUS3IRQMUMcLmu4SR6PQ8Q+fHpVK6SAKTost0HKhABEa6Q/az7RrFi8mKM6EtwP
         6VSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w55cJeA2FI2TbkPnxDFQCEN3RDE62eMIYewdENtsDlQ=;
        b=bKJkV5PlNCkKZIpJrtMMmSvT9AWlkPvxTn2cneniXwMuAfYiGuRg5beGGvtFsHyZuS
         Q1bRcincMuLwT/Mp2443vVD+8Rt0HA7E7GElKoykXOY1hchTwXczhtJa/GUr346CG26o
         WH0gAlR+0smko2HWUajvLwljXkXm/L5TiRyA/ku1iPSaG3A9SD3IOT1WZWLpOJgiILQn
         HW0Ddmj+jx2toI77J4UYk5OKzDHEMovGgYaXpYod1OaHCXcvRSqZVmcJGtfnEH34w0Zf
         vUePDGtIdaFHjQrhFDK/z1Och4SwGY6oxd/gzRfDZ9S/TBc53e8JSo3arhQ9Jm1z4Z4u
         XmTw==
X-Gm-Message-State: AOAM531sGEwkyItjxzYp020AYaTP5EyUUsHiOHr5IRPxw3/XpHnO7Wjc
	lQ6dcE5fU465ZTgexWK0ogZW/n3UexZNLL0U
X-Google-Smtp-Source: ABdhPJwltZDQbFDon+xH+kdhROUF02vdE0lss4JMbywbcnI+b/A45HipFi7mhkXuhT9zqTXYmXj0bg==
X-Received: by 2002:a37:71c7:: with SMTP id m190mr1444030qkc.361.1601062097014;
        Fri, 25 Sep 2020 12:28:17 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id s47sm2742313qtb.13.2020.09.25.12.28.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 12:28:16 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v2 1/6] Space-comma Cleanups
Date: Fri, 25 Sep 2020 15:28:05 -0400
Message-Id: <20200925192810.1372-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200925192810.1372-1-jon.mason@arm.com>
References: <20200925192810.1372-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multiple files have " ," instead of ", " in expressions.  This changes
them to conform to the way the rest of them are done.

Found and corrected via:
git ls-files | xargs sed -i 's/ ,d/, d/g'

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/classes/linuxloader.bbclass              |   2 +-
 meta/classes/rootfs_rpm.bbclass               |   2 +-
 meta/conf/machine/include/arm/arch-arm64.inc  |  10 +-
 meta/conf/machine/include/arm/arch-armv4.inc  |   2 +-
 meta/conf/machine/include/arm/arch-armv5.inc  |   2 +-
 meta/conf/machine/include/arm/arch-armv6.inc  |   2 +-
 meta/conf/machine/include/arm/arch-armv6m.inc |   2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc |   2 +-
 .../conf/machine/include/arm/arch-armv7ve.inc |   2 +-
 .../machine/include/arm/arch-armv8-2a.inc     |   2 +-
 meta/conf/machine/include/arm/arch-armv8a.inc |   2 +-
 meta/conf/machine/include/mips/arch-mips.inc  |  16 +-
 .../conf/machine/include/tune-arm1136jf-s.inc |   2 +-
 .../conf/machine/include/tune-arm1176jz-s.inc |   2 +-
 meta/conf/machine/include/tune-arm920t.inc    |   2 +-
 meta/conf/machine/include/tune-arm926ejs.inc  |   2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc   |   2 +-
 meta/conf/machine/include/tune-cortexa15.inc  |   2 +-
 meta/conf/machine/include/tune-cortexa17.inc  |   2 +-
 meta/conf/machine/include/tune-cortexa5.inc   |   2 +-
 .../include/tune-cortexa57-cortexa53.inc      |   2 +-
 meta/conf/machine/include/tune-cortexa7.inc   |   2 +-
 .../include/tune-cortexa72-cortexa53.inc      |   2 +-
 .../include/tune-cortexa73-cortexa53.inc      |   2 +-
 meta/conf/machine/include/tune-cortexa8.inc   |   2 +-
 meta/conf/machine/include/tune-cortexa9.inc   |   2 +-
 meta/conf/machine/include/tune-ep9312.inc     |   2 +-
 meta/conf/machine/include/tune-iwmmxt.inc     |   2 +-
 .../machine/include/tune-strongarm1100.inc    |   2 +-
 meta/conf/machine/include/tune-xscale.inc     |   2 +-
 meta/conf/machine/include/x86/arch-x86.inc    |  12 +-
 .../recipes-core/images/core-image-minimal.bb |   2 +-
 .../qemu/qemu-system-native_5.1.0.bb          |   2 +-
 meta/recipes-devtools/qemu/qemu_5.1.0.bb      |   4 +-
 .../vulkan/vulkan-demos_git.bb                |   2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   2 +-
 .../linux/linux-yocto-rt_5.4.bb               |   2 +-
 .../linux/linux-yocto-rt_5.8.bb               |   2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   4 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  |   4 +-
 .../libpng/libpng_1.6.37.bb                   |   2 +-
 scripts/pybootchartgui/pybootchartgui/main.py | 184 +++++++++++++++++-
 42 files changed, 243 insertions(+), 61 deletions(-)
 mode change 120000 => 100644 scripts/pybootchartgui/pybootchartgui/main.py

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
 
diff --git a/scripts/pybootchartgui/pybootchartgui/main.py b/scripts/pybootchartgui/pybootchartgui/main.py
deleted file mode 120000
index b45ae0a3d25a..000000000000
--- a/scripts/pybootchartgui/pybootchartgui/main.py
+++ /dev/null
@@ -1 +0,0 @@
-main.py.in
\ No newline at end of file
diff --git a/scripts/pybootchartgui/pybootchartgui/main.py b/scripts/pybootchartgui/pybootchartgui/main.py
new file mode 100644
index 000000000000..a954b125da5c
--- /dev/null
+++ b/scripts/pybootchartgui/pybootchartgui/main.py
@@ -0,0 +1,183 @@
+#
+# ***********************************************************************
+#  Warning: This file is auto-generated from main.py.in - edit it there.
+# ***********************************************************************
+#
+#  pybootchartgui is free software: you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License as published by
+#  the Free Software Foundation, either version 3 of the License, or
+#  (at your option) any later version.
+
+#  pybootchartgui is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#  GNU General Public License for more details.
+
+#  You should have received a copy of the GNU General Public License
+#  along with pybootchartgui. If not, see <http://www.gnu.org/licenses/>.
+
+import sys
+import os
+import optparse
+
+from . import parsing
+from . import batch
+
+def _mk_options_parser():
+	"""Make an options parser."""
+	usage = "%prog [options] /path/to/tmp/buildstats/<recipe-machine>/<BUILDNAME>/"
+	version = "%prog v1.0.0"
+	parser = optparse.OptionParser(usage, version=version)
+	parser.add_option("-i", "--interactive", action="store_true", dest="interactive", default=False, 
+			  help="start in active mode")
+	parser.add_option("-f", "--format", dest="format", default="png", choices=["png", "svg", "pdf"],
+			  help="image format (png, svg, pdf); default format png")
+	parser.add_option("-o", "--output", dest="output", metavar="PATH", default=None,
+			  help="output path (file or directory) where charts are stored")
+	parser.add_option("-s", "--split", dest="num", type=int, default=1,
+			  help="split the output chart into <NUM> charts, only works with \"-o PATH\"")
+	parser.add_option("-m", "--mintime", dest="mintime", type=int, default=8,
+			  help="only tasks longer than this time will be displayed")
+	parser.add_option("-M", "--minutes", action="store_true", dest="as_minutes", default=False,
+			  help="display time in minutes instead of seconds")
+#	parser.add_option("-n", "--no-prune", action="store_false", dest="prune", default=True,
+#			  help="do not prune the process tree")
+	parser.add_option("-q", "--quiet", action="store_true", dest="quiet", default=False,
+			  help="suppress informational messages")
+#	parser.add_option("-t", "--boot-time", action="store_true", dest="boottime", default=False,
+#			  help="only display the boot time of the boot in text format (stdout)")	
+	parser.add_option("--very-quiet", action="store_true", dest="veryquiet", default=False,
+			  help="suppress all messages except errors")
+	parser.add_option("--verbose", action="store_true", dest="verbose", default=False,
+			  help="print all messages")
+#	parser.add_option("--profile", action="store_true", dest="profile", default=False,
+#			  help="profile rendering of chart (only useful when in batch mode indicated by -f)")
+#	parser.add_option("--show-pid", action="store_true", dest="show_pid", default=False,
+#			  help="show process ids in the bootchart as 'processname [pid]'")
+	parser.add_option("--show-all", action="store_true", dest="show_all", default=False,
+			  help="show all processes in the chart")
+#	parser.add_option("--crop-after", dest="crop_after", metavar="PROCESS", default=None,
+#			  help="crop chart when idle after PROCESS is started")
+#	parser.add_option("--annotate", action="append", dest="annotate", metavar="PROCESS", default=None,
+#			  help="annotate position where PROCESS is started; can be specified multiple times. " +
+#			       "To create a single annotation when any one of a set of processes is started, use commas to separate the names")
+#	parser.add_option("--annotate-file", dest="annotate_file", metavar="FILENAME", default=None,
+#			  help="filename to write annotation points to")
+	parser.add_option("-T", "--full-time", action="store_true", dest="full_time", default=False,
+			  help="display the full time regardless of which processes are currently shown")
+	return parser
+
+class Writer:
+	def __init__(self, write, options):
+		self.write = write
+		self.options = options
+		
+	def error(self, msg):
+		self.write(msg)
+
+	def warn(self, msg):
+		if not self.options.quiet:
+			self.write(msg)
+
+	def info(self, msg):
+		if self.options.verbose:
+			self.write(msg)
+
+	def status(self, msg):
+		if not self.options.quiet:
+			self.write(msg)
+
+def _mk_writer(options):
+	def write(s):
+		print(s)
+	return Writer(write, options)
+	
+def _get_filename(path):
+	"""Construct a usable filename for outputs"""
+	dname = "."
+	fname = "bootchart"
+	if path != None:
+		if os.path.isdir(path):
+			dname = path
+		else:
+			fname = path
+	return os.path.join(dname, fname)
+
+def main(argv=None):
+	try:
+		if argv is None:
+			argv = sys.argv[1:]
+	
+		parser = _mk_options_parser()
+		options, args = parser.parse_args(argv)
+
+		# Default values for disabled options
+		options.prune = True
+		options.boottime = False
+		options.profile = False
+		options.show_pid = False
+		options.crop_after = None
+		options.annotate = None
+		options.annotate_file = None
+
+		writer = _mk_writer(options)
+
+		if len(args) == 0:
+			print("No path given, trying /var/log/bootchart.tgz")
+			args = [ "/var/log/bootchart.tgz" ]
+
+		res = parsing.Trace(writer, args, options)
+
+		if options.interactive or options.output == None:
+			from . import gui
+			gui.show(res, options)
+		elif options.boottime:
+			import math
+			proc_tree = res.proc_tree
+			if proc_tree.idle:
+			    duration = proc_tree.idle
+			else:
+			    duration = proc_tree.duration
+			dur = duration / 100.0
+			print('%02d:%05.2f' % (math.floor(dur/60), dur - 60 * math.floor(dur/60)))
+		else:
+			if options.annotate_file:
+				f = open (options.annotate_file, "w")
+				try:
+					for time in res[4]:
+						if time is not None:
+							# output as ms
+							f.write(time * 10)
+				finally:
+					f.close()
+			filename = _get_filename(options.output)
+			res_list = parsing.split_res(res, options)
+			n = 1
+			width = len(str(len(res_list)))
+			s = "_%%0%dd." % width
+			for r in res_list:
+				if len(res_list) == 1:
+					f = filename + "." + options.format
+				else:
+					f = filename + s % n + options.format
+					n = n + 1
+				def render():
+					batch.render(writer, r, options, f)
+				if options.profile:
+					import cProfile
+					import pstats
+					profile = '%s.prof' % os.path.splitext(filename)[0]
+					cProfile.runctx('render()', globals(), locals(), profile)
+					p = pstats.Stats(profile)
+					p.strip_dirs().sort_stats('time').print_stats(20)
+				else:
+					render()
+
+		return 0
+	except parsing.ParseError as ex:
+		print(("Parse error: %s" % ex))
+		return 2
+
+
+if __name__ == '__main__':
+	sys.exit(main())
-- 
2.20.1

