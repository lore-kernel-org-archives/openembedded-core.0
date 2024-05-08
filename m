Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44574C04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 19:17:09 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.5933.1715195824899618135
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 12:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id 665D86E71
	for <openembedded-core@lists.openembedded.org>; Wed,  8 May 2024 21:17:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.233.36]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s4mmj-0ZL3h30; Wed, 8 May 2024 21:17:01 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gtk4: update 4.14.2 -> 4.14.4
Date: Wed,  8 May 2024 21:17:13 +0200
Message-ID: <20240508191713.2704442-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1715195821-C5FF8D1D-1EDD28C4/0/0 CLEAN NORMAL
X-TOI-MSGID: e241b60e-a34f-4997-abf4-5694b88f1b79
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 19:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199130

Overview of Changes in 4.14.4, 02-05-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkGraphicsOffload:
 - Don't crash without a child

* Icontheme:
 - Make symbolic svg loading more efficient
 - Handle color-free symbolics more efficiently

* Accessibility:
 - Make the gtk-demo sidebar search more accessible
 - Stop emitting focus events

* GDK:
 - Support XDG_ACTIVATION_TOKEN
 - dmabuf: Be more defensive when importing unknown formats to G
 - dmabuf: Use narrow range for YUV

* GSK:
 - gpu: Handle  tiny offscreens correctl

* Build:
 - Fix many ubsan warning

* macOS
 - Fix problems with events handed back to the OS
 - Respect GDK_DEBUG=3Ddefault-settings

* Translation updates:
 German
 Indonesian
 Kabyle
 Korean
 Lithuanian
 Russian

Overview of Changes in 4.14.3, 18-04-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkShortcutManager:
 - Track the propagation phase of added controllers

* Accessibility:
 - Implement GtkAccessibleRange for scrollbars

* X11:
 - Fix some confusing debug messages
 - Drop a no-longer-relevant optimization that was interfering with
   getting the current window manager capabilities

* Tools:
 - Support generating pdf in gtk4-rendernode-tool

* Translation updates:
 Basque
 Brazilian Portuguese
 Georgian
 Hebrew
 Kabyle
 Persian
 Polish
 Slovenian
 Swedish
 Ukrainian

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.14.2.bb =3D> gtk4_4.14.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.14.2.bb =3D> gtk4_4.14.4.bb} (98%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.14.2.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.14.4.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.14.2.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.14.4.bb
index 39483357b4..cda0552f7c 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.14.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb
@@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "22604cef2898a79e5f2143bb7aee2b7d1fa2eb946989a9d1=
338ecf9c8ae0e072"
+SRC_URI[sha256sum] =3D "443518b97e8348f9f6430ac435b1010f9a6c5207f4dc6a7c=
d5d24e3820cee633"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
--=20
2.44.0


