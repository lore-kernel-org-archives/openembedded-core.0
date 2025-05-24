Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9FFC54ED1
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 08:10:53 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.3393.1748074249564470433
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 01:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout10.t-online.de (Postfix) with SMTP id 7C47E11E9
	for <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 10:10:47 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.170.145]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uIjxr-3y0inJ0; Sat, 24 May 2025 10:10:43 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv2] mesa: make asahi dependent on opencl
Date: Sat, 24 May 2025 10:10:34 +0200
Message-ID: <20250524081034.3635-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1748074243-6CFF75E4-8339FD7E/0/0 CLEAN NORMAL
X-TOI-MSGID: 6483d0c6-7250-4382-aacd-685f71333fe6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 08:10:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217224

asahi not only depends on libclc but also requires rusticl

-remove obsolete comment

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 5262b3001e..7addd8c623 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -102,7 +102,7 @@ PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}=
"
 PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-prot=
ocols"
=20
 VULKAN_DRIVERS_AMD =3D "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',a=
md', '', d)}"
-VULKAN_DRIVERS_ASAHI =3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi l=
ibclc', ',asahi', '', d)}"
+VULKAN_DRIVERS_ASAHI =3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi l=
ibclc opencl', ',asahi', '', d)}"
 VULKAN_DRIVERS_INTEL =3D "${@bb.utils.contains('PACKAGECONFIG', 'intel l=
ibclc', ',intel', '', d)}"
 VULKAN_DRIVERS_SWRAST =3D ",swrast"
 # Crashes on x32
@@ -169,8 +169,7 @@ GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACK=
AGECONFIG', 'vc4', ',vc4', ''
 GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'v3d', =
',v3d', '', d)}"
 GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'zink',=
 ',zink', '', d)}"
=20
-# radeonsi requires LLVM
-GALLIUMDRIVERS_ASAHI =3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi l=
ibclc', ',asahi', '', d)}"
+GALLIUMDRIVERS_ASAHI =3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi l=
ibclc opencl', ',asahi', '', d)}"
 GALLIUMDRIVERS_IRIS =3D "${@bb.utils.contains('PACKAGECONFIG', 'intel li=
bclc', ',iris', '', d)}"
 GALLIUMDRIVERS_RADEONSI =3D "${@bb.utils.contains('PACKAGECONFIG', 'amd'=
, ',radeonsi', '', d)}"
 GALLIUMDRIVERS_LLVMPIPE =3D ",llvmpipe"
--=20
2.49.0


