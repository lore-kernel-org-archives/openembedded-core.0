Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SpbBr-0006qR-P8
	for Openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 10:25:32 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Jul 2012 01:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121896848"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Jul 2012 01:14:17 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Fri, 13 Jul 2012 01:12:56 -0700
Message-Id: <575ff760b303fcbf2a8f41a557451d1937d44112.1342167069.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1342167069.git.nitin.a.kamble@intel.com>
References: <cover.1342167069.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/3] gawk-3.1.5: fix build with automake 1.12.x
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
X-List-Received-Date: Fri, 13 Jul 2012 08:25:32 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Add the gawk-3.1.5_fix_for_automake-1.12.patch in SRC_URI.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 ...atch => gawk-3.1.5_fix_for_automake-1.12.patch} |    0
 meta/recipes-extended/gawk/gawk_3.1.5.bb           |    5 +++--
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/gawk/gawk-3.1.5/{gawk_fix_for_automake-1.12.patch => gawk-3.1.5_fix_for_automake-1.12.patch} (100%)

diff --git a/meta/recipes-extended/gawk/gawk-3.1.5/gawk_fix_for_automake-1.12.patch b/meta/recipes-extended/gawk/gawk-3.1.5/gawk-3.1.5_fix_for_automake-1.12.patch
similarity index 100%
rename from meta/recipes-extended/gawk/gawk-3.1.5/gawk_fix_for_automake-1.12.patch
rename to meta/recipes-extended/gawk/gawk-3.1.5/gawk-3.1.5_fix_for_automake-1.12.patch
diff --git a/meta/recipes-extended/gawk/gawk_3.1.5.bb b/meta/recipes-extended/gawk/gawk_3.1.5.bb
index 4c7cdf3..89dd01c 100644
--- a/meta/recipes-extended/gawk/gawk_3.1.5.bb
+++ b/meta/recipes-extended/gawk/gawk_3.1.5.bb
@@ -13,9 +13,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 RDEPENDS_gawk += "gawk-common"
 RDEPENDS_pgawk += "gawk-common"
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
+	file://gawk-3.1.5_fix_for_automake-1.12.patch"
 
 SRC_URI[md5sum] = "4760325489479cac17fe0114b8f62f30"
 SRC_URI[sha256sum] = "463dcb9d0ca398b1d4f5a332f6cd9cec56441265fca616f2ea1b44d459e9f0f8"
-- 
1.7.3.4



