Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41E1D78319
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 12:45:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.173012.1733143555556883282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 04:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0524106F
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Dec 2024 04:46:23 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C5A433F58B
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Dec 2024 04:45:54 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-hatchling: upgrade 1.25.0 -> 1.26.3
Date: Mon,  2 Dec 2024 12:45:50 +0000
Message-Id: <20241202124550.4160316-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202124550.4160316-1-ross.burton@arm.com>
References: <20241202124550.4160316-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 12:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208145

1.26.3:
- Support an old import path that is still used by some consumers like
  Hatch

1.26.2:
- Back-populate string license fields (License-Expression) for core
  metadata versions prior to 2.4
- Remove the License-Expression and License-Files core metadata from
  version 2.2 that was missed in the previous minor release

1.26.1:
- Add backward compatibility for the old license-files metadata field
- Support an old import path that is still used by some consumers like
  Hatch

1.26.0:
- The license-files metadata field has been updated to the latest spec
  and is now just an array of glob patterns
- Support version 2.4 of core metadata for the wheel and sdist targets
- Add HATCH_METADATA_CLASSIFIERS_NO_VERIFY environment variable to
  disable trove classifier verification
- Add .pixi to the list of directories that cannot be traversed
- Bump the minimum supported version of packaging to 24.2
- No longer write package metadata for license expressions and files for
  versions of core metadata prior to 2.4
- Properly enable Zip64 support for the wheel target
- Properly ignore parent .gitingore files when the project root matches
  one of the patterns

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...{python3-hatchling_1.25.0.bb =3D> python3-hatchling_1.26.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.25.0.bb =3D> py=
thon3-hatchling_1.26.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.25.0.bb b/m=
eta/recipes-devtools/python/python3-hatchling_1.26.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.25.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.26.3.bb
index 111b4478155..590456ad9b0 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.25.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS +=3D "python3-pluggy-native python3-pathspec-native python3-pack=
aging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native =3D "python3-hatchling-native"
=20
-SRC_URI[sha256sum] =3D "7064631a512610b52250a4d3ff1bd81551d6d1431c4eb7b7=
2e734df6c74f4262"
+SRC_URI[sha256sum] =3D "b672a9c36a601a06c4e88a1abb1330639ee8e721e0535a37=
536e546a667efc7a"
=20
 do_compile:prepend() {
     export PYTHONPATH=3Dsrc
--=20
2.34.1


