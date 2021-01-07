Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.5909.1610010287796308141
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 01:04:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,329,1602518400"; 
   d="scan'208";a="103271685"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 07 Jan 2021 17:04:30 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 129C848990D2
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Jan 2021 17:04:25 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 7 Jan 2021 17:04:24 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] nettle: upgrade 3.6 ->3.7
Date: Thu, 7 Jan 2021 17:04:21 +0800
Message-ID: <1610010261-4742-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 129C848990D2.A195F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../Add-target-to-only-build-tests-not-run-them.patch         | 0
 .../check-header-files-of-openssl-only-if-enable_.patch       | 0
 .../nettle/{nettle-3.6 => nettle-3.7}/dlopen-test.patch       | 0
 .../nettle/{nettle-3.6 => nettle-3.7}/run-ptest               | 0
 meta/recipes-support/nettle/{nettle_3.6.bb => nettle_3.7.bb}  | 4 ++--
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nettle/{nettle-3.6 => nettle-3.7}/Add-target-to-only-build-tests-not-run-them.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.6 => nettle-3.7}/check-header-files-of-openssl-only-if-enable_.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.6 => nettle-3.7}/dlopen-test.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.6 => nettle-3.7}/run-ptest (100%)
 rename meta/recipes-support/nettle/{nettle_3.6.bb => nettle_3.7.bb} (92%)

diff --git a/meta/recipes-support/nettle/nettle-3.6/Add-target-to-only-build-tests-not-run-them.patch b/meta/recipes-support/nettle/nettle-3.7/Add-target-to-only-build-tests-not-run-them.patch
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.6/Add-target-to-only-build-tests-not-run-them.patch
rename to meta/recipes-support/nettle/nettle-3.7/Add-target-to-only-build-tests-not-run-them.patch
diff --git a/meta/recipes-support/nettle/nettle-3.6/check-header-files-of-openssl-only-if-enable_.patch b/meta/recipes-support/nettle/nettle-3.7/check-header-files-of-openssl-only-if-enable_.patch
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.6/check-header-files-of-openssl-only-if-enable_.patch
rename to meta/recipes-support/nettle/nettle-3.7/check-header-files-of-openssl-only-if-enable_.patch
diff --git a/meta/recipes-support/nettle/nettle-3.6/dlopen-test.patch b/meta/recipes-support/nettle/nettle-3.7/dlopen-test.patch
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.6/dlopen-test.patch
rename to meta/recipes-support/nettle/nettle-3.7/dlopen-test.patch
diff --git a/meta/recipes-support/nettle/nettle-3.6/run-ptest b/meta/recipes-support/nettle/nettle-3.7/run-ptest
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.6/run-ptest
rename to meta/recipes-support/nettle/nettle-3.7/run-ptest
diff --git a/meta/recipes-support/nettle/nettle_3.6.bb b/meta/recipes-support/nettle/nettle_3.7.bb
similarity index 92%
rename from meta/recipes-support/nettle/nettle_3.6.bb
rename to meta/recipes-support/nettle/nettle_3.7.bb
index 7c1b1a2d5c..e10937b4f1 100644
--- a/meta/recipes-support/nettle/nettle_3.6.bb
+++ b/meta/recipes-support/nettle/nettle_3.7.bb
@@ -23,8 +23,8 @@ SRC_URI_append_class-target = "\
             file://dlopen-test.patch \
             "
 
-SRC_URI[md5sum] = "c45ee24ed7361dcda152a035d396fe8a"
-SRC_URI[sha256sum] = "d24c0d0f2abffbc8f4f34dcf114b0f131ec3774895f3555922fe2f40f3d5e3f1"
+SRC_URI[md5sum] = "568070f62fd14ca6b076ad583d84e9db"
+SRC_URI[sha256sum] = "f001f64eb444bf13dd91bceccbc20acbc60c4311d6e2b20878452eb9a9cec75a"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1



