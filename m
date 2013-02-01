Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U1PT0-0000DD-Fb
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 23:52:20 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Feb 2013 14:36:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,579,1355126400"; d="scan'208";a="251648944"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.100])
	by azsmga001.ch.intel.com with ESMTP; 01 Feb 2013 14:36:29 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2013 14:36:29 -0800
Message-Id: <1359758189-23781-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] qt4: Add space for _appends
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
X-List-Received-Date: Fri, 01 Feb 2013 22:52:24 -0000

With out the space we get -x11-no-neon concatanted incorrectly

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb | 2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb b/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
index 0f417c9..6024192 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
@@ -3,7 +3,7 @@ require qt4-embedded.inc
 
 PR = "${INC_PR}.2"
 
-QT_CONFIG_FLAGS_append_arm = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", "-no-neon" ,d)}"
+QT_CONFIG_FLAGS_append_arm = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " -no-neon" ,d)}"
 
 QT_CONFIG_FLAGS += " \
  -exceptions \
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
index a589fbe..7de6a82 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
@@ -3,7 +3,7 @@ require qt4-${PV}.inc
 
 PR = "${INC_PR}.2"
 
-QT_CONFIG_FLAGS_append_arm = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", "-no-neon" ,d)}"
+QT_CONFIG_FLAGS_append_arm = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " -no-neon" ,d)}"
 
 QT_CONFIG_FLAGS += " \
  -no-embedded \
-- 
1.8.0.2



