Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFFFC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 14:18:43 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.318.1645107508890252839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 06:18:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=O2J/tQ+j;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645107522; x=1676643522;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oMLqLqrw/okVcYlbLW0g33nOhzRi/GgeDMmeCw4VNMA=;
  b=O2J/tQ+jUlvATLU80h5nZEXWjS+RIpzEp3pJSFA5zKqFX+efNn+uIi05
   p+dioydTU9WROyXFN9Uj00Y9fgzeN8VCmj2LVZs58HAE5PXNUbUAS7kpQ
   Sbm+njJ5bUPKCpC0NFtQY0dq8VeAPS7xLfh3Qhdahs2Il5Hgi029SUCBy
   Rm9m9H1mwsx7LwOyURQNwgnanmPwXWT9QhkiL8bkzuRfu80lax/XKcNTq
   hdY/mAVr8ZVdFktrHisyVUZm2smx7nN5LRtgb4PCzKKTGoHD18aSXVDHR
   5vqqElBJKMdlFAQ2Vkps1TQgmcrIGZ5ltt4ljeG/XRlNV+wpUuVwKNbGy
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="250618020"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="250618020"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="530249316"
Received: from kkoay3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.130.102])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:40 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/14] linux-yocto/5.4: update to v5.4.173
Date: Thu, 17 Feb 2022 22:18:18 +0800
Message-Id: 
 <66949926839a266a2dc28df3bd0fc5afc50c7c8f.1645106980.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645106980.git.anuj.mittal@intel.com>
References: <cover.1645106980.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161809

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    4aa2e7393e14 Linux 5.4.173
    e245aaefef39 ARM: 9025/1: Kconfig: CPU_BIG_ENDIAN depends on !LD_IS_LLD
    d40f6eeaf513 mtd: fixup CFI on ixp4xx
    1451deb164e1 ALSA: hda/realtek - Fix silent output on Gigabyte X570 Aorus Master after reboot from Windows
    7b98f61b8388 KVM: x86: remove PMU FIXED_CTR3 from msrs_to_save_all
    5c69ba9e80f0 firmware: qemu_fw_cfg: fix kobject leak in probe error path
    1cc36ed56138 firmware: qemu_fw_cfg: fix NULL-pointer deref on duplicate entries
    b543e4141570 firmware: qemu_fw_cfg: fix sysfs information leak
    b25e9ef29d8f rtlwifi: rtl8192cu: Fix WARNING when calling local_irq_restore() with interrupts enabled
    8716657b1b4b media: uvcvideo: fix division by zero at stream start
    70ae85ca124e KVM: s390: Clarify SIGP orders versus STOP/RESTART
    9b45f2007ea3 perf: Protect perf_guest_cbs with RCU
    bd2aed0464ae vfs: fs_context: fix up param length parsing in legacy_parse_param
    c2f067d4ad4a orangefs: Fix the size of a memory allocation in orangefs_bufmap_alloc()
    5d6af67307e8 devtmpfs regression fix: reconfigure on each mount
    c117b116e6b3 kbuild: Add $(KBUILD_HOSTLDFLAGS) to 'has_libelf' test

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index b7a07bb17b..bf57321aa6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e92d76afe6d8592917c0e7b948912c085e661df2"
-SRCREV_meta ?= "98cce1c95fcc9a26965cbc5f038fd71d53c387c8"
+SRCREV_machine ?= "04f6e2728373decb06b2c159cdf599c8813a7ea2"
+SRCREV_meta ?= "9e6e627445612ea0b6cc514bcdb879de3999f175"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.172"
+LINUX_VERSION ?= "5.4.173"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index a75570df93..53f85c8cd4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.172"
+LINUX_VERSION ?= "5.4.173"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "10b4756eee78aa43ff9ed64da700ec6e8d97ff22"
-SRCREV_machine ?= "6ab93fdc53b64e146e4f16363375c1beb37b82e4"
-SRCREV_meta ?= "98cce1c95fcc9a26965cbc5f038fd71d53c387c8"
+SRCREV_machine_qemuarm ?= "dd1d37cf1243bb0194f63992294c386b91b883ee"
+SRCREV_machine ?= "149a477216fedee100a2a7c749d7876a5af18c3d"
+SRCREV_meta ?= "9e6e627445612ea0b6cc514bcdb879de3999f175"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index db80789ba9..3496e42df0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "8de1da3dc354dedef2e435e694eec6d6e72c9822"
-SRCREV_machine_qemuarm64 ?= "eed7c0a64f3a7a91a130bc2e507304dc8b446a31"
-SRCREV_machine_qemumips ?= "996a9660e4fab70db5cecec9c831141cd03c3d36"
-SRCREV_machine_qemuppc ?= "0197cf5754b1bd4eb035c342af9cc27e8c3339ca"
-SRCREV_machine_qemuriscv64 ?= "c6b015510134942076c0e111e56357656acf3dd5"
-SRCREV_machine_qemux86 ?= "c6b015510134942076c0e111e56357656acf3dd5"
-SRCREV_machine_qemux86-64 ?= "c6b015510134942076c0e111e56357656acf3dd5"
-SRCREV_machine_qemumips64 ?= "fe2769a7c268ed224ec70fd2aaab850e4eef70dc"
-SRCREV_machine ?= "c6b015510134942076c0e111e56357656acf3dd5"
-SRCREV_meta ?= "98cce1c95fcc9a26965cbc5f038fd71d53c387c8"
+SRCREV_machine_qemuarm ?= "7d8ca1d1b0891c023c74d79ea39e045d1a794077"
+SRCREV_machine_qemuarm64 ?= "79e8b8d059d36f1c2e7e20e38f883ea8c7381ffa"
+SRCREV_machine_qemumips ?= "bed90b69d8120029e8b362166c11437a257b9fdc"
+SRCREV_machine_qemuppc ?= "e886407de7b10259c99c61f9538af43181f2fec3"
+SRCREV_machine_qemuriscv64 ?= "9d1d023f9d659fd8678f020f3e98d735b27896fb"
+SRCREV_machine_qemux86 ?= "9d1d023f9d659fd8678f020f3e98d735b27896fb"
+SRCREV_machine_qemux86-64 ?= "9d1d023f9d659fd8678f020f3e98d735b27896fb"
+SRCREV_machine_qemumips64 ?= "20b16bf3c848f34be5b747f27c4cfc1237bcefbd"
+SRCREV_machine ?= "9d1d023f9d659fd8678f020f3e98d735b27896fb"
+SRCREV_meta ?= "9e6e627445612ea0b6cc514bcdb879de3999f175"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.172"
+LINUX_VERSION ?= "5.4.173"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.35.1


