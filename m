Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1SUd9x-00006R-Lz
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 14:16:53 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2012 05:06:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="144645876"
Received: from sentry (HELO localhost.localdomain) ([10.237.104.57])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2012 05:06:50 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 May 2012 15:07:13 +0300
Message-Id: <1337170033-16776-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] foomatic-filters: Updated to 4.0.15
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
X-List-Received-Date: Wed, 16 May 2012 12:16:53 -0000

---
 ...filters_4.0.7.bb => foomatic-filters_4.0.15.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/foomatic/{foomatic-filters_4.0.7.bb => foomatic-filters_4.0.15.bb} (90%)

diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.15.bb
similarity index 90%
rename from meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
rename to meta/recipes-extended/foomatic/foomatic-filters_4.0.15.bb
index 223bb02..bcf8d1d 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.15.bb
@@ -10,15 +10,15 @@ format using a printer-specific, but spooler-independent PPD file. \
 "
 
 DEPENDS += "cups perl libxml2"
-PR = "r3"
+PR = "r0"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "http://www.openprinting.org/download/foomatic/foomatic-filters-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "20abd25c1c98b2dae68709062a132a7d"
-SRC_URI[sha256sum] = "090313fae40b177f505d9c9b93d7a4d7188b6d5d18b6ae41ab24903ac983478d"
+SRC_URI[md5sum] = "1b7efcdc57340915647daa5b5c15b0ef"
+SRC_URI[sha256sum] = "f5b7b67aacedec4c0294d242cbffbe0d7d3cd0fdd2b410c055e818f25ed3bc79"
 
 inherit autotools
 
-- 
1.7.9.5



