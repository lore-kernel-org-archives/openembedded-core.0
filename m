Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B473A7FF5A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 03:21:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 19:21:04 -0800
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="205701715"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.193])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 19:21:03 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 11:20:49 +0800
Message-Id: <bff041c8e4bf876bd23609e857a7c23f6023e590.1576638856.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1576638856.git.anuj.mittal@intel.com>
References: <cover.1576638856.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 1/9] git: upgrade 2.23.0 -> 2.23.1
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
X-List-Received-Date: Wed, 18 Dec 2019 03:21:02 -0000
Content-Transfer-Encoding: 8bit

Fixes a bunch of CVEs:
https://github.com/git/git/commit/a7312d1a28ff3ab0a5a5427b35f01d943103cba8

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/git/git_2.23.0.bb | 11 -----------
 meta/recipes-devtools/git/git_2.23.1.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.23.0.bb
 create mode 100644 meta/recipes-devtools/git/git_2.23.1.bb

diff --git a/meta/recipes-devtools/git/git_2.23.0.bb b/meta/recipes-devtools/git/git_2.23.0.bb
deleted file mode 100644
index 1539182a90..0000000000
--- a/meta/recipes-devtools/git/git_2.23.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "203c238ffdcef76f9bd6c67cfbaf949f"
-SRC_URI[tarball.sha256sum] = "e3396c90888111a01bf607346db09b0fbf49a95bc83faf9506b61195936f0cfe"
-SRC_URI[manpages.md5sum] = "90a72e553de712d798d68b15b57bc928"
-SRC_URI[manpages.sha256sum] = "a5b0998f95c2290386d191d34780d145ea67e527fac98541e0350749bf76be75"
diff --git a/meta/recipes-devtools/git/git_2.23.1.bb b/meta/recipes-devtools/git/git_2.23.1.bb
new file mode 100644
index 0000000000..7d8287d8a7
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.23.1.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "5dbd2a5bf2c4aeec65a7b34229ba47f2"
+SRC_URI[tarball.sha256sum] = "d24f129cb0d395550b9ba62f518200405e9fee422134cb46b9820f2db2f54b47"
+SRC_URI[manpages.md5sum] = "890a45439e8462460a590aeb7fe7725c"
+SRC_URI[manpages.sha256sum] = "efd51b6078469501ccbe2e39c5565ba696e9bdf213453ac477be0c256fc7ad42"
-- 
2.21.0


