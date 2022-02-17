Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99974C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 14:18:32 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.318.1645107508890252839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 06:18:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=DCpY8R2F;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645107511; x=1676643511;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xWC145vHP/zj3Hpl7pNroz3gEYns8WnlsaX4pb/5iHg=;
  b=DCpY8R2FkIw1A4JQV8jYWQsBbfN6Dgmm7NvRU31gxM9o6mgUgyODJhUC
   DWWD2OEQ+dsNHBKWkwSz8QQfyMCuOi34/LPWdFbFzOzWozTAUnFFzXh2m
   oVSG3ULXkn9XC5Z7Wfq/rFOamJX7Qn/g1VzcWX/9IyXodmFZt/rWwXfVu
   VcNUf8JMz+cdX5raH+YXMgesOBX12zLvda2Hs6Owl2Fx1EVdxUydu2NhR
   gBiHgJw8BgiegEo4oAdomKE7vS0L31o5ken5niGnCt0ZE+ww/OQrv8Zg3
   IGqqBXSc4i6p0GoCE3ncPbj8GWTazIwnIro/ztWZh2OUNCNRqXi/deN4D
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="250617953"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="250617953"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="530249211"
Received: from kkoay3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.130.102])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:30 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/14] glibc: upgrade glibc-2.33 to latest version
Date: Thu, 17 Feb 2022 22:18:11 +0800
Message-Id: 
 <d5bdff460cc8b0f38177f1f38d625eeda729b459.1645106980.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645106980.git.anuj.mittal@intel.com>
References: <cover.1645106980.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 14:18:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161802

From: Pgowda <pgowda.cve@gmail.com>

glibc-2.33 has been upgraded to latest version that includes many CVE and
other bug fixes. Ran the regressions and results are better.

Signed-off-by: pgowda <pgowda.cve@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 63241ee951..e1eefdee49 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.33/master"
 PV = "2.33"
-SRCREV_glibc ?= "55b99e9ed07688019609bd4dcd17d3ebf4572948"
+SRCREV_glibc ?= "3e2a15c666e40e5ee740e5079c56d83469280323"
 SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.35.1


