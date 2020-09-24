Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.7061.1600913756538099516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2020 19:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,296,1596470400"; 
   d="scan'208";a="99560810"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Sep 2020 10:15:50 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 9575A48990EB
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2020 10:15:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 24 Sep 2020 10:15:46 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] Add Zang Ruochen and Wang Mingyu to maintainers.inc.
Date: Thu, 24 Sep 2020 22:15:50 +0800
Message-ID: <1600956950-15056-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 9575A48990EB.ABC54
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Zang Ruochen is responsible for the maintenance as follows:
elfutils
libvorbis
ell
python3-dbus
python3-pbr
python3-pip
python3-pycairo
python3-pygobject
python3-six

Wang Mingyu is responsible for the maintenance as follows:
btrfs-tools
dtc
iso-codes
libpciaccess
libpipeline
librepo
liburcu
libyaml
msmtp

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/conf/distro/include/maintainers.inc | 36 ++++++++++++------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d349382cb9..c381ba70a3 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -78,7 +78,7 @@ RECIPE_MAINTAINER_pn-bmap-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-boost = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-bootchart2 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-bsd-headers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-btrfs-tools = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-btrfs-tools = "Wang Mingyu <wangmy@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-build-appliance-image = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-build-sysroots = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.org>"
@@ -157,14 +157,14 @@ RECIPE_MAINTAINER_pn-dos2unix = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-dosfstools = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-dpkg = "Aníbal Limón <limon.anibal@gmail.com>"
 RECIPE_MAINTAINER_pn-dropbear = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER_pn-dtc = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-dtc = "Wang Mingyu <wangmy@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-dwarfsrcfiles = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-e2fsprogs = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-ed = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-efivar = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-efibootmgr = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER_pn-elfutils = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER_pn-ell = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-elfutils = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-ell = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-enchant2 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-encodings = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-epiphany = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -279,7 +279,7 @@ RECIPE_MAINTAINER_pn-intltool = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-iproute2 = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-iptables = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-iputils = "Changhyeok Bae <changhyeok.bae@gmail.com>"
-RECIPE_MAINTAINER_pn-iso-codes = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-iso-codes = "Wang Mingyu <wangmy@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-itstool = "Andreas Müller <schnitzeltony@gmail.com>"
 RECIPE_MAINTAINER_pn-iw = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-libjpeg-turbo = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -362,15 +362,15 @@ RECIPE_MAINTAINER_pn-libogg = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libomxil = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libpam = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libpcap = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-libpciaccess = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-libpciaccess = "Wang Mingyu <wangmy@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-libpcre = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libpcre2 = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-libpipeline = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-libpipeline = "Wang Mingyu <wangmy@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-libpng = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libproxy = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libpthread-stubs = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libpsl = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-librepo = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-librepo = "Wang Mingyu <wangmy@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-librsvg = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libsamplerate0 = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-libsdl2 = "Yi Zhao <yi.zhao@windriver.com>"
@@ -391,7 +391,7 @@ RECIPE_MAINTAINER_pn-libtool-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-libucontext = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libunistring = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libunwind = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER_pn-liburcu = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-liburcu = "Wang Mingyu <wangmy@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-liburi-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libusb1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libubootenv = "Stefano Babic <sbabic@denx.de>"
@@ -399,7 +399,7 @@ RECIPE_MAINTAINER_pn-libuv = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libva-initial = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-libvorbis = "Tanu Kaskinen <tanuk@iki.fi>"
+RECIPE_MAINTAINER_pn-libvorbis = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-libwebp = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libwpe = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libx11 = "Armin Kuster <akuster808@gmail.com>"
@@ -440,7 +440,7 @@ RECIPE_MAINTAINER_pn-libxtst = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxv = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxvmc = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxxf86vm = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-libyaml = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-libyaml = "Wang Mingyu <wangmy@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-lighttpd = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-linux-dummy = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-linux-firmware = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
@@ -505,7 +505,7 @@ RECIPE_MAINTAINER_pn-modutils-initscripts = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-mpeg2dec = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-mpfr = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-mpg123 = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-msmtp = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-msmtp = "Wang Mingyu <wangmy@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-mtd-utils = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-mtdev = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-mtools = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -580,7 +580,7 @@ RECIPE_MAINTAINER_pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-cython = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python3-dbus = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-dbus = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-dbusmock = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-docutils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pycryptodome = "Joshua Watt <JPEWhacker@gmail.com>"
@@ -596,17 +596,17 @@ RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-k
 RECIPE_MAINTAINER_pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python3-pbr = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python3-pip = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python3-pycairo = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pbr = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-python3-pip = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-python3-pycairo = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python3-pygobject = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pygobject = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-scons = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-scons-native = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python3-six = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-six = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-smmap = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-- 
2.25.1



