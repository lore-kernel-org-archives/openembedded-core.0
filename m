Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4150C4332F
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 13:23:54 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.10703.1672579427736413686
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 05:23:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout07.t-online.de (Postfix) with SMTP id C6859B2C9
	for <openembedded-core@lists.openembedded.org>; Sun,  1 Jan 2023 14:23:45 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.39.113]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pByJU-0Xojuz0; Sun, 1 Jan 2023 14:23:45 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] gtk4: update 4.8.2 -> 4.8.3
Date: Sun,  1 Jan 2023 14:23:26 +0100
Message-Id: <20230101132326.398971-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672579425-3F7EFB8C-A58A4B4D/0/0 CLEAN NORMAL
X-TOI-MSGID: cf89699d-d23c-4e4d-b2de-b684fcb22b5a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 13:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175185

Overview of Changes in 4.8.3, 12-22-2022
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkText:
 - Claim gestures more selectively
 - Prevent unexpected notify::direction emissions

* Accessibility:
 - Remember if we don't find the a11y bus

* DND:
 - Prefer file:// urls over other protocols

* GtkMountOperation:
 - Work on Wayland

* GtkListView:
 - Cancel rubberband if not handling drag

* Wayland:
 - Fix button masks

* Windows:
 - Fix resizes with native decorations

* X11:
 - Fix some ordering problems with surface destruction

* Translation updates
 Abkhazian
 Basque
 Dutch
 Hungarian
 Interlingue
 Georgian
 Persian
 Russian
 Spanish
 Turkish

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.8.2.bb =3D> gtk4_4.8.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.8.2.bb =3D> gtk4_4.8.3.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb b/meta/recipes-gnome/g=
tk+/gtk4_4.8.3.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.8.2.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
index fe18fa2ffd..6101905128 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.8.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
@@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "85b7a160b6e02eafa4e7d38f046f8720fab537d3fe73c01c=
864333a983a692a9"
+SRC_URI[sha256sum] =3D "b362f968d085b4d3d9340d4d38c706377ded9d5374e694a2=
b6b7e6292e3cba74"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
@@ -106,7 +106,6 @@ GTKBASE_RRECOMMENDS ?=3D " \
     adwaita-icon-theme-symbolic \
 "
=20
-
 GTKBASE_RRECOMMENDS:class-native ?=3D ""
=20
 GTKGLIBC_RRECOMMENDS ?=3D "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
--=20
2.34.1


