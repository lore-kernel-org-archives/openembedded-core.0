Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E98C3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 23:28:11 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.7354.1721345287484530648
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 16:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46INS2Ph018611;
	Thu, 18 Jul 2024 18:28:03 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Subject: [PATCH v2 0/4] Fix static-library related issues
Date: Thu, 18 Jul 2024 18:27:58 -0500
Message-Id: <1721345282-10901-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 23:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202242

Fixes and test case for static-library related items.

v2:
The first three patches were combined into a single patch originally.

This has been split apart to make it more clear the three individual changes.

Mark Hatle (4):
  package.py: Fix static debuginfo split
  package.py: Fix inode link target
  package.py: Fix static library processing
  selftest-hardlink: Add additional test cases

 .../selftest-hardlink/selftest-hardlink.bb         | 13 +++++
 meta/lib/oe/package.py                             | 60 ++++++++++++++++++----
 meta/lib/oeqa/selftest/cases/package.py            | 24 +++++++++
 3 files changed, 87 insertions(+), 10 deletions(-)

-- 
1.8.3.1


