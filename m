Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D733B108E1ED
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 11:24:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8809.1773919448874015144
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 04:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B4A81A25
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 04:24:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E65223F778
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 04:24:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: package all of the compression module into python3-compression
Date: Thu, 19 Mar 2026 11:24:03 +0000
Message-ID: <20260319112403.3086034-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 11:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233515

Package all of the compression. module into the compression package, as
otherwise some modules such as compression.zstd end up in python3-misc.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/python3-manifest.json             | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 78526cd4b72..64e54666ce0 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -167,18 +167,12 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/gzip.py",
             "${libdir}/python${PYTHON_MAJMIN}/tarfile.py",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/gzip.py",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/tarfile.py",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/_common/_strea=
ms.py",
-            "${libdir}/python${PYTHON_MAJMIN}/zipfile",
-            "${libdir}/python${PYTHON_MAJMIN}/zipfile/_path"
+            "${libdir}/python${PYTHON_MAJMIN}/zipfile/",
+            "${libdir}/python${PYTHON_MAJMIN}/compression/"
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/compression/__pycache__/gz=
ip.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/__pycache__/ta=
rfile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/compression/_common/__pyca=
che__/_streams.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc"
         ]
     },
     "core": {
--=20
2.43.0


