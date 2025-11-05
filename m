Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E02FCCFA18
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:47:51 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2992.1762386464879346804
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sSmBTDOp;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386468; x=1793922468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wu5IwobzxV10PohSacTgt4pHixfil/9FXyLRGiQu4jw=;
  b=sSmBTDOpxqWoGSf7RMiNJoM7+p0+/mcEKaalu+u+iVojaLxWrngdueKd
   3XjeVR82Otybp6O7n8Rk8jFt2rjh+k9dsqeoQw567D+3m0WWXRBdvNKwM
   sQuh/o69v4cCH0CzaMxsiv59bN9AIZkchs2QhaLhCC6RejsuFMquaW0J+
   C3Jz1j1hn4yzvTp2drOpgA3eHwdB/LsCrfRgHVilGG9zzekUOsQdUj5so
   dFVSWG9kNe9f/e0iDsKc8aGzIiwkKnT9MTNXX5Ui2FBtl7tBYT9kLIE2z
   DPwwIIwjMVDaO4XY/7Jlb+bWKy353iufg4m6oNQt6+CVTStxV9qvIv4e8
   g==;
X-CSE-ConnectionGUID: vs2SbyYMR7StlU+HjPzwCQ==
X-CSE-MsgGUID: GVRm88F4SCCULs0XtowT5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="218263241"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="218263241"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:47 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 0858C42A338
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:47 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B4A881C0010C
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 37426140008B;
	Wed,  5 Nov 2025 23:47:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/29] gstreamer1.0-libav: upgrade 1.26.5 -> 1.26.7
Date: Thu,  6 Nov 2025 07:46:59 +0800
Message-ID: <20251105234712.446-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225946

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...streamer1.0-libav_1.26.5.bb => gstreamer1.0-libav_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.5.bb => gstreamer1.0-libav_1.26.7.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
index c3ee529497..aa6c431daa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d6de05884ef42376dd8cde89940f7b50ced96f4f6f52888e764cd8233e74f052"
+SRC_URI[sha256sum] = "91d4a7a14527d97fe0ce7ccedb3554e8f692b216429ef2b1850944bbf5435c09"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
-- 
2.43.0


