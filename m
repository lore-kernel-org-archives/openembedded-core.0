Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A5DC25B78
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 10:51:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web10.10459.1715856700667342611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 03:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=NkBN2EHR;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715856700; x=1747392700;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tD2rqtdNi6HQAtbNysnga4/seD/8QfSau6WzbXNEHMI=;
  b=NkBN2EHRnwylT8aTcVKMj/oImPBzn+wHOjTVUeWHaMObSD1RSDhESH2i
   p+deD1w/va23PKNtl708Ej1JR5YMo5WqVROHK1TCXnMIuPxriTxYFHv+T
   iJJL7lTEQm2GP8a6Voy3G6U3Nt6Q+GGyGcUAbnOC9o9mmifuv9oBF2gjc
   7ZIsjX4a5+qfXW1+DR/Bwi4ZO64eyQYTa6FVOEb9EGXnKL+O1cctqlzE2
   hegh6kpK9NxsSPDFyiehg4sPhLFa9/6GIJ4Re/aIV4J8i0VC8GnVZWlrz
   EIiK/CkERwB6/+RenXm7x7F1k+NGBVKwpmwXYKjLD9/hqrHJnlFrdrd3C
   g==;
X-CSE-ConnectionGUID: 40J6p0+4SyKn5pHuCm4R3g==
X-CSE-MsgGUID: MGMjA1/iRHWNByquXYHyIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22561967"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="22561967"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 03:51:40 -0700
X-CSE-ConnectionGUID: 37GYbNjQTDyamvY6ybgCJg==
X-CSE-MsgGUID: HL4TeszjQ2y+p40aEIXsqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="31516337"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.118.165])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 03:51:39 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] harfbuzz: upgrade 8.4.0 -> 8.5.0
Date: Thu, 16 May 2024 18:51:26 +0800
Message-ID: <20240516105129.35869-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 10:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199454

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../harfbuzz/{harfbuzz_8.4.0.bb => harfbuzz_8.5.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_8.4.0.bb => harfbuzz_8.5.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb
index fc6951d9edb..97efc56c646 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.4.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "af4ea73e25ab748c8c063b78c2f88e48833db9b2ac369e29bd115702e789755e"
+SRC_URI[sha256sum] = "77e4f7f98f3d86bf8788b53e6832fb96279956e1c3961988ea3d4b7ca41ddc27"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.45.0


