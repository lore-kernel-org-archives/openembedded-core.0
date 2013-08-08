Return-Path: <nitin.a.kamble@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 02C386B53B
	for <Openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 21:33:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Aug 2013 14:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,841,1367996400"; d="scan'208";a="359882642"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga001.jf.intel.com with ESMTP; 08 Aug 2013 14:33:28 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 21:34:29 +0000
Message-Id: <ebd74052582cd3def1b5a4c3d609cfc6b2613933.1375996888.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <13a5bf7b035552bb397edea9c91dc528cfa9b70d.1375996888.git.nitin.a.kamble@intel.com>
References: <13a5bf7b035552bb397edea9c91dc528cfa9b70d.1375996888.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1375996888.git.nitin.a.kamble@intel.com>
References: <cover.1375996888.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/3] gst-meta-base: bring in the v4l2 related gst plugin
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
X-List-Received-Date: Thu, 08 Aug 2013 21:33:28 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

If the v4l2 machine feature is enabled, then the v4l2 gstreamer plugin
is also pulled in the gst-meta-base packages.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
index 210da37..c1139f4 100644
--- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
@@ -35,7 +35,9 @@ RDEPENDS_gst-meta-base = "\
     gst-plugins-base-videoscale \
     gst-plugins-base-ffmpegcolorspace \
     gst-plugins-good-autodetect \
-    gst-plugins-good-souphttpsrc"
+    gst-plugins-good-souphttpsrc \
+    gst-plugins-base-videotestsrc \
+    ${@base_contains('MACHINE_FEATURES', 'v4l2', 'gst-plugins-good-video4linux2', '', d)}"
 
 RRECOMMENDS_gst-meta-x11-base = "\
     gst-plugins-base-ximagesink \
-- 
1.8.1.4


