Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web12.260.1621289829379162204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 15:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=udNx3Qy8;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id j11so6047334qtn.12
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 15:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xrAEMSVubHdr5n27+Fali1PLK6lMi+4P02gvCBv9oSI=;
        b=udNx3Qy8CQX/I68ubNXCEjqnRN0dzaKsgWMYc4o34uNI1OOAqxQhA3wxog+ywvGzGZ
         9mSvOtQYbYWVAN17nyPUaCMZDn3PxYaO7eb9UX4ROJknBGR+cnbYe7+Y/FvzmE8V3h+C
         5f43IRmuLYTq77TsDf7N+4cEHu7NIRyb03M8d83DnBiAyap78dBMp02YPgU4S7+FB3yk
         hNwu/FYsHxfIqrhabwBKj1Sj0iUT/A+0Ipf/MRJDaCfTlH+0SvWw8QK+Lt2qBxQAaYZi
         y8ZYIMPZhSoR0+S3+TysDyq1f8cQSuZpcMjWNnXH1jMF+UM4dcwehdJAhSOspKGDoIQx
         nB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xrAEMSVubHdr5n27+Fali1PLK6lMi+4P02gvCBv9oSI=;
        b=jJwCKlbVrWvbP5f4QT7Q2xqG3GLkV8GUBL8VuwOqdGWNFBB64jwUD0fMXzFrBzoMfS
         pkontTSZhHfxZIaqseMgv+Lpr8TLY74DAMoj3T2tCU2dZWK3a3JVfPNmNcblVzeFyoJR
         9ilI1ZESwXvOqZuAR8YUvWDDqqIG1ov8qUOG890+mTx4dC91AexyWjHLbhEr91be/eiT
         +b+s3yWOCWLWX3wXJ5NvyouOaiqiE/hMqPlHV6beqNPVtt5k4Gvxgru4OtiXWIfdEDhk
         qOfDhtvaikaRDM+IO85AJs4P+MmK5xlHW7WtbrlcRC/EgdVsvnf5rcyMvESnH/RWghYv
         c7lA==
X-Gm-Message-State: AOAM533e/8y0xBHGazKcFUUXjn4Tijz9wxxEmUP/uBUOUcQBvy+wuJ46
	rG9AH7lXOSWL4OQ2NmluJ1RIbdQrPzgilQ==
X-Google-Smtp-Source: ABdhPJxIFtkaI3FnQSOqFcsC0LsegTGfrH0YIp/N4dn0QdBc0kXdwQFethWS58lC6p5VfcucKbf7xw==
X-Received: by 2002:aed:316b:: with SMTP id 98mr1667267qtg.48.1621289828417;
        Mon, 17 May 2021 15:17:08 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id y10sm9789558qtm.17.2021.05.17.15.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 15:17:08 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] linux-yocto/5.4: update to v5.4.118
Date: Mon, 17 May 2021 18:16:57 -0400
Message-Id: <73131d327ad82c98a8970a30ba26f8136410e7be.1621275692.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1621275692.git.bruce.ashfield@gmail.com>
References: <cover.1621275692.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    16022114de98 Linux 5.4.118
    a992a283c0b7 dm rq: fix double free of blk_mq_tag_set in dev remove after table load fails
    569bae00ebbe dm integrity: fix missing goto in bitmap_flush_interval error handling
    ff8fd1e3b58a dm space map common: fix division bug in sm_ll_find_free_block()
    6fcaa44105aa dm persistent data: packed struct should have an aligned() attribute too
    c64da3294a7d tracing: Restructure trace_clock_global() to never block
    0834094c9a08 tracing: Map all PIDs to command lines
    8768085ba271 rsi: Use resume_noirq for SDIO
    55aa314a1a6c tty: fix memory leak in vc_deallocate
    943131fda33b usb: dwc2: Fix session request interrupt handler
    5bd06fc6b02c usb: dwc3: gadget: Fix START_TRANSFER link state check
    0790fdbf37ee usb: gadget/function/f_fs string table fix for multiple languages
    3b8b63be230f usb: gadget: Fix double free of device descriptor pointers
    efa99087ea69 usb: gadget: dummy_hcd: fix gpf in gadget_setup
    ffe824c0e35a media: staging/intel-ipu3: Fix race condition during set_fmt
    a03fb1e8a110 media: staging/intel-ipu3: Fix set_fmt error handling
    ff792ae52005 media: staging/intel-ipu3: Fix memory leak in imu_fmt
    ae37aee56cad media: dvb-usb: Fix memory leak at error in dvb_usb_device_init()
    e5c27c2ae2f2 media: dvb-usb: Fix use-after-free access
    9185b3b1c143 media: dvbdev: Fix memory leak in dvb_media_device_free()
    92eb134265fa ext4: fix error code in ext4_commit_super
    c599462ab9c3 ext4: do not set SB_ACTIVE in ext4_orphan_cleanup()
    9c61387630a5 ext4: fix check to prevent false positive report of incorrect used inodes
    79c95130a52a kbuild: update config_data.gz only when the content of .config is changed
    19c8c34a8b80 x86/cpu: Initialize MSR_TSC_AUX if RDTSCP *or* RDPID is supported
    8d2be04dbb17 Revert 337f13046ff0 ("futex: Allow FUTEX_CLOCK_REALTIME with FUTEX_WAIT op")
    2b040d13b411 jffs2: check the validity of dstlen in jffs2_zlib_compress()
    564b1868f229 Fix misc new gcc warnings
    8aa728568202 security: commoncap: fix -Wstringop-overread warning
    be8db260f482 fuse: fix write deadlock
    dc21b424861a dm raid: fix inconclusive reshape layout on fast raid4/5/6 table reload sequences
    6920cef604fa md/raid1: properly indicate failure when ending a failed write request
    5f2d256875a5 crypto: rng - fix crypto_rng_reset() refcounting when !CRYPTO_STATS
    63a25b715633 tpm: vtpm_proxy: Avoid reading host log when using a virtual device
    2f12258b5224 tpm: efi: Use local variable for calculating final log size
    2af501de8f43 intel_th: pci: Add Alder Lake-M support
    ab5d5c9dfd02 powerpc: fix EDEADLOCK redefinition error in uapi/asm/errno.h
    abf3573ef4e7 powerpc/eeh: Fix EEH handling for hugepages in ioremap space.
    077f526fe3cc jffs2: Fix kasan slab-out-of-bounds problem
    ad3f360ef20f Input: ili210x - add missing negation for touch indication on ili210x
    6be0e4b59314 NFSv4: Don't discard segments marked for return in _pnfs_return_layout()
    12ccd59941e3 NFS: Don't discard pNFS layout segments that are marked for return
    504632a3577a ACPI: GTDT: Don't corrupt interrupt mappings on watchdow probe failure
    490ad0a23904 openvswitch: fix stack OOB read while fragmenting IPv4 packets
    9508634b2b18 mlxsw: spectrum_mr: Update egress RIF list before route's action
    27a130638406 f2fs: fix to avoid out-of-bounds memory access
    6c9b98a66d0a ubifs: Only check replay with inode type to judge if inode linked
    310efc95c72c virtiofs: fix memory leak in virtio_fs_probe()
    2b28e26bd776 Makefile: Move -Wno-unused-but-set-variable out of GCC only block
    13a474c01353 arm64/vdso: Discard .note.gnu.property sections in vDSO
    f40bf82bf693 btrfs: fix race when picking most recent mod log operation for an old root
    2bc0131d5be0 ALSA: hda/realtek: Add quirk for Intel Clevo PCx0Dx
    45392da1bd91 ALSA: hda/realtek: fix static noise on ALC285 Lenovo laptops
    ee47a6414950 ALSA: hda/realtek: fix mic boost on Intel NUC 8
    d143cd1f8f6b ALSA: hda/realtek: GA503 use same quirks as GA401
    f2b75e357816 ALSA: usb-audio: Add dB range mapping for Sennheiser Communications Headset PC 8
    2136ecfcf3d9 ALSA: usb-audio: More constifications
    adba683c573d ALSA: usb-audio: Explicitly set up the clock selector
    93588ea2fbd4 ALSA: sb: Fix two use after free in snd_sb_qsound_build
    1666f1ac383f ALSA: hda/conexant: Re-order CX5066 quirk table entries
    b53b72ef83ff ALSA: emu8000: Fix a use after free in snd_emu8000_create_mixer
    a65181cfd953 s390/archrandom: add parameter check for s390_arch_random_generate
    ef00a39e2c78 scsi: libfc: Fix a format specifier
    02c13900477c mfd: arizona: Fix rumtime PM imbalance on error
    0d0e6dbd5fca scsi: lpfc: Remove unsupported mbox PORT_CAPABILITIES logic
    0756818b4d3b scsi: lpfc: Fix error handling for mailboxes completed in MBX_POLL mode
    f67fc8095bbe scsi: lpfc: Fix crash when a REG_RPI mailbox fails triggering a LOGO response
    82bc134b93b5 drm/amdgpu: fix NULL pointer dereference
    4b65414ea416 amdgpu: avoid incorrect %hu format string
    443fdd7b4bc3 drm/amdkfd: Fix cat debugfs hang_hws file causes system crash bug
    c49981759450 drm/msm/mdp5: Do not multiply vclk line count by 100
    336e7e758640 drm/msm/mdp5: Configure PP_SYNC_HEIGHT to double the vtotal
    b56ad4febe67 sched/fair: Ignore percpu threads for imbalance pulls
    53995be39f93 media: gscpa/stv06xx: fix memory leak
    3a855efb5426 media: dvb-usb: fix memory leak in dvb_usb_adapter_init
    4ca05c0e04d5 media: platform: sti: Fix runtime PM imbalance in regs_show
    47be6867d2d0 media: i2c: adv7842: fix possible use-after-free in adv7842_remove()
    f6b97476053d media: i2c: tda1997: Fix possible use-after-free in tda1997x_remove()
    cc265fb8e549 media: i2c: adv7511-v4l2: fix possible use-after-free in adv7511_remove()
    48304f37ce81 media: adv7604: fix possible use-after-free in adv76xx_remove()
    b76249a0a64e media: tc358743: fix possible use-after-free in tc358743_remove()
    b25324cf16f5 power: supply: s3c_adc_battery: fix possible use-after-free in s3c_adc_bat_remove()
    ac22a96c7388 power: supply: generic-adc-battery: fix possible use-after-free in gab_remove()
    e0be54070ba1 clk: socfpga: arria10: Fix memory leak of socfpga_clk on error return
    330753d38f26 media: vivid: update EDID
    71b75e6e2410 media: em28xx: fix memory leak
    cfb42c1bcce8 scsi: scsi_dh_alua: Remove check for ASC 24h in alua_rtpg()
    1a22a9fde806 scsi: smartpqi: Add new PCI IDs
    7973764b5454 scsi: smartpqi: Correct request leakage during reset operations
    7d77ac088fd7 ata: ahci: Disable SXS for Hisilicon Kunpeng920
    1f3daf672a13 mmc: sdhci-pci: Add PCI IDs for Intel LKF
    40fdaa2d149b scsi: qla2xxx: Fix use after free in bsg
    2cb8ce1d79d3 drm/vkms: fix misuse of WARN_ON
    3f67d5b6f943 scsi: qla2xxx: Always check the return value of qla24xx_get_isp_stats()
    48425948d2b6 drm/amd/display: fix dml prefetch validation
    cd148571eab0 drm/amd/display: Fix UBSAN warning for not a valid value for type '_Bool'
    e81f4da43b1d drm/amdgpu : Fix asic reset regression issue introduce by 8f211fe8ac7c4f
    0c0356ef2498 drm/amdkfd: Fix UBSAN shift-out-of-bounds warning
    888b482dbe26 drm/amdgpu: mask the xgmi number of hops reported from psp to kfd
    8d802ad28f9c power: supply: Use IRQF_ONESHOT
    bc73cb52997d media: gspca/sq905.c: fix uninitialized variable
    bec3831f5108 media: media/saa7164: fix saa7164_encoder_register() memory leak bugs
    20065ae0056a extcon: arizona: Fix various races on driver unbind
    32990455bd12 extcon: arizona: Fix some issues when HPDET IRQ fires after the jack has been unplugged
    22ee443ac784 power: supply: bq27xxx: fix power_avg for newer ICs
    5bc128a16333 media: imx: capture: Return -EPIPE from __capture_legacy_try_fmt()
    e18cee768a6e media: drivers: media: pci: sta2x11: fix Kconfig dependency on GPIOLIB
    a2e71d2d797d media: ite-cir: check for receive overflow
    78829d2ec594 scsi: target: pscsi: Fix warning in pscsi_complete_cmd()
    a27784943a96 scsi: lpfc: Fix pt2pt connection does not recover after LOGO
    52d2b4370a9d scsi: lpfc: Fix incorrect dbde assignment when building target abts wqe
    2b847dc1f662 drm/amd/display: Don't optimize bandwidth before disabling planes
    84b03026cccc drm/amd/display: Check for DSC support instead of ASIC revision
    bbf11337ded8 drm/qxl: release shadow on shutdown
    a7d964da5d17 drm: Added orientation quirk for OneGX1 Pro
    567c83104471 btrfs: convert logic BUG_ON()'s in replace_path to ASSERT()'s
    3260434687cc platform/x86: intel_pmc_core: Don't use global pmcdev in quirks
    229d2c12f1eb crypto: omap-aes - Fix PM reference leak on omap-aes.c
    5c411b92439d crypto: stm32/cryp - Fix PM reference leak on stm32-cryp.c
    e6d5c66737a9 crypto: stm32/hash - Fix PM reference leak on stm32-hash.c
    e7138a6d6a4d phy: phy-twl4030-usb: Fix possible use-after-free in twl4030_usb_remove()
    349f95248bce intel_th: Consistency and off-by-one fix
    86f4ac7ca448 tty: n_gsm: check error while registering tty devices
    665dbcf35508 usb: core: hub: Fix PM reference leak in usb_port_resume()
    b8035ac2ad08 usb: musb: fix PM reference leak in musb_irq_work()
    972639ed7b90 spi: qup: fix PM reference leak in spi_qup_remove()
    0adc0e0c87ff spi: omap-100k: Fix reference leak to master
    d6aa2fcd8566 spi: dln2: Fix reference leak to master
    99569ac2e97c xhci: fix potential array out of bounds with several interrupters
    99c82db050ae xhci: check control context is valid before dereferencing it.
    6f34d2ab34ed usb: xhci-mtk: support quirk to disable usb2 lpm
    d95748f23084 perf/arm_pmu_platform: Fix error handling
    fe53f8fd64d7 tee: optee: do not check memref size on return from Secure World
    dda2bc82891c x86/build: Propagate $(CLANG_FLAGS) to $(REALMODE_FLAGS)
    ee68dd4e502f PCI: PM: Do not read power state in pci_enable_device_flags()
    52b4b9d250d4 usb: xhci: Fix port minor revision
    c13c8354fd58 usb: dwc3: gadget: Ignore EP queue requests during bus reset
    9f3c7e0074b7 usb: gadget: f_uac1: validate input parameters
    a10fb8a1c70a usb: gadget: f_uac2: validate input parameters
    a629f6bc034a genirq/matrix: Prevent allocation counter corruption
    1b2207a19664 usb: webcam: Invalid size of Processing Unit Descriptor
    4cc65c749d58 usb: gadget: uvc: add bInterval checking for HS mode
    28da0edb56ae crypto: qat - fix unmap invalid dma address
    69f1a9702d3f crypto: api - check for ERR pointers in crypto_destroy_tfm()
    8ac79bdcc0c4 spi: ath79: remove spi-master setup and cleanup assignment
    4d6a20917fda spi: ath79: always call chipselect function
    e24b9cded4bc staging: wimax/i2400m: fix byte-order issue
    ce64f57a0fe0 bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first
    4928d3b02083 fbdev: zero-fill colormap in fbcmap.c
    1c5cb86cdd7f posix-timers: Preserve return value in clock_adjtime32()
    e07d0fd8d64f intel_th: pci: Add Rocket Lake CPU support
    b6635915a3c3 btrfs: fix metadata extent leak after failure to create subvolume
    93f3339b22ba cifs: Return correct error code from smb2_get_enc_key
    e7ea8e46e3b7 irqchip/gic-v3: Do not enable irqs when handling spurious interrups
    13b0a28e6fef modules: inherit TAINT_PROPRIETARY_MODULE
    cd5a738e28ac modules: return licensing information from find_symbol
    c4698910a9af modules: rename the licence field in struct symsearch to license
    7500d4999431 modules: unexport __module_address
    ad6d414703d7 modules: unexport __module_text_address
    86de29b833e6 modules: mark each_symbol_section static
    79100b191e71 modules: mark find_symbol static
    6e38daf2e5db modules: mark ref_module static
    909a01b95120 mmc: core: Fix hanging on I/O during system suspend for removable cards
    c80524b9e418 mmc: core: Set read only for SD cards with permanent write protect bit
    42998c98ce9f mmc: core: Do a power cycle when the CMD11 fails
    1b45fcf11d28 mmc: block: Issue a cache flush only when it's enabled
    2fb68f705c56 mmc: block: Update ext_csd.cache_ctrl if it was written
    4e438ff2d967 mmc: sdhci-pci: Fix initialization of some SD cards for Intel BYT-based controllers
    698df555cc5f mmc: sdhci: Check for reset prior to DMA address unmap
    0d8941b9b2d3 mmc: uniphier-sd: Fix a resource leak in the remove function
    06e48bb631d3 mmc: uniphier-sd: Fix an error handling path in uniphier_sd_probe()
    21171ede4337 scsi: mpt3sas: Block PCI config access from userspace during reset
    77509a238547 scsi: qla2xxx: Fix crash in qla2xxx_mqueuecommand()
    e45acaddd64b spi: spi-ti-qspi: Free DMA resources
    c57af0be7722 erofs: add unsupported inode i_format check
    49fc21a47e93 mtd: rawnand: atmel: Update ecc_stats.corrected counter
    3ef6813bb3a4 mtd: spinand: core: add missing MODULE_DEVICE_TABLE()
    fd1772305002 ecryptfs: fix kernel panic with null dev_name
    e057164f8731 arm64: dts: mt8173: fix property typo of 'phys' in dsi node
    527edae13d24 arm64: dts: marvell: armada-37xx: add syscon compatible to NB clk node
    34ae75d699fd ARM: 9056/1: decompressor: fix BSS size calculation for LLVM ld.lld
    0b641b25870f ftrace: Handle commands when closing set_ftrace_filter file
    6a4f786f8eb5 ACPI: custom_method: fix a possible memory leak
    72814a94c38a ACPI: custom_method: fix potential use-after-free issue
    b691331218d0 s390/disassembler: increase ebpf disasm buffer size

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 608dac4588..1ef68b8e08 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ccf88860c16c9f2fae90da1ba46074b09d98a0a2"
-SRCREV_meta ?= "8b98855aa2eae3f9c30601a0f8da281cb3b5e4b7"
+SRCREV_machine ?= "8cfbd0ce8afc58d4e73765fc2b84d0cf4144f0f1"
+SRCREV_meta ?= "19fddc3eadeb05f3ba6001833ccfd32257251301"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.117"
+LINUX_VERSION ?= "5.4.118"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 61779fbcf6..bc8dff54f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.117"
+LINUX_VERSION ?= "5.4.118"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "2c64c9c438ec34cbdef929338fea304b726cac3f"
-SRCREV_machine ?= "2744384587f1de0551f517cc7be1984077e95329"
-SRCREV_meta ?= "8b98855aa2eae3f9c30601a0f8da281cb3b5e4b7"
+SRCREV_machine_qemuarm ?= "856d692bf93a8b33482d05c7dfc76f8f51506c16"
+SRCREV_machine ?= "f54311bd4aeddc4f600d3553054891a8198f8f72"
+SRCREV_meta ?= "19fddc3eadeb05f3ba6001833ccfd32257251301"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index c1270bc78e..ab92811062 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "00362a9e9116bf12dd4ae468caf822b85106cc7c"
-SRCREV_machine_qemuarm64 ?= "2744384587f1de0551f517cc7be1984077e95329"
-SRCREV_machine_qemumips ?= "603a0985e29b703dbb535c72f08eb6f9119e0863"
-SRCREV_machine_qemuppc ?= "2744384587f1de0551f517cc7be1984077e95329"
-SRCREV_machine_qemuriscv64 ?= "2744384587f1de0551f517cc7be1984077e95329"
-SRCREV_machine_qemux86 ?= "2744384587f1de0551f517cc7be1984077e95329"
-SRCREV_machine_qemux86-64 ?= "2744384587f1de0551f517cc7be1984077e95329"
-SRCREV_machine_qemumips64 ?= "21a474630e254696cfd46f1ee9c202ab8e85e38f"
-SRCREV_machine ?= "2744384587f1de0551f517cc7be1984077e95329"
-SRCREV_meta ?= "8b98855aa2eae3f9c30601a0f8da281cb3b5e4b7"
+SRCREV_machine_qemuarm ?= "161dbe7187d5de2c6c0f7ab8ab43041e6f1d42bc"
+SRCREV_machine_qemuarm64 ?= "f54311bd4aeddc4f600d3553054891a8198f8f72"
+SRCREV_machine_qemumips ?= "7731d7417fce687fd880da263e12d4cd96ba5bc5"
+SRCREV_machine_qemuppc ?= "f54311bd4aeddc4f600d3553054891a8198f8f72"
+SRCREV_machine_qemuriscv64 ?= "f54311bd4aeddc4f600d3553054891a8198f8f72"
+SRCREV_machine_qemux86 ?= "f54311bd4aeddc4f600d3553054891a8198f8f72"
+SRCREV_machine_qemux86-64 ?= "f54311bd4aeddc4f600d3553054891a8198f8f72"
+SRCREV_machine_qemumips64 ?= "e1a389552633ff7df9f8d003503a69f844539db7"
+SRCREV_machine ?= "f54311bd4aeddc4f600d3553054891a8198f8f72"
+SRCREV_meta ?= "19fddc3eadeb05f3ba6001833ccfd32257251301"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.117"
+LINUX_VERSION ?= "5.4.118"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

