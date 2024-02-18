Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B106C48BC4
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 18:16:44 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.23366.1708280194705690373
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 10:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout04.t-online.de (Postfix) with SMTP id 6B1D1213AD
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 19:16:31 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.235]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rbliI-0xKABV0; Sun, 18 Feb 2024 19:16:30 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] wayland-protocols: update 1.32 -> 1.33
Date: Sun, 18 Feb 2024 19:16:44 +0100
Message-ID: <20240218181644.36495-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1708280190-8CB04383-1FD5FEAC/0/0 CLEAN NORMAL
X-TOI-MSGID: 31f7ff4e-1996-4c0f-9e59-32b49c4520b4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 18:16:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195842

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{wayland-protocols_1.32.bb =3D> wayland-protocols_1.33.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.32.bb =3D> way=
land-protocols_1.33.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb b/me=
ta/recipes-graphics/wayland/wayland-protocols_1.33.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.32.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
index 05943bc388..c8875cc3cb 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc7b12b6702da=
38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xm=
l;endline=3D26;md5=3D4646cd7d9edc9fa55db941f2d3a7dc53"
=20
 SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/=
releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "7459799d340c8296b695ef857c07ddef24c5a09b09ab6a74=
f7b92640d2b1ba11"
+SRC_URI[sha256sum] =3D "94f0c50b090d6e61a03f62048467b19abbe851be4e11ae7b=
36f65f8b98c3963a"
=20
 UPSTREAM_CHECK_URI =3D "https://wayland.freedesktop.org/releases.html"
=20
--=20
2.43.0


