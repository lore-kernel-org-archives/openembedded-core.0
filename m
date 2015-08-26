Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 06FC576BE7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 14:17:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2015 07:17:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,416,1437462000"; d="scan'208";a="776041391"
Received: from tlomotow-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.18.45])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2015 07:17:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 15:17:15 +0100
Message-Id: <ba038c5b0ef312dd2bf60a20a74d67f5132f3a1a.1440598330.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440598330.git.paul.eggleton@linux.intel.com>
References: <cover.1440598330.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1440598330.git.paul.eggleton@linux.intel.com>
References: <cover.1440598330.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/8] classes/buildhistory: indent recently added function consistently
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
X-List-Received-Date: Wed, 26 Aug 2015 14:17:45 -0000

Shell functions use tabs in this file.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 77a3c86..054a81f 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -439,20 +439,20 @@ buildhistory_list_files() {
 }
 
 buildhistory_list_pkg_files() {
-        file_prefix="files-in-"
-
-        # Create individual files-in-package for each recipe's package
-        for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
-                pkgname=$(basename ${pkgdir})
-                outfolder="${BUILDHISTORY_DIR_PACKAGE}/${pkgname}"
-                outfile="${outfolder}/${file_prefix}${pkgname}.txt"
-                # Make sure the output folder, exist so we can create the files-in-$pkgname.txt file
-                if [ ! -d ${outfolder} ] ; then
-                        bbdebug 2 "Folder ${outfolder} does not exist, file ${outfile} not created"
-                        continue
-                fi
-                buildhistory_list_files ${pkgdir} ${outfile}
-        done
+	file_prefix="files-in-"
+
+	# Create individual files-in-package for each recipe's package
+	for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
+		pkgname=$(basename ${pkgdir})
+		outfolder="${BUILDHISTORY_DIR_PACKAGE}/${pkgname}"
+		outfile="${outfolder}/${file_prefix}${pkgname}.txt"
+		# Make sure the output folder, exist so we can create the files-in-$pkgname.txt file
+		if [ ! -d ${outfolder} ] ; then
+			bbdebug 2 "Folder ${outfolder} does not exist, file ${outfile} not created"
+			continue
+		fi
+		buildhistory_list_files ${pkgdir} ${outfile}
+	done
 }
 
 buildhistory_get_imageinfo() {
-- 
2.1.0


