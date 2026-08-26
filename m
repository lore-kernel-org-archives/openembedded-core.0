Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17698C61DC4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:14:08 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7657.1787732034735839020
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ug0TFCj/;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787732038; x=1819268038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oGfcaBx8+PCWYI+CeKr2x07BA+IrEyzZrsPshuZZRzs=;
  b=Ug0TFCj/FZZO++WRqKMBbhh6VFBlRcLaLcTTiI8+e9z/Bld7VNyYik7z
   z1N5IiSVfu5qEq73QXrAGNGKjJuJ1hJ7dLgNdgcuTmpb3Q2zEJBg6K0/v
   BXN3NWvBZ8iX5MJv24YXNh1gwamuW5l8JqUvxEncamweUsPVcV+HuoeJe
   ILrLE3YgIL/y+qrNVQuaIuOYUwu17TjVGbApxi1LMIcg4pgi/Mry4QMk8
   eKoEI/YMHY9poCe+TCWi3HrB6jCYLQ0rfxZaiyLK+mpn1wYF1geOD7Yq9
   zR1T2JlcYJdxwG/BFoD2/e46WlbpcM6XOwBPSqZsQ63S0nS4vLz7WqHPc
   g==;
X-CSE-ConnectionGUID: 9GUcvFBuRea5vpgbqL0EAw==
X-CSE-MsgGUID: KTkv7uwaS7Oz3BkasG16DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="252189947"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="252189947"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:13:57 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id AA97942A30E
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:57 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5D0561C2FBB5
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 74D2C8214FB;
	Wed, 26 Aug 2026 08:13:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/17] gstreamer1.0-libav: upgrade 1.28.5 -> 1.28.6
Date: Wed, 26 Aug 2026 16:13:34 +0800
Message-ID: <20260826081348.1006-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826081348.1006-1-wangmy@fujitsu.com>
References: <20260826081348.1006-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244342

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...streamer1.0-libav_1.28.5.bb => gstreamer1.0-libav_1.28.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.5.bb => gstreamer1.0-libav_1.28.6.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.6.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.6.bb
index bda9b213a3..3a1c80c152 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "452854656056f0b16511a1d9ad4f2679ff5e5a87c89f90cf7ee5dec005ddb1e4"
+SRC_URI[sha256sum] = "71e6eafb4fff2a66d1bb0ba8d078224dfe7e3397307d8c0bba3dc23606e08f51"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
-- 
2.43.0


