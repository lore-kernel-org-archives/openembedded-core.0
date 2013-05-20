Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UeRwM-00043Z-R0
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 17:23:59 +0200
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id A382F9537
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 16:05:34 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2013 16:05:25 +0100
Message-Id: <1369062325-30335-9-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369062325-30335-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <51969025.6040407@linux.intel.com>
	<1369062325-30335-1-git-send-email-tf+lists.yocto@r-finger.com>
Subject: [PATCH v2 8/8] packagegroup-core-clutter: use clutter-1.0 packages
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
X-List-Received-Date: Mon, 20 May 2013 15:24:03 -0000

From: Tomas Frydrych <tomas@sleepfive.com>


Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 .../packagegroups/packagegroup-core-clutter.bb                 |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
index 7b1cedc..cb2aba0 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
@@ -5,7 +5,7 @@
 SUMMARY = "Clutter package groups"
 LICENSE = "MIT"
 
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
@@ -20,7 +20,7 @@ RCONFLICTS_${PN}-core = "task-core-clutter-core"
 
 SUMMARY_${PN}-core = "Clutter graphics library"
 RDEPENDS_${PN}-core = "\
-    clutter-1.8 \
-    clutter-gst-1.8 \
-    clutter-gtk-1.8 \
+    clutter-1.0 \
+    clutter-gst-1.0 \
+    clutter-gtk-1.0 \
     "
-- 
1.7.10.4



