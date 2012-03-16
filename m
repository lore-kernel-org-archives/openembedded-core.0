Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LHu-0001ce-F9
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:44:58 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Mar 2012 17:36:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119576050"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by azsmga001.ch.intel.com with ESMTP; 15 Mar 2012 17:36:10 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:29 +0800
Message-Id: <f2e48f6b9040b484f3217f648b3d12c25b10c4f8.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 32/60] libxinerama: upgrade to 1.1.2
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
X-List-Received-Date: Fri, 16 Mar 2012 00:44:58 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{libxinerama_1.1.1.bb => libxinerama_1.1.2.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxinerama_1.1.1.bb => libxinerama_1.1.2.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.1.bb b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.2.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-lib/libxinerama_1.1.1.bb
rename to meta/recipes-graphics/xorg-lib/libxinerama_1.1.2.bb
index cbd7d4c..d351348 100644
--- a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.2.bb
@@ -12,10 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6f4f634d1643a2e638bba3fcd19c2536 \
 
 DEPENDS += "libxext xineramaproto"
 PROVIDES = "xinerama"
-PR = "r3"
+PR = "r0"
 PE = "1"
 
 XORG_PN = "libXinerama"
 
-SRC_URI[md5sum] = "ecd4839ad01f6f637c6fb5327207f89b"
-SRC_URI[sha256sum] = "bbe2b4a0e8ccf01a40f02c429c8418bd1fe652fd2c6f05d487e1319599d6779f"
+SRC_URI[md5sum] = "cb45d6672c93a608f003b6404f1dd462"
+SRC_URI[sha256sum] = "a4e77c2fd88372e4ae365f3ca0434a23613da96c5b359b1a64bf43614ec06aac"
-- 
1.7.6



