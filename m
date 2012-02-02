Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt6VS-0002Xg-11
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 00:55:59 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2012 15:48:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113485990"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.238])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2012 15:47:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 15:47:43 -0800
Message-Id: <263c39e624d6c8681e716d26718ce7502de8ae6d.1328226197.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
Subject: [PATCH 04/14] openssl: Update to 1.0.0g
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
X-List-Received-Date: Thu, 02 Feb 2012 23:55:59 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
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
 .../debian/pkg-config.patch                        |    0
 .../debian/version-script.patch                    |    0
 .../engines-install-in-libdir-ssl.patch            |    0
 .../oe-ldflags.patch                               |    0
 .../openssl-fix-link.patch                         |    0
 .../openssl_fix_for_x32.patch                      |    0
 .../shared-libs.patch                              |    0
 .../{openssl_1.0.0f.bb => openssl_1.0.0g.bb}       |    4 ++--
 18 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/pkg-config.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/openssl-fix-link.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0f => openssl-1.0.0g}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.0f.bb => openssl_1.0.0g.bb} (90%)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0f/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/configure-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0f/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0g/configure-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/c_rehash-compat.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/c_rehash-compat.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/c_rehash-compat.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/ca.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/ca.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/ca.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/debian-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/debian-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/make-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/make-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/make-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/make-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/pic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/pic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/pkg-config.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/pkg-config.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/pkg-config.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/pkg-config.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0f/engines-install-in-libdir-ssl.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/engines-install-in-libdir-ssl.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0f/engines-install-in-libdir-ssl.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0g/engines-install-in-libdir-ssl.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0f/oe-ldflags.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/oe-ldflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0f/oe-ldflags.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0g/oe-ldflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0f/openssl-fix-link.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/openssl-fix-link.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0f/openssl-fix-link.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0g/openssl-fix-link.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0f/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/openssl_fix_for_x32.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0f/openssl_fix_for_x32.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0g/openssl_fix_for_x32.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0f/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0g/shared-libs.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0f/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0g/shared-libs.patch
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.0f.bb b/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
similarity index 90%
rename from meta/recipes-connectivity/openssl/openssl_1.0.0f.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
index f3404d6..80dfcb3 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.0f.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
@@ -32,8 +32,8 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl_fix_for_x32.patch \
            "
 
-SRC_URI[md5sum] = "e358705fb4a8827b5e9224a73f442025"
-SRC_URI[sha256sum] = "faf1eab0ef85fd6c3beca271c356b31b5cc831e2c6b7f23cf672e7ab4680fde1"
+SRC_URI[md5sum] = "07ecbe4324f140d157478637d6beccf1"
+SRC_URI[sha256sum] = "905106a1505e7d9f7c36ee81408d3aa3d41aac291a9603d0c290c9530c92fc2c"
 
 PACKAGES =+ " \
 	${PN}-engines \
-- 
1.7.6.5



