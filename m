Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A78D6C199
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 01:56:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAF1uRgA010409
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 17:56:37 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 14 Nov 2018 17:56:16 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Nov 2018 10:02:31 +0800
Message-ID: <61202575a1c0b4be44534526dd22fc85c9dadfd2.1542247292.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1542247292.git.Qi.Chen@windriver.com>
References: <cover.1542247292.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] busybox: use example.org instead of google.com in wget test case
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
X-List-Received-Date: Thu, 15 Nov 2018 01:56:46 -0000
Content-Type: text/plain

Use example.org to ensure it's always reachible.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...e-use-www.example.org-for-wget-test-cases.patch | 62 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.29.2.bb        |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-testsuite-use-www.example.org-for-wget-test-cases.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-testsuite-use-www.example.org-for-wget-test-cases.patch b/meta/recipes-core/busybox/busybox/0001-testsuite-use-www.example.org-for-wget-test-cases.patch
new file mode 100644
index 0000000..7ba0f77
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-testsuite-use-www.example.org-for-wget-test-cases.patch
@@ -0,0 +1,62 @@
+From 03acf460990dfcf6e52b298301b348b9504460a8 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 13 Nov 2018 13:51:42 +0800
+Subject: [PATCH] testsuite: use www.example.org for wget test cases
+
+Use example.org instead of google.com to make sure it's
+always reachible.
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2018-November/086835.html]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ testsuite/wget/wget--O-overrides--P        | 2 +-
+ testsuite/wget/wget-handles-empty-path     | 2 +-
+ testsuite/wget/wget-retrieves-google-index | 2 +-
+ testsuite/wget/wget-supports--P            | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/testsuite/wget/wget--O-overrides--P b/testsuite/wget/wget--O-overrides--P
+index 40a3a96..490d743 100644
+--- a/testsuite/wget/wget--O-overrides--P
++++ b/testsuite/wget/wget--O-overrides--P
+@@ -1,5 +1,5 @@
+ test x"$SKIP_INTERNET_TESTS" != x"" && exit
+ 
+ mkdir foo
+-busybox wget -q -O index.html -P foo http://www.google.com/
++busybox wget -q -O index.html -P foo http://www.example.org/
+ test -s index.html
+diff --git a/testsuite/wget/wget-handles-empty-path b/testsuite/wget/wget-handles-empty-path
+index 01d60bd..1802db6 100644
+--- a/testsuite/wget/wget-handles-empty-path
++++ b/testsuite/wget/wget-handles-empty-path
+@@ -1,3 +1,3 @@
+ test x"$SKIP_INTERNET_TESTS" != x"" && exit
+ 
+-busybox wget http://www.google.com
++busybox wget http://www.example.org
+diff --git a/testsuite/wget/wget-retrieves-google-index b/testsuite/wget/wget-retrieves-google-index
+index f9dbb8b..fc801d4 100644
+--- a/testsuite/wget/wget-retrieves-google-index
++++ b/testsuite/wget/wget-retrieves-google-index
+@@ -1,4 +1,4 @@
+ test x"$SKIP_INTERNET_TESTS" != x"" && exit
+ 
+-busybox wget -q -O foo http://www.google.com/
++busybox wget -q -O foo http://www.example.org/
+ test -s foo
+diff --git a/testsuite/wget/wget-supports--P b/testsuite/wget/wget-supports--P
+index bfe4ac4..4ff2fe0 100644
+--- a/testsuite/wget/wget-supports--P
++++ b/testsuite/wget/wget-supports--P
+@@ -1,5 +1,5 @@
+ test x"$SKIP_INTERNET_TESTS" != x"" && exit
+ 
+ mkdir foo
+-busybox wget -q -P foo http://www.google.com/
++busybox wget -q -P foo http://www.example.org/
+ test -s foo/index.html
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/busybox/busybox_1.29.2.bb b/meta/recipes-core/busybox/busybox_1.29.2.bb
index a63fa82..98767f0 100644
--- a/meta/recipes-core/busybox/busybox_1.29.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.29.2.bb
@@ -42,6 +42,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://rcK \
            file://makefile-libbb-race.patch \
            file://0001-testsuite-check-uudecode-before-using-it.patch \
+           file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
1.9.1


