Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C07947C69C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 03:04:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1F345QF004700
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 19:04:15 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.435.0; Thu, 14 Feb 2019 19:03:55 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Feb 2019 11:22:20 +0800
Message-ID: <1b3b9d58e05e673307ae8026d1204e3bfe0744c7.1550200881.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1550200881.git.liezhi.yang@windriver.com>
References: <cover.1550200881.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] git: 2.18.1 -> 2.20.1
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
X-List-Received-Date: Fri, 15 Feb 2019 03:04:24 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git_2.18.1.bb | 11 -----------
 meta/recipes-devtools/git/git_2.20.1.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.18.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.20.1.bb

diff --git a/meta/recipes-devtools/git/git_2.18.1.bb b/meta/recipes-devtools/git/git_2.18.1.bb
deleted file mode 100644
index b2960c0..0000000
--- a/meta/recipes-devtools/git/git_2.18.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "9b62c267d878f6cb02f8abc59a99525d"
-SRC_URI[tarball.sha256sum] = "5c710c866d8c9ba3b3e062755e0e9d0ef4f665752bd64810e3eb9f1b0f0eb076"
-SRC_URI[manpages.md5sum] = "ef32a459a4a08a3b8e837a31c925c848"
-SRC_URI[manpages.sha256sum] = "d05bfab2dc45de4f6e7d61ca173071d6902905a4963f7ac3cbca608c0d4592c9"
diff --git a/meta/recipes-devtools/git/git_2.20.1.bb b/meta/recipes-devtools/git/git_2.20.1.bb
new file mode 100644
index 0000000..877fb05
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.20.1.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "7a7769e5c957364ed0aed89e6e67c254"
+SRC_URI[tarball.sha256sum] = "edc3bc1495b69179ba4e272e97eff93334a20decb1d8db6ec3c19c16417738fd"
+SRC_URI[manpages.md5sum] = "78c6e54a61a167dab5e8ae07036293ab"
+SRC_URI[manpages.sha256sum] = "e9c123463abd05e142defe44a8060ce6e9853dfd8c83b2542e38b7deac4e6d4c"
-- 
2.7.4


