Received: from mail-pz0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPgj8-0000Jb-UX
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 23:04:47 +0200
Received: by mail-pz0-f45.google.com with SMTP id v2so493772dad.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 13:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=F7RvqtU6iUUJFuOtKt0lFmmmgQNOfEABtx2DWSidyqY=;
	b=qy7ygYfbE85HfwhSw5Hl5syHVvgQtumDMuxtjW4AotuWycpE0rEB7jDjBu7mxmIx9k
	FWawY43ZhhUR1CND+OvgkxpQhLfOdgOoEYroYb1aEqtLFDTllllKesJgTqT/tcK4I8q4
	FBQKwTx70tA46CtksOclCygYPEN2t2ppkeM79dXaQrhDWFe0Mtjyzri2KWkYqey+ELK9
	I9aXjamf4wczb3gW/XQ4Ern8XZG233LxmFUz0MDZg6AGGaeluSPENL/moiM//wVIVLfV
	eMmKRTdNJfYWjyK70HfOfGttijmdMNNijDYV171i4ueIbeOCIA8oSfCzaVGpI2M93tGP
	UV+Q==
Received: by 10.68.227.134 with SMTP id sa6mr781633pbc.101.1335992104197;
	Wed, 02 May 2012 13:55:04 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pg6sm2949558pbb.41.2012.05.02.13.55.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 13:55:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 13:53:58 -0700
Message-Id: <bf66597d441b73ad013875abb961f185cff2eaf7.1335991900.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
References: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
In-Reply-To: <cover.1335991900.git.raj.khem@gmail.com>
References: <cover.1335991900.git.raj.khem@gmail.com>
Subject: [PATCH 5/7] openssl: Fix build for mips64(el)
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
X-List-Received-Date: Wed, 02 May 2012 21:04:47 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../openssl/openssl-1.0.0i/configure-targets.patch |   17 ++++++++---------
 .../recipes-connectivity/openssl/openssl_1.0.0i.bb |    2 +-
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0i/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0i/configure-targets.patch
index 6d23771..91b5502 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0i/configure-targets.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.0i/configure-targets.patch
@@ -1,13 +1,12 @@
-Upstream-Status: Inappropriate [embedded specific]
 
 The number of colons are important :)
 
 
-Index: openssl-1.0.0a/Configure
+Index: openssl-1.0.0h/Configure
 ===================================================================
---- openssl-1.0.0a.orig/Configure
-+++ openssl-1.0.0a/Configure
-@@ -380,6 +380,22 @@ my %table=(
+--- openssl-1.0.0h.orig/Configure	2012-04-23 09:16:09.521511921 -0700
++++ openssl-1.0.0h/Configure	2012-04-23 09:17:41.829516389 -0700
+@@ -380,6 +380,22 @@
  "linux-alpha-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
  "linux-alpha+bwx-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${alpha_asm}",
  
@@ -22,10 +21,10 @@ Index: openssl-1.0.0a/Configure
 +"linux-avr32","$ENV{'CC'}:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).",
 +
 +#### Linux on MIPS/MIPS64
-+"linux-mips","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-mips64","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -mabi=64 -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-mips64el","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -mabi=64 -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-mipsel","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-mips","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-mips64","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -mabi=64 -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-mips64el","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -mabi=64 -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-mipsel","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +
  #### *BSD [do see comment about ${BSDthreads} above!]
  "BSD-generic32","gcc:-DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthreads}:::BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.0i.bb b/meta/recipes-connectivity/openssl/openssl_1.0.0i.bb
index 68b092f..ca15a38 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.0i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.0i.bb
@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
-- 
1.7.5.4



