Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52404C47080
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.3165.1650419971168400442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 18:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=hTYBZl1a;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650419973; x=1681955973;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=5eD+3D8HhNi8MyA9gAsBETfD9pNdw0NHR8N9wYYsrag=;
  b=hTYBZl1aW/EdBEMlpag/kDM+tuIAHVDMHQTj9KPaYAKQInT8KaNSj6mR
   4JT4/cDPN4eSaTjbdMt96wNCSKta+jZBIv508O7oJyjw2aTH7P6Bh2xhl
   eGhME/M1SDP18i8iMzAucpzOTAvsvJlZnWOReD+BklglWrxWBD3tEsS6k
   lDwg2mZYmUs2MHyXmnJq32SvWTPUmDBFCbfeCIEpSQPPx24qXTHfrQEAS
   PhsOQ3oXmzJNfxhlls+68LTJ0ODiNrT3vQgGNM/S6qeWeD9FwviI3tiZu
   uobR1CCKWx3t1Y53mF0zbt2e0U8vqqSQTn75ZRvfCWR/kMY3QDnITzS32
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="350364641"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="350364641"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="531071461"
Received: from kchew4-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.150.151])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:31 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 04/11] linux-yocto/5.10: update to v5.10.109
Date: Wed, 20 Apr 2022 09:59:09 +0800
Message-Id: 
 <8b0079d029e3d876990d7ab137f24525440ffe91.1650378286.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650378286.git.anuj.mittal@intel.com>
References: <cover.1650378286.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164643

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    d9c5818a0bc0 Linux 5.10.109
    163960a7de13 llc: only change llc->dev when bind() succeeds
    2b5a6d771450 nds32: fix access_ok() checks in get/put_user
    c064268eb8ed wcn36xx: Differentiate wcn3660 from wcn3620
    95193d12f10a tpm: use try_get_ops() in tpm-space.c
    5d3ff9542a40 mac80211: fix potential double free on mesh join
    fcc9797d0d13 rcu: Don't deboost before reporting expedited quiescent state
    87f7ed7c3659 Revert "ath: add support for special 0x0 regulatory domain"
    c971e6a1c8fa crypto: qat - disable registration of algorithms
    9f4e64611ebe ACPI: video: Force backlight native for Clevo NL5xRU and NL5xNU
    0b2ffba2de50 ACPI: battery: Add device HID and quirk for Microsoft Surface Go 3
    2724b72b225d ACPI / x86: Work around broken XSDT on Advantech DAC-BJ01 board
    2c74374c2e88 netfilter: nf_tables: initialize registers in nft_do_chain()
    eb1ba8d1c3e2 drivers: net: xgene: Fix regression in CRC stripping
    a2368d10b7fb ALSA: pci: fix reading of swapped values from pcmreg in AC97 codec
    6936d2ecf822 ALSA: cmipci: Restore aux vol on suspend/resume
    cbd27127af5f ALSA: usb-audio: Add mute TLV for playback volumes on RODE NT-USB
    0ae81ef3ea0e ALSA: pcm: Add stream lock during PCM reset ioctl operations
    b560d670c87d ALSA: pcm: Fix races among concurrent prealloc proc writes
    a38440f00697 ALSA: pcm: Fix races among concurrent prepare and hw_params/hw_free calls
    8527c8f052fb ALSA: pcm: Fix races among concurrent read/write and buffer changes
    0f6947f5f520 ALSA: pcm: Fix races among concurrent hw_params and hw_free calls
    014c81dfb319 ALSA: hda/realtek: Add quirk for ASUS GA402
    05256f3fd6c9 ALSA: hda/realtek - Fix headset mic problem for a HP machine with alc671
    ca8247b4dfb8 ALSA: hda/realtek: Add quirk for Clevo NP50PNJ
    26fe8f31033b ALSA: hda/realtek: Add quirk for Clevo NP70PNJ
    80eab86a86d2 ALSA: usb-audio: add mapping for new Corsair Virtuoso SE
    5ce74ff70593 ALSA: oss: Fix PCM OSS buffer allocation overflow
    db03abd0dae0 ASoC: sti: Fix deadlock via snd_pcm_stop_xrun() call
    571df3393f52 llc: fix netdevice reference leaks in llc_ui_bind()
    56dc187b35d5 staging: fbtft: fb_st7789v: reset display before initialization
    351493858ebc tpm: Fix error handling in async work
    ea21245cdcab cgroup-v1: Correct privileges check in release_agent writes
    824a950c3f11 cgroup: Use open-time cgroup namespace for process migration perm checks
    f28364fe384f cgroup: Allocate cgroup_file_ctx for kernfs_open_file->priv
    9eeaa2d7d58a exfat: avoid incorrectly releasing for root inode
    ae8ec5eabb1a net: ipv6: fix skb_over_panic in __ip6_append_data
    25c23fe40e6e nfc: st21nfca: Fix potential buffer overflows in EVT_TRANSACTION
    9940314ebfc6 Linux 5.10.108
    37119edab8f4 Revert "selftests/bpf: Add test for bpf_timer overwriting crash"
    9248694dac20 esp: Fix possible buffer overflow in ESP transformation
    96340cdd5526 smsc95xx: Ignore -ENODEV errors when device is unplugged
    e27b51af5449 net: usb: Correct reset handling of smsc95xx
    b54daeafc1b0 net: usb: Correct PHY handling of smsc95xx
    204d38dc6a81 perf symbols: Fix symbol size calculation condition
    f0d43d22d241 Input: aiptek - properly check endpoint type
    98e7a654a5be scsi: mpt3sas: Page fault in reply q processing
    10a805334a11 usb: usbtmc: Fix bug in pipe direction for control transfers
    00bdd9bf1ac6 usb: gadget: Fix use-after-free bug by not setting udc->dev.driver
    28bc0267399f usb: gadget: rndis: prevent integer overflow in rndis_set_response()
    2c010c61e614 arm64: fix clang warning about TRAMP_VALIAS
    277b7f63948b net: mscc: ocelot: fix backwards compatibility with single-chain tc-flower offload
    2550afba2a30 net: bcmgenet: skip invalid partial checksums
    bf5b7aae86d3 bnx2x: fix built-in kernel driver load failure
    c07fdba12fb0 net: phy: mscc: Add MODULE_FIRMWARE macros
    ba50073cf4af net: dsa: Add missing of_node_put() in dsa_port_parse_of
    a630ad5e8b2d net: handle ARPHRD_PIMREG in dev_is_mac_header_xmit()
    336b6be6ad09 drm/panel: simple: Fix Innolux G070Y2-L01 BPP settings
    9d45aec02f7b drm/imx: parallel-display: Remove bus flags check in imx_pd_bridge_atomic_check()
    9b763ceda6f8 hv_netvsc: Add check for kvmalloc_array
    09a7264fb0d0 atm: eni: Add check for dma_map_single
    70b7b3c055fd net/packet: fix slab-out-of-bounds access in packet_recvmsg()
    169add82d201 net: phy: marvell: Fix invalid comparison in the resume and suspend functions
    01fac1ca8ab9 esp6: fix check on ipv6_skip_exthdr's return value
    d9fe590970c4 vsock: each transport cycles only on its own sockets
    ac7dd60946c0 efi: fix return value of __setup handlers
    fa3aa103e79c mm: swap: get rid of livelock in swapin readahead
    df3301dc60a3 ocfs2: fix crash when initialize filecheck kobj fails
    0f9b7b8df175 crypto: qcom-rng - ensure buffer for generate is completely filled

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit db6a636319ffd2b12c54b6ec1b3fdd670f9b6704)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index a8b6aa203d..9b125a92ef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7f96d3fd60eea0ab38afdf07b3fc7c8c9f501802"
-SRCREV_meta ?= "24ab54209a8822aad92afe2c51ea5b95f5175394"
+SRCREV_machine ?= "40a6731993d406d6c9fed43cb20c6a4f178ff2cc"
+SRCREV_meta ?= "1ae63728667964edf845b4f85bb6c06a55b81793"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.107"
+LINUX_VERSION ?= "5.10.109"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 758260c3d8..98ac869e79 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.107"
+LINUX_VERSION ?= "5.10.109"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "d47f1b40f2f77d0c810defd853c69eb39cb84bf5"
-SRCREV_machine ?= "1ae0844c6a36151066744e43fd30db3a946bc21d"
-SRCREV_meta ?= "24ab54209a8822aad92afe2c51ea5b95f5175394"
+SRCREV_machine:qemuarm ?= "9524d0ca0feeeb4cb698e3c984f4391ccb4b8e19"
+SRCREV_machine ?= "bccf3a5f14511fb8ce6a9dd990216508d2c2ec6e"
+SRCREV_meta ?= "1ae63728667964edf845b4f85bb6c06a55b81793"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 9c1bd26b36..74fd0ad21c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2ef8231651bb6a4c79b307f59a794b92238546ec"
-SRCREV_machine:qemuarm64 ?= "00684b441f15d202c5849eed164a9b3b94a5c1e8"
-SRCREV_machine:qemumips ?= "661a4f517906253e074fe301d68ff1e6b6968e9f"
-SRCREV_machine:qemuppc ?= "bff933cb7a11019c64e6034c48ab79453f75b99e"
-SRCREV_machine:qemuriscv64 ?= "763c0dbc0458ebcb1d06afe2f324925f0f61bd27"
-SRCREV_machine:qemuriscv32 ?= "763c0dbc0458ebcb1d06afe2f324925f0f61bd27"
-SRCREV_machine:qemux86 ?= "763c0dbc0458ebcb1d06afe2f324925f0f61bd27"
-SRCREV_machine:qemux86-64 ?= "763c0dbc0458ebcb1d06afe2f324925f0f61bd27"
-SRCREV_machine:qemumips64 ?= "7a89b456542ff1fa0ab71fa4a2ae6f04281f3a2d"
-SRCREV_machine ?= "763c0dbc0458ebcb1d06afe2f324925f0f61bd27"
-SRCREV_meta ?= "24ab54209a8822aad92afe2c51ea5b95f5175394"
+SRCREV_machine:qemuarm ?= "dfeff112cafaf3a04da6cd60301d297406e1b77f"
+SRCREV_machine:qemuarm64 ?= "3641e4234255c71c33cb2d9422f54c17b70c8941"
+SRCREV_machine:qemumips ?= "7eead19134a43cf9ccc0fa9d75c45be2a7743f13"
+SRCREV_machine:qemuppc ?= "6e1d66b2a871be0450722a50fc087ff8ccbcddd7"
+SRCREV_machine:qemuriscv64 ?= "d2f7a595bf0b752275d503046494b668549cb151"
+SRCREV_machine:qemuriscv32 ?= "d2f7a595bf0b752275d503046494b668549cb151"
+SRCREV_machine:qemux86 ?= "d2f7a595bf0b752275d503046494b668549cb151"
+SRCREV_machine:qemux86-64 ?= "d2f7a595bf0b752275d503046494b668549cb151"
+SRCREV_machine:qemumips64 ?= "279f142932679a8ba212ebae4b9db851636a1fab"
+SRCREV_machine ?= "d2f7a595bf0b752275d503046494b668549cb151"
+SRCREV_meta ?= "1ae63728667964edf845b4f85bb6c06a55b81793"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.107"
+LINUX_VERSION ?= "5.10.109"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.35.1


