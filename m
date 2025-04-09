Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793EDC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 13:02:13 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.7881.1744203727019782915
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 06:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout12.t-online.de (Postfix) with SMTP id 8BA0E867
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Apr 2025 15:02:04 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.175.12]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u2V45-3inX2f0; Wed, 9 Apr 2025 15:02:01 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gtk4: update 4.18.3 -> 4.18.4
Date: Wed,  9 Apr 2025 15:01:54 +0200
Message-ID: <20250409130154.286713-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1744203721-05DC13EB-909A5E86/0/0 CLEAN NORMAL
X-TOI-MSGID: 99574e82-6b34-4efb-af5d-24cbf41a3eb5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 13:02:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214589

Overview of Changes in 4.18.4, 06-04-2025
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Bugs fixed:
  - #7447 4.18.3 regression: cursor doesn't update state when crossing wi=
ndow
    boundaries (Matthias Clasen)
  - #7459 Gtk.Video causes segfault inside VM with wayland backend (Matth=
ias
    Clasen)
  - #7466 Win32: can't resize or move windows anymore (Matthias Clasen)
  - !8375 testsuite: Make reftest-compare use gsize instead of int (Benja=
min
    Otte)
  - !8378 wayland: Force setting cursor on enter
  - !8394 wayland: Force setting cursor on enter
  - !8400 Merge fixes from !8375 into 4.18
  - !8403 inspector: Survive without installed schemas
  - !8408 builder: Fix a menu parsing issue
  - !8422 win32: Fix initial window state
  - !8429 vulkan: Do not create dmabuf target images if not enabled

* Translation updates:
  - Bulgarian (Alexander Shopov)
  - Chinese (China) (Luming Zh)
  - Czech (Daniel Rusek)
  - Georgian (Ekaterine Papava)
  - Lithuanian (Aurimas =C4=8Cernius)
  - Persian (Danial Behzadi)
  - Portuguese (Hugo Carvalho)
  - Slovenian (Martin)
  - Turkish (Emin Tufan =C3=87etin)
  - Ukrainian (Yuri Chornoivan)
---
 meta/recipes-gnome/gtk+/{gtk4_4.18.3.bb =3D> gtk4_4.18.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.18.3.bb =3D> gtk4_4.18.4.bb} (98%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.18.4.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.18.3.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.18.4.bb
index 6995cfa725..bb26123195 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.18.3.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.18.4.bb
@@ -38,7 +38,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "081e1bc0b17db41a935af8d1f6f090fb1988936c42ff734d=
149f3d004119f8bb"
+SRC_URI[sha256sum] =3D "d4783ac15037c2c4275a8f1acc94f5fede28a516243fccb9=
2ff54a11c15775ff"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
--=20
2.49.0


