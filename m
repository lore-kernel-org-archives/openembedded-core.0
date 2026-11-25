Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45853.1795624775526895501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=DkHvJ3oQ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 219922F
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:32 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AFAA53F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624775; bh=UgtrpfS0F/IWT7B9+D2CZj/Y2ijirvJfEnjI/ouSPzI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DkHvJ3oQC3ENk/Sout7tQo7D+/zuu7juqZKEciXF8nAd/h0tPBhZZLzIyz86yhcgr
	 6my09z5jba3KIke/L0Dw7FUvGZJyZLeQmTp3heGOog3B9EgfnW1MAX++l+wX9A/lYP
	 0m7qguIbTyWb35J/OK0eoMM1j7NiVGgU7Hj+p+os=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/18] python3: merge -mime into -core
Date: Wed, 25 Nov 2026 16:39:15 +0000
Message-ID: <20261125163927.1835785-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251217
Content-Type: text/plain; charset="utf-8"

The -mime package contains a single quopri.py file, that is just 7kb and
pulled into a number of common modules.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/python3-manifest.json      | 22 +++++--------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 17477a54c72..2790851cf68 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -171,6 +171,7 @@
         "summary": "Python interpreter and core modules",
         "rprovides": [
             "fcntl",
+            "mime",
             "pkgutil",
             "stringold"
         ],
@@ -289,6 +290,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
             "${libdir}/python${PYTHON_MAJMIN}/platform.py",
             "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
+            "${libdir}/python${PYTHON_MAJMIN}/quopri.py",
             "${libdir}/python${PYTHON_MAJMIN}/re",
             "${libdir}/python${PYTHON_MAJMIN}/re/_casefix.py",
             "${libdir}/python${PYTHON_MAJMIN}/re/_compiler.py",
@@ -464,8 +466,7 @@
             "core",
             "datetime",
             "io",
-            "math",
-            "mime"
+            "math"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/email",
@@ -565,8 +566,7 @@
             "datetime",
             "email",
             "io",
-            "math",
-            "mime"
+            "math"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
@@ -583,15 +583,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/random.py"
         ]
     },
-    "mime": {
-        "summary": "Python MIME handling APIs",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/quopri.py"
-        ]
-    },
     "mmap": {
         "summary": "Python memory-mapped file support",
         "rdepends": [
@@ -628,7 +619,6 @@
             "logging",
             "mailbox",
             "math",
-            "mime",
             "mmap",
             "multiprocessing",
             "netclient",
@@ -686,8 +676,7 @@
             "datetime",
             "email",
             "io",
-            "math",
-            "mime"
+            "math"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/ftplib.py",
@@ -935,7 +924,6 @@
             "email",
             "html",
             "io",
-            "mime",
             "netclient",
             "netserver",
             "numbers",
--=20
2.43.0

