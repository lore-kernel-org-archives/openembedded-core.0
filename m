Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1647C433F5
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 12:20:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.31132.1643631631861454512
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 04:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C096ED6E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 04:20:30 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A9683F774
	for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 04:20:30 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] expat: upgrade to 2.4.4
Date: Mon, 31 Jan 2022 12:20:28 +0000
Message-Id: <20220131122028.2782684-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 12:20:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161123

Fixes CVE-2022-23852 and CVE-2022-23990.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/expat/{expat_2.4.3.bb =3D> expat_2.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.3.bb =3D> expat_2.4.4.bb} (91%=
)

diff --git a/meta/recipes-core/expat/expat_2.4.3.bb b/meta/recipes-core/e=
xpat/expat_2.4.4.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.3.bb
rename to meta/recipes-core/expat/expat_2.4.4.bb
index cc50f90f70b..14080220d2c 100644
--- a/meta/recipes-core/expat/expat_2.4.3.bb
+++ b/meta/recipes-core/expat/expat_2.4.4.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "https://github.com/libexpat/libexpat/relea=
ses/download/R_${VERSION_TA
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/libexpat/libexpat/releases/"
=20
-SRC_URI[sha256sum] =3D "6f262e216a494fbf42d8c22bc841b3e117c21f2467a19dc4=
c27c991b5622f986"
+SRC_URI[sha256sum] =3D "14c58c2a0b5b8b31836514dfab41bd191836db7aa7b84ae5=
c47bc0327a20d64a"
=20
 EXTRA_OECMAKE:class-native +=3D "-DEXPAT_BUILD_DOCS=3DOFF"
=20
--=20
2.25.1


