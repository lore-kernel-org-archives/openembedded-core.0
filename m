Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 813A66CF02
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:30 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506429"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:15 -0700
Message-Id: <5821e37b66997928cf91c0422d9c5a2a625bb9dc.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
References: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381505051.git.sgw@linux.intel.com>
References: <cover.1381505051.git.sgw@linux.intel.com>
Subject: [PATCH 09/18] util-macros: upgrade to 1.17.1
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
X-List-Received-Date: Fri, 11 Oct 2013 15:27:31 -0000

(From OE-Core rev: c96498dfbbdc85caf81e39a20ebfc1af6ab955e0)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-util/{util-macros_1.17.bb => util-macros_1.17.1.bb}         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.17.bb => util-macros_1.17.1.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.17.bb b/meta/recipes-graphics/xorg-util/util-macros_1.17.1.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-util/util-macros_1.17.bb
rename to meta/recipes-graphics/xorg-util/util-macros_1.17.1.bb
index 7698e7a..9274a3a 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.17.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.17.1.bb
@@ -8,7 +8,6 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1970511fddd439b07a6ba789d28ff662"
 
 PE = "1"
-PR = "r0"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
@@ -16,5 +15,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "e162e8921cd08c50bf17b9de5131b3f1"
-SRC_URI[sha256sum] = "a7de22d6828b2a4469d32b4744ac2fe9103fcb85e72dd70794ef77f188946371"
+SRC_URI[md5sum] = "886de1940334e097c5f66233a8393122"
+SRC_URI[sha256sum] = "67bd01d5f4713c9e9d57dc742504d06292dd9c4fb73041ea16fed034c56c622a"
-- 
1.8.3.1


