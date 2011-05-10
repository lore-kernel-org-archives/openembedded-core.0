Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVP-0001Xi-9S
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2011 22:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="744876627"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2011 22:26:28 -0700
Message-Id: <a676d19c4eb75a37c824dea7128c372702c0a4ea.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Fri, 29 Apr 2011 16:55:16 +0800
Date: Mon, 09 May 2011 22:26:27 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 29/30] libxmu: Add native function
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
X-List-Received-Date: Tue, 10 May 2011 05:29:12 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add native function to libxmu_1.1.0.bb file because qt3 native depends on its native.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-graphics/xorg-lib/libxmu_1.1.0.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxmu_1.1.0.bb b/meta/recipes-graphics/xorg-lib/libxmu_1.1.0.bb
index 59f2c28..4195306 100644
--- a/meta/recipes-graphics/xorg-lib/libxmu_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxmu_1.1.0.bb
@@ -28,5 +28,7 @@ PACKAGES =+ "libxmuu libxmuu-dev"
 FILES_libxmuu = "${libdir}/libXmuu.so.*"
 FILES_libxmuu-dev = "${libdir}/libXmuu.so"
 
+BBCLASSEXTEND = "native"
+
 SRC_URI[md5sum] = "6836883a0120e8346cf7f58dc42e465a"
 SRC_URI[sha256sum] = "0fa91f303b70decc1ef6201c88c8a5f0b4ecd68c6c88bdcc891ecd1a689d36ad"
-- 
1.7.1.1



