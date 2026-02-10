Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32EBCEA3F0A
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 05:42:22 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13880.1770702135376213050
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 21:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.53 with ESMTP; 10 Feb 2026 14:42:13 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto.lge.net) (10.177.121.44)
	by 156.147.1.126 with ESMTP; 10 Feb 2026 14:42:13 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH] systemd: fix libsystemd LICENSE for multilib
Date: Tue, 10 Feb 2026 14:41:47 +0900
Message-ID: <20260210054147.838158-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 05:42:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230851

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Prepend ${MLPREFIX} to LICENSE for libsystemd.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 meta/recipes-core/systemd/systemd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index daf37060d7..80a527dd25 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -11,7 +11,7 @@ elaborate transactional dependency-based service control logic. It can \
 work as a drop-in replacement for sysvinit."
 
 LICENSE = "GPL-2.0-only & LGPL-2.1-or-later"
-LICENSE:libsystemd = "LGPL-2.1-or-later"
+LICENSE:${MLPREFIX}libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=c09786363500a9acc29b147e6e72d2c6 \
                     file://LICENSE.LGPL2.1;md5=be0aaf4a380f73f7e00b420a007368f2"
 
-- 
2.47.2


