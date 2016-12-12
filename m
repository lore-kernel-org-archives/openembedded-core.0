Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 919186069D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 15:15:13 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 12 Dec 2016 07:15:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,337,1477983600"; d="scan'208";a="41674262"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 12 Dec 2016 07:15:14 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id CA7516A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 07:14:27 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 17:16:22 +0200
Message-Id: <1481555783-3130-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] libunistring: Update version 0.9.6 -> 0.9.7
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
X-List-Received-Date: Mon, 12 Dec 2016 15:15:13 -0000

The license has changed from LGPLv3+ to "LGPLv3+ or GPLv2"
        * README (Copyright): Rewrite section
        * doc/libunistring.texi (Licenses): Change accordingly

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../{libunistring_0.9.6.bb => libunistring_0.9.7.bb}         | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libunistring/{libunistring_0.9.6.bb => libunistring_0.9.7.bb} (70%)

diff --git a/meta/recipes-support/libunistring/libunistring_0.9.6.bb b/meta/recipes-support/libunistring/libunistring_0.9.7.bb
similarity index 70%
rename from meta/recipes-support/libunistring/libunistring_0.9.6.bb
rename to meta/recipes-support/libunistring/libunistring_0.9.7.bb
index bb70122..f77a210 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.6.bb
+++ b/meta/recipes-support/libunistring/libunistring_0.9.7.bb
@@ -13,16 +13,18 @@ DESCRIPTION = "Text files are nowadays usually encoded in Unicode, and may\
 
 HOMEPAGE = "http://www.gnu.org/software/libunistring/"
 SECTION = "devel"
-LICENSE = "GPLv3 & LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
+LICENSE = "LGPLv3+ | GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+                    file://README;beginline=45;endline=65;md5=08287d16ba8d839faed8d2dc14d7d6a5 \
+                    file://doc/libunistring.texi;md5=b86c9fd7acaac623017239640631912c \
+                   "
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
            file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
 "
-SRC_URI[md5sum] = "dfae4ff5583649ed24d8f368f1d0543b"
-SRC_URI[sha256sum] = "9625eec2507f4789ebb6fc48ebda98be0e0168979a2f68aa8b680bf8eeabbd47"
+SRC_URI[md5sum] = "8e663454aa372181ee8e46edaa3ba4c8"
+SRC_URI[sha256sum] = "9ce081cbee1951b55597b30e7030bda9d7b2f034ef901a135ff3a020be5a41e5"
 
 inherit autotools texinfo
 BBCLASSEXTEND = "native nativesdk"
-- 
2.4.0


