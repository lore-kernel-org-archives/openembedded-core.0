Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1StyIQ-0004au-Bh
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 11:54:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6P9gqob021864
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Jul 2012 02:42:52 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Wed, 25 Jul 2012 02:42:51 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <saul.wold@intel.com>
Date: Wed, 25 Jul 2012 17:42:42 +0800
Message-ID: <4c1ebc263494cecdccc0fb272a021404f9823618.1343209283.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1343209283.git.kai.kang@windriver.com>
References: <cover.1343209283.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] ltp: update to version 20120614
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
X-List-Received-Date: Wed, 25 Jul 2012 09:54:22 -0000
Content-Type: text/plain

Update ltp to version 20120614 and update license files at same time.
Remove the patch because it has been merged.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../ltp/ltp/fix_building_fom_archive.patch         |   13 -------------
 .../ltp/{ltp_20120401.bb => ltp_20120614.bb}       |   12 +++++-------
 2 files changed, 5 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
 rename meta/recipes-extended/ltp/{ltp_20120401.bb => ltp_20120614.bb} (91%)

diff --git a/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch b/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
deleted file mode 100644
index a8064cf..0000000
--- a/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: ltp-20120401/Makefile
-===================================================================
---- ltp-20120401.orig/Makefile
-+++ ltp-20120401/Makefile
-@@ -173,7 +173,7 @@ SRCDIR_INSTALL_TARGETS	:= $(SRCDIR_INSTA
- #
- .PHONY: Version
- Version:
--	if git describe &> /dev/null; then \
-+	if git describe > /dev/null 2>&1; then \
- 		git describe > "$@"; \
- 	else \
- 		cp VERSION "$@"; \
diff --git a/meta/recipes-extended/ltp/ltp_20120401.bb b/meta/recipes-extended/ltp/ltp_20120614.bb
similarity index 91%
rename from meta/recipes-extended/ltp/ltp_20120401.bb
rename to meta/recipes-extended/ltp/ltp_20120614.bb
index 31babf9..a01399f 100644
--- a/meta/recipes-extended/ltp/ltp_20120401.bb
+++ b/meta/recipes-extended/ltp/ltp_20120614.bb
@@ -5,13 +5,13 @@ SECTION = "console/utils"
 
 LICENSE = "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-		    file://testcases/kernel/mce-test/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 		    file://testcases/kernel/controllers/freezer/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 		    file://testcases/kernel/controllers/freezer/run_freezer.sh;startline=5;endline=17;md5=aeac3f7691caa2e76fd5a732fbd6510d \
 		    file://testcases/kernel/fs/ext4-new-features/ffsb-6.0-rc2/COPYING;md5=c46082167a314d785d012a244748d803 \
 		    file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
 		    file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
 		    file://testcases/open_posix_testsuite/COPYING;md5=216e43b72efbe4ed9017cc19c4c68b01 \
+		    file://testcases/realtime/COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 		    file://tools/netpipe-2.4/COPYING;md5=18810669f13b87348459e611d31ab760 \
 		    file://tools/netpipe-2.4-ipv6/COPYING;md5=18810669f13b87348459e611d31ab760 \
 		    file://tools/top-LTP/proc/COPYING;md5=6e29c688d912da12b66b73e32b03d812 \
@@ -21,13 +21,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS = "attr"
 
-PR = "r4"
+PR = "r0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2 \
-           file://fix_building_fom_archive.patch"
+SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2"
 
-SRC_URI[md5sum] = "e1d0acf1a6b6da0cb30dc1b0dcf5f26d"
-SRC_URI[sha256sum] = "f0f5845f9666f61332fdf0b7e396fc647f9372db0902a829af2cf9402b807bd1"
+SRC_URI[md5sum] = "1078160b1f962a22f1598edad17293c5"
+SRC_URI[sha256sum] = "cbc00dd63226a4cde06fa506be4c71ddedcaf20dde474681db7ebeea1c1fb643"
 
 export prefix = "/opt/ltp"
 export exec_prefix = "/opt/ltp"
@@ -74,4 +73,3 @@ do_install(){
 
 # Avoid generated binaries stripping. Otherwise some of the ltp tests such as ldd01 & nm01 fails
 INHIBIT_PACKAGE_STRIP = "1"
-
-- 
1.7.5.4



