Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D94C52D1E
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:51:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.45945.1721746311618424153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C75AF1476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:16 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 01E103F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/37] python3-zipp: remove obsolete dependencies
Date: Tue, 23 Jul 2024 15:51:17 +0100
Message-Id: <20240723145137.74198-17-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202384

As we have Python 3.11+, tomllib will be used instead of toml.

more-itertools is only used by the tests, which we don't package.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-zipp_3.19.2.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.19.2.bb b/meta/r=
ecipes-devtools/python/python3-zipp_3.19.2.bb
index 2bb69f2ac8b..8efb9d1814b 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.19.2.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.19.2.bb
@@ -9,10 +9,7 @@ DEPENDS +=3D "python3-setuptools-scm-native"
=20
 inherit pypi python_setuptools_build_meta
=20
-DEPENDS +=3D "python3-toml-native"
-
 RDEPENDS:${PN} +=3D "python3-compression \
-                   python3-math \
-                   python3-more-itertools"
+                   python3-math"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


