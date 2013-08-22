Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 37D4460896
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 10:39:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2013 03:39:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,933,1367996400"; d="scan'208";a="384855254"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2013 03:39:08 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 13:40:58 +0300
Message-Id: <fca2db1acdf40b760b3e7f7667ff5b8679cc34a5.1377168023.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377168023.git.cristian.iorga@intel.com>
References: <cover.1377168023.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1377168023.git.cristian.iorga@intel.com>
References: <cover.1377168023.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] connman: upgrade to 1.17
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
X-List-Received-Date: Thu, 22 Aug 2013 10:39:09 -0000

connman 1.17 is mainly a bugfix release,
as such, recommended to upgrade to.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../recipes-connectivity/connman/{connman_1.16.bb => connman_1.17.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.16.bb => connman_1.17.bb} (69%)

diff --git a/meta/recipes-connectivity/connman/connman_1.16.bb b/meta/recipes-connectivity/connman/connman_1.17.bb
similarity index 69%
rename from meta/recipes-connectivity/connman/connman_1.16.bb
rename to meta/recipes-connectivity/connman/connman_1.17.bb
index 7e54bc2..461157f 100644
--- a/meta/recipes-connectivity/connman/connman_1.16.bb
+++ b/meta/recipes-connectivity/connman/connman_1.17.bb
@@ -6,8 +6,8 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://connman \
             "
 
-SRC_URI[md5sum] = "d2906816222219e10426442d07c3f4c1"
-SRC_URI[sha256sum] = "7273e88e6a6338be1e51b0e4c685d556386897cba9317cd83370bfb3f009982a"
+SRC_URI[md5sum] = "dd4a13f789de1b69fcddf0cf613f2d5b"
+SRC_URI[sha256sum] = "d31aa2e7dc9fa817c93aba973995b63506a8c83f55afe507028f09b580ef0b00"
 
 PR = "${INC_PR}.0"
 
-- 
1.8.1.2


