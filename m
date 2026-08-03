Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DB9C55179
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 13:49:48 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43439.1785764978850549015
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 06:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=c5lI3qHb;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout04.t-online.de (Postfix) with SMTP id 7EA97A60
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Aug 2026 15:49:36 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.168.211]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wqt2n-4ZPNBJ0; Mon, 3 Aug 2026 15:49:29 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libva: update 2.23.0 -> 2.24.1
Date: Mon,  3 Aug 2026 15:49:15 +0200
Message-ID: <20260803134915.8676-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1785764969-72FFABD8-B75D5708/0/0 CLEAN NORMAL
X-TOI-MSGID: b6ae429c-e0a3-4f4e-8c6f-775ab07321c8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1785764976; i=f_l_k@t-online.de;
	bh=EgkNW5KvUL21jWjVgc3YJjdL1703bWR0a7/WD5MMuf4=;
	h=From:To:Subject:Date;
	b=c5lI3qHbuakeHacH3y6KDzeyhfQHlzuNKeGDAzDgv4NK/LubNGZwapvmCWgOq/Tt0
	 KWJPHPAnrEI1KyeUZX9+icROMxuIHmOS6qr+gNWdxDleJIjo+146K5HaD8kKDclMSV
	 vBCsu7Ro6nCvLseQ5tWELJtK0oo1uYsp2ZkCeYCdDf5CY86NTwygaLqA86S0Zk8qHo
	 it4CS7UoenWZ9zFatIEuYaZHRJmaFHUp2rsPiM6v3XYrOa1cLGa4latH+OAhx0htTR
	 jganSQyI8+E+p6R9xsY01nC/QOuy5uy6jj4yic3gMrti6kT1czIgBf/6Sm6o0PLRRu
	 /niixx+qoK+KQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 13:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242654

version 2.24.1
va: include <unistd.h> for getuid/getgid in secure_getenv fallback

version 2.24.0
va: Add VA_PICTURE_H264_NON_EXISTING flag
va: use secure_getenv instead of getenv in va_x11.c
doc: fix libva av1 link for doxygen
trace: dump input/output data in va_TraceProtectedSessionExecute
trace: Add ProtectedSession Related Log in Trace

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{libva-initial_2.23.0.bb =3D> libva-initial_2.24.1.bb}      | 0
 .../libva/{libva-utils_2.23.0.bb =3D> libva-utils_2.24.1.bb}    | 0
 meta/recipes-graphics/libva/libva.inc                         | 4 ++--
 .../libva/{libva_2.23.0.bb =3D> libva_2.24.1.bb}                | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva-initial_2.23.0.bb =3D> libva-i=
nitial_2.24.1.bb} (100%)
 rename meta/recipes-graphics/libva/{libva-utils_2.23.0.bb =3D> libva-uti=
ls_2.24.1.bb} (100%)
 rename meta/recipes-graphics/libva/{libva_2.23.0.bb =3D> libva_2.24.1.bb=
} (100%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.23.0.bb b/meta/r=
ecipes-graphics/libva/libva-initial_2.24.1.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva-initial_2.23.0.bb
rename to meta/recipes-graphics/libva/libva-initial_2.24.1.bb
diff --git a/meta/recipes-graphics/libva/libva-utils_2.23.0.bb b/meta/rec=
ipes-graphics/libva/libva-utils_2.24.1.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva-utils_2.23.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.24.1.bb
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphic=
s/libva/libva.inc
index b3ec4f61d1..8e784c1ad1 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,8 +18,8 @@ LICENSE =3D "MIT"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2e48940f94acb0af582e5ef035378=
00f"
=20
-SRC_URI =3D "git://github.com/intel/libva.git;branch=3Dv2.23-branch;prot=
ocol=3Dhttps;tag=3D${PV}"
-SRCREV =3D "dbf83dc3b1ce6bad46e1628aaf2da5ef731157b8"
+SRC_URI =3D "git://github.com/intel/libva.git;branch=3Dv2.24-branch;prot=
ocol=3Dhttps;tag=3D${PV}"
+SRCREV =3D "710eb465c6277ee2cac3e6948767b01eebe7e77a"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>(\d+(\.\d+)+))$"
=20
diff --git a/meta/recipes-graphics/libva/libva_2.23.0.bb b/meta/recipes-g=
raphics/libva/libva_2.24.1.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.23.0.bb
rename to meta/recipes-graphics/libva/libva_2.24.1.bb
--=20
2.55.0


