Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E1C5073C5B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 11:13:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 May 2015 04:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,372,1427785200"; d="scan'208";a="723908396"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 05 May 2015 04:13:09 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 May 2015 14:12:49 +0300
Message-Id: <b8cb493fc7748508d3836a5069383c8d94c503ac.1430824114.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2794ed3bb198b06f681f9492dbeea032a3fd4438.1430824114.git.jussi.kukkonen@intel.com>
References: <2794ed3bb198b06f681f9492dbeea032a3fd4438.1430824114.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1430824114.git.jussi.kukkonen@intel.com>
References: <cover.1430824114.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/4] x11perf: Upgrade 1.5.4 -> 1.6.0
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
X-List-Received-Date: Tue, 05 May 2015 11:13:09 -0000

* remove PR

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-graphics/xorg-app/{x11perf_1.5.4.bb => x11perf_1.6.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{x11perf_1.5.4.bb => x11perf_1.6.0.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-app/x11perf_1.5.4.bb b/meta/recipes-graphics/xorg-app/x11perf_1.6.0.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-app/x11perf_1.5.4.bb
rename to meta/recipes-graphics/xorg-app/x11perf_1.6.0.bb
index cc0b323..4e93558 100644
--- a/meta/recipes-graphics/xorg-app/x11perf_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-app/x11perf_1.6.0.bb
@@ -11,10 +11,9 @@ DEPENDS += "libxmu libxrender libxft libxext fontconfig"
 LIC_FILES_CHKSUM = "file://COPYING;md5=428ca4d67a41fcd4fc3283dce9bbda7e \
                     file://x11perf.h;endline=24;md5=29555066baf406a105ff917ac25b2d01"
 
-PR = "${INC_PR}.0"
 PE = "1"
 
 FILES_${PN} += "${libdir}/X11/x11perfcomp/*"
 
-SRC_URI[md5sum] = "5c3c7431a38775caaea6051312a49bc9"
-SRC_URI[sha256sum] = "24ee8857a2bf414b360addabf1c27ef797f7f504ee9bc409c151760bfbe53184"
+SRC_URI[md5sum] = "f0b24e4d8beb622a419e8431e1c03cd7"
+SRC_URI[sha256sum] = "e87098dec1947572d70c62697a7b70bde1ab5668237d4660080eade6bc096751"
-- 
2.1.4


