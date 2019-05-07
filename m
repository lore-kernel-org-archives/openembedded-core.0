Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D0C177D076
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 13:11:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44z0PN3rfdz63
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 15:11:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557234712;
	bh=gvMNI/GZ1DeKHNj9zKw3xFR+hVbAWMRn24JEPkxO3q8=;
	h=From:To:Subject:Date:From;
	b=XE3YyCA5WFmUuu8iO/OeM/HD/wmRnP+JxvxjBnSHSKUFu8RrCzafJtte3daehG2aq
	MKY97Ut5+OljnFSoRRpKNrVMVz/a8Uzkq7mSK3mW9DsHd8qgSPFAgTMvXvLprlhVM3
	LWCmch4j46vtokd+WQYXNjmonc5SYBMQ7g8qXAwFIKK9M4WeQMtzXpvEnu37u89E01
	Z/LJwcXfbWt+p1eeMwP0RTG6+1FDt8+Gu57C/byJsd1IMuewhMFmmfXQCyV0pHmhmQ
	Zz2YLJjHaKten8lvUwKabfEkJFavf+gn5gvwjOnn+O6pzIqdSoUnKkM9vAFB+6VBD6
	SfgX262uCm5QxWjW6ksOW/k+9PoDH/9EoT7fFnl4YdsXn43s5nvbMcQLLFUKTMT3jU
	hjr1khWWncvi8BYOUnjg1HNIWoEI19o3SF3veXizbqN/Z2nY8QIn0BXy6atrkR4S3m
	7bGX2dE/88drZ6zqeojS7/klsYSqU7jopNB3zisOBzyvazcFc1dOwj04QmZb4G9aJ6
	CkTS8NfMqih0Ytem/Xv5MmcMwzT+i574/a51AQKS0CO1m9+nBGzV6vIV9HYm1fLSzV
	hasRH/zcF+arLzxkVo6p44gLdgmMCnKnACbuoXk2jSwDORte2J/dM3my60Owos36Kj
	btcP/lGaEI7ag52LnG1vA+5Q=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 16:11:42 +0300
Message-Id: <20190507131151.31070-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] ofono: upgrade 1.25 -> 1.29
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
X-List-Received-Date: Tue, 07 May 2019 13:11:52 -0000

Remove patch applied upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../ofono/ofono/use-python3.patch             | 27 -------------------
 meta/recipes-connectivity/ofono/ofono_1.25.bb |  9 -------
 meta/recipes-connectivity/ofono/ofono_1.29.bb |  8 ++++++
 3 files changed, 8 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/use-python3.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.25.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.29.bb

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
diff --git a/meta/recipes-connectivity/ofono/ofono_1.29.bb b/meta/recipes-connectivity/ofono/ofono_1.29.bb
new file mode 100644
index 0000000000..d026ae6f3b
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_1.29.bb
@@ -0,0 +1,8 @@
+require ofono.inc
+
+SRC_URI  = "\
+  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+  file://ofono \
+"
+SRC_URI[md5sum] = "4fa0372630ff03f223452e4d05efa8f8"
+SRC_URI[sha256sum] = "67f0f8e5740dea5b46309e40667d1e560be39c90ef08dd01ff9e9ce8e61f0679"
-- 
2.17.1


