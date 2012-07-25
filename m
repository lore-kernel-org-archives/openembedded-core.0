Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Stw3o-0004Xn-69
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:31:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 00:19:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172897599"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.97])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 00:19:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 00:19:19 -0700
Message-Id: <57346bc2112b016f15878d16ceca93885865a585.1343200454.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/28] xinit_1.3.2: Remove broken, superfluous 'FILES_${PN} += "${libdir}X11/xinit"'
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
X-List-Received-Date: Wed, 25 Jul 2012 07:31:09 -0000

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

Besides being clearly broken, that line is unnecessary as that file is
already being picked up from this line in xorg-app-common.inc:

FILES_${PN} += " ${libdir}/X11/${BPN} ${datadir}/X11/app-defaults/"

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/xorg-app/xinit_1.3.2.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb b/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
index 2008e79..5a97c3b 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
@@ -19,5 +19,3 @@ SRC_URI[sha256sum] = "a1867fdaa83f68750b12ba4305c3c62f5992d0f52cfeb98e96c27a8e69
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
 
 RDEPENDS_${PN} += "util-linux-mcookie"
-
-FILES_${PN} += "${libdir}X11/xinit"
-- 
1.7.7.6



