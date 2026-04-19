Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1429EEA71A2
	for <webhook@archiver.kernel.org>; Sun, 19 Apr 2026 20:31:03 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5995.1776630651746408493
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Apr 2026 13:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: a.fatoum@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wEYn3-0002OZ-6a; Sun, 19 Apr 2026 22:30:49 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wEYn2-006DeW-0X;
	Sun, 19 Apr 2026 22:30:48 +0200
Received: from [::1] (helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wEYn2-0000000AL4G-0GjS;
	Sun, 19 Apr 2026 22:30:48 +0200
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [OE-core][PATCH] barebox: upgrade 2026.03.1 -> 2026.04.0
Date: Sun, 19 Apr 2026 22:30:14 +0200
Message-ID: <20260419203041.2464191-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Apr 2026 20:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235526

Main highlight of this release is the new devboot mechanism, which
allows overriding any combination of kernel, device tree and
initramfs in an existing boot flow with network-hosted files,
simplifying iterative development:

  https://www.barebox.org/doc/latest/user/devboot.html

This release also restores compatibility with new TF-A versions acting
as SCMI clock provider, after TF-A v2.14 broke the SCMI v2.0 clock
protocol used by earlier barebox (and Linux <= v6.6).

Release notes: https://lore.kernel.org/barebox/aeI471ZfStpltaM6@pengutronix.de
Migration guide: https://barebox.org/doc/latest/migration-guides/migration-2026.04.0.html

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 9f615a82d48f..f736ca68e02f 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.03.1"
+PV = "2026.04.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "9e4b23720016bb934dc5ea36d4c33886a8a295445d290b99993d0b32caab6469"
+SRC_URI[sha256sum] = "07fd3e3440c23e27d0094432f67827887fcc0e37d5fe24dc257c39b97c4294a0"
-- 
2.47.3


