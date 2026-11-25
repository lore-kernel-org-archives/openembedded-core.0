Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45906.1795624781093313237
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=B2xqhZog;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEF422F
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:37 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 58A653F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624780; bh=7BXtHXlquCQvEQCcRbsDbRFBv3TdG1ZDuwVOb0vYV1o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=B2xqhZogc/w2vu1Xb1YuK0SlJeTD+3hspZ6ZLo9QSaE1CFWk9mVWqoNEjSYA4mrJS
	 16LG2WosMSgjOGuzAb7KVGEEVT8V9qOxvvoN+liRXLvtjK09y572XezmZUzX9ZoxNH
	 F8jBkyUfpzfZCSCxh2GPVDE1ahJBaPePp/95MiJA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/18] python3: move the rest of -misc to other packages
Date: Wed, 25 Nov 2026 16:39:24 +0000
Message-ID: <20261125163927.1835785-15-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251226
Content-Type: text/plain; charset="utf-8"

This empties the -misc package.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/python3-manifest.json      | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index e49216beefd..55a0672ccb9 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -419,6 +419,7 @@
             "core"
         ],
         "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/_pydatetime.py",
             "${libdir}/python${PYTHON_MAJMIN}/_strptime.py",
             "${libdir}/python${PYTHON_MAJMIN}/calendar.py",
             "${libdir}/python${PYTHON_MAJMIN}/datetime.py"
@@ -448,7 +449,8 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/bdb.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_remote_debugg=
ing.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/pdb.py"
+            "${libdir}/python${PYTHON_MAJMIN}/pdb.py",
+            "${libdir}/python${PYTHON_MAJMIN}/sched.py"
         ]
     },
     "dev": {
@@ -671,10 +673,12 @@
     "netclient": {
         "summary": "Python Internet Protocol clients",
         "rdepends": [
+            "compression",
             "core",
             "crypt",
             "datetime",
-            "email"
+            "email",
+            "shell"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/ftplib.py",
@@ -683,11 +687,13 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hmac.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_uuid.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/mimetypes.py",
+            "${libdir}/python${PYTHON_MAJMIN}/netrc.py",
             "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
             "${libdir}/python${PYTHON_MAJMIN}/secrets.py",
             "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
             "${libdir}/python${PYTHON_MAJMIN}/urllib",
-            "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
+            "${libdir}/python${PYTHON_MAJMIN}/uuid.py",
+            "${libdir}/python${PYTHON_MAJMIN}/webbrowser.py"
         ]
     },
     "netserver": {
@@ -736,7 +742,8 @@
     "profile": {
         "summary": "Python basic performance profiling support",
         "rdepends": [
-            "core"
+            "core",
+            "pickle"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/cProfile.py",
@@ -744,7 +751,10 @@
             "${libdir}/python${PYTHON_MAJMIN}/profile.py",
             "${libdir}/python${PYTHON_MAJMIN}/profiling",
             "${libdir}/python${PYTHON_MAJMIN}/profiling/tracing",
-            "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
+            "${libdir}/python${PYTHON_MAJMIN}/pstats.py",
+            "${libdir}/python${PYTHON_MAJMIN}/timeit.py",
+            "${libdir}/python${PYTHON_MAJMIN}/trace.py",
+            "${libdir}/python${PYTHON_MAJMIN}/tracemalloc.py"
         ]
     },
     "pydoc": {
--=20
2.43.0

