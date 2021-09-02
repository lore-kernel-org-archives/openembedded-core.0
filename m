Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.580.1630620156776844042
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 15:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C3FFB40C88
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 22:02:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hVerKkYtcJpV
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Sep 2021 22:02:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B8B5D40B13
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 22:02:35 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D8078174670;
	Thu,  2 Sep 2021 18:02:34 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] wayland-protocols: upgrade 1.21 -> 1.22
Date: Thu,  2 Sep 2021 18:02:34 -0400
Message-Id: <1630620154-37109-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

wayland-protocols 1.22 is now available.

This release includes a new staging protocol: DRM object leasing.

Besides that, various test and build system improvements are included, as
well as a set of clarifications to the xdg-activation protocol and other
protocols.

https://lists.freedesktop.org/archives/wayland-devel/2021-September/041972.html

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 .../wayland/{wayland-protocols_1.21.bb => wayland-protocols_1.22.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.21.bb => wayland-protocols_1.22.bb} (90%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.21.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.22.bb
similarity index 90%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.21.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.22.bb
index 4a5a295..4e8d390 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.21.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.22.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "b99945842d8be18817c26ee77dafa157883af89268e15f4a5a1a1ff3ffa4cde5"
+SRC_URI[sha256sum] = "96e7cf03524995a47028236c6d6141c874e693cb80c0be8dabe15455cdd5a5a7"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.7.4

