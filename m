Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D54C77B6E
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 12:37:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11708.1679402276232153121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 05:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2C0CAD7;
	Tue, 21 Mar 2023 05:38:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D4EC3F71E;
	Tue, 21 Mar 2023 05:37:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 10/17] python3-markupsafe: use python3-unittest-automake-output
Date: Tue, 21 Mar 2023 12:37:38 +0000
Message-Id: <20230321123745.1248462-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321123745.1248462-1-ross.burton@arm.com>
References: <20230321123745.1248462-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 12:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178863

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-markupsafe/run-ptest | 2 +-
 meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-markupsafe/run-ptest b/=
meta/recipes-devtools/python/python3-markupsafe/run-ptest
index 5cec7116968..8d2017d39ce 100644
--- a/meta/recipes-devtools/python/python3-markupsafe/run-ptest
+++ b/meta/recipes-devtools/python/python3-markupsafe/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
=20
-pytest
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb b/m=
eta/recipes-devtools/python/python3-markupsafe_2.1.2.bb
index f4f0ad2df0f..32420529635 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Dffeffa59c9=
0c9c4a033c7574f8f3fb75"
 SRC_URI[sha256sum] =3D "abcabc8c2b26036d62d4c746381a6f7cf60aafcc653198ad=
678306986b09450d"
=20
 PYPI_PACKAGE =3D "MarkupSafe"
-inherit pypi setuptools3
-inherit ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)}
+inherit pypi setuptools3 ptest
=20
 RDEPENDS:${PN} +=3D "${PYTHON_PN}-stringold"
=20
@@ -19,6 +18,7 @@ SRC_URI +=3D " \
=20
 RDEPENDS:${PN}-ptest +=3D " \
 	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-unittest-automake-output \
 "
=20
 do_install_ptest() {
--=20
2.34.1


