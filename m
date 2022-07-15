Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B506EC43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 12:32:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.5769.1657888333980014375
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 05:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA4FA1474;
	Fri, 15 Jul 2022 05:32:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF89B3F73D;
	Fri, 15 Jul 2022 05:32:12 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] python3-picobuild: upgrade to 0.2
Date: Fri, 15 Jul 2022 13:32:10 +0100
Message-Id: <20220715123210.978906-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 12:32:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168061

Major features since 0.1:
- Implement support for legacy source trees
- Add option to loosen dependency checking

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{python3-picobuild_0.1.bb =3D> python3-picobuild_0.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-picobuild_0.1.bb =3D> pytho=
n3-picobuild_0.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-picobuild_0.1.bb b/meta=
/recipes-devtools/python/python3-picobuild_0.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-picobuild_0.1.bb
rename to meta/recipes-devtools/python/python3-picobuild_0.2.bb
index 3c92b079f39..99e4cb87618 100644
--- a/meta/recipes-devtools/python/python3-picobuild_0.1.bb
+++ b/meta/recipes-devtools/python/python3-picobuild_0.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6c811a9fbdf5=
641ff0b0d43fbbb440e5 \
                     "
=20
 SRC_URI =3D "git://gitlab.com/rossburton/picobuild.git;protocol=3Dhttps;=
branch=3Dmain"
-SRCREV =3D "3441d5500a5ad23a44027576cf5261c3b7c1d6b0"
+SRCREV =3D "ed3b16ce48d91df181e5f5d77b9bbc2577b3fd9d"
 PV .=3D "+git${SRCPV}"
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1


