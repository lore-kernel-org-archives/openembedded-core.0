Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CC9C77B70
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 10:26:47 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.51256.1680258405428995272
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 03:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxz-00086S-85; Fri, 31 Mar 2023 12:26:43 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxy-007yPI-Fs; Fri, 31 Mar 2023 12:26:42 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxw-006AhL-P9; Fri, 31 Mar 2023 12:26:40 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de
Subject: [PATCH 00/10] oeqa: some minor fixes and cleanups
Date: Fri, 31 Mar 2023 12:26:12 +0200
Message-Id: <20230331102622.1468385-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179409

This is a collection of minor fixes and cleanups I came across when
digging through oeqa code.

Enrico Jorns (10):
  oeqa/selftest/cases/runqemu: update imports
  oeqa/targetcontrol: fix misspelled RuntimeError
  oeqa/targetcontrol: do not set dump_host_cmds redundantly
  oeqa/targetcontrol: remove unused imports
  oeqa/utils/commands: fix usage of undefined EPIPE
  oeqa/utils/commands: remove unused imports
  oeqa/utils/qemurunner: replace hard-coded user 'root' in debug output
  oeqa/utils/qemurunner: limit precision of timing debugging output
  oeqa/utils/qemurunner: fix undefined TimeoutExpired
  oeqa: whitespace and indentation cleanups

 meta/lib/oeqa/selftest/cases/runqemu.py | 16 ++++++------
 meta/lib/oeqa/targetcontrol.py          | 12 +++------
 meta/lib/oeqa/utils/commands.py         |  8 +++---
 meta/lib/oeqa/utils/qemurunner.py       | 34 ++++++++++++-------------
 4 files changed, 32 insertions(+), 38 deletions(-)

-- 
2.39.2


