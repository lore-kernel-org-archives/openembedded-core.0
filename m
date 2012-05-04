Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SQLRu-00033H-1V
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 18:33:42 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 May 2012 09:23:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138956414"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.171])
	by azsmga001.ch.intel.com with ESMTP; 04 May 2012 09:23:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 09:23:52 -0700
Message-Id: <1336148632-5828-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1336148632-5828-1-git-send-email-sgw@linux.intel.com>
References: <1336148632-5828-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2][EDISON 1.1.2] grub: Add SRC_URI Checksums for sanity
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
X-List-Received-Date: Fri, 04 May 2012 16:33:42 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/grub/grub_1.99.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub_1.99.bb b/meta/recipes-bsp/grub/grub_1.99.bb
index ba41e8f..0c8648e 100644
--- a/meta/recipes-bsp/grub/grub_1.99.bb
+++ b/meta/recipes-bsp/grub/grub_1.99.bb
@@ -19,6 +19,9 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://grub-install.in.patch;apply=yes \
           file://40_custom"
 
+SRC_URI[md5sum] = "ca9f2a2d571b57fc5c53212d1d22e2b5"
+SRC_URI[sha256sum] = "b91f420f2c51f6155e088e34ff99bea09cc1fb89585cf7c0179644e57abd28ff"
+
 inherit autotools
 inherit gettext
 
-- 
1.7.7.6



