Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 43DE3731AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 09:58:45 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 1C42D38AD0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 11:52:01 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 11:51:49 +0200
Message-Id: <1460713909-5823-8-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1460713909-5823-1-git-send-email-dv@pseudoterminal.org>
References: <1460713909-5823-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 8/8] gstreamer1.0-rtsp-server: upgrade to version 1.8.0
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
X-List-Received-Date: Fri, 15 Apr 2016 09:58:47 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc      | 4 ++++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.2.bb | 6 ------
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.0.bb | 6 ++++++
 3 files changed, 10 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.6.2.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.0.bb

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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.0.bb
new file mode 100644
index 0000000..40c71a0
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.0.bb
@@ -0,0 +1,6 @@
+include gstreamer1.0-rtsp-server.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
+
+SRC_URI[md5sum] = "8947eba08408a7f71beeb006e1c65dd9"
+SRC_URI[sha256sum] = "b075d9780985e133149f59a74a1ea7385ab147f65ffa6640e122447a0185362c"
-- 
2.5.0


