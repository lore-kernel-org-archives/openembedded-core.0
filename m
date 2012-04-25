Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SMugt-0006em-8q
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 07:22:59 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 686C42FF60
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2012 01:13:19 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Apr 2012 22:13:12 -0700
Message-Id: <470ee58fe3b926871f0f5f41460724535ac24f6c.1335330662.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1335330662.git.scott.a.garman@intel.com>
References: <cover.1335330662.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1335330662.git.scott.a.garman@intel.com>
References: <cover.1335330662.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 686C42FF60.9E43E
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/2] libpng: upgrade to 1.2.49
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Apr 2012 05:23:00 -0000

License hasn't changed, just updated the md5 checksums due to trivial
date changes within the text (and the position of the license text
within png.h).

Addresses CVE-2011-3045

Fixes [YOCTO #2352]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../libpng/{libpng_1.2.46.bb => libpng_1.2.49.bb}  |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.2.46.bb => libpng_1.2.49.bb} (60%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.46.bb b/meta/recipes-multimedia/libpng/libpng_1.2.49.bb
similarity index 60%
rename from meta/recipes-multimedia/libpng/libpng_1.2.46.bb
rename to meta/recipes-multimedia/libpng/libpng_1.2.49.bb
index 142f2b9..c24e691 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.2.46.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.2.49.bb
@@ -3,15 +3,15 @@ DESCRIPTION = "PNG Library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=21b4b6e3523afa9f03f00b43b991dad0 \
-                    file://png.h;startline=172;endline=261;md5=996460063a9bf2de35b2d61d2776dabc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=20110633230abd47fe8680afa75f1492 \
+                    file://png.h;startline=308;endline=422;md5=edd1c552386a8c3773d90e278ae30891"
 DEPENDS = "zlib"
-PR = "r4"
+PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "e8b43dc78ef95b3949af7f961d76874b"
-SRC_URI[sha256sum] = "a5e796e1802b2e221498bda09ff9850bc7ec9068b6788948cc2c42af213914d8"
+SRC_URI[md5sum] = "d5106b70b4f8b464a7da66bffe4565fb"
+SRC_URI[sha256sum] = "fbf8faa70ebca2ed2ee6df6f2249f4722517b581af5b6c3c71bbdaf925d5954e"
 
 inherit autotools binconfig pkgconfig
 
-- 
1.7.5.4



