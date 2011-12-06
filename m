Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RXkiB-00059f-18
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 03:24:51 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Dec 2011 18:18:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,302,1320652800"; d="scan'208";a="82548333"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.192])
	by azsmga001.ch.intel.com with ESMTP; 05 Dec 2011 18:18:02 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2011 18:17:58 -0800
Message-Id: <5832c4a0c7709d5ff5d2612c509516689aa4da3f.1323137480.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1323137480.git.josh@linux.intel.com>
References: <cover.1323137480.git.josh@linux.intel.com>
In-Reply-To: <cover.1323137480.git.josh@linux.intel.com>
References: <cover.1323137480.git.josh@linux.intel.com>
Subject: [PATCH 1/4] omap3-sgx-modules: set SRC_URI checksums
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
X-List-Received-Date: Tue, 06 Dec 2011 02:24:51 -0000

We'd like to make missing SRC_URI checksums an error, so all
appropriate recipes need to have a checksum value set.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../omap3-sgx-modules_1.3.13.1397.bb               |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb b/meta/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb
index 0e850bc..fba0e18 100644
--- a/meta/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb
+++ b/meta/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb
@@ -4,6 +4,8 @@ LICENSE = "GPLv2"
 inherit module
 
 SRC_URI = "http://dominion.thruhere.net/koen/OE/omap3-sgx-modules-1.3.13.1397.tar.bz2"
+SRC_URI[md5sum] = "1b48bbb5df6b4c12ebb42b92ae1bf1f9"
+SRC_URI[sha256sum] = "908a69340b020f7d865acf70724e37837016a81a0cb499fb83441759cbef7616"
 
 S = ${WORKDIR}/${BPN}-${PV}/eurasiacon/build/linux/omap3430_linux/kbuild/
 
-- 
1.7.7.3



