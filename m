Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8DAC96B38D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:10:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2013 06:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="354884394"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2013 06:10:04 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 16:09:48 +0300
Message-Id: <38762a60e1d3cc309617d634d3f935bcf152a06b.1375275560.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
Subject: [PATCH 04/13] powertop: upgrade to 2.4
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
X-List-Received-Date: Wed, 31 Jul 2013 13:10:16 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../powertop/{powertop_2.3.bb => powertop_2.4.bb}  |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/powertop/{powertop_2.3.bb => powertop_2.4.bb} (87%)

diff --git a/meta/recipes-kernel/powertop/powertop_2.3.bb b/meta/recipes-kernel/powertop/powertop_2.4.bb
similarity index 87%
rename from meta/recipes-kernel/powertop/powertop_2.3.bb
rename to meta/recipes-kernel/powertop/powertop_2.4.bb
index 5dae1b6..465d117 100644
--- a/meta/recipes-kernel/powertop/powertop_2.3.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.4.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
 SRC_URI = "http://01.org/powertop/sites/default/files/downloads/powertop-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "dc03608f20e56cdc99d121a6191556f6"
-SRC_URI[sha256sum] = "b8c1add69afee28c77dca56fdcedb4a46820f3a71c86aae7891b0c5c595cd744"
+SRC_URI[md5sum] = "3aa686bb245d6683b86cba9a6a4b8c6d"
+SRC_URI[sha256sum] = "42796c94546ae7f3d232e41b7fa09b2532396ca389908ff528870311db6327b7"
 
 inherit autotools gettext
 
-- 
1.7.9.5


