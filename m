Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BA0C54EE9
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 13:05:28 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web08.19605.1663592721897019233
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 06:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout07.t-online.de (Postfix) with SMTP id DC6727ACF
	for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 15:05:19 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.47.121]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oaGSd-0tj9WL0; Mon, 19 Sep 2022 15:05:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] libdrm: upgrade 2.4.112 -> 2.4.113
Date: Mon, 19 Sep 2022 15:05:11 +0200
Message-Id: <20220919130511.112835-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1663592719-8A6BF81F-848B446B/0/0 CLEAN NORMAL
X-TOI-MSGID: 58f9985c-1334-4c75-ab01-91bd3c24c37e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 13:05:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170858

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{libdrm_2.4.112.bb =3D> libdrm_2.4.113.bb}  | 33 ++++++++++---------
 1 file changed, 17 insertions(+), 16 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.112.bb =3D> libdrm_2.4.113.=
bb} (62%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.112.bb b/meta/recipes-g=
raphics/drm/libdrm_2.4.113.bb
similarity index 62%
rename from meta/recipes-graphics/drm/libdrm_2.4.112.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.113.bb
index 48838245dd..959ef68032 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.112.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.113.bb
@@ -13,28 +13,29 @@ DEPENDS =3D "libpthread-stubs"
 SRC_URI =3D "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
=20
-SRC_URI[sha256sum] =3D "00b07710bd09b35cd8d80eaf4f4497fe27f4becf467a9830=
f1f5e8324f8420ff"
+SRC_URI[sha256sum] =3D "7fd7eb2967f63beb4606f22d50e277d993480d05ef75dd88=
a9bd8e677323e5e1"
=20
 inherit meson pkgconfig manpages
=20
-PACKAGECONFIG ??=3D "intel radeon amdgpu nouveau vmwgfx omap freedreno v=
c4 etnaviv install-test-programs"
-PACKAGECONFIG[intel] =3D "-Dintel=3Dtrue,-Dintel=3Dfalse,libpciaccess"
-PACKAGECONFIG[radeon] =3D "-Dradeon=3Dtrue,-Dradeon=3Dfalse"
-PACKAGECONFIG[amdgpu] =3D "-Damdgpu=3Dtrue,-Damdgpu=3Dfalse"
-PACKAGECONFIG[nouveau] =3D "-Dnouveau=3Dtrue,-Dnouveau=3Dfalse"
-PACKAGECONFIG[vmwgfx] =3D "-Dvmwgfx=3Dtrue,-Dvmwgfx=3Dfalse"
-PACKAGECONFIG[omap] =3D "-Domap=3Dtrue,-Domap=3Dfalse"
-PACKAGECONFIG[exynos] =3D "-Dexynos=3Dtrue,-Dexynos=3Dfalse"
-PACKAGECONFIG[freedreno] =3D "-Dfreedreno=3Dtrue,-Dfreedreno=3Dfalse"
-PACKAGECONFIG[tegra] =3D "-Dtegra=3Dtrue,-Dtegra=3Dfalse"
-PACKAGECONFIG[vc4] =3D "-Dvc4=3Dtrue,-Dvc4=3Dfalse"
-PACKAGECONFIG[etnaviv] =3D "-Detnaviv=3Dtrue,-Detnaviv=3Dfalse"
+PACKAGECONFIG ??=3D "intel radeon amdgpu nouveau vmwgfx omap freedreno v=
c4 etnaviv tests install-test-programs"
+PACKAGECONFIG[intel] =3D "-Dintel=3Denabled,-Dintel=3Ddisabled,libpciacc=
ess"
+PACKAGECONFIG[radeon] =3D "-Dradeon=3Denabled,-Dradeon=3Ddisabled"
+PACKAGECONFIG[amdgpu] =3D "-Damdgpu=3Denabled,-Damdgpu=3Ddisabled"
+PACKAGECONFIG[nouveau] =3D "-Dnouveau=3Denabled,-Dnouveau=3Ddisabled"
+PACKAGECONFIG[vmwgfx] =3D "-Dvmwgfx=3Denabled,-Dvmwgfx=3Ddisabled"
+PACKAGECONFIG[omap] =3D "-Domap=3Denabled,-Domap=3Ddisabled"
+PACKAGECONFIG[exynos] =3D "-Dexynos=3Denabled,-Dexynos=3Ddisabled"
+PACKAGECONFIG[freedreno] =3D "-Dfreedreno=3Denabled,-Dfreedreno=3Ddisabl=
ed"
+PACKAGECONFIG[tegra] =3D "-Dtegra=3Denabled,-Dtegra=3Ddisabled"
+PACKAGECONFIG[vc4] =3D "-Dvc4=3Denabled,-Dvc4=3Ddisabled"
+PACKAGECONFIG[etnaviv] =3D "-Detnaviv=3Denabled,-Detnaviv=3Ddisabled"
 PACKAGECONFIG[freedreno-kgsl] =3D "-Dfreedreno-kgsl=3Dtrue,-Dfreedreno-k=
gsl=3Dfalse"
-PACKAGECONFIG[valgrind] =3D "-Dvalgrind=3Dtrue,-Dvalgrind=3Dfalse,valgri=
nd"
+PACKAGECONFIG[valgrind] =3D "-Dvalgrind=3Denabled,-Dvalgrind=3Ddisabled,=
valgrind"
 PACKAGECONFIG[install-test-programs] =3D "-Dinstall-test-programs=3Dtrue=
,-Dinstall-test-programs=3Dfalse"
-PACKAGECONFIG[cairo-tests] =3D "-Dcairo-tests=3Dtrue,-Dcairo-tests=3Dfal=
se"
+PACKAGECONFIG[cairo-tests] =3D "-Dcairo-tests=3Denabled,-Dcairo-tests=3D=
disabled"
+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
 PACKAGECONFIG[udev] =3D "-Dudev=3Dtrue,-Dudev=3Dfalse,udev"
-PACKAGECONFIG[manpages] =3D "-Dman-pages=3Dtrue,-Dman-pages=3Dfalse,libx=
slt-native xmlto-native python3-docutils-native"
+PACKAGECONFIG[manpages] =3D "-Dman-pages=3Denabled,-Dman-pages=3Ddisable=
d,libxslt-native xmlto-native python3-docutils-native"
=20
 ALLOW_EMPTY:${PN}-drivers =3D "1"
 PACKAGES =3D+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN=
}-omap \
--=20
2.34.1


