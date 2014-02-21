Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 499926EF9F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 04:55:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Feb 2014 20:51:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,516,1389772800"; d="scan'208";a="459255306"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.1])
	by orsmga001.jf.intel.com with ESMTP; 20 Feb 2014 20:55:28 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2014 20:55:27 -0800
Message-Id: <1392958527-5022-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] psmisc: Update to 22.21
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
X-List-Received-Date: Fri, 21 Feb 2014 04:55:30 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/psmisc/psmisc_22.20.bb | 6 ------
 meta/recipes-extended/psmisc/psmisc_22.21.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/psmisc/psmisc_22.20.bb
 create mode 100644 meta/recipes-extended/psmisc/psmisc_22.21.bb

diff --git a/meta/recipes-extended/psmisc/psmisc_22.20.bb b/meta/recipes-extended/psmisc/psmisc_22.20.bb
deleted file mode 100644
index 3dbd999..0000000
--- a/meta/recipes-extended/psmisc/psmisc_22.20.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require psmisc.inc
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-
-SRC_URI[md5sum] = "a25fc99a6dc7fa7ae6e4549be80b401f"
-SRC_URI[sha256sum] = "b17224e2385f6a799ffebba27eb7870771d42555e86814ef56b6d7e955765514"
diff --git a/meta/recipes-extended/psmisc/psmisc_22.21.bb b/meta/recipes-extended/psmisc/psmisc_22.21.bb
new file mode 100644
index 0000000..22f65c5
--- /dev/null
+++ b/meta/recipes-extended/psmisc/psmisc_22.21.bb
@@ -0,0 +1,6 @@
+require psmisc.inc
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI[md5sum] = "935c0fd6eb208288262b385fa656f1bf"
+SRC_URI[sha256sum] = "97323cad619210845b696d7d722c383852b2acb5c49b5b0852c4f29c77a8145a"
-- 
1.8.3.1


