Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B117C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 04:05:32 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9674.1785816328077924268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 21:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WK1lywHU;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785816328; x=1817352328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=au5DOuYvH9ConVj5N9jPOKF81UrMl/pLSgz57guwUts=;
  b=WK1lywHU84lECmvfDMcoY+UenIqx6p6JUZfWS5uuPQnsiwFvMT34gz1C
   pbTFZbwWrKNwDvgAhg97KkwHvm1GBxzEAEkjOi1v2fyuW3d5ICA25raT9
   1hk5iG+MtHl2glkpibj/yFYVt+JHITgVbu25l2YPx6J0312PTqWZkmyUX
   ZhK31mJAgww9b7jgi1jd3tuuxYwyjZNzoLsdin0o6PqLDssM/OWkkV9um
   18mj6kYU/pAZngMqt/hdoEIZvbUHFlT0xXEU54+lIZyhQMpY8OUjUWvyt
   VG002BxUFm2Y3MXPlm18okzOOjabJTyvmM96radw++Yb3aSYvAWKOYzdt
   w==;
X-CSE-ConnectionGUID: VSKLa4yDSqOad1bCXVNIgA==
X-CSE-MsgGUID: UtYFqaqxRhWgxR4531Oo0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="237051533"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="237051533"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 13:05:26 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 3FAAA1C1C700
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:05:26 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id EE9A7140123C
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 04:05:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 019B41800B17;
	Tue,  4 Aug 2026 04:05:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 6/8] python3-websockets: upgrade 16.1.1 -> 17.0.1
Date: Tue,  4 Aug 2026 12:05:06 +0800
Message-ID: <20260804040509.1454-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804040509.1454-1-wangmy@fujitsu.com>
References: <20260804040509.1454-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 04:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242682

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-websockets_16.1.1.bb => python3-websockets_17.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_16.1.1.bb => python3-websockets_17.0.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-websockets_16.1.1.bb b/meta/recipes-devtools/python/python3-websockets_17.0.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-websockets_16.1.1.bb
rename to meta/recipes-devtools/python/python3-websockets_17.0.1.bb
index 6baa744fac..b84aa0dcef 100644
--- a/meta/recipes-devtools/python/python3-websockets_16.1.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_17.0.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "db234eda965dcce15df96bb9709f587cd87d4d52aaf0e80e2f34ec04c7670c57"
+SRC_URI[sha256sum] = "5baa9bc0dfbae8c507e51c8cf1b6d4628086f7a87bbd3a9952bd5f035451f1cc"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


