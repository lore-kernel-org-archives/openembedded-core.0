Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RMk3Q-00065F-Kz
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Nov 2011 18:29:16 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Nov 2011 10:23:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,461,1315206000"; d="scan'208";a="33625114"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.12])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Nov 2011 10:23:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Nov 2011 10:22:38 -0700
Message-Id: <cd839b0b0948e6969685e1361356e2d22ee40ed4.1320513631.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/28] qmmp: Fix qmmp packaging, ensure lowercase package names
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
X-List-Received-Date: Sat, 05 Nov 2011 17:29:17 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
index 98ee907..3823234 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 SECTION = "multimedia"
 
-PR = "r4"
+PR = "r2"
 
 PROVIDES = "qmmp"
 DEPENDS = "qt4-x11-free taglib libmad libvorbis libogg alsa-lib"
@@ -40,7 +40,7 @@ python populate_packages_prepend () {
 
 	for plug_dir in plug_dirs:
 		g_plug_dir = os.path.join(qmmp_libdir,plug_dir)
-		do_split_packages(d, g_plug_dir, '^lib(.*)\.so$', 'qmmp-plugin-' + plug_dir + '-%s', 'Qmmp' + plug_dir  + 'plugin for %s')
+		do_split_packages(d, g_plug_dir, '^lib(.*)\.so$', 'qmmp-plugin-' + plug_dir.lower() + '-%s', 'Qmmp ' + plug_dir  + ' plugin for %s')
 } 
 
 FILES_${PN} = "\
-- 
1.7.6.4



