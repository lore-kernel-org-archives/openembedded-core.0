Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E005C47258
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 03:14:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by mx.groups.io with SMTP id smtpd.web11.7284.1706238894951339775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 19:14:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ZOIR8yuq;
 spf=pass (domain: intel.com, ip: 198.175.65.14, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706238895; x=1737774895;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yQqFDfs7aFCkWm7Gv7wykvN5fAyeR4dSqflmn1Jt91c=;
  b=ZOIR8yuqEGVGHj2fME558B4zukowA+2wNMNWa7bZ19BGXrCVcirWISoI
   DhmSB0n1kRP+yXnTsUDLEJab9mfvnI8NNqpoS1ceN/D3G7AXhCAdmasIJ
   6e0LXPBo3YVyv8DN1vGw9fYR4VbYak6G58Sa9y1qyT60+tBiqP8MInMNT
   Df41gMykEwfSc/yUTrj1ab5Zoak2gh6ZNcUE81JoA8kXDWgWQJfmU97I0
   MB1kQcmWX1epoGHAZLpKOoPUlEF8F9LXGsuJjS1dHLivLyBisuxjfheWE
   e8uWzbyLKLKKaau3UR7NfyWP8+D5ZF52mtKBx7PTzoLYL6IPNVU/YP5Lv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2266464"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2266464"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 19:14:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="736553021"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="736553021"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga003.jf.intel.com with ESMTP; 25 Jan 2024 19:14:53 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][patch 1/3] python3-jinja2: upgrade 3.1.1 -> 3.1.2
Date: Fri, 26 Jan 2024 10:46:10 +0800
Message-Id: <20240126024612.358182-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 03:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194341

From: Alexander Kanavin <alex.kanavin@gmail.com>

(cherry picked from OE-Core rev: 1e58fa1fff649a4ab07290d2b0e5a8d69d51ef16)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../python/{python3-jinja2_3.1.1.bb => python3-jinja2_3.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.1.bb => python3-jinja2_3.1.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.1.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.1.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
index c38686a5c2..80e0b85670 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "640bed4bb501cbd17194b3cace1dc2126f5b619cf068a726b98192a0fde74ae9"
+SRC_URI[sha256sum] = "31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.37.3


