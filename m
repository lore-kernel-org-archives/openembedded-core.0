Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 09F4078531
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 18:02:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2018 10:02:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,444,1511856000"; d="scan'208";a="200465160"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2018 10:02:14 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 20:01:54 +0200
Message-Id: <20180201180210.21652-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/20] openssl: update to 1.0.2n
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
X-List-Received-Date: Thu, 01 Feb 2018 18:02:14 -0000

Drop upstreamed 0001-aes-armv4-bsaes-armv7-sha256-armv4-.pl-make-it-work-.patch

Rebase a couple more patches (via devtool upgrade).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...saes-armv7-sha256-armv4-.pl-make-it-work-.patch | 100 ------------
 ...build-with-clang-using-external-assembler.patch |   0
 ...penssl-force-soft-link-to-avoid-rare-race.patch |   0
 .../Makefiles-ptest.patch                          |  46 ++++--
 .../Use-SHA256-not-MD5-as-default-digest.patch     |   0
 .../configure-musl-target.patch                    |   0
 .../configure-targets.patch                        |   0
 .../debian/c_rehash-compat.patch                   |   0
 .../debian/ca.patch                                |   0
 .../debian/debian-targets.patch                    |   0
 .../debian/man-dir.patch                           |   0
 .../debian/man-section.patch                       |   0
 .../debian/no-rpath.patch                          |   0
 .../debian/no-symbolic.patch                       |   0
 .../debian/pic.patch                               |   0
 .../debian1.0.2/block_digicert_malaysia.patch      |   0
 .../debian1.0.2/block_diginotar.patch              |   0
 .../debian1.0.2/soname.patch                       |   0
 .../debian1.0.2/version-script.patch               |   0
 .../engines-install-in-libdir-ssl.patch            |   0
 .../{openssl-1.0.2m => openssl-1.0.2n}/find.pl     |   0
 .../oe-ldflags.patch                               |   0
 .../openssl-1.0.2a-x32-asm.patch                   |   0
 .../openssl-c_rehash.sh                            |   0
 .../openssl-fix-des.pod-error.patch                |   0
 .../openssl-util-perlpath.pl-cwd.patch             |   0
 .../openssl_fix_for_x32.patch                      |   0
 .../parallel.patch                                 | 177 ++++++++++++---------
 .../ptest-deps.patch                               |   0
 .../ptest_makefile_deps.patch                      |   0
 .../{openssl-1.0.2m => openssl-1.0.2n}/run-ptest   |   0
 .../shared-libs.patch                              |   0
 .../recipes-connectivity/openssl/openssl_1.0.2m.bb |  61 -------
 .../recipes-connectivity/openssl/openssl_1.0.2n.bb |  60 +++++++
 34 files changed, 196 insertions(+), 248 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-aes-armv4-bsaes-armv7-sha256-armv4-.pl-make-it-work-.patch
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/0001-Fix-build-with-clang-using-external-assembler.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/0001-openssl-force-soft-link-to-avoid-rare-race.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/Makefiles-ptest.patch (61%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/Use-SHA256-not-MD5-as-default-digest.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/configure-musl-target.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/debian1.0.2/block_digicert_malaysia.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/debian1.0.2/block_diginotar.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/debian1.0.2/soname.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/debian1.0.2/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/find.pl (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/openssl-1.0.2a-x32-asm.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/openssl-c_rehash.sh (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/openssl-fix-des.pod-error.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/openssl-util-perlpath.pl-cwd.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/parallel.patch (80%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/ptest-deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/ptest_makefile_deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/run-ptest (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2m => openssl-1.0.2n}/shared-libs.patch (100%)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
 create mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.2n.bb

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-aes-armv4-bsaes-armv7-sha256-armv4-.pl-make-it-work-.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-aes-armv4-bsaes-armv7-sha256-armv4-.pl-make-it-work-.patch
deleted file mode 100644
index 2ce0320c49c..00000000000
--- a/meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-aes-armv4-bsaes-armv7-sha256-armv4-.pl-make-it-work-.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From d1d6c69b6fd25e71dbae67fad17b2c7737f6b2dc Mon Sep 17 00:00:00 2001
-From: Andy Polyakov <appro@openssl.org>
-Date: Sun, 5 Nov 2017 17:08:16 +0100
-Subject: [PATCH] {aes-armv4|bsaes-armv7|sha256-armv4}.pl: make it work with
- binutils-2.29
-
-It's not clear if it's a feature or bug, but binutils-2.29[.1]
-interprets 'adr' instruction with Thumb2 code reference differently,
-in a way that affects calculation of addresses of constants' tables.
-
-Upstream-Status: Backport
-
-Reviewed-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
-Reviewed-by: Kurt Roeckx <kurt@roeckx.be>
-Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
-(Merged from https://github.com/openssl/openssl/pull/4673)
----
- crypto/aes/asm/aes-armv4.pl    | 6 +++---
- crypto/aes/asm/bsaes-armv7.pl  | 6 +++---
- crypto/sha/asm/sha256-armv4.pl | 2 +-
- 3 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/crypto/aes/asm/aes-armv4.pl b/crypto/aes/asm/aes-armv4.pl
-index 4f8917089f..c1b5e352d7 100644
---- a/crypto/aes/asm/aes-armv4.pl
-+++ b/crypto/aes/asm/aes-armv4.pl
-@@ -184,7 +184,7 @@ AES_encrypt:
- #if __ARM_ARCH__<7
- 	sub	r3,pc,#8		@ AES_encrypt
- #else
--	adr	r3,AES_encrypt
-+	adr	r3,.
- #endif
- 	stmdb   sp!,{r1,r4-r12,lr}
- 	mov	$rounds,r0		@ inp
-@@ -430,7 +430,7 @@ _armv4_AES_set_encrypt_key:
- #if __ARM_ARCH__<7
- 	sub	r3,pc,#8		@ AES_set_encrypt_key
- #else
--	adr	r3,private_AES_set_encrypt_key
-+	adr	r3,.
- #endif
- 	teq	r0,#0
- #if __ARM_ARCH__>=7
-@@ -952,7 +952,7 @@ AES_decrypt:
- #if __ARM_ARCH__<7
- 	sub	r3,pc,#8		@ AES_decrypt
- #else
--	adr	r3,AES_decrypt
-+	adr	r3,.
- #endif
- 	stmdb   sp!,{r1,r4-r12,lr}
- 	mov	$rounds,r0		@ inp
-diff --git a/crypto/aes/asm/bsaes-armv7.pl b/crypto/aes/asm/bsaes-armv7.pl
-index 70b3f9656f..ec66b0502a 100644
---- a/crypto/aes/asm/bsaes-armv7.pl
-+++ b/crypto/aes/asm/bsaes-armv7.pl
-@@ -724,7 +724,7 @@ $code.=<<___;
- .type	_bsaes_decrypt8,%function
- .align	4
- _bsaes_decrypt8:
--	adr	$const,_bsaes_decrypt8
-+	adr	$const,.
- 	vldmia	$key!, {@XMM[9]}		@ round 0 key
- 	add	$const,$const,#.LM0ISR-_bsaes_decrypt8
- 
-@@ -819,7 +819,7 @@ _bsaes_const:
- .type	_bsaes_encrypt8,%function
- .align	4
- _bsaes_encrypt8:
--	adr	$const,_bsaes_encrypt8
-+	adr	$const,.
- 	vldmia	$key!, {@XMM[9]}		@ round 0 key
- 	sub	$const,$const,#_bsaes_encrypt8-.LM0SR
- 
-@@ -923,7 +923,7 @@ $code.=<<___;
- .type	_bsaes_key_convert,%function
- .align	4
- _bsaes_key_convert:
--	adr	$const,_bsaes_key_convert
-+	adr	$const,.
- 	vld1.8	{@XMM[7]},  [$inp]!		@ load round 0 key
- 	sub	$const,$const,#_bsaes_key_convert-.LM0
- 	vld1.8	{@XMM[15]}, [$inp]!		@ load round 1 key
-diff --git a/crypto/sha/asm/sha256-armv4.pl b/crypto/sha/asm/sha256-armv4.pl
-index 4fee74d832..750216eb42 100644
---- a/crypto/sha/asm/sha256-armv4.pl
-+++ b/crypto/sha/asm/sha256-armv4.pl
-@@ -205,7 +205,7 @@ sha256_block_data_order:
- #if __ARM_ARCH__<7
- 	sub	r3,pc,#8		@ sha256_block_data_order
- #else
--	adr	r3,sha256_block_data_order
-+	adr	r3,.
- #endif
- #if __ARM_MAX_ARCH__>=7 && !defined(__KERNEL__)
- 	ldr	r12,.LOPENSSL_armcap
--- 
-2.15.0
-
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-Fix-build-with-clang-using-external-assembler.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/0001-Fix-build-with-clang-using-external-assembler.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-Fix-build-with-clang-using-external-assembler.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/0001-Fix-build-with-clang-using-external-assembler.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-openssl-force-soft-link-to-avoid-rare-race.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/0001-openssl-force-soft-link-to-avoid-rare-race.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-openssl-force-soft-link-to-avoid-rare-race.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/0001-openssl-force-soft-link-to-avoid-rare-race.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/Makefiles-ptest.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/Makefiles-ptest.patch
similarity index 61%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/Makefiles-ptest.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/Makefiles-ptest.patch
index 249446a5bd5..2122fa1fb48 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.2m/Makefiles-ptest.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.2n/Makefiles-ptest.patch
@@ -1,15 +1,28 @@
+From a176c69f4fdfbfa7e4ccb79d91c3b6602da7e69a Mon Sep 17 00:00:00 2001
+From: Anders Roxell <anders.roxell@enea.com>
+Date: Thu, 24 Apr 2014 19:28:25 +0200
+Subject: [PATCH 19/28] openssl: enable ptest support
+
 Add 'buildtest' and 'runtest' targets to Makefile, to build and run tests
 cross-compiled.
 
 Signed-off-by: Anders Roxell <anders.roxell@enea.com>
 Signed-off-by: Maxin B. John <maxin.john@enea.com>
 Upstream-Status: Pending
+
 ---
-Index: openssl-1.0.2/Makefile.org
-===================================================================
---- openssl-1.0.2.orig/Makefile.org
-+++ openssl-1.0.2/Makefile.org
-@@ -451,8 +451,16 @@ rehash.time: certs apps
+ Makefile.org       |  10 +-
+ Makefile.org.orig  |   7 +-
+ test/Makefile      |  13 +-
+ test/Makefile.orig | 987 +++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 1009 insertions(+), 8 deletions(-)
+ create mode 100644 test/Makefile.orig
+
+diff --git a/Makefile.org b/Makefile.org
+index 111fbba..8e7936c 100644
+--- a/Makefile.org
++++ b/Makefile.org
+@@ -468,8 +468,16 @@ rehash.time: certs apps
  test:   tests
  
  tests: rehash
@@ -27,11 +40,11 @@ Index: openssl-1.0.2/Makefile.org
  	OPENSSL_CONF=apps/openssl.cnf util/opensslwrap.sh version -a
  
  report:
-Index: openssl-1.0.2/test/Makefile
-===================================================================
---- openssl-1.0.2.orig/test/Makefile
-+++ openssl-1.0.2/test/Makefile
-@@ -137,7 +137,7 @@ tests:	exe apps $(TESTS)
+diff --git a/test/Makefile b/test/Makefile
+index a1f7eeb..b2984c4 100644
+--- a/test/Makefile
++++ b/test/Makefile
+@@ -150,7 +150,7 @@ tests:	exe apps $(TESTS)
  apps:
  	@(cd ..; $(MAKE) DIRS=apps all)
  
@@ -40,9 +53,9 @@ Index: openssl-1.0.2/test/Makefile
  	test_des test_idea test_sha test_md4 test_md5 test_hmac \
  	test_md2 test_mdc2 test_wp \
  	test_rmd test_rc2 test_rc4 test_rc5 test_bf test_cast test_aes \
-@@ -148,6 +148,11 @@ alltests: \
- 	test_jpake test_srp test_cms test_ocsp test_v3name test_heartbeat \
- 	test_constant_time
+@@ -162,6 +162,11 @@ alltests: \
+ 	test_constant_time test_verify_extra test_clienthello test_sslv2conftest \
+ 	test_dtls test_bad_dtls test_fatalerr
  
 +alltests:
 +	@(for i in $(all-tests); do \
@@ -52,7 +65,7 @@ Index: openssl-1.0.2/test/Makefile
  test_evp: $(EVPTEST)$(EXE_EXT) evptests.txt
  	../util/shlib_wrap.sh ./$(EVPTEST) evptests.txt
  
-@@ -213,7 +218,7 @@ test_x509: ../apps/openssl$(EXE_EXT) tx5
+@@ -230,7 +235,7 @@ test_x509: ../apps/openssl$(EXE_EXT) tx509 testx509.pem v3-cert1.pem v3-cert2.pe
  	echo test second x509v3 certificate
  	sh ./tx509 v3-cert2.pem 2>/dev/null
  
@@ -61,7 +74,7 @@ Index: openssl-1.0.2/test/Makefile
  	@sh ./trsa 2>/dev/null
  	../util/shlib_wrap.sh ./$(RSATEST)
  
-@@ -313,11 +318,11 @@ test_tsa: ../apps/openssl$(EXE_EXT) test
+@@ -331,11 +336,11 @@ test_tsa: ../apps/openssl$(EXE_EXT) testtsa CAtsa.cnf ../util/shlib_wrap.sh
  	  sh ./testtsa; \
  	fi
  
@@ -75,3 +88,6 @@ Index: openssl-1.0.2/test/Makefile
  	@echo "Test JPAKE"
  	../util/shlib_wrap.sh ./$(JPAKETEST)
  
+-- 
+2.15.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/Use-SHA256-not-MD5-as-default-digest.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/Use-SHA256-not-MD5-as-default-digest.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/Use-SHA256-not-MD5-as-default-digest.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/Use-SHA256-not-MD5-as-default-digest.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/configure-musl-target.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/configure-musl-target.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/configure-musl-target.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/configure-musl-target.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/configure-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/configure-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/c_rehash-compat.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/c_rehash-compat.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/c_rehash-compat.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/c_rehash-compat.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/ca.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/ca.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/ca.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/debian-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/debian-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/pic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/debian/pic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/block_digicert_malaysia.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian1.0.2/block_digicert_malaysia.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/block_digicert_malaysia.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/debian1.0.2/block_digicert_malaysia.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/block_diginotar.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian1.0.2/block_diginotar.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/block_diginotar.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/debian1.0.2/block_diginotar.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/soname.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian1.0.2/soname.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/soname.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/debian1.0.2/soname.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/version-script.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/debian1.0.2/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/debian1.0.2/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/engines-install-in-libdir-ssl.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/engines-install-in-libdir-ssl.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/engines-install-in-libdir-ssl.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/engines-install-in-libdir-ssl.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/find.pl b/meta/recipes-connectivity/openssl/openssl-1.0.2n/find.pl
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/find.pl
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/find.pl
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/oe-ldflags.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/oe-ldflags.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/oe-ldflags.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/oe-ldflags.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-1.0.2a-x32-asm.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-1.0.2a-x32-asm.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-1.0.2a-x32-asm.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-1.0.2a-x32-asm.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-c_rehash.sh b/meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-c_rehash.sh
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-c_rehash.sh
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-c_rehash.sh
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-fix-des.pod-error.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-fix-des.pod-error.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-fix-des.pod-error.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-fix-des.pod-error.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-util-perlpath.pl-cwd.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-util-perlpath.pl-cwd.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-util-perlpath.pl-cwd.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl-util-perlpath.pl-cwd.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl_fix_for_x32.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl_fix_for_x32.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/openssl_fix_for_x32.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/parallel.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/parallel.patch
similarity index 80%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/parallel.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/parallel.patch
index f3f4c99888f..e5413bf3895 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.2m/parallel.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.2n/parallel.patch
@@ -1,4 +1,7 @@
-Fix the parallel races in the Makefiles.
+From 7fb1192f112c1920bfd39f4185f34e9afff3cff2 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Sat, 5 Mar 2016 00:12:02 +0000
+Subject: [PATCH 24/28] Fix the parallel races in the Makefiles.
 
 This patch was taken from the Gentoo packaging:
 https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2g-parallel-build.patch
@@ -9,9 +12,82 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 Refreshed for 1.0.2i
 Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 
---- openssl-1.0.2g/crypto/Makefile
-+++ openssl-1.0.2g/crypto/Makefile
-@@ -85,11 +85,11 @@
+---
+ Makefile.org          |  14 +-
+ Makefile.org.orig     |  10 +-
+ Makefile.shared       |   2 +
+ Makefile.shared.orig  | 655 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ crypto/Makefile       |  10 +-
+ engines/Makefile      |   6 +-
+ engines/Makefile.orig | 338 ++++++++++++++++++++++++++
+ test/Makefile         |  92 +++----
+ test/Makefile.orig    |  88 ++++---
+ 9 files changed, 1108 insertions(+), 107 deletions(-)
+ create mode 100644 Makefile.shared.orig
+ create mode 100644 engines/Makefile.orig
+
+diff --git a/Makefile.org b/Makefile.org
+index 8e7936c..ed98d2a 100644
+--- a/Makefile.org
++++ b/Makefile.org
+@@ -283,17 +283,17 @@ build_libcrypto: build_crypto build_engines libcrypto.pc
+ build_libssl: build_ssl libssl.pc
+ 
+ build_crypto:
+-	@dir=crypto; target=all; $(BUILD_ONE_CMD)
++	+@dir=crypto; target=all; $(BUILD_ONE_CMD)
+ build_ssl: build_crypto
+-	@dir=ssl; target=all; $(BUILD_ONE_CMD)
++	+@dir=ssl; target=all; $(BUILD_ONE_CMD)
+ build_engines: build_crypto
+-	@dir=engines; target=all; $(BUILD_ONE_CMD)
++	+@dir=engines; target=all; $(BUILD_ONE_CMD)
+ build_apps: build_libs
+-	@dir=apps; target=all; $(BUILD_ONE_CMD)
++	+@dir=apps; target=all; $(BUILD_ONE_CMD)
+ build_tests: build_libs
+-	@dir=test; target=all; $(BUILD_ONE_CMD)
++	+@dir=test; target=all; $(BUILD_ONE_CMD)
+ build_tools: build_libs
+-	@dir=tools; target=all; $(BUILD_ONE_CMD)
++	+@dir=tools; target=all; $(BUILD_ONE_CMD)
+ 
+ all_testapps: build_libs build_testapps
+ build_testapps:
+@@ -565,7 +565,7 @@ install_sw:
+ 	(cp $$i $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i; \
+ 	chmod 644 $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i ); \
+ 	done;
+-	@set -e; target=install; $(RECURSIVE_BUILD_CMD)
++	+@set -e; target=install; $(RECURSIVE_BUILD_CMD)
+ 	@set -e; liblist="$(LIBS)"; for i in $$liblist ;\
+ 	do \
+ 		if [ -f "$$i" ]; then \
+diff --git a/Makefile.shared b/Makefile.shared
+index f6f92e7..8164186 100644
+--- a/Makefile.shared
++++ b/Makefile.shared
+@@ -105,6 +105,7 @@ LINK_SO=	\
+     SHAREDFLAGS="$(OE_LDFLAGS) $${SHAREDFLAGS:-$(CFLAGS) $(SHARED_LDFLAGS)}"; \
+     LIBPATH=`for x in $$LIBDEPS; do echo $$x; done | sed -e 's/^ *-L//;t' -e d | uniq`; \
+     LIBPATH=`echo $$LIBPATH | sed -e 's/ /:/g'`; \
++    [ -e $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX ] && exit 0; \
+     LD_LIBRARY_PATH=$$LIBPATH:$$LD_LIBRARY_PATH \
+     $${SHAREDCMD} $${SHAREDFLAGS} \
+ 	-o $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX \
+@@ -122,6 +123,7 @@ SYMLINK_SO=	\
+ 			done; \
+ 		fi; \
+ 		if [ -n "$$SHLIB_SOVER" ]; then \
++			[ -e "$$SHLIB$$SHLIB_SUFFIX" ] || \
+ 			( $(SET_X); rm -f $$SHLIB$$SHLIB_SUFFIX; \
+ 			  ln -s $$prev $$SHLIB$$SHLIB_SUFFIX ); \
+ 		fi; \
+diff --git a/crypto/Makefile b/crypto/Makefile
+index 17a87f8..29c2dcf 100644
+--- a/crypto/Makefile
++++ b/crypto/Makefile
+@@ -85,11 +85,11 @@ testapps:
  	@if [ -z "$(THIS)" ]; then $(MAKE) -f $(TOP)/Makefile reflect THIS=$@; fi
  
  subdirs:
@@ -25,7 +101,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  
  links:
  	@$(PERL) $(TOP)/util/mklink.pl ../include/openssl $(EXHEADER)
-@@ -100,7 +100,7 @@
+@@ -100,7 +100,7 @@ links:
  # lib: $(LIB): are splitted to avoid end-less loop
  lib:	$(LIB)
  	@touch lib
@@ -34,7 +110,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  	$(AR) $(LIB) $(LIBOBJ)
  	test -z "$(FIPSLIBDIR)" || $(AR) $(LIB) $(FIPSLIBDIR)fipscanister.o
  	$(RANLIB) $(LIB) || echo Never mind.
-@@ -111,7 +111,7 @@
+@@ -111,7 +111,7 @@ shared: buildinf.h lib subdirs
  	fi
  
  libs:
@@ -43,7 +119,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  
  install:
  	@[ -n "$(INSTALLTOP)" ] # should be set by top Makefile...
-@@ -120,7 +120,7 @@
+@@ -120,7 +120,7 @@ install:
  	(cp $$i $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i; \
  	chmod 644 $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i ); \
  	done;
@@ -52,9 +128,11 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  
  lint:
  	@target=lint; $(RECURSIVE_MAKE)
---- openssl-1.0.2g/engines/Makefile
-+++ openssl-1.0.2g/engines/Makefile
-@@ -72,7 +72,7 @@
+diff --git a/engines/Makefile b/engines/Makefile
+index fe8e9ca..a43d21b 100644
+--- a/engines/Makefile
++++ b/engines/Makefile
+@@ -72,7 +72,7 @@ top:
  
  all:	lib subdirs
  
@@ -63,7 +141,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  	@if [ -n "$(SHARED_LIBS)" ]; then \
  		set -e; \
  		for l in $(LIBNAMES); do \
-@@ -89,7 +89,7 @@
+@@ -89,7 +89,7 @@ lib:	$(LIBOBJ)
  
  subdirs:
  	echo $(EDIRS)
@@ -72,8 +150,8 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  
  files:
  	$(PERL) $(TOP)/util/files.pl Makefile >> $(TOP)/MINFO
-@@ -128,7 +128,7 @@
- 			  mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx ); \
+@@ -128,7 +128,7 @@ install:
+ 			  mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/$$pfx$$l$$sfx ); \
  		done; \
  	fi
 -	@target=install; $(RECURSIVE_MAKE)
@@ -81,62 +159,11 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  
  tags:
  	ctags $(SRC)
---- openssl-1.0.2g/Makefile.org
-+++ openssl-1.0.2g/Makefile.org
-@@ -279,17 +279,17 @@
- build_libssl: build_ssl libssl.pc
- 
- build_crypto:
--	@dir=crypto; target=all; $(BUILD_ONE_CMD)
-+	+@dir=crypto; target=all; $(BUILD_ONE_CMD)
- build_ssl: build_crypto
--	@dir=ssl; target=all; $(BUILD_ONE_CMD)
-+	+@dir=ssl; target=all; $(BUILD_ONE_CMD)
- build_engines: build_crypto
--	@dir=engines; target=all; $(BUILD_ONE_CMD)
-+	+@dir=engines; target=all; $(BUILD_ONE_CMD)
- build_apps: build_libs
--	@dir=apps; target=all; $(BUILD_ONE_CMD)
-+	+@dir=apps; target=all; $(BUILD_ONE_CMD)
- build_tests: build_libs
--	@dir=test; target=all; $(BUILD_ONE_CMD)
-+	+@dir=test; target=all; $(BUILD_ONE_CMD)
- build_tools: build_libs
--	@dir=tools; target=all; $(BUILD_ONE_CMD)
-+	+@dir=tools; target=all; $(BUILD_ONE_CMD)
- 
- all_testapps: build_libs build_testapps
- build_testapps:
-@@ -544,7 +544,7 @@
- 	(cp $$i $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i; \
- 	chmod 644 $(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl/$$i ); \
- 	done;
--	@set -e; target=install; $(RECURSIVE_BUILD_CMD)
-+	+@set -e; target=install; $(RECURSIVE_BUILD_CMD)
- 	@set -e; liblist="$(LIBS)"; for i in $$liblist ;\
- 	do \
- 		if [ -f "$$i" ]; then \
---- openssl-1.0.2g/Makefile.shared
-+++ openssl-1.0.2g/Makefile.shared
-@@ -105,6 +105,7 @@
-     SHAREDFLAGS="$${SHAREDFLAGS:-$(CFLAGS) $(SHARED_LDFLAGS)}"; \
-     LIBPATH=`for x in $$LIBDEPS; do echo $$x; done | sed -e 's/^ *-L//;t' -e d | uniq`; \
-     LIBPATH=`echo $$LIBPATH | sed -e 's/ /:/g'`; \
-+    [ -e $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX ] && exit 0; \
-     LD_LIBRARY_PATH=$$LIBPATH:$$LD_LIBRARY_PATH \
-     $${SHAREDCMD} $${SHAREDFLAGS} \
- 	-o $$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX \
-@@ -122,6 +123,7 @@
- 			done; \
- 		fi; \
- 		if [ -n "$$SHLIB_SOVER" ]; then \
-+			[ -e "$$SHLIB$$SHLIB_SUFFIX" ] || \
- 			( $(SET_X); rm -f $$SHLIB$$SHLIB_SUFFIX; \
- 			  ln -s $$prev $$SHLIB$$SHLIB_SUFFIX ); \
- 		fi; \
---- openssl-1.0.2g/test/Makefile
-+++ openssl-1.0.2g/test/Makefile
-@@ -144,7 +144,7 @@
+diff --git a/test/Makefile b/test/Makefile
+index 40abd60..78d3788 100644
+--- a/test/Makefile
++++ b/test/Makefile
+@@ -145,7 +145,7 @@ install:
  tags:
  	ctags $(SRC)
  
@@ -145,7 +172,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  
  apps:
  	@(cd ..; $(MAKE) DIRS=apps all)
-@@ -438,136 +438,136 @@
+@@ -444,139 +444,139 @@ BUILD_CMD_STATIC=shlib_target=; \
  		link_app.$${shlib_target}
  
  $(RSATEST)$(EXE_EXT): $(RSATEST).o $(DLIBCRYPTO)
@@ -316,6 +343,9 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 -	@target=$(BADDTLSTEST) $(BUILD_CMD)
 +	+@target=$(BADDTLSTEST) $(BUILD_CMD)
  
+ $(FATALERRTEST)$(EXE_EXT): $(FATALERRTEST).o ssltestlib.o $(DLIBSSL) $(DLIBCRYPTO)
+ 	@target=$(FATALERRTEST); exobj=ssltestlib.o; $(BUILD_CMD)
+ 
  $(SSLV2CONFTEST)$(EXE_EXT): $(SSLV2CONFTEST).o
 -	@target=$(SSLV2CONFTEST) $(BUILD_CMD)
 +	+@target=$(SSLV2CONFTEST) $(BUILD_CMD)
@@ -326,7 +356,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
  
  #$(AESTEST).o: $(AESTEST).c
  #	$(CC) -c $(CFLAGS) -DINTERMEDIATE_VALUE_KAT -DTRACE_KAT_MCT $(AESTEST).c
-@@ -580,6 +580,6 @@
+@@ -589,7 +589,7 @@ $(DTLSTEST)$(EXE_EXT): $(DTLSTEST).o ssltestlib.o $(DLIBSSL) $(DLIBCRYPTO)
  #	fi
  
  dummytest$(EXE_EXT): dummytest.o $(DLIBCRYPTO)
@@ -334,4 +364,7 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 +	+@target=dummytest; $(BUILD_CMD)
  
  # DO NOT DELETE THIS LINE -- make depend depends on it.
- 
\ No newline at end of file
+ 
+-- 
+2.15.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/ptest-deps.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/ptest-deps.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/ptest-deps.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/ptest-deps.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/ptest_makefile_deps.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/ptest_makefile_deps.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/ptest_makefile_deps.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/ptest_makefile_deps.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/run-ptest b/meta/recipes-connectivity/openssl/openssl-1.0.2n/run-ptest
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/run-ptest
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/run-ptest
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2m/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2n/shared-libs.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-1.0.2m/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl-1.0.2n/shared-libs.patch
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
deleted file mode 100644
index 9270f52bc65..00000000000
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
+++ /dev/null
@@ -1,61 +0,0 @@
-require openssl10.inc
-
-# For target side versions of openssl enable support for OCF Linux driver
-# if they are available.
-
-CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
-CFLAG_append_class-native = " -fPIC"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=057d9218c6180e1d9ee407572b2dd225"
-
-export DIRS = "crypto ssl apps engines"
-export OE_LDFLAGS="${LDFLAGS}"
-
-SRC_URI += "file://find.pl;subdir=openssl-${PV}/util/ \
-            file://run-ptest \
-            file://openssl-c_rehash.sh \
-            file://configure-targets.patch \
-            file://shared-libs.patch \
-            file://oe-ldflags.patch \
-            file://engines-install-in-libdir-ssl.patch \
-            file://debian1.0.2/block_diginotar.patch \
-            file://debian1.0.2/block_digicert_malaysia.patch \
-            file://debian/ca.patch \
-            file://debian/c_rehash-compat.patch \
-            file://debian/debian-targets.patch \
-            file://debian/man-dir.patch \
-            file://debian/man-section.patch \
-            file://debian/no-rpath.patch \
-            file://debian/no-symbolic.patch \
-            file://debian/pic.patch \
-            file://debian1.0.2/version-script.patch \
-            file://debian1.0.2/soname.patch \
-            file://openssl_fix_for_x32.patch \
-            file://openssl-fix-des.pod-error.patch \
-            file://Makefiles-ptest.patch \
-            file://ptest-deps.patch \
-            file://openssl-1.0.2a-x32-asm.patch \
-            file://ptest_makefile_deps.patch \
-            file://configure-musl-target.patch \
-            file://parallel.patch \
-            file://openssl-util-perlpath.pl-cwd.patch \
-            file://Use-SHA256-not-MD5-as-default-digest.patch \
-            file://0001-Fix-build-with-clang-using-external-assembler.patch \
-            file://0001-openssl-force-soft-link-to-avoid-rare-race.patch  \
-            file://0001-aes-armv4-bsaes-armv7-sha256-armv4-.pl-make-it-work-.patch \
-            "
-SRC_URI[md5sum] = "10e9e37f492094b9ef296f68f24a7666"
-SRC_URI[sha256sum] = "8c6ff15ec6b319b50788f42c7abc2890c08ba5a1cdcd3810eb9092deada37b0f"
-
-PACKAGES =+ "${PN}-engines"
-FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
-
-# The crypto_use_bigint patch means that perl's bignum module needs to be
-# installed, but some distributions (for example Fedora 23) don't ship it by
-# default.  As the resulting error is very misleading check for bignum before
-# building.
-do_configure_prepend() {
-	if ! perl -Mbigint -e true; then
-		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
-	fi
-}
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
new file mode 100644
index 00000000000..32444c60925
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
@@ -0,0 +1,60 @@
+require openssl10.inc
+
+# For target side versions of openssl enable support for OCF Linux driver
+# if they are available.
+
+CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
+CFLAG_append_class-native = " -fPIC"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=057d9218c6180e1d9ee407572b2dd225"
+
+export DIRS = "crypto ssl apps engines"
+export OE_LDFLAGS="${LDFLAGS}"
+
+SRC_URI += "file://find.pl;subdir=openssl-${PV}/util/ \
+           file://run-ptest \
+           file://openssl-c_rehash.sh \
+           file://configure-targets.patch \
+           file://shared-libs.patch \
+           file://oe-ldflags.patch \
+           file://engines-install-in-libdir-ssl.patch \
+           file://debian1.0.2/block_diginotar.patch \
+           file://debian1.0.2/block_digicert_malaysia.patch \
+           file://debian/ca.patch \
+           file://debian/c_rehash-compat.patch \
+           file://debian/debian-targets.patch \
+           file://debian/man-dir.patch \
+           file://debian/man-section.patch \
+           file://debian/no-rpath.patch \
+           file://debian/no-symbolic.patch \
+           file://debian/pic.patch \
+           file://debian1.0.2/version-script.patch \
+           file://debian1.0.2/soname.patch \
+           file://openssl_fix_for_x32.patch \
+           file://openssl-fix-des.pod-error.patch \
+           file://Makefiles-ptest.patch \
+           file://ptest-deps.patch \
+           file://openssl-1.0.2a-x32-asm.patch \
+           file://ptest_makefile_deps.patch \
+           file://configure-musl-target.patch \
+           file://parallel.patch \
+           file://openssl-util-perlpath.pl-cwd.patch \
+           file://Use-SHA256-not-MD5-as-default-digest.patch \
+           file://0001-Fix-build-with-clang-using-external-assembler.patch \
+           file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
+           "
+SRC_URI[md5sum] = "13bdc1b1d1ff39b6fd42a255e74676a4"
+SRC_URI[sha256sum] = "370babb75f278c39e0c50e8c4e7493bc0f18db6867478341a832a982fd15a8fe"
+
+PACKAGES =+ "${PN}-engines"
+FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
+
+# The crypto_use_bigint patch means that perl's bignum module needs to be
+# installed, but some distributions (for example Fedora 23) don't ship it by
+# default.  As the resulting error is very misleading check for bignum before
+# building.
+do_configure_prepend() {
+	if ! perl -Mbigint -e true; then
+		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
+	fi
+}
-- 
2.15.1


