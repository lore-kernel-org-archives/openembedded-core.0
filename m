Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 581CE6FFEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 09:44:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7M9imgU028497
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Aug 2016 02:44:48 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Aug 2016 02:44:47 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 22 Aug 2016 05:44:46 -0400
Message-ID: <1471859086-187906-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] libgcrypt: upgrade to 1.7.3
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
X-List-Received-Date: Mon, 22 Aug 2016 09:44:50 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.7.2.bb | 4 ----
 meta/recipes-support/libgcrypt/libgcrypt_1.7.3.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.2.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.3.bb

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.7.2.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.7.2.bb
deleted file mode 100644
index 8931d18..0000000
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.7.2.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require libgcrypt.inc
-
-SRC_URI[md5sum] = "b28de2eaf8fc0c916c76ab67be5a3790"
-SRC_URI[sha256sum] = "70c8e439420823505b39addbf51c469ef0df5a1372fa1d7d33ec9261079d08e2"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.7.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.7.3.bb
new file mode 100644
index 0000000..ddd7c53
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.7.3.bb
@@ -0,0 +1,4 @@
+require libgcrypt.inc
+
+SRC_URI[md5sum] = "bb5b00cb70b1215833857fd690080fbb"
+SRC_URI[sha256sum] = "c98470cf6a781f2af4bdfda710ad39f0f54b5044e8c43b878d4005737d6c213f"
-- 
2.8.1


