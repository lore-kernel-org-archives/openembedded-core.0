Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3F92677D21
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 10:37:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2017 03:37:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,279,1493708400"; d="scan'208";a="863479320"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Jun 2017 03:37:05 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id D54105800D3;
	Thu,  1 Jun 2017 03:37:04 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 13:36:51 +0300
Message-Id: <a5b1d675d79068ed89d19fef8843f8b2bf983f83.1496311679.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496311679.git.jussi.kukkonen@intel.com>
References: <cover.1496311679.git.jussi.kukkonen@intel.com>
Subject: [PATCH 06/10] clutter-gst-3.0: Upgrade 3.0.22 -> 3.0.24
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
X-List-Received-Date: Thu, 01 Jun 2017 10:37:04 -0000

Very small release with only bug fixes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../clutter/{clutter-gst-3.0_3.0.22.bb => clutter-gst-3.0_3.0.24.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.22.bb => clutter-gst-3.0_3.0.24.bb} (58%)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.22.bb b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.24.bb
similarity index 58%
rename from meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.22.bb
rename to meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.24.bb
index 6177c91..ca5e0ae 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.22.bb
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.24.bb
@@ -3,5 +3,5 @@ require clutter-gst-3.0.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=95baacba194e814c110ea3bdf25ddbf4"
 
-SRC_URI[archive.md5sum] = "88eea2dd5fc4357b5b18f1dfeed56c62"
-SRC_URI[archive.sha256sum] = "f1fc57fb32ea7e3d9234b58db35eb9ef3028cf0b266d85235f959edc0fe3dfd4"
+SRC_URI[archive.md5sum] = "3e145e24bb3c340eeeddafd18efe547d"
+SRC_URI[archive.sha256sum] = "e9f1c87d8f4c47062e952fb8008704f8942cf2d6f290688f3f7d13e83578cc6c"
-- 
2.1.4


