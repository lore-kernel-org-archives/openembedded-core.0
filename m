Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D703E7458D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 02:17:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9P2HcSn012696
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 19:17:38 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 24 Oct 2018 19:17:38 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Oct 2018 10:17:36 +0800
Message-ID: <1540433856-322582-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] git: upgrade 2.18.0 -> 2.18.1
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
X-List-Received-Date: Thu, 25 Oct 2018 02:17:38 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/git/git_2.18.0.bb | 11 -----------
 meta/recipes-devtools/git/git_2.18.1.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.18.0.bb
 create mode 100644 meta/recipes-devtools/git/git_2.18.1.bb

diff --git a/meta/recipes-devtools/git/git_2.18.0.bb b/meta/recipes-devtools/git/git_2.18.0.bb
deleted file mode 100644
index 72b43a7..0000000
--- a/meta/recipes-devtools/git/git_2.18.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "3f210b2dd1613d90ded3b8732b052025"
-SRC_URI[tarball.sha256sum] = "94faf2c0b02a7920b0b46f4961d8e9cad08e81418614102898a55f980fa3e7e4"
-SRC_URI[manpages.md5sum] = "8251512320568a049192a8219c51e905"
-SRC_URI[manpages.sha256sum] = "6cf38ab3ad43ccdcd6a73ffdcf2a016d56ab6b4b240a574b0bb96f520a04ff55"
diff --git a/meta/recipes-devtools/git/git_2.18.1.bb b/meta/recipes-devtools/git/git_2.18.1.bb
new file mode 100644
index 0000000..b2960c0
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.18.1.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "9b62c267d878f6cb02f8abc59a99525d"
+SRC_URI[tarball.sha256sum] = "5c710c866d8c9ba3b3e062755e0e9d0ef4f665752bd64810e3eb9f1b0f0eb076"
+SRC_URI[manpages.md5sum] = "ef32a459a4a08a3b8e837a31c925c848"
+SRC_URI[manpages.sha256sum] = "d05bfab2dc45de4f6e7d61ca173071d6902905a4963f7ac3cbca608c0d4592c9"
-- 
2.7.4


