Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40EDC7EE2D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 13:30:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.88215.1684157402095117359
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 06:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8012C2F4;
	Mon, 15 May 2023 06:30:46 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 556973F67D;
	Mon, 15 May 2023 06:30:01 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 7/8] glib-networking: add gnomeproxy PACKAGECONFIG
Date: Mon, 15 May 2023 14:29:54 +0100
Message-Id: <20230515132955.2231164-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515132955.2231164-1-ross.burton@arm.com>
References: <20230515132955.2231164-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 13:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181257

From: Ross Burton <ross.burton@arm.com>

Add a PACKAGECONFIG for the Gnome proxy configuration.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glib-networking/glib-networking_2.74.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb =
b/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
index ebf9e260508..4bd0d8cc425 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
@@ -22,8 +22,7 @@ PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Denabled,-Dgnutls=3D=
disabled,gnutls"
 PACKAGECONFIG[openssl] =3D "-Dopenssl=3Denabled,-Dopenssl=3Ddisabled,ope=
nssl"
 PACKAGECONFIG[libproxy] =3D "-Dlibproxy=3Denabled,-Dlibproxy=3Ddisabled,=
libproxy"
 PACKAGECONFIG[tests] =3D "-Dinstalled_tests=3Dtrue,-Dinstalled_tests=3Df=
alse"
-
-EXTRA_OEMESON =3D "-Dgnome_proxy=3Ddisabled"
+PACKAGECONFIG[gnomeproxy] =3D "-Dgnome_proxy=3Denabled,-Dgnome_proxy=3Dd=
isabled,gsettings-desktop-schemas"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase gettext upstream-version-is-even gio-module-cache ptes=
t-gnome
--=20
2.34.1


