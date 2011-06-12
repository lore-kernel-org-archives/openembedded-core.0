Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QVcCS-0001l5-Cn
	for openembedded-core@lists.openembedded.org;
	Sun, 12 Jun 2011 06:23:00 +0200
Received: by pwj9 with SMTP id 9so1811283pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2011 21:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=dsE3iyQaL9wCjJapPa6shSoFTNfphVZuQ12B7Ped334=;
	b=mV12snOPjAlA540+Qw1xCmIpUfJBtuvG2Rq2BTtsWgHa+hh9Es0m4rr9kee8DsdAZr
	uHy0QpRnZGXM8//W5pQopj/oDMdMy1zelKefpJNl/pH7/LGKvWKce10cHFiXF5yUG86p
	toNKr0iN0Xhr06frSE37f4dCkR2ru3Skuhydo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=n+rR4dy4EMwahNaoyZWATTATuPQTXXy78K9Hzu2N9VrThbl3QX3f74kaH3315fpSYu
	ED5RdPFgQ+Bp97caq2lm6403IFKHj+7rkb1PE3Uy0clbhebt8B0e4mRDRmPgcWl/jt51
	vJ3SVpPpT+fuhVhSjkCrqmhGI6dfQKHrM0c1c=
Received: by 10.68.65.78 with SMTP id v14mr1659649pbs.204.1307852377124;
	Sat, 11 Jun 2011 21:19:37 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x1sm3579520pbb.18.2011.06.11.21.19.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Jun 2011 21:19:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Jun 2011 21:19:05 -0700
Message-Id: <3e80c5f6d00418f70f584d990dbedf12e727a7d7.1307852182.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <83f1e8503def3a9d29b83b3b5defc728c7859385.1307852182.git.raj.khem@gmail.com>
References: <83f1e8503def3a9d29b83b3b5defc728c7859385.1307852182.git.raj.khem@gmail.com>
In-Reply-To: <cover.1307852182.git.raj.khem@gmail.com>
References: <cover.1307852182.git.raj.khem@gmail.com>
Subject: [PATCH 4/6] uclibc: Cleanup the machine dependent config files
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
X-List-Received-Date: Sun, 12 Jun 2011 04:23:00 -0000

We only have arch specific machine fragments now.
Introduce use of KCONFIG_ALLCONFIG and use allnoconfig

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc/uclibc-git/armv5te/uClibc.machine       |    4 +-
 .../{nslu2be => armv5teb}/uClibc.machine           |    0
 .../uclibc/uclibc-git/efika/uClibc.machine         |   45 ------------
 .../uclibc-git/{qemumips => mips}/uClibc.machine   |    0
 .../uclibc/uclibc-git/qemuarm/uClibc.machine       |   77 --------------------
 .../uclibc/uclibc-git/qemux86/uClibc.machine       |   59 ---------------
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |   14 ++++-
 meta/recipes-core/uclibc/uclibc.inc                |    5 +-
 meta/recipes-core/uclibc/uclibc_git.bb             |    1 -
 9 files changed, 17 insertions(+), 188 deletions(-)
 rename meta/recipes-core/uclibc/uclibc-git/{nslu2be => armv5teb}/uClibc.machine (100%)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/efika/uClibc.machine
 rename meta/recipes-core/uclibc/uclibc-git/{qemumips => mips}/uClibc.machine (100%)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/qemuarm/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/qemux86/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/uClibc.config

diff --git a/meta/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine
index b012a38..2242dc9 100644
--- a/meta/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine
+++ b/meta/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine
@@ -38,14 +38,14 @@ FORCE_OPTIONS_FOR_ARCH=y
 CONFIG_ARM_EABI=y
 # COMPILE_IN_THUMB_MODE is not set
 USE_BX=y
-CONFIG_GENERIC_ARM=y
+# CONFIG_GENERIC_ARM is not set
 # CONFIG_ARM610 is not set
 # CONFIG_ARM710 is not set
 # CONFIG_ARM7TDMI is not set
 # CONFIG_ARM720T is not set
 # CONFIG_ARM920T is not set
 # CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
+CONFIG_ARM926T=y
 # CONFIG_ARM10T is not set
 # CONFIG_ARM1136JF_S is not set
 # CONFIG_ARM1176JZ_S is not set
diff --git a/meta/recipes-core/uclibc/uclibc-git/nslu2be/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/armv5teb/uClibc.machine
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/nslu2be/uClibc.machine
rename to meta/recipes-core/uclibc/uclibc-git/armv5teb/uClibc.machine
diff --git a/meta/recipes-core/uclibc/uclibc-git/efika/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/efika/uClibc.machine
deleted file mode 100644
index 5ed7b51..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/efika/uClibc.machine
+++ /dev/null
@@ -1,45 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Wed Dec 20 11:05:48 2006
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-TARGET_powerpc=y
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="powerpc"
-FORCE_OPTIONS_FOR_ARCH=y
-ARCH_BIG_ENDIAN=y
-
-#
-# Using Big Endian
-#
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
-KERNEL_HEADERS="<path/to/kernel/headers>" 
-HAVE_DOT_CONFIG=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/qemumips/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine
similarity index 100%
rename from meta/recipes-core/uclibc/uclibc-git/qemumips/uClibc.machine
rename to meta/recipes-core/uclibc/uclibc-git/mips/uClibc.machine
diff --git a/meta/recipes-core/uclibc/uclibc-git/qemuarm/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/qemuarm/uClibc.machine
deleted file mode 100644
index 2242dc9..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/qemuarm/uClibc.machine
+++ /dev/null
@@ -1,77 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Version: 0.9.32-git
-# Mon Jul 19 01:34:29 2010
-#
-# TARGET_alpha is not set
-TARGET_arm=y
-# TARGET_avr32 is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-# TARGET_xtensa is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="arm"
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_ARM_OABI is not set
-CONFIG_ARM_EABI=y
-# COMPILE_IN_THUMB_MODE is not set
-USE_BX=y
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-CONFIG_ARM926T=y
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_CORTEX_M3 is not set
-# CONFIG_ARM_CORTEX_M1 is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-# CONFIG_ARM_XSCALE is not set
-# CONFIG_ARM_IWMMXT is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_ANY_ENDIAN=y
-ARCH_LITTLE_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN is not set
-ARCH_WANTS_LITTLE_ENDIAN=y
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-# UCLIBC_HAS_FPU is not set
-UCLIBC_HAS_SOFT_FLOAT=y
-DO_C99_MATH=y
-# DO_XSI_MATH is not set
-# UCLIBC_HAS_FENV is not set
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/qemux86/uClibc.machine b/meta/recipes-core/uclibc/uclibc-git/qemux86/uClibc.machine
deleted file mode 100644
index 3909ccc..0000000
--- a/meta/recipes-core/uclibc/uclibc-git/qemux86/uClibc.machine
+++ /dev/null
@@ -1,59 +0,0 @@
-#
-# Automatically generated make config: don't edit
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-TARGET_i386=y
-# TARGET_i960 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_x86_64 is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="i386"
-# ARCH_SUPPORTS_BIG_ENDIAN is not set
-ARCH_SUPPORTS_LITTLE_ENDIAN=y
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_GENERIC_386 is not set
-# CONFIG_386 is not set
-# CONFIG_486 is not set
-# CONFIG_586 is not set
-# CONFIG_586MMX is not set
-# CONFIG_686 is not set
-# CONFIG_PENTIUMII is not set
-# CONFIG_PENTIUMIII is not set
-CONFIG_PENTIUM4=y
-# CONFIG_K6 is not set
-# CONFIG_K7 is not set
-# CONFIG_ELAN is not set
-# CONFIG_CRUSOE is not set
-# CONFIG_WINCHIPC6 is not set
-# CONFIG_WINCHIP2 is not set
-# CONFIG_CYRIXIII is not set
-# CONFIG_NEHEMIAH is not set
-ARCH_LITTLE_ENDIAN=y
-# ARCH_BIG_ENDIAN is not set
-# ARCH_HAS_NO_MMU is not set
-ARCH_HAS_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
-# UCLIBC_HAS_FENV is not set
-KERNEL_HEADERS="<path/to/kernel/headers>"
-HAVE_DOT_CONFIG=y
diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.config b/meta/recipes-core/uclibc/uclibc-git/uClibc.config
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
index a1b7813..45b131d 100644
--- a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
+++ b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
@@ -157,4 +157,16 @@ WARNINGS="-Wall"
 DO_C99_MATH=y
 UCLIBC_HAS_LONG_DOUBLE_MATH=y
 UCLIBC_HAS_FENV=y
-
+UCLIBC_LINUX_SPECIFIC=y
+UCLIBC_HAS_REALTIME=y
+UCLIBC_HAS_ADVANCED_REALTIME=y
+UCLIBC_HAS_NETWORK_SUPPORT=y
+UCLIBC_HAS_SOCKET=y
+UCLIBC_HAS_BSD_ERR=y
+UCLIBC_HAS_SYSLOG=y
+UCLIBC_HAS_CRYPT=y
+UCLIBC_HAS_CRYPT_IMPL=y
+UCLIBC_HAS_GNU_ERROR=y
+UCLIBC_HAS_PTY=y
+UCLIBC_BSD_SPECIFIC=y
+UCLIBC_HAS_EPOLL=y
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 0f8c6c2..2bf3017 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -202,12 +202,11 @@ do_configure() {
         echo "### FPU" >>${S}/merged.config
         echo "### ABI" >>${S}/merged.config
         echo "### DISTRO FEATURES" >>${S}/merged.config
-        cp ${S}/merged.config ${S}/.config
 
         # Mangle the resulting .config depending on OE variables
-        sed -i -e '${configmangle}' ${S}/.config
+        sed -i -e '${configmangle}' ${S}/merged.config
 
-        oe_runmake oldconfig
+        oe_runmake KCONFIG_ALLCONFIG=${S}/merged.config allnoconfig
 }
 
 do_install() {
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index eded2fb..6c88513 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -10,7 +10,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
 
 SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
-	file://uClibc.config \
 	file://uClibc.machine \
 	file://uClibc.distro \
 	file://uclibc-arm-ftruncate64.patch \
-- 
1.7.4.1



