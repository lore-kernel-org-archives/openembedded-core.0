Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1238CC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 17:07:23 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.99.1647450441149455611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 10:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout03.t-online.de (Postfix) with SMTP id 97435D05
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 18:07:19 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.155]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nUX7G-0vpDeb0; Wed, 16 Mar 2022 18:07:18 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 1/4] xf86-video-intel: add dependencies; remove dri1
Date: Wed, 16 Mar 2022 18:07:06 +0100
Message-Id: <20220316170709.2924162-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647450438-0000C4DD-E275A20B/0/0 CLEAN NORMAL
X-TOI-MSGID: 2d270142-0cf0-48c5-8e4f-94bde991e2b8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 17:07:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163342

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/=
meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 9430c3f4bb..74ec57aa66 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -18,19 +18,17 @@ SRC_URI =3D "git://anongit.freedesktop.org/xorg/drive=
r/xf86-video-intel;branch=3Dmas
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
-DEPENDS +=3D "virtual/libx11 drm libpciaccess pixman"
+DEPENDS +=3D "virtual/libx11 drm libpciaccess pixman cairo libpng libxcb=
 libxcomposite libxdamage libxrender libxrandr libxext libxfixes"
=20
-PACKAGECONFIG ??=3D "sna xvmc uxa udev ${@bb.utils.contains('DISTRO_FEAT=
URES', 'opengl', 'dri dri2 dri3', '', d)}"
+PACKAGECONFIG ??=3D "sna xvmc uxa udev ${@bb.utils.contains('DISTRO_FEAT=
URES', 'opengl', 'dri2 dri3', '', d)}"
=20
-PACKAGECONFIG[dri] =3D "--enable-dri,--disable-dri"
-PACKAGECONFIG[dri1] =3D "--enable-dri1,--disable-dri1"
 PACKAGECONFIG[dri2] =3D "--enable-dri2,--disable-dri2"
 PACKAGECONFIG[dri3] =3D "--enable-dri3,--disable-dri3"
 PACKAGECONFIG[sna] =3D "--enable-sna,--disable-sna"
 PACKAGECONFIG[uxa] =3D "--enable-uxa,--disable-uxa"
 PACKAGECONFIG[udev] =3D "--enable-udev,--disable-udev,udev"
 PACKAGECONFIG[xvmc] =3D "--enable-xvmc,--disable-xvmc,libxvmc xcb-util"
-PACKAGECONFIG[tools] =3D "--enable-tools,--disable-tools,libxinerama lib=
xrandr libxdamage libxfixes libxcursor libxtst libxrender libxscrnsaver l=
ibxext libx11 pixman libxcb libxshmfence"
+PACKAGECONFIG[tools] =3D "--enable-tools,--disable-tools,libxinerama lib=
xcursor libxtst libxscrnsaver libxshmfence"
=20
 # --enable-kms-only option is required by ROOTLESS_X
 EXTRA_OECONF +=3D '${@oe.utils.conditional( "ROOTLESS_X", "1", " --enabl=
e-kms-only", "", d )}'
--=20
2.25.1


