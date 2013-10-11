Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 239BE6CF02
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:32 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506445"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:20 -0700
Message-Id: <e5050d0805560d920f4a93b8909548aa885eb969.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
References: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381505051.git.sgw@linux.intel.com>
References: <cover.1381505051.git.sgw@linux.intel.com>
Subject: [PATCH 14/18] libpng: Update to 1.6.6
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
X-List-Received-Date: Fri, 11 Oct 2013 15:27:32 -0000

License Checksum changed due to date updates in files and lines moving.

(From OE-Core rev: 14bcc9eeb486203d6c80ed414a92d00f0c52b9b7)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libpng/{libpng_1.6.3.bb => libpng_1.6.6.bb}                | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.3.bb => libpng_1.6.6.bb} (62%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.3.bb b/meta/recipes-multimedia/libpng/libpng_1.6.6.bb
similarity index 62%
rename from meta/recipes-multimedia/libpng/libpng_1.6.3.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.6.bb
index bf84b3c..376dd53 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.3.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.6.bb
@@ -3,16 +3,18 @@ DESCRIPTION = "PNG Library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6a42d0002ce5c11e4a529c29f78d13dd \
-                    file://png.h;beginline=207;endline=321;md5=de933190ded7f9d6c22110c8509ea85a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ebec5fb1db10234542f80fdd7117e25 \
+                    file://png.h;endline=15;md5=41143e20c803af0a376888699ce0980e \
+                    file://png.h;beginline=209;endline=323;md5=d30ef0b1dd12d869cb3c6bdb3678e5f4"
 DEPENDS = "zlib"
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz \
            file://0001-configure-lower-automake-requirement.patch \
           "
-SRC_URI[md5sum] = "9307f8ab04f4be3c1889ffb504f0fe5c"
-SRC_URI[sha256sum] = "c5ecc0d38663b944a828145ed59cf15dfbad2217512875bc05ecf9b92afa0f45"
+
+SRC_URI[md5sum] = "3a41dcd58bcac7cc191c2ec80c7fb2ac"
+SRC_URI[sha256sum] = "0407965a0057af7a9e4cefe27c062f517d9ad701cdfd20aa91afb6a84f214e70"
 
 inherit autotools binconfig pkgconfig
 
-- 
1.8.3.1


