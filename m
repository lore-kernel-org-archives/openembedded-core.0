Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C3F1C60745
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 02:53:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5S2qbDC014495
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2018 19:52:58 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 27 Jun 2018 19:52:29 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jun 2018 10:52:27 +0800
Message-ID: <1530154347-32522-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH] maintainers.inc: recipes cleanup
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
X-List-Received-Date: Thu, 28 Jun 2018 02:53:07 -0000
Content-Type: text/plain

Cleanup the recipes which had been removed from oe-core.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 97e2d19..b69d026 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -30,7 +30,6 @@
 RECIPE_MAINTAINER_pn-acl = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-acpica = "Fathi Boudra <fathi.boudra@linaro.org>"
 RECIPE_MAINTAINER_pn-acpid = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-acpitests = "Fathi Boudra <fathi.boudra@linaro.org>"
 RECIPE_MAINTAINER_pn-adwaita-icon-theme = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-alsa-lib = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-alsa-plugins = "Tanu Kaskinen <tanuk@iki.fi>"
@@ -54,7 +53,6 @@ RECIPE_MAINTAINER_pn-atk = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-attr = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-autoconf = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-autoconf-archive = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER_pn-autogen-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-automake = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-avahi-ui = "Yi Zhao <yi.zhao@windriver.com>"
@@ -64,7 +62,6 @@ RECIPE_MAINTAINER_pn-base-passwd = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-bash = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-bash-completion = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-bc = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-bdwgc = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-bind = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-binutils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-binutils-cross = "Khem Raj <raj.khem@gmail.com>"
@@ -131,8 +128,6 @@ RECIPE_MAINTAINER_pn-desktop-file-utils-native = "Alexander Kanavin <alex.kanavi
 RECIPE_MAINTAINER_pn-dhcp = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-diffstat = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-diffutils = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-directfb = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER_pn-directfb-examples = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-distcc = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-distcc-config = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-dmidecode = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -147,10 +142,8 @@ RECIPE_MAINTAINER_pn-dwarfsrcfiles = "Alexander Kanavin <alex.kanavin@gmail.com>
 RECIPE_MAINTAINER_pn-e2fsprogs = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-ed = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-eee-acpi-scripts = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-efilinux = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-eglinfo-fb = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-eglinfo-x11 = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-efilinux = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-elfutils = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-enchant = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-encodings = "Armin Kuster <akuster808@gmail.com>"
@@ -204,9 +197,7 @@ RECIPE_MAINTAINER_pn-glibc-mtrace = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glibc-scripts = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glide = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-gmp = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-gnome-common = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gnome-desktop-testing = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-gnome-doc-utils = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gnome-themes-standard = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gnu-config = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-gnu-efi = "Yi Zhao <yi.zhao@windriver.com>"
@@ -243,11 +234,7 @@ RECIPE_MAINTAINER_pn-gstreamer1.0-vaapi = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-gtk+ = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gtk+3 = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gtk-doc = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-gtk-engines = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gtk-icon-utils-native = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-gtk-sato-engine = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-guilt-native = "Bruce Ashfield <bruce.ashfield@windriver.com>"
-RECIPE_MAINTAINER_pn-gummiboot = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-gzip = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-harfbuzz = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-hdparm = "Denys Dmytriyenko <denys@ti.com>"
@@ -280,7 +267,6 @@ RECIPE_MAINTAINER_pn-libjpeg-turbo = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-json-c = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-json-glib = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-kbd = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-kconfig-frontends = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-kern-tools-native = "Bruce Ashfield <bruce.ashfield@windriver.com>"
 RECIPE_MAINTAINER_pn-kernel-devsrc = "Bruce Ashfield <bruce.ashfield@windriver.com>"
 RECIPE_MAINTAINER_pn-kexec-tools = "Armin Kuster <akuster808@gmail.com>"
@@ -332,11 +318,9 @@ RECIPE_MAINTAINER_pn-libgpg-error = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libgudev = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libical = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libice = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-libiconv = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libid3tag = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-libidn = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libinput = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-libjson = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libksba = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libmatchbox = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libmnl = "Khem Raj <raj.khem@gmail.com>"
@@ -351,16 +335,13 @@ RECIPE_MAINTAINER_pn-libnss-mdns = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libnss-nis = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libogg = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libomxil = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-libowl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libpam = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libpcap = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libpciaccess = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libpcre = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libpcre2 = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-libpfm4 = "Matthew McClintock <msm@freescale.com>"
 RECIPE_MAINTAINER_pn-libpipeline = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libpng = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-libpng12 = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libproxy = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libpthread-stubs = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-librepo = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -394,7 +375,6 @@ RECIPE_MAINTAINER_pn-libwebp = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libx11 = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libx11-diet = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxau = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-libxcalibrate = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxcb = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxcomposite = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxcursor = "Armin Kuster <akuster808@gmail.com>"
@@ -422,7 +402,6 @@ RECIPE_MAINTAINER_pn-libxrandr = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxrender = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxres = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxscrnsaver = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-libxsettings-client = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libxshmfence = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxslt = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libxt = "Armin Kuster <akuster808@gmail.com>"
@@ -466,7 +445,6 @@ RECIPE_MAINTAINER_pn-man-db = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-man-pages = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-matchbox-config-gtk = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-matchbox-desktop = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-matchbox-desktop-sato = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-matchbox-keyboard = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-matchbox-panel-2 = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-matchbox-session = "Maxin B. John <maxin.john@intel.com>"
@@ -490,7 +468,6 @@ RECIPE_MAINTAINER_pn-meta-world-pkgdata = "Richard Purdie <richard.purdie@linuxf
 RECIPE_MAINTAINER_pn-mingetty = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-mini-x-session = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-minicom = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-mkelfimage = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-mkfontdir = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-mkfontscale = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-mklibs-native = "Robert Yang <liezhi.yang@windriver.com>"
@@ -515,7 +492,6 @@ RECIPE_MAINTAINER_pn-nativesdk-qemu-helper = "Richard Purdie <richard.purdie@lin
 RECIPE_MAINTAINER_pn-newlib = "Alejandro Hernandez <aehs29@gmail.com>"
 RECIPE_MAINTAINER_pn-ncurses = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-neard = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-neon = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-net-tools = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-netbase = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-nettle = "Armin Kuster <akuster808@gmail.com>"
@@ -527,14 +503,12 @@ RECIPE_MAINTAINER_pn-nspr = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-nss = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-nss-myhostname = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-ofono = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-oh-puzzles = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-openssh = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-openssl = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-opkg = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
 RECIPE_MAINTAINER_pn-opkg-arch-config = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
 RECIPE_MAINTAINER_pn-opkg-keyrings = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
 RECIPE_MAINTAINER_pn-opkg-utils = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
-RECIPE_MAINTAINER_pn-oprofile = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-orc = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-os-release = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-ossp-uuid = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -608,14 +582,12 @@ RECIPE_MAINTAINER_pn-quilt-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-quota = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-re2c = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-readline = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER_pn-remake = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-resolvconf = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-rgb = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-rpcbind = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-rng-tools = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-rpcsvc-proto = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-rpm = "Mark Hatle <mark.hatle@windriver.com>"
-RECIPE_MAINTAINER_pn-rpmresolve = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_MAINTAINER_pn-rsync = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-rt-tests = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ruby = "Maxin B. John <maxin.john@intel.com>"
@@ -646,7 +618,6 @@ RECIPE_MAINTAINER_pn-strace = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-stress = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-subversion = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-sudo = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-swabber-native = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-swig = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-sysfsutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-sysklogd = "Chen Qi <Qi.Chen@windriver.com>"
@@ -675,14 +646,12 @@ RECIPE_MAINTAINER_pn-texinfo = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-texinfo-dummy-native = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-tiff = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-time = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER_pn-tiny-init = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ttf-bitstream-vera = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-tzcode-native = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-tzdata = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-u-boot = "Marek Vasut <marek.vasut@gmail.com>"
 RECIPE_MAINTAINER_pn-u-boot-fw-utils = "Marek Vasut <marek.vasut@gmail.com>"
 RECIPE_MAINTAINER_pn-u-boot-mkimage = "Marek Vasut <marek.vasut@gmail.com>"
-RECIPE_MAINTAINER_pn-ubootchart = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-udev-extraconf = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-unfs3 = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-unifdef = "Ross Burton <ross.burton@intel.com>"
@@ -712,7 +681,6 @@ RECIPE_MAINTAINER_pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-which = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-wic-tools = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-wpa-supplicant = "Changhyeok Bae <changhyeok.bae@lge.com>"
-RECIPE_MAINTAINER_pn-x11-common = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-x11perf = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-x264 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-xauth = "Armin Kuster <akuster808@gmail.com>"
-- 
2.7.4


