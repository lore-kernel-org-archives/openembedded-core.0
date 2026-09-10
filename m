Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BD4C79FBF
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 11:04:31 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11254.1789038258988371647
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 04:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=c2tDEq1U;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A7015C2C672
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:04:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5FF93602B8
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:04:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADEF311C782AD;
	Thu, 10 Sep 2026 13:04:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789038252; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FE3CGzfFYWrYuqq1HIZIjHQKZQqR022ZueC+VYm9PTg=;
	b=c2tDEq1UMU2htcilUBTalMr1rTUuhs14WtofL07k4K+2SE4bDqq1MfrjvYt/En5MOqkHSm
	Q4gmUfqcNCGiYdOzRezRNaigwjfGTrdMxklyuMNbF6n35juh+RkJ1T5Ytnd8IRRcje4Zw4
	PtNrJ4abyrnovOCeHR5lql9mJqbJd9se041V/Km3cpG0/SoiQylW6vH5fcdgNOUGUcsxRC
	d7h6Y6Sh2vzVCZhzIdNgcS6dHe2ds9ohr3f35yjcgXuqjGOVmwFHN7vlAQjfAo4A3BRXoX
	LZE5OQziaPHJMZE+nvZXH+uJeH0x8c2aZKop6QzivQWqzwAUTl1OqJe+peoAvQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Thu, 10 Sep 2026 13:03:55 +0200
Subject: [PATCH 2/7] python3-kirk: upgrade 4.1.0 -> 4.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-mathieu-updates-2026-09-10-v1-2-da1b555eace9@bootlin.com>
References: <20260910-mathieu-updates-2026-09-10-v1-0-da1b555eace9@bootlin.com>
In-Reply-To: <20260910-mathieu-updates-2026-09-10-v1-0-da1b555eace9@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789038241; l=1062;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=9NZbWeR+LOcpAvRqchkN5fgeRVfzBaRkF1WYVjMjN6k=;
 b=eUnbTKGmuBi08x7l8mJib4CcbhFsHACyYz7iuickjJEMrKoJGGEESAKC9SMQBHO0evM0Yntox
 KrSLz8XoScUBSuiEo50Y/pMJLNyKx4xZApT8qcIj0SLigS3zxcIvJvK
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245552

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../python3-kirk/{python3-kirk_4.1.0.bb => python3-kirk_4.2.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb b/meta/recipes-extended/python3-kirk/python3-kirk_4.2.0.bb
similarity index 85%
rename from meta/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb
rename to meta/recipes-extended/python3-kirk/python3-kirk_4.2.0.bb
index f9b478ca8d82..d6128292554f 100644
--- a/meta/recipes-extended/python3-kirk/python3-kirk_4.1.0.bb
+++ b/meta/recipes-extended/python3-kirk/python3-kirk_4.2.0.bb
@@ -7,7 +7,7 @@ SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
 
-SRC_URI[sha256sum] = "dc4dc4fa8994b14565a3d4f31bb79d6d27102ecbbd4feaef4ebc1e10e9cbace3"
+SRC_URI[sha256sum] = "92007f840a2a0af387b6f0d88f51f5c710853238ff3bd9d2b91a34f731739c06"
 
 inherit pypi python_setuptools_build_meta
 

-- 
2.47.3


