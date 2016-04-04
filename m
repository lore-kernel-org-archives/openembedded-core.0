Return-Path: <william.c.randle@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 970806E64A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 16:18:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 04 Apr 2016 09:18:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,441,1455004800"; d="scan'208";a="951366847"
Received: from wcrandle-mobl1.amr.corp.intel.com (HELO
	wcrandle-mobl1.jf.intel.com) ([10.24.5.27])
	by fmsmga002.fm.intel.com with ESMTP; 04 Apr 2016 09:18:11 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Apr 2016 09:18:09 -0700
Message-Id: <1459786689-13082-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] bdwgc: use github repo for source location
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
X-List-Received-Date: Mon, 04 Apr 2016 16:18:14 -0000

The Yocto Autobuilder has been unable to fetch the release package
from the developer's website at www.hboehm.info, so change recipe
to fetch from the developer's github repo instead.

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
 meta/recipes-support/bdwgc/bdwgc_7.4.2.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
index 95e358f..7a4110d 100644
--- a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
+++ b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
@@ -21,12 +21,10 @@ SECTION = "devel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README.QUICK;md5=55f5088f90a982fed7af9a4897047ef7"
 
-SRC_URI = "http://www.hboehm.info/gc/gc_source/gc-${PV}.tar.gz \
+SRCREV = "e31cdc288ffbee5bf25f948e19deb5a7ce846971"
+SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-7_4 \
            file://0001-fix-build-with-musl.patch \
           "
-
-SRC_URI[md5sum] = "12c05fd2811d989341d8c6d81f66af87"
-SRC_URI[sha256sum] = "63320ad7c45460e4a40e03f5aa4c6893783f21a16416c3282b994f933312afa2"
 FILES_${PN}-doc = "/usr/share"
 
 REAL_PV = "${@[d.getVar('PV',1)[:-1], d.getVar('PV',1)][(d.getVar('PV',1)[-1]).isdigit()]}"
-- 
2.5.0


