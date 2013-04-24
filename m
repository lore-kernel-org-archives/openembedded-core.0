Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1UV0vQ-0002at-Nn
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 16:44:00 +0200
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 15:26:14 +0100
Message-Id: <1366813574-21199-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.2.1
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH] connman: update to 1.13
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
X-List-Received-Date: Wed, 24 Apr 2013 14:44:05 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

- Removed upstream commited patch
- Updated git tag srcrev

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 .../connman/connman/add-in.h-for-ipv6.patch          | 20 --------------------
 .../connman/{connman_1.12.bb => connman_1.13.bb}     |  6 +++---
 2 files changed, 3 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/add-in.h-for-ipv6.patch
 rename meta/recipes-connectivity/connman/{connman_1.12.bb => connman_1.13.bb} (78%)

diff --git a/meta/recipes-connectivity/connman/connman/add-in.h-for-ipv6.patch b/meta/recipes-connectivity/connman/connman/add-in.h-for-ipv6.patch
deleted file mode 100644
index 8ee0b6f..0000000
--- a/meta/recipes-connectivity/connman/connman/add-in.h-for-ipv6.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-
-The 3.8 Kernel headers for if_bridge.h uses the in6_addr struct
-which is defined by netinet/in.h which is not included prior.
-
-Upstream-Status: Pending
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: git/src/tethering.c
-===================================================================
---- git.orig/src/tethering.c
-+++ git/src/tethering.c
-@@ -35,6 +35,7 @@
- #include <string.h>
- #include <fcntl.h>
- #include <linux/if_tun.h>
-+#include <netinet/in.h>
- #include <linux/if_bridge.h>
- 
- #include "connman.h"
diff --git a/meta/recipes-connectivity/connman/connman_1.12.bb b/meta/recipes-connectivity/connman/connman_1.13.bb
similarity index 78%
rename from meta/recipes-connectivity/connman/connman_1.12.bb
rename to meta/recipes-connectivity/connman/connman_1.13.bb
index 5ba4032..4f23538 100644
--- a/meta/recipes-connectivity/connman/connman_1.12.bb
+++ b/meta/recipes-connectivity/connman/connman_1.13.bb
@@ -1,13 +1,13 @@
 require connman.inc
 
-# 1.12 tag
-SRCREV = "8397cbbc0a79d39cf3b1880f4fd3f3405b6bc6ad"
+# 1.13 tag
+SRCREV = "96fcd8871531c9012135110769618d65a3523b4d"
 SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
             file://connman \
             file://inet-fix-ip-cleanup-functions.patch \
-            file://add-in.h-for-ipv6.patch"
+            "
 S = "${WORKDIR}/git"
 PR = "${INC_PR}.0"
 
-- 
1.8.2.1



