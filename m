Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45850.1795624773077596197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=uclZXzgN;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7DFC339
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:29 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 436EB3F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624772; bh=5jLZAYnzxvlJ9KKvwoNRyBK5yEm2i5IQ8/AfA9IXsI0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uclZXzgN6Gpsw9H7BxjMwi1594I0M9mYQJYLZXhJ94VUrLGBRzhnHohu12bvdX1Ro
	 rbq4tXi3bf4wR/hkr3Enz73pjRWkuXtsErpHHH9ev6n0kibs8dJ61O24+R/aW1ds8N
	 I1x/AokeHatuw+Y0pWDlJi87WXb+4UwBVKyTUlf0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/18] python3: remove non-existing and duplicate files from manifest
Date: Wed, 25 Nov 2026 16:39:11 +0000
Message-ID: <20261125163927.1835785-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251213
Content-Type: text/plain; charset="utf-8"

These were always redundant (no .so in pycache, or duplicates) and are
more redundant now that .pyc packaging is automatic.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/python3-manifest.json        | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index e425b3d4347..e48de787b0d 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -117,7 +117,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/asyncio",
             "${libdir}/python${PYTHON_MAJMIN}/concurrent",
             "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_asyncio.*.so"=
,
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_interpchannel=
s.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_interpqueues.=
*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_interpreters.=
*.so"
@@ -254,14 +253,9 @@
             "${libdir}/python${PYTHON_MAJMIN}/io.py",
             "${libdir}/python${PYTHON_MAJMIN}/ipaddress.py",
             "${libdir}/python${PYTHON_MAJMIN}/keyword.py",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/_s=
truct.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/bi=
nascii.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/ti=
me.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/xr=
eadlines.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bisect.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_csv.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_heapq.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_interpreters.=
*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_math_integer.=
*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixsubproce=
ss.*.so",
@@ -711,7 +705,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/ftplib.py",
             "${libdir}/python${PYTHON_MAJMIN}/hmac.py",
             "${libdir}/python${PYTHON_MAJMIN}/http",
-            "${libdir}/python${PYTHON_MAJMIN}/http/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hmac.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_uuid.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/mimetypes.py",
@@ -790,7 +783,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/profile.py",
             "${libdir}/python${PYTHON_MAJMIN}/profiling",
             "${libdir}/python${PYTHON_MAJMIN}/profiling/tracing",
-            "${libdir}/python${PYTHON_MAJMIN}/profiling/tracing/_utils.p=
y",
             "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
         ]
     },
@@ -853,8 +845,7 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/string",
-            "${libdir}/python${PYTHON_MAJMIN}/string/__pycache__"
+            "${libdir}/python${PYTHON_MAJMIN}/string"
         ]
     },
     "syslog": {
@@ -921,8 +912,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/unittest",
-            "${libdir}/python${PYTHON_MAJMIN}/unittest/",
-            "${libdir}/python${PYTHON_MAJMIN}/unittest/__pycache__"
+            "${libdir}/python${PYTHON_MAJMIN}/unittest/"
         ]
     },
     "unixadmin": {
@@ -978,8 +968,7 @@
             "xml"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc",
-            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc/__pycache__"
+            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc"
         ]
     },
     "zipapp": {
--=20
2.43.0

