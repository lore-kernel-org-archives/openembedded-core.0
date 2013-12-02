Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6D60B6DC32
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 10:07:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB2A7qPM023628
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Dec 2013 02:07:52 -0800 (PST)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 2 Dec 2013 02:07:52 -0800
From: <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Dec 2013 18:07:43 +0800
Message-ID: <1385978863-14243-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] lttng-ust: fixed python interpret path
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
X-List-Received-Date: Mon, 02 Dec 2013 10:07:54 -0000
Content-Type: text/plain

From: Chong Lu <Chong.Lu@windriver.com>

Changed python interpreter path to avoid syntax errors caused by
older version.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 ...002-lttng-ust-fixed-python-interpret-path.patch |   28 ++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb       |    1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/0002-lttng-ust-fixed-python-interpret-path.patch

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0002-lttng-ust-fixed-python-interpret-path.patch b/meta/recipes-kernel/lttng/lttng-ust/0002-lttng-ust-fixed-python-interpret-path.patch
new file mode 100644
index 0000000..abc2c4e
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/0002-lttng-ust-fixed-python-interpret-path.patch
@@ -0,0 +1,28 @@
+From d91876870f7cda8f9bf757c73d1c287e78d4d7e0 Mon Sep 17 00:00:00 2001
+From: Lu Chong <Chong.Lu@windriver.com>
+Date: Mon, 2 Dec 2013 03:18:13 -0500
+Subject: [PATCH 2/2] lttng-ust: fixed python interpret path
+
+Upstream-Status: Pending
+
+Changed python interpreter path to avoid syntax errors caused by
+older version.
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ tools/lttng-gen-tp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/lttng-gen-tp b/tools/lttng-gen-tp
+index 0f6f0b5..dca2e28 100755
+--- a/tools/lttng-gen-tp
++++ b/tools/lttng-gen-tp
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python
+ #
+ # Copyright (c)  2012 Yannick Brosseau <yannick.brosseau@gmail.com>
+ #
+-- 
+1.8.2.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
index cdc834c..ae2dd65 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
@@ -24,6 +24,7 @@ PE = "2"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git \
            file://0001-lttng-ust-several-fixes.patch \
+           file://0002-lttng-ust-fixed-python-interpret-path.patch \
 	   "
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


