Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E3CC3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 10:55:06 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.11578.1746788096960069413
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 03:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout10.t-online.de (Postfix) with SMTP id 020401171
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:54:55 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.44]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uDLNT-4WkNpx0; Fri, 9 May 2025 12:54:52 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH#] wayland-protocols: update 1.42 -> 1.44
Date: Fri,  9 May 2025 12:54:40 +0200
Message-ID: <20250509105440.1476228-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1746788092-CF7FC57E-1710348B/0/0 CLEAN NORMAL
X-TOI-MSGID: bdf7b3f5-3e0c-4f4a-830f-b5a73a946f4a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 10:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216197

Update to v1.44

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{wayland-protocols_1.42.bb =3D> wayland-protocols_1.44.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.42.bb =3D> way=
land-protocols_1.44.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb b/me=
ta/recipes-graphics/wayland/wayland-protocols_1.44.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.42.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.44.bb
index 7cbb650cda..c86f09eb7c 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.42.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.44.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc7b12b6702da=
38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xm=
l;endline=3D26;md5=3D4646cd7d9edc9fa55db941f2d3a7dc53"
=20
 SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/=
releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "23ba80d410d1200a86fe29592c19766eae8f1c350b672899=
99e9e7ea12d9f7aa"
+SRC_URI[sha256sum] =3D "3df1107ecf8bfd6ee878aeca5d3b7afd81248a48031e14ca=
f6ae01f14eebb50e"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-p=
rotocols/-/tags"
 UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>.+)"
--=20
2.49.0


