Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02E2C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 09:07:20 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.19860.1644224834864333556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 01:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=DwHnoq1g;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644224840; x=1675760840;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=FZE/Z7Q5icso3OWpUOYNB0y2vvGdFIdI42YXt7Z6mCI=;
  b=DwHnoq1g5mz5YgEGobHfXBTSnIKZ5ieu0efuaekm2rToSHW5le9Ym1No
   JHx5WETRMFewpZdfMZ9svHDPFo3fS9S1uh/+oGeyq1MuIKq5owg9XCRec
   t2n69V/rZitI9V/Dhm+IarQb+FvjJVd/9fCdr6XBtDJ4mkvgyfiM9BDkq
   2z1MqJLwLU8bslWG3F7J58/rcct+DlYM5NqUFWYGYqFvbzRYGvh/TGJM9
   nPvp/rRg38+vKEYmrq6taztXPm7o2mVzio/wqhBLlGBcqBTRy9DycGN7M
   8wMYvueA4VKQy2esIuYqozolq8w2lLlAmVq/TPseXalt28POhCg0V/okf
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="309420831"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="309420831"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="499140461"
Received: from xgoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.138.138])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:18 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/12] linux-yocto/5.10: update to v5.10.93
Date: Mon,  7 Feb 2022 17:06:57 +0800
Message-Id: 
 <8104d934d137bf94baab6f55cd970b6150e3eb85.1644224643.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644224643.git.anuj.mittal@intel.com>
References: <cover.1644224643.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 09:07:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161449

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
index a1986adcd5..48d2694995 100644
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
index 13a1ec8cce..eb42c407fa 100644
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
 
-SRCREV_machine_qemuarm ?= "05c74d1b7b9b5ce5b386e2dbb787f1b00bbfdcb8"
-SRCREV_machine ?= "3c4b46871c0220942e07fc2c73ba94ac04b0d9ca"
-SRCREV_meta ?= "940dd7a24ebe6ad709d6912a24660dadf34ece83"
+SRCREV_machine_qemuarm ?= "ceb1f194e59c9dd3bdd83d51bb0994f3db23bf61"
+SRCREV_machine ?= "878e5c1469550bb0f8778d16d4adbe7d48b0b28d"
+SRCREV_meta ?= "7df27e6d296dfa16f289883c0661eed45059360c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 827b5aa32e..e67bf54c98 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1e8e1a5927984c545448b4b15974addf670b0f5d"
-SRCREV_machine_qemuarm64 ?= "c42d48cae11e605f70cfc6f64dbc23711bfbf8cf"
-SRCREV_machine_qemumips ?= "0366c14c30f0ca1f9d4a793632ba9cdc86e7225e"
-SRCREV_machine_qemuppc ?= "4570b1179fe4eda809fa2b89a06e6acf95e35fc8"
-SRCREV_machine_qemuriscv64 ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
-SRCREV_machine_qemuriscv32 ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
-SRCREV_machine_qemux86 ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
-SRCREV_machine_qemux86-64 ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
-SRCREV_machine_qemumips64 ?= "f2a78b852f4afb30a5e453a8b1eac3e785cbfc39"
-SRCREV_machine ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
-SRCREV_meta ?= "940dd7a24ebe6ad709d6912a24660dadf34ece83"
+SRCREV_machine_qemuarm ?= "50c0e06718fb2b264619ce8d82608877d1e62a81"
+SRCREV_machine_qemuarm64 ?= "7907c5eb81e9a51307b5269d546999ebf47d9d59"
+SRCREV_machine_qemumips ?= "e9c51de36554662082afc08c6e54599b310c7951"
+SRCREV_machine_qemuppc ?= "77f361ea5eb293dcfe122ecb65f33ba32fd12501"
+SRCREV_machine_qemuriscv64 ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
+SRCREV_machine_qemuriscv32 ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
+SRCREV_machine_qemux86 ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
+SRCREV_machine_qemux86-64 ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
+SRCREV_machine_qemumips64 ?= "b668a352c94a8c29e585608e8302cacb1350f5ed"
+SRCREV_machine ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
+SRCREV_meta ?= "7df27e6d296dfa16f289883c0661eed45059360c"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.92"
+LINUX_VERSION ?= "5.10.93"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


