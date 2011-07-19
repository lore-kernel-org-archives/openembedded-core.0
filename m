Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QjDF8-0004tz-Ic
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 18:33:58 +0200
Received: from localhost.localdomain (c-71-236-175-18.hsd1.or.comcast.net
	[71.236.175.18])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id ADBD930536;
	Tue, 19 Jul 2011 12:29:48 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 09:29:40 -0700
Message-Id: <81fb23b56900bc440adcd99d67be36794b9d57fe.1311092892.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1311092892.git.scott.a.garman@intel.com>
References: <cover.1311092892.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1311092892.git.scott.a.garman@intel.com>
References: <cover.1311092892.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: ADBD930536.0DC04
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 1/2] libpng: upgrade to v1.2.46
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
X-List-Received-Date: Tue, 19 Jul 2011 16:33:58 -0000

This addresses the following security advisories:

* CVE-2011-2690
* CVE-2011-2692

This fixes bug [YOCTO #1255]

The LICENSE and png.h checksum changes were due to trivial changes
in the files.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../libpng/{libpng_1.2.44.bb => libpng_1.2.46.bb}  |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.2.44.bb => libpng_1.2.46.bb} (55%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.44.bb b/meta/recipes-multimedia/libpng/libpng_1.2.46.bb
similarity index 55%
rename from meta/recipes-multimedia/libpng/libpng_1.2.44.bb
rename to meta/recipes-multimedia/libpng/libpng_1.2.46.bb
index d81a5c1..57d9037 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.2.44.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.2.46.bb
@@ -1,16 +1,17 @@
+SUMMARY = "PNG Library"
 DESCRIPTION = "PNG Library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a294a2bb08b7f25558119edbfd6b2e92 \
-                    file://png.h;startline=172;endline=261;md5=3253923f0093658f470e52a06ddcf4e7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=21b4b6e3523afa9f03f00b43b991dad0 \
+                    file://png.h;startline=172;endline=261;md5=996460063a9bf2de35b2d61d2776dabc"
 DEPENDS = "zlib"
 PR = "r0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/libpng-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "e3ac7879d62ad166a6f0c7441390d12b"
-SRC_URI[sha256sum] = "b9ab20f1c2c3bf6c4448fd9bd8a4a8905b918114d5fada56c97bb758a17b7215"
+SRC_URI[md5sum] = "e8b43dc78ef95b3949af7f961d76874b"
+SRC_URI[sha256sum] = "a5e796e1802b2e221498bda09ff9850bc7ec9068b6788948cc2c42af213914d8"
 
 inherit autotools binconfig pkgconfig
 
-- 
1.7.1



