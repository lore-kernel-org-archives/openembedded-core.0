Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEBFC77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 15:13:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.728.1683040427101419675
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 08:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF9CCC14;
	Tue,  2 May 2023 08:14:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 367C63F5A1;
	Tue,  2 May 2023 08:13:46 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] piglit: upgrade to latest revision
Date: Tue,  2 May 2023 16:13:44 +0100
Message-Id: <20230502151344.1836838-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 15:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180742

From: Upgrade Helper <auh@yoctoproject.org>

---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-gr=
aphics/piglit/piglit_git.bb
index 78b47985bcb..1daeb35b588 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -13,7 +13,7 @@ SRC_URI =3D "git://gitlab.freedesktop.org/mesa/piglit.g=
it;protocol=3Dhttps;branch=3Dma
            "
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-SRCREV =3D "0f4a875b05feb44426a2d43146f5e3c6ea5f8038"
+SRCREV =3D "c39bc6062a373c371d9c8076a66acbb26c661471"
 # (when PV goes above 1.0 remove the trailing r)
 PV =3D "1.0+gitr${SRCPV}"
=20
--=20
2.34.1


