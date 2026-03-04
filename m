Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED7AEB7EC7
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:32:44 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14907.1772620360332386780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:32:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=miRMhOL2;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772620358; x=1804156358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uBYH1nDt9m0o3fiS5YgbOwoHyQMCVYlGOUBOgOehPjQ=;
  b=miRMhOL2O8BbJ9v4D8Lc1qNxk4hfI+QIa/wQOx7W9B0scemm8xl7HsLy
   ++Hnf9XUTPH9NCb+IeZY4a+R8iIwffDz7aTpGa0rhuceNvcrGlw16dsOu
   WNuYCO/OFTZPSFdEi2Q5eyTg3h+TaWHeCFpu0LRavD9M4Xf1a3yNnycMh
   IwlzuGtYQfr+p5dnuLWUouBLsMYEVF5SeJi1YOIoWZKwSv/Iyxr1DR9NB
   eTSACRKVJNE+kQjoZgwaER3C2StlNZXLuAgIs5VulRHuaW6CRdISKsslf
   PqKQM2XyMOtVO5SL1mRxYlq/NndbKXzLheBsFOZTZxvcjlrgj47Gk4xsJ
   Q==;
X-CSE-ConnectionGUID: DgZ4YfVQTleNul2dMJurjw==
X-CSE-MsgGUID: m/x5oh+nTWG8LBkIg/UhqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="219346912"
X-IronPort-AV: E=Sophos;i="6.21,323,1763391600"; 
   d="scan'208";a="219346912"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DF7E71C000BB
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:38 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 94BC51003BEE
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id C4E01100718C;
	Wed,  4 Mar 2026 10:32:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/10] gstreamer1.0-rtsp-server: upgrade 1.26.9 -> 1.28.0
Date: Wed,  4 Mar 2026 18:32:02 +0800
Message-ID: <20260304103203.1649-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260304103203.1649-1-wangmy@fujitsu.com>
References: <20260304103203.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232368

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rtsp-server_1.26.9.bb => gstreamer1.0-rtsp-server_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.9.bb => gstreamer1.0-rtsp-server_1.28.0.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb
index ac6b52ee46..d8bd047afe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.28.0.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "67e92e9a5b0f2b51eb571cc893b80da2ae2374f19b05d381d1e364393fe12654"
+SRC_URI[sha256sum] = "5ed0938ea0fc1df2709cc939245d93294f09b2d7220e19f7fcdb306ce2b6cee5"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
-- 
2.43.0


