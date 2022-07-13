Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BD3CCA479
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 16:28:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.24017.1657729704280941599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 09:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C03F15A1;
	Wed, 13 Jul 2022 09:28:24 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 672933F792;
	Wed, 13 Jul 2022 09:28:23 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/8] python3-setuptools-scm: add missing
 python3-typing-extensions dependency
Date: Wed, 13 Jul 2022 17:28:14 +0100
Message-Id: <20220713162821.974801-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 16:28:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167966

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb=
 b/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb
index 114e6820a9b..72529353e58 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb
@@ -11,7 +11,7 @@ inherit pypi python_setuptools_build_meta
=20
 UPSTREAM_CHECK_REGEX =3D "setuptools_scm-(?P<pver>.*)\.tar"
=20
-DEPENDS +=3D "python3-tomli-native python3-packaging-native"
+DEPENDS +=3D "python3-tomli-native python3-packaging-native python3-typi=
ng-extensions-native"
=20
 RDEPENDS:${PN} =3D "\
     ${PYTHON_PN}-packaging \
--=20
2.34.1


