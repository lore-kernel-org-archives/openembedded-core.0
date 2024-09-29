Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718D4CF6495
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 14:01:52 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.32866.1727618502961474729
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 07:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout03.t-online.de (Postfix) with SMTP id D29FB51530
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 16:01:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.236.237]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1suuUW-0wfjzl0; Sun, 29 Sep 2024 16:01:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][master][PATCH 1/2] gtk4: update 4.16.0 -> 4.16.2
Date: Sun, 29 Sep 2024 16:03:27 +0200
Message-ID: <20240929140328.374391-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1727618500-E3FFD57C-8D478895/0/0 CLEAN NORMAL
X-TOI-MSGID: cb4d8c48-1bf9-44ab-b9a8-2b73980d0cb3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 14:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205055

Overview of Changes in 4.16.2, 09-25-2024
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

Overview of Changes in 4.16.1, 09-16-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkFileChooser:
 - Plug a memory leak

* GtkCalendar:
 - Avoid ending up with invalid dates

* Printing:
 - Fix initial printer selection in the print dialog

* Gsk:
 - Fix shadows for opaque textures
 - Fix a crash in a corner case

* Css:
 - Make relative paths work again in theme files

* Accessibility:
 - Fix detection of the Flatpak portal

* MacOS:
 - Fix keyboard input in popovers
 - Keep DND icons above regular windows
 - Ignore events from DND icons

* Translation updates
 Basque
 British English
 Bulgarian
 Czech
 Danish
 Georgian
 Hungarian
 Lithuanian
 Portuguese
 Spanish
 Swedish

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.16.0.bb =3D> gtk4_4.16.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.16.0.bb =3D> gtk4_4.16.2.bb} (98%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.16.0.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.16.2.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.16.0.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.16.2.bb
index 1fe1861105..91734cbdd6 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.16.0.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.16.2.bb
@@ -38,7 +38,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "8ef538778c82c09870a6cc325195049caec5593c1ca37df9=
15a7b6b10f5524ea"
+SRC_URI[sha256sum] =3D "34b624848e5de22a138b675ad6f39c0c7b9d67907c10e1fc=
7e5b03060e8d5437"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
--=20
2.46.0


