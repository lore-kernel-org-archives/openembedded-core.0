Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Th70n-0003mo-J6
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Dec 2012 00:07:17 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so696669lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Dec 2012 14:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=si1FKZARzXBFQXKB5HIxnJBjKbNA7iY/KpPFjPvE058=;
	b=eC8huAKU1rvIz91c0+VwFHQjtVjr07b4kbrUnmfFAi5NeJj/38ObDNhaHBDVp812eU
	BbCSwIdiW1DgTEq3P8teoky7PInRxGDayrP/GrQTNTu2D9FOjJi5wYUAcA0j2+oUKXtZ
	GebNXZrfBfaCJTLmRRg5mGxjIp1v4mkK5rHjHZ269pG+1N2U5IWDN/Y7rlPCuNHITc3h
	nkP85RIF6s1goG+OiwGcz2k7kF+Nj90ZbQcWF8r8ygPTydiWGWaAnfoel3HetaYmeKgh
	/Ikf30id8lFj3jcjeFf+M/L1yXBGLuToC1DQlKgg6vBIdRX7ni7QFDknKCFD4UwCfSP5
	BoVg==
Received: by 10.152.105.103 with SMTP id gl7mr6818417lab.10.1354920770415;
	Fri, 07 Dec 2012 14:52:50 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id ml1sm2043858lab.15.2012.12.07.14.52.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Dec 2012 14:52:49 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Th6mk-0006gr-Pi; Sat, 08 Dec 2012 00:52:46 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Dec 2012 00:52:31 +0200
Message-Id: <1354920751-21102-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354920751-21102-1-git-send-email-cazfi74@gmail.com>
References: <1354920751-21102-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v2] libpng: update to upstream version 1.5.13
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
X-List-Received-Date: Fri, 07 Dec 2012 23:07:17 -0000

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
index 62989bb..0000000
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
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-multimedia/libpng/libpng_1.5.13.bb b/meta/recipes-multimedia/libpng/libpng_1.5.13.bb
new file mode 100644
index 0000000..3b7168e
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
+BBCLASSEXTEND = "native"
-- 
1.7.10.4



