Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBD1C43219
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:47:17 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.505.1635871635257964071
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218509718"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="218509718"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:35 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575160"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:34 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 09/24] linux-yocto/5.10: update to v5.10.74
Date: Wed,  3 Nov 2021 00:43:57 +0800
Message-Id: 
 <7615702d29bd1578416e3a965a794fa2aad3f88f.1635871270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635871270.git.anuj.mittal@intel.com>
References: <cover.1635871270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:47:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157795

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    77434fe5a077 Linux 5.10.74
    42b49f012b6a hwmon: (pmbus/ibm-cffps) max_power_out swap changes
    bb893f075431 sched: Always inline is_percpu_thread()
    bdae2a083436 perf/core: fix userpage->time_enabled of inactive events
    57c7ca3d5592 scsi: virtio_scsi: Fix spelling mistake "Unsupport" -> "Unsupported"
    d993d1e1c411 scsi: ses: Fix unsigned comparison with less than zero
    621ddffb70db drm/amdgpu: fix gart.bo pin_count leak
    a5ba615fbeb3 net: sun: SUNVNET_COMMON should depend on INET
    db868b45324d vboxfs: fix broken legacy mount signature checking
    42c871d38e3d mac80211: check return value of rhashtable_init
    bda06aff03a1 net: prevent user from passing illegal stab size
    3d68c7b0ab5b hwmon: (ltc2947) Properly handle errors when looking for the external clock
    194e8a4f0acd m68k: Handle arrivals of multiple signals correctly
    977aee58142a mac80211: Drop frames from invalid MAC address in ad-hoc mode
    9ec9a975ea37 netfilter: nf_nat_masquerade: defer conntrack walk to work queue
    5182d6db80bb netfilter: nf_nat_masquerade: make async masq_inet6_event handling generic
    bcb647c1e15d ASoC: SOF: loader: release_firmware() on load failure to avoid batching
    f6952b1e22c2 HID: wacom: Add new Intuos BT (CTL-4100WL/CTL-6100WL) device IDs
    ddc4ba737bcb netfilter: ip6_tables: zero-initialize fragment offset
    ddf026d6ae9a HID: apple: Fix logical maximum and usage maximum of Magic Keyboard JIS
    0bcfa99e8fae ASoC: Intel: sof_sdw: tag SoundWire BEs as non-atomic
    14cbfeeee41b ext4: correct the error path of ext4_write_inline_data_end()
    d7a15e1e4fd7 ext4: check and update i_disksize properly

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8e863e9c57fc26e4158b6c10b04931976c54efb8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 415b3aae1b..6df672273a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "752916079819b4b927698e9b78fad4ebd1da9552"
-SRCREV_meta ?= "661aeb3be3206fc7fccdae35b221aa3750c615a7"
+SRCREV_machine ?= "8048444fc7e44c6fc04a5e0b35d6117fe51c17fc"
+SRCREV_meta ?= "7676dde0569ceba548579dafcf8235b4eececbc8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.73"
+LINUX_VERSION ?= "5.10.74"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 58026e50bb..2e1e5ba97d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.73"
+LINUX_VERSION ?= "5.10.74"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "9a44d3d70a39e75019eb41ebfdf9160ef1526b39"
-SRCREV_machine ?= "a9f78c623e84c13ac7ea5543a2acf61c2c9305d4"
-SRCREV_meta ?= "661aeb3be3206fc7fccdae35b221aa3750c615a7"
+SRCREV_machine:qemuarm ?= "e6536f1c95e7201db0ebb64495fe4efcd939f354"
+SRCREV_machine ?= "92dd39e841df0bf33d81965843543c30597688be"
+SRCREV_meta ?= "7676dde0569ceba548579dafcf8235b4eececbc8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 9079a1d063..243bb3a717 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8ccb3082c292a47758878414fd8ee338ca504842"
-SRCREV_machine:qemuarm64 ?= "c297d04cab775cdc684197fff6b1d6e012508898"
-SRCREV_machine:qemumips ?= "b184a88315097655916305d07acb55ee5dba55c2"
-SRCREV_machine:qemuppc ?= "a335585297e61e06eec5aef16858f033d4694027"
-SRCREV_machine:qemuriscv64 ?= "41bb5a43d466af4cb71fea2fcc2cbb18f450f03e"
-SRCREV_machine:qemuriscv32 ?= "41bb5a43d466af4cb71fea2fcc2cbb18f450f03e"
-SRCREV_machine:qemux86 ?= "41bb5a43d466af4cb71fea2fcc2cbb18f450f03e"
-SRCREV_machine:qemux86-64 ?= "41bb5a43d466af4cb71fea2fcc2cbb18f450f03e"
-SRCREV_machine:qemumips64 ?= "edefdb4bbcfe38521b1ac16eb5a6dcda1564e853"
-SRCREV_machine ?= "41bb5a43d466af4cb71fea2fcc2cbb18f450f03e"
-SRCREV_meta ?= "661aeb3be3206fc7fccdae35b221aa3750c615a7"
+SRCREV_machine:qemuarm ?= "65c6899db7f84ee81bf9fe7b73b5f5d181636351"
+SRCREV_machine:qemuarm64 ?= "6d43c23b8d3aa1161644880d85b83491f8f39729"
+SRCREV_machine:qemumips ?= "4b9a9768850a12d2e806b87e0ceeab5083495035"
+SRCREV_machine:qemuppc ?= "4db24c929502797874a3cc30a7d04022526b6e8a"
+SRCREV_machine:qemuriscv64 ?= "9e84a42af61ff9c6feb89ab8d61ee5f25fb35c72"
+SRCREV_machine:qemuriscv32 ?= "9e84a42af61ff9c6feb89ab8d61ee5f25fb35c72"
+SRCREV_machine:qemux86 ?= "9e84a42af61ff9c6feb89ab8d61ee5f25fb35c72"
+SRCREV_machine:qemux86-64 ?= "9e84a42af61ff9c6feb89ab8d61ee5f25fb35c72"
+SRCREV_machine:qemumips64 ?= "66e7684e39bbe9b36b8673792a07c51a394c5766"
+SRCREV_machine ?= "9e84a42af61ff9c6feb89ab8d61ee5f25fb35c72"
+SRCREV_meta ?= "7676dde0569ceba548579dafcf8235b4eececbc8"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.73"
+LINUX_VERSION ?= "5.10.74"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1


