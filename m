Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt6VW-0002Yh-Kb
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 00:56:02 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2012 15:48:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113486085"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.238])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2012 15:48:06 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 15:47:51 -0800
Message-Id: <1b3db3597c2b644e61394014886082eb212eef1a.1328226197.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
Subject: [PATCH 12/14] xinit: Update to 1.3.2
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
X-List-Received-Date: Thu, 02 Feb 2012 23:56:03 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-app/{xinit_1.3.1.bb => xinit_1.3.2.bb}    |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xinit_1.3.1.bb => xinit_1.3.2.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.3.1.bb b/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-app/xinit_1.3.1.bb
rename to meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
index 2ddebe6..e029a03 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.3.2.bb
@@ -10,11 +10,11 @@ then terminate."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0d4b5eef75f1584ccbdc5e4a34314407"
 
-PR = "r2"
+PR = "r0"
 PE = "1"
 
-SRC_URI[md5sum] = "ee234056d8a3dbf37b61b4bcb35b88e4"
-SRC_URI[sha256sum] = "c7468dfae94bdb42785d79623c27156dc4bf379d8372992830482cb04d8439b0"
+RC_URI[md5sum] = "9c0943cbd83e489ad1b05221b97efd44"
+SRC_URI[sha256sum] = "a1867fdaa83f68750b12ba4305c3c62f5992d0f52cfeb98e96c27a8e690e0235"
 
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
 
-- 
1.7.6.5



