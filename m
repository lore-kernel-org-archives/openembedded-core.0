Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFF4C61D85
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 16:02:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45195.1700582550548888766
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 08:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED3B1FEC;
	Tue, 21 Nov 2023 08:03:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ADCED3F6C4;
	Tue, 21 Nov 2023 08:02:29 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] shared-mime-info: embed PV in the filename
Date: Tue, 21 Nov 2023 16:02:25 +0000
Message-Id: <20231121160225.523482-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 16:02:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190987

From: Ross Burton <ross.burton@arm.com>

As this recipe tracks the release tags we can embed the PV in the
filename.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../{shared-mime-info_git.bb =3D> shared-mime-info_2.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_git.bb =3D=
> shared-mime-info_2.4.bb} (98%)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.b=
b b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
similarity index 98%
rename from meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
rename to meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
index 937428221ef..5ba40236096 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
@@ -10,7 +10,7 @@ DEPENDS =3D "libxml2 itstool-native glib-2.0 shared-mim=
e-info-native xmlto-native"
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;proto=
col=3Dhttps;branch=3Dmaster"
 SRCREV =3D "9a6d6b8e963935f145f3a1ef446552de6996dada"
-PV =3D "2.4"
+
 S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig gettext python3native mime
--=20
2.34.1


