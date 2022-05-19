Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FEFC433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 15:05:39 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web09.8643.1652972735093280658
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 08:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout09.t-online.de (Postfix) with SMTP id 2897817FC2
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 17:05:33 +0200 (CEST)
Received: from localhost.localdomain ([84.154.174.3]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nrhiU-1uUher0; Thu, 19 May 2022 17:05:30 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] mesa.inc: package 00-radv-defaults.conf
Date: Thu, 19 May 2022 17:05:23 +0200
Message-Id: <20220519150523.76410-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652972730-0000C4DD-FD30EB62/0/0 CLEAN NORMAL
X-TOI-MSGID: a135eaa4-09dc-4f96-8b30-15d6e149ed9c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 15:05:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165893

this fixes:

ERROR: mesa-2_22.0.2-r0 do_package: QA Issue: mesa: Files/directories wer=
e installed but not shipped in any package:
  /usr/share/drirc.d/00-radv-defaults.conf
Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
mesa: 1 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index d3571467b9..74faa31297 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -286,7 +286,7 @@ PACKAGESPLITFUNCS:prepend =3D "mesa_populate_packages=
 "
 PACKAGES_DYNAMIC +=3D "^mesa-driver-.*"
 PACKAGES_DYNAMIC:class-native =3D "^mesa-driver-.*-native"
=20
-FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}/drirc.d/00-mesa-de=
faults.conf"
+FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}/drirc.d"
 FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${datadir}/vulka=
n"
 FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
 FILES:libegl-mesa =3D "${libdir}/libEGL.so.*"
--=20
2.25.1


