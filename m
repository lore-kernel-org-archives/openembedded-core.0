Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5CDCE7AB0
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 07:11:52 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.47165.1725865906690940889
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Sep 2024 00:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout12.t-online.de (Postfix) with SMTP id 842E8AC39
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Sep 2024 09:11:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.228.217]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1snYYm-2ONXCD0; Mon, 9 Sep 2024 09:11:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [styhead][oe-core][PATCH] gtk4: update 4.14.4 -> 4.14.5
Date: Mon,  9 Sep 2024 09:13:09 +0200
Message-ID: <20240909071309.1305279-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1725865900-23FFD446-1EE75268/0/0 CLEAN NORMAL
X-TOI-MSGID: 03d8ec0d-dbfb-4492-88b1-2172144ec149
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 07:11:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204312

Overview of Changes in 4.14.5, 16-08-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkSpinner:
 - Only set :checked state when mapped to avoid animation overhead

* GtkFileChooserWidget:
 - Plug memory leaks

* GtkProgressBar, GtkRange:
 - Fix hightlight clipping

* GtkSpinButton:
 - Set number input hint for numeric spin buttons

* GtkPopover:
 - Recompute the sampe more often
 - Handle allocation corner cases better

* GtkIconTheme:
 - Fix an argument order mishap that could lead to wrong icon selection

* Accessibility:
 - Use text instead of label for GtkLabesl accessible name
 - Improve the role mapping for containers
 - Realize the AT context when needed to fix AdwToast
 - Fix handling or relations in GtkExpander

* GDK:
 - Don't leak EGLSurfaces

* GSK:
 - Speed up mask nodes with cairo

* Vulkan:
 - Recreate the swapchain when necessary or beneficial

* Wayland:
 - Support the xdg-dialog protocol

* macOS:
 - Make Dock>Quit invoke the "app.quit" action
 - Take shadows into account when positioning popups
 - Propagate create-folder to Open panels

* Windows:
 - Backport build and runtime fixes for 32bit Windows
 - Ensure the dnd-move cursor exists

* Translation updates
 Catalan
 Chinese (Taiwan)
 Galician
 Hindi
 Hungarian
 Kabyle
 Nepali
 Persian
 Portuguese
 Romanian
 Serbian

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.14.4.bb =3D> gtk4_4.14.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.14.4.bb =3D> gtk4_4.14.5.bb} (98%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.14.5.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.14.4.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.14.5.bb
index 47e6298370..0b3d33f8eb 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.14.5.bb
@@ -38,7 +38,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "443518b97e8348f9f6430ac435b1010f9a6c5207f4dc6a7c=
d5d24e3820cee633"
+SRC_URI[sha256sum] =3D "5547f2b9f006b133993e070b87c17804e051efda3913feac=
a1108fa2be41e24d"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
--=20
2.46.0


