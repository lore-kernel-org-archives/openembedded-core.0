Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44696C83F12
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 05:46:28 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.11302.1693287985368334018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 22:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout11.t-online.de (Postfix) with SMTP id 8C2853670
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 07:46:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.173.90]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qarYU-3Off6H0; Tue, 29 Aug 2023 07:46:22 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gtk4: upgrade 4.12.0 -> 4.12.1
Date: Tue, 29 Aug 2023 07:46:15 +0200
Message-ID: <20230829054615.80598-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1693287982-051CA670-DF402645/0/0 CLEAN NORMAL
X-TOI-MSGID: 3122c831-7ddb-4ec7-bc68-a0f15e80be73
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 05:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186849

Overview of Changes in 4.12.1, 25-08-2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkGridView:
* Wayland:
 - Fix a crash with compositors other than gnome-shell

* Translation updates:
 Polish
 Swedish

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.12.0.bb =3D> gtk4_4.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.12.0.bb =3D> gtk4_4.12.1.bb} (98%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.12.1.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
index 4f38e0cb2c..aa7115b11e 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
@@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "a6d10829f405b1afc0b65e2a9642c04126a1d1b638d11c6d=
97426da4f84f1f6f"
+SRC_URI[sha256sum] =3D "b8b61d6cf94fac64bf3a0bfc7af137c9dd2f8360033fdeb0=
cfe9612b77a99a72"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
--=20
2.41.0


