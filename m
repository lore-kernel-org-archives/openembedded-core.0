Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web09.2564.1615661475870984610
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=udGdsf+F;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id 68-20020a9d0f4a0000b02901b663e6258dso3135010ott.13
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=D75bNK8QN40GIhlxaaUPb2MjWOh6WLEAUbU+yqwRT7Q=;
        b=udGdsf+FJVaOkMMpRhDRzzy6+tagbxeFAXRRERm9fecJbSQsloLiNN/TwaxxEWSkpm
         ftOniLyi4Biu/31YJuU6HdToM+zz92DUKtHZpZWcnwKiZOLuh61TCmw5xG8GtoYNlL+B
         DjeCK4xXOKcZDGNFOo2PWimSfRFTpVSFQlR1xiG+nKn44A4zMmPTEqmERB4HTp7VjLiY
         T4pjupX+PrynWy5Xi4d6ZrwiVpSWgBhov8wWzxaC/MwAXQRVQeHMTDqefWUWK4sRZKul
         cKaaAecfIuCzVku1vjZmHQL1Gd+nhTkR9Z3JOJQpO9iYr1UCu/ZzFRE6lI48AsCRoUX2
         IKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D75bNK8QN40GIhlxaaUPb2MjWOh6WLEAUbU+yqwRT7Q=;
        b=LjAAWivvrbnLhlm4rYm2KyJKLkvGF3D0lk3WR8ex4fiUg3ruIaLv0yEu+eqp85lDzJ
         j8Wo1UeiXWfrHbnEmwOQfVx1IQgbr+a/NvIdnuaozh03WNRWrBQljeBSlDze2fvmUZJg
         sgjw8KhLO/vWrwnhLVJDLr4GfXHazStfmTZ3uSXlkHb5KfxzNQhA5ye+IN7LSfWWimYn
         1bxXzOX/7tG8CKB9MOEZtjBDaTnvunilAJW/sr/nvw6J2+LUs647jmfN/qvR9MahBNDx
         u0hrcbWcMEVt4JO2BolGg80hD40PVVTAE+PQOi003JtXHboC1Cm2TYov78q4QkqJGCbU
         FJXQ==
X-Gm-Message-State: AOAM530mmE+v7Wk4pIe60Z3vTgBi45EK4apEyBckziTaxGd8Bev7+cP9
	sBrzly1YLuHC/mXNVaAN4mqdwcyMiJKQbmfL
X-Google-Smtp-Source: ABdhPJx6MwH4AHKD9f5tcNeUybPiV3JRsic5qLc2uNOKt/wqSc7Y5o4CHpimtSCa+4KIboqRc7NKNA==
X-Received: by 2002:a9d:68c1:: with SMTP id i1mr7959110oto.169.1615661474431;
        Sat, 13 Mar 2021 10:51:14 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.51.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:51:14 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/38] meta/recipes-extended: Add HOMEPAGE / DESCRIPTION
Date: Sat, 13 Mar 2021 08:49:05 -1000
Message-Id: <d2e54108558bcf3a44d65505a643ace5cf365d8a.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

Added HOMEPAGE and DESCRIPTION for recipes with missing decriptions or homepage

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc6c7af900ae0196a62b7fa1375c55bbcd8e68b4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/bash/bash.inc                            | 1 +
 meta/recipes-extended/bc/bc_1.07.1.bb                          | 1 +
 meta/recipes-extended/cracklib/cracklib_2.9.5.bb               | 3 ++-
 meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb    | 1 +
 meta/recipes-extended/ed/ed_1.15.bb                            | 1 +
 meta/recipes-extended/grep/grep_3.4.bb                         | 1 +
 meta/recipes-extended/libsolv/libsolv_0.7.10.bb                | 1 +
 meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb              | 1 +
 meta/recipes-extended/logrotate/logrotate_3.15.1.bb            | 3 ++-
 meta/recipes-extended/lzip/lzip_1.21.bb                        | 1 +
 meta/recipes-extended/man-db/man-db_2.9.0.bb                   | 1 +
 meta/recipes-extended/mc/mc_4.8.23.bb                          | 1 +
 meta/recipes-extended/mdadm/mdadm_4.1.bb                       | 1 +
 meta/recipes-extended/mingetty/mingetty_1.08.bb                | 1 +
 meta/recipes-extended/parted/parted_3.3.bb                     | 1 +
 meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb        | 2 ++
 meta/recipes-extended/perl/libtimedate-perl_2.30.bb            | 1 +
 meta/recipes-extended/quota/quota_4.05.bb                      | 1 +
 meta/recipes-extended/sed/sed_4.8.bb                           | 1 +
 meta/recipes-extended/shadow/shadow.inc                        | 1 +
 .../texinfo-dummy-native/texinfo-dummy-native.bb               | 1 +
 meta/recipes-extended/unzip/unzip_6.0.bb                       | 1 +
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb                  | 1 +
 meta/recipes-extended/xz/xz_5.2.4.bb                           | 1 +
 meta/recipes-extended/zip/zip_3.0.bb                           | 1 +
 25 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 1ebb33bdcd..c7cf8cddd3 100644
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
 
diff --git a/meta/recipes-extended/ed/ed_1.15.bb b/meta/recipes-extended/ed/ed_1.15.bb
index 886c3ddcab..60e6a3d34e 100644
--- a/meta/recipes-extended/ed/ed_1.15.bb
+++ b/meta/recipes-extended/ed/ed_1.15.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Line-oriented text editor"
 HOMEPAGE = "http://www.gnu.org/software/ed/"
+DESCRIPTION = "GNU ed is a line-oriented text editor. It is used to create, display, modify and otherwise manipulate text files, both interactively and via shell scripts. A restricted version of ed, red, can only edit files in the current directory and cannot execute shell commands."
 
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7 \
diff --git a/meta/recipes-extended/grep/grep_3.4.bb b/meta/recipes-extended/grep/grep_3.4.bb
index e176dd727b..46ac4cfb00 100644
--- a/meta/recipes-extended/grep/grep_3.4.bb
+++ b/meta/recipes-extended/grep/grep_3.4.bb
@@ -1,5 +1,6 @@
 SUMMARY = "GNU grep utility"
 HOMEPAGE = "http://savannah.gnu.org/projects/grep/"
+DESCRIPTION = "Grep searches one or more input files for lines containing a match to a specified pattern. By default, grep prints the matching lines."
 BUGTRACKER = "http://savannah.gnu.org/bugs/?group=grep"
 SECTION = "console/utils"
 LICENSE = "GPLv3"
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb b/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
index 265a27c00d..1cf5e2eb29 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Library for solving packages and reading repositories"
+DESCRIPTION = "This is libsolv, a free package dependency solver using a satisfiability algorithm for solving packages and reading repositories"
 HOMEPAGE = "https://github.com/openSUSE/libsolv"
 BUGTRACKER = "https://github.com/openSUSE/libsolv/issues"
 SECTION = "devel"
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
index 7a255ce2f2..35a268a03f 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.55.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Lightweight high-performance web server"
 HOMEPAGE = "http://www.lighttpd.net/"
+DESCRIPTION = "Lightweight high-performance web server is designed and optimized for high performance environments. With a small memory footprint compared to other web-servers, effective management of the cpu-load, and advanced feature set (FastCGI, SCGI, Auth, Output-Compression, URL-Rewriting and many more)"
 BUGTRACKER = "http://redmine.lighttpd.net/projects/lighttpd/issues"
 
 LICENSE = "BSD-3-Clause"
diff --git a/meta/recipes-extended/logrotate/logrotate_3.15.1.bb b/meta/recipes-extended/logrotate/logrotate_3.15.1.bb
index 17f4bf4617..503a0622b1 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.15.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.15.1.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Rotates, compresses, removes and mails system log files"
 SECTION = "console/utils"
-HOMEPAGE = "https://github.com/logrotate/logrotate/issues"
+HOMEPAGE = "https://github.com/logrotate/logrotate/"
+DESCRIPTION = "The logrotate utility is designed to simplify the administration of log files on a system which generates a lot of log files."
 LICENSE = "GPLv2"
 
 # TODO: Document coreutils dependency. Why not RDEPENDS? Why not busybox?
diff --git a/meta/recipes-extended/lzip/lzip_1.21.bb b/meta/recipes-extended/lzip/lzip_1.21.bb
index bb3d2a6fe3..bd1c007de6 100644
--- a/meta/recipes-extended/lzip/lzip_1.21.bb
+++ b/meta/recipes-extended/lzip/lzip_1.21.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Lossless data compressor based on the LZMA algorithm"
 HOMEPAGE = "http://lzip.nongnu.org/lzip.html"
+DESCRIPTION = "Lzip is a lossless data compressor with a user interface similar to the one of gzip or bzip2. Lzip uses a simplified form of the Lempel-Ziv-Markov chain-Algorithm (LZMA) stream format, chosen to maximize safety and interoperability."
 SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
diff --git a/meta/recipes-extended/man-db/man-db_2.9.0.bb b/meta/recipes-extended/man-db/man-db_2.9.0.bb
index 333fbfa76d..7a30f9d722 100644
--- a/meta/recipes-extended/man-db/man-db_2.9.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "An implementation of the standard Unix documentation system accessed using the man command"
 HOMEPAGE = "http://man-db.nongnu.org/"
+DESCRIPTION = "man-db is an implementation of the standard Unix documentation system accessed using the man command. It uses a Berkeley DB database in place of the traditional flat-text whatis databases."
 LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://docs/COPYING;md5=eb723b61539feef013de476e68b5c50a"
diff --git a/meta/recipes-extended/mc/mc_4.8.23.bb b/meta/recipes-extended/mc/mc_4.8.23.bb
index ead348b92e..8e3b7a65e0 100644
--- a/meta/recipes-extended/mc/mc_4.8.23.bb
+++ b/meta/recipes-extended/mc/mc_4.8.23.bb
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
 
diff --git a/meta/recipes-extended/parted/parted_3.3.bb b/meta/recipes-extended/parted/parted_3.3.bb
index aa4d8042cf..2d688c3700 100644
--- a/meta/recipes-extended/parted/parted_3.3.bb
+++ b/meta/recipes-extended/parted/parted_3.3.bb
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
index 7219c7d11e..068f0bd3f3 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Perl modules useful for manipulating date and time information"
 HOMEPAGE = "https://metacpan.org/release/TimeDate"
+DESCRIPTION = "This is the perl5 TimeDate distribution. It requires perl version 5.003 or later."
 SECTION = "libs"
 # You can redistribute it and/or modify it under the same terms as Perl itself.
 LICENSE = "Artistic-1.0 | GPL-1.0+"
diff --git a/meta/recipes-extended/quota/quota_4.05.bb b/meta/recipes-extended/quota/quota_4.05.bb
index c5da1e71ed..46ad7352d6 100644
--- a/meta/recipes-extended/quota/quota_4.05.bb
+++ b/meta/recipes-extended/quota/quota_4.05.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Tools for monitoring & limiting user disk usage per filesystem"
 SECTION = "base"
 HOMEPAGE = "http://sourceforge.net/projects/linuxquota/"
+DESCRIPTION = "Tools and patches for the Linux Diskquota system as part of the Linux kernel"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=18136&atid=118136"
 LICENSE = "BSD & GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11c6f820f8fa62a5af71230f \
diff --git a/meta/recipes-extended/sed/sed_4.8.bb b/meta/recipes-extended/sed/sed_4.8.bb
index 39e3a61df5..089bd11a55 100644
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
index f86e5e03c0..7061dc7505 100644
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
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 6e43f5be6f..da81867115 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Socket-based service activation daemon"
 HOMEPAGE = "https://github.com/xinetd-org/xinetd"
+DESCRIPTION = "xinetd is a powerful replacement for inetd, xinetd has access control mechanisms, extensive logging capabilities, the ability to make services available based on time, can place limits on the number of servers that can be started, and has deployable defence mechanisms to protect against port scanners, among other things."
 
 # xinetd is a BSD-like license
 # Apple and Gentoo say BSD here.
diff --git a/meta/recipes-extended/xz/xz_5.2.4.bb b/meta/recipes-extended/xz/xz_5.2.4.bb
index 1c4450a9e9..67a6cbd569 100644
--- a/meta/recipes-extended/xz/xz_5.2.4.bb
+++ b/meta/recipes-extended/xz/xz_5.2.4.bb
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
2.25.1

