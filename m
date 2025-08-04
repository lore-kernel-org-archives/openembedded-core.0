Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858FEC87FDA
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:33:03 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.13456.1754296378069570601
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TFgc4UVn;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296378; x=1785832378;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qhk9IfyzBvoxcovmLo+uYFcqj3JtWkfi7/7Fc9fH+3Q=;
  b=TFgc4UVnHGfA8T43tgZbRSmbrtrwt+0ZjoAQ0lOU+6UCmei4m6tGatfM
   XEYM8+h6kH4/EwsKKEhXpip/rddIXTUuX3nk3M4yZI4gqNWJFcWWRnALn
   G1WtZEnvnG6InHksblglot7/auMoMgd7w4D9CNlUO1+svo/YE31aDMbzY
   rsB2KASV4MmwnQ8g+2F126oE/uUL7AS09nrAa1gWRdvKLeAqAOueXDpAl
   RiIJ1OK4lbhIIJvkVRKwPW9T3YbEuFYCGCM9vyEANgvqA3Os4OGTMwApe
   pDf2VBEfb7ofo1ykZqSNd18acJx547+AKClv5FsVmE5mo9cvwPkBTh/wh
   A==;
X-CSE-ConnectionGUID: k0/N+QPmT0qWZLMXl4Pv1Q==
X-CSE-MsgGUID: UiuHgOUQRzGt2/3C15IN4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="196835024"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="196835024"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:32:55 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id AF4461461
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 08:32:55 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1A8F11C00195
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 08:32:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E7EFA1A0073;
	Mon,  4 Aug 2025 16:32:51 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-license-expression: upgrade 30.4.3 -> 30.4.4
Date: Mon,  4 Aug 2025 16:32:49 +0800
Message-ID: <20250804083249.1627-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 08:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221419

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...xpression_30.4.3.bb => python3-license-expression_30.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-license-expression_30.4.3.bb => python3-license-expression_30.4.4.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-license-expression_30.4.3.bb b/meta/recipes-devtools/python/python3-license-expression_30.4.4.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-license-expression_30.4.3.bb
rename to meta/recipes-devtools/python/python3-license-expression_30.4.4.bb
index 065284ed62..690149123a 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.4.3.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.4.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/nexB/license-expression"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "49f439fea91c4d1a642f9f2902b58db1d42396c5e331045f41ce50df9b40b1f2"
+SRC_URI[sha256sum] = "73448f0aacd8d0808895bdc4b2c8e01a8d67646e4188f887375398c761f340fd"
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta
 PYPI_PACKAGE = "license_expression"
-- 
2.43.0


