Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RVtGP-0003KP-ER
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:08:29 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Nov 2011 15:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,273,1320652800"; d="scan'208";a="80845223"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 30 Nov 2011 15:01:46 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 07:21:36 +0800
Message-Id: <4b5e7ae754da67f90a8e90e25c79681fc9d5f66f.1322695203.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1322695203.git.dongxiao.xu@intel.com>
References: <cover.1322695203.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1322695203.git.dongxiao.xu@intel.com>
References: <cover.1322695203.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/5] telepathy-glib: upgrade to version 0.17.0
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
X-List-Received-Date: Wed, 30 Nov 2011 23:08:29 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...thy-glib_0.16.0.bb => telepathy-glib_0.17.0.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.16.0.bb => telepathy-glib_0.17.0.bb} (80%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.16.0.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.0.bb
similarity index 80%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.16.0.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.17.0.bb
index ff429c8..db5fd41 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.16.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.0.bb
@@ -7,8 +7,8 @@ PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "071ed1b34ace45109188df73933609e4"
-SRC_URI[sha256sum] = "dae3dd7c06044951e7780cdc3e5524c7c9d12cd8aae6fe42bc88aca39a40b318"
+SRC_URI[md5sum] = "5ea748c581db611b097c4926f0467c1e"
+SRC_URI[sha256sum] = "06f61e9a8b12e55ac8c62cad29baa5b14f2b75118a9b01f0874f8048ec33d845"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.7.1



