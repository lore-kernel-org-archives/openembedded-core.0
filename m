Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 68F64793E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 17:51:42 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 6802B6E8D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 19:42:54 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2018 19:42:38 +0200
Message-Id: <20180926174244.20989-6-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180926174244.20989-1-dv@pseudoterminal.org>
References: <20180926174244.20989-1-dv@pseudoterminal.org>
Subject: [PATCH 06/12] gstreamer1.0-libav: upgrade to version 1.14.3
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
X-List-Received-Date: Wed, 26 Sep 2018 17:51:43 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 ...reamer1.0-libav_1.14.2.bb => gstreamer1.0-libav_1.14.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.14.2.bb => gstreamer1.0-libav_1.14.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.3.bb
index 718db17d0d..aaa217e7d4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.3.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz
            file://0001-configure-check-for-armv7ve-variant.patch \
            file://0001-fix-host-contamination.patch \
            "
-SRC_URI[md5sum] = "da3d4655268bc6766a261065ca737590"
-SRC_URI[sha256sum] = "8a351c39c5cfc2bbd31ca434ec4a290a730a26efbdea962fdd8306dce5c576de"
+SRC_URI[md5sum] = "e4a2ad307f101b53c7d417d4d0b36955"
+SRC_URI[sha256sum] = "9b03529bb45785ad1b6b1f4856c52a832ad5fc472285ce49174439e8015ab677"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.17.1


