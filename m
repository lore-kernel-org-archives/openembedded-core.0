Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35184C433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 02:20:31 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.1399.1637547629207164788
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 18:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="298122189"
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800";
   d="scan'208";a="298122189"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 18:20:29 -0800
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800";
   d="scan'208";a="739428771"
Received: from kkleong1-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.239.135])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 18:20:28 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/16] linux-yocto/5.10: update to v5.10.78
Date: Mon, 22 Nov 2021 10:20:07 +0800
Message-Id: 
 <0ab49e39142a4a38ece75706ca0196ffda34760f.1637546583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637546583.git.anuj.mittal@intel.com>
References: <cover.1637546583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 02:20:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158539

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    5040520482a5 Linux 5.10.78
    4c7c0243275b ALSA: usb-audio: Add Audient iD14 to mixer map quirk table
    f3eb44f496ef ALSA: usb-audio: Add Schiit Hel device to mixer map quirk table
    68765fc97762 Revert "wcn36xx: Disable bmps when encryption is disabled"
    f84b791d4c3b ARM: 9120/1: Revert "amba: make use of -1 IRQs warn"
    bbc920fb320f Revert "drm/ttm: fix memleak in ttm_transfered_destroy"
    6d67b2a73b8e mm: khugepaged: skip huge page collapse for special files
    5a7957491e31 Revert "usb: core: hcd: Add support for deferring roothub registration"
    50f46bd30949 Revert "xhci: Set HCD flag to defer primary roothub registration"
    d7fc85f61042 media: firewire: firedtv-avc: fix a buffer overflow in avc_ca_pmt()
    b93a70bf2b57 net: ethernet: microchip: lan743x: Fix skb allocation failure
    b9c85a71e1b4 vrf: Revert "Reset skb conntrack connection..."
    0382fdf9ae78 sfc: Fix reading non-legacy supported link modes
    748786564a35 Revert "io_uring: reinforce cancel on flush during exit"
    7b57c38d12ae scsi: core: Put LLD module refcnt after SCSI device is released

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a7d1eed8e3d550ac9bfa301b26095100eeba111)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 3ebb5e979f..93ebccff3d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3a416eeb4d0bdbba2a133744a465f2c9a46e3a96"
-SRCREV_meta ?= "257ed971bc7fd76ccb27f622df1ef6412f6b340d"
+SRCREV_machine ?= "12f6a7187b3c8abab5e139dbfdf7f58f265f4169"
+SRCREV_meta ?= "a0238f7f4f2222d08bb18147bb5e24cc877b0546"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.77"
+LINUX_VERSION ?= "5.10.78"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 169185f685..d3402f3a25 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.77"
+LINUX_VERSION ?= "5.10.78"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "c5c9d2c5c8ce7a84f6aebf02b3ae824a4c5f9d56"
-SRCREV_machine ?= "c3e3199c6359736c373aaecc8f447eaec7cf9432"
-SRCREV_meta ?= "257ed971bc7fd76ccb27f622df1ef6412f6b340d"
+SRCREV_machine_qemuarm ?= "cdec5045c5323846adaf2510e539843d0cfe74ae"
+SRCREV_machine ?= "344c0c38f5b892312b0a1db7f613d2704dd4942f"
+SRCREV_meta ?= "a0238f7f4f2222d08bb18147bb5e24cc877b0546"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index f994cfc2d4..2652d01c26 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "51e48df3dbbc2b03579e95b296bf7b2625cf456b"
-SRCREV_machine_qemuarm64 ?= "c437750233de239844757e4c79bfd9e9c56e1b0d"
-SRCREV_machine_qemumips ?= "f2acb9e5f819ce240b530851f9e8ed45a8f7d878"
-SRCREV_machine_qemuppc ?= "b36a906729ef754c48d730f15a7f079eb4942356"
-SRCREV_machine_qemuriscv64 ?= "789500dfe326ab238562529175d99d33a3db1d0c"
-SRCREV_machine_qemuriscv32 ?= "789500dfe326ab238562529175d99d33a3db1d0c"
-SRCREV_machine_qemux86 ?= "789500dfe326ab238562529175d99d33a3db1d0c"
-SRCREV_machine_qemux86-64 ?= "789500dfe326ab238562529175d99d33a3db1d0c"
-SRCREV_machine_qemumips64 ?= "1b436658828965d7f96ff5e532ff0bb6b1099cff"
-SRCREV_machine ?= "789500dfe326ab238562529175d99d33a3db1d0c"
-SRCREV_meta ?= "257ed971bc7fd76ccb27f622df1ef6412f6b340d"
+SRCREV_machine_qemuarm ?= "f98b917d7826304daeecf11cc52be2562a9304ff"
+SRCREV_machine_qemuarm64 ?= "13ff8a3ae368724e008e3bcd77833611de7962b2"
+SRCREV_machine_qemumips ?= "7b94dec2b0f5b582b97cdb3ac97fe153559869e4"
+SRCREV_machine_qemuppc ?= "652531fb0cc8eb3607109bb8d878253be2d3d534"
+SRCREV_machine_qemuriscv64 ?= "2daa192783edd4974da8e900c0dc93186e57a838"
+SRCREV_machine_qemuriscv32 ?= "2daa192783edd4974da8e900c0dc93186e57a838"
+SRCREV_machine_qemux86 ?= "2daa192783edd4974da8e900c0dc93186e57a838"
+SRCREV_machine_qemux86-64 ?= "2daa192783edd4974da8e900c0dc93186e57a838"
+SRCREV_machine_qemumips64 ?= "4c817df0fd06350e18693551699c33361e16a193"
+SRCREV_machine ?= "2daa192783edd4974da8e900c0dc93186e57a838"
+SRCREV_meta ?= "a0238f7f4f2222d08bb18147bb5e24cc877b0546"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.77"
+LINUX_VERSION ?= "5.10.78"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.33.1


