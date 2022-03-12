Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6929AC433EF
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 07:30:56 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web12.2791.1647070255209021079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 23:30:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout09.t-online.de (Postfix) with SMTP id 8514017EFD
	for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 08:30:52 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.239]) by fwd83.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nSwD7-1FWgtu0; Sat, 12 Mar 2022 08:30:45 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv3 2/3] gtk+3: remove deprecated option
Date: Sat, 12 Mar 2022 08:30:21 +0100
Message-Id: <20220312073022.2894-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220312073022.2894-1-f_l_k@t-online.de>
References: <20220312073022.2894-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647070245-0000EDC4-A90DD7DE/0/0 CLEAN NORMAL
X-TOI-MSGID: 2367534d-78f3-48c2-906a-3c598b27c1cd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 07:30:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163083

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/=
gtk+3.inc
index 60620eef93..7d50d7bd2e 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -49,15 +49,13 @@ do_compile:prepend() {
         export GIR_EXTRA_LIBS_PATH=3D"${B}/gdk/.libs"
 }
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl wayla=
nd x11', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11',=
 'glx', '', d)}"
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl wayla=
nd x11', d)}"
 PACKAGECONFIG:class-native =3D "${@bb.utils.filter('DISTRO_FEATURES', 'x=
11', d)}"
 PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES',=
 'x11', d)}"
=20
 PACKAGECONFIG[x11] =3D "--enable-x11-backend,--disable-x11-backend,at-sp=
i2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr li=
bxrender libxcomposite libxfixes"
 # this is provided by oe-core patch that removes epoxy/gl dependency fro=
m a X11 build
 PACKAGECONFIG[opengl] =3D "--enable-opengl,--disable-opengl,libepoxy"
-PACKAGECONFIG[glx] =3D "--enable-glx,--disable-glx,,libgl"
 PACKAGECONFIG[wayland] =3D "--enable-wayland-backend,--disable-wayland-b=
ackend,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles=
2 wayland-native"
 PACKAGECONFIG[cups] =3D "--enable-cups,--disable-cups,cups"
 PACKAGECONFIG[colord] =3D "--enable-colord,--disable-colord,colord"
--=20
2.25.1


