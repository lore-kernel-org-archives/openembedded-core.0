Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC35C761AE
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 23:39:57 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.34063.1750203587545789849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 16:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55HNdjaS026548
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 18:39:47 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/7] features_check.bbclass: Add support for required TUNE_FEATURES
Date: Tue, 17 Jun 2025 18:39:42 -0500
Message-Id: <1750203584-32065-6-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1750203584-32065-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1750203584-32065-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 23:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218951

From: Mark Hatle <mark.hatle@amd.com>

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 meta/classes-recipe/features_check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/features_check.bbclass b/meta/classes-recipe/features_check.bbclass
index 4e122ecaef..1e0eaa4eed 100644
--- a/meta/classes-recipe/features_check.bbclass
+++ b/meta/classes-recipe/features_check.bbclass
@@ -21,7 +21,7 @@ python () {
 
     unused = True
 
-    for kind in ['DISTRO', 'MACHINE', 'COMBINED', 'IMAGE']:
+    for kind in ['DISTRO', 'MACHINE', 'COMBINED', 'IMAGE', 'TUNE']:
         if d.getVar('ANY_OF_' + kind + '_FEATURES') is None and not d.hasOverrides('ANY_OF_' + kind + '_FEATURES') and \
            d.getVar('REQUIRED_' + kind + '_FEATURES') is None and not d.hasOverrides('REQUIRED_' + kind + '_FEATURES') and \
            d.getVar('CONFLICT_' + kind + '_FEATURES') is None and not d.hasOverrides('CONFLICT_' + kind + '_FEATURES'):
-- 
2.34.1


