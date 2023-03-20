Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5052C7618D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 09:52:02 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.9972.1679305913936281159
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 02:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=FqaqKgPP;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679305913; x=1710841913;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=CacooTp7oOB/+NU0Faat8z43/I9dFtuYf9lXUBq5z/A=;
  b=FqaqKgPPrEkGyTERTJp3FBOiHDpSJWFHvRum7AATTuvCiXun4zkp/Ib+
   DsfO1tbGFCca12f4E1i16caSNyeqhqN5yFQhXOKCaKPB5DCWu/WiKxfb/
   +hxV3TmREMzrtiYCl50xO9H8ZIPB6Db4vKcYvQvZYHrXfldSpKvoNUtzm
   4KFBETxRPWCSlFe74m0zUdje1KjzJ8gSAh/Ii2E37uTXjslrErpakcAIh
   Nwb9h+gFtSIPGFc7kz9ExWiEI+Pjf8+b+ExcwHWLDy+P8sVaOQZp8IQeO
   892HD9+JIYcEURhr/Q6v5numvVN4vEMCaePoZEvzc2AUE4rcoJWIrz3x2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="337336632"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="337336632"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 02:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="804847198"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="804847198"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga004.jf.intel.com with ESMTP; 20 Mar 2023 02:51:30 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][patch 2/3] ghostscript: add CVE tag for check-stack-limits-after-function-evalution.patch
Date: Mon, 20 Mar 2023 17:51:18 +0800
Message-Id: <20230320095119.2655965-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230320095119.2655965-1-chee.yang.lee@intel.com>
References: <20230320095119.2655965-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 09:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178806

From: Chee Yang Lee <chee.yang.lee@intel.com>

This patch fix CVE-2021-45944.
https://nvd.nist.gov/vuln/detail/CVE-2021-45944

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../check-stack-limits-after-function-evalution.patch           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch b/meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch
index 722bab4ddb..77eec7d158 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch
@@ -14,7 +14,7 @@ stack than are available.
 
 To cope, add in stack limit checking to throw an appropriate error when this
 happens.
-
+CVE: CVE-2021-45944
 Upstream-Status: Backported [https://git.ghostscript.com/?p=ghostpdl.git;a=patch;h=7861fcad13c497728189feafb41cd57b5b50ea25]
 Signed-off-by: Minjae Kim <flowergom@gmail.com>
 ---
-- 
2.37.3


