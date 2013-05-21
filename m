Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id B9F9D6A3F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 11:04:24 +0000 (UTC)
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id D4A63952B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 12:04:25 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 12:04:19 +0100
Message-Id: <1369134259-12091-9-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369134259-12091-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
	<1369134259-12091-1-git-send-email-tf+lists.yocto@r-finger.com>
Subject: [PATCH v3 8/8] packagegroup-core-clutter: use clutter-1.0 packages
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
X-List-Received-Date: Tue, 21 May 2013 11:04:25 -0000

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


