Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 9AB2478602
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 21:28:30 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id B87C34CB5C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 23:28:30 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 23:28:18 +0200
Message-Id: <1502486900-16180-9-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502486900-16180-1-git-send-email-dv@pseudoterminal.org>
References: <1502486900-16180-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 08/10] gstreamer1.0-libav: upgrade to version 1.12.2
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
X-List-Received-Date: Fri, 11 Aug 2017 21:28:31 -0000

From: Maxin John <maxin.john@intel.com>

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../{gstreamer1.0-libav_1.10.4.bb => gstreamer1.0-libav_1.12.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.10.4.bb => gstreamer1.0-libav_1.12.2.bb} (88%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.2.bb
similarity index 88%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.2.bb
index e4bb477..6c5f779 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz
            file://mips64_cpu_detection.patch \
            file://0001-configure-check-for-armv7ve-variant.patch \
            "
-SRC_URI[md5sum] = "e2bdd9fde6ca3ff7efffb93df121f4fd"
-SRC_URI[sha256sum] = "6ca0feca75e3d48315e07f20ec37cf6260ed1e9dde58df355febd5016246268b"
+SRC_URI[md5sum] = "8788aecc032a287227b4bd239d1b998a"
+SRC_URI[sha256sum] = "5bb735b9bb218b652ae4071ea6f6be8eaae55e9d3233aec2f36b882a27542db3"
 
 S = "${WORKDIR}/gst-libav-${PV}"
-- 
2.7.4


