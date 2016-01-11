Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9983873212
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 07:19:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0B7JUG3016201
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 23:19:30 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Jan 2016 23:19:30 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 Jan 2016 23:19:22 -0800
Message-ID: <e0398c9cd1631b6c8dc6f9dae3466de2bd631642.1452496745.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452496745.git.liezhi.yang@windriver.com>
References: <cover.1452496745.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] git: 2.5.0 -> 2.7.0
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
X-List-Received-Date: Mon, 11 Jan 2016 07:19:29 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git_2.5.0.bb |   11 -----------
 meta/recipes-devtools/git/git_2.7.0.bb |   11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.5.0.bb
 create mode 100644 meta/recipes-devtools/git/git_2.7.0.bb

diff --git a/meta/recipes-devtools/git/git_2.5.0.bb b/meta/recipes-devtools/git/git_2.5.0.bb
deleted file mode 100644
index de686c2..0000000
--- a/meta/recipes-devtools/git/git_2.5.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "3bc9b0a803ae8ec6c5316cc64f0b7f78"
-SRC_URI[tarball.sha256sum] = "8fa13ba8434ff83d24f57f831d55dbb9046434c266641180a37744facfce72ac"
-SRC_URI[manpages.md5sum] = "134b049e51420a336049aac21c88a75a"
-SRC_URI[manpages.sha256sum] = "745e4e797fe5061e781c880d370b1beb480199127da5acaf4e376e0b09d4d685"
diff --git a/meta/recipes-devtools/git/git_2.7.0.bb b/meta/recipes-devtools/git/git_2.7.0.bb
new file mode 100644
index 0000000..2916a1c
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.7.0.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "f3c3ed131e37e5e07cc0b81e9b539908"
+SRC_URI[tarball.sha256sum] = "db9df4435c70a9b25d20a9ee20d65101692dc907a5a4b30e8343c9ae1b913ead"
+SRC_URI[manpages.md5sum] = "dca693846672e68c31d2eb1fc32e763b"
+SRC_URI[manpages.sha256sum] = "444703d66d8441c3c67ba12997719d7510b67a6bc51ccd098474c417a334fb61"
-- 
1.7.9.5


