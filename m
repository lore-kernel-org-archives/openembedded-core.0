Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1F8C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:19:47 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.6143.1701209979135315757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:19:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout04.t-online.de (Postfix) with SMTP id 7684E15C88
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 23:19:01 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.157]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r86Q0-1xhn4D0; Tue, 28 Nov 2023 23:19:00 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gtk4: upgrade 4.12.3 -> 4.12.4
Date: Tue, 28 Nov 2023 23:19:15 +0100
Message-ID: <20231128221915.2830592-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1701209940-05180954-8AF39BBF/0/0 CLEAN NORMAL
X-TOI-MSGID: 64e2f2f2-1948-434d-98c0-ad8823348f7d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191391

Overview of Changes in 4.12.4, 17-11-2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* a11y:
 - Tweak name computation for some corner cases

* gdk:
 - gl: Improve our use of GLES a bit (use vertex arrays and
   GL_BGRA if available)
 - Fix some errors in our memory format tables

* gsk:
 - gl: handle texture-scale nodes more faithfully
 - gl: Fix icon padding in the atlas

* Windows:
 - Stop relying on glib for build configuration

* Tools:
 - Add a --undecorated option to gtk4-rendernode-tool

* Translation updates
 Catalan
 French
 Romanian
 Russian
 Spanish
 Turkish

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.12.3.bb =3D> gtk4_4.12.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.12.3.bb =3D> gtk4_4.12.4.bb} (98%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.12.4.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.12.3.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.12.4.bb
index 001b06934e..1b2b5c0db8 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb
@@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "148ce262f6c86487455fb1d9793c3f58bc3e1da477a29617=
fadb0420f5870a89"
+SRC_URI[sha256sum] =3D "ba67c6498e5599f928edafb9e08a320adfaa50ab2f0da6fc=
6ab2252fc2d57520"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
--=20
2.42.1


