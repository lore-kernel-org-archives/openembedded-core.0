Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QAIQ1-0000DY-TT
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Apr 2011 11:00:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Apr 2011 01:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,210,1301900400"; d="scan'208";a="419029024"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by azsmga001.ch.intel.com with ESMTP; 14 Apr 2011 01:58:39 -0700
Message-Id: <686fc493b6b4a8e1cbecd39380c513c4d493b26c.1302770941.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302770941.git.dexuan.cui@intel.com>
References: <cover.1302770941.git.dexuan.cui@intel.com>
Old-Date: Tue, 12 Apr 2011 01:00:59 +0800
Date: Thu, 14 Apr 2011 16:56:33 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [v2 04/12] fixesproto: upgrade from 4.1.2 to the latest version 5.0
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
X-List-Received-Date: Thu, 14 Apr 2011 09:00:54 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Update LIC_FILES_CHKSUM as both the files added a new line
+Copyright 2010 Red Hat, Inc.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../{fixesproto_4.1.2.bb => fixesproto_5.0.bb}     |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{fixesproto_4.1.2.bb => fixesproto_5.0.bb} (56%)

diff --git a/meta/recipes-graphics/xorg-proto/fixesproto_4.1.2.bb b/meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb
similarity index 56%
rename from meta/recipes-graphics/xorg-proto/fixesproto_4.1.2.bb
rename to meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb
index 853ffa8..d65922b 100644
--- a/meta/recipes-graphics/xorg-proto/fixesproto_4.1.2.bb
+++ b/meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb
@@ -9,8 +9,8 @@ system."
 
 
 LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bd0f26ecf86d0f24922125195d5b70a \
-                    file://xfixesproto.h;endline=43;md5=27614675897bb1cdc611ba7de506cddc"
+LIC_FILES_CHKSUM = "file://COPYING;md5=262a7a87da56e66dd639bf7334a110c6 \
+                    file://xfixesproto.h;endline=43;md5=c3a9ee6db3532ed0d44dea266cfc97f4"
 
 CONFLICTS = "fixesext"
 PR = "r0"
@@ -18,5 +18,5 @@ PE = "1"
 
 BBCLASSEXTEND = "nativesdk"
 
-SRC_URI[md5sum] = "bdb58ecc313b509247036d5c11fa99df"
-SRC_URI[sha256sum] = "de4cbfccb533c190073445eb2a891d997e89f6fb58204f68ae82871de044f857"
+SRC_URI[md5sum] = "e7431ab84d37b2678af71e29355e101d"
+SRC_URI[sha256sum] = "ba2f3f31246bdd3f2a0acf8bd3b09ba99cab965c7fb2c2c92b7dc72870e424ce"
-- 
1.7.2



