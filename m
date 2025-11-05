Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72497CCFA18
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:48:01 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3003.1762386479590506637
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BqVcajfF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386480; x=1793922480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aC2+pW9Q9RlFAo9a5uAgft7b4uQW8xt1VsPW0hApO44=;
  b=BqVcajfF5js/KCAU2vxV/j6Tv7exPU/loY7dwKuGXixjnFPyH13BvAsT
   2q9BMm/yfr84wL0Y609vufwsMNRETb/AI9j3e+K65NOdjL28MFn+vG4IS
   iAhE0OIEjvOFnTlCrdNmj0P0R2sgVCIZtfx0tqWrPn5qf/7Hn6OmgRHIH
   WcL6TUy1143LKb4oChEWfmi8+Nx+IhuRM49+w3l8dfsfwGI5qVWXURbqM
   f/Bj6fNjAhxvnu3sZVUMxOG/UlxJmjiEKKm8mrP5XV5sPjhX9rtagWiJz
   HCkNERNOQlFaoX1ElgaZs2HIw21mLsdX6B3LZb0SeGji5V3itBKKve1WC
   Q==;
X-CSE-ConnectionGUID: 2Cmv8Nm8RHS9XSw5tsj7Ng==
X-CSE-MsgGUID: kGTgPGSnSIWk2Z71Tm+Bzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="218263268"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="218263268"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:58 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id F1854821108
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:57 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id AB61CC02F04
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 420FF14002EB;
	Wed,  5 Nov 2025 23:47:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/29] gstreamer1.0-rtsp-server: upgrade 1.26.5 -> 1.26.7
Date: Thu,  6 Nov 2025 07:47:05 +0800
Message-ID: <20251105234712.446-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225952

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rtsp-server_1.26.5.bb => gstreamer1.0-rtsp-server_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.5.bb => gstreamer1.0-rtsp-server_1.26.7.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.7.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.7.bb
index a6bfd1d2b0..0bc858a03b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.7.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "328dff2457419683f2a4f06ca119cfd22beb632cee1ad6830591213325353c44"
+SRC_URI[sha256sum] = "4f234594aea692e3c1bfaa969965039aaf7483bdfc5862b31d614a59e6718abf"
 
 S = "${UNPACKDIR}/${PNREAL}-${PV}"
 
-- 
2.43.0


