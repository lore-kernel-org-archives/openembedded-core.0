Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.22317.1611828356815510869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 02:06:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; 
   d="scan'208";a="103938212"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Jan 2021 18:06:01 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id CD2CD4CE678B
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 18:05:58 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 28 Jan 2021 18:05:55 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] ca-certificates: upgrade 20200601 -> 20210119
Date: Thu, 28 Jan 2021 18:05:52 +0800
Message-ID: <1611828352-7553-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: CD2CD4CE678B.AC4E7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-certdata2pem.py-use-python3.patch
removed since it is included in 20210119

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../0001-certdata2pem.py-use-python3.patch    | 37 -------------------
 ...0200601.bb => ca-certificates_20210119.bb} |  3 +-
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-certdata2pem.py-use-python3.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20200601.bb => ca-certificates_20210119.bb} (96%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-certdata2pem.py-use-python3.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-certdata2pem.py-use-python3.patch
deleted file mode 100644
index aa2c85ff43..0000000000
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-certdata2pem.py-use-python3.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b6d18ca77f131cdcaa10d0eaa9d303399767edf6 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 28 Aug 2019 19:18:14 +0200
-Subject: [PATCH] certdata2pem.py: use python3
-
-Comments in that file imply it is already py3 compatible.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- mozilla/Makefile        | 2 +-
- mozilla/certdata2pem.py | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/mozilla/Makefile b/mozilla/Makefile
-index 6f46118..f98877c 100644
---- a/mozilla/Makefile
-+++ b/mozilla/Makefile
-@@ -3,7 +3,7 @@
- #
- 
- all:
--	python certdata2pem.py
-+	python3 certdata2pem.py
- 
- clean:
- 	-rm -f *.crt
-diff --git a/mozilla/certdata2pem.py b/mozilla/certdata2pem.py
-index 0b02b2a..7d796f1 100644
---- a/mozilla/certdata2pem.py
-+++ b/mozilla/certdata2pem.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/python3
- # vim:set et sw=4:
- #
- # certdata2pem.py - splits certdata.txt into multiple files
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20200601.bb b/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
similarity index 96%
rename from meta/recipes-support/ca-certificates/ca-certificates_20200601.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
index 6f39df7985..888a235c1a 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20200601.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
@@ -14,7 +14,7 @@ DEPENDS_class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRCREV = "b3a8980b781bc9a370e42714a605cd4191bb6c0b"
+SRCREV = "181be7ebd169b4a6fb5d90c3e6dc791e90534144"
 
 SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
@@ -23,7 +23,6 @@ SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
            file://default-sysroot.patch \
            file://sbindir.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
-           file://0001-certdata2pem.py-use-python3.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+)"
 
-- 
2.25.1



