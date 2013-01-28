Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tzl52-0003nR-SY
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:33:02 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Jan 2013 01:16:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="195769992"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.19])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jan 2013 01:16:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 01:15:57 -0800
Message-Id: <df0a6379852d7c47b54a1b2d7f80328b1c928bd9.1359364462.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
Subject: [PATCH 10/13] util-linux: Update to 2.22.2
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
X-List-Received-Date: Mon, 28 Jan 2013 09:33:05 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../util-linux/{util-linux_2.22.1.bb => util-linux_2.22.2.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.22.1.bb => util-linux_2.22.2.bb} (89%)

diff --git a/meta/recipes-core/util-linux/util-linux_2.22.1.bb b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
similarity index 89%
rename from meta/recipes-core/util-linux/util-linux_2.22.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.22.2.bb
index d734951..dd95573 100644
--- a/meta/recipes-core/util-linux/util-linux_2.22.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.22"
-PR = "r3"
+PR = "r0"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
@@ -12,8 +12,8 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
 	    file://fix-configure.patch \
 "
 
-SRC_URI[md5sum] = "cad23c41a014af766d467b86628bd0fd"
-SRC_URI[sha256sum] = "4297ea2a560f8839d7b3cde72a5955d1458dbad38fe0e3d99ccb1fde3df751b2"
+SRC_URI[md5sum] = "3e379b4d8b9693948d751c154614c73e"
+SRC_URI[sha256sum] = "7463a17a01a77cee36d8ce845d8148208f553c9abdd67b446324bf42968bc36d"
 
 # Only lscpu part is gplv3; rest of the code is not, 
 # so take out the lscpu parts while running non-gplv3 build.
-- 
1.8.0.2



