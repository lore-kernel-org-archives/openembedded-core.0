Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7159BC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 16:32:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.10284.1646757132144151472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 08:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C79361516
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 08:32:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 732E43FA45
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 08:32:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] python3-pyrsistent: use setuptools_build_meta
Date: Tue,  8 Mar 2022 16:32:05 +0000
Message-Id: <20220308163206.4039089-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308163206.4039089-1-ross.burton@arm.com>
References: <20220308163206.4039089-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 16:32:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162941

This project builds with setuptools_build_meta, so use that instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb b/=
meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb
index 4c9b8ec1dd..ecd55672f5 100644
--- a/meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb
+++ b/meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.mit;md5=3Db695eb9c6e=
7a6fb1b1bc2d193c42776e"
=20
 SRC_URI[sha256sum] =3D "d4d61f8b993a7255ba714df3aca52700f8125289f84f704c=
f80916517c46eb96"
=20
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D " \
     ${PYTHON_PN}-numbers \
--=20
2.25.1


