Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3894C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:34:20 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7836.1787733254034977373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BZmbvY3K;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5E8094E413CA
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34297604EC
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39C4011C7AC89;
	Wed, 26 Aug 2026 10:34:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733247; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=32rCRj2+3//qevGENpyVMDO4W0Qo/VmFXmTTp+sP6Q0=;
	b=BZmbvY3Kz1nUK+aOvd/oxGs+EaQXQxygpJLvA3ylMaaum1c8KnEmRcdGsNHxCZfm5Q4Cse
	Eg2Lbz9hM8ElBSjd2BbzCeCMSumTy7hlF/n6wHbVVCooTG+Qmp+A7KzW7P9xRuJebfu9wS
	6gY4K9etlSj7UeqUSrc8kYsO5QYPhg+bAfKducdmZwtkh6x0C6p5Bfzvne6sv4KAp0yG1/
	w+zxVh6z6zo9t56oj4KT5WNW9vCWLe50fM/lE6bWRmWsghmstLgkVP1fLIb4vkch7iM6Bq
	Bh8S8/3I2X6iz+p0/t6kF//DeYnbeZKj02yB5c3/Lp1RzY/ezvCX8gHfO5Y2Vw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 26 Aug 2026 10:33:42 +0200
Subject: [PATCH 3/8] cmake,cmake-native: upgrade 4.4.2 -> 4.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-mathieu-updates-20260826-v1-3-4082bbc152f2@bootlin.com>
References: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
In-Reply-To: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787733232; l=1672;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=R8BVyTyK3zcHdekMeCTImv8KawSlnKFal6oHhPgkjJA=;
 b=XWSQsAOdFnFs3Sk8E1tN3JnoncjxXsEfZbJ9wK4T9va0O3YagYskVtnYHuAAPrECmIeANFIj5
 Qe9ys8SN2b+B8oMa9t4e9VTOfrio2GG6nUoVIsorU+uqECfSIyI5JxC
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244371

Changelog:

- Swift policy CMP0215's NEW behavior has been updated to require policies CMP0157 and CMP0195 to also be set to NEW.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../cmake/{cmake-native_4.4.2.bb => cmake-native_4.4.3.bb}              | 0
 meta/recipes-devtools/cmake/cmake.inc                                   | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.4.2.bb => cmake_4.4.3.bb}          | 0
 3 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.4.2.bb b/meta/recipes-devtools/cmake/cmake-native_4.4.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.4.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.4.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index a51b25b86475..b6b10371ceab 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "1db9e61e60b6e0874c86386340b910382f3c5e75b9fbfb44d122063129a2789d"
+SRC_URI[sha256sum] = "c46400618b4f1f2b43507f24fb22f3ae830c3416cf23b776e16e1d413aa892f0"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.4.2.bb b/meta/recipes-devtools/cmake/cmake_4.4.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.4.2.bb
rename to meta/recipes-devtools/cmake/cmake_4.4.3.bb

-- 
2.47.3


