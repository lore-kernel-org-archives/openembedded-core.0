Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4D2C47258
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 00:42:58 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.3714.1706229774491013738
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 16:42:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout11.t-online.de (Postfix) with SMTP id 979D2A538
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 01:42:52 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.175.38]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rTAIy-0Clwqv0; Fri, 26 Jan 2024 01:42:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gtk4: update 4.12.4 -> 4.12.5
Date: Fri, 26 Jan 2024 01:42:51 +0100
Message-ID: <20240126004251.2524-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1706229768-34F1AC95-161BC322/0/0 CLEAN NORMAL
X-TOI-MSGID: 9bd0d290-2f7f-4150-a274-15824911c4e6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 00:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194338

Overview of Changes in 4.12.5, 17-01-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkColumnView:
 - Fix a crash on dispose

* GtkEmojiChooser:
 - Update to CLDR v44
 - Add more translations

* GtkFileDialog:
 - Return an error if no file is selected
 - Make closing the portal file chooser work

* GtkDropDown:
 - Fix display of the initial checkmark

* GtkShortcutsWindow:
 - Reduce the minimum width

* GDK:
 - Make the png loader safer against overflow

* Windows:
 - Use new clipboard api

* Wayland:
 - Fix cursor handling with graphics tablets

* macOS:
 - Silence secure-restore message
 - Fix build on macOS < 10.13

* Translation updates
 Basque
 British English
 Catalan
 Chinese (China)
 Czech
 Georgian
 German
 Hebrew
 Indonesian
 Lithuanian
 Persian
 Polish
 Romanian
 Russian
 Slovenian
 Swedish
 Turkish
 Ukrainian
 Vietnamese

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.12.4.bb =3D> gtk4_4.12.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.12.4.bb =3D> gtk4_4.12.5.bb} (98%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.12.5.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.12.4.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.12.5.bb
index 1b2b5c0db8..65ac1071f8 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb
@@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "ba67c6498e5599f928edafb9e08a320adfaa50ab2f0da6fc=
6ab2252fc2d57520"
+SRC_URI[sha256sum] =3D "28b356d590ee68ef626e2ef9820b2dd21441484a9a042a5a=
3f0c40e9dfc4f4f8"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
--=20
2.43.0


