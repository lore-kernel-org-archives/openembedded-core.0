Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7857C433EF
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 00:20:04 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.5707.1640910003444994118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 16:20:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=CfiUos5R;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640910003; x=1672446003;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZwJNrt3KDarJTQ2c9CqGbpVBwiNN/rmKvUp+CmyCFkQ=;
  b=CfiUos5RO/iS1Ax9M0YuQ2bYwcjgICgWM5F5+6mmLCTWt8EwjBGx+7Mf
   dQA3fvJmEE3E5lB52BLT6TDjdXSA4XGJnP2/7hxHqTVj9HulRi5jEzZeH
   hGge7wFZaHbhBTpf1AlB2Y4je1IDxbH8NxL1i9clXijCU07PJNkF1zWVn
   VMWqScWHeU8xrOoxbvZonVCFru/LCTkBNrrGYHTnrjj7y+ar/VfE2aQrZ
   qIxH9W/PvdwWe9uzppofspAf/wMBmBEGOL+BgblEauGIWt38E+wSXUjgM
   mfm8SYBsELCWuuXLM2v31WOV1ipCF2WHg8hmwSPnAzpn2MOYJOPkyasxf
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="228573126"
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600";
   d="scan'208";a="228573126"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 16:19:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600";
   d="scan'208";a="619502338"
Received: from jiayingk-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.231.141])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 16:19:41 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 07/11] linux-yocto/5.10: update to v5.10.87
Date: Fri, 31 Dec 2021 08:19:20 +0800
Message-Id: 
 <b185cba0e223f6308dc820950522bb01094ad258.1640909776.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1640909776.git.anuj.mittal@intel.com>
References: <cover.1640909776.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 00:20:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160075

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

272aedd4a305 Linux 5.10.87
8dd559d53b3b arm: ioremap: don't abuse pfn_valid() to check if pfn is in RAM
65c578935bcc arm: extend pfn_valid to take into account freed memory map alignment
6e634c0e7155 memblock: ensure there is no overflow in memblock_overlaps_region()
74551f13c62f memblock: align freed memory map on pageblock boundaries with SPARSEMEM
b4b54c7ba149 memblock: free_unused_memmap: use pageblock units instead of MAX_ORDER
b6a1cbd187fc perf intel-pt: Fix error timestamp setting on the decoder error path
0612aa02c2c8 perf intel-pt: Fix missing 'instruction' events with 'q' option
71c795028b31 perf intel-pt: Fix next 'err' value, walking trace
02681dd1780a perf intel-pt: Fix state setting when receiving overflow (OVF) packet
cbed09b44ce0 perf intel-pt: Fix intel_pt_fup_event() assumptions about setting state type
3bb7fd4be8c4 perf intel-pt: Fix sync state when a PSB (synchronization) packet is found
731ff7884138 perf intel-pt: Fix some PGE (packet generation enable/control flow packets) usage
b23f9252a41d perf inject: Fix itrace space allowed for new attributes
7c26da3be1e9 ethtool: do not perform operations on net devices being unregistered
6992d8c215c8 hwmon: (dell-smm) Fix warning on /proc/i8k creation error
c31470a30c0d fuse: make sure reclaim doesn't write the inode
613725436e69 bpf: Fix integer overflow in argument calculation for bpf_map_area_alloc
9099f3512678 staging: most: dim2: use device release method
ac76adc87a78 KVM: x86: Ignore sparse banks size for an "all CPUs", non-sparse IPI req
6f0d9d3e74dc tracing: Fix a kmemleak false positive in tracing_map
f35f7f04aa80 drm/amd/display: add connector type check for CRC source set
dd3cea342522 drm/amd/display: Fix for the no Audio bug with Tiled Displays
dadce61247c6 net: netlink: af_netlink: Prevent empty skb by adding a check on len.
bca6af4325d6 i2c: rk3x: Handle a spurious start completion interrupt flag
d6edec8a7b55 parisc/agp: Annotate parisc agp init functions with __init
cf520ccffd9a ALSA: hda/hdmi: fix HDA codec entry table order for ADL-P
701a07fd0274 ALSA: hda: Add Intel DG2 PCI ID and HDMI codec vid
6d22a96d12d7 net/mlx4_en: Update reported link modes for 1/10G
999069d8b040 Revert "tty: serial: fsl_lpuart: drop earlycon entry for i.MX8QXP"
27f4ce02b31a s390/test_unwind: use raw opcode instead of invalid instruction
9eab949e2b90 KVM: arm64: Save PSTATE early on exit
990fd815ec88 drm/msm/dsi: set default num_data_lanes
c602863ad28e nfc: fix segfault in nfc_genl_dump_devices_done
37050f17f2d2 Linux 5.10.86
32414491834c netfilter: selftest: conntrack_vrf.sh: fix file permission

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 41e6433af247105b9430d5fe2ef3e32624d6ed76)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 8de610bd40..63ae89611f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "97b3d2f0923ab9e9a9eb47c284006cddb0156146"
-SRCREV_meta ?= "be7b73b2c0e453724d18520ae165b5d474735578"
+SRCREV_machine ?= "d6b1cc83a5315388b060eaa6195f1ce77103c3d1"
+SRCREV_meta ?= "1ab943530f4016a9ee7bd8fc3d10acf702c23c44"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.85"
+LINUX_VERSION ?= "5.10.87"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index f557251ae0..7d6e9cb992 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.85"
+LINUX_VERSION ?= "5.10.87"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "615408bf1ba1cbc40750334329f97ea2b56e3d63"
-SRCREV_machine ?= "3bd3c6de33c2efcef6feaa0f2624e8adc900bda7"
-SRCREV_meta ?= "be7b73b2c0e453724d18520ae165b5d474735578"
+SRCREV_machine:qemuarm ?= "a46d018920762d81e283ecc80cf156fe226712ed"
+SRCREV_machine ?= "e36ccf7356af83243e55f6ca491049462f7feab7"
+SRCREV_meta ?= "1ab943530f4016a9ee7bd8fc3d10acf702c23c44"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index dd1ff905c8..c62157d850 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "bd67fa7bae301072f17d78b932b833f2f9db6d79"
-SRCREV_machine:qemuarm64 ?= "10e6f0bc97e599902f6c98213945685d0fd4a780"
-SRCREV_machine:qemumips ?= "960862d5d1b51892b7cd621ba9d54f89dc99dc0b"
-SRCREV_machine:qemuppc ?= "5c4c88cb82cbc6aff04ecf12f4c34d0bc5dc90c4"
-SRCREV_machine:qemuriscv64 ?= "299cd9fdd1a66ad4ce643a6536648228669a50fb"
-SRCREV_machine:qemuriscv32 ?= "299cd9fdd1a66ad4ce643a6536648228669a50fb"
-SRCREV_machine:qemux86 ?= "299cd9fdd1a66ad4ce643a6536648228669a50fb"
-SRCREV_machine:qemux86-64 ?= "299cd9fdd1a66ad4ce643a6536648228669a50fb"
-SRCREV_machine:qemumips64 ?= "9e7fb877bb5fe2aaec720cf181e07e2db397e68f"
-SRCREV_machine ?= "299cd9fdd1a66ad4ce643a6536648228669a50fb"
-SRCREV_meta ?= "be7b73b2c0e453724d18520ae165b5d474735578"
+SRCREV_machine:qemuarm ?= "c5c39f3ba284421eceeb9b084da1508167b37abe"
+SRCREV_machine:qemuarm64 ?= "fab21fdf95a62d013b98eb91adc0d9cfc69f700b"
+SRCREV_machine:qemumips ?= "ef1d4a1e93c209637022c9337131394a6f3679ae"
+SRCREV_machine:qemuppc ?= "8009be617e2fd4c34c80892776d79f463d436fc0"
+SRCREV_machine:qemuriscv64 ?= "4f2bb635ea267e71f112fd11323c1d3a2f2b85d0"
+SRCREV_machine:qemuriscv32 ?= "4f2bb635ea267e71f112fd11323c1d3a2f2b85d0"
+SRCREV_machine:qemux86 ?= "4f2bb635ea267e71f112fd11323c1d3a2f2b85d0"
+SRCREV_machine:qemux86-64 ?= "4f2bb635ea267e71f112fd11323c1d3a2f2b85d0"
+SRCREV_machine:qemumips64 ?= "2f42ab7aac37cd61f47231301b3f1e232807e0e6"
+SRCREV_machine ?= "4f2bb635ea267e71f112fd11323c1d3a2f2b85d0"
+SRCREV_meta ?= "1ab943530f4016a9ee7bd8fc3d10acf702c23c44"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.85"
+LINUX_VERSION ?= "5.10.87"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.33.1


