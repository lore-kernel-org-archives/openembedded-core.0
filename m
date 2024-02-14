Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C978C48BC4
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 11:37:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.39265.1707910611649393165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 03:36:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E5A91FB
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 03:37:32 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA0183F766
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 03:36:50 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: move dataclasses to python3-core
Date: Wed, 14 Feb 2024 11:36:49 +0000
Message-Id: <20240214113649.325415-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 11:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195471

From: Ross Burton <ross.burton@arm.com>

For some reason dataclasses was being packaged in the -profile subpackage=
,
which doesn't make sense as this is a core piece of the runtime support.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 771551cfc9d..a51392c5e34 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -250,6 +250,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/copy.py",
             "${libdir}/python${PYTHON_MAJMIN}/copyreg.py",
             "${libdir}/python${PYTHON_MAJMIN}/csv.py",
+            "${libdir}/python${PYTHON_MAJMIN}/dataclasses.py",
             "${libdir}/python${PYTHON_MAJMIN}/dis.py",
             "${libdir}/python${PYTHON_MAJMIN}/encodings",
             "${libdir}/python${PYTHON_MAJMIN}/encodings/aliases.py",
@@ -369,6 +370,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copy.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copyreg.*.pyc"=
,
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/csv.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dataclasses.*.=
pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dis.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/enum.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fnmatch.*.pyc"=
,
@@ -1012,14 +1014,12 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/cProfile.py",
-            "${libdir}/python${PYTHON_MAJMIN}/dataclasses.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lsprof.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/profile.py",
             "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc=
",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dataclasses.*.=
pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc"=
,
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
         ]
--=20
2.34.1


