Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B9CC072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 06:58:11 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.7136.1700204281138367896
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 22:58:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout12.t-online.de (Postfix) with SMTP id DDA725419
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 07:57:58 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.236.213]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r3sne-0jBnJh0; Fri, 17 Nov 2023 07:57:58 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gtk: Add rdepend on printbackend for cups
Date: Fri, 17 Nov 2023 07:58:15 +0100
Message-ID: <20231117065815.17929-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700204278-D7FFC93F-68CB026B/0/0 CLEAN NORMAL
X-TOI-MSGID: 6727ada1-6f8d-4346-9ea7-bf8d8e799e1d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 06:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190832

install the required printbackends

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/gtk+3.inc      | 2 +-
 meta/recipes-gnome/gtk+/gtk4_4.12.3.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/=
gtk+3.inc
index 8d01e6077f..4a04c06432 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -41,7 +41,7 @@ PACKAGECONFIG[x11] =3D "-Dx11_backend=3Dtrue,-Dx11_back=
end=3Dfalse,at-spi2-atk fontcon
 # this is provided by oe-core patch that removes epoxy/gl dependency fro=
m a X11 build
 PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue,-Dopengl=3Dfalse,libepoxy"
 PACKAGECONFIG[wayland] =3D "-Dwayland_backend=3Dtrue,-Dwayland_backend=3D=
false,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2=
 wayland-native"
-PACKAGECONFIG[cups] =3D ",,cups,cups"
+PACKAGECONFIG[cups] =3D ",,cups,cups gtk3-printbackend-cups"
 PACKAGECONFIG[colord] =3D "-Dcolord=3Dyes,-Dcolord=3Dno,colord"
 PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Dtrue,-Dcloudprovid=
ers=3Dfalse,libcloudproviders"
 PACKAGECONFIG[tracker3] =3D "-Dtracker3=3Dtrue,-Dtracker3=3Dfalse,tracke=
r,tracker-miners"
diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.12.3.bb
index a547db8376..001b06934e 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb
@@ -66,7 +66,7 @@ PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('=
DISTRO_FEATURES', 'x11', d)
 PACKAGECONFIG[x11] =3D "-Dx11-backend=3Dtrue,-Dx11-backend=3Dfalse,at-sp=
i2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr li=
bxrender libxcomposite libxfixes xinerama"
 PACKAGECONFIG[wayland] =3D "-Dwayland-backend=3Dtrue,-Dwayland-backend=3D=
false,wayland wayland-protocols virtual/egl virtual/libgles2 wayland-nati=
ve"
 PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Denabled,-Dcloudpro=
viders=3Ddisabled,libcloudproviders"
-PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,=
cups,cups"
+PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,=
cups,cups gtk4-printbackend-cups"
 PACKAGECONFIG[colord] =3D "-Dcolord=3Denabled,-Dcolord=3Ddisabled,colord=
"
 PACKAGECONFIG[iso-codes] =3D ",,iso-codes,iso-codes"
 PACKAGECONFIG[ffmpeg] =3D "-Dmedia-ffmpeg=3Denabled,-Dmedia-ffmpeg=3Ddis=
abled,ffmpeg"
--=20
2.42.0


