Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EDE5278D4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:25:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2018 04:25:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,214,1526367600"; d="scan'208";a="236737602"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 12 Jun 2018 04:25:59 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 49B93580116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 04:25:58 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 14:18:10 +0300
Message-Id: <1528802295-11278-7-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
References: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 07/12] libunistring: upgrade to 0.9.10
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
X-List-Received-Date: Tue, 12 Jun 2018 11:25:58 -0000

License-Update: Checksum changed due to updation in documentation. There
are no changes in the license terms.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libunistring/{libunistring_0.9.9.bb => libunistring_0.9.10.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libunistring/{libunistring_0.9.9.bb => libunistring_0.9.10.bb} (85%)

diff --git a/meta/recipes-support/libunistring/libunistring_0.9.9.bb b/meta/recipes-support/libunistring/libunistring_0.9.10.bb
similarity index 85%
rename from meta/recipes-support/libunistring/libunistring_0.9.9.bb
rename to meta/recipes-support/libunistring/libunistring_0.9.10.bb
index ab7cba5..97fac4e 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.9.bb
+++ b/meta/recipes-support/libunistring/libunistring_0.9.10.bb
@@ -16,15 +16,15 @@ SECTION = "devel"
 LICENSE = "LGPLv3+ | GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
                     file://README;beginline=45;endline=65;md5=08287d16ba8d839faed8d2dc14d7d6a5 \
-                    file://doc/libunistring.texi;md5=efb80a3799a60f95feaf80661d4f204c \
+                    file://doc/libunistring.texi;md5=287fa6075f78a3c85c1a52b0a92547cd \
                    "
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
            file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
 "
-SRC_URI[md5sum] = "4f689e37e4c3bd67de5786aa51d98b13"
-SRC_URI[sha256sum] = "f5e90c08f9e5427ca3a2c0c53f19aa38b25c500913510ad25afef86448bea84a"
+SRC_URI[md5sum] = "0d3274e9838396b12200f8b54ddaf43b"
+SRC_URI[sha256sum] = "a82e5b333339a88ea4608e4635479a1cfb2e01aafb925e1290b65710d43f610b"
 
 inherit autotools texinfo
 BBCLASSEXTEND = "native nativesdk"
-- 
2.4.0


