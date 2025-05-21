Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA32C54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 13:46:58 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.11395.1747835212764007390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 06:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout09.t-online.de (Postfix) with SMTP id 4B300130D
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 15:46:50 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.59]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uHjmS-0FhzEH0; Wed, 21 May 2025 15:46:48 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] mesa: update 25.1.0 -> 25.1.1
Date: Wed, 21 May 2025 15:46:40 +0200
Message-ID: <20250521134640.2675162-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1747835208-717F8541-5788DEB5/0/0 CLEAN NORMAL
X-TOI-MSGID: 1ae828d0-fdc6-4b25-8158-042625323780
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 13:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217028

- install gbm_backend_abi.h into libgbm-dev package

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 07a57b11c8..5262b3001e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,8 +20,8 @@ SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.=
xz \
            file://0001-dont-build-clover-frontend.patch \
 "
=20
-SRC_URI[sha256sum] =3D "b1c45888969ee5df997e2542654f735ab1b772924b442f30=
16d2293414c99c14"
-PV =3D "25.1.0"
+SRC_URI[sha256sum] =3D "cf942a18b7b9e9b88524dcbf0b31fed3cde18e6d52b3375b=
0ab6587a14415bce"
+PV =3D "25.1.1"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
@@ -345,7 +345,7 @@ FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}=
/drirc.d"
 FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${libdir}/libpow=
ervr_rogue.so ${datadir}/vulkan"
 FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
 FILES:libegl-mesa =3D "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendo=
r.d"
-FILES:libgbm =3D "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so ${include=
dir}/gbm_backend_abi.h"
+FILES:libgbm =3D "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so"
 FILES:libgallium =3D "${libdir}/libgallium-*.so"
 FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
 FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
@@ -358,7 +358,7 @@ FILES:libxatracker =3D "${libdir}/libxatracker.so.*"
=20
 FILES:${PN}-dev =3D "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${l=
ibdir}/vdpau/*.so"
 FILES:libegl-mesa-dev =3D "${libdir}/libEGL*.* ${includedir}/EGL ${inclu=
dedir}/KHR ${libdir}/pkgconfig/egl.pc"
-FILES:libgbm-dev =3D "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${in=
cludedir}/gbm.h"
+FILES:libgbm-dev =3D "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${in=
cludedir}/gbm.h ${includedir}/gbm_backend_abi.h"
 FILES:libgl-mesa-dev =3D "${libdir}/libGL.* ${includedir}/GL ${libdir}/p=
kgconfig/gl.pc"
 FILES:libglx-mesa-dev =3D "${libdir}/libGLX*.*"
 FILES:libglapi-dev =3D "${libdir}/libglapi.*"
--=20
2.49.0


