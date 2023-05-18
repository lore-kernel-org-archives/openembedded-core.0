Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28D8C7EE25
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 16:08:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21557.1684426104475959377
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 09:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 597A9D75;
	Thu, 18 May 2023 09:09:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 181553F762;
	Thu, 18 May 2023 09:08:22 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] python3-async: remove recipe
Date: Thu, 18 May 2023 17:08:21 +0100
Message-Id: <20230518160821.3661890-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518160821.3661890-1-ross.burton@arm.com>
References: <20230518160821.3661890-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 16:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181526

From: Ross Burton <ross.burton@arm.com>

This is part of the same project as GitPython, but hasn't been used by
gitdb (the sole user) since 2014.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python-async.inc      | 14 --------------
 .../recipes-devtools/python/python3-async_0.6.2.bb |  2 --
 2 files changed, 16 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-async.inc
 delete mode 100644 meta/recipes-devtools/python/python3-async_0.6.2.bb

diff --git a/meta/recipes-devtools/python/python-async.inc b/meta/recipes=
-devtools/python/python-async.inc
deleted file mode 100644
index fde864601c6..00000000000
--- a/meta/recipes-devtools/python/python-async.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY =3D "Python framework to process interdependent tasks in a pool =
of workers"
-HOMEPAGE =3D "http://github.com/gitpython-developers/async"
-SECTION =3D "devel/python"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D88=
df8e78b9edfd744953862179f2d14e"
-
-inherit pypi
-
-SRC_URI[md5sum] =3D "9b06b5997de2154f3bc0273f80bcef6b"
-SRC_URI[sha256sum] =3D "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0=
a6ea2229d8343051"
-
-RDEPENDS:${PN} +=3D "${PYTHON_PN}-threading"
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-async_0.6.2.bb b/meta/r=
ecipes-devtools/python/python3-async_0.6.2.bb
deleted file mode 100644
index 0da5fdecdc8..00000000000
--- a/meta/recipes-devtools/python/python3-async_0.6.2.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-async.inc
--=20
2.34.1


