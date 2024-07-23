Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0C3C3DA7F
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:52:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.45958.1721746321988133250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F4021476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4E8453F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:01 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 35/37] python3-yamllint: use python_setuptools_build_meta build class
Date: Tue, 23 Jul 2024 15:51:35 +0100
Message-Id: <20240723145137.74198-35-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202402

This package can be built using pep517 classes now.

yamlint appears to have never used setuptools-scm, so remove the
dependency.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-yamllint_1.35.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-yamllint_1.35.1.bb b/me=
ta/recipes-devtools/python/python3-yamllint_1.35.1.bb
index 53188b02624..116209f683c 100644
--- a/meta/recipes-devtools/python/python3-yamllint_1.35.1.bb
+++ b/meta/recipes-devtools/python/python3-yamllint_1.35.1.bb
@@ -3,13 +3,12 @@ HOMEPAGE =3D "https://github.com/adrienverge/yamllint"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
=20
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
=20
 PYPI_PACKAGE =3D "yamllint"
=20
 SRC_URI[sha256sum] =3D "7a003809f88324fd2c877734f2d575ee7881dd9043360657=
cc8049c809eba6cd"
=20
-DEPENDS +=3D "python3-setuptools-scm-native"
 RDEPENDS:${PN} +=3D "python3-pathspec python3-pyyaml"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


