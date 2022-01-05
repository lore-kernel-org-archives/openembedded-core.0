Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9AAC433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 15:19:16 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.1720.1641395941760702382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 07:19:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=YZ6i5PgB;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641395955; x=1672931955;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fL8ojJ96eT1i+RIYGzpai1/JxQjf5vx7S/N7t8rCtQw=;
  b=YZ6i5PgBR1Lv/0TbbPXf98HQ/HhEo3SE5HxrOituMsty1dlVY2kk17JT
   opbPUvcjYm9o5tBqXp3mlgEcYM6qmmo6JOPnKH+YUWvj0MePRV96HGw3h
   5dLRQl/QAiCaAomV5IM60NO/3itvOVmnlpuIJlTKGq892dlFOf0l0wPkx
   C8ESqRE8nd8mIg9j4i80XWPR5G8G/xNtaISq33bO+U8/ouD/BZs++V7Sl
   71m4FI/EQSqMOheaR+Yp4d1r2bhuoRufNuoLwPic7ULxFlBNpKPYQuA/Q
   Vs1vLd4gHErt81MbzynQuneWLzyJHh/takeX+WhjyPhzUubHDuxTLuax0
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="266742799"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="266742799"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="668128630"
Received: from hanwenlx-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.129.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:14 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 10/24] linux-yocto/5.4: update to v5.4.159
Date: Wed,  5 Jan 2022 23:18:30 +0800
Message-Id: 
 <89d59ed2163e77df2100aae4bc6b06174f0155e5.1641395036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641395036.git.anuj.mittal@intel.com>
References: <cover.1641395036.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 15:19:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160195

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    5915b0ea6746 Linux 5.4.159
    abc49cc45d0a rsi: fix control-message timeout
    64e6632ab4c1 media: staging/intel-ipu3: css: Fix wrong size comparison imgu_css_fw_init
    6c382b63658e staging: rtl8192u: fix control-message timeouts
    f66258cb60e4 staging: r8712u: fix control-message timeout
    88a252ff782c comedi: vmk80xx: fix bulk and interrupt message timeouts
    1ae4715121a5 comedi: vmk80xx: fix bulk-buffer overflow
    199acd8c110e comedi: vmk80xx: fix transfer-buffer overflows
    b0156b7c9649 comedi: ni_usb6501: fix NULL-deref in command paths
    3efb7af8ac43 comedi: dt9812: fix DMA buffers on stack
    6e80e9314f8b isofs: Fix out of bound access for corrupted isofs image
    adc56dbfc4aa printk/console: Allow to disable console output by using console="" or console=null
    589ac131b3ab binder: don't detect sender/target during buffer cleanup
    b60e89b63eb9 usb-storage: Add compatibility quirk flags for iODD 2531/2541
    5c3eba290479 usb: musb: Balance list entry in musb_gadget_queue
    161571745de1 usb: gadget: Mark USB_FSL_QE broken on 64-bit
    d6013265a779 usb: ehci: handshake CMD_RUN instead of STS_HALT
    6d000e1c1625 Revert "x86/kvm: fix vcpu-id indexed array sizes"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 9c37c738a645b472175b93431deb47b47a1442e7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 6646315c0d..6db06b6281 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1a91fd560dcf8fa9e49fc2f17cb37483201a2b89"
-SRCREV_meta ?= "db8bfc3a107db2a059fb8efa442f7daa17e8d55c"
+SRCREV_machine ?= "e0b42b387dce06a55169f213efd8796912778abc"
+SRCREV_meta ?= "8feda7148db44cfaa3bcce84b7fda6dcedbfd443"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.158"
+LINUX_VERSION ?= "5.4.159"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 836ea62d8f..f217718c7b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.158"
+LINUX_VERSION ?= "5.4.159"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "9b7cd001c33ea463bbb23fda6a79900ffc88c484"
-SRCREV_machine ?= "80849cd7ef3a77895f8651cec85648578bef9135"
-SRCREV_meta ?= "db8bfc3a107db2a059fb8efa442f7daa17e8d55c"
+SRCREV_machine_qemuarm ?= "7062d2dd2f5e5e7a07616accce62ddc5abb7b570"
+SRCREV_machine ?= "2494d7c8a13b2ce2a41c7bbc8276b5f4f6e61ac1"
+SRCREV_meta ?= "8feda7148db44cfaa3bcce84b7fda6dcedbfd443"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 41d1e593aa..85f5eb2549 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "414c50525aea1ec953cca6d050d5c23db04de269"
-SRCREV_machine_qemuarm64 ?= "ba5e3380aa8a3789907c031beac2ce81d1eb5d50"
-SRCREV_machine_qemumips ?= "177841cfef0bd71b7b4f0e2e8e2ea3100ee4ea7a"
-SRCREV_machine_qemuppc ?= "c3b4b69caef59344d4a59a2327f9f0130db9ccbe"
-SRCREV_machine_qemuriscv64 ?= "76404f1ae59698b6a446dba29c885ca78c69c330"
-SRCREV_machine_qemux86 ?= "76404f1ae59698b6a446dba29c885ca78c69c330"
-SRCREV_machine_qemux86-64 ?= "76404f1ae59698b6a446dba29c885ca78c69c330"
-SRCREV_machine_qemumips64 ?= "75a3c9aeedd5a8070079d96d0301a303ca3351a8"
-SRCREV_machine ?= "76404f1ae59698b6a446dba29c885ca78c69c330"
-SRCREV_meta ?= "db8bfc3a107db2a059fb8efa442f7daa17e8d55c"
+SRCREV_machine_qemuarm ?= "82eedda0c6efa661eccd57dc542c50bef054cb6f"
+SRCREV_machine_qemuarm64 ?= "f0a7a9cbc8f42271f953e6a05b63a797620c8331"
+SRCREV_machine_qemumips ?= "ca5eb4fc25d66165f42348c64c568193fc6407b6"
+SRCREV_machine_qemuppc ?= "11fb8e44b3ffdc3bd7c8703f85f622265c815e69"
+SRCREV_machine_qemuriscv64 ?= "74c0ef6fbb42f521a7ce02cf62bf9c54c57034e1"
+SRCREV_machine_qemux86 ?= "74c0ef6fbb42f521a7ce02cf62bf9c54c57034e1"
+SRCREV_machine_qemux86-64 ?= "74c0ef6fbb42f521a7ce02cf62bf9c54c57034e1"
+SRCREV_machine_qemumips64 ?= "02faa48ca76a54e5da6e256b0621c09c7cf03051"
+SRCREV_machine ?= "74c0ef6fbb42f521a7ce02cf62bf9c54c57034e1"
+SRCREV_meta ?= "8feda7148db44cfaa3bcce84b7fda6dcedbfd443"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.158"
+LINUX_VERSION ?= "5.4.159"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.33.1


