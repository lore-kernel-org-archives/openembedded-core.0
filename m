Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3909AC3DA7E
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 16:22:50 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.64843.1722010961654962818
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 09:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46QGMcnr026618
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 11:22:41 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 8/8] pseudo: Update to include open symlink handling bugfix
Date: Fri, 26 Jul 2024 11:22:38 -0500
Message-Id: <1722010958-23635-8-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722010958-23635-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1722010958-23635-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 16:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202557

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to a new revision which includes "Bugfix for Linux open(O_CREAT|O_EXCL)"

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 92a9710ec88c8729fa3d83baa2e63dd74d95cdf8)
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 5f32b37..7d8f71f 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "e11ae91da7d0711f5e33ea9dfbf1875dde3c1734"
+SRCREV = "374089f2ed83da4d0d4e58df067142ff99c7eb12"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 
-- 
1.8.3.1


