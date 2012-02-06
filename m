Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RuS1R-0006MT-S0
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 18:06:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Feb 2012 08:58:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="104580186"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by orsmga001.jf.intel.com with ESMTP; 06 Feb 2012 08:58:30 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2012 08:58:30 -0800
Message-Id: <1328547510-15505-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH] openssl-0.9.8: Remove in favor or 1.0.0
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
X-List-Received-Date: Mon, 06 Feb 2012 17:06:35 -0000

Now that Openssl 1.0.0 has been out for a while, there is no need to
keep multiple versions.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../openssl/openssl-0.9.8t/configure-targets.patch |   25 -
 .../openssl/openssl-0.9.8t/debian/ca.patch         |   22 -
 .../openssl-0.9.8t/debian/config-hurd.patch        |   17 -
 .../openssl-0.9.8t/debian/debian-targets.patch     |   56 --
 .../openssl-0.9.8t/debian/engines-path.patch       |   49 --
 .../openssl-0.9.8t/debian/kfreebsd-pipe.patch      |   15 -
 .../openssl-0.9.8t/debian/make-targets.patch       |   15 -
 .../openssl/openssl-0.9.8t/debian/man-dir.patch    |   15 -
 .../openssl-0.9.8t/debian/man-section.patch        |   34 -
 .../openssl/openssl-0.9.8t/debian/no-rpath.patch   |   15 -
 .../openssl-0.9.8t/debian/no-symbolic.patch        |   15 -
 .../openssl/openssl-0.9.8t/debian/perl-path.diff   |  762 --------------------
 .../openssl/openssl-0.9.8t/debian/pic.patch        |  303 --------
 .../openssl/openssl-0.9.8t/debian/pkg-config.patch |   36 -
 .../openssl/openssl-0.9.8t/debian/rc4-amd64.patch  |   16 -
 .../openssl/openssl-0.9.8t/debian/rehash-crt.patch |   35 -
 .../openssl/openssl-0.9.8t/debian/rehash_pod.patch |   62 --
 .../openssl/openssl-0.9.8t/debian/series           |   20 -
 .../openssl-0.9.8t/debian/shared-lib-ext.patch     |   16 -
 .../openssl/openssl-0.9.8t/debian/stddef.patch     |   14 -
 .../openssl-0.9.8t/debian/version-script.patch     |   35 -
 .../openssl/openssl-0.9.8t/parallel-make-fix.patch |   20 -
 .../openssl/openssl-0.9.8t/shared-libs.patch       |   50 --
 .../recipes-connectivity/openssl/openssl_0.9.8t.bb |   31 -
 24 files changed, 0 insertions(+), 1678 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/configure-targets.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/ca.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/config-hurd.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/debian-targets.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/engines-path.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/kfreebsd-pipe.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/make-targets.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/man-dir.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/man-section.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/no-rpath.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/no-symbolic.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/perl-path.diff
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/pic.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/pkg-config.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rc4-amd64.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rehash-crt.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rehash_pod.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/series
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/shared-lib-ext.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/stddef.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/version-script.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/parallel-make-fix.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8t/shared-libs.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl_0.9.8t.bb

diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/configure-targets.patch
deleted file mode 100644
index 2317949..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/configure-targets.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-The number of colons are important :)
-
-Index: openssl-0.9.8g/Configure
-===================================================================
---- openssl-0.9.8g.orig/Configure	2008-04-12 04:27:22.000000000 +0200
-+++ openssl-0.9.8g/Configure	2008-04-12 04:38:56.000000000 +0200
-@@ -395,6 +395,16 @@
- "linux-alpha-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${no_asm}",
- "linux-alpha+bwx-ccc","ccc:-fast -readonly_strings -DL_ENDIAN -DTERMIO::-D_REENTRANT:::SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL:${no_asm}",
- 
-+ # Linux on ARM
-+"linux-elf-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-elf-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-gnueabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-gnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+
-+"linux-avr32","$ENV{'CC'}:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).",
-+
- #### *BSD [do see comment about ${BSDthreads} above!]
- "BSD-generic32","gcc:-DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthreads}:::BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL:${no_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
- "BSD-x86",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -fomit-frame-pointer -Wall::${BSDthreads}:::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_out_asm}:dlfcn:bsd-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/ca.patch
deleted file mode 100644
index aba4d42..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/ca.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8m/apps/CA.pl.in
-===================================================================
---- openssl-0.9.8m.orig/apps/CA.pl.in	2006-04-28 00:28:51.000000000 +0000
-+++ openssl-0.9.8m/apps/CA.pl.in	2010-02-27 00:36:51.000000000 +0000
-@@ -65,6 +65,7 @@
- foreach (@ARGV) {
- 	if ( /^(-\?|-h|-help)$/ ) {
- 	    print STDERR "usage: CA -newcert|-newreq|-newreq-nodes|-newca|-sign|-verify\n";
-+	    print STDERR "usage: CA -signcert certfile keyfile|-newcert|-newreq|-newca|-sign|-verify\n";
- 	    exit 0;
- 	} elsif (/^-newcert$/) {
- 	    # create a certificate
-@@ -165,6 +166,7 @@
- 	} else {
- 	    print STDERR "Unknown arg $_\n";
- 	    print STDERR "usage: CA -newcert|-newreq|-newreq-nodes|-newca|-sign|-verify\n";
-+	    print STDERR "usage: CA -signcert certfile keyfile|-newcert|-newreq|-newca|-sign|-verify\n";
- 	    exit 1;
- 	}
- }
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/config-hurd.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/config-hurd.patch
deleted file mode 100644
index 2359d15..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/config-hurd.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8k/config
-===================================================================
---- openssl-0.9.8k.orig/config	2009-02-16 09:43:41.000000000 +0100
-+++ openssl-0.9.8k/config	2009-07-19 11:32:41.000000000 +0200
-@@ -162,8 +162,8 @@
- 	echo "${MACHINE}-whatever-linux1"; exit 0
- 	;;
- 
--    GNU*)
--	echo "hurd-x86"; exit 0;
-+    GNU:*|GNU/*:*)
-+	echo "${MACHINE}-gnuish"; exit 0;
- 	;;
- 
-     LynxOS:*)
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/debian-targets.patch
deleted file mode 100644
index 5720988..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/debian-targets.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8k/Configure
-===================================================================
---- openssl-0.9.8k.orig/Configure	2009-12-09 16:09:41.000000000 +0000
-+++ openssl-0.9.8k/Configure	2009-12-09 16:09:55.000000000 +0000
-@@ -320,6 +320,49 @@
- "osf1-alpha-cc",  "cc:-std1 -tune host -O4 -readonly_strings::(unknown):::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${no_asm}:dlfcn:alpha-osf1-shared:::.so",
- "tru64-alpha-cc", "cc:-std1 -tune host -fast -readonly_strings::-pthread:::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${no_asm}:dlfcn:alpha-osf1-shared::-msym:.so",
- 
-+# Debian GNU/* (various architectures)
-+"debian-alpha","gcc:-DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-alpha-ev4","gcc:-DTERMIO -O3 -Wa,--noexecstack -mcpu=ev4 -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-alpha-ev5","gcc:-DTERMIO -O3 -Wa,--noexecstack -mcpu=ev5 -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-arm","gcc:-DL_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-armeb","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-armel","gcc:-DL_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+#"debian-amd64","gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-amd64", "gcc:-m64 -DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK RC4_CHAR BF_PTR2 DES_INT DES_UNROLL:${x86_64_asm_linux}:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-avr32", "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG_BF_PTR::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-kfreebsd-amd64","gcc:-m64 -DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK BF_PTR2 DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+#"debian-freebsd-alpha","gcc:-DTERMIOS -O -Wa,--noexecstack -fomit-frame-pointer::(unknown):::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RISC2::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-kfreebsd-i386","gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -march=i486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-hppa","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-hurd-i386","gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -mtune=i486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-ia64","gcc:-DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK RC4_CHAR:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+#"debian-i386","gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -fomit-frame-pointer -m486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}::::::::::dlfcn:linux-shared:-fPIC",
-+"debian-i386","gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-i386-i486","gcc:-DL_ENDIAN -DTERMIO -O3 -march=i486 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-i386-i586","gcc:-DL_ENDIAN -DTERMIO -O3 -march=i586 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-i386-i686/cmov","gcc:-DL_ENDIAN -DTERMIO -O3 -march=i686 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-m68k","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-mips",   "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-mipsel",   "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-netbsd-i386",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -m486 -Wall::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-netbsd-m68k",	"gcc:-DB_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -Wall::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-netbsd-sparc",	"gcc:-DB_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -mv8 -Wall::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-openbsd-alpha","gcc:-DTERMIOS -O3 -Wa,--noexecstack -g::(unknown):::SIXTY_FOUR_BIT_LONG DES_INT DES_PTR DES_RISC2::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-openbsd-i386",  "gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -m486::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_out_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-openbsd-mips","gcc:-O2 -Wa,--noexecstack -g -DL_ENDIAN::(unknown)::BN_LLONG MD2_CHAR RC4_INDEX RC4_CHAR DES_UNROLL DES_RISC2 DES_PTR BF_PTR:::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-powerpc","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_UNROLL DES_RISC2 DES_PTR MD2_CHAR RC4_INDEX::linux_ppc32.o::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-ppc64","gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL::linux_ppc64.o::::::::::dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-s390","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)", 
-+"debian-sh3",   "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sh4",   "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sh3eb",   "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sh4eb",   "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-m32r","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sparc","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sparc-v8","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -mcpu=v8 -g -Wall -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::sparcv8.o:des_enc-sparc.o fcrypt_b.o:::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sparc-v9","gcc:-DB_ENDIAN -DTERMIO -O3 -mcpu=v9 -Wa,--noexecstack -Wa,-Av8plus -g -Wall -DULTRASPARC -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::sparcv8plus.o:des_enc-sparc.o fcrypt_b.o:::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"debian-sparc64","gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall -DULTRASPARC -DBN_DIV2W::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_PTR DES_RISC1 DES_UNROLL BF_PTR:::des_enc-sparc.o fcrypt_b.o:::::::::dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+
- ####
- #### Variety of LINUX:-)
- ####
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/engines-path.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/engines-path.patch
deleted file mode 100644
index 5b4c7d5..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/engines-path.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8m/Makefile.org
-===================================================================
---- openssl-0.9.8m.orig/Makefile.org	2010-01-27 16:06:36.000000000 +0000
-+++ openssl-0.9.8m/Makefile.org	2010-02-27 00:43:04.000000000 +0000
-@@ -620,7 +620,7 @@
- install_sw:
- 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \
- 		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR) \
--		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines \
-+		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines \
- 		$(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/pkgconfig \
- 		$(INSTALL_PREFIX)$(INSTALLTOP)/include/openssl \
- 		$(INSTALL_PREFIX)$(OPENSSLDIR)/misc \
-Index: openssl-0.9.8m/engines/Makefile
-===================================================================
---- openssl-0.9.8m.orig/engines/Makefile	2009-11-10 01:53:02.000000000 +0000
-+++ openssl-0.9.8m/engines/Makefile	2010-02-27 00:45:03.000000000 +0000
-@@ -101,13 +101,13 @@
- 				*DSO_DL*)	sfx="sl";;	\
- 				*)		sfx="bad";;	\
- 				esac; \
--				cp lib$$l.$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/lib$$l.$$sfx.new; \
-+				cp lib$$l.$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/lib$$l.$$sfx.new; \
- 			  else \
- 			  	sfx="so"; \
- 				cp cyg$$l.dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/lib$$l.$$sfx.new; \
- 			  fi; \
--			  chmod 555 $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/lib$$l.$$sfx.new; \
--			  mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/lib$$l.$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/lib$$l.$$sfx ); \
-+			  chmod 555 $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/lib$$l.$$sfx.new; \
-+			  mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engines/lib$$l.$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/lib$$l.$$sfx ); \
- 		done; \
- 	fi
- 
-Index: openssl-0.9.8m/Configure
-===================================================================
---- openssl-0.9.8m.orig/Configure	2010-02-27 00:40:42.000000000 +0000
-+++ openssl-0.9.8m/Configure	2010-02-27 00:46:47.000000000 +0000
-@@ -1738,7 +1738,7 @@
- 		# $foo is to become "$prefix/lib$multilib/engines";
- 		# as Makefile.org and engines/Makefile are adapted for
- 		# $multilib suffix.
--		my $foo = "$prefix/lib/engines";
-+		my $foo = "$prefix/lib/ssl/engines";
- 		$foo =~ s/\\/\\\\/g;
- 		print OUT "#define ENGINESDIR \"$foo\"\n";
- 		}
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/kfreebsd-pipe.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/kfreebsd-pipe.patch
deleted file mode 100644
index b0312f3..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/kfreebsd-pipe.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8k/crypto/perlasm/x86_64-xlate.pl
-===================================================================
---- openssl-0.9.8k.orig/crypto/perlasm/x86_64-xlate.pl	2008-02-13 21:01:48.000000000 +0100
-+++ openssl-0.9.8k/crypto/perlasm/x86_64-xlate.pl	2009-07-19 11:37:23.000000000 +0200
-@@ -62,7 +62,7 @@
-   my ($outdev,$outino,@junk)=stat($output);
- 
-     open STDOUT,">$output" || die "can't open $output: $!"
--	if ($stddev!=$outdev || $stdino!=$outino);
-+#	if ($stddev!=$outdev || $stdino!=$outino);
- }
- 
- my $masmref=8 + 50727*2**-32;	# 8.00.50727 shipped with VS2005
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/make-targets.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/make-targets.patch
deleted file mode 100644
index 91207d8..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/make-targets.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8k/Makefile.org
-===================================================================
---- openssl-0.9.8k.orig/Makefile.org	2009-07-19 11:32:41.000000000 +0200
-+++ openssl-0.9.8k/Makefile.org	2009-07-19 11:37:31.000000000 +0200
-@@ -131,7 +131,7 @@
- 
- BASEADDR=
- 
--DIRS=   crypto fips ssl engines apps test tools
-+DIRS=   crypto fips ssl engines apps tools
- SHLIBDIRS= crypto ssl fips
- 
- # dirs in crypto to build
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/man-dir.patch
deleted file mode 100644
index 358f8cd..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/man-dir.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8k/Makefile.org
-===================================================================
---- openssl-0.9.8k.orig/Makefile.org	2009-07-19 11:32:41.000000000 +0200
-+++ openssl-0.9.8k/Makefile.org	2009-07-19 11:37:29.000000000 +0200
-@@ -152,7 +152,7 @@
- 
- MAKEFILE= Makefile
- 
--MANDIR=$(OPENSSLDIR)/man
-+MANDIR=/usr/share/man
- MAN1=1
- MAN3=3
- MANSUFFIX=
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/man-section.patch
deleted file mode 100644
index b74b12e..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/man-section.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8k/Makefile.org
-===================================================================
---- openssl-0.9.8k.orig/Makefile.org	2009-07-19 11:34:06.000000000 +0200
-+++ openssl-0.9.8k/Makefile.org	2009-07-19 11:37:21.000000000 +0200
-@@ -155,7 +155,8 @@
- MANDIR=/usr/share/man
- MAN1=1
- MAN3=3
--MANSUFFIX=
-+MANSUFFIX=ssl
-+MANSECTION=SSL
- SHELL=/bin/sh
- 
- TOP=    .
-@@ -694,7 +695,7 @@
- 		echo "installing man$$sec/$$fn.$${sec}$(MANSUFFIX)"; \
- 		(cd `$(PERL) util/dirname.pl $$i`; \
- 		sh -c "$$pod2man \
--			--section=$$sec --center=OpenSSL \
-+			--section=$${sec}$(MANSECTION) --center=OpenSSL \
- 			--release=$(VERSION) `basename $$i`") \
- 			>  $(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX); \
- 		$(PERL) util/extract-names.pl < $$i | \
-@@ -711,7 +712,7 @@
- 		echo "installing man$$sec/$$fn.$${sec}$(MANSUFFIX)"; \
- 		(cd `$(PERL) util/dirname.pl $$i`; \
- 		sh -c "$$pod2man \
--			--section=$$sec --center=OpenSSL \
-+			--section=$${sec}$(MANSECTION) --center=OpenSSL \
- 			--release=$(VERSION) `basename $$i`") \
- 			>  $(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX); \
- 		$(PERL) util/extract-names.pl < $$i | \
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/no-rpath.patch
deleted file mode 100644
index 53b7614..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/no-rpath.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8k/Makefile.shared
-===================================================================
---- openssl-0.9.8k.orig/Makefile.shared	2008-09-17 17:56:40.000000000 +0200
-+++ openssl-0.9.8k/Makefile.shared	2009-07-19 11:37:25.000000000 +0200
-@@ -151,7 +151,7 @@
- 	NOALLSYMSFLAGS='-Wl,--no-whole-archive'; \
- 	SHAREDFLAGS="$(CFLAGS) $(SHARED_LDFLAGS) -shared -Wl,-Bsymbolic -Wl,-soname=$$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX"
- 
--DO_GNU_APP=LDFLAGS="$(CFLAGS) -Wl,-rpath,$(LIBRPATH)"
-+DO_GNU_APP=LDFLAGS="$(CFLAGS)"
- 
- #This is rather special.  It's a special target with which one can link
- #applications without bothering with any features that have anything to
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/no-symbolic.patch
deleted file mode 100644
index 87eadac..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/no-symbolic.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8k/Makefile.shared
-===================================================================
---- openssl-0.9.8k.orig/Makefile.shared	2009-07-19 11:35:02.000000000 +0200
-+++ openssl-0.9.8k/Makefile.shared	2009-07-19 11:35:48.000000000 +0200
-@@ -149,7 +149,7 @@
- 	SHLIB_SUFFIX=; \
- 	ALLSYMSFLAGS='-Wl,--whole-archive'; \
- 	NOALLSYMSFLAGS='-Wl,--no-whole-archive'; \
--	SHAREDFLAGS="$(CFLAGS) $(SHARED_LDFLAGS) -shared -Wl,-Bsymbolic -Wl,-soname=$$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX"
-+	SHAREDFLAGS="$(CFLAGS) $(SHARED_LDFLAGS) -shared -Wl,-soname=$$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX"
- 
- DO_GNU_APP=LDFLAGS="$(CFLAGS)"
- 
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/perl-path.diff b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/perl-path.diff
deleted file mode 100644
index ced45a3..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/perl-path.diff
+++ /dev/null
@@ -1,762 +0,0 @@
-Upstream-Status: Backport [debian]
-
-From: Kurt Roeckx <kurt@roeckx.be>
-Subject: Change the perl path's to /usr/bin/perl
-
-This is the result of running:
-perl util/perlpath.pl /usr/bin
-
-The upstream sources have this set to various different paths.
-
---- openssl-0.9.8m.orig/Configure
-+++ openssl-0.9.8m/Configure
-@@ -1,4 +1,4 @@
--:
-+#!/usr/bin/perl
- eval 'exec perl -S $0 ${1+"$@"}'
-     if $running_under_some_shell;
- ##
---- openssl-0.9.8m.orig/VMS/VMSify-conf.pl
-+++ openssl-0.9.8m/VMS/VMSify-conf.pl
-@@ -1,4 +1,4 @@
--#! /usr/bin/perl
-+#!/usr/bin/perl
- 
- use strict;
- use warnings;
---- openssl-0.9.8m.orig/Netware/do_tests.pl
-+++ openssl-0.9.8m/Netware/do_tests.pl
-@@ -1,4 +1,4 @@
--# perl script to run OpenSSL tests
-+#!/usr/bin/perl
- 
- 
- my $base_path      = "\\openssl";
---- openssl-0.9.8m.orig/apps/progs.pl
-+++ openssl-0.9.8m/apps/progs.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- print "/* apps/progs.h */\n";
- print "/* automatically generated by progs.pl for openssl.c */\n\n";
---- openssl-0.9.8m.orig/os2/backwardify.pl
-+++ openssl-0.9.8m/os2/backwardify.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/perl -w
-+#!/usr/bin/perl
- use strict;
- 
- # Use as $0
---- openssl-0.9.8m.orig/times/091/mips-rel.pl
-+++ openssl-0.9.8m/times/091/mips-rel.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- &doit(100,"Pentium   100 32",0.0195,0.1000,0.6406,4.6100);	# pentium-100
- &doit(200,"PPro      200 32",0.0070,0.0340,0.2087,1.4700);	# pentium-100
---- openssl-0.9.8m.orig/fips/mkfipsscr.pl
-+++ openssl-0.9.8m/fips/mkfipsscr.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl -w
-+#!/usr/bin/perl
- # Quick & dirty utility to generate a script for executing the
- # FIPS 140-2 CMVP algorithm tests based on the pathnames of
- # input algorithm test files actually present (the unqualified
---- openssl-0.9.8m.orig/fips/fipsalgtest.pl
-+++ openssl-0.9.8m/fips/fipsalgtest.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/perl -w
-+#!/usr/bin/perl
- # Perl utility to run or verify FIPS 140-2 CMVP algorithm tests based on the
- # pathnames of input algorithm test files actually present (the unqualified
- # file names are consistent but the pathnames are not).
---- openssl-0.9.8m.orig/ms/uplink.pl
-+++ openssl-0.9.8m/ms/uplink.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/env perl
-+#!/usr/bin/perl
- #
- # For Microsoft CL this is implemented as inline assembler. So that
- # even though this script can generate even Win32 code, we'll be
---- openssl-0.9.8m.orig/ms/segrenam.pl
-+++ openssl-0.9.8m/ms/segrenam.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/env perl
-+#!/usr/bin/perl
- 
- my $quiet = 1;
- 
---- openssl-0.9.8m.orig/ms/cmp.pl
-+++ openssl-0.9.8m/ms/cmp.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- ($#ARGV == 1) || die "usage: cmp.pl <file1> <file2>\n";
- 
---- openssl-0.9.8m.orig/test/cms-test.pl
-+++ openssl-0.9.8m/test/cms-test.pl
-@@ -1,4 +1,4 @@
--# test/cms-test.pl
-+#!/usr/bin/perl
- # Written by Dr Stephen N Henson (steve@openssl.org) for the OpenSSL
- # project.
- #
---- openssl-0.9.8m.orig/test/cms-examples.pl
-+++ openssl-0.9.8m/test/cms-examples.pl
-@@ -1,4 +1,4 @@
--# test/cms-examples.pl
-+#!/usr/bin/perl
- # Written by Dr Stephen N Henson (steve@openssl.org) for the OpenSSL
- # project.
- #
---- openssl-0.9.8m.orig/demos/b64.pl
-+++ openssl-0.9.8m/demos/b64.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- #
- # Make PEM encoded data have lines of 64 bytes of data
---- openssl-0.9.8m.orig/demos/tunala/configure.in
-+++ openssl-0.9.8m/demos/tunala/configure.in
-@@ -1,4 +1,4 @@
--dnl Process this file with autoconf to produce a configure script.
-+#!/usr/bin/perl
- AC_INIT(tunala.c)
- AM_CONFIG_HEADER(config.h)
- AM_INIT_AUTOMAKE(tunala, 0.0.1-dev)
---- openssl-0.9.8m.orig/crypto/x86cpuid.pl
-+++ openssl-0.9.8m/crypto/x86cpuid.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/env perl
-+#!/usr/bin/perl
- 
- push(@INC,"perlasm");
- require "x86asm.pl";
---- openssl-0.9.8m.orig/crypto/x86_64cpuid.pl
-+++ openssl-0.9.8m/crypto/x86_64cpuid.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/env perl
-+#!/usr/bin/perl
- 
- $output=shift;
- $masm=1 if ($output =~ /\.asm/);
---- openssl-0.9.8m.orig/crypto/md5/asm/md5-586.pl
-+++ openssl-0.9.8m/crypto/md5/asm/md5-586.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- # Normal is the
- # md5_block_x86(MD5_CTX *c, ULONG *X);
---- openssl-0.9.8m.orig/crypto/md5/asm/md5-x86_64.pl
-+++ openssl-0.9.8m/crypto/md5/asm/md5-x86_64.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/perl -w
-+#!/usr/bin/perl
- #
- # MD5 optimized for AMD64.
- #
---- openssl-0.9.8m.orig/crypto/sha/asm/sha1-ia64.pl
-+++ openssl-0.9.8m/crypto/sha/asm/sha1-ia64.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/env perl
-+#!/usr/bin/perl
- #
- # ====================================================================
- # Written by Andy Polyakov <appro@fy.chalmers.se> for the OpenSSL
---- openssl-0.9.8m.orig/crypto/sha/asm/sha1-x86_64.pl
-+++ openssl-0.9.8m/crypto/sha/asm/sha1-x86_64.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/env perl
-+#!/usr/bin/perl
- #
- # ====================================================================
- # Written by Andy Polyakov <appro@fy.chalmers.se> for the OpenSSL
---- openssl-0.9.8m.orig/crypto/sha/asm/sha512-sse2.pl
-+++ openssl-0.9.8m/crypto/sha/asm/sha512-sse2.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/env perl
-+#!/usr/bin/perl
- #
- # ====================================================================
- # Written by Andy Polyakov <appro@fy.chalmers.se> for the OpenSSL
---- openssl-0.9.8m.orig/crypto/sha/asm/sha512-ia64.pl
-+++ openssl-0.9.8m/crypto/sha/asm/sha512-ia64.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/env perl
-+#!/usr/bin/perl
- #
- # ====================================================================
- # Written by Andy Polyakov <appro@fy.chalmers.se> for the OpenSSL
---- openssl-0.9.8m.orig/crypto/sha/asm/sha512-x86_64.pl
-+++ openssl-0.9.8m/crypto/sha/asm/sha512-x86_64.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/env perl
-+#!/usr/bin/perl
- #
- # ====================================================================
- # Written by Andy Polyakov <appro@fy.chalmers.se> for the OpenSSL
---- openssl-0.9.8m.orig/crypto/sha/asm/sha1-586.pl
-+++ openssl-0.9.8m/crypto/sha/asm/sha1-586.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/env perl
-+#!/usr/bin/perl
- 
- # ====================================================================
- # [Re]written by Andy Polyakov <appro@fy.chalmers.se> for the OpenSSL
---- openssl-0.9.8m.orig/crypto/des/asm/des-586.pl
-+++ openssl-0.9.8m/crypto/des/asm/des-586.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- #
- # The inner loop instruction sequence and the IP/FP modifications are from
- # Svend Olaf Mikkelsen <svolaf@inet.uni-c.dk>
---- openssl-0.9.8m.orig/crypto/des/asm/desboth.pl
-+++ openssl-0.9.8m/crypto/des/asm/desboth.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- $L="edi";
- $R="esi";
---- openssl-0.9.8m.orig/crypto/des/asm/des686.pl
-+++ openssl-0.9.8m/crypto/des/asm/des686.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- $prog="des686.pl";
- 
---- openssl-0.9.8m.orig/crypto/des/asm/crypt586.pl
-+++ openssl-0.9.8m/crypto/des/asm/crypt586.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- #
- # The inner loop instruction sequence and the IP/FP modifications are from
- # Svend Olaf Mikkelsen <svolaf@inet.uni-c.dk>
---- openssl-0.9.8m.orig/crypto/lhash/num.pl
-+++ openssl-0.9.8m/crypto/lhash/num.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- #node     10 ->   4
- 
---- openssl-0.9.8m.orig/crypto/ripemd/asm/rmd-586.pl
-+++ openssl-0.9.8m/crypto/ripemd/asm/rmd-586.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- # Normal is the
- # ripemd160_block_asm_data_order(RIPEMD160_CTX *c, ULONG *X,int blocks);
---- openssl-0.9.8m.orig/crypto/rc4/asm/rc4-586.pl
-+++ openssl-0.9.8m/crypto/rc4/asm/rc4-586.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- # At some point it became apparent that the original SSLeay RC4
- # assembler implementation performs suboptimaly on latest IA-32
---- openssl-0.9.8m.orig/crypto/rc4/asm/rc4-x86_64.pl
-+++ openssl-0.9.8m/crypto/rc4/asm/rc4-x86_64.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/env perl
-+#!/usr/bin/perl
- #
- # ====================================================================
- # Written by Andy Polyakov <appro@fy.chalmers.se> for the OpenSSL
---- openssl-0.9.8m.orig/crypto/cast/asm/cast-586.pl
-+++ openssl-0.9.8m/crypto/cast/asm/cast-586.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- # define for pentium pro friendly version
- $ppro=1;
---- openssl-0.9.8m.orig/crypto/rc5/asm/rc5-586.pl
-+++ openssl-0.9.8m/crypto/rc5/asm/rc5-586.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- push(@INC,"perlasm","../../perlasm");
- require "x86asm.pl";
---- openssl-0.9.8m.orig/crypto/perlasm/x86ms.pl
-+++ openssl-0.9.8m/crypto/perlasm/x86ms.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- package x86ms;
- 
---- openssl-0.9.8m.orig/crypto/perlasm/x86asm.pl
-+++ openssl-0.9.8m/crypto/perlasm/x86asm.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- # require 'x86asm.pl';
- # &asm_init("cpp","des-586.pl");
---- openssl-0.9.8m.orig/crypto/perlasm/x86nasm.pl
-+++ openssl-0.9.8m/crypto/perlasm/x86nasm.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- package x86nasm;
- 
---- openssl-0.9.8m.orig/crypto/perlasm/x86unix.pl
-+++ openssl-0.9.8m/crypto/perlasm/x86unix.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- package x86unix;	# GAS actually...
- 
---- openssl-0.9.8m.orig/crypto/perlasm/cbc.pl
-+++ openssl-0.9.8m/crypto/perlasm/cbc.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- # void des_ncbc_encrypt(input, output, length, schedule, ivec, enc)
- # des_cblock (*input);
---- openssl-0.9.8m.orig/crypto/perlasm/x86_64-xlate.pl
-+++ openssl-0.9.8m/crypto/perlasm/x86_64-xlate.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/env perl
-+#!/usr/bin/perl
- 
- # Ascetic x86_64 AT&T to MASM assembler translator by <appro>.
- #
---- openssl-0.9.8m.orig/crypto/bf/asm/bf-686.pl
-+++ openssl-0.9.8m/crypto/bf/asm/bf-686.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- push(@INC,"perlasm","../../perlasm");
- require "x86asm.pl";
---- openssl-0.9.8m.orig/crypto/bf/asm/bf-586.pl
-+++ openssl-0.9.8m/crypto/bf/asm/bf-586.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- push(@INC,"perlasm","../../perlasm");
- require "x86asm.pl";
---- openssl-0.9.8m.orig/crypto/objects/objects.pl
-+++ openssl-0.9.8m/crypto/objects/objects.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- open (NUMIN,"$ARGV[1]") || die "Can't open number file $ARGV[1]";
- $max_nid=0;
---- openssl-0.9.8m.orig/crypto/objects/obj_dat.pl
-+++ openssl-0.9.8m/crypto/objects/obj_dat.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- # fixes bug in floating point emulation on sparc64 when
- # this script produces off-by-one output on sparc64
---- openssl-0.9.8m.orig/crypto/conf/keysets.pl
-+++ openssl-0.9.8m/crypto/conf/keysets.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- $NUMBER=0x01;
- $UPPER=0x02;
---- openssl-0.9.8m.orig/crypto/bn/bn_prime.pl
-+++ openssl-0.9.8m/crypto/bn/bn_prime.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- # bn_prime.pl
- 
- $num=2048;
---- openssl-0.9.8m.orig/crypto/bn/asm/x86.pl
-+++ openssl-0.9.8m/crypto/bn/asm/x86.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- push(@INC,"perlasm","../../perlasm");
- require "x86asm.pl";
---- openssl-0.9.8m.orig/crypto/bn/asm/ppc.pl
-+++ openssl-0.9.8m/crypto/bn/asm/ppc.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/env perl
-+#!/usr/bin/perl
- #
- # Implemented as a Perl wrapper as we want to support several different
- # architectures with single file. We pick up the target based on the
---- openssl-0.9.8m.orig/crypto/bn/asm/co-586.pl
-+++ openssl-0.9.8m/crypto/bn/asm/co-586.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- push(@INC,"perlasm","../../perlasm");
- require "x86asm.pl";
---- openssl-0.9.8m.orig/crypto/bn/asm/bn-586.pl
-+++ openssl-0.9.8m/crypto/bn/asm/bn-586.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- push(@INC,"perlasm","../../perlasm");
- require "x86asm.pl";
---- openssl-0.9.8m.orig/crypto/bn/asm/mo-586.pl
-+++ openssl-0.9.8m/crypto/bn/asm/mo-586.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/env perl
-+#!/usr/bin/perl
- 
- # This is crypto/bn/asm/x86-mont.pl (with asciz from crypto/perlasm/x86asm.pl)
- # from OpenSSL 0.9.9-dev 
---- openssl-0.9.8m.orig/crypto/bn/asm/x86_64-mont.pl
-+++ openssl-0.9.8m/crypto/bn/asm/x86_64-mont.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/env perl
-+#!/usr/bin/perl
- 
- # ====================================================================
- # Written by Andy Polyakov <appro@fy.chalmers.se> for the OpenSSL
---- openssl-0.9.8m.orig/crypto/bn/asm/x86/comba.pl
-+++ openssl-0.9.8m/crypto/bn/asm/x86/comba.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- # x86 assember
- 
- sub mul_add_c
---- openssl-0.9.8m.orig/crypto/bn/asm/x86/add.pl
-+++ openssl-0.9.8m/crypto/bn/asm/x86/add.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- # x86 assember
- 
- sub bn_add_words
---- openssl-0.9.8m.orig/crypto/bn/asm/x86/mul.pl
-+++ openssl-0.9.8m/crypto/bn/asm/x86/mul.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- # x86 assember
- 
- sub bn_mul_words
---- openssl-0.9.8m.orig/crypto/bn/asm/x86/mul_add.pl
-+++ openssl-0.9.8m/crypto/bn/asm/x86/mul_add.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- # x86 assember
- 
- sub bn_mul_add_words
---- openssl-0.9.8m.orig/crypto/bn/asm/x86/sqr.pl
-+++ openssl-0.9.8m/crypto/bn/asm/x86/sqr.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- # x86 assember
- 
- sub bn_sqr_words
---- openssl-0.9.8m.orig/crypto/bn/asm/x86/sub.pl
-+++ openssl-0.9.8m/crypto/bn/asm/x86/sub.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- # x86 assember
- 
- sub bn_sub_words
---- openssl-0.9.8m.orig/crypto/bn/asm/x86/div.pl
-+++ openssl-0.9.8m/crypto/bn/asm/x86/div.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- # x86 assember
- 
- sub bn_div_words
---- openssl-0.9.8m.orig/crypto/aes/asm/aes-586.pl
-+++ openssl-0.9.8m/crypto/aes/asm/aes-586.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/env perl
-+#!/usr/bin/perl
- #
- # ====================================================================
- # Written by Andy Polyakov <appro@fy.chalmers.se> for the OpenSSL
---- openssl-0.9.8m.orig/crypto/aes/asm/aes-x86_64.pl
-+++ openssl-0.9.8m/crypto/aes/asm/aes-x86_64.pl
-@@ -1,4 +1,4 @@
--#!/usr/bin/env perl
-+#!/usr/bin/perl
- #
- # ====================================================================
- # Written by Andy Polyakov <appro@fy.chalmers.se> for the OpenSSL
---- openssl-0.9.8m.orig/crypto/asn1/charmap.pl
-+++ openssl-0.9.8m/crypto/asn1/charmap.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl -w
-+#!/usr/bin/perl
- 
- use strict;
- 
---- openssl-0.9.8m.orig/util/mksdef.pl
-+++ openssl-0.9.8m/util/mksdef.pl
-@@ -1,4 +1,4 @@
--
-+#!/usr/bin/perl
- # Perl script to split libeay32.def into two distinct DEF files for use in
- # fipdso mode. It works out symbols in each case by running "link" command and
- # parsing the output to find the list of missing symbols then splitting
---- openssl-0.9.8m.orig/util/dirname.pl
-+++ openssl-0.9.8m/util/dirname.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- if ($#ARGV < 0) {
-     die "dirname.pl: too few arguments\n";
---- openssl-0.9.8m.orig/util/tab_num.pl
-+++ openssl-0.9.8m/util/tab_num.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- $num=1;
- $width=40;
---- openssl-0.9.8m.orig/util/sp-diff.pl
-+++ openssl-0.9.8m/util/sp-diff.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- #
- # This file takes as input, the files that have been output from
- # ssleay speed.
---- openssl-0.9.8m.orig/util/mkerr.pl
-+++ openssl-0.9.8m/util/mkerr.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl -w
-+#!/usr/bin/perl
- 
- my $config = "crypto/err/openssl.ec";
- my $debug = 0;
---- openssl-0.9.8m.orig/util/clean-depend.pl
-+++ openssl-0.9.8m/util/clean-depend.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl -w
-+#!/usr/bin/perl
- # Clean the dependency list in a makefile of standard includes...
- # Written by Ben Laurie <ben@algroup.co.uk> 19 Jan 1999
- 
---- openssl-0.9.8m.orig/util/add_cr.pl
-+++ openssl-0.9.8m/util/add_cr.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- #
- # This adds a copyright message to a souce code file.
- # It also gets the file name correct.
---- openssl-0.9.8m.orig/util/pod2man.pl
-+++ openssl-0.9.8m/util/pod2man.pl
-@@ -1,4 +1,4 @@
--: #!/usr/bin/perl-5.005
-+#!/usr/bin/perl
-     eval 'exec /usr/bin/perl -S $0 ${1+"$@"}'
- 	if $running_under_some_shell;
- 
---- openssl-0.9.8m.orig/util/mkstack.pl
-+++ openssl-0.9.8m/util/mkstack.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl -w
-+#!/usr/bin/perl
- 
- # This is a utility that searches out "DECLARE_STACK_OF()"
- # declarations in .h and .c files, and updates/creates/replaces
---- openssl-0.9.8m.orig/util/selftest.pl
-+++ openssl-0.9.8m/util/selftest.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl -w
-+#!/usr/bin/perl
- #
- # Run the test suite and generate a report
- #
---- openssl-0.9.8m.orig/util/ck_errf.pl
-+++ openssl-0.9.8m/util/ck_errf.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- #
- # This is just a quick script to scan for cases where the 'error'
- # function name in a XXXerr() macro is wrong.
---- openssl-0.9.8m.orig/util/mklink.pl
-+++ openssl-0.9.8m/util/mklink.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- # mklink.pl
- 
---- openssl-0.9.8m.orig/util/src-dep.pl
-+++ openssl-0.9.8m/util/src-dep.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- # we make up an array of
- # $file{function_name}=filename;
---- openssl-0.9.8m.orig/util/deleof.pl
-+++ openssl-0.9.8m/util/deleof.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- while (<>)
- 	{
---- openssl-0.9.8m.orig/util/arx.pl
-+++ openssl-0.9.8m/util/arx.pl
-@@ -1,4 +1,4 @@
--#!/bin/perl
-+#!/usr/bin/perl
- 
- # Simple perl script to wrap round "ar" program and exclude any
- # object files in the environment variable EXCL_OBJ
---- openssl-0.9.8m.orig/util/copy.pl
-+++ openssl-0.9.8m/util/copy.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- use Fcntl;
- 
---- openssl-0.9.8m.orig/util/mkdir-p.pl
-+++ openssl-0.9.8m/util/mkdir-p.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- 
- # mkdir-p.pl
- 
---- openssl-0.9.8m.orig/util/mkdef.pl
-+++ openssl-0.9.8m/util/mkdef.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl -w
-+#!/usr/bin/perl
- #
- # generate a .def file
- #
---- openssl-0.9.8m.orig/util/files.pl
-+++ openssl-0.9.8m/util/files.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- #
- # used to generate the file MINFO for use by util/mk1mf.pl
- # It is basically a list of all variables from the passed makefile
---- openssl-0.9.8m.orig/util/mkfiles.pl
-+++ openssl-0.9.8m/util/mkfiles.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- #
- # This is a hacked version of files.pl for systems that can't do a 'make files'.
- # Do a perl util/mkminfo.pl >MINFO to build MINFO
---- openssl-0.9.8m.orig/util/perlpath.pl
-+++ openssl-0.9.8m/util/perlpath.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- #
- # modify the '#!/usr/local/bin/perl'
- # line in all scripts that rely on perl.
---- openssl-0.9.8m.orig/util/mk1mf.pl
-+++ openssl-0.9.8m/util/mk1mf.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- # A bit of an evil hack but it post processes the file ../MINFO which
- # is generated by `make files` in the top directory.
- # This script outputs one mega makefile that has no shell stuff or any
---- openssl-0.9.8m.orig/util/err-ins.pl
-+++ openssl-0.9.8m/util/err-ins.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- #
- # tack error codes onto the end of a file
- #
---- openssl-0.9.8m.orig/util/pl/Mingw32.pl
-+++ openssl-0.9.8m/util/pl/Mingw32.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- #
- # Mingw32.pl -- Mingw
- #
---- openssl-0.9.8m.orig/util/pl/unix.pl
-+++ openssl-0.9.8m/util/pl/unix.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- #
- # unix.pl - the standard unix makefile stuff.
- #
---- openssl-0.9.8m.orig/util/pl/netware.pl
-+++ openssl-0.9.8m/util/pl/netware.pl
-@@ -1,4 +1,4 @@
--# Metrowerks Codewarrior or gcc / nlmconv for NetWare
-+#!/usr/bin/perl
- #
- 
- $version_header = "crypto/opensslv.h";
---- openssl-0.9.8m.orig/util/pl/VC-32.pl
-+++ openssl-0.9.8m/util/pl/VC-32.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- # VC-32.pl - unified script for Microsoft Visual C++, covering Win32,
- # Win64 and WinCE [follow $FLAVOR variable to trace the differences].
- #
---- openssl-0.9.8m.orig/util/pl/OS2-EMX.pl
-+++ openssl-0.9.8m/util/pl/OS2-EMX.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- #
- # OS2-EMX.pl - for EMX GCC on OS/2
- #
---- openssl-0.9.8m.orig/util/pl/ultrix.pl
-+++ openssl-0.9.8m/util/pl/ultrix.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- #
- # linux.pl - the standard unix makefile stuff.
- #
---- openssl-0.9.8m.orig/util/pl/linux.pl
-+++ openssl-0.9.8m/util/pl/linux.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- #
- # linux.pl - the standard unix makefile stuff.
- #
---- openssl-0.9.8m.orig/util/pl/BC-32.pl
-+++ openssl-0.9.8m/util/pl/BC-32.pl
-@@ -1,4 +1,4 @@
--#!/usr/local/bin/perl
-+#!/usr/bin/perl
- # Borland C++ builder 3 and 4 -- Janez Jere <jj@void.si>
- #
- 
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/pic.patch
deleted file mode 100644
index 5fc8f65..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/pic.patch
+++ /dev/null
@@ -1,303 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8o/crypto/Makefile
-===================================================================
---- openssl-0.9.8o.orig/crypto/Makefile	2008-09-17 17:10:55.000000000 +0000
-+++ openssl-0.9.8o/crypto/Makefile	2010-06-06 13:09:28.000000000 +0000
-@@ -57,7 +57,7 @@
- 	echo "  #define DATE \"`LC_ALL=C LC_TIME=C date`\""; \
- 	echo '#endif' ) >buildinf.h
- 
--x86cpuid-elf.s:	x86cpuid.pl perlasm/x86asm.pl
-+x86cpuid-elf.S:	x86cpuid.pl perlasm/x86asm.pl
- 	$(PERL) x86cpuid.pl elf $(CFLAGS) $(PROCESSOR) > $@
- x86cpuid-cof.s: x86cpuid.pl perlasm/x86asm.pl
- 	$(PERL) x86cpuid.pl coff $(CFLAGS) $(PROCESSOR) > $@
-@@ -70,7 +70,7 @@
- uplink-cof.s:	../ms/uplink.pl
- 	$(PERL) ../ms/uplink.pl coff > $@
- 
--x86_64cpuid.s: x86_64cpuid.pl
-+x86_64cpuid.S: x86_64cpuid.pl
- 	$(PERL) x86_64cpuid.pl $@
- ia64cpuid.s: ia64cpuid.S
- 	$(CC) $(CFLAGS) -E ia64cpuid.S > $@
-Index: openssl-0.9.8o/crypto/x86_64cpuid.pl
-===================================================================
---- openssl-0.9.8o.orig/crypto/x86_64cpuid.pl	2007-11-11 16:25:00.000000000 +0000
-+++ openssl-0.9.8o/crypto/x86_64cpuid.pl	2010-06-06 13:09:28.000000000 +0000
-@@ -95,7 +95,11 @@
- .size	OPENSSL_wipe_cpu,.-OPENSSL_wipe_cpu
- 
- .section	.init
-+#ifdef OPENSSL_PIC
-+	call	OPENSSL_cpuid_setup\@PLT
-+#else
- 	call	OPENSSL_cpuid_setup
-+#endif
- 
- ___
- 
-Index: openssl-0.9.8o/crypto/md5/Makefile
-===================================================================
---- openssl-0.9.8o.orig/crypto/md5/Makefile	2008-09-17 17:11:02.000000000 +0000
-+++ openssl-0.9.8o/crypto/md5/Makefile	2010-06-06 13:09:28.000000000 +0000
-@@ -52,7 +52,8 @@
- mx86-out.s: asm/md5-586.pl ../perlasm/x86asm.pl
- 	(cd asm; $(PERL) md5-586.pl a.out $(CFLAGS) > ../$@)
- 
--md5-x86_64.s:	asm/md5-x86_64.pl;	$(PERL) asm/md5-x86_64.pl $@
-+md5-x86_64.s:	asm/md5-x86_64.pl
-+	$(PERL) asm/md5-x86_64.pl $@
- 
- files:
- 	$(PERL) $(TOP)/util/files.pl Makefile >> $(TOP)/MINFO
-Index: openssl-0.9.8o/crypto/des/asm/desboth.pl
-===================================================================
---- openssl-0.9.8o.orig/crypto/des/asm/desboth.pl	2001-10-24 21:20:56.000000000 +0000
-+++ openssl-0.9.8o/crypto/des/asm/desboth.pl	2010-06-06 13:09:28.000000000 +0000
-@@ -16,6 +16,11 @@
- 
- 	&push("edi");
- 
-+	&call   (&label("pic_point0"));
-+	&set_label("pic_point0");
-+	&blindpop("ebp");
-+	&add    ("ebp", "\$_GLOBAL_OFFSET_TABLE_+[.-" . &label("pic_point0") . "]");
-+
- 	&comment("");
- 	&comment("Load the data words");
- 	&mov($L,&DWP(0,"ebx","",0));
-@@ -47,15 +52,21 @@
- 	&mov(&swtmp(2),	(DWC(($enc)?"1":"0")));
- 	&mov(&swtmp(1),	"eax");
- 	&mov(&swtmp(0),	"ebx");
--	&call("DES_encrypt2");
-+	&exch("ebx", "ebp");
-+	&call("DES_encrypt2\@PLT");
-+	&exch("ebx", "ebp");
- 	&mov(&swtmp(2),	(DWC(($enc)?"0":"1")));
- 	&mov(&swtmp(1),	"edi");
- 	&mov(&swtmp(0),	"ebx");
--	&call("DES_encrypt2");
-+	&exch("ebx", "ebp");
-+	&call("DES_encrypt2\@PLT");
-+	&exch("ebx", "ebp");
- 	&mov(&swtmp(2),	(DWC(($enc)?"1":"0")));
- 	&mov(&swtmp(1),	"esi");
- 	&mov(&swtmp(0),	"ebx");
--	&call("DES_encrypt2");
-+	&exch("ebx", "ebp");
-+	&call("DES_encrypt2\@PLT");
-+	&exch("ebx", "ebp");
- 
- 	&stack_pop(3);
- 	&mov($L,&DWP(0,"ebx","",0));
-Index: openssl-0.9.8o/crypto/rc4/Makefile
-===================================================================
---- openssl-0.9.8o.orig/crypto/rc4/Makefile	2008-11-19 16:03:50.000000000 +0000
-+++ openssl-0.9.8o/crypto/rc4/Makefile	2010-06-06 13:09:28.000000000 +0000
-@@ -51,7 +51,7 @@
- rx86-out.s: asm/rc4-586.pl ../perlasm/x86asm.pl
- 	(cd asm; $(PERL) rc4-586.pl a.out $(CFLAGS) > ../$@)
- 
--rc4-x86_64.s: asm/rc4-x86_64.pl;	$(PERL) asm/rc4-x86_64.pl $@
-+rc4-x86_64.S: asm/rc4-x86_64.pl;	$(PERL) asm/rc4-x86_64.pl $@
- 
- rc4-ia64.s: asm/rc4-ia64.S
- 	@case `awk '/^#define RC4_INT/{print$$NF}' $(TOP)/include/openssl/opensslconf.h` in \
-Index: openssl-0.9.8o/crypto/rc4/asm/rc4-x86_64.pl
-===================================================================
---- openssl-0.9.8o.orig/crypto/rc4/asm/rc4-x86_64.pl	2008-09-16 10:47:27.000000000 +0000
-+++ openssl-0.9.8o/crypto/rc4/asm/rc4-x86_64.pl	2010-06-06 13:09:28.000000000 +0000
-@@ -270,7 +270,11 @@
- 	xor	%r10,%r10
- 	xor	%r11,%r11
- 
-+#ifdef OPENSSL_PIC
-+	mov	OPENSSL_ia32cap_P\@GOTPCREL(%rip),$idx#d
-+#else
- 	mov	OPENSSL_ia32cap_P(%rip),$idx#d
-+#endif
- 	bt	\$20,$idx#d
- 	jnc	.Lw1stloop
- 	bt	\$30,$idx#d
-@@ -338,7 +342,11 @@
- RC4_options:
- 	.picmeup %rax
- 	lea	.Lopts-.(%rax),%rax
-+#ifdef OPENSSL_PIC
-+	mov	OPENSSL_ia32cap_P\@GOTPCREL(%rip),%edx
-+#else
- 	mov	OPENSSL_ia32cap_P(%rip),%edx
-+#endif
- 	bt	\$20,%edx
- 	jnc	.Ldone
- 	add	\$12,%rax
-Index: openssl-0.9.8o/crypto/perlasm/x86unix.pl
-===================================================================
---- openssl-0.9.8o.orig/crypto/perlasm/x86unix.pl	2008-05-01 23:11:32.000000000 +0000
-+++ openssl-0.9.8o/crypto/perlasm/x86unix.pl	2010-06-06 13:09:28.000000000 +0000
-@@ -400,6 +400,29 @@
- 	$stack=4;
- 	}
- 
-+sub main'function_begin_B_static
-+	{
-+	local($func,$extra)=@_;
-+
-+	&main'external_label($func);
-+	$func=$under.$func;
-+
-+	local($tmp)=<<"EOF";
-+.text
-+EOF
-+	push(@out,$tmp);
-+	if ($main'cpp)
-+		{ push(@out,"TYPE($func,\@function)\n"); }
-+	elsif ($main'coff)
-+		{ $tmp=push(@out,".def\t$func;\t.scl\t2;\t.type\t32;\t.endef\n"); }
-+	elsif ($main'aout and !$main'pic)
-+		{ }
-+	else	{ push(@out,".type	$func,\@function\n"); }
-+	push(@out,".align\t$align\n");
-+	push(@out,"$func:\n");
-+	$stack=4;
-+	}
-+
- sub main'function_end
- 	{
- 	local($func)=@_;
-@@ -694,7 +717,17 @@
- 		{
- 		$tmp=<<___;
- .section	.init
-+#ifdef OPENSSL_PIC
-+	pushl	%ebx
-+	call    .pic_point0
-+.pic_point0:
-+	popl    %ebx
-+	addl    \$_GLOBAL_OFFSET_TABLE_+[.-.pic_point0],%ebx
-+	call	$under$f\@PLT
-+	popl	%ebx
-+#else
- 	call	$under$f
-+#endif
- 	jmp	.Linitalign
- .align	$align
- .Linitalign:
-Index: openssl-0.9.8o/crypto/perlasm/cbc.pl
-===================================================================
---- openssl-0.9.8o.orig/crypto/perlasm/cbc.pl	2005-05-09 21:48:00.000000000 +0000
-+++ openssl-0.9.8o/crypto/perlasm/cbc.pl	2010-06-06 13:09:28.000000000 +0000
-@@ -122,7 +122,11 @@
- 	&mov(&DWP($data_off,"esp","",0),	"eax");	# put in array for call
- 	&mov(&DWP($data_off+4,"esp","",0),	"ebx");	#
- 
--	&call($enc_func);
-+	&call	(&label("pic_point0"));
-+	&set_label("pic_point0");
-+	&blindpop("ebx");
-+	&add	("ebx", "\$_GLOBAL_OFFSET_TABLE_+[.-" . &label("pic_point0") . "]");
-+	&call("$enc_func\@PLT");
- 
- 	&mov("eax",	&DWP($data_off,"esp","",0));
- 	&mov("ebx",	&DWP($data_off+4,"esp","",0));
-@@ -187,7 +191,11 @@
- 	&mov(&DWP($data_off,"esp","",0),	"eax");	# put in array for call
- 	&mov(&DWP($data_off+4,"esp","",0),	"ebx");	#
- 
--	&call($enc_func);
-+	&call	(&label("pic_point1"));
-+	&set_label("pic_point1");
-+	&blindpop("ebx");
-+	&add	("ebx", "\$_GLOBAL_OFFSET_TABLE_+[.-" . &label("pic_point1") . "]");
-+	&call("$enc_func\@PLT");
- 
- 	&mov("eax",	&DWP($data_off,"esp","",0));
- 	&mov("ebx",	&DWP($data_off+4,"esp","",0));
-@@ -220,7 +228,11 @@
- 	&mov(&DWP($data_off,"esp","",0),	"eax");	# put back
- 	&mov(&DWP($data_off+4,"esp","",0),	"ebx");	#
- 
--	&call($dec_func);
-+	&call	(&label("pic_point2"));
-+	&set_label("pic_point2");
-+	&blindpop("ebx");
-+	&add	("ebx", "\$_GLOBAL_OFFSET_TABLE_+[.-" . &label("pic_point2") . "]");
-+	&call("$dec_func\@PLT");
- 
- 	&mov("eax",	&DWP($data_off,"esp","",0));	# get return
- 	&mov("ebx",	&DWP($data_off+4,"esp","",0));	#
-@@ -263,7 +275,11 @@
- 	&mov(&DWP($data_off,"esp","",0),	"eax");	# put back
- 	&mov(&DWP($data_off+4,"esp","",0),	"ebx");	#
- 
--	&call($dec_func);
-+	&call	(&label("pic_point3"));
-+	&set_label("pic_point3");
-+	&blindpop("ebx");
-+	&add	("ebx", "\$_GLOBAL_OFFSET_TABLE_+[.-" . &label("pic_point3") . "]");
-+	&call("$dec_func\@PLT");
- 
- 	&mov("eax",	&DWP($data_off,"esp","",0));	# get return
- 	&mov("ebx",	&DWP($data_off+4,"esp","",0));	#
-Index: openssl-0.9.8o/crypto/perlasm/x86_64-xlate.pl
-===================================================================
---- openssl-0.9.8o.orig/crypto/perlasm/x86_64-xlate.pl	2010-06-06 13:09:00.000000000 +0000
-+++ openssl-0.9.8o/crypto/perlasm/x86_64-xlate.pl	2010-06-06 13:09:28.000000000 +0000
-@@ -435,7 +435,7 @@
- 
-     chomp($line);
- 
--    $line =~ s|[#!].*$||;	# get rid of asm-style comments...
-+#    $line =~ s|[#!].*$||;	# get rid of asm-style comments...
-     $line =~ s|/\*.*\*/||;	# ... and C-style comments...
-     $line =~ s|^\s+||;		# ... and skip white spaces in beginning
- 
-Index: openssl-0.9.8o/crypto/aes/asm/aes-586.pl
-===================================================================
---- openssl-0.9.8o.orig/crypto/aes/asm/aes-586.pl	2008-12-17 14:14:51.000000000 +0000
-+++ openssl-0.9.8o/crypto/aes/asm/aes-586.pl	2010-06-06 13:09:28.000000000 +0000
-@@ -250,7 +250,7 @@
- sub _data_word() { my $i; while(defined($i=shift)) { &data_word($i,$i); } }
- 
- &public_label("AES_Te");
--&function_begin_B("_x86_AES_encrypt");
-+&function_begin_B_static("_x86_AES_encrypt");
- 	if ($vertical_spin) {
- 		# I need high parts of volatile registers to be accessible...
- 		&exch	($s1="edi",$key="ebx");
-@@ -539,7 +539,7 @@
- }
- 
- &public_label("AES_Td");
--&function_begin_B("_x86_AES_decrypt");
-+&function_begin_B_static("_x86_AES_decrypt");
- 	# note that caller is expected to allocate stack frame for me!
- 	&mov	(&DWP(12,"esp"),$key);		# save key
- 
-@@ -1461,15 +1461,22 @@
- &public_label("AES_Td");
- &public_label("AES_Te");
- &function_begin_B("AES_set_decrypt_key");
-+	&push	("ebx");
- 	&mov	("eax",&wparam(0));
- 	&mov	("ecx",&wparam(1));
- 	&mov	("edx",&wparam(2));
- 	&sub	("esp",12);
-+
-+	&call	(&label("pic_point0")); 
-+	&set_label("pic_point0");
-+	&blindpop("ebx");
-+	&add	("ebx", "\$_GLOBAL_OFFSET_TABLE_+[.-" . &label("pic_point0") . "]");
- 	&mov	(&DWP(0,"esp"),"eax");
- 	&mov	(&DWP(4,"esp"),"ecx");
- 	&mov	(&DWP(8,"esp"),"edx");
--	&call	("AES_set_encrypt_key");
-+	&call	("AES_set_encrypt_key\@PLT");
- 	&add	("esp",12);
-+	&pop	("ebx");
- 	&cmp	("eax",0);
- 	&je	(&label("proceed"));
- 	&ret	();
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/pkg-config.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/pkg-config.patch
deleted file mode 100644
index 46c6f03..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/pkg-config.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8k/Makefile.org
-===================================================================
---- openssl-0.9.8k.orig/Makefile.org	2009-07-19 11:34:56.000000000 +0200
-+++ openssl-0.9.8k/Makefile.org	2009-07-19 11:36:02.000000000 +0200
-@@ -444,7 +444,8 @@
- 	    echo 'Description: OpenSSL cryptography library'; \
- 	    echo 'Version: '$(VERSION); \
- 	    echo 'Requires: '; \
--	    echo 'Libs: -L$${libdir} -lcrypto $(EX_LIBS)'; \
-+	    echo 'Libs: -L$${libdir} -lcrypto'; \
-+	    echo 'Libs.private: $(EX_LIBS)'; \
- 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > libcrypto.pc
- 
- libssl.pc: Makefile
-@@ -457,7 +458,8 @@
- 	    echo 'Description: Secure Sockets Layer and cryptography libraries'; \
- 	    echo 'Version: '$(VERSION); \
- 	    echo 'Requires: '; \
--	    echo 'Libs: -L$${libdir} -lssl -lcrypto $(EX_LIBS)'; \
-+	    echo 'Libs: -L$${libdir} -lssl'; \
-+	    echo 'Libs.private: -lcrypto $(EX_LIBS)'; \
- 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > libssl.pc
- 
- openssl.pc: Makefile
-@@ -470,7 +472,8 @@
- 	    echo 'Description: Secure Sockets Layer and cryptography libraries and tools'; \
- 	    echo 'Version: '$(VERSION); \
- 	    echo 'Requires: '; \
--	    echo 'Libs: -L$${libdir} -lssl -lcrypto $(EX_LIBS)'; \
-+	    echo 'Libs: -L$${libdir} -lssl -lcrypto'; \
-+	    echo 'Libs.private: $(EX_LIBS)'; \
- 	    echo 'Cflags: -I$${includedir} $(KRB5_INCLUDES)' ) > openssl.pc
- 
- Makefile: Makefile.org Configure config
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rc4-amd64.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rc4-amd64.patch
deleted file mode 100644
index f57fbc9..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rc4-amd64.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8k/Configure
-===================================================================
---- openssl-0.9.8k.orig/Configure	2009-07-19 11:32:41.000000000 +0200
-+++ openssl-0.9.8k/Configure	2009-07-19 11:37:10.000000000 +0200
-@@ -128,6 +128,9 @@
- my $x86_out_asm="x86cpuid-out.o:bn86-out.o co86-out.o MAYBE-MO86-out.o:dx86-out.o yx86-out.o:ax86-out.o:bx86-out.o:mx86-out.o:sx86-out.o s512sse2-out.o:cx86-out.o:rx86-out.o rc4_skey.o:rm86-out.o:r586-out.o";
- 
- my $x86_64_asm="x86_64cpuid.o:x86_64-gcc.o x86_64-mont.o::aes-x86_64.o::md5-x86_64.o:sha1-x86_64.o sha256-x86_64.o sha512-x86_64.o::rc4-x86_64.o::";
-+# rc4 asm is disabled on amd64 because we configured it with RC4_CHAR while
-+# the assembler only works with int
-+my $x86_64_asm_linux="x86_64cpuid.o:x86_64-gcc.o x86_64-mont.o::aes-x86_64.o::md5-x86_64.o:sha1-x86_64.o sha256-x86_64.o sha512-x86_64.o::::";
- my $ia64_asm=":bn-ia64.o::aes_core.o aes_cbc.o aes-ia64.o:::sha1-ia64.o sha256-ia64.o sha512-ia64.o::rc4-ia64.o rc4_skey.o::";
- 
- my $no_asm="::::::::::";
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rehash-crt.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rehash-crt.patch
deleted file mode 100644
index d9d6b70..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rehash-crt.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8k/tools/c_rehash.in
-===================================================================
---- openssl-0.9.8k.orig/tools/c_rehash.in	2002-10-11 22:31:27.000000000 +0200
-+++ openssl-0.9.8k/tools/c_rehash.in	2009-07-19 11:36:26.000000000 +0200
-@@ -59,12 +59,15 @@
- 		}
- 	}
- 	closedir DIR;
--	FILE: foreach $fname (grep {/\.pem$/} @flist) {
-+	FILE: foreach $fname (grep {/\.pem$|\.crt$/} @flist) {
- 		# Check to see if certificates and/or CRLs present.
- 		my ($cert, $crl) = check_file($fname);
- 		if(!$cert && !$crl) {
--			print STDERR "WARNING: $fname does not contain a certificate or CRL: skipping\n";
--			next;
-+			($cert, $crl) = check_file("$openssl x509 -in \"$fname\" -inform der  -outform pem | ");
-+			if(!$cert && !$crl) {
-+				print STDERR "WARNING: $fname does not contain a certificate or CRL: skipping\n";
-+				next;
-+			}
- 		}
- 		link_hash_cert($fname) if($cert);
- 		link_hash_crl($fname) if($crl);
-@@ -102,6 +105,9 @@
- 		my $fname = $_[0];
- 		$fname =~ s/'/'\\''/g;
- 		my ($hash, $fprint) = `"$openssl" x509 -hash -fingerprint -noout -in '$fname'`;
-+		if(!$hash || !fprint) {
-+			($hash, $fprint) = `"$openssl" x509 -hash -fingerprint -noout -in '$fname' -inform der`;
-+		}
- 		chomp $hash;
- 		chomp $fprint;
- 		$fprint =~ s/^.*=//;
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rehash_pod.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rehash_pod.patch
deleted file mode 100644
index 3426ba8..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rehash_pod.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8k/doc/apps/c_rehash.pod
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ openssl-0.9.8k/doc/apps/c_rehash.pod	2009-07-19 11:36:27.000000000 +0200
-@@ -0,0 +1,55 @@
-+
-+=pod
-+
-+=head1 NAME
-+
-+c_rehash - Create symbolic links to files named by the hash values
-+
-+=head1 SYNOPSIS
-+
-+B<c_rehash>
-+[directory] ...
-+
-+=head1 DESCRIPTION
-+
-+c_rehash scans directories and takes a hash value of each .pem and .crt file in the directory. It then creates symbolic links for each of the files named by the hash value. This is useful as many programs require directories to be set up like this in order to find the certificates they require. 
-+
-+If any directories are named on the command line then these directories are processed in turn. If not then and the environment variable SSL_CERT_DIR is defined then that is consulted. This variable should be a colon (:) separated list of directories, all of which will be processed. If neither of these conditions are true then /usr/lib/ssl/certs is processed. 
-+
-+For each directory that is to be processed he user must have write permissions on the directory, if they do not then nothing will be printed for that directory.
-+
-+Note that this program deletes all the symbolic links that look like ones that it creates before processing a directory. Beware that if you run the program on a directory that contains symbolic links for other purposes that are named in the same format as those created by this program they will be lost.
-+
-+The hashes for certificate files are of the form <hash>.<n> where n is an integer. If the hash value already exists then n will be incremented, unless the file is a duplicate. Duplicates are detected using the fingerprint of the certificate. A warning will be printed if a duplicate is detected. The hashes for CRL files are of the form <hash>.r<n> and have the same behavior.
-+
-+The program will also warn if there are files with extension .pem which are not certificate or CRL files.
-+
-+The program uses the openssl program to compute the hashes and fingerprints. It expects the executable to be named openssl and be on the PATH, or in the /usr/lib/ssl/bin directory. If the OPENSSL environment variable is defined then this is used instead as the executable that provides the hashes and fingerprints. When called as $OPENSSL x509 -hash -fingerprint -noout -in $file it must output the hash of $file on the first line followed by the fingerprint on the second line, optionally prefixed with some text and an equals sign (=). 
-+
-+=head1 OPTIONS
-+
-+None
-+
-+=head1 ENVIRONMENT
-+
-+=over 4
-+
-+=item B<OPENSSL>
-+
-+The name (and path) of an executable to use to generate hashes and fingerprints (see above).
-+
-+=item B<SSL_CERT_DIR>
-+
-+Colon separated list of directories to operate on. Ignored if directories are listed on the command line.
-+
-+=head1 SEE ALSO
-+
-+L<openssl(1)|openssl(1)>, L<x509(1)|x509(1)>
-+
-+=back
-+
-+=head1 BUGS
-+
-+No known bugs
-+
-+=cut
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/series b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/series
deleted file mode 100644
index b764c04..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/series
+++ /dev/null
@@ -1,20 +0,0 @@
-ca.patch
-config-hurd.patch
-debian-targets.patch
-engines-path.patch
-kfreebsd-pipe.patch
-make-targets.patch
-man-dir.patch
-man-section.patch
-no-rpath.patch
-no-symbolic.patch
-pic.patch
-pkg-config.patch
-valgrind.patch
-rc4-amd64.patch
-rehash-crt.patch
-rehash_pod.patch
-shared-lib-ext.patch
-stddef.patch
-version-script.patch
-perl-path.diff
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/shared-lib-ext.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/shared-lib-ext.patch
deleted file mode 100644
index 79eb39f..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/shared-lib-ext.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8k/Configure
-===================================================================
---- openssl-0.9.8k.orig/Configure	2009-07-19 11:36:24.000000000 +0200
-+++ openssl-0.9.8k/Configure	2009-07-19 11:37:03.000000000 +0200
-@@ -1568,7 +1568,8 @@
- 	elsif ($shared_extension ne "" && $shared_extension =~ /^\.s([ol])\.[^\.]*\.[^\.]*$/)
- 		{
- 		my $sotmp = $1;
--		s/^SHARED_LIBS_LINK_EXTS=.*/SHARED_LIBS_LINK_EXTS=.s$sotmp.\$(SHLIB_MAJOR) .s$sotmp/;
-+#		s/^SHARED_LIBS_LINK_EXTS=.*/SHARED_LIBS_LINK_EXTS=.s$sotmp.\$(SHLIB_MAJOR) .s$sotmp/;
-+		s/^SHARED_LIBS_LINK_EXTS=.*/SHARED_LIBS_LINK_EXTS=.s$sotmp/;
- 		}
- 	elsif ($shared_extension ne "" && $shared_extension =~ /^\.[^\.]*\.[^\.]*\.dylib$/)
- 		{
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/stddef.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/stddef.patch
deleted file mode 100644
index 3436b29..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/stddef.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8k/crypto/sha/sha.h
-===================================================================
---- openssl-0.9.8k.orig/crypto/sha/sha.h	2008-09-16 12:47:28.000000000 +0200
-+++ openssl-0.9.8k/crypto/sha/sha.h	2009-07-19 11:36:28.000000000 +0200
-@@ -59,6 +59,7 @@
- #ifndef HEADER_SHA_H
- #define HEADER_SHA_H
- 
-+#include <stddef.h>
- #include <openssl/e_os2.h>
- #include <stddef.h>
- 
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/version-script.patch
deleted file mode 100644
index 6fa3d75..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/version-script.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-0.9.8m/Configure
-===================================================================
---- openssl-0.9.8m.orig/Configure	2010-02-27 12:28:32.000000000 +0100
-+++ openssl-0.9.8m/Configure	2010-02-27 12:28:35.000000000 +0100
-@@ -1512,6 +1512,8 @@
- 		}
- 	}
- 
-+$shared_ldflag .= " -Wl,--version-script=openssl.ld";
-+
- open(IN,'<Makefile.org') || die "unable to read Makefile.org:$!\n";
- unlink("$Makefile.new") || die "unable to remove old $Makefile.new:$!\n" if -e "$Makefile.new";
- open(OUT,">$Makefile.new") || die "unable to create $Makefile.new:$!\n";
-Index: openssl-0.9.8m/openssl.ld
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ openssl-0.9.8m/openssl.ld	2010-02-27 12:28:35.000000000 +0100
-@@ -0,0 +1,5 @@
-+OPENSSL_0.9.8 {
-+	 global:
-+		 *;
-+};
-+
-Index: openssl-0.9.8m/engines/openssl.ld
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ openssl-0.9.8m/engines/openssl.ld	2010-02-27 12:28:35.000000000 +0100
-@@ -0,0 +1,5 @@
-+OPENSSL_0.9.8 {
-+	 global:
-+		 *;
-+};
-+
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/parallel-make-fix.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/parallel-make-fix.patch
deleted file mode 100644
index 82857f5..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/parallel-make-fix.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Submitted
-
-fix the parallel build regarding shared libraries.
-
-Signed-off-by: Qing He <qing.he@intel.com>
-
-diff --git a/Makefile.org b/Makefile.org
-index 2fb0309..8bec3d0 100644
---- a/Makefile.org
-+++ b/Makefile.org
-@@ -352,6 +352,9 @@ all_testapps: build_libs build_testapps
- build_testapps:
- 	@dir=crypto; target=testapps; $(BUILD_ONE_CMD)
- 
-+libcrypto.a: build_crypto
-+libssl.a: build_ssl
-+
- build_shared:	$(SHARED_LIBS)
- libcrypto$(SHLIB_EXT): libcrypto.a $(SHARED_FIPS)
- 	@if [ "$(SHLIB_TARGET)" != "" ]; then \
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8t/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/shared-libs.patch
deleted file mode 100644
index 19de112..0000000
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8t/shared-libs.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff --git a/Makefile.org b/Makefile.org
-index e87d623..25ff367 100644
---- a/Makefile.org
-+++ b/Makefile.org
-@@ -355,7 +355,7 @@ libcrypto$(SHLIB_EXT): libcrypto.a $(SHARED_FIPS)
- 	@if [ "$(SHLIB_TARGET)" != "" ]; then \
- 		if [ "$(FIPSCANLIB)" = "libfips" ]; then \
- 			$(ARD) libcrypto.a fipscanister.o ; \
--			$(MAKE) SHLIBDIRS='crypto' SHLIBDEPS='-lfips' build-shared; \
-+			$(MAKE) -e SHLIBDIRS='crypto' SHLIBDEPS='-lfips' build-shared; \
- 			$(AR) libcrypto.a fips/fipscanister.o ; \
- 		else \
- 			if [ "$(FIPSCANLIB)" = "libcrypto" ]; then \
-@@ -373,7 +373,7 @@ libssl$(SHLIB_EXT): libcrypto$(SHLIB_EXT) libssl.a
- 	@if [ "$(SHLIB_TARGET)" != "" ]; then \
- 		shlibdeps=-lcrypto; \
- 		[ "$(FIPSCANLIB)" = "libfips" ] && shlibdeps="$$shlibdeps -lfips"; \
--		$(MAKE) SHLIBDIRS=ssl SHLIBDEPS="$$shlibdeps" build-shared; \
-+		$(MAKE) -e SHLIBDIRS=ssl SHLIBDEPS="$$shlibdeps" build-shared; \
- 	else \
- 		echo "There's no support for shared libraries on this platform" >&2 ; \
- 		exit 1; \
-diff --git a/crypto/Makefile b/crypto/Makefile
-index 6557f2b..a69bf7c 100644
---- a/crypto/Makefile
-+++ b/crypto/Makefile
-@@ -103,7 +103,7 @@ $(LIB):	$(LIBOBJ)
- 
- shared: buildinf.h lib subdirs
- 	if [ -n "$(SHARED_LIBS)" ]; then \
--		(cd ..; $(MAKE) $(SHARED_LIB)); \
-+		(cd ..; $(MAKE) -e $(SHARED_LIB)); \
- 	fi
- 
- libs:
-diff --git a/ssl/Makefile b/ssl/Makefile
-index 5ac3507..77ea2bd 100644
---- a/ssl/Makefile
-+++ b/ssl/Makefile
-@@ -62,7 +62,7 @@ lib:	$(LIBOBJ)
- 
- shared: lib
- 	if [ -n "$(SHARED_LIBS)" ]; then \
--		(cd ..; $(MAKE) $(SHARED_LIB)); \
-+		(cd ..; $(MAKE) -e $(SHARED_LIB)); \
- 	fi
- 
- files:
diff --git a/meta/recipes-connectivity/openssl/openssl_0.9.8t.bb b/meta/recipes-connectivity/openssl/openssl_0.9.8t.bb
deleted file mode 100644
index 74892c1..0000000
--- a/meta/recipes-connectivity/openssl/openssl_0.9.8t.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-require openssl.inc
-
-PR = "r0"
-SRC_URI += "file://debian/ca.patch \
-            file://debian/config-hurd.patch;apply=no \
-            file://debian/debian-targets.patch \
-            file://debian/engines-path.patch \
-            file://debian/kfreebsd-pipe.patch;apply=no \
-            file://debian/make-targets.patch \
-            file://debian/man-dir.patch \
-            file://debian/man-section.patch \
-            file://debian/no-rpath.patch \
-            file://debian/no-symbolic.patch \
-            file://debian/pic.patch \
-            file://debian/pkg-config.patch \
-            file://debian/rc4-amd64.patch \
-            file://debian/rehash-crt.patch \
-            file://debian/rehash_pod.patch \
-            file://debian/shared-lib-ext.patch \
-            file://debian/stddef.patch \
-            file://debian/version-script.patch \
-            file://debian/perl-path.diff"
-
-SRC_URI += "file://configure-targets.patch \
-            file://shared-libs.patch \
-            file://parallel-make-fix.patch"
-
-SRC_URI[md5sum] = "fbf71e8e050bc1ec290b7468bab1a76e"
-SRC_URI[sha256sum] = "edc9639beaf2d5e239d8e5c9d2fe1959e6726a5d7f8ab8430613835f4623f9ba"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
1.7.6.5



