Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97B7C48291
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 23:29:57 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.3186.1706743790597051913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 15:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net ([70.99.78.136])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 40VNTmKb018330
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 17:29:50 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] tune-cortexr52: Add hard-float variant
Date: Wed, 31 Jan 2024 17:29:43 -0600
Message-Id: <1706743783-10659-5-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1706743783-10659-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1706743783-10659-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 23:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194542

From: Mark Hatle <mark.hatle@amd.com>

Add the ability to specify cortexr52hf to get a version that enables the
hard-float calling convention.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
index 3a97cf8ee8..32ad30c4ea 100644
--- a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
+++ b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
@@ -12,3 +12,8 @@ AVAILTUNES                             += "cortexr52"
 ARMPKGARCH:tune-cortexr52               = "cortexr52"
 TUNE_FEATURES:tune-cortexr52            = "${TUNE_FEATURES:tune-armv8r-crc-simd} cortexr52"
 PACKAGE_EXTRA_ARCHS:tune-cortexr52      = "${PACKAGE_EXTRA_ARCHS:tune-armv8r-crc-simd} cortexr52"
+
+AVAILTUNES                             += "cortexr52hf"
+ARMPKGARCH:tune-cortexr52hf             = "cortexr52"
+TUNE_FEATURES:tune-cortexr52hf          = "${TUNE_FEATURES:tune-cortexr52} callconvention-hard"
+PACKAGE_EXTRA_ARCHS:tune-cortexr52hf    = "cortexr52hf"
-- 
2.34.1


