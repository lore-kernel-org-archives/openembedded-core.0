Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qlyu8-0001t1-Vo
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:51:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949292"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:46:55 -0700
Message-Id: <a1e68df0f5b9df3634cb20ca3d498e2730fc19d7.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 05/35] libxcb: Add missing DEPENDS on libxdmcp
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
X-List-Received-Date: Wed, 27 Jul 2011 07:51:47 -0000

From: Khem Raj <raj.khem@gmail.com>

Observed this to fail when populating new tmpdir
from shared state

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xcb/libxcb_1.7.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xcb/libxcb_1.7.bb b/meta/recipes-graphics/xcb/libxcb_1.7.bb
index 0f30c88..daecf0f 100644
--- a/meta/recipes-graphics/xcb/libxcb_1.7.bb
+++ b/meta/recipes-graphics/xcb/libxcb_1.7.bb
@@ -3,9 +3,9 @@ include libxcb.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
-PR = "r1"
+PR = "r2"
 
-DEPENDS += "libpthread-stubs xcb-proto-native"
+DEPENDS += "libpthread-stubs xcb-proto-native libxdmcp"
 
 PACKAGES =+ "libxcb-xinerama"
 
-- 
1.7.3.4



