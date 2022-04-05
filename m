Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C57C352AA
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7190.1649169707422558639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=fCPwtuqc;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649169722; x=1680705722;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=r5Enqy+hbWCFuOnwfWjAhRyLlVFRLdYIkJOHvCpvT3I=;
  b=fCPwtuqc5Lo4QsSFloqZrLDS7DC20a/ZStGtakm8PYZk8vAn0+wOw2Ey
   cJzw3Frlw28jOHMbDJWOBZ9BZwgZqE9J6FX1ic0nN0ldglb0Ikn95DQfB
   eIaw9a6M2kTHVkAZiwR5zT30UfCcsQeaC9hWSg6GvR/j6fg1xhxLHnfmC
   Bzxi9wWWZlRWvCQInMbX6lrBMOEMWFiNUxxKczwry6dgkU9EnJi7tFLO5
   tuBOBOcsK5zxWydksx2bsrLa++NqUTIFh3bT2FH6h76jHXJXeTTsPmFIa
   mOrCrMTjWTkflCh/MvAvJnqpZGAuGO1bNOS2b3uwM9ybtUOeFCwB4rOJl
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258348718"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="258348718"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:02 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="696953587"
Received: from ntabdull-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.226.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:01 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 10/22] linux-yocto/5.10: cfg/debug: add configs for
 kcsan
Date: Tue,  5 Apr 2022 22:41:29 +0800
Message-Id: 
 <3de68538c5d83108465090b82cb80651dad3a8b8.1649169646.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649169646.git.anuj.mittal@intel.com>
References: <cover.1649169646.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164028

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    b56db30a7c5 cfg/debug: add scc for syzkaller fuzzing
    c4494ad7f23 features/tun: add configs for Universal TUN/TAP device driver support
    148948c3829 features/bluetooth: add configs for Bluetooth Virtual HCI device driver
    824a7ba4dda features/usb: add configs for USB raw gadget
    0bd038864a5 features/usb: add configs for dummy HCD
    e8c765f559f features/ieee802154: add configs for mac802154 hwsim
    99aea8bc07b features/mac80211: add configs for mac80211 hwsim
    c7bf42227e3 cfg/debug: add configs for fault injection debugfs
    ae48b977f61 cfg/debug: add configs for kcsan

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 88a761c98d3a4dbf5a8b2b623248b53077717662)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 5852730422..88fb3b4113 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "e0d87d9831a6e0df20a370adc9aba0d032d91661"
-SRCREV_meta ?= "b814c7ebf2a92fc361bcbeaf6efdd40b8cd0816a"
+SRCREV_meta ?= "b56db30a7c5a0d86ccc853ee68be925086318f88"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 48e5a4f871..f1c2bc33e4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "38f8b1b5b87959e6cb9367151e233d27befe015d"
 SRCREV_machine ?= "cc70f051e56005acda2e6ea994cadfb2538e66f6"
-SRCREV_meta ?= "b814c7ebf2a92fc361bcbeaf6efdd40b8cd0816a"
+SRCREV_meta ?= "b56db30a7c5a0d86ccc853ee68be925086318f88"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 0a80790636..87a7d5e3ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
 SRCREV_machine:qemux86-64 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
 SRCREV_machine:qemumips64 ?= "a1b43f69bce61143dd4d6d637f619eadd3fabb6e"
 SRCREV_machine ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
-SRCREV_meta ?= "b814c7ebf2a92fc361bcbeaf6efdd40b8cd0816a"
+SRCREV_meta ?= "b56db30a7c5a0d86ccc853ee68be925086318f88"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.35.1


