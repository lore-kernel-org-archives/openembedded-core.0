Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45859.1795624779790641736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=JGYRJZkM;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E10D339
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:36 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1A7B33F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624779; bh=bxsNQfqrlOHcHP9zZWvLqARqMYuiHrLdlSH88Zcul24=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JGYRJZkMjY9mSI+IDlwUBCsXLQEkpTEprHcZI8rmoWhkOUKIL0c/vo34ZXfux0IPe
	 R00eGTPRPt57ieWwynMU+ks4Kxd4UITMlV4l1yBxSiJMwvorcOUZsGjwUMGM5jpW7z
	 ON7lMC8X1zK/cwxpARLP0jXSisw6TSD67r+tbA2Y=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/18] python3: merge -numbers into -core
Date: Wed, 25 Nov 2026 16:39:22 +0000
Message-ID: <20261125163927.1835785-13-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251224
Content-Type: text/plain; charset="utf-8"

A large amount of the standard library uses this, so there's no real
point in splitting it out.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/python3-manifest.json      | 33 ++++++-------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 68d0a1750f7..aee6fbe6432 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -113,8 +113,7 @@
         "rdepends": [
             "core",
             "debugger",
-            "logging",
-            "numbers"
+            "logging"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/asyncio",
@@ -180,6 +179,7 @@
             "io",
             "math",
             "mime",
+            "numbers",
             "pkgutil",
             "stringold"
         ],
@@ -224,7 +224,9 @@
             "${libdir}/python${PYTHON_MAJMIN}/_opcode_metadata.py",
             "${libdir}/python${PYTHON_MAJMIN}/_py_abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/_py_warnings.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_pydecimal.py",
             "${libdir}/python${PYTHON_MAJMIN}/_pyio.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_pylong.py",
             "${libdir}/python${PYTHON_MAJMIN}/_pyrepl",
             "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/pager.py",
             "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.py",
@@ -245,10 +247,12 @@
             "${libdir}/python${PYTHON_MAJMIN}/collections/abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/configparser.py",
             "${libdir}/python${PYTHON_MAJMIN}/contextlib.py",
+            "${libdir}/python${PYTHON_MAJMIN}/contextvars.py",
             "${libdir}/python${PYTHON_MAJMIN}/copy.py",
             "${libdir}/python${PYTHON_MAJMIN}/copyreg.py",
             "${libdir}/python${PYTHON_MAJMIN}/csv.py",
             "${libdir}/python${PYTHON_MAJMIN}/dataclasses.py",
+            "${libdir}/python${PYTHON_MAJMIN}/decimal.py",
             "${libdir}/python${PYTHON_MAJMIN}/dis.py",
             "${libdir}/python${PYTHON_MAJMIN}/encodings",
             "${libdir}/python${PYTHON_MAJMIN}/encodings/aliases.py",
@@ -257,6 +261,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/enum.py",
             "${libdir}/python${PYTHON_MAJMIN}/fileinput.py",
             "${libdir}/python${PYTHON_MAJMIN}/fnmatch.py",
+            "${libdir}/python${PYTHON_MAJMIN}/fractions.py",
             "${libdir}/python${PYTHON_MAJMIN}/functools.py",
             "${libdir}/python${PYTHON_MAJMIN}/genericpath.py",
             "${libdir}/python${PYTHON_MAJMIN}/getopt.py",
@@ -278,6 +283,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/keyword.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bisect.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_csv.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_decimal.*.so"=
,
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_heapq.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_math_integer.=
*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.so",
@@ -306,6 +312,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/new.py",
             "${libdir}/python${PYTHON_MAJMIN}/ntpath.py",
             "${libdir}/python${PYTHON_MAJMIN}/nturl2path.py",
+            "${libdir}/python${PYTHON_MAJMIN}/numbers.py",
             "${libdir}/python${PYTHON_MAJMIN}/opcode.py",
             "${libdir}/python${PYTHON_MAJMIN}/operator.py",
             "${libdir}/python${PYTHON_MAJMIN}/optparse.py",
@@ -435,7 +442,6 @@
             "core",
             "json",
             "logging",
-            "numbers",
             "pprint",
             "shell"
         ],
@@ -483,7 +489,6 @@
             "difflib",
             "json",
             "logging",
-            "numbers",
             "pprint",
             "shell",
             "unittest"
@@ -620,7 +625,6 @@
             "multiprocessing",
             "netclient",
             "netserver",
-            "numbers",
             "pickle",
             "plistlib",
             "pprint",
@@ -695,20 +699,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/socketserver.py"
         ]
     },
-    "numbers": {
-        "summary": "Python number APIs",
-        "rdepends": [
-            "core"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/_pydecimal.py",
-            "${libdir}/python${PYTHON_MAJMIN}/contextvars.py",
-            "${libdir}/python${PYTHON_MAJMIN}/decimal.py",
-            "${libdir}/python${PYTHON_MAJMIN}/fractions.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_decimal.*.so"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/numbers.py"
-        ]
-    },
     "pickle": {
         "summary": "Python serialisation/persistence support",
         "rdepends": [
@@ -800,8 +790,7 @@
     "statistics": {
         "summary": "Basic statistics module",
         "rdepends": [
-            "core",
-            "numbers"
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_statistics.*.=
so",
@@ -874,7 +863,6 @@
             "core",
             "difflib",
             "logging",
-            "numbers",
             "pprint"
         ],
         "files": [
@@ -925,7 +913,6 @@
             "html",
             "netclient",
             "netserver",
-            "numbers",
             "pydoc",
             "xml"
         ],
--=20
2.43.0

