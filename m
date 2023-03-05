Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873C5C6FA8E
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 17:25:08 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.13391.1678037104890949233
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 09:25:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout03.t-online.de (Postfix) with SMTP id 4C3E1169D2
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 18:25:02 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.43.219]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pYs6W-4VvVmz0; Sun, 5 Mar 2023 18:25:00 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] gtk4: update 4.8.3 -> 4.10.0
Date: Sun,  5 Mar 2023 18:24:49 +0100
Message-Id: <20230305172449.222428-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678037100-D4BB39DF-729902FF/0/0 CLEAN NORMAL
X-TOI-MSGID: e05cc775-3ab4-4378-89b2-703c6d4470db
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 17:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178045

A testsuite was added that breaks musl build -> disable by default

Overview of Changes in 4.10.0, 04-03-2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* GtkTextView
 - Document hanging indentation
* GtkListView
 - Fix a size allocation problem
* GtkFileChooser
 - Fix paned behavior
 - Fix a crash
* GtkText
 - Fix various problems with undo
* Accessibility
 - Make some getters transfer-full
 - Allow setting accessible parents and siblings
 - Add a role for toggle buttons
 - Miscellaneous property fixes and improvements
* gtk
 - Improve the handling resize-during-size-allocate
* gdk
 - Introduce GdkTextureDownloader and use it
 - Make gdk_texture_get_format public
* gsk
 - Make mask nodes more versatile
 - Improve the GL implementation for texture scale nodes
* X11
 - Fix key handling during DND
* Tools
 - gtk-builder-tool: Try harder to handle templates
 - gtk-builder-tool: Prefer properties over <child>

* Translation updates
 Basque
 Belarusian
 Bulgarian
 Indonesian
 Galician
 Georgian
 German
 Hebrew
 Lithuanian
 Portuguese
 Spanish
 Swedish
 Turkish
 Ukrainian

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.8.3.bb =3D> gtk4_4.9.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.8.3.bb =3D> gtk4_4.9.4.bb} (96%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb b/meta/recipes-gnome/g=
tk+/gtk4_4.9.4.bb
similarity index 96%
rename from meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.9.4.bb
index b367cb066b..5362dbd1e1 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.9.4.bb
@@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "b362f968d085b4d3d9340d4d38c706377ded9d5374e694a2=
b6b7e6292e3cba74"
+SRC_URI[sha256sum] =3D "91a3afd58401d4e5d81e30b08ee3f113a4768ff10140336a=
72a326c77272be30"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
@@ -57,7 +57,7 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
-EXTRA_OEMESON =3D " -Dbuild-tests=3Dfalse -Ddemos=3Dfalse"
+EXTRA_OEMESON =3D " -Dbuild-tests=3Dfalse -Dbuild-testsuite=3Dfalse -Dde=
mos=3Dfalse"
=20
 PACKAGECONFIG ??=3D "gstreamer ${@bb.utils.filter('DISTRO_FEATURES', 'wa=
yland x11 vulkan', d)}"
 PACKAGECONFIG:class-native =3D "${@bb.utils.filter('DISTRO_FEATURES', 'x=
11', d)}"
--=20
2.34.1


