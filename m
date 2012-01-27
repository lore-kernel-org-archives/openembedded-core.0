Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RqpUc-0005Wb-H7
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 18:21:42 +0100
Received: by mail-gy0-f175.google.com with SMTP id g19so802214ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 09:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZcXV6fL71IikYzS2DZFy4rurGEVVBt/v11n4uY3FH+Q=;
	b=gJNTouxgnBnLWtLbbNqdOia/DWr/PQy6O+XEdhsDouMganqXS291AvcDcScRxmeVqi
	sWhX2Ci6ZlV/WpxcliQkL4z6XgjulHHCN/HiP265wTf2EKBPwM20l4XJHXvLuGf4QmLj
	QGYltCht1RPkgZvmNPL1v2d0IYFk/K01we6WI=
Received: by 10.236.179.67 with SMTP id g43mr1616198yhm.66.1327684435464;
	Fri, 27 Jan 2012 09:13:55 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id f47sm14547996yhh.8.2012.01.27.09.13.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 09:13:54 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 11:13:44 -0600
Message-Id: <c2f9889f4eff44165718d08b880e4dd63ecccadf.1327684024.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 06/10] external-csl-toolchain: avoid the hardcoded version/prefix
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
X-List-Received-Date: Fri, 27 Jan 2012 17:21:42 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 ...ernal-csl2008q3.inc => tcmode-external-csl.inc} |   21 +++++++----------
 ...hain_2008q3-72.bb => external-csl-toolchain.bb} |   24 ++++++++++----------
 2 files changed, 21 insertions(+), 24 deletions(-)
 rename meta/conf/distro/include/{tcmode-external-csl2008q3.inc => tcmode-external-csl.inc} (51%)
 rename meta/recipes-core/meta/{external-csl-toolchain_2008q3-72.bb => external-csl-toolchain.bb} (67%)

diff --git a/meta/conf/distro/include/tcmode-external-csl2008q3.inc b/meta/conf/distro/include/tcmode-external-csl.inc
similarity index 51%
rename from meta/conf/distro/include/tcmode-external-csl2008q3.inc
rename to meta/conf/distro/include/tcmode-external-csl.inc
index 31055dc..0af3a45 100644
--- a/meta/conf/distro/include/tcmode-external-csl2008q3.inc
+++ b/meta/conf/distro/include/tcmode-external-csl.inc
@@ -1,22 +1,22 @@
 #
-# Configuration to use external CSL 2008q3-72 toolchain (ARM EABI)
+# Configuration to use external CSL toolchain
 #
 
 TARGET_VENDOR = "-none"
 
-EXTERNAL_TOOLCHAIN ?= "/usr/local/csl/arm-2008q3"
+EXTERNAL_TOOLCHAIN ?= "/usr/local/csl/${TARGET_ARCH}"
 
 PATH =. "${EXTERNAL_TOOLCHAIN}/bin:"
 
 PREFERRED_PROVIDER_linux-libc-headers = "external-csl-toolchain"
 PREFERRED_PROVIDER_linux-libc-headers-dev = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/arm-none-linux-gnueabi-gcc = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/arm-none-linux-gnueabi-gcc-initial = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/arm-none-linux-gnueabi-gcc-intermediate = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/arm-none-linux-gnueabi-g++ = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/arm-none-linux-gnueabi-binutils = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/arm-none-linux-gnueabi-libc-for-gcc = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/arm-none-linux-gnueabi-compilerlibs = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "external-csl-toolchain"
 PREFERRED_PROVIDER_libgcc = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/libc = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/libintl = "external-csl-toolchain"
@@ -24,9 +24,6 @@ PREFERRED_PROVIDER_virtual/libiconv = "external-csl-toolchain"
 PREFERRED_PROVIDER_glibc-thread-db = "external-csl-toolchain"
 PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-csl-toolchain"
 
-
-PREFERRED_VERSION_external-csl-toolchain = "2008q3-72"
-
 TARGET_CPPFLAGS_prepend = " -isystem${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/include "
 TARGET_LDFLAGS_prepend = " -L${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib -Wl,-rpath-link,${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib "
 
diff --git a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
similarity index 67%
rename from meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
rename to meta/recipes-core/meta/external-csl-toolchain.bb
index b5a3607..f1e5332 100644
--- a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -10,13 +10,13 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 PROVIDES = "\
 	linux-libc-headers \
-	virtual/arm-none-linux-gnueabi-gcc \
-	virtual/arm-none-linux-gnueabi-g++ \
-	virtual/arm-none-linux-gnueabi-gcc-initial \
-	virtual/arm-none-linux-gnueabi-gcc-intermediate \
-	virtual/arm-none-linux-gnueabi-binutils \
-	virtual/arm-none-linux-gnueabi-libc-for-gcc \
-	virtual/arm-none-linux-gnueabi-compilerlibs \
+	virtual/${TARGET_PREFIX}gcc \
+	virtual/${TARGET_PREFIX}g++ \
+	virtual/${TARGET_PREFIX}gcc-initial \
+	virtual/${TARGET_PREFIX}gcc-intermediate \
+	virtual/${TARGET_PREFIX}binutils \
+	virtual/${TARGET_PREFIX}libc-for-gcc \
+	virtual/${TARGET_PREFIX}compilerlibs \
 	virtual/libc \
 	virtual/libintl \
 	virtual/libiconv \
@@ -27,7 +27,7 @@ RPROVIDES = "glibc-utils libsegfault glibc-thread-db"
 PACKAGES_DYNAMIC = "glibc-gconv-*"
 PR = "r2"
 
-#SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/arm-none-linux-gnueabi/arm-${PV}-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2"
+#SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/${TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
 
 SRC_URI = "file://SUPPORTED"
 
@@ -35,10 +35,10 @@ do_install() {
 	install -d ${D}${sysconfdir} ${D}${bindir} ${D}${sbindir} ${D}${base_bindir} ${D}${libdir}
 	install -d ${D}${base_libdir} ${D}${base_sbindir} ${D}${datadir}
 
-	cp -a ${EXTERNAL_TOOLCHAIN}/arm-none-linux-gnueabi/libc/lib/*  ${D}${base_libdir}
-	cp -a ${EXTERNAL_TOOLCHAIN}/arm-none-linux-gnueabi/libc/etc/*  ${D}${sysconfdir}
-	cp -a ${EXTERNAL_TOOLCHAIN}/arm-none-linux-gnueabi/libc/sbin/* ${D}${base_sbindir}
-	cp -a ${EXTERNAL_TOOLCHAIN}/arm-none-linux-gnueabi/libc/usr/*  ${D}/usr
+	cp -a ${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/libc/lib/*  ${D}${base_libdir}
+	cp -a ${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/libc/etc/*  ${D}${sysconfdir}
+	cp -a ${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/libc/sbin/* ${D}${base_sbindir}
+	cp -a ${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/libc/usr/*  ${D}/usr
 
 	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
 	sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libpthread.so
-- 
1.7.8.rc4



