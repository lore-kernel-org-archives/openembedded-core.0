Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LEL-0000rW-DR
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:41:17 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:32:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121477938"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 17:32:30 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:08 +0800
Message-Id: <1817ee5abf0c1383ff5d7e400eaf3d1c6aef8bec.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 11/60] telepathy-mission-control: upgrade to 5.11.0
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
X-List-Received-Date: Fri, 16 Mar 2012 00:41:17 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 ...10.1.bb => telepathy-mission-control_5.11.0.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.10.1.bb => telepathy-mission-control_5.11.0.bb} (91%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.10.1.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.11.0.bb
similarity index 91%
rename from meta/recipes-connectivity/telepathy/telepathy-mission-control_5.10.1.bb
rename to meta/recipes-connectivity/telepathy/telepathy-mission-control_5.11.0.bb
index 9be4543..924b84a 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.10.1.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.11.0.bb
@@ -8,7 +8,7 @@ DEPENDS = "libtelepathy dbus-glib gconf"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/telepathy-mission-control-${PV}.tar.gz"
 
-PR = "r1"
+PR = "r0"
 
 inherit autotools pkgconfig
 
@@ -40,5 +40,5 @@ FILES_libmissioncontrol-dbg = "${libdir}/.debug/libmissioncontrol.so.*"
 FILES_libmissioncontrol-config-dbg = "${libdir}/.debug/libmissioncontrol-config.so.*"
 FILES_libmissioncontrol-server-dbg = "${libdir}/.debug/libmissioncontrol-server.so.*"
 
-SRC_URI[md5sum] = "50594028ebb2dba0181fec99e6f56ff5"
-SRC_URI[sha256sum] = "e1d9ce7b8827c19bf2e5d522641ae86ff2476c605de2533d608721ea49023a10"
+SRC_URI[md5sum] = "f7503d52cb432e03ba7b4ad5bb6165c6"
+SRC_URI[sha256sum] = "f5debdaf17c9dcb7299c95e8f9df427fb2e8fbb112f6c951b9a0e6ad330ddfa5"
-- 
1.7.6



