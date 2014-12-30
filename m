Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 298B472651
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 14:15:02 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id r20so24096039wiv.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 06:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=o7X+xvMpyVpjU+7Pfj8uu9dMESTPGxTmLxdyVIWW4tM=;
	b=djFri7eBZOKGPDdxWVWUWbg4Zmv7ZYikhvWxAbqsMXPBh+qJ4YjuoP8b0uMfbx2nOd
	nwff5eQU0VDfEVHnm+aIwzvxvx6Cm1qDY6YLHR1UCTJs1W5mC97U81059QhCEM03hFez
	orX1c4VUJqmHEwg6hFJUGz3jX6/nNMCHi1p9dqV9Dc/ChzEuzNn86+BO1qWua5y4QeT5
	rj2uxoiSvj6cFZMLaF0L/zDwnNS3Qn5RazBkW0a2HFPtcCwpsFxhTJpx14k0qHl4zGhR
	AR+2PtyKMZxIvPom8kRfJ8KOgMIGSMu8ufdurgkJtD6gF92CwbSRRO+gt+YgfOohi9gR
	3kaA==
X-Gm-Message-State: ALoCoQm1kN2j4i1tycgfxC9cHT2QjqbfL71t8CWadihcubLMZR4P5x0ASYj6mXzka5p8jR+PnZuT
X-Received: by 10.180.228.108 with SMTP id sh12mr82636504wic.55.1419948901607; 
	Tue, 30 Dec 2014 06:15:01 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	mo12sm54020211wjc.35.2014.12.30.06.15.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 06:15:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Dec 2014 14:13:57 +0000
Message-Id: <1419948837-14605-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] telepathy: remove (moved to meta-oe)
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
X-List-Received-Date: Tue, 30 Dec 2014 14:15:08 -0000

Nothing in oe-core uses Telepathy, so move these recipes to meta-oe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../telepathy/libtelepathy/doublefix.patch         |   18 -----
 .../telepathy/libtelepathy/prefer_python_2.5.patch |   15 ----
 .../telepathy/libtelepathy_0.3.3.bb                |   23 ------
 .../telepathy/telepathy-glib_0.24.0.bb             |   16 -----
 .../telepathy-idle/fix-svc-gtk-doc.h-target.patch  |   15 ----
 .../telepathy/telepathy-idle_0.2.0.bb              |   17 -----
 .../tmc-Makefile-fix-race.patch                    |   76 --------------------
 .../telepathy/telepathy-mission-control_5.16.1.bb  |   51 -------------
 .../telepathy-python-0.15.19/parallel_make.patch   |   43 -----------
 .../remove_duplicate_install.patch                 |   26 -------
 .../telepathy-python_fix_for_automake_1.12.patch   |   26 -------
 .../telepathy/telepathy-python_0.15.19.bb          |   32 ---------
 12 files changed, 358 deletions(-)
 delete mode 100644 meta/recipes-connectivity/telepathy/libtelepathy/doublefix.patch
 delete mode 100644 meta/recipes-connectivity/telepathy/libtelepathy/prefer_python_2.5.patch
 delete mode 100644 meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
 delete mode 100644 meta/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb
 delete mode 100644 meta/recipes-connectivity/telepathy/telepathy-idle/fix-svc-gtk-doc.h-target.patch
 delete mode 100644 meta/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
 delete mode 100644 meta/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch
 delete mode 100644 meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
 delete mode 100644 meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
 delete mode 100644 meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch
 delete mode 100644 meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
 delete mode 100644 meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb

diff --git a/meta/recipes-connectivity/telepathy/libtelepathy/doublefix.patch b/meta/recipes-connectivity/telepathy/libtelepathy/doublefix.patch
deleted file mode 100644
index a7737fb..0000000
--- a/meta/recipes-connectivity/telepathy/libtelepathy/doublefix.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Fix double reference to this file to work with recent autoconf+automake
-
-RP 1/2/10
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: libtelepathy-0.3.3/src/Makefile.am
-===================================================================
---- libtelepathy-0.3.3.orig/src/Makefile.am	2010-02-01 13:13:50.869038984 +0000
-+++ libtelepathy-0.3.3/src/Makefile.am	2010-02-01 13:14:23.267789456 +0000
-@@ -27,7 +27,6 @@
-     tp-chan-type-text-gen.h \
-     tp-chan-type-tubes-gen.h \
-     tp-conn-iface-aliasing-gen.h \
--    tp-conn-iface-avatars-gen.h \
-     tp-conn-iface-capabilities-gen.h \
-     tp-conn-iface-contact-info-gen.h \
-     tp-conn-iface-forwarding-gen.h \
diff --git a/meta/recipes-connectivity/telepathy/libtelepathy/prefer_python_2.5.patch b/meta/recipes-connectivity/telepathy/libtelepathy/prefer_python_2.5.patch
deleted file mode 100644
index 37679ab..0000000
--- a/meta/recipes-connectivity/telepathy/libtelepathy/prefer_python_2.5.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: libtelepathy-0.3.1/configure.ac
-===================================================================
---- libtelepathy-0.3.1.orig/configure.ac	2007-11-22 19:05:56.000000000 +0000
-+++ libtelepathy-0.3.1/configure.ac	2008-01-04 12:07:28.000000000 +0000
-@@ -51,7 +51,7 @@
-   AC_MSG_ERROR([xsltproc (from the libxslt source package) is required])
- fi
- 
--AC_CHECK_PROGS([PYTHON], [python2.3 python2.4 python2.5 python])
-+AC_CHECK_PROGS([PYTHON], [python2.5 python2.4 python2.3 python])
- if test -z "$PYTHON"; then
-   AC_MSG_ERROR([Python is required to compile this package])
- fi
diff --git a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb b/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
deleted file mode 100644
index f13e709..0000000
--- a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Telepathy framework"
-DESCRIPTION = "Telepathy is a D-Bus framework for unifying real time \
-communication, including instant messaging, voice calls and video calls.  It \
-abstracts differences between protocols to provide a unified interface for \
-applications."
-HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
-DEPENDS = "glib-2.0 dbus dbus-glib telepathy-glib libxslt-native"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://src/tp-conn.c;beginline=1;endline=19;md5=4c58069f77d601cc59200bce5396c7cb"
-PR = "r5"
-
-SRC_URI = "http://telepathy.freedesktop.org/releases/libtelepathy/libtelepathy-${PV}.tar.gz \
-           file://prefer_python_2.5.patch \
-           file://doublefix.patch"
-
-SRC_URI[md5sum] = "490ca1a0c614d4466394b72d43bf7370"
-SRC_URI[sha256sum] = "e0d230be855125163579743418203c6f6be2f10f98c4f065735c1dc9ed115878"
-
-inherit autotools pkgconfig pythonnative
-
-FILES_${PN} += "${datadir}/telepathy \
-		${datadir}/dbus-1"
diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb
deleted file mode 100644
index 6b8c20c..0000000
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Telepathy Framework glib-base helper library"
-DESCRIPTION = "Telepathy Framework: GLib-based helper library for connection managers"
-HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
-DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib libxslt-native"
-LICENSE = "LGPLv2.1+"
-
-SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BP}.tar.gz"
-SRC_URI[md5sum] = "93c429e37750b25dcf8de86bb514664f"
-SRC_URI[sha256sum] = "ae0002134991217f42e503c43dea7817853afc18863b913744d51ffa029818cf"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
-
-inherit autotools pkgconfig gettext
-
-FILES_${PN} += "${datadir}/telepathy \
-                ${datadir}/dbus-1"
diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle/fix-svc-gtk-doc.h-target.patch b/meta/recipes-connectivity/telepathy/telepathy-idle/fix-svc-gtk-doc.h-target.patch
deleted file mode 100644
index 2cd2c78c..0000000
--- a/meta/recipes-connectivity/telepathy/telepathy-idle/fix-svc-gtk-doc.h-target.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---- a/extensions/Makefile.am
-+++ b/extensions/Makefile.am
-@@ -37,8 +37,8 @@ _gen/all.xml: all.xml $(wildcard $(srcdi
- 		--xinclude $(tools_dir)/identity.xsl \
- 		$< > $@
- 
--extensions.html: _gen/all.xml $(tools_dir)/doc-generator.xsl
-+extensions.html _gen/svc-gtk-doc.h: _gen/all.xml $(tools_dir)/doc-generator.xsl
- 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROCFLAGS) \
- 		$(tools_dir)/doc-generator.xsl \
- 		$< > $@
- 
diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb b/meta/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
deleted file mode 100644
index ca09f6d..0000000
--- a/meta/recipes-connectivity/telepathy/telepathy-idle_0.2.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Telepathy IRC connection manager"
-DESCRIPTION = "Telepathy implementation of the Internet Relay Chat protocols."
-HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
-DEPENDS = "glib-2.0 dbus telepathy-glib openssl libxslt-native"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/idle.c;beginline=1;endline=19;md5=b06b1e2594423111a1a7910b0eefc7f9"
-
-SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
-           file://fix-svc-gtk-doc.h-target.patch"
-SRC_URI[md5sum] = "92a2de5198284cbd3c430b0d1a971a86"
-SRC_URI[sha256sum] = "3013ad4b38d14ee630b8cc8ada5e95ccaa849b9a6fe15d2eaf6d0717d76f2fab"
-
-inherit autotools pkgconfig pythonnative
-
-FILES_${PN} += "${datadir}/telepathy \
-                ${datadir}/dbus-1"
diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch b/meta/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch
deleted file mode 100644
index ece1da6..0000000
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sun, 22 Sep 2013 23:21:01 -0400
-Subject: [PATCH] src/Makefile.am: fix race issue for _gen/gtypes.h and _gen/gtypes-body.h
-
-There might be an error when parallel build:
-
-[snip]
-Traceback (most recent call last):
-  File "/path/to/tools/glib-gtypes-generator.py", line 304, in <module>
-    GTypesGenerator(dom, argv[1], argv[2])()
-  File "/path/to/tools/glib-gtypes-generator.py", line 295, in __call__
-    file_set_contents(self.output + '.h', ''.join(self.header))
-  File "/path/to/tools/libtpcodegen.py", line 42, in file_set_contents
-    os.rename(filename + '.tmp', filename)
-OSError: [Errno 2] No such file or directory
-[snip]
-
-This is a race issue, the _gen/gtypes.h and _gen/gtypes-body.h may
-write(remove/rename) _gen/gtypes.tmp at the same time, then there would
-be the error.
-
-There was a similar bug in telepathy-glib which was already fixed, we use the
-similar patch to fix it.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- src/Makefile.am |   18 +++++++++++++++---
- 1 file changed, 15 insertions(+), 3 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -288,7 +288,11 @@ _gen/interfaces-body.h: _gen/mcd.xml \
- 		$(tools_dir)/glib-interfaces-body-generator.xsl \
- 		$< > $@
- 
--_gen/gtypes.h _gen/gtypes-body.h: _gen/mcd.xml \
-+# do nothing, output as a side-effect
-+_gen/gtypes.h: _gen/gtypes-body.h
-+	@:
-+
-+_gen/gtypes-body.h: _gen/mcd.xml \
- 	$(top_srcdir)/tools/glib-gtypes-generator.py
- 	$(AM_V_GEN)$(PYTHON) $(top_srcdir)/tools/glib-gtypes-generator.py \
- 		$< _gen/gtypes mc
-@@ -309,7 +313,11 @@ _gen/%.xml: %.xml $(wildcard $(top_srcdir)/xml/*.xml) Makefile.am
- 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROCFLAGS) --xinclude $(tools_dir)/identity.xsl \
- 		$< > $@
- 
--_gen/cli-%-body.h _gen/cli-%.h: _gen/%.xml \
-+# do nothing, output as a side-effect
-+_gen/cli-%.h: _gen/cli-%-body.h
-+	@:
-+
-+_gen/cli-%-body.h: _gen/%.xml \
- 	$(tools_dir)/glib-client-gen.py Makefile.am
- 	$(AM_V_GEN)$(PYTHON) $(tools_dir)/glib-client-gen.py \
- 		--group=`echo $* | tr x- x_` \
-@@ -317,7 +325,11 @@ _gen/cli-%-body.h _gen/cli-%.h: _gen/%.xml \
- 		--tp-proxy-api=0.7.6 \
- 		$< Mc_Cli _gen/cli-$*
- 
--_gen/svc-%.c _gen/svc-%.h: _gen/%.xml \
-+# do nothing, output as a side-effect
-+_gen/svc-%.h: _gen/svc-%.c
-+	@:
-+
-+_gen/svc-%.c: _gen/%.xml \
- 	$(tools_dir)/glib-ginterface-gen.py Makefile.am
- 	$(AM_V_GEN)$(PYTHON) $(tools_dir)/glib-ginterface-gen.py \
- 		--filename=_gen/svc-$* \
--- 
-1.7.10.4
-
diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
deleted file mode 100644
index 9ae68dd..0000000
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-SUMMARY = "Central control for Telepathy IM connection managers"
-HOMEPAGE = "http://telepathy.freedesktop.org/wiki/Mission_Control/"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
-                    file://src/request.h;beginline=1;endline=21;md5=f80534d9af1c33291b3b79609f196eb2"
-SECTION = "libs"
-DEPENDS = "libtelepathy dbus-glib gconf libxslt-native"
-
-SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/${BP}.tar.gz \
-           file://tmc-Makefile-fix-race.patch \
-          "
-SRC_URI[md5sum] = "421115a35b9e427807326877f86e7f43"
-SRC_URI[sha256sum] = "14ceb7d53535b43d44b8271ad11319d1d0fe6d193d154636b9e62b42799b9723"
-
-inherit autotools-brokensep pkgconfig pythonnative
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[upower] = "--enable-upower,--disable-upower,upower"
-
-# to select connman or nm you need to use "connectivity" and "connman" or "nm", default is to disable both
-PACKAGECONFIG[connectivity] = ",--with-connectivity=no"
-PACKAGECONFIG[connman] = "--with-connectivity=connman,,connman"
-PACKAGECONFIG[nm] = "--with-connectivity=nm,,networkmanager"
-
-PACKAGES =+ " \
-	libmissioncontrol \
-	libmissioncontrol-config \
-	libmissioncontrol-server \
-	libmissioncontrol-dev \
-	libmissioncontrol-config-dev \
-	libmissioncontrol-server-dev \
-	libmissioncontrol-dbg \
-	libmissioncontrol-config-dbg \
-	libmissioncontrol-server-dbg \
-"
-
-FILES_${PN} += "${datadir}/dbus* ${datadir}/glib-2.0/schemas"
-
-FILES_libmissioncontrol = "${libdir}/libmissioncontrol.so.*"
-FILES_libmissioncontrol-config = "${libdir}/libmissioncontrol-config.so.*"
-FILES_libmissioncontrol-server = "${libdir}/libmissioncontrol-server.so.*"
-
-FILES_libmissioncontrol-dev = "${libdir}/libmissioncontrol.* \
-                               ${includedir}/libmissioncontrol/ \
-                               ${libdir}/pkgconfig/libmissioncontrol.pc"
-FILES_libmissioncontrol-config-dev = "${libdir}/libmissioncontrol-config.*"
-FILES_libmissioncontrol-server-dev = "${libdir}/libmissioncontrol-server.*"
-
-FILES_libmissioncontrol-dbg = "${libdir}/.debug/libmissioncontrol.so.*"
-FILES_libmissioncontrol-config-dbg = "${libdir}/.debug/libmissioncontrol-config.so.*"
-FILES_libmissioncontrol-server-dbg = "${libdir}/.debug/libmissioncontrol-server.so.*"
diff --git a/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch b/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
deleted file mode 100644
index 2488246..0000000
--- a/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Add dependency of __init__.py
-
-Tasks must be done after exec of __init__, which creates the
-src/_generated directory that tasks are based on.
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-
-Upstream-Status: Submitted
-(However it seems that this project is out of maintanence.)
-
-diff -ruN telepathy-python-0.15.19-orig/src/Makefile.am telepathy-python-0.15.19/src/Makefile.am
---- telepathy-python-0.15.19-orig/src/Makefile.am	2011-03-10 08:51:49.000000000 +0800
-+++ telepathy-python-0.15.19/src/Makefile.am	2011-03-10 08:54:45.000000000 +0800
-@@ -39,17 +39,17 @@
- XSLTPROC_OPTS = --nonet --novalid --xinclude
- tools_dir = $(top_srcdir)/tools
- 
--_generated/interfaces.py: $(tools_dir)/python-interfaces-generator.xsl $(wildcard $(spec_dir)/*.xml)
-+_generated/interfaces.py: _generated/__init__.py $(tools_dir)/python-interfaces-generator.xsl $(wildcard $(spec_dir)/*.xml)
- 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROC_OPTS) -o $@ \
- 	    $(tools_dir)/python-interfaces-generator.xsl \
- 	    $(spec_dir)/all.xml
- 
--_generated/constants.py: $(tools_dir)/python-constants-generator.xsl $(wildcard $(spec_dir)/*.xml)
-+_generated/constants.py: _generated/__init__.py $(tools_dir)/python-constants-generator.xsl $(wildcard $(spec_dir)/*.xml)
- 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROC_OPTS) -o $@ \
- 	    $(tools_dir)/python-constants-generator.xsl \
- 	    $(spec_dir)/all.xml
- 
--_generated/errors.py: $(tools_dir)/python-errors-generator.xsl $(wildcard $(spec_dir)/*.xml)
-+_generated/errors.py: _generated/__init__.py $(tools_dir)/python-errors-generator.xsl $(wildcard $(spec_dir)/*.xml)
- 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROC_OPTS) -o $@ \
- 	    $(tools_dir)/python-errors-generator.xsl \
- 	    $(spec_dir)/all.xml
-@@ -58,7 +58,7 @@
- 	$(AM_V_GEN)$(mkdir_p) $(dir $@)
- 	@echo "# Placeholder for package" > $@
- 
--_generated/%.py: $(tools_dir)/spec-to-python.xsl $(spec_dir)/%.xml
-+_generated/%.py: _generated/__init__.py $(tools_dir)/spec-to-python.xsl $(spec_dir)/%.xml
- 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROC_OPTS) -o $@ \
- 	    $(tools_dir)/spec-to-python.xsl \
- 	    $(spec_dir)/$*.xml
diff --git a/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch b/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch
deleted file mode 100644
index df95a4c..0000000
--- a/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-commit f6c67662145de889055a86a6b3b12c70a45fc8d5
-Author: Dongxiao Xu <dongxiao.xu@intel.com>
-Date:   Wed Sep 7 16:02:20 2011 +0800
-
-    Avoid duplicated installation of errors.py
-    
-    newer version of autotools don't seem to like listing files to install
-    twice. Remove one errors.py from the installation list.
-    
-    Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-    
-    Upstream-Status: Inappropirate [upstream inactive]
-    
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 5c27dfe..7536e43 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -11,7 +11,7 @@ telepathy_PYTHON = \
- 
- # telepathy._generated.* auto-generated modules
- spec_dir = $(top_srcdir)/spec
--spec_files := $(patsubst $(spec_dir)%.xml,_generated%.py,$(wildcard $(spec_dir)/*.xml))
-+spec_files := $(filter-out _generated/errors.py, $(patsubst $(spec_dir)%.xml,_generated%.py,$(wildcard $(spec_dir)/*.xml)))
- 
- BUILT_SOURCES = \
- 	_generated/interfaces.py \
diff --git a/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch b/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
deleted file mode 100644
index f613fdc..0000000
--- a/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Pending
-
-automake 1.12 has deprecated use of mkdir_p, and it recommends
-use of MKDIR_P instead. Changed the code to avoid these kind 
-of warning-errors.
-
-| make[1]: _generated/: Command not found
-| make[1]: *** [_generated/__init__.py] Error 127
-| make[1]: Leaving directory `/srv/home/nitin/builds2/build0/tmp/work/i586-poky-linux/telepathy-python-0.15.19-r4/telepathy-python-0.15.19/src'
-| make: *** [all-recursive] Error 1
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/07/10
-Index: telepathy-python-0.15.19/src/Makefile.am
-===================================================================
---- telepathy-python-0.15.19.orig/src/Makefile.am
-+++ telepathy-python-0.15.19/src/Makefile.am
-@@ -55,7 +55,7 @@ _generated/errors.py: _generated/__init_
- 	    $(spec_dir)/all.xml
- 
- _generated/__init__.py:
--	$(AM_V_GEN)$(mkdir_p) $(dir $@)
-+	$(AM_V_GEN)$(MKDIR_P) $(dir $@)
- 	@echo "# Placeholder for package" > $@
- 
- _generated/%.py: _generated/__init__.py $(tools_dir)/spec-to-python.xsl $(spec_dir)/%.xml
diff --git a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
deleted file mode 100644
index 1716702..0000000
--- a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Telepathy IM framework - Python package"
-HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/utils.py;beginline=1;endline=17;md5=9a07d1a9791a7429a14e7b25c6c86822"
-
-DEPENDS = "libxslt-native"
-RDEPENDS_${PN} += "python-dbus"
-
-SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
-           file://parallel_make.patch \
-           file://remove_duplicate_install.patch \
-           file://telepathy-python_fix_for_automake_1.12.patch"
-
-PR = "r6"
-
-inherit autotools pythonnative
-
-SRC_URI[md5sum] = "f7ca25ab3c88874015b7e9728f7f3017"
-SRC_URI[sha256sum] = "244c0e1bf4bbd78ae298ea659fe10bf3a73738db550156767cc2477aedf72376"
-
-FILES_${PN} += "\
-    ${libdir}/python*/site-packages/telepathy/*.py \
-    ${libdir}/python*/site-packages/telepathy/*/*.py \
-    "
-
-do_install_append () {
-	rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyc
-	rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyo
-	rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyc
-	rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyo
-}
-- 
1.7.10.4


