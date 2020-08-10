Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.37293.1597028401963161765
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 20:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HrTaxjE1;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.196, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f196.google.com with SMTP id p8so4083587pgn.13
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 20:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=uBPfAkBtRn4WELGm+5EU7EEyyfbqtkRLVQ/yVI3GH6o=;
        b=HrTaxjE1efrFX+vd9qFr0jYCeYYkvfUaCClvrM6DOgZ2CgPrVY/MnhGZWbxBn9s6mb
         65gIwsAOXiVMI73ywtIerVzk7g4ttsqLrE4y4Jq3oMdQ75HnG3xJskA1LMW7qnXbJ8JN
         xuIUibfb72V9ohqgFiBUCCXyLbxfIwxRDn9yKeX5EkOBG81O6cx8gCx5O/3/7KPR9L85
         I4rGP5GZa5qWj1fgT1o27KKxanCSgSBf4zDRyRHYMJidntI/ai08gAqQupzvuD6Rmk1y
         Kw3AwwqghPokI1PD+4jlK1xUm6zJgfcRZwbc/tUdd6TlOxW2Dav/pc7QdPTAzQuv7cpk
         Ovlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=uBPfAkBtRn4WELGm+5EU7EEyyfbqtkRLVQ/yVI3GH6o=;
        b=Z/uk5QHPTHe+emKpwZRR+qolvsJv60/Z1kmtP52b2nhXcYM3KRuGoc5gXXw9AFXCqy
         h3QITFFE2AbnuE6/BPfBCp6QaoDaEPiX6u/lhLtjepaQoWnVxonGpqYRmW3BEM21BPKO
         G5SQt7n54n7YKFiPCFz2zGN/qUU9MYDD9H9B524LFLjhgBaAuexTNoTXk6LTbQ1M7jrO
         ZsvYW4vmPBAPB85IxJrcOXj/0vTUaT9hvRuV++M4ilqW8/q5JusF58nTbiVayUsa9dho
         SVjR1CIKKJWQtI10gKbXNJnzSw66nPC/sKf3zbidBfabQ7YKK9XMjBML2hOsT24CgbOn
         RQVw==
X-Gm-Message-State: AOAM531mmqRE1+0RHYwpvYn4AhoU2C+BwPsyML/E4xWnxQGQ6ach6ZSM
	k4aHsMU64kq8OJ8O2b/KxORWUmXgf/FwkA==
X-Google-Smtp-Source: ABdhPJx628s+pqLTB+QDDX9RFgFgMBKr10kdoreZdREbUxwAIlW/+bJqn+F6GUzZdpV+gEyMnJFMsw==
X-Received: by 2002:a62:d149:: with SMTP id t9mr23634237pfl.59.1597028400631;
        Sun, 09 Aug 2020 20:00:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.19.59.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 20:00:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/19] linux-yocto/5.4: update to v5.4.54
Date: Sun,  9 Aug 2020 16:59:14 -1000
Message-Id: <f32c1c92ddc1c1a921c4e46e59d6cb01a705edd5.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597028036.git.steve@sakoman.com>
References: <cover.1597028036.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    58a12e3368db Linux 5.4.54
    c15d59b94511 ath9k: Fix regression with Atheros 9271
    e6eb815beccc ath9k: Fix general protection fault in ath9k_hif_usb_rx_cb
    6d4448ca54bc dm integrity: fix integrity recalculation that is improperly skipped
    2ca71b807383 ASoC: topology: fix tlvs in error handling for widget_dmixer
    a4fd00dd8299 ASoC: topology: fix kernel oops on route addition error
    e60e53e685d9 ASoC: qcom: Drop HAS_DMA dependency to fix link failure
    8f64dc9e1d49 ASoC: rt5670: Add new gpio1_is_ext_spk_en quirk and enable it on the Lenovo Miix 2 10
    697bd3e4aa4b x86, vmlinux.lds: Page-align end of ..page_aligned sections
    c89af82f64a0 parisc: Add atomic64_set_release() define to avoid CPU soft lockups
    d1bab3cf71dd drm/amd/powerplay: fix a crash when overclocking Vega M
    33ab3f2dc444 drm/amdgpu: Fix NULL dereference in dpm sysfs handlers
    c3de96686db9 mmc: sdhci-of-aspeed: Fix clock divider calculation
    615f44e04792 io-mapping: indicate mapping failure
    40c5836b4a48 khugepaged: fix null-pointer dereference due to race
    95750e1edbcd mm: memcg/slab: fix memory leak at non-root kmem_cache destroy
    db949f60d983 mm/memcg: fix refcount error while moving and swapping
    549bfc142706 mm/mmap.c: close race between munmap() and expand_upwards()/downwards()
    5835e6d5988f Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
    23e8b741c8a1 vt: Reject zero-sized screen buffer size.
    028b478f2231 fbdev: Detect integer underflow at "struct fbcon_ops"->clear_margins.
    bf331efc8ea4 /dev/mem: Add missing memory barriers for devmem_inode
    3c52751df236 serial: 8250_mtk: Fix high-speed baud rates clamping
    af811869db06 serial: 8250: fix null-ptr-deref in serial8250_start_tx()
    fb8d832978bb serial: tegra: fix CREAD handling for PIO
    c76a1dacc28d staging: comedi: addi_apci_1564: check INSN_CONFIG_DIGITAL_TRIG shift
    178a09b0fb0d staging: comedi: addi_apci_1500: check INSN_CONFIG_DIGITAL_TRIG shift
    7ee8d78bc12b staging: comedi: ni_6527: fix INSN_CONFIG_DIGITAL_TRIG support
    747558b1c737 staging: comedi: addi_apci_1032: check INSN_CONFIG_DIGITAL_TRIG shift
    c9afe420c53a staging: wlan-ng: properly check endpoint types
    a44c859323c2 tty: xilinx_uartps: Really fix id assignment
    f32718cfa5db iwlwifi: mvm: don't call iwl_mvm_free_inactive_queue() under RCU
    3e84602475f7 Revert "cifs: Fix the target file was deleted when rename failed."
    86894c3797ed usb: xhci: Fix ASM2142/ASM3142 DMA addressing
    1d91547f2fc8 usb: xhci-mtk: fix the failure of bandwidth allocation
    93f1e16af4a5 binder: Don't use mmput() from shrinker function.
    35728cac176a RISC-V: Upgrade smp_mb__after_spinlock() to iorw,iorw
    5345ede4acde drivers/perf: Prevent forced unbinding of PMU drivers
    0821295b23cc asm-generic/mmiowb: Allow mmiowb_set_pending() when preemptible()
    90e78ec7d725 x86: math-emu: Fix up 'cmp' insn for clang ias
    679fe09188c1 arm64: Use test_tsk_thread_flag() for checking TIF_SINGLESTEP
    7fc7942f52cf drivers/perf: Fix kernel panic when rmmod PMU modules during perf sampling
    347f735ca82b ALSA: hda/realtek - fixup for yet another Intel reference board
    30a17b51d80d hwmon: (scmi) Fix potential buffer overflow in scmi_hwmon_probe()
    76361edb5559 platform/x86: asus-wmi: allow BAT1 battery name
    41a7fdf90ce2 platform/x86: ISST: Add new PCI device ids
    ace6e8b448b9 hwmon: (nct6775) Accept PECI Calibration as temperature source for NCT6798D
    6627a265c598 drm/amdgpu: fix preemption unit test
    ffb5604d2043 drm/amdgpu/gfx10: fix race condition for kiq
    c04a48251314 hwmon: (adm1275) Make sure we are reading enough data for different chips
    a2a380bd4575 usb: cdns3: trace: fix some endian issues
    103a90ad4e64 usb: cdns3: ep0: fix some endian issues
    89fe6eba178d usb: gadget: udc: gr_udc: fix memleak on error handling path in gr_ep_init()
    74ec2cc5bfff usb: dwc3: pci: add support for the Intel Jasper Lake
    c4c6363b8e68 usb: dwc3: pci: add support for the Intel Tiger Lake PCH -H variant
    4f5eb2735fa3 Input: elan_i2c - only increment wakeup count on touch
    186d3fe73e27 Input: synaptics - enable InterTouch for ThinkPad X1E 1st gen
    460c0dafea92 dmaengine: ioat setting ioat timeout as module parameter
    493aed3263ca dmaengine: fsl-edma: fix wrong tcd endianness for big-endian cpu
    6a3015ae35f5 hwmon: (aspeed-pwm-tacho) Avoid possible buffer overflow
    01d7bd8903d8 regmap: dev_get_regmap_match(): fix string comparison
    bbc0b6e18405 spi: mediatek: use correct SPI_CFG2_REG MACRO
    126a0ab6b83b ARM: dts: n900: remove mmc1 card detect gpio
    80fed4024c39 Input: add `SW_MACHINE_COVER`
    db886ec71fe4 dmaengine: tegra210-adma: Fix runtime PM imbalance on error
    5cbe437d5968 HID: apple: Disable Fn-key key-re-mapping on clone keyboards
    2c179ece3bfb HID: steam: fixes race in handling device list.
    5d273c566f7b HID: alps: support devices with report id 2
    08696a4ac9f6 HID: i2c-hid: add Mediacom FlexBook edge13 to descriptor override
    9ab9cfcc2d8f scripts/gdb: fix lx-symbols 'gdb.error' while loading modules
    22508bc315eb scripts/decode_stacktrace: strip basepath from all paths
    1e63d569fd2d serial: exar: Fix GPIO configuration for Sealevel cards based on XR17V35X
    a86abef1558a geneve: fix an uninitialized value in geneve_changelink()
    89b4f204ba43 bonding: check return value of register_netdevice() in bond_newlink()
    93bb40b79e84 i2c: i2c-qcom-geni: Fix DMA transfer race
    58637b3027db i2c: rcar: always clear ICSAR to avoid side effects
    e8b86b4d87e3 enetc: Remove the mdio bus on PF probe bailout
    9f2c2928b939 nfsd4: fix NULL dereference in nfsd/clients display code
    a44625dc0bd3 Revert "PCI/PM: Assume ports without DLL Link Active train links in 100 ms"
    9e3e96aa9a2e net: ethernet: ave: Fix error returns in ave_init
    eb2c32de1ce6 ipvs: fix the connection sync failed in some cases
    592614918431 qed: suppress false-positives interrupt error messages on HW init
    641bd96bd0ac qed: suppress "don't support RoCE & iWARP" flooding on HW init
    8d416c038a91 netdevsim: fix unbalaced locking in nsim_create()
    99a5e865cbe4 net: dsa: microchip: call phy_remove_link_mode during probe
    4997b311c01e net: hns3: fix error handling for desc filling
    107ea66643bd net: ag71xx: add missed clk_disable_unprepare in error path of probe
    34e93385c416 ionic: fix up filter locks and debug msgs
    42f5c49f7bbb ionic: use offset for ethtool regs data
    eac87543368c mlxsw: destroy workqueue when trap_register in mlxsw_emad_init
    9b52f23ad648 bonding: check error value of register_netdevice() immediately
    d11a27411c65 net: smc91x: Fix possible memory leak in smc_drv_probe()
    a2cdb4ebd84e drm: sun4i: hdmi: Fix inverted HPD result
    988e5d2179e4 ieee802154: fix one possible memleak in adf7242_probe
    7bf93c95a9b9 net: dp83640: fix SIOCSHWTSTAMP to update the struct with actual configuration
    e2e31a0bf7a1 ASoC: Intel: bytcht_es8316: Add missed put_device()
    613e7c52aaaa RDMA/mlx5: Use xa_lock_irq when access to SRQ table
    d0d394c71604 ax88172a: fix ax88172a_unbind() failures
    ad49d766612e vsock/virtio: annotate 'the_virtio_vsock' RCU pointer
    f826efa1c381 hippi: Fix a size used in a 'pci_free_consistent()' in an error handling path
    570b1c92cb48 fpga: dfl: fix bug in port reset handshake
    c73188295841 fpga: dfl: pci: reduce the scope of variable 'ret'
    57393e695a10 bnxt_en: Fix completion ring sizing with TPA enabled.
    9cc322773b20 bnxt_en: Fix race when modifying pause settings.
    38a66f3cdab4 btrfs: fix page leaks after failure to lock page for delalloc
    b04805a7e8a5 btrfs: fix mount failure caused by race with umount
    e333df0e4ac6 btrfs: fix double free on ulist after backref resolution failure
    f668e822950d ASoC: rt5670: Correct RT5670_LDO_SEL_MASK
    0f87dabe4415 ALSA: info: Drop WARN_ON() from buffer NULL sanity check
    aad343d571ae ALSA: hda/realtek: Fixed ALC298 sound bug by adding quirk for Samsung Notebook Pen S
    ee2f6a6b39be uprobes: Change handle_swbp() to send SIGTRAP with si_code=SI_KERNEL, to fix GDB regression
    ee08663380ff btrfs: reloc: clear DEAD_RELOC_TREE bit for orphan roots to prevent runaway balance
    044ca910276b btrfs: reloc: fix reloc root leak and NULL pointer dereference
    cb1225707041 SUNRPC reverting d03727b248d0 ("NFSv4 fix CLOSE not waiting for direct IO compeletion")
    02140e85d8e4 drm/amd/display: Check DMCU Exists Before Loading
    722c6e954c90 dmabuf: use spinlock to access dmabuf->name
    44838b956304 ARM: dts: imx6qdl-gw551x: fix audio SSI
    593221ce16af ARM: dts: imx6qdl-gw551x: Do not use 'simple-audio-card,dai-link'
    36f735554572 irqdomain/treewide: Keep firmware node unconditionally allocated
    8676732c3337 fuse: fix weird page warning
    96002e7485be drivers/firmware/psci: Fix memory leakage in alloc_init_cpu_groups()
    d0e40e510aa7 dm: use bio_uninit instead of bio_disassociate_blkg
    0ff9fce4abee scsi: dh: Add Fujitsu device to devinfo and dh lists
    3959567d870d scsi: mpt3sas: Fix error returns in BRM_status_show
    0c1337e94a54 drm/nouveau/i2c/g94-: increase NV_PMGR_DP_AUXCTL_TRANSACTREQ timeout
    fb50c5cf2105 net: sky2: initialize return of gm_phy_read
    b4397143da53 ALSA: hda/hdmi: fix failures at PCM open on Intel ICL and later
    e50116e51281 drivers/net/wan/lapbether: Fixed the value of hard_header_len
    0eced7636001 scsi: mpt3sas: Fix unlock imbalance
    0edfdefc0a9c xtensa: update *pos in cpuinfo_op.next
    df5b65f5df3e xtensa: fix __sync_fetch_and_{and,or}_4 declarations
    806ffec1a93a scsi: scsi_transport_spi: Fix function pointer check
    65c835ebe2cd mac80211: allow rx of mesh eapol frames with default rx key
    f55550d566e4 pinctrl: amd: fix npins for uart0 in kerncz_groups
    de0d953ee787 gpio: arizona: put pm_runtime in case of failure
    52083907ebfa gpio: arizona: handle pm_runtime_get_sync failure case
    4f80cb2c787f soc: qcom: rpmh: Dirt can only make you dirtier, not cleaner

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit de8c92604ead0ed00fb035fb0c915ec03f729537)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index c7e468671b..ec0beeba76 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ffd6790852ee25869539fdcabc7b89fb11743c0a"
-SRCREV_meta ?= "021a303c35cbd79f67666a8d4c4487751f96cbce"
+SRCREV_machine ?= "37478f8c6f336b271b26e783c14bcaf7fa8ca9a6"
+SRCREV_meta ?= "96883b38c16febfa10668d16fe08a5cdc3419872"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.53"
+LINUX_VERSION ?= "5.4.54"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 62e413e902..9881b09a9f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.53"
+LINUX_VERSION ?= "5.4.54"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "a64c0668d850dcd447004c41347497a4ff814476"
-SRCREV_machine ?= "1fe4ee7f680c3f69f620d68a5d2f7341e8db693b"
-SRCREV_meta ?= "021a303c35cbd79f67666a8d4c4487751f96cbce"
+SRCREV_machine_qemuarm ?= "58d322d637edd20fe24aadfdc0d621f63700c009"
+SRCREV_machine ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
+SRCREV_meta ?= "96883b38c16febfa10668d16fe08a5cdc3419872"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index d3fb451340..3829748269 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4b2316e7867e7ebc4c5354c7f5c0076dc57b9541"
-SRCREV_machine_qemuarm64 ?= "1fe4ee7f680c3f69f620d68a5d2f7341e8db693b"
-SRCREV_machine_qemumips ?= "1b740d5443ea367eae0b2ec71eb25964c10cebec"
-SRCREV_machine_qemuppc ?= "1fe4ee7f680c3f69f620d68a5d2f7341e8db693b"
-SRCREV_machine_qemuriscv64 ?= "1fe4ee7f680c3f69f620d68a5d2f7341e8db693b"
-SRCREV_machine_qemux86 ?= "1fe4ee7f680c3f69f620d68a5d2f7341e8db693b"
-SRCREV_machine_qemux86-64 ?= "1fe4ee7f680c3f69f620d68a5d2f7341e8db693b"
-SRCREV_machine_qemumips64 ?= "21a0d1ffcc340dcfe1e94afdc36870c6824b1112"
-SRCREV_machine ?= "1fe4ee7f680c3f69f620d68a5d2f7341e8db693b"
-SRCREV_meta ?= "021a303c35cbd79f67666a8d4c4487751f96cbce"
+SRCREV_machine_qemuarm ?= "84e270de836971e9fec8e6acbe06f8a2e1405916"
+SRCREV_machine_qemuarm64 ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
+SRCREV_machine_qemumips ?= "f418fa62aec041e4c3b5c28df853a8c636fa2f62"
+SRCREV_machine_qemuppc ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
+SRCREV_machine_qemuriscv64 ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
+SRCREV_machine_qemux86 ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
+SRCREV_machine_qemux86-64 ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
+SRCREV_machine_qemumips64 ?= "3a515b583c3efc896cafa4f7f1e784456a360f8f"
+SRCREV_machine ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
+SRCREV_meta ?= "96883b38c16febfa10668d16fe08a5cdc3419872"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.53"
+LINUX_VERSION ?= "5.4.54"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1

