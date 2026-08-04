Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE52CC55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 04:05:33 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9672.1785816316780011266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 21:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jB8rKwFu;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785816327; x=1817352327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=01fRG9YGD3JAnjXgIlp26wiTMMLVNhV6fLlmgN3QP6c=;
  b=jB8rKwFufD41p1yVmUDJpdAs7rru9Ch0uWxSKBMS/D+57B3VELHE8VkS
   hsx0CJ44ZTSkjNZ/ilOFXQ4PDCo1npViFmq5vCV/OV/aiAQgZHd6zMpGc
   UWmEAyWu2BQ5T4R78fvdRSdkwyXorHSoGLB/Ni4QTcsFGqRm/NZIYVoWL
   7Wv4ahZ1S0f6eCQCj6ZSwrEgbUGgWC0sniAhi3jBHu5t30iQHlnlJjGeQ
   bK2cZYTYVH2Kd+8UZbZc3k1wyTL1JoacwbG6wgwNFFuUhxeC19NGG0Lyv
   F4l5DL8BicFkZLIPjz11lA7KWaDJas2YgmHtcxVx1SbR9q4cjzMd8PDam
   g==;
X-CSE-ConnectionGUID: D2GxLF8gSFKxHZb45xYSAg==
X-CSE-MsgGUID: 7ys7VXh1TPydOQ4DOZtmDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="253187937"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="253187937"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 13:05:27 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D08E342A337
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:05:23 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 8AAC210214E7
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:05:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id A7E371800B07;
	Tue,  4 Aug 2026 04:05:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 5/8] python3-pyproject-metadata: upgrade 0.11.0 -> 0.12.1
Date: Tue,  4 Aug 2026 12:05:05 +0800
Message-ID: <20260804040509.1454-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804040509.1454-1-wangmy@fujitsu.com>
References: <20260804040509.1454-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 04:05:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242681

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-metadata_0.11.0.bb => python3-pyproject-metadata_0.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-metadata_0.11.0.bb => python3-pyproject-metadata_0.12.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.12.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb
rename to meta/recipes-devtools/python/python3-pyproject-metadata_0.12.1.bb
index 1e485df338..9918cae075 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.11.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.12.1.bb
@@ -16,7 +16,7 @@ PYPI_PACKAGE = "pyproject_metadata"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "c72fa49418bb7c5a10f25e050c418009898d1c051721d19f98a6fb6da59a66cf"
+SRC_URI[sha256sum] = "8809a4df6fe08279b39a8890669506ed3158e0617855ac9aff098fcbe772ae4c"
 
 RDEPENDS:${PN} += " \
     python3-logging \
-- 
2.43.0


