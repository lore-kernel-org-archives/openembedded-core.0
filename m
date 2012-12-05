Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TgFFn-0003VD-1X
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 14:43:11 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Dec 2012 05:28:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,221,1355126400"; d="scan'208";a="257623926"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.253])
	by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2012 05:28:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 13:28:33 +0000
Message-Id: <a54697d2d92fe8d2fecbf3fe76c4c4f11b3bd4bb.1354713989.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354713989.git.paul.eggleton@linux.intel.com>
References: <cover.1354713989.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1354713989.git.paul.eggleton@linux.intel.com>
References: <cover.1354713989.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] quicky: tidy up inherit
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
X-List-Received-Date: Wed, 05 Dec 2012 13:43:11 -0000

* inherit qt4x11 which inherits qmake2 and sets DEPENDS already.
* Remove pkgconfig from inherit since quicky doesn't actually use
  pkg-config nor does it produce a .pc file

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt-apps/quicky_0.4.bb |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-qt/qt-apps/quicky_0.4.bb b/meta/recipes-qt/qt-apps/quicky_0.4.bb
index 73d3e99..acacd8e 100644
--- a/meta/recipes-qt/qt-apps/quicky_0.4.bb
+++ b/meta/recipes-qt/qt-apps/quicky_0.4.bb
@@ -4,16 +4,14 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://version.h;endline=19;md5=878bdaff438dab86298301fd1a210e14"
 SECTION = "x11/apps"
 
-PR = "r1"
-
-DEPENDS = "qt4-x11-free"
+PR = "r2"
 
 SRC_URI = "http://qt-apps.org/CONTENT/content-files/80325-quicky-0.4.tar.gz"
 
 SRC_URI[md5sum] = "824d9e477ee9c4994f73a3cb215161d9"
 SRC_URI[sha256sum] = "9c66376e0035d44547612bf629890769a6178c3e7eafbcf95f1c6207ac0f352a"
 
-inherit qmake2 pkgconfig
+inherit qt4x11
 
 do_install() {
 	install -d ${D}${bindir}
-- 
1.7.10.4



