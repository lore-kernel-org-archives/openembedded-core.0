Return-Path: <karn.jye.lau@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C0FC3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 13:30:10 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.13199.1673011805804021579
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 05:30:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=ZKlvT8q3;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: karn.jye.lau@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673011805; x=1704547805;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OM5mp/1dLezfttF8v13oSeQqLkcb4gl4r3tq4dgy1jw=;
  b=ZKlvT8q3QdFsb4XWmoUrIHOjCMQad8pRg/TD8HULgZdT/NQ8AEH+fedo
   pH+YT4RPhjInmMRntJBVNkQFr1UFMIBwI024q8591VZjMCx5O9ATRP9e+
   8x5OgN6mxZmtoxaxsSimhmnZpqijM9TuZzgRJ7y8m6AMnhTk4de6ri5jk
   A1iew+lX3EkVhovkyC1X2YK9mnaZAD12L85uhXDhxQnOYOLBaxKMpQ3bx
   ew0KbOcQiVchw3yXXbC0CQsryEey+/h8I9j7Mz3ZCIwJifBvvulOfVnXj
   xNi5YGchDgvTxZ+sW7B+Q1FEYDhRsK/zTJ7FutG/gmQHp6ygs6oZWWgU6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="302840253"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; 
   d="scan'208";a="302840253"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 05:30:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="984671240"
X-IronPort-AV: E=Sophos;i="5.96,305,1665471600"; 
   d="scan'208";a="984671240"
Received: from laukarnkye-ilabpg12.png.intel.com ([10.88.229.19])
  by fmsmga005.fm.intel.com with ESMTP; 06 Jan 2023 05:30:04 -0800
From: karn.jye.lau@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE][kirkstone][PATCH] freetype:update mirror site.
Date: Fri,  6 Jan 2023 08:28:58 -0500
Message-Id: <20230106132858.3497824-1-karn.jye.lau@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 13:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175588

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
2.25.1


