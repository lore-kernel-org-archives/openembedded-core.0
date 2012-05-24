Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfua-0002yZ-5P
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125517"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:28 -0700
Message-Id: <6e2235a4d769b16ebf68d6bbed56d8bcc0e0c83f.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 17/32] libpng: upgrade to 1.2.49
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
X-List-Received-Date: Thu, 24 May 2012 21:49:37 -0000

License hasn't changed, just updated the md5 checksums due to trivial
date changes within the text (and the position of the license text
within png.h).

Addresses CVE-2011-3045

Fixes [YOCTO #2352]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libpng/{libpng_1.2.46.bb => libpng_1.2.49.bb}  |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
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
1.7.9.5



