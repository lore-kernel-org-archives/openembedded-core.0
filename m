Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TgqbZ-0001Ln-Os
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 06:36:09 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id DEDF9303F2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2012 00:02:35 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 21:02:03 -0800
Message-Id: <cf84ebac391b243099fe0d05223433ecb8e71641.1354855433.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354855433.git.scott.a.garman@intel.com>
References: <cover.1354855433.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1354855433.git.scott.a.garman@intel.com>
References: <cover.1354855433.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: DEDF9303F2.B646D
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 10/16] openssl: upgrade to 1.0.0j
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
X-List-Received-Date: Fri, 07 Dec 2012 05:36:10 -0000

Addresses CVE-2012-2333

Fixes [YOCTO #2682]

Fixes denzil [YOCTO #2701]

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
 .../{openssl-1.0.0i => openssl-1.0.0j}/find.pl     |    0
 .../oe-ldflags.patch                               |    0
 .../openssl-fix-link.patch                         |    0
 .../openssl_fix_for_x32.patch                      |    0
 .../shared-libs.patch                              |    0
 .../{openssl_1.0.0i.bb => openssl_1.0.0j.bb}       |    4 ++--
 18 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/find.pl (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/openssl-fix-link.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.0i.bb => openssl_1.0.0j.bb} (90%)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/configure-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0i/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0j/configure-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/c_rehash-compat.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/c_rehash-compat.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/c_rehash-compat.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/ca.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/ca.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/ca.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/debian-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/debian-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/make-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/make-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/make-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/make-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/pic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/pic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0i/debian/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/engines-install-in-libdir-ssl.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/engines-install-in-libdir-ssl.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0i/engines-install-in-libdir-ssl.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0j/engines-install-in-libdir-ssl.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/find.pl b/meta/recipes-connectivity/openssl/openssl-1.0.0j/find.pl
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0i/find.pl
rename to meta/recipes-connectivity/openssl/openssl-1.0.0j/find.pl
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/oe-ldflags.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/oe-ldflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0i/oe-ldflags.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0j/oe-ldflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/openssl-fix-link.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/openssl-fix-link.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0i/openssl-fix-link.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0j/openssl-fix-link.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/openssl_fix_for_x32.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0i/openssl_fix_for_x32.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0j/openssl_fix_for_x32.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/shared-libs.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0i/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0j/shared-libs.patch
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.0i.bb b/meta/recipes-connectivity/openssl/openssl_1.0.0j.bb
similarity index 90%
rename from meta/recipes-connectivity/openssl/openssl_1.0.0i.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.0j.bb
index c233ba1..7dac79c 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.0i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.0j.bb
@@ -32,8 +32,8 @@ SRC_URI += "file://configure-targets.patch \
             file://find.pl \
            "
 
-SRC_URI[md5sum] = "b4df9c11af454fd68178c85a1d5f328f"
-SRC_URI[sha256sum] = "548262d15777c504be1ab9bb8fabef1e14a3de54837a6593c8f403dd843d5e57"
+SRC_URI[md5sum] = "cbe4ac0d8f598680f68a951e04b0996b"
+SRC_URI[sha256sum] = "626fb8fcb3eb7e966edbe71553ff993d137f6e8a87b05051a3695e621098b8af"
 
 PACKAGES =+ " \
 	${PN}-engines \
-- 
1.7.9.5



