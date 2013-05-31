Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 384FF6A4BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 19:15:52 +0000 (UTC)
Received: from localhost.localdomain (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id CE6B121403
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 21:15:52 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 21:15:58 +0200
Message-Id: <1370027758-22849-4-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <1370027758-22849-1-git-send-email-dv@pseudoterminal.org>
References: <1370027758-22849-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 3/3] gstreamer: added GStreamer 1.0 recipes
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
X-List-Received-Date: Fri, 31 May 2013 19:15:53 -0000

Originally from the https://github.com/dv1/meta-gstreamer1.0 repository,
the patches were copied with only one change:
gstreamer1.0-plugins-package.inc was removed, since gst-plugins-package.inc
is identical except for the LIBV variable.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-libav.inc               |  34 +++++++
 ...-Disable-yasm-for-libav-when-disable-yasm.patch |  33 +++++++
 .../gstreamer1.0-libav/libav_e500mc.patch          |  21 +++++
 .../gstreamer/gstreamer1.0-libav_1.0.7.bb          |  27 ++++++
 .../gstreamer/gstreamer1.0-libav_git.bb            |  27 ++++++
 .../gstreamer/gstreamer1.0-omx.inc                 |  42 +++++++++
 .../0001-omx-fixed-type-error-in-printf-call.patch |  30 ++++++
 .../gstreamer/gstreamer1.0-omx_1.0.0.bb            |  12 +++
 .../gstreamer/gstreamer1.0-omx_git.bb              |  22 +++++
 .../gstreamer/gstreamer1.0-plugins-bad.inc         | 105 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.0.7.bb    |  12 +++
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |  26 +++++
 .../gstreamer/gstreamer1.0-plugins-base.inc        |  42 +++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.0.7.bb   |  11 +++
 .../gstreamer/gstreamer1.0-plugins-base_git.bb     |  18 ++++
 .../gstreamer/gstreamer1.0-plugins-good.inc        |  55 +++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_1.0.7.bb   |  11 +++
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |  17 ++++
 .../gstreamer/gstreamer1.0-plugins-ugly.inc        |  33 +++++++
 .../gstreamer/gstreamer1.0-plugins-ugly_1.0.7.bb   |  10 ++
 .../gstreamer/gstreamer1.0-plugins-ugly_git.bb     |  16 ++++
 .../gstreamer/gstreamer1.0-plugins.inc             |  57 +++++++++++
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  23 +++++
 .../0001-Fix-crash-with-gst-inspect.patch          |  28 ++++++
 .../gstreamer/gstreamer1.0_1.0.7.bb                |  13 +++
 .../gstreamer/gstreamer1.0_git.bb                  |  17 ++++
 26 files changed, 742 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-Disable-yasm-for-libav-when-disable-yasm.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/libav_e500mc.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.0.7.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx/0001-omx-fixed-type-error-in-printf-call.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.0.0.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.7.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.7.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.0.7.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.0.7.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-crash-with-gst-inspect.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.0.7.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
new file mode 100644
index 0000000..c77a085
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -0,0 +1,34 @@
+DESCRIPTION = "Libav-based GStreamer 1.x plugin"
+SECTION = "multimedia"
+LICENSE = "GPLv2+ & LGPLv2+ & ( (GPLv2+ & LGPLv2.1+) | (GPLv3+ & LGPLv3+) )"
+LICENSE_FLAGS = "commercial"
+HOMEPAGE = "http://www.gstreamer.net/"
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base zlib bzip2"
+
+inherit autotools pkgconfig
+
+PR = "r1"
+
+
+# CAUTION: Using the system libav is not recommended. Since the libav API is changing all the time,
+# compilation errors (and other, more subtle bugs) can happen. It is usually better to rely on the
+# libav copy included in the gst-libav package.
+PACKAGECONFIG ??= " "
+PACKAGECONFIG[libav] = "--with-system-libav,,libav"
+PACKAGECONFIG[lgpl]  = "--enable-lgpl,,"
+PACKAGECONFIG[yasm]  = "--enable-yasm,--disable-yasm,yasm-native"
+
+
+GSTREAMER_1_0_DEBUG ?= "--disable-debug"
+
+LIBAV_EXTRA_CONFIGURE = "--with-libav-extra-configure"
+LIBAV_EXTRA_CONFIGURE_COMMON = \
+'${LIBAV_EXTRA_CONFIGURE}="${LIBAV_EXTRA_CONFIGURE_COMMON_ARG}"'
+
+EXTRA_OECONF = "${LIBAV_EXTRA_CONFIGURE_COMMON}"
+
+FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
+FILES_${PN}-dbg += "${libdir}/gstreamer-1.0/.debug"
+FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
+FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-Disable-yasm-for-libav-when-disable-yasm.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-Disable-yasm-for-libav-when-disable-yasm.patch
new file mode 100644
index 0000000..1d99ad1
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-Disable-yasm-for-libav-when-disable-yasm.patch
@@ -0,0 +1,33 @@
+From 54bba228ea52d01fd84941d97be23c03f9862b64 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Sat, 6 Apr 2013 01:22:22 +0200
+Subject: [PATCH] Disable yasm for libav when --disable-yasm
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Shane Wang <shane.wang@intel.com>
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ configure.ac | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 22ede88..ef3c050 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -305,6 +305,12 @@ else
+     emblibav_configure_args="$emblibav_configure_args --enable-gpl"
+   fi
+
++  AC_ARG_ENABLE(yasm,
++              [AC_HELP_STRING([--disable-yasm], [disable use of yasm assembler])])
++  if test "x$enable_yasm" = "xno"; then
++    emblibav_configure_args="$emblibav_configure_args --disable-yasm"
++  fi
++
+   # if we are cross-compiling, tell libav so
+   case $host in
+       *android*)
+-- 
+1.8.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/libav_e500mc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/libav_e500mc.patch
new file mode 100644
index 0000000..eba4988
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/libav_e500mc.patch
@@ -0,0 +1,21 @@
+diff --git a/gst-libs/ext/libav/configure b/gst-libs/ext/libav/configure
+index 8473069..4f74952 100755
+--- a/gst-libs/ext/libav/configure
++++ b/gst-libs/ext/libav/configure
+Fix gst-ffmpeg build issues for libav on e500mc (fsl-p4080)
+
+Upstream-Status: Backport
+
+Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
+
+@@ -2210,6 +2210,10 @@ elif enabled ppc; then
+             cpuflags="-mcpu=cell"
+             enable ldbrx
+         ;;
++        e500mc)
++            cpuflags="-mcpu=e500mc"
++            disable altivec
++        ;;
+         e500v2)
+             cpuflags="-mcpu=8548 -mhard-float -mfloat-gprs=double"
+             disable altivec
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.0.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.0.7.bb
new file mode 100644
index 0000000..f486a9d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.0.7.bb
@@ -0,0 +1,27 @@
+include gstreamer1.0-libav.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
+                    file://ext/libav/gstav.h;beginline=1;endline=18;md5=ff65467b0c53cdfa98d0684c1bc240a9 \
+                    file://gst-libs/ext/libav/LICENSE;md5=abc3b8cb02856aa7823bbbd162d16232 \
+                    file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
+                    file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+SRC_URI = " \
+    http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
+    file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
+    file://libav_e500mc.patch \
+    "
+
+SRC_URI[md5sum] = "68e1eb18a58907e21b81d26ce7db056a"
+SRC_URI[sha256sum] = "aefa679d14e7a6558673cfbf401b9c01f1903bb52e5dc08332e9001d25a7ba7a"
+
+LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
+  --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
+  --ranlib='${RANLIB}' \
+  ${GSTREAMER_1_0_DEBUG}"
+
+S = "${WORKDIR}/gst-libav-${PV}"
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
new file mode 100644
index 0000000..69b771d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
@@ -0,0 +1,27 @@
+DEFAULT_PREFERENCE = "-1"
+
+include gstreamer1.0-libav.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
+                    file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
+                    file://gst-libs/ext/libav/LICENSE;md5=23a54f59b82572c203a559346e89ed57 \
+                    file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
+                    file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-libav;branch=master;protocol=git"
+S = "${WORKDIR}/git"
+
+SRCREV = "127202d6f65584891dabf92be031f0d170b0e7f1"
+
+LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
+  --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
+  ${GSTREAMER_1_0_DEBUG}"
+
+do_configure() {
+	./autogen.sh --noconfigure
+	oe_runconf
+}
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
new file mode 100644
index 0000000..324d3f9
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
@@ -0,0 +1,42 @@
+DESCRIPTION = "OpenMAX IL plugins for GStreamer"
+SECTION = "multimedia"
+LICENSE = "LGPLv2.1"
+LICENSE_FLAGS = "commercial"
+HOMEPAGE = "http://www.gstreamer.net/"
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
+RDEPENDS_${PN} = "libomxil"
+
+inherit autotools pkgconfig gettext
+
+acpaths = "-I ${S}/common/m4 -I ${S}/m4"
+
+PR = "r1"
+
+GSTREAMER_1_0_OMX_TARGET ?= "bellagio"
+GSTREAMER_1_0_OMX_CORE_NAME ?= "/usr/lib/libomxil-bellagio.so.0"
+
+EXTRA_OECONF += "--disable-valgrind --with-omx-target=${GSTREAMER_1_0_OMX_TARGET}"
+
+python __anonymous () {
+    omx_target = d.getVar("GSTREAMER_1_0_OMX_TARGET", True)
+    if omx_target in ['generic', 'bellagio']:
+        srcdir = d.getVar("S", True)
+        # Bellagio headers are incomplete (they are missing the OMX_VERSION_MAJOR,#
+        # OMX_VERSION_MINOR, OMX_VERSION_REVISION, and OMX_VERSION_STEP macros);
+        # appending a directory path to gst-omx' internal OpenMAX IL headers fixes this
+        d.appendVar("CFLAGS", " -I%s/omx/openmax" % srcdir)
+    elif omx_target == "rpi":
+        # Dedicated Raspberry Pi OpenMAX IL support makes this package machine specific
+        d.setVar("PACKAGE_ARCH", d.getVar("MACHINE_ARCH", True))
+}
+
+set_omx_core_name() {
+	sed -i -e "s;^core-name=.*;core-name=${GSTREAMER_1_0_OMX_CORE_NAME};" "${D}/etc/xdg/gstomx.conf"
+}
+do_install[postfuncs] += " set_omx_core_name "
+
+FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
+FILES_${PN}-dbg += "${libdir}/gstreamer-1.0/.debug"
+FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
+FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx/0001-omx-fixed-type-error-in-printf-call.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx/0001-omx-fixed-type-error-in-printf-call.patch
new file mode 100644
index 0000000..a428ac9
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx/0001-omx-fixed-type-error-in-printf-call.patch
@@ -0,0 +1,30 @@
+From f629e041e9f678fcd86ad764a15117dff63c271c Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Sat, 27 Apr 2013 02:50:25 +0200
+Subject: [PATCH] omx: fixed type error in printf call
+
+%zu expects size_t
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=699008]
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ omx/gstomx.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/omx/gstomx.c b/omx/gstomx.c
+index a2945ed..1eca7cc 100644
+--- a/omx/gstomx.c
++++ b/omx/gstomx.c
+@@ -1630,7 +1630,7 @@ gst_omx_port_allocate_buffers_unlocked (GstOMXPort * port,
+ 
+   GST_INFO_OBJECT (comp->parent,
+       "Allocating %d buffers of size %zu for %s port %u", n,
+-      port->port_def.nBufferSize, comp->name, (guint) port->index);
++      (size_t) (port->port_def.nBufferSize), comp->name, (guint) port->index);
+ 
+   if (!port->buffers)
+     port->buffers = g_ptr_array_sized_new (n);
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.0.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.0.0.bb
new file mode 100644
index 0000000..f5956c6
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.0.0.bb
@@ -0,0 +1,12 @@
+include gstreamer1.0-omx.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
+
+SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "bb34b5742223267298bcffc209104a92"
+SRC_URI[sha256sum] = "7a1d8d28d70dacc6bd3c7ee7d7e40df6d5a1d38d7c256d5c9c5c8ef15c005014"
+
+S = "${WORKDIR}/gst-omx-${PV}"
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
new file mode 100644
index 0000000..2282b72
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
@@ -0,0 +1,22 @@
+DEFAULT_PREFERENCE = "-1"
+
+include gstreamer1.0-omx.inc
+
+DEPENDS = "gstreamer1.0-plugins-bad"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
+
+SRC_URI = " \
+    git://anongit.freedesktop.org/gstreamer/gst-omx;branch=master;protocol=git \
+    file://0001-omx-fixed-type-error-in-printf-call.patch \    
+    "
+S = "${WORKDIR}/git"
+
+SRCREV = "a2db76b048db278ef0aa798e106b7594264e06c0"
+
+do_configure() {
+	./autogen.sh --noconfigure
+	oe_runconf
+}
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
new file mode 100644
index 0000000..38cf512
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -0,0 +1,105 @@
+require gstreamer1.0-plugins.inc
+
+LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+ "
+
+DEPENDS += "gstreamer1.0-plugins-base bzip2"
+
+SRC_URI[md5sum] = "d1493d1219b836a8cbf54f4fba962420"
+SRC_URI[sha256sum] = "5f49e6353fdc855834b5beb054b3a47ef5fa558006c7eda6d2ec07b36315c2ab"
+
+PR = "r1"
+
+S = "${WORKDIR}/gst-plugins-bad-${PV}"
+
+inherit gettext
+
+
+PACKAGECONFIG ??= " \
+    curl eglgles wayland \
+    "
+
+PACKAGECONFIG[assrender] = "--enable-assrender,--disable-assrender,libass"
+PACKAGECONFIG[curl]      = "--enable-curl,--disable-curl,curl"
+PACKAGECONFIG[eglgles]   = "--enable-eglgles,--disable-eglgles,virtual/egl virtual/libgles2"
+PACKAGECONFIG[faad]      = "--enable-faad,--disable-faad,faad2"
+PACKAGECONFIG[libmms]    = "--enable-libmms,--disable-libmms,libmms"
+PACKAGECONFIG[modplug]   = "--enable-modplug,--disable-modplug,libmodplug"
+PACKAGECONFIG[mpg123]    = "--enable-mpg123,--disable-mpg123,mpg123"
+PACKAGECONFIG[opus]      = "--enable-opus,--disable-opus,libopus"
+PACKAGECONFIG[flite]     = "--enable-flite,--disable-flite,flite-alsa"
+PACKAGECONFIG[opencv]    = "--enable-opencv,--disable-opencv,opencv"
+PACKAGECONFIG[wayland]   = "--enable-wayland,--disable-wayland,wayland"
+
+
+
+# these plugins have not been ported to 1.0 (yet):
+#   directdraw vcd uvch264 apexsink cdaudio cog dc1394 directfb dirac fbdev jasper
+#   kate ladspa lv2 linsys musepack musicbrainz mythtv nas neon ofa openal rsvg
+#   timidity teletextdec wildmidi sdl sndfile xvid wininet acm gsettings sndio
+#mfc hls openjpeg sbc 
+EXTRA_OECONF += " \
+    --enable-dvb \
+    --enable-shm \
+    --disable-uvch264 \
+    --disable-vcd \
+    --disable-fbdev \
+    --disable-examples \
+    --disable-experimental \
+    --disable-celt \
+    --disable-chromaprint \
+    --disable-decklink \
+    --disable-dts \
+    --disable-faac \
+    --disable-gme \
+    --disable-gsm \
+    --disable-mpeg2enc \
+    --disable-mplex \
+    --disable-resindvd \
+    --disable-rtmp \
+    --disable-schro \
+    --disable-soundtouch \
+    --disable-spandsp \
+    --disable-vdpau \
+    --disable-acm \
+    --disable-android_media \
+    --disable-apexsink \
+    --disable-apple_media \
+    --disable-avc \
+    --disable-cdaudio \
+    --disable-cog \
+    --disable-dc1394 \
+    --disable-dirac \
+    --disable-direct3d \
+    --disable-direct3d9 \
+    --disable-directdraw \
+    --disable-directsound \
+    --disable-directshow \
+    --disable-gsettings \
+    --disable-kate \
+    --disable-ladspa \
+    --disable-linsys \
+    --disable-lv2 \
+    --disable-mimic \
+    --disable-musepack \
+    --disable-mythtv \
+    --disable-nas \
+    --disable-ofa \
+    --disable-osx_video \
+    --disable-pvr \
+    --disable-quicktime \
+    --disable-sndio \
+    --disable-spc \
+    --disable-swfdec \
+    --disable-teletextdec \
+    --disable-timidity \
+    --disable-voaacenc \
+    --disable-voamrwbenc \
+    --disable-wildmidi \
+    --disable-wininet \
+    --disable-xvid \
+    --disable-zbar \
+    ${GSTREAMER_1_0_ORC} \
+    "
+
+ARM_INSTRUCTION_SET = "arm"
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.7.bb
new file mode 100644
index 0000000..bca3567
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.7.bb
@@ -0,0 +1,12 @@
+include gstreamer1.0-plugins-bad.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
+                    file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a \
+                    file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
+                    file://gst/tta/crc32.h;beginline=12;endline=29;md5=71a904d99ce7ae0c1cf129891b98145c"
+
+SRC_URI[md5sum] = "d1493d1219b836a8cbf54f4fba962420"
+SRC_URI[sha256sum] = "5f49e6353fdc855834b5beb054b3a47ef5fa558006c7eda6d2ec07b36315c2ab"
+
+S = "${WORKDIR}/gst-plugins-bad-${PV}"
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
new file mode 100644
index 0000000..e1a5904
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -0,0 +1,26 @@
+DEFAULT_PREFERENCE = "-1"
+
+include gstreamer1.0-plugins-bad.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
+                    file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a \
+                    file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
+                    file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50"
+
+S = "${WORKDIR}/git"
+
+SRCREV = "6e5db57d2446a753aaa76bee268e1f95600b14ce"
+
+PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,bluez4"
+PACKAGECONFIG[sbc] = "--enable-sbc,--disable-sbc,sbc"
+PACKAGECONFIG[hls] = "--enable-hls,--disable-hls,gnutls"
+
+EXTRA_OECONF += " \
+    -disable-openjpeg \
+    "
+
+do_configure() {
+	./autogen.sh --noconfigure
+	oe_runconf
+}
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
new file mode 100644
index 0000000..b2c8995
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -0,0 +1,42 @@
+require gstreamer1.0-plugins.inc
+
+LICENSE = "GPLv2+ & LGPLv2+"
+
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv', '', d)}"
+DEPENDS += "freetype liboil util-linux"
+
+PR = "r1"
+
+inherit gettext
+
+
+PACKAGECONFIG ??= " \
+    ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+    ivorbis ogg theora vorbis \
+    "
+
+X11DEPENDS = "virtual/libx11 libsm libxrender"
+X11ENABLEOPTS = "--enable-x --enable-xvideo --enable-xshm"
+X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
+PACKAGECONFIG[x11]     = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
+PACKAGECONFIG[alsa]    = "--enable-alsa,--disable-alsa,alsa-lib"
+PACKAGECONFIG[ivorbis] = "--enable-ivorbis,--disable-ivorbis,tremor"
+PACKAGECONFIG[ogg]     = "--enable-ogg,--disable-ogg,libogg"
+PACKAGECONFIG[theora]  = "--enable-theora,--disable-theora,libtheora"
+PACKAGECONFIG[vorbis]  = "--enable-vorbis,--disable-vorbis,libvorbis"
+PACKAGECONFIG[pango]   = "--enable-pango,--disable-pango,pango"
+
+
+# cdparanoia and libvisual do not seem to exist anywhere in OE
+EXTRA_OECONF += " \
+    --disable-freetypetest \
+    --disable-oggtest \
+    --disable-vorbistest \
+    --disable-cdparanoia \
+    --disable-libvisual \
+    ${GSTREAMER_1_0_ORC} \
+"
+
+FILES_${PN} += "${datadir}/gst-plugins-base"
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.7.bb
new file mode 100644
index 0000000..72a4aee
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.7.bb
@@ -0,0 +1,11 @@
+include gstreamer1.0-plugins-base.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=622921ffad8cb18ab906c56052788a3f \
+                    file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
+                   "
+
+SRC_URI[md5sum] = "b5b43cfbf82b413ce2e07a190d87e68f"
+SRC_URI[sha256sum] = "014805e50b696bc06c3862ea656df079fc0b5fef0c10f16e9f085f290545677a"
+
+S = "${WORKDIR}/gst-plugins-base-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
new file mode 100644
index 0000000..a894abe
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
@@ -0,0 +1,18 @@
+DEFAULT_PREFERENCE = "-1"
+
+include gstreamer1.0-plugins-base.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
+                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
+                    file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
+                   "
+
+S = "${WORKDIR}/git"
+
+SRCREV = "8d4cb64a4b9d84b10076bf350f80a0d6ea68ec2d"
+
+do_configure() {
+	./autogen.sh --noconfigure
+	oe_runconf
+}
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
new file mode 100644
index 0000000..3d0f970
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -0,0 +1,55 @@
+require gstreamer1.0-plugins.inc
+
+LICENSE = "GPLv2+ & LGPLv2.1+"
+
+# libid3tag
+DEPENDS += "gstreamer1.0-plugins-base gconf zlib bzip2"
+
+PR = "r1"
+
+inherit gettext gconf
+
+
+PACKAGECONFIG ??= " \
+    ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
+    cairo flac gdk-pixbuf jpeg libpng soup speex taglib \
+    "
+
+X11DEPENDS = "virtual/libx11 libsm libxrender"
+X11ENABLEOPTS = "--enable-x --enable-xvideo --enable-xshm"
+X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
+PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
+PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
+PACKAGECONFIG[cairo]      = "--enable-cairo,--disable-cairo,cairo"
+PACKAGECONFIG[flac]       = "--enable-flac,--disable-flac,flac"
+PACKAGECONFIG[gdk-pixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
+PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
+PACKAGECONFIG[jpeg]       = "--enable-jpeg,--disable-jpeg,jpeg"
+PACKAGECONFIG[libpng]     = "--enable-libpng,--disable-libpng,libpng"
+PACKAGECONFIG[soup]       = "--enable-soup,--disable-soup,libsoup-2.4"
+PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
+PACKAGECONFIG[taglib]     = "--enable-taglib,--disable-taglib,taglib"
+PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
+PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
+
+
+EXTRA_OECONF += " \
+    --disable-directsound \
+    --disable-waveform \
+    --disable-oss \
+    --disable-oss4 \
+    --disable-sunaudio \
+    --disable-osx_audio \
+    --disable-osx_video \
+    --disable-aalib \
+    --disable-libcaca \
+    --disable-libdv \
+    --disable-dv1394 \
+    --disable-shout2 \
+    --disable-examples \
+    ${GSTREAMER_1_0_ORC} \
+"
+
+FILES_${PN}-gconfelements += "${sysconfdir}/gconf/schemas/gstreamer-1.0.schemas"
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.0.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.0.7.bb
new file mode 100644
index 0000000..b2bcd44
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.0.7.bb
@@ -0,0 +1,11 @@
+include gstreamer1.0-plugins-good.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=622921ffad8cb18ab906c56052788a3f \
+                    file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
+
+SRC_URI[md5sum] = "e4b1c825475a9b478fe29e8e9f34516f"
+SRC_URI[sha256sum] = "a016a3b377c86658627aef902b9204108209100b2e88fcc3b695c392af1b4035"
+
+S = "${WORKDIR}/gst-plugins-good-${PV}"
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
new file mode 100644
index 0000000..8b11b20
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
@@ -0,0 +1,17 @@
+DEFAULT_PREFERENCE = "-1"
+
+include gstreamer1.0-plugins-good.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
+                    file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
+
+S = "${WORKDIR}/git"
+
+SRCREV = "fd0123800c8c1cf1468c0fa5d592ad0d0d8b4140"
+
+do_configure() {
+	./autogen.sh --noconfigure
+	oe_runconf
+}
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
new file mode 100644
index 0000000..4a54d1b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
@@ -0,0 +1,33 @@
+require gstreamer1.0-plugins.inc
+
+LICENSE = "GPLv2+ & LGPLv2.1+ & LGPLv2+"
+LICENSE_FLAGS = "commercial"
+
+DEPENDS += "gstreamer1.0-plugins-base libid3tag"
+
+PR = "r1"
+
+inherit gettext
+
+
+PACKAGECONFIG ??= " \
+    a52dec lame mad mpeg2dec \
+    "
+
+PACKAGECONFIG[a52dec]   = "--enable-a52dec,--disable-a52dec,liba52"
+PACKAGECONFIG[cdio]     = "--enable-cdio,--disable-cdio,libcdio"
+PACKAGECONFIG[dvdread]  = "--enable-dvdread,--disable-dvdread,libdvdread"
+PACKAGECONFIG[lame]     = "--enable-lame,--disable-lame,lame"
+PACKAGECONFIG[mad]      = "--enable-mad,--disable-mad,libmad"
+PACKAGECONFIG[mpeg2dec] = "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
+PACKAGECONFIG[x264]     = "--enable-x264,--disable-x264,x264"
+
+
+EXTRA_OECONF += " \
+    --disable-amrnb \
+    --disable-amrwb \
+    --disable-sidplay \
+    --disable-twolame \
+    ${GSTREAMER_1_0_ORC} \
+    "
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.0.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.0.7.bb
new file mode 100644
index 0000000..7e9b8aa
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.0.7.bb
@@ -0,0 +1,10 @@
+include gstreamer1.0-plugins-ugly.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+                    file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068 "
+
+SRC_URI[md5sum] = "8754edf6c3be235f232fb75ad11708bb"
+SRC_URI[sha256sum] = "b78b8cfabe322497da432a0f297dbb21862a033f95e8d4cd8f207eccb5288f2b"
+
+S = "${WORKDIR}/gst-plugins-ugly-${PV}"
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
new file mode 100644
index 0000000..2f72497
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
@@ -0,0 +1,16 @@
+DEFAULT_PREFERENCE = "-1"
+
+include gstreamer1.0-plugins-ugly.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+                    file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068 "
+
+S = "${WORKDIR}/git"
+
+SRCREV = "06b8ac10cee85c5c304ca320997aa8f44295a66f"
+
+do_configure() {
+	./autogen.sh --noconfigure
+	oe_runconf
+}
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
new file mode 100644
index 0000000..9484b20
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -0,0 +1,57 @@
+DESCRIPTION = "Plugins for GStreamer 1.x"
+HOMEPAGE = "http://gstreamer.freedesktop.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
+SECTION = "multimedia"
+DEPENDS = "gstreamer1.0"
+
+inherit autotools pkgconfig
+
+FILESPATH =. "${FILE_DIRNAME}/gst-plugins:"
+
+GSTREAMER_1_0_DEBUG ?= "--disable-debug"
+GSTREAMER_1_0_GIT_BRANCH ?= "master"
+EXTRA_OECONF = "--disable-valgrind ${GSTREAMER_1_0_DEBUG} --disable-examples "
+
+acpaths = "-I ${S}/common/m4 -I ${S}/m4"
+
+LIBV = "1.0"
+require gst-plugins-package.inc
+
+PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
+
+PACKAGES_DYNAMIC = "^${PN}-.*"
+
+# apply gstreamer hack after Makefile.in.in in source is replaced by our version from
+# ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before configure is executed 
+# http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/032233.html
+oe_runconf_prepend() {
+	if [ -e ${S}/po/Makefile.in.in ]; then
+		sed -i -e "1a\\" -e 'GETTEXT_PACKAGE = @GETTEXT_PACKAGE@' ${S}/po/Makefile.in.in
+	fi
+}
+
+python __anonymous () {
+    # check if expected prefix is present
+    prefix = "gstreamer1.0-"
+    bpn = d.getVar("BPN", True)
+    if not bpn.startswith(prefix):
+        bb.fatal('Invalid GStreamer 1.0 plugin package name "%s" : must start with "%s"' % (bpn, prefix))
+
+    # replaced prefix with "gst-", which is what is used for the tarball and repository filenames
+    gstpkg_basename = "gst-" + bpn[len(prefix):]
+    pv = d.getVar("PV", True)
+    branch = d.getVar("GSTREAMER_1_0_GIT_BRANCH", True)
+
+    if pv == "git":
+        d.setVar("SRC_URI", "git://anongit.freedesktop.org/gstreamer/%s;branch=%s;protocol=git" % (gstpkg_basename, branch))
+    else:
+        d.setVar("SRC_URI", "http://gstreamer.freedesktop.org/src/%s/%s-%s.tar.xz" % (gstpkg_basename, gstpkg_basename, pv))
+}
+
+delete_liblink_m4_file() {
+	# This m4 file contains nastiness which conflicts with libtool 2.2.2
+	rm "${S}/m4/lib-link.m4" || true
+}
+
+do_configure[prefuncs] += " delete_liblink_m4_file "
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
new file mode 100644
index 0000000..d7bbee1
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -0,0 +1,23 @@
+SUMMARY = "GStreamer 1.0 multimedia framework"
+DESCRIPTION = "GStreamer is a multimedia framework for encoding and decoding video and sound. \
+It supports a wide range of formats including mp3, ogg, avi, mpeg and quicktime."
+HOMEPAGE = "http://gstreamer.freedesktop.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
+SECTION = "multimedia"
+LICENSE = "LGPLv2+"
+DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
+
+PR = "r1"
+
+inherit autotools pkgconfig gettext
+
+GSTREAMER_1_DEBUG ?= "--disable-debug"
+EXTRA_OECONF = "--disable-docs-build --disable-dependency-tracking --with-check=no --disable-examples --disable-tests --disable-valgrind ${GSTREAMER_1_DEBUG}"
+
+RRECOMMENDS_${PN}_qemux86    += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
+RRECOMMENDS_${PN}_qemux86-64 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
+
+FILES_${PN} += " ${libdir}/gstreamer-1.0/*.so"
+FILES_${PN}-dev += " ${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a"
+FILES_${PN}-dbg += " ${libdir}/gstreamer-1.0/.debug/ ${libexecdir}/gstreamer-1.0/.debug/"
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-crash-with-gst-inspect.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-crash-with-gst-inspect.patch
new file mode 100644
index 0000000..94f5cc5
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-Fix-crash-with-gst-inspect.patch
@@ -0,0 +1,28 @@
+From 6b26f3dbf9bf577d71534ab7410de66d06e46ba2 Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Sat, 6 Apr 2013 23:52:11 +0200
+Subject: [PATCH] Fix crash with gst-inspect Chris Lord <chris@openedhand.com>
+
+Upstream-Status: Pending
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ tools/gst-inspect.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/gst-inspect.c b/tools/gst-inspect.c
+index 23b7c44..b79b02e 100644
+--- a/tools/gst-inspect.c
++++ b/tools/gst-inspect.c
+@@ -1556,7 +1556,7 @@ main (int argc, char *argv[])
+   g_option_context_add_main_entries (ctx, options, GETTEXT_PACKAGE);
+   g_option_context_add_group (ctx, gst_init_get_option_group ());
+   if (!g_option_context_parse (ctx, &argc, &argv, &err)) {
+-    g_printerr ("Error initializing: %s\n", err->message);
++    g_printerr ("Error initializing: %s\n", err ? err->message : "(null)");
+     return -1;
+   }
+   g_option_context_free (ctx);
+-- 
+1.8.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.0.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.0.7.bb
new file mode 100644
index 0000000..1423227
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.0.7.bb
@@ -0,0 +1,13 @@
+include gstreamer1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
+                    file://gst/gst.h;beginline=1;endline=21;md5=8e5fe5e87d33a04479fde862e238eaa4"
+
+SRC_URI = " \
+    http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
+    file://0001-Fix-crash-with-gst-inspect.patch \
+    "
+SRC_URI[md5sum] = "8f6066a37c71a0d0ff5fe5f7687fea12"
+SRC_URI[sha256sum] = "68cada7ee24ede23e15dc81ccde11898eed1a7a3c6a2d81a8c31596fccb1b5ce"
+S = "${WORKDIR}/gstreamer-${PV}"
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
new file mode 100644
index 0000000..e343255
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
@@ -0,0 +1,17 @@
+DEFAULT_PREFERENCE = "-1"
+
+include gstreamer1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
+                    file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
+
+SRC_URI = "git://anongit.freedesktop.org/gstreamer/gstreamer;branch=master;protocol=git"
+S = "${WORKDIR}/git"
+
+SRCREV = "3b8181a8c550e74acaba4e8c55bdc649fa551dc9"
+
+do_configure() {
+	./autogen.sh --noconfigure
+	oe_runconf
+}
+
-- 
1.8.3


