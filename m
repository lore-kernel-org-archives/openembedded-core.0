Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8CDA871A23
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 15:27:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2016 08:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,580,1473145200"; d="scan'208";a="780876223"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2016 08:27:59 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:25:16 +0200
Message-Id: <fced9d20130046ffaf6daa1fe7d619098fdf91c6.1478013702.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
References: <cover.1478013701.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/13] icu: update to 58.1
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
X-List-Received-Date: Tue, 01 Nov 2016 15:27:57 -0000

The copyright for the software has been transferred to Unicode Inc from IBM,
but the terms are same.

libiculx and libicule are no longer produced as they depend on an external
package icu-le-hb (previous versions had an option of using an internal
implementation which now has been dropped). I have verified that icu
dependencies in oe-core and meta-oe still build.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/icu/icu.inc                      | 4 +---
 meta/recipes-support/icu/{icu_57.1.bb => icu_58.1.bb} | 6 +++---
 2 files changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-support/icu/{icu_57.1.bb => icu_58.1.bb} (77%)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index cc6f222..3e3a391 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -36,15 +36,13 @@ do_install_append_class-native() {
 	cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
 }
 
-PACKAGES =+ "libicudata libicuuc libicui18n libicule libiculx libicutu libicuio"
+PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
 
 FILES_${PN}-dev += "${libdir}/${BPN}/"
 
 FILES_libicudata = "${libdir}/libicudata.so.*"
 FILES_libicuuc = "${libdir}/libicuuc.so.*"
 FILES_libicui18n = "${libdir}/libicui18n.so.*"
-FILES_libicule = "${libdir}/libicule.so.*"
-FILES_libiculx = "${libdir}/libiculx.so.*"
 FILES_libicutu = "${libdir}/libicutu.so.*"
 FILES_libicuio = "${libdir}/libicuio.so.*"
 
diff --git a/meta/recipes-support/icu/icu_57.1.bb b/meta/recipes-support/icu/icu_58.1.bb
similarity index 77%
rename from meta/recipes-support/icu/icu_57.1.bb
rename to meta/recipes-support/icu/icu_58.1.bb
index 90c2b82..cc7c947 100644
--- a/meta/recipes-support/icu/icu_57.1.bb
+++ b/meta/recipes-support/icu/icu_58.1.bb
@@ -1,6 +1,6 @@
 require icu.inc
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=787d3b37867445c1cdd6f6167bd0e347"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=1b3b75c1777cd49ad5c6a24cd338cfc9"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV', True).split('.')
@@ -21,8 +21,8 @@ SRC_URI = "${BASE_SRC_URI} \
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "976734806026a4ef8bdd17937c8898b9"
-SRC_URI[sha256sum] = "ff8c67cb65949b1e7808f2359f2b80f722697048e90e7cfc382ec1fe229e9581"
+SRC_URI[md5sum] = "1901302aaff1c1633ef81862663d2917"
+SRC_URI[sha256sum] = "0eb46ba3746a9c2092c8ad347a29b1a1b4941144772d13a88667a7b11ea30309"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
-- 
2.10.1


