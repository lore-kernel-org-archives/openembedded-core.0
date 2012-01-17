Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4bE-0006ye-2v
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:41:00 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2012 00:33:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96633135"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:14 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:46 -0800
Message-Id: <e0fb30eae479806de448f918d1e2c6d04d160abe.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 61/62] openssl-0.9.8: Update to 0.9.8s
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

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4109

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4576

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4577

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4619

[YOCTO #1904]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../configure-targets.patch                        |    0
 .../debian/ca.patch                                |    0
 .../debian/config-hurd.patch                       |    0
 .../debian/debian-targets.patch                    |    0
 .../debian/engines-path.patch                      |    0
 .../debian/kfreebsd-pipe.patch                     |    0
 .../debian/make-targets.patch                      |    0
 .../debian/man-dir.patch                           |    0
 .../debian/man-section.patch                       |    0
 .../debian/no-rpath.patch                          |    0
 .../debian/no-symbolic.patch                       |    0
 .../debian/perl-path.diff                          |    0
 .../debian/pic.patch                               |    0
 .../debian/pkg-config.patch                        |    0
 .../debian/rc4-amd64.patch                         |    0
 .../debian/rehash-crt.patch                        |    0
 .../debian/rehash_pod.patch                        |    0
 .../debian/series                                  |    0
 .../debian/shared-lib-ext.patch                    |    0
 .../debian/stddef.patch                            |    0
 .../debian/version-script.patch                    |    0
 .../parallel-make-fix.patch                        |    0
 .../shared-libs.patch                              |    0
 .../{openssl_0.9.8r.bb => openssl_0.9.8s.bb}       |    8 ++++----
 24 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/config-hurd.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/engines-path.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/kfreebsd-pipe.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/perl-path.diff (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/pkg-config.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/rc4-amd64.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/rehash-crt.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/rehash_pod.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/series (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/shared-lib-ext.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/stddef.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/parallel-make-fix.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8r => openssl-0.9.8s}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_0.9.8r.bb => openssl_0.9.8s.bb} (87%)

diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/configure-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/configure-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/ca.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/ca.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/ca.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/config-hurd.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/config-hurd.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/config-hurd.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/config-hurd.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/debian-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/debian-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/engines-path.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/engines-path.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/engines-path.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/engines-path.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/kfreebsd-pipe.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/kfreebsd-pipe.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/kfreebsd-pipe.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/kfreebsd-pipe.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/make-targets.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/make-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/make-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/make-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/perl-path.diff b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/perl-path.diff
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/perl-path.diff
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/perl-path.diff
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/pic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/pic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/pkg-config.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/pkg-config.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/pkg-config.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/pkg-config.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rc4-amd64.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/rc4-amd64.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rc4-amd64.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/rc4-amd64.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rehash-crt.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/rehash-crt.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rehash-crt.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/rehash-crt.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rehash_pod.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/rehash_pod.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/rehash_pod.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/rehash_pod.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/series b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/series
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/series
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/series
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/shared-lib-ext.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/shared-lib-ext.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/shared-lib-ext.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/shared-lib-ext.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/stddef.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/stddef.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/stddef.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/stddef.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/debian/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/parallel-make-fix.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/parallel-make-fix.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/parallel-make-fix.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/parallel-make-fix.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8s/shared-libs.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8r/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8s/shared-libs.patch
diff --git a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb b/meta/recipes-connectivity/openssl/openssl_0.9.8s.bb
similarity index 87%
rename from meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
rename to meta/recipes-connectivity/openssl/openssl_0.9.8s.bb
index 4c6cad3..74892c1 100644
--- a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
+++ b/meta/recipes-connectivity/openssl/openssl_0.9.8s.bb
@@ -1,6 +1,6 @@
 require openssl.inc
 
-PR = "r7"
+PR = "r0"
 SRC_URI += "file://debian/ca.patch \
             file://debian/config-hurd.patch;apply=no \
             file://debian/debian-targets.patch \
@@ -21,11 +21,11 @@ SRC_URI += "file://debian/ca.patch \
             file://debian/version-script.patch \
             file://debian/perl-path.diff"
 
-SRC_URI[md5sum] = "0352932ea863bc02b056cda7c9ac5b79"
-SRC_URI[sha256sum] = "42b2368f786b05ed3be846838dce126b4e8e3dba8fb2e0ce83102df28c102fad"
-
 SRC_URI += "file://configure-targets.patch \
             file://shared-libs.patch \
             file://parallel-make-fix.patch"
 
+SRC_URI[md5sum] = "fbf71e8e050bc1ec290b7468bab1a76e"
+SRC_URI[sha256sum] = "edc9639beaf2d5e239d8e5c9d2fe1959e6726a5d7f8ab8430613835f4623f9ba"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.6.5



