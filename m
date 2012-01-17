Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4bE-0006um-39
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:41:00 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2012 00:33:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96633138"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:15 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:47 -0800
Message-Id: <1617fc23b1ce9a3e0c0639ee35b2128306f26388.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 62/62] openssl-1.0.0: Update to 1.0.0e and fix QA Warning
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
X-List-Received-Date: Tue, 17 Jan 2012 08:41:01 -0000

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4108

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4576

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4577

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4619

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-0027

[YOCTO #1905]

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
 .../{openssl_1.0.0e.bb => openssl_1.0.0f.bb}       |    8 ++++----
 18 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/pkg-config.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/openssl-fix-link.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0e => openssl-1.0.0f}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.0e.bb => openssl_1.0.0f.bb} (84%)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0f/configure-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0e/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0f/configure-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/c_rehash-compat.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/c_rehash-compat.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/c_rehash-compat.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/ca.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/ca.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/ca.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/debian-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/debian-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/make-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/make-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/make-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/make-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/pic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/pic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/pkg-config.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/pkg-config.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/pkg-config.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/pkg-config.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0f/debian/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/engines-install-in-libdir-ssl.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0f/engines-install-in-libdir-ssl.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0e/engines-install-in-libdir-ssl.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0f/engines-install-in-libdir-ssl.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/oe-ldflags.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0f/oe-ldflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0e/oe-ldflags.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0f/oe-ldflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0f/openssl-fix-link.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0f/openssl-fix-link.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0f/openssl_fix_for_x32.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl_fix_for_x32.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0f/openssl_fix_for_x32.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0f/shared-libs.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.0e/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.0f/shared-libs.patch
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.0e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.0f.bb
similarity index 84%
rename from meta/recipes-connectivity/openssl/openssl_1.0.0e.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.0f.bb
index e29740b..f3404d6 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.0e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.0f.bb
@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
@@ -32,15 +32,15 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl_fix_for_x32.patch \
            "
 
-SRC_URI[md5sum] = "7040b89c4c58c7a1016c0dfa6e821c86"
-SRC_URI[sha256sum] = "e361dc2775733fb84de7b5bf7b504778b772869e8f7bfac0b28b935cbf7380f7"
+SRC_URI[md5sum] = "e358705fb4a8827b5e9224a73f442025"
+SRC_URI[sha256sum] = "faf1eab0ef85fd6c3beca271c356b31b5cc831e2c6b7f23cf672e7ab4680fde1"
 
 PACKAGES =+ " \
 	${PN}-engines \
 	${PN}-engines-dbg \
 	"
 
-FILES_${PN}-engines = "${libdir}/ssl/engines/*.so"
+FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
 FILES_${PN}-engines-dbg = "${libdir}/ssl/engines/.debug"
 
 PARALLEL_MAKEINST = ""
-- 
1.7.6.5



