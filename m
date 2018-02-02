Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A24C678878
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 02:18:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w122IY9s004983
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Feb 2018 18:18:35 -0800
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 1 Feb 2018 18:18:33 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Feb 2018 10:16:14 +0800
Message-ID: <1517537774-12847-8-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517537774-12847-1-git-send-email-yi.zhao@windriver.com>
References: <1517537774-12847-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH 7/7] maintainers.inc: update maintainership
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
X-List-Received-Date: Fri, 02 Feb 2018 02:18:33 -0000
Content-Type: text/plain

Reassign some Robert Yang's recipes to Yi Zhao.
Remove guile and mailx since these recipes were removed from oe-core.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 42 +++++++++++++++-----------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5d13395..34f3d81 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -130,7 +130,7 @@ RECIPE_MAINTAINER_pn-dbus = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-dbus-glib = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-dbus-test = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-dbus-wait = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-debianutils = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-debianutils = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-depmodwrapper-cross = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_MAINTAINER_pn-desktop-file-utils-native = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-dhcp = "Hongxu Jia <hongxu.jia@windriver.com>"
@@ -168,7 +168,7 @@ RECIPE_MAINTAINER_pn-eudev = "Alejandro Hernandez <alejandro.hernandez@linux.int
 RECIPE_MAINTAINER_pn-expat = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-expect = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ffmpeg = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-file = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-file = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-findutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-fixesproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-flac = "Tanu Kaskinen <tanuk@iki.fi>"
@@ -220,7 +220,7 @@ RECIPE_MAINTAINER_pn-gnome-desktop3 = "Alexander Kanavin <alexander.kanavin@inte
 RECIPE_MAINTAINER_pn-gnome-doc-utils = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gnome-themes-standard = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gnu-config = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER_pn-gnu-efi = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-gnu-efi = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-gnupg = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-gnutls = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-go = "Khem Raj <raj.khem@gmail.com>"
@@ -256,7 +256,6 @@ RECIPE_MAINTAINER_pn-gtk-doc = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-gtk-engines = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gtk-icon-utils-native = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gtk-sato-engine = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-guile = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-guilt-native = "Bruce Ashfield <bruce.ashfield@windriver.com>"
 RECIPE_MAINTAINER_pn-gummiboot = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-gzip = "Denys Dmytriyenko <denys@ti.com>"
@@ -305,7 +304,7 @@ RECIPE_MAINTAINER_pn-l3afpad = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-lame = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-latencytop = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ldconfig-native = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-less = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-less = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-liba52 = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-libacpi = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libaio = "Alexander Kanavin <alexander.kanavin@intel.com>"
@@ -314,11 +313,11 @@ RECIPE_MAINTAINER_pn-libart-lgpl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libassuan = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libatomic-ops = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libav = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-libbsd = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER_pn-libcap = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER_pn-libcap-ng = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-libbsd = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-libcap = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-libcap-ng = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libcgroup = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-libcheck = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-libcheck = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libclass-isa-perl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libcomps = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-libconvert-asn1-perl = "Maxin B. John <maxin.john@intel.com>"
@@ -331,7 +330,7 @@ RECIPE_MAINTAINER_pn-libdumpvalue-perl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libenv-perl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libepoxy = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-liberation-fonts = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-liberror-perl = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-liberror-perl = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libevdev = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libevent = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libexif = "Alexander Kanavin <alexander.kanavin@intel.com>"
@@ -374,7 +373,7 @@ RECIPE_MAINTAINER_pn-libowl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libpam = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libpcap = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libpciaccess = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-libpcre = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-libpcre = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libpcre2 = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libpfm4 = "Matthew McClintock <msm@freescale.com>"
 RECIPE_MAINTAINER_pn-libpng = "Maxin B. John <maxin.john@intel.com>"
@@ -385,8 +384,8 @@ RECIPE_MAINTAINER_pn-libpthread-stubs = "Alexander Kanavin <alexander.kanavin@in
 RECIPE_MAINTAINER_pn-librepo = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-librsvg = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libsamplerate0 = "Tanu Kaskinen <tanuk@iki.fi>"
-RECIPE_MAINTAINER_pn-libsdl = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER_pn-libsdl2 = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-libsdl = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-libsdl2 = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libsecret = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-libsm = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libsndfile1 = "Tanu Kaskinen <tanuk@iki.fi>"
@@ -461,7 +460,7 @@ RECIPE_MAINTAINER_pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@windriver
 RECIPE_MAINTAINER_pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@windriver.com>"
 RECIPE_MAINTAINER_pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@windriver.com>"
 RECIPE_MAINTAINER_pn-llvm = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-logrotate = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-lrzsz = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-lsb = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-lsbinitscripts = "Ross Burton <ross.burton@intel.com>"
@@ -477,7 +476,6 @@ RECIPE_MAINTAINER_pn-lzip = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-lzop = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-m4 = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-m4-native = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER_pn-mailx = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-make = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-makedepend = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-makedevs = "Chen Qi <Qi.Chen@windriver.com>"
@@ -506,7 +504,7 @@ RECIPE_MAINTAINER_pn-meta-extsdk-toolchain = "Richard Purdie <richard.purdie@lin
 RECIPE_MAINTAINER_pn-meta-ide-support = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-meta-toolchain = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-meta-world-pkgdata = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER_pn-mingetty = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-mingetty = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-mini-x-session = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-minicom = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-mkelfimage = "Alexander Kanavin <alexander.kanavin@intel.com>"
@@ -516,7 +514,7 @@ RECIPE_MAINTAINER_pn-mklibs-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-mktemp = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-mmc-utils = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-mobile-broadband-provider-info = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-modutils-initscripts = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-modutils-initscripts = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-mpeg2dec = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-mpfr = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-mpg123 = "Alexander Kanavin <alexander.kanavin@intel.com>"
@@ -643,7 +641,7 @@ RECIPE_MAINTAINER_pn-rpcbind = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-rng-tools = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-rpm = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_MAINTAINER_pn-rpmresolve = "Mark Hatle <mark.hatle@windriver.com>"
-RECIPE_MAINTAINER_pn-rsync = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-rsync = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-rt-tests = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ruby = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-run-postinsts = "Cristian Iorga <cristian.iorga@intel.com>"
@@ -655,7 +653,7 @@ RECIPE_MAINTAINER_pn-screen = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-scrnsaverproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-sed = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-serf = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-setserial = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-setserial = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-settings-daemon = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-shadow = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-shadow-securetty = "Chen Qi <Qi.Chen@windriver.com>"
@@ -663,7 +661,7 @@ RECIPE_MAINTAINER_pn-shadow-sysroot = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-shared-mime-info = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-shutdown-desktop = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-signing-keys = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER_pn-slang = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-slang = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-socat = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-source-highlight = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-speex = "Tanu Kaskinen <tanuk@iki.fi>"
@@ -695,7 +693,7 @@ RECIPE_MAINTAINER_pn-sysvinit-inittab = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-taglib = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-tar = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-tcf-agent = "Randy Witt <randy.e.witt@linux.intel.com>"
-RECIPE_MAINTAINER_pn-tcl = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-tcl = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-tcp-wrappers = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-testexport-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-texi2html = "Robert Yang <liezhi.yang@windriver.com>"
@@ -740,7 +738,7 @@ RECIPE_MAINTAINER_pn-wayland-protocols = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-webkitgtk = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-weston = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-weston-init = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-wget = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER_pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-which = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-wic-tools = "Ed Bartosh <ed.bartosh@linux.intel.com>"
 RECIPE_MAINTAINER_pn-wireless-tools = "Changhyeok Bae <changhyeok.bae@lge.com>"
-- 
2.7.4


