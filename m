Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1ScD2X-0002gA-E4
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 12:00:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Jun 2012 02:50:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="153615418"
Received: from sentry (HELO localhost.localdomain) ([10.237.104.51])
	by orsmga002.jf.intel.com with ESMTP; 06 Jun 2012 02:50:04 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2012 12:50:34 +0300
Message-Id: <1338976234-26916-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] telepathy-glib: update to 0.19.0
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
X-List-Received-Date: Wed, 06 Jun 2012 10:00:33 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...thy-glib_0.18.1.bb => telepathy-glib_0.19.0.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.18.1.bb => telepathy-glib_0.19.0.bb} (82%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.18.1.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.0.bb
similarity index 82%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.18.1.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.19.0.bb
index 81da5f8..6c4e12c 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.18.1.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.0.bb
@@ -7,8 +7,8 @@ PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "461732739e3fbf8467991bbe661fb29a"
-SRC_URI[sha256sum] = "3738256689e34c22ddf9c4eb33f44ce7505c18fb1a14c53b8e56dd9c262f4c6d"
+SRC_URI[md5sum] = "a4a01b748b6b7134853a561228fe70e4"
+SRC_URI[sha256sum] = "f2ed6a5207cb579f6807f6f37d4d379a65208c3e094288e57655238b7afd3d66"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.7.9.5



