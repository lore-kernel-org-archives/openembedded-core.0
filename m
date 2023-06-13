Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20138C77B7A
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 06:46:25 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.7585.1686638780381857300
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 23:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout05.t-online.de (Postfix) with SMTP id 3E25814C1C
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 08:46:18 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.41.153]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q8xnE-1BJSRF0; Tue, 13 Jun 2023 08:46:16 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] gtk4: upgrade 4.10.3 -> 4.10.4
Date: Tue, 13 Jun 2023 08:46:02 +0200
Message-Id: <20230613064602.6097-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686638776-ADD8FDAB-C0C15B46/0/0 CLEAN NORMAL
X-TOI-MSGID: 2fae05c7-829f-47e8-9642-4d6e0b2ddab8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 06:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182693

Overview of Changes in 4.10.4, 05-06 2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkFileChooser
 - Fix some memory leaks

* GtkUriLauncher
 - Validate the uri

* GtkStack
 - Fix a crash

* GtkGridView
 - Respect css border-spacing

* GtkScrolledWindow
 - Propagate child measure size whenever possible

* GtkPopoverMenu:
 - Avoid unnecessary left padding

* GtkSearchEntry:
 - Improve size allocation for the clear icon

* X11
 - Avoid black flickering with xwayland window decorations
 - Trap XRandr errors

* CSS
 - Various fixes to transitions

* Translation updates:
 Basque
 Catalan
 Chinese (China)
 French
 Galician
 Indonesian
 Lithuanian
 Persian
 Russian
 Swedish
 Turkish
 Ukrainian

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.10.3.bb =3D> gtk4_4.10.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.10.3.bb =3D> gtk4_4.10.4.bb} (98%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.10.3.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.10.4.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.10.3.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.10.4.bb
index 9aa33e6851..2d1e0e74a9 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.10.3.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.10.4.bb
@@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "4545441ad79e377eb6e0a705026dc7a46886e46a1b034db4=
0912909da801cea9"
+SRC_URI[sha256sum] =3D "7725400482e0685e28265e226c62847f4e73cfca9e9b416a=
c5838207f5377a24"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
--=20
2.34.1


