Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 84C3D74864
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:20:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:20:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40599839"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:20:09 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:13:13 +0300
Message-Id: <20180404111321.10824-14-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/22] icu: update to 61.1
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
X-List-Received-Date: Wed, 04 Apr 2018 11:20:09 -0000

License-Update: copyright years updated, added terms for Google double-conversion

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/icu/{icu_60.2.bb => icu_61.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/icu/{icu_60.2.bb => icu_61.1.bb} (78%)

diff --git a/meta/recipes-support/icu/icu_60.2.bb b/meta/recipes-support/icu/icu_61.1.bb
similarity index 78%
rename from meta/recipes-support/icu/icu_60.2.bb
rename to meta/recipes-support/icu/icu_61.1.bb
index 585a92bc4cd..ffaf3508966 100644
--- a/meta/recipes-support/icu/icu_60.2.bb
+++ b/meta/recipes-support/icu/icu_61.1.bb
@@ -1,6 +1,6 @@
 require icu.inc
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=675f2d069434d8a1e4e6b0dcf4379226"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=63752c57bd0b365c9af9f427ef79c819"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV').split('.')
@@ -22,8 +22,8 @@ SRC_URI = "${BASE_SRC_URI} \
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "43861b127744b3c0b9d7f386f4b9fa40"
-SRC_URI[sha256sum] = "f073ea8f35b926d70bb33e6577508aa642a8b316a803f11be20af384811db418"
+SRC_URI[md5sum] = "68fe38999fef94d622bd6843d43c0615"
+SRC_URI[sha256sum] = "d007f89ae8a2543a53525c74359b65b36412fa84b3349f1400be6dcf409fafef"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
-- 
2.16.1


