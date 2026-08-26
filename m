Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB994C61DC7
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:14:07 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7707.1787732044214011933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nsAs8zv4;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787732048; x=1819268048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oRr7NW1lRfXEsmYvI1/SOQhwi2N3/xh7XpJnHJei5CQ=;
  b=nsAs8zv4ltaofQOsxy4g1/bPp9X1gu0nxTm+WDGclwsOcr0wc1aRMSp1
   nbQdoIH15dTInBqIRjRL3ke/8KrxymbVCJIhmyeR8KY9z0dbxffBFpRs4
   LPVUKjiP+XoHIX73xhl3B7tsHWC/JjIBRj7i3URCJHcFM7iy64PZEJAjh
   sdheg89iI5pvafCT1bfutwnPqKGD/gn9jpb59/XlCCZQVVa0QFLYt9qPT
   ZeW/NEyMqB4iViLaflbXoSlGJc24zviW3ADvm9bks64xKTPJK+AoB0CRV
   56aSnT/+gShp30/U+M98clDBMG9lQrXLnw4yQBwMtx1ecFrSXfukJ3tY0
   w==;
X-CSE-ConnectionGUID: SwyEyMbmR12uh70sObaTtg==
X-CSE-MsgGUID: vY9vSLy2SiK3m2u/RZf3Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="240667631"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="240667631"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:14:07 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 353E62BB7
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:14:04 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id E06A2100D21C
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:14:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id ED6148214F6;
	Wed, 26 Aug 2026 08:14:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/17] gstreamer1.0-plugins-ugly: upgrade 1.28.5 -> 1.28.6
Date: Wed, 26 Aug 2026 16:13:38 +0800
Message-ID: <20260826081348.1006-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826081348.1006-1-wangmy@fujitsu.com>
References: <20260826081348.1006-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244346

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-ugly_1.28.5.bb => gstreamer1.0-plugins-ugly_1.28.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.28.5.bb => gstreamer1.0-plugins-ugly_1.28.6.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.6.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.6.bb
index d1c7ad4d5c..5650b9a395 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.6.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "0ef4cf9c3c9a5e776a6ca8d190a31863391b681980252143b822b29aa831e120"
+SRC_URI[sha256sum] = "ee279da13a740fd7f060d631a673223fa3bcc8c33d350c8d0264bd332a24ecd8"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.43.0


