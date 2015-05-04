Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 04ABE72120
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 10:37:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 04 May 2015 03:37:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,365,1427785200"; d="scan'208";a="489002149"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 04 May 2015 03:37:52 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 May 2015 13:37:38 +0300
Message-Id: <1430735858-6704-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] shared-mime-info: Upgrade 1.3 -> 1.4
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
X-List-Received-Date: Mon, 04 May 2015 10:37:54 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info_1.3.bb | 7 -------
 meta/recipes-support/shared-mime-info/shared-mime-info_1.4.bb | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_1.3.bb
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_1.4.bb

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.3.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.3.bb
deleted file mode 100644
index 4bd81cd..0000000
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_1.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require shared-mime-info.inc
-
-SRC_URI[md5sum] = "743720bc4803dd69f55449013d350f31"
-SRC_URI[sha256sum] = "4fd49c8c7ca9ecb10c59845094a18dbb73b69c72b4bad3db5e864f2111cb323a"
-
-SRC_URI =+ "file://parallelmake.patch \
-	    file://install-data-hook.patch"
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.4.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.4.bb
new file mode 100644
index 0000000..3797972
--- /dev/null
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_1.4.bb
@@ -0,0 +1,7 @@
+require shared-mime-info.inc
+
+SRC_URI =+ "file://parallelmake.patch \
+	    file://install-data-hook.patch"
+
+SRC_URI[md5sum] = "16c02f7b658fff2a9c207406d388ea31"
+SRC_URI[sha256sum] = "bbc0bd023f497dfd75e1ca73441cbbb5a63617d9e14f2790b868361cc055b5b1"
-- 
2.1.4


