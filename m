Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1TsZ7h-0006rw-1v
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 14:21:47 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Jan 2013 05:05:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,430,1355126400"; d="scan'208";a="269243228"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by orsmga002.jf.intel.com with ESMTP; 08 Jan 2013 05:06:19 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 15:09:32 +0200
Message-Id: <1357650572-29588-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] bdwgc: updated to version 7.2d
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
X-List-Received-Date: Tue, 08 Jan 2013 13:21:48 -0000

The license file text was updated to extend the copyright in 2011,
to reflect the new package version and to fix various typos. Tested
by compiling and running guile (which depends on bdwgc) on qemu-x86.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../bdwgc/{bdwgc_20110107.bb => bdwgc_7.2.bb}            |   14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)
 rename meta/recipes-support/bdwgc/{bdwgc_20110107.bb => bdwgc_7.2.bb} (83%)

diff --git a/meta/recipes-support/bdwgc/bdwgc_20110107.bb b/meta/recipes-support/bdwgc/bdwgc_7.2.bb
similarity index 83%
rename from meta/recipes-support/bdwgc/bdwgc_20110107.bb
rename to meta/recipes-support/bdwgc/bdwgc_7.2.bb
index bc7b613..a0a5bff 100644
--- a/meta/recipes-support/bdwgc/bdwgc_20110107.bb
+++ b/meta/recipes-support/bdwgc/bdwgc_7.2.bb
@@ -20,18 +20,20 @@ HOMEPAGE = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/"
 SECTION = "devel"
 LICENSE = "MIT & FSF-Unlimited & GPL-2.0"
 LIC_FILES_CHKSUM = "file://README.QUICK;md5=9b9dd874f6940641b6ab19893ee8f1cc \
-                    file://doc/README;md5=6d74ce18ff55d936a4d6bd35a98e9eb9 \
+                    file://doc/README;md5=92e7dd0334d1f672b699cd0aca08bef0 \
                     file://libatomic_ops/doc/LICENSING.txt;md5=607073e04548eac7d1f763e480477bab"
 
-SRC_URI = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/bdwgc-7_2alpha5-20110107.tar.bz2"
+REVISION = "d"
 
-SRC_URI[md5sum] = "4f3c130fc71ff23584edaa19a37739ee"
-SRC_URI[sha256sum] = "1f57b959ae1144e1e5fa59d52d7cb4ed626fd74cf47da1c9c119b8b46ae2722d"
+SRC_URI = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/gc-${PV}${REVISION}.tar.gz"
+
+SRC_URI[md5sum] = "91340b28c61753a789eb6077675d87d2"
+SRC_URI[sha256sum] = "d9fe0ae8650d43746a48bfb394cab01a319f3809cee19f8ebd16aa985b511c5e"
 FILES_${PN}-doc = "/usr/share"
 
-PR = "r1"
+PR = "r0"
 
-S = "${WORKDIR}/bdwgc"
+S = "${WORKDIR}/gc-${PV}"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.7.10.4



