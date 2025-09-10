Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CD3CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:39 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.13230.1757495856193396271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FD3XGd4Y;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495857; x=1789031857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OcXsynh0evS+5FiMnXd0Ovaiq4gyCxfhygWa7PGmiRM=;
  b=FD3XGd4YKJD4GHDnI/2dQeOyziZ7kS5Qh4Z9it7sJ8DWZlXHUCXOIJ7J
   ojBDDuMdIbeCBM+XiRN6h3yPSC3tKf/HMMmP/l/BqZcpd0QmjV2vqD1+I
   K8rjs0q9+kyCVd3JzgqkXg4jAmaJq1cXVfkJY4alnwZFOUb2V6tSs3ksj
   QJvMAbfuEt9lg7csL8G8A3WbX1RqP9B8k2oWMqPigG4wt9CdJCuUxoc2S
   sNU7b3tazZNWbsGTNS1/PnD5cULwhJroYEENAZf6umP3ZxRo+vyTJtO0h
   q0UDDHFYA6wH0xPdQh1JreMVQDDUMiaJfX5FMG8g9NCqAjVjt6P3PJmCP
   Q==;
X-CSE-ConnectionGUID: CaidHeUBQQ+Zq1WDIkGcYw==
X-CSE-MsgGUID: CyPRp4slRpePsC8ZiwAJnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="211786999"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="211786999"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:35 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id B2F271002BB8
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:34 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 70646140036D
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:34 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id EC53A1005124
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0A2BE1A006C;
	Wed, 10 Sep 2025 17:17:29 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/40] libxml2: upgrade 2.14.5 -> 2.14.6
Date: Wed, 10 Sep 2025 17:16:24 +0800
Message-ID: <20250910091646.998-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223169

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxml/{libxml2_2.14.5.bb => libxml2_2.14.6.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.14.5.bb => libxml2_2.14.6.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.14.5.bb b/meta/recipes-core/libxml/libxml2_2.14.6.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.14.5.bb
rename to meta/recipes-core/libxml/libxml2_2.14.6.bb
index 6f74187286..6ed8760f4c 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.14.6.bb
@@ -21,7 +21,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-6021.patch \
            "
 
-SRC_URI[archive.sha256sum] = "03d006f3537616833c16c53addcdc32a0eb20e55443cba4038307e3fa7d8d44b"
+SRC_URI[archive.sha256sum] = "7ce458a0affeb83f0b55f1f4f9e0e55735dbfc1a9de124ee86fb4a66b597203a"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
-- 
2.43.0


