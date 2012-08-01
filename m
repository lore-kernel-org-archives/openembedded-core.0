Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Swanm-00017v-KL
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:25:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Aug 2012 08:13:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="180294031"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.62])
	by orsmga002.jf.intel.com with ESMTP; 01 Aug 2012 08:13:54 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 18:16:07 +0300
Message-Id: <1343834167-2572-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] python-dbus: updated to 1.1.1
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
X-List-Received-Date: Wed, 01 Aug 2012 15:25:34 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../{python-dbus_1.1.0.bb => python-dbus_1.1.1.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-dbus_1.1.0.bb => python-dbus_1.1.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python-dbus_1.1.0.bb b/meta/recipes-devtools/python/python-dbus_1.1.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python-dbus_1.1.0.bb
rename to meta/recipes-devtools/python/python-dbus_1.1.1.bb
index a10fda3..51d5bc2 100644
--- a/meta/recipes-devtools/python/python-dbus_1.1.0.bb
+++ b/meta/recipes-devtools/python/python-dbus_1.1.1.bb
@@ -8,8 +8,8 @@ PR = "r0"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "41a459bbbb5fd92eeebd632623af0bd7"
-SRC_URI[sha256sum] = "2dc30b53cdb2e20f8d0265af3be878e9da68745cf9ccc72f75de869094c4fc60"
+SRC_URI[md5sum] = "742c7432ad0f7c3f98291d58fa2e35dc"
+SRC_URI[sha256sum] = "8917ca4fb8f4d693aee18d200cbad166b2c938dfb88c03bb4ab3d90a7c915e88"
 S = "${WORKDIR}/dbus-python-${PV}"
 
 inherit distutils-base autotools pkgconfig
-- 
1.7.9.5



