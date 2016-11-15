Return-Path: <thilo.cestonaro@ts.fujitsu.com>
Received: from mail1.bemta3.messagelabs.com (mail1.bemta3.messagelabs.com
	[195.245.230.177])
	by mail.openembedded.org (Postfix) with ESMTP id 50EEC719A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 15:25:52 +0000 (UTC)
Received: from [85.158.138.179] by server-17.bemta-3.messagelabs.com id
	0E/6A-31715-0092B285; Tue, 15 Nov 2016 15:25:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRWlGSWpSXmKPExsViZ8MxVZdBUzv
	CoOuAuMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrH092+mgr8KFbeWCDYwnpTtYuTkEBK4yCjx
	55Z7FyMXkN3NKDHv5H/WLkYODjYBM4lv6wtBTBEBHYk3H71AypkF1CQWPD7ABmILC5hItDYuZ
	QSxWQRUJXa8mMEMYvMKOEmcn9/ODmJLCMhLLDx/hGkCI+cCRoZVjBrFqUVlqUW6RsZ6SUWZ6R
	kluYmZObqGBsZ6uanFxYnpqTmJScV6yfm5mxiBnqpnYGDcwdi31+8QoyQHk5Iob7aydoQQX1J
	+SmVGYnFGfFFpTmrxIUYZDg4lCV4eDaCcYFFqempFWmYOMGRg0hIcPEoivFwgad7igsTc4sx0
	iNQpRkUpcV4WkIQASCKjNA+uDRamlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8/KCTOHJz
	CuBm/4KaDET0OJd5hogi0sSEVJSDYyrEp83Jzbw22dP3/hVrOnL223pNnUL/r3qrLhxZuVKQb
	3YZInHFkaJCtsiXMIYkiW+lbtcmXyVkfu6qCSDzFG9Dr2HX4QYmK82FPqp9WzwED4VdIbBw9p
	BSInj/JKalsmBE/pv23nedOpbr7ZwU2dJ9ME1/xVfBRXIpf2e9pejMrLCeYn1TyWW4oxEQy3m
	ouJEAAfTXTJOAgAA
X-Env-Sender: thilo.cestonaro@ts.fujitsu.com
X-Msg-Ref: server-10.tower-169.messagelabs.com!1479223543!73057745!1
X-Originating-IP: [62.60.8.149]
X-StarScan-Received: 
X-StarScan-Version: 9.0.16; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3899 invoked from network); 15 Nov 2016 15:25:44 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
	by server-10.tower-169.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 15 Nov 2016 15:25:44 -0000
Received: from abgdgate50u.abg.fsc.net ([172.25.138.66])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id
	uAFFQ9V8003016 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 15:26:09 GMT
Received: from unknown (HELO abg4858n-lnx.CSOD.local) ([10.172.228.10])
	by abgdgate50u.abg.fsc.net with ESMTP; 15 Nov 2016 16:25:43 +0100
From: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 16:21:58 +0100
Message-Id: <20161115152158.7883-1-thilo.cestonaro@ts.fujitsu.com>
X-Mailer: git-send-email 2.10.2
Cc: Thilo Cestonaro <thilo@cestona.ro>
Subject: [PATCH v2] libdbus-c++: added recipe for it
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
X-List-Received-Date: Tue, 15 Nov 2016 15:25:54 -0000

From: Thilo Cestonaro <thilo@cestona.ro>

to fix the build, two patches where needed.

One which just adds an include of unistd.h, as the functions pipe, write and
close defined by this include, weren't defined.

The other patch enables the build to build the tools of libdbus-c++ for the
target, which, without the patch, will always be build for the host, even when
cross compiling.

Signed-off-by: Thilo Cestonaro <thilo@cestona.ro>
---
 .../fix-missing-unistd.h-include.patch             | 12 +++++++++++
 .../remove-CXX_FOR_BUILD-stuff.patch               | 24 ++++++++++++++++++++++
 meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb     | 24 ++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb

changelog:
v2:
Stripped down the remove-CXX_FOR_BUILD-stuff patch, as Ross said, to only
include configure.ac and the tools/Makefile.am
Added description about the patches in the commit.
Patch goes into meta-oe of meta-openembedded.

diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
new file mode 100644
index 0000000..5cb8096
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
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
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
new file mode 100644
index 0000000..906470a
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
@@ -0,0 +1,24 @@
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
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
new file mode 100644
index 0000000..7edaffc
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
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


