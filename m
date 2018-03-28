Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D18EA7858F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 12:49:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2018 05:49:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,371,1517904000"; d="scan'208";a="215609415"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Mar 2018 05:49:43 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Mar 2018 15:43:07 +0300
Message-Id: <20180328124308.14893-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180328124308.14893-1-alexander.kanavin@linux.intel.com>
References: <20180328124308.14893-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/3] openssl: update 1.0.2n -> 1.0.2o
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
X-List-Received-Date: Wed, 28 Mar 2018 12:49:43 -0000

Please see this security advisory:
https://www.openssl.org/news/secadv/20180327.txt

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-Fix-build-with-clang-using-external-assembler.patch        | 0
 .../0001-openssl-force-soft-link-to-avoid-rare-race.patch           | 0
 .../{openssl-1.0.2n => openssl-1.0.2o}/Makefiles-ptest.patch        | 0
 .../Use-SHA256-not-MD5-as-default-digest.patch                      | 0
 .../{openssl-1.0.2n => openssl-1.0.2o}/configure-musl-target.patch  | 0
 .../{openssl-1.0.2n => openssl-1.0.2o}/configure-targets.patch      | 0
 .../{openssl-1.0.2n => openssl-1.0.2o}/debian/c_rehash-compat.patch | 0
 .../openssl/{openssl-1.0.2n => openssl-1.0.2o}/debian/ca.patch      | 0
 .../{openssl-1.0.2n => openssl-1.0.2o}/debian/debian-targets.patch  | 0
 .../openssl/{openssl-1.0.2n => openssl-1.0.2o}/debian/man-dir.patch | 0
 .../{openssl-1.0.2n => openssl-1.0.2o}/debian/man-section.patch     | 0
 .../{openssl-1.0.2n => openssl-1.0.2o}/debian/no-rpath.patch        | 0
 .../{openssl-1.0.2n => openssl-1.0.2o}/debian/no-symbolic.patch     | 0
 .../openssl/{openssl-1.0.2n => openssl-1.0.2o}/debian/pic.patch     | 0
 .../debian1.0.2/block_digicert_malaysia.patch                       | 0
 .../debian1.0.2/block_diginotar.patch                               | 0
 .../{openssl-1.0.2n => openssl-1.0.2o}/debian1.0.2/soname.patch     | 0
 .../debian1.0.2/version-script.patch                                | 0
 .../engines-install-in-libdir-ssl.patch                             | 0
 .../openssl/{openssl-1.0.2n => openssl-1.0.2o}/find.pl              | 0
 .../openssl/{openssl-1.0.2n => openssl-1.0.2o}/oe-ldflags.patch     | 0
 .../openssl/{openssl-1.0.2n => openssl-1.0.2o}/openssl-c_rehash.sh  | 0
 .../openssl-fix-des.pod-error.patch                                 | 0
 .../openssl-util-perlpath.pl-cwd.patch                              | 0
 .../{openssl-1.0.2n => openssl-1.0.2o}/openssl_fix_for_x32.patch    | 0
 .../openssl/{openssl-1.0.2n => openssl-1.0.2o}/parallel.patch       | 0
 .../openssl/{openssl-1.0.2n => openssl-1.0.2o}/ptest-deps.patch     | 0
 .../{openssl-1.0.2n => openssl-1.0.2o}/ptest_makefile_deps.patch    | 0
 .../{openssl-1.0.2n => openssl-1.0.2o}/reproducible-cflags.patch    | 0
 .../reproducible-mkbuildinf.patch                                   | 0
 .../openssl/{openssl-1.0.2n => openssl-1.0.2o}/run-ptest            | 0
 .../openssl/{openssl-1.0.2n => openssl-1.0.2o}/shared-libs.patch    | 0
 .../openssl/{openssl_1.0.2n.bb => openssl_1.0.2o.bb}                | 6 +++---
 33 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/0001-Fix-build-with-clang-using-external-assembler.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/0001-openssl-force-soft-link-to-avoid-rare-race.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/Makefiles-ptest.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/Use-SHA256-not-MD5-as-default-digest.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/configure-musl-target.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/debian1.0.2/block_digicert_malaysia.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/debian1.0.2/block_diginotar.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/debian1.0.2/soname.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/debian1.0.2/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/find.pl (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/openssl-c_rehash.sh (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/openssl-fix-des.pod-error.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/openssl-util-perlpath.pl-cwd.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/parallel.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/ptest-deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/ptest_makefile_deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/reproducible-cflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/reproducible-mkbuildinf.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/run-ptest (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2n => openssl-1.0.2o}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2n.bb => openssl_1.0.2o.bb} (91%)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/0001-Fix-build-with-clang-using-external-assembler.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-Fix-build-with-clang-using-external-assembler.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/0001-Fix-build-with-clang-using-external-assembler.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-Fix-build-with-clang-using-external-assembler.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/0001-openssl-force-soft-link-to-avoid-rare-race.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-openssl-force-soft-link-to-avoid-rare-race.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/0001-openssl-force-soft-link-to-avoid-rare-race.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-openssl-force-soft-link-to-avoid-rare-race.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/Makefiles-ptest.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/Makefiles-ptest.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/Makefiles-ptest.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/Makefiles-ptest.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/Use-SHA256-not-MD5-as-default-digest.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/Use-SHA256-not-MD5-as-default-digest.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/Use-SHA256-not-MD5-as-default-digest.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/Use-SHA256-not-MD5-as-default-digest.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/configure-musl-target.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/configure-musl-target.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/configure-musl-target.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/configure-musl-target.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/configure-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/configure-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/c_rehash-compat.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/c_rehash-compat.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/c_rehash-compat.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/ca.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/ca.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/debian-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/debian-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/pic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/pic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian1.0.2/block_digicert_malaysia.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/block_digicert_malaysia.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/debian1.0.2/block_digicert_malaysia.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/block_digicert_malaysia.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian1.0.2/block_diginotar.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/block_diginotar.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/debian1.0.2/block_diginotar.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/block_diginotar.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian1.0.2/soname.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/soname.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/debian1.0.2/soname.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/soname.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian1.0.2/version-script.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/debian1.0.2/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/engines-install-in-libdir-ssl.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/engines-install-in-libdir-ssl.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/engines-install-in-libdir-ssl.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/engines-install-in-libdir-ssl.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/find.pl b/meta/recipes-connectivity/openssl/openssl-1.0.2o/find.pl
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/find.pl
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/find.pl
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/oe-ldflags.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/oe-ldflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/oe-ldflags.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/oe-ldflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-c_rehash.sh b/meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-c_rehash.sh
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-c_rehash.sh
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-c_rehash.sh
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-fix-des.pod-error.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-fix-des.pod-error.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-fix-des.pod-error.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-fix-des.pod-error.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-util-perlpath.pl-cwd.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-util-perlpath.pl-cwd.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-util-perlpath.pl-cwd.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-util-perlpath.pl-cwd.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl_fix_for_x32.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl_fix_for_x32.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl_fix_for_x32.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/parallel.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/parallel.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/parallel.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/parallel.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/ptest-deps.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/ptest-deps.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/ptest-deps.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/ptest-deps.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/ptest_makefile_deps.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/ptest_makefile_deps.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/ptest_makefile_deps.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/ptest_makefile_deps.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/reproducible-cflags.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/reproducible-cflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/reproducible-cflags.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/reproducible-cflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/reproducible-mkbuildinf.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/reproducible-mkbuildinf.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/reproducible-mkbuildinf.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/reproducible-mkbuildinf.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/run-ptest b/meta/recipes-connectivity/openssl/openssl-1.0.2o/run-ptest
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/run-ptest
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/run-ptest
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2n/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/shared-libs.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2n/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2o/shared-libs.patch
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
similarity index 91%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index ae851067f91..413ebf37f4c 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -6,7 +6,7 @@ require openssl10.inc
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 CFLAG_append_class-native = " -fPIC"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=057d9218c6180e1d9ee407572b2dd225"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f475368924827d06d4b416111c8bdb77"
 
 export DIRS = "crypto ssl apps engines"
 export OE_LDFLAGS="${LDFLAGS}"
@@ -47,8 +47,8 @@ SRC_URI_append_class-target = "\
            file://reproducible-cflags.patch \
            file://reproducible-mkbuildinf.patch \
            "
-SRC_URI[md5sum] = "13bdc1b1d1ff39b6fd42a255e74676a4"
-SRC_URI[sha256sum] = "370babb75f278c39e0c50e8c4e7493bc0f18db6867478341a832a982fd15a8fe"
+SRC_URI[md5sum] = "44279b8557c3247cbe324e2322ecd114"
+SRC_URI[sha256sum] = "ec3f5c9714ba0fd45cb4e087301eb1336c317e0d20b575a125050470e8089e4d"
 
 PACKAGES =+ "${PN}-engines"
 FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
-- 
2.16.1


