Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48DBC02198
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 19:51:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.126147.1738698690991288084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 11:51:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4F4CF40C8F;
	Tue,  4 Feb 2025 19:51:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9IVcjwj4ATm; Tue,  4 Feb 2025 19:51:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 32DAC407E5;
	Tue,  4 Feb 2025 19:51:29 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 15D4E164208;
	Tue,  4 Feb 2025 14:51:28 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH 1/3] wayland-protocols: upgrade 1.39 -> 1.40
Date: Tue,  4 Feb 2025 14:51:23 -0500
Message-Id: <20250204195125.76033-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 19:51:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210822

From: Denys Dmytriyenko <denys@konsulko.com>

This release includes a new version of the ext-idle-notify protocol, whic=
h
allows users of the protocol to track only input device like activity.

Apart from that, there are the usual clarifications and protocol bug fixe=
s.

https://lists.freedesktop.org/archives/wayland-devel/2025-January/043966.=
html

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../{wayland-protocols_1.39.bb =3D> wayland-protocols_1.40.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.39.bb =3D> way=
land-protocols_1.40.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.39.bb b/me=
ta/recipes-graphics/wayland/wayland-protocols_1.40.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.39.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.40.bb
index 82c373df21..4efc1bd548 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.39.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.40.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc7b12b6702da=
38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xm=
l;endline=3D26;md5=3D4646cd7d9edc9fa55db941f2d3a7dc53"
=20
 SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/=
releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "e1dcdcbbf08e2e0a8a02ee5d9a0be3a6aafc39a4b51fa7e0=
d2f1a16411cb72fa"
+SRC_URI[sha256sum] =3D "b21711793247c2c42763914392dfa9fcb9e3728ca4b4aa11=
0adb8d915fc00689"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-p=
rotocols/-/tags"
 UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>.+)"
--=20
2.25.1


