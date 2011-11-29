Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWn5-0001ej-5E
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:08:45 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720787"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:29 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:06 -0800
Message-Id: <234071f22c2183ea28cda55bac8f68cb47e8f0e1.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 06/26] xinit: Update to 1.3.1
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
X-List-Received-Date: Tue, 29 Nov 2011 23:08:46 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-app/{xinit_1.3.0.bb => xinit_1.3.1.bb}    |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xinit_1.3.0.bb => xinit_1.3.1.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb b/meta/recipes-graphics/xorg-app/xinit_1.3.1.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
rename to meta/recipes-graphics/xorg-app/xinit_1.3.1.bb
index 08dfe12..2ddebe6 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.3.1.bb
@@ -13,11 +13,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0d4b5eef75f1584ccbdc5e4a34314407"
 PR = "r2"
 PE = "1"
 
+SRC_URI[md5sum] = "ee234056d8a3dbf37b61b4bcb35b88e4"
+SRC_URI[sha256sum] = "c7468dfae94bdb42785d79623c27156dc4bf379d8372992830482cb04d8439b0"
+
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
 
 RDEPENDS_${PN} += "util-linux-mcookie"
 
 FILES_${PN} += "${libdir}X11/xinit"
-
-SRC_URI[md5sum] = "bc4e8b7d1919597cc37a0d24aa149dda"
-SRC_URI[sha256sum] = "ba76e36e1a42a7cf76505b7e6fc4777f5d14f45ddff74341abfb7dd10d5fe04c"
-- 
1.7.6.4



