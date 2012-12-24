Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn6RW-0003sI-5L
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 12:43:40 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Dec 2012 03:28:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="184316290"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Dec 2012 03:28:08 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 13:28:40 +0200
Message-Id: <722fa68afe4075f46edb815108bc8b9503bf2d80.1356347599.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356347599.git.constantinx.musca@intel.com>
References: <cover.1356347599.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356347599.git.constantinx.musca@intel.com>
References: <cover.1356347599.git.constantinx.musca@intel.com>
Subject: [PATCH 3/3] xorg-driver: enable multilib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Dec 2012 11:43:42 -0000

[YOCTO #3438]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-graphics/xorg-driver/xorg-driver-common.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index aabf86b..5f5d282 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -5,7 +5,7 @@ SECTION = "x11/drivers"
 LICENSE = "MIT-X"
 
 PE = "2"
-INC_PR = "r20"
+INC_PR = "r21"
 
 DEPENDS = "virtual/xserver xproto randrproto util-macros"
 
@@ -34,7 +34,8 @@ def add_abi_depends(d, name):
     }
 
     output = os.popen("pkg-config xorg-server --variable=%s" % abis[name]).read()
-    abi = "xorg-abi-%s-%s" % (name, output.split(".")[0])
+    mlprefix = d.getVar('MLPREFIX', True) or ''
+    abi = "%sxorg-abi-%s-%s" % (mlprefix, name, output.split(".")[0])
 
     pn = d.getVar("PN", True)
     d.appendVar('RDEPENDS_' + pn, ' ' + abi)
-- 
1.7.11.7



