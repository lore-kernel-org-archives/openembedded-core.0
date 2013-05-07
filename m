Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UZdjf-00044W-6h
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 10:59:09 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 May 2013 01:40:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,627,1363158000"; d="scan'208";a="237931502"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by AZSMGA002.ch.intel.com with ESMTP; 07 May 2013 01:40:56 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 11:44:34 +0300
Message-Id: <1367916274-17480-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] bison: upgraded to 2.7.1
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
X-List-Received-Date: Tue, 07 May 2013 08:59:18 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-devtools/bison/{bison_2.7.bb => bison_2.7.1.bb} |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/bison/{bison_2.7.bb => bison_2.7.1.bb} (85%)

diff --git a/meta/recipes-devtools/bison/bison_2.7.bb b/meta/recipes-devtools/bison/bison_2.7.1.bb
similarity index 85%
rename from meta/recipes-devtools/bison/bison_2.7.bb
rename to meta/recipes-devtools/bison/bison_2.7.1.bb
index 373651e..10bd8e3 100644
--- a/meta/recipes-devtools/bison/bison_2.7.bb
+++ b/meta/recipes-devtools/bison/bison_2.7.1.bb
@@ -9,9 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
 DEPENDS = "bison-native flex-native"
 
-PR = "r1"
-
-BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
+BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
 	        file://m4.patch \
                 file://dont-depend-on-help2man.patch \
 	       "
@@ -23,8 +21,8 @@ SRC_URI = "${BASE_SRC_URI} \
            file://fix_cross_manpage_building.patch \
           "
 
-SRC_URI[md5sum] = "ded660799e76fb1667d594de1f7a0da9"
-SRC_URI[sha256sum] = "19bbe7374fd602f7a6654c131c21a15aebdc06cc89493e8ff250cb7f9ed0a831"
+SRC_URI[md5sum] = "7be02eb973eccf388f1ae750fc09eed0"
+SRC_URI[sha256sum] = "b409adcbf245baadb68d2f66accf6fdca5e282cafec1b865f4b5e963ba8ea7fb"
 
 LDFLAGS_prepend_libc-uclibc = " -lrt "
 DEPENDS_class-native = "gettext-minimal-native"
-- 
1.7.10.4



