Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 24E11786EE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 11:51:52 +0000 (UTC)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2017 03:51:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,363,1508828400"; 
   d="scan'208";a="258861"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga008.fm.intel.com with ESMTP; 05 Dec 2017 03:51:53 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id F12BC5803D4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 03:51:52 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 13:51:46 +0200
Message-Id: <1512474706-9286-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1512474706-9286-1-git-send-email-maxin.john@intel.com>
References: <1512474706-9286-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/3] libunistring: upgrade to 0.9.8
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
X-List-Received-Date: Tue, 05 Dec 2017 11:51:52 -0000

Refreshed the following patch:
        iconv-m4-remove-the-test-to-convert-euc-jp.patch

No change in license as update in License Checksum is due
to change in Copyright years.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...conv-m4-remove-the-test-to-convert-euc-jp.patch | 56 ++++++++++++++--------
 ...libunistring_0.9.7.bb => libunistring_0.9.8.bb} |  6 +--
 2 files changed, 39 insertions(+), 23 deletions(-)
 rename meta/recipes-support/libunistring/{libunistring_0.9.7.bb => libunistring_0.9.8.bb} (85%)

diff --git a/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch b/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch
index d448916..9e8ce22 100644
--- a/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch
+++ b/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch
@@ -1,6 +1,6 @@
-From 8d99a368615656a835f5502326afd31cec2cebfe Mon Sep 17 00:00:00 2001
+From 30562065ba9e4c238e76100b5f9f0c5add0e635b Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
-Date: Mon, 16 Sep 2013 18:16:12 +0800
+Date: Tue, 5 Dec 2017 09:30:36 +0200
 Subject: [PATCH] remove the test to convert euc-jp
 
 Remove the test "Test against HP-UX 11.11 bug:
@@ -13,28 +13,44 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 ---
- gnulib-m4/iconv.m4 |   11 -----------
- 1 files changed, 0 insertions(+), 11 deletions(-)
+---
+ gnulib-m4/iconv.m4 | 23 -----------------------
+ 1 file changed, 23 deletions(-)
 
-Index: libunistring-0.9.4/gnulib-m4/iconv.m4
-===================================================================
---- libunistring-0.9.4.orig/gnulib-m4/iconv.m4	2014-11-03 17:41:29.755011917 +0000
-+++ libunistring-0.9.4/gnulib-m4/iconv.m4	2014-11-03 17:43:03.795014480 +0000
-@@ -159,17 +159,6 @@
+diff --git a/gnulib-m4/iconv.m4 b/gnulib-m4/iconv.m4
+index b33ecd0..73b6aa1 100644
+--- a/gnulib-m4/iconv.m4
++++ b/gnulib-m4/iconv.m4
+@@ -165,29 +165,6 @@ AC_DEFUN([AM_ICONV_LINK],
        }
    }
  #endif
 -  /* Test against HP-UX 11.11 bug: No converter from EUC-JP to UTF-8 is
 -     provided.  */
--  if (/* Try standardized names.  */
--      iconv_open ("UTF-8", "EUC-JP") == (iconv_t)(-1)
--      /* Try IRIX, OSF/1 names.  */
--      && iconv_open ("UTF-8", "eucJP") == (iconv_t)(-1)
--      /* Try AIX names.  */
--      && iconv_open ("UTF-8", "IBM-eucJP") == (iconv_t)(-1)
--      /* Try HP-UX names.  */
--      && iconv_open ("utf8", "eucJP") == (iconv_t)(-1))
--    result |= 16;
+-  {
+-    /* Try standardized names.  */
+-    iconv_t cd1 = iconv_open ("UTF-8", "EUC-JP");
+-    /* Try IRIX, OSF/1 names.  */
+-    iconv_t cd2 = iconv_open ("UTF-8", "eucJP");
+-    /* Try AIX names.  */
+-    iconv_t cd3 = iconv_open ("UTF-8", "IBM-eucJP");
+-    /* Try HP-UX names.  */
+-    iconv_t cd4 = iconv_open ("utf8", "eucJP");
+-    if (cd1 == (iconv_t)(-1) && cd2 == (iconv_t)(-1)
+-        && cd3 == (iconv_t)(-1) && cd4 == (iconv_t)(-1))
+-      result |= 16;
+-    if (cd1 != (iconv_t)(-1))
+-      iconv_close (cd1);
+-    if (cd2 != (iconv_t)(-1))
+-      iconv_close (cd2);
+-    if (cd3 != (iconv_t)(-1))
+-      iconv_close (cd3);
+-    if (cd4 != (iconv_t)(-1))
+-      iconv_close (cd4);
+-  }
    return result;
- }]])],
-         [am_cv_func_iconv_works=yes],
+ ]])],
+           [am_cv_func_iconv_works=yes], ,
+-- 
+2.4.0
+
diff --git a/meta/recipes-support/libunistring/libunistring_0.9.7.bb b/meta/recipes-support/libunistring/libunistring_0.9.8.bb
similarity index 85%
rename from meta/recipes-support/libunistring/libunistring_0.9.7.bb
rename to meta/recipes-support/libunistring/libunistring_0.9.8.bb
index f77a210..4000e54 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.7.bb
+++ b/meta/recipes-support/libunistring/libunistring_0.9.8.bb
@@ -16,15 +16,15 @@ SECTION = "devel"
 LICENSE = "LGPLv3+ | GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
                     file://README;beginline=45;endline=65;md5=08287d16ba8d839faed8d2dc14d7d6a5 \
-                    file://doc/libunistring.texi;md5=b86c9fd7acaac623017239640631912c \
+                    file://doc/libunistring.texi;md5=0db7ee008b43bde817ca41b69e691e44 \
                    "
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
            file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
 "
-SRC_URI[md5sum] = "8e663454aa372181ee8e46edaa3ba4c8"
-SRC_URI[sha256sum] = "9ce081cbee1951b55597b30e7030bda9d7b2f034ef901a135ff3a020be5a41e5"
+SRC_URI[md5sum] = "e255167c83d96defe159c3299737e72c"
+SRC_URI[sha256sum] = "b792f2bd05d0fa7b339e39e353da7232b2e514e0db2cf5ed95beeff3feb53cf5"
 
 inherit autotools texinfo
 BBCLASSEXTEND = "native nativesdk"
-- 
2.4.0


