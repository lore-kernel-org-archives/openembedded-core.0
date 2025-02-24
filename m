Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3101AC021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 17:40:28 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.96611.1740418826644737152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 09:40:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout08.t-online.de (Postfix) with SMTP id 52BEA2824
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 18:40:24 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.235.213]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tmcRK-02xxib0; Mon, 24 Feb 2025 18:40:22 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] wayland-protocols: update 1.40 -> 1.41
Date: Mon, 24 Feb 2025 18:40:50 +0100
Message-ID: <20250224174050.2202076-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1740418822-367FA501-57EF1322/0/0 CLEAN NORMAL
X-TOI-MSGID: bbaf69e2-1c43-4060-931e-417bae5244ed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 17:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211847

wayland-protocols 1.41 is the minimum requirement for the upcoming gtk4 r=
elease

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{wayland-protocols_1.40.bb =3D> wayland-protocols_1.41.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.40.bb =3D> way=
land-protocols_1.41.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.40.bb b/me=
ta/recipes-graphics/wayland/wayland-protocols_1.41.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.40.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.41.bb
index 4efc1bd548..e8ab9d84fc 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.40.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc7b12b6702da=
38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xm=
l;endline=3D26;md5=3D4646cd7d9edc9fa55db941f2d3a7dc53"
=20
 SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/=
releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "b21711793247c2c42763914392dfa9fcb9e3728ca4b4aa11=
0adb8d915fc00689"
+SRC_URI[sha256sum] =3D "2786b6b1b79965e313f2c289c12075b9ed700d41844810c5=
1afda10ee329576b"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-p=
rotocols/-/tags"
 UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>.+)"
--=20
2.48.1


