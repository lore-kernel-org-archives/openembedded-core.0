Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 116C36FF9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 12:55:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2016 05:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,367,1459839600"; d="scan'208";a="985165552"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 26 May 2016 05:55:08 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 15:54:52 +0300
Message-Id: <1335a6f1903d7de71d58610cbf7c7c856d8ad1a1.1464266929.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <8b5285972ecb25a04289bc0b050d8f44d18fc048.1464266929.git.jussi.kukkonen@intel.com>
References: <8b5285972ecb25a04289bc0b050d8f44d18fc048.1464266929.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1464266929.git.jussi.kukkonen@intel.com>
References: <cover.1464266929.git.jussi.kukkonen@intel.com>
Subject: [PATCH v2 5/7] libevdev: Upgrade 1.4.6 -> 1.5.1
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
X-List-Received-Date: Thu, 26 May 2016 12:55:11 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-support/libevdev/{libevdev_1.4.6.bb => libevdev_1.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.4.6.bb => libevdev_1.5.1.bb} (74%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.4.6.bb b/meta/recipes-support/libevdev/libevdev_1.5.1.bb
similarity index 74%
rename from meta/recipes-support/libevdev/libevdev_1.4.6.bb
rename to meta/recipes-support/libevdev/libevdev_1.5.1.bb
index c8163e3..8d6d340 100644
--- a/meta/recipes-support/libevdev/libevdev_1.4.6.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.5.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "9b3f25bd8fb0f8efa4944d34668dddc0"
-SRC_URI[sha256sum] = "7b2ae1a0c7f9f7a96198ddc8fd167f090f233d6cbd8168b847e4f968445132d3"
+SRC_URI[md5sum] = "c8a85eef889754bb77282554b6761873"
+SRC_URI[sha256sum] = "17630821a57e6e3f02e01ade836f24068df9bd530067091152b0d468c3a86f40"
 
 inherit autotools pkgconfig
-- 
2.1.4


