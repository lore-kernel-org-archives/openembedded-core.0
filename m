Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C58EC4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:22 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.2931.1702391293917377630
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TQxq/V2y;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ce7632b032so2947133b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391293; x=1702996093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsiXI8Xadqp1lLK5w27z/w8L5K+dBu3mo3GD9EVOw9s=;
        b=TQxq/V2yTArqqPCy0EsPZHUIrbaV6zXhNifYESV3HRYALfCSCeOgIyAyRVkVrtAMok
         dy/VO+605W8Nc0BejmjPDcCqJuBwrzM6F/WtMeuncovoS77nI1gqxipozgWg5IRAAIRt
         VsfNDhGTzcXqw20ecIWsh5weJ2sftzRyuN9JoawZt7aB2GBCOntxyYEMUbjYo69+DwJk
         ACyoWUBBQvlWxdms+k821oVkf0zBwb1qe55/ATcJWKSZ1trZRNVTHTun2+cgN5f0+WOL
         FrU9VB7EO3QkD64c4GqUKIERI3D7pjgtkVXEhESyMcboy11HVB0zmB4JBNcvXceLf67G
         zq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391293; x=1702996093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LsiXI8Xadqp1lLK5w27z/w8L5K+dBu3mo3GD9EVOw9s=;
        b=T0H5LcuGIUXapQfeKsWTs0BTij5EU2kJlhMAlPA9h8G/SBEzs/rhfBICa9vswjGjYJ
         VX20zM6T4hxS5akucyUHS+B9SKnZLgCMYhS1fqglyLvUh70FqRDVKKFjj+t65UYPXoPy
         6YHlxlKZVzo0GNT+f1OdgaoziTExPdnkwi9NQyErMypdHmvHKFTc2gygWhXE9FA+s0W9
         dW5RSYhjcG6kvqXgQkpOoYzLCE8RW39I0oebUbGYdbLC760u8106WKiaMIYsUvbRSOJZ
         oBGsmI3gpuQCBZBwbSyvZKZ56EeY6/HvQRQND9ZmVW49g6s21+7YlzMkg7tOVEtOeF9W
         defg==
X-Gm-Message-State: AOJu0YzZzC+wZWTaa5qLfG9xzCH7pT578OnR9NxFu5sNSljjT1SWmSQf
	t/sokWa3o8cfAlmzG72og8HN7K2qvMuk6YGBbEo=
X-Google-Smtp-Source: AGHT+IGmL4bLnrnblkl4NpGX0qJRawpYw75O3NhAZ+iWX9T7Iv21Fz3nMITC9GUKeZGw6sDjV9qruw==
X-Received: by 2002:a05:6a20:938c:b0:18f:97c:5b88 with SMTP id x12-20020a056a20938c00b0018f097c5b88mr2784552pzh.86.1702391292907;
        Tue, 12 Dec 2023 06:28:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.28.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:28:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 16/29] linux-yocto/6.1: update to v6.1.61
Date: Tue, 12 Dec 2023 04:27:22 -1000
Message-Id: <954ab141b047e532c01cfb18276602662b9ac6d3.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192220

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    4a61839152cc Linux 6.1.61
    5926b0886d0c objtool/x86: add missing embedded_insn check
    2afa9f7eb15c ext4: avoid overlapping preallocations due to overflow
    fcefddf3a151 ext4: fix BUG in ext4_mb_new_inode_pa() due to overflow
    495c4c58d684 ext4: add two helper functions extent_logical_end() and pa_logical_end()
    d022e4ea9c2f platform/x86: Add s2idle quirk for more Lenovo laptops
    48ebeab0eda1 clk: Sanitize possible_parent_show to Handle Return Value of of_clk_get_parent_name
    65e5a9890e03 sparc32: fix a braino in fault handling in csum_and_copy_..._user()
    8b8cde8ebb87 perf/core: Fix potential NULL deref
    5e232f2205f2 x86/cpu: Add model number for Intel Arrow Lake mobile processor
    63cc3d5d343d x86/i8259: Skip probing when ACPI/MADT advertises PCAT compatibility
    37495846b1ef nvmem: imx: correct nregs for i.MX6UL
    116671d25915 nvmem: imx: correct nregs for i.MX6SLL
    b90b8633ef62 nvmem: imx: correct nregs for i.MX6ULL
    cc87c73eac2d misc: fastrpc: Unmap only if buffer is unmapped from DSP
    38c5faf2a984 misc: fastrpc: Clean buffers on remote invocation failures
    7737e9384e2d misc: fastrpc: Free DMA handles for RPC calls with no arguments
    1e8851b51300 misc: fastrpc: Reset metadata buffer to avoid incorrect free
    5a35fc1c0091 tracing/kprobes: Fix the description of variable length arguments
    91b95e3b4ac8 i2c: aspeed: Fix i2c bus hang in slave read
    11602cadc9b4 i2c: stm32f7: Fix PEC handling in case of SMBUS transfers
    ff0312a156cf i2c: muxes: i2c-demux-pinctrl: Use of_get_i2c_adapter_by_node()
    f9a7b3b33c84 i2c: muxes: i2c-mux-gpmux: Use of_get_i2c_adapter_by_node()
    48a365ae4f31 i2c: muxes: i2c-mux-pinctrl: Use of_get_i2c_adapter_by_node()
    6ec84059b5e1 iio: adc: xilinx-xadc: Correct temperature offset/scale for UltraScale
    e26fd381bf11 iio: adc: xilinx-xadc: Don't clobber preset voltage/temperature thresholds
    cb01837e0f7a iio: exynos-adc: request second interupt only when touchscreen mode is used
    7a641bc52f00 iio: afe: rescale: Accept only offset channels
    9236d2ea6465 io_uring/fdinfo: lock SQ thread while retrieving thread cpu/pid
    1684909df3f4 kasan: print the original fault addr when access invalid shadow
    6a5b845b57b1 blk-throttle: check for overflow in calculate_bytes_allowed
    bb20a245df9c scsi: sd: Introduce manage_shutdown device flag
    93fa5786f972 iavf: in iavf_down, disable queues when removing the driver
    f7f660df65a1 drm/logicvc: Kconfig: select REGMAP and REGMAP_MMIO
    cb115b6688b6 i40e: Fix wrong check for I40E_TXR_FLAGS_WB_ON_ITR
    144f93c62239 gtp: fix fragmentation needed check with gso
    039a050740fc gtp: uapi: fix GTPA_MAX
    664a358b7966 tcp: fix wrong RTO timeout when received SACK reneging
    5b100bb0449c r8152: Release firmware if we have an error in probe
    ecb51a434e3d r8152: Cancel hw_phy_work if we have an error in probe
    87376143df3f r8152: Run the unload routine if we have errors during probe
    ee73f937c5e9 r8152: Increase USB control msg timeout to 5000ms as per spec
    9eb275fec602 net: usb: smsc95xx: Fix uninit-value access in smsc95xx_read_reg
    7c799bc32232 net: ieee802154: adf7242: Fix some potential buffer overflow in adf7242_stats_show()
    55b01c5a847e net: ethernet: adi: adin1110: Fix uninitialized variable
    9d2b588fae86 igc: Fix ambiguity in the ethtool advertising
    fa28949c72db neighbour: fix various data-races
    c166dd51b628 igb: Fix potential memory leak in igb_add_ethtool_nfc_entry
    9a194064fab6 treewide: Spelling fix in comment
    b1ad0a147d08 i40e: Fix I40E_FLAG_VF_VLAN_PRUNING value
    d8ac13acfbf7 iavf: initialize waitqueues before starting watchdog_task
    66e879507b12 r8169: fix the KCSAN reported data race in rtl_rx while reading desc->opts1
    d10140916e6f r8169: fix the KCSAN reported data-race in rtl_tx while reading TxDescArray[entry].opts1
    4138a02c8953 r8169: fix the KCSAN reported data-race in rtl_tx() while reading tp->cur_tx
    29f365f4c3b8 clk: ti: Fix missing omap5 mcbsp functional clock and aliases
    2ba943c6d9eb clk: ti: Fix missing omap4 mcbsp functional clock and aliases
    8d8346ed3968 firmware/imx-dsp: Fix use_after_free in imx_dsp_setup_channels()
    df4169fc9b8a ARM: OMAP: timer32K: fix all kernel-doc warnings
    6c668e2f338b drm/dp_mst: Fix NULL deref in get_mst_branch_device_by_guid_helper()
    024251bab25d drm/amd: Disable ASPM for VI w/ all Intel systems
    eded5f5261b8 drm/i915/pmu: Check if pmu is closed before stopping event
    4f46c177c03d nfsd: lock_rename() needs both directories to live on the same fs
    3262ff5826e1 maple_tree: add GFP_KERNEL to allocations in mas_expected_entries()
    b1b2750de123 hugetlbfs: extend hugetlb_vma_lock to private VMAs
    c9b066f6920d mm/migrate: fix do_pages_move for compat pointers
    a6fbf025e3cf mm/page_alloc: correct start page when guard page debug is enabled
    0aa7b24c068c hugetlbfs: clear resv_map pointer if mmap fails
    38d0d1c44255 mm: fix vm_brk_flags() to not bail out while holding lock
    38930ec7670a arm64: dts: rockchip: Fix i2s0 pin conflict on ROCK Pi 4 boards
    9d72254c2b7a arm64: dts: rockchip: Add i2s0-2ch-bus-bclk-off pins to RK3399
    08e6b680f264 vhost: Allow null msg.size on VHOST_IOTLB_INVALIDATE
    1f14ded0f165 vsock/virtio: initialize the_virtio_vsock before using VQs
    534487cc3eb8 virtio_pci: fix the common cfg map size
    86f467d3582e virtio-crypto: handle config changed by work queue
    a9d4a1ea6709 virtio-mmio: fix memory leak of vm_dev
    19b30a879065 virtio_balloon: Fix endless deflation and inflation on arm64
    bede8b4b5175 mcb-lpc: Reallocate memory region to avoid memory overlapping
    c9efc3efe450 mcb: Return actual parsed size when reading chameleon table
    e58ab834e48f pinctrl: qcom: lpass-lpi: fix concurrent register updates
    018b11ecba76 ASoC: codecs: wcd938x: fix runtime PM imbalance on remove
    508c3353fed8 ASoC: codecs: wcd938x: fix regulator leaks on probe errors
    877fc75d2cf7 ASoC: codecs: wcd938x: Simplify with dev_err_probe
    629ba75200a1 ASoC: codecs: wcd938x: Convert to platform remove callback returning void
    1fae817d3ecb mmc: core: Fix error propagation for some ioctl commands
    719c01f28130 mmc: block: ioctl: do write error check for spi
    651e66d20b59 mmc: core: Align to common busy polling behaviour for mmc ioctls
    d3466ce4f42e KVM: x86/pmu: Truncate counter value to allowed width on write

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8b5ec2f683f71f3e708d1c6401ebe07eec1986c7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 408fac718e..6a92171f12 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0dad5306907b9e6fb89103dfba80dbd0edafcdb6"
-SRCREV_meta ?= "3ec1b83af3b59f07cf04e1264fbd30fe2f2f873b"
+SRCREV_machine ?= "f9bb1e96b7dcb1ba3649e84ca3ab9880509cee1b"
+SRCREV_meta ?= "29ec3dc6f4f59b731badcc864b212767023cc40c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.60"
+LINUX_VERSION ?= "6.1.61"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 9bf6001353..fb48b8e043 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.60"
+LINUX_VERSION ?= "6.1.61"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
-SRCREV_meta ?= "3ec1b83af3b59f07cf04e1264fbd30fe2f2f873b"
+SRCREV_machine ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
+SRCREV_meta ?= "29ec3dc6f4f59b731badcc864b212767023cc40c"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index f497ccedd9..038c6dae71 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "65ec3fc08dd186624d2004ae7aa15456c26f6ce8"
-SRCREV_machine:qemuarm64 ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
-SRCREV_machine:qemuloongarch64 ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
-SRCREV_machine:qemumips ?= "88007e8e5b1cffac43b7d0c8db3a784819140c71"
-SRCREV_machine:qemuppc ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
-SRCREV_machine:qemuriscv64 ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
-SRCREV_machine:qemuriscv32 ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
-SRCREV_machine:qemux86 ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
-SRCREV_machine:qemux86-64 ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
-SRCREV_machine:qemumips64 ?= "9f25eb5709ab8af0ece7306014d5e8b7c6150c68"
-SRCREV_machine ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
-SRCREV_meta ?= "3ec1b83af3b59f07cf04e1264fbd30fe2f2f873b"
+SRCREV_machine:qemuarm ?= "ed4795c1e353e6a1fa57b5ba01c42f5b3f436a0c"
+SRCREV_machine:qemuarm64 ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
+SRCREV_machine:qemuloongarch64 ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
+SRCREV_machine:qemumips ?= "7c06c2693959032740dd1fdea4dedc9491845951"
+SRCREV_machine:qemuppc ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
+SRCREV_machine:qemuriscv64 ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
+SRCREV_machine:qemuriscv32 ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
+SRCREV_machine:qemux86 ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
+SRCREV_machine:qemux86-64 ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
+SRCREV_machine:qemumips64 ?= "b05d04ae43806e87bf9f77484c72260350f6defe"
+SRCREV_machine ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
+SRCREV_meta ?= "29ec3dc6f4f59b731badcc864b212767023cc40c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "32c9cdbe383c153af23cfa1df0a352b97ab3df7a"
+SRCREV_machine:class-devupstream ?= "4a61839152cc3e9e00ac059d73a28d148d622b30"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.60"
+LINUX_VERSION ?= "6.1.61"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


