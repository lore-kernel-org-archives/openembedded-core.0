Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C893C4332F
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 23:23:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1189.1643412198832758576
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 15:23:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B237B40C2A
	for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 23:23:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HYHJGr9HP6gY
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jan 2022 23:23:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A346940027
	for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 23:23:17 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D2CF217471A;
	Fri, 28 Jan 2022 18:23:16 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] wayland-protocols: upgrade 1.24 -> 1.25
Date: Fri, 28 Jan 2022 23:23:15 +0000
Message-Id: <20220128232315.3885833-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 23:23:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161086

https://lists.freedesktop.org/archives/wayland-devel/2022-January/042102.=
html

wayland-protocols 1.25 is now available.

Apart from minor fixes and clarifications, this release also adds a new s=
taging
protocol for session locking, as well as a 'bounds' event to the xdg_topl=
evel
interface. See the individual commits and protocol specifications for
details.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 .../{wayland-protocols_1.24.bb =3D> wayland-protocols_1.25.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.24.bb =3D> way=
land-protocols_1.25.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.24.bb b/me=
ta/recipes-graphics/wayland/wayland-protocols_1.25.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.24.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.25.bb
index 0cfdb90b68..074801b22d 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.24.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc7b12b6702da=
38ca028ace54aae3d484 \
=20
 SRC_URI =3D "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.x=
z \
            "
-SRC_URI[sha256sum] =3D "bff0d8cffeeceb35159d6f4aa6bab18c807b80642c9d50f6=
6cba52ecf7338bc2"
+SRC_URI[sha256sum] =3D "f1ff0f7199d0a0da337217dd8c99979967808dc37731a1e7=
59e822b75b571460"
=20
 UPSTREAM_CHECK_URI =3D "https://wayland.freedesktop.org/releases.html"
=20
--=20
2.25.1


