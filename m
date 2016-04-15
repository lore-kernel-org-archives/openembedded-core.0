Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 241D9731BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 09:58:48 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id E7F6038ACB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 11:52:00 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 11:51:48 +0200
Message-Id: <1460713909-5823-7-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1460713909-5823-1-git-send-email-dv@pseudoterminal.org>
References: <1460713909-5823-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 7/8] gstreamer1.0-libav: upgrade to version 1.8.0
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
X-List-Received-Date: Fri, 15 Apr 2016 09:58:48 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../{gstreamer1.0-libav_1.6.3.bb => gstreamer1.0-libav_1.8.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.6.3.bb => gstreamer1.0-libav_1.8.0.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.0.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.0.bb
index 687230a..99dd4ec 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.0.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
 "
 
-SRC_URI[md5sum] = "cfe9a06913d4fd4067e9e47f6e05fac2"
-SRC_URI[sha256sum] = "857b9c060a0337de38c6d26238c47352433c02eabf26c2f860c854dbc35bd4ab"
+SRC_URI[md5sum] = "361638fa45466c5050bcde6bfe10fa46"
+SRC_URI[sha256sum] = "5a1ce28876aee93cb4f3d090f0e807915a5d9bc1325e3480dd302b85aeb4291c"
 
 S = "${WORKDIR}/gst-libav-${PV}"
-- 
2.5.0


