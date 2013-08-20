Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6ED6B5B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 10:46:49 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Aug 2013 03:46:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,919,1367996400"; d="scan'208";a="348892866"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.243])
	by azsmga001.ch.intel.com with ESMTP; 20 Aug 2013 03:46:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2013 11:46:35 +0100
Message-Id: <1376995595-6734-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] gst-plugins-good: fix orc enabling via PACKAGECONFIG
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
X-List-Received-Date: Tue, 20 Aug 2013 10:46:49 -0000

An extra --disable-orc was being added to EXTRA_OECONF regardless of
whether orc was in PACKAGECONFIG, drop this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index 8868ba7..daffcf1 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -25,7 +25,7 @@ inherit gettext gconf
 SRC_URI += "file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch"
 
 EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal --without-check \
-                 --disable-orc --disable-examples --disable-taglib"
+                 --disable-examples --disable-taglib"
 
 do_configure_prepend() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
-- 
1.8.1.2


