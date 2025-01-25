Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0436DC0218D
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 21:36:09 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.18912.1737840962285274852
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jan 2025 13:36:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tbnou-0007ur-Hn; Sat, 25 Jan 2025 22:36:00 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tbnot-001qwe-2x;
	Sat, 25 Jan 2025 22:35:59 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tbnot-001Jv2-2l;
	Sat, 25 Jan 2025 22:35:59 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de
Subject: [PATCH] barebox: upgrade 2024.12.0 -> 2025.01.0
Date: Sat, 25 Jan 2025 22:35:18 +0100
Message-Id: <20250125213518.294656-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 21:36:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210270

Changes:

* Added LLVM/Clang support for the sandbox architecture.
* Enabled command execution from the sandbox command line.
* Improved TFTP with dentry caching and default window size set to 1.
* Introduced hardening features: register zeroing, stack variable
  initialization, and malloc buffer zeroing.
* Enhanced AM625 support with network support, watchdog driver, and
  bootsource detection.

Changelog: https://lore.barebox.org/barebox/Z4oUYdHXEAtnkySC@pengutronix.de/T/#u

Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index fce3b825ae..9b8dc4ea60 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2024.12.0"
+PV = "2025.01.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "717a2416b37942f584b0bb2eb61ccbf85dc0f1a5c841318f47cd6967b9c4dcab"
+SRC_URI[sha256sum] = "288a838e6fe8897ea46dabd112e42287177353c88a7d442cefc8be8d1a85f5b5"
-- 
2.39.5


