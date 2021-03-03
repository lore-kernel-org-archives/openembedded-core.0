Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.1293.1614736940944938801
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 18:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ODZNgYZp;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id m1so4622990wml.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 18:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=x209eXoO3NgqPokmnylh1DNymyEXHKBsOj3HR5lvrSE=;
        b=ODZNgYZpyeKdheusiDNzN9JRbYsJ5rlb08bkb20OQQwLK9SHQbxT+UtvDUXL3LdYih
         nn19ONyFkWGR8m5fnNqxXOapNBLp/RWx6Nfz6Im87oPxolbQUDrdE5mgn16msHa5D92h
         yOKbjYZd116fCHzzX1uM8P03B6M2PQ16VdJYB81zeXleXrMSy0waoKsc5zi2rMJT2Fbs
         bKx61NH8Z5kt4YH4o4TK0Z19w9mqWCamQ0/wuv6R7RN3rfwQF0VFCVomLsFbOn2EIQ4D
         wvdTv+detRXgw/nW7XrKGRVzZxOcF5cL6cVchw5xznaYdhDHW1ixfvqrhmz0qZwe68xL
         ZNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=x209eXoO3NgqPokmnylh1DNymyEXHKBsOj3HR5lvrSE=;
        b=sMYwK/6NlXa1RAxnvPEkQje/n8IS79wGyKXewJRFPQ/RKhlYRzdVMy5VzjWIMTC3mx
         iQYcbRgRWIENHWIGK32BkP3Ls0hmEhIIfctcTqV6upET5S9enEiqfp5W9o2MjaqmAvdi
         xzDuwR5jupRYj8gtonvqcDnRB+dKtV6hiJZ8Z9+zYcQOYIF/zqCMYoku6hWiRrsdGpL5
         enSLcZ2PjOkRlebzQZL8b9fQCq7P50WNFC/rl3jeKReQ6lzQWrb0Hf7rm5rD7J1N1oA4
         UUSzSrTvESfcOJs827eldva0y3HSKvgfCwxrbz2eb+emDCNYpbPdwx5bGeChrfRA+PJ4
         FMmA==
X-Gm-Message-State: AOAM531G1L7syIf2iJQKLgKv9gILOb/dP5s7Fdh4PTPJNdc+8L8G9eL0
	zfu2b2F7TbzVAdme5sJY2ZPC4WGuVd4=
X-Google-Smtp-Source: ABdhPJxhsvdst1W7JkXU8iWl5bBAJW54aoqb7+1SgU1BwwCVTwNQWhlPGm6y0HTupbCHkc5ElKDMGw==
X-Received: by 2002:a05:600c:3511:: with SMTP id h17mr6704782wmq.2.1614736938846;
        Tue, 02 Mar 2021 18:02:18 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.32.149])
        by smtp.gmail.com with ESMTPSA id g9sm31489279wrp.14.2021.03.02.18.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 18:02:18 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 3/3] meta/recipes-extended: Add HOMEPAGE / DESCRIPTION
Date: Wed,  3 Mar 2021 03:01:52 +0100
Message-Id: <20210303020152.25093-3-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210303020152.25093-1-dorindabassey@gmail.com>
References: <20210303020152.25093-1-dorindabassey@gmail.com>

Added HOMEPAGE and DESCRIPTION for recipes with missing decriptions or homepage

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-extended/bash/bash.inc                            | 1 +
 meta/recipes-extended/bc/bc_1.07.1.bb                          | 1 +
 meta/recipes-extended/cracklib/cracklib_2.9.5.bb               | 3 ++-
 meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb    | 1 +
 meta/recipes-extended/ed/ed_1.17.bb                            | 1 +
 meta/recipes-extended/grep/grep_3.6.bb                         | 1 +
 meta/recipes-extended/libsolv/libsolv_0.7.17.bb                | 1 +
 meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb              | 1 +
 meta/recipes-extended/logrotate/logrotate_3.18.0.bb            | 3 ++-
 meta/recipes-extended/lzip/lzip_1.22.bb                        | 1 +
 meta/recipes-extended/man-db/man-db_2.9.4.bb                   | 1 +
 meta/recipes-extended/mc/mc_4.8.26.bb                          | 1 +
 meta/recipes-extended/mdadm/mdadm_4.1.bb                       | 1 +
 meta/recipes-extended/mingetty/mingetty_1.08.bb                | 1 +
 meta/recipes-extended/parted/parted_3.4.bb                     | 1 +
 meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb        | 2 ++
 meta/recipes-extended/perl/libtimedate-perl_2.30.bb            | 1 +
 meta/recipes-extended/quota/quota_4.06.bb                      | 1 +
 meta/recipes-extended/sed/sed_4.8.bb                           | 1 +
 meta/recipes-extended/shadow/shadow.inc                        | 1 +
 .../texinfo-dummy-native/texinfo-dummy-native.bb               | 1 +
 meta/recipes-extended/unzip/unzip_6.0.bb                       | 1 +
 meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb                | 1 +
 meta/recipes-extended/xz/xz_5.2.5.bb                           | 1 +
 meta/recipes-extended/zip/zip_3.0.bb                           | 1 +
 25 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index db326660ea..d3e1dfdb30 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -1,5 +1,6 @@
 SUMMARY = "An sh-compatible command language interpreter"
 HOMEPAGE = "http://tiswww.case.edu/php/chet/bash/bashtop.html"
+DESCRIPTION = "Bash is the GNU Project's Bourne Again SHell, a complete implementation of the IEEE POSIX and Open Group shell specification with interactive command line editing, job control on architectures that support it, csh-like features such as history substitution and brace expansion, and a slew of other features."
 SECTION = "base/shell"
 
 DEPENDS = "ncurses bison-native virtual/libiconv"
diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
index 4a51302492..ff3e8f4409 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Arbitrary precision calculator language"
 HOMEPAGE = "http://www.gnu.org/software/bc/bc.html"
+DESCRIPTION = "bc is an arbitrary precision numeric processing language. Syntax is similar to C, but differs in many substantial areas. It supports interactive execution of statements."
 
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
index 82995219dc..9cdb71f1a1 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Password strength checker library"
-HOMEPAGE = "http://sourceforge.net/projects/cracklib"
+HOMEPAGE = "https://github.com/cracklib/cracklib"
+DESCRIPTION = "${SUMMARY}"
 
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
diff --git a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
index 02b016fdf1..e726899c52 100644
--- a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
+++ b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Collection of autoconf m4 macros"
 SECTION = "base"
 HOMEPAGE = "http://sourceforge.net/projects/cwautomacros.berlios/"
+DESCRIPTION = "A collection of autoconf macros, plus an autogen.sh script that can be used with them."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
 
diff --git a/meta/recipes-extended/ed/ed_1.17.bb b/meta/recipes-extended/ed/ed_1.17.bb
index e905eed3c7..addf652d52 100644
--- a/meta/recipes-extended/ed/ed_1.17.bb
+++ b/meta/recipes-extended/ed/ed_1.17.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Line-oriented text editor"
 HOMEPAGE = "http://www.gnu.org/software/ed/"
+DESCRIPTION = "GNU ed is a line-oriented text editor. It is used to create, display, modify and otherwise manipulate text files, both interactively and via shell scripts. A restricted version of ed, red, can only edit files in the current directory and cannot execute shell commands."
 
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7 \
diff --git a/meta/recipes-extended/grep/grep_3.6.bb b/meta/recipes-extended/grep/grep_3.6.bb
index cb009b9132..c17b96d7bd 100644
--- a/meta/recipes-extended/grep/grep_3.6.bb
+++ b/meta/recipes-extended/grep/grep_3.6.bb
@@ -1,5 +1,6 @@
 SUMMARY = "GNU grep utility"
 HOMEPAGE = "http://savannah.gnu.org/projects/grep/"
+DESCRIPTION = "Grep searches one or more input files for lines containing a match to a specified pattern. By default, grep prints the matching lines."
 BUGTRACKER = "http://savannah.gnu.org/bugs/?group=grep"
 SECTION = "console/utils"
 LICENSE = "GPLv3"
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.17.bb b/meta/recipes-extended/libsolv/libsolv_0.7.17.bb
index 8597ea3edb..fa6e8a3c4d 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.17.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.17.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Library for solving packages and reading repositories"
+DESCRIPTION = "This is libsolv, a free package dependency solver using a satisfiability algorithm for solving packages and reading repositories"
 HOMEPAGE = "https://github.com/openSUSE/libsolv"
 BUGTRACKER = "https://github.com/openSUSE/libsolv/issues"
 SECTION = "devel"
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
index 705ece8e19..cf7f478915 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Lightweight high-performance web server"
 HOMEPAGE = "http://www.lighttpd.net/"
+DESCRIPTION = "Lightweight high-performance web server is designed and optimized for high performance environments. With a small memory footprint compared to other web-servers, effective management of the cpu-load, and advanced feature set (FastCGI, SCGI, Auth, Output-Compression, URL-Rewriting and many more)"
 BUGTRACKER = "http://redmine.lighttpd.net/projects/lighttpd/issues"
 
 LICENSE = "BSD-3-Clause"
diff --git a/meta/recipes-extended/logrotate/logrotate_3.18.0.bb b/meta/recipes-extended/logrotate/logrotate_3.18.0.bb
index 270052f46f..55684ac9fb 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.18.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.18.0.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Rotates, compresses, removes and mails system log files"
 SECTION = "console/utils"
-HOMEPAGE = "https://github.com/logrotate/logrotate/issues"
+HOMEPAGE = "https://github.com/logrotate/logrotate/"
+DESCRIPTION = "The logrotate utility is designed to simplify the administration of log files on a system which generates a lot of log files."
 LICENSE = "GPLv2"
 
 # TODO: Document coreutils dependency. Why not RDEPENDS? Why not busybox?
diff --git a/meta/recipes-extended/lzip/lzip_1.22.bb b/meta/recipes-extended/lzip/lzip_1.22.bb
index d21c36a3f4..3360269454 100644
--- a/meta/recipes-extended/lzip/lzip_1.22.bb
+++ b/meta/recipes-extended/lzip/lzip_1.22.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Lossless data compressor based on the LZMA algorithm"
 HOMEPAGE = "http://lzip.nongnu.org/lzip.html"
+DESCRIPTION = "Lzip is a lossless data compressor with a user interface similar to the one of gzip or bzip2. Lzip uses a simplified form of the Lempel-Ziv-Markov chain-Algorithm (LZMA) stream format, chosen to maximize safety and interoperability."
 SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
diff --git a/meta/recipes-extended/man-db/man-db_2.9.4.bb b/meta/recipes-extended/man-db/man-db_2.9.4.bb
index 432953a1bc..cfa6561769 100644
--- a/meta/recipes-extended/man-db/man-db_2.9.4.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.4.bb
@@ -1,5 +1,6 @@
 SUMMARY = "An implementation of the standard Unix documentation system accessed using the man command"
 HOMEPAGE = "http://man-db.nongnu.org/"
+DESCRIPTION = "man-db is an implementation of the standard Unix documentation system accessed using the man command. It uses a Berkeley DB database in place of the traditional flat-text whatis databases."
 LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://docs/COPYING;md5=eb723b61539feef013de476e68b5c50a"
diff --git a/meta/recipes-extended/mc/mc_4.8.26.bb b/meta/recipes-extended/mc/mc_4.8.26.bb
index 3eb19309b7..5c5e6790d8 100644
--- a/meta/recipes-extended/mc/mc_4.8.26.bb
+++ b/meta/recipes-extended/mc/mc_4.8.26.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Midnight Commander is an ncurses based file manager"
 HOMEPAGE = "http://www.midnight-commander.org/"
+DESCRIPTION = "GNU Midnight Commander is a visual file manager, licensed under GNU General Public License and therefore qualifies as Free Software. It's a feature rich full-screen text mode application that allows you to copy, move and delete files and whole directory trees, search for files and run commands in the subshell. Internal viewer and editor are included."
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=270bbafe360e73f9840bd7981621f9c2"
 SECTION = "console/utils"
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 001d3331a7..bb77759cf9 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Tool for managing software RAID under Linux"
 HOMEPAGE = "http://www.kernel.org/pub/linux/utils/raid/mdadm/"
+DESCRIPTION = "mdadm is a Linux utility used to manage and monitor software RAID devices."
 
 # Some files are GPLv2+ while others are GPLv2.
 LICENSE = "GPLv2 & GPLv2+"
diff --git a/meta/recipes-extended/mingetty/mingetty_1.08.bb b/meta/recipes-extended/mingetty/mingetty_1.08.bb
index 491b892093..9822e86b0e 100644
--- a/meta/recipes-extended/mingetty/mingetty_1.08.bb
+++ b/meta/recipes-extended/mingetty/mingetty_1.08.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Compact getty terminal handler for virtual consoles only"
 SECTION = "console/utils"
 HOMEPAGE = "http://sourceforge.net/projects/mingetty/"
+DESCRIPTION = "This is a small Linux console getty that is started on the Linux text console, asks for a login name and then tranfers over to login directory. Is extended to allow automatic login and starting any app."
 LICENSE = "GPLv2"
 PR = "r3"
 
diff --git a/meta/recipes-extended/parted/parted_3.4.bb b/meta/recipes-extended/parted/parted_3.4.bb
index 79dad54687..c15f5aeb0b 100644
--- a/meta/recipes-extended/parted/parted_3.4.bb
+++ b/meta/recipes-extended/parted/parted_3.4.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Disk partition editing/resizing utility"
 HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
+DESCRIPTION = "GNU Parted manipulates partition tables. This is useful for creating space for new operating systems, reorganizing disk usage, copying data on hard disks and disk imaging."
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
 SECTION = "console/tools"
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
index 9f992d3e83..409a8f3896 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
@@ -1,5 +1,7 @@
 SUMMARY = "Convert::ASN1 - Perl ASN.1 Encode/Decode library"
 SECTION = "libs"
+HOMEPAGE = "https://metacpan.org/source/GBARR/Convert-ASN1-0.27"
+DESCRIPTION = "Convert::ASN1 is a perl library for encoding/decoding data using ASN.1 definitions."
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8e8e0d3d23e096a63f"
 
diff --git a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
index d42eadb586..46843bfc8a 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Perl modules useful for manipulating date and time information"
 HOMEPAGE = "https://metacpan.org/release/TimeDate"
+DESCRIPTION = "This is the perl5 TimeDate distribution. It requires perl version 5.003 or later."
 SECTION = "libs"
 # You can redistribute it and/or modify it under the same terms as Perl itself.
 LICENSE = "Artistic-1.0 | GPL-1.0+"
diff --git a/meta/recipes-extended/quota/quota_4.06.bb b/meta/recipes-extended/quota/quota_4.06.bb
index 19ccbd588a..027b0811f7 100644
--- a/meta/recipes-extended/quota/quota_4.06.bb
+++ b/meta/recipes-extended/quota/quota_4.06.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Tools for monitoring & limiting user disk usage per filesystem"
 SECTION = "base"
 HOMEPAGE = "http://sourceforge.net/projects/linuxquota/"
+DESCRIPTION = "Tools and patches for the Linux Diskquota system as part of the Linux kernel"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=18136&atid=118136"
 LICENSE = "BSD & GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11c6f820f8fa62a5af71230f \
diff --git a/meta/recipes-extended/sed/sed_4.8.bb b/meta/recipes-extended/sed/sed_4.8.bb
index 048db47e14..57a769e8c9 100644
--- a/meta/recipes-extended/sed/sed_4.8.bb
+++ b/meta/recipes-extended/sed/sed_4.8.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Stream EDitor (text filtering utility)"
 HOMEPAGE = "http://www.gnu.org/software/sed/"
+DESCRIPTION = "sed (stream editor) is a non-interactive command-line text editor."
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e \
                     file://sed/sed.h;beginline=1;endline=15;md5=fb3c7e6fbca6f66943859153d4be8efe \
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 4ae7a78c52..2278541f6b 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -1,5 +1,6 @@
 SUMMARY = "Tools to change and administer password and group data"
 HOMEPAGE = "http://github.com/shadow-maint/shadow"
+DESCRIPTION = "${SUMMARY}"
 BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
 SECTION = "base/utils"
 LICENSE = "BSD | Artistic-1.0"
diff --git a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
index ec04bfe390..a942ac2991 100644
--- a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
+++ b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Fake version of the texinfo utility suite"
 SECTION = "console/utils"
+DESCRIPTION = "${SUMMARY}"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d6bb62e73ca8b901d3f2e9d71542f4bb"
 DEPENDS = ""
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index c1ea0a9a2c..0c56a39d92 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Utilities for extracting and viewing files in .zip archives"
 HOMEPAGE = "http://www.info-zip.org"
+DESCRIPTION = "Info-ZIP's purpose is to provide free, portable, high-quality versions of the Zip and UnZip compressor-archiver utilities that are compatible with the DOS-based PKZIP by PKWARE, Inc."
 SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94caec5a51ef55ef711ee4e8b1c69e29"
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
index 4f0f9531a1..2787b270fa 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Socket-based service activation daemon"
 HOMEPAGE = "https://github.com/xinetd-org/xinetd"
+DESCRIPTION = "xinetd is a powerful replacement for inetd, xinetd has access control mechanisms, extensive logging capabilities, the ability to make services available based on time, can place limits on the number of servers that can be started, and has deployable defence mechanisms to protect against port scanners, among other things."
 
 # xinetd is a BSD-like license
 # Apple and Gentoo say BSD here.
diff --git a/meta/recipes-extended/xz/xz_5.2.5.bb b/meta/recipes-extended/xz/xz_5.2.5.bb
index af21b60563..f5f5c318fd 100644
--- a/meta/recipes-extended/xz/xz_5.2.5.bb
+++ b/meta/recipes-extended/xz/xz_5.2.5.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Utilities for managing LZMA compressed files"
 HOMEPAGE = "https://tukaani.org/xz/"
+DESCRIPTION = "XZ Utils is free general-purpose data compression software with a high compression ratio. XZ Utils were written for POSIX-like systems, but also work on some not-so-POSIX systems. XZ Utils are the successor to LZMA Utils."
 SECTION = "base"
 
 # The source includes bits of PD, GPLv2, GPLv3, LGPLv2.1+, but the only file
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 97e5e57533..18b5d8648e 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Compressor/archiver for creating and modifying .zip files"
 HOMEPAGE = "http://www.info-zip.org"
+DESCRIPTION = "Info-ZIP's purpose is to provide free, portable, high-quality versions of the Zip and UnZip compressor-archiver utilities that are compatible with the DOS-based PKZIP by PKWARE, Inc."
 SECTION = "console/utils"
 
 LICENSE = "BSD-3-Clause"
-- 
2.17.1

