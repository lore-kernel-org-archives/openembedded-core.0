Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BF4C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 09:42:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.68883.1701337314862152094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 01:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Tr4XGerl;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701337314; x=1732873314;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j1/jXPhb3vo5Da9eFu4TdApLlUOly895T1Dy6Weh5c0=;
  b=Tr4XGerlCahc+ZitzQydJjXOHWTzHnycwmBRUJLGqhpTfWRkNiFDzcFD
   wqfpJxGiGkX0hR5OqXI5myMjYYY4xZOtwPUigwRksrm3rS9ItQQ3hNYmP
   uExnlssPit3HviqoKiYSP1RjXpeFmw1b28SywFvZbpiIv5Wnu9YLAwjSx
   TVfYNz8oSBxwzky9fYfXqkm/tvWu/Br0dFaMWAxxtGvxSGVvJLhyar2Fr
   qJKH/sNNshqcmB2EaWSMxJX15HwDeeEdwEV4XeppET3U6Bc5YXMEyP/dl
   wOVr6/wMtkp2Ony8erwdJJLHU/zd+GPLIjNvpP3+8IHMeDdXGfWqhud5F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="378327531"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="378327531"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 01:41:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="887184624"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="887184624"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga002.fm.intel.com with ESMTP; 30 Nov 2023 01:41:53 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][PATCH 1/3] python3-urllib3: Upgrade to 2.0.7
Date: Thu, 30 Nov 2023 17:22:13 +0800
Message-Id: <20231130092215.2435495-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 09:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191486

From: Khem Raj <raj.khem@gmail.com>

Addresses CVE-2023-45803 [1]

[1] https://github.com/urllib3/urllib3/commit/4e98d57809dacab1cbe625fddeec1a290c478ea9

( cherry-pick from commit befec4d3591bb0dce0e256cf338eb541b2a56b98 )

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../{python3-urllib3_2.0.6.bb => python3-urllib3_2.0.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.0.6.bb => python3-urllib3_2.0.7.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb b/meta/recipes-devtools/python/python3-urllib3_2.0.7.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_2.0.6.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.0.7.bb
index cd2a9dd4ef..c286838086 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.0.6.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.0.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "b19e1a85d206b56d7df1d5e683df4a7725252a964e3993648dd0fb5a1c157564"
+SRC_URI[sha256sum] = "c97dfde1f7bd43a71c8d2a58e369e9b2bf692d1334ea9f9cae55add7d0dd0f84"
 
 inherit pypi python_hatchling
 
-- 
2.37.3


