Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id B5CEA65CBB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 09:07:05 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id p65so14603030wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Apr 2016 02:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=g7CvIXvhyM7Da/hEKyc03NKX0HEuJpjHZXw3NuyCixQ=;
	b=QbHmx7ei1rMxiAhsFt0EiBIorNuQQKGXWTrmQi3bOpsWxbcEPI/buedjIoXn4oj+ah
	IAqbFMdqSqvfE41Tgz1aZcdn9NvPTrnZ3JevCd1A4XVX9AFCw1TTnfjM2JbdRtvoWPzu
	Z3P0bTueSKXYWdjOZ5Yy5M10eXu/yTEjIX+sbKV5y1PvaQu2bSdcvBetnvB6BJ/DXQ7u
	oFkLWkXdCesX6pH++IUAUABg3AGAJOWyBWkb7gcMC68m8ijQih0IZSdQxdwX+v0yaPdr
	yo8TTM+VvwF8I+kyExZq8Ro03Iu5GbunhT/aOVcoKFUTfO2dEmxwCa+BvroLL7QO9NxJ
	3Zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=g7CvIXvhyM7Da/hEKyc03NKX0HEuJpjHZXw3NuyCixQ=;
	b=SXbbc/FwDInByW3stRLF8KnUOQMTU3faEf9nLeFdux3TaMU+7vWnTCPrQE/ux+RP5j
	iTiPwe2LJHvnrzVFimkOE8nUwfYCwyaU6GG+Zp+8iHlv+6nxdNEUEv61rM7bAE3g7SNU
	YeXedygfBkA/nqAai7TvvisUSUayz9xZOgrCYp+CLUIzdb47h/lGTu3HbOt7BjiqNSsZ
	bbVrqdJ7AYRDYW9s9iAm34bQirufjv+qCTqj60nuPZCBS/HAAapHnb02zZ1v7ylSbZi3
	eMbF0/P99KH73+PAWrPV5Jv9rylG4DUaT2FshiSxhK9HUt8/xAKLWraTm4P1qHoZvtBc
	CmXQ==
X-Gm-Message-State: AD7BkJLO+LnB/jCv0maSfHXSKBEv0ixieAVEtYQv9HSf4daxNDe/Yb6oDaD25vCea/Pv0MmR
X-Received: by 10.28.52.197 with SMTP id b188mr2679793wma.77.1459501625068;
	Fri, 01 Apr 2016 02:07:05 -0700 (PDT)
Received: from Blackadder.home
	(host86-177-103-194.range86-177.btcentralplus.com. [86.177.103.194])
	by smtp.gmail.com with ESMTPSA id v6sm3629724wmv.16.2016.04.01.02.07.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Fri, 01 Apr 2016 02:07:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Apr 2016 10:06:56 +0100
Message-Id: <1459501616-4775-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4 (Apple Git-63)
Subject: [PATCH] meta: remove obsolete architectures
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
X-List-Received-Date: Fri, 01 Apr 2016 09:07:08 -0000

Remove ancient and obsolete architectures from openembedded-core, they've no
real users and are causing complications that can be now removed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cmake.bbclass                         |   4 -
 meta/classes/insane.bbclass                        |  30 ---
 meta/classes/libc-package.bbclass                  |   7 -
 meta/classes/qemu.bbclass                          |  12 -
 meta/classes/siteinfo.bbclass                      |  26 --
 meta/conf/bitbake.conf                             |   7 -
 meta/conf/machine/include/mips/README              |  36 ---
 meta/conf/machine/include/mips/arch-mips.inc       | 102 --------
 meta/conf/machine/include/powerpc/README           |  17 --
 meta/conf/machine/include/powerpc/arch-powerpc.inc |  34 ---
 .../machine/include/powerpc/arch-powerpc64.inc     |  14 --
 meta/conf/machine/include/sh/README                |  11 -
 meta/conf/machine/include/sh/arch-sh.inc           |   9 -
 meta/conf/machine/include/tune-mips32.inc          |  25 --
 meta/conf/machine/include/tune-mips32r2.inc        |  17 --
 meta/conf/machine/include/tune-mips64.inc          |   3 -
 meta/conf/machine/include/tune-octeon.inc          |  32 ---
 meta/conf/machine/include/tune-power5.inc          |  21 --
 meta/conf/machine/include/tune-power6.inc          |  21 --
 meta/conf/machine/include/tune-power7.inc          |  21 --
 meta/conf/machine/include/tune-ppc476.inc          |  14 --
 meta/conf/machine/include/tune-ppc603e.inc         |  14 --
 meta/conf/machine/include/tune-ppc7400.inc         |  14 --
 meta/conf/machine/include/tune-ppce300c2.inc       |  11 -
 meta/conf/machine/include/tune-ppce300c3.inc       |  23 --
 meta/conf/machine/include/tune-ppce500.inc         |  20 --
 meta/conf/machine/include/tune-ppce500mc.inc       |  14 --
 meta/conf/machine/include/tune-ppce500v2.inc       |  20 --
 meta/conf/machine/include/tune-ppce5500.inc        |  20 --
 meta/conf/machine/include/tune-ppce6500.inc        |  21 --
 meta/conf/machine/include/tune-sh3.inc             |  17 --
 meta/conf/machine/include/tune-sh4.inc             |  34 ---
 meta/conf/machine/qemumips.conf                    |  13 -
 meta/conf/machine/qemumips64.conf                  |  13 -
 meta/conf/machine/qemuppc.conf                     |  13 -
 meta/site/mips-common                              |  56 -----
 meta/site/mips-linux                               |  79 ------
 meta/site/mips-linux-uclibc                        |  80 ------
 meta/site/mips64-linux                             |  83 -------
 meta/site/mips64-linux-uclibc                      |  83 -------
 meta/site/mips64el-linux                           |  82 ------
 meta/site/mips64el-linux-uclibc                    | 108 --------
 meta/site/mipsel-linux                             |  79 ------
 meta/site/mipsel-linux-uclibc                      | 100 --------
 meta/site/powerpc-common                           |  14 --
 meta/site/powerpc-darwin                           |   7 -
 meta/site/powerpc-linux                            |  16 --
 meta/site/powerpc32-linux                          | 275 ---------------------
 meta/site/powerpc64-linux                          |  39 ---
 49 files changed, 1811 deletions(-)
 delete mode 100644 meta/conf/machine/include/mips/README
 delete mode 100644 meta/conf/machine/include/mips/arch-mips.inc
 delete mode 100644 meta/conf/machine/include/powerpc/README
 delete mode 100644 meta/conf/machine/include/powerpc/arch-powerpc.inc
 delete mode 100644 meta/conf/machine/include/powerpc/arch-powerpc64.inc
 delete mode 100644 meta/conf/machine/include/sh/README
 delete mode 100644 meta/conf/machine/include/sh/arch-sh.inc
 delete mode 100644 meta/conf/machine/include/tune-mips32.inc
 delete mode 100644 meta/conf/machine/include/tune-mips32r2.inc
 delete mode 100644 meta/conf/machine/include/tune-mips64.inc
 delete mode 100644 meta/conf/machine/include/tune-octeon.inc
 delete mode 100644 meta/conf/machine/include/tune-power5.inc
 delete mode 100644 meta/conf/machine/include/tune-power6.inc
 delete mode 100644 meta/conf/machine/include/tune-power7.inc
 delete mode 100644 meta/conf/machine/include/tune-ppc476.inc
 delete mode 100644 meta/conf/machine/include/tune-ppc603e.inc
 delete mode 100644 meta/conf/machine/include/tune-ppc7400.inc
 delete mode 100644 meta/conf/machine/include/tune-ppce300c2.inc
 delete mode 100644 meta/conf/machine/include/tune-ppce300c3.inc
 delete mode 100644 meta/conf/machine/include/tune-ppce500.inc
 delete mode 100644 meta/conf/machine/include/tune-ppce500mc.inc
 delete mode 100644 meta/conf/machine/include/tune-ppce500v2.inc
 delete mode 100644 meta/conf/machine/include/tune-ppce5500.inc
 delete mode 100644 meta/conf/machine/include/tune-ppce6500.inc
 delete mode 100644 meta/conf/machine/include/tune-sh3.inc
 delete mode 100644 meta/conf/machine/include/tune-sh4.inc
 delete mode 100644 meta/conf/machine/qemumips.conf
 delete mode 100644 meta/conf/machine/qemumips64.conf
 delete mode 100644 meta/conf/machine/qemuppc.conf
 delete mode 100644 meta/site/mips-common
 delete mode 100644 meta/site/mips-linux
 delete mode 100644 meta/site/mips-linux-uclibc
 delete mode 100644 meta/site/mips64-linux
 delete mode 100644 meta/site/mips64-linux-uclibc
 delete mode 100644 meta/site/mips64el-linux
 delete mode 100644 meta/site/mips64el-linux-uclibc
 delete mode 100644 meta/site/mipsel-linux
 delete mode 100644 meta/site/mipsel-linux-uclibc
 delete mode 100644 meta/site/powerpc-common
 delete mode 100644 meta/site/powerpc-darwin
 delete mode 100644 meta/site/powerpc-linux
 delete mode 100644 meta/site/powerpc32-linux
 delete mode 100644 meta/site/powerpc64-linux

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 22cd61e..d7a0f12 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -31,10 +31,6 @@ OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
 # which do not always match TARGET_ARCH, so all the necessary
 # conversions should happen here.
 def map_target_arch_to_uname_arch(target_arch):
-    if target_arch == "powerpc":
-        return "ppc"
-    if target_arch == "powerpc64":
-        return "ppc64"
     return target_arch
 
 cmake_do_generate_toolchain_file() {
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index b9adea7..046697d 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -72,44 +72,22 @@ def package_qa_get_machine_dict():
                         "aarch64_be" :(183,    0,    0,          False,         64),
                         "arm" :       (40,    97,    0,          True,          32),
                         "armeb":      (40,    97,    0,          False,         32),
-                        "powerpc":    (20,     0,    0,          False,         32),
-                        "powerpc64":  (21,     0,    0,          False,         64),
                         "i386":       ( 3,     0,    0,          True,          32),
                         "i486":       ( 3,     0,    0,          True,          32),
                         "i586":       ( 3,     0,    0,          True,          32),
                         "i686":       ( 3,     0,    0,          True,          32),
                         "x86_64":     (62,     0,    0,          True,          64),
-                        "ia64":       (50,     0,    0,          True,          64),
-                        "alpha":      (36902,  0,    0,          True,          64),
-                        "hppa":       (15,     3,    0,          False,         32),
                         "m68k":       ( 4,     0,    0,          False,         32),
-                        "mips":       ( 8,     0,    0,          False,         32),
-                        "mipsel":     ( 8,     0,    0,          True,          32),
-                        "mips64":     ( 8,     0,    0,          False,         64),
-                        "mips64el":   ( 8,     0,    0,          True,          64),
                         "nios2":      (113,    0,    0,          True,          32),
-                        "s390":       (22,     0,    0,          False,         32),
-                        "sh4":        (42,     0,    0,          True,          32),
-                        "sparc":      ( 2,     0,    0,          False,         32),
-                        "microblaze":  (189,   0,    0,          False,         32),
-                        "microblazeeb":(189,   0,    0,          False,         32),
-                        "microblazeel":(189,   0,    0,          True,          32),
                       },
             "linux-uclibc" : { 
                         "arm" :       (  40,    97,    0,          True,          32),
                         "armeb":      (  40,    97,    0,          False,         32),
-                        "powerpc":    (  20,     0,    0,          False,         32),
                         "i386":       (   3,     0,    0,          True,          32),
                         "i486":       (   3,     0,    0,          True,          32),
                         "i586":       (   3,     0,    0,          True,          32),
                         "i686":       (   3,     0,    0,          True,          32),
                         "x86_64":     (  62,     0,    0,          True,          64),
-                        "mips":       (   8,     0,    0,          False,         32),
-                        "mipsel":     (   8,     0,    0,          True,          32),
-                        "mips64":     (   8,     0,    0,          False,         64),
-                        "mips64el":   (   8,     0,    0,          True,          64),
-                        "avr32":      (6317,     0,    0,          False,         32),
-                        "sh4":        (42,       0,    0,          True,          32),
 
                       },
             "linux-musl" : { 
@@ -117,19 +95,11 @@ def package_qa_get_machine_dict():
                         "aarch64_be" :(183,    0,    0,            False,         64),
                         "arm" :       (  40,    97,    0,          True,          32),
                         "armeb":      (  40,    97,    0,          False,         32),
-                        "powerpc":    (  20,     0,    0,          False,         32),
                         "i386":       (   3,     0,    0,          True,          32),
                         "i486":       (   3,     0,    0,          True,          32),
                         "i586":       (   3,     0,    0,          True,          32),
                         "i686":       (   3,     0,    0,          True,          32),
                         "x86_64":     (  62,     0,    0,          True,          64),
-                        "mips":       (   8,     0,    0,          False,         32),
-                        "mipsel":     (   8,     0,    0,          True,          32),
-                        "mips64":     (   8,     0,    0,          False,         64),
-                        "mips64el":   (   8,     0,    0,          True,          64),
-                        "microblaze":  (189,     0,    0,          False,         32),
-                        "microblazeeb":(189,     0,    0,          False,         32),
-                        "microblazeel":(189,     0,    0,          True,          32),
                       },
             "uclinux-uclibc" : {
                         "bfin":       ( 106,     0,    0,          True,         32),
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 467d567..d523746 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -270,13 +270,6 @@ python package_do_split_gconvs () {
                 "armeb":   " --uint32-align=4 --big-endian ",    \
                 "aarch64": " --uint32-align=4 --little-endian ",    \
                 "aarch64_be": " --uint32-align=4 --big-endian ",    \
-                "sh4":     " --uint32-align=4 --big-endian ",    \
-                "powerpc": " --uint32-align=4 --big-endian ",    \
-                "powerpc64": " --uint32-align=4 --big-endian ",  \
-                "mips":    " --uint32-align=4 --big-endian ",    \
-                "mips64":  " --uint32-align=4 --big-endian ",    \
-                "mipsel":  " --uint32-align=4 --little-endian ", \
-                "mips64el":" --uint32-align=4 --little-endian ", \
                 "i586":    " --uint32-align=4 --little-endian ", \
                 "i686":    " --uint32-align=4 --little-endian ", \
                 "x86_64":  " --uint32-align=4 --little-endian "  }
diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index c696085..327f84f 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -7,10 +7,6 @@ def qemu_target_binary(data):
     target_arch = data.getVar("TARGET_ARCH", True)
     if target_arch in ("i486", "i586", "i686"):
         target_arch = "i386"
-    elif target_arch == "powerpc":
-        target_arch = "ppc"
-    elif target_arch == "powerpc64":
-        target_arch = "ppc64"
 
     return "qemu-" + target_arch
 #
@@ -44,11 +40,3 @@ def qemu_run_binary(data, rootfs_path, binary):
 
 QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH', True), True) or ""}"
 QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
-
-QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
-QEMU_EXTRAOPTIONS_ppce500mc = " -cpu e500mc"
-QEMU_EXTRAOPTIONS_ppce5500 = " -cpu e5500"
-QEMU_EXTRAOPTIONS_ppc64e5500 = " -cpu e5500"
-QEMU_EXTRAOPTIONS_ppce6500 = " -cpu e6500"
-QEMU_EXTRAOPTIONS_ppc64e6500 = " -cpu e6500"
-QEMU_EXTRAOPTIONS_ppc7400 = " -cpu 7400"
diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index b715b6c..f2d68c9 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -30,18 +30,7 @@ def siteinfo_data(d):
         "i586": "endian-little bit-32 ix86-common",
         "i686": "endian-little bit-32 ix86-common",
         "ia64": "endian-little bit-64",
-        "microblaze": "endian-big bit-32 microblaze-common",
-        "microblazeeb": "endian-big bit-32 microblaze-common",
-        "microblazeel": "endian-little bit-32 microblaze-common",
-        "mips": "endian-big bit-32 mips-common",
-        "mips64": "endian-big bit-64 mips-common",
-        "mips64el": "endian-little bit-64 mips-common",
-        "mipsel": "endian-little bit-32 mips-common",
-        "powerpc": "endian-big bit-32 powerpc-common",
         "nios2": "endian-little bit-32 nios2-common",
-        "powerpc64": "endian-big bit-64 powerpc-common",
-        "ppc": "endian-big bit-32 powerpc-common",
-        "ppc64": "endian-big bit-64 powerpc-common",
         "sh3": "endian-little bit-32 sh-common",
         "sh4": "endian-little bit-32 sh-common",
         "sparc": "endian-big bit-32",
@@ -76,21 +65,6 @@ def siteinfo_data(d):
         "armeb-linux-gnueabi": "armeb-linux",
         "armeb-linux-uclibceabi": "armeb-linux-uclibc",
         "armeb-linux-musleabi": "armeb-linux",
-        "mips-linux-musl": "mips-linux",
-        "mipsel-linux-musl": "mipsel-linux",
-        "mips64-linux-musl": "mips-linux",
-        "mips64el-linux-musl": "mipsel-linux",
-        "mips64-linux-gnun32": "mips-linux bit-32",
-        "mips64el-linux-gnun32": "mipsel-linux bit-32",
-        "powerpc-linux": "powerpc32-linux",
-        "powerpc-linux-musl": "powerpc-linux powerpc32-linux",
-        "powerpc-linux-uclibc": "powerpc-linux powerpc32-linux",
-        "powerpc-linux-gnuspe": "powerpc-linux powerpc32-linux",
-        "powerpc-linux-muslspe": "powerpc-linux powerpc32-linux",
-        "powerpc-linux-uclibcspe": "powerpc-linux powerpc32-linux powerpc-linux-uclibc",
-        "powerpc64-linux-gnuspe": "powerpc-linux powerpc64-linux",
-        "powerpc64-linux-muslspe": "powerpc-linux powerpc64-linux",
-        "powerpc64-linux": "powerpc-linux",
         "x86_64-cygwin": "bit-64",
         "x86_64-darwin": "bit-64",
         "x86_64-darwin9": "bit-64",
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1c43d73..84f1054 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -524,13 +524,6 @@ BUILDSDK_LDFLAGS = "-L${STAGING_LIBDIR} \
                     -Wl,-rpath,${base_libdir} -Wl,-O1"
 
 LINKER_HASH_STYLE ??= "gnu"
-# mips does not support GNU hash style therefore we override
-LINKER_HASH_STYLE_mips = "sysv"
-LINKER_HASH_STYLE_mipsel = "sysv"
-LINKER_HASH_STYLE_mips64 = "sysv"
-LINKER_HASH_STYLE_mips64el = "sysv"
-LINKER_HASH_STYLE_mips64n32 = "sysv"
-LINKER_HASH_STYLE_mips64eln32 = "sysv"
 TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_STYLE', True) != 'gnu']}"
 
 export LDFLAGS = "${TARGET_LDFLAGS}"
diff --git a/meta/conf/machine/include/mips/README b/meta/conf/machine/include/mips/README
deleted file mode 100644
index c375f31..0000000
--- a/meta/conf/machine/include/mips/README
+++ /dev/null
@@ -1,36 +0,0 @@
-2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
-  - Initial Version
-
-MIPS currently defines 12 ABIs.  Combinations of:
- *) Big/Little Endian
- *) Hardware/Software Floating Point
- *) o32, n32, n64 ABI
-
-TUNE_ARCH, the GNU canonical arch, is defined as:
-
-mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}
-
-The package arch is defined in such a way to generated a standard naming
-scheme.  The scheme is: <mips variant>[-nf][-n32]
-
-TUNE_PKGARCH is defined as:
-
-${MIPSPKGSFX_VARIANT_tune-${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}
-
-The following is a list of MIPS specific variables:
-
-MIPSPKGSFX_BYTE - This is defined as either blank and "64" for MIPS64 CPUs.
-
-MIPSPKGSFX_ENDIAN - For bigendian hardware this is blank, otherwise it's
-defined as "el".
-
-MIPSPKGSFX_VARIANT_tune-<tune> - In the default tunings it is set to the
-same value as TUNE_ARCH.  In custom, optimized tunings, the value should
-be modified to more precisely describe the tuning.
-
-MIPSPKGSFX_FPU - The value is set to "" or "-nf", where "-nf" indicates 
-that the tune is using a non-floating point ABI.
-
-MIPSPKGSFX_ABI - This is used to specify an alternative ABI when the previous
-values are not enough to distringuish the package.  "-n32" is added when
-building for N32 ABI.
diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
deleted file mode 100644
index 89d17e7..0000000
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ /dev/null
@@ -1,102 +0,0 @@
-# MIPS Architecture definition
-# 12 defined ABIs, all combinations of:
-# *) Big/Little Endian
-# *) Hardware/Software Floating Point
-# *) o32, n32, n64 ABI
-
-DEFAULTTUNE ?= "mips"
-
-# Endianess
-TUNEVALID[bigendian] = "Enable big-endian mode"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', ' -meb', ' -mel', d)}"
-
-# ABI flags
-TUNEVALID[o32] = "MIPS o32 ABI"
-TUNECONFLICTS[o32] = "n32 n64"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'o32', ' -mabi=32', '', d)}"
-
-TUNEVALID[n32] = "MIPS64 n32 ABI"
-TUNECONFLICTS[n32] = "o32 n64"
-ABIEXTENSION .= "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'n32', '' ,d)}"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'n32', ' -mabi=n32', '', d)}"
-
-TUNEVALID[n64] = "MIPS64 n64 ABI"
-TUNECONFLICTS[n64] = "o32 n32"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'n64', ' -mabi=64', '', d)}"
-
-# Floating point
-TUNEVALID[fpu-hard] = "Use hardware FPU"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard', ' -mhard-float', ' -msoft-float', d)}"
-TARGET_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard', '', 'soft', d)}"
-
-# Package naming
-MIPSPKGSFX_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '', 'el', d)}"
-MIPSPKGSFX_BYTE = "${@bb.utils.contains('TUNE_FEATURES', 'n64' , '64', '', d)}"
-MIPSPKGSFX_BYTE .= "${@bb.utils.contains('TUNE_FEATURES', 'n32' , '64', '', d)}"
-MIPSPKGSFX_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard' , '', '-nf', d)}"
-MIPSPKGSFX_ABI = "${@bb.utils.contains('TUNE_FEATURES', 'n32', '-n32', '', d)}"
-
-TUNE_ARCH = "mips${MIPSPKGSFX_BYTE}${MIPSPKGSFX_ENDIAN}"
-TUNE_PKGARCH = "${MIPSPKGSFX_VARIANT_tune-${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}"
-
-# Base tunes
-AVAILTUNES += "mips mips64-n32 mips64 mipsel mips64el-n32 mips64el mips-nf mips64-nf-n32 mips64-nf mipsel-nf mips64el-nf-n32 mips64el-nf"
-TUNE_FEATURES_tune-mips = "o32 bigendian fpu-hard"
-BASE_LIB_tune-mips = "lib"
-MIPSPKGSFX_VARIANT_tune-mips = "${TUNE_ARCH}"
-PACKAGE_EXTRA_ARCHS_tune-mips = "mips"
-
-TUNE_FEATURES_tune-mips64-n32 = "n32 bigendian fpu-hard"
-BASE_LIB_tune-mips64-n32 = "lib32"
-MIPSPKGSFX_VARIANT_tune-mips64-n32 = "${TUNE_ARCH}"
-PACKAGE_EXTRA_ARCHS_tune-mips64-n32 = "mips64-n32"
-
-TUNE_FEATURES_tune-mips64 = "n64 bigendian fpu-hard"
-BASE_LIB_tune-mips64 = "lib64"
-MIPSPKGSFX_VARIANT_tune-mips64 = "${TUNE_ARCH}"
-PACKAGE_EXTRA_ARCHS_tune-mips64 = "mips64"
-
-TUNE_FEATURES_tune-mipsel = "o32 fpu-hard"
-BASE_LIB_tune-mipsel = "lib"
-MIPSPKGSFX_VARIANT_tune-mipsel = "${TUNE_ARCH}"
-PACKAGE_EXTRA_ARCHS_tune-mipsel = "mipsel"
-
-TUNE_FEATURES_tune-mips64el-n32 = "n32 fpu-hard"
-BASE_LIB_tune-mips64el-n32 = "lib32"
-MIPSPKGSFX_VARIANT_tune-mips64el-n32 = "${TUNE_ARCH}"
-PACKAGE_EXTRA_ARCHS_tune-mips64el-n32 = "mips64el-n32"
-
-TUNE_FEATURES_tune-mips64el = "n64 fpu-hard"
-BASE_LIB_tune-mips64el = "lib64"
-MIPSPKGSFX_VARIANT_tune-mips64el = "${TUNE_ARCH}"
-PACKAGE_EXTRA_ARCHS_tune-mips64el = "mips64el"
-
-TUNE_FEATURES_tune-mips-nf = "o32 bigendian"
-BASE_LIB_tune-mips-nf = "lib"
-MIPSPKGSFX_VARIANT_tune-mips-nf = "${TUNE_ARCH}"
-PACKAGE_EXTRA_ARCHS_tune-mips-nf = "mips-nf"
-
-TUNE_FEATURES_tune-mips64-nf-n32 = "n32 bigendian"
-BASE_LIB_tune-mips64-nf-n32 = "lib32"
-MIPSPKGSFX_VARIANT_tune-mips64-nf-n32 = "${TUNE_ARCH}"
-PACKAGE_EXTRA_ARCHS_tune-mips64-nf-n32 = "mips64-nf-n32"
-
-TUNE_FEATURES_tune-mips64-nf = "n64 bigendian"
-BASE_LIB_tune-mips64-nf = "lib64"
-MIPSPKGSFX_VARIANT_tune-mips64-nf = "${TUNE_ARCH}"
-PACKAGE_EXTRA_ARCHS_tune-mips64-nf = "mips64-nf"
-
-TUNE_FEATURES_tune-mipsel-nf = "o32"
-BASE_LIB_tune-mipsel-nf = "lib"
-MIPSPKGSFX_VARIANT_tune-mipsel-nf = "${TUNE_ARCH}"
-PACKAGE_EXTRA_ARCHS_tune-mipsel-nf = "mipsel-nf"
-
-TUNE_FEATURES_tune-mips64el-nf-n32 = "n32"
-BASE_LIB_tune-mips64el-nf-n32 = "lib32"
-MIPSPKGSFX_VARIANT_tune-mips64el-nf-n32 = "${TUNE_ARCH}"
-PACKAGE_EXTRA_ARCHS_tune-mips64el-nf-n32 = "mips64el-nf-n32"
-
-TUNE_FEATURES_tune-mips64el-nf = "n64"
-BASE_LIB_tune-mips64el-nf = "lib64"
-MIPSPKGSFX_VARIANT_tune-mips64el-nf = "${TUNE_ARCH}"
-PACKAGE_EXTRA_ARCHS_tune-mips64el-nf = "mips64el-nf"
diff --git a/meta/conf/machine/include/powerpc/README b/meta/conf/machine/include/powerpc/README
deleted file mode 100644
index e87fb50..0000000
--- a/meta/conf/machine/include/powerpc/README
+++ /dev/null
@@ -1,17 +0,0 @@
-2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
-  - Initial revision
-
-There are 4 primary PowerPC ABIs.
-# *) Hard/Soft Floating Point
-# *) 32-bit/64-bit
-
-TUNE_ARCH is defined as either "powerpc" or "powerpc64" based on the m32 
-or m64 feature.
-
-May of the PowerPC package archictures are based on legacy Linux names.
-However, a general naming scheme should be similar to: ppc[64][<family>][-nf].
-(Note: the default package architectures are "powerpc" and "powerpc64".)
-
-TUNE_PKGARCH is defined as TUNE_PKGARCH_tune-${DEFAULTTUNE}.  All 
-PowerPC tunings are required to define TUNE_PKGARCH_tune-<tune>.
-
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/conf/machine/include/powerpc/arch-powerpc.inc
deleted file mode 100644
index 9cf6b88..0000000
--- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
+++ /dev/null
@@ -1,34 +0,0 @@
-# Power Architecture definition
-# Four defined ABIs, all combinations of:
-# *) Hard/Soft Floating Point
-# *) 32-bit/64-bit
-
-DEFAULTTUNE ?= "powerpc"
-
-TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
-ABIEXTENSION ?= ""
-
-TUNEVALID[m32] = "Power ELF32 standard ABI"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'm32', ' -m32', '', d)}"
-TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'm32', 'powerpc', '', d)}"
-
-TUNEVALID[fpu-hard] = "Use hardware FPU."
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard', ' -mhard-float', '', d)}"
-
-TUNEVALID[fpu-soft] = "Use software FPU."
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-soft', ' -msoft-float', '', d)}"
-TARGET_FPU .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-soft', 'soft', '', d)}"
-
-TUNEVALID[altivec] = "Altivec"
-
-# Basic tune definitions
-AVAILTUNES += "powerpc powerpc-nf" 
-TUNE_FEATURES_tune-powerpc-nf = "m32 fpu-soft"
-BASE_LIB_tune-powerpc-nf = "lib"
-TUNE_PKGARCH_tune-powerpc-nf = "powerpc-nf"
-PACKAGE_EXTRA_ARCHS_tune-powerpc-nf = "powerpc-nf"
-
-TUNE_FEATURES_tune-powerpc = "m32 fpu-hard"
-BASE_LIB_tune-powerpc = "lib"
-TUNE_PKGARCH_tune-powerpc = "powerpc"
-PACKAGE_EXTRA_ARCHS_tune-powerpc = "powerpc"
diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
deleted file mode 100644
index 49419b6..0000000
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DEFAULTTUNE ?= "powerpc64"
-
-require conf/machine/include/powerpc/arch-powerpc.inc
-
-TUNEVALID[m64] = "Power ELF64 standard ABI"
-TUNECONFLICTS[m64] = "m32 nf"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'm64', ' -m64', '', d)}"
-TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', [ 'm64' ], 'powerpc64', '', d)}"
-
-AVAILTUNES += "powerpc64"
-TUNE_FEATURES_tune-powerpc64 = "m64 fpu-hard"
-BASE_LIB_tune-powerpc64 = "lib64"
-TUNE_PKGARCH_tune-powerpc64 = "powerpc64"
-PACKAGE_EXTRA_ARCHS_tune-powerpc64 = "powerpc64"
diff --git a/meta/conf/machine/include/sh/README b/meta/conf/machine/include/sh/README
deleted file mode 100644
index b351acd..0000000
--- a/meta/conf/machine/include/sh/README
+++ /dev/null
@@ -1,11 +0,0 @@
-2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
- - Initial Revision
-
-Both big endian and little endian are defined for SH.
-
-Experimental -- SH tunings have not been validated.
-
-The TUNE_ARCH is defined as ${TUNE_ARCH_tune-${DEFAULTTUNE}}.
-
-The TUNE_PKGARCH is defind as ${TUNE_PKGARCH_tune-${DEFAULTTUNE}}.
-
diff --git a/meta/conf/machine/include/sh/arch-sh.inc b/meta/conf/machine/include/sh/arch-sh.inc
deleted file mode 100644
index bdfbf52..0000000
--- a/meta/conf/machine/include/sh/arch-sh.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-# SH Architecture definition
-
-DEFAULTTUNE ?= "sh"
-
-TUNE_ARCH = "${TUNE_ARCH_tune-${DEFAULTTUNE}}"
-TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
-
-TUNEVALID[bigendian] = "Enabled big-endian mode."
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', ' -mb', ' -ml', d)}"
diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
deleted file mode 100644
index ce0445f..0000000
--- a/meta/conf/machine/include/tune-mips32.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-DEFAULTTUNE ?= "mips32"
-
-require conf/machine/include/mips/arch-mips.inc
-
-TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
-TUNECONFLICTS[mips32] = "n64 n32"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mips32', ' -march=mips32', '', d)}"
-
-AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
-
-TUNE_FEATURES_tune-mips32 = "${TUNE_FEATURES_tune-mips} mips32"
-MIPSPKGSFX_VARIANT_tune-mips32 = "mips32"
-PACKAGE_EXTRA_ARCHS_tune-mips32 = "mips mips32"
-
-TUNE_FEATURES_tune-mips32el = "${TUNE_FEATURES_tune-mipsel} mips32"
-MIPSPKGSFX_VARIANT_tune-mips32el = "mips32el"
-PACKAGE_EXTRA_ARCHS_tune-mips32el = "mipsel mips32el"
-
-TUNE_FEATURES_tune-mips32-nf = "${TUNE_FEATURES_tune-mips-nf} mips32"
-MIPSPKGSFX_VARIANT_tune-mips32-nf = "mips32"
-PACKAGE_EXTRA_ARCHS_tune-mips32-nf = "mips-nf mips32-nf"
-
-TUNE_FEATURES_tune-mips32el-nf = "${TUNE_FEATURES_tune-mipsel-nf} mips32"
-MIPSPKGSFX_VARIANT_tune-mips32el-nf = "mips32el"
-PACKAGE_EXTRA_ARCHS_tune-mips32el-nf = "mipsel-nf mips32el-nf"
diff --git a/meta/conf/machine/include/tune-mips32r2.inc b/meta/conf/machine/include/tune-mips32r2.inc
deleted file mode 100644
index 0e95ec8..0000000
--- a/meta/conf/machine/include/tune-mips32r2.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DEFAULTTUNE ?= "mips32r2"
-
-require conf/machine/include/tune-mips32.inc
-
-TUNEVALID[mips32r2] = "Enable mips32r2 specific processor optimizations"
-TUNECONFLICTS[mips32r2] = "n64 n32"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mips32r2', ' -march=mips32r2', '', d)}"
-
-AVAILTUNES += "mips32r2 mips32r2el"
-
-TUNE_FEATURES_tune-mips32r2 = "${TUNE_FEATURES_tune-mips} mips32r2"
-MIPSPKGSFX_VARIANT_tune-mips32r2 = "mips32r2"
-PACKAGE_EXTRA_ARCHS_tune-mips32r2 = "mips mips32 mips32r2"
-
-TUNE_FEATURES_tune-mips32r2el = "${TUNE_FEATURES_tune-mipsel} mips32r2"
-MIPSPKGSFX_VARIANT_tune-mips32r2el = "mips32r2el"
-PACKAGE_EXTRA_ARCHS_tune-mips32r2el = "mipsel mips32el mips32r2el"
diff --git a/meta/conf/machine/include/tune-mips64.inc b/meta/conf/machine/include/tune-mips64.inc
deleted file mode 100644
index 9be0e0f..0000000
--- a/meta/conf/machine/include/tune-mips64.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-DEFAULTTUNE ?= "mips64"
-
-require conf/machine/include/tune-mips32r2.inc
diff --git a/meta/conf/machine/include/tune-octeon.inc b/meta/conf/machine/include/tune-octeon.inc
deleted file mode 100644
index b5deb8f..0000000
--- a/meta/conf/machine/include/tune-octeon.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-DEFAULTTUNE ?="octeon2"
-
-require conf/machine/include/tune-mips64.inc
-
-AVAILTUNES += "octeon2 octeon2_64 octeon3 octeon3_64"
-
-TUNEVALID[octeon2] = "Enable optimization related to octeon2 support"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'octeon2', ' -march=octeon2 ', '',d)}"
-
-TUNE_FEATURES_tune-octeon2 = "${TUNE_FEATURES_tune-mips64-n32} octeon2"
-BASE_LIB_tune-octeon2 = "lib32"
-MIPSPKGSFX_VARIANT_tune-octeon2 = "octeon2"
-PACKAGE_EXTRA_ARCHS_tune-octeon2 = "mips64-n32 octeon2-n32"
-
-TUNE_FEATURES_tune-octeon2_64 = "${TUNE_FEATURES_tune-mips64} octeon2"
-BASE_LIB_tune-octeon2_64 = "lib64"
-MIPSPKGSFX_VARIANT_tune-octeon2_64 = "octeon2_64"
-PACKAGE_EXTRA_ARCHS_tune-octeon2_64 = "mips64 octeon2_64"
-
-
-TUNEVALID[octeon3] = "Enable optimization related to octeon3 support"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'octeon3', ' -march=octeon3 ', '',d)}"
-
-TUNE_FEATURES_tune-octeon3 = "${TUNE_FEATURES_tune-mips64-n32} octeon3"
-BASE_LIB_tune-octeon3 = "lib32"
-MIPSPKGSFX_VARIANT_tune-octeon3 = "octeon3"
-PACKAGE_EXTRA_ARCHS_tune-octeon3 = "mips64-n32 octeon3-n32"
-
-TUNE_FEATURES_tune-octeon3_64 = "${TUNE_FEATURES_tune-mips64} octeon3"
-BASE_LIB_tune-octeon3_64 = "lib64"
-MIPSPKGSFX_VARIANT_tune-octeon3_64 = "octeon3_64"
-PACKAGE_EXTRA_ARCHS_tune-octeon3_64 = "mips64 octeon3_64"
diff --git a/meta/conf/machine/include/tune-power5.inc b/meta/conf/machine/include/tune-power5.inc
deleted file mode 100644
index a346c30..0000000
--- a/meta/conf/machine/include/tune-power5.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-DEFAULTTUNE ?= "ppc64p5"
-
-require conf/machine/include/powerpc/arch-powerpc64.inc
-
-TUNEVALID[power5] = "Enable IBM Power5 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'power5', ' -mcpu=power5', '', d)}"
-
-AVAILTUNES += "ppcp5 ppc64p5"
-TUNE_FEATURES_tune-ppcp5 = "m32 fpu-hard power5 altivec"
-BASE_LIB_tune-ppcp5 = "lib"
-TUNE_PKGARCH_tune-ppcp5 = "ppcp5"
-PACKAGE_EXTRA_ARCHS_tune-ppcp5 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppcp5"
-
-TUNE_FEATURES_tune-ppc64p5 = "m64 fpu-hard power5 altivec"
-BASE_LIB_tune-ppc64p5 = "lib64"
-TUNE_PKGARCH_tune-ppc64p5 = "ppc64p5"
-PACKAGE_EXTRA_ARCHS_tune-ppc64p5 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p5"
-
-# glibc configure options to get power5 specific library
-GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power5', '--with-cpu=power5', '', d)}"
-GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power5', '--with-cpu=power5', '', d)}"
diff --git a/meta/conf/machine/include/tune-power6.inc b/meta/conf/machine/include/tune-power6.inc
deleted file mode 100644
index ee200f9..0000000
--- a/meta/conf/machine/include/tune-power6.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-DEFAULTTUNE ?= "ppcpr6"
-
-require conf/machine/include/powerpc/arch-powerpc64.inc
-
-TUNEVALID[power6] = "Enable IBM Power6 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'power6', ' -mcpu=power6', '', d)}"
-
-AVAILTUNES += "ppcp6 ppc64p6"
-TUNE_FEATURES_tune-ppcp6 = "m32 fpu-hard power6 altivec"
-BASE_LIB_tune-ppcp6 = "lib"
-TUNE_PKGARCH_tune-ppcp6 = "ppcp6"
-PACKAGE_EXTRA_ARCHS_tune-ppcp6 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppcp6"
-
-TUNE_FEATURES_tune-ppc64p6 = "m64 fpu-hard power6 altivec"
-BASE_LIB_tune-ppc64p6 = "lib64"
-TUNE_PKGARCH_tune-ppc64p6 = "ppc64p6"
-PACKAGE_EXTRA_ARCHS_tune-ppc64p6 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p6"
-
-# glibc configure options to get power6 specific library
-GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power6', '--with-cpu=power6', '', d)}"
-GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power6', '--with-cpu=power6', '', d)}"
diff --git a/meta/conf/machine/include/tune-power7.inc b/meta/conf/machine/include/tune-power7.inc
deleted file mode 100644
index 3a27719..0000000
--- a/meta/conf/machine/include/tune-power7.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-DEFAULTTUNE ?= "ppcpr7"
-
-require conf/machine/include/powerpc/arch-powerpc64.inc
-
-TUNEVALID[power7] = "Enable IBM Power7 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'power7', ' -mcpu=power7', '', d)}"
-
-AVAILTUNES += "ppcp7 ppc64p7"
-TUNE_FEATURES_tune-ppcp7 = "m32 fpu-hard power7 altivec"
-BASE_LIB_tune-ppcp7 = "lib"
-TUNE_PKGARCH_tune-ppcp7 = "ppcp7"
-PACKAGE_EXTRA_ARCHS_tune-ppcp7 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppcp7"
-
-TUNE_FEATURES_tune-ppc64p7 = "m64 fpu-hard power7 altivec"
-BASE_LIB_tune-ppc64p7 = "lib64"
-TUNE_PKGARCH_tune-ppc64p7 = "ppc64p7"
-PACKAGE_EXTRA_ARCHS_tune-ppc64p7 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p7"
-
-# glibc configure options to get power7 specific library
-GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power7', '--with-cpu=power7', '', d)}"
-GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power7', '--with-cpu=power7', '', d)}"
diff --git a/meta/conf/machine/include/tune-ppc476.inc b/meta/conf/machine/include/tune-ppc476.inc
deleted file mode 100644
index d0011ff..0000000
--- a/meta/conf/machine/include/tune-ppc476.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DEFAULTTUNE ?= "ppc476"
-
-require conf/machine/include/powerpc/arch-powerpc.inc
-
-TUNEVALID[ppc476] = "Enable ppc476 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppc476', ' -mcpu=476', '', d)}"
-
-AVAILTUNES += "ppc476"
-TUNE_FEATURES_tune-ppc476 = "m32 fpu-hard ppc476"
-TUNE_PKGARCH_tune-ppc476 = "ppc476"
-PACKAGE_EXTRA_ARCHS_tune-ppc476 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc476"
-
-# glibc configure options to get 476 specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppc476', '-with-cpu=476', '', d)}"
diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/tune-ppc603e.inc
deleted file mode 100644
index 13f60dd..0000000
--- a/meta/conf/machine/include/tune-ppc603e.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DEFAULTTUNE ?= "ppc603e"
-
-require conf/machine/include/powerpc/arch-powerpc.inc
-
-TUNEVALID[ppc603e] = "Enable ppc603e specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', ' -mcpu=603e', '', d)}"
-
-AVAILTUNES += "ppc603e"
-TUNE_FEATURES_tune-ppc603e = "m32 fpu-hard ppc603e"
-TUNE_PKGARCH_tune-ppc603e = "ppc603e"
-PACKAGE_EXTRA_ARCHS_tune-ppc603e = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc603e"
-
-# glibc configure options to get 603e specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', '-with-cpu=603e', '', d)}"
diff --git a/meta/conf/machine/include/tune-ppc7400.inc b/meta/conf/machine/include/tune-ppc7400.inc
deleted file mode 100644
index 425e8bd..0000000
--- a/meta/conf/machine/include/tune-ppc7400.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DEFAULTTUNE ?= "ppc7400"
-
-require conf/machine/include/powerpc/arch-powerpc.inc
-
-TUNEVALID[ppc7400] = "Enable ppc7400 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppc7400', ' -mcpu=7400 -mno-spe', '', d)}"
-
-AVAILTUNES += "ppc7400"
-TUNE_FEATURES_tune-ppc7400 = "m32 fpu-hard ppc7400 altivec"
-TUNE_PKGARCH_tune-ppc7400 = "ppc7400"
-PACKAGE_EXTRA_ARCHS_tune-ppc7400 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc7400"
-
-# glibc configure options to get 7400 specific library (for sqrt)
-#GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppc7400', '--with-cpu=power4', '', d)}"
diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/tune-ppce300c2.inc
deleted file mode 100644
index af21f60..0000000
--- a/meta/conf/machine/include/tune-ppce300c2.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-DEFAULTTUNE ?= "ppce300c2"
-
-require conf/machine/include/powerpc/arch-powerpc.inc
-
-TUNEVALID[ppce300c2] = "Enable ppce300c2 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce300c2', ' -mcpu=e300c2', '', d)}"
-
-AVAILTUNES += "ppce300c2"
-TUNE_FEATURES_tune-ppce300c2 = "m32 fpu-soft ppce300c2"
-TUNE_PKGARCH_tune-ppce300c2 = "ppce300c2"
-PACKAGE_EXTRA_ARCHS_tune-ppce300c2 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppce300c2"
diff --git a/meta/conf/machine/include/tune-ppce300c3.inc b/meta/conf/machine/include/tune-ppce300c3.inc
deleted file mode 100644
index a3d836c..0000000
--- a/meta/conf/machine/include/tune-ppce300c3.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-DEFAULTTUNE ?= "ppce300c3"
-
-require conf/machine/include/powerpc/arch-powerpc.inc
-
-AVAILTUNES += "ppce300c3 ppce300c3-nf"
-
-# hard-float
-TUNEVALID[ppce300c3] = "Enable ppce300c3 specific processor optimizations"
-TUNE_FEATURES_tune-ppce300c3 = "${TUNE_FEATURES_tune-powerpc} ppce300c3"
-TUNE_PKGARCH_tune-ppce300c3 = "ppce300c3"
-PACKAGE_EXTRA_ARCHS_tune-ppce300c3 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce300c3"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce300c3', ' -mcpu=e300c3', '', d)}"
-
-# glibc config options to make use of e300c3 (603e) specific sqrt/sqrtf routines
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppce300c3', '--with-cpu=e300c3', '', d)}"
-
-# soft-float
-TUNEVALID[ppce300c3-nf] = "Enable ppce300c3 specific processor optimizations (no fpu)"
-TUNE_FEATURES_tune-ppce300c3-nf = "${TUNE_FEATURES_tune-powerpc-nf} ppce300c3-nf"
-TUNE_PKGARCH_tune-ppce300c3-nf = "ppce300c3-nf"
-PACKAGE_EXTRA_ARCHS_tune-ppce300c3-nf = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppce300c3-nf"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce300c3-nf', ' -mcpu=e300c3', '', d)}"
-
diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/tune-ppce500.inc
deleted file mode 100644
index 96073d2..0000000
--- a/meta/conf/machine/include/tune-ppce500.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-DEFAULTTUNE ?= "ppce500"
-
-require conf/machine/include/powerpc/arch-powerpc.inc
-
-TUNEVALID[ppce500] = "Enable ppce500 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce500', ' -mcpu=8540', '', d)}"
-
-TUNEVALID[spe] = "Enable SPE ABI extensions"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', [ 'ppce500', 'spe' ], ' -mabi=spe -mspe -mfloat-gprs=single', '', d)}"
-TARGET_FPU .= "${@bb.utils.contains('TUNE_FEATURES', [ 'ppce500' , 'spe' ], 'ppc-efs', '', d)}"
-
-# spe is defined potentially in two places, so we want to be sure it will
-# only write spe once to the ABIEXTENSIONS field.
-SPEABIEXTENSION = "${@bb.utils.contains('TUNE_FEATURES', 'spe', 'spe', '', d)}"
-ABIEXTENSION .= "${SPEABIEXTENSION}"
-
-AVAILTUNES += "ppce500"
-TUNE_FEATURES_tune-ppce500 = "m32 spe ppce500"
-TUNE_PKGARCH_tune-ppce500 = "ppce500"
-PACKAGE_EXTRA_ARCHS_tune-ppce500 = "ppce500"
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/tune-ppce500mc.inc
deleted file mode 100644
index a1ca9be..0000000
--- a/meta/conf/machine/include/tune-ppce500mc.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DEFAULTTUNE ?= "ppce500mc"
-
-require conf/machine/include/powerpc/arch-powerpc.inc
-
-TUNEVALID[ppce500mc] = "Enable ppce500mc specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce500mc', ' -mcpu=e500mc', '', d)}"
-
-AVAILTUNES += "ppce500mc"
-TUNE_FEATURES_tune-ppce500mc = "m32 fpu-hard ppce500mc"
-TUNE_PKGARCH_tune-ppce500mc = "ppce500mc"
-PACKAGE_EXTRA_ARCHS_tune-ppce500mc = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce500mc"
-
-# glibc configure options to get e500mc specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppce500mc', '-with-cpu=e500mc', '', d)}"
diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/tune-ppce500v2.inc
deleted file mode 100644
index 20a5f25..0000000
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-DEFAULTTUNE ?= "ppce500v2"
-
-require conf/machine/include/powerpc/arch-powerpc.inc
-
-TUNEVALID[ppce500v2] = "Enable ppce500v2 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce500v2', ' -mcpu=8548', '', d)}"
-
-TUNEVALID[spe] = "Enable SPE ABI extensions"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', [ 'ppce500v2', 'spe' ], ' -mabi=spe -mspe -mfloat-gprs=double', '', d)}"
-TARGET_FPU .= "${@bb.utils.contains('TUNE_FEATURES', [ 'ppce500v2' , 'spe' ], 'ppc-efd', '', d)}"
-
-# spe is defined potentially in two places, so we want to be sure it will
-# only write spe once to the ABIEXTENSIONS field.
-SPEABIEXTENSION = "${@bb.utils.contains('TUNE_FEATURES', 'spe', 'spe', '', d)}"
-ABIEXTENSION .= "${SPEABIEXTENSION}"
-
-AVAILTUNES += "ppce500v2"
-TUNE_FEATURES_tune-ppce500v2 = "m32 spe ppce500v2"
-TUNE_PKGARCH_tune-ppce500v2 = "ppce500v2"
-PACKAGE_EXTRA_ARCHS_tune-ppce500v2 = "ppce500v2"
diff --git a/meta/conf/machine/include/tune-ppce5500.inc b/meta/conf/machine/include/tune-ppce5500.inc
deleted file mode 100644
index ace2614..0000000
--- a/meta/conf/machine/include/tune-ppce5500.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-DEFAULTTUNE ?= "ppce5500"
-
-require conf/machine/include/powerpc/arch-powerpc64.inc
-
-TUNEVALID[e5500] = "Enable Freescale e5500 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'e5500', ' -mcpu=e5500', '', d)}"
-
-AVAILTUNES += "ppce5500 ppc64e5500"
-TUNE_FEATURES_tune-ppce5500 = "m32 fpu-hard e5500"
-BASE_LIB_tune-ppce5500 = "lib"
-TUNE_PKGARCH_tune-ppce5500 = "ppce5500"
-PACKAGE_EXTRA_ARCHS_tune-ppce5500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce5500"
-
-TUNE_FEATURES_tune-ppc64e5500 = "m64 fpu-hard e5500"
-BASE_LIB_tune-ppc64e5500 = "lib64"
-TUNE_PKGARCH_tune-ppc64e5500 = "ppc64e5500"
-PACKAGE_EXTRA_ARCHS_tune-ppc64e5500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64e5500"
-
-# glibc configure options to get e5500 specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'e5500', '--with-cpu=e5500', '', d)}"
diff --git a/meta/conf/machine/include/tune-ppce6500.inc b/meta/conf/machine/include/tune-ppce6500.inc
deleted file mode 100644
index da1e864..0000000
--- a/meta/conf/machine/include/tune-ppce6500.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-DEFAULTTUNE ?= "ppce6500"
-
-require conf/machine/include/powerpc/arch-powerpc64.inc
-
-TUNEVALID[e6500] = "Enable Freescale e6500 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'e6500', ' -mcpu=e6500', '', d)}"
-
-AVAILTUNES += "ppce6500 ppc64e6500"
-TUNE_FEATURES_tune-ppce6500 = "m32 fpu-hard e6500 altivec"
-BASE_LIB_tune-ppce6500 = "lib"
-TUNE_PKGARCH_tune-ppce6500 = "ppce6500"
-PACKAGE_EXTRA_ARCHS_tune-ppce6500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce6500"
-
-TUNE_FEATURES_tune-ppc64e6500 = "m64 fpu-hard e6500 altivec"
-BASE_LIB_tune-ppc64e6500 = "lib64"
-TUNE_PKGARCH_tune-ppc64e6500 = "ppc64e6500"
-PACKAGE_EXTRA_ARCHS_tune-ppc64e6500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64e6500"
-
-# glibc configure options to get e6500 specific library
-GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'e6500', '--with-cpu=e6500', '', d)}"
-GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'e6500', '--with-cpu=e6500', '', d)}"
diff --git a/meta/conf/machine/include/tune-sh3.inc b/meta/conf/machine/include/tune-sh3.inc
deleted file mode 100644
index 80df9a0..0000000
--- a/meta/conf/machine/include/tune-sh3.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DEFAULTTUNE ?= "sh3"
-
-require conf/machine/include/sh/arch-sh.inc
-
-TUNEVALID[sh3] = "Enable SH3 optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'sh3', ' -m3', '', d)}"
-
-AVAILTUNES += "sh3 sh3eb"
-TUNE_FEATURES_tune-sh3 = "sh3"
-TUNE_ARCH_tune-sh3 = "sh3"
-TUNE_PKGARCH_tune-sh3 = "sh3"
-PACKAGE_EXTRA_ARCHS_tune-sh3 = "sh sh3"
-
-TUNE_FEATURES_tune-sh3eb = "sh3 bigendian"
-TUNE_ARCH_tune-sh3eb = "sh3eb"
-TUNE_PKGARCH_tune-sh3eb = "sh3eb"
-PACKAGE_EXTRA_ARCHS_tune-sh3eb = "sheb sh3eb"
diff --git a/meta/conf/machine/include/tune-sh4.inc b/meta/conf/machine/include/tune-sh4.inc
deleted file mode 100644
index 4160c30..0000000
--- a/meta/conf/machine/include/tune-sh4.inc
+++ /dev/null
@@ -1,34 +0,0 @@
-DEFAULTTUNE ?= "sh4"
-
-# Pull in sh4 for compatibility...
-require conf/machine/include/sh/arch-sh.inc
-
-TUNEVALID[sh4] = "Enable SH4 optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'sh4', ' -m4', '', d)}"
-
-# NOTE: If you want to optimize to sh4a, conf/machine/include/tune-sh4a.inc.
-# But it is not compatible for sh4.
-# The binary optimized by m4a doesn't operate on sh4. It works on sh4a only.
-TUNEVALID[sh4a] = "Enable SH4a optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'sh4a', ' -m4a', '', d)}"
-
-AVAILTUNES += "sh4 sh4eb sh4a sh4aeb"
-TUNE_FEATURES_tune-sh4 = "sh4"
-TUNE_ARCH_tune-sh4 = "sh4"
-TUNE_PKGARCH_tune-sh4 = "sh4"
-PACKAGE_EXTRA_ARCHS_tune-sh4 = "sh sh4"
-
-TUNE_FEATURES_tune-sh4eb = "sh4 bigendian"
-TUNE_ARCH_tune-sh4eb = "sh4eb"
-TUNE_PKGARCH_tune-sh4eb = "sh4eb"
-PACKAGE_EXTRA_ARCHS_tune-sh4eb = "sheb sh4eb"
-
-TUNE_FEATURES_tune-sh4a = "sh4a"
-TUNE_ARCH_tune-sh4a = "sh4"
-TUNE_PKGARCH_tune-sh4a = "sh4a"
-PACKAGE_EXTRA_ARCHS_tune-sh4a = "sh sh4 sh4a"
-
-TUNE_FEATURES_tune-sh4aeb = "sh4a bigendian"
-TUNE_ARCH_tune-sh4aeb = "sh4eb"
-TUNE_PKGARCH_tune-sh4aeb = "sh4aeb"
-PACKAGE_EXTRA_ARCHS_tune-sh4aeb = "sheb sh4eb sh4aeb"
diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
deleted file mode 100644
index fbf8137..0000000
--- a/meta/conf/machine/qemumips.conf
+++ /dev/null
@@ -1,13 +0,0 @@
-#@TYPE: Machine
-#@NAME: mti_malta32_be MIPS
-#@DESCRIPTION: mti_malta32_be
-
-require conf/machine/include/qemu.inc
-require conf/machine/include/tune-mips32r2.inc
-
-KERNEL_IMAGETYPE = "vmlinux"
-KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
-
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
-
-MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
deleted file mode 100644
index 8c3f1fe..0000000
--- a/meta/conf/machine/qemumips64.conf
+++ /dev/null
@@ -1,13 +0,0 @@
-#@TYPE: Machine
-#@NAME: mti-malta64-be MIPS64
-#@DESCRIPTION: mti-malta64-be
-
-require conf/machine/include/qemu.inc
-require conf/machine/include/tune-mips64.inc
-
-KERNEL_IMAGETYPE = "vmlinux"
-KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
-
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
-
-MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
deleted file mode 100644
index bf0038d..0000000
--- a/meta/conf/machine/qemuppc.conf
+++ /dev/null
@@ -1,13 +0,0 @@
-#@TYPE: Machine
-#@NAME: qemu PPC Emulator setup
-#@DESCRIPTION: Machine configuration for running an PPC system under qemu emulation
-
-require conf/machine/include/qemu.inc
-require conf/machine/include/tune-ppc7400.inc
-
-TARGET_CC_KERNEL_ARCH = "-mno-spe"
-
-KERNEL_IMAGETYPE = "vmlinux"
-
-SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
-
diff --git a/meta/site/mips-common b/meta/site/mips-common
deleted file mode 100644
index 89d72cb..0000000
--- a/meta/site/mips-common
+++ /dev/null
@@ -1,56 +0,0 @@
-# general
-ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
-
-# cvs
-cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
-
-# screen
-screen_cv_sys_bcopy_overlap=${screen_cv_sys_bcopy_overlap=no}
-screen_cv_sys_memcpy_overlap=${screen_cv_sys_memcpy_overlap=no}
-screen_cv_sys_memmove_overlap=${screen_cv_sys_memmove_overlap=no}
-screen_cv_sys_fifo_broken_impl=${screen_cv_sys_fifo_broken_impl=yes}
-screen_cv_sys_fifo_usable=${screen_cv_sys_fifo_usable=yes}
-screen_cv_sys_select_broken_retval=${screen_cv_sys_select_broken_retval=no}
-screen_cv_sys_sockets_nofs=${screen_cv_sys_sockets_nofs=no}
-screen_cv_sys_sockets_usable=${screen_cv_sys_sockets_usable=yes}
-screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}
-
-# ORBit2
-ac_cv_alignof_CORBA_octet=1
-ac_cv_alignof_CORBA_boolean=1
-ac_cv_alignof_CORBA_char=1
-ac_cv_alignof_CORBA_wchar=2
-ac_cv_alignof_CORBA_short=2
-ac_cv_alignof_CORBA_long=4
-ac_cv_alignof_CORBA_long_long=8
-ac_cv_alignof_CORBA_float=4
-ac_cv_alignof_CORBA_double=8
-ac_cv_alignof_CORBA_long_double=8
-ac_cv_alignof_CORBA_pointer=4
-ac_cv_alignof_CORBA_struct=1
-
-# apache
-ac_cv_func_pthread_key_delete=${ac_cv_func_pthread_key_delete=yes}
-apr_cv_process_shared_works=${apr_cv_process_shared_works=no}
-ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
-apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
-
-# glib
-glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
-ac_cv_alignof_guint32=4
-ac_cv_alignof_guint64=8
-ac_cv_alignof_unsigned_long=4
-
-
-# slrn
-slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
-
-# at-spi2-core
-ac_cv_alignof_char=1
-ac_cv_alignof_dbind_pointer=4
-ac_cv_alignof_dbind_struct=1
-ac_cv_alignof_dbus_bool_t=4
-ac_cv_alignof_dbus_int16_t=2
-ac_cv_alignof_dbus_int32_t=4
-ac_cv_alignof_dbus_int64_t=8
-ac_cv_alignof_double=8
diff --git a/meta/site/mips-linux b/meta/site/mips-linux
deleted file mode 100644
index 72a54f9..0000000
--- a/meta/site/mips-linux
+++ /dev/null
@@ -1,79 +0,0 @@
-# general
-ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-
-# bash
-ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-
-# openssh
-ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
-ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
-ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
-ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
-ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
-
-# fget
-compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
-
-# glib
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_uscore=${glib_cv_uscore=no}
-
-# glib-2.0
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-
-# libpcap
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-
-# startup-notification
-lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ncftp
-wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
-wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
-
-# db
-db_cv_align_t=${db_cv_align_t='unsigned long long'}
-db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-
-# rrdtool
-rd_cv_ieee_works=${rd_cv_ieee_works=yes}
-# ac_cv_path_PERL=${ac_cv_path_PERL=no}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-# samba
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-
-# vim
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-
-# intercom
-ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
-
-# lmbench
-ac_cv_uint=${ac_cv_unit=yes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-
-# evolution-data-server
-ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
-
diff --git a/meta/site/mips-linux-uclibc b/meta/site/mips-linux-uclibc
deleted file mode 100644
index b23363e..0000000
--- a/meta/site/mips-linux-uclibc
+++ /dev/null
@@ -1,80 +0,0 @@
-# general
-ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-
-# bash
-ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-
-# openssh
-ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
-ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
-ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
-ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
-ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
-
-# fget
-compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
-
-# glib
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_uscore=${glib_cv_uscore=no}
-
-# glib-2.0
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-
-# libpcap
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-
-# startup-notification
-lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ncftp
-wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
-wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
-wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
-
-# db
-db_cv_align_t=${db_cv_align_t='unsigned long long'}
-db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-
-# rrdtool
-rd_cv_ieee_works=${rd_cv_ieee_works=yes}
-# ac_cv_path_PERL=${ac_cv_path_PERL=no}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-# samba
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-
-# vim
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-
-# intercom
-ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
-
-# lmbench
-ac_cv_uint=${ac_cv_unit=yes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-
-# evolution-data-server
-ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
-
diff --git a/meta/site/mips64-linux b/meta/site/mips64-linux
deleted file mode 100644
index ed0fbbe..0000000
--- a/meta/site/mips64-linux
+++ /dev/null
@@ -1,83 +0,0 @@
-# general
-ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-
-# bash
-ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-
-# openssh
-ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
-ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
-ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
-ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
-ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
-
-# fget
-compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
-
-# glib
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_uscore=${glib_cv_uscore=no}
-
-# glib-2.0
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-ac_cv_alignof_guint32=4
-ac_cv_alignof_guint64=8
-ac_cv_alignof_unsigned_long=8
-ac_cv_sizeof_ssize_t=8
-
-# libpcap
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-
-# startup-notification
-lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ncftp
-wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
-wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
-
-# db
-db_cv_align_t=${db_cv_align_t='unsigned long long'}
-db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-
-# rrdtool
-rd_cv_ieee_works=${rd_cv_ieee_works=yes}
-# ac_cv_path_PERL=${ac_cv_path_PERL=no}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-# samba
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-
-# vim
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-
-# intercom
-ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
-
-# lmbench
-ac_cv_uint=${ac_cv_unit=yes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-
-# eds-dbus
-ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
-
diff --git a/meta/site/mips64-linux-uclibc b/meta/site/mips64-linux-uclibc
deleted file mode 100644
index cbba552..0000000
--- a/meta/site/mips64-linux-uclibc
+++ /dev/null
@@ -1,83 +0,0 @@
-# general
-ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-
-# bash
-ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-
-# openssh
-ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
-ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
-ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
-ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
-ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
-
-# fget
-compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
-
-# glib
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_uscore=${glib_cv_uscore=no}
-
-# glib-2.0
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-ac_cv_alignof_guint32=4
-ac_cv_alignof_guint64=8
-ac_cv_alignof_unsigned_long=8
-
-# libpcap
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-
-# startup-notification
-lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ncftp
-wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
-wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
-wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
-
-# db
-db_cv_align_t=${db_cv_align_t='unsigned long long'}
-db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-
-# rrdtool
-rd_cv_ieee_works=${rd_cv_ieee_works=yes}
-# ac_cv_path_PERL=${ac_cv_path_PERL=no}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-# samba
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-
-# vim
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-
-# intercom
-ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
-
-# lmbench
-ac_cv_uint=${ac_cv_unit=yes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-
-# eds-dbus
-ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
-
diff --git a/meta/site/mips64el-linux b/meta/site/mips64el-linux
deleted file mode 100644
index 8b61eb0..0000000
--- a/meta/site/mips64el-linux
+++ /dev/null
@@ -1,82 +0,0 @@
-# general
-ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-
-# bash
-ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-
-# openssh
-ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
-ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
-ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
-ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
-ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
-
-# fget
-compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
-
-# glib
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_uscore=${glib_cv_uscore=no}
-
-# glib-2.0
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-ac_cv_alignof_guint32=4
-ac_cv_alignof_guint64=8
-ac_cv_alignof_unsigned_long=8
-
-# libpcap
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-
-# startup-notification
-lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ncftp
-wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
-wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
-wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
-
-# db
-db_cv_align_t=${db_cv_align_t='unsigned long long'}
-db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-
-# rrdtool
-rd_cv_ieee_works=${rd_cv_ieee_works=yes}
-# ac_cv_path_PERL=${ac_cv_path_PERL=no}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-# samba
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-
-# vim
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-
-# intercom
-ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
-
-#lmbench
-ac_cv_uint=${ac_cv_unit=yes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-
-# eds-dbus
-ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
diff --git a/meta/site/mips64el-linux-uclibc b/meta/site/mips64el-linux-uclibc
deleted file mode 100644
index 6a0499d..0000000
--- a/meta/site/mips64el-linux-uclibc
+++ /dev/null
@@ -1,108 +0,0 @@
-# general
-ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-
-# bash
-ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-
-# openssh
-ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
-ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
-ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
-ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
-ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
-
-# fget
-compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
-
-# glib
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_uscore=${glib_cv_uscore=no}
-
-# glib-2.0
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-ac_cv_alignof_guint32=4
-ac_cv_alignof_guint64=8
-ac_cv_alignof_unsigned_long=8
-
-# libpcap
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-
-# startup-notification
-lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ncftp
-wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
-wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
-wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-# samba
-# from samba 3.0.14a on 5/29/2005
-ac_cv_func_memcmp_working=${ac_cv_func_memcmp_working=yes}
-ac_cv_have_asprintf_decl=${ac_cv_have_asprintf_decl=yes}
-ac_cv_have_setresgid_decl=${ac_cv_have_setresgid_decl=yes}
-ac_cv_have_setresuid_decl=${ac_cv_have_setresuid_decl=yes}
-ac_cv_have_vasprintf_decl=${ac_cv_have_vasprintf_decl=yes}
-fu_cv_sys_stat_statvfs64=${fu_cv_sys_stat_statvfs64=yes}
-samba_cv_FTRUNCATE_NEEDS_ROOT=${samba_cv_FTRUNCATE_NEEDS_ROOT=no}
-samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=${samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=no}
-samba_cv_HAVE_BROKEN_GETGROUPS=${samba_cv_HAVE_BROKEN_GETGROUPS=no}
-samba_cv_HAVE_BROKEN_READDIR=${samba_cv_HAVE_BROKEN_READDIR=no}
-samba_cv_HAVE_C99_VSNPRINTF=${samba_cv_HAVE_C99_VSNPRINTF=yes}
-samba_cv_HAVE_DEV64_T=${samba_cv_HAVE_DEV64_T=no}
-samba_cv_HAVE_DEVICE_MAJOR_FN=${samba_cv_HAVE_DEVICE_MAJOR_FN=yes}
-samba_cv_HAVE_DEVICE_MINOR_FN=${samba_cv_HAVE_DEVICE_MINOR_FN=yes}
-samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=${samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=yes}
-samba_cv_HAVE_FCNTL_LOCK=${samba_cv_HAVE_FCNTL_LOCK=yes}
-samba_cv_HAVE_FTRUNCATE_EXTEND=${samba_cv_HAVE_FTRUNCATE_EXTEND=yes}
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-samba_cv_HAVE_INO64_T=${samba_cv_HAVE_INO64_T=no}
-samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes}
-samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes}
-samba_cv_HAVE_KERNEL_SHARE_MODES=${samba_cv_HAVE_KERNEL_SHARE_MODES=yes}
-samba_cv_HAVE_MAKEDEV=${samba_cv_HAVE_MAKEDEV=yes}
-samba_cv_HAVE_MMAP=${samba_cv_HAVE_MMAP=yes}
-samba_cv_HAVE_OFF64_T=${samba_cv_HAVE_OFF64_T=no}
-samba_cv_HAVE_QUOTACTL_4A=${samba_cv_HAVE_QUOTACTL_4A=yes}
-samba_cv_HAVE_ROOT=${samba_cv_HAVE_ROOT=no}
-samba_cv_HAVE_SECURE_MKSTEMP=${samba_cv_HAVE_SECURE_MKSTEMP=yes}
-samba_cv_HAVE_SENDFILE64=${samba_cv_HAVE_SENDFILE64=yes}
-samba_cv_HAVE_STRUCT_DIRENT64=${samba_cv_HAVE_STRUCT_DIRENT64=yes}
-samba_cv_HAVE_STRUCT_FLOCK64=${samba_cv_HAVE_STRUCT_FLOCK64=yes}
-samba_cv_HAVE_TRUNCATED_SALT=${samba_cv_HAVE_TRUNCATED_SALT=no}
-samba_cv_HAVE_UNSIGNED_CHAR=${samba_cv_HAVE_UNSIGNED_CHAR=no}
-samba_cv_HAVE_WORKING_AF_LOCAL=${samba_cv_HAVE_WORKING_AF_LOCAL=no}
-samba_cv_HAVE_Werror=${samba_cv_HAVE_Werror=yes}
-samba_cv_REALPATH_TAKES_NULL=${samba_cv_REALPATH_TAKES_NULL=no}
-samba_cv_REPLACE_INET_NTOA=${samba_cv_REPLACE_INET_NTOA=no}
-samba_cv_SIZEOF_INO_T=${samba_cv_SIZEOF_INO_T=yes}
-samba_cv_SIZEOF_OFF_T=${samba_cv_SIZEOF_OFF_T=yes}
-samba_cv_SYSCONF_SC_NGROUPS_MAX=${samba_cv_SYSCONF_SC_NGROUPS_MAX=yes}
-samba_cv_SYSCONF_SC_NPROC_ONLN=${samba_cv_SYSCONF_SC_NPROC_ONLN=no}
-samba_cv_SYSQUOTA_FOUND=${samba_cv_SYSQUOTA_FOUND=yes}
-samba_cv_SYSQUOTA_WORKS=${samba_cv_SYSQUOTA_WORKS=yes}
-samba_cv_USE_SETRESUID=${samba_cv_USE_SETRESUID=yes}
-samba_cv_have_longlong=${samba_cv_have_longlong=yes}
-samba_cv_have_setresgid=${samba_cv_have_setresgid=yes}
-samba_cv_have_setresuid=${samba_cv_have_setresuid=yes}
-samba_cv_sysquotas_file=${samba_cv_sysquotas_file=lib/sysquotas_4A.c}
-# This cached value needs a local patch to pick it up, upstream 3.0.14a
-# doesn't cache it.
-samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
deleted file mode 100644
index 696b1be..0000000
--- a/meta/site/mipsel-linux
+++ /dev/null
@@ -1,79 +0,0 @@
-# general
-ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-
-# bash
-ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-
-# openssh
-ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
-ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
-ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
-ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
-ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
-
-# fget
-compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
-
-# glib
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_uscore=${glib_cv_uscore=no}
-
-# glib-2.0
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-
-# libpcap
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-
-# startup-notification
-lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ncftp
-wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
-wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
-wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
-
-# db
-db_cv_align_t=${db_cv_align_t='unsigned long long'}
-db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-
-# rrdtool
-rd_cv_ieee_works=${rd_cv_ieee_works=yes}
-# ac_cv_path_PERL=${ac_cv_path_PERL=no}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-# samba
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-
-# vim
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-
-# intercom
-ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
-
-#lmbench
-ac_cv_uint=${ac_cv_unit=yes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-
-# evolution-data-server
-ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
diff --git a/meta/site/mipsel-linux-uclibc b/meta/site/mipsel-linux-uclibc
deleted file mode 100644
index f921cda..0000000
--- a/meta/site/mipsel-linux-uclibc
+++ /dev/null
@@ -1,100 +0,0 @@
-# general
-ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-
-# bash
-ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-
-# openssh
-ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
-ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
-ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
-ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
-ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
-
-# fget
-compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
-
-# glib
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_uscore=${glib_cv_uscore=no}
-
-# libpcap
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-
-# startup-notification
-lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ncftp
-wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
-wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
-wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-# samba
-# from samba 3.0.14a on 5/29/2005
-ac_cv_func_memcmp_working=${ac_cv_func_memcmp_working=yes}
-ac_cv_have_asprintf_decl=${ac_cv_have_asprintf_decl=yes}
-ac_cv_have_setresgid_decl=${ac_cv_have_setresgid_decl=yes}
-ac_cv_have_setresuid_decl=${ac_cv_have_setresuid_decl=yes}
-ac_cv_have_vasprintf_decl=${ac_cv_have_vasprintf_decl=yes}
-fu_cv_sys_stat_statvfs64=${fu_cv_sys_stat_statvfs64=yes}
-samba_cv_FTRUNCATE_NEEDS_ROOT=${samba_cv_FTRUNCATE_NEEDS_ROOT=no}
-samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=${samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=no}
-samba_cv_HAVE_BROKEN_GETGROUPS=${samba_cv_HAVE_BROKEN_GETGROUPS=no}
-samba_cv_HAVE_BROKEN_READDIR=${samba_cv_HAVE_BROKEN_READDIR=no}
-samba_cv_HAVE_C99_VSNPRINTF=${samba_cv_HAVE_C99_VSNPRINTF=yes}
-samba_cv_HAVE_DEV64_T=${samba_cv_HAVE_DEV64_T=no}
-samba_cv_HAVE_DEVICE_MAJOR_FN=${samba_cv_HAVE_DEVICE_MAJOR_FN=yes}
-samba_cv_HAVE_DEVICE_MINOR_FN=${samba_cv_HAVE_DEVICE_MINOR_FN=yes}
-samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=${samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=yes}
-samba_cv_HAVE_FCNTL_LOCK=${samba_cv_HAVE_FCNTL_LOCK=yes}
-samba_cv_HAVE_FTRUNCATE_EXTEND=${samba_cv_HAVE_FTRUNCATE_EXTEND=yes}
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-samba_cv_HAVE_INO64_T=${samba_cv_HAVE_INO64_T=no}
-samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes}
-samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes}
-samba_cv_HAVE_KERNEL_SHARE_MODES=${samba_cv_HAVE_KERNEL_SHARE_MODES=yes}
-samba_cv_HAVE_MAKEDEV=${samba_cv_HAVE_MAKEDEV=yes}
-samba_cv_HAVE_MMAP=${samba_cv_HAVE_MMAP=yes}
-samba_cv_HAVE_OFF64_T=${samba_cv_HAVE_OFF64_T=no}
-samba_cv_HAVE_QUOTACTL_4A=${samba_cv_HAVE_QUOTACTL_4A=yes}
-samba_cv_HAVE_ROOT=${samba_cv_HAVE_ROOT=no}
-samba_cv_HAVE_SECURE_MKSTEMP=${samba_cv_HAVE_SECURE_MKSTEMP=yes}
-samba_cv_HAVE_SENDFILE64=${samba_cv_HAVE_SENDFILE64=yes}
-samba_cv_HAVE_STRUCT_DIRENT64=${samba_cv_HAVE_STRUCT_DIRENT64=yes}
-samba_cv_HAVE_STRUCT_FLOCK64=${samba_cv_HAVE_STRUCT_FLOCK64=yes}
-samba_cv_HAVE_TRUNCATED_SALT=${samba_cv_HAVE_TRUNCATED_SALT=no}
-samba_cv_HAVE_UNSIGNED_CHAR=${samba_cv_HAVE_UNSIGNED_CHAR=no}
-samba_cv_HAVE_WORKING_AF_LOCAL=${samba_cv_HAVE_WORKING_AF_LOCAL=no}
-samba_cv_HAVE_Werror=${samba_cv_HAVE_Werror=yes}
-samba_cv_REALPATH_TAKES_NULL=${samba_cv_REALPATH_TAKES_NULL=no}
-samba_cv_REPLACE_INET_NTOA=${samba_cv_REPLACE_INET_NTOA=no}
-samba_cv_SIZEOF_INO_T=${samba_cv_SIZEOF_INO_T=yes}
-samba_cv_SIZEOF_OFF_T=${samba_cv_SIZEOF_OFF_T=yes}
-samba_cv_SYSCONF_SC_NGROUPS_MAX=${samba_cv_SYSCONF_SC_NGROUPS_MAX=yes}
-samba_cv_SYSCONF_SC_NPROC_ONLN=${samba_cv_SYSCONF_SC_NPROC_ONLN=no}
-samba_cv_SYSQUOTA_FOUND=${samba_cv_SYSQUOTA_FOUND=yes}
-samba_cv_SYSQUOTA_WORKS=${samba_cv_SYSQUOTA_WORKS=yes}
-samba_cv_USE_SETRESUID=${samba_cv_USE_SETRESUID=yes}
-samba_cv_have_longlong=${samba_cv_have_longlong=yes}
-samba_cv_have_setresgid=${samba_cv_have_setresgid=yes}
-samba_cv_have_setresuid=${samba_cv_have_setresuid=yes}
-samba_cv_sysquotas_file=${samba_cv_sysquotas_file=lib/sysquotas_4A.c}
-# This cached value needs a local patch to pick it up, upstream 3.0.14a
-# doesn't cache it.
-samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
diff --git a/meta/site/powerpc-common b/meta/site/powerpc-common
deleted file mode 100644
index efa299c..0000000
--- a/meta/site/powerpc-common
+++ /dev/null
@@ -1,14 +0,0 @@
-# glib
-ac_cv_alignof_guint32=4
-ac_cv_alignof_guint64=8
-ac_cv_alignof_unsigned_long=4
-
-# at-spi2-core
-ac_cv_alignof_char=1
-ac_cv_alignof_dbind_pointer=4
-ac_cv_alignof_dbind_struct=1
-ac_cv_alignof_dbus_bool_t=4
-ac_cv_alignof_dbus_int16_t=2
-ac_cv_alignof_dbus_int32_t=4
-ac_cv_alignof_dbus_int64_t=8
-ac_cv_alignof_double=8
diff --git a/meta/site/powerpc-darwin b/meta/site/powerpc-darwin
deleted file mode 100644
index 085f50b..0000000
--- a/meta/site/powerpc-darwin
+++ /dev/null
@@ -1,7 +0,0 @@
-# pkgconfig-native for OS X buid
-ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-ac_cv_sizeof_long=${ac_cv_sizeof_long=4}
-ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
-ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
-ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
diff --git a/meta/site/powerpc-linux b/meta/site/powerpc-linux
deleted file mode 100644
index a9f89cb..0000000
--- a/meta/site/powerpc-linux
+++ /dev/null
@@ -1,16 +0,0 @@
-# general
-ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
-
-# startup-notification
-lf_cv_sane_realloc=yes
-
-# glib
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_uscore=${glib_cv_uscore=no}
-glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
-
-# lftp
-lftp_cv_va_val_copy=${lftp_cv_va_val_copy=yes}
-
-# slrn
-slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
deleted file mode 100644
index e3929ac..0000000
--- a/meta/site/powerpc32-linux
+++ /dev/null
@@ -1,275 +0,0 @@
-ac_cv_func_setvbuf_reversed=no
-ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
-ac_cv_sizeof_bool=${ac_cv_sizeof_bool=1}
-ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
-ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=4}
-ac_cv_sizeof_double=${ac_cv_sizeof_double=8}
-ac_cv_sizeof_float=${ac_cv_sizeof_float=4}
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-ac_cv_sizeof_int_p=${ac_cv_sizeof_int_p=4}
-ac_cv_sizeof_long=${ac_cv_sizeof_long=4}
-ac_cv_sizeof_long_p=${ac_cv_sizeof_long_p=4}
-ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
-ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=4}
-ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
-ac_cv_sizeof_long_long_int=${ac_cv_sizeof_long_long_int=8}
-ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
-ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
-ac_cv_sizeof_signed_char=${ac_cv_sizeof_signed_char=1}
-ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
-ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_char=1}
-ac_cv_sizeof_unsigned_int=${ac_cv_sizeof_unsigned_int=4}
-ac_cv_sizeof_unsigned_long=${ac_cv_sizeof_unsigned_long=4}
-ac_cv_sizeof_unsigned_long_int=${ac_cv_sizeof_unsigned_long_int=4}
-ac_cv_sizeof_unsigned_long_long_int=${ac_cv_sizeof_unsigned_long_long_int=8}
-ac_cv_sizeof_unsigned_short=${ac_cv_sizeof_unsigned_short=2}
-ac_cv_sizeof_unsigned_short_int=${ac_cv_sizeof_unsigned_short_int=2}
-ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
-ac_cv_sizeof_wchar_t=${ac_cv_sizeof_wchar_t=4}
-ac_cv_type___int64=${ac_cv_type___int64=no}
-ac_cv_type_size_t=${ac_cv_type_size_t=yes}
-ac_cv_type_void_p=${ac_cv_type_void_p=yes}
-ac_cv_uchar=${ac_cv_uchar=no}
-ac_cv_uint=${ac_cv_uint=yes}
-ac_cv_ulong=${ac_cv_ulong=yes}
-ac_cv_ushort=${ac_cv_ushort=yes}
-ac_cv_time_r_type=${ac_cv_time_r_type=POSIX}
-cookie_io_functions_use_off64_t=${cookie_io_functions_use_off64_t=yes}
-
-
-# apache
-ac_cv_func_pthread_key_delete=${ac_cv_func_pthread_key_delete=yes}
-apr_cv_process_shared_works=${apr_cv_process_shared_works=no}
-ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
-
-ac_cv_header_netinet_sctp_h=${ac_cv_header_netinet_sctp_h=no}
-ac_cv_header_netinet_sctp_uio_h=${ac_cv_header_netinet_sctp_uio_h=no}
-ac_cv_sctp=${ac_cv_sctp=no}
-
-# ssh
-ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_dirent_have_space_d_name=yes}
-ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
-ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
-ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
-ac_cv_type_struct_timespec=${ac_cv_type_struct_timespec=yes}
-ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=yes}
-
-# coreutils
-utils_cv_sys_open_max=${utils_cv_sys_open_max=1019}
-
-# libpcap
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-
-# nano
-ac_cv_regexec_segfault_emptystr=${ac_cv_regexec_segfault_emptystr=no}
-nano_cv_func_regexec_segv_emptystr=${nano_cv_func_regexec_segv_emptystr=no}
-
-
-# libnet
-ac_libnet_have_packet_socket=${ac_libnet_have_packet_socket=yes}
-
-# screen
-screen_cv_sys_bcopy_overlap=${screen_cv_sys_bcopy_overlap=no}
-screen_cv_sys_memcpy_overlap=${screen_cv_sys_memcpy_overlap=no}
-screen_cv_sys_memmove_overlap=${screen_cv_sys_memmove_overlap=no}
-screen_cv_sys_fifo_broken_impl=${screen_cv_sys_fifo_broken_impl=yes}
-screen_cv_sys_fifo_usable=${screen_cv_sys_fifo_usable=yes}
-screen_cv_sys_select_broken_retval=${screen_cv_sys_select_broken_retval=no}
-screen_cv_sys_sockets_nofs=${screen_cv_sys_sockets_nofs=no}
-screen_cv_sys_sockets_usable=${screen_cv_sys_sockets_usable=yes}
-screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}
-
-ac_cv_func_lstat_dereferences_slashed_symlink=${ac_cv_func_lstat_dereferences_slashed_symlink=yes}
-ac_cv_func_lstat_empty_string_bug=${ac_cv_func_lstat_empty_string_bug=no}
-ac_cv_func_stat_empty_string_bug=${ac_cv_func_stat_empty_string_bug=no}
-ac_cv_func_stat_ignores_trailing_slash=${ac_cv_func_stat_ignores_trailing_slash=no}
-
-# socat
-ac_cv_ispeed_offset=${ac_cv_ispeed_offset=13}
-sc_cv_termios_ispeed=${sc_cv_termios_ispeed=yes}
-
-# links
-ac_cv_lib_png_png_create_info_struct=${ac_cv_lib_png_png_create_info_struct=yes}
-
-# db
-db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-db_cv_align_t=${db_cv_align_t='unsigned long long'}
-db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-
-# php
-ac_cv_pread=${ac_cv_pread=no}
-ac_cv_pwrite=${ac_cv_pwrite=no}
-php_cv_lib_cookie_io_functions_use_off64_t=${php_cv_lib_cookie_io_functions_use_off64_t=yes}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-# glib
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-glib_cv_sys_pthread_mutex_trylock_posix=${glib_cv_sys_pthread_mutex_trylock_posix=yes}
-glib_cv_sys_pthread_getspecific_posix=${glib_cv_sys_pthread_getspecific_posix=yes}
-glib_cv_sys_pthread_cond_timedwait_posix=${glib_cv_sys_pthread_cond_timedwait_posix=yes}
-
-# ettercap
-ettercap_cv_type_socklen_t=${ettercap_cv_type_socklen_t=yes}
-
-# libesmtp
-acx_working_snprintf=${acx_working_snprintf=yes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-
-# glib 2.0
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
-glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
-glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=4}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_sys_use_pid_niceness_surrogate=${glib_cv_sys_use_pid_niceness_surrogate=yes}
-
-glib_cv_strlcpy=${glib_cv_strlcpy=no}
-
-# httppc
-ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
-
-# lftp
-ac_cv_need_trio=${ac_cv_need_trio=no}
-lftp_cv_va_val_copy=${lftp_cv_va_val_copy=yes}
-
-# edb
-db_cv_spinlocks=${db_cv_spinlocks=no}
-
-# fget
-compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
-compat_cv_func_basename_works=${compat_cv_func_basename_works=no}
-compat_cv_func_dirname_works=${compat_cv_func_dirname_works=no}
-
-# slrn
-slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
-
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ORBit2
-ac_cv_alignof_CORBA_boolean=1
-ac_cv_alignof_CORBA_char=1
-ac_cv_alignof_CORBA_double=4
-ac_cv_alignof_CORBA_float=4
-ac_cv_alignof_CORBA_long=4
-ac_cv_alignof_CORBA_long_double=4
-ac_cv_alignof_CORBA_long_long=4
-ac_cv_alignof_CORBA_octet=1
-ac_cv_alignof_CORBA_pointer=4
-ac_cv_alignof_CORBA_short=2
-ac_cv_alignof_CORBA_struct=4
-ac_cv_alignof_CORBA_wchar=2
-
-# cvs
-cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
-
-# bash
-ac_cv_c_long_double=${ac_cv_c_long_double=yes}
-bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=missing}
-
-# openssh
-ac_cv_have_broken_dirname=${ac_cv_have_broken_dirname='yes'}
-ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent='no'}
-ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf='no'}
-ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug='yes'}
-ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr='no'}
-ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr='yes'}
-
-# vim
-ac_cv_sizeof_int=${ac_cv_sizeof_int='4'}
-
-#modphp 
-ac_cv_c_bigendian_php=${ac_cv_c_bigendian_php=yes}
-ac_cv_sizeof_ptrdiff_t=${ac_cv_sizeof_ptrdiff_t=4}
-
-# apache2 (note other apache stanza in this file)
-ap_void_ptr_lt_long=${ap_void_ptr_lt_long=no}
-apr_cv_use_lfs64=${apr_cv_use_lfs64=yes}
-apr_cv_epoll=${apr_cv_epoll=yes}
-apr_cv_pthreads_cflags=${apr_cv_pthreads_cflags=-pthread}
-apr_cv_pthreads_lib=${apr_cv_pthreads_lib=-lpthread}
-ac_cv_func_mmap=${ac_cv_func_mmap=yes}
-ac_cv_file__dev_zero=${ac_cv_file__dev_zero=yes}
-ac_cv_sizeof_off_t=${ac_cv_sizeof_off_t=4}
-ac_cv_sizeof_pid_t=${ac_cv_sizeof_pid_t=4}
-ac_cv_socklen_t=${ac_cv_socklen_t=yes}
-ac_cv_struct_rlimit=${ac_cv_struct_rlimit=yes}
-ac_cv_negative_eai=${ac_cv_negative_eai=yes}
-apr_cv_gai_addrconfig=${apr_cv_gai_addrconfig=no}
-apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
-
-# binutils (libiberty)
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-ac_cv_type_int=${ac_cv_type_int=yes}
-ac_cv_type_uintptr_t=${ac_cv_type_uintptr_t=yes}
-liberty_cv_uint64=${liberty_cv_uint64=uint64_t}
-
-#samba
-ac_cv_func_memcmp_working=${ac_cv_func_memcmp_working=yes}
-fu_cv_sys_stat_statvfs64=${fu_cv_sys_stat_statvfs64=yes}
-samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=${samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=no}
-samba_cv_HAVE_BROKEN_GETGROUPS=${samba_cv_HAVE_BROKEN_GETGROUPS=no}
-samba_cv_HAVE_BROKEN_READDIR=${samba_cv_HAVE_BROKEN_READDIR=yes}
-samba_cv_HAVE_BROKEN_READDIR_NAME=${samba_cv_HAVE_BROKEN_READDIR_NAME=no}
-samba_cv_HAVE_C99_VSNPRINTF=${samba_cv_HAVE_C99_VSNPRINTF=yes}
-samba_cv_HAVE_DEV64_T=${samba_cv_HAVE_DEV64_T=no}
-samba_cv_HAVE_DEVICE_MAJOR_FN=${samba_cv_HAVE_DEVICE_MAJOR_FN=yes}
-samba_cv_HAVE_DEVICE_MINOR_FN=${samba_cv_HAVE_DEVICE_MINOR_FN=yes}
-samba_cv_HAVE_FCNTL_LOCK=${samba_cv_HAVE_FCNTL_LOCK=yes}
-samba_cv_HAVE_FTRUNCATE_EXTEND=${samba_cv_HAVE_FTRUNCATE_EXTEND=yes}
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-samba_cv_HAVE_INO64_T=${samba_cv_HAVE_INO64_T=no}
-samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes}
-samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes}
-samba_cv_HAVE_KERNEL_SHARE_MODES=${samba_cv_HAVE_KERNEL_SHARE_MODES=yes}
-samba_cv_HAVE_MAKEDEV=${samba_cv_HAVE_MAKEDEV=yes}
-samba_cv_HAVE_MMAP=${samba_cv_HAVE_MMAP=yes}
-samba_cv_HAVE_OFF64_T=${samba_cv_HAVE_OFF64_T=no}
-samba_cv_HAVE_SECURE_MKSTEMP=${samba_cv_HAVE_SECURE_MKSTEMP=yes}
-samba_cv_HAVE_SENDFILE64=${samba_cv_HAVE_SENDFILE64=yes}
-samba_cv_HAVE_SENDFILE=${samba_cv_HAVE_SENDFILE=yes}
-samba_cv_HAVE_STRUCT_FLOCK64=${samba_cv_HAVE_STRUCT_FLOCK64=yes}
-samba_cv_HAVE_TRUNCATED_SALT=${samba_cv_HAVE_TRUNCATED_SALT=no}
-samba_cv_HAVE_UNSIGNED_CHAR=${samba_cv_HAVE_UNSIGNED_CHAR=yes}
-samba_cv_HAVE_WORKING_AF_LOCAL=${samba_cv_HAVE_WORKING_AF_LOCAL=yes}
-samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
-samba_cv_REALPATH_TAKES_NULL=${samba_cv_REALPATH_TAKES_NULL=yes}
-samba_cv_REPLACE_INET_NTOA=${samba_cv_REPLACE_INET_NTOA=no}
-samba_cv_REPLACE_READDIR=${samba_cv_REPLACE_READDIR=no}
-samba_cv_SIZEOF_DEV_T=${samba_cv_SIZEOF_DEV_T=yes}
-samba_cv_SIZEOF_INO_T=${samba_cv_SIZEOF_INO_T=yes}
-samba_cv_SIZEOF_OFF_T=${samba_cv_SIZEOF_OFF_T=yes}
-samba_cv_STAT_STATVFS64=${samba_cv_STAT_STATVFS64=yes}
-samba_cv_USE_SETEUID=${samba_cv_USE_SETEUID=yes}
-samba_cv_USE_SETRESUID=${samba_cv_USE_SETRESUID=yes}
-samba_cv_USE_SETREUID=${samba_cv_USE_SETREUID=yes}
-samba_cv_USE_SETUIDX=${samba_cv_USE_SETUIDX=yes}
-samba_cv_have_longlong=${samba_cv_have_longlong=yes}
-samba_cv_have_setresgid=${samba_cv_have_setresgid=yes}
-samba_cv_have_setresuid=${samba_cv_have_setresuid=yes}
-
-# mysql
-mysql_cv_func_atomic_sub=${mysql_cv_func_atomic_sub=no}
-mysql_cv_func_atomic_add=${mysql_cv_func_atomic_add=no}
-
-
-# libc
-libc_cv_ppc_machine=${libc_cv_ppc_machine=yes}
-libc_cv_mlong_double_128ibm=${libc_cv_mlong_double_128ibm=yes}
-libc_cv_mabi_ibmlongdouble=${libc_cv_mabi_ibmlongdouble=yes}
-libc_cv_mlong_double_128=${libc_cv_mlong_double_128=yes}
diff --git a/meta/site/powerpc64-linux b/meta/site/powerpc64-linux
deleted file mode 100644
index d64e230..0000000
--- a/meta/site/powerpc64-linux
+++ /dev/null
@@ -1,39 +0,0 @@
-ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
-ac_cv_sizeof_char_p=${ac_cv_sizeof_char_p=8}
-ac_cv_sizeof_double=${ac_cv_sizeof_double=8}
-ac_cv_sizeof_float=${ac_cv_sizeof_float=4}
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-ac_cv_sizeof_long=${ac_cv_sizeof_long=8}
-ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=16}
-ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=8}
-ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
-ac_cv_sizeof_long_long_int=${ac_cv_sizeof_long_long_int=8}
-ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
-ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
-ac_cv_sizeof_signed_char=${ac_cv_sizeof_signed_char=1}
-ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_char=1}
-ac_cv_sizeof_unsigned_int=${ac_cv_sizeof_unsigned_int=4}
-ac_cv_sizeof_unsigned_long=${ac_cv_sizeof_unsigned_long=8}
-ac_cv_sizeof_unsigned_long_int=${ac_cv_sizeof_unsigned_long_int=8}
-ac_cv_sizeof_unsigned_long_long_int=${ac_cv_sizeof_unsigned_long_long_int=8}
-ac_cv_sizeof_unsigned_short=${ac_cv_sizeof_unsigned_short=2}
-ac_cv_sizeof_unsigned_short_int=${ac_cv_sizeof_unsigned_short_int=2}
-ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=8}
-
-# screen
-screen_cv_sys_bcopy_overlap=${screen_cv_sys_bcopy_overlap=no}
-screen_cv_sys_memcpy_overlap=${screen_cv_sys_memcpy_overlap=no}
-screen_cv_sys_memmove_overlap=${screen_cv_sys_memmove_overlap=no}
-screen_cv_sys_fifo_broken_impl=${screen_cv_sys_fifo_broken_impl=yes}
-screen_cv_sys_fifo_usable=${screen_cv_sys_fifo_usable=yes}
-screen_cv_sys_select_broken_retval=${screen_cv_sys_select_broken_retval=no}
-screen_cv_sys_sockets_nofs=${screen_cv_sys_sockets_nofs=no}
-screen_cv_sys_sockets_usable=${screen_cv_sys_sockets_usable=yes}
-screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}
-
-# libpcap
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-
-# apr
-apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
-
-- 
2.6.4 (Apple Git-63)


