Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1827A6FFCC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 01:37:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u671b9Uw007692
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2016 18:37:09 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Jul 2016 18:37:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jul 2016 18:37:02 -0700
Message-ID: <fda7b83b51d93891bfe9c602f9c69cdee7a084d3.1467855356.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1467855356.git.liezhi.yang@windriver.com>
References: <cover.1467855356.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] git: 2.8.4 -> 2.9.0
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
X-List-Received-Date: Thu, 07 Jul 2016 01:37:09 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git_2.8.4.bb | 11 -----------
 meta/recipes-devtools/git/git_2.9.0.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.8.4.bb
 create mode 100644 meta/recipes-devtools/git/git_2.9.0.bb

diff --git a/meta/recipes-devtools/git/git_2.8.4.bb b/meta/recipes-devtools/git/git_2.8.4.bb
deleted file mode 100644
index 7f3a89b..0000000
--- a/meta/recipes-devtools/git/git_2.8.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "51e5a6b8b7f834b27d91d2268ae10a9c"
-SRC_URI[tarball.sha256sum] = "626e319f8a24fc0866167ea5f6bf3e2f38f69d6cb2e59e150f13709ca3ebf301"
-SRC_URI[manpages.md5sum] = "c4d17feb686ff9be3d6f8762a89cdafe"
-SRC_URI[manpages.sha256sum] = "953a8eadaf4ae96dbad2c3ec12384c677416843917ef83d94b98367ffd55afc0"
diff --git a/meta/recipes-devtools/git/git_2.9.0.bb b/meta/recipes-devtools/git/git_2.9.0.bb
new file mode 100644
index 0000000..5a04715
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.9.0.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "c982d63b69c1206c1b9d28de31520775"
+SRC_URI[tarball.sha256sum] = "bff7560f5602fcd8e37669e0f65ef08c6edc996e4f324e4ed6bb8a84765e30bd"
+SRC_URI[manpages.md5sum] = "6945b85d17929691327dc12e7d1e0cbd"
+SRC_URI[manpages.sha256sum] = "35ba69a8560529aa837e395a6d6c8d42f4d29b40a3c1cc6e3dc69bb1faadb332"
-- 
2.9.0


