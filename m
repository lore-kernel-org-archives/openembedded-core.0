Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 92AD7714A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 19:32:00 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCD004E3CXCMP10@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 23 Sep 2014 14:32:01 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9B6D2202A1; Tue,
	23 Sep 2014 15:32:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Sep 2014 15:31:53 -0400
Message-id: <1411500714-17508-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
In-reply-to: <1411500714-17508-1-git-send-email-denis@denix.org>
References: <1411500714-17508-1-git-send-email-denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/3] wayland: update version to 1.6.0
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
X-List-Received-Date: Tue, 23 Sep 2014 19:32:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-graphics/wayland/{wayland_1.5.0.bb => wayland_1.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.5.0.bb => wayland_1.6.0.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/wayland_1.5.0.bb b/meta/recipes-graphics/wayland/wayland_1.6.0.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/wayland_1.5.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.6.0.bb
index b1ae59e..cf3c094 100644
--- a/meta/recipes-graphics/wayland/wayland_1.5.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.6.0.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
                     file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
 
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "1d882776b27329b91d2d500b6d66dd1d"
-SRC_URI[sha256sum] = "0069e1e9af888b3e05384380ad8cc6c976ea3e81d08ba19b7675ce1d693a41b5"
+SRC_URI[md5sum] = "d34c141c975084e4fb668e77b38f840e"
+SRC_URI[sha256sum] = "a7d5102dcf53d08c059d24bc62de491d7cd482070abeb6737a20d0d86ba6fc7f"
 SRC_URI_append_class-native = " \
     file://disable-macro-checks-not-used-for-scanner.patch \
     "
-- 
2.0.4


