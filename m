Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RQQC2-0001Vb-3G
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 22:05:22 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Nov 2011 12:58:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,517,1315206000"; d="scan'208";a="37410731"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Nov 2011 12:58:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2011 12:58:46 -0800
Message-Id: <537b45f13e2f583068fce11a6474ffad90246389.1321389699.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/16] screenshot: rename to sato-screenshot
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
X-List-Received-Date: Tue, 15 Nov 2011 21:05:22 -0000

From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

To remove a name conflict with e17's screenshot tool (and possibly other
screenshot tools, as screenshot is a generic term), rename screenshot
to sato-screenshot.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../files/fix_ldadd_order.patch                    |    0
 .../sato-screenshot_git.bb}                        |    2 +-
 meta/recipes-sato/tasks/task-core-x11.bb           |    2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/{screenshot => sato-screenshot}/files/fix_ldadd_order.patch (100%)
 rename meta/recipes-sato/{screenshot/screenshot_git.bb => sato-screenshot/sato-screenshot_git.bb} (92%)

diff --git a/meta/recipes-sato/screenshot/files/fix_ldadd_order.patch b/meta/recipes-sato/sato-screenshot/files/fix_ldadd_order.patch
similarity index 100%
rename from meta/recipes-sato/screenshot/files/fix_ldadd_order.patch
rename to meta/recipes-sato/sato-screenshot/files/fix_ldadd_order.patch
diff --git a/meta/recipes-sato/screenshot/screenshot_git.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
similarity index 92%
rename from meta/recipes-sato/screenshot/screenshot_git.bb
rename to meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
index 917a27d..5e51d3d 100644
--- a/meta/recipes-sato/screenshot/screenshot_git.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
@@ -12,7 +12,7 @@ SRCREV = "c792e4edc758bab21e0b01814979eacf0b1af945"
 PV = "0.1+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
+SRC_URI = "git://git.yoctoproject.org/screenshot;protocol=git \
            file://fix_ldadd_order.patch"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/tasks/task-core-x11.bb b/meta/recipes-sato/tasks/task-core-x11.bb
index 106bc0f..f1b06f9 100644
--- a/meta/recipes-sato/tasks/task-core-x11.bb
+++ b/meta/recipes-sato/tasks/task-core-x11.bb
@@ -61,7 +61,7 @@ RDEPENDS_task-core-apps-x11-core = "\
     leafpad \
     ${FILEMANAGER} \
     matchbox-terminal \
-    screenshot"
+    sato-screenshot"
 
 
 RDEPENDS_task-core-apps-x11-games = "\
-- 
1.7.6.4



