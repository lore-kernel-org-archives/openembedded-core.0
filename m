Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2216C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 09:08:43 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 by mx.groups.io with SMTP id smtpd.web10.38810.1710752915125645435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 02:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=marcel@ziswiler.com header.s=s1-ionos header.b=xPZUcla2;
 spf=pass (domain: ziswiler.com, ip: 74.208.4.194, mailfrom: marcel@ziswiler.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1710752910; x=1711357710; i=marcel@ziswiler.com;
	bh=K3Ty1I5P9enSD8EOLkcYV10ReFboG3Qf0aLbApKF60c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=xPZUcla25na7xBncIG3e8DZhxS6EbN63ldBz0fES0TotznixU3zw1WiYKjkM/uI5
	 poop+/EDgg0j0ngPq7o/zteiRnwPd78QU5rZ0n7ixY43PLP3As0bXptzf4NMd3IFl
	 q2Hnj+obajMjIuS5O7ILA3qCkmZiMhspV0djF4lSzfGDjEz7vCP/ZHGBLw4dBz+YG
	 TMaOKbPyOc6p8fpBjIiLuBduyUnxcdas7pZmVNFKbtt3LdmCIUwq1pbH/AEipeRW1
	 TRUsh5HKWQq8NwXr2JQ+cXv6+hd2Szp/mGJbUpLXYUKVeyGNLOhXUy/CApU8ol3tV
	 b80yuXgxK/OQ/tJRQg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost.localdomain ([84.227.227.254]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1N1xEj-1qksBo3GiP-012Gh4;
 Mon, 18 Mar 2024 10:08:30 +0100
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-core@lists.openembedded.org
Cc: Randolph Sapp <rs@ti.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Ryan Eatmon <reatmon@ti.com>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [oe-core][PATCH v2] mesa: enable imagination powervr support
Date: Mon, 18 Mar 2024 10:08:00 +0100
Message-ID: <20240318090819.39645-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FFArqUy03xnyoCvnUHULdugSKUtQYCJTasUMcWLZTAfA4qtTr4Y
 uZ3veKmsrqSJhjBo9NOMjQrpIKLmQhV0igs4RlMiZrfejg+hP3xxr1B86lPAYiOkZt0nieU
 Qyj9zS0ONC1bQYnvVhMI+Z1Df2bVR9BPEGroRrwIj99qrwjnnIs+2EyVVIk6iNL4Jf0d0hw
 MNl+FTfvVp6ttu5EHG32Q==
UI-OutboundReport: notjunk:1;M01:P0:93MZnnc7hU0=;dTdWHxd+S0GUtTCVGW5WNH6WEQs
 pvhKUzWT0VBpp//8M8CqvgXzmEkhNEwrixa87HSVIPqGEGoA9+vVAJRXA5nK4OvuqAE3N6Tck
 6zetzxo3Lx6t9YACWngX6YAkJp5rqdg/iKElW6MsS+elTjlS8fV4ohYuLfXMTIpNFc8HkyuZ7
 uJaQc5aiWt4ZP6ree0+EPjGUp8lKPg5KCRiEQNgkObQkBWECtxUQzLPY1uKt5HeiS455EmTZ+
 TpqsGzvC3V385J2WyRxJS5e6UsYeQrYJjZ/MtFeutlnXs2eD6ioojTGZk2nsoABEry9eWsVgF
 gOk8lCZ4Wh+ttvlCpXUkwqCg6bwPXTfHoZAdC01wuJgm70donwfg8hS8OdMupQ8p2mfnI22Zm
 YD7RjDBlCqjdJPsj6TAyjxuAYj7EDwkzEVo/l44uyuZqNPkjNpyBiUJAv9hftWyHekW2jdEB0
 yIMM580QEidg8XEgl4z5FkN56KwH7KTkKP5AMg+jgRHkgn2QIeG+HHu3eRccTGv35yDjNVJ1v
 ghNU7HczmBcFEH1GmW1msY0YlNITSnf1rdc8OSKglYfKefRZUehynjRi+m/FtbjhBZQjjnDDV
 g9LEbLodUMTia0a+QQKCnxKIZPlEWPq1GH0kXxAwj2Bw43CAfVj4b+HJQUtUqon4CbEYUW5hp
 H1WMvfxxPfgwKIRBEpISdJKyOlRlT5s1wQgQfry5WpWa1PKkuQq2JhkFaqZJ+Ad1vLBHbTbJk
 eYriDRvUsbqM0Xfqi9AmMGnLOF5q7qntNuvFP1siTy7lCiGqSrqo2Y=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 09:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197297

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Allows mesa to be build with Imagination PowerVR support.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

=2D--

Changes in v2:
- Define imagination as a standard PACKAGECONFIG setting as suggested by
  Alex.

 meta/recipes-graphics/mesa/mesa.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/m=
esa/mesa.inc
index 12d7a18eb8..a844aa6767 100644
=2D-- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -113,6 +113,7 @@ VULKAN_DRIVERS:append:i686 =3D ",intel,amd"
 VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'freedren=
o', ',freedreno', '', d)}"
 VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'broadcom=
', ',broadcom', '', d)}"
 VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'gallium-=
llvm', ',swrast', '', d)}"
+VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'imaginat=
ion', ',imagination-experimental', '', d)}"
 PACKAGECONFIG[vulkan] =3D "-Dvulkan-drivers=3D${@strip_comma('${VULKAN_DR=
IVERS}')}, -Dvulkan-drivers=3D'',glslang-native vulkan-loader vulkan-heade=
rs"

 # mesa development and testing tools support, per driver
@@ -122,6 +123,7 @@ TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
, 'etnaviv', ',etnaviv', '',
 TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',fr=
eedreno', '', d)}"
 TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', =
'', d)}"
 TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',pan=
frost', '', d)}"
+TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',=
imagination', '', d)}"

 # dependencies for tools.
 TOOLS_DEPS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno',=
 ' ncurses libxml2 ', '', d)}"
@@ -189,6 +191,8 @@ PACKAGECONFIG[xa]  =3D "-Dgallium-xa=3Denabled, -Dgall=
ium-xa=3Ddisabled"
 PACKAGECONFIG[va] =3D "-Dgallium-va=3Denabled,-Dgallium-va=3Ddisabled,lib=
va-initial"
 PACKAGECONFIG[vdpau] =3D "-Dgallium-vdpau=3Denabled,-Dgallium-vdpau=3Ddis=
abled,libvdpau"

+PACKAGECONFIG[imagination] =3D "-Dimagination-srv=3Dtrue,"
+
 PACKAGECONFIG[lima] =3D ""
 GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'lima', '=
,lima', '', d)}"

@@ -327,7 +331,7 @@ PACKAGES_DYNAMIC +=3D "^mesa-driver-.*"
 PACKAGES_DYNAMIC:class-native =3D "^mesa-driver-.*-native"

 FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}/drirc.d"
-FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${datadir}/vulkan=
"
+FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${libdir}/libpowe=
rvr_rogue.so ${datadir}/vulkan"
 FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
 FILES:libegl-mesa =3D "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendor=
.d"
 FILES:libgbm =3D "${libdir}/libgbm.so.*"
=2D-
2.44.0


