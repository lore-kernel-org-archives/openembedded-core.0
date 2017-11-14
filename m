Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A74B578577
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:58:18 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:58:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402298"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:58:19 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:54 +0200
Message-Id: <20171114145754.9643-27-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 27/27] openssl: update to 1.0.2m, 1.1.0g
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
X-List-Received-Date: Tue, 14 Nov 2017 14:58:19 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-Fix-build-with-clang-using-external-assembler.patch          | 0
 .../0001-openssl-force-soft-link-to-avoid-rare-race.patch             | 0
 .../openssl/{openssl-1.0.2l => openssl-1.0.2m}/Makefiles-ptest.patch  | 0
 .../Use-SHA256-not-MD5-as-default-digest.patch                        | 0
 .../{openssl-1.0.2l => openssl-1.0.2m}/configure-musl-target.patch    | 0
 .../{openssl-1.0.2l => openssl-1.0.2m}/configure-targets.patch        | 0
 .../{openssl-1.0.2l => openssl-1.0.2m}/debian/c_rehash-compat.patch   | 0
 .../openssl/{openssl-1.0.2l => openssl-1.0.2m}/debian/ca.patch        | 0
 .../{openssl-1.0.2l => openssl-1.0.2m}/debian/debian-targets.patch    | 0
 .../openssl/{openssl-1.0.2l => openssl-1.0.2m}/debian/man-dir.patch   | 0
 .../{openssl-1.0.2l => openssl-1.0.2m}/debian/man-section.patch       | 0
 .../openssl/{openssl-1.0.2l => openssl-1.0.2m}/debian/no-rpath.patch  | 0
 .../{openssl-1.0.2l => openssl-1.0.2m}/debian/no-symbolic.patch       | 0
 .../openssl/{openssl-1.0.2l => openssl-1.0.2m}/debian/pic.patch       | 0
 .../{openssl-1.0.2l => openssl-1.0.2m}/debian/version-script.patch    | 0
 .../debian1.0.2/block_digicert_malaysia.patch                         | 0
 .../debian1.0.2/block_diginotar.patch                                 | 0
 .../{openssl-1.0.2l => openssl-1.0.2m}/debian1.0.2/soname.patch       | 0
 .../debian1.0.2/version-script.patch                                  | 0
 .../engines-install-in-libdir-ssl.patch                               | 0
 .../openssl/{openssl-1.0.2l => openssl-1.0.2m}/find.pl                | 0
 .../openssl/{openssl-1.0.2l => openssl-1.0.2m}/oe-ldflags.patch       | 0
 .../{openssl-1.0.2l => openssl-1.0.2m}/openssl-1.0.2a-x32-asm.patch   | 0
 .../openssl/{openssl-1.0.2l => openssl-1.0.2m}/openssl-c_rehash.sh    | 0
 .../openssl-fix-des.pod-error.patch                                   | 0
 .../openssl-util-perlpath.pl-cwd.patch                                | 0
 .../{openssl-1.0.2l => openssl-1.0.2m}/openssl_fix_for_x32.patch      | 0
 .../openssl/{openssl-1.0.2l => openssl-1.0.2m}/parallel.patch         | 0
 .../openssl/{openssl-1.0.2l => openssl-1.0.2m}/ptest-deps.patch       | 0
 .../{openssl-1.0.2l => openssl-1.0.2m}/ptest_makefile_deps.patch      | 0
 .../openssl/{openssl-1.0.2l => openssl-1.0.2m}/run-ptest              | 0
 .../openssl/{openssl-1.0.2l => openssl-1.0.2m}/shared-libs.patch      | 0
 .../openssl/{openssl_1.0.2l.bb => openssl_1.0.2m.bb}                  | 4 ++--
 .../openssl/{openssl_1.1.0f.bb => openssl_1.1.0g.bb}                  | 4 ++--
 34 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/0001-Fix-build-with-clang-using-external-assembler.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/0001-openssl-force-soft-link-to-avoid-rare-race.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/Makefiles-ptest.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/Use-SHA256-not-MD5-as-default-digest.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/configure-musl-target.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/debian1.0.2/block_digicert_malaysia.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/debian1.0.2/block_diginotar.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/debian1.0.2/soname.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/debian1.0.2/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/find.pl (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/openssl-1.0.2a-x32-asm.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/openssl-c_rehash.sh (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/openssl-fix-des.pod-error.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/openssl-util-perlpath.pl-cwd.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/parallel.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/ptest-deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/ptest_makefile_deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/run-ptest (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2l.bb => openssl_1.0.2m.bb} (94%)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.0f.bb => openssl_1.1.0g.bb} (96%)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-Fix-build-with-clang-using-external-assembler.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-Fix-build-with-clang-using-external-assembler.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-Fix-build-with-clang-using-external-assembler.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-Fix-build-with-clang-using-external-assembler.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-openssl-force-soft-link-to-avoid-rare-race.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-openssl-force-soft-link-to-avoid-rare-race.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-openssl-force-soft-link-to-avoid-rare-race.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-openssl-force-soft-link-to-avoid-rare-race.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/Makefiles-ptest.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/Makefiles-ptest.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/Makefiles-ptest.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/Makefiles-ptest.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/Use-SHA256-not-MD5-as-default-digest.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/Use-SHA256-not-MD5-as-default-digest.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/Use-SHA256-not-MD5-as-default-digest.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/Use-SHA256-not-MD5-as-default-digest.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/configure-musl-target.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/configure-musl-target.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/configure-musl-target.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/configure-musl-target.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/configure-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/configure-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/c_rehash-compat.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/c_rehash-compat.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/c_rehash-compat.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/ca.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/ca.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/ca.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/debian-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/debian-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/pic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/pic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/block_digicert_malaysia.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/block_digicert_malaysia.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/block_digicert_malaysia.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/block_digicert_malaysia.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/block_diginotar.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/block_diginotar.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/block_diginotar.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/block_diginotar.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/soname.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/soname.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/soname.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/soname.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/version-script.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/engines-install-in-libdir-ssl.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/engines-install-in-libdir-ssl.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/engines-install-in-libdir-ssl.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/engines-install-in-libdir-ssl.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/find.pl b/meta/recipes-connectivity/openssl/openssl-1.0.2m/find.pl
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/find.pl
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/find.pl
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/oe-ldflags.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/oe-ldflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/oe-ldflags.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/oe-ldflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-1.0.2a-x32-asm.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-1.0.2a-x32-asm.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-1.0.2a-x32-asm.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-1.0.2a-x32-asm.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-c_rehash.sh b/meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-c_rehash.sh
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-c_rehash.sh
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-c_rehash.sh
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-fix-des.pod-error.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-fix-des.pod-error.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-fix-des.pod-error.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-fix-des.pod-error.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-util-perlpath.pl-cwd.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-util-perlpath.pl-cwd.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-util-perlpath.pl-cwd.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-util-perlpath.pl-cwd.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl_fix_for_x32.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl_fix_for_x32.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl_fix_for_x32.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/parallel.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/parallel.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/parallel.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/parallel.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/ptest-deps.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/ptest-deps.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/ptest-deps.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/ptest-deps.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/ptest_makefile_deps.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/ptest_makefile_deps.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/ptest_makefile_deps.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/ptest_makefile_deps.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/run-ptest b/meta/recipes-connectivity/openssl/openssl-1.0.2m/run-ptest
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/run-ptest
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/run-ptest
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/shared-libs.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/shared-libs.patch
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
similarity index 94%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
index c537aa4cd0a..04763ac3469 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
@@ -43,8 +43,8 @@ SRC_URI += "file://find.pl;subdir=openssl-${PV}/util/ \
             file://0001-Fix-build-with-clang-using-external-assembler.patch \
             file://0001-openssl-force-soft-link-to-avoid-rare-race.patch  \
             "
-SRC_URI[md5sum] = "f85123cd390e864dfbe517e7616e6566"
-SRC_URI[sha256sum] = "ce07195b659e75f4e1db43552860070061f156a98bb37b672b101ba6e3ddf30c"
+SRC_URI[md5sum] = "10e9e37f492094b9ef296f68f24a7666"
+SRC_URI[sha256sum] = "8c6ff15ec6b319b50788f42c7abc2890c08ba5a1cdcd3810eb9092deada37b0f"
 
 PACKAGES =+ "${PN}-engines"
 FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
similarity index 96%
rename from meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
index 4517f8734a3..c85a1d27a21 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cae6da10f4ffd9703214776d2aabce32"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "7b521dea79ab159e8ec879d2333369fa"
-SRC_URI[sha256sum] = "12f746f3f2493b2f39da7ecf63d7ee19c6ac9ec6a4fcd8c229da8a522cb12765"
+SRC_URI[md5sum] = "ba5f1b8b835b88cadbce9b35ed9531a6"
+SRC_URI[sha256sum] = "de4d501267da39310905cb6dc8c6121f7a2cad45a7707f76df828fe1b85073af"
 
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
-- 
2.15.0


