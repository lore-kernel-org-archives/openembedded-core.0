Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B3C4B6E64A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:03:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2016 08:02:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="659220171"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2016 08:02:31 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 17:59:27 +0200
Message-Id: <1900cc44524e7f8ef1f97803fb02dcbb92239c52.1456415870.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/19] git: update to 2.7.2
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
X-List-Received-Date: Thu, 25 Feb 2016 16:03:18 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/git/git_2.7.0.bb | 11 -----------
 meta/recipes-devtools/git/git_2.7.2.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.7.0.bb
 create mode 100644 meta/recipes-devtools/git/git_2.7.2.bb

diff --git a/meta/recipes-devtools/git/git_2.7.0.bb b/meta/recipes-devtools/git/git_2.7.0.bb
deleted file mode 100644
index 2916a1c..0000000
--- a/meta/recipes-devtools/git/git_2.7.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "f3c3ed131e37e5e07cc0b81e9b539908"
-SRC_URI[tarball.sha256sum] = "db9df4435c70a9b25d20a9ee20d65101692dc907a5a4b30e8343c9ae1b913ead"
-SRC_URI[manpages.md5sum] = "dca693846672e68c31d2eb1fc32e763b"
-SRC_URI[manpages.sha256sum] = "444703d66d8441c3c67ba12997719d7510b67a6bc51ccd098474c417a334fb61"
diff --git a/meta/recipes-devtools/git/git_2.7.2.bb b/meta/recipes-devtools/git/git_2.7.2.bb
new file mode 100644
index 0000000..3fd7151
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.7.2.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "162ddc6c9b243899ad67ebd6b1c166b1"
+SRC_URI[tarball.sha256sum] = "58959e3ef3046403216a157dfc683c4d7f0dd83365463b8dd87063ded940a0df"
+SRC_URI[manpages.md5sum] = "7bb067d6363f537b92c3b8b813ff9ed6"
+SRC_URI[manpages.sha256sum] = "e6b5481fd6e24a1d1b155ef17363b313d47025bf6da880737fa872ab78e24f15"
-- 
2.7.0


