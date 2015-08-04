Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 98CFD75794
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 06:40:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t746eBs9009684
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Aug 2015 23:40:11 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 3 Aug 2015 23:40:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Aug 2015 23:40:05 -0700
Message-ID: <a23f3a1892363b6fb587379f4b8fbba9b0406df3.1438670283.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438670283.git.liezhi.yang@windriver.com>
References: <cover.1438670283.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] git: 2.4.6 -> 2.5.0
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
X-List-Received-Date: Tue, 04 Aug 2015 06:40:14 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git_2.4.6.bb |   11 -----------
 meta/recipes-devtools/git/git_2.5.0.bb |   11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.4.6.bb
 create mode 100644 meta/recipes-devtools/git/git_2.5.0.bb

diff --git a/meta/recipes-devtools/git/git_2.4.6.bb b/meta/recipes-devtools/git/git_2.4.6.bb
deleted file mode 100644
index 3655756..0000000
--- a/meta/recipes-devtools/git/git_2.4.6.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "af7f48ebe09eef41504241d4a845610b"
-SRC_URI[tarball.sha256sum] = "c4220a6a24de853044702d9727204ef6bf254012d64e9e0f22ef46a63ec2dbe4"
-SRC_URI[manpages.md5sum] = "b4bd9c649e263240035708ac28a7b680"
-SRC_URI[manpages.sha256sum] = "9a84a7e7b8ea7272fac103a1c4b390872faf31a96754aa41e76ed48c437b382f"
diff --git a/meta/recipes-devtools/git/git_2.5.0.bb b/meta/recipes-devtools/git/git_2.5.0.bb
new file mode 100644
index 0000000..de686c2
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.5.0.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "3bc9b0a803ae8ec6c5316cc64f0b7f78"
+SRC_URI[tarball.sha256sum] = "8fa13ba8434ff83d24f57f831d55dbb9046434c266641180a37744facfce72ac"
+SRC_URI[manpages.md5sum] = "134b049e51420a336049aac21c88a75a"
+SRC_URI[manpages.sha256sum] = "745e4e797fe5061e781c880d370b1beb480199127da5acaf4e376e0b09d4d685"
-- 
1.7.9.5


