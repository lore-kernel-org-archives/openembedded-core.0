Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 912B36B59C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010138"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:26 +0000
Message-Id: <90a3469afc93db619b7c548e705b388163a65d38.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 30/38] stat: tidy up recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Dec 2013 22:30:28 -0000

* Add SUMMARY
* Tweak DESCRIPTION
* Use PV in SRC_URI
* Drop commented-out function that we obviously don't need
* Move BBCLASSEXTEND to end to match with convention

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/stat/stat_3.3.bb | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/stat/stat_3.3.bb b/meta/recipes-extended/stat/stat_3.3.bb
index 2a9bdd1..c9edb1d 100644
--- a/meta/recipes-extended/stat/stat_3.3.bb
+++ b/meta/recipes-extended/stat/stat_3.3.bb
@@ -1,14 +1,13 @@
+SUMMARY = "Command line file status display utility"
+DESCRIPTION = "Displays all information about a file that the stat() call provides and all information about a filesystem that statfs() provides."
 SECTION = "console/utils"
-DESCRIPTION = "Display all information about a file that the stat() call provides and all information a filesystem that statfs() provides."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=39886b077fd072e876e5c4c16310b631 \
                     file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-BBCLASSEXTEND = "native"
-
-
-SRC_URI = "ftp://metalab.unc.edu/pub/Linux/utils/file/stat-3.3.tar.gz \
+SRC_URI = "ftp://metalab.unc.edu/pub/Linux/utils/file/stat-${PV}.tar.gz \
            file://fix-error-return.patch"
+
 SRC_URI[md5sum] = "37e247e8e400ad9205f1b0500b728fd3"
 SRC_URI[sha256sum] = "7071f0384a423a938dd542c1f08547a02824f6359acd3ef3f944b2c4c2d1ee09"
 
@@ -18,8 +17,5 @@ do_install() {
 	install -m 644 stat.1 ${D}${mandir}/man1
 }
 
-#do_install_class-native() {
-#	install -d ${D}${bindir}
-#	install -m 755 stat ${D}${bindir}
-#}
+BBCLASSEXTEND = "native"
 
-- 
1.8.1.2


