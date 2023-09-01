Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEDCCA0FE5
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 15:16:57 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.41.1693581412999323237
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 08:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1qc4kV-0000aT-Hr; Fri, 01 Sep 2023 16:03:47 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1qbyWu-0036P0-QD; Fri, 01 Sep 2023 09:25:20 +0200
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1qbyWu-00FCLP-1Q; Fri, 01 Sep 2023 09:25:20 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] weston: fix comment
Date: Fri,  1 Sep 2023 09:24:58 +0200
Message-Id: <20230901072458.3620640-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 15:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187010

Fixes: be7da75827b4 ("weston: update 11.0.1 -> 12.0.1")
Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta/recipes-graphics/wayland/weston_12.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_12.0.1.bb b/meta/recipes-graphics/wayland/weston_12.0.1.bb
index d9eae1ff62f3..8c2438cdaa5b 100644
--- a/meta/recipes-graphics/wayland/weston_12.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_12.0.1.bb
@@ -70,7 +70,7 @@ PACKAGECONFIG[egl] = "-Drenderer-gl=true,-Drenderer-gl=false,virtual/egl"
 PACKAGECONFIG[lcms] = "-Dcolor-management-lcms=true,-Dcolor-management-lcms=false,lcms"
 # Weston with webp support
 PACKAGECONFIG[webp] = "-Dimage-webp=true,-Dimage-webp=false,libwebp"
-# Weston with systemd-login support
+# Weston with systemd support
 PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd dbus"
 # Weston with Xwayland support (requires X11 and Wayland)
 PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,libxcb libxcursor xcb-util-cursor xwayland"
-- 
2.39.2


