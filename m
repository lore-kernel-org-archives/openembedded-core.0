Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4as-0006h2-ME
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:38 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:32:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632921"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:32:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:06 -0800
Message-Id: <b4135c118c62aee9e8d41018beb8042b228fddce.1326786989.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/62] tslib: enable big endian support for qemuppc
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:39 -0000

From: Liming Wang <liming.wang@windriver.com>

This enables wacom tablet/touchscreen support on qemuppc.

Signed-off-by: Liming Wang <liming.wang@windriver.com>
---
 meta/recipes-graphics/tslib/tslib_1.0.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/tslib/tslib_1.0.bb b/meta/recipes-graphics/tslib/tslib_1.0.bb
index f47116f..54ff3d4 100644
--- a/meta/recipes-graphics/tslib/tslib_1.0.bb
+++ b/meta/recipes-graphics/tslib/tslib_1.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://download.berlios.de/tslib/tslib-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "92b2eb55b1e4ef7e2c0347069389390e"
 SRC_URI[sha256sum] = "9c40d914e4f6fe00bdd77137d671c7ce4f211686228f2eb8b2d3c2360bc249c8"
 SRC_URI_append_qemumips += " file://32bitBE-support.patch"
+SRC_URI_append_qemuppc += " file://32bitBE-support.patch"
 
 
 inherit autotools pkgconfig
-- 
1.7.6.5



