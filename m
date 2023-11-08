Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69761C4167D
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:16:57 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.14761.1699453011941856697
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 06:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cR0AsvRQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-42135f8e08fso4392161cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 06:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699453011; x=1700057811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTgOGbaPvpKwO9XH3kuAorvZPKStj9dOWqnMlaC9gGQ=;
        b=cR0AsvRQ4d4mqj7jsX2e+99YE6TnCE1M3Q29spkJTNIZc4y8Fmtc4/qvZ6jZGqrQTC
         u4sK3EPgGEYRBcymj6sULvXpUWW125JSDgz0Z2cWbtVf116CKam2W3k7mt+tSRQNqv38
         XYK4QDbYqj+wKI7hKBj85tTNwzUcHLOZFUpZ9HulARi8x1edJSBSA8sr+EMMStmQOExo
         HO3KIwhYH1Vq2vhNvQ98xgeEAawmGR+4jtt3l01NFy+eHtBBUzAdIey51vY6MehRT3+m
         NsXFdDTeak2zOTN9bKVQtg067s3QLnxBWg5CYz4aILMnMiaRJa32qch5KPZt57wLLr4q
         DVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699453011; x=1700057811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTgOGbaPvpKwO9XH3kuAorvZPKStj9dOWqnMlaC9gGQ=;
        b=nbTXvY5R7kkv1Q6br+nijsDWsv3YMY/IaQSZf9C0n55XPrOUe0Z+RsVx1jy3KI+HIy
         uqlncdeI6Rfu+e8TGxK4CI/HnawTIdLcTNLKpaHjqWe4lRho5rq5OCFJH8tZdvD5N6G3
         N7LShYQLLvb71Odg8da9KBLnKlaXkVY2yaAADDUGBztMUAg5JslE2S73w9O5DUj/+ouh
         NT2oNkcqC/Sl8Xq58qMF5Xvl+pbwh38aHv4A2ky4ktso9VS2ayQl3/RM5eTcK2JBbLP7
         yrR+vSgNKLFOaetMzuAACaRxZmYysn4XwvlmeDovVc+bQB0iBJfbFSTLgHQjh3m8m0wG
         GXqw==
X-Gm-Message-State: AOJu0YzfA2WXmZ6OkEVcSOpT4BYO6JONZU05gQ6c3un2EL4WzMF4gDCw
	TWIZCmjAv5rvO9i/gPzp4LnOka0kqfk05r0R
X-Google-Smtp-Source: AGHT+IGibailHo9ikNSCas/ZqvVpXJLStIFyPEYR8lsyAyhYDquH9pT3g02hDQCsK4Z93HcwICI9iA==
X-Received: by 2002:a05:622a:244:b0:41e:24aa:81a0 with SMTP id c4-20020a05622a024400b0041e24aa81a0mr2249887qtx.62.1699453010848;
        Wed, 08 Nov 2023 06:16:50 -0800 (PST)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id j14-20020ac85c4e000000b004181138e0c0sm921665qtj.31.2023.11.08.06.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:16:49 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/12] linux-yocto/6.5: update to v6.5.10
Date: Wed,  8 Nov 2023 09:16:29 -0500
Message-Id: <91d964562c0a8dc1ef60a54d4709282ebaf2dddc.1699452828.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699452828.git.bruce.ashfield@gmail.com>
References: <cover.1699452828.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 14:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190350

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    43a868577dfc Linux 6.5.10
    062c1ba88b4f accel/ivpu/37xx: Fix missing VPUIP interrupts
    cdb4daffc2d4 mm/damon/sysfs: check DAMOS regions update progress from before_terminate()
    a5c9f6289625 platform/x86: Add s2idle quirk for more Lenovo laptops
    adebf494e425 clk: stm32: Fix a signedness issue in clk_stm32_composite_determine_rate()
    302479e2d4c4 clk: socfpga: gate: Account for the divider in determine_rate
    5193aec42c45 clk: Sanitize possible_parent_show to Handle Return Value of of_clk_get_parent_name
    d1e039180f81 sparc32: fix a braino in fault handling in csum_and_copy_..._user()
    516177805997 perf/core: Fix potential NULL deref
    25de47d0d6e7 x86/cpu: Add model number for Intel Arrow Lake mobile processor
    3256ad9bb4ce x86/i8259: Skip probing when ACPI/MADT advertises PCAT compatibility
    7f864ab94da3 x86/tsc: Defer marking TSC unstable to a worker
    cfa5aa4a5ea2 nvmem: imx: correct nregs for i.MX6UL
    4f6c3da9a978 nvmem: imx: correct nregs for i.MX6SLL
    3e325ac1eec9 nvmem: imx: correct nregs for i.MX6ULL
    bc0991e8e1fb misc: fastrpc: Unmap only if buffer is unmapped from DSP
    8e4afa8598d9 misc: fastrpc: Clean buffers on remote invocation failures
    c2400bfd8ce4 misc: fastrpc: Free DMA handles for RPC calls with no arguments
    0351f86266f6 misc: fastrpc: Reset metadata buffer to avoid incorrect free
    96790d33261c tracing/kprobes: Fix the description of variable length arguments
    63de22fdf851 tracing/kprobes: Fix symbol counting logic by looking at modules as well
    001b2dc822d3 i2c: aspeed: Fix i2c bus hang in slave read
    20062e7a248f i2c: stm32f7: Fix PEC handling in case of SMBUS transfers
    e505ca5d9ac0 i2c: muxes: i2c-demux-pinctrl: Use of_get_i2c_adapter_by_node()
    135e2858ab78 i2c: muxes: i2c-mux-gpmux: Use of_get_i2c_adapter_by_node()
    2f7671a14960 i2c: muxes: i2c-mux-pinctrl: Use of_get_i2c_adapter_by_node()
    5f6dc4a12d79 iio: adc: xilinx-xadc: Correct temperature offset/scale for UltraScale
    f763aa29992d iio: adc: xilinx-xadc: Don't clobber preset voltage/temperature thresholds
    f2bd3c005aba iio: exynos-adc: request second interupt only when touchscreen mode is used
    0a9bb3fa6870 iio: afe: rescale: Accept only offset channels
    56e08ccc9697 io_uring/fdinfo: lock SQ thread while retrieving thread cpu/pid
    1c43576ac2d1 kasan: print the original fault addr when access invalid shadow
    6cf937305199 blk-throttle: check for overflow in calculate_bytes_allowed
    c031d9a8383d scsi: sd: Introduce manage_shutdown device flag
    927c770488fe iavf: in iavf_down, disable queues when removing the driver
    de306715bc3f drm/i915/mcr: Hold GT forcewake during steering operations
    a90e92e77bb6 drm/logicvc: Kconfig: select REGMAP and REGMAP_MMIO
    180069f6b8e8 net/sched: act_ct: additional checks for outdated flows
    533c24b368d7 netfilter: flowtable: GC pushes back packets to classic path
    36cf7d1d79ec i40e: Fix wrong check for I40E_TXR_FLAGS_WB_ON_ITR
    4c898bdfc6a1 drm/i915/perf: Determine context valid in OA reports
    9ba154363a09 gtp: fix fragmentation needed check with gso
    62376a558db3 gtp: uapi: fix GTPA_MAX
    450d6bf74c28 net/handshake: fix file ref count in handshake_nl_accept_doit()
    8279cd3af8bf wifi: mac80211: don't drop all unprotected public action frames
    943431ee2a17 wifi: cfg80211: fix assoc response warning on failed links
    989ac939b1a5 wifi: cfg80211: pass correct pointer to rdev_inform_bss()
    9617c77f0c0e tcp: fix wrong RTO timeout when received SACK reneging
    a22e19386109 r8152: Release firmware if we have an error in probe
    0fd9553632fd r8152: Cancel hw_phy_work if we have an error in probe
    56e8946e1a25 r8152: Run the unload routine if we have errors during probe
    90b49a273de0 r8152: Increase USB control msg timeout to 5000ms as per spec
    c11f5c496f65 net: usb: smsc95xx: Fix uninit-value access in smsc95xx_read_reg
    0d3295a43c63 net: ieee802154: adf7242: Fix some potential buffer overflow in adf7242_stats_show()
    8e0e94bf5b4a net: ethernet: adi: adin1110: Fix uninitialized variable
    fdba00877119 igc: Fix ambiguity in the ethtool advertising
    cf6fd6e0a831 neighbour: fix various data-races
    5f9d1995d040 net: do not leave an empty skb in write queue
    7462118b2083 igb: Fix potential memory leak in igb_add_ethtool_nfc_entry
    fd9d5ad3c865 treewide: Spelling fix in comment
    7e5beb46db3a i40e: Fix I40E_FLAG_VF_VLAN_PRUNING value
    f927602db213 iavf: initialize waitqueues before starting watchdog_task
    bcbf3f442903 r8169: fix the KCSAN reported data race in rtl_rx while reading desc->opts1
    03599d8d353a r8169: fix the KCSAN reported data-race in rtl_tx while reading TxDescArray[entry].opts1
    23473ffd3aec r8169: fix the KCSAN reported data-race in rtl_tx() while reading tp->cur_tx
    3dacf771d6e4 clk: ti: Fix missing omap5 mcbsp functional clock and aliases
    202f0a4266ca clk: ti: Fix missing omap4 mcbsp functional clock and aliases
    7e6cde9455e1 firmware/imx-dsp: Fix use_after_free in imx_dsp_setup_channels()
    ec4a1eed8259 ARM: OMAP: timer32K: fix all kernel-doc warnings
    0bc72b967d82 btrfs: fix unwritten extent buffer after snapshotting a new subvolume
    ca9cd8fb3454 btrfs: remove v0 extent handling
    1df7ca358099 drm/dp_mst: Fix NULL deref in get_mst_branch_device_by_guid_helper()
    ed93977857fd drm/amd: Disable ASPM for VI w/ all Intel systems
    5692e4e09f0a drm/i915/pmu: Check if pmu is closed before stopping event
    7c05a73c3893 accel/ivpu: Don't enter d0i3 during FLR
    4bb5ed32bf06 ARM: dts: rockchip: Fix timer clocks for RK3128
    6d6e82fb8a94 ARM: dts: rockchip: Add missing quirk for RK3128's dma engine
    835fdd9a36cc ARM: dts: rockchip: Add missing arm timer interrupt for RK3128
    568192da05cb ARM: dts: rockchip: Fix i2c0 register address for RK3128
    f4b8ef292ec6 ARM: OMAP1: ams-delta: Fix MODEM initialization failure
    0a411c59897e vdpa/mlx5: Fix double release of debugfs entry
    37509b77aeeb vdpa_sim_blk: Fix the potential leak of mgmt_dev
    a3e7e0de21cf nfsd: lock_rename() needs both directories to live on the same fs
    11bc9f5c70bb maple_tree: add GFP_KERNEL to allocations in mas_expected_entries()
    257931b5d8b1 hugetlbfs: extend hugetlb_vma_lock to private VMAs
    a6d2f04abe6a mm/mempolicy: fix set_mempolicy_home_node() previous VMA pointer
    c0ade01d5369 selftests/mm: include mman header to access MREMAP_DONTUNMAP identifier
    941f6af9946e mm/migrate: fix do_pages_move for compat pointers
    5d6ea592222a mm/page_alloc: correct start page when guard page debug is enabled
    92c5ddea6a6c hugetlbfs: clear resv_map pointer if mmap fails
    e3f64e0bb2fa mm: fix vm_brk_flags() to not bail out while holding lock
    5ee66af50c41 i40e: sync next_to_clean and next_to_process for programming status desc
    6ba04d5dfd00 arm64: dts: rockchip: Fix i2s0 pin conflict on ROCK Pi 4 boards
    7bc99864cb91 arm64: dts: rockchip: Add i2s0-2ch-bus-bclk-off pins to RK3399
    7c5934f90db6 arm64: dts: qcom: sa8775p: correct PMIC GPIO label in gpio-ranges
    7f5d458012fa arm64: dts: rockchip: set codec system-clock-fixed on px30-ringneck-haikou
    51b3ef53fa5d arm64: dts: rockchip: use codec as clock master on px30-ringneck-haikou
    aa7df1844910 arm64: dts: qcom: msm8996-xiaomi: fix missing clock populate
    d8b34f309f36 arm64: dts: qcom: apq8096-db820c: fix missing clock populate
    368b3c788e99 vhost: Allow null msg.size on VHOST_IOTLB_INVALIDATE
    e83bce65ae80 vsock/virtio: initialize the_virtio_vsock before using VQs
    7efb5418f8cb virtio_pci: fix the common cfg map size
    91dacc7d5dbd virtio-crypto: handle config changed by work queue
    5f8c38e9538f virtio-mmio: fix memory leak of vm_dev
    84a50412e433 virtio_balloon: Fix endless deflation and inflation on arm64
    436be190fbf8 smb: client: prevent new fids from being removed by laundromat
    f806b7e98cb9 smb: client: make laundromat a delayed worker
    b8c0ab226fee smb: client: do not start laundromat thread on nohandlecache
    b483b64677a1 smb3: do not start laundromat thread when dir leases disabled
    3027d3064c71 smb3: allow controlling maximum number of cached directories
    9cb2ea5d7d2a smb3: allow controlling length of time directory entries are cached with dir leases
    c3b054a86347 vdpa/mlx5: Fix firmware error on creation of 1k VQs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.5.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.5.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index 552df49949..f004339749 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a19b0be3292c96a0cc9c0ebb8f9d104d6a4d3e10"
-SRCREV_meta ?= "fa8ffc924f6d91ea09c9f792a5bb8a184ec1657a"
+SRCREV_machine ?= "833c5da68398da64271c26188b9e15286e8e725c"
+SRCREV_meta ?= "e4aaaaddfaf695039a7fc41815e24f57c29e30c0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.5.9"
+LINUX_VERSION ?= "6.5.10"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index 194c5c10f2..cc75c0c702 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.5.inc
 
-LINUX_VERSION ?= "6.5.9"
+LINUX_VERSION ?= "6.5.10"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4e79d57b9c5cc230d2d8cb40c393515fedfed134"
-SRCREV_meta ?= "fa8ffc924f6d91ea09c9f792a5bb8a184ec1657a"
+SRCREV_machine ?= "16b52743d64980d531e120aec62c9220b695a269"
+SRCREV_meta ?= "e4aaaaddfaf695039a7fc41815e24f57c29e30c0"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index bec4b7c049..5cdf0e02d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.5/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.5/standard/base"
 KBRANCH:qemumips64 ?= "v6.5/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "bf5b3a74274d87b15ebc752af9aa05f11e675ad1"
-SRCREV_machine:qemuarm64 ?= "2432f34de9751a230a832a870763d8588897c5df"
-SRCREV_machine:qemuloongarch64 ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
-SRCREV_machine:qemumips ?= "a9934c8f85b3c9b89e132304ff248f701e67e04d"
-SRCREV_machine:qemuppc ?= "9ad77a0fec52d67a292aeb413e9992d6df037ca3"
-SRCREV_machine:qemuriscv64 ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
-SRCREV_machine:qemuriscv32 ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
-SRCREV_machine:qemux86 ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
-SRCREV_machine:qemux86-64 ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
-SRCREV_machine:qemumips64 ?= "3b119ebc63b9889194b0125bfae96ee5830e538c"
-SRCREV_machine ?= "11bbc8db249543905b6fe9b660575202fa0e3ed0"
-SRCREV_meta ?= "fa8ffc924f6d91ea09c9f792a5bb8a184ec1657a"
+SRCREV_machine:qemuarm ?= "eb2eba60c726fd5c0257422e55117f46f792f72e"
+SRCREV_machine:qemuarm64 ?= "e709bc7ca85655ff5317fbcf4c8cb69365b6fc40"
+SRCREV_machine:qemuloongarch64 ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
+SRCREV_machine:qemumips ?= "0524fc1380569f39eb5473cc8344ce2e4e78a82d"
+SRCREV_machine:qemuppc ?= "0b23c1d5705f5efa91b3757377ec284b1d42a84a"
+SRCREV_machine:qemuriscv64 ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
+SRCREV_machine:qemuriscv32 ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
+SRCREV_machine:qemux86 ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
+SRCREV_machine:qemux86-64 ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
+SRCREV_machine:qemumips64 ?= "b63329018323409369e952c84ac6481e68a9b6af"
+SRCREV_machine ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
+SRCREV_meta ?= "e4aaaaddfaf695039a7fc41815e24f57c29e30c0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d0e42510ae8347e27d416356291b7546fb7681f5"
+SRCREV_machine:class-devupstream ?= "43a868577dfcd9be6930453dc5ec557ab2e9ad89"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.5/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.5.9"
+LINUX_VERSION ?= "6.5.10"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


