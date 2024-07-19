Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADFBC3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 18:58:27 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.25839.1721415502921255127
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 11:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46JIwJ5q006175;
	Fri, 19 Jul 2024 13:58:19 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Subject: [PATCH v3 0/3] Fix static-library related issues
Date: Fri, 19 Jul 2024 13:58:15 -0500
Message-Id: <1721415498-29682-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 18:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202273

Fixes and test case for static-library related items.

v3:
Drop debug hard link change.  My understanding of what was supposed to
happen was incorrect.  I've updated the self-tests to hopefully make it
clearer that the additional links should NOT happen.

Note, the hardlinks for static libraries SHOULD happen though!

v2:
The first three patches were combined into a single patch originally.

This has been split apart to make it more clear the three individual changes.

Mark Hatle (3):
  package.py: Fix static debuginfo split
  package.py: Fix static library processing
  selftest-hardlink: Add additional test cases

 .../selftest-hardlink/selftest-hardlink.bb         | 13 +++++
 meta/lib/oe/package.py                             | 57 ++++++++++++++++++----
 meta/lib/oeqa/selftest/cases/package.py            | 26 ++++++++++
 3 files changed, 87 insertions(+), 9 deletions(-)

-- 
1.8.3.1


