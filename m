Return-Path: <karn.jye.lau@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5243AC54EBC
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 01:40:05 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.60998.1673228399714698181
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 17:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=LJ0Cyt4/;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: karn.jye.lau@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673228399; x=1704764399;
  h=from:to:subject:date:message-id;
  bh=w/JezQa0IlmNXbDQ2dX7OBllVAtRJNQtSdg5AgfSmzI=;
  b=LJ0Cyt4/cBKFphrkaXX9xX3IGggHaawPJ/eOF1qxyejQhbjaeoixlx05
   +lowVn0E4Mpfklmm20507oCUeinMcz3FXsA6HQlKjKBd+wH2zq8mcSvzU
   GINURHv00fmsBF6Oeud7M+Q4uC+X67Gb/6ym89+bs3B2yT8c0hhBb3B47
   J8tQ4Xnv2fqIggwVzkhXUsdyahH73wkstgqldLR6saZUPDlbgkWi+ngUz
   +L2OBQBzTXnqjVFvStpu+Fn5cSr+TJ/rMaXLXEbTTAg6Mym9ysU06Rp2v
   WEZDZpff18XIpkVlahKg2pWVd7BtZhDqSXj0zvDTxgm9J29o3epj6E5iT
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="387225599"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="387225599"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2023 17:39:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="719770841"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="719770841"
Received: from kjlau-ilbpg12.png.intel.com ([10.88.229.12])
  by fmsmga008.fm.intel.com with ESMTP; 08 Jan 2023 17:39:57 -0800
From: karn.jye.lau@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] freetype:update mirror site for package download.
Date: Mon,  9 Jan 2023 09:39:24 +0800
Message-Id: <20230109013924.22185-1-karn.jye.lau@intel.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 01:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175657

From: KARN JYE LAU <karn.jye.lau@intel.com>

update SAVANNAH_NONGNU_MIRROR to SAVANNAH_GNU_MIRROR
to resolve package fetching issues.

Signed-off-by: KARN JYE LAU <karn.jye.lau@intel.com>
---
 meta/recipes-graphics/freetype/freetype_2.12.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/freetype/freetype_2.12.1.bb b/meta/recipes-graphics/freetype/freetype_2.12.1.bb
index 46c6182630..5e7f916e21 100644
--- a/meta/recipes-graphics/freetype/freetype_2.12.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.12.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=a5927784d823d443c6cae55701d01553 \
                     file://docs/FTL.TXT;md5=9f37b4e6afa3fef9dba8932b16bd3f97 \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
 
-SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.xz"
 SRC_URI[sha256sum] = "4766f20157cc4cf0cd292f80bf917f92d1c439b243ac3018debf6b9140c41a7f"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
-- 
2.17.1


