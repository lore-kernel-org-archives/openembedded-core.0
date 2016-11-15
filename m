Return-Path: <thilo.cestonaro@ts.fujitsu.com>
Received: from mail1.bemta5.messagelabs.com (mail1.bemta5.messagelabs.com
	[195.245.231.148])
	by mail.openembedded.org (Postfix) with ESMTP id C8C4760102
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 13:49:59 +0000 (UTC)
Received: from [85.158.136.83] by server-12.bemta-5.messagelabs.com id
	18/7B-27365-7821B285; Tue, 15 Nov 2016 13:49:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDLMWRWlGSWpSXmKPExsViZ8MRotsupB1
	h0LyY3+LOz3fsDowe5zauYAxgjGLNzEvKr0hgzfh18yBjweqUil3fX7A3MG6L6mLk4hASuMgo
	serBCxYIp5tR4sKpm4xdjBwcbAJmEt/WF4KYIgI6Em8+eoGYzAImEk9X+3UxcnIIC+hKzO/ay
	ApiswioSnz+0c0OYvMKOEv0PN7NBmJLCMhLLDx/hGkCI+cCRoZVjBrFqUVlqUW6RuZ6SUWZ6R
	kluYmZObqGBqZ6uanFxYnpqTmJScV6yfm5mxiBvqpnYGDcwXh1i98hRkkOJiVR3tkC2hFCfEn
	5KZUZicUZ8UWlOanFhxhlODiUJHibBIFygkWp6akVaZk5wKCBSUtw8CiJ8G4ASfMWFyTmFmem
	Q6ROMSpKifNuAkkIgCQySvPg2mCBeolRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO9BkCk8m
	XklcNNfAS1mAlq8y1wDZHFJIkJKqoHR1OeY6tzAqFl7n1/qSW+5r3D4UDDX1MkbXRini/JePd
	57Ve6oTc7razMC5m16tT3686GPzxOcREryqjfuql1y6knKosfu2Qddr7C/eHPEscCBn19kr+u
	Ng6kGSdObT17zkJkvPGNmhbCVzSLeR3eW3zmiIehsdM5+3rGMip078++deFW+0fmvlhJLcUai
	oRZzUXEiAC4/7nlPAgAA
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-5.tower-36.messagelabs.com!1479217799!63232274!1
X-Originating-IP: [62.60.8.84]
X-StarScan-Received: 
X-StarScan-Version: 9.0.16; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20797 invoked from network); 15 Nov 2016 13:49:59 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
	by server-5.tower-36.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 15 Nov 2016 13:49:59 -0000
Received: from abgdgate50u.abg.fsc.net ([172.25.138.66])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id
	uAFDnhLn013737 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 13:49:52 GMT
Received: from unknown (HELO abg4858n-lnx.CSOD.local) ([10.172.228.10])
	by abgdgate50u.abg.fsc.net with ESMTP; 15 Nov 2016 14:49:49 +0100
From: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 14:46:07 +0100
Message-Id: <20161115134607.13337-1-thilo.cestonaro@ts.fujitsu.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] added recipe for libdbus-c++
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
X-List-Received-Date: Tue, 15 Nov 2016 13:50:01 -0000

Signed-off-by: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
---
 .../fix-missing-unistd.h-include.patch             |  12 +
 .../remove-CXX_FOR_BUILD-stuff.patch               | 257 +++++++++++++++++++++
 meta/recipes-core/dbus/libdbus-c++_0.9.0.bb        |  24 ++
 3 files changed, 293 insertions(+)
 create mode 100644 meta/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
 create mode 100644 meta/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
 create mode 100644 meta/recipes-core/dbus/libdbus-c++_0.9.0.bb

diff --git a/meta/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch b/meta/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
new file mode 100644
index 0000000..5cb8096
--- /dev/null
+++ b/meta/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
@@ -0,0 +1,12 @@
+diff --git a/include/dbus-c++/eventloop-integration.h b/include/dbus-c++/eventloop-integration.h
+index 1b0302e..3e44304 100644
+--- a/include/dbus-c++/eventloop-integration.h
++++ b/include/dbus-c++/eventloop-integration.h
+@@ -26,6 +26,7 @@
+ #define __DBUSXX_EVENTLOOP_INTEGRATION_H
+ 
+ #include <errno.h>
++#include <unistd.h>
+ #include "api.h"
+ #include "dispatcher.h"
+ #include "util.h"
diff --git a/meta/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch b/meta/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
new file mode 100644
index 0000000..af87174
--- /dev/null
+++ b/meta/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
@@ -0,0 +1,257 @@
+diff -Naur libdbus-c++-0.9.0.ori/configure libdbus-c++-0.9.0/configure
+--- libdbus-c++-0.9.0.ori/configure	2016-11-15 14:25:36.085882774 +0100
++++ libdbus-c++-0.9.0/configure	2016-11-15 14:27:55.402913346 +0100
+@@ -800,7 +800,6 @@
+ GREP
+ SED
+ LIBTOOL
+-CXX_FOR_BUILD
+ am__fastdepCXX_FALSE
+ am__fastdepCXX_TRUE
+ CXXDEPMODE
+@@ -5233,8 +5232,6 @@
+ 
+ 
+ 
+-CXX_FOR_BUILD=${CXX_FOR_BUILD-${CXX}}
+-
+ 
+ case `pwd` in
+   *\ * | *\	*)
+diff -Naur libdbus-c++-0.9.0.ori/configure.ac libdbus-c++-0.9.0/configure.ac
+--- libdbus-c++-0.9.0.ori/configure.ac	2016-11-15 14:25:36.085882774 +0100
++++ libdbus-c++-0.9.0/configure.ac	2016-11-15 14:27:08.814568717 +0100
+@@ -64,9 +64,6 @@
+ AC_PROG_CC
+ AC_PROG_CXX
+ 
+-CXX_FOR_BUILD=${CXX_FOR_BUILD-${CXX}}
+-AC_SUBST(CXX_FOR_BUILD)
+-
+ AM_PROG_LIBTOOL
+ 
+ PKG_PROG_PKG_CONFIG
+diff -Naur libdbus-c++-0.9.0.ori/data/Makefile.in libdbus-c++-0.9.0/data/Makefile.in
+--- libdbus-c++-0.9.0.ori/data/Makefile.in	2016-11-15 14:25:36.085882774 +0100
++++ libdbus-c++-0.9.0/data/Makefile.in	2016-11-15 14:26:59.746501637 +0100
+@@ -66,7 +66,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/doc/Makefile.in libdbus-c++-0.9.0/doc/Makefile.in
+--- libdbus-c++-0.9.0.ori/doc/Makefile.in	2016-11-15 14:25:36.085882774 +0100
++++ libdbus-c++-0.9.0/doc/Makefile.in	2016-11-15 14:27:33.790753474 +0100
+@@ -67,7 +67,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/examples/echo/Makefile.in libdbus-c++-0.9.0/examples/echo/Makefile.in
+--- libdbus-c++-0.9.0.ori/examples/echo/Makefile.in	2016-11-15 14:25:36.089882803 +0100
++++ libdbus-c++-0.9.0/examples/echo/Makefile.in	2016-11-15 14:26:28.722272141 +0100
+@@ -105,7 +105,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/examples/echo_ecore/Makefile.in libdbus-c++-0.9.0/examples/echo_ecore/Makefile.in
+--- libdbus-c++-0.9.0.ori/examples/echo_ecore/Makefile.in	2016-11-15 14:25:36.089882803 +0100
++++ libdbus-c++-0.9.0/examples/echo_ecore/Makefile.in	2016-11-15 14:26:41.446366266 +0100
+@@ -110,7 +110,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/examples/ecore/Makefile.in libdbus-c++-0.9.0/examples/ecore/Makefile.in
+--- libdbus-c++-0.9.0.ori/examples/ecore/Makefile.in	2016-11-15 14:25:36.089882803 +0100
++++ libdbus-c++-0.9.0/examples/ecore/Makefile.in	2016-11-15 14:26:37.074333925 +0100
+@@ -100,7 +100,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/examples/glib/Makefile.in libdbus-c++-0.9.0/examples/glib/Makefile.in
+--- libdbus-c++-0.9.0.ori/examples/glib/Makefile.in	2016-11-15 14:25:36.089882803 +0100
++++ libdbus-c++-0.9.0/examples/glib/Makefile.in	2016-11-15 14:26:33.630308448 +0100
+@@ -99,7 +99,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/examples/hal/Makefile.in libdbus-c++-0.9.0/examples/hal/Makefile.in
+--- libdbus-c++-0.9.0.ori/examples/hal/Makefile.in	2016-11-15 14:25:36.089882803 +0100
++++ libdbus-c++-0.9.0/examples/hal/Makefile.in	2016-11-15 14:26:55.014466633 +0100
+@@ -96,7 +96,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/examples/Makefile.in libdbus-c++-0.9.0/examples/Makefile.in
+--- libdbus-c++-0.9.0.ori/examples/Makefile.in	2016-11-15 14:25:36.089882803 +0100
++++ libdbus-c++-0.9.0/examples/Makefile.in	2016-11-15 14:26:46.122400856 +0100
+@@ -106,7 +106,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/examples/properties/Makefile.in libdbus-c++-0.9.0/examples/properties/Makefile.in
+--- libdbus-c++-0.9.0.ori/examples/properties/Makefile.in	2016-11-15 14:25:36.089882803 +0100
++++ libdbus-c++-0.9.0/examples/properties/Makefile.in	2016-11-15 14:26:50.818435594 +0100
+@@ -99,7 +99,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/Makefile.in libdbus-c++-0.9.0/Makefile.in
+--- libdbus-c++-0.9.0.ori/Makefile.in	2016-11-15 14:25:36.085882774 +0100
++++ libdbus-c++-0.9.0/Makefile.in	2016-11-15 14:27:02.834524481 +0100
+@@ -155,7 +155,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/src/integration/ecore/Makefile.in libdbus-c++-0.9.0/src/integration/ecore/Makefile.in
+--- libdbus-c++-0.9.0.ori/src/integration/ecore/Makefile.in	2016-11-15 14:25:36.089882803 +0100
++++ libdbus-c++-0.9.0/src/integration/ecore/Makefile.in	2016-11-15 14:27:21.206660385 +0100
+@@ -122,7 +122,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/src/integration/glib/Makefile.in libdbus-c++-0.9.0/src/integration/glib/Makefile.in
+--- libdbus-c++-0.9.0.ori/src/integration/glib/Makefile.in	2016-11-15 14:25:36.089882803 +0100
++++ libdbus-c++-0.9.0/src/integration/glib/Makefile.in	2016-11-15 14:27:17.274631299 +0100
+@@ -123,7 +123,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/src/integration/Makefile.in libdbus-c++-0.9.0/src/integration/Makefile.in
+--- libdbus-c++-0.9.0.ori/src/integration/Makefile.in	2016-11-15 14:25:36.089882803 +0100
++++ libdbus-c++-0.9.0/src/integration/Makefile.in	2016-11-15 14:27:23.698678820 +0100
+@@ -106,7 +106,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/src/Makefile.in libdbus-c++-0.9.0/src/Makefile.in
+--- libdbus-c++-0.9.0.ori/src/Makefile.in	2016-11-15 14:25:36.089882803 +0100
++++ libdbus-c++-0.9.0/src/Makefile.in	2016-11-15 14:27:12.270594283 +0100
+@@ -172,7 +172,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/test/functional/Makefile.in libdbus-c++-0.9.0/test/functional/Makefile.in
+--- libdbus-c++-0.9.0.ori/test/functional/Makefile.in	2016-11-15 14:25:36.085882774 +0100
++++ libdbus-c++-0.9.0/test/functional/Makefile.in	2016-11-15 14:26:15.126171567 +0100
+@@ -106,7 +106,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/test/functional/Test1/Makefile.in libdbus-c++-0.9.0/test/functional/Test1/Makefile.in
+--- libdbus-c++-0.9.0.ori/test/functional/Test1/Makefile.in	2016-11-15 14:25:36.085882774 +0100
++++ libdbus-c++-0.9.0/test/functional/Test1/Makefile.in	2016-11-15 14:26:11.670146002 +0100
+@@ -105,7 +105,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/test/generator/Makefile.in libdbus-c++-0.9.0/test/generator/Makefile.in
+--- libdbus-c++-0.9.0.ori/test/generator/Makefile.in	2016-11-15 14:25:36.085882774 +0100
++++ libdbus-c++-0.9.0/test/generator/Makefile.in	2016-11-15 14:26:02.622079070 +0100
+@@ -114,7 +114,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/test/Makefile.in libdbus-c++-0.9.0/test/Makefile.in
+--- libdbus-c++-0.9.0.ori/test/Makefile.in	2016-11-15 14:25:36.085882774 +0100
++++ libdbus-c++-0.9.0/test/Makefile.in	2016-11-15 14:26:07.770117152 +0100
+@@ -106,7 +106,6 @@
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
+diff -Naur libdbus-c++-0.9.0.ori/tools/Makefile.am libdbus-c++-0.9.0/tools/Makefile.am
+--- libdbus-c++-0.9.0.ori/tools/Makefile.am	2016-11-15 14:25:36.089882803 +0100
++++ libdbus-c++-0.9.0/tools/Makefile.am	2016-11-15 14:26:19.454203583 +0100
+@@ -1,7 +1,5 @@
+ # hacky, but ...
+ 
+-CXX = $(CXX_FOR_BUILD)
+-
+ AM_CPPFLAGS = \
+ 	$(dbus_CFLAGS) \
+ 	$(xml_CFLAGS) \
+diff -Naur libdbus-c++-0.9.0.ori/tools/Makefile.in libdbus-c++-0.9.0/tools/Makefile.in
+--- libdbus-c++-0.9.0.ori/tools/Makefile.in	2016-11-15 14:25:36.089882803 +0100
++++ libdbus-c++-0.9.0/tools/Makefile.in	2016-11-15 14:27:44.306831265 +0100
+@@ -101,11 +101,9 @@
+ CFLAGS = @CFLAGS@
+ CPP = @CPP@
+ CPPFLAGS = @CPPFLAGS@
+-CXX = $(CXX_FOR_BUILD)
+ CXXCPP = @CXXCPP@
+ CXXDEPMODE = @CXXDEPMODE@
+ CXXFLAGS = @CXXFLAGS@
+-CXX_FOR_BUILD = @CXX_FOR_BUILD@
+ CYGPATH_W = @CYGPATH_W@
+ DEFS = @DEFS@
+ DEPDIR = @DEPDIR@
diff --git a/meta/recipes-core/dbus/libdbus-c++_0.9.0.bb b/meta/recipes-core/dbus/libdbus-c++_0.9.0.bb
new file mode 100644
index 0000000..7edaffc
--- /dev/null
+++ b/meta/recipes-core/dbus/libdbus-c++_0.9.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "DBus-C++ Library"
+DESCRIPTION = "DBus-c++ attempts to provide a C++ API for D-BUS. The library has a glib and an Ecore mainloop integration. It also offers an optional own main loop."
+HOMEPAGE = "http://dbus-cplusplus.sourceforge.net"
+SECTION = "base"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+DEPENDS = "dbus glib-2.0 libpcre"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/dbus-cplusplus/dbus-c++/${PV}/${BPN}-${PV}.tar.gz \
+		   file://fix-missing-unistd.h-include.patch \
+		   file://remove-CXX_FOR_BUILD-stuff.patch"
+SRC_URI[md5sum] = "e752116f523fa88ef041e63d3dee4de2"
+SRC_URI[sha256sum] = "bc11ac297b3cb010be904c72789695543ee3fdf3d75cdc8225fd371385af4e61"
+
+EXTRA_OECONF = "--disable-ecore --disable-examples --disable-tests"
+
+inherit autotools pkgconfig
+
+PACKAGES += "${PN}-tools"
+
+FILES_${PN} = "${libdir}"
+FILES_${PN}-tools = "${bindir}"
+
+BBCLASSEXTEND = "native"
-- 
2.10.2


