Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SA3fA-00018q-Uy
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 19:20:05 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id C658F2FD97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 14:11:06 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 11:11:00 -0700
Message-Id: <558a58869ee345c82d65fdc1521c562b3c7e310e.1332266918.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332266918.git.scott.a.garman@intel.com>
References: <cover.1332266918.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1332266918.git.scott.a.garman@intel.com>
References: <cover.1332266918.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: C658F2FD97.51930
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] openssl: upgrade to 1.0.0.h
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
X-List-Received-Date: Tue, 20 Mar 2012 18:20:05 -0000

Removed pkg-config.patch, which was incorporated upstream.

Addresses CVE-2012-0884.

Fixes bug [YOCTO #2139].

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../openssl/openssl-1.0.0g/debian/pkg-config.patch |   36 --------------------
 .../configure-targets.patch                        |    0
 .../debian/c_rehash-compat.patch                   |    0
 .../debian/ca.patch                                |    0
 .../debian/debian-targets.patch                    |    0
 .../debian/make-targets.patch                      |    0
 .../debian/man-dir.patch                           |    0
 .../debian/man-section.patch                       |    0
 .../debian/no-rpath.patch                          |    0
 .../debian/no-symbolic.patch                       |    0
 .../debian/pic.patch                               |    0
 .../debian/version-script.patch                    |    0
 .../engines-install-in-libdir-ssl.patch            |    0
 .../oe-ldflags.patch                               |    0
 .../openssl-fix-link.patch                         |    0
 .../openssl_fix_for_x32.patch                      |    0
 .../shared-libs.patch                              |    0
 .../{openssl_1.0.0g.bb => openssl_1.0.0h.bb}       |    5 +--
 18 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/pkg-config.patch
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/openssl-fix-link.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.0g.bb => openssl_1.0.0h.bb} (87%)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/pkg-config.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/pkg-config.patch
deleted file mode 100644
index 0f1f392..0000000
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/pkg-config.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-1.0.0c/Makefile.org
-===================================================================
---- openssl-1.0.0c.orig/Makefile.org	2010-12-12 16:13:28.000000000 +0100
-+++ openssl-1.0.0c/Makefile.org	2010-12-12 17:01:49.000000000 +0100
-@@ -323,7 +323,8 @@
- 	    echo 'Description: OpenSSL cryptography library'; \
- 	    echo 'Version: '$(VERSION); \
- 	    echo 'Requires: '; \
--	    echo 'Libs: -L$${libdir} -lcrypto $(EX_LIBS)'; \
-+	    echo 'Libs: -L$${libdir} -lcrypto'; \
-+	    echo 'Libs.private: $(EX_LIBS)'; \
- 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > libcrypto.pc
- 
- libssl.pc: Makefile
-@@ -336,7 +337,8 @@
- 	    echo 'Description: Secure Sockets Layer and cryptography libraries'; \
- 	    echo 'Version: '$(VERSION); \
- 	    echo 'Requires: '; \
--	    echo 'Libs: -L$${libdir} -lssl -lcrypto $(EX_LIBS)'; \
-+	    echo 'Libs: -L$${libdir} -lssl'; \
-+	    echo 'Libs.private: -lcrypto $(EX_LIBS)'; \
- 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > libssl.pc
- 
- openssl.pc: Makefile
-@@ -349,7 +351,8 @@
- 	    echo 'Description: Secure Sockets Layer and cryptography libraries and tools'; \
- 	    echo 'Version: '$(VERSION); \
- 	    echo 'Requires: '; \
--	    echo 'Libs: -L$${libdir} -lssl -lcrypto $(EX_LIBS)'; \
-+	    echo 'Libs: -L$${libdir} -lssl -lcrypto'; \
-+	    echo 'Libs.private: $(EX_LIBS)'; \
- 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > openssl.pc
- 
- Makefile: Makefile.org Configure config
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0g/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0h/configure-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0g/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0h/configure-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/c_rehash-compat.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/c_rehash-compat.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/c_rehash-compat.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/ca.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/ca.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/ca.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/debian-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/debian-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/make-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/make-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/make-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/make-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/pic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/pic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0g/engines-install-in-libdir-ssl.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0h/engines-install-in-libdir-ssl.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0g/engines-install-in-libdir-ssl.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0h/engines-install-in-libdir-ssl.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0g/oe-ldflags.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0h/oe-ldflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0g/oe-ldflags.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0h/oe-ldflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0g/openssl-fix-link.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0h/openssl-fix-link.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0g/openssl-fix-link.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0h/openssl-fix-link.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0g/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0h/openssl_fix_for_x32.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0g/openssl_fix_for_x32.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0h/openssl_fix_for_x32.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0g/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0h/shared-libs.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0g/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0h/shared-libs.patch
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.0h.bb
similarity index 87%
rename from meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.0h.bb
index 8ffe931..744fe2a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.0h.bb
@@ -26,14 +26,13 @@ SRC_URI += "file://configure-targets.patch \
             file://debian/no-rpath.patch \
             file://debian/man-dir.patch \
             file://debian/man-section.patch \
-            file://debian/pkg-config.patch \
             file://debian/no-symbolic.patch \
             file://debian/debian-targets.patch \
             file://openssl_fix_for_x32.patch \
            "
 
-SRC_URI[md5sum] = "07ecbe4324f140d157478637d6beccf1"
-SRC_URI[sha256sum] = "905106a1505e7d9f7c36ee81408d3aa3d41aac291a9603d0c290c9530c92fc2c"
+SRC_URI[md5sum] = "a5bc483c570f2ac3758ce5c19b667fab"
+SRC_URI[sha256sum] = "7e3dfc21aa57ed33ea673170053d1921322803b8a6a624a4f0d2e4c308bd418d"
 
 PACKAGES =+ " \
 	${PN}-engines \
-- 
1.7.5.4



