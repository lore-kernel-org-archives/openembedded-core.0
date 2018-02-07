Return-Path: <carlos.rodriguez@ridgerun.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 342857843F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 21:30:32 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id m197so1498039vka.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Feb 2018 13:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ridgerun-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tFyyj1EaE3MFEdIUTVcydtupuP4THsJXHDgQZ+/ZIs0=;
	b=zV2k+G0n7i7+wCRDkqebd72KT+9Z13xpZlRhTx+LaQJ61osIj3WHlcZ88oWDGiXp/5
	fPD8wda8gJz0E58RacwO8mnXVoQIwDTnIgMAqf4U/CSnfwxjM4IE0KKRv2GaOabADumX
	UUj2YIRBO5SFQLGFcUL08/a7Rk+8Fy0y0+X57VXaOxZRaVjcu+qsY/c8FNvHQwopoXMs
	prodiSTw5+zdgyF0YEA1b2F07EchJxgsDBn5uZDVtfyblDcPwnOhhphScfVmpMmpMmLA
	Y0PJ0cESGxq31Dyi66HsKltMfwgCVqaqBpHbmIe7fUZxPiQzVeFJsLgg92pjiGlOiXpw
	4/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tFyyj1EaE3MFEdIUTVcydtupuP4THsJXHDgQZ+/ZIs0=;
	b=RzA9RViYMf8Fajs07i30171cTwFB1fHXrDzQsMYVKTLVvT7mKc/H35NsodFmEbhjIp
	1ospr5qN32Tm42b95Iox7qSa3qWB70FKI8MNBAB0yYrT8fpsw4kFxgPGdxZ7zND/D0iH
	Om0/xvK6z0qf63vloy+9ZRY5zJDYjMe8QEnSQmapeOEP20Q9005c5PRCGL1NjNdGViVJ
	T2Wd8EDbumo2U0EJSgOHCxzSn7Kl9xHeFDuNhaIwkH5fPvH5pBcdno5u/XCjpiFC3r82
	Wq5yYP8pQbnXCi80AR99m40GkrDTHK9ONLmlZu9nlUwRKH1NZSDD3UknH5uLd3GFeFbr
	WmOg==
X-Gm-Message-State: APf1xPDxKpzakCWtq4d6bCp/C9EQBhZvWBNpl54iDYGffdqU/4eTIDuJ
	pO317EHN34eMAhalUovCQ0DtvTJW
X-Google-Smtp-Source: AH8x224cABfC+5SPU8QvMieRlBeXsGowVWQaBXHlNW45R4kJFh5DifvgXFGCLMVWqITaZLttf+TMjQ==
X-Received: by 10.31.151.151 with SMTP id z145mr6130035vkd.40.1518039033927;
	Wed, 07 Feb 2018 13:30:33 -0800 (PST)
Received: from crodriguez.cr.ridgerun.com ([201.206.221.6])
	by smtp.gmail.com with ESMTPSA id d11sm797871vke.37.2018.02.07.13.30.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Feb 2018 13:30:33 -0800 (PST)
From: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Feb 2018 15:30:23 -0600
Message-Id: <1518039023-29531-2-git-send-email-carlos.rodriguez@ridgerun.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1518039023-29531-1-git-send-email-carlos.rodriguez@ridgerun.com>
References: <1518039023-29531-1-git-send-email-carlos.rodriguez@ridgerun.com>
Subject: [PATCH 2/2] gstd: Add Gst-Deamon recipe
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
X-List-Received-Date: Wed, 07 Feb 2018 21:30:33 -0000

GStreamer Daemon, also called gstd, is a GStreamer framework
for controlling audio and video streaming using TCP connection
messages. Qt applications, web interfaces, and GStreamer element
test suites show different ways the framework can be utilized.
GStreamer Daemon is gst-launch on steroids where you can create a
GStreamer pipeline, play, pause, change speed, skip around, and
even change element parameter settings all while the pipeline
is active.

Signed-off-by: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
---
 meta/recipes-multimedia/gstreamer/gstd.inc         | 25 +++++++++
 .../gstd/0001-gstd-yocto-compatibility.patch       | 63 ++++++++++++++++++++++
 meta/recipes-multimedia/gstreamer/gstd_1.0.bb      |  3 ++
 3 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstd.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstd/0001-gstd-yocto-compatibility.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstd_1.0.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstd.inc b/meta/recipes-multimedia/gstreamer/gstd.inc
new file mode 100644
index 0000000..3e23521
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstd.inc
@@ -0,0 +1,25 @@
+DESCRIPTION = "RidgeRun Gstreamer Daemon 1.0"
+SUMMARY = "GStreamer framework for controlling audio and video streaming using TCP connection messages"
+HOMEPAGE = "https://developer.ridgerun.com/wiki/index.php?title=Gstd-1.0"
+SECTION = "multimedia"
+LICENSE = "GPLv2+"
+
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad gstreamer1.0-rtsp-server json-glib libdaemon"
+
+SRCBRANCH ?= "master"
+SRCREV = "097a086a8606dcb368c7d38c7ec4fefc2497401b"
+SRC_URI = "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=https;branch=${SRCBRANCH} \
+	   file://0001-gstd-yocto-compatibility.patch"
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG_CONFARGS = " \
+	--disable-gtk-doc \
+"
+
+inherit autotools pkgconfig gettext
+
+do_configure() {
+${S}/autogen.sh
+oe_runconf
+}
diff --git a/meta/recipes-multimedia/gstreamer/gstd/0001-gstd-yocto-compatibility.patch b/meta/recipes-multimedia/gstreamer/gstd/0001-gstd-yocto-compatibility.patch
new file mode 100644
index 0000000..ddc1831
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstd/0001-gstd-yocto-compatibility.patch
@@ -0,0 +1,63 @@
+From eaf51d6420c63713f62025583681007c3502d387 Mon Sep 17 00:00:00 2001
+From: Carlos <carlos.rodriguez@ridgerun.com>
+Date: Fri, 15 Dec 2017 10:14:05 -0600
+Subject: [PATCH] gstd:yocto compatibility
+
+---
+ autogen.sh                      | 8 +++++++-
+ docs/reference/gstd/Makefile.am | 2 +-
+ gstd/Makefile.am                | 2 +-
+ 3 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index 66dbd42..793ee2f 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -21,7 +21,11 @@
+ # ACLOCAL, AUTOPOINT and/or LIBTOOLIZE to the right versions, or leave them
+ # unset and get the defaults
+ 
+-gtkdocize || exit 1
++test -n "$srcdir" || srcdir=`dirname "$0"`
++test -n "$srcdir" || srcdir=.
++
++olddir=`pwd`
++cd "$srcdir"
+ 
+ autoreconf --verbose --force --install || {
+  echo 'autogen.sh failed';
+@@ -31,3 +35,5 @@ autoreconf --verbose --force --install || {
+ echo
+ echo "Now run './configure' with your system settings followed by 'make' to compile this module."
+ echo
++
++cd "$olddir"
+diff --git a/docs/reference/gstd/Makefile.am b/docs/reference/gstd/Makefile.am
+index f860fa1..153a13b 100644
+--- a/docs/reference/gstd/Makefile.am
++++ b/docs/reference/gstd/Makefile.am
+@@ -66,7 +66,7 @@ GTKDOC_LIBS=$(top_builddir)/gstd/libgstd-core.la
+ 
+ 
+ # This includes the standard gtk-doc make rules, copied by gtkdocize.
+-include $(top_srcdir)/docs/gtk-doc.make
++# include $(top_srcdir)/docs/gtk-doc.make
+ 
+ # Comment this out if you want 'make check' to test you doc status
+ # and run some sanity checks
+diff --git a/gstd/Makefile.am b/gstd/Makefile.am
+index 13c551d..11fe202 100644
+--- a/gstd/Makefile.am
++++ b/gstd/Makefile.am
+@@ -49,7 +49,7 @@ bin_PROGRAMS = gstd
+ 
+ gstd_SOURCES = gstd.c
+ gstd_CFLAGS = $(GST_CFLAGS) $(GIO_CFLAGS) $(GJSON_CFLAGS)
+-gstd_LDFLAGS = $(GST_LIBS) $(GIO_LIBS) $(GJSON_LIBS) -Wl,-rpath -Wl,$(libdir)
++gstd_LDFLAGS = $(GST_LIBS) $(GIO_LIBS) $(GJSON_LIBS)
+ gstd_LDADD = libgstd-core.la
+ 
+ gstdincludedir = $(includedir)/gstd
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstd_1.0.bb b/meta/recipes-multimedia/gstreamer/gstd_1.0.bb
new file mode 100644
index 0000000..94f6b57
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstd_1.0.bb
@@ -0,0 +1,3 @@
+require gstd.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
1.9.1


