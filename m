Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE4ECE8360
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:07:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.58551.1727712450203577064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 09:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39485367
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 09:07:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 53B413F58B
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 09:07:29 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-pyproject-hooks: upgrade 1.0.0 -> 1.2.0
Date: Mon, 30 Sep 2024 17:07:24 +0100
Message-Id: <20240930160724.34897-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 16:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205121

- Improve interoperability with importlib.metadata, fixing a regression
  in setuptools compatibility in 1.1 (#199).
- Clean up the _in_process directory inside the package from sys.path
  before imporing the backend (#193).
- Add type annotations to the public API.
- More careful handling of the backend-path key from pyproject.toml.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...yproject-hooks_1.0.0.bb =3D> python3-pyproject-hooks_1.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyproject-hooks_1.0.0.bb =3D=
> python3-pyproject-hooks_1.2.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.b=
b b/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
rename to meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb
index c3f1fb75ed1..cdb9fc78c91 100644
--- a/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-hooks_1.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/pypa/pyproject-hooks"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daad69c93f605003e3342b174d9b07=
08c"
=20
-SRC_URI[sha256sum] =3D "f271b298b97f5955d53fb12b72c1fb1948c22c1a6b70b315=
c54cedaca0264ef5"
+SRC_URI[sha256sum] =3D "1e859bd5c40fae9448642dd871adf459e5e2084186e8d2c2=
a79a824c970da1f8"
=20
 inherit pypi python_flit_core
=20
--=20
2.34.1


