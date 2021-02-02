Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.48460.1612244058134667125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 1MXfnDp5y/Kb970h2LvhaXlBa1N2scU2gubWI1eBooD5ST1YYbIoB62F7nq+KTWJSU3+M1eaYj
 ahjfq1hqaM/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876915"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876915"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:32 -0800
IronPort-SDR: FUUG1+dPypPGPUF8xqR40rCZJ2/HewBFKN6Y2E1bMTQjcBgzX2w4IHvIWeNA4xFFhZNulE821+
 LMLas7xTooSA==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370360967"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:31 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 16/25] ca-certificates: upgrade 20200601 -> 20210119
Date: Tue,  2 Feb 2021 13:33:59 +0800
Message-Id: <5e86b849556e2801ec9124b5a4ad83180127b985.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>

0001-certdata2pem.py-use-python3.patch
removed since it is included in 20210119

(From OE-Core rev: afd86357e07f69090eaff4c5db2c517867dd4ccf)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3f1c05e14840ce0db9a8ca813dca0466520888d8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.29.2

