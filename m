Return-Path: <william.c.randle@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6EDC8607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 16:41:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 04 Apr 2016 09:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,441,1455004800"; d="scan'208";a="777822341"
Received: from wcrandle-mobl1.amr.corp.intel.com (HELO
	wcrandle-mobl1.jf.intel.com) ([10.24.5.27])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2016 09:40:40 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Apr 2016 09:40:37 -0700
Message-Id: <1459788037-14806-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCHv2] bdwgc: use github repo for source location
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
X-List-Received-Date: Mon, 04 Apr 2016 16:41:07 -0000

The Yocto Autobuilder has been unable to fetch the release package 
from the developer's website at www.hboehm.info, so change recipe
to fetch from the developer's github repo instead.

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
v2: diff against latest master

 meta/recipes-support/bdwgc/bdwgc_7.4.2.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
index 2e6ccf2..592352e 100644
--- a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
+++ b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
@@ -21,14 +21,13 @@ SECTION = "devel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README.QUICK;md5=55f5088f90a982fed7af9a4897047ef7"
 
-SRC_URI = "http://www.hboehm.info/gc/gc_source/gc-${PV}.tar.gz \
+SRCREV = "e31cdc288ffbee5bf25f948e19deb5a7ce846971"
+SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-7_4 \
            file://0001-fix-build-with-musl.patch \
            file://0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch \
-	   file://0002-Altera-NIOS2-support.patch \
+           file://0002-Altera-NIOS2-support.patch \
           "
 
-SRC_URI[md5sum] = "12c05fd2811d989341d8c6d81f66af87"
-SRC_URI[sha256sum] = "63320ad7c45460e4a40e03f5aa4c6893783f21a16416c3282b994f933312afa2"
 FILES_${PN}-doc = "/usr/share"
 
 REAL_PV = "${@[d.getVar('PV',1)[:-1], d.getVar('PV',1)][(d.getVar('PV',1)[-1]).isdigit()]}"
-- 
2.5.0


