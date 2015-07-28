Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8BE13763F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 19:11:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6SJBE6I020817
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 12:11:14 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 28 Jul 2015 12:10:58 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jul 2015 12:11:14 -0700
Message-ID: <1438110674-25138-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] nss: advance to version 3.19.1
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
X-List-Received-Date: Tue, 28 Jul 2015 19:11:15 -0000
Content-Type: text/plain

Picks up fixes for CVE-2015-2721 and CVE-2015-2730.  Specify previously
overlooked license file COPYING.  Do not modify nss.inc.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-support/nss/nss_3.17.3.bb |    7 -------
 meta/recipes-support/nss/nss_3.19.1.bb |   17 +++++++++++++++++
 2 files changed, 17 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-support/nss/nss_3.17.3.bb
 create mode 100644 meta/recipes-support/nss/nss_3.19.1.bb

diff --git a/meta/recipes-support/nss/nss_3.17.3.bb b/meta/recipes-support/nss/nss_3.17.3.bb
deleted file mode 100644
index e7d0780..0000000
--- a/meta/recipes-support/nss/nss_3.17.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require nss.inc
-
-SRC_URI += "\
-    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_17_3_RTM/src/${BP}.tar.gz \
-"
-SRC_URI[md5sum] = "fba7489e1b26f2a0bfe5527430fd61e1"
-SRC_URI[sha256sum] = "f4d5e9035a2f84f25f35c283de3b0ff60d72e918748de25eaf017ed201fa21d5"
diff --git a/meta/recipes-support/nss/nss_3.19.1.bb b/meta/recipes-support/nss/nss_3.19.1.bb
new file mode 100644
index 0000000..f4059c4
--- /dev/null
+++ b/meta/recipes-support/nss/nss_3.19.1.bb
@@ -0,0 +1,17 @@
+require nss.inc
+
+SRC_URI += "\
+    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_19_1_RTM/src/${BP}.tar.gz \
+"
+
+SRC_URI[md5sum] = "68a9c01c987b9bd92066b4e0041f3e58"
+SRC_URI[sha256sum] = "b7be709551ec13206d8e3e8c065b894fa981c11573115e9478fa051029c52fff"
+
+#SRC_URI[md5sum] = "fba7489e1b26f2a0bfe5527430fd61e1"
+#SRC_URI[sha256sum] = "f4d5e9035a2f84f25f35c283de3b0ff60d72e918748de25eaf017ed201fa21d5"
+
+# override value in nss.inc
+#
+LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
+                    file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
+                    file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
-- 
1.7.9.5


