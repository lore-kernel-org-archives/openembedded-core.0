Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265BCCD8C9D
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 17:54:32 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52405.1781200463164900280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 10:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 34F3D40C8F
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 17:54:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hs0uCaWADvDO
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2026 17:54:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2088E40C8E
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 17:54:22 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 497FC176D83;
	Thu, 11 Jun 2026 13:54:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] wayland-protocols: upgrade 1.48 -> 1.49
Date: Thu, 11 Jun 2026 13:54:20 -0400
Message-Id: <20260611175420.3234064-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 17:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238584

wayland-protocols 1.49 includes the following changes:

- Improve multi-GPU support in linux-dmabuf-v1
- Add Windows BT.2100 image descriptions to color-management-v1
- A new experimental protocol for fractional scaling

This release requires wayland-scanner 1.25.0.

https://lore.freedesktop.org/wayland-devel/Sb0TL9RxdBgNMuAKZmlfhbXVQoqGTj=
MaoqWmu6S_JBcYNv7Aw82KvaXX5zHaBpjfl7aF9nzz1hSgtYxQalwMUTiOpritlvtoo_Q-wQC=
X9EU=3D@emersion.fr/T/#u

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 .../{wayland-protocols_1.48.bb =3D> wayland-protocols_1.49.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.48.bb =3D> way=
land-protocols_1.49.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb b/me=
ta/recipes-graphics/wayland/wayland-protocols_1.49.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.48.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.49.bb
index c6b5da44ba..f06e75fe8a 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.48.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc7b12b6702da=
38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xm=
l;endline=3D26;md5=3D4646cd7d9edc9fa55db941f2d3a7dc53"
=20
 SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/=
releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "398036ac0eb6484982ddbde7ff86848d753231f9cdeeae98=
3f06b52946625aa1"
+SRC_URI[sha256sum] =3D "ec4c8f74942d6dff7ace8b4ce4764f0ef9ff618a935d974e=
a77edee2ad240b14"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-p=
rotocols/-/tags"
 UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>.+)"
--=20
2.25.1


