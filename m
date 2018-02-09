Return-Path: <carlos.rodriguez@ridgerun.com>
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3BB1C6067C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 19:50:03 +0000 (UTC)
Received: by mail-ua0-f170.google.com with SMTP id q8so5898740uae.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Feb 2018 11:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ridgerun-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=vRrLBhD7bIsc4gua4j3rIFwIwT29CkajR48mZY4pyBk=;
	b=0dsyxvaGoQQuD9DbcdT9TL63QskLxjKWEOvMw7+N73uQy9QvIrXIW1H6djP3POZ0vH
	QSuu/27/qZGyJLHdczacvbUFlyBEPuXnfhn5QeAoOJrMNiHa994C1vhtb6hOgQa1i+Cs
	UuFWM4fmdDqqcmk0OdWQQxLIV1c5kOa1k/ISC6Ecls8i5L2idu5AgVOlYlmz0T5q/iOc
	jxBfv5JLXa1q75B4W3HjR0DjD/pMCB6F3pgg22iUsHxI4vH77v82EQn+gNeVwcUtsW2l
	KdQd/NorvtfcF/BIUAbOFPN+R9wexeQG/7uv3qDUm1C7/Ulxd2x/hmxoTx+RZLhD5jgQ
	vx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vRrLBhD7bIsc4gua4j3rIFwIwT29CkajR48mZY4pyBk=;
	b=E/SVWh3fDdyIFI+v7jy+BpyAa2Z8CA6J7n+zWS8eWTBK87vIvESjGAcCG+3RtkDh1J
	HaD6p9IigWaBTbs6LJL2l/L3cso3G/wIl51lRx5uGXaB57IyAjGBrFeiBa7G8t/S17Ca
	k8gzKE636/85yprE5eTFQ3zW0TKWjEE6jynlJ2piWbWvcsukgMIwb5FZdnQs6n7NHdTX
	PCCwwfbewXY+QiWKq19P+ghpI/hRq/RgYngbW8BGSwbIsPsJZN/12yjo0TYqkqRoq4Xs
	W+QB45zx5FEKmPhsHPidO1jx9LTi4/aSGTyGiVki3Fd18n2+6q3yZH1t+RBa5KPOccB+
	CBtw==
X-Gm-Message-State: APf1xPCLxvf87N/Fu+eyRlBKM5Nt1hUmedh+OjwGMnEPm9kIvQJ6GErZ
	wLT7BFZsgsgR9YxekWeuHcIiHuEj
X-Google-Smtp-Source: AH8x224KADf4hFtTDxrLoj+KSQ+eIBFaTucV5Cd3go2alSZ/kqriZSzZA5yr2eNH0APQpXjQX5KqFw==
X-Received: by 10.176.2.242 with SMTP id 105mr3883081uah.23.1518205804768;
	Fri, 09 Feb 2018 11:50:04 -0800 (PST)
Received: from crodriguez.cr.ridgerun.com ([201.206.221.6])
	by smtp.gmail.com with ESMTPSA id u5sm2995891uaf.7.2018.02.09.11.50.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Feb 2018 11:50:04 -0800 (PST)
From: Carlos Rodriguez <carlos.rodriguez@ridgerun.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Feb 2018 13:49:47 -0600
Message-Id: <1518205787-575-1-git-send-email-carlos.rodriguez@ridgerun.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v2] gstd: Add Gst-Deamon recipe
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
X-List-Received-Date: Fri, 09 Feb 2018 19:50:04 -0000

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
 .../recipes-multimedia/gstreamer-1.0/gstd.inc      | 25 +++++++++
 .../gstd/0001-gstd-yocto-compatibility.patch       | 63 ++++++++++++++++++++++
 .../recipes-multimedia/gstreamer-1.0/gstd_1.0.bb   |  3 ++
 3 files changed, 91 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
new file mode 100644
index 0000000..3e23521
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd.inc
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
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
new file mode 100644
index 0000000..ddc1831
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto-compatibility.patch
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
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
new file mode 100644
index 0000000..94f6b57
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb
@@ -0,0 +1,3 @@
+require gstd.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
1.9.1


