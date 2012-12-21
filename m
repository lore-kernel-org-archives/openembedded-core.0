Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Tm23R-0003hU-LW
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 13:50:21 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Dec 2012 04:35:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,329,1355126400"; d="scan'208";a="265540081"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2012 04:35:36 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Dec 2012 14:38:38 +0200
Message-Id: <1356093519-27312-2-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1356093519-27312-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1356093519-27312-1-git-send-email-bogdan.a.marinescu@intel.com>
Subject: [PATCH 1/2] bison: update to 2.7
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
X-List-Received-Date: Fri, 21 Dec 2012 12:50:21 -0000

Tested on core-image-minimal (qemux86).

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 meta/recipes-devtools/bison/{bison_2.5.1.bb => bison_2.7.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/bison/{bison_2.5.1.bb => bison_2.7.bb} (89%)

diff --git a/meta/recipes-devtools/bison/bison_2.5.1.bb b/meta/recipes-devtools/bison/bison_2.7.bb
similarity index 89%
rename from meta/recipes-devtools/bison/bison_2.5.1.bb
rename to meta/recipes-devtools/bison/bison_2.7.bb
index 5fe5113..9fb3884 100644
--- a/meta/recipes-devtools/bison/bison_2.5.1.bb
+++ b/meta/recipes-devtools/bison/bison_2.7.bb
@@ -17,8 +17,8 @@ SRC_URI = "${BASE_SRC_URI} \
            file://fix_cross_manpage_building.patch \
           "
 
-SRC_URI[md5sum] = "8fedf916f1aa2c4a31441d8f8bbc603c"
-SRC_URI[sha256sum] = "48dc3649231b75ac160d73528000ec89b6cd8d3b87cb7d0713f72ef4610442d4"
+SRC_URI[md5sum] = "ded660799e76fb1667d594de1f7a0da9"
+SRC_URI[sha256sum] = "19bbe7374fd602f7a6654c131c21a15aebdc06cc89493e8ff250cb7f9ed0a831"
 
 LDFLAGS_prepend_libc-uclibc = " -lrt "
 DEPENDS_class-native = "gettext-minimal-native"
-- 
1.7.10.4



