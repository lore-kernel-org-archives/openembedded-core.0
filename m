Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8C7C4332F
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:48:00 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.7266.1648734472624914593
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 06:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=M/bqO3Vq;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648734476; x=1680270476;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=rJKBmO8owyCL4WNEVOvFEHOoezClYkJWu8MTn3VF/mw=;
  b=M/bqO3VqePmNGNCufB3oQNC3aveJZX7E9AtiSE3O0Uq4ZveaomvLRzrw
   FMbh9KRwhFWwcYeBrEu3dBJlvBZIr6c7zCivK+/bVyciQaYWdK/T+ig4l
   RYkuv3MO/AnNCl9fzQzNL8CgYTOpECRrqz6AmearcpLjbLsEitu/NKQcn
   9m/2Lr1+FzInyG2/MmEVgDAC6eMw1kmf+8IoogDs+s7YbC7Gs3gv0vBjJ
   b5ju0zQkJ7rnX5Op/4lgiI1rrtN5YeMf9m9E+gFTcv7aoxa1YQ/dPEw0n
   UDHF7QUlkO2txjSwTx7x0Q+D4g5vBs7V6BZEZlmuUlPZRO1JXAgXGtzEs
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259551834"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="259551834"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:50 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="520542256"
Received: from scho7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.39])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:49 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/20] linux-yocto/5.10: cfg/debug: add configs for
 kcsan
Date: Thu, 31 Mar 2022 21:47:18 +0800
Message-Id: 
 <547e7837d0938f417f8264c716c6d6449c43514a.1648734169.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648734169.git.anuj.mittal@intel.com>
References: <cover.1648734169.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 13:48:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163828

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
index a35e80940e..804773b0ec 100644
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
index 45cfd90e0a..3b1741322d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "38f8b1b5b87959e6cb9367151e233d27befe015d"
 SRCREV_machine ?= "cc70f051e56005acda2e6ea994cadfb2538e66f6"
-SRCREV_meta ?= "b814c7ebf2a92fc361bcbeaf6efdd40b8cd0816a"
+SRCREV_meta ?= "b56db30a7c5a0d86ccc853ee68be925086318f88"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index fdc985af13..2b30a92b96 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
 SRCREV_machine_qemux86-64 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
 SRCREV_machine_qemumips64 ?= "a1b43f69bce61143dd4d6d637f619eadd3fabb6e"
 SRCREV_machine ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
-SRCREV_meta ?= "b814c7ebf2a92fc361bcbeaf6efdd40b8cd0816a"
+SRCREV_meta ?= "b56db30a7c5a0d86ccc853ee68be925086318f88"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.35.1


