Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7348BC3DA7E
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 18:58:27 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.25874.1721415502885377756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 11:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46JIwJ5r006175;
	Fri, 19 Jul 2024 13:58:20 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Subject: [PATCH v3 1/3] package.py: Fix static debuginfo split
Date: Fri, 19 Jul 2024 13:58:16 -0500
Message-Id: <1721415498-29682-2-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721415498-29682-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1721415498-29682-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 18:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202272

From: Mark Hatle <mark.hatle@amd.com>

Fix:
  NameError: name 'shutil' is not defined

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/lib/oe/package.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index e6b46a0..235f2d6 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -14,6 +14,7 @@ import glob
 import stat
 import mmap
 import subprocess
+import shutil
 
 import oe.cachedpath
 
-- 
1.8.3.1


