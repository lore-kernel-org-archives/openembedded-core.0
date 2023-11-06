Return-Path: <naveen.kumar.saini@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23491C4167D
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 06:50:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by mx.groups.io with SMTP id smtpd.web10.49113.1699253427623465442
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Nov 2023 22:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=PvPoeMOB;
 spf=pass (domain: intel.com, ip: 198.175.65.10, mailfrom: naveen.kumar.saini@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699253428; x=1730789428;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xFQ9EViaiMMt/HRCXEGnvyMSS4J3PtZxAuin5Bap6XI=;
  b=PvPoeMOBMAcvu0BTW8pea5LJ3Pd5Jkg54+sUZ19aKV+PIM6pynORjxdm
   kgTwbA9EQRk3NsWxDWh9eSmxNUZNXXt7I1ou4IENvEvNRGSv+f9dZkcJ8
   TRFoZxTLmIow5sxbAcLbMxnxh7KUVqWDVQsd64I0R096Ywu+RlaAqq7Rh
   o+F2ajO+aj+99NqeYbH/5ERy+Wl//WfxP5Rr8UBOjJhKrBM/O154qGvuU
   LbDAulAqlODGlBvlwRpZXUFdIEPjlgdcsjfSqdpDhANA5DPr80/oqa1ec
   B8+QfvV2ctTf0k+w/kK34/vg1War20CusiM/jCSiWKMnyKfCEGIm+SpU5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2200987"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="2200987"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 22:50:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="797221936"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="797221936"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 05 Nov 2023 22:50:26 -0800
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 1/2] assimp: Explicitly use nobranch=1 in SRC_URI
Date: Mon,  6 Nov 2023 14:30:46 +0800
Message-Id: <20231106063047.303688-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 06:50:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190196

Branch 'assimp_5.0_release' is not present in repo.

Error:
assimp-5.0.1-r0 do_fetch: Fetcher failure: Unable to find revision 8f0c6b04b2257a520aaab38421b2e090204b69df in branch assimp_5.0_release even from upstream

Set nobranch=1, to fetch from v5.0.1 tag.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta/recipes-graphics/vulkan/assimp_5.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
index 295ac12fc5..0774f37e31 100644
--- a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
+++ b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2119edef0916b0bd511cb3c731076271"
 
 DEPENDS = "zlib"
 
-SRC_URI = "git://github.com/assimp/assimp.git;branch=assimp_5.0_release;protocol=https \
+SRC_URI = "git://github.com/assimp/assimp.git;nobranch=1;protocol=https \
            file://0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch \
            file://0001-Use-ASSIMP_LIB_INSTALL_DIR-to-search-library.patch \
            "
-- 
2.37.3


