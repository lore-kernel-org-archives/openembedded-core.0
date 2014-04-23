Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id E457965D68
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 12:41:47 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 23 Apr 2014 14:41:42 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 5656828C69A;
	Wed, 23 Apr 2014 14:41:42 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Apr 2014 14:41:39 +0200
Message-ID: <1398256899-42023-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] libpng: bump to 1.6.10
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
X-List-Received-Date: Wed, 23 Apr 2014 12:41:51 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

1. Fixes CVE-2014-0333
2. There are changes in License checksums. This is due to new
   contributor names being added to LICENSE and png.h file
   contains version of the new release.So, license remains the same.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 .../libpng/{libpng_1.6.8.bb => libpng_1.6.10.bb}             |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.8.bb => libpng_1.6.10.bb} (61%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.8.bb b/meta/recipes-multimedia/libpng/libpng_1.6.10.bb
similarity index 61%
rename from meta/recipes-multimedia/libpng/libpng_1.6.8.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.10.bb
index d063495..0f514f8 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.8.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.10.bb
@@ -2,9 +2,9 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=44bc22578be94b6536c8bdc3a01e5db9 \
-                    file://png.h;endline=15;md5=aa42e53406a5ebb9500bae72fa314b6d \
-                    file://png.h;beginline=209;endline=323;md5=83e13159b5bf0a4d9fb634acbda7cb5b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cb7a834ba2891bc30b8577e49963a435 \
+                    file://png.h;endline=15;md5=853b11c4a19ec66decd641efd756bc2c \
+                    file://png.h;beginline=209;endline=323;md5=cface34a7db6b71eaa828fe934951f81"
 DEPENDS = "zlib"
 LIBV = "16"
 
@@ -12,8 +12,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}
            file://0001-configure-lower-automake-requirement.patch \
           "
 
-SRC_URI[md5sum] = "51ce71a1642cdde1f4485a7ff82193c0"
-SRC_URI[sha256sum] = "24f73d8b5e1d74a9482c81b65c3f93f96c7da7ed0417b8a948a75d2d99133081"
+SRC_URI[md5sum] = "5f414b20f683b1d96b163c89e3eff768"
+SRC_URI[sha256sum] = "4003f0fd0e36110a2b742fc5b9e1ab93ed7a7ab57ae8dc65f0e8101458775a56"
 
 inherit autotools binconfig pkgconfig
 
-- 
1.7.10.4


