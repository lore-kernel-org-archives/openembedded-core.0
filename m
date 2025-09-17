Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA18CA0EE8
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 09:56:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18934.1758103006595637820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 02:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7026625DC
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 02:56:37 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 434DD3F673
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 02:56:45 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] expat: upgrade to 2.7.2
Date: Wed, 17 Sep 2025 10:56:41 +0100
Message-ID: <20250917095641.2066106-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 09:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223590

Primarily to fix CVE-2025-59375 (Disallow use of disproportional amounts
of dynamic memory from within an Expat parser) but the full list of
changes are available:

https://github.com/libexpat/libexpat/blob/R_2_7_2/expat/Changes

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/expat/{expat_2.7.1.bb =3D> expat_2.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.7.1.bb =3D> expat_2.7.2.bb} (92%=
)

diff --git a/meta/recipes-core/expat/expat_2.7.1.bb b/meta/recipes-core/e=
xpat/expat_2.7.2.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.7.1.bb
rename to meta/recipes-core/expat/expat_2.7.2.bb
index 2da15329221..952235d7a04 100644
--- a/meta/recipes-core/expat/expat_2.7.1.bb
+++ b/meta/recipes-core/expat/expat_2.7.2.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TA=
G}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/R_(?P<pver>.+)"
=20
-SRC_URI[sha256sum] =3D "45c98ae1e9b5127325d25186cf8c511fa814078e9efeae79=
87a574b482b79b3d"
+SRC_URI[sha256sum] =3D "976f6c2d358953c22398d64cd93790ba5abc62e02a1bbc20=
4a3a264adea149b8"
=20
 EXTRA_OECMAKE:class-native +=3D "-DEXPAT_BUILD_DOCS=3DOFF"
=20
--=20
2.43.0


