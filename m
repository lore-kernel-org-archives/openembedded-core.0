Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Stw3f-0004Xn-8U
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:30:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 00:19:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172897571"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.97])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 00:19:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 00:19:05 -0700
Message-Id: <5c4c25d72c9a0cabfdd8735b3f59522cd899c957.1343200454.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/28] libxp: Change superfluous "+=" to simple "=" when using _append
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
X-List-Received-Date: Wed, 25 Jul 2012 07:30:59 -0000

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb b/meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb
index 349dad1..dbd4609 100644
--- a/meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb
@@ -15,7 +15,7 @@ PE = "1"
 
 XORG_PN = "libXp"
 
-CFLAGS_append += " -I ${S}/include/X11/XprintUtil -I ${S}/include/X11/extensions"
+CFLAGS_append = " -I ${S}/include/X11/XprintUtil -I ${S}/include/X11/extensions"
 
 SRC_URI += "file://fix-cast-error.patch"
 
-- 
1.7.7.6



