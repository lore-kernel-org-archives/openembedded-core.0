Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF369C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 14:51:30 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.12868.1642776670242435373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 06:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=i9aMJszQ;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642776690; x=1674312690;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LzLAwoG4X6YhG9qwW8Nx0+eSaOqe/woDIwmG26RFEfw=;
  b=i9aMJszQFbZW5L7P/0f59dAw8nCmTs2fWLiSLu7sXj5jcm1U1iHiNdqA
   hlkkSWqLqeLWNrikPYJJYVhnN6Kw2VP2OM2vJ/KDvJJtUZEo0/WW4Qq4X
   py4VVYeiapC1qeYN6FW2FwNdw0w95iEqJtvjbx2KxdoUz1WK2/jWYgNRV
   0Se2ZZ67asbksCF4dGmFCRvZYPLvT6N5vKjye6sWeqSvCrlyQ+U9Z0wDg
   IMgKFl+ssRd22Pez9tw1RDS9DCsj67LgsswyPzIDel2Wkt0iEqKns+S1y
   afm4smMLJhDfJxuY/7rPv7XE+dazPH3+Zx57wRe3WCeH09ddSvnkOLoEG
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245886098"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="245886098"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="623336788"
Received: from gordonyx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.131.118])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:27 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/15] linux-yocto/5.10/cfg: add kcov feature
 fragment
Date: Fri, 21 Jan 2022 22:50:59 +0800
Message-Id: 
 <d9a8cfebd5801ff0baea05899549e6f9ad3d8e41.1642736951.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642736950.git.anuj.mittal@intel.com>
References: <cover.1642736950.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 14:51:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160842

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto:

41721be8a03 cfg/debug: add kcov kernel configs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a11ed0910a9ed231bc3c4a9ee532358014ce535)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 3a346195c9..0a31714524 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "301346d30bcaccedc71da8d5f78bd262063d4ba7"
-SRCREV_meta ?= "38b4f2e3bc974717352e8bc5491664e47542d237"
+SRCREV_meta ?= "fdabd97ceceb2e3e74a132332c875f68b47b755b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 3c70d6c2ea..bad6f10905 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "913d41ebe409dfd03c49fafd1923f8663df2a4ff"
 SRCREV_machine ?= "5575e67330fb6d979ed1cd2e9e64400b4c21b595"
-SRCREV_meta ?= "38b4f2e3bc974717352e8bc5491664e47542d237"
+SRCREV_meta ?= "fdabd97ceceb2e3e74a132332c875f68b47b755b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index fc7071c6fc..20e7f68f8f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
 SRCREV_machine_qemux86-64 ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
 SRCREV_machine_qemumips64 ?= "29cb56446b0b66b7a15d2577773e69c4e813bfd7"
 SRCREV_machine ?= "d59202c85b0f96b7a928ec594021a38e80c35a46"
-SRCREV_meta ?= "38b4f2e3bc974717352e8bc5491664e47542d237"
+SRCREV_meta ?= "fdabd97ceceb2e3e74a132332c875f68b47b755b"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.34.1


