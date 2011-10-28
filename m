Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RJd79-00066Y-PC
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 05:28:15 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Oct 2011 20:22:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="68413052"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga002.jf.intel.com with ESMTP; 27 Oct 2011 20:22:16 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 11:35:46 +0800
Message-Id: <cb0011bc58d9a94b0e3517d47f8b7d11091fc63b.1319772853.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
Subject: [PATCH 07/11] telepathy-glib: upgrade to version 0.16.0
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
X-List-Received-Date: Fri, 28 Oct 2011 03:28:16 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...thy-glib_0.14.3.bb => telepathy-glib_0.16.0.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.14.3.bb => telepathy-glib_0.16.0.bb} (80%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.14.3.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.16.0.bb
similarity index 80%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.14.3.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.16.0.bb
index 8bb63e7..ff429c8 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.14.3.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.16.0.bb
@@ -7,8 +7,8 @@ PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "fe9a4f781651593fd4afddb343ff50bf"
-SRC_URI[sha256sum] = "62e759084355ac0fce61feb561a7535a6707b223f0d1e4305fd47c83fa5494d0"
+SRC_URI[md5sum] = "071ed1b34ace45109188df73933609e4"
+SRC_URI[sha256sum] = "dae3dd7c06044951e7780cdc3e5524c7c9d12cd8aae6fe42bc88aca39a40b318"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.7.1



