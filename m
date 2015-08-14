Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8138776536
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 10:42:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 14 Aug 2015 03:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,677,1432623600"; d="scan'208";a="748520717"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 14 Aug 2015 03:42:06 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 13:43:19 +0300
Message-Id: <3874929dbc16d47503df450e95c2a7505f690443.1439548737.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
References: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
References: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/5] db: update to 6.1.26
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
X-List-Received-Date: Fri, 14 Aug 2015 10:42:06 -0000

To avoid breaking rpm, this patch needs to be applied together with
the patch that updates rpm to 5.4.15.

The include directory manipulation during install was updated to
match oe-core customizations to rpm's configure.ac.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/db/{db_6.0.30.bb => db_6.1.26.bb} | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-support/db/{db_6.0.30.bb => db_6.1.26.bb} (89%)

diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.1.26.bb
similarity index 89%
rename from meta/recipes-support/db/db_6.0.30.bb
rename to meta/recipes-support/db/db_6.1.26.bb
index 9eae5c7..91fb1d4 100644
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.1.26.bb
@@ -21,8 +21,8 @@ SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.. \
             file://Makefile-let-libso_target-depend-on-bt_rec.patch \
            "
 
-SRC_URI[md5sum] = "ad28eb86ad3203b5422844db179c585b"
-SRC_URI[sha256sum] = "608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f4d33d54516f3f6a20fd2"
+SRC_URI[md5sum] = "9525aa57a282d49e5d1bf5e48ffa8a56"
+SRC_URI[sha256sum] = "dd1417af5443f326ee3998e40986c3c60e2a7cfb5bfa25177ef7cadb2afb13a6"
 
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=1ec8b0b17cc31513fe35ab10716f8490"
 
@@ -92,11 +92,11 @@ do_compile_prepend() {
 }
 
 do_install_append() {
-	mkdir -p ${D}/${includedir}/db60
-	mv ${D}/${includedir}/db.h ${D}/${includedir}/db60/.
-	mv ${D}/${includedir}/db_cxx.h ${D}/${includedir}/db60/.
-	ln -s db60/db.h ${D}/${includedir}/db.h
-	ln -s db60/db_cxx.h ${D}/${includedir}/db_cxx.h
+	mkdir -p ${D}/${includedir}/db-6.1
+	mv ${D}/${includedir}/db.h ${D}/${includedir}/db-6.1/.
+	mv ${D}/${includedir}/db_cxx.h ${D}/${includedir}/db-6.1/.
+	ln -s db-6.1/db.h ${D}/${includedir}/db.h
+	ln -s db-6.1/db_cxx.h ${D}/${includedir}/db_cxx.h
 
 	# The docs end up in /usr/docs - not right.
 	if test -d "${D}/${prefix}/docs"
-- 
2.1.4


