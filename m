Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0DDE97725A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 13:55:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 11 Aug 2016 06:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,505,1464678000"; d="scan'208";a="863720847"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 11 Aug 2016 06:55:46 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 42C2C6A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 06:55:31 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:56:44 +0300
Message-Id: <1470923804-25804-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1470923804-25804-1-git-send-email-maxin.john@intel.com>
References: <1470923804-25804-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/3] libpng: update 1.6.23 -> 1.6.24
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
X-List-Received-Date: Thu, 11 Aug 2016 13:55:57 -0000

Updates in License files are due to changes in Copyright date
and Version.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libpng/{libpng_1.6.23.bb => libpng_1.6.24.bb}                 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.23.bb => libpng_1.6.24.bb} (66%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.23.bb b/meta/recipes-multimedia/libpng/libpng_1.6.24.bb
similarity index 66%
rename from meta/recipes-multimedia/libpng/libpng_1.6.23.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.24.bb
index b2813e3..9812a2e 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.23.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.24.bb
@@ -2,14 +2,14 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a92bbf77565352659482e381075d19e3 \
-                    file://png.h;endline=149;md5=a0e24b62532fff585d25f060dd917236"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5089214833586ba444048fd1dbbc76a4 \
+                    file://png.h;endline=149;md5=376d8ff7f69b7c4ad3a09f4672cec696"
 DEPENDS = "zlib"
 
 SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz \
           "
-SRC_URI[md5sum] = "9b320a05ed4db1f3f0865c8a951fd9aa"
-SRC_URI[sha256sum] = "6d921e7bdaec56e9f6594463ec1fe1981c3cd2d5fc925d3781e219b5349262f1"
+SRC_URI[md5sum] = "ffcdbd549814787fa8010c372e35ff25"
+SRC_URI[sha256sum] = "7932dc9e5e45d55ece9d204e90196bbb5f2c82741ccb0f7e10d07d364a6fd6dd"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-- 
2.4.0


