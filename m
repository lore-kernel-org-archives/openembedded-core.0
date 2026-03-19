Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E422108E1CC
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:15:55 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7758.1773915353021894331
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Z+D1vMRY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915353; x=1805451353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I2uzF46RwzwC75CnV3tWCxIUjlXGlOQvnsX+tX3YoVo=;
  b=Z+D1vMRYvT0PJMU1p9f1cAfE8UZCUqPCWrFuPPqHot37+dsccNx6dvan
   gYjMEDd000FJbncl9PBfFacQf8gjYp9sYIHbL4rXEzk1f8eEYHMQjNAnB
   0ZsZIMHLeOw1SajUSBcBxdadOBPKQRdSs2VmhKXY4KwXfxZLbEvOjc80G
   yDAw1j4kOGHWWPbCwfD6y2ljS0hoxk3lR+0fHvw+yRIekDu6uV2L14Ptn
   OCHVD3gKkB6UW6VV1TjE7+CusRWvKe+3geqIMYTWvy3NsN/eILEIxrWRI
   NpsDpfbpBDqATBjNQrfi1fZxjYBL1uZt7ARUyd6d+byixopER+9ldgHFm
   Q==;
X-CSE-ConnectionGUID: 0Q4WmT/KQF6hjKrMXxRXgg==
X-CSE-MsgGUID: TiePBQoZQwC5/QkR/qwi2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="238209213"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="238209213"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:52 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8EC50820C15
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:51 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 448AA8D29D3
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 486B1101E523;
	Thu, 19 Mar 2026 10:15:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 40/40] xkeyboard-config: upgrade 2.46 -> 2.47
Date: Thu, 19 Mar 2026 18:13:32 +0800
Message-ID: <20260319101332.2067-40-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233498

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xkeyboard-config_2.46.bb => xkeyboard-config_2.47.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.46.bb => xkeyboard-config_2.47.bb} (91%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb
similarity index 91%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb
index cfefa53a0f..cbca31fd62 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=faa756e04053029ddc602caf99e5ef1d"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "10c58218fb60d08fb1f7b30304deb3ba47613195aa8a08a81f1972775ccc3640"
+SRC_URI[sha256sum] = "e59984416a72d58b46a52bfec1b1361aa7d84354628227ee2783626c7a6db6b6"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.43.0


