Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 3338577025
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 18:25:33 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id E06A138F7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 20:25:32 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 20:25:18 +0200
Message-Id: <1461867918-2638-8-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1461867918-2638-1-git-send-email-dv@pseudoterminal.org>
References: <1461867918-2638-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-oe][PATCH v2 8/8] gstreamer1.0-rtsp-server: upgrade to version 1.8.1
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
X-List-Received-Date: Thu, 28 Apr 2016 18:25:33 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc      | 4 ++++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.2.bb | 6 ------
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.1.bb | 6 ++++++
 3 files changed, 10 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.2.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.1.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
index ae6d364..8fc90f1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -15,6 +15,10 @@ S = "${WORKDIR}/${PNREAL}-${PV}"
 
 inherit autotools pkgconfig upstream-version-is-even gobject-introspection
 
+# Starting with 1.8.0 gst-rtsp-server includes dependency-less plugins as well
+LIBV = "1.0"
+require gst-plugins-package.inc
+
 delete_pkg_m4_file() {
         # This m4 file is out of date and is missing PKG_CONFIG_SYSROOT_PATH tweaks which we need for introspection
         rm "${S}/common/m4/pkg.m4" || true
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.2.bb
deleted file mode 100644
index 5bdae6c..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-include gstreamer1.0-rtsp-server.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
-
-SRC_URI[md5sum] = "a1cafefb5fc14ac5d7e7d8cdbdfa9694"
-SRC_URI[sha256sum] = "0f51f9879556c0950203c766b09a1b62f1f25b17f9a7d516e01b13ecf93c8858"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.1.bb
new file mode 100644
index 0000000..395c43a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.1.bb
@@ -0,0 +1,6 @@
+include gstreamer1.0-rtsp-server.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
+
+SRC_URI[md5sum] = "0a5966df7f3d74cccfcededdcacd8212"
+SRC_URI[sha256sum] = "6fa8d9ce5b6f6f3309ab9eae14739af4f5666e259cdc64d0667d284ab17eb12e"
-- 
2.5.0


