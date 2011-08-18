Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9ho-0006ZY-2Y
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:00:48 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:56:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980274"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:56:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:30 -0700
Message-Id: <29c8c5dc24923bf819a4965cfcf99bedb0d71c5a.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/32] mtd-utils: Added recipe of newer version 1.4.4.
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
X-List-Received-Date: Thu, 18 Aug 2011 21:00:48 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Added recipe of version 1.4.4 and removed 1.4.1 recipe and its patch files.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 .../mtd/{mtd-utils_1.4.1.bb => mtd-utils_1.4.4.bb} |   11 ++++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.4.1 => mtd-utils-1.4.4}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils_1.4.1.bb => mtd-utils_1.4.4.bb} (76%)

diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils-1.4.4/add-exclusion-to-mkfs-jffs2-git-2.patch
similarity index 100%
rename from meta/recipes-devtools/mtd/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
rename to meta/recipes-devtools/mtd/mtd-utils-1.4.4/add-exclusion-to-mkfs-jffs2-git-2.patch
diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb b/meta/recipes-devtools/mtd/mtd-utils_1.4.4.bb
similarity index 76%
rename from meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
rename to meta/recipes-devtools/mtd/mtd-utils_1.4.4.bb
index f2de74d..ac9316d 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_1.4.4.bb
@@ -6,12 +6,15 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=3c3674a6e1d3f59554b0ff68ca59be2fd4134e0c \
-		file://add-exclusion-to-mkfs-jffs2-git-2.patch;patch=1"
+TAG = "v${PV}"
+
+SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=${TAG} \
+           file://add-exclusion-to-mkfs-jffs2-git-2.patch;patch=1"
+
 
 S = "${WORKDIR}/git/"
 
-PR = "r1"
+PR = "r0"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
 
@@ -27,5 +30,3 @@ PARALLEL_MAKE = ""
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "645519b753b364d52c4b941dcee3dd7e"
-SRC_URI[sha256sum] = "51d6a77c7e673219bb89c4b119f336d9f2f5a5e065a12ecf9636c5348d099a0e"
-- 
1.7.6



