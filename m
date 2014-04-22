Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A700B65D75
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 23:49:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2014 16:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,907,1389772800"; d="scan'208";a="497712247"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2014 16:49:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Apr 2014 16:49:29 -0700
Message-Id: <4fc0531c00fcc5d7a3b54a97375f0825df56d875.1398210385.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
Subject: [PATCH 07/10] libxkbcommon: update to 0.4.1
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
X-List-Received-Date: Tue, 22 Apr 2014 23:49:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-lib/{libxkbcommon_0.4.0.bb => libxkbcommon_0.4.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.4.0.bb => libxkbcommon_0.4.1.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.1.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.1.bb
index 2ad5448..1a687c8 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.4.1.bb
@@ -9,8 +9,8 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "bb782f1700e45b4f57c84ef513e3cf85"
-SRC_URI[sha256sum] = "2dc018e830d1befaf4822615204138318da3fff0112f78f3a7c638fa617375b8"
+SRC_URI[md5sum] = "b70f4ed97b6c9432dc956e4177f3336a"
+SRC_URI[sha256sum] = "90ee502ec919814533c65e74c208212854f5bae9b9b87932eeb96fb3876b8ff6"
 
 inherit autotools pkgconfig
 
-- 
1.8.3.1


