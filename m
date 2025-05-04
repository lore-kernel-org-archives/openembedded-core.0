Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E7BC369DC
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 21:01:21 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.36509.1746392473785247467
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 14:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout10.t-online.de (Postfix) with SMTP id B5CBF446
	for <openembedded-core@lists.openembedded.org>; Sun,  4 May 2025 23:01:11 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.230.78]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uBgSU-1YpxqL0; Sun, 4 May 2025 23:01:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gtk4: update 4.18.4 -> 4.18.5
Date: Sun,  4 May 2025 23:01:02 +0200
Message-ID: <20250504210102.304410-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1746392470-4FFFCAE4-46D3E870/0/0 CLEAN NORMAL
X-TOI-MSGID: 3740972f-8695-485d-873a-6f4d95915f41
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 21:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215973

Overview of Changes in 4.18.5, 03-05-2025
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Bugs fixed:
  - #5844 `gdk_surface_get_device_position: assertion 'GDK_IS_SURFACE (su=
rface)'
    failed` on popover close (Alessandro Astone)
  - #7451 Cairo device scale changes lead to significant performance regr=
ession
    in cairo blur (Sebastian Keller)
  - #7479 gtkmm programs fail to start on Windows with AccessKit support =
enabled
    (Matthias Clasen)
  - #7482 Epiphany Crash in GTK file chooser when last used directory has
    insufficient filesystem permissions: "GFileInfo created without
    standard::type" (Philip Withnall)
  - #7495 Failed to link with the mold linker (Matthias Clasen)
  - #7513 Broken boxed-list ListBox (Sergey Bugaev)
  - #7520 XCompose preventing GTK4 applications from launching (again) (M=
atthias
    Clasen)
  - #7522 critical when selecting label with use-underline but mnemonic w=
ith
    screenreader enabled (Markus G=C3=B6llnitz)
  - !8432 GTK 4.18.4
  - !8461 Some cherry-picked fixes for 4.18 (Sebastian Keller, Benjamin O=
tte,
    Florian "sp1rit"=E2=80=8B)
  - !8487 early exit  if the clipped bound rectangle's area is zero after
    snapping (Benjamin Otte)
  - !8496 macos: fix crash when unfullscreening windows (4.18 backport) (=
Arjan
    Molenaar)
  - !8505 Backport: update macOS job for new CI runner (Rene=CC=81 de Hes=
selle)
  - !8526 build: pin the msvc build to meson 1.7 (Matthias Clasen)
  - !8527 build: pin the msvc build to meson 1.7 (Alessandro Astone, S=C3=
=A9bastien
    Wilmet, Sergey Bugaev, Vladimir Vaskov, Markus G=C3=B6llnitz, Michael=
 Weghorn,
    Philip Withnall, Luk=C3=A1=C5=A1 Tyrychtr, Benjamin Otte, Matthias Cl=
asen, Liu
    Jinchang, kolunmi, FeRD (Frank Dana))

* Translation updates:
  - Bulgarian (Alexander Shopov)
  - Catalan (Jordi Mas i Hernandez)
  - Chinese (China) (Luming Zh)
  - Czech (Daniel Rusek)
  - Georgian (Ekaterine Papava)
  - Hungarian (Bal=C3=A1zs =C3=9Ar)
  - Lithuanian (Aurimas =C4=8Cernius)
  - Persian (Danial Behzadi)
  - Polish (Piotr Dr=C4=85g)
  - Portuguese (Hugo Carvalho)
  - Portuguese (Brazil) (=C3=81lvaro Burns)
  - Romanian (Antonio Marin)
  - Russian (Artur S0)
  - Slovenian (Martin)
  - Spanish (Daniel Mustieles)
  - Swedish (Anders Jonsson)
  - Turkish (Emin Tufan =C3=87etin)
  - Ukrainian (Yuri Chornoivan)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.18.4.bb =3D> gtk4_4.18.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.18.4.bb =3D> gtk4_4.18.5.bb} (98%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.18.4.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.18.5.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.18.4.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.18.5.bb
index bb26123195..85773b1174 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.18.4.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.18.5.bb
@@ -38,7 +38,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "d4783ac15037c2c4275a8f1acc94f5fede28a516243fccb9=
2ff54a11c15775ff"
+SRC_URI[sha256sum] =3D "bb5267a062f5936947d34c9999390a674b0b2b0d8aa3472f=
e0d05e2064955abc"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
--=20
2.49.0


