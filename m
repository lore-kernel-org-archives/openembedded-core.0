Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TwvFH-0004g1-W4
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 14:47:42 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 7A573D22CD;
	Sun, 20 Jan 2013 14:32:13 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Jan 2013 14:32:03 +0100
Message-Id: <1358688723-6271-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH] xorg-minimal-fonts: depend on font-alias instead of shipping fonts.alias
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Jan 2013 13:47:43 -0000

| Collected errors:
|  * check_data_file_clashes: Package font-alias wants to install file /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/genericarmv8-oe-linux/core-image-lsb-dev/1.0-r0/rootfs/usr/share/fonts/X11/misc/fonts.alias
|       But that file is already provided by package  * xorg-minimal-fonts
|  * opkg_install_cmd: Cannot install package packagegroup-core-lsb-dev.
| ERROR: Function failed: do_rootfs (see /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/work/genericarmv8-oe-linux/core-image-lsb-dev/1.0-r0/temp/log.do_rootfs.7564 for further information)

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../xorg-font/xorg-minimal-fonts.bb                |  5 +-
 .../xorg-font/xorg-minimal-fonts/misc/fonts.alias  | 80 ----------------------
 2 files changed, 2 insertions(+), 83 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-font/xorg-minimal-fonts/misc/fonts.alias

diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index b1a65e7..782b52b 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -13,12 +13,13 @@ LIC_FILES_CHKSUM = "file://../misc/fonts.alias;md5=bbe8d3c0e4e74af96e3ac393985c4
 SRC_URI = "file://misc"
 
 PE = "1"
-PR = "r1"
+PR = "r2"
 
 inherit allarch
 
 PACKAGES = "${PN}"
 FILES_${PN} = "${libdir}/X11/ ${datadir}/fonts/X11/"
+RDEPENDS_${PN} += "font-alias"
 
 do_install() {
 	install -d ${D}/${datadir}/fonts/X11/misc
@@ -26,5 +27,3 @@ do_install() {
 	install -d ${D}/${libdir}/X11
 	ln -sf ${datadir}/fonts/X11/ ${D}/${libdir}/X11/fonts -s
 }
-
-
diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts/misc/fonts.alias b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts/misc/fonts.alias
deleted file mode 100644
index 3900036..0000000
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts/misc/fonts.alias
+++ /dev/null
@@ -1,80 +0,0 @@
-!! fonts.alias -- automatically generated file.  DO NOT EDIT.
-!! To modify, see update-fonts-alias(8).
-!! /etc/X11/fonts/misc/xfonts-base.alias
-! $Xorg: fonts.alias,v 1.3 2000/08/21 16:42:31 coskrey Exp $
-fixed        -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
-variable     -*-helvetica-bold-r-normal-*-*-120-*-*-*-*-iso8859-1
-5x7          -misc-fixed-medium-r-normal--7-70-75-75-c-50-iso8859-1
-5x8          -misc-fixed-medium-r-normal--8-80-75-75-c-50-iso8859-1
-6x9          -misc-fixed-medium-r-normal--9-90-75-75-c-60-iso8859-1
-6x10         -misc-fixed-medium-r-normal--10-100-75-75-c-60-iso8859-1
-6x12         -misc-fixed-medium-r-semicondensed--12-110-75-75-c-60-iso8859-1
-6x13         -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
-6x13bold     -misc-fixed-bold-r-semicondensed--13-120-75-75-c-60-iso8859-1
-7x13         -misc-fixed-medium-r-normal--13-120-75-75-c-70-iso8859-1
-7x13bold     -misc-fixed-bold-r-normal--13-120-75-75-c-70-iso8859-1
-7x13euro     -misc-fixed-medium-r-normal--13-120-75-75-c-70-iso8859-15
-7x13eurobold -misc-fixed-bold-r-normal--13-120-75-75-c-70-iso8859-15
-7x14         -misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
-7x14bold     -misc-fixed-bold-r-normal--14-130-75-75-c-70-iso8859-1
-8x13         -misc-fixed-medium-r-normal--13-120-75-75-c-80-iso8859-1
-8x13bold     -misc-fixed-bold-r-normal--13-120-75-75-c-80-iso8859-1
-8x16         -sony-fixed-medium-r-normal--16-120-100-100-c-80-iso8859-1
-9x15         -misc-fixed-medium-r-normal--15-140-75-75-c-90-iso8859-1
-9x15bold     -misc-fixed-bold-r-normal--15-140-75-75-c-90-iso8859-1
-10x20        -misc-fixed-medium-r-normal--20-200-75-75-c-100-iso8859-1
-12x24        -sony-fixed-medium-r-normal--24-170-100-100-c-120-iso8859-1
-nil2         -misc-nil-medium-r-normal--2-20-75-75-c-10-misc-fontspecific
-
-heb6x13      -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-8
-heb8x13      -misc-fixed-medium-r-normal--13-120-75-75-c-80-iso8859-8
-
-k14          -misc-fixed-medium-r-normal--14-*-*-*-*-*-jisx0208.1983-0
-a14          -misc-fixed-medium-r-normal--14-*-*-*-*-*-iso8859-1
-r14          -misc-fixed-medium-r-normal--14-*-*-*-*-*-jisx0201.1976-0
-rk14         -misc-fixed-medium-r-normal--14-*-*-*-*-*-jisx0201.1976-0
-r16          -sony-fixed-medium-r-normal--16-*-*-*-*-*-jisx0201.1976-0
-rk16         -sony-fixed-medium-r-normal--16-*-*-*-*-*-jisx0201.1976-0
-r24          -sony-fixed-medium-r-normal--24-*-*-*-*-*-jisx0201.1976-0
-rk24         -sony-fixed-medium-r-normal--24-*-*-*-*-*-jisx0201.1976-0
-kana14       -misc-fixed-medium-r-normal--14-*-*-*-*-*-jisx0201.1976-0
-8x16kana     -sony-fixed-medium-r-normal--16-120-100-100-c-80-jisx0201.1976-0
-8x16romankana -sony-fixed-medium-r-normal--16-120-100-100-c-80-jisx0201.1976-0
-12x24kana     -sony-fixed-medium-r-normal--24-170-100-100-c-120-jisx0201.1976-0
-12x24romankana -sony-fixed-medium-r-normal--24-170-100-100-c-120-jisx0201.1976-0
-kanji16      -jis-fixed-medium-r-normal--16-*-*-*-*-*-jisx0208.1983-0
-kanji24      -jis-fixed-medium-r-normal--24-*-*-*-*-*-jisx0208.1983-0
-
-hanzigb16st "-isas-song ti-medium-r-normal--16-160-72-72-c-160-gb2312.1980-0"
-hanzigb24st "-isas-song ti-medium-r-normal--24-240-72-72-c-240-gb2312.1980-0"
-hanzigb16fs "-isas-fangsong ti-medium-r-normal--16-160-72-72-c-160-gb2312.1980-0"
-
-olcursor   "-sun-open look cursor-----12-120-75-75-p-160-sunolcursor-1"
-olglyph-10 "-sun-open look glyph-----10-100-75-75-p-101-sunolglyph-1"
-olglyph-12 "-sun-open look glyph-----12-120-75-75-p-113-sunolglyph-1"
-olglyph-14 "-sun-open look glyph-----14-140-75-75-p-128-sunolglyph-1"
-olglyph-19 "-sun-open look glyph-----19-190-75-75-p-154-sunolglyph-1"
-
--misc-fixed-medium-r-normal--7-50-100-100-c-50-iso8859-1 -misc-fixed-medium-r-normal--7-70-75-75-c-50-iso8859-1
--misc-fixed-medium-r-normal--8-60-100-100-c-50-iso8859-1 -misc-fixed-medium-r-normal--8-80-75-75-c-50-iso8859-1
--misc-fixed-medium-r-normal--9-80-100-100-c-60-iso8859-1 -misc-fixed-medium-r-normal--9-90-75-75-c-60-iso8859-1
--misc-fixed-medium-r-normal--10-70-100-100-c-60-iso8859-1 -misc-fixed-medium-r-normal--10-100-75-75-c-60-iso8859-1
--misc-fixed-medium-r-semicondensed--12-90-100-100-c-60-iso8859-1 -misc-fixed-medium-r-semicondensed--12-110-75-75-c-60-iso8859-1
--misc-fixed-medium-r-semicondensed--13-100-100-100-c-60-iso8859-1 -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-1
--misc-fixed-bold-r-semicondensed--13-100-100-100-c-60-iso8859-1 -misc-fixed-bold-r-semicondensed--13-120-75-75-c-60-iso8859-1
--misc-fixed-medium-r-normal--13-100-100-100-c-70-iso8859-1 -misc-fixed-medium-r-normal--13-120-75-75-c-70-iso8859-1
--misc-fixed-bold-r-normal--13-100-100-100-c-70-iso8859-1 -misc-fixed-bold-r-normal--13-120-75-75-c-70-iso8859-1
--misc-fixed-medium-r-normal--13-100-100-100-c-80-iso8859-1 -misc-fixed-medium-r-normal--13-120-75-75-c-80-iso8859-1
--misc-fixed-bold-r-normal--13-100-100-100-c-80-iso8859-1 -misc-fixed-bold-r-normal--13-120-75-75-c-80-iso8859-1
--misc-fixed-medium-r-normal--14-110-100-100-c-70-iso8859-1 -misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
--misc-fixed-medium-r-normal--15-120-100-100-c-90-iso8859-1 -misc-fixed-medium-r-normal--15-140-75-75-c-90-iso8859-1
--misc-fixed-bold-r-normal--15-120-100-100-c-90-iso8859-1 -misc-fixed-bold-r-normal--15-140-75-75-c-90-iso8859-1
--misc-fixed-medium-r-normal--20-140-100-100-c-100-iso8859-1 -misc-fixed-medium-r-normal--20-200-75-75-c-100-iso8859-1
--misc-fixed-medium-r-semicondensed--13-100-100-100-c-60-iso8859-8 -misc-fixed-medium-r-semicondensed--13-120-75-75-c-60-iso8859-8
--misc-fixed-medium-r-normal--13-100-100-100-c-80-iso8859-8 -misc-fixed-medium-r-normal--13-120-75-75-c-80-iso8859-8
--sony-fixed-medium-r-normal--16-150-75-75-c-80-iso8859-1 -sony-fixed-medium-r-normal--16-120-100-100-c-80-iso8859-1
--sony-fixed-medium-r-normal--16-150-75-75-c-80-jisx0201.1976-0 -sony-fixed-medium-r-normal--16-120-100-100-c-80-jisx0201.1976-0
--sony-fixed-medium-r-normal--24-230-75-75-c-120-iso8859-1 -sony-fixed-medium-r-normal--24-170-100-100-c-120-iso8859-1
--sony-fixed-medium-r-normal--24-230-75-75-c-120-jisx0201.1976-0 -sony-fixed-medium-r-normal--24-170-100-100-c-120-jisx0201.1976-0
--jis-fixed-medium-r-normal--16-110-100-100-c-160-jisx0208.1983-0 -jis-fixed-medium-r-normal--16-150-75-75-c-160-jisx0208.1983-0
--jis-fixed-medium-r-normal--24-170-100-100-c-240-jisx0208.1983-0 -jis-fixed-medium-r-normal--24-230-75-75-c-240-jisx0208.1983-0
-- 
1.8.0



