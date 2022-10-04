Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180B4C4321E
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 10:51:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9019.1664880670650697557
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 03:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 162831480;
	Tue,  4 Oct 2022 03:51:17 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D73EF3F67D;
	Tue,  4 Oct 2022 03:51:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/5] pango: upgrade 1.50.9 -> 1.50.10
Date: Tue,  4 Oct 2022 11:51:04 +0100
Message-Id: <20221004105106.1556357-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004105106.1556357-1-ross.burton@arm.com>
References: <20221004105106.1556357-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 10:51:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171383

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../pango/{pango_1.50.9.bb =3D> pango_1.50.10.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.50.9.bb =3D> pango_1.50.10.b=
b} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.50.9.bb b/meta/recipes-g=
raphics/pango/pango_1.50.10.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.50.9.bb
rename to meta/recipes-graphics/pango/pango_1.50.10.bb
index 03e2ca67214..95209889a85 100644
--- a/meta/recipes-graphics/pango/pango_1.50.9.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.10.bb
@@ -24,7 +24,7 @@ SRC_URI +=3D "file://run-ptest \
             file://0001-Skip-running-test-layout-test.patch \
 "
=20
-SRC_URI[archive.sha256sum] =3D "1b636aabf905130d806372136f5e137b6a27f26d=
47defd9240bf444f6a4fe610"
+SRC_URI[archive.sha256sum] =3D "7e5d2f1e40854d24a9a2c4d093bafe75dcdbeccd=
f1de43e4437332eabed64966"
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native fontconfig freetype virtual/libico=
nv cairo harfbuzz fribidi"
=20
--=20
2.34.1


