Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web08.3414.1618537325509493021
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 18:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=ea8RoeC6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618537323; i=@fujitsu.com;
	bh=vmAWYqDqTvxeWPD0Yp3Vx81r9sJAkAa22Ylvz3+b3D0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=ea8RoeC6Vk0K+spTIsoMPxIe44jTHid/bx+9pnoCPw+KpwUdVsnvwhWvl81aOgKQh
	 7xqITSuB0m8MLaVgSKGmvoczx/aWy1D8Gt5PmHQKOiHfu0WalIIvJNYALum1JhxiJ/
	 O0RYu8o/DvxT+Br9TSMYUwZWXVnZWW5bHm1osxas/hs5jjoWUUqtL3GN3dBYuROdRm
	 u7nE/e9C6LXZ/qC183cfnYJ4IHcTML3RX9ISkLWtLUcbtWDuYRjP7JswiUu5O08uRE
	 Q9z/xgp5d7Dvg3b+jjXEmI0Kcw+C1vx5G3ezuuutFZyQMTTz2jHjUjGge9Tz9V7W8f
	 lKzKSg3w3woYw==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 97/0E-24644-A6BE8706; Fri, 16 Apr 2021 01:42:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxVTfrdUW
  CwbSVbBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b9261MBW3BFRPO32NuYHzi08XIxSEkMItJ
  Yu/iZWwQznFGiX2HrgE5nBxsAjoSHS+6WboYOThEBPQkrv4TBQkLCzhIrOuewwJiswioSsxr/
  ckOYvMKuElM7TrPDGJLCChITHn4nhkiLihxcuYTsHpmoPruI0+ZIGx5ieats6HqFSW27zzDAm
  FXSmyfdpZxAiPvLCTts5C0z0LSvoCReRWjRVJRZnpGSW5iZo6uoYGBrqGhka6hJRAbmeklVuk
  m6qWW6panFpfoGuollhfrFVfmJuek6OWllmxiBIZdSsGBuh2MD15/0DvEKMnBpCTKe2hFWYIQ
  X1J+SmVGYnFGfFFpTmrxIUYZDg4lCV7nFxUJQoJFqempFWmZOcAYgElLcPAoifB+eAmU5i0uS
  MwtzkyHSJ1iVJQS510AkhAASWSU5sG1weLuEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3k
  aQKTyZeSVw018BLWYCWlyxqhRkcUkiQkqqgUnP6vmPLY+F7EP9E08IHbPlkYh2f1J2ccfcg2t
  j2pmWzbEvmLKWMf59ZvuzwJC3MzaINsg8OfFxwrTiY0W/tbyZrnxOXOnwVuZFsPODAwazLDLl
  5B8ozTTOZyhuLzW4uKpKWq7j03Op/6UaopWhr2pPBOeYtf16dTU9PGP2/5dXhXwCn7wwFTy/S
  CzdudMmzklganFOe6NdF3tV0avrTw2LCqbOLGrdZuW0Ouy+nC57cKHpMlPr35KuRiI7Q7OSRS
  ZyaQsGnmpwdYz0jeB+FfapdMPMG0d0E1POP17EdOxvx7r7TZo6cRq6ut87GDyfnTn0W/ga/zT
  mn9VmOTvmlWd8Zsm+sdeffY3G5TtZSizFGYmGWsxFxYkA+3C0qjYDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-19.tower-267.messagelabs.com!1618537321!1545874!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28016 invoked from network); 16 Apr 2021 01:42:02 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-19.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Apr 2021 01:42:02 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13G1fuFc014248
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Apr 2021 02:42:01 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Apr 2021 02:41:54 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] maintainers.inc: Modify email address
Date: Fri, 16 Apr 2021 09:41:48 +0800
Message-ID: <1618537308-7241-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

zangrc.fnst@cn.fujitsu.com -> zangrc.fnst@fujitsu.com
wangmy@cn.fujitsu.com -> wangmy@fujitsu.com

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta/conf/distro/include/maintainers.inc | 36 ++++++++++++------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6276331857..1eed6aad48 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -78,7 +78,7 @@ RECIPE_MAINTAINER_pn-boost =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-boost-build-native =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-bootchart2 =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-bsd-headers =3D "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-btrfs-tools =3D "Wang Mingyu <wangmy@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-btrfs-tools =3D "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER_pn-build-appliance-image =3D "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-build-sysroots =3D "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-builder =3D "Richard Purdie <richard.purdie@linuxfoundation.org>"
@@ -157,14 +157,14 @@ RECIPE_MAINTAINER_pn-dos2unix =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-dosfstools =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-dpkg =3D "An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com>"
 RECIPE_MAINTAINER_pn-dropbear =3D "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER_pn-dtc =3D "Wang Mingyu <wangmy@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-dtc =3D "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER_pn-dwarfsrcfiles =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-e2fsprogs =3D "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-ed =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-efivar =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-efibootmgr =3D "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER_pn-elfutils =3D "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
-RECIPE_MAINTAINER_pn-ell =3D "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-elfutils =3D "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER_pn-ell =3D "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER_pn-enchant2 =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-encodings =3D "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-epiphany =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -279,7 +279,7 @@ RECIPE_MAINTAINER_pn-intltool =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-iproute2 =3D "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-iptables =3D "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-iputils =3D "Changhyeok Bae <changhyeok.bae@gmail.com>"
-RECIPE_MAINTAINER_pn-iso-codes =3D "Wang Mingyu <wangmy@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-iso-codes =3D "Wang Mingyu <wangmy@cn.ujitsu.com>"
 RECIPE_MAINTAINER_pn-itstool =3D "Andreas M=C3=BCller <schnitzeltony@gmail.com>"
 RECIPE_MAINTAINER_pn-iw =3D "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-libjpeg-turbo =3D "Anuj Mittal <anuj.mittal@intel.com>"
@@ -364,16 +364,16 @@ RECIPE_MAINTAINER_pn-libogg =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libomxil =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libpam =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libpcap =3D "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-libpciaccess =3D "Wang Mingyu <wangmy@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-libpciaccess =3D "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER_pn-libpcre =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libpcre2 =3D "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-libpipeline =3D "Wang Mingyu <wangmy@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-libpipeline =3D "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER_pn-libpng =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libportal =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libproxy =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libpthread-stubs =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libpsl =3D "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-librepo =3D "Wang Mingyu <wangmy@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-librepo =3D "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER_pn-librsvg =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libsamplerate0 =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-libsdl2 =3D "Yi Zhao <yi.zhao@windriver.com>"
@@ -395,7 +395,7 @@ RECIPE_MAINTAINER_pn-libtool-native =3D "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-libucontext =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libunistring =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libunwind =3D "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER_pn-liburcu =3D "Wang Mingyu <wangmy@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-liburcu =3D "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER_pn-liburi-perl =3D "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libusb1 =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libubootenv =3D "Stefano Babic <sbabic@denx.de>"
@@ -403,7 +403,7 @@ RECIPE_MAINTAINER_pn-libuv =3D "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libva =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libva-initial =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libva-utils =3D "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-libvorbis =3D "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-libvorbis =3D "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER_pn-libwebp =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libwpe =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libx11 =3D "Armin Kuster <akuster808@gmail.com>"
@@ -444,7 +444,7 @@ RECIPE_MAINTAINER_pn-libxtst =3D "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxv =3D "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxvmc =3D "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libxxf86vm =3D "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-libyaml =3D "Wang Mingyu <wangmy@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-libyaml =3D "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER_pn-lighttpd =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-linux-dummy =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-linux-firmware =3D "Otavio Salvador <otavio.salvador@ossystems.com.br>"
@@ -509,7 +509,7 @@ RECIPE_MAINTAINER_pn-modutils-initscripts =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-mpeg2dec =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-mpfr =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-mpg123 =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-msmtp =3D "Wang Mingyu <wangmy@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-msmtp =3D "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER_pn-mtd-utils =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-mtdev =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-mtools =3D "Anuj Mittal <anuj.mittal@intel.com>"
@@ -587,7 +587,7 @@ RECIPE_MAINTAINER_pn-python3-async =3D "Oleksandr Kravchuk <open.source@oleksandr-
 RECIPE_MAINTAINER_pn-python3-atomicwrites =3D "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-attrs =3D "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-cython =3D "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python3-dbus =3D "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-python3-dbus =3D "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-dbusmock =3D "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-docutils =3D "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pycryptodome =3D "Joshua Watt <JPEWhacker@gmail.com>"
@@ -609,21 +609,21 @@ RECIPE_MAINTAINER_pn-python3-nose =3D "Oleksandr Kravchuk <open.source@oleksandr-k
 RECIPE_MAINTAINER_pn-python3-numpy =3D "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-packaging =3D "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-pathlib2 =3D "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3-pbr =3D "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
-RECIPE_MAINTAINER_pn-python3-pip =3D "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-python3-pbr =3D "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER_pn-python3-pip =3D "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-pluggy =3D "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-py =3D "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3-pycairo =3D "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-python3-pycairo =3D "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-pyelftools =3D "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-pygments =3D "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python3-pygobject =3D "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-python3-pygobject =3D "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-pyparsing =3D "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pytest =3D "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-scons =3D "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-scons-native =3D "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-setuptools =3D "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-setuptools-scm =3D "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-python3-six =3D "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-python3-six =3D "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-smmap =3D "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-sortedcontainers =3D "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-subunit =3D "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-- 
2.25.1

