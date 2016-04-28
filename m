Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 0E27176FFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 18:25:33 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id B194538F7A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 20:25:32 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 20:25:17 +0200
Message-Id: <1461867918-2638-7-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1461867918-2638-1-git-send-email-dv@pseudoterminal.org>
References: <1461867918-2638-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-oe][PATCH v2 7/8] gstreamer1.0-libav: upgrade to version 1.8.1
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
 .../{gstreamer1.0-libav_1.6.3.bb => gstreamer1.0-libav_1.8.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.6.3.bb => gstreamer1.0-libav_1.8.1.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.1.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.1.bb
index 687230a..bb770bf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.1.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
 "
 
-SRC_URI[md5sum] = "cfe9a06913d4fd4067e9e47f6e05fac2"
-SRC_URI[sha256sum] = "857b9c060a0337de38c6d26238c47352433c02eabf26c2f860c854dbc35bd4ab"
+SRC_URI[md5sum] = "85f1a047606ca9e08493d7b6b42df462"
+SRC_URI[sha256sum] = "44a49108c3531b5ac4f346a2247cd7fbafb0e8ab394394cb6d75a70300b38933"
 
 S = "${WORKDIR}/gst-libav-${PV}"
-- 
2.5.0


