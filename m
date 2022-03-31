Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065F7C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:47:57 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.7229.1648734469557928964
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 06:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=D1IY8s5D;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648734476; x=1680270476;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=AO2MD90OuZFJAF8Dz2W472DfmMuEIH4adcFQTPFPaaA=;
  b=D1IY8s5DgKVkaitB80/68SkoKtE7c90KIoefBjWzWZS96cmrNHAuitdZ
   ZCBftZhPZFmtGYo+1jeL8GPAnIv+kgOb45LZ/DkxqSDolLw/f9+RFHP+/
   c/NgYHJ6v6ISADTvWjbg+gIKJB1q8xWlV20+qEfWBsMlHBdbO5Kkxe18e
   R3A1s/JPpyB/OBQyQ25UHJH2Oe6O5cSUW7+mMwMpBpGRtRoIPXuuEyxLn
   OCtWPbqGNeBFK2TmqywMoxytyuFcRZJU7nflbGctoK2bWI7whjJT9DZ+E
   nYbvD/3Dcx0YYkh79PVbM1Ylp9cThTnsdeEte++itQhB7cvX1k6EFLcR1
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259551827"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="259551827"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="520542228"
Received: from scho7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.39])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:47 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 12/20] linux-yocto/5.10: split vtpm for more
 granular inclusion
Date: Thu, 31 Mar 2022 21:47:17 +0800
Message-Id: 
 <c8bfdc0ac6a5bb26adb59949be5cd0f00a67cb79.1648734169.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648734169.git.anuj.mittal@intel.com>
References: <cover.1648734169.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 13:47:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163826

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    6ca1d510a03 features/tpm: split into tpm-1.2, tpm-2.0, tpm-2.0-crb and vtpm feature

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b61be908468b1057a9d2baf40c1ebfbbd74732b8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 4d75cf1b21..a35e80940e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "e0d87d9831a6e0df20a370adc9aba0d032d91661"
-SRCREV_meta ?= "792f1272dd0d68d5dba0ff35949b2094f818227e"
+SRCREV_meta ?= "b814c7ebf2a92fc361bcbeaf6efdd40b8cd0816a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 8227d5d8cc..45cfd90e0a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "38f8b1b5b87959e6cb9367151e233d27befe015d"
 SRCREV_machine ?= "cc70f051e56005acda2e6ea994cadfb2538e66f6"
-SRCREV_meta ?= "792f1272dd0d68d5dba0ff35949b2094f818227e"
+SRCREV_meta ?= "b814c7ebf2a92fc361bcbeaf6efdd40b8cd0816a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 5a4939cf36..fdc985af13 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
 SRCREV_machine_qemux86-64 ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
 SRCREV_machine_qemumips64 ?= "a1b43f69bce61143dd4d6d637f619eadd3fabb6e"
 SRCREV_machine ?= "e6c8ebd210a2ab7817618bb4c518d69d35d16cf7"
-SRCREV_meta ?= "792f1272dd0d68d5dba0ff35949b2094f818227e"
+SRCREV_meta ?= "b814c7ebf2a92fc361bcbeaf6efdd40b8cd0816a"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.35.1


