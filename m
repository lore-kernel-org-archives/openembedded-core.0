Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35750C52CDC
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:51:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45840.1721746305355655328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E8941476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A758A3F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:44 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/37] pytest-runner: remove python3-py dependency
Date: Tue, 23 Jul 2024 15:51:06 +0100
Message-Id: <20240723145137.74198-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202373

It appears that this package has never required the `py` module.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pytest-runner_6.0.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pytest-runner_6.0.1.bb =
b/meta/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
index cce9ce33e22..e5e5e048bd4 100644
--- a/meta/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
@@ -10,7 +10,6 @@ inherit pypi python_setuptools_build_meta
 DEPENDS +=3D " \
     python3-setuptools-scm-native"
=20
-RDEPENDS:${PN} =3D "python3-py python3-setuptools python3-debugger pytho=
n3-json \
-                  python3-io"
+RDEPENDS:${PN} =3D "python3-setuptools python3-debugger python3-json pyt=
hon3-io"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


