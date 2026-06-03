Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4634ACD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 21:57:55 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31527.1780523872178629666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 14:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net ([70.99.78.136])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 653LvoDr2277307;
	Wed, 3 Jun 2026 16:57:50 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org
Subject: [OE-core][PATCH] pseudo: Update to version 1.9.8
Date: Wed,  3 Jun 2026 16:57:39 -0500
Message-Id: <1780523859-32374-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 21:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238112

Changelog:
    Makefile.in: Bump to 1.9.8
    pseudo_client.h: Fix typo in the comment
    client: permissions drop setuid and setgid
    tests: Add setuid permission check
    pseudo_client.h: Add +s to PSEUDO_DB_MODE for mkdir
    tests: Add test that returned stat is correct
    pseudo_client.h: Make it clear both macros must be updated together
    Makefile.in: Add pseudo_client.h as a dependency

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 22bb938..45407b5 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "5b7c4b59e7e198aab54b35ea194aeb6d99794f96"
-PV = "1.9.7"
+SRCREV = "823895ba708c63f6ae4dcbfc266210f26c02c698"
+PV = "1.9.8"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be
-- 
1.8.3.1


