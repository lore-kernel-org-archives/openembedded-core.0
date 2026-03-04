Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DEFEB7EBC
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:32:43 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15012.1772620350591260394
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:32:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SXdTrAL9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772620354; x=1804156354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sS1avsULTLmUWMbO0UIM5CCW37J5r0FBuwrzRakRoVI=;
  b=SXdTrAL9I/r9PdtHF3RCKS8nzG7Y81uri5e74vprXk298m+ZZIBM8HOv
   oDAiM0dP8nDh5jOBL3JrqWZjLCOpn2urdfRdT/Rhn/0IGtxlUkF119LCC
   97PGjscEQX+egwkD897C4wLHzVyFvY1zmKKBkVyjMEvCuXJhT9uxMXcRg
   rPGA6q7s2JQtHKiHVCqwliDjeSsv6HbD62rkSnFKEv5i+GaBC6gq8bywq
   h/xkjt9wEjvOQk6yfP2YC518F7lkrekS2vTdNWNaA39l4QEFodPJyrZ8I
   FaB9l8NVJ1Qlhz11nkJYCd6ljS4rR2fijdXSAfyJTRGbl2MxvcPwrBQQR
   g==;
X-CSE-ConnectionGUID: FBzw3IOpQ928ZouDxVlvdg==
X-CSE-MsgGUID: RHitG8beSieuswj/Tek97Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="231329486"
X-IronPort-AV: E=Sophos;i="6.21,323,1763391600"; 
   d="scan'208";a="231329486"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EF2471000355
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:34 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id A0E301003BEE
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id DA5D61007190;
	Wed,  4 Mar 2026 10:32:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/10] gstreamer1.0-plugins-ugly: upgrade 1.26.9 -> 1.28.0
Date: Wed,  4 Mar 2026 18:32:00 +0800
Message-ID: <20260304103203.1649-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260304103203.1649-1-wangmy@fujitsu.com>
References: <20260304103203.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:32:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232366

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-ugly_1.26.9.bb => gstreamer1.0-plugins-ugly_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.9.bb => gstreamer1.0-plugins-ugly_1.28.0.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb
index e04bfcc81b..94fdff5b05 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "184e4c6e765bc463ed806b2263cb9b2aaa3a65415df0a3c22fd520d5d1bacb4d"
+SRC_URI[sha256sum] = "743f28b93c941e0af385ab193a2150f9f79bc6269adc639f6475d984794c217c"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.43.0


