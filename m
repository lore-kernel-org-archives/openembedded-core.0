Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QQWcW-0003rX-PB
	for openembedded-core@lists.openembedded.org;
	Sun, 29 May 2011 05:24:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 May 2011 20:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,288,1304319600"; 
   d="scan'208";a="3492583"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 28 May 2011 20:21:44 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 May 2011 20:22:07 -0700
Message-Id: <cb06560885d759a1f7bd36b1bf1b62f70102de8f.1306545413.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306545413.git.nitin.a.kamble@intel.com>
References: <cover.1306545413.git.nitin.a.kamble@intel.com>
Subject: [upgrades 1/4] m4: upgrade from 1.4.15 to 1.4.16
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 May 2011 03:24:53 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../{m4-native_1.4.15.bb => m4-native_1.4.16.bb}   |    0
 .../m4/{m4_1.4.15.bb => m4_1.4.16.bb}              |    6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/m4/{m4-native_1.4.15.bb => m4-native_1.4.16.bb} (100%)
 rename meta/recipes-devtools/m4/{m4_1.4.15.bb => m4_1.4.16.bb} (75%)

diff --git a/meta/recipes-devtools/m4/m4-native_1.4.15.bb b/meta/recipes-devtools/m4/m4-native_1.4.16.bb
similarity index 100%
rename from meta/recipes-devtools/m4/m4-native_1.4.15.bb
rename to meta/recipes-devtools/m4/m4-native_1.4.16.bb
diff --git a/meta/recipes-devtools/m4/m4_1.4.15.bb b/meta/recipes-devtools/m4/m4_1.4.16.bb
similarity index 75%
rename from meta/recipes-devtools/m4/m4_1.4.15.bb
rename to meta/recipes-devtools/m4/m4_1.4.16.bb
index 586071f..53ef5ae 100644
--- a/meta/recipes-devtools/m4/m4_1.4.15.bb
+++ b/meta/recipes-devtools/m4/m4_1.4.16.bb
@@ -4,14 +4,14 @@ compatible although it has some extensions (for example, handling more than 9 po
 GNU M4 also has built-in functions for including files, running shell commands, doing arithmetic, etc."
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
-	file://examples/COPYING;md5=380fd7d57d3fd009a5716e074a845d6d"
+	file://examples/COPYING;md5=fbc986d45b3dae6725c29870dd6b669d"
 
 PR = "r0"
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
            file://ac_config_links.patch;patch=1"
 
-SRC_URI[md5sum] = "5649a2e593b6c639deae9e72ede777dd"
-SRC_URI[sha256sum] = "3d66dfeb609007062265a67b9a2c08d3686a74068830bacae60a6d58413c9367"
+SRC_URI[md5sum] = "a5dfb4f2b7370e9d34293d23fd09b280"
+SRC_URI[sha256sum] = "e9176a35bb13a1b08482359aa554ee8072794f58f00e4827bf0e06b570c827da"
 
 inherit autotools
 
-- 
1.7.2.2



