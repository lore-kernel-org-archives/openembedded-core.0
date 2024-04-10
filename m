Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D23CD1296
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 08:23:07 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.160752.1712737384442337916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 01:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout01.t-online.de (Postfix) with SMTP id 5205D1A47F
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 10:23:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.141]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ruTER-3sbWAz0; Wed, 10 Apr 2024 10:22:59 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gtk4: update 4.14.1 -> 4.14.2
Date: Wed, 10 Apr 2024 10:23:15 +0200
Message-ID: <20240410082315.1561159-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1712737380-167FB909-A1DE535E/0/0 CLEAN NORMAL
X-TOI-MSGID: b0fe842a-202f-4a7a-ae5b-77fc72d2dce0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 08:23:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198085

Overview of Changes in 4.14.2, 03-04-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkScale:
 - Improve positioning of values in some cases

* Theme:
 - Make progress in entries visible

* Accessibility:
 - Fix text insertion handling

* GDK:
 - dnd: Use the default cursor durion motion
 - dnd: Use a better cursor for indicating the move action

* GSK:
 - gl: Handle offloads in offscreen context better
 - Fix text rendering problems with some fonts

* Wayland:
 - Tighten up some protocol version checks
 - Use the presentation time protocol
 - Fix a crash with subsurfaces
 - Improve settings portal handling

* macOS:
 - Fix up the app menu support

* Windows:
 - Fix problems with minimization
 - Fix build without fontconfig

* Debugging:
 - Add font settings in the inspector

* Demos:
 - Clean up the application demo
 - Update cursor images for the cursor demo

* Translation updates:
 Catalan
 Czech
 French
 Georgian
 Hebrew
 Persian
 Slovenian
 Turkish
 Ukrainian

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.14.1.bb =3D> gtk4_4.14.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.14.1.bb =3D> gtk4_4.14.2.bb} (98%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.14.2.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.14.2.bb
index ce733769a5..282e81f048 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.14.2.bb
@@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "fcefb3f132f8cc4711a9efa5b353c9ae9bb5eeff0246fa74=
dbc2f2f839b9e308"
+SRC_URI[sha256sum] =3D "22604cef2898a79e5f2143bb7aee2b7d1fa2eb946989a9d1=
338ecf9c8ae0e072"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
--=20
2.44.0


