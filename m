Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131D1C61DCB
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:34:21 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7896.1787733259759889963
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2QGE/EyR;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F11731A1838
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C784D604EC
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCAC011C7AC88;
	Wed, 26 Aug 2026 10:34:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733257; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rMGrAyLEll8RquRwrZ6/gy72Ma1YWC65rtXMTBiBH/E=;
	b=2QGE/EyRHeI+4PhxUNPr4r/RVG27xtMDzO1TrN2sz3kezsZi9khKfRNhaqbWm3sNpv2e3+
	6bw8ESbtCZkMhWLUoCnrxDByMCIkKW0ib1wIXB77uUD0a4EIezTyHtY+9FjZlYsqwyceIP
	J2jWCAJ++EWbAsoIk5TldFfwqqdUvqIDXKUlVjp6pgfCZsxPz4ZR0nI9G1+OPupxL38JtK
	MTH8OnImDRkVSInR+rFAQCvuR/6fF3bVoz4y+2d38Q0Ue98AkF/eHh+3C0vnh8IKAc/zDL
	b4CrJU9U56/8LnPcUk92itgF4XSKn5T9F8M5gSaAAaxuL/MZBh+bHpBOltMmGA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 26 Aug 2026 10:33:44 +0200
Subject: [PATCH 5/8] python3-git: upgrade 3.1.59 -> 3.1.60
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-mathieu-updates-20260826-v1-5-4082bbc152f2@bootlin.com>
References: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
In-Reply-To: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787733232; l=1294;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=u4/zuxbUkEpOTaca/JQFU+ZcTTCvyjgQrRUTnc0VMBo=;
 b=NYf+S+Hu4Et6bb700Eow/LrIU57VfA9lSCJ8o0m6FBRcdNDZo4/B8OuPTUCvDnUa1kyRKbH2U
 O2MV2+ZlTUNCDDKbvYlubQ0T1QnGikWLT1TTvsmoGN7pRgZaIDDBEbT
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244373

Changelog:

Security fixes for

* https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-g5vv-9gxw-82hx
* https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-whh4-5q6c-9v3x
* https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-239g-whfq-7xj9

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../python/{python3-git_3.1.59.bb => python3-git_3.1.60.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.59.bb b/meta/recipes-devtools/python/python3-git_3.1.60.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.59.bb
rename to meta/recipes-devtools/python/python3-git_3.1.60.bb
index 92e5977789f7..5becc0af58c9 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.59.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.60.bb
@@ -14,7 +14,7 @@ CVE_PRODUCT = "gitpython_project:gitpython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "0a1475cfdc38a5bfba1a3e9a4a9da52a39749ecec322b772915c019f94e5b7e4"
+SRC_URI[sha256sum] = "e936431879fa85581b4311fa63492ea52251909e2d655b6529c704c904ddcc24"
 
 DEPENDS += " python3-gitdb"
 

-- 
2.47.3


