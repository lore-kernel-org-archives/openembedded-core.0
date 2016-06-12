Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A50D6FF9B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 08:25:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5C8PI1E021204
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 01:25:19 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 12 Jun 2016 01:25:18 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 01:25:06 -0700
Message-ID: <ce36e4e7fac3288f29edd8f4e37ff2b90a6aba2b.1465719878.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1465719878.git.liezhi.yang@windriver.com>
References: <cover.1465719878.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/11] git: 2.8.2 -> 2.8.4
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
X-List-Received-Date: Sun, 12 Jun 2016 08:25:18 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git_2.8.2.bb | 11 -----------
 meta/recipes-devtools/git/git_2.8.4.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.8.2.bb
 create mode 100644 meta/recipes-devtools/git/git_2.8.4.bb

diff --git a/meta/recipes-devtools/git/git_2.8.2.bb b/meta/recipes-devtools/git/git_2.8.2.bb
deleted file mode 100644
index b3ce4f8..0000000
--- a/meta/recipes-devtools/git/git_2.8.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "3022d8ebf64b35b9704d5adf54b256f9"
-SRC_URI[tarball.sha256sum] = "a029c37ee2e0bb1efea5c4af827ff5afdb3356ec42fc19c1d40216d99e97e148"
-SRC_URI[manpages.md5sum] = "8c9da11aeb45b4a286ba766e25aaf3ab"
-SRC_URI[manpages.sha256sum] = "82d322211aade626d1eb3bcf3b76730bfdd2fcc9c189950fb0a8bdd69c383e2f"
diff --git a/meta/recipes-devtools/git/git_2.8.4.bb b/meta/recipes-devtools/git/git_2.8.4.bb
new file mode 100644
index 0000000..7f3a89b
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.8.4.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "51e5a6b8b7f834b27d91d2268ae10a9c"
+SRC_URI[tarball.sha256sum] = "626e319f8a24fc0866167ea5f6bf3e2f38f69d6cb2e59e150f13709ca3ebf301"
+SRC_URI[manpages.md5sum] = "c4d17feb686ff9be3d6f8762a89cdafe"
+SRC_URI[manpages.sha256sum] = "953a8eadaf4ae96dbad2c3ec12384c677416843917ef83d94b98367ffd55afc0"
-- 
2.8.0


