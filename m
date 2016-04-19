Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 138356FF5D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 11:23:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Apr 2016 04:23:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,506,1455004800"; d="scan'208";a="935545165"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 19 Apr 2016 04:23:17 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Apr 2016 14:23:28 +0300
Message-Id: <1461065008-31404-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] git: update to 2.7.4
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
X-List-Received-Date: Tue, 19 Apr 2016 11:23:34 -0000

This should also fix recent CVEs:
https://ma.ttias.be/remote-code-execution-git-versions-client-server-2-7-1-cve-2016-2324-cve-2016-2315/

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/git/git_2.7.2.bb | 11 -----------
 meta/recipes-devtools/git/git_2.7.4.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.7.2.bb
 create mode 100644 meta/recipes-devtools/git/git_2.7.4.bb

diff --git a/meta/recipes-devtools/git/git_2.7.2.bb b/meta/recipes-devtools/git/git_2.7.2.bb
deleted file mode 100644
index 3fd7151..0000000
--- a/meta/recipes-devtools/git/git_2.7.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "162ddc6c9b243899ad67ebd6b1c166b1"
-SRC_URI[tarball.sha256sum] = "58959e3ef3046403216a157dfc683c4d7f0dd83365463b8dd87063ded940a0df"
-SRC_URI[manpages.md5sum] = "7bb067d6363f537b92c3b8b813ff9ed6"
-SRC_URI[manpages.sha256sum] = "e6b5481fd6e24a1d1b155ef17363b313d47025bf6da880737fa872ab78e24f15"
diff --git a/meta/recipes-devtools/git/git_2.7.4.bb b/meta/recipes-devtools/git/git_2.7.4.bb
new file mode 100644
index 0000000..bc72793
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.7.4.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "c64012d491e24c7d65cd389f75383d91"
+SRC_URI[tarball.sha256sum] = "7104c4f5d948a75b499a954524cb281fe30c6649d8abe20982936f75ec1f275b"
+SRC_URI[manpages.md5sum] = "58020dc13a5801c49f7986fef7027535"
+SRC_URI[manpages.sha256sum] = "0dfe1931ad302873470e0280248e3aa50502b5edd00dcc3e9c9173667b6fea6a"
-- 
2.8.0.rc3


