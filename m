Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AEC6760808
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 06:39:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Apr 2014 23:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,883,1389772800"; d="scan'208";a="523099629"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.143])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2014 23:39:41 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Apr 2014 09:40:33 +0300
Message-Id: <37209e70ec4c1ac91d1a8f8e465739e37ab6aa4a.1397803089.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1397803089.git.cristiana.voicu@intel.com>
References: <cover.1397803089.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1397803089.git.cristiana.voicu@intel.com>
References: <cover.1397803089.git.cristiana.voicu@intel.com>
Subject: [PATCH 4/7] at-spi2-atk: upgrade to 2.12.0
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
X-List-Received-Date: Fri, 18 Apr 2014 06:39:40 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 ...at-spi2-atk_2.10.0.bb => at-spi2-atk_2.12.0.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.10.0.bb => at-spi2-atk_2.12.0.bb} (79%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.10.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.12.0.bb
similarity index 79%
rename from meta/recipes-support/atk/at-spi2-atk_2.10.0.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.12.0.bb
index f8cb4e6..dac5ab4 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.10.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.12.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "38e4f7e2898f7ba3cc3ec269d9402789"
-SRC_URI[sha256sum] = "dea7ff2f9bc9bbdb0351112616d738de718b55739cd2511afecac51604c31a94"
+SRC_URI[md5sum] = "aafc5e1bb17cd3ad440f6350e7a021c1"
+SRC_URI[sha256sum] = "3b5467c9f169812bc36a4245355b7deedea0a62eb22153df96ced88dcd1c3633"
 
 DEPENDS = "dbus glib-2.0 atk at-spi2-core"
 
-- 
1.7.9.5


