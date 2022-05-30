Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48531C43217
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 02:36:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.31654.1653878172131745638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 19:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=MYvYWqcY;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653878185; x=1685414185;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bNqoYXxMB0KwNeBPR9I93jZuwZM4K9+UfuEPSO9BP3U=;
  b=MYvYWqcYUMOou0S+ZB1c+W+NWu9UtgX5vMnm36FfgrG6E5FCDHLSx7br
   e7X4g9JDCVneNi7f3cC0Fv25qaQzHBQ+CeCwPinUzNOoZS3oF1QNWE9W0
   k3muDJkt333YelfKmaoL1mxxOWe39SA9Si7OlS7nIWXB3IZfI61T20XPa
   1vc6IUS7Cp5/uYUsScAXkamU0uW0yNSlP0XR/uorL/jklB23KKjTAc9Mg
   aw4HzpynsdDSD/ob8NGB6XkQFmIDkIkKP/pOA52xSQcHDyhD3kk+NnxeI
   F3uqPOdajaynPHw7mkz5GeohRkOOAXNAEHxzq8vLmHT5YrZdaAvWVe5PC
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274876498"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="274876498"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:25 -0700
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="666313613"
Received: from jngkeatx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.254.254])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:24 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 12/12] linux-yocto/5.10: update to v5.10.113
Date: Mon, 30 May 2022 10:36:02 +0800
Message-Id: 
 <6f0d16ddf3bbac1eea31683b262e866ec65fba2e.1653877872.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1653877872.git.anuj.mittal@intel.com>
References: <cover.1653877872.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 02:36:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166256

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    54af9dd2b958 Linux 5.10.113
    7992fdb045fb Revert "net: micrel: fix KS8851_MLL Kconfig"
    8bedbc8f7f35 block/compat_ioctl: fix range check in BLKGETSIZE
    fea24b07edfc staging: ion: Prevent incorrect reference counting behavour
    dccee748af17 spi: atmel-quadspi: Fix the buswidth adjustment between spi-mem and controller
    572761645b88 jbd2: fix a potential race while discarding reserved buffers after an abort
    50aac4427360 can: isotp: stop timeout monitoring when no first frame was sent
    e1e96e372721 ext4: force overhead calculation if the s_overhead_cluster makes no sense
    4789149b9ea2 ext4: fix overhead calculation to account for the reserved gdt blocks
    0c54b093766b ext4, doc: fix incorrect h_reserved size
    22c450d39f89 ext4: limit length to bitmap_maxbytes - blocksize in punch_hole
    75ac724684b7 ext4: fix use-after-free in ext4_search_dir
    a46b3d849864 ext4: fix symlink file size not match to file content
    f6038d43b25b ext4: fix fallocate to use file_modified to update permissions consistently
    19590bbc691d perf report: Set PERF_SAMPLE_DATA_SRC bit for Arm SPE event
    e012f9d1af54 powerpc/perf: Fix power9 event alternatives
    0a2cef65b329 drm/vc4: Use pm_runtime_resume_and_get to fix pm_runtime_get_sync() usage
    f8f8b3124b89 KVM: PPC: Fix TCE handling for VFIO
    405d98427416 drm/panel/raspberrypi-touchscreen: Initialise the bridge in prepare
    231381f52116 drm/panel/raspberrypi-touchscreen: Avoid NULL deref if not initialised
    51d9cbbb0f5a perf/core: Fix perf_mmap fail when CONFIG_PERF_USE_VMALLOC enabled
    88fcfd6ee6c5 sched/pelt: Fix attach_entity_load_avg() corner case
    c55327bc3712 arm_pmu: Validate single/group leader events
    5580b974a84b ARC: entry: fix syscall_trace_exit argument
    7082650eb826 e1000e: Fix possible overflow in LTR decoding
    43a2a3734aa3 ASoC: soc-dapm: fix two incorrect uses of list iterator
    54e6180c8c2d gpio: Request interrupts after IRQ is initialized
    0837ff17d052 openvswitch: fix OOB access in reserve_sfa_size()
    19f6dcb1f0f0 xtensa: fix a7 clobbering in coprocessor context load/store
    f399ab11dd6c xtensa: patch_text: Fixup last cpu should be master
    ba2716da2336 net: atlantic: invert deep par in pm functions, preventing null derefs
    358a3846f6a9 dma: at_xdmac: fix a missing check on list iterator
    cf23a960c5c6 ata: pata_marvell: Check the 'bmdma_addr' beforing reading
    9ca66d791439 mm/mmu_notifier.c: fix race in mmu_interval_notifier_remove()
    ed5d4efb4df1 oom_kill.c: futex: delay the OOM reaper to allow time for proper futex cleanup
    6b932920b96f mm, hugetlb: allow for "high" userspace addresses
    50cbc583fa83 EDAC/synopsys: Read the error count from the correct register
    7ec6e06ee405 nvme-pci: disable namespace identifiers for Qemu controllers
    316bd86c2261 nvme: add a quirk to disable namespace identifiers
    76101c8e0c31 stat: fix inconsistency between struct stat and struct compat_stat
    bf28bba30410 scsi: qedi: Fix failed disconnect handling
    a284cca3d81a net: macb: Restart tx only if queue pointer is lagging
    9581e07b549b drm/msm/mdp5: check the return of kzalloc()
    8d71edabb0ab dpaa_eth: Fix missing of_node_put in dpaa_get_ts_info()
    b3afe5a7fd75 brcmfmac: sdio: Fix undefined behavior due to shift overflowing the constant
    202748f44148 mt76: Fix undefined behavior due to shift overflowing the constant
    0de9c104d04a net: atlantic: Avoid out-of-bounds indexing
    5bef9fc38ffa cifs: Check the IOCB_DIRECT flag, not O_DIRECT
    e129c55153c8 vxlan: fix error return code in vxlan_fdb_append
    8e7ea1136475 arm64: dts: imx: Fix imx8*-var-som touchscreen property sizes
    cd227ac03f2a ALSA: usb-audio: Fix undefined behavior due to shift overflowing the constant
    490815f0b50e platform/x86: samsung-laptop: Fix an unsigned comparison which can never be negative
    cb17b56a9b4d reset: tegra-bpmp: Restore Handle errors in BPMP response
    d513ea9b7ef8 ARM: vexpress/spc: Avoid negative array index when !SMP
    052e4a661f90 arm64: mm: fix p?d_leaf()
    18ff7a2efa4e arm64/mm: Remove [PUD|PMD]_TABLE_BIT from [pud|pmd]_bad()
    3bf8ca350170 selftests: mlxsw: vxlan_flooding: Prevent flooding of unwanted packets
    520aab8b723c dmaengine: idxd: add RO check for wq max_transfer_size write
    9a3c026dc3a5 dmaengine: idxd: add RO check for wq max_batch_size write
    f593f49fcd17 net: stmmac: Use readl_poll_timeout_atomic() in atomic state
    3d55b195747c netlink: reset network and mac headers in netlink_dump()
    49516e6ed914 ipv6: make ip6_rt_gc_expire an atomic_t
    078d839f11ac l3mdev: l3mdev_master_upper_ifindex_by_index_rcu should be using netdev_master_upper_dev_get_rcu
    0ac8f83d8f64 net/sched: cls_u32: fix possible leak in u32_init_knode()
    93366275be72 ip6_gre: Fix skb_under_panic in __gre6_xmit()
    200f96ebb389 ip6_gre: Avoid updating tunnel->tun_hlen in __gre6_xmit()
    8fb76adb89f0 net/packet: fix packet_sock xmit return value checking
    a499cb5f3ef9 net/smc: Fix sock leak when release after smc_shutdown()
    60592f16a456 rxrpc: Restore removed timer deletion
    fc7116a79a86 igc: Fix BUG: scheduling while atomic
    46b0e4f998ce igc: Fix infinite loop in release_swfw_sync
    c075c3ea0317 esp: limit skb_page_frag_refill use to a single page
    3f7914dbeacd spi: spi-mtk-nor: initialize spi controller after resume
    f714abf28f81 dmaengine: mediatek:Fix PM usage reference leak of mtk_uart_apdma_alloc_chan_resources
    9bc949a181ba dmaengine: imx-sdma: Fix error checking in sdma_event_remap
    12aa8021c7a7 ASoC: codecs: wcd934x: do not switch off SIDO Buck when codec is in use
    b6f474cd3097 ASoC: msm8916-wcd-digital: Check failure for devm_snd_soc_register_component
    608fc58858bf ASoC: atmel: Remove system clock tree configuration for at91sam9g20ek
    d29c78d3f9c5 dm: fix mempool NULL pointer race when completing IO
    cf9b19546494 ALSA: hda/realtek: Add quirk for Clevo NP70PNP
    8ce3820fc9d4 ALSA: usb-audio: Clear MIDI port active flag after draining
    43ce33a68e2b net/sched: cls_u32: fix netns refcount changes in u32_change()
    04dd45d9776e gfs2: assign rgrp glock before compute_bitstructs
    378061c9b886 perf tools: Fix segfault accessing sample_id xyarray
    5e8446e3820c tracing: Dump stacktrace trigger to the corresponding instance
    69848f9488bc mm: page_alloc: fix building error on -Werror=array-compare
    08ad7a770efa etherdevice: Adjust ether_addr* prototypes to silence -Wstringop-overead

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8be43ceaf742c4c1b59522ac75df4846cc271461)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 4c55a27abf..62d7494b88 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bd6e7290bc766ef13e42a1e37f75e6e708b4e317"
-SRCREV_meta ?= "19e7547dd6617760d6094b7a42da1a718b5a96ee"
+SRCREV_machine ?= "88b754b80392e1f1ac7df46595f9712edc8aec02"
+SRCREV_meta ?= "7767ab05bd3e525a287a7f9bfd780005b5eb25a3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.112"
+LINUX_VERSION ?= "5.10.113"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 42d5c105b7..e0c693fed2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.112"
+LINUX_VERSION ?= "5.10.113"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "ab911ca906ec6d1551ba12373d4133ccaf7f83cc"
-SRCREV_machine ?= "aadc46b05e5c77328bd3461578c770af3efa8944"
-SRCREV_meta ?= "19e7547dd6617760d6094b7a42da1a718b5a96ee"
+SRCREV_machine:qemuarm ?= "7dacc8332b0bc5600d97583f45b841c9724f2191"
+SRCREV_machine ?= "8dc46fa883d7b9a3412791f6731096e2e516d949"
+SRCREV_meta ?= "7767ab05bd3e525a287a7f9bfd780005b5eb25a3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index bdeecd1bc8..e05a4769d1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1c2e2b55a9d13e749131d812797fa0ddbb56fde2"
-SRCREV_machine:qemuarm64 ?= "9d22ba94a0b4466ead91f24b138fd8e5814dad21"
-SRCREV_machine:qemumips ?= "c8f392c534a331f6ee6d40c8b1ff428fc3599f7f"
-SRCREV_machine:qemuppc ?= "498fcdc5dc2f0b99001e50da239976430eacf676"
-SRCREV_machine:qemuriscv64 ?= "6cf7dea05bd756513cf58c5ced8c6bf1d1f23c15"
-SRCREV_machine:qemuriscv32 ?= "6cf7dea05bd756513cf58c5ced8c6bf1d1f23c15"
-SRCREV_machine:qemux86 ?= "6cf7dea05bd756513cf58c5ced8c6bf1d1f23c15"
-SRCREV_machine:qemux86-64 ?= "6cf7dea05bd756513cf58c5ced8c6bf1d1f23c15"
-SRCREV_machine:qemumips64 ?= "a005c07acd278c86ddab4cd8bc7a1bfae4638414"
-SRCREV_machine ?= "6cf7dea05bd756513cf58c5ced8c6bf1d1f23c15"
-SRCREV_meta ?= "19e7547dd6617760d6094b7a42da1a718b5a96ee"
+SRCREV_machine:qemuarm ?= "6092497574895b1179a3c7a9e07c7f40c2d4c136"
+SRCREV_machine:qemuarm64 ?= "97ad6c5f9ffdb6b108cbbf99d9061dd0fe03e4e8"
+SRCREV_machine:qemumips ?= "e53b2d1867f7bdc2c0cc904a15992178688c3ad4"
+SRCREV_machine:qemuppc ?= "b12ed76165bfc9fe2b99fcc224b5e0134b7b533f"
+SRCREV_machine:qemuriscv64 ?= "a8b4c628f382412e5e7df5750f2be711df95fa06"
+SRCREV_machine:qemuriscv32 ?= "a8b4c628f382412e5e7df5750f2be711df95fa06"
+SRCREV_machine:qemux86 ?= "a8b4c628f382412e5e7df5750f2be711df95fa06"
+SRCREV_machine:qemux86-64 ?= "a8b4c628f382412e5e7df5750f2be711df95fa06"
+SRCREV_machine:qemumips64 ?= "07580586b738406b4dec9bf91d4eecdb933f2a07"
+SRCREV_machine ?= "a8b4c628f382412e5e7df5750f2be711df95fa06"
+SRCREV_meta ?= "7767ab05bd3e525a287a7f9bfd780005b5eb25a3"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.112"
+LINUX_VERSION ?= "5.10.113"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.35.3


