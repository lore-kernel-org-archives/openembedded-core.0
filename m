Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TJLoo-0003oT-ST
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 12:04:43 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id CDB7ED22B7;
	Wed,  3 Oct 2012 11:51:46 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 11:51:31 +0200
Message-Id: <1349257892-32178-5-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1349257892-32178-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1349257892-32178-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 4/5] openssl: add AArch64 support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 10:04:43 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../openssl/openssl-1.0.0j/configure-targets.patch    |   17 ++++++++++++-----
 meta/recipes-connectivity/openssl/openssl_1.0.0j.bb   |    2 +-
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0j/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0j/configure-targets.patch
index 3d253d8..e273ab4 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0j/configure-targets.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.0j/configure-targets.patch
@@ -3,11 +3,15 @@ Upstream-Status: Inappropriate [embedded specific]
 The number of colons are important :)
 
 
-Index: openssl-1.0.0h/Configure
-===================================================================
---- openssl-1.0.0h.orig/Configure	2012-04-23 09:16:09.521511921 -0700
-+++ openssl-1.0.0h/Configure	2012-04-23 09:17:41.829516389 -0700
-@@ -380,6 +380,22 @@
+---
+ Configure |   17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+--- openssl-1.0.0j.orig/Configure
++++ openssl-1.0.0j/Configure
+@@ -378,10 +378,27 @@ my %table=(
+ "linux-alpha-gcc","gcc:-O3 -DL_ENDIAN -DTERMIO::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-alpha+bwx-gcc","gcc:-O3 -DL_ENDIAN -DTERMIO::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
  "linux-alpha-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
  "linux-alpha+bwx-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
  
@@ -18,6 +22,7 @@ Index: openssl-1.0.0h/Configure
 +"linux-gnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-aarch64","$ENV{'CC'}:-DL_ENDIAN 	-DTERMIO -O2 -pipe -g -feliminate-unused-debug-types -Wall -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +
 +"linux-avr32","$ENV{'CC'}:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).",
 +
@@ -30,3 +35,5 @@ Index: openssl-1.0.0h/Configure
  #### *BSD [do see comment about ${BSDthreads} above!]
  "BSD-generic32","gcc:-DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthreads}:::BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
  "BSD-x86",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthreads}:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_asm}:a.out:dlfcn:bsd-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "BSD-x86-elf",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthreads}:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:bsd-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "debug-BSD-x86-elf",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -Wall -g::${BSDthreads}:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:bsd-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.0j.bb b/meta/recipes-connectivity/openssl/openssl_1.0.0j.bb
index 7dac79c..8c0166a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.0j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.0j.bb
@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
-- 
1.7.10.4



