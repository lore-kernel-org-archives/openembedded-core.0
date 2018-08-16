Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id D05E6791F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 12:28:10 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w7GCSApq021901
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 14:28:10 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w7GCSAUO013155;
	Thu, 16 Aug 2018 14:28:10 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id D6B3C922F1D;
	Thu, 16 Aug 2018 14:28:09 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2018 14:27:56 +0200
Message-Id: <20180816122757.4178-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] openssl: update 1.0.2o -> 1.0.2p
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
X-List-Received-Date: Thu, 16 Aug 2018 12:28:11 -0000

Please see this security advisory:
https://www.openssl.org/news/secadv/20180612.txt

Refresh patches

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 ...build-with-clang-using-external-assembler.patch |  0
 .../0001-allow-manpages-to-be-disabled.patch       |  0
 ...penssl-force-soft-link-to-avoid-rare-race.patch |  0
 .../Makefiles-ptest.patch                          | 18 ++++------
 .../Use-SHA256-not-MD5-as-default-digest.patch     |  0
 .../configure-musl-target.patch                    |  0
 .../configure-targets.patch                        |  0
 .../debian/c_rehash-compat.patch                   |  0
 .../debian/debian-targets.patch                    |  0
 .../debian/man-dir.patch                           |  0
 .../debian/man-section.patch                       |  0
 .../debian/no-rpath.patch                          |  0
 .../debian/no-symbolic.patch                       |  0
 .../debian/pic.patch                               |  0
 .../debian1.0.2/block_digicert_malaysia.patch      |  0
 .../debian1.0.2/block_diginotar.patch              |  0
 .../debian1.0.2/soname.patch                       |  0
 .../debian1.0.2/version-script.patch               |  0
 .../engines-install-in-libdir-ssl.patch            |  0
 .../oe-ldflags.patch                               |  0
 .../openssl-c_rehash.sh                            |  0
 .../openssl-fix-des.pod-error.patch                |  0
 .../openssl_fix_for_x32.patch                      |  0
 .../parallel.patch                                 | 40 ++++++++++------------
 .../ptest-deps.patch                               |  0
 .../ptest_makefile_deps.patch                      |  0
 .../reproducible-cflags.patch                      |  0
 .../reproducible-mkbuildinf.patch                  |  0
 .../{openssl-1.0.2o => openssl-1.0.2p}/run-ptest   |  0
 .../shared-libs.patch                              |  0
 .../{openssl_1.0.2o.bb => openssl_1.0.2p.bb}       |  4 +--
 31 files changed, 28 insertions(+), 34 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/0001-Fix-build-with-clang-using-external-assembler.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/0001-allow-manpages-to-be-disabled.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/0001-openssl-force-soft-link-to-avoid-rare-race.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/Makefiles-ptest.patch (87%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/Use-SHA256-not-MD5-as-default-digest.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/configure-musl-target.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian1.0.2/block_digicert_malaysia.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian1.0.2/block_diginotar.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian1.0.2/soname.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/debian1.0.2/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/openssl-c_rehash.sh (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/openssl-fix-des.pod-error.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/parallel.patch (92%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/ptest-deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/ptest_makefile_deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/reproducible-cflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/reproducible-mkbuildinf.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/run-ptest (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2o => openssl-1.0.2p}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2o.bb => openssl_1.0.2p.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-Fix-build-with-clang-using-external-assembler.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/0001-Fix-build-with-clang-using-external-assembler.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-Fix-build-with-clang-using-external-assembler.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/0001-Fix-build-with-clang-using-external-assembler.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/0001-allow-manpages-to-be-disabled.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-allow-manpages-to-be-disabled.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/0001-allow-manpages-to-be-disabled.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-openssl-force-soft-link-to-avoid-rare-race.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/0001-openssl-force-soft-link-to-avoid-rare-race.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/0001-openssl-force-soft-link-to-avoid-rare-race.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/0001-openssl-force-soft-link-to-avoid-rare-race.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/Makefiles-ptest.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/Makefiles-ptest.patch
similarity index 87%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/Makefiles-ptest.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/Makefiles-ptest.patch
index 2122fa1fb4..1b8402af97 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.2o/Makefiles-ptest.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.2p/Makefiles-ptest.patch
@@ -11,18 +11,15 @@ Signed-off-by: Maxin B. John <maxin.john@enea.com>
 Upstream-Status: Pending
 
 ---
- Makefile.org       |  10 +-
- Makefile.org.orig  |   7 +-
- test/Makefile      |  13 +-
- test/Makefile.orig | 987 +++++++++++++++++++++++++++++++++++++++++++++++++++++
- 4 files changed, 1009 insertions(+), 8 deletions(-)
- create mode 100644 test/Makefile.orig
-
+ Makefile.org  | 10 +++++++++-
+ test/Makefile | 13 +++++++++----
+ 2 files changed, 18 insertions(+), 5 deletions(-)
+ 
 diff --git a/Makefile.org b/Makefile.org
 index 111fbba..8e7936c 100644
 --- a/Makefile.org
 +++ b/Makefile.org
-@@ -468,8 +468,16 @@ rehash.time: certs apps
+@@ -467,8 +467,16 @@ rehash.time: certs apps
  test:   tests
  
  tests: rehash
@@ -41,7 +38,7 @@ index 111fbba..8e7936c 100644
  
  report:
 diff --git a/test/Makefile b/test/Makefile
-index a1f7eeb..b2984c4 100644
+index 55a6b50..d46b4d1 100644
 --- a/test/Makefile
 +++ b/test/Makefile
 @@ -150,7 +150,7 @@ tests:	exe apps $(TESTS)
@@ -55,7 +52,7 @@ index a1f7eeb..b2984c4 100644
  	test_rmd test_rc2 test_rc4 test_rc5 test_bf test_cast test_aes \
 @@ -162,6 +162,11 @@ alltests: \
  	test_constant_time test_verify_extra test_clienthello test_sslv2conftest \
- 	test_dtls test_bad_dtls test_fatalerr
+ 	test_dtls test_bad_dtls test_fatalerr test_x509_time
  
 +alltests:
 +	@(for i in $(all-tests); do \
@@ -90,4 +87,3 @@ index a1f7eeb..b2984c4 100644
  
 -- 
 2.15.1
-
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/Use-SHA256-not-MD5-as-default-digest.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/Use-SHA256-not-MD5-as-default-digest.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/Use-SHA256-not-MD5-as-default-digest.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/Use-SHA256-not-MD5-as-default-digest.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/configure-musl-target.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/configure-musl-target.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/configure-musl-target.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/configure-musl-target.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/configure-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/configure-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/c_rehash-compat.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/c_rehash-compat.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/c_rehash-compat.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/debian-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/debian-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/pic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/debian/pic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/block_digicert_malaysia.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian1.0.2/block_digicert_malaysia.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/block_digicert_malaysia.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/debian1.0.2/block_digicert_malaysia.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/block_diginotar.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian1.0.2/block_diginotar.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/block_diginotar.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/debian1.0.2/block_diginotar.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/soname.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian1.0.2/soname.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/soname.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/debian1.0.2/soname.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/version-script.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/debian1.0.2/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/debian1.0.2/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/debian1.0.2/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/engines-install-in-libdir-ssl.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/engines-install-in-libdir-ssl.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/engines-install-in-libdir-ssl.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/engines-install-in-libdir-ssl.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/oe-ldflags.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/oe-ldflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/oe-ldflags.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/oe-ldflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-c_rehash.sh b/meta/recipes-connectivity/openssl/openssl-1.0.2p/openssl-c_rehash.sh
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-c_rehash.sh
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/openssl-c_rehash.sh
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-fix-des.pod-error.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/openssl-fix-des.pod-error.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-fix-des.pod-error.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/openssl-fix-des.pod-error.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/openssl_fix_for_x32.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl_fix_for_x32.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/openssl_fix_for_x32.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/parallel.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/parallel.patch
similarity index 92%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/parallel.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/parallel.patch
index e5413bf389..41abf3d6bd 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.2o/parallel.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.2p/parallel.patch
@@ -13,24 +13,18 @@ Refreshed for 1.0.2i
 Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 
 ---
- Makefile.org          |  14 +-
- Makefile.org.orig     |  10 +-
- Makefile.shared       |   2 +
- Makefile.shared.orig  | 655 ++++++++++++++++++++++++++++++++++++++++++++++++++
- crypto/Makefile       |  10 +-
- engines/Makefile      |   6 +-
- engines/Makefile.orig | 338 ++++++++++++++++++++++++++
- test/Makefile         |  92 +++----
- test/Makefile.orig    |  88 ++++---
- 9 files changed, 1108 insertions(+), 107 deletions(-)
- create mode 100644 Makefile.shared.orig
- create mode 100644 engines/Makefile.orig
+ Makefile.org                                   | 14 ++--
+ Makefile.shared                                |  2 +
+ crypto/Makefile                                | 10 +--
+ engines/Makefile                               |  6 +-
+ test/Makefile                                  | 94 +++++++++++-----------
+ 5 files changed, 64 insertions(+), 62 deletions(-)
 
 diff --git a/Makefile.org b/Makefile.org
-index 8e7936c..ed98d2a 100644
+index efcfafb..82eab91 100644
 --- a/Makefile.org
 +++ b/Makefile.org
-@@ -283,17 +283,17 @@ build_libcrypto: build_crypto build_engines libcrypto.pc
+@@ -282,17 +282,17 @@ build_libcrypto: build_crypto build_engines libcrypto.pc
  build_libssl: build_ssl libssl.pc
  
  build_crypto:
@@ -54,7 +48,7 @@ index 8e7936c..ed98d2a 100644
  
  all_testapps: build_libs build_testapps
  build_testapps:
-@@ -565,7 +565,7 @@ install_sw:
+@@ -564,7 +564,7 @@ install_sw:
  	(cp $$i $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i; \
  	chmod 644 $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i ); \
  	done;
@@ -64,7 +58,7 @@ index 8e7936c..ed98d2a 100644
  	do \
  		if [ -f "$$i" ]; then \
 diff --git a/Makefile.shared b/Makefile.shared
-index f6f92e7..8164186 100644
+index bbefb2b..18013a9 100644
 --- a/Makefile.shared
 +++ b/Makefile.shared
 @@ -105,6 +105,7 @@ LINK_SO=	\
@@ -84,7 +78,7 @@ index f6f92e7..8164186 100644
  			  ln -s $$prev $$SHLIB$$SHLIB_SUFFIX ); \
  		fi; \
 diff --git a/crypto/Makefile b/crypto/Makefile
-index 17a87f8..29c2dcf 100644
+index 875ea1a..c22b683 100644
 --- a/crypto/Makefile
 +++ b/crypto/Makefile
 @@ -85,11 +85,11 @@ testapps:
@@ -160,7 +154,7 @@ index fe8e9ca..a43d21b 100644
  tags:
  	ctags $(SRC)
 diff --git a/test/Makefile b/test/Makefile
-index 40abd60..78d3788 100644
+index 36506cf..c69af8b 100644
 --- a/test/Makefile
 +++ b/test/Makefile
 @@ -145,7 +145,7 @@ install:
@@ -172,7 +166,7 @@ index 40abd60..78d3788 100644
  
  apps:
  	@(cd ..; $(MAKE) DIRS=apps all)
-@@ -444,139 +444,139 @@ BUILD_CMD_STATIC=shlib_target=; \
+@@ -448,142 +448,142 @@ BUILD_CMD_STATIC=shlib_target=; \
  		link_app.$${shlib_target}
  
  $(RSATEST)$(EXE_EXT): $(RSATEST).o $(DLIBCRYPTO)
@@ -345,7 +339,11 @@ index 40abd60..78d3788 100644
  
  $(FATALERRTEST)$(EXE_EXT): $(FATALERRTEST).o ssltestlib.o $(DLIBSSL) $(DLIBCRYPTO)
  	@target=$(FATALERRTEST); exobj=ssltestlib.o; $(BUILD_CMD)
- 
+
+ $(X509TIMETEST)$(EXE_EXT): $(X509TIMETEST).o
+-	@target=$(X509TIMETEST) $(BUILD_CMD)
++	+@target=$(X509TIMETEST) $(BUILD_CMD)
+
  $(SSLV2CONFTEST)$(EXE_EXT): $(SSLV2CONFTEST).o
 -	@target=$(SSLV2CONFTEST) $(BUILD_CMD)
 +	+@target=$(SSLV2CONFTEST) $(BUILD_CMD)
@@ -356,7 +354,7 @@ index 40abd60..78d3788 100644
  
  #$(AESTEST).o: $(AESTEST).c
  #	$(CC) -c $(CFLAGS) -DINTERMEDIATE_VALUE_KAT -DTRACE_KAT_MCT $(AESTEST).c
-@@ -589,7 +589,7 @@ $(DTLSTEST)$(EXE_EXT): $(DTLSTEST).o ssltestlib.o $(DLIBSSL) $(DLIBCRYPTO)
+@@ -596,7 +596,7 @@ $(DTLSTEST)$(EXE_EXT): $(DTLSTEST).o ssltestlib.o $(DLIBSSL) $(DLIBCRYPTO)
  #	fi
  
  dummytest$(EXE_EXT): dummytest.o $(DLIBCRYPTO)
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/ptest-deps.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/ptest-deps.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/ptest-deps.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/ptest-deps.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/ptest_makefile_deps.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/ptest_makefile_deps.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/ptest_makefile_deps.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/ptest_makefile_deps.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/reproducible-cflags.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/reproducible-cflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/reproducible-cflags.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/reproducible-cflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/reproducible-mkbuildinf.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/reproducible-mkbuildinf.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/reproducible-mkbuildinf.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/reproducible-mkbuildinf.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/run-ptest b/meta/recipes-connectivity/openssl/openssl-1.0.2p/run-ptest
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/run-ptest
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/run-ptest
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2p/shared-libs.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2o/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2p/shared-libs.patch
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
index 8ba03b603c..5d419772f9 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
@@ -53,8 +53,8 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[md5sum] = "44279b8557c3247cbe324e2322ecd114"
-SRC_URI[sha256sum] = "ec3f5c9714ba0fd45cb4e087301eb1336c317e0d20b575a125050470e8089e4d"
+SRC_URI[md5sum] = "ac5eb30bf5798aa14b1ae6d0e7da58df"
+SRC_URI[sha256sum] = "50a98e07b1a89eb8f6a99477f262df71c6fa7bef77df4dc83025a2845c827d00"
 
 UPSTREAM_CHECK_REGEX = "openssl-(?P<pver>1\.0.+)\.tar"
 
-- 
2.11.0


