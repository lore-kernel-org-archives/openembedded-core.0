Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5064.1631754400510513492
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 18:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C71BB40C4E
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 01:06:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VQIVtv-HDsuI
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Sep 2021 01:06:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B6C7540A28
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 01:06:38 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id CC447174674;
	Wed, 15 Sep 2021 21:06:37 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [kirkstone][PATCH] wayland-protocols: upgrade 1.22 -> 1.23
Date: Wed, 15 Sep 2021 21:06:37 -0400
Message-Id: <1631754397-46490-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

wayland-protocols 1.23 is now available.

This release adds the new gesture "hold" to the pointer gesture protocol.

https://lists.freedesktop.org/archives/wayland-devel/2021-September/041979.html

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
Please note - this is meant for kirkstone(-next), as upgrade to 1.22 is not in master yet

 .../wayland/{wayland-protocols_1.22.bb => wayland-protocols_1.23.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.22.bb => wayland-protocols_1.23.bb} (90%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.22.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.23.bb
similarity index 90%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.22.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.23.bb
index 4e8d390..60b6eb1 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.22.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.23.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "96e7cf03524995a47028236c6d6141c874e693cb80c0be8dabe15455cdd5a5a7"
+SRC_URI[sha256sum] = "6c0af1915f96f615927a6270d025bd973ff1c58e521e4ca1fc9abfc914633f76"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.7.4

