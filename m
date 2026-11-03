Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.734.1793665339628974753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 16:22:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D084A40C83
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Nov 2026 00:22:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flvZVb32vMEu
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2026 00:22:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BEB9640B88
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Nov 2026 00:22:18 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7EEC91761CA;
	Mon,  2 Nov 2026 19:22:18 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 2/2] wayland-protocols: upgrade 1.49 -> 1.50
Date: Mon,  2 Nov 2026 19:22:13 -0500
Message-Id: <20261103002213.1827359-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261103002213.1827359-1-denis@denix.org>
References: <20261103002213.1827359-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 00:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249230
Content-Type: text/plain; charset="utf-8"

- New experimental Global hotkey protocol
- New experimental Image Copy Capture Color Management protocol
- Other small fixes

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 .../{wayland-protocols_1.49.bb =3D> wayland-protocols_1.50.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.49.bb =3D> way=
land-protocols_1.50.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb b/me=
ta/recipes-graphics/wayland/wayland-protocols_1.50.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.49.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.50.bb
index f06e75fe8a..530f83216f 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.50.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc7b12b6702da=
38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xm=
l;endline=3D26;md5=3D4646cd7d9edc9fa55db941f2d3a7dc53"
=20
 SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/=
releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "ec4c8f74942d6dff7ace8b4ce4764f0ef9ff618a935d974e=
a77edee2ad240b14"
+SRC_URI[sha256sum] =3D "4460c20cfcf68b994a5ee206ed15fc19ad312f16c9607518=
6e83b0e3f4aa48a5"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-p=
rotocols/-/tags"
 UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>.+)"
--=20
2.25.1

