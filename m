Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA71C4321E
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 15:15:19 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web08.8839.1652973311087944376
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 08:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Onn6eTK1;
 spf=pass (domain: gmail.com, ip: 209.85.219.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id y20so4768165qvx.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 08:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Txe973rXGUjUORclnCaK+zHOcGUs2KpmOejSCSUugJE=;
        b=Onn6eTK1X/CWAEhxUiG9qLlnx32E61cJrzRUZSoo/xnOg8vGh4sZmMYSL8YdOx4Hsn
         bPuhPHHF3wJlhj+jBhn3u6lnUeA0ZVk4OncQXn6BVuHsAixYursYKKZjaHIexC42ucmi
         1QOveB1o4fJWMBEe0CUqM/cX59lhkWYP8aKcAlcNMqELdYnCxeeEDyUMuNLTuZKqs+iK
         U5NMs9+n7GY8HB6rSaI5nIPitkrgwdyUm6ywYTNTE/3zTlFxs2ljUQU2RzebP8fIjRB8
         cAMZHM19p8C+7ZK8BaWu9vzqhuybXxX/hzSPuRLX/DQ9nFmc3Bi6A/nZJ8yn+Q2dUJej
         s/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Txe973rXGUjUORclnCaK+zHOcGUs2KpmOejSCSUugJE=;
        b=eBHis/DBEVQc2K+OfadhpCg0WJEGcilngv1V2nB/TrB6jYFYlbGKn7PckyQ2U0cB3V
         IGL1cC0C0XO1ttsAjNGcCC+wru1NxhGTxLxKgm8uqICjUYbQ3sxFR5RwNjPdmCpOCVx1
         WxNzHP5Vk0z4bzoQ3x3MLNCxPwOuMBeYcWNo3oki4JqxEJjIz1KPqXqRlhYEazRCRo0j
         ZtfZzqNMr/bvWId39f829N4pmTiJHdfOaFX3OfkIWERUM0XT1+fp4scXXBt+wkpWtW6U
         xZXSe2frjffqs5pAkgqETNJpnmYG5/UGVVG1cfPMl16ZSvpHq6r/uQRQ1dCT4JVKDQgB
         dN+A==
X-Gm-Message-State: AOAM5308/axNlDGP5i/zqyrydAN4Lp/oMJQPWuCa2OLlU48HJaI6VIK3
	pm7yve2it7XQxTpwDRFoULh+l2x7I92q0w==
X-Google-Smtp-Source: 
 ABdhPJx/ZGQfMNLWUwRlrIk/LS8S4X3RegZHdiJ6iauOmJPKbV1lQIzlPEDK4btGXYCkJUiimPmXzg==
X-Received: by 2002:a05:6214:19ec:b0:45b:f0:8d0a with SMTP id
 q12-20020a05621419ec00b0045b00f08d0amr4535213qvc.110.1652973310016;
        Thu, 19 May 2022 08:15:10 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 he17-20020a05622a601100b002f39b99f6c3sm1354898qtb.93.2022.05.19.08.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 08:15:09 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto/5.10: update to v5.10.113
Date: Thu, 19 May 2022 11:15:02 -0400
Message-Id: 
 <152923d561297edec16d0e97dad416ea7fdd5455.1652973084.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1652973084.git.bruce.ashfield@gmail.com>
References: <cover.1652973084.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 15:15:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165897

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
index 3d3dad99b5..37f2db88a7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
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
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.112"
+LINUX_VERSION ?= "5.10.113"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


