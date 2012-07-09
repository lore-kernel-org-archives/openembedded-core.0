Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SoGyu-00041S-Tz
	for Openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:38:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 09:27:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175108538"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2012 09:27:30 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 09:26:09 -0700
Message-Id: <3e4fdfcdb5e25c79caa1ea4a6021994c7b07c03d.1341850982.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <8d1d42a68d5930bc374b9d6126cc1371a22a37db.1341850982.git.nitin.a.kamble@intel.com>
References: <8d1d42a68d5930bc374b9d6126cc1371a22a37db.1341850982.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1341850982.git.nitin.a.kamble@intel.com>
References: <cover.1341850982.git.nitin.a.kamble@intel.com>
Subject: [PATCH 08/15] evolution-data-server: fix build with automake 1.12.x
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
X-List-Received-Date: Mon, 09 Jul 2012 16:38:41 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Added 2 patches:
   avoid_automake_errors.patch
   fix_for_automake-1.12.x.patch

More information in the patch headers.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../avoid_automake_errors.patch                    |   83 ++++++++++++++++++++
 .../fix_for_automake-1.12.x.patch                  |   28 +++++++
 meta/recipes-sato/eds/evolution-data-server_git.bb |    4 +-
 3 files changed, 114 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-sato/eds/evolution-data-server/avoid_automake_errors.patch
 create mode 100644 meta/recipes-sato/eds/evolution-data-server/fix_for_automake-1.12.x.patch

diff --git a/meta/recipes-sato/eds/evolution-data-server/avoid_automake_errors.patch b/meta/recipes-sato/eds/evolution-data-server/avoid_automake_errors.patch
new file mode 100644
index 0000000..ebf00c3
--- /dev/null
+++ b/meta/recipes-sato/eds/evolution-data-server/avoid_automake_errors.patch
@@ -0,0 +1,83 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Avoid these warning-errors
+
+automake: warnings are treated as errors
+Makefile.am:15: warning: '%'-style pattern rules are a GNU make extension
+Makefile.am:21: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
+addressbook/backends/file/Makefile.am: installing './depcomp'
+addressbook/libebook/Makefile.am:55: warning: '%'-style pattern rules are a GNU make extension
+addressbook/libebook/Makefile.am:65: warning: '%'-style pattern rules are a GNU make extension
+addressbook/libebook/Makefile.am:66: warning: subst -,_,$*: non-POSIX variable name
+addressbook/libebook/Makefile.am:66: (probably a GNU make extension)
+addressbook/libebook/Makefile.am:72: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
+addressbook/libedata-book/Makefile.am:2: warning: '%'-style pattern rules are a GNU make extension
+addressbook/libedata-book/Makefile.am:3: warning: subst -,_,$*: non-POSIX variable name
+addressbook/libedata-book/Makefile.am:3: (probably a GNU make extension)
+glib-gen.mak:9: warning: '%'-style pattern rules are a GNU make extension
+addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
+glib-gen.mak:13: warning: '%'-style pattern rules are a GNU make extension
+addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
+glib-gen.mak:18: warning: '%'-style pattern rules are a GNU make extension
+addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
+glib-gen.mak:26: warning: '%'-style pattern rules are a GNU make extension
+addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
+glib-gen.mak:38: warning: '%'-style pattern rules are a GNU make extension
+addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
+glib-gen.mak:41: warning: '%'-style pattern rules are a GNU make extension
+addressbook/libedata-book/Makefile.am:5:   'glib-gen.mak' included from here
+addressbook/libedata-book/Makefile.am:86: warning: '%'-style pattern rules are a GNU make extension
+addressbook/libedata-book/Makefile.am:101: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
+calendar/backends/weather/Makefile.am:44: warning: '%'-style pattern rules are a GNU make extension
+calendar/libecal/Makefile.am:53: warning: '%'-style pattern rules are a GNU make extension
+calendar/libecal/Makefile.am:61: warning: '%'-style pattern rules are a GNU make extension
+calendar/libecal/Makefile.am:62: warning: subst -,_,$*: non-POSIX variable name
+calendar/libecal/Makefile.am:62: (probably a GNU make extension) calendar/libecal/Makefile.am:68: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
+calendar/libedata-cal/Makefile.am:5: warning: '%'-style pattern rules are a GNU make extension
+calendar/libedata-cal/Makefile.am:6: warning: subst -,_,$*: non-POSIX variable name
+calendar/libedata-cal/Makefile.am:6: (probably a GNU make extension)
+glib-gen.mak:9: warning: '%'-style pattern rules are a GNU make extension
+calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
+glib-gen.mak:13: warning: '%'-style pattern rules are a GNU make extension
+calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
+glib-gen.mak:18: warning: '%'-style pattern rules are a GNU make extension
+calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
+glib-gen.mak:26: warning: '%'-style pattern rules are a GNU make extension
+calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
+glib-gen.mak:38: warning: '%'-style pattern rules are a GNU make extension
+calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
+glib-gen.mak:41: warning: '%'-style pattern rules are a GNU make extension
+calendar/libedata-cal/Makefile.am:8:   'glib-gen.mak' included from here
+calendar/libedata-cal/Makefile.am:71: warning: '%'-style pattern rules are a GNU make extension
+calendar/libedata-cal/Makefile.am:86: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
+camel/Makefile.am:17: warning: '%'-style pattern rules are a GNU make extension
+libebackend/Makefile.am:35: warning: '%'-style pattern rules are a GNU make extension
+libebackend/Makefile.am:41: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
+libedataserver/Makefile.am:91: warning: '%'-style pattern rules are a GNU make extension
+libedataserver/Makefile.am:97: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
+libedataserverui/Makefile.am:108: warning: '%'-style pattern rules are a GNU make extension
+libedataserverui/Makefile.am:118: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
+servers/google/libgdata-google/Makefile.am:27: warning: '%'-style pattern rules are a GNU make extension
+servers/google/libgdata-google/Makefile.am:33: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
+servers/google/libgdata/Makefile.am:31: warning: '%'-style pattern rules are a GNU make extension
+servers/google/libgdata/Makefile.am:37: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
+servers/groupwise/Makefile.am:85: warning: '%'-style pattern rules are a GNU make extension
+servers/groupwise/Makefile.am:91: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
+autoreconf: automake failed with exit status: 1
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/07/09
+
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -21,7 +21,7 @@ m4_define([api_version], [1.2])
+ dnl Autoconf / Automake Initialization
+ AC_PREREQ(2.58)
+ AC_INIT([evolution-data-server],[eds_version],[http://bugzilla.gnome.org/enter_bug.cgi?product=Evolution-Data-Server])
+-AM_INIT_AUTOMAKE([gnu 1.9 tar-ustar -Wall -Werror foreign])
++AM_INIT_AUTOMAKE([gnu 1.9 tar-ustar -Wall foreign])
+ AC_CONFIG_MACRO_DIR([m4])
+ AC_CONFIG_SRCDIR(README)
+ AC_CONFIG_HEADERS(config.h)
diff --git a/meta/recipes-sato/eds/evolution-data-server/fix_for_automake-1.12.x.patch b/meta/recipes-sato/eds/evolution-data-server/fix_for_automake-1.12.x.patch
new file mode 100644
index 0000000..ac77a6d
--- /dev/null
+++ b/meta/recipes-sato/eds/evolution-data-server/fix_for_automake-1.12.x.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Pending
+
+Fixed these kinds if warning-errors
+
+warning: 'libebookbackendfile.la': linking libtool libraries using a non-POSIX archiver requires 'AM_PROG_AR' in 'configure.ac'
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/07/09
+
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -17,6 +17,7 @@ dnl This number is meaningless, but we'r
+ dnl library names for backward compatibility.
+ m4_define([api_version], [1.2])
+ 
++
+ dnl Autoconf / Automake Initialization
+ AC_PREREQ(2.58)
+ AC_INIT([evolution-data-server],[eds_version],[http://bugzilla.gnome.org/enter_bug.cgi?product=Evolution-Data-Server])
+@@ -30,6 +31,7 @@ AC_LANG(C)
+ 
+ dnl Automake 1.11 - Silent Build Rules
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
++m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
+ 
+ dnl Required Package Versions
+ m4_define([glib_minimum_version], [2.16.1])
diff --git a/meta/recipes-sato/eds/evolution-data-server_git.bb b/meta/recipes-sato/eds/evolution-data-server_git.bb
index 1d675dc..5e8adbc 100644
--- a/meta/recipes-sato/eds/evolution-data-server_git.bb
+++ b/meta/recipes-sato/eds/evolution-data-server_git.bb
@@ -12,7 +12,7 @@ DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libi
 
 SRCREV = "7337d11aed576e7caaa12b4e881ad8d33668799f"
 PV = "2.30+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
            file://oh-contact.patch;striplevel=0 \
@@ -21,6 +21,8 @@ SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
            file://new-contact-fix.patch \
            file://old-gdk-api.patch \
            file://depbuildfix.patch \
+           file://fix_for_automake-1.12.x.patch \
+           file://avoid_automake_errors.patch \
            file://iconv-detect.h"
 
 S = "${WORKDIR}/git"
-- 
1.7.3.4



