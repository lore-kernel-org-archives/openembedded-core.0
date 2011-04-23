Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDWeR-0005sa-Fu
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 08:49:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 Apr 2011 23:29:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,257,1301900400"; d="scan'208";a="424248307"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by azsmga001.ch.intel.com with ESMTP; 22 Apr 2011 23:28:53 -0700
Message-Id: <f3af51af2fff544e743104d19313294ad85aa58a.1303539961.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
Old-Date: Tue, 12 Apr 2011 16:25:54 +0800
Date: Fri, 22 Apr 2011 23:28:52 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 23 Apr 2011 10:00:03 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 02/37] tasks: Upgrade to 0.19 (from 0.18)
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
X-List-Received-Date: Sat, 23 Apr 2011 06:49:08 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-sato/pimlico/tasks/tasks-owl.diff     |    5 +++++
 .../pimlico/{tasks_0.18.bb => tasks_0.19.bb}       |    4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/pimlico/{tasks_0.18.bb => tasks_0.19.bb} (78%)

diff --git a/meta/recipes-sato/pimlico/tasks/tasks-owl.diff b/meta/recipes-sato/pimlico/tasks/tasks-owl.diff
index e407806..aab23ff 100644
--- a/meta/recipes-sato/pimlico/tasks/tasks-owl.diff
+++ b/meta/recipes-sato/pimlico/tasks/tasks-owl.diff
@@ -1,3 +1,8 @@
+This patch enable owl menu, which is hidden in the title bar to save space on
+small screen. It has not been used for a long time, rebase needed.
+
+Upstream-Status: Inappropriate [enable feature]
+
 Index: src/gtk/tasks-ui.xml
 ===================================================================
 --- src/gtk/tasks-ui.xml	(revision 338)
diff --git a/meta/recipes-sato/pimlico/tasks_0.18.bb b/meta/recipes-sato/pimlico/tasks_0.19.bb
similarity index 78%
rename from meta/recipes-sato/pimlico/tasks_0.18.bb
rename to meta/recipes-sato/pimlico/tasks_0.19.bb
index fd7edb3..8326643 100644
--- a/meta/recipes-sato/pimlico/tasks_0.18.bb
+++ b/meta/recipes-sato/pimlico/tasks_0.19.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SRC_URI = "http://pimlico-project.org/sources/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d40c0227e496b51be6fde10f387215ed"
-SRC_URI[sha256sum] = "08802003da2517c6e0b2defd66bcaf466edd0ce7188373f564d629af6b93cc91"
+SRC_URI[md5sum] = "0afd969758561599fd782e1effb39c08"
+SRC_URI[sha256sum] = "1a7fdc5f95a2193a1a25fdb13f071867fb7e42245ce19ccee4bcccb69e557f2e"
 
 OWL_poky = "--with-owl"
 
-- 
1.7.1.1



