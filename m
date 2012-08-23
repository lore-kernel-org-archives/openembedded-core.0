Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T4Wua-0001Dd-Tb
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 14:53:25 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Aug 2012 05:40:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,300,1344236400"; d="scan'208";a="209459731"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2012 05:40:13 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2012 14:45:00 +0300
Message-Id: <1345722302-25467-2-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345722302-25467-1-git-send-email-constantinx.musca@intel.com>
References: <1345722302-25467-1-git-send-email-constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 1/3] foomatic-filters: upgrade to 4.0.17
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
X-List-Received-Date: Thu, 23 Aug 2012 12:53:25 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 ...ilters_4.0.16.bb => foomatic-filters_4.0.17.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/foomatic/{foomatic-filters_4.0.16.bb => foomatic-filters_4.0.17.bb} (90%)

diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
similarity index 90%
rename from meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
rename to meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
index d158f94..bb01f71 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
@@ -10,15 +10,15 @@ format using a printer-specific, but spooler-independent PPD file. \
 "
 
 DEPENDS += "cups perl libxml2"
-PR = "r1"
+PR = "r0"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "http://www.openprinting.org/download/foomatic/foomatic-filters-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ec907d9ea17e03bccb91db66e9470586"
-SRC_URI[sha256sum] = "bedc61466c284c8ea0ae95c97d51a873411c6c55338e67831893772465f5434d"
+SRC_URI[md5sum] = "b05f5dcbfe359f198eef3df5b283d896"
+SRC_URI[sha256sum] = "a2e2e53e502571e88eeb9010c45a0d54671f15707ee104f5c9c22b59ea7a33e3"
 
 inherit autotools
 
-- 
1.7.9.5



