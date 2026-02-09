Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB672E78D53
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:03:55 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43836.1770627827490889532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:03:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HMKEyiC0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627827; x=1802163827;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cWhIWJDRbiAo2hkead0FWSp4UAUWwGOGmqLgKLdO/aA=;
  b=HMKEyiC0EiXYZMHtfNoF1/wWiEXGPsjABQ1HT1+GHRNjJVWJxq5PutHk
   GlkYwyIojquyXmmtTS82Symk9P6o4u1O1V9vzacV0V9HHxaDp0fOQENlo
   09dVEWMGUQsSsgllZ2spZAxZR9yhSHC6pd60FtXQWDd9cMGMRP+l8LZCC
   49TfpYCmegd3Vv7blcgtAYAGhj6VvFpv4EabS15bjBHHeHo8sTP46KAtl
   lvFTE9FpwERsKDEgf01vtvteZeUVpVv9bHpDO6TY18hgppk3lT0r54X7+
   uj/ar2nAGznMteHPVZ6+FepUOhLqIgzzStrB4QJW0NDZ1TfoQT5WX2YSG
   w==;
X-CSE-ConnectionGUID: jeA2gXybTTuY4Z9BLLTfWw==
X-CSE-MsgGUID: RKBRWDjVSz27INlZBOgZJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="229032489"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="229032489"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:46 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id E507D1C000F7
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:45 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9AD03C00344
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 1573B101A406;
	Mon,  9 Feb 2026 09:03:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/39] libxinerama: upgrade 1.1.5 -> 1.1.6
Date: Mon,  9 Feb 2026 17:02:50 +0800
Message-ID: <20260209090317.1468-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230723

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: 2025 added to Copyright and "All rights reserved." removed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libxinerama_1.1.5.bb => libxinerama_1.1.6.bb}         | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxinerama_1.1.5.bb => libxinerama_1.1.6.bb} (68%)

diff --git a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb
similarity index 68%
rename from meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb
rename to meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb
index 421b64e68d..10f683a6f3 100644
--- a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb
@@ -7,14 +7,15 @@ Xinerama Extension for retrieving information about physical output \
 devices which may be combined into a single logical X screen."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6f4f634d1643a2e638bba3fcd19c2536 \
-                    file://src/Xinerama.c;beginline=2;endline=25;md5=fcef273bfb66339256411dd06ea79c02"
+LIC_FILES_CHKSUM = "file://COPYING;md5=68f2159f2eadc772815f13d9565b453d \
+                    file://src/Xinerama.c;beginline=2;endline=25;md5=fcef273bfb66339256411dd06ea79c02 \
+                    "
 
 DEPENDS += "libxext xorgproto"
 PROVIDES = "xinerama"
 PE = "1"
 
 XORG_PN = "libXinerama"
-SRC_URI[sha256sum] = "5094d1f0fcc1828cb1696d0d39d9e866ae32520c54d01f618f1a3c1e30c2085c"
+SRC_URI[sha256sum] = "d00fc1599c303dc5cbc122b8068bdc7405d6fcb19060f4597fc51bd3a8be51d7"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


