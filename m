Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB54CD1288
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 02:17:57 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3239.1712024269809650956
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 19:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DC1CF40CB0
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Apr 2024 02:17:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWs600FzTIyr
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2024 02:17:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C72D340C37
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Apr 2024 02:17:48 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A7D91163EF8;
	Mon,  1 Apr 2024 22:17:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 3/3] wayland-protocols: upgrade 1.33 -> 1.34
Date: Mon,  1 Apr 2024 22:17:36 -0400
Message-Id: <20240402021736.2565533-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240402021736.2565533-1-denis@denix.org>
References: <20240402021736.2565533-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 02:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197863

This release comes with three new staging protocols:

 * xdg-toplevel-drag

This protocol enhances regular drag and drop by allowing attaching a
toplevel window to a drag. This can be used to implement e.g. detachable
toolbars and browser tab drag behavior that can be seen in other
platforms.

 * xdg-dialog

This protocol allows setting dialog specific hints on a toplevel, more
specifically marking them as modal.

 * linux-drm-syncobj

This protocol will allow explicit synchronization of buffers using DRM
synchronization objects. While being a protocol that is unlikely to be
widely used directly by applications and toolkits themselves, it is an
important building block for improving Vulkan and OpenGL drivers.

Other than this, the tablet and foreign toplevel list protocols also
received clarifications and fixes.

Full changelog:
https://lists.freedesktop.org/archives/wayland-devel/2024-March/043537.ht=
ml

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 .../{wayland-protocols_1.33.bb =3D> wayland-protocols_1.34.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.33.bb =3D> way=
land-protocols_1.34.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb b/me=
ta/recipes-graphics/wayland/wayland-protocols_1.34.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.34.bb
index 074ea3663a..8c12985714 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.34.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc7b12b6702da=
38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xm=
l;endline=3D26;md5=3D4646cd7d9edc9fa55db941f2d3a7dc53"
=20
 SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/=
releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "94f0c50b090d6e61a03f62048467b19abbe851be4e11ae7b=
36f65f8b98c3963a"
+SRC_URI[sha256sum] =3D "c59b27cacd85f60baf4ee5f80df5c0d15760ead6a2432b00=
ab7e2e0574dcafeb"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-p=
rotocols/-/tags"
=20
--=20
2.25.1


