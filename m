Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816AEEB7EC0
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:32:32 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14899.1772620348827669295
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:32:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TgeBdj+c;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772620348; x=1804156348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QyGW3PXQ9z3+ExVtIGkCRxfj4qhr8HIhA/32n1dmwyY=;
  b=TgeBdj+cjfS3L7MC5AAuAKJ4yLZkHlsAwiD0t+wvf7Tc1188k07fFwA/
   GF+SEcWC1J2gJNaOVhshpFumcyalGwSl+YmZF62dUOaA1E5bFJ19fbn0U
   xvKsH903KFgoOWOOSjKx3zDCnx4jGCYvSDQeQtnC3w5AYByZYMsudhRab
   Y+3Z1Xa6EZAjtF89BOGA4Tin+0Vm7DBzbe1/AZXE0LIk5SEbi23MtHKRC
   wynsIF1v5eTf/3W+NaWpZQRm+dUBk3NMftB5Dsf/Lo/B8AY480pAYHWZf
   pQoKzPgJomTISQ5QBui7JNccgOWzNOY81IwXCtzVFOtqBKKmRJVbz6hOv
   Q==;
X-CSE-ConnectionGUID: qxMDahVNTAet0Za8qtJI2Q==
X-CSE-MsgGUID: WyrU+mmPSQam0A1sbWV2gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="210726555"
X-IronPort-AV: E=Sophos;i="6.21,323,1763391600"; 
   d="scan'208";a="210726555"
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 29F731000354
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:27 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D0A4AC00D5C
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 14DAE100718E;
	Wed,  4 Mar 2026 10:32:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/10] gstreamer1.0-libav: upgrade 1.26.9 -> 1.28.0
Date: Wed,  4 Mar 2026 18:31:56 +0800
Message-ID: <20260304103203.1649-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260304103203.1649-1-wangmy@fujitsu.com>
References: <20260304103203.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232362

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...streamer1.0-libav_1.26.9.bb => gstreamer1.0-libav_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.9.bb => gstreamer1.0-libav_1.28.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb
index a652dbba33..70dfe3206d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "08a8e944fc61ef26df515784a089c8ac41765304a5d55b98199835b28a98dbdf"
+SRC_URI[sha256sum] = "e3c93db7da2da3b2374ccc2e7394316f9192460abdea81651652791d46ccb8fb"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
-- 
2.43.0


