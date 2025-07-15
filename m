Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2450EC83F3C
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:36 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.2949.1752566907680646826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Xq1caLv3;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566915; x=1784102915;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=figAl/HUWK8Dmi9y+GXEDJPe5B8/scHgBATS4r70nHM=;
  b=Xq1caLv3ofAO7VZrnu4s8sk1Vz+m+P5g+6PClz+U2GhrMO3boMNnGaZ/
   G+ggQZNYr9h1TqQHYvBc/3zoXBm/ayTIZjH/04pn3ajBBvw5iuJf4qeGH
   YDn3kncYDQshBvtwRjyTAs+df8rbn3fALOYNe7LDc8wzLs2oLrhpqeZ0d
   /BgdKcnJKK32BpntVf9lQwu2I69m+NidhEMkMV32TgtS07dv76gxsEMQV
   EZqNwmumQQfuLGCLfNHPgXHViqSzBOsTqV0lhQvpmGUn2K077pnhkC41Y
   CzJy69OyczrYw0ffTEmoe3zQzIBkVh9gaFbu8FkmGqIJy4P5JtG02DcQQ
   A==;
X-CSE-ConnectionGUID: gQ1OQWPjSZ2XyzwTeY7+2A==
X-CSE-MsgGUID: NrXnmCmRTpq0M+Z23l2OUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="185309338"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="185309338"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:34 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id B78C81C1C732
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:34 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1C8128606B1
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AC2591A0071;
	Tue, 15 Jul 2025 16:08:30 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/19] python3-pdm-backend: upgrade 2.4.4 -> 2.4.5
Date: Tue, 15 Jul 2025 16:08:15 +0800
Message-ID: <20250715080819.622-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220283

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pdm-backend_2.4.4.bb => python3-pdm-backend_2.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm-backend_2.4.4.bb => python3-pdm-backend_2.4.5.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.4.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.4.5.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.4.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.4.5.bb
index 71275f3ee8..e0fe16bd71 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.4.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.5.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "f72551eeb319f74ca25856c24fb4026684eeb0dddd9df68482901ab0dc481258"
+SRC_URI[sha256sum] = "56c019c440308adad5d057c08cbb777e65f43b991a3b0920749781258972fe5b"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


