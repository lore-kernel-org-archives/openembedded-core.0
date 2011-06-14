Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOd9-0001K6-Nn
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283991"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:44 -0700
Message-Id: <78097c45fef59fd11503332c7156e94a5dd69b36.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 35/51] libxext: upgrade from 1.2.0 to the latest version 1.3.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jun 2011 08:06:49 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../{libxext_1.2.0.bb => libxext_1.3.0.bb}         |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxext_1.2.0.bb => libxext_1.3.0.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-lib/libxext_1.2.0.bb b/meta/recipes-graphics/xorg-lib/libxext_1.3.0.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-lib/libxext_1.2.0.bb
rename to meta/recipes-graphics/xorg-lib/libxext_1.3.0.bb
index 679bb1a..90b4405 100644
--- a/meta/recipes-graphics/xorg-lib/libxext_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxext_1.3.0.bb
@@ -11,7 +11,7 @@ extensions."
 require xorg-lib-common.inc
 
 LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0542b0321c1c9a7a20b23a1b9fa45f91"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9b0eca8f3540b7e7f8b447154a20b05a"
 
 DEPENDS += "xproto virtual/libx11 xextproto libxau libxdmcp"
 PROVIDES = "xext"
@@ -23,5 +23,5 @@ XORG_PN = "libXext"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "9bb236ff0193e9fc1c1fb504dd840331"
-SRC_URI[sha256sum] = "4aed3e211e41c47908c293515580e731c26048f61a1212bf0888d1f456de6ff7"
+SRC_URI[md5sum] = "161d200b690ace818db1cc7537e70ba9"
+SRC_URI[sha256sum] = "e9daeb400855b9836e328500cec356b2769033174fc1b2be0df4a80f031debc0"
-- 
1.7.3.4



