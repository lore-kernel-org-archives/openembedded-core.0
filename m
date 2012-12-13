Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TjDuE-00019F-Sw
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 19:53:15 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1203431bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2012 10:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=kEr0els8NlYuSfMRhTF3ajti15Oqo6VYlIOuHjpUDeI=;
	b=OMkAKv4lmCBUIo6zhxtjqBF6/qWoA5Nh6L4cNCzEOxj5q0qoyxMtu+Mw/Vqu8T/krd
	MZpMAAEEbbD/G7Moxj0I+jwtNSEiCV3W7ZOmkq3l3h31oCL1uRv8EFKAFh8VJ7dYzm1u
	4FIV2d+NROHAV/uTE6XFas/UuueaBnimObTjHnpgyEqpAb9XNLz9Q8VeoBDF6JO3dIuc
	fFXy4lIZnxGyiHR5uHX8AD3v60iTcN52Zy+KWqkUKw4vzJAtlSNPEgrUNxCQlKGSCKKc
	9T5CaA26EABA+kRSJb1ofzXjyjheBUevuFI+24mhBQGshYb4iVBm+ik8dDMTCdNMGQJt
	Slpg==
Received: by 10.204.148.145 with SMTP id p17mr1489348bkv.136.1355423919695;
	Thu, 13 Dec 2012 10:38:39 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id 18sm2335719bkv.0.2012.12.13.10.38.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 10:38:36 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TjD1Q-0005Ex-76; Thu, 13 Dec 2012 19:56:36 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2012 19:48:14 +0200
Message-Id: <1355420894-7618-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1355420894-7618-1-git-send-email-cazfi74@gmail.com>
References: <1355420894-7618-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH V3] libpng: update to upstream version 1.5.13
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 18:53:15 -0000

Updating from 1.2.x means also change in actual library name
from libpng12 to libpng15, and slight changes in API.

License md5sums differ only because of license text formatting
changes and because they contain version numbers and release dates.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-multimedia/libpng/libpng_1.2.50.bb |   23 ----------------------
 meta/recipes-multimedia/libpng/libpng_1.5.13.bb |   24 +++++++++++++++++++++++
 2 files changed, 24 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libpng/libpng_1.2.50.bb
 create mode 100644 meta/recipes-multimedia/libpng/libpng_1.5.13.bb

diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.50.bb b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
deleted file mode 100644
index 7015538..0000000
--- a/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "PNG Library"
-DESCRIPTION = "PNG Library"
-HOMEPAGE = "http://www.libpng.org/"
-SECTION = "libs"
-LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
-                    file://png.h;beginline=310;endline=424;md5=b87b5e9252a3e14808a27b92912d268d"
-DEPENDS = "zlib"
-PR = "r0"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "a3e00fccbfe356174ab515b5c00641c7"
-SRC_URI[sha256sum] = "4724f81f8c92ac7f360ad1fbf173396ea7c535923424db9fbaff07bfd9d8e8e7"
-
-inherit autotools binconfig pkgconfig
-
-PACKAGES =+ "${PN}12"
-
-FILES_${PN}12 = "${libdir}/libpng12${SOLIBS}"
-RPROVIDES_${PN}-dev += "${PN}12-dev"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-multimedia/libpng/libpng_1.5.13.bb b/meta/recipes-multimedia/libpng/libpng_1.5.13.bb
new file mode 100644
index 0000000..28220ad
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng_1.5.13.bb
@@ -0,0 +1,24 @@
+SUMMARY = "PNG Library"
+DESCRIPTION = "PNG Library"
+HOMEPAGE = "http://www.libpng.org/"
+SECTION = "libs"
+LICENSE = "Libpng"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=00b5b35853278d508806c2e5860e82cb \
+                    file://png.h;beginline=207;endline=321;md5=50e583fb60bb36f37ab5023b2a3715d1"
+DEPENDS = "zlib"
+PR = "r0"
+LIBV = "15"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "0b607a685da977f1bfc96e1c47055183"
+SRC_URI[sha256sum] = "b843f9cb01d10ae22acd9aaf58aceaa4a6aeb9cf78943b41588004b271257aee"
+
+inherit autotools binconfig pkgconfig
+
+PACKAGES =+ "${PN}${LIBV}"
+
+FILES_${PN}${LIBV} = "${libdir}/libpng${LIBV}${SOLIBS}"
+RPROVIDES_${PN}-dev += "${PN}${LIBV}-dev"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.10.4



