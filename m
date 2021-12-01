Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2E3C433FE
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 07:16:26 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.88428.1638342984806416470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 23:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="236344584"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="236344584"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:16:21 -0800
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="459918774"
Received: from mwong12-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.129.81])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:16:20 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/14] linux-yocto/5.4: update to v5.4.154
Date: Wed,  1 Dec 2021 15:16:01 +0800
Message-Id: 
 <72426e360b09ff873265f6162f39ce9b74cfbb1b.1638342222.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1638342222.git.anuj.mittal@intel.com>
References: <cover.1638342222.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 07:16:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159004

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    ce061ef43f1d Linux 5.4.154
    291a48871e51 sched: Always inline is_percpu_thread()
    3e105ecc4ab7 scsi: virtio_scsi: Fix spelling mistake "Unsupport" -> "Unsupported"
    1ff5ee9d3926 scsi: ses: Fix unsigned comparison with less than zero
    83d857d6b096 drm/amdgpu: fix gart.bo pin_count leak
    1843ae8c4b2b net: sun: SUNVNET_COMMON should depend on INET
    6d1d7acb1067 mac80211: check return value of rhashtable_init
    2aaf3fd5e109 net: prevent user from passing illegal stab size
    1e66a472b51b m68k: Handle arrivals of multiple signals correctly
    be191c8e68fe mac80211: Drop frames from invalid MAC address in ad-hoc mode
    fffad5988f28 netfilter: nf_nat_masquerade: defer conntrack walk to work queue
    b3cb06303419 netfilter: nf_nat_masquerade: make async masq_inet6_event handling generic
    a9d8aa2d3ca8 HID: wacom: Add new Intuos BT (CTL-4100WL/CTL-6100WL) device IDs
    8c6680025b49 netfilter: ip6_tables: zero-initialize fragment offset
    744b908a7f3f HID: apple: Fix logical maximum and usage maximum of Magic Keyboard JIS
    b6bccc978ec8 ext4: correct the error path of ext4_write_inline_data_end()
    de4a28b718bb net: phy: bcm7xxx: Fixed indirect MMD operations

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index e560c408cc..a6a13b6318 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "88b78bac3bf83e6b3ef08d77f895bba5128cc1cd"
-SRCREV_meta ?= "9e3ab4e615b651c1b63d4f0cce71da79a3e89763"
+SRCREV_machine ?= "1f04ded6552fb7ceb6b01768d1a11a828c67c212"
+SRCREV_meta ?= "128808367b0f77f4aea86130bf60e441952946e1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.153"
+LINUX_VERSION ?= "5.4.154"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index e6e0ee73b2..ca73895d7f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.153"
+LINUX_VERSION ?= "5.4.154"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "fed16a9b9cb56ce639eeddeedd756ad5207fa89e"
-SRCREV_machine ?= "942b0cc9a1ff13a66016167d4437f7694e96d04e"
-SRCREV_meta ?= "9e3ab4e615b651c1b63d4f0cce71da79a3e89763"
+SRCREV_machine_qemuarm ?= "03c343c7f0392cc71eedc9ba0f05b0ebe02d45eb"
+SRCREV_machine ?= "4ef13608e3bc691718485e28fc6b78fa58c50d58"
+SRCREV_meta ?= "128808367b0f77f4aea86130bf60e441952946e1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 4418a85ba4..1a26a3e62f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "7a9ca83b483c096e6bd5e1b99cca7fe2fb79fd1a"
-SRCREV_machine_qemuarm64 ?= "d2ea3664c5872b3046a2aa970035de51e359922f"
-SRCREV_machine_qemumips ?= "118685bb5211a7740de6bd419c68eb34728f8770"
-SRCREV_machine_qemuppc ?= "7e8785640416d3c6382f91a3f88e0eca14f0a8b5"
-SRCREV_machine_qemuriscv64 ?= "d54d61f9e363806a987c9ab01df0e66a31d4ead5"
-SRCREV_machine_qemux86 ?= "d54d61f9e363806a987c9ab01df0e66a31d4ead5"
-SRCREV_machine_qemux86-64 ?= "d54d61f9e363806a987c9ab01df0e66a31d4ead5"
-SRCREV_machine_qemumips64 ?= "bd5e23a14522aa81e0f0ee37f976edd108669eb5"
-SRCREV_machine ?= "d54d61f9e363806a987c9ab01df0e66a31d4ead5"
-SRCREV_meta ?= "9e3ab4e615b651c1b63d4f0cce71da79a3e89763"
+SRCREV_machine_qemuarm ?= "9cc72430854edf4b980ece62e234629168e69b07"
+SRCREV_machine_qemuarm64 ?= "eb73aaed8bd13cffd05d699a6745408965708d7b"
+SRCREV_machine_qemumips ?= "6d7d1235cb7e9f9cb1071e630ea79a88a90f86fd"
+SRCREV_machine_qemuppc ?= "c22f5f06e64f63837c677cf09158131b9531c2d4"
+SRCREV_machine_qemuriscv64 ?= "83c1e7472a1783d745804247fcdc32b2cf6e761b"
+SRCREV_machine_qemux86 ?= "83c1e7472a1783d745804247fcdc32b2cf6e761b"
+SRCREV_machine_qemux86-64 ?= "83c1e7472a1783d745804247fcdc32b2cf6e761b"
+SRCREV_machine_qemumips64 ?= "4cf95264615ab852cdadd478c37554ab7fd1ea14"
+SRCREV_machine ?= "83c1e7472a1783d745804247fcdc32b2cf6e761b"
+SRCREV_meta ?= "128808367b0f77f4aea86130bf60e441952946e1"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.153"
+LINUX_VERSION ?= "5.4.154"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.33.1


