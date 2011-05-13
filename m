Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QKkd0-0001tA-6I
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 07:09:32 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2011 22:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,362,1301900400"; d="scan'208";a="642119004"
Received: from unknown (HELO localhost) ([10.255.12.88])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2011 22:06:38 -0700
Message-Id: <0f9f0518ac46c2f2beb0224e881ff136f1603d33.1305263078.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305263078.git.sgw@linux.intel.com>
References: <cover.1305263078.git.sgw@linux.intel.com>
Old-Date: Tue, 10 May 2011 12:55:32 +0800
Date: Thu, 12 May 2011 22:06:38 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Ilya Yanok <yanok@emcraft.com>, Jingdong Lu <jingdong.lu@windriver.com>
Subject: [PATCH 1/8] recipes: add Upstream-Status for multiple recipes
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
X-List-Received-Date: Fri, 13 May 2011 05:09:32 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

hostap: add upstream status for hostap-fw-load.patch
lrzsz: add upstream status for lrzsz's patches
bluez: add upstream status for bluez's patches
bluez-dtl1-workaround: add upstream status for COPYING.patch
libgsmd: add upstream status for gsm's patches.
gypsy: add upstream status for gypsy's patch
libpcap: add upstream status for libpcap's patches
ppp: add upstream status for ppp's patches
libtelepathy: add upstream status for libtelepathy's patches
telepathy-python: add upstream status for telepahty-python's patches
wireless-tools: add upstream status for wireless-tools's patches
wpa-supplicant: add upstream status for wpa-supplicant
zeroconf: add upstream status for zeroconf's patch
glibc: add upstream status for glibc's patches
dpkg: add upstream status for dpkg's patches
makedevs: add upstream status for makedevs's patch
opkg: add upstream status for opkg's patches
opkg-utils: add upstream status for opkg-utils's patch
minicom: add upstream status for minicom patches
rpcbind: add upstream status for rpcbind's patch
which: add upstream status for which's patch
clutter-gst: add upstream status for clutter-gst's patches
flac: add upstream status for flac's patches
gst-ffmpeg: add upstream status for gst-ffmpeg's patch
liba52: add upstream status for liba52's patch
libid3tag: add upstream status for libid3tag
libmusicbrainz: add upstream status for libmusicbrainz's patch
pulseaudio: add upstream status for pulseaudio patches
db: add upstream status for db's patch
neon: add upstream status for neon's patch
taglib: add upstream status for taglib's patches
libetpan: add upstream status for libetpan's patch
libopensync: add upstream status for libopensync's patches
libopensync-plugin-evolution2: add upstream status for its patch
libopensync-plugin-syncml: add upstream status for its patch
libsyncml: add upstream status for libsyncml's patch
empathy: add upstream status for empathy's patch
wv: add upstream status for wv's patch
xournal: add upstream status for xournal's patch

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../libetpan/files/cxx-is-here.patch               |    2 ++
 .../opensync/libopensync-0.37/build-in-src.patch   |    2 ++
 .../opensync/libopensync-0.37/cmake.patch          |    2 ++
 .../libopensync-0.37/no-python-check.patch         |    2 ++
 .../libopensync-plugin-evolution2/0.37-fixes.patch |    2 ++
 .../libopensync-plugin-syncml/fixerror.patch       |    2 ++
 .../opensync/libsyncml/build-in-src.patch          |    2 ++
 .../telepathy/empathy/no-gnome-doc.patch           |    2 ++
 .../recipes-gnome/wv/wv-1.2.0/pkgconfig.patch      |    2 ++
 .../recipes-graphics/xournal/files/ldflags.patch   |    2 ++
 .../xournal/files/no-printing.diff                 |    2 ++
 meta/recipes-bsp/hostap/files/hostap-fw-load.patch |    2 ++
 .../lrzsz/lrzsz-0.12.20/autotools.patch            |    2 ++
 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/gettext.patch |    2 ++
 .../recipes-bsp/lrzsz/lrzsz-0.12.20/makefile.patch |    2 ++
 .../bluez/bluez-dtl1-workaround/COPYING.patch      |    2 ++
 .../fix-dfutool-usb-declaration-mismatch.patch     |    1 +
 .../bluez/bluez4-4.82/hid2hci_usb_init.patch       |    2 ++
 .../bluez/bluez4-4.82/sbc-thumb.patch              |    1 +
 .../gsm/files/0001-Introduce-ports.patch           |    2 ++
 ...ending-commands-before-restarting-the-mod.patch |    2 ++
 ...-segment-incoming-usock-data-into-packets.patch |    2 ++
 .../0004-Handle-read-and-write-return-values.patch |    2 ++
 .../gsm/files/0005-Add-ask-ds-option-forSMS.patch  |    2 ++
 .../gsm/files/024_sms-text-in-bracket.patch        |    2 ++
 .../gsm/files/025_sms-status-report.patch          |    2 ++
 ...027_phonebook-find-and-read-range-support.patch |    2 ++
 ...ell-phonebook-find-and-read-range-support.patch |    2 ++
 .../gsm/files/fix_machine_init.patch               |    2 ++
 .../gsm/files/install-ts-headers.patch             |    2 ++
 .../gsm/files/lgsm_send_fix_return_value.patch     |    2 ++
 meta/recipes-connectivity/gypsy/files/fixups.patch |    2 ++
 .../libpcap/libpcap-1.1.1/aclocal.patch            |    2 ++
 .../libpcap/libpcap-1.1.1/ieee80215-arphrd.patch   |    2 ++
 .../ppp/ppp-2.4.5/cifdefroute.patch                |    2 ++
 .../ppp/ppp-2.4.5/enable-ipv6.patch                |    2 ++
 .../makefile-remove-hard-usr-reference.patch       |    2 ++
 .../ppp/ppp-2.4.5/makefile.patch                   |    2 ++
 .../ppp/ppp-2.4.5/pppd-resolv-varrun.patch         |    2 ++
 .../telepathy/libtelepathy/doublefix.patch         |    2 ++
 .../telepathy/libtelepathy/prefer_python_2.5.patch |    2 ++
 .../telepathy-python-0.15.19/parallel_make.patch   |    2 ++
 .../wireless-tools/wireless-tools/man.patch        |    2 ++
 .../wpa_supplicant-0.5.7-always-scan.patch         |    2 ++
 ...a_supplicant-fix-deprecated-dbus-function.patch |    2 ++
 .../zeroconf/zeroconf/compilefix.patch             |    2 ++
 .../glibc/glibc-2.10.1/arm-check-pf.patch          |    2 ++
 .../glibc/glibc-2.10.1/arm-longlong.patch          |    2 ++
 .../arm-lowlevellock-include-tls.patch             |    2 ++
 .../glibc/glibc-2.10.1/arm-memcpy.patch            |    2 ++
 .../glibc/glibc-2.10.1/dl-cache-libcmp.patch       |    2 ++
 .../glibc/glibc-2.10.1/fhs-linux-paths.patch       |    2 ++
 .../glibc-arm-IO-acquire-lock-fix.diff             |    2 ++
 .../glibc/glibc-2.10.1/glibc-arm-no-asm-page.patch |    2 ++
 .../glibc/glibc-2.10.1/glibc-check_pf.patch        |    2 ++
 .../glibc/glibc-2.10.1/ldd-unbash.patch            |    2 ++
 .../glibc/glibc-2.10.1/ldsocache-varrun.patch      |    2 ++
 .../glibc/glibc-2.10.1/local-args6.diff            |    2 ++
 .../glibc/glibc-2.10.1/march-i686.patch            |    1 +
 .../glibc/glibc-2.10.1/mips-rld-map-check.patch    |    2 ++
 .../glibc/glibc-2.10.1/nptl-crosscompile.patch     |    2 ++
 .../glibc/glibc-2.10.1/nscd-init.patch             |    2 ++
 .../glibc/glibc-2.10.1/powerpc-sqrt-hack.diff      |    2 ++
 .../recipes-core/glibc/glibc-2.10.1/rulesfix.patch |    2 ++
 meta/recipes-devtools/dpkg/dpkg/autofoo.patch      |    2 ++
 .../dpkg/dpkg/check_snprintf.patch                 |    2 ++
 .../recipes-devtools/dpkg/dpkg/check_version.patch |    2 ++
 .../dpkg/dpkg/ignore_extra_fields.patch            |    2 ++
 meta/recipes-devtools/dpkg/dpkg/nochroot.patch     |    2 ++
 meta/recipes-devtools/dpkg/dpkg/noman.patch        |    2 ++
 meta/recipes-devtools/dpkg/dpkg/noupdalt.patch     |    2 ++
 .../makedevs/makedevs-1.0.0/COPYING.patch          |    2 ++
 .../opkg-utils/index-ignore-filenotfound.patch     |    2 ++
 meta/recipes-devtools/opkg/opkg/add_vercmp.patch   |    2 ++
 meta/recipes-devtools/opkg/opkg/headerfix.patch    |    2 ++
 .../minicom/minicom-2.4/gcc4-scope.patch           |    2 ++
 .../minicom-2.4/rename-conflicting-functions.patch |    2 ++
 .../rpcbind/rpcbind/fix_host_path.patch            |    2 ++
 .../which/which-2.20/remove-declaration.patch      |    2 ++
 .../clutter/clutter-gst/autofoo-0.4.patch          |    2 ++
 ...-9db4a61a25677764bb927369c5c68ada958fb65c.patch |    2 ++
 .../clutter/clutter-gst/autofoo.patch              |    2 ++
 .../clutter/clutter-gst/enable_tests-1.4.patch     |    3 +++
 .../clutter/clutter-gst/enable_tests.patch         |    3 +++
 .../flac/flac-1.2.1/disable-xmms-plugin.patch      |    1 +
 .../flac/flac-1.2.1/flac-gcc43-fixes.patch         |    1 +
 .../gstreamer/gst-ffmpeg-0.10.11/lower-rank.diff   |    2 ++
 .../liba52/liba52/buildcleanup.patch               |    2 ++
 .../libid3tag/libid3tag/addpkgconfig.patch         |    2 ++
 .../fix_build_issue_for_gcc_4.5.0.patch            |    2 ++
 .../pulseaudio/pulseaudio-0.9.22/armv4+v5asm.patch |    2 ++
 .../pulseaudio-0.9.22/autoconf_version.patch       |    2 ++
 .../pulseaudio/pulseaudio-0.9.22/buildfix.patch    |    2 ++
 .../pulseaudio-0.9.22/configure_silent_rules.patch |    2 ++
 .../pulseaudio-0.9.22/gcc4-compile-fix.patch       |    2 ++
 .../pulseaudio/pulseaudio-0.9.22/tls_m4.patch      |    2 ++
 .../db/db/arm-thumb-mutex_db5.patch                |    2 ++
 .../neon/neon-0.29.5/pkgconfig.patch               |    2 ++
 .../taglib/taglib-1.6.3/configuretweak.patch       |    2 ++
 .../taglib/taglib-1.6.3/nolibtool.patch            |    2 ++
 100 files changed, 197 insertions(+), 0 deletions(-)

diff --git a/meta-demoapps/recipes-connectivity/libetpan/files/cxx-is-here.patch b/meta-demoapps/recipes-connectivity/libetpan/files/cxx-is-here.patch
index d910daa..03d8da6 100644
--- a/meta-demoapps/recipes-connectivity/libetpan/files/cxx-is-here.patch
+++ b/meta-demoapps/recipes-connectivity/libetpan/files/cxx-is-here.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  configure.ac |    1 +
  1 file changed, 1 insertion(+)
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/build-in-src.patch b/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/build-in-src.patch
index 1810b33..fa61e15 100644
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/build-in-src.patch
+++ b/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/build-in-src.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  cmake/OpenSyncInternal.cmake.in |    1 -
  1 file changed, 1 deletion(-)
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/cmake.patch b/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/cmake.patch
index 7ea4613..20d09cf 100644
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/cmake.patch
+++ b/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/cmake.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  opensync/CMakeLists.txt |    1 -
  1 file changed, 1 deletion(-)
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/no-python-check.patch b/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/no-python-check.patch
index 04257bc..d59fddb 100644
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/no-python-check.patch
+++ b/meta-demoapps/recipes-connectivity/opensync/libopensync-0.37/no-python-check.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  CMakeLists.txt |    1 -
  1 file changed, 1 deletion(-)
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-evolution2/0.37-fixes.patch b/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-evolution2/0.37-fixes.patch
index 4a1802c..9ef0353 100644
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-evolution2/0.37-fixes.patch
+++ b/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-evolution2/0.37-fixes.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: libopensync-plugin-evolution2-0.36/cmake/modules/FindOpenSync.cmake
 ===================================================================
 --- libopensync-plugin-evolution2-0.36.orig/cmake/modules/FindOpenSync.cmake	2008-10-20 13:07:14.000000000 +0100
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-syncml/fixerror.patch b/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-syncml/fixerror.patch
index 7dad889..9e7a260 100644
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-syncml/fixerror.patch
+++ b/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin-syncml/fixerror.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [others]
+
 Index: libopensync-plugin-syncml-0.38/src/syncml_callbacks.c
 ===================================================================
 --- libopensync-plugin-syncml-0.38.orig/src/syncml_callbacks.c	2009-07-31 10:30:33.000000000 +0100
diff --git a/meta-demoapps/recipes-connectivity/opensync/libsyncml/build-in-src.patch b/meta-demoapps/recipes-connectivity/opensync/libsyncml/build-in-src.patch
index d8106bd..9947af0 100644
--- a/meta-demoapps/recipes-connectivity/opensync/libsyncml/build-in-src.patch
+++ b/meta-demoapps/recipes-connectivity/opensync/libsyncml/build-in-src.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  CMakeLists.txt |    4 ----
  1 file changed, 4 deletions(-)
diff --git a/meta-demoapps/recipes-connectivity/telepathy/empathy/no-gnome-doc.patch b/meta-demoapps/recipes-connectivity/telepathy/empathy/no-gnome-doc.patch
index 13e7943..ee15f4d 100644
--- a/meta-demoapps/recipes-connectivity/telepathy/empathy/no-gnome-doc.patch
+++ b/meta-demoapps/recipes-connectivity/telepathy/empathy/no-gnome-doc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [disable feature]
+
 ---
  Makefile.am      |    2 +-
  configure.ac     |    1 -
diff --git a/meta-demoapps/recipes-gnome/wv/wv-1.2.0/pkgconfig.patch b/meta-demoapps/recipes-gnome/wv/wv-1.2.0/pkgconfig.patch
index 136d893..0c0eddf 100644
--- a/meta-demoapps/recipes-gnome/wv/wv-1.2.0/pkgconfig.patch
+++ b/meta-demoapps/recipes-gnome/wv/wv-1.2.0/pkgconfig.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: wv-1.2.0/wv-1.0.pc.in
 ===================================================================
 --- wv-1.2.0.orig/wv-1.0.pc.in	2008-03-19 22:25:18.000000000 +0000
diff --git a/meta-demoapps/recipes-graphics/xournal/files/ldflags.patch b/meta-demoapps/recipes-graphics/xournal/files/ldflags.patch
index 7f6585b..ec75e71 100644
--- a/meta-demoapps/recipes-graphics/xournal/files/ldflags.patch
+++ b/meta-demoapps/recipes-graphics/xournal/files/ldflags.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  src/Makefile.am |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-demoapps/recipes-graphics/xournal/files/no-printing.diff b/meta-demoapps/recipes-graphics/xournal/files/no-printing.diff
index 7a4724e..9fac498 100644
--- a/meta-demoapps/recipes-graphics/xournal/files/no-printing.diff
+++ b/meta-demoapps/recipes-graphics/xournal/files/no-printing.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -ru xournal-0.2/configure.in xournal-0.2.noprint/configure.in
 --- xournal-0.2/configure.in	2006-01-29 22:25:10.000000000 +0000
 +++ xournal-0.2.noprint/configure.in	2006-03-17 13:08:01.000000000 +0000
diff --git a/meta/recipes-bsp/hostap/files/hostap-fw-load.patch b/meta/recipes-bsp/hostap/files/hostap-fw-load.patch
index 88adee2..050bdc1 100644
--- a/meta/recipes-bsp/hostap/files/hostap-fw-load.patch
+++ b/meta/recipes-bsp/hostap/files/hostap-fw-load.patch
@@ -3,6 +3,8 @@
 # Patch managed by http://www.holgerschurig.de/patcher.html
 #
 
+Upstream-Status: Inappropriate [configuration]
+
 --- hostap-utils-0.2.4/hostap_fw_load~hostap-fw-load
 +++ hostap-utils-0.2.4/hostap_fw_load
 @@ -6,9 +6,9 @@
diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools.patch
index 73f5a06..3945198 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools.patch
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/autotools.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- lrzsz-0.12.20/acinclude.m4~autotools	1998-12-27 17:08:59.000000000 -0500
 +++ lrzsz-0.12.20/acinclude.m4	2004-05-09 22:26:19.000000000 -0400
 @@ -1,12 +1,11 @@
diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/gettext.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/gettext.patch
index 241ffd9..1a24a1f 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/gettext.patch
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/gettext.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- lrzsz-0.12.20.safe/ABOUT-NLS	1998-04-26 09:22:30.000000000 -0400
 +++ lrzsz-0.12.20/ABOUT-NLS	2004-09-12 14:40:34.323752952 -0400
 @@ -1,14 +1,14 @@
diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/makefile.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/makefile.patch
index c553c8b..ace592c 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/makefile.patch
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/makefile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -ruN lrzsz-0.12.20_org/src/Makefile.in lrzsz-0.12.20_patch/src/Makefile.in
 --- lrzsz-0.12.20_org/src/Makefile.in	1998-12-30 17:31:46.000000000 +0100
 +++ lrzsz-0.12.20_patch/src/Makefile.in	2004-04-29 13:57:33.434909656 +0200
diff --git a/meta/recipes-connectivity/bluez/bluez-dtl1-workaround/COPYING.patch b/meta/recipes-connectivity/bluez/bluez-dtl1-workaround/COPYING.patch
index 95342e3..576081b 100644
--- a/meta/recipes-connectivity/bluez/bluez-dtl1-workaround/COPYING.patch
+++ b/meta/recipes-connectivity/bluez/bluez-dtl1-workaround/COPYING.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [others]
+
 diff -ruN bluez-dtl1-workaround-1.0-orig/COPYING bluez-dtl1-workaround-1.0/COPYING
 --- bluez-dtl1-workaround-1.0-orig/COPYING	1970-01-01 08:00:00.000000000 +0800
 +++ bluez-dtl1-workaround-1.0/COPYING	2010-12-09 16:50:46.014910500 +0800
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.82/fix-dfutool-usb-declaration-mismatch.patch b/meta/recipes-connectivity/bluez/bluez4-4.82/fix-dfutool-usb-declaration-mismatch.patch
index 91c802b..27dead0 100644
--- a/meta/recipes-connectivity/bluez/bluez4-4.82/fix-dfutool-usb-declaration-mismatch.patch
+++ b/meta/recipes-connectivity/bluez/bluez4-4.82/fix-dfutool-usb-declaration-mismatch.patch
@@ -3,6 +3,7 @@
 # Date:   Thu Jan 29 16:52:21 2009 +0000
 #
 # Acquired from OpenEmbedded
+Upstream-Status: Pending
 
 Index: bluez-4.27/tools/dfutool.c
 ===================================================================
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.82/hid2hci_usb_init.patch b/meta/recipes-connectivity/bluez/bluez4-4.82/hid2hci_usb_init.patch
index ed15fd5..e8a58e5 100644
--- a/meta/recipes-connectivity/bluez/bluez4-4.82/hid2hci_usb_init.patch
+++ b/meta/recipes-connectivity/bluez/bluez4-4.82/hid2hci_usb_init.patch
@@ -6,6 +6,8 @@
 # data (e.g. ctx) which is used in subsequent calls to libusb
 # We return immediately if usb_init() fails for some reason.
 
+Upstream-Status: Inappropriate [not used]
+
 Index: bluez-4.24/tools/hid2hci.c
 ===================================================================
 --- bluez-4.24.orig/tools/hid2hci.c	2008-10-25 23:40:34.000000000 -0700
diff --git a/meta/recipes-connectivity/bluez/bluez4-4.82/sbc-thumb.patch b/meta/recipes-connectivity/bluez/bluez4-4.82/sbc-thumb.patch
index 4744236..881cb9c 100644
--- a/meta/recipes-connectivity/bluez/bluez4-4.82/sbc-thumb.patch
+++ b/meta/recipes-connectivity/bluez/bluez4-4.82/sbc-thumb.patch
@@ -1,4 +1,5 @@
 # Acquired from OpenEmbedded
+Upstream-Status: Inappropriate [embedded specific]
 
 --- bluez/sbc/sbc_math.h~	2008-03-05 20:18:03.000000000 +0000
 +++ bluez/sbc/sbc_math.h	2008-10-27 13:39:27.000000000 +0000
diff --git a/meta/recipes-connectivity/gsm/files/0001-Introduce-ports.patch b/meta/recipes-connectivity/gsm/files/0001-Introduce-ports.patch
index b3ba3cb..2a954d6 100644
--- a/meta/recipes-connectivity/gsm/files/0001-Introduce-ports.patch
+++ b/meta/recipes-connectivity/gsm/files/0001-Introduce-ports.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 From 516d67c679101d1503dbd4c0613bcd6ff1b604e4 Mon Sep 17 00:00:00 2001
 From: Andrzej Zaborowski <balrog@zabor.org>
 Date: Wed, 19 Sep 2007 14:03:28 +0200
diff --git a/meta/recipes-connectivity/gsm/files/0002-Flush-all-pending-commands-before-restarting-the-mod.patch b/meta/recipes-connectivity/gsm/files/0002-Flush-all-pending-commands-before-restarting-the-mod.patch
index 3683596..51d50b9 100644
--- a/meta/recipes-connectivity/gsm/files/0002-Flush-all-pending-commands-before-restarting-the-mod.patch
+++ b/meta/recipes-connectivity/gsm/files/0002-Flush-all-pending-commands-before-restarting-the-mod.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 From 1078f7aced63c6216bffe649930b97c9ccf9a16e Mon Sep 17 00:00:00 2001
 From: Andrzej Zaborowski <balrog@zabor.org>
 Date: Wed, 19 Sep 2007 14:04:50 +0200
diff --git a/meta/recipes-connectivity/gsm/files/0003-Correctly-segment-incoming-usock-data-into-packets.patch b/meta/recipes-connectivity/gsm/files/0003-Correctly-segment-incoming-usock-data-into-packets.patch
index 984acc9..87aaf6b 100644
--- a/meta/recipes-connectivity/gsm/files/0003-Correctly-segment-incoming-usock-data-into-packets.patch
+++ b/meta/recipes-connectivity/gsm/files/0003-Correctly-segment-incoming-usock-data-into-packets.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 From 8af1bb4a0d0df9baa80859c5f7f56cbd7634aded Mon Sep 17 00:00:00 2001
 From: Andrzej Zaborowski <balrog@zabor.org>
 Date: Wed, 19 Sep 2007 14:06:19 +0200
diff --git a/meta/recipes-connectivity/gsm/files/0004-Handle-read-and-write-return-values.patch b/meta/recipes-connectivity/gsm/files/0004-Handle-read-and-write-return-values.patch
index f5e7a79..84a4aa1 100644
--- a/meta/recipes-connectivity/gsm/files/0004-Handle-read-and-write-return-values.patch
+++ b/meta/recipes-connectivity/gsm/files/0004-Handle-read-and-write-return-values.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 From 421b0fa14fefbd13a455c20380fecddda616b41a Mon Sep 17 00:00:00 2001
 From: Andrzej Zaborowski <balrog@zabor.org>
 Date: Wed, 19 Sep 2007 18:30:36 +0200
diff --git a/meta/recipes-connectivity/gsm/files/0005-Add-ask-ds-option-forSMS.patch b/meta/recipes-connectivity/gsm/files/0005-Add-ask-ds-option-forSMS.patch
index e9f49bd..faf0e8a 100644
--- a/meta/recipes-connectivity/gsm/files/0005-Add-ask-ds-option-forSMS.patch
+++ b/meta/recipes-connectivity/gsm/files/0005-Add-ask-ds-option-forSMS.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 diff --git a/include/gsmd/usock.h b/include/gsmd/usock.h
 index 236ad78..66cdf48 100644
 --- a/include/gsmd/usock.h
diff --git a/meta/recipes-connectivity/gsm/files/024_sms-text-in-bracket.patch b/meta/recipes-connectivity/gsm/files/024_sms-text-in-bracket.patch
index 32a1ca3..3aa13df 100644
--- a/meta/recipes-connectivity/gsm/files/024_sms-text-in-bracket.patch
+++ b/meta/recipes-connectivity/gsm/files/024_sms-text-in-bracket.patch
@@ -9,6 +9,8 @@ The patch introduces SMS message text in bracket and fixes a NULL pointer
 reference on mailformed "ss" commands.
 
 Signed-off-by: Jim Huang <jserv@openmoko.org>
+
+Upstream-Status: Inappropriate [not used]
 ---
  src/util/shell.c |   32 ++++++++++++++++++++++++++------
  1 file changed, 26 insertions(+), 6 deletions(-)
diff --git a/meta/recipes-connectivity/gsm/files/025_sms-status-report.patch b/meta/recipes-connectivity/gsm/files/025_sms-status-report.patch
index 560e72e..a0f466a 100644
--- a/meta/recipes-connectivity/gsm/files/025_sms-status-report.patch
+++ b/meta/recipes-connectivity/gsm/files/025_sms-status-report.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 From: Erin Yueh <erin_yueh@openmoko.com>
 Subject: [PATCH] SMS status report
 
diff --git a/meta/recipes-connectivity/gsm/files/027_phonebook-find-and-read-range-support.patch b/meta/recipes-connectivity/gsm/files/027_phonebook-find-and-read-range-support.patch
index ea0f12d..c94e4b2 100644
--- a/meta/recipes-connectivity/gsm/files/027_phonebook-find-and-read-range-support.patch
+++ b/meta/recipes-connectivity/gsm/files/027_phonebook-find-and-read-range-support.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 From: Sean Chiang <sean_chiang@openmoko.com>
 Subject: [PATCH] Improvement for find and read phonebooks in gsmd
 
diff --git a/meta/recipes-connectivity/gsm/files/028_shell-phonebook-find-and-read-range-support.patch b/meta/recipes-connectivity/gsm/files/028_shell-phonebook-find-and-read-range-support.patch
index db07a5d..a531fa8 100644
--- a/meta/recipes-connectivity/gsm/files/028_shell-phonebook-find-and-read-range-support.patch
+++ b/meta/recipes-connectivity/gsm/files/028_shell-phonebook-find-and-read-range-support.patch
@@ -8,6 +8,8 @@ phonebook.
 
 Signed-off-by: Jim Huang <jserv@openmoko.org>
 
+Upstream-Status: Inappropriate [not used]
+
 Index: gsm/src/util/shell.c
 ===================================================================
 --- gsm.orig/src/util/shell.c	2007-09-17 23:57:51.000000000 +0800
diff --git a/meta/recipes-connectivity/gsm/files/fix_machine_init.patch b/meta/recipes-connectivity/gsm/files/fix_machine_init.patch
index 9fb6466..1f135d5 100644
--- a/meta/recipes-connectivity/gsm/files/fix_machine_init.patch
+++ b/meta/recipes-connectivity/gsm/files/fix_machine_init.patch
@@ -2,6 +2,8 @@ Rebase the patch to latest version.
 
 By Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Pending
+
 diff -ruN gsm-orig/src/gsmd/gsmd.c gsm/src/gsmd/gsmd.c
 --- gsm-orig/src/gsmd/gsmd.c	2010-11-25 10:14:22.000000000 +0800
 +++ gsm/src/gsmd/gsmd.c	2010-11-25 10:14:52.000000000 +0800
diff --git a/meta/recipes-connectivity/gsm/files/install-ts-headers.patch b/meta/recipes-connectivity/gsm/files/install-ts-headers.patch
index 88e3b6d..b77b6d9 100644
--- a/meta/recipes-connectivity/gsm/files/install-ts-headers.patch
+++ b/meta/recipes-connectivity/gsm/files/install-ts-headers.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 Index: gsm/include/gsmd/Makefile.am
 ===================================================================
 --- gsm.orig/include/gsmd/Makefile.am	2007-10-29 21:05:57.000000000 +0100
diff --git a/meta/recipes-connectivity/gsm/files/lgsm_send_fix_return_value.patch b/meta/recipes-connectivity/gsm/files/lgsm_send_fix_return_value.patch
index 00ba3a4..9ff1c9d 100644
--- a/meta/recipes-connectivity/gsm/files/lgsm_send_fix_return_value.patch
+++ b/meta/recipes-connectivity/gsm/files/lgsm_send_fix_return_value.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 --- gsm/src/libgsmd/libgsmd.c.orig	2007-09-25 00:41:56.000000000 -0500
 +++ gsm/src/libgsmd/libgsmd.c	2007-09-25 00:43:44.000000000 -0500
 @@ -210,7 +210,7 @@
diff --git a/meta/recipes-connectivity/gypsy/files/fixups.patch b/meta/recipes-connectivity/gypsy/files/fixups.patch
index 8bc8c5c..de4d92e 100644
--- a/meta/recipes-connectivity/gypsy/files/fixups.patch
+++ b/meta/recipes-connectivity/gypsy/files/fixups.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  docs/reference/Makefile.am |    2 ++
  1 file changed, 2 insertions(+)
diff --git a/meta/recipes-connectivity/libpcap/libpcap-1.1.1/aclocal.patch b/meta/recipes-connectivity/libpcap/libpcap-1.1.1/aclocal.patch
index 71fd8b9..469d122 100644
--- a/meta/recipes-connectivity/libpcap/libpcap-1.1.1/aclocal.patch
+++ b/meta/recipes-connectivity/libpcap/libpcap-1.1.1/aclocal.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -ruN libpcap-1.1.1-orig/aclocal.m4 libpcap-1.1.1/aclocal.m4
 --- libpcap-1.1.1-orig/aclocal.m4	2010-06-29 10:46:32.815117569 +0800
 +++ libpcap-1.1.1/aclocal.m4	2010-06-29 10:49:17.150149949 +0800
diff --git a/meta/recipes-connectivity/libpcap/libpcap-1.1.1/ieee80215-arphrd.patch b/meta/recipes-connectivity/libpcap/libpcap-1.1.1/ieee80215-arphrd.patch
index f29c7cb..8041d7a 100644
--- a/meta/recipes-connectivity/libpcap/libpcap-1.1.1/ieee80215-arphrd.patch
+++ b/meta/recipes-connectivity/libpcap/libpcap-1.1.1/ieee80215-arphrd.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: libpcap-1.0.0/pcap-linux.c
 ===================================================================
 --- libpcap-1.0.0.orig/pcap-linux.c	2009-01-28 11:58:54.000000000 +0300
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/cifdefroute.patch b/meta/recipes-connectivity/ppp/ppp-2.4.5/cifdefroute.patch
index 6473a08..db4dbc2 100644
--- a/meta/recipes-connectivity/ppp/ppp-2.4.5/cifdefroute.patch
+++ b/meta/recipes-connectivity/ppp/ppp-2.4.5/cifdefroute.patch
@@ -2,6 +2,8 @@ This patch comes from OpenEmbedded.
 The original patch is from Debian / SuSE to implement replacedefaultroute
 Rebased it to fit ppp-2.4.5. Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Inappropriate [debian/suse patches]
+
 diff -urN ppp-2.4.5-orig/pppd/ipcp.c ppp-2.4.5/pppd/ipcp.c
 --- ppp-2.4.5-orig/pppd/ipcp.c	2010-06-30 15:51:12.050166398 +0800
 +++ ppp-2.4.5/pppd/ipcp.c	2010-06-30 16:40:00.478716855 +0800
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/enable-ipv6.patch b/meta/recipes-connectivity/ppp/ppp-2.4.5/enable-ipv6.patch
index daa7f2e..e5fc3f4 100644
--- a/meta/recipes-connectivity/ppp/ppp-2.4.5/enable-ipv6.patch
+++ b/meta/recipes-connectivity/ppp/ppp-2.4.5/enable-ipv6.patch
@@ -1,5 +1,7 @@
 The patch comes from OpenEmbedded
 
+Upstream-Status: Inappropriate [enable feature]
+
 --- ppp-2.4.3/pppd/Makefile.linux.orig	2005-10-28 21:07:40.396359250 +0100
 +++ ppp-2.4.3/pppd/Makefile.linux	2005-10-28 21:07:54.217223000 +0100
 @@ -62,7 +62,7 @@
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/makefile-remove-hard-usr-reference.patch b/meta/recipes-connectivity/ppp/ppp-2.4.5/makefile-remove-hard-usr-reference.patch
index 9ba8688..8cc354a 100644
--- a/meta/recipes-connectivity/ppp/ppp-2.4.5/makefile-remove-hard-usr-reference.patch
+++ b/meta/recipes-connectivity/ppp/ppp-2.4.5/makefile-remove-hard-usr-reference.patch
@@ -1,6 +1,8 @@
 The patch comes from OpenEmbedded.
 Rebased for ppp-2.4.5. Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 diff -urN ppp-2.4.5-orig/pppd/Makefile.linux ppp-2.4.5/pppd/Makefile.linux
 --- ppp-2.4.5-orig/pppd/Makefile.linux	2010-06-30 15:51:12.043682063 +0800
 +++ ppp-2.4.5/pppd/Makefile.linux	2010-06-30 17:08:21.806363042 +0800
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/makefile.patch b/meta/recipes-connectivity/ppp/ppp-2.4.5/makefile.patch
index 94af5af..2d09baf 100644
--- a/meta/recipes-connectivity/ppp/ppp-2.4.5/makefile.patch
+++ b/meta/recipes-connectivity/ppp/ppp-2.4.5/makefile.patch
@@ -1,6 +1,8 @@
 The patch comes from OpenEmbedded
 Rebased for ppp-2.4.5. Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 diff -ruN ppp-2.4.5-orig/chat/Makefile.linux ppp-2.4.5/chat/Makefile.linux
 --- ppp-2.4.5-orig/chat/Makefile.linux	2010-06-30 15:51:12.050166398 +0800
 +++ ppp-2.4.5/chat/Makefile.linux	2010-06-30 15:51:30.450118446 +0800
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/pppd-resolv-varrun.patch b/meta/recipes-connectivity/ppp/ppp-2.4.5/pppd-resolv-varrun.patch
index c4e61fd..a72414f 100644
--- a/meta/recipes-connectivity/ppp/ppp-2.4.5/pppd-resolv-varrun.patch
+++ b/meta/recipes-connectivity/ppp/ppp-2.4.5/pppd-resolv-varrun.patch
@@ -1,6 +1,8 @@
 The patch comes from OpenEmbedded
 Rebased for ppp-2.4.5. Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Inappropriate [embedded specific]
+
 diff -ruN ppp-2.4.5-orig/pppd/ipcp.c ppp-2.4.5/pppd/ipcp.c
 --- ppp-2.4.5-orig/pppd/ipcp.c	2010-06-30 15:51:12.050166398 +0800
 +++ ppp-2.4.5/pppd/ipcp.c	2010-06-30 17:02:33.930393283 +0800
diff --git a/meta/recipes-connectivity/telepathy/libtelepathy/doublefix.patch b/meta/recipes-connectivity/telepathy/libtelepathy/doublefix.patch
index 5ff1c43..a7737fb 100644
--- a/meta/recipes-connectivity/telepathy/libtelepathy/doublefix.patch
+++ b/meta/recipes-connectivity/telepathy/libtelepathy/doublefix.patch
@@ -2,6 +2,8 @@ Fix double reference to this file to work with recent autoconf+automake
 
 RP 1/2/10
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: libtelepathy-0.3.3/src/Makefile.am
 ===================================================================
 --- libtelepathy-0.3.3.orig/src/Makefile.am	2010-02-01 13:13:50.869038984 +0000
diff --git a/meta/recipes-connectivity/telepathy/libtelepathy/prefer_python_2.5.patch b/meta/recipes-connectivity/telepathy/libtelepathy/prefer_python_2.5.patch
index ec01567..37679ab 100644
--- a/meta/recipes-connectivity/telepathy/libtelepathy/prefer_python_2.5.patch
+++ b/meta/recipes-connectivity/telepathy/libtelepathy/prefer_python_2.5.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: libtelepathy-0.3.1/configure.ac
 ===================================================================
 --- libtelepathy-0.3.1.orig/configure.ac	2007-11-22 19:05:56.000000000 +0000
diff --git a/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch b/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
index 145e17b..f1f3f56 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
+++ b/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
@@ -5,6 +5,8 @@ src/_generated directory that tasks are based on.
 
 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Pending
+
 diff -ruN telepathy-python-0.15.19-orig/src/Makefile.am telepathy-python-0.15.19/src/Makefile.am
 --- telepathy-python-0.15.19-orig/src/Makefile.am	2011-03-10 08:51:49.000000000 +0800
 +++ telepathy-python-0.15.19/src/Makefile.am	2011-03-10 08:54:45.000000000 +0800
diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch b/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch
index fd8cf42..8e16215 100644
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- wireless_tools.26/Makefile.orig	2003-06-18 03:38:58.000000000 +0200
 +++ wireless_tools.26/Makefile	2004-07-03 23:35:29.000000000 +0200
 @@ -57,8 +57,8 @@
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-0.5.7-always-scan.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-0.5.7-always-scan.patch
index 25afd07..5485d55 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-0.5.7-always-scan.patch
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-0.5.7-always-scan.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 diff -up wpa_supplicant-0.5.7/wpa_supplicant.c.always-scan wpa_supplicant-0.5.7/wpa_supplicant.c
 --- wpa_supplicant-0.5.7/wpa_supplicant.c.always-scan	2007-09-25 15:51:35.000000000 -0400
 +++ wpa_supplicant-0.5.7/wpa_supplicant.c	2007-09-25 16:31:27.000000000 -0400
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-fix-deprecated-dbus-function.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-fix-deprecated-dbus-function.patch
index dbd5e4e..a1898c3 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-fix-deprecated-dbus-function.patch
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-fix-deprecated-dbus-function.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 --- dbus_dict_helpers.c.array-fix	2006-12-18 12:31:11.000000000 -0500
 +++ dbus_dict_helpers.c	2006-12-20 03:17:08.000000000 -0500
 @@ -629,36 +629,55 @@ dbus_bool_t wpa_dbus_dict_open_read(DBus
diff --git a/meta/recipes-connectivity/zeroconf/zeroconf/compilefix.patch b/meta/recipes-connectivity/zeroconf/zeroconf/compilefix.patch
index b7b917d..328e574 100644
--- a/meta/recipes-connectivity/zeroconf/zeroconf/compilefix.patch
+++ b/meta/recipes-connectivity/zeroconf/zeroconf/compilefix.patch
@@ -3,6 +3,8 @@
 
 RP - 4/9/09
 
+Upstream-Status: Pending
+
 Index: zeroconf-0.9/zeroconf.c
 ===================================================================
 --- zeroconf-0.9.orig/zeroconf.c	2009-09-04 10:05:25.000000000 +0100
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/arm-check-pf.patch b/meta/recipes-core/glibc/glibc-2.10.1/arm-check-pf.patch
index b9c7226..b045405 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/arm-check-pf.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/arm-check-pf.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 Index: glibc-2.9/ports/sysdeps/unix/sysv/linux/arm/check_pf.c
 ===================================================================
 --- glibc-2.9.orig/ports/sysdeps/unix/sysv/linux/arm/check_pf.c	2009-06-19 20:45:32.451372131 +0400
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/arm-longlong.patch b/meta/recipes-core/glibc/glibc-2.10.1/arm-longlong.patch
index 28aca83..ce67d7e 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/arm-longlong.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/arm-longlong.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 --- glibc-2.4/stdlib/longlong.h.ark	2006-03-11 22:49:27.000000000 +0100
 +++ glibc-2.4/stdlib/longlong.h	2006-03-11 22:55:12.000000000 +0100
 @@ -206,6 +206,14 @@
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/arm-lowlevellock-include-tls.patch b/meta/recipes-core/glibc/glibc-2.10.1/arm-lowlevellock-include-tls.patch
index 5c8062e..3f81295 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/arm-lowlevellock-include-tls.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/arm-lowlevellock-include-tls.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 Index: glibc-2.9/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h
 ===================================================================
 --- glibc-2.9.orig/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h	2009-06-19 20:54:35.446686910 +0400
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/arm-memcpy.patch b/meta/recipes-core/glibc/glibc-2.10.1/arm-memcpy.patch
index bc2b3da..f50d481 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/arm-memcpy.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/arm-memcpy.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 --- /dev/null	2004-02-02 20:32:13.000000000 +0000
 +++ sysdeps/arm/memmove.S	2004-03-20 18:37:23.000000000 +0000
 @@ -0,0 +1,251 @@
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/dl-cache-libcmp.patch b/meta/recipes-core/glibc/glibc-2.10.1/dl-cache-libcmp.patch
index 2fedfa6..199aaa6 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/dl-cache-libcmp.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/dl-cache-libcmp.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 --- glibc-2.4/elf/Versions.ark	2006-03-11 23:30:09.000000000 +0100
 +++ glibc-2.4/elf/Versions	2006-03-11 23:31:44.000000000 +0100
 @@ -63,5 +63,7 @@
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/fhs-linux-paths.patch b/meta/recipes-core/glibc/glibc-2.10.1/fhs-linux-paths.patch
index 1f32f6d..91c6781 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/fhs-linux-paths.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/fhs-linux-paths.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 --- glibc-2.1.1/sysdeps/unix/sysv/linux/paths.h~	Thu May 27 13:16:33 1999
 +++ glibc-2.1.1/sysdeps/unix/sysv/linux/paths.h	Thu May 27 13:17:55 1999
 @@ -71,7 +71,7 @@
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-IO-acquire-lock-fix.diff b/meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-IO-acquire-lock-fix.diff
index a552cf0..843c5e8 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-IO-acquire-lock-fix.diff
+++ b/meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-IO-acquire-lock-fix.diff
@@ -1,5 +1,7 @@
 Arm needs a similar fix as http://sourceware.org/ml/libc-ports/2007-12/msg00000.html
 
+Upstream-Status: Inappropriate [not used]
+
 --- /tmp/stdio-lock.h	2008-03-04 18:51:15.555038993 +0100
 +++ glibc-2.7/ports/sysdeps/unix/sysv/linux/arm/bits/stdio-lock.h	2008-03-04 18:51:28.445035052 +0100
 @@ -50,6 +50,8 @@
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-no-asm-page.patch b/meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-no-asm-page.patch
index 7eb1717..9dba9d2 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-no-asm-page.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/glibc-arm-no-asm-page.patch
@@ -1,5 +1,7 @@
 http://sourceware.org/ml/libc-ports/2008-04/msg00005.html
 
+Upstream-Status: Inappropriate [not used]
+
 
 Index: glibc-2.6.1/ports/sysdeps/unix/sysv/linux/arm/ioperm.c
 ===================================================================
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/glibc-check_pf.patch b/meta/recipes-core/glibc/glibc-2.10.1/glibc-check_pf.patch
index 3cff6bb..a0e55bf 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/glibc-check_pf.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/glibc-check_pf.patch
@@ -51,6 +51,8 @@ CodeSourcery
 	* sysdeps/unix/sysv/linux/arm/check_pf.c: New file.
 	* sysdeps/unix/sysv/linux/arm/eabi/check_pf.c: New file.
 
+Upstream-Status: Inappropriate [not used]
+
 Index: sysdeps/unix/sysv/linux/arm/check_pf.c
 ===================================================================
 RCS file: sysdeps/unix/sysv/linux/arm/check_pf.c
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/ldd-unbash.patch b/meta/recipes-core/glibc/glibc-2.10.1/ldd-unbash.patch
index 2fb8854..1601310 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/ldd-unbash.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/ldd-unbash.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 --- glibc-2.5/elf/ldd.bash.in.org	2006-04-30 16:06:20.000000000 +0000
 +++ glibc-2.5/elf/ldd.bash.in	2007-03-30 19:18:57.000000000 +0000
 @@ -110,7 +110,7 @@
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/ldsocache-varrun.patch b/meta/recipes-core/glibc/glibc-2.10.1/ldsocache-varrun.patch
index 9994d4f..c303c64 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/ldsocache-varrun.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/ldsocache-varrun.patch
@@ -5,6 +5,8 @@ where /etc is JFFS2 or CRAMFS but /var is a ramdisk.
 # Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
 #
 
+Upstream-Status: Inappropriate [not used]
+
 --- libc/sysdeps/generic/dl-cache.h~ldsocache-varrun
 +++ libc/sysdeps/generic/dl-cache.h
 @@ -29,7 +29,7 @@
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/local-args6.diff b/meta/recipes-core/glibc/glibc-2.10.1/local-args6.diff
index 28c957f..d6f3e0e 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/local-args6.diff
+++ b/meta/recipes-core/glibc/glibc-2.10.1/local-args6.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 --- glibc-2.7/ports/sysdeps/unix/sysv/linux/arm/nptl/sysdep-cancel.h.orig
 +++ glibc-2.7/ports/sysdeps/unix/sysv/linux/arm/nptl/sysdep-cancel.h
 @@ -73,6 +73,9 @@
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/march-i686.patch b/meta/recipes-core/glibc/glibc-2.10.1/march-i686.patch
index 0461603..687235c 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/march-i686.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/march-i686.patch
@@ -4,6 +4,7 @@
        * nptl/sysdeps/pthread/pt-initfini.c: Ditto.
 
 
+Upstream-Status: Inappropriate [not used]
 
 Index: sysdeps/unix/sysv/linux/i386/sysdep.h
 ===================================================================
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/mips-rld-map-check.patch b/meta/recipes-core/glibc/glibc-2.10.1/mips-rld-map-check.patch
index ed08d7e..2599e16 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/mips-rld-map-check.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/mips-rld-map-check.patch
@@ -4,6 +4,8 @@ a binutils bug, but libc shouldn't segfault in this case.
 
 see also: http://sourceware.org/bugilla/show_bug.cgi?id=11615
 
+Upstream-Status: Inappropriate [not used]
+
 9/19/2010 - added by Qing He <qing.he@intel.com>
 ---
 diff -ru glibc-2.10.1.orig/ports/sysdeps/mips/dl-machine.h glibc-2.10.1/ports/sysdeps/mips/dl-machine.h
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/nptl-crosscompile.patch b/meta/recipes-core/glibc/glibc-2.10.1/nptl-crosscompile.patch
index 18a46ad..7e3d9bb 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/nptl-crosscompile.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/nptl-crosscompile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 --- glibc-2.4/nptl/sysdeps/pthread/configure.in.ark	2006-03-12 00:41:40.000000000 +0100
 +++ glibc-2.4/nptl/sysdeps/pthread/configure.in	2006-03-12 00:44:08.000000000 +0100
 @@ -45,5 +45,6 @@
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/nscd-init.patch b/meta/recipes-core/glibc/glibc-2.10.1/nscd-init.patch
index 884609a..8017e49 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/nscd-init.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/nscd-init.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 --- nscd/nscd.init
 +++ nscd/nscd.init
 @@ -48,9 +48,8 @@
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/powerpc-sqrt-hack.diff b/meta/recipes-core/glibc/glibc-2.10.1/powerpc-sqrt-hack.diff
index 1046efb..bbc75d1 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/powerpc-sqrt-hack.diff
+++ b/meta/recipes-core/glibc/glibc-2.10.1/powerpc-sqrt-hack.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 diff -Nurd ../glibc-initial-2.5-r4/glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.c glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.c
 --- ../glibc-initial-2.5-r4/glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.c	2006-04-14 07:44:30.000000000 +0200
 +++ glibc-2.5/sysdeps/powerpc/fpu/e_sqrt.c	2006-12-08 12:53:32.202227000 +0100
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/rulesfix.patch b/meta/recipes-core/glibc/glibc-2.10.1/rulesfix.patch
index 67bfc94..585bb62 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/rulesfix.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/rulesfix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 Index: glibc-2.9/Makerules
 ===================================================================
 --- glibc-2.9.orig/Makerules	2009-09-14 16:39:21.000000000 +0100
diff --git a/meta/recipes-devtools/dpkg/dpkg/autofoo.patch b/meta/recipes-devtools/dpkg/dpkg/autofoo.patch
index 691121e..2f1edce 100644
--- a/meta/recipes-devtools/dpkg/dpkg/autofoo.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/autofoo.patch
@@ -3,6 +3,8 @@
 # Patch managed by http://www.holgerschurig.de/patcher.html
 #
 
+Upstream-Status: Inappropriate [configuration]
+
 --- dpkg-1.10.23/configure.in~autofoo
 +++ dpkg-1.10.23/configure.in
 @@ -227,21 +227,36 @@
diff --git a/meta/recipes-devtools/dpkg/dpkg/check_snprintf.patch b/meta/recipes-devtools/dpkg/dpkg/check_snprintf.patch
index 7673cf1..56eb0ca 100644
--- a/meta/recipes-devtools/dpkg/dpkg/check_snprintf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/check_snprintf.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -ruN dpkg-1.15.8.5-orig/m4/dpkg-funcs.m4 dpkg-1.15.8.5/m4/dpkg-funcs.m4
 --- dpkg-1.15.8.5-orig/m4/dpkg-funcs.m4	2010-10-08 12:27:15.082131611 +0800
 +++ dpkg-1.15.8.5/m4/dpkg-funcs.m4	2010-10-08 13:56:50.074284346 +0800
diff --git a/meta/recipes-devtools/dpkg/dpkg/check_version.patch b/meta/recipes-devtools/dpkg/dpkg/check_version.patch
index a09e136..524e715 100644
--- a/meta/recipes-devtools/dpkg/dpkg/check_version.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/check_version.patch
@@ -2,6 +2,8 @@ Adapt to linux-wrs kernel version, which has character '_' inside.
 
 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Inappropriate [embedded specific]
+
 diff -ruN dpkg-1.15.8.5-orig/lib/dpkg/parsehelp.c dpkg-1.15.8.5/lib/dpkg/parsehelp.c
 --- dpkg-1.15.8.5-orig/lib/dpkg/parsehelp.c	2010-10-08 12:27:15.058572774 +0800
 +++ dpkg-1.15.8.5/lib/dpkg/parsehelp.c	2010-10-09 11:18:15.484190771 +0800
diff --git a/meta/recipes-devtools/dpkg/dpkg/ignore_extra_fields.patch b/meta/recipes-devtools/dpkg/dpkg/ignore_extra_fields.patch
index 27b4f3b..0ff09e7 100644
--- a/meta/recipes-devtools/dpkg/dpkg/ignore_extra_fields.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/ignore_extra_fields.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [workaround]
+
 diff -ruN dpkg-1.15.8.5-orig/dpkg-deb/build.c dpkg-1.15.8.5/dpkg-deb/build.c
 --- dpkg-1.15.8.5-orig/dpkg-deb/build.c	2010-10-08 12:27:15.042083703 +0800
 +++ dpkg-1.15.8.5/dpkg-deb/build.c	2010-10-08 12:31:53.822534277 +0800
diff --git a/meta/recipes-devtools/dpkg/dpkg/nochroot.patch b/meta/recipes-devtools/dpkg/dpkg/nochroot.patch
index 3a8beae..c7f2dfe 100644
--- a/meta/recipes-devtools/dpkg/dpkg/nochroot.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/nochroot.patch
@@ -2,6 +2,8 @@
  src/help.c |    2 ++
  1 file changed, 2 insertions(+)
 
+Upstream-Status: Inappropriate [configuration]
+
 --- dpkg-1.13.22.orig/src/help.c
 +++ dpkg-1.13.22/src/help.c
 @@ -175,9 +175,11 @@ static const char* preexecscript(const c
diff --git a/meta/recipes-devtools/dpkg/dpkg/noman.patch b/meta/recipes-devtools/dpkg/dpkg/noman.patch
index d8fc9c4..58cb22a 100644
--- a/meta/recipes-devtools/dpkg/dpkg/noman.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/noman.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [disable feature]
+
 diff -ruN dpkg-1.15.8.5-orig/Makefile.am dpkg-1.15.8.5/Makefile.am
 --- dpkg-1.15.8.5-orig/Makefile.am	2010-10-08 12:27:15.042083703 +0800
 +++ dpkg-1.15.8.5/Makefile.am	2010-10-08 12:27:27.755148228 +0800
diff --git a/meta/recipes-devtools/dpkg/dpkg/noupdalt.patch b/meta/recipes-devtools/dpkg/dpkg/noupdalt.patch
index 023e99a..a9b3800 100644
--- a/meta/recipes-devtools/dpkg/dpkg/noupdalt.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/noupdalt.patch
@@ -2,6 +2,8 @@
  scripts/Makefile.am |    3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 --- dpkg-1.13.22.orig/scripts/Makefile.am
 +++ dpkg-1.13.22/scripts/Makefile.am
 @@ -20,8 +20,7 @@ bin_SCRIPTS = \
diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/COPYING.patch b/meta/recipes-devtools/makedevs/makedevs-1.0.0/COPYING.patch
index 3208ad7..c63ab53 100644
--- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/COPYING.patch
+++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/COPYING.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inapropriate [others]
+
 diff -ruN makedevs-1.0.0-orig/COPYING makedevs-1.0.0/COPYING
 --- makedevs-1.0.0-orig/COPYING	1970-01-01 08:00:00.000000000 +0800
 +++ makedevs-1.0.0/COPYING	2010-12-09 16:42:20.274984665 +0800
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
index e4a5481..3664df6 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
@@ -5,6 +5,8 @@ error out.
 
 RP - 26/8/09
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: opkg-utils/opkg-make-index
 ===================================================================
 --- opkg-utils.orig/opkg-make-index	2009-08-26 17:21:26.000000000 +0100
diff --git a/meta/recipes-devtools/opkg/opkg/add_vercmp.patch b/meta/recipes-devtools/opkg/opkg/add_vercmp.patch
index 540be83..1203c54 100644
--- a/meta/recipes-devtools/opkg/opkg/add_vercmp.patch
+++ b/meta/recipes-devtools/opkg/opkg/add_vercmp.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [function not used]
+
 Index: trunk/libopkg/opkg.c
 ===================================================================
 --- trunk.orig/libopkg/opkg.c	2010-01-26 20:32:19.000000000 +0000
diff --git a/meta/recipes-devtools/opkg/opkg/headerfix.patch b/meta/recipes-devtools/opkg/opkg/headerfix.patch
index d0711ec..b3515a0 100644
--- a/meta/recipes-devtools/opkg/opkg/headerfix.patch
+++ b/meta/recipes-devtools/opkg/opkg/headerfix.patch
@@ -2,6 +2,8 @@ Without this, the FILE reference in this header can cause compile issues.
 
 RP - 29/1/10
 
+Upstream-Status: Pending
+
 Index: trunk/libopkg/pkg_dest.h
 ===================================================================
 --- trunk.orig/libopkg/pkg_dest.h	2010-01-29 09:37:22.000000000 +0000
diff --git a/meta/recipes-extended/minicom/minicom-2.4/gcc4-scope.patch b/meta/recipes-extended/minicom/minicom-2.4/gcc4-scope.patch
index 5bd47bd..0660cb0 100644
--- a/meta/recipes-extended/minicom/minicom-2.4/gcc4-scope.patch
+++ b/meta/recipes-extended/minicom/minicom-2.4/gcc4-scope.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [others]
+
 --- minicom-2.1/src/window.c.orig	2006-06-14 17:49:53.000000000 +0200
 +++ minicom-2.1/src/window.c	2006-06-14 17:50:14.000000000 +0200
 @@ -62,7 +62,7 @@
diff --git a/meta/recipes-extended/minicom/minicom-2.4/rename-conflicting-functions.patch b/meta/recipes-extended/minicom/minicom-2.4/rename-conflicting-functions.patch
index c344203..1a50f18 100644
--- a/meta/recipes-extended/minicom/minicom-2.4/rename-conflicting-functions.patch
+++ b/meta/recipes-extended/minicom/minicom-2.4/rename-conflicting-functions.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- minicom-2.3/src/minicom.c-orig	2009-06-08 14:49:07.000000000 +0200
 +++ minicom-2.3/src/minicom.c	2009-06-08 14:50:23.000000000 +0200
 @@ -63,6 +63,10 @@
diff --git a/meta/recipes-extended/rpcbind/rpcbind/fix_host_path.patch b/meta/recipes-extended/rpcbind/rpcbind/fix_host_path.patch
index 1b12d83..590b344 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/fix_host_path.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/fix_host_path.patch
@@ -2,6 +2,8 @@ This fixes the hardcoded HOST path
 
 Signed-off-by: Saul Wold <saul.wold@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 --- rpcbind-0.2.0/src/Makefile.am	2010-09-02 11:47:16.725763886 -0700
 +++ rpcbind-0.2.0_fixed/src/Makefile.am	2010-09-02 11:47:36.077763138 -0700
 @@ -29,6 +29,6 @@
diff --git a/meta/recipes-extended/which/which-2.20/remove-declaration.patch b/meta/recipes-extended/which/which-2.20/remove-declaration.patch
index 09b8143..d3340a3 100644
--- a/meta/recipes-extended/which/which-2.20/remove-declaration.patch
+++ b/meta/recipes-extended/which/which-2.20/remove-declaration.patch
@@ -3,6 +3,8 @@ declared in unistd.h
 
 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Inappropriate [embedded specific]
+
 diff -ruN which-2.20-orig/bash.c which-2.20/bash.c
 --- which-2.20-orig/bash.c	2010-08-03 12:59:08.897088878 +0800
 +++ which-2.20/bash.c	2010-08-03 13:17:23.406097212 +0800
diff --git a/meta/recipes-graphics/clutter/clutter-gst/autofoo-0.4.patch b/meta/recipes-graphics/clutter/clutter-gst/autofoo-0.4.patch
index 54df63d..4f2d50c 100644
--- a/meta/recipes-graphics/clutter/clutter-gst/autofoo-0.4.patch
+++ b/meta/recipes-graphics/clutter/clutter-gst/autofoo-0.4.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 ---
  doc/reference/Makefile.am |    2 +-
  examples/Makefile.am      |    2 +-
diff --git a/meta/recipes-graphics/clutter/clutter-gst/autofoo-9db4a61a25677764bb927369c5c68ada958fb65c.patch b/meta/recipes-graphics/clutter/clutter-gst/autofoo-9db4a61a25677764bb927369c5c68ada958fb65c.patch
index 569b0d8..2b43c80 100644
--- a/meta/recipes-graphics/clutter/clutter-gst/autofoo-9db4a61a25677764bb927369c5c68ada958fb65c.patch
+++ b/meta/recipes-graphics/clutter/clutter-gst/autofoo-9db4a61a25677764bb927369c5c68ada958fb65c.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 ---
  doc/reference/Makefile.am |    2 +-
  examples/Makefile.am      |    2 +-
diff --git a/meta/recipes-graphics/clutter/clutter-gst/autofoo.patch b/meta/recipes-graphics/clutter/clutter-gst/autofoo.patch
index ad77d63..7d50624 100644
--- a/meta/recipes-graphics/clutter/clutter-gst/autofoo.patch
+++ b/meta/recipes-graphics/clutter/clutter-gst/autofoo.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [not used]
+
 ---
  doc/reference/Makefile.am |    2 +-
  examples/Makefile.am      |    2 +-
diff --git a/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.4.patch b/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.4.patch
index f1f68ac..3fc1378 100644
--- a/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.4.patch
+++ b/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.4.patch
@@ -1,6 +1,9 @@
 Install example binary needed for core-image-clutter
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/examples/Makefile.am
 ===================================================================
 --- git.orig/examples/Makefile.am	2011-05-04 14:07:21.000000000 -0700
diff --git a/meta/recipes-graphics/clutter/clutter-gst/enable_tests.patch b/meta/recipes-graphics/clutter/clutter-gst/enable_tests.patch
index e9dc8a2..6175a52 100644
--- a/meta/recipes-graphics/clutter/clutter-gst/enable_tests.patch
+++ b/meta/recipes-graphics/clutter/clutter-gst/enable_tests.patch
@@ -1,6 +1,9 @@
 Install example binary needed for core-image-clutter
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/examples/Makefile.am
 ===================================================================
 --- git.orig/examples/Makefile.am	2011-01-31 10:14:23.000000000 +0800
diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/disable-xmms-plugin.patch b/meta/recipes-multimedia/flac/flac-1.2.1/disable-xmms-plugin.patch
index e2f4fa1..80769a8 100644
--- a/meta/recipes-multimedia/flac/flac-1.2.1/disable-xmms-plugin.patch
+++ b/meta/recipes-multimedia/flac/flac-1.2.1/disable-xmms-plugin.patch
@@ -1,4 +1,5 @@
 # Acquired from OpenEmbedded
+Upstream-Status: Inappropriate [disable feature]
 
 diff -ruN flac-1.2.1-orig/src/Makefile.am flac-1.2.1-new/src/Makefile.am
 --- flac-1.2.1-orig/src/Makefile.am	2010-06-23 15:06:29.167865355 +0800
diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/flac-gcc43-fixes.patch b/meta/recipes-multimedia/flac/flac-1.2.1/flac-gcc43-fixes.patch
index fdb6f13..9c528c2 100644
--- a/meta/recipes-multimedia/flac/flac-1.2.1/flac-gcc43-fixes.patch
+++ b/meta/recipes-multimedia/flac/flac-1.2.1/flac-gcc43-fixes.patch
@@ -1,5 +1,6 @@
 # Acquired from OpenEmbedded
 # Fix no declaration of memcmp()
+Upstream-Status: Pending
 
 diff -urN flac-1.2.1-orig/examples/cpp/encode/file/main.cpp flac-1.2.1/examples/cpp/encode/file/main.cpp
 --- flac-1.2.1-orig/examples/cpp/encode/file/main.cpp	2010-06-23 15:06:29.159481339 +0800
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.11/lower-rank.diff b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.11/lower-rank.diff
index bffdb8a..5f08afe 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.11/lower-rank.diff
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.11/lower-rank.diff
@@ -1,6 +1,8 @@
 Lower the rank of ffmpeg plugin so codecs that hook into accelerated pieces (e.g. dsp or hw engines) can get picked over this
 Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Inappropriate [embedded specific]
+
 --- /tmp/gstffmpegdec.c	2009-03-05 09:31:15.000000000 +0100
 +++ gst-ffmpeg-0.10.6/ext/ffmpeg/gstffmpegdec.c	2009-03-05 09:33:09.000000000 +0100
 @@ -2588,7 +2588,7 @@
diff --git a/meta/recipes-multimedia/liba52/liba52/buildcleanup.patch b/meta/recipes-multimedia/liba52/liba52/buildcleanup.patch
index a86c5a8..5168100 100644
--- a/meta/recipes-multimedia/liba52/liba52/buildcleanup.patch
+++ b/meta/recipes-multimedia/liba52/liba52/buildcleanup.patch
@@ -4,6 +4,8 @@ around.
 
 RP 23/2/10
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: a52dec-0.7.4/configure.in
 ===================================================================
 --- a52dec-0.7.4.orig/configure.in	2010-02-23 14:51:50.000000000 +0000
diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch b/meta/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch
index 07a8f6e..38d40c3 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch
+++ b/meta/recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: libid3tag-0.15.1b/Makefile.am
 ===================================================================
 --- libid3tag-0.15.1b.orig/Makefile.am	2009-07-29 09:29:20.000000000 +0100
diff --git a/meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/fix_build_issue_for_gcc_4.5.0.patch b/meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/fix_build_issue_for_gcc_4.5.0.patch
index 80d4d8b..6fb45e1 100644
--- a/meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/fix_build_issue_for_gcc_4.5.0.patch
+++ b/meta/recipes-multimedia/musicbrainz/libmusicbrainz-3.0.3/fix_build_issue_for_gcc_4.5.0.patch
@@ -23,6 +23,8 @@ http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=504895
 Date: 2010/07/28
 Nitin A Kamble <nitin.a.kamble@intel.com>
 
+Upstream-Status: Inappropriate [debian patch]
+
 Index: libmusicbrainz-3.0.2/src/utils_private.cpp
 ===================================================================
 --- libmusicbrainz-3.0.2.orig/src/utils_private.cpp
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/armv4+v5asm.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/armv4+v5asm.patch
index f07ee67..4ce5a48 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/armv4+v5asm.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/armv4+v5asm.patch
@@ -1,5 +1,7 @@
 Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: pulseaudio-0.9.21/src/pulsecore/svolume_arm.c
 ===================================================================
 --- pulseaudio-0.9.21.orig/src/pulsecore/svolume_arm.c
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/autoconf_version.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/autoconf_version.patch
index 80d0003..86e3972 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/autoconf_version.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/autoconf_version.patch
@@ -1,5 +1,7 @@
 Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: pulseaudio-0.9.15/configure.ac
 ===================================================================
 --- pulseaudio-0.9.15.orig/configure.ac	2009-04-14 00:09:53.000000000 +0100
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/buildfix.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/buildfix.patch
index ea8d769..99ceff8 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/buildfix.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/buildfix.patch
@@ -1,5 +1,7 @@
 Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Pending
+
 Index: pulseaudio-0.9.11/src/pulsecore/atomic.h
 ===================================================================
 --- pulseaudio-0.9.11.orig/src/pulsecore/atomic.h
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/configure_silent_rules.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/configure_silent_rules.patch
index fd5abd5..d4a247a 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/configure_silent_rules.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/configure_silent_rules.patch
@@ -1,5 +1,7 @@
 Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: pulseaudio-0.9.19/configure.ac
 ===================================================================
 --- pulseaudio-0.9.19.orig/configure.ac	2009-10-31 11:40:00.000000000 +0000
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/gcc4-compile-fix.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/gcc4-compile-fix.patch
index 2969cba..f8b07ea 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/gcc4-compile-fix.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/gcc4-compile-fix.patch
@@ -5,6 +5,8 @@
 |
 Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Pending
+
 Index: pulseaudio-0.9.6/src/pulsecore/core-util.c
 ===================================================================
 --- pulseaudio-0.9.6.orig/src/pulsecore/core-util.c
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/tls_m4.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/tls_m4.patch
index a8292b2..bae0a25 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/tls_m4.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/tls_m4.patch
@@ -1,5 +1,7 @@
 Derived from OE by Dongxiao Xu <dongxiao.xu@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: pulseaudio-0.9.15/m4/tls.m4
 ===================================================================
 --- pulseaudio-0.9.15.orig/m4/tls.m4	2008-08-19 23:25:02.000000000 +0200
diff --git a/meta/recipes-support/db/db/arm-thumb-mutex_db5.patch b/meta/recipes-support/db/db/arm-thumb-mutex_db5.patch
index 51d4854..40b13de 100644
--- a/meta/recipes-support/db/db/arm-thumb-mutex_db5.patch
+++ b/meta/recipes-support/db/db/arm-thumb-mutex_db5.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 --- db-5.1.19/src/dbinc/mutex_int.h.orig	2011-01-05 19:21:42.181805366 -0600
 +++ db-5.1.19/src/dbinc/mutex_int.h	2011-01-05 19:24:53.141853117 -0600
 @@ -474,6 +474,25 @@
diff --git a/meta/recipes-support/neon/neon-0.29.5/pkgconfig.patch b/meta/recipes-support/neon/neon-0.29.5/pkgconfig.patch
index 6256d9a..1a2550c 100644
--- a/meta/recipes-support/neon/neon-0.29.5/pkgconfig.patch
+++ b/meta/recipes-support/neon/neon-0.29.5/pkgconfig.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  neon.pc.in |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-support/taglib/taglib-1.6.3/configuretweak.patch b/meta/recipes-support/taglib/taglib-1.6.3/configuretweak.patch
index 07eb6d7..8b81fc7 100644
--- a/meta/recipes-support/taglib/taglib-1.6.3/configuretweak.patch
+++ b/meta/recipes-support/taglib/taglib-1.6.3/configuretweak.patch
@@ -5,6 +5,8 @@ Fix macros accordingly fixing build failures
 
 RP 2/2/10
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: taglib-1.6.1/acinclude.m4
 ===================================================================
 --- taglib-1.6.1.orig/acinclude.m4	2010-02-01 23:57:16.857788731 +0000
diff --git a/meta/recipes-support/taglib/taglib-1.6.3/nolibtool.patch b/meta/recipes-support/taglib/taglib-1.6.3/nolibtool.patch
index b072cbc..18237f2 100644
--- a/meta/recipes-support/taglib/taglib-1.6.3/nolibtool.patch
+++ b/meta/recipes-support/taglib/taglib-1.6.3/nolibtool.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: taglib-1.6.1/acinclude.m4
 ===================================================================
 --- taglib-1.6.1.orig/acinclude.m4	2009-10-31 10:04:35.000000000 +0000
-- 
1.7.1.1



