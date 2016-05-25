Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6F05165CBA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 13:29:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2016 06:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,364,1459839600"; d="scan'208";a="988474037"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 25 May 2016 06:29:48 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 16:29:35 +0300
Message-Id: <ed0d3b9d94504b5050791c8f195e90de2e478a76.1464176988.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ade23f378a1dc2d3153dd71e6a00c65c6c56e8f0.1464176988.git.jussi.kukkonen@intel.com>
References: <ade23f378a1dc2d3153dd71e6a00c65c6c56e8f0.1464176988.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1464176988.git.jussi.kukkonen@intel.com>
References: <cover.1464176988.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/7] clutter-gst-3.0: Upgrade 3.0.16 -> 3.0.18
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
X-List-Received-Date: Wed, 25 May 2016 13:29:49 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../clutter/{clutter-gst-3.0_3.0.16.bb => clutter-gst-3.0_3.0.18.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.16.bb => clutter-gst-3.0_3.0.18.bb} (58%)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.16.bb b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.18.bb
similarity index 58%
rename from meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.16.bb
rename to meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.18.bb
index fcf5242..9626cd9 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.16.bb
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0_3.0.18.bb
@@ -3,5 +3,5 @@ require clutter-gst-3.0.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=95baacba194e814c110ea3bdf25ddbf4"
 
-SRC_URI[archive.md5sum] = "ca24eb92a0d34fc9e66fd686a965d51c"
-SRC_URI[archive.sha256sum] = "803e8b7265e63e0581e21fd0c6064792dfe951512e9f515e9e7a9b452caaf9f0"
+SRC_URI[archive.md5sum] = "3e4f64477f26d9cfd2db06d3aaed203a"
+SRC_URI[archive.sha256sum] = "0aec0d0c6020cd19a5bb0dab1165a92748f81a9a3acdfabb0f966d5f53bc8093"
-- 
2.1.4


