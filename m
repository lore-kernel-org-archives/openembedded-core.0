Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A27C982C3
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 14:52:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24980.1789483951992686961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 07:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=gCXwzT+a;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8100169E
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 07:52:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1C7CB3F7B4
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 07:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789483951; bh=beMYefKBEpoFM4+By7kDkvyiSSV365fyrzq32FDnmZw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gCXwzT+aZhwf0nWtryKJR01rjqIss50WkDDa1M4yuh5qORalThRnQC1wqfPhc/aXW
	 lxKswN1ZrcJBwGFW9IEFlSkqJlFP63BXoE7yt83o5zkUyNmlHK2pHlDKcieGfIuz3Z
	 OP7wTdX3vVytRaPBcKk7oXhlIvLmCoK+QUC41thU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-hatchling: upgrade 1.31.0 -> 1.32.0
Date: Tue, 15 Sep 2026 15:52:28 +0100
Message-ID: <20260915145228.775109-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915145228.775109-1-ross.burton@arm.com>
References: <20260915145228.775109-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 14:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245855

Upstream release notes:

Changed:

- Bump default core metadata version to 2.5
- Add tomlkit as a runtime dependency, which is required to rewrite
  pyproject.toml when setting a static version

Added:

- The version command can now set a version that is statically defined
  by the project.version field, updating pyproject.toml in place. Pass
  --force to allow an explicit downgrade

Fixed:

- Allow the ; private annotation on project.import-names and
  project.import-namespaces entries rather than rejecting them as
  invalid import names.

- Reject project.readme paths that are absolute or resolve outside of
  the project directory.

Remove editables from DEPENDS, removed upstream in hatchling-1.22.0[1].
Add tomlkit, as above.

[1] hatch a5f62c2f ("remove hard dependency on editables (#1255)")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...ython3-hatchling_1.31.0.bb =3D> python3-hatchling_1.32.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.31.0.bb =3D> py=
thon3-hatchling_1.32.0.bb} (54%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb b/m=
eta/recipes-devtools/python/python3-hatchling_1.32.0.bb
similarity index 54%
rename from meta/recipes-devtools/python/python3-hatchling_1.31.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.32.0.bb
index 3acaa836382..e0c82ff3677 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.31.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.32.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dcbe2fd33fc=
9297692812fc94b7d27fd9"
=20
 inherit pypi python_hatchling
=20
-DEPENDS +=3D "python3-pluggy-native python3-pathspec-native python3-pack=
aging-native python3-editables-native python3-trove-classifiers-native"
+DEPENDS +=3D "python3-packaging-native python3-pathspec-native python3-p=
luggy-native python3-tomlkit-native python3-trove-classifiers-native"
=20
-SRC_URI[sha256sum] =3D "6b48ad4068a482ed7239b3a8215bc55b47aad3345d58dfc9=
4e553c5d2d46211b"
+SRC_URI[sha256sum] =3D "0bdbde4a52b06c37e3eca395f85a762bf0ef06fe374fd8ae=
429dc6be10230f5f"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


