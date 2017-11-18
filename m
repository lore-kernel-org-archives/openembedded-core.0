Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 37A2A78871
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Nov 2017 09:00:08 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id D18DE5C37E5;
	Sat, 18 Nov 2017 09:54:44 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Nov 2017 10:00:00 +0100
Message-Id: <20171118090003.48218-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1510995285; bh=kuJk6Rp7/JHbWGpzEawvTYexbsi+i0ZJzTJ/cd54djY=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=kpJInU0iKaOZQ9MGguajRKdtzrkJ7VqP1uxtutcN8k1xeBxiY/vg+A2b4v/fV5DFC2X8321EAzUb7xvK+MIO3PO4aqDWQShtzqDddLU6jECiq+SYeVlHMP2ZmvMSCX7BS2fYDgLXpcgsnngdxBATlvzVNY6gs22NMZ+AowrqpXk=
Cc: Stefan Agner <stefan.agner@toradex.com>, otavio@ossystems.com.br
Subject: [rocko][PATCH v2 1/4] openssl10: Upgrade 1.0.2l -> 1.0.2m
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
X-List-Received-Date: Sat, 18 Nov 2017 09:00:08 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Deals with two CVEs:
* bn_sqrx8x_internal carry bug on x86_64 (CVE-2017-3736)
* Malformed X.509 IPAddressFamily could cause OOB read (CVE-2017-3735)

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../0001-Fix-build-with-clang-using-external-assembler.patch          | 0
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
 32 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2l => openssl-1.0.2m}/0001-Fix-build-with-clang-using-external-assembler.patch (100%)
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

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-Fix-build-with-clang-using-external-assembler.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-Fix-build-with-clang-using-external-assembler.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-Fix-build-with-clang-using-external-assembler.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-Fix-build-with-clang-using-external-assembler.patch
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
index 8c34ea60e5..b28420b075 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
@@ -42,8 +42,8 @@ SRC_URI += "file://find.pl;subdir=openssl-${PV}/util/ \
             file://Use-SHA256-not-MD5-as-default-digest.patch \
             file://0001-Fix-build-with-clang-using-external-assembler.patch \
             "
-SRC_URI[md5sum] = "f85123cd390e864dfbe517e7616e6566"
-SRC_URI[sha256sum] = "ce07195b659e75f4e1db43552860070061f156a98bb37b672b101ba6e3ddf30c"
+SRC_URI[md5sum] = "10e9e37f492094b9ef296f68f24a7666"
+SRC_URI[sha256sum] = "8c6ff15ec6b319b50788f42c7abc2890c08ba5a1cdcd3810eb9092deada37b0f"
 
 PACKAGES =+ "${PN}-engines"
 FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
-- 
2.13.6


