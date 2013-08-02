Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3A0916B46D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 15:38:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 02 Aug 2013 08:38:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,802,1367996400"; d="scan'208";a="375219336"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2013 08:38:19 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2013 18:39:50 +0300
Message-Id: <cece4010616a57512ca6b360cf20e1891eb81daf.1375457906.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375457906.git.cristian.iorga@intel.com>
References: <cover.1375457906.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1375457906.git.cristian.iorga@intel.com>
References: <cover.1375457906.git.cristian.iorga@intel.com>
Subject: [PATCH 1/7] telepathy-mission-control: upgrade to v5.15.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Aug 2013 15:38:19 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...mission-control_5.14.0.bb => telepathy-mission-control_5.15.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.14.0.bb => telepathy-mission-control_5.15.0.bb} (92%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.14.0.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb
similarity index 92%
rename from meta/recipes-connectivity/telepathy/telepathy-mission-control_5.14.0.bb
rename to meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb
index 23e4c97..b2736ca 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.14.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb
@@ -7,6 +7,8 @@ SECTION = "libs"
 DEPENDS = "libtelepathy dbus-glib gconf libxslt-native"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/telepathy-mission-control-${PV}.tar.gz"
+SRC_URI[md5sum] = "0efd7d9043f6e189e8ed8111d043b52c"
+SRC_URI[sha256sum] = "88800d1b5f385e94b34721319ff4fe65c493632954d7229b36e57af5b4a7e1b5"
 
 inherit autotools pkgconfig pythonnative
 
@@ -37,6 +39,3 @@ FILES_libmissioncontrol-server-dev = "${libdir}/libmissioncontrol-server.*"
 FILES_libmissioncontrol-dbg = "${libdir}/.debug/libmissioncontrol.so.*"
 FILES_libmissioncontrol-config-dbg = "${libdir}/.debug/libmissioncontrol-config.so.*"
 FILES_libmissioncontrol-server-dbg = "${libdir}/.debug/libmissioncontrol-server.so.*"
-
-SRC_URI[md5sum] = "483fa8860891815a540ecf1bb9155122"
-SRC_URI[sha256sum] = "58e0047f5292836c2c35e1603a908b3ac20a5c0b183869514c63de339fd48a30"
-- 
1.8.1.2


