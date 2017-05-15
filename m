Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id F0BEB71C14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 11:35:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18859159"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 May 2017 19:35:38 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5005147E64CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 19:35:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.100) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Mon, 15 May 2017 19:35:41 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 May 2017 19:34:29 +0800
Message-ID: <1494848069-15504-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.100]
X-yoursite-MailScanner-ID: 5005147E64CC.A5C79
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libx11: 1.6.4 -> 1.6.5
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
X-List-Received-Date: Mon, 15 May 2017 11:35:46 -0000
Content-Type: text/plain

Upgrade libx11 from 1.6.4 to 1.6.5
---
 meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb | 10 ----------
 meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb
deleted file mode 100644
index caa95fb..0000000
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require libx11.inc
-inherit gettext
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI += "file://disable_tests.patch \
-           "
-
-SRC_URI[md5sum] = "6d54227082f3aa2c596f0b3a3fbb9175"
-SRC_URI[sha256sum] = "b7c748be3aa16ec2cbd81edc847e9b6ee03f88143ab270fb59f58a044d34e441"
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
new file mode 100644
index 0000000..71cbf67
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
@@ -0,0 +1,10 @@
+require libx11.inc
+inherit gettext
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI += "file://disable_tests.patch \
+           "
+
+SRC_URI[md5sum] = "0f618db70c4054ca67cee0cc156a4255"
+SRC_URI[sha256sum] = "4d3890db2ba225ba8c55ca63c6409c1ebb078a2806de59fb16342768ae63435d"
-- 
2.7.4




