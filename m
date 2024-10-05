Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C195CF8875
	for <webhook@archiver.kernel.org>; Sat,  5 Oct 2024 08:24:16 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.7813.1728116650357342463
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Oct 2024 01:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout05.t-online.de (Postfix) with SMTP id B783C50F5
	for <openembedded-core@lists.openembedded.org>; Sat,  5 Oct 2024 10:24:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.173.87]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sx057-1U2z1V0; Sat, 5 Oct 2024 10:24:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][master][PATCH] gtk4: update 4.16.1 -> 4.16.3
Date: Sat,  5 Oct 2024 10:25:57 +0200
Message-ID: <20241005082557.23504-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1728116645-067FA41C-8638A161/0/0 CLEAN NORMAL
X-TOI-MSGID: 0207e3ca-44ff-4dc5-a5f4-6ff2b5a6fe2f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Oct 2024 08:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205239

Overview of Changes in 4.16.3, 04-10-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkScrolledWindow
 - Fix criticals in size allocation code

* GtkFileChooser
 - Fix a crash in the portal code

* GtkPicture
 - Avoid unnecessary resizes

* GtkVideo
 - Make dmabufs work without GL

* Accessibility:
 - Always realized non-widget accessibles

* Wayland:
 - Improve settings portal handling
 - Improve fallback for cursor themes
 - Sync default values for settings with schema defaults

* Translation updates:
 Brazilian Portuguese
 Galician
 Swedish

Overview of Changes in 4.16.2, 25-09-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkLabel:
 - Fix centered text in RTL

* Gsk:
 - Speed up some Vulkan operations
 - Improve startup speed by avoiding initialization
   of GL and Vulkan in most cases
 - Reduce critials at startup to warnings
 - Fix a crash on startup with some Vulkan drivers
 - Fix a big texture leak in NGL

* Gdk:
 - Speed up memory format conversions

* Wayland:
 - Be more careful with mimetypes during DND or copy-paste

* Tools:
 - builder-tool: Improve conversion of boxes

* Translation updates:
 Brazilian Portuguese
 Bulgarian
 Catalan
 Chinese (China)
 Georgian
 German
 Hebrew
 Indonesian
 Persian
 Polish
 Portuguese
 Slovenian
 Spanish
 Turkish
 Ukrainian

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.16.1.bb =3D> gtk4_4.16.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.16.1.bb =3D> gtk4_4.16.3.bb} (98%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.16.3.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.16.1.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.16.3.bb
index 30b2b16a6f..b8dce36c0d 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.16.3.bb
@@ -38,7 +38,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "926a1eabd481f9bfa25538f95016fdfcfaf963b2f90b40ae=
69e90def5499215c"
+SRC_URI[sha256sum] =3D "2ec53e07d18c9f003b39e4a6a838054d9259e048b6c4c05d=
80c0d05aa721d944"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
--=20
2.46.1


