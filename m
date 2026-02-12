Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C1DEB491B
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 13:03:54 +0000 (UTC)
Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch [83.166.143.168])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44479.1770901431408230386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 05:03:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=S0R5SUyS;
 spf=pass (domain: 0leil.net, ip: 83.166.143.168, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fBb8h6QLwzJSp;
	Thu, 12 Feb 2026 14:03:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1770901426;
	bh=LKunfrPLMCO4IUTzjTzbRxes8iNnv3xW2dLmsYziV0E=;
	h=From:Date:Subject:To:Cc:From;
	b=S0R5SUySqysjyanISeFPZ2di1sUbCb+G4Jn3nhJ9NDfXOchMeflWpji5/uY7JTXdf
	 sPWH1wVGhYW3k6DuSZhqBbSK+M/ljj0CHyQXQpliS+Uy9WyzEPDElxWcNcNQJjuLX9
	 5OqVqIQ/4KZ28CrMWSwt4DmUwsWXVPr9cgCzKNJ95Z5KLMPJ+6Hb9OW16W5U6qcrEq
	 BvtshnfiaKrO2L/i3fTrv19eapOY+ee1ef/gB9wf50WPSs7eY6/9J/FkbZJH/pNGIa
	 I7LVZS7oBHTwtMl43oxVo+gAeiVob5+Djpk8Et8fwZK4vzq4GDqQsbII5bFtSS3fqL
	 9yRFDWqYLh/+g==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fBb8f0QL6zH3B;
	Thu, 12 Feb 2026 14:03:45 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 12 Feb 2026 14:03:39 +0100
Subject: [PATCH] mesa: upgrade 25.3.4 -> 25.3.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-mesa-25-3-5-v1-1-d95fd99f10c2@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Mj3dzU4kRdI1NdY11T3TRTU3OzNKM0oyQTQyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgDBVDhcbwAAAA==
X-Change-ID: 20260212-mesa-25-3-5-f5576f2f2b41
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 13:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231029

From: Quentin Schulz <quentin.schulz@cherry.de>

Upgrade mesa to the latest stable release.

See https://docs.mesa3d.org/relnotes/25.3.4.html for release notes and
sha256sum.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
This is based on
https://lore.kernel.org/openembedded-core/20260206-mesa-tools-native-v1-0-166935b0e379@cherry.de/
patches 1 is required but I tested on top of patch 1 to 5 both included.

Tested on RK3588, RK3399 and PX30 (panthor/panfrost) with kmscube.
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8e5f9657fd..3788f0d3b2 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,8 +22,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0002-rocket-drop-file-names-from-the-generated-file.patch \
 "
 
-SRC_URI[sha256sum] = "3a0fc6ec070b45ae25dc2ccb5e52fae1d89141f7c39c4a91fe4eaa80dfff9deb"
-PV = "25.3.4"
+SRC_URI[sha256sum] = "be472413475082df945e0f9be34f5af008baa03eb357e067ce5a611a2d44c44b"
+PV = "25.3.5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 

---
base-commit: 5a0b9caa53e4cce743ce9f896cd0927a6cb23af0
change-id: 20260212-mesa-25-3-5-f5576f2f2b41

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


