Return-Path: <bogdan.a.marinescu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 9282E6A5BC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 12:57:09 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Jun 2013 05:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,792,1363158000"; d="scan'208";a="249990850"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jun 2013 05:57:09 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2013 15:56:54 +0300
Message-Id: <d4f35ac18ee6b3a5b742f41165ef38691f81b7fc.1370264032.git.bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370264032.git.bogdan.a.marinescu@intel.com>
References: <cover.1370264032.git.bogdan.a.marinescu@intel.com>
In-Reply-To: <cover.1370264032.git.bogdan.a.marinescu@intel.com>
References: <cover.1370264032.git.bogdan.a.marinescu@intel.com>
Subject: [PATCH 3/3] subversion: upgraded to 1.7.10
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
X-List-Received-Date: Mon, 03 Jun 2013 12:57:09 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../fix-install-depends.patch                                      |    0
 .../{subversion-1.7.9 => subversion-1.7.10}/libtool2.patch         |    0
 .../subversion/{subversion_1.7.9.bb => subversion_1.7.10.bb}       |    4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion-1.7.9 => subversion-1.7.10}/fix-install-depends.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.7.9 => subversion-1.7.10}/libtool2.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion_1.7.9.bb => subversion_1.7.10.bb} (88%)

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.9/fix-install-depends.patch b/meta/recipes-devtools/subversion/subversion-1.7.10/fix-install-depends.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.7.9/fix-install-depends.patch
rename to meta/recipes-devtools/subversion/subversion-1.7.10/fix-install-depends.patch
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.9/libtool2.patch b/meta/recipes-devtools/subversion/subversion-1.7.10/libtool2.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.7.9/libtool2.patch
rename to meta/recipes-devtools/subversion/subversion-1.7.10/libtool2.patch
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.9.bb b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
similarity index 88%
rename from meta/recipes-devtools/subversion/subversion_1.7.9.bb
rename to meta/recipes-devtools/subversion/subversion_1.7.10.bb
index 641655e..9d189fe 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.9.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
@@ -13,8 +13,8 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://fix-install-depends.patch \
 "
-SRC_URI[md5sum] = "8d532025771a67c06c23f299699f056f"
-SRC_URI[sha256sum] = "f8454c585f99afed764232a5048d9b8bfd0a25a9ab8e339ea69fe1204c453ef4"
+SRC_URI[md5sum] = "4088a77e14232876c9b4ff1541e6e200"
+SRC_URI[sha256sum] = "c1df222bec83d014d17785e2ceba6bc80962f64b280967de0285836d8d77a8e7"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a14fd2da3134e40a087eb4326a4ecd4"
 
-- 
1.7.10.4


