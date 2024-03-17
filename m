Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FE9C54E60
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 17:24:07 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.23530.1710696241980361759
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 10:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout05.t-online.de (Postfix) with SMTP id B689C1BA61
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 18:23:59 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.225.66]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rluEm-02klN30; Sun, 17 Mar 2024 18:23:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gtk4: update 4.12.5 -> 4.14.1
Date: Sun, 17 Mar 2024 18:24:16 +0100
Message-ID: <20240317172416.24988-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710696236-86FFA968-F095D95C/0/0 CLEAN NORMAL
X-TOI-MSGID: 9ebc96be-03aa-49d7-8e13-92745d4cd5b0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 17:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197268

- Remove ffmpeg backend as it was removed upstream

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.12.5.bb =3D> gtk4_4.14.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.12.5.bb =3D> gtk4_4.14.1.bb} (96%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.14.1.bb
similarity index 96%
rename from meta/recipes-gnome/gtk+/gtk4_4.12.5.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
index a418ef878f..ce733769a5 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
@@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "28b356d590ee68ef626e2ef9820b2dd21441484a9a042a5a=
3f0c40e9dfc4f4f8"
+SRC_URI[sha256sum] =3D "fcefb3f132f8cc4711a9efa5b353c9ae9bb5eeff0246fa74=
dbc2f2f839b9e308"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
@@ -71,7 +71,6 @@ PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3De=
nabled,-Dcloudproviders=3Ddisab
 PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,=
cups,cups gtk4-printbackend-cups"
 PACKAGECONFIG[colord] =3D "-Dcolord=3Denabled,-Dcolord=3Ddisabled,colord=
"
 PACKAGECONFIG[iso-codes] =3D ",,iso-codes,iso-codes"
-PACKAGECONFIG[ffmpeg] =3D "-Dmedia-ffmpeg=3Denabled,-Dmedia-ffmpeg=3Ddis=
abled,ffmpeg"
 # gtk4 wants gstreamer-player-1.0 -> gstreamer1.0-plugins-bad
 PACKAGECONFIG[gstreamer] =3D "-Dmedia-gstreamer=3Denabled,-Dmedia-gstrea=
mer=3Ddisabled,gstreamer1.0-plugins-bad"
 PACKAGECONFIG[tracker] =3D "-Dtracker=3Denabled,-Dtracker=3Ddisabled,tra=
cker,tracker-miners"
--=20
2.44.0


