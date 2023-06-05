Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2310EC7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 16:29:04 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.13450.1685982538774257666
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 09:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RrKyniuQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-3f86875b122so14494041cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 09:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685982538; x=1688574538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KW086FTgsL1qMuJVgQVJYyjDtUp3+liDgOeyeiZ6lb8=;
        b=RrKyniuQMm32IrQ7/GdXxnCATaQGjM/H8x8xXNLzM775IYkxwe8dwc4J0kh3SyPKZK
         SyTNBFvzZ5uuh6dR8UfFl2P2LIfJZsr7v13fAd9SZsBp96k1zwtOQAzeb0oepUSzKLrQ
         1GxKk7O6Ull+fZYpVG2zK5Q35de3XUTzfF4NEhhRFbNAeqYTOjak/ulzUkDN4FHSW936
         biaIBjbE3HODAzVHnGWslSqQiv6Nse+kUnMCGIywKJcWuNrfRQdxH4jI9IYQYK8kT/gm
         AkGsaIGq7vCG1jECThpT5157U5712LLiWiYJFw+EVVLtPMz4nTmP4susmt5O1ThwFEas
         HPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685982538; x=1688574538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KW086FTgsL1qMuJVgQVJYyjDtUp3+liDgOeyeiZ6lb8=;
        b=FbwHt+dOXvjU5V7iZDyMZan6ydffigyeYbdlhqxavip8D/l3Yn4UZhU8oFpxo57emB
         5KN9Y6hBMluFD9fJZ/gEvkRyRzMBfeGEyAkDBU0vSehQTPN8pKYXaTx27ClNiHwf8GQb
         arzfEJ/GpCSaFqd1CfxOD+Ps4EUK/rRiUUGxyzVJ3f1JjYnDBPhDmeKRmHjijnAdLojL
         h8isUh4B7oL6LnFnbjBrq43OwqZ6uZtVn1Ko9GnRfErTYw6V+6ssc8doxspFu20pn0+F
         90yy0DU4SZtcUVNp7OytRq/chrDtJ5N6n2uQjRH3tl/fZQgpknAXsMKmOVyFNGgWDEUS
         Vhkg==
X-Gm-Message-State: AC+VfDytfErTj1ktY0PXtWV5pw/+kimJKocRR5yJHSedePn75iJ82EM0
	PhCIP3E1eaAIL5bouRrCMPVGMqZYazW8zw==
X-Google-Smtp-Source: ACHHUZ6OfI8wtVrg4VppZZNY6ME2oWLKAyHLRht0yt02DXwViM/F6ktftHsyfdcPN1coN3TsuPOSIw==
X-Received: by 2002:ac8:5b44:0:b0:3f4:eb26:6d42 with SMTP id n4-20020ac85b44000000b003f4eb266d42mr7734951qtw.63.1685982537585;
        Mon, 05 Jun 2023 09:28:57 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id r16-20020ac84250000000b003e388264753sm4785309qtm.65.2023.06.05.09.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 09:28:57 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/6.1: update to v6.1.31
Date: Mon,  5 Jun 2023 12:28:54 -0400
Message-Id: <20230605162855.3700685-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 16:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182395

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d2869ace6eeb Linux 6.1.31
    2f32b89d8120 net: phy: mscc: add VSC8502 to MODULE_DEVICE_TABLE
    3bcb97e4241b 3c589_cs: Fix an error handling path in tc589_probe()
    9540765d1882 net/smc: Reset connection when trying to use SMCRv2 fails.
    be4022669e66 regulator: mt6359: add read check for PMIC MT6359
    22157f744581 firmware: arm_ffa: Set reserved/MBZ fields to zero in the memory descriptors
    1ae70faa86fd arm64: dts: imx8mn-var-som: fix PHY detection bug by adding deassert delay
    3e8a82fb55a6 net/mlx5: Devcom, serialize devcom registration
    eaa365c10459 net/mlx5: Devcom, fix error flow in mlx5_devcom_register_device
    411e4d6caa7f net/mlx5: Collect command failures data only for known commands
    390aa5c006b3 net/mlx5: Fix error message when failing to allocate device memory
    59dd110ca241 net/mlx5: DR, Check force-loopback RC QP capability independently from RoCE
    b17294e7aa8c net/mlx5: Handle pairing of E-switch via uplink un/load APIs
    e501ab136691 net/mlx5: DR, Fix crc32 calculation to work on big-endian (BE) CPUs
    6f0dce5f7822 net/mlx5e: do as little as possible in napi poll when budget is 0
    00959a1bad58 net/mlx5e: Use correct encap attribute during invalidation
    362063df6cee net/mlx5e: Fix deadlock in tc route query code
    2051f762c508 net/mlx5e: Fix SQ wake logic in ptp napi_poll context
    47b4f741a3f6 platform/mellanox: mlxbf-pmc: fix sscanf() error checking
    04238c23853a forcedeth: Fix an error handling path in nv_probe()
    0392c9185d71 sctp: fix an issue that plpmtu can never go to complete state
    c9e09b070d0b cxl: Wait Memory_Info_Valid before access memory related info
    ad72cb5899ce ASoC: Intel: avs: Access path components under lock
    6ae9cf40b4e0 ASoC: Intel: avs: Fix declaration of enum avs_channel_config
    5eaaad19c82c ASoC: Intel: Skylake: Fix declaration of enum skl_ch_cfg
    d8cfe5ccc98e x86/show_trace_log_lvl: Ensure stack pointer is aligned, again
    a7edc86e149e xen/pvcalls-back: fix double frees with pvcalls_new_active_socket()
    53384076f743 x86/pci/xen: populate MSI sysfs entries
    84b211b02894 ARM: dts: imx6qdl-mba6: Add missing pvcie-supply regulator
    225a5f394b09 coresight: Fix signedness bug in tmc_etr_buf_insert_barrier_packet()
    55224690958c platform/x86: ISST: Remove 8 socket limit
    f34428b5a373 regulator: pca9450: Fix BUCK2 enable_mask
    ccc6e9ded63b fs: fix undefined behavior in bit shift for SB_NOUSER
    dfc5aaa57f52 firmware: arm_ffa: Fix FFA device names for logical partitions
    ad73dc7263ea firmware: arm_ffa: Check if ffa_driver remove is present before executing
    06ec5be89118 optee: fix uninited async notif value
    9c744c6ff238 power: supply: sbs-charger: Fix INHIBITED bit for Status reg
    71e60a58d7f6 power: supply: bq24190: Call power_supply_changed() after updating input current
    1f02bfd5d94c power: supply: bq25890: Call power_supply_changed() after updating input current or voltage
    57842035d298 power: supply: bq27xxx: After charger plug in/out wait 0.5s for things to stabilize
    221f7cb12285 power: supply: bq27xxx: Ensure power_supply_changed() is called on current sign changes
    3c573e7910c6 power: supply: bq27xxx: Move bq27xxx_battery_update() down
    9108ede08d7a power: supply: bq27xxx: Add cache parameter to bq27xxx_battery_current_and_status()
    d952a1eaafcc power: supply: bq27xxx: Fix poll_interval handling and races on remove
    e65fee45687f power: supply: bq27xxx: Fix I2C IRQ race on remove
    d746fbf4f09c power: supply: bq27xxx: Fix bq27xxx_battery_update() race condition
    e1073f81478f power: supply: mt6360: add a check of devm_work_autocancel in mt6360_charger_probe
    2ac38f130e5b power: supply: leds: Fix blink to LED on transition
    94373413e13d cifs: mapchars mount option ignored
    91dd8aab9c9f ipv6: Fix out-of-bounds access in ipv6_find_tlv()
    9bc1dbfd9158 lan966x: Fix unloading/loading of the driver
    1a9e80f757bb bpf: fix a memory leak in the LRU and LRU_PERCPU hash maps
    177ee41f6162 bpf: Fix mask generation for 32-bit narrow loads of 64-bit fields
    a1d7c357f4dc octeontx2-pf: Fix TSOv6 offload
    4883d9e2a221 selftests: fib_tests: mute cleanup error message
    722af06e6100 drm: fix drmm_mutex_init()
    cc18b4685910 net: fix skb leak in __skb_tstamp_tx()
    8d81d3b0ed36 ASoC: lpass: Fix for KASAN use_after_free out of bounds
    53764a17f5d8 media: radio-shark: Add endpoint checks
    d5dba4b7bf90 USB: sisusbvga: Add endpoint checks
    09e9d1f52f97 USB: core: Add routines for endpoint checks in old drivers
    2a112f04629f udplite: Fix NULL pointer dereference in __sk_mem_raise_allocated().
    ed66e6327a69 net: fix stack overflow when LRO is disabled for virtual interfaces
    c8fdf7feca77 fbdev: udlfb: Fix endpoint check
    d7fff52c99d5 debugobjects: Don't wake up kswapd from fill_pool()
    8694853768e3 irqchip/mips-gic: Use raw spinlock for gic_lock
    dc1b7641a989 irqchip/mips-gic: Don't touch vl_map if a local interrupt is not routable
    4ca6b06e9be2 x86/topology: Fix erroneous smp_num_siblings on Intel Hybrid platforms
    ed0ef89508d2 perf/x86/uncore: Correct the number of CHAs on SPR
    f3078be2febb drm/amd/amdgpu: limit one queue per gang
    34570f85a282 selftests/memfd: Fix unknown type name build failure
    931ea1ed31be binder: fix UAF of alloc->vma in race with munmap()
    e1e198eff1fb binder: fix UAF caused by faulty buffer cleanup
    d7cee853bcb0 binder: add lockless binder_alloc_(set|get)_vma()
    72a94f8c14a1 Revert "android: binder: stop saving a pointer to the VMA"
    7e6b8548549e Revert "binder_alloc: add missing mmap_lock calls when using the VMA"
    8069bcaa5b39 drm/amd/pm: Fix output of pp_od_clk_voltage
    6acfbdda4d06 drm/amd/pm: add missing NotifyPowerSource message mapping for SMU13.0.7
    8756863c7fe0 drm/radeon: reintroduce radeon_dp_work_func content
    3897ac532af0 drm/mgag200: Fix gamma lut not initialized.
    3970ee926e7e dt-binding: cdns,usb3: Fix cdns,on-chip-buff-size type
    937264cd9aab btrfs: use nofs when cleaning up aborted transactions
    63e12910b7f5 gpio: mockup: Fix mode of debugfs files
    b49706d1799a parisc: Handle kprobes breakpoints only in kernel context
    5596e2ef5f1a parisc: Enable LOCKDEP support
    d935edd510d7 parisc: Allow to reboot machine after system halt
    c49ffd89b66e parisc: Fix flush_dcache_page() for usage from irq context
    c0993b463fe7 parisc: Handle kgdb breakpoints only in kernel context
    e1f14a407140 parisc: Use num_present_cpus() in alternative patching code
    bd90ac0002d1 xtensa: add __bswap{si,di}2 helpers
    522bbbfcb612 xtensa: fix signal delivery to FDPIC process
    084566050891 m68k: Move signal frame following exception on 68020/030
    6147745d43ff net: cdc_ncm: Deal with too low values of dwNtbOutMaxSize
    da1e8adab366 ASoC: rt5682: Disable jack detection interrupt during suspend
    72c28207c19c power: supply: bq25890: Fix external_power_changed race
    0456b912121e power: supply: axp288_fuel_gauge: Fix external_power_changed race
    7d5e0150eeec mmc: block: ensure error propagation for non-blk
    a24aec210aa5 mmc: sdhci-esdhc-imx: make "no-mmc-hs400" works
    0d97634ad498 SUNRPC: Don't change task->tk_status after the call to rpc_exit_task
    40599969ff58 ALSA: hda/realtek: Enable headset onLenovo M70/M90
    7d3d306f159e ALSA: hda: Fix unhandled register update during auto-suspend period
    5222e81afa26 ALSA: hda/ca0132: add quirk for EVGA X299 DARK
    688c9af6e5fc platform/x86/intel/ifs: Annotate work queue on stack so object debug does not complain
    c26b9e193172 x86/mm: Avoid incomplete Global INVLPG flushes
    4eb600f386ef arm64: Also reset KASAN tag if page is not PG_mte_tagged
    8bdf47f9dbea ocfs2: Switch to security_inode_init_security()
    28ee628fff1e drm/amd/display: hpd rx irq not working with eDP interface
    7bfd4c0ebcb4 net: dsa: mv88e6xxx: Add RGMII delay to 88E6320
    66ede2e4235f platform/x86: hp-wmi: Fix cast to smaller integer type warning
    0dbc898f5917 skbuff: Proactively round up to kmalloc bucket size
    ac2f5739fdca drm/amdgpu/mes11: enable reg active poll
    a2fe4534bb38 drm/amd/amdgpu: update mes11 api def
    ae9e65319f99 watchdog: sp5100_tco: Immediately trigger upon starting.
    7cd46930b8bf tpm: Prevent hwrng from activating during resume
    25d38d5eaa1f tpm: Re-enable TPM chip boostrapping non-tpm_tis TPM drivers
    e76f61a2c523 tpm, tpm_tis: startup chip before testing for interrupts
    9953dbf65f92 tpm_tis: Use tpm_chip_{start,stop} decoration inside tpm_tis_resume
    c5a5d33886a7 tpm, tpm_tis: Only handle supported interrupts
    5c4c8075bc8a tpm, tpm_tis: Avoid cache incoherency in test for interrupts
    1ec145277a26 usb: dwc3: fix gadget mode suspend interrupt handler issue

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 597be2668d..3b8a47b63a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "031b5c5dd6ec09850fa783dfe07fc79543f46181"
-SRCREV_meta ?= "922bc1fa7422e1dd9192b1859c2904af145be7c5"
+SRCREV_machine ?= "a49ca8357f930ba63aa382ad291f4ddf1e6db427"
+SRCREV_meta ?= "61b6de9402762b8e9fa21c0f1c463591048cd194"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.30"
+LINUX_VERSION ?= "6.1.31"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 9c91d0b12e..4282bb152d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.30"
+LINUX_VERSION ?= "6.1.31"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
-SRCREV_meta ?= "922bc1fa7422e1dd9192b1859c2904af145be7c5"
+SRCREV_machine ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
+SRCREV_meta ?= "61b6de9402762b8e9fa21c0f1c463591048cd194"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 90c4ce270c..6ae13428a9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -20,25 +20,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "184474571931cc506e67b1e5aeb40feb1d7df04e"
-SRCREV_machine:qemuarm64 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
-SRCREV_machine:qemuloongarch64 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
-SRCREV_machine:qemumips ?= "e87f9e19a7f8c2312ba62f0ba7426728c8191f1a"
-SRCREV_machine:qemuppc ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
-SRCREV_machine:qemuriscv64 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
-SRCREV_machine:qemuriscv32 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
-SRCREV_machine:qemux86 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
-SRCREV_machine:qemux86-64 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
-SRCREV_machine:qemumips64 ?= "7c17dfad5a3bff04c30b40c2fffb6f1f8f8f095e"
-SRCREV_machine ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
-SRCREV_meta ?= "922bc1fa7422e1dd9192b1859c2904af145be7c5"
+SRCREV_machine:qemuarm ?= "9e67e588e7567894a3ad725c93013f0c1d178e48"
+SRCREV_machine:qemuarm64 ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
+SRCREV_machine:qemuloongarch64 ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
+SRCREV_machine:qemumips ?= "51c5e36b6ccfd16103c965ac6c815e1823170994"
+SRCREV_machine:qemuppc ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
+SRCREV_machine:qemuriscv64 ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
+SRCREV_machine:qemuriscv32 ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
+SRCREV_machine:qemux86 ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
+SRCREV_machine:qemux86-64 ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
+SRCREV_machine:qemumips64 ?= "85306ca86b05b98babf1b17902eaae30d8b4911a"
+SRCREV_machine ?= "456d730e6202dd0fc120322d64cf70a2cbccc572"
+SRCREV_meta ?= "61b6de9402762b8e9fa21c0f1c463591048cd194"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a343b0dd87b42ba9d508fbf7d0c06f744c2e0954"
+SRCREV_machine:class-devupstream ?= "d2869ace6eeb8ea8a6e70e6904524c5a6456d3fb"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -47,7 +47,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.30"
+LINUX_VERSION ?= "6.1.31"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


