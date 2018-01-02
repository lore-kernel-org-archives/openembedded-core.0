Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2124B71957
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 12:40:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2018 04:40:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,497,1508828400"; 
   d="scan'208";a="6843537"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga008.fm.intel.com with ESMTP; 02 Jan 2018 04:40:53 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 853C95802D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 04:40:52 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jan 2018 14:41:44 +0200
Message-Id: <1514896905-36107-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1514896905-36107-1-git-send-email-maxin.john@intel.com>
References: <1514896905-36107-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/4] libjpeg-turbo: upgrade to 1.5.3
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
X-List-Received-Date: Tue, 02 Jan 2018 12:40:52 -0000

1.5.2 -> 1.5.3

No change in license. Updates in License Checksums are due to change
in Copyright years.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../jpeg/{libjpeg-turbo_1.5.2.bb => libjpeg-turbo_1.5.3.bb}       | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_1.5.2.bb => libjpeg-turbo_1.5.3.bb} (87%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.2.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
similarity index 87%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.2.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
index 58646d3..8809f2c 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.2.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
@@ -3,17 +3,17 @@ DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructi
 HOMEPAGE = "http://libjpeg-turbo.org/"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=13;md5=05bab7c7ad899d85bfba60da1a1271f2 \
+LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=13;md5=8184bcc7c4ac7b9edc6a7bc00f231d0b \
                     file://jpeglib.h;endline=16;md5=f67d70e547a2662c079781c72f877f72 \
-                    file://djpeg.c;endline=11;md5=b90b6d2b4119f9e5807cd273f525d2af \
+                    file://djpeg.c;endline=11;md5=c59e19811c006cb38f82d6477134d314 \
 "
 DEPENDS_append_x86-64_class-target = " nasm-native"
 DEPENDS_append_x86_class-target    = " nasm-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "6b4923e297a7eaa255f08511017a8818"
-SRC_URI[sha256sum] = "9098943b270388727ae61de82adec73cf9f0dbb240b3bc8b172595ebf405b528"
+SRC_URI[md5sum] = "7c82f0f6a3130ec06b8a4d0b321cbca3"
+SRC_URI[sha256sum] = "b24890e2bb46e12e72a79f7e965f409f4e16466d00e1dd15d93d73ee6b592523"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.4.0


