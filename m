Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB9978998
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 09:32:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="43166955"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2018 17:32:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 64DD04B6AE02
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 17:32:25 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 7 Aug 2018 17:32:26 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Aug 2018 17:31:48 +0800
Message-ID: <20180807093148.17801-5-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180807093148.17801-1-hongl.fnst@cn.fujitsu.com>
References: <20180807093148.17801-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 64DD04B6AE02.AFECB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] icu:61.1 -> 62.1
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
X-List-Received-Date: Tue, 07 Aug 2018 09:32:35 -0000
Content-Type: text/plain

1.Upgrade icu from 61.1 to 62.1.

2.0001-i18n-Drop-include-xlocale.h.patch has been merged.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../icu/icu/0001-i18n-Drop-include-xlocale.h.patch | 34 ----------------------
 .../icu/{icu_61.1.bb => icu_62.1.bb}               |  5 ++--
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch
 rename meta/recipes-support/icu/{icu_61.1.bb => icu_62.1.bb} (80%)

diff --git a/meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch b/meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch
deleted file mode 100644
index f0c49e1..0000000
--- a/meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d6b57c1b4eb9a24d9d95342a961c93946539c93b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 24 Jun 2017 22:52:40 -0700
-Subject: [PATCH 3/4] i18n: Drop include <xlocale.h>
-
-glibc 2.26 drops this header
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- source/i18n/digitlst.cpp | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/source/i18n/digitlst.cpp b/source/i18n/digitlst.cpp
-index 8e86fa7..0bdbb2c 100644
---- a/i18n/digitlst.cpp
-+++ b/i18n/digitlst.cpp
-@@ -62,11 +62,7 @@
- #endif
- 
- #if U_USE_STRTOD_L
--# if U_HAVE_XLOCALE_H
--#   include <xlocale.h>
--# else
--#   include <locale.h>
--# endif
-+# include <locale.h>
- #endif
- 
- // ***************************************************************************
--- 
-2.14.2
-
diff --git a/meta/recipes-support/icu/icu_61.1.bb b/meta/recipes-support/icu/icu_62.1.bb
similarity index 80%
rename from meta/recipes-support/icu/icu_61.1.bb
rename to meta/recipes-support/icu/icu_62.1.bb
index ffaf350..ec9db7d 100644
--- a/meta/recipes-support/icu/icu_61.1.bb
+++ b/meta/recipes-support/icu/icu_62.1.bb
@@ -16,14 +16,13 @@ BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
-           file://0001-i18n-Drop-include-xlocale.h.patch \
            "
 
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "68fe38999fef94d622bd6843d43c0615"
-SRC_URI[sha256sum] = "d007f89ae8a2543a53525c74359b65b36412fa84b3349f1400be6dcf409fafef"
+SRC_URI[md5sum] = "490ad9d920158e0314e10ba74ae9a150"
+SRC_URI[sha256sum] = "3dd9868d666350dda66a6e305eecde9d479fb70b30d5b55d78a1deffb97d5aa3"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
-- 
2.7.4




