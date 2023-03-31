Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997FAC77B6C
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 10:26:47 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.51306.1680258405725798308
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 03:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxz-00086j-PS; Fri, 31 Mar 2023 12:26:43 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxz-007yPd-19; Fri, 31 Mar 2023 12:26:43 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxw-006AhW-UJ; Fri, 31 Mar 2023 12:26:40 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de
Subject: [PATCH 03/10] oeqa/targetcontrol: do not set dump_host_cmds redundantly
Date: Fri, 31 Mar 2023 12:26:15 +0200
Message-Id: <20230331102622.1468385-4-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331102622.1468385-1-ejo@pengutronix.de>
References: <20230331102622.1468385-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 10:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179411

This is already set above, thus simply use the set value from there.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/lib/oeqa/targetcontrol.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index b8d4ea8a70..bc6b91e994 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -145,7 +145,7 @@ class QemuTarget(BaseTarget):
                             boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT")),
                             use_kvm = use_kvm,
                             dump_dir = dump_dir,
-                            dump_host_cmds = d.getVar("testimage_dump_host"),
+                            dump_host_cmds = dump_host_cmds,
                             logger = logger,
                             tmpfsdir = d.getVar("RUNQEMU_TMPFS_DIR"),
                             serial_ports = len(d.getVar("SERIAL_CONSOLES").split()))
-- 
2.39.2


