Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E9CCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 11:34:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.36290.1697196893892836383
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 04:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=QoDJxvaS;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697196894; x=1728732894;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=4q75NV6vg7OLAxBuou2kj2uVPB3V12i43/drkkxKaiI=;
  b=QoDJxvaSvbc/n3DNp24g+tOk9SBpVcRHNqHFKvamaKUaFhe7ezF+H7Oz
   OEgFT1Jk/MAPScp+NLCJMeM2A/FLnFKBiRVoQm1CGZHrSnjcDdIEpwO+f
   PnjeT7alKtpPBrSYVJFAKRmB9bBHKKUp+H25qHfbYB9zmQ8d3Q/JyQWH0
   XRaudo0IWRQWraxEkFLIhOilFXoNtLHAvTKd/hN03u9l5rVyxKNPOQIRr
   PJ/ZngLCSp2huAQ3qrK779C4juaoyLNpBmFuFKV+IgFnD/cR7FeBCxLqd
   5n2dwsoJ6P2MuZ+MCCGWqSzthKtdPa3cBP6KoJHAXMSVQKBO7xTl8VXt5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="385000160"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="385000160"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:29:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="789834380"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="789834380"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 13 Oct 2023 04:29:21 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 3/7] python3-urllib3: upgrade 1.26.11 -> 1.26.12
Date: Fri, 13 Oct 2023 19:09:37 +0800
Message-Id: <20231013110941.2223228-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231013110941.2223228-1-chee.yang.lee@intel.com>
References: <20231013110941.2223228-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 11:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189064

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit cb05578af3ace6e3983f93e16d9ad1ac2a65fbe2)
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../{python3-urllib3_1.26.11.bb => python3-urllib3_1.26.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.11.bb => python3-urllib3_1.26.12.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.11.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.12.bb
index a8d47de0f42..1cd69bcb104 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "ea6e8fb210b19d950fab93b60c9009226c63a28808bc8386e05301e25883ac0a"
+SRC_URI[sha256sum] = "3fa96cf423e6987997fc326ae8df396db2a8b7c667747d47ddd8ecba91f4a74e"
 
 inherit pypi setuptools3
 
-- 
2.37.3


