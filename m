Return-Path: <maxin.john@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id C920978849
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 08:38:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2018 00:38:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,430,1515484800"; d="scan'208";a="22318177"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga008.fm.intel.com with ESMTP; 06 Mar 2018 00:38:47 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id EB95658042F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 00:38:46 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2018 10:41:55 +0200
Message-Id: <1520325716-19589-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] libunistring: update version to 0.9.9
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
X-List-Received-Date: Tue, 06 Mar 2018 08:38:46 -0000

License-Update: checksum change is due to bump in copyright year
to 2018.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libunistring/{libunistring_0.9.8.bb => libunistring_0.9.9.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libunistring/{libunistring_0.9.8.bb => libunistring_0.9.9.bb} (85%)

diff --git a/meta/recipes-support/libunistring/libunistring_0.9.8.bb b/meta/recipes-support/libunistring/libunistring_0.9.9.bb
similarity index 85%
rename from meta/recipes-support/libunistring/libunistring_0.9.8.bb
rename to meta/recipes-support/libunistring/libunistring_0.9.9.bb
index 4000e54..ab7cba5 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.8.bb
+++ b/meta/recipes-support/libunistring/libunistring_0.9.9.bb
@@ -16,15 +16,15 @@ SECTION = "devel"
 LICENSE = "LGPLv3+ | GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
                     file://README;beginline=45;endline=65;md5=08287d16ba8d839faed8d2dc14d7d6a5 \
-                    file://doc/libunistring.texi;md5=0db7ee008b43bde817ca41b69e691e44 \
+                    file://doc/libunistring.texi;md5=efb80a3799a60f95feaf80661d4f204c \
                    "
 
 SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
            file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
 "
-SRC_URI[md5sum] = "e255167c83d96defe159c3299737e72c"
-SRC_URI[sha256sum] = "b792f2bd05d0fa7b339e39e353da7232b2e514e0db2cf5ed95beeff3feb53cf5"
+SRC_URI[md5sum] = "4f689e37e4c3bd67de5786aa51d98b13"
+SRC_URI[sha256sum] = "f5e90c08f9e5427ca3a2c0c53f19aa38b25c500913510ad25afef86448bea84a"
 
 inherit autotools texinfo
 BBCLASSEXTEND = "native nativesdk"
-- 
2.4.0


