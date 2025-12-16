Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5292D5E156
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 13:36:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22567.1765892170490862352
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 05:36:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C67D6FEC
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 05:36:02 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9443F3F73B
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 05:36:09 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] python3-hatchling: upgrade 1.27.0 -> 1.28.0
Date: Tue, 16 Dec 2025 13:35:56 +0000
Message-ID: <20251216133603.1003572-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216133603.1003572-1-ross.burton@arm.com>
References: <20251216133603.1003572-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 13:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227949

Upstream changes:

- Drop support for Python 3.9
- Add sbom-files option and sbom_files build data to the wheel build
  target for including Software Bill of Materials files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...{python3-hatchling_1.27.0.bb =3D> python3-hatchling_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.27.0.bb =3D> py=
thon3-hatchling_1.28.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.27.0.bb b/m=
eta/recipes-devtools/python/python3-hatchling_1.28.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.27.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.28.0.bb
index 5239d8155cb..b5a55a07904 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.27.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.28.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS +=3D "python3-pluggy-native python3-pathspec-native python3-pack=
aging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native =3D "python3-hatchling-native"
=20
-SRC_URI[sha256sum] =3D "971c296d9819abb3811112fc52c7a9751c8d381898f36533=
bb16f9791e941fd6"
+SRC_URI[sha256sum] =3D "4d50b02aece6892b8cd0b3ce6c82cb218594d3ec5836dbde=
75bf41a21ab004c8"
=20
 do_compile:prepend() {
     export PYTHONPATH=3Dsrc
--=20
2.43.0


