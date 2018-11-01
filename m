Return-Path: <robert.joslyn@redrectangle.org>
X-Greylist: delayed 1040 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 Nov 2018 02:53:44 UTC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id C87F278B9B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 02:53:44 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 1B3FEFF802;
	Thu,  1 Nov 2018 02:53:43 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Oct 2018 19:53:20 -0700
Message-Id: <20181101025320.21456-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
Subject: [pyro][PATCH] openssl: Update from 1.0.2n to 1.0.2p
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
X-List-Received-Date: Thu, 01 Nov 2018 02:53:45 -0000

Refresh parallel.patch.

Remove duplicate LIC_FILES_CHKSUM assignment.

License-Update: Updated copyright years

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-connectivity/openssl/openssl.inc |  2 +-
 .../openssl/openssl/parallel.patch            | 40 +++++++++----------
 .../{openssl_1.0.2n.bb => openssl_1.0.2p.bb}  |  6 +--
 3 files changed, 22 insertions(+), 26 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2n.bb => openssl_1.0.2p.bb} (91%)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index e39cd6c806..fd54f7fd2c 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -6,7 +6,7 @@ SECTION = "libs/network"
 
 # "openssl | SSLeay" dual license
 LICENSE = "openssl"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f475368924827d06d4b416111c8bdb77"
 
 DEPENDS = "makedepend-native hostperl-runtime-native"
 DEPENDS_append_class-target = " openssl-native"
diff --git a/meta/recipes-connectivity/openssl/openssl/parallel.patch b/meta/recipes-connectivity/openssl/openssl/parallel.patch
index e5413bf389..41abf3d6bd 100644
--- a/meta/recipes-connectivity/openssl/openssl/parallel.patch
+++ b/meta/recipes-connectivity/openssl/openssl/parallel.patch
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
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
similarity index 91%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
index 849f04b762..099587db17 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2n.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
@@ -7,8 +7,6 @@ DEPENDS += "cryptodev-linux"
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 CFLAG_append_class-native = " -fPIC"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=057d9218c6180e1d9ee407572b2dd225"
-
 export DIRS = "crypto ssl apps engines"
 export OE_LDFLAGS="${LDFLAGS}"
 
@@ -43,8 +41,8 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://Use-SHA256-not-MD5-as-default-digest.patch \
             file://0001-Fix-build-with-clang-using-external-assembler.patch \
             "
-SRC_URI[md5sum] = "13bdc1b1d1ff39b6fd42a255e74676a4"
-SRC_URI[sha256sum] = "370babb75f278c39e0c50e8c4e7493bc0f18db6867478341a832a982fd15a8fe"
+SRC_URI[md5sum] = "ac5eb30bf5798aa14b1ae6d0e7da58df"
+SRC_URI[sha256sum] = "50a98e07b1a89eb8f6a99477f262df71c6fa7bef77df4dc83025a2845c827d00"
 
 PACKAGES =+ "${PN}-engines"
 FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
-- 
2.18.1


