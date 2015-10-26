Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C437760657
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 23:11:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 26 Oct 2015 16:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,202,1444719600"; d="scan'208";a="820017742"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.171])
	by fmsmga001.fm.intel.com with ESMTP; 26 Oct 2015 16:11:41 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Oct 2015 17:12:08 -0600
Message-Id: <1445901128-17752-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] acpid: Upgrade to 2.0.25
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
X-List-Received-Date: Mon, 26 Oct 2015 23:11:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-bsp/acpid/acpid_2.0.23.bb | 7 -------
 meta/recipes-bsp/acpid/acpid_2.0.25.bb | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-bsp/acpid/acpid_2.0.23.bb
 create mode 100644 meta/recipes-bsp/acpid/acpid_2.0.25.bb

diff --git a/meta/recipes-bsp/acpid/acpid_2.0.23.bb b/meta/recipes-bsp/acpid/acpid_2.0.23.bb
deleted file mode 100644
index a5317a4..0000000
--- a/meta/recipes-bsp/acpid/acpid_2.0.23.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require acpid.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
-                    file://acpid.h;endline=24;md5=324a9cf225ae69ddaad1bf9d942115b5"
-
-SRC_URI[md5sum] = "d7bcdcdefcd53b03730e50ba842554ea"
-SRC_URI[sha256sum] = "4396aaec13510c3a1faa941a15a4b5335b6ae4fbec8438b9249b88c3b66187ee"
diff --git a/meta/recipes-bsp/acpid/acpid_2.0.25.bb b/meta/recipes-bsp/acpid/acpid_2.0.25.bb
new file mode 100644
index 0000000..f00d25a
--- /dev/null
+++ b/meta/recipes-bsp/acpid/acpid_2.0.25.bb
@@ -0,0 +1,7 @@
+require acpid.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
+                    file://acpid.h;endline=24;md5=324a9cf225ae69ddaad1bf9d942115b5"
+
+SRC_URI[md5sum] = "69bb0cc4a0a89eb2dfecc4851087f568"
+SRC_URI[sha256sum] = "0b700a8072bec162c512f72cbe419195601ab3e0ffd2138f9bd95ed3097a5c68"
-- 
2.1.4


