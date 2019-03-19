Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 753A67CB4F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 02:04:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,496,1544457600"; d="scan'208";a="57098549"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Mar 2019 10:04:04 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1EA204C8B6EC;
	Tue, 19 Mar 2019 10:03:33 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 19 Mar 2019 10:04:10 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2019 10:05:34 +0800
Message-ID: <20190319020534.17278-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 1EA204C8B6EC.A7C94
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] ofono: upgrade to 1.28
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
X-List-Received-Date: Tue, 19 Mar 2019 02:04:04 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

1.Upgrade ofono from 1.25 to 1.28.

2.use-python3.patch has been merged.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../ofono/ofono/use-python3.patch             | 27 -------------------
 meta/recipes-connectivity/ofono/ofono_1.25.bb |  9 -------
 meta/recipes-connectivity/ofono/ofono_1.28.bb |  8 ++++++
 3 files changed, 8 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/use-python3.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.25.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.28.bb

diff --git a/meta/recipes-connectivity/ofono/ofono/use-python3.patch b/meta/recipes-connectivity/ofono/ofono/use-python3.patch
deleted file mode 100644
index 7b84075257..0000000000
--- a/meta/recipes-connectivity/ofono/ofono/use-python3.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-set-ddr should use Python3 like all the other tests.
-
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 17b69cd1da4c5c5f732acb38ca1602446c567ee7 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 29 Jan 2018 11:31:25 +0000
-Subject: [PATCH] test/setddr: use Python 3
-
-All the other tests use Python 3, so this should to.
----
- test/set-ddr | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/set-ddr b/test/set-ddr
-index 5d061b95..33631f31 100755
---- a/test/set-ddr
-+++ b/test/set-ddr
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/python3
- 
- import sys
- import dbus
--- 
-2.11.0
diff --git a/meta/recipes-connectivity/ofono/ofono_1.25.bb b/meta/recipes-connectivity/ofono/ofono_1.25.bb
deleted file mode 100644
index 3688b9d2fc..0000000000
--- a/meta/recipes-connectivity/ofono/ofono_1.25.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ofono.inc
-
-SRC_URI  = "\
-  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-  file://ofono \
-  file://use-python3.patch \
-"
-SRC_URI[md5sum] = "31450cabdd8dbbf3f808ea2f2f066863"
-SRC_URI[sha256sum] = "eb011fcd3080e93f3a56f96be60350b6595a8b5f36b61646312ba41b0bcb0d75"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.28.bb b/meta/recipes-connectivity/ofono/ofono_1.28.bb
new file mode 100644
index 0000000000..48bf2d3edc
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_1.28.bb
@@ -0,0 +1,8 @@
+require ofono.inc
+
+SRC_URI  = "\
+  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+  file://ofono \
+"
+SRC_URI[md5sum] = "3a5406565b552b16602610619b034967"
+SRC_URI[sha256sum] = "93bb2cedef54f897dd5200e22b072a6e38b5d9b44be57eebbbe8d513f0beb0e4"
-- 
2.20.1




