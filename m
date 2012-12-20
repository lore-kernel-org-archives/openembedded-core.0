Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TljI7-00010P-MJ
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 17:48:17 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Dec 2012 08:33:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,324,1355126400"; d="scan'208";a="237055460"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.157])
	by orsmga001.jf.intel.com with ESMTP; 20 Dec 2012 08:33:28 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2012 18:33:53 +0200
Message-Id: <1356021233-21573-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] ofono: upgrade to 1.12
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
X-List-Received-Date: Thu, 20 Dec 2012 16:48:17 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../ofono/{ofono_1.10.bb => ofono_1.12.bb}                    |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.10.bb => ofono_1.12.bb} (53%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.10.bb b/meta/recipes-connectivity/ofono/ofono_1.12.bb
similarity index 53%
rename from meta/recipes-connectivity/ofono/ofono_1.10.bb
rename to meta/recipes-connectivity/ofono/ofono_1.12.bb
index d150961..1767971 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.10.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.12.bb
@@ -1,14 +1,13 @@
 require ofono.inc
 
 SRC_URI  = "\
-  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.bz2 \
+  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
   file://ofono \
 "
-PR = "r1"
-
-SRC_URI[md5sum] = "dab284efb8cc4143d6f53d0fcc37b696"
-SRC_URI[sha256sum] = "e7931ac0dbe165eb0e16a38b7cb4acca59b704f356ec13583d58027135e3efa5"
+PR = "r0"
 
+SRC_URI[md5sum] = "aa8924c0e8de3ec7ac5e41fe7df4cb99"
+SRC_URI[sha256sum] = "733b75bfd1b2a1925b6de532989c496b8ae17a746691120ef64cceb00b3ef751"
 
 EXTRA_OECONF += "\
     --enable-test \
-- 
1.7.10.4



