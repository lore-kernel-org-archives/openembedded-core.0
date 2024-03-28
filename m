Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DDEC54E64
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 07:50:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by mx.groups.io with SMTP id smtpd.web10.10366.1711612249907302998
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 00:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=VGEr/BDk;
 spf=pass (domain: intel.com, ip: 198.175.65.12, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711612252; x=1743148252;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Q8LBHm/JATwGVtq2xfsArSkzt5lHqJ5swXIj6RtJVhA=;
  b=VGEr/BDku9Mpkc1a3iFhC6agzdcWAus8Lb6RXOiZYE+o+FGl3rRE1sSr
   qSxF87qvfViEDpYt9+QRop15bvEGzGljotJdNCWRPOl7KgTyFYL1HOfgV
   F2ati+ysuYV4S6C6ofwECqt7Wue+4Abga23TxZaTajxz34K3jhHqAsyyZ
   kO59dYs5ixHoo4rtJHnRDy3G9y2zqwVrHAZzEB2B2T0lX7POD0S8vVZiA
   QryRwt9Xz7yngPHwfh4RHJAFtN6uVi/e0RIroQIfgaCgbPRXYoEviQC9i
   6D8uGsE77MhP2eSKK/8+fLtCY96HzFD5XqXnMMu+NTPPb4y3EqMm2+3wp
   w==;
X-CSE-ConnectionGUID: vZh2gOPDTGOWQOxu1Kszhg==
X-CSE-MsgGUID: +ZMBZy6aQaaOT8pKUYDuqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18185094"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="18185094"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 00:50:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="47547211"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orviesa002.jf.intel.com with ESMTP; 28 Mar 2024 00:50:51 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 3/3] python3-urllib3: update to v1.26.18
Date: Thu, 28 Mar 2024 15:50:33 +0800
Message-Id: <20240328075033.3800753-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240328075033.3800753-1-chee.yang.lee@intel.com>
References: <20240328075033.3800753-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 07:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197572

From: Tan Wen Yan <wen.yan.tan@intel.com>

https://github.com/urllib3/urllib3/releases/tag/1.26.18

Major changes in python3-urllib3 1.26.18:
- Made body stripped from HTTP requests changing the request method to GET after HTTP 303 "See Other" redirect responses. (CVE-2023-45803)

(cherry picked from OE-Core rev: 74da05b63634c248910594456dae286947f33da5)

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
index 57b166870a..d384b5eb2f 100644
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


