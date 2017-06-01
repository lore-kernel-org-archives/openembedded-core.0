Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4689E77D81
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 15:18:28 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id 7so161872829wmo.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 08:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=sNmNeDFn+9J2pm/PMCLN5lPoF/ojih1x/kW/AC/Y0LA=;
	b=wpuXDU3P/JIHMBDNT+IuDHmeQCPMxwtQwuPzZyWXrAGjh2jOfQFFLK8ZUL4lnpY/LU
	83QkENJQ8C732rr5Gr7jMhc2kQra5cjVj0HoC4GVFj6IwHcnpEsoWMqtsmmxtBexV426
	ECaVZOskB9FpUGO6aLBm6NJJGGNCNtbRNB374KNDvrFkhjajBeJqRWIfZW05Uw7qqb7T
	kkuedPe6FjvswdCNA49XxUhsOU+JCDDOIda9663BWTyzN+SQNicLgJz8iz53q1srAunA
	OhoNCO8tYANyJfhdYC0dUAT0ISm4ihBFVr/8ix2+VNUGdKWn0l90y2nXKYXzM9nJ146Y
	+vVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sNmNeDFn+9J2pm/PMCLN5lPoF/ojih1x/kW/AC/Y0LA=;
	b=AVx7rfLx/O3z+vGuRp1RaGmMvcBprXmIUZw6hw7kgKfXYUEWnLov65Vv37qsjYqudp
	XMdw0N4u8JmQZoGQ4jLvX2KVZwoXXPPyuztGx22rU3ILYASYwsDrxzPOA3RmbVKS5Cr8
	AmAQvPN1cBqS8KzfFI8Cs06ewf9tpeS7QZagEKRbMzDqiBgS6ggzhFhw289kuDVVrNoO
	E01WcDPZZ8HCby2RYpNSzn5PrzWY5moOzAXKrY1d3OD/n/HZnrgZRNrLIrlc8l07Uhuf
	h11a7abA4Xy7p6TecTjRcVVac5eRgaZn/xaTjEKts1tkMciSWDkfWdpd+Y6EmdVqzl6Z
	IPwA==
X-Gm-Message-State: AODbwcDNzZcC4QOnuFpgIMLWC8dfrwWeqP7HIBMikrah4euqDHiKBoRn
	uC/KlYM6CdzYkPxrzPI=
X-Received: by 10.223.155.217 with SMTP id e25mr1735734wrc.55.1496330309152;
	Thu, 01 Jun 2017 08:18:29 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	w18sm18841843wmw.26.2017.06.01.08.18.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Jun 2017 08:18:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 16:18:24 +0100
Message-Id: <1496330304-20841-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] gstreamer1.0: upgrade to version 1.12.0
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
X-List-Received-Date: Thu, 01 Jun 2017 15:18:29 -0000

From: Carlos Rafael Giani <dv@pseudoterminal.org>

* Version 1.12 introduces support for libdw (provided by elfutils)
  libdw adds source lines & numbers to backtraces
  new dw packageconfig added for enabling/disabling this feature
* Leftover docbook cruft was removed

* Fix bash completion packaging (RB)

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  6 +--
 ...tection-of-libunwind-and-libdw-determinis.patch | 56 ++++++++++++++++++++++
 .../gstreamer1.0/deterministic-unwind.patch        | 24 ----------
 ...treamer1.0_1.10.4.bb => gstreamer1.0_1.12.0.bb} |  6 +--
 4 files changed, 62 insertions(+), 30 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Make-the-detection-of-libunwind-and-libdw-determinis.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.10.4.bb => gstreamer1.0_1.12.0.bb} (59%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index 72d7ce6..df3d4c4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -25,10 +25,10 @@ PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
 PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
 PACKAGECONFIG[gst-tracer-hooks] = "--enable-gst-tracer-hooks,--disable-gst-tracer-hooks,"
 PACKAGECONFIG[unwind] = "--with-unwind,--without-unwind,libunwind"
+PACKAGECONFIG[dw] = "--with-dw,--without-dw,elfutils"
 
 EXTRA_OECONF = " \
     --disable-dependency-tracking \
-    --disable-docbook \
     --disable-examples \
 "
 
@@ -37,11 +37,11 @@ CACHED_CONFIGUREVARS += "ac_cv_header_valgrind_valgrind_h=no"
 # musl libc generates warnings if <sys/poll.h> is included directly
 CACHED_CONFIGUREVARS += "ac_cv_header_sys_poll_h=no"
 
-PACKAGES += "${PN}-bash-completion"
+PACKAGES =+ "${PN}-bash-completion"
 
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
 FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
-FILES_${PN}-bash-completion += "${datadir}/bash-completion/completions/ ${datadir}/bash-completion/helpers/gst*"
+FILES_${PN}-bash-completion += "${datadir}/bash-completion/ ${libexecdir}/gstreamer-1.0/gst-completion-helper"
 
 RRECOMMENDS_${PN}_qemux86 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
 RRECOMMENDS_${PN}_qemux86-64 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Make-the-detection-of-libunwind-and-libdw-determinis.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Make-the-detection-of-libunwind-and-libdw-determinis.patch
new file mode 100644
index 0000000..11ce5e9
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Make-the-detection-of-libunwind-and-libdw-determinis.patch
@@ -0,0 +1,56 @@
+From fa2344e1a0ffed7e648e36ac72c8871d817e40e0 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Mon, 8 May 2017 01:38:57 +0200
+Subject: [PATCH] Make the detection of libunwind and libdw deterministic
+
+Upstream-Status: Pending
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ configure.ac | 28 ++++++++++++++++++++--------
+ 1 file changed, 20 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b151208..b7922ac 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -821,16 +821,28 @@ fi
+ AM_CONDITIONAL(HAVE_GTK, test "x$HAVE_GTK" = "xyes")
+ 
+ dnl libunwind is optionally used by the leaks tracer
+-PKG_CHECK_MODULES(UNWIND, libunwind, HAVE_UNWIND=yes, HAVE_UNWIND=no)
+-if test "x$HAVE_UNWIND" = "xyes"; then
+-  AC_DEFINE(HAVE_UNWIND, 1, [libunwind available])
+-fi
++AC_ARG_WITH([unwind],[AS_HELP_STRING([--with-unwind],[use libunwind])],
++            [], [with_unwind=yes])
++AS_IF([test "x$with_unwind" = xyes],
++      [PKG_CHECK_MODULES(UNWIND, libunwind)
++       HAVE_UNWIND=yes
++       AC_DEFINE(HAVE_UNWIND, 1, [libunwind available])
++      ], [
++       HAVE_UNWIND="no"
++      ]
++)
+ 
+ dnl libdw is optionally used to add source lines and numbers to backtraces
+-PKG_CHECK_MODULES(DW, libdw, HAVE_DW=yes, HAVE_DW=no)
+-if test "x$HAVE_DW" = "xyes"; then
+-  AC_DEFINE(HAVE_DW, 1, [libdw available])
+-fi
++AC_ARG_WITH([dw],[AS_HELP_STRING([--with-dw],[use libdw])],
++            [], [with_dw=yes])
++AS_IF([test "x$with_dw" = xyes],
++      [PKG_CHECK_MODULES(DW, libdw)
++       HAVE_DW=yes
++       AC_DEFINE(HAVE_DW, 1, [libdw available])
++      ], [
++       HAVE_DW=no
++      ]
++)
+ 
+ dnl Check for backtrace() from libc
+ AC_CHECK_FUNC(backtrace, [
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch
deleted file mode 100644
index e39e6ca..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Make the detection of libunwind deterministic.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index ac88fb2..182c19a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -829,3 +828,0 @@ AM_CONDITIONAL(HAVE_GTK, test "x$HAVE_GTK" = "xyes")
--dnl libunwind is optionally used by the leaks tracer
--PKG_CHECK_MODULES(UNWIND, libunwind, HAVE_UNWIND=yes, HAVE_UNWIND=no)
--
-@@ -839,3 +836,7 @@ AC_CHECK_FUNC(backtrace, [
--if test "x$HAVE_UNWIND" = "xyes"; then
--  AC_DEFINE(HAVE_UNWIND, 1, [libunwind available])
--fi
-+dnl libunwind is optionally used by the leaks tracer
-+AC_ARG_WITH([unwind],[AS_HELP_STRING([--with-unwind],[use libunwind])],
-+            [], [with_unwind=yes])
-+AS_IF([test "$with_unwind" = yes],
-+      [PKG_CHECK_MODULES(UNWIND, libunwind)
-+       AC_DEFINE(HAVE_UNWIND, 1, [libunwind available])]
-+)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.0.bb
similarity index 59%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.0.bb
index 2a67993..84fc321 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.0.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
-    file://deterministic-unwind.patch \
+    file://0001-Make-the-detection-of-libunwind-and-libdw-determinis.patch \
 "
-SRC_URI[md5sum] = "7c91a97e4a2dc81eafd59d0a2f8b0d6e"
-SRC_URI[sha256sum] = "50c2f5af50a6cc6c0a3f3ed43bdd8b5e2bff00bacfb766d4be139ec06d8b5218"
+SRC_URI[md5sum] = "8f76b6b5e4b3307e505bd6ab9304dd03"
+SRC_URI[sha256sum] = "14d5eef8297d2bf2a728d38fa43cd92cc267a0ad260cf83d770215212aff4302"
 
 S = "${WORKDIR}/gstreamer-${PV}"
-- 
2.8.1


