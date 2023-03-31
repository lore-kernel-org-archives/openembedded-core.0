Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE4DC77B6F
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 10:26:47 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.51258.1680258405839857887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 03:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxz-00086R-88; Fri, 31 Mar 2023 12:26:43 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxy-007yPF-Cp; Fri, 31 Mar 2023 12:26:42 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxw-006AhO-Qq; Fri, 31 Mar 2023 12:26:40 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de
Subject: [PATCH 01/10] oeqa/selftest/cases/runqemu: update imports
Date: Fri, 31 Mar 2023 12:26:13 +0200
Message-Id: <20230331102622.1468385-2-ejo@pengutronix.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179410

'tempfile' and 'oeqa.utils.command.runCmd' are unused while 'os' is
actually used.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index e72ff529c4..af45c048a4 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -4,14 +4,14 @@
 # SPDX-License-Identifier: MIT
 #
 
+import os
 import re
-import tempfile
 import time
 import oe.types
 from oeqa.core.decorator import OETestTag
 from oeqa.core.decorator.data import skipIfNotArch, skipIfNotMachine
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu, get_bb_var, runCmd
+from oeqa.utils.commands import bitbake, runqemu, get_bb_var
 
 @OETestTag("runqemu")
 class RunqemuTests(OESelftestTestCase):
-- 
2.39.2


