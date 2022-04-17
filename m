Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDA3C4167D
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.25279.1650160218086031836
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 18:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=YFEqc6YF;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1650160218;
  x=1681696218;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ElrcSn2824v3OUvCLjaubGCoYyWJrv9aeu2E2rZ3JcQ=;
  b=YFEqc6YFUQ23lg15iIDSqf1TGmlCYeZOtel6ABsC2IVAh3LX1KCf8G+M
   qDxZFCeO3u8O9+ZwEpVuME0pF9X1crM3ShASoFKDwdIBvhGHnp0HJQBtJ
   NdElrp2j/aBuvcm2891I7BjU4sUp7rxlGigrzrEqoC8zaBvz4iMx+HhZR
   DKUVbK+aO8Shzg0x7y87d8ZFk3Bl9GVj6EgLUK3uzWLZ2qXfVvE1pc9of
   IQZc5O+RtTmWjboYLHDcVlocLyukq4xwikYn3GHQ8bLh74MK+mNWNI5Nv
   r2Jv0O8x1lqplD/Dz+cNpka2FnX4fF1DZNlm8EeNVa+wMDVbS8UHFrtnO
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] u-boot: Correct the SRC_URI
Date: Sun, 17 Apr 2022 03:50:11 +0200
Message-ID: <20220417015012.2617-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164567

This avoids a redirect.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 8e78ea4a75..488b923737 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,8 +14,7 @@ PE = "1"
 # repo during parse
 SRCREV = "d637294e264adfeb29f390dfc393106fd4d41b17"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
-          "
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"

