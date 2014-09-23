Return-Path: <denis@denix.org>
X-Greylist: delayed 3603 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Sep 2014 20:32:18 UTC
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id AC6B4714A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:32:18 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCD0042CCXCXO00@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 23 Sep 2014 14:32:01 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9ED1220357; Tue,
	23 Sep 2014 15:32:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Sep 2014 15:31:54 -0400
Message-id: <1411500714-17508-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
In-reply-to: <1411500714-17508-1-git-send-email-denis@denix.org>
References: <1411500714-17508-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 3/3] weston: update to version 1.6.0, add libinput PACKAGECONFIG
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
X-List-Received-Date: Tue, 23 Sep 2014 20:32:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-graphics/wayland/{weston_1.5.0.bb => weston_1.6.0.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_1.5.0.bb => weston_1.6.0.bb} (93%)

diff --git a/meta/recipes-graphics/wayland/weston_1.5.0.bb b/meta/recipes-graphics/wayland/weston_1.6.0.bb
similarity index 93%
rename from meta/recipes-graphics/wayland/weston_1.5.0.bb
rename to meta/recipes-graphics/wayland/weston_1.6.0.bb
index 4a8584f..efbbbe0 100644
--- a/meta/recipes-graphics/wayland/weston_1.5.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.6.0.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://make-lcms-explicitly-configurable.patch \
            file://make-libwebp-explicitly-configurable.patch \
 "
-SRC_URI[md5sum] = "8eb40d230efc2411f083c20656534780"
-SRC_URI[sha256sum] = "06388ba04ac79aa72d685cc1a8e646ddb2b8cfe11fcc742294f9addac48b7684"
+SRC_URI[md5sum] = "c60ce9dde99a089db0539d8f6b557827"
+SRC_URI[sha256sum] = "dc3ea5d13bbf025fabc006216c5ddc0d80d5f4ebe778912b8c4d1d4acaaa614d"
 
 inherit autotools pkgconfig useradd
 
@@ -60,6 +60,8 @@ PACKAGECONFIG[cairo-glesv2] = "--with-cairo-glesv2,--with-cairo=image,cairo"
 PACKAGECONFIG[lcms] = "--enable-lcms,--disable-lcms,lcms"
 # Weston with webp support
 PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
+# Weston with libinput backend
+PACKAGECONFIG[libinput] = "--enable-libinput-backend,--disable-libinput-backend,libinput"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.0.4


