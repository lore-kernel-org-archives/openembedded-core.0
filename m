Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TthXf-0001ak-Il
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 17:33:19 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Jan 2013 08:17:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,452,1355126400"; d="scan'208";a="272760090"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.30])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jan 2013 08:17:57 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2013 18:18:02 +0200
Message-Id: <1357921082-17180-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] db: upgrade to 5.3.21
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
X-List-Received-Date: Fri, 11 Jan 2013 16:33:19 -0000

License file changed the year,
triggering a change in checksum

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-support/db/{db_5.3.15.bb => db_5.3.21.bb} |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/db/{db_5.3.15.bb => db_5.3.21.bb} (93%)

diff --git a/meta/recipes-support/db/db_5.3.15.bb b/meta/recipes-support/db/db_5.3.21.bb
similarity index 93%
rename from meta/recipes-support/db/db_5.3.15.bb
rename to meta/recipes-support/db/db_5.3.21.bb
index 509c567..23d6c4e 100644
--- a/meta/recipes-support/db/db_5.3.15.bb
+++ b/meta/recipes-support/db/db_5.3.21.bb
@@ -14,15 +14,15 @@ HOMEPAGE = "http://www.oracle.com/technology/products/berkeley-db/db/index.html"
 LICENSE = "Sleepycat"
 VIRTUAL_NAME ?= "virtual/db"
 RCONFLICTS_${PN} = "db3"
-PR = "r9"
+PR = "r0"
 
 SRC_URI = "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
 SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.."
 
-SRC_URI[md5sum] = "5493fb5f7cc3915887c836b096f18773"
-SRC_URI[sha256sum] = "4f4f7d548984dde3584fcda0e4f96901cb8bafb08033a7781aec64ef2ea1f579"
+SRC_URI[md5sum] = "3fda0b004acdaa6fa350bfc41a3b95ca"
+SRC_URI[sha256sum] = "ddd92a930317df92021054c03992392db9ea5cddba43bef8920d392a82114fb8"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=12cc3ff983ed4ecc6cc091370ee4dbc3"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=32aefa5a8e7318be1f657432cbe2e768"
 
 inherit autotools
 
-- 
1.7.10.4



