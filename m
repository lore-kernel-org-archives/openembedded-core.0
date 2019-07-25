Return-Path: <denis@denix.org>
X-Greylist: delayed 328 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 25 Jul 2019 23:28:42 UTC
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 2313E7F0F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 23:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B200C40B37;
	Thu, 25 Jul 2019 23:23:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3Cozd4ENRlu4; Thu, 25 Jul 2019 23:23:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 971A640B66;
	Thu, 25 Jul 2019 23:23:14 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A188217189D;
	Thu, 25 Jul 2019 19:23:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2019 19:22:59 -0400
Message-Id: <1564096979-19730-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564096979-19730-1-git-send-email-denis@denix.org>
References: <1564096979-19730-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/2] weston: upgrade 6.0.0 -> 6.0.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Jul 2019 23:28:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Weston 6.0.1 is released with build system fixes to smooth the
transition to Meson. Other miscellaneous bugfixes are also included.
https://lists.freedesktop.org/archives/wayland-devel/2019-June/040661.html

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-graphics/wayland/{weston_6.0.0.bb => weston_6.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_6.0.0.bb => weston_6.0.1.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/weston_6.0.0.bb b/meta/recipes-graphics/wayland/weston_6.0.1.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/weston_6.0.0.bb
rename to meta/recipes-graphics/wayland/weston_6.0.1.bb
index fa08dac..95b5403 100644
--- a/meta/recipes-graphics/wayland/weston_6.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_6.0.1.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
 "
-SRC_URI[md5sum] = "7c634e262f8a464a076c97fd50ad36b3"
-SRC_URI[sha256sum] = "546323a90607b3bd7f48809ea9d76e64cd09718102f2deca6d95aa59a882e612"
+SRC_URI[md5sum] = "e7b10710ef1eac82258f97bfd41fe534"
+SRC_URI[sha256sum] = "bf2f6d5aae2e11cabb6bd69a76bcf9edb084f8c3e14ca769bea7234a513155b4"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.7.4


