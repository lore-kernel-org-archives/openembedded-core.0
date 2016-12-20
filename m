Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 648BA600E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 05:12:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14081814"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Dec 2016 13:12:34 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 572314670074
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 13:12:29 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.109) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 20 Dec 2016 13:12:28 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Dec 2016 13:12:11 +0800
Message-ID: <1482210731-2668-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.109]
X-yoursite-MailScanner-ID: 572314670074.A2C47
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] shared-mime-info 1.6 -> 1.8
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
X-List-Received-Date: Tue, 20 Dec 2016 05:12:42 -0000
Content-Type: text/plain

Upgrade shared-mime-info from 1.6 to 1.8

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info_1.6.bb | 7 -------
 meta/recipes-support/shared-mime-info/shared-mime-info_1.8.bb | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_1.6.bb
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_1.8.bb

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.6.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.6.bb
deleted file mode 100644
index 2cf5041..0000000
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_1.6.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require shared-mime-info.inc
-
-SRC_URI += "file://parallelmake.patch \
-	    file://install-data-hook.patch"
-
-SRC_URI[md5sum] = "10abc5c4e6b22223ff05c3bd70ff9e8f"
-SRC_URI[sha256sum] = "b2f8f85b6467933824180d0252bbcaee523f550a8fbc95cc4391bd43c03bc34c"
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_1.8.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_1.8.bb
new file mode 100644
index 0000000..849d999
--- /dev/null
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_1.8.bb
@@ -0,0 +1,7 @@
+require shared-mime-info.inc
+
+SRC_URI += "file://parallelmake.patch \
+	    file://install-data-hook.patch"
+
+SRC_URI[md5sum] = "f6dcadce764605552fc956563efa058c"
+SRC_URI[sha256sum] = "2af55ef1a0319805b74ab40d331a3962c905477d76c086f49e34dc96363589e9"
-- 
2.7.4




