Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10841C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:14:00 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.26508.1646662438266182811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Xq/YgpDT;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662438; x=1678198438;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Il0Tb0312nwYvT2OgwwnQau2vATv8ht0vK2nCOkV1QI=;
  b=Xq/YgpDTJka1KrbwJ4J3CROUV+sUdSO3vvsZzqcERJwWdEqq/TL1eAcH
   tmm4tBt3qCiSWrXh3A2Twk2R8KKmHLw42tm7odZLCM/4MbrvNXSKpihlG
   S5ezLCm7fPszQCuiydeh26JfE5YCPB1U/9SsqgD/3Qe8+rKTJTeAWZDTC
   tBpqEA3DjOVqASYnbeLbXuMCMnbQ558B15EJvkRrUv98Y0Y8eDO8cAxv0
   iskgWuenkGVUgZjBj6Ar0bFYs1vOYS9zjehpw7q6PyxCDVcLJMdouWrKS
   YgRdLHTRHbIyJF1rPWdPuDzc0bvp1rIditwc4uvWRfn2c/onQD+fmL03j
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112514"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112514"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:24 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070816"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:22 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 10/25] coreutils: remove obsolete ignored CVE list
Date: Mon,  7 Mar 2022 22:09:46 +0800
Message-Id: 
 <14d88544c9b638cd43749c8de344c83d91ed1965.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:14:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162831

From: Ross Burton <ross@burtonini.com>

Three CVEs were meant to be ignored via CVE_WHITELIST, but that wasn't
the correct variable name.

The CPEs for those CVEs mean that they don't get picked up in our report,
so just remove the assignment.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dea00faf30ec7c19b6b5ed4651b430ba3faf69ff)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/coreutils/coreutils_8.32.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.32.bb b/meta/recipes-core/coreutils/coreutils_8.32.bb
index 01acf9a874..d819bbaae6 100644
--- a/meta/recipes-core/coreutils/coreutils_8.32.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
@@ -208,6 +208,3 @@ do_install_ptest () {
 }
 
 FILES:${PN}-ptest += "${bindir}/getlimits"
-
-# These are specific to Opensuse
-CVE_WHITELIST += "CVE-2013-0221 CVE-2013-0222 CVE-2013-0223"
-- 
2.35.1


