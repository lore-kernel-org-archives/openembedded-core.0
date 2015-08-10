Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 284C276889
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 14:22:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 10 Aug 2015 07:22:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,645,1432623600"; d="scan'208";a="745684115"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 10 Aug 2015 07:22:29 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 17:23:26 +0300
Message-Id: <3c49e7891d94061376a1ce296e35e37465741b5c.1439216269.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 8/8] clutter-gst: update to 3.0.8
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
X-List-Received-Date: Mon, 10 Aug 2015 14:22:28 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../clutter/{clutter-gst-3.0_3.0.6.bb => clutter-gst-3.0_3.0.8.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.6.bb => clutter-gst-3.0_3.0.8.bb} (58%)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.6.bb b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.8.bb
similarity index 58%
rename from meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.6.bb
rename to meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.8.bb
index 27beed9..319a955 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.6.bb
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.8.bb
@@ -3,5 +3,5 @@ require clutter-gst-3.0.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=95baacba194e814c110ea3bdf25ddbf4"
 
-SRC_URI[archive.md5sum] = "3100f52225d8be92f57efe246943e3a2"
-SRC_URI[archive.sha256sum] = "d6d5493ae57cc175deee479304569c419d2bb90de3be124e6f3350ae7e73df76"
+SRC_URI[archive.md5sum] = "f7d97f96e7cca82f38317d1734d5dadb"
+SRC_URI[archive.sha256sum] = "582e85b88482e16f7ec719363e38fadf84fab4d4baaa21e5227a454b824f135c"
-- 
2.1.4


