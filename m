Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F86C77B74
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 10:26:47 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.51259.1680258406436147796
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 03:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxz-00086T-8F; Fri, 31 Mar 2023 12:26:43 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxy-007yPH-Fz; Fri, 31 Mar 2023 12:26:42 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxx-006Ahi-2B; Fri, 31 Mar 2023 12:26:41 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de
Subject: [PATCH 06/10] oeqa/utils/commands: remove unused imports
Date: Fri, 31 Mar 2023 12:26:18 +0200
Message-Id: <20230331102622.1468385-7-ejo@pengutronix.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179418

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/lib/oeqa/utils/commands.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 84c463328f..9b07227f12 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -8,11 +8,8 @@
 # This module is mainly used by scripts/oe-selftest and modules under meta/oeqa/selftest
 # It provides a class and methods for running commands on the host in a convienent way for tests.
 
-
-
 import os
 import sys
-import signal
 import subprocess
 import threading
 import time
-- 
2.39.2


