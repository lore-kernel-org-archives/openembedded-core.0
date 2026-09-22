Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE382C982FF
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 13:11:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9642.1790082684584349990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 06:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=NV+YA1XN;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D61B1576
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 06:11:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6267A3F528
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 06:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790082683; bh=xWrClDkdjIeygcG7qzS1p6yGH8CORb3/TJ2n5aE4SYg=;
	h=From:To:Subject:Date:From;
	b=NV+YA1XNNRAqWiyBVHOg9xVoSm4kCjwL16ShQARaxyGkn463LoDoFtTKzR0Bh+Oi0
	 SZVIhqWsQlTRlkV8yLukT92ATUFG2krjcUcPOaWmUgReRaKP+jIbUzWBrlOPHBW59x
	 j3hIuEB5tdLvLgQW999ohFDdKraiFs1aAKpSLaAs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-hatchling: upgrade 1.32.0 -> 1.32.4
Date: Tue, 22 Sep 2026 14:11:21 +0100
Message-ID: <20260922131121.965718-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 13:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246411

Version 1.32.1 and 1.32.2 were retracted.

Upstream release notes:

1.32.3:

- Preserve the version string exactly as written in core metadata, so
  stylized versions such as CalVer 2026.08.10 are no longer stripped of
  leading zeros. Distribution file names and .dist-info directories
  continue to use the PEP 440 normalized form.

1.32.4:

- Revert the extra type parameter added to BuildHookInterface in 1.32.3,
  which broke plugins that subscripted the interface with a single
  argument (e.g. BuildHookInterface[MyConfig]) by raising TypeError at
  import time. BuilderConfig is likewise no longer generic, restoring
  the pre-1.32.3 plugin interface.
- Strip spaces around version metadata when using original input for
  CalVer to keep leading zeroes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...{python3-hatchling_1.32.0.bb =3D> python3-hatchling_1.32.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.32.0.bb =3D> py=
thon3-hatchling_1.32.4.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb b/m=
eta/recipes-devtools/python/python3-hatchling_1.32.4.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-hatchling_1.32.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.32.4.bb
index e0c82ff3677..1420625d9e6 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.32.4.bb
@@ -7,6 +7,6 @@ inherit pypi python_hatchling
=20
 DEPENDS +=3D "python3-packaging-native python3-pathspec-native python3-p=
luggy-native python3-tomlkit-native python3-trove-classifiers-native"
=20
-SRC_URI[sha256sum] =3D "0bdbde4a52b06c37e3eca395f85a762bf0ef06fe374fd8ae=
429dc6be10230f5f"
+SRC_URI[sha256sum] =3D "c4468f73144c054d2aab4ef0f0378c43b9878bf07f8ffd6b=
79690e970d375f07"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


