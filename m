Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C32570362
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 08:54:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6G8s75v029625
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 01:54:07 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 16 Jul 2014 01:54:06 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jul 2014 16:52:05 +0800
Message-ID: <e70aea1a246702133e2c15276c987141f337e8b1.1405500691.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1405500691.git.Chong.Lu@windriver.com>
References: <cover.1405500691.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] diffstat: update to version 1.59
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
X-List-Received-Date: Wed, 16 Jul 2014 08:54:06 -0000
Content-Type: text/plain

Remove unneeded patches, since they're included in new version.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../diffstat/diffstat/aclocal-popen.patch          | 20 ------------
 .../diffstat/diffstat/aclocal.patch                | 38 ----------------------
 .../diffstat/diffstat/dirfix.patch                 | 27 ---------------
 .../{diffstat_1.58.bb => diffstat_1.59.bb}         |  7 ++--
 4 files changed, 2 insertions(+), 90 deletions(-)
 delete mode 100644 meta/recipes-devtools/diffstat/diffstat/aclocal-popen.patch
 delete mode 100644 meta/recipes-devtools/diffstat/diffstat/aclocal.patch
 delete mode 100644 meta/recipes-devtools/diffstat/diffstat/dirfix.patch
 rename meta/recipes-devtools/diffstat/{diffstat_1.58.bb => diffstat_1.59.bb} (75%)

diff --git a/meta/recipes-devtools/diffstat/diffstat/aclocal-popen.patch b/meta/recipes-devtools/diffstat/diffstat/aclocal-popen.patch
deleted file mode 100644
index d95561b..0000000
--- a/meta/recipes-devtools/diffstat/diffstat/aclocal-popen.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Add a description to the HAVE_POPEN_PROTOTYPE AC_DEFINE so that this define is
-included in config.h.
-
-Upstream-Status: Submitted (via email)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-
-diff --git a/aclocal.m4 b/aclocal.m4
-index 3f20573..ec5ca51 100644
---- a/aclocal.m4
-+++ b/aclocal.m4
-@@ -931,7 +931,7 @@ ac_cv_td_popen=no,
- ac_cv_td_popen=yes))
- AC_MSG_RESULT($ac_cv_td_popen)
- if test $ac_cv_td_popen = yes; then
--	AC_DEFINE(HAVE_POPEN_PROTOTYPE)
-+	AC_DEFINE(HAVE_POPEN_PROTOTYPE,[1],[Conflicting popen prototype])
- fi
- ])dnl
- dnl ---------------------------------------------------------------------------
diff --git a/meta/recipes-devtools/diffstat/diffstat/aclocal.patch b/meta/recipes-devtools/diffstat/diffstat/aclocal.patch
deleted file mode 100644
index cde4a40..0000000
--- a/meta/recipes-devtools/diffstat/diffstat/aclocal.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Use the correct macro name (AC_AUTOCONF_VERSION) in the CF_ACVERSION_CHECK macro.
-The original macro name (AC_ACVERSION) leads to this error:
-
-| autoreconf: running: aclocal --system-acdir=/poky/buildnew/tmp/work/i586-poky-linux/diffstat/1.57-r0/build/aclocal-copy/ --automake-acdir=/poky/buildnew/tmp/sysroots/x86_64-linux/usr/share/aclocal-1.12 --force
-| aclocal: warning: autoconf input should be named 'configure.ac', not 'configure.in'
-| configure.in:9: error: m4_defn: undefined macro: AC_ACVERSION
-| acinclude.m4:989: CF_PROG_CC is expanded from...
-| configure.in:9: the top level
-| autom4te: m4 failed with exit status: 1
-
-Upstream-Status: Submitted (via email)
-Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
-
-Index: diffstat-1.58/aclocal.m4
-===================================================================
---- diffstat-1.58.orig/aclocal.m4	2013-10-29 01:43:23.000000000 +0200
-+++ diffstat-1.58/aclocal.m4	2013-11-04 11:22:53.461562567 +0200
-@@ -13,16 +13,16 @@
- dnl Conditionally generate script according to whether we're using a given autoconf.
- dnl
- dnl $1 = version to compare against
--dnl $2 = code to use if AC_ACVERSION is at least as high as $1.
--dnl $3 = code to use if AC_ACVERSION is older than $1.
-+dnl $2 = code to use if AC_AUTOCONF_VERSION is at least as high as $1.
-+dnl $3 = code to use if AC_AUTOCONF_VERSION is older than $1.
- define([CF_ACVERSION_CHECK],
- [
- ifdef([AC_ACVERSION], ,[m4_copy([m4_PACKAGE_VERSION],[AC_ACVERSION])])dnl
- ifdef([m4_version_compare],
--[m4_if(m4_version_compare(m4_defn([AC_ACVERSION]), [$1]), -1, [$3], [$2])],
-+[m4_if(m4_version_compare(m4_defn([AC_AUTOCONF_VERSION]), [$1]), -1, [$3], [$2])],
- [CF_ACVERSION_COMPARE(
- AC_PREREQ_CANON(AC_PREREQ_SPLIT([$1])),
--AC_PREREQ_CANON(AC_PREREQ_SPLIT(AC_ACVERSION)), AC_ACVERSION, [$2], [$3])])])dnl
-+AC_PREREQ_CANON(AC_PREREQ_SPLIT(AC_AUTOCONF_VERSION)), AC_AUTOCONF_VERSION, [$2], [$3])])])dnl
- dnl ---------------------------------------------------------------------------
- dnl CF_ACVERSION_COMPARE version: 3 updated: 2012/10/03 18:39:53
- dnl --------------------
diff --git a/meta/recipes-devtools/diffstat/diffstat/dirfix.patch b/meta/recipes-devtools/diffstat/diffstat/dirfix.patch
deleted file mode 100644
index 15dbf2b..0000000
--- a/meta/recipes-devtools/diffstat/diffstat/dirfix.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-$libdir isn't used by the Makefile at all apart from in this mkdir.
-This will be used without any DESTDIR so if your libdir is a different
-layout to the bulid system it will cause a failure. E.g:
-
-Build system has /usr/lib only
-libdir = /usr/lib64 for the target
-Results in "mkdir: cannot create directory `/usr/lib64': Permission denied"
-
-Since the directory is never used, we can just remove the mkdir.
-
-Upstream-Status: Submitted (via email)
-
-RP 23/9/2011
-
-Index: diffstat-1.54/makefile.in
-===================================================================
---- diffstat-1.54.orig/makefile.in	2011-09-22 19:13:11.330158571 +0100
-+++ diffstat-1.54/makefile.in	2011-09-22 19:13:35.610158363 +0100
-@@ -79,7 +79,7 @@
- 	$(INSTALL_DATA) $(srcdir)/$(THIS).1 $(man1dir)/$(THIS).$(manext)
- 
- installdirs :
--	mkdir -p $(BINDIR) $(libdir) $(man1dir)
-+	mkdir -p $(BINDIR) $(man1dir)
- 
- uninstall :
- 	rm -f $(BINDIR)/$(PROG) $(man1dir)/$(THIS).$(manext)
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.58.bb b/meta/recipes-devtools/diffstat/diffstat_1.59.bb
similarity index 75%
rename from meta/recipes-devtools/diffstat/diffstat_1.58.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.59.bb
index 15fb423..f599622 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.58.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.59.bb
@@ -8,14 +8,11 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://install-sh;endline=42;md5=b3549726c1022bee09c174c72a0ca4a5"
 
 SRC_URI = "ftp://invisible-island.net/diffstat/diffstat-${PV}.tgz \
-           file://dirfix.patch \
-           file://aclocal.patch \
-           file://aclocal-popen.patch \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "6d6e13f7dcfe4db5da65c5175260ea47"
-SRC_URI[sha256sum] = "fad5135199c3b9aea132c5d45874248f4ce0ff35f61abb8d03c3b90258713793"
+SRC_URI[md5sum] = "1dc7bc48ce846a0686a1af0d091ff8fb"
+SRC_URI[sha256sum] = "267d1441b8889cbefbb7ca7dfd4a17f6c8bc73bc114904c74ecad945a3dbf270"
 
 S = "${WORKDIR}/diffstat-${PV}"
 
-- 
1.9.1


