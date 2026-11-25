Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45852.1795624774791180132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=vmm9qfQf;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80740339
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:31 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1A0663F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624774; bh=1XUBY+jKHrcb9CTlIc0EJ1kzk9wrCCxqxhNIPaqrEYY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vmm9qfQfbwaVfljQ86CFj4XqbNzAlFEvWQRfSXrk4QZz0iT/h3aoSGLU4a2C7MM8u
	 n5KXgYHAjZqWZWqAeHq58w9GsQGw+gianMP7+W/7Uu9Za2XQK179AKBqPOFcNpVHBj
	 GgJkIirocw/ktqfAOcljLn9mkCmmlC3sIs061WzU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/18] python3: move base64 into -core
Date: Wed, 25 Nov 2026 16:39:14 +0000
Message-ID: <20261125163927.1835785-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251216
Content-Type: text/plain; charset="utf-8"

There are a lot of dependencies on the netclient package (1.2MB) simply
for the base64 module (22K). Move this into core and refresh the
manifest.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/python3-manifest.json          | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 36bde979b24..17477a54c72 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -109,7 +109,6 @@
             "debugger",
             "io",
             "logging",
-            "netclient",
             "numbers"
         ],
         "files": [
@@ -216,6 +215,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/annotationlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/argparse.py",
             "${libdir}/python${PYTHON_MAJMIN}/ast.py",
+            "${libdir}/python${PYTHON_MAJMIN}/base64.py",
             "${libdir}/python${PYTHON_MAJMIN}/bisect.py",
             "${libdir}/python${PYTHON_MAJMIN}/code.py",
             "${libdir}/python${PYTHON_MAJMIN}/codecs.py",
@@ -399,7 +399,6 @@
             "json",
             "logging",
             "math",
-            "netclient",
             "numbers",
             "pprint",
             "shell"
@@ -450,7 +449,6 @@
             "json",
             "logging",
             "math",
-            "netclient",
             "numbers",
             "pprint",
             "shell",
@@ -467,8 +465,7 @@
             "datetime",
             "io",
             "math",
-            "mime",
-            "netclient"
+            "mime"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/email",
@@ -526,8 +523,7 @@
         "rdepends": [
             "compression",
             "core",
-            "math",
-            "netclient"
+            "math"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_pyio.py",
@@ -570,8 +566,7 @@
             "email",
             "io",
             "math",
-            "mime",
-            "netclient"
+            "mime"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
@@ -695,7 +690,6 @@
             "mime"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/base64.py",
             "${libdir}/python${PYTHON_MAJMIN}/ftplib.py",
             "${libdir}/python${PYTHON_MAJMIN}/hmac.py",
             "${libdir}/python${PYTHON_MAJMIN}/http",
@@ -890,7 +884,6 @@
             "difflib",
             "io",
             "logging",
-            "netclient",
             "numbers",
             "pprint"
         ],
--=20
2.43.0

