Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web08.1703.1616180322809410826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 11:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TyWcHcUA;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id h3so5559231qvh.8
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 11:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=adaS8fMmfw76m0sTaEBvh2ovfH7WqG0tt4dNh8QCblw=;
        b=TyWcHcUAGpslcRgTEnVsVFykVU9PU4ipvV0T077/UQZqudPLDRbxZhZX0MNrWKJjsN
         xiL2C43BZfOYHLlboT9pYhPOdCLX/BU4M7PUJAA9lUdKdlRwA2mfTn/BqvIx71tbjrc6
         VmQPqxrPLg19KkDu3ZG+nuCWIfexL8NX9pLlLgbP8q1qZ70VUNSYVevv1T32wK8b1Shx
         5urdOP/uwqgTNPSjejwrQkVSFvAHtlqqu1ghkJ9IF6Qq8+3rhR5zwsBUFgo+/y/2qnu6
         1k2svn/gT/uqydrfmDE0d/YOChQMFADiY5dql2VBPq598clBV5lBKdve/SVEQt7oTIg6
         AQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=adaS8fMmfw76m0sTaEBvh2ovfH7WqG0tt4dNh8QCblw=;
        b=gkMVDkUnsHUn9/oPDPWnB8zuhZ/yRO8RjUneoImkbSNUpykgKaHWe5iQ2LjLf/IY3F
         jmZqpdN3vcQe/Hr5rxS0uKjULlwNZZBrYsVrXlP1QR9Z1ryD1d3JvDbtpmX2Zk2xqCAV
         D+ZJeQxOkIOcCqq0R19znLMddOutHeEbIma+VopiPL8EMc83G858NQ+zlvI9F3cKoIDw
         RtWmQHDg9K9GWeVf7tLtQgXU29/jOFUQq+DlIh1kh8RsgeaivmfEBcCXCqoKntiNC3kY
         6gQSoRNJ/dxHeMuwt20F0JxDcIFM5ZFQ9Ibv1vFF6/cBn7RJUUBjMoNgVUsCT8mmsQpY
         GD9Q==
X-Gm-Message-State: AOAM531jXL06h6HZwn2Pc9E/axH1sm8/EHuTC1mE+V72zPMtDuFFsdct
	yG/twWdA4hwWmLqOtb/kyWo=
X-Google-Smtp-Source: ABdhPJxr87gSkcC7DvwDZVyQ2Y/ODcRHNCaeEqOTT4TLrgl/Qy9d6sPkQlee2FzsuJTO0+GJTElmTg==
X-Received: by 2002:a0c:f54d:: with SMTP id p13mr10688840qvm.32.1616180321811;
        Fri, 19 Mar 2021 11:58:41 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j1sm4402191qti.55.2021.03.19.11.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 11:58:41 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yocto/5.10: update to v5.10.23
Date: Fri, 19 Mar 2021 14:58:32 -0400
Message-Id: <26b8a7a257c0c5ebfec9cb493dcf37fef19bbe8c.1616180065.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1616180065.git.bruce.ashfield@gmail.com>
References: <cover.1616180065.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    dfbf345b63c3 Linux 5.10.23
    c8714d1faae8 nvme-pci: add quirks for Lexar 256GB SSD
    e88e01440a48 nvme-pci: mark Seagate Nytro XM1440 as QUIRK_NO_NS_DESC_LIST.
    3b659091587a KVM: SVM: Clear the CR4 register on reset
    1611c323df9f scsi: ufs: Fix a duplicate dev quirk number
    2dba0f805416 ASoC: Intel: sof_sdw: add quirk for HP Spectre x360 convertible
    c08344abc971 ASoC: Intel: sof_sdw: reorganize quirks by generation
    1d3efd15e8a4 PCI: cadence: Retrain Link to work around Gen2 training defect
    015d38539db9 ALSA: usb-audio: add mixer quirks for Pioneer DJM-900NXS2
    d78acca2afe5 ALSA: usb-audio: Add DJM750 to Pioneer mixer quirk
    96c4c0a9405e HID: i2c-hid: Add I2C_HID_QUIRK_NO_IRQ_AFTER_RESET for ITE8568 EC on Voyo Winpad A15
    5b6526283499 mmc: sdhci-of-dwcmshc: set SDHCI_QUIRK2_PRESET_VALUE_BROKEN
    e62bdb34858c drm/msm/a5xx: Remove overwriting A5XX_PC_DBG_ECO_CNTL register
    e74b237ef989 scsi: ufs: ufs-exynos: Use UFSHCD_QUIRK_ALIGN_SG_WITH_PAGE_SIZE
    0905bfe69ac2 scsi: ufs: ufs-exynos: Apply vendor-specific values for three timeouts
    c32b34115357 scsi: ufs: Introduce a quirk to allow only page-aligned sg entries
    eece8fe5ebb0 misc: eeprom_93xx46: Add quirk to support Microchip 93LC46B eeprom
    2fc01226c288 scsi: ufs: Add a quirk to permit overriding UniPro defaults
    dbaa2667515e scsi: ufs-mediatek: Enable UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
    ff72a41132b3 ASoC: Intel: sof_sdw: add missing TGL_HDMI quirk for Dell SKU 0A32
    c7ebe45e403d KVM: x86: Supplement __cr4_reserved_bits() with X86_FEATURE_PCID check
    422da3196be9 PCI: Add function 1 DMA alias quirk for Marvell 9215 SATA controller
    0ff1f97510fd usb: cdns3: fix NULL pointer dereference on no platform data
    8694c4e2b19c usb: cdns3: add quirk for enable runtime pm by default
    febf7d870371 usb: cdns3: host: add xhci_plat_priv quirk XHCI_SKIP_PHY_INIT
    3db17e283a92 usb: cdns3: host: add .suspend_quirk for xhci-plat.c
    1b2ac1d95fb1 ASoC: Intel: bytcr_rt5640: Add quirk for ARCHOS Cesium 140
    d3116e06fb16 ACPI: video: Add DMI quirk for GIGABYTE GB-BXBT-2807
    c5188a98d2fb media: cx23885: add more quirks for reset DMA on some AMD IOMMU
    748446897d36 HID: mf: add support for 0079:1846 Mayflash/Dragonrise USB Gamecube Adapter
    8fb656fefddd platform/x86: acer-wmi: Add ACER_CAP_KBD_DOCK quirk for the Aspire Switch 10E SW3-016
    ba1a647e0f11 platform/x86: acer-wmi: Add support for SW_TABLET_MODE on Switch devices
    2c9132e543b7 platform/x86: acer-wmi: Add ACER_CAP_SET_FUNCTION_MODE capability flag
    039cd40179e9 platform/x86: acer-wmi: Add new force_caps module parameter
    74848026bcb1 platform/x86: acer-wmi: Cleanup accelerometer device handling
    be52e3ea4520 platform/x86: acer-wmi: Cleanup ACER_CAP_FOO defines
    b159a9a4d357 bus: ti-sysc: Implement GPMC debug quirk to drop platform data
    f7f227eb32d1 ASoC: Intel: sof_sdw: add quirk for new TigerLake-SDCA device
    36b3ba412d7c mwifiex: pcie: skip cancel_work_sync() on reset failure path
    f5526b77335d Bluetooth: btqca: Add valid le states quirk
    93d20ce4c47f iommu/amd: Fix sleeping in atomic in increase_address_space()
    bf6dd437c3ba btrfs: don't flush from btrfs_delayed_inode_reserve_metadata
    cf9317ceb5a1 btrfs: export and rename qgroup_reserve_meta
    7215d7742daf arm64: Make CPU_BIG_ENDIAN depend on ld.bfd or ld.lld 13.0.0+
    a6425142f522 parisc: Enable -mlong-calls gcc option with CONFIG_COMPILE_TEST
    ea222427ae9c nvme-pci: mark Kingston SKC2000 as not supporting the deepest power state
    6d7fdad08fbd ASoC: SOF: Intel: broadwell: fix mutual exclusion with catpt driver
    62ba6d817c91 ACPICA: Fix race in generic_serial_bus (I2C) and GPIO op_region parameter handling
    b672142f76cb Linux 5.10.22
    b31a9f0c366d r8169: fix resuming from suspend on RTL8105e if machine runs on battery
    aa40f5e33ce3 tomoyo: recognize kernel threads correctly
    4645271c32b4 of: unittest: Fix build on architectures without CONFIG_OF_ADDRESS
    b70e6aacbe32 Revert "arm64: dts: amlogic: add missing ethernet reset ID"
    a7cefacccafa iommu/vt-d: Fix status code for Allocate/Free PASID command
    5cc0813e7bb9 rsxx: Return -EFAULT if copy_to_user() fails
    e88c1b25f2bc ftrace: Have recordmcount use w8 to read relp->r_info in arm64_is_fake_mcount
    a14c6ea66211 ALSA: hda: intel-nhlt: verify config type
    7ef9d23bc312 IB/mlx5: Add missing error code
    f767104af496 RDMA/rxe: Fix missing kconfig dependency on CRYPTO
    8850a814d42d RDMA/cm: Fix IRQ restore in ib_send_cm_sidr_rep
    253b7a11ce26 ALSA: ctxfi: cthw20k2: fix mask on conf to allow 4 bits
    4d7ed9a49b0c mm: Remove examples from enum zone_type comment
    8eaef922e938 arm64: mm: Set ZONE_DMA size based on early IORT scan
    35ec3d09ff6a arm64: mm: Set ZONE_DMA size based on devicetree's dma-ranges
    a9861e7fa4f8 of: unittest: Add test for of_dma_get_max_cpu_address()
    18bf6e998d08 of/address: Introduce of_dma_get_max_cpu_address()
    3fbe62ffbb54 arm64: mm: Move zone_dma_bits initialization into zone_sizes_init()
    407b173adfac arm64: mm: Move reserve_crashkernel() into mem_init()
    85433307d8a1 crypto - shash: reduce minimum alignment of shash_desc structure
    3868a277e6fc drm/amdgpu: fix parameter error of RREG32_PCIE() in amdgpu_regs_pcie
    c2fee74ea801 drm/amdgpu:disable VCN for Navi12 SKU
    ce1cca17381f dm verity: fix FEC for RS roots unaligned to block size
    7bda53f46387 dm bufio: subtract the number of initial sectors in dm_bufio_get_device_size
    a2501d87663b io_uring: ignore double poll add on the same waitqueue head
    3301afbfef69 ring-buffer: Force before_stamp and write_stamp to be different on discard
    c6e5800bdf70 PM: runtime: Update device status before letting suppliers suspend
    ae971992e9fe btrfs: fix warning when creating a directory with smack enabled
    e6ba61aaff88 btrfs: unlock extents in btrfs_zero_range in case of quota reservation errors
    37ffce966821 btrfs: free correct amount of space in btrfs_delayed_inode_reserve_metadata
    a64ad80223f2 btrfs: validate qgroup inherit for SNAP_CREATE_V2 ioctl
    e82407d24968 btrfs: fix race between extent freeing/allocation when using bitmaps
    1559d94fece2 btrfs: fix stale data exposure after cloning a hole with NO_HOLES enabled
    6fc9e5866cb9 btrfs: fix race between swap file activation and snapshot creation
    501fdd1cefae btrfs: fix race between writes to swap files and scrub
    b2a487613218 btrfs: fix raid6 qstripe kmap
    a01415e5e862 btrfs: avoid double put of block group when emptying cluster
    fbefc2d28900 tpm, tpm_tis: Decorate tpm_get_timeouts() with request_locality()
    bfa2e4ed1d39 tpm, tpm_tis: Decorate tpm_tis_gen_interrupt() with request_locality()
    86c524934277 ALSA: usb-audio: Drop bogus dB range in too low level
    4330e7a8bf01 ALSA: usb-audio: use Corsair Virtuoso mapping for Corsair Virtuoso SE
    5c947a8a6f05 ALSA: hda/realtek: Enable headset mic of Acer SWIFT with ALC256

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 7375537654..60c3c59613 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "36889a571fe57fe3561cc23f842b92e4ea9ca264"
-SRCREV_meta ?= "7d652f104151052fe4c0cf48d7bc0d7e0c0a7dad"
+SRCREV_machine ?= "09e60e61f3a0716c1d715024db69ed493b374352"
+SRCREV_meta ?= "581687c525f24f8e82582e789d39a508dfa083ed"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.21"
+LINUX_VERSION ?= "5.10.23"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 934c1c99b1..852951789a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.21"
+LINUX_VERSION ?= "5.10.23"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "9d6d37cfe365ebd5b530f9c43c1ace924343bb15"
-SRCREV_machine ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
-SRCREV_meta ?= "7d652f104151052fe4c0cf48d7bc0d7e0c0a7dad"
+SRCREV_machine_qemuarm ?= "828298476280f149282db7209dd18c8bd0f46657"
+SRCREV_machine ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
+SRCREV_meta ?= "581687c525f24f8e82582e789d39a508dfa083ed"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index f867a125a4..20be08af42 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b633861686a11bf7ff02b3d40cd71a0113b4739c"
-SRCREV_machine_qemuarm64 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
-SRCREV_machine_qemumips ?= "d36658c0f303a89dff5ed7f3bb9923c525dfd95c"
-SRCREV_machine_qemuppc ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
-SRCREV_machine_qemuriscv64 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
+SRCREV_machine_qemuarm ?= "e3b57b3a99ff881a16bbdff86ba811bf251c10a9"
+SRCREV_machine_qemuarm64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
+SRCREV_machine_qemumips ?= "68527a50a2f5b0992ba85255325d76a9f187c237"
+SRCREV_machine_qemuppc ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
+SRCREV_machine_qemuriscv64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
 SRCREV_machine_qemuriscv32 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
-SRCREV_machine_qemux86 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
-SRCREV_machine_qemux86-64 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
-SRCREV_machine_qemumips64 ?= "f1c01716513524065f0f231c6e6502cd9a3ecb53"
-SRCREV_machine ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
-SRCREV_meta ?= "7d652f104151052fe4c0cf48d7bc0d7e0c0a7dad"
+SRCREV_machine_qemux86 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
+SRCREV_machine_qemux86-64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
+SRCREV_machine_qemumips64 ?= "c19b50af1e3680ff6050a0cce8dcd888accafd9b"
+SRCREV_machine ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
+SRCREV_meta ?= "581687c525f24f8e82582e789d39a508dfa083ed"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.21"
+LINUX_VERSION ?= "5.10.23"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

