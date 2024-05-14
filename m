Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C161BC04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 16:10:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20096.1715703015788590646
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 May 2024 09:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 173751007
	for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 09:10:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CB50C3F641
	for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 09:10:14 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] enchant2: upgrade to 2.7.3
Date: Tue, 14 May 2024 16:10:13 +0000
Message-Id: <20240514161013.4081723-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 16:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199264

Upstream NEWS:

  This release is made with Vala 0.56.17 (previous versions were made wit=
h
  0.56.0). This works around a bug in `valac` that generates code which c=
auses
  an error in GCC >=3D14 and Clang >=3D 16.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../enchant/{enchant2_2.7.2.bb =3D> enchant2_2.7.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.7.2.bb =3D> enchant2_2.7=
.3.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.7.2.bb b/meta/recipe=
s-support/enchant/enchant2_2.7.3.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.7.2.bb
rename to meta/recipes-support/enchant/enchant2_2.7.3.bb
index 08998dd48fe..d5073b6f31a 100644
--- a/meta/recipes-support/enchant/enchant2_2.7.2.bb
+++ b/meta/recipes-support/enchant/enchant2_2.7.3.bb
@@ -12,7 +12,7 @@ DEPENDS =3D "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "7cc3400a6657974a740b6e3c2568e2935c70e5302f07fadb=
2095366b75ecad6f"
+SRC_URI[sha256sum] =3D "fe6ad4cbe8c71b9384ffdef962be52d4d2bd5ebfb6351435=
bb390543d4f78b1e"
=20
 GITHUB_BASE_URI =3D "https://github.com/AbiWord/enchant/releases"
=20
--=20
2.34.1


