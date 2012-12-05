Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TgFFm-0003VE-QW
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 14:43:10 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Dec 2012 05:28:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,221,1355126400"; d="scan'208";a="257623925"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.253])
	by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2012 05:28:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 13:28:32 +0000
Message-Id: <794fc28306e3d22c82515eaf4a42ff1d5776da74.1354713989.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354713989.git.paul.eggleton@linux.intel.com>
References: <cover.1354713989.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1354713989.git.paul.eggleton@linux.intel.com>
References: <cover.1354713989.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] qmmp: remove qmake2 from inherit
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

qt4x11 already inherits qmake2 so it doesn't need to be inherited again.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt-apps/qmmp_0.6.1.bb |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb b/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb
index 9068025..ed096e9 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb
@@ -5,7 +5,7 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 SECTION = "multimedia"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "taglib libmad libvorbis libogg alsa-lib"
 
@@ -14,8 +14,7 @@ SRC_URI = "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "23a1a3aa924da901ebc8327ea76135d4"
 SRC_URI[sha256sum] = "b48be8c0e3882088919a77ce7b619cfc99d32af29cc688ba8749a58cbb25fb6f"
 
-
-inherit qmake2 cmake qt4x11
+inherit cmake qt4x11
 
 export EXTRA_OECMAKE = "-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
                         -DQT_LRELEASE_EXECUTABLE=${OE_QMAKE_LRELEASE} \
-- 
1.7.10.4



