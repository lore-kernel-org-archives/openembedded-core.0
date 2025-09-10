Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE50CAC58D
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:18:30 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.13176.1757495901192975484
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iqVf38XN;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495901; x=1789031901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6acYOzQ4dMD7rmMfFDh3ijcmyN5nC9l8tlwDjXEJ0M4=;
  b=iqVf38XNcMVTeVWYX0bSdobzwUii4UZn12khcDG3IK/EUvaxFDwtn7M6
   pAzd1Js+V54vxAN0Jg2CgGwum233pckRGV2xnsooXkmUFqs+/YpNb7sjs
   VWE7j3miOqPoAyNBq1URkWxmLY9gDKIt/XGBQXjMkz/4xfhb8K+87Te2l
   iC0AbY16JLK1c4tYxKJUkevRiRGwvXl8M34gUKJmJJ6ysqGPjTYP1Wgxm
   RUkap1a/A+yQ7QYOBytDc4WVM/v1i9iA8gJwj8SEzn1gO5q9CehJMG91c
   0+/6iQvug7/fIS4zg2e0o9j5EoRyALau6LLTEibSDrB5P1sey0u32RzGH
   w==;
X-CSE-ConnectionGUID: A/0LCkgbTceXRC6m8jGexg==
X-CSE-MsgGUID: 0KF39FzYTRmsGvhAa6yt2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="200942188"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="200942188"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:18:19 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 90B101000354
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:19 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 4BEC51800317
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:19 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id B6D57200A622
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B51931A008A;
	Wed, 10 Sep 2025 17:18:14 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 39/40] tcl8: upgrade 8.6.16 -> 8.6.17
Date: Wed, 10 Sep 2025 17:16:45 +0800
Message-ID: <20250910091646.998-39-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223190

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/tcltk8/{tcl8_8.6.16.bb => tcl8_8.6.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/tcltk8/{tcl8_8.6.16.bb => tcl8_8.6.17.bb} (98%)

diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
similarity index 98%
rename from meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
rename to meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
index 225f04be48..d4bdd71c05 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
@@ -25,7 +25,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://run-ptest \
            file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch \
            "
-SRC_URI[sha256sum] = "3b371386a9a928eecdbf263bcab7d6a531e620ca3fbab4fdeeb3d6a9a56f38e9"
+SRC_URI[sha256sum] = "a1d8cbe44b38beaa29fc2130c4e7b79b8bf02e2bcc028ffefd7a25a2122202a0"
 
 SRC_URI:class-native = "${BASE_SRC_URI}"
 
-- 
2.43.0


