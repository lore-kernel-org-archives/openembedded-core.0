Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45854.1795624776033655364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=hrvIewxn;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE457339
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:32 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 50A333F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624775; bh=fXOQf30aIh0HCcFtd7hVkHhXuMzk38Bt0p5RwJp+w18=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hrvIewxnC1GTygQVt0HJrLrXIcb4XjxohK6Zpew1Fj8Z3dYTsj+wfJkFUiHt50VJq
	 LApeFalRCnWnLOE8lrnqg29YHmV9nYnq6VohCaWdes+jdN1YTRkBnHbma1PT5XViuf
	 R+FlemFXVYdGBgrcoULB2hZc1lAeC6++okhQwLhA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/18] python3: package turtle and turtledemo into their own package
Date: Wed, 25 Nov 2026 16:39:16 +0000
Message-ID: <20261125163927.1835785-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251218
Content-Type: text/plain; charset="utf-8"

Instead of these sitting in -misc, put them into a -turtle package that
can only be installed if needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/python3-manifest.json             | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 2790851cf68..fb21c493f2f 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -638,6 +638,7 @@
             "threading",
             "tkinter",
             "tomllib",
+            "turtle",
             "unittest",
             "unixadmin",
             "venv",
@@ -856,6 +857,17 @@
             "${libdir}/python${PYTHON_MAJMIN}/tkinter"
         ]
     },
+    "turtle": {
+        "summary": "Turtle graphics",
+        "rdepends": [
+            "core",
+            "tkinter"
+        ],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/turtledemo/",
+            "${libdir}/python${PYTHON_MAJMIN}/turtle.py"
+        ]
+    },
     "tomllib": {
         "summary": "Provides an interface for parsing TOML",
         "rdepends": [
--=20
2.43.0

