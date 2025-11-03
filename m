Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE747CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 16:27:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1629.1762187233308950067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 08:27:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=0wGZrty2;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EFC9B4E414D5;
	Mon,  3 Nov 2025 16:27:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C76FB60628;
	Mon,  3 Nov 2025 16:27:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C591C10B501AC;
	Mon,  3 Nov 2025 17:27:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762187231; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sjRi6XtnpNmRqwheJmN9FfyTjjkhZJtpJwF97BOGlUQ=;
	b=0wGZrty2u9SqtKUc5ymlvfyyZvkd9Kd5+mp9IM3pnkc/ohmM3FmVgH6JL9fbNVbnAAvzIX
	/MTgUyIUkngzbceJIZ7vPr7/O4xT0j5AqP+Dz63ib5XpqDf9iCWQ6zK7F9DaAEC3yJ13hc
	Npa61lTEuqsxdf6tpVYGZE0yhRfFbPjRraKK4VcOThuVXI8mmYIRIVhrgt4M4kg8hZjnhA
	Z6vm0LxDuMuuINL9ehiZmZjuYukXA8o+zr7qtgk7BARH1WQEL3zpGcB1wzsxe3fwYgkwDp
	HAZL51jisWTliHiB+fAbDO3ShJWlgXiLnAdVxIDz2UWCa59v6r7jr2Zsq/0QJA==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v3 06/16] lib: oe: license: Add missing import
Date: Mon,  3 Nov 2025 17:26:32 +0100
Message-ID: <20251103162654.1714239-7-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103162654.1714239-1-kamel.bouhara@bootlin.com>
References: <20251103162654.1714239-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 16:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225673

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


