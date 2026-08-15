Return-Path: <tafil@tafhub.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98D2C5CFC1
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 19:50:47 +0000 (UTC)
Received: from mail.tafhub.de (mail.tafhub.de [5.9.40.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14919.1786823439612851047
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 12:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tafhub.de header.s=dkim header.b=JRX3U9fF;
 spf=pass (domain: tafhub.de, ip: 5.9.40.180, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA10D2E40FB8;
	Sat, 15 Aug 2026 21:50:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1786823436; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=hkSMpZFGeNNRHtM4ME9w7GyRvYgfNn2E/nXoi5ovGYU=;
	b=JRX3U9fFz/LqoM4Qj7pWydwnJKxz4IhD32VNIQbw7WQZ+9TVRLAtDK5mhN8P43aY8dCP5Y
	QaK0js3mLEFlcJATfIWPrG4TXCeKROS/UBJICABdlBLyrZt3xC2TvOnB4Kp+atD73wFfS7
	ENwE2NbTesANtRGODNV5SCQhMwU9UtxbVoEeJ5e5ce7wfJTUhyVbAX6ydRNHHQ3c3bnVu6
	6Tu0b4/IZn4Gki4aaojKZJ9DVCo928CB3SeX7xRmNCnddWaBuNDsBODvxs9wld/XPi33bk
	KVKDPtTQ8EeJJoyWjwYKTJyjl6wFeHwErpA0hU83N8XW1GeAIY1/aX/sD+I0KA==
From: Tafil Avdyli <tafil@tafhub.de>
To: openembedded-core@lists.openembedded.org
Cc: Tafil Avdyli <tafil@tafhub.de>
Subject: [PATCH 1/2] python3: add missing pyc files to core
Date: Sat, 15 Aug 2026 21:49:47 +0200
Message-ID: <20260815194948.124291-1-tafil@tafhub.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2026 19:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243502

Recently _ast_unparse, _py_warnings and annotationlib were added to
core. The corresponding .pyc files were omitted, resulting them to be
generated on the target.

Fixes: 01982411b5cc ("python3: add _py_warnings, annotationlib to core")
Fixes: 9dfe1e7722fc ("python3: add _ast_unparse to core")

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 11ce2c97d2..5d46e4e8b9 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -324,16 +324,19 @@
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/__future__.*.p=
yc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_ast_unparse.*=
.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_bootlocale.*.=
pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_collections_a=
bc.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_colorize.*.py=
c",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compression.*=
.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_markupbase.*.=
pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_opcode_metada=
ta.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_py_warnings.*=
.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sitebuiltins.=
*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata=
*.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_weakrefset.*.=
pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/abc.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/annotationlib.=
*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/argparse.*.pyc=
",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ast.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bisect.*.pyc",

