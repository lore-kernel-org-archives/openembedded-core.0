Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1Sm2U3-0004Du-7L
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 14:45:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jul 2012 05:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172922373"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.53])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2012 05:33:22 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 15:33:41 +0300
Message-Id: <1341318821-6703-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] telepathy-glib: update to ver. 0.19.1
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
X-List-Received-Date: Tue, 03 Jul 2012 12:45:35 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...thy-glib_0.19.0.bb => telepathy-glib_0.19.1.bb} |    2 --
 1 file changed, 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.0.bb => telepathy-glib_0.19.1.bb} (82%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.0.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.1.bb
similarity index 82%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.19.0.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.19.1.bb
index 6c4e12c..87a5975 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.1.bb
@@ -7,8 +7,6 @@ PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "a4a01b748b6b7134853a561228fe70e4"
-SRC_URI[sha256sum] = "f2ed6a5207cb579f6807f6f37d4d379a65208c3e094288e57655238b7afd3d66"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.7.9.5



