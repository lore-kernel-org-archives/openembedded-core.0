Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1422A7D97D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Oct 2019 13:06:40 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id e11so266206wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Oct 2019 06:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SQZ/67S3Dr4OKZN88vYqFmpeLdij8SIu4c+h5EnhekY=;
	b=F2OFFbLxVg18HR2VHxl19sedJmjoGr891e5iJ8ga/OG6G4Obi2MvOIxYszMEYiFc8h
	Ut5jjJbUzjmIdWxh5lM4FW79en3n2mP6L27lepD7CLjxGyliCrdPD5PI3yznzY15x+H7
	UyWuFckiCidt3Ev5fzN2gVrPu3qzpTXriUQ0OAvUWLZv/leD4gTfekRZFp5LoDhOb6TX
	pZjoyGhM+fzXqkP/4tGoyEeF5peXf/CsJmYYwK5CAVbJzmSXvs1UHR3bH0yX3v1jtBty
	slnuxUc8f0FYuSzPi1IAr84eIjJIVTtXTVrVUz7dptW/abdQhvp0f5eoX3xr+HZzBroL
	oovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SQZ/67S3Dr4OKZN88vYqFmpeLdij8SIu4c+h5EnhekY=;
	b=mbLqjqjjIP8VpM/aTZe15zZHhDfZ8uklq5J7CFpxmwiUY3ZIEN51rPVJDgk0dRUBa0
	5CCU5thKPxIFK4Wvyd8+fA3Kp7rv8gbMrVg/2mAATYvM6TYyYwzw1iDGRf7dErKPWk4v
	Cvol9bI7my4VqNM9nkkRjvJCiTp+UVWf5aJUSj/XoRQemxIXFKU3kz+pCkch8v2vEgU4
	EUD4zWCr4mT5dU/XOfgA3eDp3v9iQsd2enBmoOivEsT8ApUjbjJG64KFgsILEbylf3Fg
	785ORN4nUpQ24r40a8YEDV2tU4qHmR5wE8BByVgr57iVIpvbFm7mdCe6eDbUaIzJ0Dqv
	Bs1A==
X-Gm-Message-State: APjAAAWSLTOWw+gP7geD25jOolFCOjUtAdtRfMrqll1cLw7u2ZFMLciW
	D/4vSq/edLI5M/geS3X5EkILP4x2
X-Google-Smtp-Source: APXvYqzp0dINgRdnGQcxQWu5WPwfcBVgiZgNCkn7bSsgVkZqdgnX6boPotyGYM0Ubj3dgFy80eA2Zg==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr12150268wrp.296.1571490401174;
	Sat, 19 Oct 2019 06:06:41 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0A1D354C294C8621B4EA37.dip0.t-ipconnect.de.
	[2003:f0:7f0a:1d35:4c29:4c86:21b4:ea37])
	by smtp.gmail.com with ESMTPSA id
	r12sm8524140wrq.88.2019.10.19.06.06.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 19 Oct 2019 06:06:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@intel.com
Date: Sat, 19 Oct 2019 15:06:33 +0200
Message-Id: <20191019130633.9488-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] libical: add PACKAGECONFIG glib and enable it by default
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
X-List-Received-Date: Sat, 19 Oct 2019 13:06:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* As long as there is no solution upstream [1] build src-generator native and
  adjust cmake file to find it
* libical-glib is a mandatory dependency for evolution-data-server >= 3.34

[1] https://github.com/libical/libical/issues/394

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-our-hand-build-native-src-generator.patch | 33 +++++++++++++++++++
 meta/recipes-support/libical/libical_3.0.6.bb | 24 +++++++++-----
 2 files changed, 49 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-support/libical/libical/0001-Use-our-hand-build-native-src-generator.patch

diff --git a/meta/recipes-support/libical/libical/0001-Use-our-hand-build-native-src-generator.patch b/meta/recipes-support/libical/libical/0001-Use-our-hand-build-native-src-generator.patch
new file mode 100644
index 0000000000..73f83ef481
--- /dev/null
+++ b/meta/recipes-support/libical/libical/0001-Use-our-hand-build-native-src-generator.patch
@@ -0,0 +1,33 @@
+From e33bc310238bba1690f2c71ad333e10b9e422ea9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sat, 19 Oct 2019 14:23:06 +0200
+Subject: [PATCH] Use our hand-build native src-generator
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/libical-glib/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libical-glib/CMakeLists.txt b/src/libical-glib/CMakeLists.txt
+index f3704e6..ce9db16 100644
+--- a/src/libical-glib/CMakeLists.txt
++++ b/src/libical-glib/CMakeLists.txt
+@@ -63,8 +63,8 @@ endforeach()
+ 
+ add_custom_command (
+   OUTPUT ${LIBICAL_GLIB_SOURCES} ${CMAKE_CURRENT_BINARY_DIR}/libical-glib-private.h ${CMAKE_CURRENT_BINARY_DIR}/i-cal-forward-declarations.h
+-  COMMAND ${EXECUTABLE_OUTPUT_PATH}/src-generator "${CMAKE_CURRENT_SOURCE_DIR}/tools" "${CMAKE_CURRENT_SOURCE_DIR}/api"
+-  DEPENDS ${EXECUTABLE_OUTPUT_PATH}/src-generator ${xml_files}
++  COMMAND ${CMAKE_BINARY_DIR}/src-generator "${CMAKE_CURRENT_SOURCE_DIR}/tools" "${CMAKE_CURRENT_SOURCE_DIR}/api"
++  DEPENDS ${CMAKE_BINARY_DIR}/src-generator ${xml_files}
+ )
+ 
+ configure_file(
+-- 
+2.21.0
+
diff --git a/meta/recipes-support/libical/libical_3.0.6.bb b/meta/recipes-support/libical/libical_3.0.6.bb
index 032f3655e9..f9be898a12 100644
--- a/meta/recipes-support/libical/libical_3.0.6.bb
+++ b/meta/recipes-support/libical/libical_3.0.6.bb
@@ -7,27 +7,35 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
                     file://LICENSE.MPL2.txt;md5=9741c346eef56131163e13b9db1241b3"
 SECTION = "libs"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-
+SRC_URI = " \
+    https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
+    file://0001-Use-our-hand-build-native-src-generator.patch \
+"
 SRC_URI[md5sum] = "463a59244c6767b8e67b29379405e297"
 SRC_URI[sha256sum] = "5c8a21c2b732ece4a33e5c862970b4f35a8548bbcda50de5695f6fc211ac4d97"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig
 
-PACKAGECONFIG ??= "icu"
+do_compile_prepend() {
+	# As long as https://github.com/libical/libical/issues/394 is open build native src-generator manually
+	NATIVE_CFLAGS="${BUILD_CFLAGS} `pkg-config-native --cflags glib-2.0` `pkg-config-native --cflags libxml-2.0`"
+	NATIVE_LDFLAGS="${BUILD_LDFLAGS} `pkg-config-native --libs glib-2.0` `pkg-config-native --libs libxml-2.0`"
+	${BUILD_CC} $NATIVE_CFLAGS ${S}/src/libical-glib/tools/generator.c ${S}/src/libical-glib/tools/xml-parser.c -o ${B}/src-generator $NATIVE_LDFLAGS
+}
+
+PACKAGECONFIG ??= "icu glib"
 PACKAGECONFIG[bdb] = ",-DCMAKE_DISABLE_FIND_PACKAGE_BDB=True,db"
+PACKAGECONFIG[glib] = "-DICAL_GLIB=True,-DICAL_GLIB=False,glib-2.0-native libxml2-native glib-2.0 libxml2"
 # ICU is used for RSCALE (RFC7529) support
 PACKAGECONFIG[icu] = ",-DCMAKE_DISABLE_FIND_PACKAGE_ICU=True,icu"
 
 # No need to use perl-native, the host perl is sufficient.
 EXTRA_OECMAKE += "-DPERL_EXECUTABLE=${HOSTTOOLS_DIR}/perl"
+# doc build fails with linker error (??) for libical-glib so disable it
+EXTRA_OECMAKE += "-DICAL_BUILD_DOCS=false"
 
-# The glib library can't be cross-compiled, disable for now.
-# https://github.com/libical/libical/issues/394
-EXTRA_OECMAKE += "-DICAL_GLIB=false"
-
-do_install_append_class-target () {
+do_install_append () {
     # Remove build host references
     sed -i \
        -e 's,${STAGING_LIBDIR},${libdir},g' \
-- 
2.21.0


