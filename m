Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1UDt47-0005zK-Tz
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 09:54:12 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Mar 2013 00:37:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,806,1355126400"; d="scan'208";a="296579867"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga002.jf.intel.com with ESMTP; 08 Mar 2013 00:37:24 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2013 10:38:21 +0200
Message-Id: <1362731901-31963-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] apt-native: fix checksums
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
X-List-Received-Date: Fri, 08 Mar 2013 08:54:15 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-devtools/apt/apt-native_0.9.7.7.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt-native_0.9.7.7.bb b/meta/recipes-devtools/apt/apt-native_0.9.7.7.bb
index 1e420a4..d71ab2f 100644
--- a/meta/recipes-devtools/apt/apt-native_0.9.7.7.bb
+++ b/meta/recipes-devtools/apt/apt-native_0.9.7.7.bb
@@ -1,11 +1,11 @@
 require apt-native.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://noconfigure.patch \
 	    file://no-curl.patch"
 
-SRC_URI[md5sum] = "3f86f4eff53c94b7f285b3c59eb89754"
-SRC_URI[sha256sum] = "71fc7ff15fda50f16c9d73f701adf3bd67c9803a2304cd3d82cb490d76d3c3b3"
+SRC_URI[md5sum] = "039fc57668d1a0c2f62dc22e71900a16"
+SRC_URI[sha256sum] = "6eca4285f1ac2e8cb837b9546553b0546881ed15853aa5bbeb860bab6bfa1700"
 
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
-- 
1.7.11.7



