Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1Sz1RU-00016i-8p
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 10:16:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Aug 2012 01:04:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,730,1336374000"; d="scan'208";a="177334588"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by orsmga001.jf.intel.com with ESMTP; 08 Aug 2012 01:04:32 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2012 11:06:27 +0300
Message-Id: <1344413188-24709-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] watchdog: Upgrade to upstream v5.12
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
X-List-Received-Date: Wed, 08 Aug 2012 08:16:36 -0000

License changed to GPLv2+

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../{watchdog_5.11.bb => watchdog_5.12.bb}         |   13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/watchdog/{watchdog_5.11.bb => watchdog_5.12.bb} (57%)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.11.bb b/meta/recipes-extended/watchdog/watchdog_5.12.bb
similarity index 57%
rename from meta/recipes-extended/watchdog/watchdog_5.11.bb
rename to meta/recipes-extended/watchdog/watchdog_5.12.bb
index 6a611c9..2a6099f 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.11.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.12.bb
@@ -5,17 +5,16 @@ it will reboot the system."
 HOMEPAGE = "http://watchdog.sourceforge.net/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=172030&atid=860194"
 
-LICENSE = "GPL-1.0+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8a7258c60a71a2f04b67fb01f495889c"
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ecc0551bf54ad97f6b541720f84d6569"
 
-PR = "r1"
+PR = "r0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog_${PV}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
 	   file://fix-ping-failure.patch"
 
-
-SRC_URI[md5sum] = "02c764219b3bdb2373091cbd67109eb6"
-SRC_URI[sha256sum] = "723a7966e0c3d58e3f4df20943a5c9aa1553381f46aa0dbcf832016756e62792"
+SRC_URI[md5sum] = "cea28bea70e54f3625062bc808aef9af"
+SRC_URI[sha256sum] = "862d5da6ab34568bbd4ea695316f063fecabe107d0939ceea6c67c9ec0b1a08e"
 
 inherit autotools
 
-- 
1.7.9.5



