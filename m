Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UZylv-0003av-4h
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 09:26:45 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 May 2013 00:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,632,1363158000"; d="scan'208";a="310011094"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by orsmga001.jf.intel.com with ESMTP; 08 May 2013 00:08:36 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 10:12:13 +0300
Message-Id: <1367997133-2122-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] subversion: upgraded to 1.7.9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 07:27:29 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../fix-install-depends.patch                                      |    0
 .../{subversion-1.7.8 => subversion-1.7.9}/libtool2.patch          |    0
 .../subversion/{subversion_1.7.8.bb => subversion_1.7.9.bb}        |    4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion-1.7.8 => subversion-1.7.9}/fix-install-depends.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.7.8 => subversion-1.7.9}/libtool2.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion_1.7.8.bb => subversion_1.7.9.bb} (88%)

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.8/fix-install-depends.patch b/meta/recipes-devtools/subversion/subversion-1.7.9/fix-install-depends.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.7.8/fix-install-depends.patch
rename to meta/recipes-devtools/subversion/subversion-1.7.9/fix-install-depends.patch
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.8/libtool2.patch b/meta/recipes-devtools/subversion/subversion-1.7.9/libtool2.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.7.8/libtool2.patch
rename to meta/recipes-devtools/subversion/subversion-1.7.9/libtool2.patch
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.8.bb b/meta/recipes-devtools/subversion/subversion_1.7.9.bb
similarity index 88%
rename from meta/recipes-devtools/subversion/subversion_1.7.8.bb
rename to meta/recipes-devtools/subversion/subversion_1.7.9.bb
index 1b1ca93..641655e 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.8.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.9.bb
@@ -13,8 +13,8 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://fix-install-depends.patch \
 "
-SRC_URI[md5sum] = "454b9f398415c3504435bf8c3f6ed127"
-SRC_URI[sha256sum] = "fc83d4d98ccea8b7bfa8f5c20fff545c8baa7d035db930977550c51c6ca23686"
+SRC_URI[md5sum] = "8d532025771a67c06c23f299699f056f"
+SRC_URI[sha256sum] = "f8454c585f99afed764232a5048d9b8bfd0a25a9ab8e339ea69fe1204c453ef4"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a14fd2da3134e40a087eb4326a4ecd4"
 
-- 
1.7.10.4



