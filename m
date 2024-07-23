Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDEEC52CDA
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:52:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45859.1721746319609950361
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C20621476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:24 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F23A93F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 31/37] python3-setuptools-scm: remove python3-tomli dependency
Date: Tue, 23 Jul 2024 15:51:31 +0100
Message-Id: <20240723145137.74198-31-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202398

We have Python 3.11+ so setuptools-scm can use tomllib.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb=
 b/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb
index d116327fc6a..d8b9f8f2625 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_8.1.0.bb
@@ -14,7 +14,7 @@ inherit pypi python_setuptools_build_meta
=20
 UPSTREAM_CHECK_REGEX =3D "scm-(?P<pver>.*)\.tar"
=20
-DEPENDS +=3D "python3-tomli-native python3-packaging-native python3-typi=
ng-extensions-native"
+DEPENDS +=3D "python3-packaging-native python3-typing-extensions-native"
=20
 RDEPENDS:${PN} =3D "\
     python3-packaging \
--=20
2.34.1


