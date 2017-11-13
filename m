Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E538785DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 00:54:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAE0s7fs027265
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 16:54:07 -0800 (PST)
Received: from pek-lpg-core1.windriver.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 16:54:06 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 01:58:45 +0800
Message-ID: <017d4c143e1cc8514437805676e398aa8b80595f.1510595883.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510595883.git.liezhi.yang@windriver.com>
References: <cover.1510595883.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/10] git: 2.13.3 -> 2.15.0
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
X-List-Received-Date: Tue, 14 Nov 2017 00:54:06 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git_2.13.3.bb | 11 -----------
 meta/recipes-devtools/git/git_2.15.0.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.13.3.bb
 create mode 100644 meta/recipes-devtools/git/git_2.15.0.bb

diff --git a/meta/recipes-devtools/git/git_2.13.3.bb b/meta/recipes-devtools/git/git_2.13.3.bb
deleted file mode 100644
index b3e3887..0000000
--- a/meta/recipes-devtools/git/git_2.13.3.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "d2dc550f6693ba7e5b16212b2714f59f"
-SRC_URI[tarball.sha256sum] = "1497001772f630d49809e981672edfe3e3ce1a1d18e905cd539c4d2f4dbcd75a"
-SRC_URI[manpages.md5sum] = "3037d11a4f4cdd19435871c267ca48b4"
-SRC_URI[manpages.sha256sum] = "f9b302eeb08ce08934e7afb42280ce9294411fbf5f7b6ac3fcc236e8031f10c5"
diff --git a/meta/recipes-devtools/git/git_2.15.0.bb b/meta/recipes-devtools/git/git_2.15.0.bb
new file mode 100644
index 0000000..fd6c931
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.15.0.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "1ed7298833336c1accb0a7be5a7a2b1b"
+SRC_URI[tarball.sha256sum] = "25762cc50103a6a0665c46ea33ceb0578eee01c19b6a08fd393e8608ccbdb3da"
+SRC_URI[manpages.md5sum] = "19a0116bcb0779e0bc997c4180018daf"
+SRC_URI[manpages.sha256sum] = "3b1b9ebf02d4aa6e741becd1ed9319597488743f939fdab3b894ec52d25408ef"
-- 
2.7.4


