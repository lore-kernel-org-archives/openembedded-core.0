Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tzl45-0003nY-Mb
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:32:01 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Jan 2013 01:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="195769999"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.19])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jan 2013 01:16:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 01:15:59 -0800
Message-Id: <ecf03106e0bc57ea861845bfdd87a1003a50765e.1359364462.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
Subject: [PATCH 12/13] libcgroup: Update to 0.38
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
X-List-Received-Date: Mon, 28 Jan 2013 09:32:04 -0000
X-List-Received-Date: Mon, 28 Jan 2013 09:32:04 -0000
X-List-Received-Date: Mon, 28 Jan 2013 09:32:04 -0000
X-List-Received-Date: Mon, 28 Jan 2013 09:32:04 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-core/libcgroup/{libcgroup_0.37.1.bb => libcgroup_0.38.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-core/libcgroup/{libcgroup_0.37.1.bb => libcgroup_0.38.bb} (85%)

diff --git a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb b/meta/recipes-core/libcgroup/libcgroup_0.38.bb
similarity index 85%
rename from meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
rename to meta/recipes-core/libcgroup/libcgroup_0.38.bb
index e74f831..4d81289 100644
--- a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_0.38.bb
@@ -3,15 +3,13 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-PR = "r2"
+PR = "r0"
 
 inherit autotools pkgconfig
 
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libcg/${BPN}/v${PV}/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "24a41b18de112e8d085bb1f7d9e82af7"
-SRC_URI[sha256sum] = "0b08632de5d3641aa554b422d02a77d9367e57933328a8765204ad9588cd5c0d"
 
 EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes', '--enable-pam=no', d)}"
 
-- 
1.8.0.2



