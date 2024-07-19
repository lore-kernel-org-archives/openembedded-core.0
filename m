Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B42C3DA59
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 13:25:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18504.1721395528397080528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 06:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E4B51042
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 06:25:53 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 91A743F762
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 06:25:27 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] ell: upgrade 0.66 -> 0.67
Date: Fri, 19 Jul 2024 14:25:18 +0100
Message-Id: <20240719132523.976790-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 13:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202259

* Add support for handling sysctl char settings.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/ell/{ell_0.66.bb =3D> ell_0.67.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.66.bb =3D> ell_0.67.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.66.bb b/meta/recipes-core/ell/el=
l_0.67.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.66.bb
rename to meta/recipes-core/ell/ell_0.67.bb
index 899e2f68493..6b0ebbe6211 100644
--- a/meta/recipes-core/ell/ell_0.66.bb
+++ b/meta/recipes-core/ell/ell_0.67.bb
@@ -15,4 +15,4 @@ DEPENDS =3D "dbus"
 inherit autotools pkgconfig
=20
 SRC_URI =3D "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN=
}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "7a78b757080ed6518c1c4fa26ad6a7a3d6e4e385386a20b6=
fb52379e7d1ffa36"
+SRC_URI[sha256sum] =3D "97942e8cefb130b632496e5485242f3f374f3b8846800fb7=
4fffd76dc2a0c726"
--=20
2.34.1


