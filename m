Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47C0C8302F
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:37 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.35177.1751274810576654104
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=a6ZFa6Q6;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274815; x=1782810815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3EgYhZBmSvPSK6Vm8V8Gx/lOQj/DzGvozJkq/lJGZ0k=;
  b=a6ZFa6Q6AUTYDJsE7l7GPbczQFHd4Ij1Lf4jBbL35ZQzsmzNNbmeK3m4
   5oR4TeTuePBincqzomxCCEr68aFq6sGYPFwdtg54YuKZcOCuFbkN2O9FS
   jmmRHeZxnZXVa3AhPBvQtb83/EhOQD0PvI61Hmko7t65BgLAHtKpQ559b
   LPJOoWUTADODmqr3fvVHtTbiBmcI/2yDMcz+w0yS6fCXJnQBTKfn7tEce
   a6PyHxw0f/zLJOAdV76iwab5+7PR3lV6lEU/zrtcTG2qB2I1EHd22jmMm
   yOVauzveXFytE0VzjWYc3oT1Q8Y6YR0XMOKDgJ6klLemahguSeXpqMz3M
   g==;
X-CSE-ConnectionGUID: /KHnsYaqS4+8atfm6tP52g==
X-CSE-MsgGUID: 29Z4x8yVT+i4oaky3a40LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="203801348"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="203801348"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:34 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 5CD818204FB
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:34 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 8673286083A
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:33 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CC4B1CFA31
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:31 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4B6101A0073;
	Mon, 30 Jun 2025 17:13:31 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 32/37] python3-pdm: upgrade 2.25.1 -> 2.25.3
Date: Mon, 30 Jun 2025 17:13:10 +0800
Message-ID: <20250630091315.1897-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219495

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Fix a bug that local file package metadata was missing when reading the lockfile.
- Extract dependency-groups and extras markers from marker value when parsing pylock.toml.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.25.1.bb => python3-pdm_2.25.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.25.1.bb => python3-pdm_2.25.3.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.25.1.bb b/meta/recipes-devtools/python/python3-pdm_2.25.3.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pdm_2.25.1.bb
rename to meta/recipes-devtools/python/python3-pdm_2.25.3.bb
index d9331ba72c..f3ec4e60d3 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.25.1.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.25.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "3145251f37a3f94fa211ade992e7db7792da4c3e8e3eeeb1993d952adebe0b96"
+SRC_URI[sha256sum] = "6d0820f805dacf64d55a7fe56777e7d8349a2ee35efc3006f29b4573d1311c84"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


