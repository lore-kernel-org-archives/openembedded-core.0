Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SO2yD-0005LK-T0
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 10:25:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Apr 2012 01:15:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="134670670"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by orsmga001.jf.intel.com with ESMTP; 28 Apr 2012 01:15:53 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Apr 2012 16:12:26 +0800
Message-Id: <5d9f87c71613989b3b116e3ee3efd52533467925.1335600691.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1335600691.git.dongxiao.xu@intel.com>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1335600691.git.dongxiao.xu@intel.com>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/8] telepathy-mission-control: upgrade to version 5.12.0
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
X-List-Received-Date: Sat, 28 Apr 2012 08:25:34 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...11.0.bb => telepathy-mission-control_5.12.0.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.11.0.bb => telepathy-mission-control_5.12.0.bb} (91%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.11.0.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.12.0.bb
similarity index 91%
rename from meta/recipes-connectivity/telepathy/telepathy-mission-control_5.11.0.bb
rename to meta/recipes-connectivity/telepathy/telepathy-mission-control_5.12.0.bb
index 3adde76..65b5d89 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.11.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.12.0.bb
@@ -8,7 +8,7 @@ DEPENDS = "libtelepathy dbus-glib gconf"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/telepathy-mission-control-${PV}.tar.gz"
 
-PR = "r1"
+PR = "r0"
 
 inherit autotools pkgconfig
 
@@ -40,5 +40,5 @@ FILES_libmissioncontrol-dbg = "${libdir}/.debug/libmissioncontrol.so.*"
 FILES_libmissioncontrol-config-dbg = "${libdir}/.debug/libmissioncontrol-config.so.*"
 FILES_libmissioncontrol-server-dbg = "${libdir}/.debug/libmissioncontrol-server.so.*"
 
-SRC_URI[md5sum] = "f7503d52cb432e03ba7b4ad5bb6165c6"
-SRC_URI[sha256sum] = "f5debdaf17c9dcb7299c95e8f9df427fb2e8fbb112f6c951b9a0e6ad330ddfa5"
+SRC_URI[md5sum] = "f39dcfef785a37dc21efa9af06be2e61"
+SRC_URI[sha256sum] = "660aeb65543e1b029dfde6a895934cb20b766644bae2a68c0030052aa6645e77"
-- 
1.7.4.1



