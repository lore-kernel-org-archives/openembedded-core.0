Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA60C64EC4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 15:17:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.36191.1678115834442095364
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 07:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9DF113D5;
	Mon,  6 Mar 2023 07:17:56 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C99A43F71A;
	Mon,  6 Mar 2023 07:17:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] epiphany: upgrade to 43.1
Date: Mon,  6 Mar 2023 15:17:09 +0000
Message-Id: <20230306151709.3737102-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306151709.3737102-1-ross.burton@arm.com>
References: <20230306151709.3737102-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 15:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178076

This fixes CVE-2023-26081.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../epiphany/{epiphany_43.0.bb =3D> epiphany_43.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_43.0.bb =3D> epiphany_43.1.=
bb} (93%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_43.0.bb b/meta/recipes-=
gnome/epiphany/epiphany_43.1.bb
similarity index 93%
rename from meta/recipes-gnome/epiphany/epiphany_43.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_43.1.bb
index 4a6007b0df3..ea22723a97a 100644
--- a/meta/recipes-gnome/epiphany/epiphany_43.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_43.1.bb
@@ -31,7 +31,7 @@ SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.tri=
m_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] =3D "b66d499f9ee72696d83cf844125377181a954554=
a4bb3785b73293380ac0c227"
+SRC_URI[archive.sha256sum] =3D "e86ead27cb9982815150664de3bf20faf375f77b=
8065b02b31180c65b6bbebb4"
=20
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] =3D "-Ddeveloper_mode=3Dtrue,-Ddeveloper_m=
ode=3Dfalse"
--=20
2.34.1


