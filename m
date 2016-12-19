Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id F273E77226
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:35:58 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 19 Dec 2016 05:36:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,373,1477983600"; d="scan'208";a="44702416"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 19 Dec 2016 05:36:00 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id E502F6A4080;
	Mon, 19 Dec 2016 05:35:10 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 15:35:44 +0200
Message-Id: <cf29f4f42bb4848ae154372c0c141f2a0a20c076.1482154012.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1482154012.git.jussi.kukkonen@intel.com>
References: <cover.1482154012.git.jussi.kukkonen@intel.com>
Subject: [PATCH 6/8] clutter-gst-3.0: Upgrade 3.0.20 -> 3.0.22
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
X-List-Received-Date: Mon, 19 Dec 2016 13:35:59 -0000

Bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../clutter/{clutter-gst-3.0_3.0.20.bb => clutter-gst-3.0_3.0.22.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.20.bb => clutter-gst-3.0_3.0.22.bb} (58%)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.20.bb b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.22.bb
similarity index 58%
rename from meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.20.bb
rename to meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.22.bb
index 0bf9386..6177c91 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.20.bb
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.22.bb
@@ -3,5 +3,5 @@ require clutter-gst-3.0.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=95baacba194e814c110ea3bdf25ddbf4"
 
-SRC_URI[archive.md5sum] = "e6de3afcf82fcddab8193665f1a1667e"
-SRC_URI[archive.sha256sum] = "a0011787ed2a2dafe914f973c1ede283d40b8eb75123f4a7b608ae6d1cc066c9"
+SRC_URI[archive.md5sum] = "88eea2dd5fc4357b5b18f1dfeed56c62"
+SRC_URI[archive.sha256sum] = "f1fc57fb32ea7e3d9234b58db35eb9ef3028cf0b266d85235f959edc0fe3dfd4"
-- 
2.1.4


