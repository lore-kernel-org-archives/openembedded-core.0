Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EACEC48292
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 20:47:13 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.6776.1706820429588762429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 12:47:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net ([70.99.78.136])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 411Kk16r007767;
	Thu, 1 Feb 2024 14:46:02 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com, raj.khem@gmail.com, jon.mason@arm.com
Subject: [PATCH v2 4/4] tune-cortexr52: Add hard-float variant
Date: Thu,  1 Feb 2024 14:45:53 -0600
Message-Id: <1706820353-6967-5-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1706820353-6967-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1706820353-6967-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 20:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194749

From: Mark Hatle <mark.hatle@amd.com>

Add the ability to specify cortexr52hf to get a version that enables the
hard-float calling convention.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
index 02507d9b78..89f0e09450 100644
--- a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
+++ b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
@@ -13,3 +13,8 @@ ARMPKGARCH:tune-cortexr52               = "cortexr52"
 # We do not want -march since -mcpu is added above to cover for it
 TUNE_FEATURES:tune-cortexr52            = "aarch64 crc simd cortexr52"
 PACKAGE_EXTRA_ARCHS:tune-cortexr52      = "${PACKAGE_EXTRA_ARCHS:tune-armv8r-crc-simd} cortexr52"
+
+AVAILTUNES                             += "cortexr52hf"
+ARMPKGARCH:tune-cortexr52hf             = "cortexr52"
+TUNE_FEATURES:tune-cortexr52hf          = "${TUNE_FEATURES:tune-cortexr52} callconvention-hard"
+PACKAGE_EXTRA_ARCHS:tune-cortexr52hf    = "cortexr52hf"
-- 
2.34.1


