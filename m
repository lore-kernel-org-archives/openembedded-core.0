Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91A3CAC587
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:49 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.13164.1757495866593364597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qYaizTZg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495867; x=1789031867;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YuOPLlEKkd0k7Dfnjmy9f5r2qVJw7s4cYI7WcRNm3Ok=;
  b=qYaizTZgeRFO+dB/NI7hswMdk/Y1DOyslWnMoDKcqXNVNM02jqP9JMrv
   82uYUbzgb+JXc3oEg2fkkORgRH34HjE18xEpR0CNZlHFsvm8A1A9KbFrv
   GRzWSjkmrvZqwXmfeLx+n9O3rNOcosU6Fnw6KjAptsN1ZELNfWKFQQJVN
   33fen17RYSWWHodq2MuOA9vgaRkLiLK96C4iUYzKDlpqaHZkUTcfwRh/t
   viHul6RfrcFlftF6YqmELixbfqv60yc8N6v0fek1mTBqJOIb/CHTprH10
   fP/d3r39wuxhvMf/t4n32Xab1bEIo7PqmZH7ifMI7B83n7AcpPMEkFOtU
   g==;
X-CSE-ConnectionGUID: SyBRg3L4Qsac4fm6+Ni8Uw==
X-CSE-MsgGUID: fOnhKm6bTtCoZwZwr9ZhcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="191302782"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="191302782"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:45 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 0F685476
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:46 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B8BDC1C002C3
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:45 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 20F211400BEF
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 327681A0069;
	Wed, 10 Sep 2025 17:17:41 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/40] python3-jsonschema: upgrade 4.25.0 -> 4.25.1
Date: Wed, 10 Sep 2025 17:16:36 +0800
Message-ID: <20250910091646.998-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223181

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-jsonschema_4.25.0.bb => python3-jsonschema_4.25.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.25.0.bb => python3-jsonschema_4.25.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb
index 2f683d5bde..5ccb829ff4 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.25.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.25.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "e63acf5c11762c0e6672ffb61482bdf57f0876684d8d249c0fe2d730d48bc55f"
+SRC_URI[sha256sum] = "e4a9655ce0da0c0b67a085847e00a3a51449e1157f4f75e9fb5aa545e122eb85"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


