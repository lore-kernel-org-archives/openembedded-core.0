Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 38AEF65D75
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 23:49:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2014 16:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,907,1389772800"; d="scan'208";a="497712250"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2014 16:49:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Apr 2014 16:49:30 -0700
Message-Id: <a0ccf21935616341d63b5c63b00c9c3fcb07adc9.1398210385.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
Subject: [PATCH 08/10] util-macros: update to 1.19.0
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
X-List-Received-Date: Tue, 22 Apr 2014 23:49:41 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-util/{util-macros_1.18.0.bb => util-macros_1.19.0.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.18.0.bb => util-macros_1.19.0.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.18.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.19.0.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-util/util-macros_1.18.0.bb
rename to meta/recipes-graphics/xorg-util/util-macros_1.19.0.bb
index 79759f6..26cf50f 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.18.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.19.0.bb
@@ -9,11 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1970511fddd439b07a6ba789d28ff662"
 
 PE = "1"
 
+SRC_URI[md5sum] = "40e1caa49a71a26e0aa68ddd00203717"
+SRC_URI[sha256sum] = "0d4df51b29023daf2f63aebf3ebc638ea88efedfd560ab5866741ab3f92acaa1"
+
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "fd0ba21b3179703c071bbb4c3e5fb0f4"
-SRC_URI[sha256sum] = "cf4ab0e17bfee0f7689cdcff8c7d7f164c9a710f851f91c488f5cd81fac9c0aa"
-- 
1.8.3.1


