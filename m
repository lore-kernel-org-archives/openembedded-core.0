Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LRE-00026X-GA
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:54:36 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Mar 2012 17:45:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119579370"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by azsmga001.ch.intel.com with ESMTP; 15 Mar 2012 17:45:48 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:37 +0800
Message-Id: <7bfb6c3d7391b9b97d164687d01dd5967df503fa.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 40/60] libxpm: upgrade to 3.5.10
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
X-List-Received-Date: Fri, 16 Mar 2012 00:54:36 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../xorg-lib/{libxpm_3.5.9.bb => libxpm_3.5.10.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.9.bb => libxpm_3.5.10.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.9.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.9.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
index 5d4297e..9eaa212 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
@@ -10,7 +10,7 @@ protocol."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3e07763d16963c3af12db271a31abaa5"
 DEPENDS += "libxext libsm libxt"
-PR = "r3"
+PR = "r0"
 PE = "1"
 
 XORG_PN = "libXpm"
@@ -19,7 +19,7 @@ PACKAGES =+ "sxpm cxpm"
 FILES_cxpm = "${bindir}/cxpm"
 FILES_sxpm = "${bindir}/sxpm"
 
-SRC_URI[md5sum] = "2de3a1b9541f4b3a6f9d84b69d25530e"
-SRC_URI[sha256sum] = "8add01029cab0598ca86e01a2f7781a636f74b757abe6b50ba61b2a6e2fd621e"
+SRC_URI[md5sum] = "7ae7eff7a14d411e84a67bd166bcec1a"
+SRC_URI[sha256sum] = "a6db7e234750e7d60330017972e31d8e1f29f0a8c1391e4ac82f6102d919a735"
 
 BBCLASSEXTEND = "native"
-- 
1.7.6



