Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SXqIx-0003Xy-NN
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 10:55:27 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2012 01:45:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104189547"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.104.69])
	by AZSMGA002.ch.intel.com with ESMTP; 25 May 2012 01:45:13 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2012 11:50:55 +0300
Message-Id: <99d2934e78f953e7310c354e4d72bc7534f82ab2.1337868781.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337868781.git.radu.moisan@intel.com>
References: <cover.1337868781.git.radu.moisan@intel.com>
In-Reply-To: <cover.1337868781.git.radu.moisan@intel.com>
References: <cover.1337868781.git.radu.moisan@intel.com>
Subject: [PATCH 1/3] foomatic-filters: update to version 4.0.15
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
X-List-Received-Date: Fri, 25 May 2012 08:55:27 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
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



