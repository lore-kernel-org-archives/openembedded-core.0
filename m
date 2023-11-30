Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D888C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 12:47:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by mx.groups.io with SMTP id smtpd.web10.71282.1701348461299727853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 04:47:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=lEcGtTEs;
 spf=pass (domain: intel.com, ip: 192.198.163.10, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701348461; x=1732884461;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2X7ujrw2z1ViuibXXMonSi5qhmcqwRI3qPMdgkwHZ9k=;
  b=lEcGtTEsKCJJkEPS2QLKho1AfRpwadS6H36+etOAmH9yFo2Cr0ho/vyu
   rYvvEsnBfKk+0U4rk5GD6e9iKq7ArUGuWPoUdxcE/iTB2T6Hgm4WWkuKE
   zYszcFMVsRAB9kZCGc2TMsf8PeXkuSX+gcLjf2skAiDpCZr2+/MG1BKL6
   XI9wdVwPRnnaC1r5iq5Z+Jo+gEIMXo1QeRy5rJ24YsMUCcmmduklIsDZr
   IrqzuRvgZXJED4ziWF24lruW/T9m7htxBqo/o7w4kIkJKeKn8z0+1Qjte
   yGAd7k4gH7bQUFyXTmuhXn6TjHiQtT24mwfx0Vl/JjKbGDkPzzwW0Ht8w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="312352"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="312352"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 04:47:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="773054913"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="773054913"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga007.fm.intel.com with ESMTP; 30 Nov 2023 04:47:39 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 1/2] python3-urllib3: update to v1.26.18
Date: Thu, 30 Nov 2023 20:28:00 +0800
Message-Id: <20231130122801.2596033-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 12:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191506

From: Tan Wen Yan <wen.yan.tan@intel.com>

https://github.com/urllib3/urllib3/releases/tag/1.26.18

Major changes in python3-urllib3 1.26.18:
- Made body stripped from HTTP requests changing the request method to GET after HTTP 303 "See Other" redirect responses. (CVE-2023-45803)

( cherry picked from commit 74da05b63634c248910594456dae286947f33da5 )

Signed-off-by: Tan Wen Yan <wen.yan.tan@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../{python3-urllib3_1.26.17.bb => python3-urllib3_1.26.18.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.17.bb => python3-urllib3_1.26.18.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.17.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.18.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.17.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.18.bb
index 57b166870aa..d384b5eb2f7 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.17.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "24d6a242c28d29af46c3fae832c36db3bbebcc533dd1bb549172cd739c82df21"
+SRC_URI[sha256sum] = "f8ecc1bba5667413457c529ab955bf8c67b45db799d159066261719e328580a0"
 
 inherit pypi setuptools3
 
-- 
2.37.3


