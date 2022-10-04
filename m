Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15149C4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 07:12:06 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.7948.1664867517688674253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 00:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ftqyS2Lp;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664867517; x=1696403517;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XnvjoYm4p+8lbVvzoTQb/QA5x3ca3HVaN3/OQtIEPZE=;
  b=ftqyS2Lpnd+dT43tTaDpt1CArO5Vl+MDjlS5oG9kDIE1zzc7oKHvU9Rq
   1x6VeAD7mKt10Cyi7P4N7XzZM3E5yyEFrOyd03RTRFG/rGON3vYHRBWmS
   kADETburfPewDm/8KljUmetOtQ3ufTi1j2kDvfc25rGb2vG1IkVjdHhvz
   smTtRQ2oPLEee3TWTeBcKuziJknrKhjYZRbkIAIIQRGwJgFJn5I/pFz4U
   RjzDYDGGOo1vyqOT0jQ9csP3cFQMPAz/zSpMD7nLZMc/T+Yewd8stKgtk
   fC3hqAbAoHw5JRQY0KOAbzAmkV1mZXAtGr21Knv5tY+bvxaemmzJiGKHJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="329248930"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200";
   d="scan'208";a="329248930"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 00:11:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="766235917"
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200";
   d="scan'208";a="766235917"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga001.fm.intel.com with ESMTP; 04 Oct 2022 00:11:56 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][Patch] vim: Upgrade 9.0.0541 -> 9.0.0614
Date: Tue,  4 Oct 2022 15:11:51 +0800
Message-Id: <20221004071151.2920751-1-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 07:12:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171375

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Including fixes for :
CVE-2022-3278
CVE-2022-3296
CVE-2022-3297
CVE-2022-3324
CVE-2022-3352

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5ff60f8495..0710f6afbf 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0541"
-SRCREV = "ee7c8d999beb847457f768757b1bdcd76391c1f4"
+PV .= ".0614"
+SRCREV = "ef976323e770315b5fca544efb6b2faa25674d15"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.37.3


