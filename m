Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 140CE6069C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 08:34:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uB28YZJt020725
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Dec 2016 00:34:35 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 2 Dec 2016 00:34:34 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Dec 2016 16:35:40 +0800
Message-ID: <c960ecd5d830e6f0f4523eea04bbf418a9818fe9.1480667707.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1480667707.git.Qi.Chen@windriver.com>
References: <cover.1480667707.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] git: upgrade to 2.11.0
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
X-List-Received-Date: Fri, 02 Dec 2016 08:34:34 -0000
Content-Type: text/plain

Upgrade git to 2.11.0.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/git/git_2.11.0.bb | 11 +++++++++++
 meta/recipes-devtools/git/git_2.9.3.bb  | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/git/git_2.11.0.bb
 delete mode 100644 meta/recipes-devtools/git/git_2.9.3.bb

diff --git a/meta/recipes-devtools/git/git_2.11.0.bb b/meta/recipes-devtools/git/git_2.11.0.bb
new file mode 100644
index 0000000..0ca8a38
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.11.0.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "eac9324afcf4c95ab11acb2e2283e376"
+SRC_URI[tarball.sha256sum] = "d3be9961c799562565f158ce5b836e2b90f38502d3992a115dfb653d7825fd7e"
+SRC_URI[manpages.md5sum] = "cc86bfaf75174e3c8a10615e97bf3e55"
+SRC_URI[manpages.sha256sum] = "437a0128acd707edce24e1a310ab2f09f9a09ee42de58a8e7641362012dcfe22"
diff --git a/meta/recipes-devtools/git/git_2.9.3.bb b/meta/recipes-devtools/git/git_2.9.3.bb
deleted file mode 100644
index d59f3d2..0000000
--- a/meta/recipes-devtools/git/git_2.9.3.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "c783361be894b8bfa5373811b1b65602"
-SRC_URI[tarball.sha256sum] = "a252b6636b12d5ba57732c8469701544c26c2b1689933bd1b425e603cbb247c0"
-SRC_URI[manpages.md5sum] = "66fafd61d65f9d2d99581133170eb186"
-SRC_URI[manpages.sha256sum] = "8ea1a55b048fafbf0c0c6fcbca4b5b0f5e9917893221fc7345c09051d65832ce"
-- 
1.9.1


