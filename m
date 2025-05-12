Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD59EC3ABD2
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:23 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.45926.1747040654706937576
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dxCe4VIe;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040658; x=1778576658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=djiKjO0TsM1UFkBAOJKac42F+46MDauNngu59Y1SqoY=;
  b=dxCe4VIes4jn25RCqd8Klt8tqomP4bvF+5le56nsA5O43fbl0iK5fq+y
   VLo0sp5X0KhgsAZQyYvMSb2CK4kI/IAba/Z1b1AmD0wkB9v7fDlconSp5
   511KQc2GbLJ0iG9JqDvKWcBzstn5Y5oXsySngmiLFXozfS8xWioYruMVT
   oA1Xw8qgYD7BbZfEhoO7rwHFyhy9NTj2FCyyTMi7opJUe/DUm75e2MXs3
   fLgfo+cURuJyufcJ5X6pqzseWl06Cp1hZkfL/Ucgmh/CNLB26tuepxwyM
   GA5jwnBWmyISOV/snLoEGDtJ/8ikDnB1cWxRP/n4QEKmqsGH7C5txVP0s
   A==;
X-CSE-ConnectionGUID: /KD+l7FIQ7qXMpbMxQlk7Q==
X-CSE-MsgGUID: JsxDPE7mTuSNJdTU0rff1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199125973"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199125973"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:09 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E0EA6D5014
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9EF16D5040
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:01 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5FB951A00A0;
	Mon, 12 May 2025 17:04:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 40/56] python3-lxml: upgrade 5.3.2 -> 5.4.0
Date: Mon, 12 May 2025 17:03:23 +0800
Message-Id: <1747040619-7566-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216354

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfix:
-Binary wheels use libxml2 2.13.8 and libxslt 1.1.43 to resolve several CVEs.
(Binary wheels for Windows continue to use a patched libxml2 2.11.9 and libxslt 1.1.39.)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lxml_5.3.2.bb => python3-lxml_5.4.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_5.3.2.bb => python3-lxml_5.4.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_5.3.2.bb b/meta/recipes-devtools/python/python3-lxml_5.4.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_5.3.2.bb
rename to meta/recipes-devtools/python/python3-lxml_5.4.0.bb
index cc0d4ecd25..126fbe99b4 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.3.2.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.4.0.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "773947d0ed809ddad824b7b14467e1a481b8976e87278ac4a730c2f7c7fcddc1"
+SRC_URI[sha256sum] = "d12832e1dbea4be280b22fd0ea7c9b87f0d8fc51ba06e92dc62d52f804f78ebd"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.43.0


