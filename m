Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F83C52D54
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:52:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.45953.1721746317884708179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 117EE1476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:23 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 416833F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 28/37] python3-ruemel-yaml: use python_setuptools_build_meta build class
Date: Tue, 23 Jul 2024 15:51:28 +0100
Message-Id: <20240723145137.74198-28-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:52:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202395

This package can be built using pep517 classes now.

Also remove the redundant RUAMEL_NO_PIP_INSTALL_CHECK assignment, this
is checked by setup.py which is no longer ran.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb b=
/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb
index 197bf91d6cc..5df1f102d9d 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D30cbbccd94bf3a=
2b0285ec35671a1938"
=20
 PYPI_PACKAGE =3D "ruamel.yaml"
=20
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "8b27e6a217e786c6fbe5634d8f3f11bc63e0f80f6a5890f2=
8863d9c45aac311b"
=20
@@ -16,8 +16,4 @@ RDEPENDS:${PN} +=3D "\
     python3-netclient \
 "
=20
-do_install:prepend() {
-    export RUAMEL_NO_PIP_INSTALL_CHECK=3D1
-}
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


