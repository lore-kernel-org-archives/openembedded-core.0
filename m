Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCI-0000Ym-7V
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181223"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:04 +0300
Message-Id: <e07919681b3d2a763341f5998f0f5e91c63db669.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 17/64] matchbox-wm-2: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:10 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../matchbox-wm-2/matchbox-wm-2_git.bb             |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
index 8b162be..7369339 100644
--- a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
+++ b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
@@ -7,7 +7,7 @@ DEPENDS = "virtual/libx11 libxext libxrender startup-notification expat gconf pa
 
 SRCREV = "01fa5465743c9ee43d040350f4405d35293e4869"
 PV = "0.1+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager-2;protocol=git \
 	file://fix_makefile.patch \
@@ -20,9 +20,8 @@ inherit autotools pkgconfig update-alternatives
 # Change this to x-session-manager->matchbox-session and put in
 # matchbox-session, then change this to x-window-manager to
 # matchbox-window-manager-2.
-ALTERNATIVE_NAME = "x-window-manager"
-ALTERNATIVE_LINK = "${bindir}/x-window-manager"
-ALTERNATIVE_PATH = "${bindir}/matchbox-window-manager"
+ALTERNATIVE_${PN} = "x-window-manager"
+ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/matchbox-window-manager"
 ALTERNATIVE_PRIORITY = "10"
 
 PACKAGES =+ "libmatchbox2"
-- 
1.7.7.6



