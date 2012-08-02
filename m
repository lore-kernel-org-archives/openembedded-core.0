Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1Swu7o-0006cU-SY
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 14:03:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Aug 2012 04:51:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="201380991"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2012 04:51:51 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 14:53:37 +0300
Message-Id: <1343908417-8226-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] watchdog: Upgrade to upstream v5.12
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
X-List-Received-Date: Thu, 02 Aug 2012 12:03:33 -0000

sourceforge.net link is broken at the time of this patch,
so I added a mirror.
License changed to GPLv2+

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/classes/mirrors.bbclass                       |    1 +
 .../{watchdog_5.11.bb => watchdog_5.12.bb}         |   11 +++++------
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/watchdog/{watchdog_5.11.bb => watchdog_5.12.bb} (66%)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 1a9a531..9009f20 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -45,6 +45,7 @@ ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://gd.tuwien.ac.at/utils/adm
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://sunsite.ualberta.ca/pub/Mirror/lsof/ \n \
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://the.wiretapped.net/pub/security/host-security/lsof/ \n \
 http://www.apache.org/dist  http://archive.apache.org/dist \n \
+http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc/ \n \
 cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
diff --git a/meta/recipes-extended/watchdog/watchdog_5.11.bb b/meta/recipes-extended/watchdog/watchdog_5.12.bb
similarity index 66%
rename from meta/recipes-extended/watchdog/watchdog_5.11.bb
rename to meta/recipes-extended/watchdog/watchdog_5.12.bb
index 6a611c9..cc4d1a3 100644
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
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog_${PV}.tar.gz \
 	   file://fix-ping-failure.patch"
 
-
-SRC_URI[md5sum] = "02c764219b3bdb2373091cbd67109eb6"
-SRC_URI[sha256sum] = "723a7966e0c3d58e3f4df20943a5c9aa1553381f46aa0dbcf832016756e62792"
+SRC_URI[md5sum] = "cea28bea70e54f3625062bc808aef9af"
+SRC_URI[sha256sum] = "862d5da6ab34568bbd4ea695316f063fecabe107d0939ceea6c67c9ec0b1a08e"
 
 inherit autotools
 
-- 
1.7.9.5



