Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UGCdi-0003Yd-Cf
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 19:12:31 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2013 10:55:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,845,1355126400"; d="scan'208";a="214773849"
Received: from unknown (HELO dell-desktop.rb.intel.com) ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Mar 2013 10:55:35 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2013 19:55:05 +0200
Message-Id: <da3a6d4406ba9861a30efd16d70ea69998db1b80.1363283478.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
Subject: [PATCH 06/17] u-boo-fw-utils: Upgrade to v2013.01.01
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Mar 2013 18:12:33 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 ...2012.04.01.bb => u-boot-fw-utils_2013.01.01.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2012.04.01.bb => u-boot-fw-utils_2013.01.01.bb} (84%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.01.01.bb
similarity index 84%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.01.01.bb
index fe3422a..efa418f 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.01.01.bb
@@ -9,12 +9,12 @@ DEPENDS = "mtd-utils"
 # make it default
 DEFAULT_PREFERENCE = "-1"
 
-# This revision corresponds to the tag "v2012.04.01"
+# This revision corresponds to the tag "v2013.01.01"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "415d386877df49eb051b85ef74fa59a16dc17c7d"
+SRCREV = "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
 
-PV = "v2012.04.01+git${SRCPV}"
+PV = "v2013.01.01+git${SRCPV}"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
-- 
1.7.9.5



