Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QPNbC-0007EQ-6h
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 01:34:47 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2011 16:30:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,270,1304319600"; 
   d="scan'208";a="7713926"
Received: from unknown (HELO [10.255.12.84]) ([10.255.12.84])
	by fmsmga002.fm.intel.com with ESMTP; 25 May 2011 16:30:32 -0700
Message-ID: <4DDD9117.7050307@intel.com>
Date: Wed, 25 May 2011 16:30:31 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/5] License Field Cleanup: Non-standard field names
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
X-List-Received-Date: Wed, 25 May 2011 23:34:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


I've cleaned up some odd license fields, fixed some license
names and corrected some incorrect licenses. LICENSE really needs
a pass through by the maintainers as some of the licensing is
incorrect.

Also, every license with Artistic should be gone through and noted as
which version of Artistic.

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
  meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    2 +-
  meta/recipes-core/dbus/dbus-glib.inc               |    2 +-
  meta/recipes-core/dbus/dbus.inc                    |    2 +-
  meta/recipes-core/glib-2.0/glib.inc                |    2 +-
  meta/recipes-core/zlib/zlib_1.2.5.bb               |    2 +-
  meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    2 +-
  meta/recipes-devtools/nasm/nasm_2.07.bb            |    2 +-
  .../python/python-pycairo_1.8.10.bb                |    2 +-
  meta/recipes-devtools/python/python-pyrex_0.9.9.bb |    2 +-
  .../subversion/subversion_1.6.15.bb                |    2 +-
  meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb   |    2 +-
  meta/recipes-devtools/valgrind/valgrind_3.6.1.bb   |    2 +-
  meta/recipes-extended/byacc/byacc.inc              |    2 +-
  meta/recipes-extended/cronie/cronie_1.4.7.bb       |    2 +-
  meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb   |    2 +-
  meta/recipes-extended/mktemp/mktemp_1.7.bb         |    2 +-
  .../recipes-extended/tzcode/tzcode-native_2009r.bb |    2 +-
  meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    2 +-
  meta/recipes-graphics/cairo/cairo.inc              |    2 +-
  .../fontconfig/fontconfig_2.8.0.bb                 |    2 +-
  meta/recipes-graphics/fstests/fstests_svn.bb       |    2 +-
  .../ttf-fonts/ttf-bitstream-vera_1.10.bb           |    2 +-
  meta/recipes-graphics/xorg-font/encodings_1.0.4.bb |    2 +-
  .../xorg-font/xorg-minimal-fonts.bb                |    2 +-
  meta/recipes-graphics/xorg-lib/libxpm_3.5.9.bb     |    2 +-
  meta/recipes-graphics/xorg-lib/pixman_0.20.2.bb    |    2 +-
  meta/recipes-multimedia/libpng/libpng_1.2.44.bb    |    2 +-
  .../pulseaudio/libatomics-ops_1.2.bb               |    2 +-
  meta/recipes-sato/libical/libical_0.46.bb          |    2 +-
  meta/recipes-support/apr/apr-util_1.3.10.bb        |    2 +-
  meta/recipes-support/apr/apr_1.4.2.bb              |    2 +-
  meta/recipes-support/boost/boost-36.inc            |    2 +-
  meta/recipes-support/boost/boost-jam-native.inc    |    2 +-
  meta/recipes-support/boost/boost_1.44.0.bb         |    2 +-
  meta/recipes-support/db/db_5.1.19.bb               |    2 +-
  meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb       |    2 +-
  meta/recipes-support/libgdbus/libgdbus_git.bb      |    2 +-
  meta/recipes-support/taglib/taglib_1.6.3.bb        |    2 +-
  38 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
index 785eab1..b865afd 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
  HOMEPAGE = "http://samba.org/ppp/"
  BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
  DEPENDS = "libpcap"
-LICENSE = "BSD & GPLv2+ & LGPLv2+ & public domain"
+LICENSE = "BSD & GPLv2+ & LGPLv2+ & PD"
  LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea \
                      file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                      file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index 22bf627..704dc04 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -2,7 +2,7 @@ SUMMARY = "High level language (GLib) binding for D-Bus"
  DESCRIPTION = "GLib bindings for the D-Bus message bus that integrate \
  the D-Bus library with the GLib thread abstraction and main loop."
  HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
-LICENSE = "AFL2.1 | GPLv2+"
+LICENSE = "AFL-2 | GPLv2+"
  LIC_FILES_CHKSUM = "file://COPYING;md5=cf5b3a2f7083750d504333114e738656 \
                      file://dbus/dbus-glib.h;firstline=7;endline=21;md5=833ef01806b4c524fb3678a16300536f"
  SECTION = "base"
diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 1ef0d8f..ea5ec87 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -2,7 +2,7 @@ SUMMARY = "D-Bus message bus"
  DESCRIPTION = "D-Bus is a message bus system, a simple way for applications to talk to one another. In addition to 
interprocess communication, D-Bus helps coordinate process lifecycle; it makes it simple and reliable to code a \"single 
instance\" application or daemon, and to launch applications and daemons on demand when their services are needed."
  HOMEPAGE = "http://dbus.freedesktop.org"
  SECTION = "base"
-LICENSE = "AFL2.1 | GPLv2+"
+LICENSE = "AFL-2 | GPLv2+"
  LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                      file://dbus/dbus.h;firstline=6;endline=20;md5=6eea2e0c7750dd8e620dcb1437312fa5"
  DEPENDS = "expat virtual/libintl virtual/libx11 libsm"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index f015fd3..0488490 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -2,7 +2,7 @@ SUMMARY = "A general-purpose utility library"
  DESCRIPTION = "GLib is a general-purpose utility library, which provides many useful data types, macros, type 
conversions, string utilities, file utilities, a main loop abstraction, and so on."
  # pcre is under BSD;
  # docs/reference/COPYING is with a 'public domai'-like license!
-LICENSE = "LGPLv2+ & BSD & public domain"
+LICENSE = "LGPLv2+ & BSD & PD"
  LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                      file://glib/glib.h;startline=4;endline=17;md5=a4332fe58b076f29d07c9c066d2967b6 \
                      file://gmodule/COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
diff --git a/meta/recipes-core/zlib/zlib_1.2.5.bb b/meta/recipes-core/zlib/zlib_1.2.5.bb
index c9f29cc..f7cfa40 100644
--- a/meta/recipes-core/zlib/zlib_1.2.5.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.5.bb
@@ -4,7 +4,7 @@ library which is used by many different programs."
  HOMEPAGE = "http://zlib.net/"
  SECTION = "libs"
  PRIORITY = "required"
-LICENSE = "zlib"
+LICENSE = "Zlib"
  LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=084e9c30e4e6272c3b057b13c6467f3d"

  DEPENDS = "libtool-cross"
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 115ff9b..2bedc05 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -1,7 +1,7 @@
  DESCRIPTION = "A collection of utilities and DSOs to handle compiled objects."
  HOMEPAGE = "https://fedorahosted.org/elfutils"
  SECTION = "base"
-LICENSE = "GPLv2 with exceptions"
+LICENSE = "(GPLv2 & Exception)"
  LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
                      file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
  DEPENDS = "libtool bzip2 zlib"
diff --git a/meta/recipes-devtools/nasm/nasm_2.07.bb b/meta/recipes-devtools/nasm/nasm_2.07.bb
index a1c0718..69e3b7b 100644
--- a/meta/recipes-devtools/nasm/nasm_2.07.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.07.bb
@@ -1,6 +1,6 @@
  DESCRIPTION = "General-purpose x86 assembler"
  SECTION = "devel"
-LICENSE = "simplifiedBSD"
+LICENSE = "BSD-2-Clause"
  LIC_FILES_CHKSUM = "file://LICENSE;md5=d89d124974e487e5d64da6f1cd8acfbb"
  COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'

diff --git a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb b/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
index 24b3ff2..b76724e 100644
--- a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
+++ b/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Python Bindings for the Cairo canvas library"
  HOMEPAGE = "http://cairographics.org/pycairo"
  BUGTRACKER = "http://bugs.freedesktop.org"
  SECTION = "python-devel"
-LICENSE = "LGPLv2.1 & MPLv1.1"
+LICENSE = "LGPLv2.1 & MPL-1"
  LIC_FILES_CHKSUM = "file://COPYING;md5=f2e071ab72978431b294a0d696327421"
  # cairo >= 1.8.8
  DEPENDS = "cairo"
diff --git a/meta/recipes-devtools/python/python-pyrex_0.9.9.bb b/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
index bba84ce..f14a0e6 100644
--- a/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
+++ b/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
@@ -3,7 +3,7 @@ It's designed to bridge the gap between the nice, high-level, easy-to-use world
  and the messy, low-level world of C."
  SECTION = "devel/python"
  PRIORITY = "optional"
-LICENSE = "Apache License Version 2.0"
+LICENSE = "Apache-2"
  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=771d472f53f933033f57eeee7808e5bd"
  SRCNAME = "Pyrex"
  PR = "ml0"
diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
index de40863..f73bd1e 100644
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The Subversion (svn) client"
  SECTION = "console/network"
  DEPENDS = "apr-util neon"
  RDEPENDS_${PN} = "neon"
-LICENSE = "Apache BSD"
+LICENSE = "Apache-2"
  HOMEPAGE = "http://subversion.tigris.org"

  PR = "r0"
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
index f18dbe2..96b4ce0 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Target Communication Framework"
  HOMEPAGE = "http://dsdp.eclipse.org/dsdp/tm/"
  BUGTRACKER = "https://bugs.eclipse.org/bugs/"

-LICENSE = "EPLv1.0 | EDLv1.0"
+LICENSE = "EPL-1 | EDLv1.0"
  LIC_FILES_CHKSUM = "file://../epl-v10.html;md5=7aa4215a330a0a4f6a1cbf8da1a0879f \
                      file://../agent/edl-v10.html;md5=522a390a83dc186513f0500543ad3679"

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
index 4dbc628..d5dcdd6 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.6.1.bb
@@ -1,7 +1,7 @@
  DESCRIPTION = "Valgrind memory debugger"
  HOMEPAGE = "http://valgrind.org/"
  BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
-LICENSE = "GPLv2+ & BSD & FDLv1.2"
+LICENSE = "GPLv2 & GPLv2+ & BSD"
  LIC_FILES_CHKSUM = "file://COPYING;md5=c46082167a314d785d012a244748d803 \
                      file://include/pub_tool_basics.h;beginline=1;endline=29;md5=b4765f122b7672cdf9b2e8fd75a33172 \
                      file://include/valgrind.h;beginline=1;endline=56;md5=13a71cedba99112334d8596162aec37e \
diff --git a/meta/recipes-extended/byacc/byacc.inc b/meta/recipes-extended/byacc/byacc.inc
index 28217dc..d1453a8 100644
--- a/meta/recipes-extended/byacc/byacc.inc
+++ b/meta/recipes-extended/byacc/byacc.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "A parser generator utility that reads a grammar specification fro
  parser for it.  The parsers consist of a set of LALR(1) parsing tables and a driver routine written in the C \
  programming language."
  SECTION = "devel"
-LICENSE = "public domain"
+LICENSE = "PD"

  SRC_URI = "ftp://invisible-island.net/byacc/byacc-${PV}.tgz"
  EXTRA_OECONF += "--program-transform-name='s,^,b,'"
diff --git a/meta/recipes-extended/cronie/cronie_1.4.7.bb b/meta/recipes-extended/cronie/cronie_1.4.7.bb
index 6318d0e..992b610 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.7.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.7.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://fedorahosted.org/cronie/"
  BUGTRACKER = "mmaslano@redhat.com"

  # Internet Systems Consortium License
-LICENSE = "ISC license & BSD"
+LICENSE = "ISC & BSD"
  LIC_FILES_CHKSUM = "file://COPYING;md5=963ea0772a2adbdcd607a9b2ec320c11 \
                      file://src/cron.h;endline=20;md5=b425c334265026177128353a142633b4 \
                      file://src/popen.c;beginline=3;endline=31;md5=edd50742d8def712e9472dba353668a9"
diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb b/meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb
index 6cb4f0e..61dab95 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_0.2.1.bb
@@ -4,7 +4,7 @@ SECTION = "libs/network"
  PRIORITY = "optional"
  HOMEPAGE = "http://sourceforge.net/projects/libtirpc/"
  BUGTRACKER = "http://sourceforge.net/tracker/?group_id=183075&atid=903784"
-LICENSE = "Sun Industry Standards Source License 1.0"
+LICENSE = "BSD"
  LIC_FILES_CHKSUM = "file://COPYING;md5=1c32c8e351f97e43e1ad6cf7f62de3bf \
                      file://src/netname.c;beginline=1;endline=27;md5=f8a8cd2cb25ac5aa16767364fb0e3c24"
  PR = "r0"
diff --git a/meta/recipes-extended/mktemp/mktemp_1.7.bb b/meta/recipes-extended/mktemp/mktemp_1.7.bb
index 41ee10c..1d09964 100644
--- a/meta/recipes-extended/mktemp/mktemp_1.7.bb
+++ b/meta/recipes-extended/mktemp/mktemp_1.7.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Allow safe temporary file creation from shell scripts."
  HOMEPAGE = "http://www.mktemp.org/"
  BUGTRACKER = "http://www.mktemp.org/bugs"
  SECTION = "console/utils"
-LICENSE = "ISC style"
+LICENSE = "ISC"
  LIC_FILES_CHKSUM = "file://LICENSE;md5=430680f6322a1eb87199b5e01a82c0d4"

  PR = "r0"
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2009r.bb b/meta/recipes-extended/tzcode/tzcode-native_2009r.bb
index dee8113..886687a 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2009r.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2009r.bb
@@ -1,5 +1,5 @@
  DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
-LICENSE = "Public Domain"
+LICENSE = "PD"
  PR = "r0"

  LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=3ae8198f82258417ce29066d3b034035"
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index 903d080..b541753 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -1,4 +1,4 @@
-LICENSE = "GPL LGPL"
+LICENSE = "GPL & LGPL"
  DEPENDS = "libxml2 libxslt libxslt-native gnome-doc-utils-native"
  DEPENDS_virtclass-native = "libxml2-native libxslt-native intltool-native"

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 9237fad..c388b56 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://cairographics.org"
  BUGTRACKER = "http://bugs.freedesktop.org"
  SECTION = "libs"
  PRIORITY = "optional"
-LICENSE = "MPLv1.1 & LGPLv2.1"
+LICENSE = "MPL-1 & LGPLv2.1"
  DEPENDS = "virtual/libx11 libsm libpng fontconfig libxrender pixman glib-2.0"

  #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
index 3cdfc04..ae0fef5 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
@@ -11,7 +11,7 @@ rasterize fonts."
  HOMEPAGE = "http://www.fontconfig.org"
  BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"

-LICENSE = "MIT-style & MIT & Public Domain"
+LICENSE = "MIT-style & MIT & PD"
  LIC_FILES_CHKSUM = "file://COPYING;md5=f3ad4145dea6ca7efa2f1bee8165a7a1 \
                      file://src/fcfreetype.c;endline=45;md5=bc3dd139e2f7245a02fde5545b203a6f \
                      file://src/fccache.c;beginline=1020;endline=1035;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
diff --git a/meta/recipes-graphics/fstests/fstests_svn.bb b/meta/recipes-graphics/fstests/fstests_svn.bb
index ef70eb3..2ffdc35 100644
--- a/meta/recipes-graphics/fstests/fstests_svn.bb
+++ b/meta/recipes-graphics/fstests/fstests_svn.bb
@@ -1,7 +1,7 @@
  DESCRIPTION = "Various benchmarning tests for X"
  HOMEPAGE = "http://www.o-hand.com"
  SECTION = "devel"
-LICENSE = "ZLIB"
+LICENSE = "Zlib"
  DEPENDS = "pango libxext libxft virtual/libx11 gtk+"

  SRCREV = "426"
diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb 
b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index 9a1f5bb..957350b 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -6,7 +6,7 @@ serif faces for you: this loses hinting and distorts the faces slightly, \
  but is visibly different than normal and bold, and reasonably pleasing."
  SECTION = "x11/fonts"
  PRIORITY = "optional"
-LICENSE = "Bitstream Vera"
+LICENSE = "Bitstream_Vera"
  LIC_FILES_CHKSUM = "file://COPYRIGHT.TXT;md5=27d7484b1e18d0ee4ce538644a3f04be"
  PACKAGE_ARCH = "all"
  PR = "r3"
diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb b/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb
index 897f0fa..04d7c73 100644
--- a/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb
+++ b/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "The encodings that map to specific characters for a \
  number of Xorg and common fonts."

  require xorg-font-common.inc
-LICENSE = "Public Domain"
+LICENSE = "PD"
  LIC_FILES_CHKSUM = "file://COPYING;md5=9da93f2daf2d5572faa2bfaf0dbd9e76"
  PE = "1"
  PR = "${INC_PR}.0"
diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index 86d6194..f1e8648 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "n/a"

  SECTION = "x11/fonts"

-LICENSE = "Public Domain"
+LICENSE = "PD"
  LIC_FILES_CHKSUM = "file://../misc/fonts.alias;md5=bbe8d3c0e4e74af96e3ac393985c4fbb \
                      file://../misc/fonts.dir;md5=82a143d94d6a974aafe97132d2d519ab \
                      file://../misc/cursor.pcf.gz;md5=40bc81001fef4c21ca08df4305014a2a"
diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.9.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.9.bb
index a4b3c0d..5d4297e 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.9.bb
@@ -7,7 +7,7 @@ pixmap format, which is commonly used in legacy X applications.  XPM is \
  an extension of the monochrome XBM bitmap specificied in the X \
  protocol."

-LICENSE = "X-BSD"
+LICENSE = "BSD"
  LIC_FILES_CHKSUM = "file://COPYING;md5=3e07763d16963c3af12db271a31abaa5"
  DEPENDS += "libxext libsm libxt"
  PR = "r3"
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.20.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.20.2.bb
index 9a97c3d..00a58bf 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.20.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.20.2.bb
@@ -7,7 +7,7 @@ including trapezoids, triangles, and rectangles."

  require xorg-lib-common.inc

-LICENSE = "MIT & MIT-style & Public Domain"
+LICENSE = "MIT & MIT-style & PD"
  LIC_FILES_CHKSUM = "file://COPYING;md5=fea989a44fb012b5e79584972a863d22 \
                      file://pixman/pixman-matrix.c;endline=25;md5=ba6e8769bfaaee2c41698755af04c4be \
                      file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.44.bb b/meta/recipes-multimedia/libpng/libpng_1.2.44.bb
index 4a8d5c3..79131f6 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.2.44.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.2.44.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "PNG Library"
  HOMEPAGE = "http://www.libpng.org/"
  SECTION = "libs"
  PRIORITY = "required"
-LICENSE = "libpng"
+LICENSE = "Libpng"
  LIC_FILES_CHKSUM = "file://LICENSE;md5=a294a2bb08b7f25558119edbfd6b2e92 \
                      file://png.h;startline=172;endline=261;md5=3253923f0093658f470e52a06ddcf4e7"
  DEPENDS = "zlib"
diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb 
b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
index 79f4517..05b22e8 100644
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "A library for atomic integer operations"
  DESCRIPTION = "A library for atomic integer operations"
  HOMEPAGE = "http://www.hpl.hp.com/research/linux/atomic_ops/"
  SECTION = "optional"
-LICENSE = "GPLv2&MIT"
+LICENSE = "GPLv2 & MIT"
  LIC_FILES_CHKSUM = "file://doc/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                      file://doc/LICENSING.txt;md5=607073e04548eac7d1f763e480477bab \
  		   "
diff --git a/meta/recipes-sato/libical/libical_0.46.bb b/meta/recipes-sato/libical/libical_0.46.bb
index e88e449..6ad5d35 100644
--- a/meta/recipes-sato/libical/libical_0.46.bb
+++ b/meta/recipes-sato/libical/libical_0.46.bb
@@ -1,7 +1,7 @@
  DESCRIPTION = "iCal and scheduling (RFC 2445, 2446, 2447) library"
  HOMEPAGE = "http://sourceforge.net/projects/freeassociation/"
  BUGTRACKER = "http://sourceforge.net/tracker/?group_id=16077&atid=116077"
-LICENSE = "LGPLv2.1 | MPLv1.1"
+LICENSE = "LGPLv2.1 | MPL-1"
  LIC_FILES_CHKSUM = "file://COPYING;md5=35da21efce2b9f0ca07524c9f844e6ed \
  			file://LICENSE;md5=35da21efce2b9f0ca07524c9f844e6ed"
  SECTION = "libs"
diff --git a/meta/recipes-support/apr/apr-util_1.3.10.bb b/meta/recipes-support/apr/apr-util_1.3.10.bb
index 930f757..7071b90 100644
--- a/meta/recipes-support/apr/apr-util_1.3.10.bb
+++ b/meta/recipes-support/apr/apr-util_1.3.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://apr.apache.org/"
  SECTION = "libs"
  DEPENDS = "apr expat gdbm"

-LICENSE = "Apache License, Version 2.0"
+LICENSE = "Apache-2.0"
  LIC_FILES_CHKSUM = "file://LICENSE;md5=519e0a18e03f7c023070568c14b077bb \
                      file://include/apu_version.h;endline=17;md5=806685a84e71f10c80144c48eb35df42"

diff --git a/meta/recipes-support/apr/apr_1.4.2.bb b/meta/recipes-support/apr/apr_1.4.2.bb
index ce26ef1..89bdadf 100644
--- a/meta/recipes-support/apr/apr_1.4.2.bb
+++ b/meta/recipes-support/apr/apr_1.4.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Apache Portable Runtime (APR) library"
  HOMEPAGE = "http://apr.apache.org/"
  SECTION = "libs"

-LICENSE = "Apache License, Version 2.0"
+LICENSE = "Apache-2.0"
  LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
                      file://include/apr_lib.h;endline=17;md5=ee42fa7575dc40580a9e01c1b75fae96"

diff --git a/meta/recipes-support/boost/boost-36.inc b/meta/recipes-support/boost/boost-36.inc
index 5d2d128..3adc3ed 100644
--- a/meta/recipes-support/boost/boost-36.inc
+++ b/meta/recipes-support/boost/boost-36.inc
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.boost.org/"
  SECTION = "libs"
  DEPENDS = "boost-jam-native zlib"
  PRIORITY = "optional"
-LICENSE = "Boost Software License"
+LICENSE = "Boost"
  PR = "r3"

  ARM_INSTRUCTION_SET = "arm"
diff --git a/meta/recipes-support/boost/boost-jam-native.inc b/meta/recipes-support/boost/boost-jam-native.inc
index f0fac09..fbaef1a 100644
--- a/meta/recipes-support/boost/boost-jam-native.inc
+++ b/meta/recipes-support/boost/boost-jam-native.inc
@@ -7,7 +7,7 @@ DESCRIPTION = "Make system for boost (native)"
  HOMEPAGE = "http://www.boost.org/"
  SECTION = "devel"
  PRIORITY = "optional"
-LICENSE = "Boost Software License"
+LICENSE = "Boost"
  PR = "r0"

  LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
diff --git a/meta/recipes-support/boost/boost_1.44.0.bb b/meta/recipes-support/boost/boost_1.44.0.bb
index aa8b324..722149d 100644
--- a/meta/recipes-support/boost/boost_1.44.0.bb
+++ b/meta/recipes-support/boost/boost_1.44.0.bb
@@ -1,6 +1,6 @@
  include boost-36.inc

-LICENSE = "boost"
+LICENSE = "Boost"
  LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"

  PR = "r0"
diff --git a/meta/recipes-support/db/db_5.1.19.bb b/meta/recipes-support/db/db_5.1.19.bb
index 7b7c4dd..98b23b1 100644
--- a/meta/recipes-support/db/db_5.1.19.bb
+++ b/meta/recipes-support/db/db_5.1.19.bb
@@ -11,7 +11,7 @@
  SECTION = "libs"
  DESCRIPTION = "Berkeley DB v5."
  HOMEPAGE = "http://www.oracle.com/technology/products/berkeley-db/db/index.html"
-LICENSE = "BSD Sleepycat"
+LICENSE = "Sleepycat"
  VIRTUAL_NAME ?= "virtual/db"
  CONFLICTS = "db3"
  PR = "r2"
diff --git a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb b/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
index e56ba26..a4423ab 100644
--- a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
+++ b/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.mozilla.org/js/spidermonkey/"
  SECTION = "libs"

  # the package is licensed under either of the following
-LICENSE = "MPL1.1 | GPLv2+ | LGPLv2.1+"
+LICENSE = "MPL-1 | GPLv2+ | LGPLv2.1+"
  LIC_FILES_CHKSUM = "file://jsapi.c;beginline=4;endline=39;md5=347c6bbf4fb4547de1fa5ad830030063"
  PR = "r2"

diff --git a/meta/recipes-support/libgdbus/libgdbus_git.bb b/meta/recipes-support/libgdbus/libgdbus_git.bb
index 76fa134..bd91436 100644
--- a/meta/recipes-support/libgdbus/libgdbus_git.bb
+++ b/meta/recipes-support/libgdbus/libgdbus_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Library for simple D-Bus integration with GLib"
  HOMEPAGE = "http://www.bluez.org"
  SECTION = "libs"
  PRIORITY = "optional"
-LICENSE = "GPLv2&LGPLv2.1"
+LICENSE = "GPLv2 & LGPLv2.1"
  LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                      file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09"

diff --git a/meta/recipes-support/taglib/taglib_1.6.3.bb b/meta/recipes-support/taglib/taglib_1.6.3.bb
index f45108b..63b965c 100644
--- a/meta/recipes-support/taglib/taglib_1.6.3.bb
+++ b/meta/recipes-support/taglib/taglib_1.6.3.bb
@@ -1,7 +1,7 @@
  DESCRIPTION = "TagLib is a library for reading and editing the meta-data of several popular audio formats"
  SECTION = "libs/multimedia"
  HOMEPAGE = "http://developer.kde.org/~wheeler/taglib.html"
-LICENSE = "LGPLv2.1 | MPLv1.1"
+LICENSE = "LGPLv2.1 | MPL-1"
  LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=db979804f025cf55aabec7129cb671ed \
                      file://COPYING.MPL;md5=bfe1f75d606912a4111c90743d6c7325 \
                      file://taglib/audioproperties.h;beginline=1;endline=24;md5=39dcdd772f378a0f8c9a41bc929eccce"
-- 
1.7.1


