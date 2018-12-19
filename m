Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 22C787BF28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 07:29:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2018 23:29:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,371,1539673200"; d="scan'208";a="119597363"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.21.206])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Dec 2018 23:29:36 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 15:29:26 +0800
Message-Id: <20181219072929.5870-6-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181219072929.5870-1-anuj.mittal@intel.com>
References: <20181219072929.5870-1-anuj.mittal@intel.com>
Subject: [PATCH 6/9] libpng: upgrade 1.6.35 -> 1.6.36
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
X-List-Received-Date: Wed, 19 Dec 2018 07:29:36 -0000

For changes, see:

https://sourceforge.net/p/libpng/code/ci/libpng16/tree/CHANGES

License-Update: Added authors to license, formatting, version changes,
export classification clarification and a new libpng2 license with
clarification:

The new libpng license comprises the terms and conditions from the zlib
license, and the disclaimer from the Boost license. The legacy libpng
license license, used until libpng-1.6.35, is appended to the
new license, following the precedent established in the Python Software
Foundation License version 2.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libpng/{libpng_1.6.35.bb => libpng_1.6.36.bb}         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.35.bb => libpng_1.6.36.bb} (74%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.35.bb b/meta/recipes-multimedia/libpng/libpng_1.6.36.bb
similarity index 74%
rename from meta/recipes-multimedia/libpng/libpng_1.6.35.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.36.bb
index 5ae0a91a74..3cf4f7249c 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.35.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.36.bb
@@ -2,16 +2,16 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4791381a76f106ac4699f6261c65ee29 \
-                    file://png.h;endline=144;md5=090ba5769782e8a1663a45fab1c2b36c \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=12b4ec50384c800bc568f519671b120c \
+                    file://png.h;endline=144;md5=15ae15f53376306868259924a9db4e05 \
                     "
 DEPENDS = "zlib"
 
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "678b7e696a62a193ed3503b04bf449d6"
-SRC_URI[sha256sum] = "23912ec8c9584917ed9b09c5023465d71709dce089be503c7867fec68a93bcd7"
+SRC_URI[md5sum] = "df2be2d29c40937fe1f5349b16bc2826"
+SRC_URI[sha256sum] = "eceb924c1fa6b79172fdfd008d335f0e59172a86a66481e09d4089df872aa319"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}/"
 
-- 
2.17.1


