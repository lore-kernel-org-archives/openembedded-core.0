Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0ABC433FE
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:39:45 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web12.10776.1652193575868457116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GDccZM85;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id q18so3984339pln.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Z3bk/HFgiKBJVw2cZFH7nPvUsOtnLbLgjkQIG1po81M=;
        b=GDccZM856b29xkLfFoUbIJxAykmCGOd3qy9SkTT1v3p1/P9Lm72VAnoTztEdca7+Ue
         RgfOEchFvPcPshVYmalnNOcRwzj0WQYGHmfRoxfum64Bj93HxkDpKczrzpy6dpm79KWB
         g4pw465ypuEFYpn323Xj5ukop/ETlzOzXZCHG6wBmd4mh4xlFtcvc6II3ZH4N/JGt2DS
         xsjhvC4nbB7mr6OGSKGpjhwJkOeTccGf6mAdKEDxveRN5EfAK1rG3UQxG5Fct8LPomZv
         73kT574Bslcwkxy1YCyYaKvdDSKhHcA6Qyi+OurY3/UKcRj5iaByIPd6JhGj/QeN83wq
         PxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z3bk/HFgiKBJVw2cZFH7nPvUsOtnLbLgjkQIG1po81M=;
        b=0nZT+RZLPlp2PSk7vJA5v95VxS1DZyoibfQB7stbDV/JvSmSzupJRQEk3FZaxeplQJ
         KBW53NQeq7Y9y8N9Ncw1bkSz2ASfPUCl/hEEokSg7xoLvLL+6sSYRWI6bth1yuEWCriH
         t3xSvK77ORg6czIEq1vCMsoNZirbYFb7IbiHksR1DFHlSsdwdYDePa3WttfmkvAGfR6m
         80iLUCncfkbyWL3mJGTat8JUjyx5+E+zRxFKwcGxgwCs5HhOGZRg/CBxO1jobqMKYj76
         uL7SJ12xbEyedCKw/No5U5RZPmxk763iG96YvqQcaBpo0TK0PwUMyLvAc3pQZNj8jAs0
         s4pA==
X-Gm-Message-State: AOAM530GAdng1Sp3hGUUTjFrWIP6mKYTMq3agtqRUvtXk3WaBp15oSz/
	BtmkDM0NUXpSdjhCdJvQv/VGcgIUfmYX8IYA
X-Google-Smtp-Source: 
 ABdhPJzWUc7NZUzPbmIBu4wA+u/GmeaSJ3eJZi5JBscrloPD8OCFnbQJmKFbDvdrEIerduQpfuCe6A==
X-Received: by 2002:a17:902:b682:b0:15d:29:9820 with SMTP id
 c2-20020a170902b68200b0015d00299820mr20853539pls.134.1652193574072;
        Tue, 10 May 2022 07:39:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/40] linux-yocto/5.15: update to v5.15.36
Date: Tue, 10 May 2022 04:37:03 -1000
Message-Id: 
 <f967efa7f28d67c8f47e879fb96696b29bd7621b.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:39:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165441

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    45451e8015a9 Linux 5.15.36
    bb906d15a99e arm64: dts: qcom: add IPA qcom,qmp property
    1ea01e64632f block/compat_ioctl: fix range check in BLKGETSIZE
    6a3c609feb11 spi: atmel-quadspi: Fix the buswidth adjustment between spi-mem and controller
    b1b8f39c2475 jbd2: fix a potential race while discarding reserved buffers after an abort
    2e25c46c6eef netfilter: nft_ct: fix use after free when attaching zone template
    2b273d1fd18e ext4: force overhead calculation if the s_overhead_cluster makes no sense
    52ca84a3edd1 ext4: fix overhead calculation to account for the reserved gdt blocks
    6b952563934c ext4, doc: fix incorrect h_reserved size
    9b90003771e5 ext4: limit length to bitmap_maxbytes - blocksize in punch_hole
    e3912775b476 ext4: fix use-after-free in ext4_search_dir
    8bb5676b49d3 ext4: fix symlink file size not match to file content
    ba50ea456f49 ext4: fix fallocate to use file_modified to update permissions consistently
    67e4860eeed8 netfilter: conntrack: avoid useless indirection during conntrack destruction
    bcba40bd36d7 netfilter: conntrack: convert to refcount_t api
    4bbd693d9f0a KVM: SVM: Flush when freeing encrypted pages even on SME_COHERENT CPUs
    8b2da9690489 KVM: nVMX: Defer APICv updates while L2 is active until L1 is active
    a41b3243a6de KVM: x86: Pend KVM_REQ_APICV_UPDATE during vCPU creation to fix a race
    2b4417acd3c6 KVM: x86/pmu: Update AMD PMC sample period to fix guest NMI-watchdog
    87d95ff0ca27 arm_pmu: Validate single/group leader events
    4d98fbb26683 ARC: entry: fix syscall_trace_exit argument
    7b69c07beb23 e1000e: Fix possible overflow in LTR decoding
    73a0b4c5c0bd ASoC: soc-dapm: fix two incorrect uses of list iterator
    571a67b0d8a4 gpio: Request interrupts after IRQ is initialized
    e411af98013d openvswitch: fix OOB access in reserve_sfa_size()
    bac4cadeb718 xtensa: fix a7 clobbering in coprocessor context load/store
    91335ca9ebe7 xtensa: patch_text: Fixup last cpu should be master
    49952e31e50d perf report: Set PERF_SAMPLE_DATA_SRC bit for Arm SPE event
    04ecea282b42 perf script: Always allow field 'data_src' for auxtrace
    a92335b4b189 powerpc/perf: Fix power10 event alternatives
    7a56867c5ef3 powerpc/perf: Fix power9 event alternatives
    53c4a9ff225b drm/vc4: Use pm_runtime_resume_and_get to fix pm_runtime_get_sync() usage
    9dc46d2e3723 KVM: PPC: Fix TCE handling for VFIO
    76614b111867 drm/panel/raspberrypi-touchscreen: Initialise the bridge in prepare
    7981351a916e drm/panel/raspberrypi-touchscreen: Avoid NULL deref if not initialised
    56637084e8a5 perf/core: Fix perf_mmap fail when CONFIG_PERF_USE_VMALLOC enabled
    b1b929468229 sched/pelt: Fix attach_entity_load_avg() corner case
    914473a07088 scsi: sr: Do not leak information in ioctl
    f0cfae3e0d3a Input: omap4-keypad - fix pm_runtime_get_sync() error checking
    232541989a1a net: atlantic: invert deep par in pm functions, preventing null derefs
    6b8af9f96749 dmaengine: imx-sdma: fix init of uart scripts
    1a8d1665cff1 dma: at_xdmac: fix a missing check on list iterator
    d10a711d4db6 ata: pata_marvell: Check the 'bmdma_addr' beforing reading
    48b2ab1a960a mm/mmu_notifier.c: fix race in mmu_interval_notifier_remove()
    41ba681c6373 oom_kill.c: futex: delay the OOM reaper to allow time for proper futex cleanup
    9dcb65cdf312 mm, hugetlb: allow for "high" userspace addresses
    07bdd207774c memcg: sync flush only if periodic flush is delayed
    9c71b29d55d4 mm/memory-failure.c: skip huge_zero_page in memory_failure()
    b81291922f8b EDAC/synopsys: Read the error count from the correct register
    87dd813bd2c3 nvme-pci: disable namespace identifiers for Qemu controllers
    dab2f477e15a nvme-pci: disable namespace identifiers for the MAXIO MAP1002/1202
    25f37ed22a9e nvme: add a quirk to disable namespace identifiers
    4a9f9f1791f3 VFS: filename_create(): fix incorrect intent.
    773ca67ffc96 stat: fix inconsistency between struct stat and struct compat_stat
    80c713a894c3 scsi: qedi: Fix failed disconnect handling
    c7f4f3016fea scsi: iscsi: Fix NOP handling during conn recovery
    e4efe868aa14 scsi: iscsi: Merge suspend fields
    740411ee2f94 scsi: iscsi: Release endpoint ID when its freed
    123a52eb610d net: macb: Restart tx only if queue pointer is lagging
    bc663ff8cae3 drm/msm/mdp5: check the return of kzalloc()
    5fe864539caf dpaa_eth: Fix missing of_node_put in dpaa_get_ts_info()
    48e1db2c3d42 brcmfmac: sdio: Fix undefined behavior due to shift overflowing the constant
    e25b350e2521 mt76: Fix undefined behavior due to shift overflowing the constant
    a7a651d5a525 net: atlantic: Avoid out-of-bounds indexing
    213330bafd02 cifs: Check the IOCB_DIRECT flag, not O_DIRECT
    6085e24fd972 vxlan: fix error return code in vxlan_fdb_append
    32fe43df71c5 arm64: dts: imx: Fix imx8*-var-som touchscreen property sizes
    f0ba965e4783 drm/msm/disp: check the return value of kzalloc()
    b78d40339568 ALSA: usb-audio: Fix undefined behavior due to shift overflowing the constant
    9d441c2e2ad1 platform/x86: samsung-laptop: Fix an unsigned comparison which can never be negative
    4426116b2e02 reset: tegra-bpmp: Restore Handle errors in BPMP response
    a6ec9d95c205 reset: renesas: Check return value of reset_control_deassert()
    70fa727835f9 ARM: vexpress/spc: Avoid negative array index when !SMP
    d3acd3f9f80e arm64: mm: fix p?d_leaf()
    ec9cb700cbf7 selftests: mlxsw: vxlan_flooding: Prevent flooding of unwanted packets
    6b9a418d3850 dmaengine: idxd: skip clearing device context when device is read-only
    49047fa486b3 dmaengine: idxd: add RO check for wq max_transfer_size write
    6c30e099b978 dmaengine: idxd: add RO check for wq max_batch_size write
    e83acf93919b net: stmmac: Use readl_poll_timeout_atomic() in atomic state
    79957134ca1d drm/i915/display/psr: Unset enable_psr2_sel_fetch if other checks in intel_psr2_config_valid() fails
    f3552c37593a netlink: reset network and mac headers in netlink_dump()
    93581ae1f980 net: mscc: ocelot: fix broken IP multicast flooding
    6a5ca57d5acd net: dsa: hellcreek: Calculate checksums in tagger
    40ebaf7365b0 can: isotp: stop timeout monitoring when no first frame was sent
    652a5405396d ipv6: make ip6_rt_gc_expire an atomic_t
    d23fe66eb7b0 l3mdev: l3mdev_master_upper_ifindex_by_index_rcu should be using netdev_master_upper_dev_get_rcu
    58bdbd121a34 net/sched: cls_u32: fix possible leak in u32_init_knode()
    1b4fb109cc53 net: restore alpha order to Ethernet devices in config
    d5049ef1f671 ip6_gre: Fix skb_under_panic in __gre6_xmit()
    3cc2f6b71eb6 ip6_gre: Avoid updating tunnel->tun_hlen in __gre6_xmit()
    ab26f1136757 net/packet: fix packet_sock xmit return value checking
    b355ca6a915f net/smc: Fix sock leak when release after smc_shutdown()
    8fe1bf23c96b rxrpc: Restore removed timer deletion
    09da8cf94588 ALSA: hda/hdmi: fix warning about PCM count when used with SOF
    c7c71b3e4764 igc: Fix suspending when PTM is active
    da323d0d6aaa igc: Fix BUG: scheduling while atomic
    b3ce7d3a1742 igc: Fix infinite loop in release_swfw_sync
    8920a03a3a15 spi: cadence-quadspi: fix incorrect supports_op() return value
    a583f2f3c878 esp: limit skb_page_frag_refill use to a single page
    76900a136b1a spi: spi-mtk-nor: initialize spi controller after resume
    84e77e72367f dmaengine: dw-edma: Fix unaligned 64bit access
    d18fb19c1c8e dmaengine: mediatek:Fix PM usage reference leak of mtk_uart_apdma_alloc_chan_resources
    8932d9ee4b9f dmaengine: imx-sdma: Fix error checking in sdma_event_remap
    a8be4586352b dmaengine: idxd: fix device cleanup on disable
    6168532a08ef ASoC: codecs: wcd934x: do not switch off SIDO Buck when codec is in use
    053bd9604f05 ASoC: msm8916-wcd-digital: Check failure for devm_snd_soc_register_component
    9a4c63e7332c ASoC: rk817: Use devm_clk_get() in rk817_platform_probe
    bc15442cc99f ASoC: topology: Correct error handling in soc_tplg_dapm_widget_create()
    bc7d0133181e ASoC: atmel: Remove system clock tree configuration for at91sam9g20ek
    236785649ad2 ALSA: hda/realtek: Add quirk for Clevo NP70PNP
    aaa22e5b526d ALSA: usb-audio: Clear MIDI port active flag after draining
    ba9e9a794fd1 net/sched: cls_u32: fix netns refcount changes in u32_change()
    8dfec6e0a62d scsi: ufs: core: scsi_get_lba() error fix
    c2d0cdf8ad06 gfs2: assign rgrp glock before compute_bitstructs
    a52e73bef254 mm, kfence: support kmem_dump_obj() for KFENCE objects
    3876c574e4cc perf tools: Fix segfault accessing sample_id xyarray
    77a467983bff mm: page_alloc: fix building error on -Werror=array-compare
    3177d047e58a etherdevice: Adjust ether_addr* prototypes to silence -Wstringop-overead
    3f7b1a87ac75 arm64/mm: drop HAVE_ARCH_PFN_VALID
    c01430cf5b87 dma-mapping: remove bogus test for pfn_valid from dma_map_resource
    155ae0547cb8 xfs: return errors in xfs_fs_sync_fs
    935745abcf4c vfs: make sync_filesystem return errors from ->sync_fs
    6eb927ee189f block: simplify the block device syncing code
    7877e7a5a52e block: remove __sync_blockdev
    4b7617ae04de fs: remove __sync_filesystem

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 02149163c8643cec5fd8ef9c7b8a2f5af06519ec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index fe1c7fb533..95a250080d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4648820c6ca4146a3dbb4eb6a5b4ac93401f9596"
-SRCREV_meta ?= "a43150cc38bed6bf82d9217335348855c1d7eab8"
+SRCREV_machine ?= "2b74bd6a3a2341f079f914171bc92eadc8a7deaa"
+SRCREV_meta ?= "7aedb91750c4157186761d01d1ab4b4114986071"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.35"
+LINUX_VERSION ?= "5.15.36"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 3f4509c921..465e16f1da 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.35"
+LINUX_VERSION ?= "5.15.36"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7505af5d55038e463bf45794603b6efabb655817"
-SRCREV_meta ?= "a43150cc38bed6bf82d9217335348855c1d7eab8"
+SRCREV_machine ?= "9107fb1e04c2da3d84e1967aeb7f5bc190423d5b"
+SRCREV_meta ?= "7aedb91750c4157186761d01d1ab4b4114986071"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 02b16b5f25..8bada989e5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2d10943aa7855dc5bbe2c74c6f05ef2e4eb39e3a"
-SRCREV_machine:qemuarm64 ?= "b623e8d1eaacbeee250ea37328a9b566ca52f890"
-SRCREV_machine:qemumips ?= "7e897b81f922149be5edaab68eb8034a75899ce7"
-SRCREV_machine:qemuppc ?= "c3db8eb7b0a5b171ac4c0c6def487b5572a7b3f9"
-SRCREV_machine:qemuriscv64 ?= "4eba9348d3e2eeb1070f07bf360a9e404aceb25b"
-SRCREV_machine:qemuriscv32 ?= "4eba9348d3e2eeb1070f07bf360a9e404aceb25b"
-SRCREV_machine:qemux86 ?= "4eba9348d3e2eeb1070f07bf360a9e404aceb25b"
-SRCREV_machine:qemux86-64 ?= "4eba9348d3e2eeb1070f07bf360a9e404aceb25b"
-SRCREV_machine:qemumips64 ?= "9868746e0736d8659374e93129cca9d3413a7918"
-SRCREV_machine ?= "4eba9348d3e2eeb1070f07bf360a9e404aceb25b"
-SRCREV_meta ?= "a43150cc38bed6bf82d9217335348855c1d7eab8"
+SRCREV_machine:qemuarm ?= "b5b62e5ba72e2ed669bbb53dd5707e27d777257e"
+SRCREV_machine:qemuarm64 ?= "3f298fc00a40ed4f32805aba757c22c855f654b9"
+SRCREV_machine:qemumips ?= "6d50f4ff023b65e226fd2e65feaa583d8b177ae3"
+SRCREV_machine:qemuppc ?= "e51976427997a0b6f81e013ca6588e32c33cfeb0"
+SRCREV_machine:qemuriscv64 ?= "ebfb1822e9f9726d8c587fc0f60cfed43fa0873e"
+SRCREV_machine:qemuriscv32 ?= "ebfb1822e9f9726d8c587fc0f60cfed43fa0873e"
+SRCREV_machine:qemux86 ?= "ebfb1822e9f9726d8c587fc0f60cfed43fa0873e"
+SRCREV_machine:qemux86-64 ?= "ebfb1822e9f9726d8c587fc0f60cfed43fa0873e"
+SRCREV_machine:qemumips64 ?= "1822ceafc13337881a81edeb7093b0c095d9efca"
+SRCREV_machine ?= "ebfb1822e9f9726d8c587fc0f60cfed43fa0873e"
+SRCREV_meta ?= "7aedb91750c4157186761d01d1ab4b4114986071"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "81d8d30c35edf29c5c70186ccb14dac4a5ca38a8"
+SRCREV_machine:class-devupstream ?= "45451e8015a91de5d1a512c3e3d7373bbcb58fb0"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.35"
+LINUX_VERSION ?= "5.15.36"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


