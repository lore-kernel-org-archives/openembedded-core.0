Return-Path: <tafil@tafhub.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323ADC5DF85
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 20:00:51 +0000 (UTC)
Received: from mail.tafhub.de (mail.tafhub.de [5.9.40.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17557.1787083245135946238
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 13:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tafhub.de header.s=dkim header.b=XVmOsVN7;
 spf=pass (domain: tafhub.de, ip: 5.9.40.180, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 391B32E41107;
	Tue, 18 Aug 2026 22:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1787083242; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=8ATv12AfGNbFFythFoGeVNpyILSrhA0C0TKyyr08sf4=;
	b=XVmOsVN7ZyJPe9lG9yt/6MyEi0WwJHtM2x6uQV27NWfpfwTJllbTucmq7bvV04+/Vnzerj
	GWx3N6kZ3GH+zMWDkm/x2aQhPbwOmq5o9UwY/EX0w1qgrr2EfhC5GQLSl+137Qm4cEUCO/
	w4INHo0NZu3U5UJAecJaMqTeU9AdfFyBWzdPz6i3Pl91b6ZKR3mgvHYStvEIFKEtm1AO3b
	wHgVJK/i2w3GIOwKgA3F3ZPdM7yMPEK46HMj/EicEEENWNo9B63NPqXqsz49AMBXwFYX2/
	l/Xx/0WoBM/N0SuGb71PXSXW6aAPIe+MpaSRl92m1WIdA/a8gEtZnAfPlbOWXA==
From: Tafil Avdyli <tafil@tafhub.de>
To: openembedded-core@lists.openembedded.org
Cc: Tafil Avdyli <tafil@tafhub.de>
Subject: [wrynose][PATCH 1/2] python3: add missing pyc files to core
Date: Tue, 18 Aug 2026 22:00:36 +0200
Message-ID: <20260818200037.7044-1-tafil@tafhub.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 20:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243693

Recently _ast_unparse, _py_warnings and annotationlib were added to
core. The corresponding .pyc files were omitted, resulting them to be
generated on the target.

Fixes: 01982411b5cc ("python3: add _py_warnings, annotationlib to core")
Fixes: 9dfe1e7722fc ("python3: add _ast_unparse to core")

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 300a0ba0bc96b66be63f8c4324342ed1a9ef3c73)
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

