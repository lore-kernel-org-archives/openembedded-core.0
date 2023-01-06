Return-Path: <karn.jye.lau@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C020C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 09:01:29 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.9848.1672995679011567611
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 01:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=XutKNhFX;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: karn.jye.lau@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672995679; x=1704531679;
  h=from:to:subject:date:message-id;
  bh=op9kL5mctmKS2LhFjREUvr27qE+qc3fePCgCgS8u058=;
  b=XutKNhFXtIKAm7a6uta4IlhZUqqNSL1a6COaqnqYWmhY0zSgqRYPnbub
   vahmc2eL5eye3cC3bSmv7gHtdKWQj1Etywg45yLXClXDon93wxZAmf0Eg
   YStqQevYY5ZhFCXj+PTRB6+46cCebeTWpC5974HNxVagwdB+5CjJLvuky
   OESbNbAoarCbEC5iBr8DmXVT2vNuPtsb3QRqUb1OUdFSD1cK4Vl9yavI5
   JgQCjevheWbet/k2W9J3/gLeO/Z30CsnAzT7JtvU2czlqbhixNQPnQFWW
   bDkShNWssOaO2XrLMIR+wAr965C+HdzFQ+EIyDYO2MmYR49VDLTI50Jsk
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="323689645"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; 
   d="scan'208";a="323689645"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 01:01:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="633443708"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; 
   d="scan'208";a="633443708"
Received: from kjlau-ilbpg12.png.intel.com ([10.88.229.12])
  by orsmga006.jf.intel.com with ESMTP; 06 Jan 2023 01:01:17 -0800
From: karn.jye.lau@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] freetype:update mirror site for package download.
Date: Fri,  6 Jan 2023 17:00:45 +0800
Message-Id: <20230106090045.32131-1-karn.jye.lau@intel.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 09:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175563

From: KARN JYE LAU <karn.jye.lau@intel.com>

update SAVANNAH_NONGNU_MIRROR to SAVANNAH_GNU_MIRROR
to resolve package fetching issues.

Signed-off-by: KARN JYE LAU <karn.jye.lau@intel.com>
---
 meta/recipes-graphics/freetype/freetype_2.11.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/freetype/freetype_2.11.1.bb b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
index 5b464d3d70..d425e162bc 100644
--- a/meta/recipes-graphics/freetype/freetype_2.11.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=a5927784d823d443c6cae55701d01553 \
                     file://docs/FTL.TXT;md5=9f37b4e6afa3fef9dba8932b16bd3f97 \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
 
-SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \ 
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.xz \ 
            file://CVE-2022-27404.patch \
            file://CVE-2022-27405.patch \
            file://CVE-2022-27406.patch \
-- 
2.17.1


