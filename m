Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 61DFC79357
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 17:51:41 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 395506E8C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 19:42:54 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2018 19:42:37 +0200
Message-Id: <20180926174244.20989-5-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180926174244.20989-1-dv@pseudoterminal.org>
References: <20180926174244.20989-1-dv@pseudoterminal.org>
Subject: [PATCH 05/12] gstreamer1.0-plugin-ugly: upgrade to version 1.14.3
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
X-List-Received-Date: Wed, 26 Sep 2018 17:51:42 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 ...ins-ugly_1.14.2.bb => gstreamer1.0-plugins-ugly_1.14.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.14.2.bb => gstreamer1.0-plugins-ugly_1.14.3.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.3.bb
index 0197269468..93ad400a93 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.3.bb
@@ -10,8 +10,8 @@ SRC_URI = " \
             http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
             "
-SRC_URI[md5sum] = "ea0a800c6421c3c3cdbed3d040b8ffd3"
-SRC_URI[sha256sum] = "55e097d9d93921fdcf7abb0ff92d23b21dd9098e632f1ba433603b3bd1cf3d69"
+SRC_URI[md5sum] = "4b23a9a9675ff62c83b117b519f10951"
+SRC_URI[sha256sum] = "43847fc4d1eae26dd48a6a93d0460146f5f0802582a7e8a9cc66f09dcb0b2306"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.17.1


