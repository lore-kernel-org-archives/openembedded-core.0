Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SXv9x-0007WS-Fa
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 16:06:29 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2012 06:56:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="147787250"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.104.69])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2012 06:56:15 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2012 17:02:10 +0300
Message-Id: <e7dbc212a3e4ba1bccc827194fe2ed7a5cbf0889.1337952883.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337952883.git.radu.moisan@intel.com>
References: <cover.1337952883.git.radu.moisan@intel.com>
In-Reply-To: <cover.1337952883.git.radu.moisan@intel.com>
References: <cover.1337952883.git.radu.moisan@intel.com>
Subject: [PATCH 1/1 v2] mtd-utils: Update to version 1.5.0
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
X-List-Received-Date: Fri, 25 May 2012 14:06:29 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 .../mtd/{mtd-utils_1.4.9.bb => mtd-utils_1.5.0.bb} |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.4.9 => mtd-utils-1.5.0}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils_1.4.9.bb => mtd-utils_1.5.0.bb} (94%)

diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.4.9/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils-1.5.0/add-exclusion-to-mkfs-jffs2-git-2.patch
similarity index 100%
rename from meta/recipes-devtools/mtd/mtd-utils-1.4.9/add-exclusion-to-mkfs-jffs2-git-2.patch
rename to meta/recipes-devtools/mtd/mtd-utils-1.5.0/add-exclusion-to-mkfs-jffs2-git-2.patch
diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
similarity index 94%
rename from meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb
rename to meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
index 4228b51..daa3554 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
@@ -6,12 +6,12 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=995cfe51b0a3cf32f381c140bf72b21bf91cef1b \
+SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=ca39eb1d98e736109c64ff9c1aa2a6ecca222d8f \
 		file://add-exclusion-to-mkfs-jffs2-git-2.patch"
 
 S = "${WORKDIR}/git/"
 
-PR = "r1"
+PR = "r0"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
 
-- 
1.7.9.5



