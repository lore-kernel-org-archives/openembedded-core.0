Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E030977236
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 03:23:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1A3NJXP003824
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Feb 2017 19:23:19 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 19:23:18 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Feb 2017 19:23:07 -0800
Message-ID: <bce011a91a47933a3dcb51b9a0899703aace5f3f.1486696950.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1486696950.git.liezhi.yang@windriver.com>
References: <cover.1486696950.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] git: 2.11.0 -> 2.11.1
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
X-List-Received-Date: Fri, 10 Feb 2017 03:23:20 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git_2.11.0.bb | 11 -----------
 meta/recipes-devtools/git/git_2.11.1.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.11.0.bb
 create mode 100644 meta/recipes-devtools/git/git_2.11.1.bb

diff --git a/meta/recipes-devtools/git/git_2.11.0.bb b/meta/recipes-devtools/git/git_2.11.0.bb
deleted file mode 100644
index 0ca8a385673..00000000000
--- a/meta/recipes-devtools/git/git_2.11.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "eac9324afcf4c95ab11acb2e2283e376"
-SRC_URI[tarball.sha256sum] = "d3be9961c799562565f158ce5b836e2b90f38502d3992a115dfb653d7825fd7e"
-SRC_URI[manpages.md5sum] = "cc86bfaf75174e3c8a10615e97bf3e55"
-SRC_URI[manpages.sha256sum] = "437a0128acd707edce24e1a310ab2f09f9a09ee42de58a8e7641362012dcfe22"
diff --git a/meta/recipes-devtools/git/git_2.11.1.bb b/meta/recipes-devtools/git/git_2.11.1.bb
new file mode 100644
index 00000000000..f2f072c5291
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.11.1.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "6a7a73db076bb0514b602720669d685c"
+SRC_URI[tarball.sha256sum] = "a1cdd7c820f92c44abb5003b36dc8cb7201ba38e8744802399f59c97285ca043"
+SRC_URI[manpages.md5sum] = "e4268a6b514ccdb624b6450ff55881a3"
+SRC_URI[manpages.sha256sum] = "ee567e7b0f95333816793714bb31c54e288cf8041f77a0092b85e62c9c2974f9"
-- 
2.11.0.rc2.dirty


