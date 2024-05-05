Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13869C4345F
	for <webhook@archiver.kernel.org>; Sun,  5 May 2024 06:24:23 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.13013.1714890252762578276
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 May 2024 23:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout09.t-online.de (Postfix) with SMTP id CEE225A884
	for <openembedded-core@lists.openembedded.org>; Sun,  5 May 2024 08:24:10 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.239.61]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s3VI8-3BzlK50; Sun, 5 May 2024 08:24:08 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] wayland-protocols: update 1.35 -> 1.36
Date: Sun,  5 May 2024 08:24:32 +0200
Message-ID: <20240505062432.559989-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1714890248-627FA3C7-90062148/0/0 CLEAN NORMAL
X-TOI-MSGID: 8b43c183-d876-457d-af70-7139016f1c72
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 May 2024 06:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199016

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{wayland-protocols_1.35.bb =3D> wayland-protocols_1.36.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.35.bb =3D> way=
land-protocols_1.36.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.35.bb b/me=
ta/recipes-graphics/wayland/wayland-protocols_1.36.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.35.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.36.bb
index 7e70de346c..505164695d 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.35.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc7b12b6702da=
38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xm=
l;endline=3D26;md5=3D4646cd7d9edc9fa55db941f2d3a7dc53"
=20
 SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/=
releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "37a2716a28133dc819341c568a29d21e8cb72130e5c126a1=
fcfc9f42c23d95ab"
+SRC_URI[sha256sum] =3D "71fd4de05e79f9a1ca559fac30c1f8365fa10346422f9fe7=
95f74d77b9ef7e92"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-p=
rotocols/-/tags"
=20
--=20
2.44.0


