Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.6193.1604890614029569187
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 18:56:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iDBUEYRE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.196, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f196.google.com with SMTP id w6so1178980pfu.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 18:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=402lYr7uzW/7ENGTSjptxKcTs0MAflicHtoiP0wPeeY=;
        b=iDBUEYREjqJ7Y9UGvmRxV3VlgWqJBZCNHAsKq3B7uYxSfEEf+4+95C4WEwezCdPvE6
         IWCLLEsp6r4P0qA35/4W5SPCNgNkMAOleY1U1oyOVf+qqeX75PXUfpzJzAxY5vqX+X2R
         UnW24nAaBGfqE8Lmj7uo7fmnsdd4/MVkoTWRO2iEBei0LRlZh5bFuxUGUlvIQWxawl5n
         gDbhrPDrBsM5vvOhmxa5faZbvA8pGsIqA70q95v2K+sBGrbf3pked1+6h0bz3kRVX0LQ
         673Yr3G8bCEXt+qv96STuHulrqm8/vgFLlidDbg3FZCcIRlLClAoAmYMBF4UzLWn51TS
         ZIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=402lYr7uzW/7ENGTSjptxKcTs0MAflicHtoiP0wPeeY=;
        b=VSonC7TjOTfdsbP6VwydQIcQBR7tb6oZduGlJwi1XQeU1TrZTdVM3cnUScvn07+124
         1HV5JrMbGaB8NS0x9HFmcfF2QKP/fwsUtEBD0pqctUAvMMPvvWXbcjC1xcqJ/2V5pYBM
         M5Yhylq0+St63dTESrsZ6XmATBkVIQw8Ms/L8uh2CMSHB+j0GZ9pAlf8xdds7WlfjY5O
         MTF5K+2FHxBTVdlefWKOR0tovvifManeWoXZcBhKrvGIfnMWdmtoyar+51LF660ZxXMd
         1gVqzPrMl1bli5sxRWTyQuvSPNxFAZXz7mBF6UgFNxk0RJEf1wX9+nwBEYWC/jkTdBPe
         +kOQ==
X-Gm-Message-State: AOAM530B0sZkhuyB7m6ATXIrYrh/XQGtJkbdmFJXO/gzZPYSDVeTBlTK
	GL8PAeB4H7dbIjNVndiarW2JkZZBjgiQ5Nfb
X-Google-Smtp-Source: ABdhPJxoleYqKAuI4zYaCUt0f/SRXytYFIuri5xNI8J9dkecfzP+Dk2igr33Wc2VP1uxu+6Gsqz7IA==
X-Received: by 2002:a63:4383:: with SMTP id q125mr11299238pga.30.1604890612793;
        Sun, 08 Nov 2020 18:56:52 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s4sm9107037pjp.17.2020.11.08.18.56.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 18:56:52 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/12] meta: fix some unresponsive homepages and bugtracker links
Date: Sun,  8 Nov 2020 16:56:08 -1000
Message-Id: <3ac10faff7ef00f68031400e86a6882ce0d5090a.1604890441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604890441.git.steve@sakoman.com>
References: <cover.1604890441.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>

remove some extra whitespaces

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 32ce3716761165b9df12306249418645724122cc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/v86d/v86d_0.1.10.bb                         | 2 +-
 meta/recipes-connectivity/bind/bind_9.11.22.bb               | 2 +-
 meta/recipes-connectivity/iw/iw_5.4.bb                       | 2 +-
 meta/recipes-core/readline/readline.inc                      | 2 +-
 meta/recipes-core/util-linux/util-linux.inc                  | 4 ++--
 meta/recipes-devtools/chrpath/chrpath_0.16.bb                | 3 +--
 meta/recipes-devtools/ninja/ninja_1.10.0.bb                  | 2 +-
 meta/recipes-extended/lsb/lsb-release_1.4.bb                 | 2 +-
 meta/recipes-extended/minicom/minicom_2.7.1.bb               | 2 +-
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb                | 2 +-
 meta/recipes-extended/which/which_2.21.bb                    | 2 +-
 meta/recipes-gnome/gnome/gconf_3.2.6.bb                      | 2 +-
 meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb                   | 3 +--
 meta/recipes-kernel/kmod/kmod.inc                            | 2 +-
 .../wireless-regdb/wireless-regdb_2020.04.29.bb              | 2 +-
 meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb         | 4 ++--
 meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb   | 2 +-
 meta/recipes-support/atk/atk_2.34.1.bb                       | 5 ++---
 meta/recipes-support/bash-completion/bash-completion_2.10.bb | 4 ++--
 meta/recipes-support/npth/npth_1.6.bb                        | 4 ++--
 20 files changed, 25 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 84e27d2007..a8df80fdd6 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -1,5 +1,5 @@
 SUMMARY = "User support binary for the uvesafb kernel module"
-HOMEPAGE = "http://dev.gentoo.org/~spock/projects/uvesafb/"
+HOMEPAGE = "https://tracker.debian.org/pkg/v86d"
 
 # the copyright info is at the bottom of README, expect break
 LICENSE = "GPLv2"
diff --git a/meta/recipes-connectivity/bind/bind_9.11.22.bb b/meta/recipes-connectivity/bind/bind_9.11.22.bb
index 7128bd3870..3b4a299b36 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.22.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.22.bb
@@ -1,5 +1,5 @@
 SUMMARY = "ISC Internet Domain Name Server"
-HOMEPAGE = "http://www.isc.org/sw/bind/"
+HOMEPAGE = "https://www.isc.org/bind/"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
diff --git a/meta/recipes-connectivity/iw/iw_5.4.bb b/meta/recipes-connectivity/iw/iw_5.4.bb
index 9f58e49709..96879a9689 100644
--- a/meta/recipes-connectivity/iw/iw_5.4.bb
+++ b/meta/recipes-connectivity/iw/iw_5.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "nl80211 based CLI configuration utility for wireless devices"
 DESCRIPTION = "iw is a new nl80211 based CLI configuration utility for \
 wireless devices. It supports almost all new drivers that have been added \
 to the kernel recently. "
-HOMEPAGE = "http://wireless.kernel.org/en/users/Documentation/iw"
+HOMEPAGE = "https://wireless.wiki.kernel.org/en/users/documentation/iw"
 SECTION = "base"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 052e2d5f3d..039ffdee00 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -4,7 +4,7 @@ command lines as they are typed in. Both Emacs and vi editing modes are availabl
 additional functions to maintain a list of previously-entered command lines, to recall and perhaps reedit those   \
 lines, and perform csh-like history expansion on previous commands."
 SECTION = "libs"
-HOMEPAGE = "https://cnswww.cns.cwru.edu/php/chet/readline/rltop.html"
+HOMEPAGE = "https://tiswww.case.edu/php/chet/readline/rltop.html"
 
 # GPLv2+ (< 6.0), GPLv3+ (>= 6.0)
 LICENSE = "GPLv3+"
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 248dfc1b6e..0e85603d9a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -1,5 +1,5 @@
 SUMMARY = "A suite of basic system administration utilities"
-HOMEPAGE = "http://userweb.kernel.org/~kzak/util-linux/"
+HOMEPAGE = "https://en.wikipedia.org/wiki/Util-linux"
 DESCRIPTION = "Util-linux includes a suite of basic system administration utilities \
 commonly found on most Linux systems.  Some of the more important utilities include \
 disk partitioning, kernel message management, filesystem creation, and system login."
@@ -113,7 +113,7 @@ EXTRA_OECONF_append = " --disable-hwclock-gplv3"
 #
 PACKAGECONFIG ?= "pcre2"
 PACKAGECONFIG_class-target ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
-# inherit manpages requires this to be present, however util-linux does not have 
+# inherit manpages requires this to be present, however util-linux does not have
 # configuration options, and installs manpages always
 PACKAGECONFIG[manpages] = ""
 PACKAGECONFIG[pam] = "--enable-su --enable-runuser,--disable-su --disable-runuser, libpam,"
diff --git a/meta/recipes-devtools/chrpath/chrpath_0.16.bb b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
index 8de8850576..f12366b4e8 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.16.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
@@ -2,8 +2,7 @@ SUMMARY = "Tool to edit rpath in ELF binaries"
 DESCRIPTION = "chrpath allows you to change the rpath (where the \
 application looks for libraries) in an application. It does not \
 (yet) allow you to add an rpath if there isn't one already."
-HOMEPAGE = "http://alioth.debian.org/projects/chrpath/"
-BUGTRACKER = "http://alioth.debian.org/tracker/?atid=412807&group_id=31052"
+HOMEPAGE = "https://tracker.debian.org/pkg/chrpath"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
diff --git a/meta/recipes-devtools/ninja/ninja_1.10.0.bb b/meta/recipes-devtools/ninja/ninja_1.10.0.bb
index bdc6365052..ba3398c5d6 100644
--- a/meta/recipes-devtools/ninja/ninja_1.10.0.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.10.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Ninja is a small build system with a focus on speed."
-HOMEPAGE = "http://martine.github.com/ninja/"
+HOMEPAGE = "https://ninja-build.org/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
diff --git a/meta/recipes-extended/lsb/lsb-release_1.4.bb b/meta/recipes-extended/lsb/lsb-release_1.4.bb
index a06cbcf845..3e8f7a13ec 100644
--- a/meta/recipes-extended/lsb/lsb-release_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb-release_1.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "lsb_release support for OpenEmbedded"
 SECTION = "console/utils"
-HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
+HOMEPAGE = "https://sourceforge.net/projects/lsb/files"
 LICENSE = "GPLv2+"
 
 # lsb_release needs getopt
diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb b/meta/recipes-extended/minicom/minicom_2.7.1.bb
index 1e6f1317eb..6c539c553b 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Text-based modem control and terminal emulation program"
-HOMEPAGE = "http://alioth.debian.org/projects/minicom/"
+HOMEPAGE = "https://salsa.debian.org/minicom-team/minicom"
 DESCRIPTION = "Minicom is a text-based modem control and terminal emulation program for Unix-like operating systems"
 SECTION = "console/network"
 DEPENDS = "ncurses virtual/libiconv"
diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
index e321cd2b27..bcdcb7307d 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "PBZIP2 is a parallel implementation of the bzip2 block-sorting \
 file compressor that uses pthreads and achieves near-linear speedup on SMP \
 machines. The output of this version is fully compatible with bzip2 v1.0.2 or \
 newer (ie: anything compressed with pbzip2 can be decompressed with bzip2)."
-HOMEPAGE = "http://compression.ca/pbzip2/"
+HOMEPAGE = "https://launchpad.net/pbzip2/"
 SECTION = "console/utils"
 LICENSE = "bzip2-1.0.6"
 LIC_FILES_CHKSUM = "file://COPYING;md5=398b8832c6f840cfebd20ab2be6a3743"
diff --git a/meta/recipes-extended/which/which_2.21.bb b/meta/recipes-extended/which/which_2.21.bb
index fac0fd3944..fc9185061b 100644
--- a/meta/recipes-extended/which/which_2.21.bb
+++ b/meta/recipes-extended/which/which_2.21.bb
@@ -4,7 +4,7 @@ executables that bash(1) would execute when the passed \
 program names would have been entered on the shell prompt. \
 It does this by using the exact same algorithm as bash."
 SECTION = "libs"
-HOMEPAGE = "http://carlo17.home.xs4all.nl/which/"
+HOMEPAGE = "https://carlowood.github.io/which/"
 
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index b8466d4833..18818d527c 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "GConf is a system for storing application preferences. \
 It is intended for user preferences; not configuration of something like \
 Apache, or arbitrary data storage."
 SECTION = "x11/gnome"
-HOMEPAGE = "https://projects.gnome.org/gconf/"
+HOMEPAGE = "https://gitlab.gnome.org/Archive/gconf"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb
index b508e62741..fb5e69f401 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.32.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Documentation generator for glib-based software"
 DESCRIPTION = "Gtk-doc is a set of scripts that extract specially formatted comments \
                from glib-based software and produce a set of html documentation files from them"
-HOMEPAGE = "http://www.gtk.org/gtk-doc/"
+HOMEPAGE = "https://www.gtk.org/docs/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
@@ -59,4 +59,3 @@ gtkdoc_makefiles_sysroot_preprocess() {
            -e "s|GTKDOC_RUN =.*|GTKDOC_RUN = \$(top_builddir)/gtkdoc-qemuwrapper|" \
            ${SYSROOT_DESTDIR}${datadir}/gtk-doc/data/gtk-doc*make
 }
-
diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 334453838e..5dae30ed88 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -4,7 +4,7 @@
 SUMMARY = "Tools for managing Linux kernel modules"
 DESCRIPTION = "kmod is a set of tools to handle common tasks with Linux kernel modules like \
                insert, remove, list, check properties, resolve dependencies and aliases."
-HOMEPAGE = "http://packages.profusion.mobi/kmod/"
+HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kmod/"
 LICENSE = "GPL-2.0+ & LGPL-2.1+"
 LICENSE_libkmod = "LGPL-2.1+"
 SECTION = "base"
diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
index a5827b9ef0..30d4cb523f 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Wireless Central Regulatory Domain Database"
-HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
+HOMEPAGE = "https://wireless.wiki.kernel.org/en/developers/regulatory/crda"
 SECTION = "net"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb
index 1a3cdc2269..a3641bd5a0 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.6.bb
@@ -2,8 +2,8 @@ SUMMARY = "Ogg Vorbis Audio Codec"
 DESCRIPTION = "Ogg Vorbis is a high-quality lossy audio codec \
 that is free of intellectual property restrictions. libvorbis \
 is the main vorbis codec library."
-HOMEPAGE = "http://www.vorbis.com/"
-BUGTRACKER = "https://trac.xiph.org"
+HOMEPAGE = "https://xiph.org/vorbis/"
+BUGTRACKER = "https://gitlab.xiph.org/xiph/vorbis/-/issues"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=70c7063491d2d9f76a098d62ed5134f1 \
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
index 227fd54b79..d01177f9b9 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Provides a bridge between gconf and xsettings"
-HOMEPAGE = "http://svn.o-hand.com/view/matchbox/trunk/settings-daemon/"
+HOMEPAGE = "https://git.yoctoproject.org/cgit/cgit.cgi/xsettings-daemon/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://xsettings-manager.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
diff --git a/meta/recipes-support/atk/atk_2.34.1.bb b/meta/recipes-support/atk/atk_2.34.1.bb
index 277397c694..741350ffe5 100644
--- a/meta/recipes-support/atk/atk_2.34.1.bb
+++ b/meta/recipes-support/atk/atk_2.34.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Accessibility toolkit for GNOME"
-HOMEPAGE = "http://live.gnome.org/GAP/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
+HOMEPAGE = "https://wiki.gnome.org/Accessibility"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/atk/-/issues"
 SECTION = "x11/libs"
 
 LICENSE = "GPLv2+ & LGPLv2+"
@@ -18,4 +18,3 @@ SRC_URI[archive.md5sum] = "f60bbaf8bdd08b93d98736b54b2fc8e9"
 SRC_URI[archive.sha256sum] = "d4f0e3b3d21265fcf2bc371e117da51c42ede1a71f6db1c834e6976bb20997cb"
 
 BBCLASSEXTEND = "native nativesdk"
-
diff --git a/meta/recipes-support/bash-completion/bash-completion_2.10.bb b/meta/recipes-support/bash-completion/bash-completion_2.10.bb
index 041af7490e..93e7d9dc3c 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.10.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.10.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Programmable Completion for Bash 4"
-HOMEPAGE = "http://bash-completion.alioth.debian.org/"
-BUGTRACKER = "https://alioth.debian.org/projects/bash-completion/"
+HOMEPAGE = "https://github.com/scop/bash-completion"
+BUGTRACKER = "https://github.com/scop/bash-completion/issues"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
diff --git a/meta/recipes-support/npth/npth_1.6.bb b/meta/recipes-support/npth/npth_1.6.bb
index 233e0dc4a4..88484acec3 100644
--- a/meta/recipes-support/npth/npth_1.6.bb
+++ b/meta/recipes-support/npth/npth_1.6.bb
@@ -1,5 +1,5 @@
 SUMMARY = "New GNU Portable Threads library"
-HOMEPAGE = "http://www.gnupg.org/software/pth/"
+HOMEPAGE = "https://www.gnu.org/software/pth/"
 SECTION = "libs"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "\
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "1393abd9adcf0762d34798dc34fdcf4d0d22a8410721e76f1e3afcd1da
 
 BINCONFIG = "${bindir}/npth-config"
 
-inherit autotools binconfig-disabled multilib_header 
+inherit autotools binconfig-disabled multilib_header
 
 FILES_${PN} = "${libdir}/libnpth.so.*"
 FILES_${PN}-dev += "${bindir}/npth-config"
-- 
2.17.1

