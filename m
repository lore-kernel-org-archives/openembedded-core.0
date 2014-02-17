Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0B1436F070
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 08:23:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 00:23:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,859,1384329600"; d="scan'208";a="476400711"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.197])
	by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2014 00:23:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 00:23:00 -0800
Message-Id: <7ec39fd6f4ec67c53fa312ff031204d1d1bb786c.1392625337.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1392625337.git.sgw@linux.intel.com>
References: <cover.1392625337.git.sgw@linux.intel.com>
In-Reply-To: <cover.1392625337.git.sgw@linux.intel.com>
References: <cover.1392625337.git.sgw@linux.intel.com>
Subject: [PATCH 5/7] libxkbcommon: Update to 0.3.2
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
X-List-Received-Date: Mon, 17 Feb 2014 08:23:03 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-lib/{libxkbcommon_0.3.2.bb => libxkbcommon_0.4.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.3.2.bb => libxkbcommon_0.4.0.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.3.2.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.0.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.3.2.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.0.bb
index 4a83b4f..2726302 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.3.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.0.bb
@@ -9,8 +9,8 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "935cf416354bf05210de2e389484f7e8"
-SRC_URI[sha256sum] = "cc378a47b01b00226ecf647b69e07df04091323846124b366cf835e5cdf5a88a"
+SRC_URI[md5sum] = "bb782f1700e45b4f57c84ef513e3cf85"
+SRC_URI[sha256sum] = "2dc018e830d1befaf4822615204138318da3fff0112f78f3a7c638fa617375b8"
 
 inherit autotools pkgconfig
 
-- 
1.8.3.1


