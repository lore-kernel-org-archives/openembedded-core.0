Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.196.1616596825339046467
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=I9CxJBCP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id e33so14785034pgm.13
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xIYgqj4sV7UdcHwQe9dGVUWDRGQsI/DaEEa6ONyqVVU=;
        b=I9CxJBCPxXs4zHYKCH/rnU2XU1VD3bLPQPR9Wm5dLAUZE5SID3xkcQgiVAKKPNo09f
         Ns5UJyRAgHk2Sk95mnd2JcaRKMvDNB5bPVouOfa8kDDZDncrN9ycnLU9xCz/0praWzGJ
         arPpCTqz7oV8CLHe8t7ugykfgs31xw2aoZC5dl8hHpldfa1cN94KE32cbTMTRpaPbqdC
         aTrOms0XI96RNujfI5u62C6vDcZce7GtSs12OzACvsuhyHbbPg2ja+o6swQdBwI7ROZp
         1Uq8Fv0o3lZV4eM6psi6wwdbf7mL/1qyZ3oydx9+J8XQP297m+eoRtZLYiDg2qBRFEnS
         rOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xIYgqj4sV7UdcHwQe9dGVUWDRGQsI/DaEEa6ONyqVVU=;
        b=glOBterr4d99ZUObTWtsH809GvnZ0krBLnXctu0JHSbe8nGzakthpH5Z9f+1CsyWEM
         tkih5NEzdc77cTN8Iw/Ys/G7X6M1O+LxiW0ouHahEpzcNVCMCROeNBLHKOwsuOOiaoJX
         PxPh3qGFUO0SxA3iwxCqcHC2F11c1T6/Z2bfDApvG8vYjfUbYr23FuA5/bdA7ay1dmwy
         JsiyXdHCQjXh1Q5udagTXmfqHIfovNiZ3zookyURW1vlLRdQD8EEyfUl7wpUFlmxncSD
         dosmJDGLyGpO4CHhrU2cYWdsstrb4zTKDRijNa98mHs0KqP8b93l9LOaRN0dYJX1c7r7
         97fA==
X-Gm-Message-State: AOAM533Tl/RNeh4dvXtt431ZGob6/JNvTSiIYmjTFjRlWavB6NT0VMCs
	yhpbND/weOPz0niDgBAcEuPUbYM3wFU3+lfJ
X-Google-Smtp-Source: ABdhPJxUWFhVr+yuo/t1ns5yVn7Oe2KQOg6zdICWpRjEHIgL+bKDV8pS8Dv6gjeiFNMMNvop79n2mg==
X-Received: by 2002:a63:d0f:: with SMTP id c15mr3329884pgl.390.1616596824217;
        Wed, 24 Mar 2021 07:40:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.40.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:40:23 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/21] linux-yocto/5.4: update to v5.4.105
Date: Wed, 24 Mar 2021 04:39:16 -1000
Message-Id: <707036d4ec12ef1a260adcef78627b26e32e6540.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    ce615a08404c Linux 5.4.105
    d17cf4cb1928 nvme-pci: add quirks for Lexar 256GB SSD
    1d08ff846484 nvme-pci: mark Seagate Nytro XM1440 as QUIRK_NO_NS_DESC_LIST.
    9106a7844efb HID: i2c-hid: Add I2C_HID_QUIRK_NO_IRQ_AFTER_RESET for ITE8568 EC on Voyo Winpad A15
    b5e10e9b3047 mmc: sdhci-of-dwcmshc: set SDHCI_QUIRK2_PRESET_VALUE_BROKEN
    21f3fb36b5a2 drm/msm/a5xx: Remove overwriting A5XX_PC_DBG_ECO_CNTL register
    1d113893ff9d misc: eeprom_93xx46: Add quirk to support Microchip 93LC46B eeprom
    9f1f09887551 PCI: Add function 1 DMA alias quirk for Marvell 9215 SATA controller
    f40fdcb7ca29 ASoC: Intel: bytcr_rt5640: Add quirk for ARCHOS Cesium 140
    242be7cddd25 ACPI: video: Add DMI quirk for GIGABYTE GB-BXBT-2807
    86c8848d680a media: cx23885: add more quirks for reset DMA on some AMD IOMMU
    fd476c6d4e1a HID: mf: add support for 0079:1846 Mayflash/Dragonrise USB Gamecube Adapter
    ef9fa6bb8582 platform/x86: acer-wmi: Add ACER_CAP_KBD_DOCK quirk for the Aspire Switch 10E SW3-016
    3a8eb20cb87b platform/x86: acer-wmi: Add support for SW_TABLET_MODE on Switch devices
    e3a3a69da177 platform/x86: acer-wmi: Add ACER_CAP_SET_FUNCTION_MODE capability flag
    b734af305c78 platform/x86: acer-wmi: Add new force_caps module parameter
    025180244251 platform/x86: acer-wmi: Cleanup accelerometer device handling
    37b4324cb78e platform/x86: acer-wmi: Cleanup ACER_CAP_FOO defines
    200e14759da5 mwifiex: pcie: skip cancel_work_sync() on reset failure path
    c699a89d385c iommu/amd: Fix sleeping in atomic in increase_address_space()
    fa56bf637eac ACPICA: Fix race in generic_serial_bus (I2C) and GPIO op_region parameter handling
    f27765adb3f6 dm table: fix zoned iterate_devices based device capability checks
    06ef17b88676 dm table: fix DAX iterate_devices based device capability checks
    b8aedc65db40 dm table: fix iterate_devices based device capability checks
    c1f5fc082beb net: dsa: add GRO support via gro_cells
    84d5d3c9d3fb Linux 5.4.104
    d859388ea25a r8169: fix resuming from suspend on RTL8105e if machine runs on battery
    1fba84f3c491 rsxx: Return -EFAULT if copy_to_user() fails
    77a81b10f894 ftrace: Have recordmcount use w8 to read relp->r_info in arm64_is_fake_mcount
    9a20e5782d2d ALSA: hda: intel-nhlt: verify config type
    86b3b62b81c5 IB/mlx5: Add missing error code
    809ef2660c1b RDMA/rxe: Fix missing kconfig dependency on CRYPTO
    26a1af33c9cd ALSA: ctxfi: cthw20k2: fix mask on conf to allow 4 bits
    6827415290ab usbip: tools: fix build error for multiple definition
    078170924d84 crypto - shash: reduce minimum alignment of shash_desc structure
    1f8884d04480 arm64: ptrace: Fix seccomp of traced syscall -1 (NO_SYSCALL)
    9e15b43fdaf3 drm/amdgpu: fix parameter error of RREG32_PCIE() in amdgpu_regs_pcie
    b367201430dd dm verity: fix FEC for RS roots unaligned to block size
    1a4182923144 dm bufio: subtract the number of initial sectors in dm_bufio_get_device_size
    52a643680165 PM: runtime: Update device status before letting suppliers suspend
    e49baccfe299 btrfs: fix warning when creating a directory with smack enabled
    a87911c26a1c btrfs: unlock extents in btrfs_zero_range in case of quota reservation errors
    91bc3296bffb btrfs: free correct amount of space in btrfs_delayed_inode_reserve_metadata
    8674c1a72a69 btrfs: validate qgroup inherit for SNAP_CREATE_V2 ioctl
    0c740d2b8c61 btrfs: fix raid6 qstripe kmap
    909a8d2b1e7b btrfs: raid56: simplify tracking of Q stripe presence
    15726df8c09a tpm, tpm_tis: Decorate tpm_get_timeouts() with request_locality()
    6d71cbc91104 tpm, tpm_tis: Decorate tpm_tis_gen_interrupt() with request_locality()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 589673d5cef12c98a95c83d47d30d6fc35463747)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 1a1f6deeca..02dd3f40ff 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "34ae8b39b6414e1f05fed93966c5ab1db20b6963"
-SRCREV_meta ?= "feeb59687bc0f054af837a5061f8d413ec7c93e9"
+SRCREV_machine ?= "08b34e26f97c0549961710c3b14258910979aff4"
+SRCREV_meta ?= "f67ab86441a7ebe38b5a25126d6eebc2ef6fee99"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.103"
+LINUX_VERSION ?= "5.4.105"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 9dcea7b0ab..2bdaac0f50 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.103"
+LINUX_VERSION ?= "5.4.105"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ffe71606242ccf95707aae7599805419f14277ff"
-SRCREV_machine ?= "80ade4d43bbcb497d363d44508af69af74a84092"
-SRCREV_meta ?= "feeb59687bc0f054af837a5061f8d413ec7c93e9"
+SRCREV_machine_qemuarm ?= "889b072e7b492ce96a80384f9d3e5412ff8ff839"
+SRCREV_machine ?= "96c96e27c3e9f2cdfb957ade03f10070286fff72"
+SRCREV_meta ?= "f67ab86441a7ebe38b5a25126d6eebc2ef6fee99"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 3c3a9beb31..e5e8065b15 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "31486fc68d8688908700a68b6655fd50c733d882"
-SRCREV_machine_qemuarm64 ?= "80ade4d43bbcb497d363d44508af69af74a84092"
-SRCREV_machine_qemumips ?= "aec63899e25194c00dbc5f25db8fe6c4461eef21"
-SRCREV_machine_qemuppc ?= "80ade4d43bbcb497d363d44508af69af74a84092"
-SRCREV_machine_qemuriscv64 ?= "80ade4d43bbcb497d363d44508af69af74a84092"
-SRCREV_machine_qemux86 ?= "80ade4d43bbcb497d363d44508af69af74a84092"
-SRCREV_machine_qemux86-64 ?= "80ade4d43bbcb497d363d44508af69af74a84092"
-SRCREV_machine_qemumips64 ?= "c155e91597bd1a1aae557405b5061bb8c2695e5d"
-SRCREV_machine ?= "80ade4d43bbcb497d363d44508af69af74a84092"
-SRCREV_meta ?= "feeb59687bc0f054af837a5061f8d413ec7c93e9"
+SRCREV_machine_qemuarm ?= "65543d1e3cd5140ac0384179e46d881b728b4013"
+SRCREV_machine_qemuarm64 ?= "96c96e27c3e9f2cdfb957ade03f10070286fff72"
+SRCREV_machine_qemumips ?= "182eacc3bb0ee860380decb664e05e6ec94fe003"
+SRCREV_machine_qemuppc ?= "96c96e27c3e9f2cdfb957ade03f10070286fff72"
+SRCREV_machine_qemuriscv64 ?= "96c96e27c3e9f2cdfb957ade03f10070286fff72"
+SRCREV_machine_qemux86 ?= "96c96e27c3e9f2cdfb957ade03f10070286fff72"
+SRCREV_machine_qemux86-64 ?= "96c96e27c3e9f2cdfb957ade03f10070286fff72"
+SRCREV_machine_qemumips64 ?= "bc21e93c3154523e0f490fed699feb79ab60536b"
+SRCREV_machine ?= "96c96e27c3e9f2cdfb957ade03f10070286fff72"
+SRCREV_meta ?= "f67ab86441a7ebe38b5a25126d6eebc2ef6fee99"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.103"
+LINUX_VERSION ?= "5.4.105"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1

