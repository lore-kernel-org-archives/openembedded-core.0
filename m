Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7F9C61DC7
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:18:59 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7749.1787732330262709294
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TaxJzrDz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787732330; x=1819268330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SAlAABv022Zo67ixvZmZ+5r2rTStLQAd3yO4MDeWstc=;
  b=TaxJzrDz5IJT1NVXcfIwywOM7ojOqZ0yR1XKvV2rtAaexhzaE1iqohob
   XdTEaC46EwCPbho4qG4xbIeWarhFckqzP4QoCOnCzxfIU7pXoaB+QMoy+
   Iy587cPZ4wxNofrLhgwFgXoa3MxCjrjzMHm4qbiec+zJl/iCYbwl+cERK
   5AmATlyJgwqIkFbd7hA0gNzKSsDNRDUuKy99xR8CteCquHQDFLR3MQh/w
   sQVyQLnsAeglAMAhC+hC8LcNm+VgRlpQeBmA+v3ZzldY9O2GWqxfwhYG0
   2M8FddiqVXLywO61Xwd7ec9M0U51zFXzD01bBIHjU2tMFbH92lrZM7K8w
   g==;
X-CSE-ConnectionGUID: HQ8aS4/PQMqJhqGDi0yLtQ==
X-CSE-MsgGUID: xuovmrPORrCziyKVtZRWuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="252690531"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="252690531"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:18:49 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 92AA41002BA5
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:48 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 4C8C0145A2C6
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 45B128214F5;
	Wed, 26 Aug 2026 08:18:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/17] python3-pbr: upgrade 7.1.0 -> 7.1.1
Date: Wed, 26 Aug 2026 16:18:29 +0800
Message-ID: <20260826081832.1059-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826081832.1059-1-wangmy@fujitsu.com>
References: <20260826081832.1059-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244354

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pbr_7.1.0.bb => python3-pbr_7.1.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pbr_7.1.0.bb => python3-pbr_7.1.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pbr_7.1.0.bb b/meta/recipes-devtools/python/python3-pbr_7.1.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pbr_7.1.0.bb
rename to meta/recipes-devtools/python/python3-pbr_7.1.1.bb
index 7fc227e6bb..987c1615f1 100644
--- a/meta/recipes-devtools/python/python3-pbr_7.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pbr_7.1.1.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} += "python3-setuptools"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "66ece3a2f5c4f05e5f37569213e755193f6e00b8aa361bfb190533ea8ee8b10c"
+SRC_URI[sha256sum] = "973da2aee9961d7cb278aa74e1829f6daafec9dd8ee8c1655cbf3f5843bfe083"
-- 
2.43.0


