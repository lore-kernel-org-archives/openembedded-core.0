Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F609762B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 00:39:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7N0dOPW028032
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 17:39:24 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Aug 2016 17:39:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2016 17:39:20 -0700
Message-ID: <9563b4f9f9add853e9de067181dd5a38a6600e67.1471912673.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1471912673.git.liezhi.yang@windriver.com>
References: <cover.1471912673.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] git: 2.9.2 -> 2.9.3
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
X-List-Received-Date: Tue, 23 Aug 2016 00:39:25 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git_2.9.2.bb | 11 -----------
 meta/recipes-devtools/git/git_2.9.3.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.9.2.bb
 create mode 100644 meta/recipes-devtools/git/git_2.9.3.bb

diff --git a/meta/recipes-devtools/git/git_2.9.2.bb b/meta/recipes-devtools/git/git_2.9.2.bb
deleted file mode 100644
index 3eab96a..0000000
--- a/meta/recipes-devtools/git/git_2.9.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "7faff70073c2c4a503cd584071fabb84"
-SRC_URI[tarball.sha256sum] = "3cb09a3917c2d8150fc1708f3019cf99a8f0feee6cd61bba3797e3b2a85be9dc"
-SRC_URI[manpages.md5sum] = "6f8a2f890e40f18f4c96a5cd70722ad3"
-SRC_URI[manpages.sha256sum] = "ac5c600153d1e4a1c6494e250cd27ca288e7667ad8d4ea2f2386f60ba1b78eec"
diff --git a/meta/recipes-devtools/git/git_2.9.3.bb b/meta/recipes-devtools/git/git_2.9.3.bb
new file mode 100644
index 0000000..d59f3d2
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.9.3.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "c783361be894b8bfa5373811b1b65602"
+SRC_URI[tarball.sha256sum] = "a252b6636b12d5ba57732c8469701544c26c2b1689933bd1b425e603cbb247c0"
+SRC_URI[manpages.md5sum] = "66fafd61d65f9d2d99581133170eb186"
+SRC_URI[manpages.sha256sum] = "8ea1a55b048fafbf0c0c6fcbca4b5b0f5e9917893221fc7345c09051d65832ce"
-- 
2.9.0


