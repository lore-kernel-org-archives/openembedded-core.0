Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LUV-0002PQ-4A
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:57:59 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:49:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="118174790"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2012 17:49:12 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:49 +0800
Message-Id: <4ea39cd95118c5f71e721b897eac9e530c1d9e25.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 52/60] libXvMC: upgrade to 1.0.7
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
X-List-Received-Date: Fri, 16 Mar 2012 00:57:59 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{libxvmc_1.0.6.bb => libxvmc_1.0.7.bb}         |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxvmc_1.0.6.bb => libxvmc_1.0.7.bb} (61%)

diff --git a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.6.bb b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.7.bb
similarity index 61%
rename from meta/recipes-graphics/xorg-lib/libxvmc_1.0.6.bb
rename to meta/recipes-graphics/xorg-lib/libxvmc_1.0.7.bb
index 1f690b8..70b4816 100644
--- a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.7.bb
@@ -7,7 +7,7 @@ require xorg-lib-common.inc
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0a207f08d4961489c55046c9a5e500da \
-                    file://src/XvMCWrapper.c;endline=26;md5=5151daa8172a3f1bb0cb0e0ff157d9de"
+                    file://wrapper/XvMCWrapper.c;endline=26;md5=5151daa8172a3f1bb0cb0e0ff157d9de"
 
 DEPENDS += "libxext libxv videoproto"
 
@@ -16,5 +16,5 @@ PE = "1"
 
 XORG_PN = "libXvMC"
 
-SRC_URI[md5sum] = "bfc7524646f890dfc30dea1d676004a3"
-SRC_URI[sha256sum] = "3dda80e9c71fd14a14f93279c6f661703c5c1c43d104a5db0842377bdf0c3392"
+SRC_URI[md5sum] = "3340c99ff556ea2457b4be47f5cb96fa"
+SRC_URI[sha256sum] = "28f085fc8518a3dadfe355360705d50153051f09898093e69af806c0b437cea3"
-- 
1.7.6



