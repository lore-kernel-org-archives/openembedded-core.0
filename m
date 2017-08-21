Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 59755782D6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 08:00:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7L80gxL019069
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 01:00:42 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 01:00:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 01:00:37 -0700
Message-ID: <51a56838a07856d0f3032ec161a11e0f227e1eed.1503302375.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1503302375.git.liezhi.yang@windriver.com>
References: <cover.1503302375.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] git: 2.13.2 -> 2.13.3
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
X-List-Received-Date: Mon, 21 Aug 2017 08:00:41 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git_2.13.2.bb | 11 -----------
 meta/recipes-devtools/git/git_2.13.3.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.13.2.bb
 create mode 100644 meta/recipes-devtools/git/git_2.13.3.bb

diff --git a/meta/recipes-devtools/git/git_2.13.2.bb b/meta/recipes-devtools/git/git_2.13.2.bb
deleted file mode 100644
index e7cae40..0000000
--- a/meta/recipes-devtools/git/git_2.13.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "894583cddfb0ec3b0156484966f9db9c"
-SRC_URI[tarball.sha256sum] = "e19d450648d6d100eb93abaa5d06ffbc778394fb502354b7026d73e9bcbc3160"
-SRC_URI[manpages.md5sum] = "97384d23f2ee88d5ce51ffc75096bd3e"
-SRC_URI[manpages.sha256sum] = "1c2bd0a2340b2ef118b7b167a8fec6cc05eb18cad9043e6e7a95fd8a70bb8c4c"
diff --git a/meta/recipes-devtools/git/git_2.13.3.bb b/meta/recipes-devtools/git/git_2.13.3.bb
new file mode 100644
index 0000000..b3e3887
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.13.3.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "d2dc550f6693ba7e5b16212b2714f59f"
+SRC_URI[tarball.sha256sum] = "1497001772f630d49809e981672edfe3e3ce1a1d18e905cd539c4d2f4dbcd75a"
+SRC_URI[manpages.md5sum] = "3037d11a4f4cdd19435871c267ca48b4"
+SRC_URI[manpages.sha256sum] = "f9b302eeb08ce08934e7afb42280ce9294411fbf5f7b6ac3fcc236e8031f10c5"
-- 
2.10.2


