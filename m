Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CA0E365DF4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 06:39:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Apr 2014 23:39:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,883,1389772800"; d="scan'208";a="523099636"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.143])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2014 23:39:42 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Apr 2014 09:40:34 +0300
Message-Id: <20a5df9ad87cc081704f26d0c60c35354131fc0f.1397803089.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1397803089.git.cristiana.voicu@intel.com>
References: <cover.1397803089.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1397803089.git.cristiana.voicu@intel.com>
References: <cover.1397803089.git.cristiana.voicu@intel.com>
Subject: [PATCH 5/7] at-spi2-core: upgrade to 2.12.0
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
X-List-Received-Date: Fri, 18 Apr 2014 06:39:42 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 ...-spi2-core_2.10.2.bb => at-spi2-core_2.12.0.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.10.2.bb => at-spi2-core_2.12.0.bb} (77%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.10.2.bb b/meta/recipes-support/atk/at-spi2-core_2.12.0.bb
similarity index 77%
rename from meta/recipes-support/atk/at-spi2-core_2.10.2.bb
rename to meta/recipes-support/atk/at-spi2-core_2.12.0.bb
index 1cfbc9f..bdda15a 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.10.2.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.12.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "d4a198201f6189fb248f3edd19efe39c"
-SRC_URI[sha256sum] = "d3da58f84f4c8e4d5fe940ecb52fb27b4d9ea2b4dcdb3e1fae0f46b5eaa2dde1"
+SRC_URI[md5sum] = "b12ad0e0924706f5e7f51216241068ef"
+SRC_URI[sha256sum] = "db550edd98e53b4252521459c2dcaf0f3b060a9bad52489b9dbadbaedad3fb89"
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"
 
-- 
1.7.9.5


