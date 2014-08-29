Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DF03B711FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 15:26:53 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2014 08:20:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,424,1406617200"; d="scan'208";a="473835162"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.12.242])
	by azsmga001.ch.intel.com with ESMTP; 29 Aug 2014 08:26:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 08:26:29 -0700
Message-Id: <95edd2204378c9e5b3fb1539187190014d36ec86.1409325858.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1409325858.git.sgw@linux.intel.com>
References: <cover.1409325858.git.sgw@linux.intel.com>
In-Reply-To: <cover.1409325858.git.sgw@linux.intel.com>
References: <cover.1409325858.git.sgw@linux.intel.com>
Subject: [PATCH 3/5] libxkbcommon: Upgrade to 0.4.3
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
X-List-Received-Date: Fri, 29 Aug 2014 15:26:56 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-lib/{libxkbcommon_0.4.2.bb => libxkbcommon_0.4.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.4.2.bb => libxkbcommon_0.4.3.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.2.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.3.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.2.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.3.bb
index 2b18061..9b7b0c2 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.3.bb
@@ -9,8 +9,8 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "4b717adce41c8305258e99a9b396330a"
-SRC_URI[sha256sum] = "a0fc71b07eeddba4af62bd709e24cec219778bb6871384aa850b2f5798a48957"
+SRC_URI[md5sum] = "26c57ff21438ed45de2a4ca609177db9"
+SRC_URI[sha256sum] = "9a52d5d0419e76c49c0ece86208c205ffacb1cf0ff8ffbaba98d3d4dd40c4e41"
 
 inherit autotools pkgconfig
 
-- 
1.8.3.1


