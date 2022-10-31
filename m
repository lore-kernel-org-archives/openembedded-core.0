Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00E1FA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 15:19:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10505.1667229555491905959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 08:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7BED1FB;
	Mon, 31 Oct 2022 08:19:20 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E44873F703;
	Mon, 31 Oct 2022 08:19:13 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] expat: upgrade to 2.5.0
Date: Mon, 31 Oct 2022 15:19:10 +0000
Message-Id: <20221031151910.156298-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 15:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172319

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/expat/{expat_2.4.9.bb =3D> expat_2.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.9.bb =3D> expat_2.5.0.bb} (91%=
)

diff --git a/meta/recipes-core/expat/expat_2.4.9.bb b/meta/recipes-core/e=
xpat/expat_2.5.0.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.9.bb
rename to meta/recipes-core/expat/expat_2.5.0.bb
index 9561edd84fc..aa8d439d5fb 100644
--- a/meta/recipes-core/expat/expat_2.4.9.bb
+++ b/meta/recipes-core/expat/expat_2.5.0.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TA=
G}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/R_(?P<pver>.+)"
=20
-SRC_URI[sha256sum] =3D "7f44d1469b110773a94b0d5abeeeffaef79f8bd6406b07e5=
2394bcf48126437a"
+SRC_URI[sha256sum] =3D "6f0e6e01f7b30025fa05c85fdad1e5d0ec7fd35d9f61b22f=
34998de11969ff67"
=20
 EXTRA_OECMAKE:class-native +=3D "-DEXPAT_BUILD_DOCS=3DOFF"
=20
--=20
2.34.1


