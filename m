Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25DBED3ABE2
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 18:13:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.66455.1731348828022001544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 10:13:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A15471480
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:14:17 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 55AA33F59E
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:13:47 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] glib-2.0: explicitly disable sysprof
Date: Mon, 11 Nov 2024 18:13:35 +0000
Message-Id: <20241111181341.3296523-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111181341.3296523-1-ross.burton@arm.com>
References: <20241111181341.3296523-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 18:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206969

We can't build this combination right now because of a circular dependenc=
y,
but it's good to make it explicit.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
index 7f7609a99f7..f7631cee835 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -46,7 +46,7 @@ PACKAGECONFIG[tests] =3D "-Dinstalled_tests=3Dtrue,-Din=
stalled_tests=3Dfalse,"
 PACKAGECONFIG[selinux] =3D "-Dselinux=3Denabled,-Dselinux=3Ddisabled,lib=
selinux"
 PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled,-Dintrospect=
ion=3Ddisabled,gobject-introspection-native gobject-introspection glib-2.=
0-initial"
=20
-EXTRA_OEMESON =3D "-Ddtrace=3Ddisabled -Dsystemtap=3Ddisabled"
+EXTRA_OEMESON =3D "-Ddtrace=3Ddisabled -Dsystemtap=3Ddisabled -Dsysprof=3D=
disabled"
=20
 EXTRA_OEMESON:append:class-target =3D " ${@'-Dgir_dir_prefix=3D${libdir}=
' if d.getVar('MULTILIBS') else ''}"
=20
--=20
2.34.1


