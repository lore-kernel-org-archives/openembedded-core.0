Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D70E36FEFE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 14:11:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9QEBWot002676
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 07:11:35 -0700 (PDT)
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 26 Oct 2017 07:11:31 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Oct 2017 17:11:30 +0300
Message-ID: <20171026141130.116905-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] git: bump version to 2.14.3
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
X-List-Received-Date: Thu, 26 Oct 2017 14:11:35 -0000
Content-Type: text/plain

Bump version to 2.14.3 in order to eliminate CVE-2017-14867 vulnerability.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2017-14867

Upstream patches:
https://github.com/git/git/commit/9a42c03cb71eaa9d41ba67275de38c997a791c32
https://github.com/git/git/commit/fce13af5d20cad8dcb2d0e47bcf01b6960f08e55
https://github.com/git/git/commit/27dd73871f814062737c327103ee43f1eb7f30d9
https://github.com/git/git/commit/46203ac24dc7e6b5a8d4f1b024ed93591705d47b
https://github.com/git/git/commit/5b4efea666951efe0770f8d5a301f8917015315f
https://github.com/git/git/commit/8d0fad0a7a6ba34fd706c148fa7ed1f8eb2b8b26

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-devtools/git/git_2.13.3.bb | 11 -----------
 meta/recipes-devtools/git/git_2.14.3.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.13.3.bb
 create mode 100644 meta/recipes-devtools/git/git_2.14.3.bb

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
diff --git a/meta/recipes-devtools/git/git_2.14.3.bb b/meta/recipes-devtools/git/git_2.14.3.bb
new file mode 100644
index 0000000..4628fc7
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.14.3.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "034a737e20a95194a5c274fff2333a67"
+SRC_URI[tarball.sha256sum] = "023ffff6d3ba8a1bea779dfecc0ed0bb4ad68ab8601d14435dd8c08416f78d7f"
+SRC_URI[manpages.md5sum] = "b0f9be472139b978954bd0e132f1db8a"
+SRC_URI[manpages.sha256sum] = "d64e10b6e3b351231e7a187af038d9c87e1225a5c90eeff8dece839a8d383ca6"
-- 
2.10.2


