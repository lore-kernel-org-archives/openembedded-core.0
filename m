Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CEAC88E4F
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:39:16 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18509.1769431151466518221
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:39:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KDx4i7ZY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769431150; x=1800967150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gkzq3RdRSYlS4ucWjLmaDjKx0MkLPReoSDgPguha6Wo=;
  b=KDx4i7ZYekAGQBL0ikCYuEwkI7rAOn0e/bhs1mfiSaT8R7BU9i/1gsBP
   GTQviABcVv+/L/aQ9C7dn0SbLlP6fdL+2FK2ehBHYPzaXSXMQglHj9q+D
   VqoF2uM3Wwh0NkglVcQdA2icLQNso51l+AeYiP4SL891/Boz7TcYlt6cy
   UFBszN/BgdYDTs9q/6OX+iuTqyWvTMYVmvvX8cT8TZsEKy8qQX68a1VDt
   oS4pSqFhRp70GI0JUK/JCX9Dogb7xxOF0YSf0ZFe6JKQnvNnypP/y66Wk
   HqEayqqfK5ZyDwqvgOUtKU38dLTL2UhBIuwI6p7lRyZfqvqetc9eTz6UD
   g==;
X-CSE-ConnectionGUID: Malpp8g+Q2imLqP8WVcO4Q==
X-CSE-MsgGUID: 63WJGWvMQmC9xLvacpB//A==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="226528639"
X-IronPort-AV: E=Sophos;i="6.21,255,1763391600"; 
   d="scan'208";a="226528639"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:39:09 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 075521C00092
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:39:10 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id AFBC418026E2
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:39:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2E7B2101905E;
	Mon, 26 Jan 2026 12:39:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/17] python3-yamllint: upgrade 1.37.1 -> 1.38.0
Date: Mon, 26 Jan 2026 20:38:44 +0800
Message-ID: <20260126123844.1052-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260126123844.1052-1-wangmy@fujitsu.com>
References: <20260126123844.1052-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230001

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-yamllint_1.37.1.bb => python3-yamllint_1.38.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-yamllint_1.37.1.bb => python3-yamllint_1.38.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-yamllint_1.37.1.bb b/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-yamllint_1.37.1.bb
rename to meta/recipes-devtools/python/python3-yamllint_1.38.0.bb
index 1b0ddde873..c2f32eef63 100644
--- a/meta/recipes-devtools/python/python3-yamllint_1.37.1.bb
+++ b/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "yamllint"
 
-SRC_URI[sha256sum] = "81f7c0c5559becc8049470d86046b36e96113637bcbe4753ecef06977c00245d"
+SRC_URI[sha256sum] = "09e5f29531daab93366bb061e76019d5e91691ef0a40328f04c927387d1d364d"
 
 RDEPENDS:${PN} += "python3-pathspec python3-pyyaml"
 
-- 
2.43.0


