Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q7Gn8-0001wk-My
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 02:40:15 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q7Gl8-0003AC-1n from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 17:38:10 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 5 Apr 2011 17:36:04 -0700
Received: from localhost.localdomain ([172.30.80.151]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 5 Apr 2011 18:38:08 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2011 17:38:01 -0700
Message-Id: <95d636004deffc0d6473c67ee9b5ce62937dc085.1302050252.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1302050252.git.tom_rini@mentor.com>
References: <cover.1302050252.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 06 Apr 2011 00:38:08.0882 (UTC)
	FILETIME=[E6BAAD20:01CBF3F2]
Subject: [PATCH 1/1] ncurses: Update to 5.9
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
X-List-Received-Date: Wed, 06 Apr 2011 00:40:15 -0000

The previous 5.7 release was relatively close to 5.8 due to it bringing
in a patch to sync with upstream work-in-progress.  We skip over the
5.8 release and move to 5.9.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../{ncurses-5.7 => ncurses-5.9}/config.cache      |    0
 .../{ncurses-5.7 => ncurses-5.9}/tic-hang.patch    |    0
 .../ncurses/{ncurses_5.7.bb => ncurses_5.9.bb}     |   21 +++----------------
 3 files changed, 4 insertions(+), 17 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses-5.7 => ncurses-5.9}/config.cache (100%)
 rename meta/recipes-core/ncurses/{ncurses-5.7 => ncurses-5.9}/tic-hang.patch (100%)
 rename meta/recipes-core/ncurses/{ncurses_5.7.bb => ncurses_5.9.bb} (88%)

diff --git a/meta/recipes-core/ncurses/ncurses-5.7/config.cache b/meta/recipes-core/ncurses/ncurses-5.9/config.cache
similarity index 100%
rename from meta/recipes-core/ncurses/ncurses-5.7/config.cache
rename to meta/recipes-core/ncurses/ncurses-5.9/config.cache
diff --git a/meta/recipes-core/ncurses/ncurses-5.7/tic-hang.patch b/meta/recipes-core/ncurses/ncurses-5.9/tic-hang.patch
similarity index 100%
rename from meta/recipes-core/ncurses/ncurses-5.7/tic-hang.patch
rename to meta/recipes-core/ncurses/ncurses-5.9/tic-hang.patch
diff --git a/meta/recipes-core/ncurses/ncurses_5.7.bb b/meta/recipes-core/ncurses/ncurses_5.9.bb
similarity index 88%
rename from meta/recipes-core/ncurses/ncurses_5.7.bb
rename to meta/recipes-core/ncurses/ncurses_5.9.bb
index 7ab078d..9d4aa22 100644
--- a/meta/recipes-core/ncurses/ncurses_5.7.bb
+++ b/meta/recipes-core/ncurses/ncurses_5.9.bb
@@ -3,34 +3,21 @@ HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc180a8c44ca642e97c35452fab5f66"
 SECTION = "libs"
-PATCHDATE = "20100501"
-PKGV = "${PV}+${PATCHDATE}"
-PR = "r1"
+PR = "r0"
 
 DEPENDS = "ncurses-native"
 DEPENDS_virtclass-native = ""
 
 inherit autotools binconfig
 
-SRC_URI = "${GNU_MIRROR}/ncurses/ncurses-${PV}.tar.gz;name=tarball \
-        ftp://invisible-island.net/ncurses/5.7/ncurses-5.7-20100424-patch.sh.bz2;apply=yes;name=p20100424sh \
-\
-        http://autobuilder.yoctoproject.org/sources/ncurses-5.7-${PATCHDATE}.patch.gz;name=p20100501 \
+SRC_URI = "${GNU_MIRROR}/ncurses/ncurses-${PV}.tar.gz \
         file://tic-hang.patch \
         file://config.cache \
 "
 
+SRC_URI[md5sum] = "8cb9c412e5f2d96bc6f459aa8c6282a1"
+SRC_URI[sha256sum] = "9046298fb440324c9d4135ecea7879ffed8546dd1b58e59430ea07a4633f563b"
 
-#        ftp://invisible-island.net/ncurses/5.7/ncurses-5.7-${PATCHDATE}.patch.gz;name=p20100501 
-
-SRC_URI[tarball.md5sum] = "cce05daf61a64501ef6cd8da1f727ec6"
-SRC_URI[tarball.sha256sum] = "0a9bdea5c7de8ded5c9327ed642915f2cc380753f12d4ad120ef7da3ea3498f4"
-SRC_URI[p20100424sh.md5sum] = "3a5f76613f0f7ec3e0e73b835bc24864"
-SRC_URI[p20100424sh.sha256sum] = "1e9d70d2d1fe1fea471868832c52f1b9cc6065132102e49e2a3755f2f4f5be53"
-SRC_URI[p20100501.md5sum] = "6518cfa5d45e9069a1e042468161448b"
-SRC_URI[p20100501.sha256sum] = "a97ccc30e4bd6fbb89564f3058db0fe84bd35cfefee831556c500793b477abde"
-
-#PARALLEL_MAKE = ""
 EXTRA_AUTORECONF = "-I m4"
 CONFIG_SITE =+ "${WORKDIR}/config.cache"
 
-- 
1.7.0.4



