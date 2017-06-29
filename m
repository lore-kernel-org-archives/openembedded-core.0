Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 27C226612D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 07:57:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5T7vGFZ015358
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 00:57:16 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 29 Jun 2017 00:57:15 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Jun 2017 03:57:12 -0400
Message-ID: <935b59af735ed9b3ece5bc41ff8d5dc0fe701bd4.1498722885.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498722885.git.dengke.du@windriver.com>
References: <cover.1498722885.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] expat: upgrade to 2.2.1
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
X-List-Received-Date: Thu, 29 Jun 2017 07:57:15 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-core/expat/expat_2.2.0.bb | 5 -----
 meta/recipes-core/expat/expat_2.2.1.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat_2.2.0.bb
 create mode 100644 meta/recipes-core/expat/expat_2.2.1.bb

diff --git a/meta/recipes-core/expat/expat_2.2.0.bb b/meta/recipes-core/expat/expat_2.2.0.bb
deleted file mode 100644
index ef21a111a4..0000000000
--- a/meta/recipes-core/expat/expat_2.2.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require expat.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=9c3ee559c6f9dcee1043ead112139f4f"
-
-SRC_URI[md5sum] = "2f47841c829facb346eb6e3fab5212e2"
-SRC_URI[sha256sum] = "d9e50ff2d19b3538bd2127902a89987474e1a4db8e43a66a4d1a712ab9a504ff"
diff --git a/meta/recipes-core/expat/expat_2.2.1.bb b/meta/recipes-core/expat/expat_2.2.1.bb
new file mode 100644
index 0000000000..47827c5576
--- /dev/null
+++ b/meta/recipes-core/expat/expat_2.2.1.bb
@@ -0,0 +1,5 @@
+require expat.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
+
+SRC_URI[md5sum] = "d9c3baeab58774cefc2f04faf29f2cf8"
+SRC_URI[sha256sum] = "1868cadae4c82a018e361e2b2091de103cd820aaacb0d6cfa49bd2cd83978885"
-- 
2.11.0


