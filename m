Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@eukrea.com>) id 1R0puI-0007yF-Gg
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 09:17:19 +0200
Received: from PCDEV1.lan (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 1060C4B009D;
	Tue,  6 Sep 2011 09:12:15 +0200 (CEST)
From: Denis Carikli <denis@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 09:12:07 +0200
Message-Id: <1315293127-2633-1-git-send-email-denis@eukrea.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1314972452-26629-1-git-send-email-denis@eukrea.com>
References: <1314972452-26629-1-git-send-email-denis@eukrea.com>
Subject: [PATCH v4] mtd-utils: update to version to 1.4.6
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
X-List-Received-Date: Tue, 06 Sep 2011 07:17:19 -0000

mtd-utils 1.4.6 is the lastest release of mtd-utils
  at this time.

Signed-off-by: Denis Carikli <denis@eukrea.com>
---
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 .../mtd/{mtd-utils_1.4.1.bb => mtd-utils_1.4.6.bb} |    7 ++-----
 2 files changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.4.1 => mtd-utils-1.4.6}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils_1.4.1.bb => mtd-utils_1.4.6.bb} (81%)

diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils-1.4.6/add-exclusion-to-mkfs-jffs2-git-2.patch
similarity index 100%
rename from meta/recipes-devtools/mtd/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
rename to meta/recipes-devtools/mtd/mtd-utils-1.4.6/add-exclusion-to-mkfs-jffs2-git-2.patch
diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb b/meta/recipes-devtools/mtd/mtd-utils_1.4.6.bb
similarity index 81%
rename from meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
rename to meta/recipes-devtools/mtd/mtd-utils_1.4.6.bb
index c05149d..79f4f15 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_1.4.6.bb
@@ -6,12 +6,12 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=3c3674a6e1d3f59554b0ff68ca59be2fd4134e0c \
+SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=baafd8ace3301e9d2ba314a376bad008314b34ff \
 		file://add-exclusion-to-mkfs-jffs2-git-2.patch"
 
 S = "${WORKDIR}/git/"
 
-PR = "r1"
+PR = "r0"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
 
@@ -26,6 +26,3 @@ do_install () {
 PARALLEL_MAKE = ""
 
 BBCLASSEXTEND = "native"
-
-SRC_URI[md5sum] = "645519b753b364d52c4b941dcee3dd7e"
-SRC_URI[sha256sum] = "51d6a77c7e673219bb89c4b119f336d9f2f5a5e065a12ecf9636c5348d099a0e"
-- 
1.7.4.1



