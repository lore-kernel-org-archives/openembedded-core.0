Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC31C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:14:09 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.26624.1646662445881657083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:14:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=dG/3OtDx;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662448; x=1678198448;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vV5ELwHFMx863Xx/MOjXDHlPcPLOVEG+yJd7v+Cqo5c=;
  b=dG/3OtDxH0eWTBf6BO0Q4I8qnbaXx1Xl3E5SPZU3xJx5JUnoDwEcE2JL
   Oe+wkeFE7nzeV2Gd7F4QX9JSL+C+EbiNHDt8KkYxNXpPkwsuo6uZspxYu
   3rmXs30geCcG9ZFp4EhmioGIxaqmjycvE28S8Bu40lujSHAFrCVYvap5V
   HfFFgBGegrCp53oYkjtM55RpiVigncVu1vPpicEqX9Ey4KTy1GF/b5dG8
   RGTUGJcJ7K78BtCPVv520sn7eWPCNR/hJ48TCoO7bM5zykboS5yUoTKnV
   GeBJfwqI19lfjkCTkY6Pb13a2yG+OPKIaC0/1XRGmk69A3CGTHgdgrMNy
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112587"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112587"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:40 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070927"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:39 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 21/25] linux-yocto/5.10: features/zram: remove
 CONFIG_ZRAM_DEF_COMP
Date: Mon,  7 Mar 2022 22:09:57 +0800
Message-Id: 
 <84171921b25803dbbe98946bd0c8e7cdbd65cd33.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:14:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162842

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
index 8a8a7eabe9..5f512016b2 100644
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
index bf7662eed3..7a7a13e031 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "9a8497a8761a22b3086cab63d18698024a69a410"
 SRCREV_machine ?= "317635e1feaecfd8aa29bc94d8d03ba873190414"
-SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
+SRCREV_meta ?= "7a012dfacdc82bce2279c26af29cf40b5fdbeed2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index ecb2d03949..130e3286ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
 SRCREV_machine:qemux86-64 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
 SRCREV_machine:qemumips64 ?= "ae7887fe8d4da06d2d0d0a5071d09155899de26c"
 SRCREV_machine ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
-SRCREV_meta ?= "b53e11ea46f4e78ff4cb48532a11e1dbad7939b1"
+SRCREV_meta ?= "7a012dfacdc82bce2279c26af29cf40b5fdbeed2"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
-- 
2.35.1


