Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4157CCCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 07:10:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.12491.1760944235566335573
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 00:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=q31VtpUd;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4619C1A13A6
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 07:10:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1B8D9606D5;
	Mon, 20 Oct 2025 07:10:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07513102F23A5;
	Mon, 20 Oct 2025 09:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760944229; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sjRi6XtnpNmRqwheJmN9FfyTjjkhZJtpJwF97BOGlUQ=;
	b=q31VtpUdqyDyPkyp22PYjc89yhDBOfYIF6LuhLCrb6lU87IeeVrmYsfhxU+5i19tjKb7S5
	NnnMRO3O04CJNpj47egWWaZe5exLVqF+3RM8+SYgylJi715ZrHRAq0wXxZjmvhGZBOYrS5
	hHQCyeRJjBizpZtd8cKrpoO3H4lMlYxvnrPu85fAxf8VPPWs92zuFUB9Z7Qv1LF43vFRnj
	Ir9LTDFEST8C9grKat/IOpuYrUdQHq6sbMQ1SHnLboZ6tHw3SMsg01CrfZPPTQEmBIwgYy
	gIR/X750TA7n6aX1uZh4lbq0aXEWhQe8RPD8zY7VNOMxKdLeY5wozfekq5LSDg==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v2 05/11] lib: oe: license: Add missing import
Date: Mon, 20 Oct 2025 09:09:45 +0200
Message-ID: <20251020070952.942165-6-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
References: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 07:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225103

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


