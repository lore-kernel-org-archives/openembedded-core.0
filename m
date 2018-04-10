Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id D3AD07480A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 12:14:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2018 05:14:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,431,1517904000"; d="scan'208";a="32526531"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 10 Apr 2018 05:14:05 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 15:07:43 +0300
Message-Id: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [RFC][PATCH 1/5] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Tue, 10 Apr 2018 12:14:07 -0000

I believe the time has come to do this: openssl 1.0 upstream support stops at the end
of 2019, and we do not want a situation where a supported YP release contains an
unsupported version of a critical security component.

Openssl 1.0 can still be utilized by depending on 'openssl10' recipe.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/default-versions.inc           |  3 ---
 meta/conf/distro/include/maintainers.inc                |  1 +
 meta/recipes-connectivity/openssl/openssl10.inc         | 17 +++++++++++++++--
 ...-Fix-build-with-clang-using-external-assembler.patch |  0
 ...001-openssl-force-soft-link-to-avoid-rare-race.patch |  0
 .../{openssl-1.0.2o => openssl10}/Makefiles-ptest.patch |  0
 .../Use-SHA256-not-MD5-as-default-digest.patch          |  0
 .../configure-musl-target.patch                         |  0
 .../configure-targets.patch                             |  0
 .../debian/c_rehash-compat.patch                        |  0
 .../{openssl-1.0.2o => openssl10}/debian/ca.patch       |  0
 .../debian/debian-targets.patch                         |  0
 .../{openssl-1.0.2o => openssl10}/debian/man-dir.patch  |  0
 .../debian/man-section.patch                            |  0
 .../{openssl-1.0.2o => openssl10}/debian/no-rpath.patch |  0
 .../debian/no-symbolic.patch                            |  0
 .../{openssl-1.0.2o => openssl10}/debian/pic.patch      |  0
 .../debian1.0.2/block_digicert_malaysia.patch           |  0
 .../debian1.0.2/block_diginotar.patch                   |  0
 .../debian1.0.2/soname.patch                            |  0
 .../debian1.0.2/version-script.patch                    |  0
 .../engines-install-in-libdir-ssl.patch                 |  0
 .../openssl/{openssl-1.0.2o => openssl10}/find.pl       |  0
 .../{openssl-1.0.2o => openssl10}/oe-ldflags.patch      |  0
 .../{openssl-1.0.2o => openssl10}/openssl-c_rehash.sh   |  0
 .../openssl-fix-des.pod-error.patch                     |  0
 .../openssl-util-perlpath.pl-cwd.patch                  |  0
 .../openssl_fix_for_x32.patch                           |  0
 .../{openssl-1.0.2o => openssl10}/parallel.patch        |  0
 .../{openssl-1.0.2o => openssl10}/ptest-deps.patch      |  0
 .../ptest_makefile_deps.patch                           |  0
 .../reproducible-cflags.patch                           |  0
 .../reproducible-mkbuildinf.patch                       |  0
 .../openssl/{openssl-1.0.2o => openssl10}/run-ptest     |  0
 .../{openssl-1.0.2o => openssl10}/shared-libs.patch     |  0
 .../openssl/{openssl_1.0.2o.bb => openssl10_1.0.2o.bb}  |  0
 36 files changed, 16 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/0001-Fix-build-with-clang-using-external-assembler.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/0001-openssl-force-soft-link-to-avoid-rare-race.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/Makefiles-ptest.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/Use-SHA256-not-MD5-as-default-digest.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/configure-musl-target.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/debian1.0.2/block_digicert_malaysia.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/debian1.0.2/block_diginotar.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/debian1.0.2/soname.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/debian1.0.2/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/find.pl (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/openssl-c_rehash.sh (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/openssl-fix-des.pod-error.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/openssl-util-perlpath.pl-cwd.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/parallel.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/ptest-deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/ptest_makefile_deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/reproducible-cflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/reproducible-mkbuildinf.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/run-ptest (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl10}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2o.bb => openssl10_1.0.2o.bb} (100%)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index 868073843af..a6f331350eb 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -2,6 +2,3 @@
 # Default preferred versions
 #
 
-PREFERRED_VERSION_openssl = "1.0.%"
-PREFERRED_VERSION_openssl-native = "1.0.%"
-PREFERRED_VERSION_nativesdk-openssl = "1.0.%"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 48aff9537e4..271d176ed42 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -544,6 +544,7 @@ RECIPE_MAINTAINER_pn-ofono = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-oh-puzzles = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-openssh = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-openssl = "Alexander Kanavin <alexander.kanavin@intel.com>"
+RECIPE_MAINTAINER_pn-openssl10 = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-opkg = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
 RECIPE_MAINTAINER_pn-opkg-arch-config = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
 RECIPE_MAINTAINER_pn-opkg-keyrings = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recipes-connectivity/openssl/openssl10.inc
index 645d64ec85e..4e0d5857172 100644
--- a/meta/recipes-connectivity/openssl/openssl10.inc
+++ b/meta/recipes-connectivity/openssl/openssl10.inc
@@ -11,8 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 DEPENDS = "makedepend-native hostperl-runtime-native"
 DEPENDS_append_class-target = " openssl-native"
 
-PROVIDES += "openssl10"
-
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
           "
 S = "${WORKDIR}/openssl-${PV}"
@@ -283,3 +281,18 @@ do_install_append_class-native() {
 
 BBCLASSEXTEND = "native nativesdk"
 
+PACKAGE_PREPROCESS_FUNCS += "openssl_package_preprocess"
+
+# openssl 1.0 development files and executable binaries clash with openssl 1.1
+# files when installed into target rootfs. So we don't put them into
+# packages, but they continue to be provided via target sysroot for
+# cross-compilation on the host, if some software still depends on openssl 1.0.
+openssl_package_preprocess () {
+        for file in `find ${PKGD} -name *.h -o -name *.pc -o -name *.so`; do
+                rm $file
+        done
+        rm ${PKGD}/usr/bin/openssl
+        rm ${PKGD}/usr/bin/c_rehash
+        rmdir ${PKGD}/usr/bin
+
+}
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-Fix-build-with-clang-using-external-assembler.patch b/meta/recipes-connectivity/openssl/openssl10/0001-Fix-build-with-clang-using-external-assembler.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-Fix-build-with-clang-using-external-assembler.patch
rename to meta/recipes-connectivity/openssl/openssl10/0001-Fix-build-with-clang-using-external-assembler.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-openssl-force-soft-link-to-avoid-rare-race.patch b/meta/recipes-connectivity/openssl/openssl10/0001-openssl-force-soft-link-to-avoid-rare-race.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-openssl-force-soft-link-to-avoid-rare-race.patch
rename to meta/recipes-connectivity/openssl/openssl10/0001-openssl-force-soft-link-to-avoid-rare-race.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/Makefiles-ptest.patch b/meta/recipes-connectivity/openssl/openssl10/Makefiles-ptest.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/Makefiles-ptest.patch
rename to meta/recipes-connectivity/openssl/openssl10/Makefiles-ptest.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/Use-SHA256-not-MD5-as-default-digest.patch b/meta/recipes-connectivity/openssl/openssl10/Use-SHA256-not-MD5-as-default-digest.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/Use-SHA256-not-MD5-as-default-digest.patch
rename to meta/recipes-connectivity/openssl/openssl10/Use-SHA256-not-MD5-as-default-digest.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/configure-musl-target.patch b/meta/recipes-connectivity/openssl/openssl10/configure-musl-target.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/configure-musl-target.patch
rename to meta/recipes-connectivity/openssl/openssl10/configure-musl-target.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl10/configure-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl10/configure-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl10/debian/c_rehash-compat.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/c_rehash-compat.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/c_rehash-compat.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl10/debian/ca.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/ca.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl10/debian/debian-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/debian-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl10/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl10/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl10/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl10/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl10/debian/pic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian/pic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/block_digicert_malaysia.patch b/meta/recipes-connectivity/openssl/openssl10/debian1.0.2/block_digicert_malaysia.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/block_digicert_malaysia.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian1.0.2/block_digicert_malaysia.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/block_diginotar.patch b/meta/recipes-connectivity/openssl/openssl10/debian1.0.2/block_diginotar.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/block_diginotar.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian1.0.2/block_diginotar.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/soname.patch b/meta/recipes-connectivity/openssl/openssl10/debian1.0.2/soname.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/soname.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian1.0.2/soname.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/version-script.patch b/meta/recipes-connectivity/openssl/openssl10/debian1.0.2/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl10/debian1.0.2/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/engines-install-in-libdir-ssl.patch b/meta/recipes-connectivity/openssl/openssl10/engines-install-in-libdir-ssl.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/engines-install-in-libdir-ssl.patch
rename to meta/recipes-connectivity/openssl/openssl10/engines-install-in-libdir-ssl.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/find.pl b/meta/recipes-connectivity/openssl/openssl10/find.pl
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/find.pl
rename to meta/recipes-connectivity/openssl/openssl10/find.pl
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/oe-ldflags.patch b/meta/recipes-connectivity/openssl/openssl10/oe-ldflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/oe-ldflags.patch
rename to meta/recipes-connectivity/openssl/openssl10/oe-ldflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-c_rehash.sh b/meta/recipes-connectivity/openssl/openssl10/openssl-c_rehash.sh
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-c_rehash.sh
rename to meta/recipes-connectivity/openssl/openssl10/openssl-c_rehash.sh
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-fix-des.pod-error.patch b/meta/recipes-connectivity/openssl/openssl10/openssl-fix-des.pod-error.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-fix-des.pod-error.patch
rename to meta/recipes-connectivity/openssl/openssl10/openssl-fix-des.pod-error.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-util-perlpath.pl-cwd.patch b/meta/recipes-connectivity/openssl/openssl10/openssl-util-perlpath.pl-cwd.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-util-perlpath.pl-cwd.patch
rename to meta/recipes-connectivity/openssl/openssl10/openssl-util-perlpath.pl-cwd.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl10/openssl_fix_for_x32.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl_fix_for_x32.patch
rename to meta/recipes-connectivity/openssl/openssl10/openssl_fix_for_x32.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/parallel.patch b/meta/recipes-connectivity/openssl/openssl10/parallel.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/parallel.patch
rename to meta/recipes-connectivity/openssl/openssl10/parallel.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/ptest-deps.patch b/meta/recipes-connectivity/openssl/openssl10/ptest-deps.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/ptest-deps.patch
rename to meta/recipes-connectivity/openssl/openssl10/ptest-deps.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/ptest_makefile_deps.patch b/meta/recipes-connectivity/openssl/openssl10/ptest_makefile_deps.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/ptest_makefile_deps.patch
rename to meta/recipes-connectivity/openssl/openssl10/ptest_makefile_deps.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/reproducible-cflags.patch b/meta/recipes-connectivity/openssl/openssl10/reproducible-cflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/reproducible-cflags.patch
rename to meta/recipes-connectivity/openssl/openssl10/reproducible-cflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/reproducible-mkbuildinf.patch b/meta/recipes-connectivity/openssl/openssl10/reproducible-mkbuildinf.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/reproducible-mkbuildinf.patch
rename to meta/recipes-connectivity/openssl/openssl10/reproducible-mkbuildinf.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/run-ptest b/meta/recipes-connectivity/openssl/openssl10/run-ptest
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/run-ptest
rename to meta/recipes-connectivity/openssl/openssl10/run-ptest
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl10/shared-libs.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl10/shared-libs.patch
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2o.bb
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
rename to meta/recipes-connectivity/openssl/openssl10_1.0.2o.bb
-- 
2.16.1


