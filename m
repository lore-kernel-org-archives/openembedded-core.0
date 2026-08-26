Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 513B5C61DCB
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:14:08 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7705.1787732040971944183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=M5G77wXy;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787732041; x=1819268041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mbWY7lMBl4cinZEpV1TmGUVAKhyHNNJn1m7xLnPwQx8=;
  b=M5G77wXyCMBr4jiDF+0ABngxfizEY1wzjqL3no95U5nfSuB7kdgf0QAE
   AI93fZcBYDwzARYv5AKyNT0jprMb4jt5rZQJhmpKI0TSnubtEYIXETpYh
   9zdBZxIE70atEBDg/CB9iLi5hqJPi3EomkkZU65oX2asTmMaAenj/Tw7+
   apgA/jBsFKdoFW3/n8Ft/cPWvDXHx5cAn5W1B1Dn3kNgelCX+cQ1pcw3R
   ivcJ3V5QDbffk4wgFVcJPYmBuUVweOTw01KaoDWPhVcaZ1zi8c7ApqHk+
   JYxoB5vCn6U2cQZ0yg0RYy8Rru6wD30OFXOeFuZliZ0IlvqY/kGu9ws+p
   g==;
X-CSE-ConnectionGUID: SPuXYO9GTUu4JH4E/9uu7w==
X-CSE-MsgGUID: XNlIrkLLTVeWx+qWUv4h1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="238887749"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="238887749"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:13:59 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 60743C00344
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:59 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 181F1148CE4B
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:13:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 1F58B8214F5;
	Wed, 26 Aug 2026 08:13:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/17] gstreamer1.0-plugins-bad: upgrade 1.28.5 -> 1.28.6
Date: Wed, 26 Aug 2026 16:13:35 +0800
Message-ID: <20260826081348.1006-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826081348.1006-1-wangmy@fujitsu.com>
References: <20260826081348.1006-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244343

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...plugins-bad_1.28.5.bb => gstreamer1.0-plugins-bad_1.28.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.28.5.bb => gstreamer1.0-plugins-bad_1.28.6.bb} (99%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.6.bb
similarity index 99%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.6.bb
index 81b4deb528..518fde30d7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://0005-wayland-handle-padded-buffers-in-wl_shm-buffer-creat.patch \
            "
-SRC_URI[sha256sum] = "d8af55faef2958c1a8663751475ee46f5164877cf4d8c5913ea906ef180aeb71"
+SRC_URI[sha256sum] = "6636f2c2289ceda52c4aba971338c81e2b5780d3381bd3673c1c116ec87587c3"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.43.0


