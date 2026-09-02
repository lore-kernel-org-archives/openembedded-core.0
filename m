Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871C5C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 12:21:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11536.1788351688980485244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 05:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LxrFcp6F;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A6FF41A1957
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 12:21:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6950B6053C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 12:21:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82DBA11C79293;
	Wed,  2 Sep 2026 14:21:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788351686; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=+T8igUfDQbPC+O3jpvrPCVFE/Xm7A4pQcTDq0nYYIDE=;
	b=LxrFcp6FVHuU82WoDv3+nSvYoGGFSE7PitratGpLdD3jBV1zPv4skkc137Hsv+1JsAaZ/X
	RI0M+C9CpJ0OEW5Nsqv54ve4lU1bLtdY6a0GWtOl9vvY+mqLjGAr/2Dw8RuGR+SZVEWn9o
	H2d+9DLpsI8OsBLl41jdeeF07W3mvATlynoSbvSkSTOZSud7cP15WGd4aUg7L9pn516Scr
	XSJkMBO2fldfzCftT0FtJvcpovs/LJ9g6Bkg0XCwRxRHEx7yFU5ldhZ1ZHUD7Z68z2RU4s
	UiYxpd7+9lmsAu6pYibVl5X0DWOECc6Iqe5Z/XrVRTSxVh3k38PaDkYnbAVJ0g==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 02 Sep 2026 14:21:17 +0200
Subject: [PATCH] python3-shacl2code: upgrade 1.2.0 -> 1.3.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mathieu-python3-shacl2code-1-3-2-v1-1-765805e89a5c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIALwUmGoC/x3NQQqDMBBA0avIrB1IRqikVykuknHaDLSJJCoW8
 e4NXb7N/ydUKSoV7t0JRXatmlOD7Tvg6NNLUOdmIEM34wzhx69RZcPlu8acBqzR85s4z4IWByR
 0FEY7snEhMLTMUuSpx3/xmK7rB7jUcvRyAAAA
X-Change-ID: 20260902-mathieu-python3-shacl2code-1-3-2-92b717c09bbc
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788351684; l=1238;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=vH29U3LXaLY9lzQFufdlNd3gJb8diF6tfELGbcygts0=;
 b=1jxo+8a49b3Km3VM14IH1R4Ck5ICOnrzPqY2yPOVkdDxDdcFXEBO0zO/ls7HJ1xFMgzq+J+Is
 tNDXx1zJHBDDwmEfxRFtvM6Wpmh5l9Eutn7XVRpTyoASryDZH+/PO5z
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 12:21:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244941

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../python/{python3-shacl2code_1.2.0.bb => python3-shacl2code_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-shacl2code_1.2.0.bb b/meta/recipes-devtools/python/python3-shacl2code_1.3.2.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-shacl2code_1.2.0.bb
rename to meta/recipes-devtools/python/python3-shacl2code_1.3.2.bb
index 6956aad6189c..f43f49f1f092 100644
--- a/meta/recipes-devtools/python/python3-shacl2code_1.2.0.bb
+++ b/meta/recipes-devtools/python/python3-shacl2code_1.3.2.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0582f358628f299f29c23bf5fb2f73c9"
 
 PYPI_PACKAGE = "shacl2code"
-SRC_URI[sha256sum] = "92c5bb633b232bb914699157b3e79796aaf1672f22c0cac0cc633f353aa8a398"
+SRC_URI[sha256sum] = "2dd0b7a4fd50958d0783764da6ca9ede1805ccdd22b6bed3afbf89136e8962be"
 
 inherit pypi python_hatchling
 

---
base-commit: dcd8e6d6703e2d5baf82f0b2e846d977c0c5844f
change-id: 20260902-mathieu-python3-shacl2code-1-3-2-92b717c09bbc

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


