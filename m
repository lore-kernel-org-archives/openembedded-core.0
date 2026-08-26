Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A086C61DCD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:14:08 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7706.1787732042596010003
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FYez+WW0;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787732042; x=1819268042;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qjtaFzIjQ3dgZU9I/22J0niQZB7FZh5V1DND7xIi0Xc=;
  b=FYez+WW08o7VZskobZG42oRX0XBm6B6rC4Af+EOJiUC4WDyBUzk+l4eh
   fSI1lwDNDhRd+v69Ra+6bc4oXFPqnSwLp/+9Z2RWmySHPdwtoxH+GRu3d
   5saIcjD/l/xIEZrq2BtbDf+IpTKIqENqFpOTaFxkbZmNPrt7fUs3logeE
   vpNuu/SFLssQheBZLo4Z6sxZH4MNnRPbu/orJ2hdMA2XXMHeafqFKszBz
   /8y3lbEOgMdunFJWDRyfvt43NIqtLzxcsPmVWwuaxlOb67nW1KaWYb55t
   NtqQRR4kt9s5VUARjF8yt5kC8GustB/j3sgxJFMWSTRk1oTm2kU5E29J2
   Q==;
X-CSE-ConnectionGUID: /3ejJBEuTrOwm1RPEROfuA==
X-CSE-MsgGUID: vqdJU7gwTOyLySF5fFzHtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="250879162"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="250879162"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:14:01 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 09C15C00344
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:14:01 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id B6BE1145A2C6
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:14:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id B80928212C6;
	Wed, 26 Aug 2026 08:13:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/17] gstreamer1.0-plugins-base: upgrade 1.28.5 -> 1.28.6
Date: Wed, 26 Aug 2026 16:13:36 +0800
Message-ID: <20260826081348.1006-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826081348.1006-1-wangmy@fujitsu.com>
References: <20260826081348.1006-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244344

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-base_1.28.5.bb => gstreamer1.0-plugins-base_1.28.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.28.5.bb => gstreamer1.0-plugins-base_1.28.6.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.6.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.6.bb
index 813d1108ff..955e4f5092 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "776f19228f91fd25bbf54d9850597e158507f594872a52b9b6814e2429b43eaa"
+SRC_URI[sha256sum] = "0ba699c7c6c66f4ba640be78cb38a24715add9683f3e3a199f5369dc5a4f04ac"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 
-- 
2.43.0


