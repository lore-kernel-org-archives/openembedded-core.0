Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FADC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 09:07:18 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.19860.1644224834864333556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 01:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=bwGjDKEZ;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644224838; x=1675760838;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=dt9yF81xKfr3SXP0hXTQpqam4PO9n586CLnLyuXeBX8=;
  b=bwGjDKEZuI2gTW+xUTCgwcn45Vxr/zVx1ZFKgmeZMMwuYov1O8qbkfSf
   SIZgmXiGhnWNg3o0Rbgbcct19WHbICM2g/ucJFTc1xjaGwZkPCPFAWbp+
   nHoIqXrUuZ+lH3Wp53rL8UfQIalwUJLukOy2hS6wmGjRFT+46vJxRinD/
   AuRhVCQv7qsiN+7M6IklR3By1FqvO4kIVouFjjbXuyoBSx5SB/d8dOmRE
   TOL6Ph2ELnyh+rmC8A4/aSLfZUwBgR8KRMs7b1j9BiXdTv5AiJFXnI0u2
   OhScb8ChHb+/liDL2EzEw/ZyB4WfrwPfaolC2NAlGwDhsVTWXogx9aod/
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="309420819"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="309420819"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="499140443"
Received: from xgoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.138.138])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:16 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/12] linux-yocto/5.10: update to v5.10.92
Date: Mon,  7 Feb 2022 17:06:56 +0800
Message-Id: 
 <61bb3c237303f9048b1c4e17eeaa629d985f6d9e.1644224643.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644224643.git.anuj.mittal@intel.com>
References: <cover.1644224643.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 09:07:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161448

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    c982c1a83932 Linux 5.10.92
    c0091233f3d8 staging: greybus: fix stack size warning with UBSAN
    66d21c005d9b drm/i915: Avoid bitwise vs logical OR warning in snb_wm_latency_quirk()
    2d4fda471dc3 staging: wlan-ng: Avoid bitwise vs logical OR warning in hfa384x_usb_throttlefn()
    3609fed7ac8b media: Revert "media: uvcvideo: Set unique vdev name based in type"
    9b3c761e78d5 random: fix crash on multiple early calls to add_bootloader_randomness()
    61cca7d191c7 random: fix data race on crng init time
    3de9478230c3 random: fix data race on crng_node_pool
    43c494294f30 can: gs_usb: gs_can_start_xmit(): zero-initialize hf->{flags,reserved}
    45221a57b609 can: isotp: convert struct tpcon::{idx,len} to unsigned int
    bd61ae808b15 can: gs_usb: fix use of uninitialized variable, detach device on reception of invalid USB data
    f68e60001735 mfd: intel-lpss: Fix too early PM enablement in the ACPI ->probe()
    5f76445a31b7 veth: Do not record rx queue hint in veth_xmit
    ddfa53825f3d mmc: sdhci-pci: Add PCI ID for Intel ADL
    2e691f9894cc ath11k: Fix buffer overflow when scanning with extraie
    a87cecf94375 USB: Fix "slab-out-of-bounds Write" bug in usb_hcd_poll_rh_status
    15982330b61d USB: core: Fix bug in resuming hub's handling of wakeup requests
    413108ce3b56 ARM: dts: exynos: Fix BCM4330 Bluetooth reset polarity in I9100
    b6dd07023699 Bluetooth: bfusb: fix division by zero in send path
    869e1677a058 Bluetooth: btusb: Add support for Foxconn QCA 0xe0d0
    c20021ce945f Bluetooth: btusb: Add support for Foxconn MT7922A
    83493918380f Bluetooth: btusb: Add two more Bluetooth parts for WCN6855
    294c0dd80d8a Bluetooth: btusb: fix memory leak in btusb_mtk_submit_wmt_recv_urb()
    35ab8c9085b0 bpf: Fix out of bounds access from invalid *_or_null type verification
    c84fbba8a945 workqueue: Fix unbind_workers() VS wq_worker_running() race
    c39d68ab3836 md: revert io stats accounting

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 35dfcd31518e66fc4dc1f2283bd3320f994c868b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index ca7d5dd97c..a1986adcd5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "85c14e209f1ab7cee673735c4561e656b4e65217"
-SRCREV_meta ?= "de35f8006d0f932924752ddda94dd24e2da67fbc"
+SRCREV_machine ?= "73ddd15bb13083c63f183814223b1f064f707964"
+SRCREV_meta ?= "940dd7a24ebe6ad709d6912a24660dadf34ece83"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.91"
+LINUX_VERSION ?= "5.10.92"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index dbfeea6c82..13a1ec8cce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.91"
+LINUX_VERSION ?= "5.10.92"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "2227ab16358ca3193f03d0cd8509092076aeffbb"
-SRCREV_machine ?= "b3fdab7a9f3c11a61565cead0445883a61081583"
-SRCREV_meta ?= "de35f8006d0f932924752ddda94dd24e2da67fbc"
+SRCREV_machine_qemuarm ?= "05c74d1b7b9b5ce5b386e2dbb787f1b00bbfdcb8"
+SRCREV_machine ?= "3c4b46871c0220942e07fc2c73ba94ac04b0d9ca"
+SRCREV_meta ?= "940dd7a24ebe6ad709d6912a24660dadf34ece83"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 82dfb0f903..827b5aa32e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "fb570663823bd492e4c8d4339be825bda4210dc6"
-SRCREV_machine_qemuarm64 ?= "5a52b700c1693a95b8efa54cb65bec7807a75cd2"
-SRCREV_machine_qemumips ?= "8eb8a801f5f4764c362aefd5e97e704755cf740b"
-SRCREV_machine_qemuppc ?= "21b014e385a6b54a2fd7d667a1b556c69cda77de"
-SRCREV_machine_qemuriscv64 ?= "77c8d144b066f69e009ce2ee540a593b11eb736a"
-SRCREV_machine_qemuriscv32 ?= "77c8d144b066f69e009ce2ee540a593b11eb736a"
-SRCREV_machine_qemux86 ?= "77c8d144b066f69e009ce2ee540a593b11eb736a"
-SRCREV_machine_qemux86-64 ?= "77c8d144b066f69e009ce2ee540a593b11eb736a"
-SRCREV_machine_qemumips64 ?= "5468343e50389dba73b5d441289d5094bd0dc9f0"
-SRCREV_machine ?= "77c8d144b066f69e009ce2ee540a593b11eb736a"
-SRCREV_meta ?= "de35f8006d0f932924752ddda94dd24e2da67fbc"
+SRCREV_machine_qemuarm ?= "1e8e1a5927984c545448b4b15974addf670b0f5d"
+SRCREV_machine_qemuarm64 ?= "c42d48cae11e605f70cfc6f64dbc23711bfbf8cf"
+SRCREV_machine_qemumips ?= "0366c14c30f0ca1f9d4a793632ba9cdc86e7225e"
+SRCREV_machine_qemuppc ?= "4570b1179fe4eda809fa2b89a06e6acf95e35fc8"
+SRCREV_machine_qemuriscv64 ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
+SRCREV_machine_qemuriscv32 ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
+SRCREV_machine_qemux86 ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
+SRCREV_machine_qemux86-64 ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
+SRCREV_machine_qemumips64 ?= "f2a78b852f4afb30a5e453a8b1eac3e785cbfc39"
+SRCREV_machine ?= "b0f8d81ad4c501e24f062e080f38fb8a7873b68a"
+SRCREV_meta ?= "940dd7a24ebe6ad709d6912a24660dadf34ece83"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.91"
+LINUX_VERSION ?= "5.10.92"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


