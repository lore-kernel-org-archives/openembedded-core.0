Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E760CCFA1B
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:48:01 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2999.1762386475939545918
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Jii1pP8e;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386476; x=1793922476;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lCyyCdzvKvquVNvh3OLfIDn0PUdcD2S6GtxcDulXI2M=;
  b=Jii1pP8etQV94vcS5hXUdQtGq4poitG0n38DHigmou5WsbkTIdYHAssH
   0uw6DQcg/l8mDZBQ3OnJgDrbQcJKSqzESrLk2XkI0fLscxLC1x9P707rb
   GWVTej3KVb74eBdJnt87tfVHzQyy8E9rJ4pYtsu5LRhXyvoBME78ohdU+
   3BWOg1d0NHth/odTmz86nhoz7mus+jTC4cRnb8xMcii/X+JgnxtKf7Bkt
   WNFMtOCPVUWIiJ3FLYHL+cviY12s+NCeOfBUo53k6WP81HPao1Pz+6FR4
   17pyHoZKNyOkXDYepQ/1BwP+dqlH5wFY36HW+R5mBBJ7DSr29HG/3JDEa
   Q==;
X-CSE-ConnectionGUID: Sb2T1MUjTsaGWV2bcLcSsw==
X-CSE-MsgGUID: 5r3LVsGsSDawwV+Lne11tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="197067485"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="197067485"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:54 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 5CD9942A338
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:54 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 13A0918019AB
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8539D14002EB;
	Wed,  5 Nov 2025 23:47:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/29] gstreamer1.0-plugins-ugly: upgrade 1.26.5 -> 1.26.7
Date: Thu,  6 Nov 2025 07:47:03 +0800
Message-ID: <20251105234712.446-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225950

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-ugly_1.26.5.bb => gstreamer1.0-plugins-ugly_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.5.bb => gstreamer1.0-plugins-ugly_1.26.7.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb
index 5583c2f128..fa34912a06 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.7.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "3dfc43435be97e110816bac6d602b0f206a038546279683d9d25372ff127db52"
+SRC_URI[sha256sum] = "11f2e4f34bb2e841dc60edc95581572bc47be0c11e577d12bed98bb1f80a661b"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.43.0


