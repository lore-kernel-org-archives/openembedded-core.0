Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfub-0002yu-F4
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125518"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:29 -0700
Message-Id: <51a122a5593c62d7ffd07f860e54a2fb0327959c.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 18/32] openssl: upgrade to 1.0.0i
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
X-List-Received-Date: Thu, 24 May 2012 21:49:39 -0000

Addresses CVE-2012-2110

Fixes bug [YOCTO #2368]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
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
 meta/recipes-connectivity/openssl/openssl.inc      |    3 +--
 .../{openssl_1.0.0h.bb => openssl_1.0.0i.bb}       |    4 ++--
 18 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/openssl-fix-link.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.0h.bb => openssl_1.0.0i.bb} (90%)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0h/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/configure-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0h/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0i/configure-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/c_rehash-compat.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/c_rehash-compat.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/c_rehash-compat.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/ca.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/ca.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/ca.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/debian-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/debian-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/make-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/make-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/make-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/make-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/pic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/pic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0h/debian/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0h/engines-install-in-libdir-ssl.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/engines-install-in-libdir-ssl.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0h/engines-install-in-libdir-ssl.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0i/engines-install-in-libdir-ssl.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0h/oe-ldflags.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/oe-ldflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0h/oe-ldflags.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0i/oe-ldflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0h/openssl-fix-link.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/openssl-fix-link.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0h/openssl-fix-link.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0i/openssl-fix-link.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0h/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/openssl_fix_for_x32.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0h/openssl_fix_for_x32.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0i/openssl_fix_for_x32.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0h/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/shared-libs.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0h/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0i/shared-libs.patch
diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 089b9a4..78cf272 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -4,8 +4,7 @@ HOMEPAGE = "http://www.openssl.org/"
 BUGTRACKER = "http://www.openssl.org/news/vulnerabilities.html"
 SECTION = "libs/network"
 
-# Big Jump for OpenSSL 1.0 support with meta-oe
-INC_PR = "r15"
+INC_PR = "r0"
 
 # "openssl | SSLeay" dual license
 LICENSE = "openssl"
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.0.0i.bb
similarity index 90%
rename from meta/recipes-connectivity/openssl/openssl_1.0.0h.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.0i.bb
index 744fe2a..68b092f 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.0i.bb
@@ -31,8 +31,8 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl_fix_for_x32.patch \
            "
 
-SRC_URI[md5sum] = "a5bc483c570f2ac3758ce5c19b667fab"
-SRC_URI[sha256sum] = "7e3dfc21aa57ed33ea673170053d1921322803b8a6a624a4f0d2e4c308bd418d"
+SRC_URI[md5sum] = "b4df9c11af454fd68178c85a1d5f328f"
+SRC_URI[sha256sum] = "548262d15777c504be1ab9bb8fabef1e14a3de54837a6593c8f403dd843d5e57"
 
 PACKAGES =+ " \
 	${PN}-engines \
-- 
1.7.9.5



