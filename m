Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFBFC44536
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 09:05:28 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33177.1769072721941073686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 01:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oa1JUz53;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769072722; x=1800608722;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aT41iMyeQbfdHOzsYKXVi3nWrLNFnDub+PSEQeN+2bU=;
  b=oa1JUz53Y2A7RKSrKDZToMjdVn9UteIhR14AOX6+LD8iBAQ+WWe+Rh5d
   l/37xYrYR3dW3U3ziO5L9bq5/WKB5izNzb2Ot91BCWkZB6EDrRYQVATE0
   4LSBTBt0lVeXpIt5OKnl8+IbO7/PPh9BBsQ95/EMjCL+xB5UvWlTUXYcW
   /oJ1Z5xJYtogobsRFu8x5qLqW0r0C/ZQYXxwVd+fy40Y3cQLa2lu22OtA
   mCwYw646DhZzJtOl6dfJBtLySziIZs8WhZ0AWbdBrlGQv+jiw5tN4HUUQ
   4ND7zVhtBd7dfFqJPmkAmRJMDClIAEOrqrtSALjzMD6ZXdmDv3VxdaZy6
   Q==;
X-CSE-ConnectionGUID: Xptwpca9TOqIGJ/2qgtW2g==
X-CSE-MsgGUID: JwBaApyRTniLl9GMDQjZ2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="230739515"
X-IronPort-AV: E=Sophos;i="6.21,245,1763391600"; 
   d="scan'208";a="230739515"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 18:05:20 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 1010F1C1C70C
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 09:05:20 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id B95A11400107
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 09:05:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 16D232000AB2;
	Thu, 22 Jan 2026 09:05:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 1/5] alsa-lib: upgrade 1.2.15.2 -> 1.2.15.3
Date: Thu, 22 Jan 2026 17:05:09 +0800
Message-ID: <20260122090513.888-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 09:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229834

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../alsa/{alsa-lib_1.2.15.2.bb => alsa-lib_1.2.15.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.15.2.bb => alsa-lib_1.2.15.3.bb} (94%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
similarity index 94%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.15.2.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
index d09f2ac370..fec4b2c1a9 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "637eefd4966ce738da44464494df2b2894e19778fac2f9e7c47277e2af9297f4"
+SRC_URI[sha256sum] = "7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


