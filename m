Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W0H-0004v2-DW
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:30:33 +0200
Received: by iye7 with SMTP id 7so3385901iye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=eAqs2ScqJDHIHAMtB4IURLEF9ODd8OCzRdo1v9OcQb8=;
	b=aSbt/FmrFd/a5KvpOIt5ElEup6RgHVeNDHE0kIL6riRcpIhf+DORM34mcHN4I5NLKH
	ZyVtuxccAKQuDliq69BRD5uc34MJhM+ZWReqYxxMs31LoeNzK5Dn5JX6KCHFeHQ7Rg28
	Q7ADLQpltayMhbItwMq+rbbCJ+NNDnjHRR8uY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=S/uYxuLYGAiZRMyOCv0pDUPeZCqSeO1C9ktamLUmKtY9rlLwI97T897y1f70K30kD/
	DfWYA3atSSyVXdLrL4ALLy++pk2cu77/S2mrmTTKbyVEip+XKWmCrNR8VfFBwv7Z4D2j
	b9Wxs+4HcU542+ULt+zxZTHqX+r81YylwjS3g=
Received: by 10.42.74.71 with SMTP id v7mr4567309icj.232.1301632112319;
	Thu, 31 Mar 2011 21:28:32 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 19sm1177983ibx.52.2011.03.31.21.28.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:28:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:28:23 -0700
Message-Id: <f342173d3b3e5e329a81f4d1abb91f4af42e5335.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 06/46] recipes: Use -uclibceabi instead of -uclibcgnueabi
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
X-List-Received-Date: Fri, 01 Apr 2011 04:30:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pciutils/pciutils-3.1.7/configure.patch        |    2 +-
 .../pciutils/pciutils-3.1.7/guess-fix.patch        |    2 +-
 .../openssl/openssl-0.9.8p/configure-targets.patch |    4 ++--
 .../gcc/gcc-4.3.3/110-arm-eabi.patch               |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-sdk.inc    |    2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.7/configure.patch b/meta/recipes-bsp/pciutils/pciutils-3.1.7/configure.patch
index 1bfe724..600af79 100644
--- a/meta/recipes-bsp/pciutils/pciutils-3.1.7/configure.patch
+++ b/meta/recipes-bsp/pciutils/pciutils-3.1.7/configure.patch
@@ -63,7 +63,7 @@ diff -uNr pciutils-3.1.5.orig/lib/configure pciutils-3.1.5/lib/configure
 +	sys=linux
 +fi
 +
-+if [ "$host" = "linux--uclibcgnueabi" ]
++if [ "$host" = "linux--uclibceabi" ]
 +then
 +	sys=linux
 +fi
diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.7/guess-fix.patch b/meta/recipes-bsp/pciutils/pciutils-3.1.7/guess-fix.patch
index 9072d2a..f1fcb33 100644
--- a/meta/recipes-bsp/pciutils/pciutils-3.1.7/guess-fix.patch
+++ b/meta/recipes-bsp/pciutils/pciutils-3.1.7/guess-fix.patch
@@ -25,7 +25,7 @@ index 4318b05..84f6acb 100755
 -	sys=linux
 -fi
 -
--if [ "$host" = "linux--uclibcgnueabi" ]
+-if [ "$host" = "linux--uclibceabi" ]
 -then
 -	sys=linux
 -fi
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8p/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8p/configure-targets.patch
index b68123a..6fd2769 100644
--- a/meta/recipes-connectivity/openssl/openssl-0.9.8p/configure-targets.patch
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8p/configure-targets.patch
@@ -14,8 +14,8 @@ Index: openssl-0.9.8g/Configure
 +"linux-elf-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-gnueabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +"linux-gnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-uclibcgnueabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
-+"linux-uclibcgnueabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-uclibceabi-arm","$ENV{'CC'}:-DL_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-uclibceabi-armeb","$ENV{'CC'}:-DB_ENDIAN -DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
 +
 +"linux-avr32","$ENV{'CC'}:-DTERMIO -O3 -fomit-frame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).",
 +
diff --git a/meta/recipes-devtools/gcc/gcc-4.3.3/110-arm-eabi.patch b/meta/recipes-devtools/gcc/gcc-4.3.3/110-arm-eabi.patch
index acebe53..74e4a5a 100644
--- a/meta/recipes-devtools/gcc/gcc-4.3.3/110-arm-eabi.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.3.3/110-arm-eabi.patch
@@ -5,7 +5,7 @@
  	tmake_file="t-slibgcc-elf-ver t-linux arm/t-arm"
  	case ${target} in
 -	arm*-*-linux-gnueabi)
-+	arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
++	arm*-*-linux-gnueabi | arm*-*-linux-uclibceabi)
  	    tm_file="$tm_file arm/bpabi.h arm/linux-eabi.h"
  	    tmake_file="$tmake_file arm/t-arm-elf arm/t-bpabi arm/t-linux-eabi"
    	    # The BPABI long long divmod functions return a 128-bit value in 
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 4393777..f7b5836 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -48,7 +48,7 @@ EXTRA_OECONF = "${@['--enable-clocale=generic', ''][bb.data.getVar('USE_NLS', d,
 EXTRA_OECONF_append_linux               = " --enable-__cxa_atexit"
 EXTRA_OECONF_append_linux-gnueabi       = " --enable-__cxa_atexit"
 EXTRA_OECONF_append_linux-uclibc        = " --disable-__cxa_atexit"
-EXTRA_OECONF_append_linux-uclibcgnueabi = " --disable-__cxa_atexit"
+EXTRA_OECONF_append_linux-uclibceabi = " --disable-__cxa_atexit"
 EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
 CPPFLAGS = ""
 
diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
index 756e74e..de80870 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
@@ -2,7 +2,7 @@ require gcc-configure-common.inc
 
 # The two lines below conflict, this needs fixing - RP
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
-USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibcgnueabi", "no", "", d )}'
+USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibceabi", "no", "", d )}'
 
 EXTRA_OECONF_PATHS = "--with-local-prefix=${SDKPATH}/sysroots/${TARGET_SYS}${target_exec_prefix} \
                       --with-gxx-include-dir=${target_includedir}/c++ \
-- 
1.7.4.1



