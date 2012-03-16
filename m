Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8Xau-00052F-7N for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 14:53:24 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GDiaiP003449
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 13:44:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02357-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 13:44:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GDiRGY003430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 13:44:28 GMT
Message-ID: <1331905468.18586.182.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2012 13:44:28 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] directfb: Fix RPATH warnings
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
X-List-Received-Date: Fri, 16 Mar 2012 13:53:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fix configure not to remove variables which trigger the unneccessary rpaths=
 to get
encoded. Also take the opportunity to clean up the patches directory.

WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/bin/dfblayer contains probably-redundant RPATH /usr/=
lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/bin/dfbmaster contains probably-redundant RPATH /usr=
/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/bin/mkdgifft contains probably-redundant RPATH /usr/=
lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/bin/dfbdump contains probably-redundant RPATH /usr/l=
ib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/bin/dfbinput contains probably-redundant RPATH /usr/=
lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/bin/dfbfx contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/bin/dfbscreen contains probably-redundant RPATH /usr=
/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/bin/mkdgiff contains probably-redundant RPATH /usr/l=
ib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/bin/dfbinspector contains probably-redundant RPATH /=
usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/bin/mkdfiff contains probably-redundant RPATH /usr/l=
ib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/bin/dfbinfo contains probably-redundant RPATH /usr/l=
ib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/bin/dfbpenmount contains probably-redundant RPATH /u=
sr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/bin/dfbg contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/libfusion-1.4.so.6 contains probably-redundant R=
PATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/libdirectfb-1.4.so.6.0.9 contains probably-redun=
dant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/libdirectfb-1.4.so.6 contains probably-redundant=
 RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/libfusion-1.4.so.6.0.9 contains probably-redunda=
nt RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/systems/libdirectfb_fbdev.so cont=
ains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/systems/libdirectfb_devmem.so con=
tains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/systems/libdirectfb_dummy.so cont=
ains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBVideoProvider=
/libidirectfbvideoprovider_v4l.so contains probably-redundant RPATH /usr/li=
b
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBVideoProvider=
/libidirectfbvideoprovider_gif.so contains probably-redundant RPATH /usr/li=
b
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/interfaces/ICoreResourceManager/l=
ibicoreresourcemanager_test.so contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBImageProvider=
/libidirectfbimageprovider_jpeg.so contains probably-redundant RPATH /usr/l=
ib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBImageProvider=
/libidirectfbimageprovider_png.so contains probably-redundant RPATH /usr/li=
b
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBImageProvider=
/libidirectfbimageprovider_dfiff.so contains probably-redundant RPATH /usr/=
lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBImageProvider=
/libidirectfbimageprovider_gif.so contains probably-redundant RPATH /usr/li=
b
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBFont/libidire=
ctfbfont_ft2.so contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBFont/libidire=
ctfbfont_dgiff.so contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/wm/libdirectfbwm_default.so conta=
ins probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_zytronic=
.so contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_penmount=
.so contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_linux_in=
put.so contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_serialmo=
use.so contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_mutouch.=
so contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_tslib.so=
 contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_joystick=
.so contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_sonypi.s=
o contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_lirc.so =
contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_wm97xx_t=
s.so contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_ps2mouse=
.so contains probably-redundant RPATH /usr/lib
WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packa=
ges-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_keyboard=
.so contains probably-redundant RPATH /usr/lib

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-gra=
phics/directfb/directfb.inc
index 9061ac1..515d19f 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -11,11 +11,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddcf3c825659e8=
2539645da41a7908589"
 HOMEPAGE =3D "http://directfb.org"
 DEPENDS =3D "jpeg libpng freetype zlib tslib"
=20
-SRC_URI =3D " \
-    http://directfb.org/downloads/Core/DirectFB-1.4/DirectFB-${PV}.tar.gz =
\
-    file://directfb-1.2.x-fix-pkgconfig-cflags.patch \
-    file://dont-use-linux-config.patch \
-    "
+SRC_URI =3D "http://directfb.org/downloads/Core/DirectFB-1.4/DirectFB-${PV=
}.tar.gz \
+           file://directfb-1.2.x-fix-pkgconfig-cflags.patch \
+           file://configurefix.patch"
=20
 S =3D "${WORKDIR}/DirectFB-${PV}"
=20
diff --git a/meta/recipes-graphics/directfb/directfb/configurefix.patch b/m=
eta/recipes-graphics/directfb/directfb/configurefix.patch
new file mode 100644
index 0000000..dd8c019
--- a/dev/null
+++ b/meta/recipes-graphics/directfb/directfb/configurefix.patch
@@ -0,0 +1,60 @@
+Libtool needs these set correctly else we end up with pointless rpaths
+such as the QA warnings:
+
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/bin/dfblayer contains probably-redundant RPATH /usr=
/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/p=
ackages-split/directfb/usr/bin/dfbmaster contains probably-redundant RPATH =
/usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-=
r1/packages-split/directfb/usr/bin/mkdgifft contains probably-redundant RPA=
TH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.=
15-r1/packages-split/directfb/usr/bin/dfbdump contains probably-redundant R=
PATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.=
4.15-r1/packages-split/directfb/usr/bin/dfbinput contains probably-redundan=
t RPATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb=
-1.4.15-r1/packages-split/directfb/usr/bin/dfbfx contains probably-redundan=
t RPATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb=
-1.4.15-r1/packages-split/directfb/usr/bin/dfbscreen contains probably-redu=
ndant RPATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/dire=
ctfb-1.4.15-r1/packages-split/directfb/usr/bin/mkdgiff contains probably-re=
dundant RPATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/di=
rectfb-1.4.15-r1/packages-split/directfb/usr/bin/dfbinspector contains prob=
ably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/bin/mkdfiff contains probably-redundant RPATH /usr/=
lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/bin/dfbinfo contains probably-redundant RPATH /usr/=
lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/bin/dfbpenmount contains probably-redundant RPATH /=
usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/bin/dfbg contains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/libfusion-1.4.so.6 contains probably-redundant =
RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/libdirectfb-1.4.so.6.0.9 contains probably-redu=
ndant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/libdirectfb-1.4.so.6 contains probably-redundan=
t RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/libfusion-1.4.so.6.0.9 contains probably-redund=
ant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/systems/libdirectfb_fbdev.so con=
tains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/systems/libdirectfb_devmem.so co=
ntains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/systems/libdirectfb_dummy.so con=
tains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBVideoProvide=
r/libidirectfbvideoprovider_v4l.so contains probably-redundant RPATH /usr/l=
ib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBVideoProvide=
r/libidirectfbvideoprovider_gif.so contains probably-redundant RPATH /usr/l=
ib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/interfaces/ICoreResourceManager/=
libicoreresourcemanager_test.so contains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBImageProvide=
r/libidirectfbimageprovider_jpeg.so contains probably-redundant RPATH /usr/=
lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBImageProvide=
r/libidirectfbimageprovider_png.so contains probably-redundant RPATH /usr/l=
ib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBImageProvide=
r/libidirectfbimageprovider_dfiff.so contains probably-redundant RPATH /usr=
/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBImageProvide=
r/libidirectfbimageprovider_gif.so contains probably-redundant RPATH /usr/l=
ib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBFont/libidir=
ectfbfont_ft2.so contains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/interfaces/IDirectFBFont/libidir=
ectfbfont_dgiff.so contains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/wm/libdirectfbwm_default.so cont=
ains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_zytroni=
c.so contains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_penmoun=
t.so contains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_linux_i=
nput.so contains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_serialm=
ouse.so contains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_mutouch=
.so contains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_tslib.s=
o contains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_joystic=
k.so contains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_sonypi.=
so contains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_lirc.so=
 contains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_wm97xx_=
ts.so contains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_ps2mous=
e.so contains probably-redundant RPATH /usr/lib
+WARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/pack=
ages-split/directfb/usr/lib/directfb-1.4-6/inputdrivers/libdirectfb_keyboar=
d.so contains probably-redundant RPATH /usr/lib
+
+Upstream-Status: Pending
+
+RP 2012/03/16
+
+Index: DirectFB-1.4.15/configure.in
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- DirectFB-1.4.15.orig/configure.in	2012-03-16 13:32:23.692402879 +0000
++++ DirectFB-1.4.15/configure.in	2012-03-16 13:33:22.312400960 +0000
+@@ -97,13 +97,6 @@
+ AC_CHECK_SIZEOF(long long)
+ AC_CHECK_FUNCS(fork)
+=20
+-
+-## Work around libstuhl during cross build...
+-if test "$host" !=3D "$build"; then
+-  sys_lib_dlsearch_path_spec=3D""
+-  sys_lib_search_path_spec=3D""
+-fi
+-
+ AC_PATH_PROGS(PERL, perl5 perl)
+=20
+ AC_PATH_PROG(MAN2HTML, man2html, no)
diff --git a/meta/recipes-graphics/directfb/files/directfb-1.2.x-fix-pkgcon=
fig-cflags.patch b/meta/recipes-graphics/directfb/directfb/directfb-1.2.x-f=
ix-pkgconfig-cflags.patch
index ee60718..ee60718 100644
--- a/meta/recipes-graphics/directfb/files/directfb-1.2.x-fix-pkgconfig-cfl=
ags.patch
+++ b/meta/recipes-graphics/directfb/directfb/directfb-1.2.x-fix-pkgconfig-=
cflags.patch
diff --git a/meta/recipes-graphics/directfb/directfb_1.4.15.bb b/meta/recip=
es-graphics/directfb/directfb_1.4.15.bb
index c322dec..98d6b82 100644
--- a/meta/recipes-graphics/directfb/directfb_1.4.15.bb
+++ b/meta/recipes-graphics/directfb/directfb_1.4.15.bb
@@ -1,15 +1,10 @@
 require directfb.inc
=20
 RV =3D "1.4-6"
-PR =3D "r1"
+PR =3D "r2"
=20
 DEPENDS +=3D "sysfsutils"
=20
-SRC_URI =3D " \
-    http://directfb.org/downloads/Core/DirectFB-1.4/DirectFB-${PV}.tar.gz =
\
-    file://directfb-1.2.x-fix-pkgconfig-cflags.patch \
-    "
-
 EXTRA_OECONF =3D "\
   --enable-freetype=3Dyes \
   --enable-zlib \
diff --git a/meta/recipes-graphics/directfb/files/dont-use-linux-config.pat=
ch b/meta/recipes-graphics/directfb/files/dont-use-linux-config.patch
deleted file mode 100644
index ba8ead8..0000000
--- a/meta/recipes-graphics/directfb/files/dont-use-linux-config.patch
+++ b/dev/null
@@ -1,23 +0,0 @@
-
-directfb: don't use linux/config.h in powerpc assembly
-
-Author: jeremy_laine at openembedded.org
-Branch: org.openembedded.dev
-Revision: 73964f8e6912f066c224fed54daeeb44836d9cdf
-ViewMTN: http://monotone.openembedded.org/revision/info/73964f8e6912f066c2=
24fed54daeeb44836d9cdf
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-diff -urN DirectFB-1.1.0.orig/lib/direct/ppcasm_memcpy_cachable.S DirectFB=
-1.1.0/lib/direct/ppcasm_memcpy_cachable.S
---- DirectFB-1.1.0.orig/lib/direct/ppcasm_memcpy_cachable.S	2007-08-07 21:=
43:00.000000000 +0200
-+++ DirectFB-1.1.0/lib/direct/ppcasm_memcpy_cachable.S	2008-06-07 04:14:26=
.000000000 +0200
-@@ -34,8 +34,6 @@
-=20
- #define __ASSEMBLY__
-=20
--#include <linux/config.h>
--
- #if defined(CONFIG_8xx) || defined(CONFIG_403GCX)
- #define L1_CACHE_LINE_SIZE       16
- #define LG_L1_CACHE_LINE_SIZE     4=20




