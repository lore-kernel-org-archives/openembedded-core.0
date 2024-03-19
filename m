Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A4BCD11BF
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 15:27:00 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
 by mx.groups.io with SMTP id smtpd.web10.18654.1710862011622505220
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 08:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=marcel@ziswiler.com header.s=s1-ionos header.b=LUOdYCXt;
 spf=pass (domain: ziswiler.com, ip: 74.208.4.196, mailfrom: marcel@ziswiler.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1710862006; x=1711466806; i=marcel@ziswiler.com;
	bh=YdeMQJMpdJdy3xgb/FDMxBz8ID56wGNPUu8Xoz6tq2o=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=LUOdYCXtw+hVSbRVAfF3s0w1SFPdHq30s5n8ki6PmBTiZwiXKfonqdg/vjOrST4I
	 vTOCKJyz2ru4sCiQL0xfNoAG2Stx+URTtpjdSuu6HClZlrkK2kXBKlf0Cvak0VlNY
	 FD0oV9cuBrf8joVa/vjp7NnrWt00mb8D+Iben7YoZJljgNlBPRYdpH9Yqv4cWBzso
	 WicH/A28yELn5gCDvkXyZ6Cenw7Ul3ac11DD89pIHoA6oYrwdaHFuGgEILKUASgau
	 BtzepYIE5ce8Rv3Je0QPkd8qVwPHfhSpTZ8bEjXkOn+7p2I2lYGd5PgKwxyRPKljq
	 QR6bSEE3NSjmYfkCrw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from toolbox.corp.toradex.com ([31.10.206.125]) by
 mrelay.perfora.net (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id
 0Md2do-1rVcTX3thK-00Jw2h; Tue, 19 Mar 2024 16:26:46 +0100
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-core@lists.openembedded.org
Cc: Randolph Sapp <rs@ti.com>,
	Ryan Eatmon <reatmon@ti.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [oe-core][PATCH v3] mesa: enable imagination powervr support
Date: Tue, 19 Mar 2024 16:26:39 +0100
Message-ID: <20240319152642.360329-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6YXVZH/cofCCZgNtBBQU19b/pb0dX+Es14iwd6mlPEDAcmh304q
 UKJZvJQxLmyRPa9k4zhh/3ANFrseQR2iax9tb2XbLgBwCatPrl2WrqRERfyn0mztaH8D1EX
 ygcTDfBbNd9EqWfKARCGPef/LMxxgPeJFhsDeM3S8tJkkaROEzCufpq127KE0441K4Amgnm
 T07wU2Hz3BcgHg5rUMz2Q==
UI-OutboundReport: notjunk:1;M01:P0:/o4GavPr+G4=;/tNRq022R23BhAaXiaAODrtl1Ol
 Ut3AggRHG/2xFreSofHCqC5SyV+hM/0zovbjznYdSDlHf5gE/nqjzgm5Kt7roZZPjqMPAy7Ik
 7PRHY9cxbnUY6fP0+W+8kvYVVAZTpSknkpSJU4AIcsoL0m6ID/BYPF2rZHcpCDcfd+5z3pMe7
 dSh39cDkaiPfeH6TOtYBLi5te3899YeevwB3BE8E9MvqNacuuRSe/pGqPArp2qAd3vHP4cpe1
 hOM3VE0QxNtzODvZnBi/lz341moqEGmOn9zq0mCbsvUS+3yB9juSE5Ne0zb9I64GxVe9rl7Ei
 bsO0eqLzrcT71JkzM7nilrTyB25/kEiEP1OmhIZsJ46sTWVeRH7vpJMsZ7VSdqKFjeaBOrUXf
 AL2YHROIKQUoT/1j9SPOdwVeA86tavxBJElSDPHIZGZZmC2nnnmSU4IX0qSJpboe9uDX4C8NY
 R7wi518rtVIbekjf0z6PQXfiBGcyCDID0hWA9MjwABRi5KLd1qYbYPo8hdsBtRfkYOXaJctfI
 aqhG5mn5hPj4eOZjPxRkp8jJ00iA/AOPiSgSrCz1UAfeb29NljmpoWotlP0ZA3orwmvTZJOAb
 v6O3ItF0jxKwMYLQWuDQTmz2h7QzvGH9dxt/B4KllbTJc3IVnGQGuOh2wkkNrde6jsoZPXnQ6
 1YSrrnHpvw3nCCreA9Yx3CplA4vUg8WgNma0d1wF2asag/xCX5pIZFCFtN7rfOZmRBOsoCvYL
 tr9GcUAKYvU3dRGFcOditVQOWl3fNwW7c3vQoZ0njRnX9L6N9HezlM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 15:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197323

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Allows mesa to be build with Imagination PowerVR support.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

=2D--

Changes in v3:
- Add a negative condition to the imagination PACKAGECONFIG as well,
  otherwise upstream defaults may result in an incorrect configuration
  (option being quietly enabled without it being present in
  PACKAGECONFIG) as pointed out by Alex.

Changes in v2:
- Define imagination as a standard PACKAGECONFIG setting as suggested by
  Alex.

 meta/recipes-graphics/mesa/mesa.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/m=
esa/mesa.inc
index 12d7a18eb8..0d4a37c34a 100644
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

+PACKAGECONFIG[imagination] =3D "-Dimagination-srv=3Dtrue,-Dimagination-sr=
v=3Dfalse"
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


