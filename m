Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EE0C43217
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:21:30 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.8577.1646749288672106420
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=AY524VYs;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646749289; x=1678285289;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=M+4N1l7vwBOyfO8iEhO139CD8Yysp6W98vX/R2j+/pE=;
  b=AY524VYsVm81goco9Zm/DItTPMbAkUyCg5u1DfPLFQ7KjNDLWoV3l8Gu
   vj+Ir4ZBTjkIKfay0FJv9kZnK3LfFbKmMQK5dkt0HUlnhxNrvQOLxn+jz
   M8B2ZAvCDqyidRuffUO6JspoRsJiSGFZogC1UwratlKR9wH35TrFX8jOS
   IHQq1C18cfaMYacyQlW9WLWACV/ZtYNg8r0sXBXfrs3rd+rW4LnT7ztu1
   03L7RIxh680YLvuvMyY8vTFIs4onIAqOcyTKRgs2WB1R2xF38Fp7h3Kav
   4mf84Ia8eJQPm4Ihc1RfARrIjdSZLx0HfiljBtPLiym8q131lX5CPCKtv
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="242130128"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="242130128"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:55 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400";
   d="scan'208";a="513120008"
Received: from sktoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.225.176])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 06:20:53 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/15] linux-yocto/5.10: features/zram: remove
 CONFIG_ZRAM_DEF_COMP
Date: Tue,  8 Mar 2022 22:20:02 +0800
Message-Id: 
 <4c6189ba39823fa2db4706f3208e70ae1f5b4860.1646748870.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646748869.git.anuj.mittal@intel.com>
References: <cover.1646748869.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 14:21:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162918

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    7a012dfacdc features/zram: remove CONFIG_ZRAM_DEF_COMP

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a8fcece853475bede5d442120bc38f17751ed9a1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index edc1a957bb..ca334a67cc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "e5b266bc6b15dc8852649b7d2a31395195dc7b3a"
-SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
+SRCREV_meta ?= "7a012dfacdc82bce2279c26af29cf40b5fdbeed2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 5380dcb029..d3bcd594f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "9a8497a8761a22b3086cab63d18698024a69a410"
 SRCREV_machine ?= "317635e1feaecfd8aa29bc94d8d03ba873190414"
-SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
+SRCREV_meta ?= "7a012dfacdc82bce2279c26af29cf40b5fdbeed2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index d2d1b0bd5a..8b10cfd96a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
 SRCREV_machine_qemux86-64 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
 SRCREV_machine_qemumips64 ?= "ae7887fe8d4da06d2d0d0a5071d09155899de26c"
 SRCREV_machine ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
-SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
+SRCREV_meta ?= "7a012dfacdc82bce2279c26af29cf40b5fdbeed2"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.35.1


