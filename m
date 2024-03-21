Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A641C54E58
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 05:33:36 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.363.1710999215426576201
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 22:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from DL-ARCH01.lan (173-175-175-024.res.spectrum.com [173.175.175.24])
	by linux.microsoft.com (Postfix) with ESMTPSA id A051D20B74C0;
	Wed, 20 Mar 2024 22:33:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A051D20B74C0
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] python3-manifest: Sync RDEPENDS with latest version
Date: Wed, 20 Mar 2024 23:35:23 -0600
Message-ID: <20240321053523.4131916-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 05:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197408

bitbake python3 -c create_manifest revealed several changes that were mis=
sing.

This commit contains a manual cherry-picked version of those, making sure=
 that
new RDEPENDS are reflected since the last time this was updated.

In this case its taking out unnecessary dependencies to python3-profile a=
nd
python3-shell.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 .../python/python3/python3-manifest.json                 | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index a51392c5e3..46092d4004 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -201,8 +201,7 @@
     "compression": {
         "summary": "Python high-level compression support",
         "rdepends": [
-            "core",
-            "shell"
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/gzip.py",
@@ -525,7 +524,6 @@
         "rdepends": [
             "core",
             "pprint",
-            "profile",
             "shell",
             "stringold"
         ],
@@ -577,7 +575,6 @@
             "debugger",
             "difflib",
             "pprint",
-            "profile",
             "shell",
             "stringold",
             "unittest"
@@ -997,8 +994,7 @@
     "pprint": {
         "summary": "Python pretty-print support",
         "rdepends": [
-            "core",
-            "profile"
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/pprint.py"
@@ -1189,7 +1185,6 @@
             "netclient",
             "numbers",
             "pprint",
-            "profile",
             "stringold"
         ],
         "files": [
--=20
2.44.0


