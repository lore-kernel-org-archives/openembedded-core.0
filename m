Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BC5CCFA1F
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 13:15:21 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11092.1762521318650308410
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 05:15:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=HGEMeiiX;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5B04B1A1921;
	Fri,  7 Nov 2025 13:15:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A1E3606A6;
	Fri,  7 Nov 2025 13:15:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E814B118525C3;
	Fri,  7 Nov 2025 14:15:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762521316; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sjRi6XtnpNmRqwheJmN9FfyTjjkhZJtpJwF97BOGlUQ=;
	b=HGEMeiiXcMmGtMkdYz7nFABc8o6QKPj5zPHrrUBCTLs9VV53ErVsQRYkbm9Cbmv+dd07Hg
	uUby6w010oECw8qrMN4Nym+NZx+V4V8yBLyX1t2TdG6j0jgVcSTOSqobvYA09CGhy1ErQM
	ZX+kIeHumZiaBZ6a+pmipXK1otMSG2mxkcdr/KWL9A6NkAfVyRxclhgRLLRlpUk86QBJHt
	+IbYEJVSH4dVEUuA0z2MZkLdo/Ejr+pLfaSfQBKSWqMCHfRYJgZG21r2u6LLbVTIAL0g3f
	hdFsdcPj/gtvE2pak/03/BKrW06hBSjUgOc7i9UKbq/3vHQP8PygooQuYr0rqA==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v4 06/17] lib: oe: license: Add missing import
Date: Fri,  7 Nov 2025 14:14:40 +0100
Message-ID: <20251107131502.3857600-7-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
References: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 13:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226042

From: Joshua Watt <JPEWhacker@gmail.com>

The code in this file uses oe.qa, but it was not imported resulting an
an exception when a license error was detected

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e44cb7c5b7281d614ed51fdec06dad0a7211528a)
---
 meta/lib/oe/license.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index c1ae103b54..6ff7688d22 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -7,6 +7,7 @@
=20
 import ast
 import re
+import oe.qa
 from fnmatch import fnmatchcase as fnmatch
=20
 def license_ok(license, dont_want_licenses):
--=20
2.43.0


