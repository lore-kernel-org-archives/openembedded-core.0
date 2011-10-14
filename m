Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUY-0002ZI-W9
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:35 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540459"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:33:13 -0700
Message-Id: <9220186991fa7d132f7ffeb92636577cf5adb2ae.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/28] v86d: update to 0.1.10
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
X-List-Received-Date: Fri, 14 Oct 2011 05:39:35 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../v86d/{v86d_0.1.9.bb => v86d_0.1.10.bb}         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/v86d/{v86d_0.1.9.bb => v86d_0.1.10.bb} (86%)

diff --git a/meta/recipes-bsp/v86d/v86d_0.1.9.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
similarity index 86%
rename from meta/recipes-bsp/v86d/v86d_0.1.9.bb
rename to meta/recipes-bsp/v86d/v86d_0.1.10.bb
index d9925d8..70db6ad 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.9.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -12,8 +12,8 @@ PR = "r0"
 SRC_URI = "http://dev.gentoo.org/~spock/projects/uvesafb/archive/v86d-${PV}.tar.bz2 \
            file://fbsetup"
 
-SRC_URI[md5sum] = "ebbbc8e7013c9544b6ba6981add43831"
-SRC_URI[sha256sum] = "8167dec4ff919cfd73f854bbd3244f05c2b867e014fa8298044ea7cfd66d18a8"
+SRC_URI[md5sum] = "51c792ba7b874ad8c43f0d3da4cfabe0"
+SRC_URI[sha256sum] = "634964ae18ef68c8493add2ce150e3b4502badeb0d9194b4bd81241d25e6735c"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE = "(qemux86)"
-- 
1.7.6.2



