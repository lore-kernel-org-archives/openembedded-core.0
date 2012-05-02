Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPgjC-0000Ln-RN
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 23:04:51 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so1385298pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 13:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=PZNv2uQLlgkBaU4uVXOeNFadIxOP9G6/TPSKY/hXEck=;
	b=nSaAgzcXo1oi7tAbbtANI18LofSLvQMzL54d/KjfhC2NiXK9wcwKxSmQqQV8wE63Ah
	umlygaEdB2+ih3J6GDbMycqhXGcS9IPthKrdNmmTKG2PNNUJxtbeOqWNH9388z8KP1cw
	wAafZxJySap6eD0V2tFOEv+TXeBr3auRls911+SSTkUGN+qwR2YXS3OXVkxw8ciihkCz
	+Ehmx2t5HCxvk4etBH1h7QWN6OdV2SWHTCkySLb0aGIeBLMvi9YPe0/Yn8oCz/gBM9HA
	3XVdA6hJU5P9ZDKjR3Drxn6Ws+KnboTwkLaawXbC7rSQDkerJxAPpdWEYhKqTe7yns4o
	2bZw==
Received: by 10.68.226.129 with SMTP id rs1mr957645pbc.29.1335992107996;
	Wed, 02 May 2012 13:55:07 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pg6sm2949558pbb.41.2012.05.02.13.55.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 13:55:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 13:54:00 -0700
Message-Id: <e8d5425f8ca14a0c0b7378a9202fd4c72761ea12.1335991900.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
References: <0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
In-Reply-To: <cover.1335991900.git.raj.khem@gmail.com>
References: <cover.1335991900.git.raj.khem@gmail.com>
Subject: [PATCH 7/7] Enable PARALLEL_MAKE for testing
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
X-List-Received-Date: Wed, 02 May 2012 21:04:51 -0000

From: Yuri Bushmelev <jay4mail@gmail.com>

Signed-off-by: Yuri Bushmelev <jay4mail@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.1.9.bb        |    1 -
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    1 -
 meta/recipes-connectivity/iproute2/iproute2.inc    |    1 -
 .../nfs-utils/nfs-utils_1.2.3.bb                   |    1 -
 meta/recipes-core/eggdbus/eggdbus_0.6.bb           |    1 -
 meta/recipes-devtools/autoconf/autoconf_2.68.bb    |    1 -
 meta/recipes-extended/groff/groff_1.20.1.bb        |    1 -
 meta/recipes-extended/mailx/mailx_12.5.bb          |    1 -
 .../net-tools/net-tools_1.60-23.bb                 |    1 -
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    1 -
 .../fontconfig/fontconfig_2.8.0.bb                 |    1 -
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    1 -
 meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb  |    1 -
 meta/recipes-graphics/xcb/xcb-util.inc             |    1 -
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    1 -
 meta/recipes-multimedia/speex/speex_1.2rc1.bb      |    1 -
 meta/recipes-support/icu/icu-3.6.inc               |    1 -
 meta/recipes-support/libpcre/libpcre_8.21.bb       |    1 -
 18 files changed, 0 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb b/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
index 2c969d9..83c040d 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
@@ -21,7 +21,6 @@ SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "79cc1d0bff8603d3a550fa63802cd1db"
 SRC_URI[sha256sum] = "e4ce5d56ae4a9611d51ba0cc2ea45806f9539a18aceb4aa70b8ded50f6923c4f"
 
-PARALLEL_MAKE = ""
 
 PCI_CONF_FLAG = "ZLIB=yes DNS=yes SHARED=yes"
 
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
index c0c1d0c..f303145 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
@@ -23,7 +23,6 @@ LD = "${CC}"
 CFLAGS =+ "-I${S}/src"
 CFLAGS =+ "-DPCMCIAUTILS_VERSION=\'${PV}\'"
 
-PARALLEL_MAKE = ""
 EXTRA_OEMAKE = "-e 'STRIP=echo' 'LIB_OBJS=-lc -lsysfs' 'LEX=flex'"
 
 do_install () {
diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 86847ef..ef5d3c6 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -34,4 +34,3 @@ ALTERNATIVE_PATH = "${base_sbindir}/ip.iproute2"
 ALTERNATIVE_LINK = "${base_bindir}/ip"
 ALTERNATIVE_PRIORITY = "100"
 
-PARALLEL_MAKE = ""
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
index d047940..a45729d 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
@@ -22,7 +22,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "1131dc5f27c4f3905a6e7ee0d594fd4d"
 SRC_URI[sha256sum] = "5575ece941097cbfa67fbe0d220dfa11b73f5e6d991e7939c9339bd72259ff19"
 
-PARALLEL_MAKE = ""
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
diff --git a/meta/recipes-core/eggdbus/eggdbus_0.6.bb b/meta/recipes-core/eggdbus/eggdbus_0.6.bb
index 75f56de..acca5f0 100644
--- a/meta/recipes-core/eggdbus/eggdbus_0.6.bb
+++ b/meta/recipes-core/eggdbus/eggdbus_0.6.bb
@@ -28,4 +28,3 @@ EXTRA_OECONF = " --disable-man-pages --disable-gtk-doc-html "
 
 BBCLASSEXTEND = "native"
 
-PARALLEL_MAKE = ""
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
index 8d466e0..3f59aff 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
@@ -2,7 +2,6 @@ require autoconf.inc
 
 PR = "r7"
 
-PARALLEL_MAKE = ""
 
 LICENSE = "GPLv2 & GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
diff --git a/meta/recipes-extended/groff/groff_1.20.1.bb b/meta/recipes-extended/groff/groff_1.20.1.bb
index 6cb72bf..de20303 100644
--- a/meta/recipes-extended/groff/groff_1.20.1.bb
+++ b/meta/recipes-extended/groff/groff_1.20.1.bb
@@ -19,7 +19,6 @@ DEPENDS_virtclass-native = ""
 inherit autotools
 
 EXTRA_OECONF = "--without-x"
-PARALLEL_MAKE = ""
 
 do_configure_prepend() {
 	if [ "${BUILD_SYS}" != "${HOST_SYS}" ]; then
diff --git a/meta/recipes-extended/mailx/mailx_12.5.bb b/meta/recipes-extended/mailx/mailx_12.5.bb
index 2a08113..634d6da 100644
--- a/meta/recipes-extended/mailx/mailx_12.5.bb
+++ b/meta/recipes-extended/mailx/mailx_12.5.bb
@@ -27,4 +27,3 @@ inherit autotools
 
 CFLAGS_append = " -D_BSD_SOURCE -DDEBIAN -I${S}/EXT"
 
-PARALLEL_MAKE = ""
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
index b9a05c6..69dfca9 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
@@ -23,7 +23,6 @@ SRC_URI[patch.sha256sum] = "d678b3ea97d6c7ca548918994642bfc6b5511ab02f3a5881dfcc
 inherit gettext
 
 # The Makefile is lame, no parallel build
-PARALLEL_MAKE = ""
 
 # Unlike other Debian packages, net-tools *.diff.gz contains another series of
 # patches maintained by quilt. So manually apply them before applying other local
diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
index 9d8422f..b796124 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -10,7 +10,6 @@ SRCREV = "0a7378d5f482f477a01cf1690d76871ab8bdcc32"
 PV = "0.0-git${SRCPV}"
 PR = "r13"
 
-PARALLEL_MAKE=""
 
 SRC_URI = "git://github.com/openSUSE/sat-solver.git;protocol=git \
            file://sat-solver_rpm5.patch \
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
index 55c04cc..51f31ac 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
@@ -39,7 +39,6 @@ RREPLACES_fontconfig-utils = "libfontconfig-utils"
 RCONFLICTS_fontconfig-utils = "libfontconfig-utils"
 DEBIAN_NOAUTONAME_fontconfig-utils = "1"
 
-PARALLEL_MAKE = ""
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 8b39442..3fbd584 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -49,7 +49,6 @@ EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib,"
 
-PARALLEL_MAKE = ""
 
 EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
 
diff --git a/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb b/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
index c121bb9..44d9b79 100644
--- a/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
+++ b/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
@@ -8,7 +8,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6edc1fea03d959f0c2d743fe5ca746ad"
 PR = "r0"
 
-PARALLEL_MAKE = ""
 #DEPENDS = "xcb-proto xproto libxau libxslt-native"
 # DEPENDS += "xsltproc-native gperf-native"
 
diff --git a/meta/recipes-graphics/xcb/xcb-util.inc b/meta/recipes-graphics/xcb/xcb-util.inc
index 7dad545..47e7198 100644
--- a/meta/recipes-graphics/xcb/xcb-util.inc
+++ b/meta/recipes-graphics/xcb/xcb-util.inc
@@ -16,7 +16,6 @@ SECTION = "x11/libs"
 DEPENDS = "libxcb"
 DEPENDS += "gperf-native"
 
-PARALLEL_MAKE = ""
 
 SRC_URI = "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.bz2"
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index a653af5..d2fdbe3 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -34,7 +34,6 @@ EXTRA_OECONF = "\
 		--with-access-group=audio \
 "
 
-PARALLEL_MAKE = ""
 
 export TARGET_PFPU = "${TARGET_FPU}"
 
diff --git a/meta/recipes-multimedia/speex/speex_1.2rc1.bb b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
index 7370134..7da9645 100644
--- a/meta/recipes-multimedia/speex/speex_1.2rc1.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
@@ -14,7 +14,6 @@ SRC_URI = "http://downloads.us.xiph.org/releases/speex/speex-1.2rc1.tar.gz"
 SRC_URI[md5sum] = "c4438b22c08e5811ff10e2b06ee9b9ae"
 SRC_URI[sha256sum] = "342f30dc57bd4a6dad41398365baaa690429660b10d866b7d508e8f1179cb7a6"
 
-PARALLEL_MAKE = ""
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-support/icu/icu-3.6.inc b/meta/recipes-support/icu/icu-3.6.inc
index e3f9dd2..d3264ae 100644
--- a/meta/recipes-support/icu/icu-3.6.inc
+++ b/meta/recipes-support/icu/icu-3.6.inc
@@ -17,7 +17,6 @@ DEPENDS_virtclass-native = ""
 
 S = "${WORKDIR}/icu/source"
 
-PARALLEL_MAKE = ""
 FULL_OPTIMIZATION_arm = "-Os"
 
 inherit autotools pkgconfig binconfig
diff --git a/meta/recipes-support/libpcre/libpcre_8.21.bb b/meta/recipes-support/libpcre/libpcre_8.21.bb
index f5fa4ef..9477c74 100644
--- a/meta/recipes-support/libpcre/libpcre_8.21.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.21.bb
@@ -22,7 +22,6 @@ DEPENDS = "bzip2 zlib readline"
 
 inherit autotools binconfig
 
-PARALLEL_MAKE = ""
 
 CFLAGS_append = " -D_REENTRANT"
 CXXFLAGS_powerpc += "-lstdc++"
-- 
1.7.5.4



