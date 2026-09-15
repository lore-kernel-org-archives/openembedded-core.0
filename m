Return-Path: <preeti.sachan@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0BCC88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 04:34:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16178.1789446858861244562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 21:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Owcumrs3;
 spf=pass (domain: intel.com, ip: 198.175.65.14, mailfrom: preeti.sachan@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789446859; x=1820982859;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hkNt1tIfbZ1Hnbs9GLuI1m2lvLMFq3uH0PEfULtnIos=;
  b=Owcumrs3PJ55wT5nYI6jgT/bPs+1rjrkjZq+o5YdFLRCQHb/nmuPLFKw
   5wWLYhfPtKiQulR0YH9YFHbkwyhFoYhWa4ubWMWsyAIYRxY3snsWjAZA7
   sBSSD5e/B51daif+kjONT4NSslLow0IiJmpKOGB/Y13UR95P3aNM/udSd
   iTwLjd/pLlOQxhXZ1LNdQzZFn6PNHeh4WQjzhtNFvs2zSGvawMGj/t68G
   Q77Xdc+IdKpURp61ZHJAd1xk/FUxybsKwZ4ik2gztCAVONFVBXDGDZWLM
   nuxncRX1RzmETK2Q63PcXrfngt9qKruOvH0NJJLpzgYdS4h0ZrrpWUTgC
   A==;
X-CSE-ConnectionGUID: NiFgPFYAQB+DVW0kzGaNKA==
X-CSE-MsgGUID: Rhozny7nRqSQ0AOhyi5JoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93668606"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93668606"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 21:34:18 -0700
X-CSE-ConnectionGUID: a0Gsmc4CRBmFXnmtmK86BA==
X-CSE-MsgGUID: zUMbGAGiSRWzW8o0MyjGCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1050114"
Received: from ba38rdl00538.iind.intel.com ([10.49.1.8])
  by fmviesa012.fm.intel.com with ESMTP; 14 Sep 2026 21:34:17 -0700
From: preeti.sachan@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [[wrynose][PATCH] libaio: update SRC_URI
Date: Tue, 15 Sep 2026 10:05:32 +0530
Message-Id: <20260915043532.2582892-1-preeti.sachan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 04:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245807

From: Ross Burton <ross.burton@arm.com>

libaio has moved to Codeberg as pagure.io will be closed down shortly.

Cherry picked commit 237c32e181cd47194c3877d220360d6e6fbb2af8 from master branch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
---
 meta/recipes-extended/libaio/libaio_0.3.113.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libaio/libaio_0.3.113.bb b/meta/recipes-extended/libaio/libaio_0.3.113.bb
index 2392fd5db2..5f4c5547a1 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.113.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.113.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://lse.sourceforge.net/io/aio.html"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
-SRC_URI = "git://pagure.io/libaio.git;protocol=https;branch=master \
+SRC_URI = "git://codeberg.org/jmoyer/libaio.git;protocol=https;branch=master;tag=${BP} \
            file://00_arches.patch \
            file://libaio_fix_for_mips_syscalls.patch \
            file://system-linkage.patch \
-- 
2.34.1


