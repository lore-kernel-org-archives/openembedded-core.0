Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505C9C83039
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.35177.1751274810576654104
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cbWx8Map;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274813; x=1782810813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iMmpxE1i9dOi9Spz81eW0LL6Nf3R+MJHy4qoKiMQNSE=;
  b=cbWx8Mapxb7oWeZLcm7V90OqM++63ebuoXEWttbRFuieYlrQnHj73E2u
   1RRuQQTqJ6IaVMvkHtjxH8wLxTjNGUjUF5ALGRbMSz7oK+YsEvow/URT9
   GKiLgFkGtl8762Bikg+NrmAr6q85Vq51GgAL3NHtm/ZgJi8fVWLLm3yau
   7UvtsHdh6uWBcHlx4ThzrFoMJ24k8MQ7Yht3TNG9Cwzv8o5uFOWhi1a8g
   lIoMGxOBIy/KHflkF2Z9R5xfpVBmGMpaUma7XXEl+xQl5oAkrVoamYFyr
   8hNCf/unbigONSEm0JSflZo7hFKtczmHtx9TL4jd9j+51HmTtyzJEaczN
   g==;
X-CSE-ConnectionGUID: 1K8wZIuXTAqe9fkel9SOLw==
X-CSE-MsgGUID: xHC6q/O6QyCKKJ1czc522A==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="203801338"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="203801338"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:32 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 9B60F820411
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:32 +0000 (UTC)
Received: from yto-m2.gw.nic.fujitsu.com (yto-m2.gw.nic.fujitsu.com [10.128.47.163])
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTP id 08B78C00755
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:32 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 71064D5072
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:30 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F2EED1A0073;
	Mon, 30 Jun 2025 17:13:29 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/37] python3-license-expression: upgrade 30.4.1 -> 30.4.3
Date: Mon, 30 Jun 2025 17:13:06 +0800
Message-ID: <20250630091315.1897-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219485

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Fix missing release wheels
- Fix typo in README.rst for SPDX license list version
- Fix LicenseWithExceptionSymbol missing Expression class variables
- Depcreated licenses are loaded by default.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...xpression_30.4.1.bb => python3-license-expression_30.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-license-expression_30.4.1.bb => python3-license-expression_30.4.3.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.4.3.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
rename to meta/recipes-devtools/python/python3-license-expression_30.4.3.bb
index ec613f6eaa..065284ed62 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.4.1.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.4.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/nexB/license-expression"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "9f02105f9e0fcecba6a85dfbbed7d94ea1c3a70cf23ddbfb5adf3438a6f6fce0"
+SRC_URI[sha256sum] = "49f439fea91c4d1a642f9f2902b58db1d42396c5e331045f41ce50df9b40b1f2"
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta
 PYPI_PACKAGE = "license_expression"
-- 
2.43.0


