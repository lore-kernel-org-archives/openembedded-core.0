Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DFD4E731EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:23:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 14 Jan 2016 05:23:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="893103203"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2016 05:23:29 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 15:27:52 +0200
Message-Id: <b0ebf895b283dd3af51c5a8bd4e1371410ea09fd.1452777133.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b5b7c6947b4c54966087ad6c21b9fab79da1fa1e.1452777133.git.jussi.kukkonen@intel.com>
References: <b5b7c6947b4c54966087ad6c21b9fab79da1fa1e.1452777133.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1452777133.git.jussi.kukkonen@intel.com>
References: <cover.1452777133.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/9] libevdev: upgrade to 1.4.6
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
X-List-Received-Date: Thu, 14 Jan 2016 13:23:30 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-support/libevdev/{libevdev_1.4.2.bb => libevdev_1.4.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.4.2.bb => libevdev_1.4.6.bb} (74%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.4.2.bb b/meta/recipes-support/libevdev/libevdev_1.4.6.bb
similarity index 74%
rename from meta/recipes-support/libevdev/libevdev_1.4.2.bb
rename to meta/recipes-support/libevdev/libevdev_1.4.6.bb
index f851305..c8163e3 100644
--- a/meta/recipes-support/libevdev/libevdev_1.4.2.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.4.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "debfcd5153558eba25a8e71eb2534ae8"
-SRC_URI[sha256sum] = "7c77b213f075706d428a2af54b66bf86b03a68e9fb390e7ec48cf55065970643"
+SRC_URI[md5sum] = "9b3f25bd8fb0f8efa4944d34668dddc0"
+SRC_URI[sha256sum] = "7b2ae1a0c7f9f7a96198ddc8fd167f090f233d6cbd8168b847e4f968445132d3"
 
 inherit autotools pkgconfig
-- 
2.1.4


