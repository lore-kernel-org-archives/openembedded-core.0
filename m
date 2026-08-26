Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4874BC61DC4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:34:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7891.1787733244677110393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FxdXDJPs;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 04E104E413CA
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6C3B604EC
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 230D011C7AB70;
	Wed, 26 Aug 2026 10:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733238; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SHTX22zJqCn6tPKkqu7jlbnTsEs/Hh2n/KtIaU5xDQM=;
	b=FxdXDJPsO7nw6LnGShhaa0tCTrSjDA9zoBtcOa/qawa3N7xB7/MsSnrILRTC6MFrakJYU1
	gIUbKxEah+cs7me3YoBATjbDfgbzOa2xZEjLX+5ZtssM2AImAnwvBWPkX0uzYOYQRMrvtK
	uvXU5IH53RrYEBH/0Iq7SRroS7NzgDEBSvZsxEZ3Xy2sLFloT7133S3R/8TghGlvpl+315
	LPmFoW7xAe8PeTMlaIiQTfqRL+gXA9QeRmNDr+WfJsdRfFOsmfrX//sU2j7C1rwBmILRZV
	ZMTvhjGahnwPFE+mDvlZrUGFIytQWBAIvcpNrjiAvDBET/p12QJ9lN3Rbdb/kg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 26 Aug 2026 10:33:40 +0200
Subject: [PATCH 1/8] python3-imagesize: upgrade 2.0.0 -> 2.0.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-mathieu-updates-20260826-v1-1-4082bbc152f2@bootlin.com>
References: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
In-Reply-To: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787733232; l=1119;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=DGh+LRgNUizFxAw3i/gvhHT4qjvQU+AGjTSuaO3fjQQ=;
 b=DI3aCB8GnE4QxPDzqP4nOexmMv1Kkd7adXmWxKxS7P6I9LMlZXmiYFuBJ17xVqD04OTDiz2P0
 eJtzLV6FsEbBPTih9UZDpvTUSzF3xadVwKifYUaXmuyJLabahZ4ixAu
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244369

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../python/{python3-imagesize_2.0.0.bb => python3-imagesize_2.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb b/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb
similarity index 70%
rename from meta/recipes-devtools/python/python3-imagesize_2.0.0.bb
rename to meta/recipes-devtools/python/python3-imagesize_2.0.1.bb
index 7430130e5f03..f9c358125536 100644
--- a/meta/recipes-devtools/python/python3-imagesize_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-imagesize_2.0.1.bb
@@ -4,9 +4,9 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=0c128f0f7e8a02e1b83884c0b5a41cda"
 
-SRC_URI[sha256sum] = "8e8358c4a05c304f1fccf7ff96f036e7243a189e9e42e90851993c558cfe9ee3"
+SRC_URI[sha256sum] = "b2ba6a4dea487a7ebcd53248d3476aca449d30db12a2dde5e0c5ca9624fd77e5"
 
-inherit setuptools3 pypi
+inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
 

-- 
2.47.3


