Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC092C83F27
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:35 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.2950.1752566910226179785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZRGCb9TZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566914; x=1784102914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v5JwQqI/3t71yxz8oQvZJ17cYyYjZn4Eteg6zuYZHVo=;
  b=ZRGCb9TZ+j8ISSjGx4td4SelRl2QTIxq1add+ImDgkTbsirTxk22B1l2
   W5wOzq+J1CoNnRi8HKlEoDIN9CdlxqtUYydfdVB12DgJanIX7ef3lWHTS
   A5yhA0PgjnquFNl4jl7/8OThHvcSW3EheLqw9zvV+y+FPky8OQ5shv0c5
   qYva3k/ILeNLpfeD8DoiLlW27Hzd8zd8WPGcwc6sTXYgLlBWJaxr3jbll
   H/ezily+Os9TlcHYF9fT7+INAi4CuHRHvahzIm6LPoGLcGWGyosrj4f1E
   8ED4Ze5pSEJFZy3m+H6bl63xSPdqFW145Y4rn5OwE1W83mDqYEqduXZct
   Q==;
X-CSE-ConnectionGUID: Gyc2UOMRR5umm1JVQKrbMQ==
X-CSE-MsgGUID: DttMRsziTIWhmI4G1ugtRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="193782258"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="193782258"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:33 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 70CFB1000364
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:33 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C0D901C002BA
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 435D71A008D;
	Tue, 15 Jul 2025 16:08:29 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/19] python3-certifi: upgrade 2025.6.15 -> 2025.7.9
Date: Tue, 15 Jul 2025 16:08:13 +0800
Message-ID: <20250715080819.622-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220281

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...python3-certifi_2025.6.15.bb => python3-certifi_2025.7.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2025.6.15.bb => python3-certifi_2025.7.9.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.6.15.bb b/meta/recipes-devtools/python/python3-certifi_2025.7.9.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2025.6.15.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.7.9.bb
index e8ad8da486..709346486a 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.6.15.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.7.9.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "d747aa5a8b9bbbb1bb8c22bb13e22bd1f18e9796defa16bab421f7f7a317323b"
+SRC_URI[sha256sum] = "c1d2ec05395148ee10cf672ffc28cd37ea0ab0d99f9cc74c43e588cbd111b079"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


