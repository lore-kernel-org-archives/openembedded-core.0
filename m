Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91ADECD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 19:53:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5897.1778701995512046518
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 12:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1vPDxN/s;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E43D31A35A6;
	Wed, 13 May 2026 19:53:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BAC2D5FE21;
	Wed, 13 May 2026 19:53:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0C71D11AF9040;
	Wed, 13 May 2026 21:53:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778701992; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RNH0ndtyBNa/6W8MZcaTxXiH6Gt2CSjN7jasVwAqGe4=;
	b=1vPDxN/s7SMJSLbqwsrqHUlpELyEacU2cuCBeQUijH/y6IIAc/SyDbnCqksbCnWWZ2aytE
	ah1pP/vC/sb59LJ609GTfObQd6/V7So4dG7YqNBa1i5cfCWCBo6bNMCYXBJXTJ+angD/3p
	msifNC1Xj4NGRGhhMIfyDydGSbFddyly/ZEfLjddJnQP5Rwnpy7TDPxM9wF0ioWKhqhop+
	XsQmc4GzXs0+80yt1JjaH2JlrjcZil9ZGbxdyBEOCMSampqsVfGXIvZal8YlJgKAiYKd3P
	jPo3nywe3EXHDsTEhbrGvMaeTXSzWymLql0MTfBTbtVH39w6iYJNRcv0K2hA8w==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Wed, 13 May 2026 21:53:00 +0200
Subject: [wrynose][PATCH 2/3] sbom-cve-check-update-cvelist-native: Update
 source revision
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-update-sbom-cve-check-wrynose-v1-2-e6e368932274@bootlin.com>
References: <20260513-update-sbom-cve-check-wrynose-v1-0-e6e368932274@bootlin.com>
In-Reply-To: <20260513-update-sbom-cve-check-wrynose-v1-0-e6e368932274@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 19:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237004

Update source revision to cve_2026-05-07_1300Z

(cherry picked from commit 0c28104d4607513f4b6d4b7f845aabd2c9f1be61)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 .../sbom-cve-check/sbom-cve-check-update-cvelist-native.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
index 338712216590..3763e7f21f7a 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-# 2026-03-19_baseline
-SRCREV = "ada54ee3cc8380820aa45e4996910bdc9dcb94e7"
+# cve_2026-05-07_1300Z
+SRCREV = "dd0e93c75034d0167498174c886a56729edc44de"
 
 require sbom-cve-check-update-db.inc

-- 
2.54.0


