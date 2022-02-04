Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6A7C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:13:08 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.9481.1643983972820228964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 06:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=j48y/c49;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643983987; x=1675519987;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SNidPtK2cvCbUK/bNRo29+xGQBwFxEgUZrmLta7yFlw=;
  b=j48y/c49ZHs4XHNIJLQ2w81qmbgUy97Ai6mSi0y7EUhoWzyzSDlpbfv4
   4TK4YGCx+E6I6e146PXEjX8ikugMeLBZbR8V5GzbHtORUX7qat+IfD6yG
   Gb81lKSbwo7ihjibd6vBWT2feT+GoOau6UPyqvmphFR9pN9T2zbolRCf/
   maAyzYfI3paMRX/vdZRTRZpUALAoEuausc2y+yu6iKRly8qrIT7Cbe8YG
   1or9tPzetX/Oq1rkCTB/a6TGsJM27+lRD+P22BYliyjB5A1xRGtcs2W4j
   FHWUelkKVB+TOIiRWR3Rzeeiavg6BG4gkBEgc1sNBRIFNjiDzNE4u56FE
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248321631"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="248321631"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="566750090"
Received: from raajloka-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.235.116])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:05 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 10/17] linux-yocto/5.10: update to v5.10.93
Date: Fri,  4 Feb 2022 22:12:36 +0800
Message-Id: 
 <773b15f45639fbcae2f0476c4c2b615217f3f8bd.1643983711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643983711.git.anuj.mittal@intel.com>
References: <cover.1643983711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 14:13:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161357

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    fd187a492557 Linux 5.10.93
    bed97c903621 mtd: fixup CFI on ixp4xx
    f50803b519c3 powerpc/pseries: Get entry and uaccess flush required bits from H_GET_CPU_CHARACTERISTICS
    68c1aa82be00 ALSA: hda/realtek: Re-order quirk entries for Lenovo
    4d15a17d065d ALSA: hda/realtek: Add quirk for Legion Y9000X 2020
    d7b41464f1b7 ALSA: hda: ALC287: Add Lenovo IdeaPad Slim 9i 14ITL5 speaker quirk
    87246ae94b73 ALSA: hda/realtek - Fix silent output on Gigabyte X570 Aorus Master after reboot from Windows
    9c27e513fb33 ALSA: hda/realtek: Add speaker fixup for some Yoga 15ITL5 devices
    4c7fb4d519e5 KVM: x86: remove PMU FIXED_CTR3 from msrs_to_save_all
    6b8c3a185377 firmware: qemu_fw_cfg: fix kobject leak in probe error path
    889c73305b48 firmware: qemu_fw_cfg: fix NULL-pointer deref on duplicate entries
    ff9588cf1592 firmware: qemu_fw_cfg: fix sysfs information leak
    358a4b054abe rtlwifi: rtl8192cu: Fix WARNING when calling local_irq_restore() with interrupts enabled
    93c4506f9f8b media: uvcvideo: fix division by zero at stream start
    4c3f70be6f3a video: vga16fb: Only probe for EGA and VGA 16 color graphic cards
    161e43ab8cc1 9p: only copy valid iattrs in 9P2000.L setattr implementation
    0e6c0f3f4055 KVM: s390: Clarify SIGP orders versus STOP/RESTART
    413b427f5fff KVM: x86: Register Processor Trace interrupt hook iff PT enabled in guest
    723acd75a062 perf: Protect perf_guest_cbs with RCU
    eadde287a62e vfs: fs_context: fix up param length parsing in legacy_parse_param
    c5f38277163e remoteproc: qcom: pil_info: Don't memcpy_toio more than is provided
    5d88e24b23af orangefs: Fix the size of a memory allocation in orangefs_bufmap_alloc()
    0084fefe2960 devtmpfs regression fix: reconfigure on each mount
    ee40594c95ae kbuild: Add $(KBUILD_HOSTLDFLAGS) to 'has_libelf' test

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4f3dd05c163efe6da87a58ab9e1df61b83ed4444)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 695356c482..a8e8e604a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "73ddd15bb13083c63f183814223b1f064f707964"
-SRCREV_meta ?= "940dd7a24ebe6ad709d6912a24660dadf34ece83"
+SRCREV_machine ?= "ba47a407fe04203adb0ab5e164597c958cd9e334"
+SRCREV_meta ?= "7df27e6d296dfa16f289883c0661eed45059360c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.92"
+LINUX_VERSION ?= "5.10.93"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index e4b389367b..32e42cbda4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.92"
+LINUX_VERSION ?= "5.10.93"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "05c74d1b7b9b5ce5b386e2dbb787f1b00bbfdcb8"
-SRCREV_machine ?= "3c4b46871c0220942e07fc2c73ba94ac04b0d9ca"
-SRCREV_meta ?= "940dd7a24ebe6ad709d6912a24660dadf34ece83"
+SRCREV_machine:qemuarm ?= "ceb1f194e59c9dd3bdd83d51bb0994f3db23bf61"
+SRCREV_machine ?= "878e5c1469550bb0f8778d16d4adbe7d48b0b28d"
+SRCREV_meta ?= "7df27e6d296dfa16f289883c0661eed45059360c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 412a872e62..3a0a43bc0b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1e8e1a5927984c545448b4b15974addf670b0f5d"
-SRCREV_machine:qemuarm64 ?= "c42d48cae11e605f70cfc6f64dbc23711bfbf8cf"
-SRCREV_machine:qemumips ?= "0366c14c30f0ca1f9d4a793632ba9cdc86e7225e"
-SRCREV_machine:qemuppc ?= "4570b1179fe4eda809fa2b89a06e6acf95e35fc8"
-SRCREV_machine:qemuriscv64 ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
-SRCREV_machine:qemuriscv32 ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
-SRCREV_machine:qemux86 ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
-SRCREV_machine:qemux86-64 ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
-SRCREV_machine:qemumips64 ?= "f2a78b852f4afb30a5e453a8b1eac3e785cbfc39"
-SRCREV_machine ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
-SRCREV_meta ?= "940dd7a24ebe6ad709d6912a24660dadf34ece83"
+SRCREV_machine:qemuarm ?= "50c0e06718fb2b264619ce8d82608877d1e62a81"
+SRCREV_machine:qemuarm64 ?= "7907c5eb81e9a51307b5269d546999ebf47d9d59"
+SRCREV_machine:qemumips ?= "e9c51de36554662082afc08c6e54599b310c7951"
+SRCREV_machine:qemuppc ?= "77f361ea5eb293dcfe122ecb65f33ba32fd12501"
+SRCREV_machine:qemuriscv64 ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
+SRCREV_machine:qemuriscv32 ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
+SRCREV_machine:qemux86 ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
+SRCREV_machine:qemux86-64 ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
+SRCREV_machine:qemumips64 ?= "b668a352c94a8c29e585608e8302cacb1350f5ed"
+SRCREV_machine ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
+SRCREV_meta ?= "7df27e6d296dfa16f289883c0661eed45059360c"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.92"
+LINUX_VERSION ?= "5.10.93"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


