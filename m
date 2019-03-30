Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 16BCA7D1AD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Mar 2019 00:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C604640B88;
	Sat, 30 Mar 2019 00:05:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id IT0ZBH6aGXdz; Sat, 30 Mar 2019 00:05:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-81-231.washdc.fios.verizon.net
	[100.15.81.231])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ABFB740A9E;
	Sat, 30 Mar 2019 00:05:51 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DE9E216D75D;
	Fri, 29 Mar 2019 20:05:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2019 20:05:50 -0400
Message-Id: <1553904350-30074-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] weston: upgrade 5.0.0 -> 6.0.0
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
X-List-Received-Date: Sat, 30 Mar 2019 00:05:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Note:
6.0.0 is the last one to support autotools (needs explicit configure option),
newer versions will only support meson.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-graphics/wayland/{weston_5.0.0.bb => weston_6.0.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_5.0.0.bb => weston_6.0.0.bb} (96%)

diff --git a/meta/recipes-graphics/wayland/weston_5.0.0.bb b/meta/recipes-graphics/wayland/weston_6.0.0.bb
similarity index 96%
rename from meta/recipes-graphics/wayland/weston_5.0.0.bb
rename to meta/recipes-graphics/wayland/weston_6.0.0.bb
index e517109..fa08dac 100644
--- a/meta/recipes-graphics/wayland/weston_5.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_6.0.0.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
 "
-SRC_URI[md5sum] = "752a04ce3c65af4884cfac4e57231bdb"
-SRC_URI[sha256sum] = "15a23423bcfa45e31e1dedc0cd524ba71e2930df174fde9c99b71a537c4e4caf"
+SRC_URI[md5sum] = "7c634e262f8a464a076c97fd50ad36b3"
+SRC_URI[sha256sum] = "546323a90607b3bd7f48809ea9d76e64cd09718102f2deca6d95aa59a882e612"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
@@ -28,6 +28,7 @@ WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
 
 EXTRA_OECONF = "--enable-setuid-install \
                 --disable-rdp-compositor \
+                --enable-autotools \
                 "
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
-- 
2.7.4


