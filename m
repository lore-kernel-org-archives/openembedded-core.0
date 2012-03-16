Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LRA-00026P-Q5
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:54:33 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:45:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121480081"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 17:45:44 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:34 +0800
Message-Id: <5ad89bd4724144bb637fe57a2eb9b772cd05d159.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 37/60] libxdmcp: upgrade to 1.1.1
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
X-List-Received-Date: Fri, 16 Mar 2012 00:54:33 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{libxdmcp_1.1.0.bb => libxdmcp_1.1.1.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxdmcp_1.1.0.bb => libxdmcp_1.1.1.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb
rename to meta/recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb
index 483dce3..99e608b 100644
--- a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.1.bb
@@ -23,5 +23,5 @@ XORG_PN = "libXdmcp"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "762b6bbaff7b7d0831ddb4f072f939a5"
-SRC_URI[sha256sum] = "b8a0e9a3192a3afddb56eb1d7adf933e423b401b2a492975d776dc0423c10072"
+SRC_URI[md5sum] = "b94af6cef211cf3ee256f7e81f70fcd9"
+SRC_URI[sha256sum] = "9ace6d4230f9dce4ed090692f82f613253ada8f887b23b3d8ff3dd4e3a7c118e"
-- 
1.7.6



