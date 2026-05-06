Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7013CD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 17:24:44 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24247.1778088277884589858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 10:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.53 with ESMTP; 7 May 2026 02:24:35 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto) (10.177.121.44)
	by 156.147.1.151 with ESMTP; 7 May 2026 02:24:35 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH v2 0/2] Fix multilib package variable propagation
Date: Thu,  7 May 2026 02:24:13 +0900
Message-ID: <20260506172416.4017418-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 17:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236545

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

This set of patches addresses the issue where package variables in
PACKAGEVARS (e.g. LICENSE) are not extended for a multilib variant
build. It also adds a selftest that verifies the consistency of pkgdata
variables between the base and 'lib32' multilib variant packages.

Jaeyoon Jung (2):
  multilib: extend variables after packages split
  oeqa/selftest/pkgdata: add a test for variable consistency in multilib

 meta/classes/multilib.bbclass           | 12 ++++++++++++
 meta/lib/oeqa/selftest/cases/pkgdata.py | 18 ++++++++++++++++++
 2 files changed, 30 insertions(+)


