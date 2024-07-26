Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275BEC3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 16:22:50 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.65421.1722010960429916309
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 09:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46QGMcnk026618
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 11:22:39 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 1/8] package.py: Fix static debuginfo split
Date: Fri, 26 Jul 2024 11:22:31 -0500
Message-Id: <1722010958-23635-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 16:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202550

From: Mark Hatle <mark.hatle@amd.com>

Fix:
  NameError: name 'shutil' is not defined

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 13bdd750ae54d57a5f459e4b7d8636c864978241)
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/lib/oe/package.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 1511ba4..ffe5a21 100644
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


