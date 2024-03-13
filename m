Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2B5C54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 14:19:52 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
 by mx.groups.io with SMTP id smtpd.web11.18218.1710339589143902282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 07:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=marcel@ziswiler.com header.s=s1-ionos header.b=npQqUWji;
 spf=pass (domain: ziswiler.com, ip: 74.208.4.197, mailfrom: marcel@ziswiler.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ziswiler.com;
	s=s1-ionos; t=1710339585; x=1710944385; i=marcel@ziswiler.com;
	bh=QYLu9NABOMoQTZLEmKlOSYgoYMddcjP3idbgGAlyJow=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=npQqUWjifIMMRvEGxQZBRtqEAO2SokVcbBOMLk5D+TB8HDBnUNr52LqfE5Ap4vhv
	 Ov6YfsMV3sv2ebs5oFS69g6iWp8k2Us5VpNK+Y7r41dah5fchFzfpjEg1z/kBRTnf
	 WahXkQtPkRtrUXnRYNmZf20c/GWGVHDB83WgNiTi2p6isvqrsXzOYq+92gxZNsxTQ
	 3b2vGuK+FzNo+WS8aq/G77ame7h5oOlszFlEOZaYsSwwAw4Fs/DlM5hzNTgzEt4aq
	 U70GescLWkp56GwFgtF3e+4IdyLaRQ3Awqt+rhBvBsJDPypSl7NdcqnBjuDWV4O/b
	 BrAQ00CisiVhFAdxzA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from toolbox.corp.toradex.com ([31.10.206.125]) by
 mrelay.perfora.net (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id
 1N6KxR-1qiEGX2FFh-016eNJ; Wed, 13 Mar 2024 15:19:44 +0100
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Ryan Eatmon <reatmon@ti.com>,
	Randolph Sapp <rs@ti.com>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [oe-core][PATCH v1] mesa: enable imagination powervr support
Date: Wed, 13 Mar 2024 15:19:35 +0100
Message-ID: <20240313141940.146208-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ytnRdxT6tVE2VOxBFzKQq51UoeoCJudNIjl4aaP+c2FImPKTvMf
 oGiVlJNq8rM0rIlg5WTJl/vM4Nf/DUyuLe5meZE1KaFZdZheAM9iLTHeMC79G+Xpt6rlLhY
 Mv33Qx1qUHvZavRj27psGHfDfQQLhRlTkDx66MuxsEQcPa9bzCp82CsVVJeshT/vR616hGw
 49ozM0a4lw2GZ/P5GjEhA==
UI-OutboundReport: notjunk:1;M01:P0:m6YAnuylhJk=;pytHyeMIH6ahkxN2uB6IDFBslBp
 iOrTIhFImRvdyoonM5tlranR4wNC2pthQE3gdGcQX/UJULxqeCJdcTsAaF+PAokKyFKannvel
 Sz25s3dyGNHEA4zF4p+uhvPVQjAQ4XjZAWv9kW8MBCADt4X3aepfBB0DQUzW+I62pVPE6f7EQ
 P08P6rwSFdqfMGVsvA4FXzYwVKhXGkcMunODHCDIaRPH01XBXKinboPCnLIg2N4yoOvrALlUl
 g2teMsiQo0Oq7lsdQcM6sfdEFq1Tip5f/cc+lvr29LH8DwtB/8bg3lwRyXAWU3YrGtL+Jqayb
 HFBcBRdZ2/6W2brEe6hsqqTvh5zc33tKdwOmjVz8nZFBm2TpHbxndplfWRcE6z5uS5tgoT0iB
 5DytkjaYyhFoU3Z0uTTeYWGGMHdmZjQ+ydiTD4nRV+ea7+1RfR+hUdCbP953szzwLhhi/bpuu
 fScx/WROI7fnsbdjYBFyiSyKqcDx/zr2vkjhUXrsRmgoxjMafcxvifTAnlZwUTC16+2MZU5Er
 UCs14ke/4PqO29akr4briO/xKipUpK79E/kCPChA66dnPThdiO2leTqxOUXbZJuHaZZX6r9ed
 KPLLX/TnjwzEge9zL4UStElKQE0U03k7DjyxDkq15LpjPDipIn4as4gCMmV8Fzm2v7YnSsdyD
 w1O6AhsldjraMgluvHMI46d6dU0sLpb2kA/rJZ8xRhaOjOmQj1mK1tTnY1dKr+vMmIS3aEDZd
 ugxkCJ/o7k+LrJo+PjD4visc7MbhLcjUltbkhgn3+6cW7jvAjasVvY=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 14:19:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197041

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Allows mesa to be build with Imagination PowerVR support.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

=2D--

 meta/recipes-graphics/mesa/mesa.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/m=
esa/mesa.inc
index 12d7a18eb8..24304c89fa 100644
=2D-- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -75,6 +75,8 @@ EXTRA_OEMESON =3D " \
     -Dplatforms=3D'${@",".join("${PLATFORMS}".split())}' \
 "

+EXTRA_OEMESON:append:class-target =3D " ${@bb.utils.contains('PACKAGECONF=
IG', 'imagination', '-Dimagination-srv=3Dtrue', '', d)}"
+
 EXTRA_OEMESON:append:class-target =3D " ${@bb.utils.contains('PACKAGECONF=
IG', 'opencl', '-Dintel-clc=3Dsystem', '', d)}"
 EXTRA_OEMESON:append:class-native =3D " ${@bb.utils.contains('PACKAGECONF=
IG', 'opencl', '-Dintel-clc=3Denabled', '', d)}"

@@ -113,6 +115,7 @@ VULKAN_DRIVERS:append:i686 =3D ",intel,amd"
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
@@ -122,6 +125,7 @@ TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG'=
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


