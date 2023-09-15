Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC71CD37AE
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 22:56:44 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.2068.1694818600111253333
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 15:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout04.t-online.de (Postfix) with SMTP id EFE621A385
	for <openembedded-core@lists.openembedded.org>; Sat, 16 Sep 2023 00:56:37 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.231.62]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qhHjo-2YOig50; Sat, 16 Sep 2023 00:56:36 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libportal: upgrade 0.6 -> 0.7.1
Date: Sat, 16 Sep 2023 00:56:27 +0200
Message-ID: <20230915225627.293490-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694818596-1381E931-F242448D/0/0 CLEAN NORMAL
X-TOI-MSGID: 2e6b48a2-884f-4e14-8413-47e54aad4fae
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 22:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187770

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libportal/{libportal_0.6.bb =3D> libportal_0.7.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libportal/{libportal_0.6.bb =3D> libportal_0.7=
.1.bb} (81%)

diff --git a/meta/recipes-gnome/libportal/libportal_0.6.bb b/meta/recipes=
-gnome/libportal/libportal_0.7.1.bb
similarity index 81%
rename from meta/recipes-gnome/libportal/libportal_0.6.bb
rename to meta/recipes-gnome/libportal/libportal_0.7.1.bb
index bf38fc85fd..22e45559c9 100644
--- a/meta/recipes-gnome/libportal/libportal_0.6.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.7.1.bb
@@ -7,7 +7,7 @@ LICENSE =3D "LGPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3000208d539ec061b899bce1d9ce9=
404"
=20
 SRC_URI =3D "git://github.com/flatpak/${BPN}.git;protocol=3Dhttps;branch=
=3Dmain"
-SRCREV =3D "13df0b887a7eb7b0f9b14069561a41f62e813155"
+SRCREV =3D "e9ed3a50cdde321eaf42361212480a66eb94a57a"
 S =3D "${WORKDIR}/git"
=20
 inherit meson gi-docgen gobject-introspection vala features_check pkgcon=
fig
@@ -17,4 +17,4 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 DEPENDS +=3D "glib-2.0 glib-2.0-native gtk+3 ${@bb.utils.contains('DISTR=
O_FEATURES', 'opengl', 'gtk4', '', d)}"
=20
-EXTRA_OEMESON =3D "-Dbackends=3Dgtk3${@bb.utils.contains('DISTRO_FEATURE=
S', 'opengl', ',gtk4', '', d)}"
+EXTRA_OEMESON =3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dva=
pi=3Dtrue', '-Dvapi=3Dfalse', d)} -Dbackend-qt5=3Ddisabled"
--=20
2.41.0


