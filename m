Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A34C48295
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 20:47:13 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.6777.1706820430272011863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 12:47:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net ([70.99.78.136])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 411Kk16q007767;
	Thu, 1 Feb 2024 14:46:02 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com, raj.khem@gmail.com, jon.mason@arm.com
Subject: [PATCH v2 3/4] tune-cortexr5: Add hard-float variant
Date: Thu,  1 Feb 2024 14:45:52 -0600
Message-Id: <1706820353-6967-4-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1706820353-6967-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1706820353-6967-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 20:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194750

From: Mark Hatle <mark.hatle@amd.com>

Add the ability to specify cortexr5hf to get a version that enables the
hard-float calling convention.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/conf/machine/include/arm/armv7r/tune-cortexr5.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/machine/include/arm/armv7r/tune-cortexr5.inc b/meta/conf/machine/include/arm/armv7r/tune-cortexr5.inc
index ecaaa0d846..4c8985292b 100644
--- a/meta/conf/machine/include/arm/armv7r/tune-cortexr5.inc
+++ b/meta/conf/machine/include/arm/armv7r/tune-cortexr5.inc
@@ -12,3 +12,8 @@ AVAILTUNES                            += "cortexr5"
 ARMPKGARCH:tune-cortexr5               = "cortexr5"
 TUNE_FEATURES:tune-cortexr5            = "${TUNE_FEATURES:tune-armv7r-vfpv3d16} cortexr5 idiv"
 PACKAGE_EXTRA_ARCHS:tune-cortexr5      = "${PACKAGE_EXTRA_ARCHS:tune-armv7r-vfpv3d16} cortexr5-vfpv3d16"
+
+AVAILTUNES                            += "cortexr5hf"
+ARMPKGARCH:tune-cortexr5hf             = "cortexr5"
+TUNE_FEATURES:tune-cortexr5hf          = "${TUNE_FEATURES:tune-cortexr5} callconvention-hard"
+PACKAGE_EXTRA_ARCHS:tune-cortexr5hf    = "cortexr5hf-vfpv3d16"
-- 
2.34.1


