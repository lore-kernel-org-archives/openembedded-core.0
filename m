Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 445E16FA84
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 03:26:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2014 20:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,962,1392192000"; d="scan'208";a="521786724"
Received: from kmaligas-mobl1.gar.corp.intel.com (HELO swold-linux.bigsur.com)
	([10.255.12.167])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2014 20:26:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jun 2014 20:26:06 -0700
Message-Id: <314786031222598065a6e32b2bedf21fdd742e6b.1401765630.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1401765630.git.sgw@linux.intel.com>
References: <cover.1401765630.git.sgw@linux.intel.com>
In-Reply-To: <cover.1401765630.git.sgw@linux.intel.com>
References: <cover.1401765630.git.sgw@linux.intel.com>
Subject: [PATCH 1/7] libxkbcommon: Update to 0.4.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jun 2014 03:26:35 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-lib/{libxkbcommon_0.4.1.bb => libxkbcommon_0.4.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.4.1.bb => libxkbcommon_0.4.2.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.1.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.2.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.1.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.2.bb
index cf5dfeb..2b18061 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.2.bb
@@ -9,8 +9,8 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "b70f4ed97b6c9432dc956e4177f3336a"
-SRC_URI[sha256sum] = "90ee502ec919814533c65e74c208212854f5bae9b9b87932eeb96fb3876b8ff6"
+SRC_URI[md5sum] = "4b717adce41c8305258e99a9b396330a"
+SRC_URI[sha256sum] = "a0fc71b07eeddba4af62bd709e24cec219778bb6871384aa850b2f5798a48957"
 
 inherit autotools pkgconfig
 
-- 
1.8.3.1


