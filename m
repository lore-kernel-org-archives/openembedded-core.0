Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web12.2768.1615661462920062963
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:51:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=In/N0Omt;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.180, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f180.google.com with SMTP id u62so14608498oib.6
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/O1SED/Z71wPzNT+Q/65PAhDol8nl6JgkZ4F8w4Q3VY=;
        b=In/N0OmtSz330/m46M3IhOs9V6kVUUy1+djmdTpksZqXQYvokZu6bULo451GTjBjZm
         O/PlElQ0yXXogVjeWVqvG+mjt9vrhxSuz7dRKitIpZKHjsGBS1gIEpWC3+uNuYjZAkbj
         OmK3dJsY50CzWu+5yzyPzJUYPqwmL8A8dd4oHLy8KwtRTNM26+RcOSvljE9M2cwGCUNa
         b5aJyXbOOPKoSYer0J3wTKvVGEh3OnmeI+P6B/FE+oyfkhzK98J3WCAqP0Q4RL+ONdnL
         OB+bi3031aMmzh03WK59jE3EmG2BQ+lhJn+zKXkkobVT87Ue1zGP4ed5cp6b9PYY7mH9
         RbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/O1SED/Z71wPzNT+Q/65PAhDol8nl6JgkZ4F8w4Q3VY=;
        b=ey8n9mjQnIIoiXwr8PYmIUxUHlIgg7KUFwWt/v445LyvZkYPeSALwOHbXONysDWMuq
         ZeH9Hiw6IZVlQlDTTutv6YpErXM+YveY7bghvZdGcqN87c24nAhINGjVzATyPHDLNsio
         C8W5dEK08S2Rky78g+PtRUANirl2ecKctYmVk004ltyAuQ9AZqlJqNnc9dXmFo/gVj0R
         MYjRgXk7/PgqOiUWj/nS5sTxLKvEoQGMbrDtHjsUO1xP40nDT1i6AKwV5iPLtHSnZwGm
         x6YTTMj/Buax/AuOGYHI61dWhJPxNcSORC6X6/mHoupll2K+3nYNWNvGTq6P0vwjO1Cy
         iTAw==
X-Gm-Message-State: AOAM531qgKs1nqblKrMT4agTdawBUXqZKgYNqJHFPhrbJjM1kSG4nJ82
	KzBEYWkiKK4ADgyRoCEtiBHvOP+CRFmzd4T9
X-Google-Smtp-Source: ABdhPJy5k4v9fJ/y4glSU8kdaHXcO5kLVsX2HF5AsrFSziqXGZugEjcsczgGqmTSHv02ceoVLqF5Fg==
X-Received: by 2002:aca:211a:: with SMTP id 26mr13445923oiz.157.1615661459919;
        Sat, 13 Mar 2021 10:50:59 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.50.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:50:59 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/38] recipes-support: Add missing HOMEPAGE and DESCRIPTION for recipes
Date: Sat, 13 Mar 2021 08:49:02 -1000
Message-Id: <54e0df20665be8df9d8961d8c4e716e38104ba16.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Meh Mbeh Ida Delphine <idadelm@gmail.com>

Fixes: [YOCTO #13471]

Signed-off-by: Ida Delphine <idadelm@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6db24928d62aeb093a0e6da6619713eaca57a96f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/apr/apr_1.7.0.bb               |  8 ++++----
 .../argp-standalone/argp-standalone_1.3.bb          |  1 +
 meta/recipes-support/aspell/aspell_0.60.8.bb        | 13 +++++++++----
 meta/recipes-support/atk/at-spi2-atk_2.34.1.bb      |  2 ++
 meta/recipes-support/atk/at-spi2-core_2.34.0.bb     |  6 ++++--
 meta/recipes-support/atk/atk_2.34.1.bb              |  1 +
 meta/recipes-support/attr/acl_2.2.53.bb             |  5 ++++-
 meta/recipes-support/attr/attr.inc                  |  6 ++----
 .../bash-completion/bash-completion_2.10.bb         |  7 +++++--
 meta/recipes-support/boost/boost.inc                |  4 ++++
 meta/recipes-support/consolekit/consolekit_0.4.6.bb |  2 ++
 meta/recipes-support/curl/curl_7.69.1.bb            |  4 ++++
 meta/recipes-support/db/db_5.3.28.bb                |  1 +
 .../debianutils/debianutils_4.9.1.bb                |  5 +++++
 meta/recipes-support/diffoscope/diffoscope_136.bb   |  5 +++++
 meta/recipes-support/enchant/enchant2_2.2.8.bb      |  3 +++
 meta/recipes-support/fribidi/fribidi_1.0.9.bb       |  6 ++++++
 meta/recipes-support/gdbm/gdbm_1.18.1.bb            |  3 +++
 .../gnome-desktop-testing_2018.1.bb                 |  4 ++++
 meta/recipes-support/gnupg/gnupg_2.2.20.bb          |  5 +++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb        |  4 +++-
 meta/recipes-support/gnutls/libtasn1_4.16.0.bb      |  2 ++
 meta/recipes-support/iso-codes/iso-codes_4.4.bb     |  3 +++
 meta/recipes-support/itstool/itstool_2.0.6.bb       |  4 ++++
 meta/recipes-support/libassuan/libassuan_2.5.3.bb   |  3 +++
 .../libatomic-ops/libatomic-ops_7.6.10.bb           |  1 +
 meta/recipes-support/libcap/libcap_2.32.bb          |  4 +++-
 meta/recipes-support/libcheck/libcheck_0.14.0.bb    |  5 +++++
 meta/recipes-support/libcroco/libcroco_0.6.13.bb    |  3 +++
 meta/recipes-support/libdaemon/libdaemon_0.14.bb    |  4 ++++
 meta/recipes-support/libevdev/libevdev_1.8.0.bb     |  3 +++
 meta/recipes-support/libevent/libevent_2.1.11.bb    |  5 +++++
 meta/recipes-support/libexif/libexif_0.6.22.bb      |  3 +++
 meta/recipes-support/libfm/libfm-extra_1.3.1.bb     |  1 +
 meta/recipes-support/libfm/libfm_1.3.1.bb           |  2 ++
 meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb   |  3 +++
 .../libgpg-error/libgpg-error_1.37.bb               |  1 +
 meta/recipes-support/libical/libical_3.0.7.bb       |  4 ++++
 meta/recipes-support/libksba/libksba_1.3.5.bb       |  5 +++++
 meta/recipes-support/libnl/libnl_3.5.0.bb           |  5 +++++
 meta/recipes-support/libproxy/libproxy_0.4.15.bb    |  4 ++++
 meta/recipes-support/libpsl/libpsl_0.21.0.bb        |  6 ++++++
 meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb  |  2 ++
 meta/recipes-support/liburcu/liburcu_0.11.1.bb      |  3 +++
 meta/recipes-support/libusb/libusb1_1.0.22.bb       |  2 ++
 meta/recipes-support/libxslt/libxslt_1.1.34.bb      |  5 +++++
 meta/recipes-support/lzo/lzo_2.10.bb                |  2 ++
 meta/recipes-support/mpfr/mpfr_4.0.2.bb             |  1 +
 meta/recipes-support/nettle/nettle_3.5.1.bb         |  1 +
 meta/recipes-support/npth/npth_1.6.bb               |  1 +
 meta/recipes-support/p11-kit/p11-kit_0.23.22.bb     |  2 ++
 meta/recipes-support/popt/popt_1.16.bb              |  1 +
 meta/recipes-support/re2c/re2c_1.0.1.bb             |  4 +++-
 meta/recipes-support/serf/serf_1.3.9.bb             |  4 ++++
 .../shared-mime-info/shared-mime-info_git.bb        |  1 +
 meta/recipes-support/sqlite/sqlite3.inc             |  1 +
 meta/recipes-support/taglib/taglib_1.11.1.bb        |  1 +
 meta/recipes-support/vim/vim.inc                    |  4 ++++
 meta/recipes-support/vte/vte_0.58.3.bb              |  2 ++
 59 files changed, 183 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support/apr/apr_1.7.0.bb
index c9b9bf0f50..432fa3255c 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Apache Portable Runtime (APR) library"
-DESCRIPTION = "The Apache Portable Runtime (APR) is a supporting library for the \
-Apache web server. It provides a set of APIs that map to the underlying \
-operating system (OS). Where the OS does not support a particular function, \
-APR will provide an emulation."
+
+DESCRIPTION = "Create and maintain software libraries that provide a predictable \
+and consistent interface to underlying platform-specific implementations."
+
 HOMEPAGE = "http://apr.apache.org/"
 SECTION = "libs"
 DEPENDS = "util-linux"
diff --git a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
index 21bbcab3d3..d1db562bb5 100644
--- a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
+++ b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
@@ -2,6 +2,7 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 
 SUMMARY = "Glibc hierarchical argument parsing standalone library"
+DESCRIPTION = "Standalone version of arguments parsing functions from GLIBC"
 HOMEPAGE = "http://www.lysator.liu.se/~nisse/misc/"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://argp.h;beginline=1;endline=20;md5=008b7e53dea6f9e1d9fdef0d9cf3184a"
diff --git a/meta/recipes-support/aspell/aspell_0.60.8.bb b/meta/recipes-support/aspell/aspell_0.60.8.bb
index f1d931b39c..6548c54b64 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.bb
@@ -1,10 +1,15 @@
 SUMMARY = "GNU Aspell spell-checker"
-DESCRIPTION = "GNU Aspell is a spell-checker which can be used either as a \
-standalone application or embedded in other programs. Its main feature is that \
-it does a much better job of suggesting possible spellings than just about any \
-other spell-checker available for the English language"
+
+DESCRIPTION = "Spell checker designed to eventually replace Ispell. \
+It can either be used as a library or as an independent spell checker. \
+Its main feature is that it does a superior job of suggesting possible \
+replacements for a misspelled word than just about any other spell \
+checker out there for the English language."
+
 SECTION = "console/utils"
 
+HOMEPAGE = "http://aspell.net/"
+
 LICENSE = "LGPLv2 | LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
diff --git a/meta/recipes-support/atk/at-spi2-atk_2.34.1.bb b/meta/recipes-support/atk/at-spi2-atk_2.34.1.bb
index c297912588..ad30617e56 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.34.1.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.34.1.bb
@@ -1,5 +1,7 @@
 SUMMARY = "AT-SPI 2 Toolkit Bridge"
+DESCRIPTION = "Contains a library that bridges ATK to At-Spi2 D-Bus service. Toolkit widgets use it to provide their content to screen readers such as Orca."
 HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
+BUGTRACKER = "http://bugzilla.gnome.org/"
 LICENSE = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
diff --git a/meta/recipes-support/atk/at-spi2-core_2.34.0.bb b/meta/recipes-support/atk/at-spi2-core_2.34.0.bb
index bcef8ef169..2ad09878b7 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.34.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.34.0.bb
@@ -1,7 +1,9 @@
 SUMMARY = "Assistive Technology Service Provider Interface (dbus core)"
-DESCRIPTION = "At-Spi2 is a protocol over DBus, toolkit widgets use it to \
-provide their content to screen readers such as Orca."
+
+DESCRIPTION = "It provides a Service Provider Interface for the Assistive Technologies available on the GNOME platform and a library against which applications can be linked."
+
 HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
+BUGTRACKER = "http://bugzilla.gnome.org/"
 LICENSE = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
diff --git a/meta/recipes-support/atk/atk_2.34.1.bb b/meta/recipes-support/atk/atk_2.34.1.bb
index 741350ffe5..25ef3c6c52 100644
--- a/meta/recipes-support/atk/atk_2.34.1.bb
+++ b/meta/recipes-support/atk/atk_2.34.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Accessibility toolkit for GNOME"
+DESCRIPTION = "Provides application programming interfaces (APIs) for implementing accessibility support in software."
 HOMEPAGE = "https://wiki.gnome.org/Accessibility"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/atk/-/issues"
 SECTION = "x11/libs"
diff --git a/meta/recipes-support/attr/acl_2.2.53.bb b/meta/recipes-support/attr/acl_2.2.53.bb
index b120c1f16f..7cee45948d 100644
--- a/meta/recipes-support/attr/acl_2.2.53.bb
+++ b/meta/recipes-support/attr/acl_2.2.53.bb
@@ -1,7 +1,10 @@
 SUMMARY = "Utilities for managing POSIX Access Control Lists"
-HOMEPAGE = "http://savannah.nongnu.org/projects/acl/"
 DESCRIPTION = "ACL allows you to provide different levels of access to files \
 and folders for different users."
+
+HOMEPAGE = "http://savannah.nongnu.org/projects/acl/"
+BUGTRACKER = "http://savannah.nongnu.org/bugs/?group=acl"
+
 SECTION = "libs"
 
 LICENSE = "LGPLv2.1+ & GPLv2+"
diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index 8515f96bf7..30ba0b4445 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -1,8 +1,6 @@
 SUMMARY = "Utilities for manipulating filesystem extended attributes"
-DESCRIPTION = "A set of tools for manipulating extended attributes on filesystem \
-objects, in particular getfattr(1) and setfattr(1). An attr(1) command \
-is also provided which is largely compatible with the SGI IRIX tool of \
-the same name."
+DESCRIPTION = "Implement the ability for a user to attach name:value pairs to objects within the XFS filesystem."
+
 HOMEPAGE = "http://savannah.nongnu.org/projects/attr/"
 SECTION = "libs"
 
diff --git a/meta/recipes-support/bash-completion/bash-completion_2.10.bb b/meta/recipes-support/bash-completion/bash-completion_2.10.bb
index 58e565dee5..1f99bf7386 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.10.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.10.bb
@@ -1,6 +1,9 @@
 SUMMARY = "Programmable Completion for Bash 4"
-DESCRIPTION = "bash completion extends bash's standard completion behavior to \
-achieve complex command lines with just a few keystrokes."
+DESCRIPTION = "Collection of command line command completions for the Bash shell, \
+collection of helper functions to assist in creating new completions, \
+and set of facilities for loading completions automatically on demand, as well \
+as installing them."
+
 HOMEPAGE = "https://github.com/scop/bash-completion"
 BUGTRACKER = "https://github.com/scop/bash-completion/issues"
 
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 8eb9494381..829e728b6d 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -1,4 +1,8 @@
 SUMMARY = "Free peer-reviewed portable C++ source libraries"
+DESCRIPTION = "Provides free peer-reviewed portable C++ source libraries.  The emphasis is on libraries which work well with the C++ \
+Standard Library.  One goal is to establish 'existing practice' and \
+provide reference implementations so that the Boost libraries are suitable for eventual standardization.  Some of the libraries have already been proposed for inclusion in the C++ Standards Committee's \
+upcoming C++ Standard Library Technical Report."
 SECTION = "libs"
 DEPENDS = "bjam-native zlib bzip2"
 
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 89f2d77b66..22e755747b 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Framework for defining and tracking users, login sessions, and seats"
+DESCRIPTION = "It provides a mechanism for software to react to changes \
+of any of these items or of any of the metadata associated with them."
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/ConsoleKit"
 BUGTRACKER = "https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index c3d629108a..4cc35c2c51 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -1,4 +1,8 @@
 SUMMARY = "Command line tool and library for client-side URL transfers"
+DESCRIPTION = "It uses URL syntax to transfer data to and from servers. \
+curl is a widely used because of its ability to be flexible and complete \
+complex tasks. For example, you can use curl for things like user authentication, \
+HTTP post, SSL connections, proxy support, FTP uploads, and more!"
 HOMEPAGE = "http://curl.haxx.se/"
 BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
 SECTION = "console/network"
diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 318efcb61d..9cb57e6a53 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -10,6 +10,7 @@
 # same system at the same time if really necessary.
 SECTION = "libs"
 SUMMARY = "Berkeley Database v5"
+DESCRIPTION = "Provides the foundational storage services for your application, no matter how demanding and unique your requirements may seem to be"
 HOMEPAGE = "https://www.oracle.com/database/technologies/related/berkeleydb.html"
 LICENSE = "Sleepycat"
 RCONFLICTS_${PN} = "db3"
diff --git a/meta/recipes-support/debianutils/debianutils_4.9.1.bb b/meta/recipes-support/debianutils/debianutils_4.9.1.bb
index 904c52780f..8603fecbd0 100644
--- a/meta/recipes-support/debianutils/debianutils_4.9.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.9.1.bb
@@ -1,4 +1,9 @@
 SUMMARY = "Miscellaneous utilities specific to Debian"
+DESCRIPTION = "Provides a number of small utilities which are used \
+primarily by the installation scripts of Debian packages, although \
+you may use them directly. "
+HOMEPAGE = "https://packages.debian.org/sid/debianutils"
+BUGTRACKER = "https://bugs.debian.org/cgi-bin/pkgreport.cgi?pkg=debianutils;dist=unstable"
 SECTION = "base"
 LICENSE = "GPLv2 & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=f01a5203d50512fc4830b4332b696a9f"
diff --git a/meta/recipes-support/diffoscope/diffoscope_136.bb b/meta/recipes-support/diffoscope/diffoscope_136.bb
index 3e3e1dfc00..e699d15e90 100644
--- a/meta/recipes-support/diffoscope/diffoscope_136.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_136.bb
@@ -1,5 +1,10 @@
 SUMMARY = "in-depth comparison of files, archives, and directories"
+DESCRIPTION = "Tries to get to the bottom of what makes files or directories \
+different. It will recursively unpack archives of many kinds and transform \
+various binary formats into more human-readable form to compare them. \
+It can compare two tarballs, ISO images, or PDF just as easily."
 HOMEPAGE = "https://diffoscope.org/"
+BUGTRACKER = "https://salsa.debian.org/reproducible-builds/diffoscope/-/issues"
 LICENSE = "GPL-3.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
diff --git a/meta/recipes-support/enchant/enchant2_2.2.8.bb b/meta/recipes-support/enchant/enchant2_2.2.8.bb
index 4ddbe55da5..7c624efea3 100644
--- a/meta/recipes-support/enchant/enchant2_2.2.8.bb
+++ b/meta/recipes-support/enchant/enchant2_2.2.8.bb
@@ -1,6 +1,9 @@
 SUMMARY = "Enchant Spell checker API Library"
+DESCRIPTION = "A library (and command-line program) that wraps a number of \
+different spelling libraries and programs with a consistent interface."
 SECTION = "libs"
 HOMEPAGE = "https://abiword.github.io/enchant/"
+BUGTRACKER = "https://github.com/AbiWord/enchant/issues/"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7"
 
diff --git a/meta/recipes-support/fribidi/fribidi_1.0.9.bb b/meta/recipes-support/fribidi/fribidi_1.0.9.bb
index 0654b07dc7..ac9ef88e27 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.9.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.9.bb
@@ -1,5 +1,11 @@
 SUMMARY = "Free Implementation of the Unicode Bidirectional Algorithm"
+DESCRIPTION = "It provides utility functions to aid in the development \
+of interactive editors and widgets that implement BiDi functionality. \
+The BiDi algorithm is a prerequisite for supporting right-to-left scripts such \
+as Hebrew, Arabic, Syriac, and Thaana. "
 SECTION = "libs"
+HOMEPAGE = "http://fribidi.org/"
+BUGTRACKER = "https://github.com/fribidi/fribidi/issues"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
index fbb1fe72d7..bfc9ee8f85 100644
--- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Key/value database library with extensible hashing"
+DESCRIPTION = "Library of database functions that use extensible hashing \
+and work similar to the standard UNIX dbm. These routines are provided \
+to a programmer needing to create and manipulate a hashed database."
 HOMEPAGE = "http://www.gnu.org/software/gdbm/"
 SECTION = "libs"
 LICENSE = "GPLv3"
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb
index 0defebeb15..e5c69c0c46 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb
@@ -1,4 +1,8 @@
 SUMMARY = "Test runner for GNOME-style installed tests"
+DESCRIPTION = "Runner provides an execution harness for GNOME installed tests. \
+These tests are useful for verifying the functionality of software as \
+installed and packaged, and complement rather than replace build-time \
+('make check') tests."
 HOMEPAGE = "https://wiki.gnome.org/GnomeGoals/InstalledTests"
 LICENSE = "LGPLv2+"
 
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.20.bb b/meta/recipes-support/gnupg/gnupg_2.2.20.bb
index f754573c88..6629fc8556 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.20.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.20.bb
@@ -1,4 +1,9 @@
 SUMMARY = "GNU Privacy Guard - encryption and signing tools (2.x)"
+DESCRIPTION = "A complete and free implementation of the OpenPGP standard \
+as defined by RFC4880 (also known as PGP). GnuPG allows you to encrypt \
+and sign your data and communications; it features a versatile key \
+management system, along with access modules for all kinds of public \
+key directories."
 HOMEPAGE = "http://www.gnupg.org/"
 LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=189af8afca6d6075ba6c9e0aa8077626 \
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
index 51578b4b3b..903bb5503a 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -1,5 +1,7 @@
 SUMMARY = "GNU Transport Layer Security Library"
-HOMEPAGE = "http://www.gnu.org/software/gnutls/"
+DESCRIPTION = "a secure communications library implementing the SSL, \
+TLS and DTLS protocols and technologies around them."
+HOMEPAGE = "https://gnutls.org/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
diff --git a/meta/recipes-support/gnutls/libtasn1_4.16.0.bb b/meta/recipes-support/gnutls/libtasn1_4.16.0.bb
index 8337b70241..8d3a14506a 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.16.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.16.0.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Library for ASN.1 and DER manipulation"
+DESCRIPTION = "A highly portable C library that encodes and decodes \
+DER/BER data following an ASN.1 schema. "
 HOMEPAGE = "http://www.gnu.org/software/libtasn1/"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
diff --git a/meta/recipes-support/iso-codes/iso-codes_4.4.bb b/meta/recipes-support/iso-codes/iso-codes_4.4.bb
index 4767dea84c..e3c521c514 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.4.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.4.bb
@@ -1,4 +1,7 @@
 SUMMARY = "ISO language, territory, currency, script codes and their translations"
+DESCRIPTION = "Provides lists of various ISO standards (e.g. country, \
+language, language scripts, and currency names) in one place, rather \
+than repeated in many programs throughout the system."
 HOMEPAGE = "https://salsa.debian.org/iso-codes-team/iso-codes"
 BUGTRACKER = "https://salsa.debian.org/iso-codes-team/iso-codes/issues"
 
diff --git a/meta/recipes-support/itstool/itstool_2.0.6.bb b/meta/recipes-support/itstool/itstool_2.0.6.bb
index 5f358f463d..54105af5f0 100644
--- a/meta/recipes-support/itstool/itstool_2.0.6.bb
+++ b/meta/recipes-support/itstool/itstool_2.0.6.bb
@@ -1,4 +1,8 @@
 SUMMARY = "ITS Tool allows you to translate your XML documents with PO files"
+DESCRIPTION = "It extracts messages from XML files and outputs PO template \
+files, then merges translations from MO files to create translated \
+XML files. It determines what to translate and how to chunk it into \
+messages using the W3C Internationalization Tag Set (ITS). "
 HOMEPAGE = "http://itstool.org/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59c57b95fd7d0e9e238ebbc7ad47c5a5"
diff --git a/meta/recipes-support/libassuan/libassuan_2.5.3.bb b/meta/recipes-support/libassuan/libassuan_2.5.3.bb
index 52b4c0f1b9..9ef5074120 100644
--- a/meta/recipes-support/libassuan/libassuan_2.5.3.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.5.3.bb
@@ -1,4 +1,7 @@
 SUMMARY = "IPC library used by GnuPG and GPGME"
+DESCRIPTION = "A small library implementing the so-called Assuan protocol. \
+This protocol is used for IPC between most newer GnuPG components. \
+Both, server and client side functions are provided. "
 HOMEPAGE = "http://www.gnupg.org/related_software/libassuan/"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 
diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb
index 7628eedb1b..3089d1f7ff 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb
@@ -1,4 +1,5 @@
 SUMMARY = "A library for atomic integer operations"
+DESCRIPTION = "Package provides semi-portable access to hardware-provided atomic memory update operations on a number of architectures."
 HOMEPAGE = "https://github.com/ivmai/libatomic_ops/"
 SECTION = "optional"
 PROVIDES += "libatomics-ops"
diff --git a/meta/recipes-support/libcap/libcap_2.32.bb b/meta/recipes-support/libcap/libcap_2.32.bb
index d78a58f7d2..325fa87a1b 100644
--- a/meta/recipes-support/libcap/libcap_2.32.bb
+++ b/meta/recipes-support/libcap/libcap_2.32.bb
@@ -1,6 +1,8 @@
 SUMMARY = "Library for getting/setting POSIX.1e capabilities"
+DESCRIPTION = "A library providing the API to access POSIX capabilities. \
+These allow giving various kinds of specific privileges to individual \
+users, without giving them full root permissions."
 HOMEPAGE = "http://sites.google.com/site/fullycapable/"
-
 # no specific GPL version required
 LICENSE = "BSD | GPLv2"
 LIC_FILES_CHKSUM = "file://License;md5=3f84fd6f29d453a56514cb7e4ead25f1"
diff --git a/meta/recipes-support/libcheck/libcheck_0.14.0.bb b/meta/recipes-support/libcheck/libcheck_0.14.0.bb
index a88f009cdb..57963d83d4 100644
--- a/meta/recipes-support/libcheck/libcheck_0.14.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.14.0.bb
@@ -1,4 +1,9 @@
 SUMMARY  = "Check - unit testing framework for C code"
+DESCRIPTION = "It features a simple interface for defining unit tests, \
+putting little in the way of the developer. Tests are run in a separate \
+address space, so both assertion failures and code errors that cause \
+segmentation faults or other signals can be caught. Test results are \
+reportable in the following: Subunit, TAP, XML, and a generic logging format."
 HOMEPAGE = "https://libcheck.github.io/check/"
 SECTION = "devel"
 
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
index a443ff23fe..66ee647ffa 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.13.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Cascading Style Sheet (CSS) parsing and manipulation toolkit"
+DESCRIPTION = "The Libcroco project is an effort to build a generic \
+Cascading Style Sheet (CSS) parsing and manipulation toolkit that can be \
+used by GNOME applications in need of CSS support."
 HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta/recipes-support/libdaemon/libdaemon_0.14.bb b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
index 070ee1890e..85a30bcac3 100644
--- a/meta/recipes-support/libdaemon/libdaemon_0.14.bb
+++ b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
@@ -1,4 +1,8 @@
 SUMMARY = "Lightweight C library which eases the writing of UNIX daemons"
+DESCRIPTION = "Lightweight daemon framework for OpenBSD. It provides \
+facilities for logging and a signal handler to enable graceful shutdown, \
+as well as file locking to ensure that only a single copy of a given daemon \
+is running at a time."
 SECTION = "libs"
 AUTHOR = "Lennart Poettering <lennart@poettering.net>"
 HOMEPAGE = "http://0pointer.de/lennart/projects/libdaemon/"
diff --git a/meta/recipes-support/libevdev/libevdev_1.8.0.bb b/meta/recipes-support/libevdev/libevdev_1.8.0.bb
index 3523dc0968..fd7dd15c26 100644
--- a/meta/recipes-support/libevdev/libevdev_1.8.0.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.8.0.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Wrapper library for evdev devices"
+DESCRIPTION = "A library for handling evdev kernel devices. It abstracts \
+the evdev ioctls through type-safe interfaces and provides functions \
+to change the appearance of the device."
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libevdev/"
 SECTION = "libs"
 
diff --git a/meta/recipes-support/libevent/libevent_2.1.11.bb b/meta/recipes-support/libevent/libevent_2.1.11.bb
index fb186eb89f..84e8fe183e 100644
--- a/meta/recipes-support/libevent/libevent_2.1.11.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.11.bb
@@ -1,4 +1,9 @@
 SUMMARY = "An asynchronous event notification library"
+DESCRIPTION = "A software library that provides asynchronous event \
+notification. The libevent API provides a mechanism to execute a callback \
+function when a specific event occurs on a file descriptor or after a \
+timeout has been reached. libevent also supports callbacks triggered \
+by signals and regular timeouts"
 HOMEPAGE = "http://libevent.org/"
 BUGTRACKER = "https://github.com/libevent/libevent/issues"
 SECTION = "libs"
diff --git a/meta/recipes-support/libexif/libexif_0.6.22.bb b/meta/recipes-support/libexif/libexif_0.6.22.bb
index 3b08dc52be..86d4464253 100644
--- a/meta/recipes-support/libexif/libexif_0.6.22.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.22.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Library for reading extended image information (EXIF) from JPEG files"
+DESCRIPTION = "libexif is a library for parsing, editing, and saving EXIF data. It is \
+intended to replace lots of redundant implementations in command-line \
+utilities and programs with GUIs."
 HOMEPAGE = "https://libexif.github.io/"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
diff --git a/meta/recipes-support/libfm/libfm-extra_1.3.1.bb b/meta/recipes-support/libfm/libfm-extra_1.3.1.bb
index 85102a1a3d..8971486715 100644
--- a/meta/recipes-support/libfm/libfm-extra_1.3.1.bb
+++ b/meta/recipes-support/libfm/libfm-extra_1.3.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Library for file management"
+DESCRIPTION = "Contains a library and other files required by menu-cache-gen libexec of menu-cache-1.1.0. "
 HOMEPAGE = "http://pcmanfm.sourceforge.net/"
 
 LICENSE = "LGPLv2+"
diff --git a/meta/recipes-support/libfm/libfm_1.3.1.bb b/meta/recipes-support/libfm/libfm_1.3.1.bb
index 63ae7874b9..b6f9df0c55 100644
--- a/meta/recipes-support/libfm/libfm_1.3.1.bb
+++ b/meta/recipes-support/libfm/libfm_1.3.1.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Library for file management"
+DESCRIPTION = "LibFM provides file management functions built on top of Glib/GIO \
+giving a convenient higher-level API."
 HOMEPAGE = "http://pcmanfm.sourceforge.net/"
 
 LICENSE = "GPLv2+ & LGPLv2+"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
index 9fd3b7c8c9..16a58ad9b8 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
@@ -1,4 +1,7 @@
 SUMMARY = "General purpose cryptographic library based on the code from GnuPG"
+DESCRIPTION = "A cryptography library developed as a separated module of GnuPG. \
+It can also be used independently of GnuPG, but depends on its error-reporting \
+library Libgpg-error."
 HOMEPAGE = "http://directory.fsf.org/project/libgcrypt/"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 SECTION = "libs"
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.37.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.37.bb
index b9a2b01c20..7b7404b516 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.37.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.37.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Small library that defines common error values for all GnuPG components"
+DESCRIPTION = "Contains common error codes and error handling functions used by GnuPG, Libgcrypt, GPGME and more packages. "
 HOMEPAGE = "http://www.gnupg.org/related_software/libgpg-error/"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 
diff --git a/meta/recipes-support/libical/libical_3.0.7.bb b/meta/recipes-support/libical/libical_3.0.7.bb
index a50473e9ec..170f12b7a9 100644
--- a/meta/recipes-support/libical/libical_3.0.7.bb
+++ b/meta/recipes-support/libical/libical_3.0.7.bb
@@ -1,4 +1,8 @@
 SUMMARY = "iCal and scheduling (RFC 2445, 2446, 2447) library"
+DESCRIPTION = "An Open Source implementation of the iCalendar protocols \
+and protocol data units. The iCalendar specification describes how \
+calendar clients can communicate with calendar servers so users can store \
+their calendar data and arrange meetings with other users. "
 HOMEPAGE = "https://github.com/libical/libical"
 BUGTRACKER = "https://github.com/libical/libical/issues"
 LICENSE = "LGPLv2.1 | MPL-2.0"
diff --git a/meta/recipes-support/libksba/libksba_1.3.5.bb b/meta/recipes-support/libksba/libksba_1.3.5.bb
index 336d7f8177..7f9ab4f5fc 100644
--- a/meta/recipes-support/libksba/libksba_1.3.5.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.5.bb
@@ -1,4 +1,9 @@
 SUMMARY = "Easy API to create and parse X.509 and CMS related objects"
+DESCRIPTION = "A library to make the tasks of working with X.509 certificates, \
+CMS data and related objects more easy. It provides a highlevel interface to \
+the implemented protocols and presents the data in a consistent way. The \
+library does not rely on another cryptographic library but provides \
+hooks for easy integration with Libgcrypt. "
 HOMEPAGE = "http://www.gnupg.org/related_software/libksba/"
 LICENSE = "GPLv3+ & (GPLv2+ | LGPLv3+)"
 LICENSE_${PN} = "GPLv2+ | LGPLv3+"
diff --git a/meta/recipes-support/libnl/libnl_3.5.0.bb b/meta/recipes-support/libnl/libnl_3.5.0.bb
index 9d0e1441a9..f4b5d40bb2 100644
--- a/meta/recipes-support/libnl/libnl_3.5.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.5.0.bb
@@ -1,4 +1,9 @@
 SUMMARY = "A library for applications dealing with netlink sockets"
+DESCRIPTION = "The libnl suite is a collection of libraries providing \
+APIs to netlink protocol based Linux kernel interfaces. libnl is the core \
+library implementing the fundamentals required to use the netlink protocol \
+such as socket handling, message construction and parsing, and sending \
+and receiving of data."
 HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
 SECTION = "libs/network"
 
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.15.bb b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
index 6f704d7a91..6c7d5a68a1 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.15.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
@@ -1,4 +1,8 @@
 SUMMARY = "Library providing automatic proxy configuration management"
+DESCRIPTION = "libproxy  provides  interfaces  to  get  the proxy that will be \
+used to access network resources. It uses various plugins to get proxy \
+configuration  via different mechanisms (e.g. environment variables or \
+desktop settings)."
 HOMEPAGE = "https://github.com/libproxy/libproxy"
 BUGTRACKER = "https://github.com/libproxy/libproxy/issues"
 SECTION = "libs"
diff --git a/meta/recipes-support/libpsl/libpsl_0.21.0.bb b/meta/recipes-support/libpsl/libpsl_0.21.0.bb
index 9831b4b94f..b2dda191ce 100644
--- a/meta/recipes-support/libpsl/libpsl_0.21.0.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.21.0.bb
@@ -1,4 +1,10 @@
 SUMMARY = "Public Suffix List library"
+DESCRIPTION = "The libpsl package provides a library for accessing and \
+resolving information from the Public Suffix List (PSL). The PSL is a set of \
+domain names beyond the standard suffixes, such as .com."
+
+HOMEPAGE = "https://rockdaboot.github.io/libpsl/"
+BUGTRACKER = "https://github.com/rockdaboot/libpsl/issues"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5437030d9e4fbe7267ced058ddb8a7f5 \
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb
index f984a06aba..65b32557e7 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.68.4.bb
@@ -1,4 +1,6 @@
 SUMMARY = "An HTTP library implementation in C"
+DESCRIPTION = "libsoup is an HTTP client/server library for GNOME. It uses GObjects \
+and the glib main loop, to integrate well with GNOME applications."
 HOMEPAGE = "https://wiki.gnome.org/Projects/libsoup"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "x11/gnome/libs"
diff --git a/meta/recipes-support/liburcu/liburcu_0.11.1.bb b/meta/recipes-support/liburcu/liburcu_0.11.1.bb
index 6a517e6f29..1902415c90 100644
--- a/meta/recipes-support/liburcu/liburcu_0.11.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.11.1.bb
@@ -1,4 +1,7 @@
 SUMMARY = "Userspace RCU (read-copy-update) library"
+DESCRIPTION = "A userspace RCU (read-copy-update) library. This data \
+synchronization library provides read-side access which scales linearly \
+with the number of cores. "
 HOMEPAGE = "http://lttng.org/urcu"
 BUGTRACKER = "http://lttng.org/project/issues"
 
diff --git a/meta/recipes-support/libusb/libusb1_1.0.22.bb b/meta/recipes-support/libusb/libusb1_1.0.22.bb
index 1d9d772575..a4fe4de2cb 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.22.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.22.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Userspace library to access USB (version 1.0)"
+DESCRIPTION = "A cross-platform library to access USB devices from Linux, \
+macOS, Windows, OpenBSD/NetBSD, Haiku and Solaris userspace."
 HOMEPAGE = "http://libusb.sf.net"
 BUGTRACKER = "http://www.libusb.org/report"
 SECTION = "libs"
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.34.bb b/meta/recipes-support/libxslt/libxslt_1.1.34.bb
index 1961bb5b31..63cce6fe06 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.34.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.34.bb
@@ -1,4 +1,9 @@
 SUMMARY = "GNOME XSLT library"
+DESCRIPTION = "libxslt is the XSLT C parser and toolkit developed for the Gnome project. \
+XSLT itself is a an XML language to define transformation for XML. Libxslt is based on \
+libxml2 the XML C library developed for the GNOME project. It also implements most of \
+the EXSLT set of processor-portable extensions functions and some of Saxon's evaluate \
+and expressions extensions."
 HOMEPAGE = "http://xmlsoft.org/XSLT/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta/recipes-support/lzo/lzo_2.10.bb b/meta/recipes-support/lzo/lzo_2.10.bb
index 8eefec3cc9..85b14b3c5c 100644
--- a/meta/recipes-support/lzo/lzo_2.10.bb
+++ b/meta/recipes-support/lzo/lzo_2.10.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Lossless data compression library"
+DESCRIPTION = "A portable lossless data compression library written in \
+ANSI C that offers pretty fast compression and *extremely* fast decompression. "
 HOMEPAGE = "http://www.oberhumer.com/opensource/lzo/"
 SECTION = "libs"
 LICENSE = "GPLv2+"
diff --git a/meta/recipes-support/mpfr/mpfr_4.0.2.bb b/meta/recipes-support/mpfr/mpfr_4.0.2.bb
index 00c2dc2fe9..0ac73f031f 100644
--- a/meta/recipes-support/mpfr/mpfr_4.0.2.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.0.2.bb
@@ -1,4 +1,5 @@
 SUMMARY = "C library for multiple-precision floating-point computations with exact rounding"
+DESCRIPTION = "The GNU Multiple Precision Floating-Point Reliable Library (GNU MPFR) is a GNU portable C library for arbitrary-precision binary floating-point computation with correct rounding, based on GNU Multi-Precision Library. MPFR's computation is both efficient and has a well-defined semantics: the functions are completely specified on all the possible operands and the results do not depend on the platform."
 HOMEPAGE = "https://www.mpfr.org/"
 LICENSE = "LGPLv3+"
 SECTION = "devel"
diff --git a/meta/recipes-support/nettle/nettle_3.5.1.bb b/meta/recipes-support/nettle/nettle_3.5.1.bb
index a9550ed033..b2ec24b36c 100644
--- a/meta/recipes-support/nettle/nettle_3.5.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.5.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "A low level cryptographic library"
+DESCRIPTION = "Nettle is a cryptographic library that is designed to fit easily in more or less any context: In crypto toolkits for object-oriented languages (C++, Python, Pike, ...), in applications like LSH or GNUPG, or even in kernel space."
 HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
 DESCRIPTION = "It tries to solve a problem of providing a common set of \
 cryptographic algorithms for higher-level applications by implementing a \
diff --git a/meta/recipes-support/npth/npth_1.6.bb b/meta/recipes-support/npth/npth_1.6.bb
index 88484acec3..94a3f00eac 100644
--- a/meta/recipes-support/npth/npth_1.6.bb
+++ b/meta/recipes-support/npth/npth_1.6.bb
@@ -1,4 +1,5 @@
 SUMMARY = "New GNU Portable Threads library"
+DESCRIPTION = "nPth is a library to provide the GNU Pth API and thus a non-preemptive threads implementation. "
 HOMEPAGE = "https://www.gnu.org/software/pth/"
 SECTION = "libs"
 LICENSE = "LGPLv2+"
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
index c539ecdbc6..623afccb5e 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Provides a way to load and enumerate PKCS#11 modules"
+DESCRIPTION = " Provides a standard configuration setup for installing PKCS#11 modules in such a way that they're discoverable. Also solves problems with coordinating the use of PKCS#11 by different components or libraries living in the same process."
+HOMEPAGE = "https://p11-glue.github.io/p11-glue/p11-kit.html"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=02933887f609807fbb57aa4237d14a50"
 
diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
index 27e49c2ca2..0c0392d036 100644
--- a/meta/recipes-support/popt/popt_1.16.bb
+++ b/meta/recipes-support/popt/popt_1.16.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Library for parsing command line options"
+DESCRIPTION = "Popt is a C library for parsing command line parameters. Popt was heavily influenced by the getopt() and getopt_long() functions, but it improves on them by allowing more powerful argument expansion. Popt can parse arbitrary argv[] style arrays and automatically set variables based on command line arguments."
 HOMEPAGE = "http://rpm5.org/"
 SECTION = "libs"
 
diff --git a/meta/recipes-support/re2c/re2c_1.0.1.bb b/meta/recipes-support/re2c/re2c_1.0.1.bb
index 35200ecde8..faeb496a1a 100644
--- a/meta/recipes-support/re2c/re2c_1.0.1.bb
+++ b/meta/recipes-support/re2c/re2c_1.0.1.bb
@@ -1,5 +1,7 @@
 SUMMARY = "Tool for writing very fast and very flexible scanners"
-HOMEPAGE = "http://re2c.sourceforge.net/"
+DESCRIPTION = "A free and open-source lexer generator for C, C++ and Go. It compiles regular expressions to determinisitic finite automata and encodes the automata in the form of a program in the target language. Unlike any other such tool, re2c focuses on generating high efficient code for regular expression matching. As a result this allows a much broader range of use than any traditional lexer."
+HOMEPAGE = "http://re2c.org/"
+BUGTRACKER = "https://github.com/skvadrik/re2c/issues"
 AUTHOR = "Marcus Börger <helly@users.sourceforge.net>"
 SECTION = "devel"
 LICENSE = "PD"
diff --git a/meta/recipes-support/serf/serf_1.3.9.bb b/meta/recipes-support/serf/serf_1.3.9.bb
index 2fbf96f997..dc917fa166 100644
--- a/meta/recipes-support/serf/serf_1.3.9.bb
+++ b/meta/recipes-support/serf/serf_1.3.9.bb
@@ -1,4 +1,8 @@
 SUMMARY = "High-Performance Asynchronous HTTP Client Library"
+DESCRIPTION = "The Apache Serf library is a C-based HTTP client library built upon the Apache \
+Portable Runtime (APR) library. It multiplexes connections, running the \
+read/write communication asynchronously. Memory copies and transformations are \
+kept to a minimum to provide high performance operation."
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://norpath.patch \
            file://env.patch \
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index 7a060b09ad..6b3ebf1cdc 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Shared MIME type database and specification"
+DESCRIPTION = "The shared-mime-info package contains the core database of common types and the update-mime-database command used to extend it. It requires glib2 to be installed for building the update command. Additionally, it uses intltool for translations, though this is only a dependency for the maintainers."
 HOMEPAGE = "http://freedesktop.org/wiki/Software/shared-mime-info"
 SECTION = "base"
 
diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 07614bdb3e..1adc0eba66 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -1,4 +1,5 @@
 SUMMARY = "Embeddable SQL database engine"
+DESCRIPTION = "A library that implements a small, fast, self-contained, high-reliability, full-featured, SQL database engine. SQLite is the most used database engine in the world. SQLite is built into all mobile phones and most computers and comes bundled inside countless other applications that people use every day"
 HOMEPAGE = "http://www.sqlite.org"
 SECTION = "libs"
 
diff --git a/meta/recipes-support/taglib/taglib_1.11.1.bb b/meta/recipes-support/taglib/taglib_1.11.1.bb
index f4e288295d..165bccadc1 100644
--- a/meta/recipes-support/taglib/taglib_1.11.1.bb
+++ b/meta/recipes-support/taglib/taglib_1.11.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Library for reading and editing the meta-data of popular audio formats"
+DESCRIPTION = "Platform-independent library (tested on Windows/Linux) for reading and writing metadata in media files, including video, audio, and photo formats. This is a convenient one-stop-shop to present or tag all your media collection, regardless of which format/container these might use. You can read/write the standard or more common tags/properties of a media, or you can also create and retrieve your own custom tags."
 SECTION = "libs/multimedia"
 HOMEPAGE = "http://taglib.github.io/"
 LICENSE = "LGPLv2.1 | MPL-1.1"
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index d57f784da5..878d0f18ae 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -1,6 +1,10 @@
 SUMMARY = "Vi IMproved - enhanced vi editor"
+DESCRIPTION = "Vim is a greatly improved version of the good old UNIX editor Vi. Many new features have been added: multi-level undo, syntax highlighting, command line history, on-line help, spell checking, filename completion, block operations, script language, etc. There is also a Graphical User Interface (GUI) available."
 SECTION = "console/utils"
 
+HOMEPAGE = "https://www.vim.org/"
+BUGTRACKER = "https://github.com/vim/vim/issues"
+
 DEPENDS = "ncurses gettext-native"
 # vimdiff doesn't like busybox diff
 RSUGGESTS_${PN} = "diffutils"
diff --git a/meta/recipes-support/vte/vte_0.58.3.bb b/meta/recipes-support/vte/vte_0.58.3.bb
index 41dc2e77c9..50724700e8 100644
--- a/meta/recipes-support/vte/vte_0.58.3.bb
+++ b/meta/recipes-support/vte/vte_0.58.3.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Virtual terminal emulator GTK+ widget library"
+DESCRIPTION = "VTE provides a virtual terminal widget for GTK applications."
+HOMEPAGE = "https://wiki.gnome.org/Apps/Terminal/VTE"
 BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
 LICENSE = "GPLv3 & LGPLv3+ & LGPLv2.1+"
 LICENSE_libvte = "LGPLv3+"
-- 
2.25.1

