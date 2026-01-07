Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A759CD5848
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:31:34 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3119.1767781888444491995
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e/MFFGFD;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781887; x=1799317887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Oe45NMNDnpu4r6lG1H19wbXejUexL5/CVWvy69tBrl0=;
  b=e/MFFGFDaZ7QrprZZr8XSyjyW0n40qWTtKqzDdcIyol1CEHJhY5IJNBr
   R9T8NFUkKzDFihms92wQGizxGkslkXQaFylzqahuZKMZYW0Hr730Tluid
   XGGIjsiTwc6LuBptOgf60iSb/PFfjrMdRdw2dKPXir5YF5RMusdZfhtXe
   kzI6tHgmNLrRq49R9bQ2Nix+Dh5R0Rt5niuT1NhkoxBlNAUK5t4DfrLE3
   MTWvOMnyhIFkks0T0IKZwtHpzUEmUbxX+yyUPcAtGbvprxrIbAJ+z9mcq
   Fick/xycyLbqimJC5juIwrSB8kkpJ9CUREZJL0ER2nsF2IgjdJnHm61Pc
   A==;
X-CSE-ConnectionGUID: brXcDtYdTEeMdKYmPtRksQ==
X-CSE-MsgGUID: xR9R/s5BS+yqW8ZMBMG7Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="203905697"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="203905697"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:31:25 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id D3D6E1002B85
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:26 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 84984C06BDB
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id A4771101BB60;
	Wed,  7 Jan 2026 10:31:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/15] python3-certifi: upgrade 2025.11.12 -> 2026.1.4
Date: Wed,  7 Jan 2026 18:30:53 +0800
Message-ID: <20260107103102.458-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107103102.458-1-wangmy@fujitsu.com>
References: <20260107103102.458-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228976

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-certifi_2025.11.12.bb => python3-certifi_2026.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2025.11.12.bb => python3-certifi_2026.1.4.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb b/meta/recipes-devtools/python/python3-certifi_2026.1.4.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2025.11.12.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.1.4.bb
index a7ba12b620..7a753f5b2d 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.1.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "d8ab5478f2ecd78af242878415affce761ca6bc54a22a27e026d7c25357c3316"
+SRC_URI[sha256sum] = "ac726dd470482006e014ad384921ed6438c457018f4b3d204aea4281258b2120"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


