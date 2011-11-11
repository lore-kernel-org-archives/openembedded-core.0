Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROmhS-0000Nv-5e
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 09:43:07 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Nov 2011 00:36:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,494,1315206000"; d="scan'208";a="89010363"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.157])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2011 00:36:38 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 00:36:35 -0800
Message-Id: <1554a1dcd9cc2fd659918936daf5481b6d5082a2.1321000451.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321000451.git.sgw@linux.intel.com>
References: <cover.1321000451.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321000451.git.sgw@linux.intel.com>
References: <cover.1321000451.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 9/9] xinit: rdepends on util-linux-mcookie to avoid brining whole util-linux
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
X-List-Received-Date: Fri, 11 Nov 2011 08:43:07 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/xorg-app/xinit_1.3.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb b/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
index 6953ccc..08dfe12 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.3.0.bb
@@ -10,12 +10,12 @@ then terminate."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0d4b5eef75f1584ccbdc5e4a34314407"
 
-PR = "r1"
+PR = "r2"
 PE = "1"
 
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
 
-RDEPENDS_${PN} += "util-linux"
+RDEPENDS_${PN} += "util-linux-mcookie"
 
 FILES_${PN} += "${libdir}X11/xinit"
 
-- 
1.7.6.4



