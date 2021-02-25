Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.4866.1614213563364177275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 16:39:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rZiSMvRI;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id v15so3586472wrx.4
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 16:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vYBPgUHgBUf6/OZkt79XSpkrADWBApYgyVTS7/jxft0=;
        b=rZiSMvRIWzZ2I8thhMG0j4brCkIy2Bvqgqd9rD/W5baxoPTz1H1MHCMh9k9WKU9A2b
         fv6hKQD+3PSnSG5G0mV/j3lZMYfkXGov/EIzxeSD6XLOutrGCrjVqzyS9S+8B3V098nE
         FKV8k2owZYWjxdpC+bHrMprrm27tFw1gW+OndGsZQ3Cd0hapDdR/zZmKz7JJfBoOT+0P
         g60ziXpyYJcmarvv08RLjNu5xi+d1GxuQdbzSRPLBGpYi8wzR///m0PE2uunisBfes7x
         Ozy6EjrYEtAL7ntTfGNMcMocY5CQGAjYlwE5VqVuJk2EO//mipX6RD1xosnPjX8lG6F+
         9u5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vYBPgUHgBUf6/OZkt79XSpkrADWBApYgyVTS7/jxft0=;
        b=Xa9YjMHNLOOk0qk4hilY5nX/8Koc6Hz/x+4kmHS3AzvoEkS5gDSXOFpmc0GeyHhNor
         fYUOA3OSCs+hY08oWXGrnJvCAnlFi8RlRfdgRFEwUHh1SnGgHFmP4V8sqRXrOyRqmxW7
         dDE6gnx40fSiedXN2WRhVbt9tX17wDKgyvWNWDkbos3gzDYHryKeNcdPWY1UH2+3tJ+v
         ByIEfYOJhdrTk7EZabJPf+h5tI3zDXKNlt1Tr+tC9zui3R7mcmOMwsTjIBIqAEHbiZgH
         1giXEf8DYb1CSi0XV6bdbvnYjogrueoQh2htHZ1yUjx80ZfGgKN9+G0689gpSCRsMRQ2
         9kgw==
X-Gm-Message-State: AOAM531nYK5WKCSEWcupO/KjKi4X012Bu3fsQJAVHixCk4nb9MJDs2PZ
	BKM/5b/Bl0GBpxQkOtb6/7PiH6s+dKs=
X-Google-Smtp-Source: ABdhPJxeS3YwSCCTLQWW9d66c2fxaheY46xF+p5k0lj6NRmhW9k1wTNIXnxQD2n201Ya2QufHHFptA==
X-Received: by 2002:a5d:6643:: with SMTP id f3mr602007wrw.182.1614213560733;
        Wed, 24 Feb 2021 16:39:20 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.99.217])
        by smtp.gmail.com with ESMTPSA id a1sm5965962wrx.95.2021.02.24.16.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 16:39:20 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 4/4] meta/recipes-devtools: Add HOMEPAGE / DESCRIPTION
Date: Thu, 25 Feb 2021 01:39:01 +0100
Message-Id: <20210225003901.18196-4-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210225003901.18196-1-dorindabassey@gmail.com>
References: <20210225003901.18196-1-dorindabassey@gmail.com>

Added HOMEPAGE and DESCRIPTION for recipes with missing decriptions or homepage

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-devtools/apt/apt_1.8.2.2.bb               |  2 ++
 meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb |  1 +
 meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb         |  1 +
 .../desktop-file-utils/desktop-file-utils_0.26.bb      |  3 ++-
 meta/recipes-devtools/devel-config/distcc-config.bb    |  1 +
 meta/recipes-devtools/distcc/distcc_3.3.5.bb           |  1 +
 meta/recipes-devtools/dmidecode/dmidecode_3.3.bb       |  1 +
 meta/recipes-devtools/dnf/dnf_4.5.2.bb                 |  1 +
 meta/recipes-devtools/dpkg/dpkg.inc                    |  2 ++
 meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb   |  1 +
 meta/recipes-devtools/elfutils/elfutils_0.182.bb       |  1 +
 meta/recipes-devtools/fdisk/gptfdisk_1.0.6.bb          |  1 +
 meta/recipes-devtools/gcc/gcc-common.inc               |  1 +
 meta/recipes-devtools/gdb/gdb-common.inc               |  1 +
 meta/recipes-devtools/git/git.inc                      |  1 +
 meta/recipes-devtools/glide/glide_0.13.3.bb            |  3 ++-
 meta/recipes-devtools/gnu-config/gnu-config_git.bb     |  1 +
 meta/recipes-devtools/help2man/help2man_1.48.1.bb      |  2 ++
 meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb       |  1 +
 .../icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb   |  1 +
 meta/recipes-devtools/intltool/intltool_0.51.0.bb      |  2 ++
 meta/recipes-devtools/jquery/jquery_3.5.1.bb           |  1 +
 meta/recipes-devtools/libcomps/libcomps_0.1.15.bb      |  2 ++
 meta/recipes-devtools/libdnf/libdnf_0.55.2.bb          |  2 ++
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb   |  2 ++
 meta/recipes-devtools/librepo/librepo_1.12.1.bb        |  2 ++
 meta/recipes-devtools/log4cplus/log4cplus_2.0.5.bb     |  1 +
 meta/recipes-devtools/makedevs/makedevs_1.0.1.bb       |  1 +
 meta/recipes-devtools/mmc/mmc-utils_git.bb             |  1 +
 meta/recipes-devtools/mtd/mtd-utils_git.bb             |  1 +
 meta/recipes-devtools/nasm/nasm_2.15.05.bb             |  2 ++
 meta/recipes-devtools/ninja/ninja_1.10.2.bb            |  1 +
 meta/recipes-devtools/opkg/opkg_0.4.4.bb               |  1 +
 meta/recipes-devtools/orc/orc_0.4.32.bb                |  1 +
 meta/recipes-devtools/patchelf/patchelf_0.12.bb        | 10 ++++++----
 meta/recipes-devtools/perl/perl_5.32.0.bb              |  1 +
 meta/recipes-devtools/pseudo/pseudo.inc                |  1 +
 .../python-numpy/python3-numpy_1.20.1.bb               |  2 ++
 meta/recipes-devtools/python/python3_3.9.2.bb          |  1 +
 meta/recipes-devtools/rsync/rsync_3.2.3.bb             |  1 +
 .../run-postinsts/run-postinsts_1.0.bb                 |  1 +
 .../squashfs-tools/squashfs-tools_git.bb               |  2 ++
 meta/recipes-devtools/strace/strace_5.10.bb            |  1 +
 meta/recipes-devtools/subversion/subversion_1.14.1.bb  |  1 +
 meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb   |  1 +
 .../systemd-bootchart/systemd-bootchart_234.bb         |  6 ++++++
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb       |  1 +
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb              |  1 +
 meta/recipes-devtools/unfs3/unfs3_git.bb               |  1 +
 meta/recipes-devtools/unifdef/unifdef_2.12.bb          |  1 +
 meta/recipes-devtools/vala/vala.inc                    |  2 +-
 meta/recipes-devtools/valgrind/valgrind_3.16.1.bb      |  1 +
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb            |  3 ++-
 53 files changed, 77 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt_1.8.2.2.bb b/meta/recipes-devtools/apt/apt_1.8.2.2.bb
index 6c5633c91f..6cda61a7d8 100644
--- a/meta/recipes-devtools/apt/apt_1.8.2.2.bb
+++ b/meta/recipes-devtools/apt/apt_1.8.2.2.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Advanced front-end for dpkg"
+DESCRIPTION = "APT is the Advanced Package Tool, an advanced interface to the Debian packaging system which provides the apt-get program."
+HOMEPAGE = "https://packages.debian.org/jessie/apt"
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index c08da6cdca..cd2ca8dbe9 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -3,6 +3,7 @@
 # Released under the MIT license (see packages/COPYING)
 SUMMARY = "A set of tools for CD recording, including cdrecord"
 HOMEPAGE = "http://sourceforge.net/projects/cdrtools/"
+DESCRIPTION = "cdrecord tool is Highly portable CD/DVD/BluRay command line recording software."
 SECTION = "console/utils"
 LICENSE = "GPLv2 & CDDL-1.0 & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb b/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
index 10220ebc91..0a007bb2cd 100644
--- a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
+++ b/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
@@ -1,6 +1,7 @@
 SUMMARY = "GNU unit testing framework, written in Expect and Tcl"
 DESCRIPTION = "DejaGnu is a framework for testing other programs. Its purpose \
 is to provide a single front end for all tests."
+HOMEPAGE = "https://www.gnu.org/software/dejagnu/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb
index 90c265aed9..3487666b92 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb
@@ -1,6 +1,7 @@
-SECTION = "console/utils"
 SUMMARY = "Command line utilities for working with *.desktop files"
+DESCRIPTION = "desktop-file-utils contains a few command line utilities for working with desktop entries"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/desktop-file-utils"
+SECTION = "console/utils"
 LICENSE = "GPLv2+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta/recipes-devtools/devel-config/distcc-config.bb b/meta/recipes-devtools/devel-config/distcc-config.bb
index 3cd661d543..db9e8bbcc9 100644
--- a/meta/recipes-devtools/devel-config/distcc-config.bb
+++ b/meta/recipes-devtools/devel-config/distcc-config.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Sets up distcc for compilation on the target device"
+DESCRIPTION = "${SUMMARY}"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
diff --git a/meta/recipes-devtools/distcc/distcc_3.3.5.bb b/meta/recipes-devtools/distcc/distcc_3.3.5.bb
index d2ea9c8a6a..5c2644199e 100644
--- a/meta/recipes-devtools/distcc/distcc_3.3.5.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.3.5.bb
@@ -1,6 +1,7 @@
 SUMMARY = "A parallel build system"
 DESCRIPTION = "distcc is a parallel build system that distributes \
 compilation of C/C++/ObjC code across machines on a network."
+HOMEPAGE = "https://github.com/distcc/distcc"
 SECTION = "devel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
index 3fc2b20f22..2fe742b7dc 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.3.bb
@@ -1,5 +1,6 @@
 SUMMARY = "DMI (Desktop Management Interface) table related utilities"
 HOMEPAGE = "http://www.nongnu.org/dmidecode/"
+DESCRIPTION = "Dmidecode reports information about your system's hardware as described in your system BIOS according to the SMBIOS/DMI standard (see a sample output)."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta/recipes-devtools/dnf/dnf_4.5.2.bb b/meta/recipes-devtools/dnf/dnf_4.5.2.bb
index e1b0e1a132..c746dc30db 100644
--- a/meta/recipes-devtools/dnf/dnf_4.5.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.5.2.bb
@@ -2,6 +2,7 @@ SUMMARY = "Package manager forked from Yum, using libsolv as a dependency resolv
 DESCRIPTION = "Software package manager that installs, updates, and removes \
 packages on RPM-based Linux distributions. It automatically computes \
 dependencies and determines the actions required to install packages."
+HOMEPAGE = "https://github.com/rpm-software-management/dnf"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://PACKAGE-LICENSING;md5=4a0548e303dbc77f067335b4d688e745 \
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 3419aa56bf..7acfb4161d 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -1,5 +1,7 @@
 SUMMARY = "Package maintenance system from Debian"
 LICENSE = "GPLv2.0+"
+HOMEPAGE = "https://salsa.debian.org/dpkg-team/dpkg"
+DESCRIPTION = "The primary interface for the dpkg suite is the dselect program. A more low-level and less user-friendly interface is available in the form of the dpkg command."
 SECTION = "base"
 
 DEPENDS = "zlib bzip2 perl ncurses"
diff --git a/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb b/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
index 2c843a9342..56b52d6a47 100644
--- a/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
+++ b/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb
@@ -1,4 +1,5 @@
 SUMMARY = "A small utility for printing debug source file locations embedded in binaries"
+DESCRIPTION = "${SUMMARY}"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://../dwarfsrcfiles.c;md5=31483894e453a77acbb67847565f1b5c;beginline=1;endline=8"
 
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.182.bb b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
index 8ce8ed6788..1123a34bfe 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.182.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Utilities and libraries for handling compiled object files"
 HOMEPAGE = "https://sourceware.org/elfutils"
+DESCRIPTION = "elfutils is a collection of utilities and libraries to read, create and modify ELF binary files, find and handle DWARF debug data, symbols, thread state and stacktraces for processes and core files on GNU/Linux."
 SECTION = "base"
 LICENSE = "GPLv2 & GPLv2+ & LGPLv3+ & GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.6.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.6.bb
index 3f331e2dc5..5112debf89 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.6.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.6.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Utility for modifying GPT disk partitioning"
 DESCRIPTION = "GPT fdisk is a disk partitioning tool loosely modeled on Linux fdisk, but used for modifying GUID Partition Table (GPT) disks. The related FixParts utility fixes some common problems on Master Boot Record (MBR) disks."
+HOMEPAGE = "https://sourceforge.net/projects/gptfdisk/"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 3dcfdf835f..629fa26dfe 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -1,5 +1,6 @@
 SUMMARY = "GNU cc and gcc C compilers"
 HOMEPAGE = "http://www.gnu.org/software/gcc/"
+DESCRIPTION = "The GNU Compiler Collection includes front ends for C, C++, Objective-C, Fortran, Ada, Go, and D, as well as libraries for these languages (libstdc++,...). GCC was originally written as the compiler for the GNU operating system."
 SECTION = "devel"
 LICENSE = "GPL"
 
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index ccc911592c..6e04552034 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -1,5 +1,6 @@
 SUMMARY = "GNU debugger"
 HOMEPAGE = "http://www.gnu.org/software/gdb/"
+DESCRIPTION = "GDB, the GNU Project debugger, allows you to see what is going on inside another program while it executes -- or what another program was doing at the moment it crashed."
 SECTION = "devel"
 DEPENDS = "expat zlib ncurses virtual/libiconv ${LTTNGUST} bison-native"
 
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 586a305b27..0cc40b9378 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -1,5 +1,6 @@
 SUMMARY = "Distributed version control system"
 HOMEPAGE = "http://git-scm.com"
+DESCRIPTION = "Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency."
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 DEPENDS = "openssl curl zlib expat"
diff --git a/meta/recipes-devtools/glide/glide_0.13.3.bb b/meta/recipes-devtools/glide/glide_0.13.3.bb
index 31295edf90..6eb87df7c3 100644
--- a/meta/recipes-devtools/glide/glide_0.13.3.bb
+++ b/meta/recipes-devtools/glide/glide_0.13.3.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Vendor Package Management for Golang"
-HOMEPAGE = "https://glide.sh"
+HOMEPAGE = "https://github.com/Masterminds/glide"
+DESCRIPTION = "Glide is a Vendor Package Management for Golang"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=54905cf894f8cc416a92f4fc350c35b2"
 
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index b4e71418ac..c41177c72b 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -1,5 +1,6 @@
 SUMMARY = "gnu-configize"
 DESCRIPTION = "Tool that installs the GNU config.guess / config.sub into a directory tree"
+HOMEPAGE = "https://git.savannah.gnu.org/cgit/config.git"
 SECTION = "devel"
 LICENSE = "GPL-3.0-with-autoconf-exception"
 LIC_FILES_CHKSUM = "file://config.guess;beginline=7;endline=27;md5=b75d42f59f706ea56d6a8e00216fca6a"
diff --git a/meta/recipes-devtools/help2man/help2man_1.48.1.bb b/meta/recipes-devtools/help2man/help2man_1.48.1.bb
index 8341f2ba39..bdea59d964 100644
--- a/meta/recipes-devtools/help2man/help2man_1.48.1.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.48.1.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Program for creating simple man pages"
+HOMEPAGE = "https://www.gnu.org/software/help2man/"
+DESCRIPTION = "help2man is a tool for automatically generating simple manual pages from program output."
 SECTION = "devel"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb
index 7a53151d0e..9842d1f135 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Set of i2c tools for linux"
 HOMEPAGE = "https://i2c.wiki.kernel.org/index.php/I2C_Tools"
+DESCRIPTION = "The i2c-tools package contains a heterogeneous set of I2C tools for Linux: a bus probing tool, a chip dumper, register-level SMBus access helpers, EEPROM decoding scripts, EEPROM programming tools, and a python module for SMBus access. All versions of Linux are supported, as long as I2C support is included in the kernel."
 SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
diff --git a/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb b/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
index 304ad7fec0..ce4d73caf6 100644
--- a/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
+++ b/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
@@ -1,6 +1,7 @@
 # Copyright (c) 2018 Joshua Watt, Garmin International,Inc.
 # Released under the MIT license (see COPYING.MIT for the terms)
 SUMMARY = "Generates Icecream toolchain for SDK"
+DESCRIPTION = "${SUMMARY}"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/icecc-env.sh;beginline=2;endline=20;md5=dd6b68c1efed8a9fb04e409b3b287d47"
 
diff --git a/meta/recipes-devtools/intltool/intltool_0.51.0.bb b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
index ecff2faf25..592dbb92e2 100644
--- a/meta/recipes-devtools/intltool/intltool_0.51.0.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Utility scripts for internationalizing XML"
+HOMEPAGE = "https://launchpad.net/intltool"
+DESCRIPTION = "Utility scripts for internationalizing XML. This tool automatically extracts translatable strings from oaf, glade, bonobo ui, nautilus theme and other XML files into the po files."
 SECTION = "devel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta/recipes-devtools/jquery/jquery_3.5.1.bb b/meta/recipes-devtools/jquery/jquery_3.5.1.bb
index 62f0dfb0c5..cfc32952cd 100644
--- a/meta/recipes-devtools/jquery/jquery_3.5.1.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.5.1.bb
@@ -1,5 +1,6 @@
 SUMMARY = "jQuery is a fast, small, and feature-rich JavaScript library"
 HOMEPAGE = "https://jquery.com/"
+DESCRIPTION = "${SUMMARY}"
 LICENSE = "MIT"
 SECTION = "devel"
 LIC_FILES_CHKSUM = "file://${S}/${BP}.js;beginline=8;endline=10;md5=ebd7bc5d23ab165188e526a0c65d24bb"
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
index 98c55dca85..58d2dee897 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Libcomps is alternative for yum.comps library (which is for managing rpm package groups)."
+HOMEPAGE = "https://github.com/rpm-software-management/libcomps"
+DESCRIPTION = "Libcomps is alternative for yum.comps library. It's written in pure C as library and there's bindings for python2 and python3."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.55.2.bb b/meta/recipes-devtools/libdnf/libdnf_0.55.2.bb
index e22255f831..b34bb5de01 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.55.2.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.55.2.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Library providing simplified C and Python API to libsolv"
+HOMEPAGE = "https://github.com/rpm-software-management/libdnf"
+DESCRIPTION = "This library provides a high level package-manager. It's core library of dnf, PackageKit and rpm-ostree. It's replacement for deprecated hawkey library which it contains inside and uses librepo under the hood."
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index fd49399cb8..2f60ce8e02 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -1,4 +1,6 @@
 SUMMARY = "C Library for manipulating module metadata files"
+HOMEPAGE = "https://github.com/fedora-modularity/libmodulemd"
+DESCRIPTION = "${SUMMARY}"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
 
diff --git a/meta/recipes-devtools/librepo/librepo_1.12.1.bb b/meta/recipes-devtools/librepo/librepo_1.12.1.bb
index 0597351052..e90928d2ed 100644
--- a/meta/recipes-devtools/librepo/librepo_1.12.1.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.12.1.bb
@@ -1,5 +1,7 @@
 SUMMARY = "A library providing C and Python (libcURL like) API \
            for downloading linux repository metadata and packages."
+HOMEPAGE = "https://github.com/rpm-software-management/librepo"
+DESCRIPTION = "${SUMMARY}"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.0.5.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.0.5.bb
index 967ac7623a..a4c202f076 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.0.5.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.0.5.bb
@@ -1,6 +1,7 @@
 SUMMARY = "log4cplus provides a simple C++ logging API for log management"
 SECTION = "libs"
 HOMEPAGE = "http://sourceforge.net/projects/log4cplus/"
+DESCRIPTION = "log4cplus is a simple to use C++ logging API providing thread-safe, flexible, and arbitrarily granular control over log management and configuration. It is modelled after the Java log4j API."
 BUGTRACKER = "http://sourceforge.net/p/log4cplus/bugs/"
 
 LICENSE = "Apache-2.0 & BSD-2-Clause"
diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
index 92d5870f42..5910f4bc70 100644
--- a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
+++ b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Tool for creating device nodes"
+DESCRIPTION = "${SUMMARY}"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 SECTION = "base"
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 5fd1c5c0cd..8fe606915e 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Userspace tools for MMC/SD devices"
 HOMEPAGE = "http://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git/"
+DESCRIPTION = "${SUMMARY}"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index ff42219513..105a68dad8 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Tools for managing memory technology devices"
 HOMEPAGE = "http://www.linux-mtd.infradead.org/"
+DESCRIPTION = "mtd-utils tool is a generic Linux subsystem for memory devices, especially Flash devices."
 SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
diff --git a/meta/recipes-devtools/nasm/nasm_2.15.05.bb b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
index 6a1294c34f..43088baf71 100644
--- a/meta/recipes-devtools/nasm/nasm_2.15.05.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
@@ -1,5 +1,7 @@
 SUMMARY = "General-purpose x86 assembler"
 SECTION = "devel"
+HOMEPAGE = "http://www.nasm.us/"
+DESCRIPTION = "The Netwide Assembler (NASM) is an assembler and disassembler for the Intel x86 architecture."
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 
diff --git a/meta/recipes-devtools/ninja/ninja_1.10.2.bb b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
index 88ff843409..2a39b2d216 100644
--- a/meta/recipes-devtools/ninja/ninja_1.10.2.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Ninja is a small build system with a focus on speed."
 HOMEPAGE = "https://ninja-build.org/"
+DESCRIPTION = "Ninja is a small build system with a focus on speed. It differs from other build systems in two major respects: it is designed to have its input files generated by a higher-level build system, and it is designed to run builds as fast as possible."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.4.bb b/meta/recipes-devtools/opkg/opkg_0.4.4.bb
index 548e81962d..9eca61be2a 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.4.bb
@@ -2,6 +2,7 @@ SUMMARY = "Open Package Manager"
 SUMMARY_libopkg = "Open Package Manager library"
 SECTION = "base"
 HOMEPAGE = "http://code.google.com/p/opkg/"
+DESCRIPTION = "Opkg is a lightweight package management system based on Ipkg."
 BUGTRACKER = "http://code.google.com/p/opkg/issues/list"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-devtools/orc/orc_0.4.32.bb b/meta/recipes-devtools/orc/orc_0.4.32.bb
index a55b43b8ef..0b63716f99 100644
--- a/meta/recipes-devtools/orc/orc_0.4.32.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.32.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Optimised Inner Loop Runtime Compiler"
 HOMEPAGE = "http://gstreamer.freedesktop.org/modules/orc.html"
+DESCRIPTION = "Optimised Inner Loop Runtime Compiler is a Library and set of tools for compiling and executing SIMD assembly language-like programs that operate on arrays of data."
 LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.12.bb b/meta/recipes-devtools/patchelf/patchelf_0.12.bb
index 43de90877c..95886c6d3a 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.12.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.12.bb
@@ -1,10 +1,12 @@
-SRC_URI = "git://github.com/NixOS/patchelf;protocol=https \
-           file://handle-read-only-files.patch \
-           "
+SUMMARY = "Tool to allow editing of RPATH and interpreter fields in ELF binaries"
+DESCRIPTION = "PatchELF is a simple utility for modifying existing ELF executables and libraries."
+HOMEPAGE = "https://github.com/NixOS/patchelf"
 
 LICENSE = "GPLv3"
-SUMMARY = "Tool to allow editing of RPATH and interpreter fields in ELF binaries"
 
+SRC_URI = "git://github.com/NixOS/patchelf;protocol=https \
+           file://handle-read-only-files.patch \
+           "
 SRCREV = "8d3a16e97294e3c5521c61b4c8835499c9918264"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/perl/perl_5.32.0.bb b/meta/recipes-devtools/perl/perl_5.32.0.bb
index 3815dd44b1..7d88c65322 100644
--- a/meta/recipes-devtools/perl/perl_5.32.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.32.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Perl scripting language"
 HOMEPAGE = "http://www.perl.org/"
+DESCRIPTION = "Perl is a highly capable, feature-rich programming language"
 SECTION = "devel"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 50e30064bd..65d6e5068d 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -4,6 +4,7 @@
 
 SUMMARY = "Pseudo gives fake root capabilities to a normal user"
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/pseudo"
+DESCRIPTION = "The pseudo utility offers a way to run commands in a virtualized root environment."
 LIC_FILES_CHKSUM = "file://COPYING;md5=a1d8023a6f953ac6ea4af765ff62d574"
 SECTION = "base"
 LICENSE = "LGPL2.1"
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb
index 2d72152464..6c3b886782 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb
@@ -1,4 +1,6 @@
 SUMMARY = "A sophisticated Numeric Processing Package for Python"
+HOMEPAGE = "https://numpy.org/"
+DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=aa1ecaef18152f75bfae546b29c49d3c"
diff --git a/meta/recipes-devtools/python/python3_3.9.2.bb b/meta/recipes-devtools/python/python3_3.9.2.bb
index 9c87d9d2eb..af1843a180 100644
--- a/meta/recipes-devtools/python/python3_3.9.2.bb
+++ b/meta/recipes-devtools/python/python3_3.9.2.bb
@@ -1,5 +1,6 @@
 SUMMARY = "The Python Programming Language"
 HOMEPAGE = "http://www.python.org"
+DESCRIPTION = "Python is a programming language that lets you work more quickly and integrate your systems more effectively."
 LICENSE = "PSFv2"
 SECTION = "devel/python"
 
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.3.bb b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
index eebd15ec8f..8b36a8ebde 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
@@ -1,5 +1,6 @@
 SUMMARY = "File synchronization tool"
 HOMEPAGE = "http://rsync.samba.org/"
+DESCRIPTION = "rsync is an open source utility that provides fast incremental file transfer."
 BUGTRACKER = "http://rsync.samba.org/bugzilla.html"
 SECTION = "console/network"
 # GPLv2+ (<< 3.0.0), GPLv3+ (>= 3.0.0)
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index 85b3fc867e..c353d4b79c 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Runs postinstall scripts on first boot of the target device"
+DESCRIPTION = "${SUMMARY}"
 SECTION = "devel"
 PR = "r10"
 LICENSE = "MIT"
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index b06951df36..2b1409d78d 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -1,6 +1,8 @@
 # Note, we can probably remove the lzma option as it has be replaced with xz,
 # and I don't think the kernel supports it any more.
 SUMMARY = "Tools for manipulating SquashFS filesystems"
+HOMEPAGE = "https://github.com/plougher/squashfs-tools"
+DESCRIPTION = "Tools to create and extract Squashfs filesystems."
 SECTION = "base"
 LICENSE = "GPL-2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta/recipes-devtools/strace/strace_5.10.bb b/meta/recipes-devtools/strace/strace_5.10.bb
index 22572fb935..17bde082a3 100644
--- a/meta/recipes-devtools/strace/strace_5.10.bb
+++ b/meta/recipes-devtools/strace/strace_5.10.bb
@@ -1,5 +1,6 @@
 SUMMARY = "System call tracing tool"
 HOMEPAGE = "http://strace.io"
+DESCRIPTION = "strace is a diagnostic, debugging and instructional userspace utility for Linux. It is used to monitor and tamper with interactions between processes and the Linux kernel, which include system calls, signal deliveries, and changes of process state."
 SECTION = "console/utils"
 LICENSE = "LGPL-2.1+ & GPL-2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c756d9d5dabc27663df64f0bf492166c"
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.1.bb b/meta/recipes-devtools/subversion/subversion_1.14.1.bb
index f1d0038086..0f8a764532 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.1.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.1.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Subversion (svn) version control system client"
 HOMEPAGE = "http://subversion.apache.org"
+DESCRIPTION = "Subversion is an open source version control system."
 SECTION = "console/network"
 LICENSE = "Apache-2 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6487ae7094d359fa90fb9c4096e52e2b"
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 1b0b45f2fa..fbb2da7f91 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Multi-purpose linux bootloader"
 HOMEPAGE = "http://www.syslinux.org/"
+DESCRIPTION = "The Syslinux Project covers lightweight bootloaders for MS-DOS FAT filesystems (SYSLINUX), network booting (PXELINUX), bootable "El Torito" CD-ROMs (ISOLINUX), and Linux ext2/ext3/ext4 or btrfs filesystems (EXTLINUX). The project also includes MEMDISK, a tool to boot legacy operating systems (such as DOS) from nontraditional media; it is usually used in conjunction with PXELINUX and ISOLINUX."
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://README;beginline=35;endline=41;md5=558f2c71cb1fb9ba511ccd4858e48e8a"
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
index 4c857c3fd0..58dd5995c8 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
@@ -1,3 +1,9 @@
+SUMMARY = "Boot performance graphing tool"
+DESCRIPTION = "For systemd-bootchart, several proc debug interfaces are required in the kernel config: \
+  CONFIG_SCHEDSTATS \
+below is optional, for additional info: \
+  CONFIG_SCHED_DEBUG"
+HOMEPAGE = "https://github.com/systemd/systemd-bootchart"
 LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe"
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index c1b05691b8..854269a0fa 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Target Communication Framework for the Eclipse IDE"
 HOMEPAGE = "http://wiki.eclipse.org/TCF"
+DESCRIPTION = "TCF is a vendor-neutral, lightweight, extensible network protocol mainly for communicating with embedded systems (targets)."
 BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 
 LICENSE = "EPL-1.0 | EDL-1.0"
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
index d011202081..efb36b32dd 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Tool Command Language"
 HOMEPAGE = "http://tcl.sourceforge.net"
+DESCRIPTION = "Tool Command Language, is an open-source multi-purpose C library which includes a powerful dynamic scripting language. Together they provide ideal cross-platform development environment for any programming project."
 SECTION = "devel/tcltk"
 
 # http://www.tcl.tk/software/tcltk/license.html
diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index b02369bd0e..a21fb58397 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -2,6 +2,7 @@ SUMMARY = "Userspace NFS server v3 protocol"
 DESCRIPTION = "UNFS3 is a user-space implementation of the NFSv3 server \
 specification. It provides a daemon for the MOUNT and NFS protocols, which \
 are used by NFS clients for accessing files on the server."
+HOMEPAGE = "https://github.com/unfs3/unfs3"
 SECTION = "console/network"
 LICENSE = "unfs3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9475885294e17c0cc0067820d042792e"
diff --git a/meta/recipes-devtools/unifdef/unifdef_2.12.bb b/meta/recipes-devtools/unifdef/unifdef_2.12.bb
index 22b10ba234..b42051b8b6 100644
--- a/meta/recipes-devtools/unifdef/unifdef_2.12.bb
+++ b/meta/recipes-devtools/unifdef/unifdef_2.12.bb
@@ -2,6 +2,7 @@ SUMMARY = "Selectively remove #ifdef statements from sources"
 SECTION = "devel"
 LICENSE = "BSD-2-Clause"
 HOMEPAGE = "http://dotat.at/prog/unifdef/"
+DESCRIPTION = "The unifdef utility selectively processes conditional C preprocessor #if and #ifdef directives. It removes from a file both the directives and the additional text that they delimit, while otherwise leaving the file alone."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3498caf346f6b77934882101749ada23 \
                     file://unifdef.c;endline=32;md5=6f4ee8085d6e6ab0f7cb4390e1a9c497 \
diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 703ed1aa8d..71da2ef07c 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -1,4 +1,5 @@
 SUMMARY = "C#-like programming language for easing GObject programming"
+HOMEPAGE = "http://vala-project.org"
 DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
 Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
 SECTION = "devel"
@@ -12,7 +13,6 @@ DEPENDS_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'api-doc
 # vala-native contains a native version of vapigen, which we use instead of the target one
 DEPENDS_append_class-target = " vala-native"
 BBCLASSEXTEND = "native"
-HOMEPAGE = "http://vala-project.org"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
index fb7713fe48..d0aefdf39a 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Valgrind memory debugger and instrumentation framework"
 HOMEPAGE = "http://valgrind.org/"
+DESCRIPTION = "Valgrind is an instrumentation framework for building dynamic analysis tools. There are Valgrind tools that can automatically detect many memory management and threading bugs, and profile your programs in detail."
 BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
 LICENSE = "GPLv2 & GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 5ed2709e31..d988e1ffce 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -1,5 +1,6 @@
 SUMMARY = "A shell-script tool for converting XML files to various formats"
-HOMEPAGE = "https://releases.pagure.org/xmlto/"
+HOMEPAGE = "https://pagure.io/xmlto"
+DESCRIPTION = "Utility xmlto is a simple shell-script tool for converting XML files to various formats. It serves as easy to use command line frontend to make fine output without remembering many long options and searching for the syntax of the backends."
 SECTION = "docs/xmlto"
 LICENSE = "GPLv2"
 
-- 
2.17.1

