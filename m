Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id C7C6865D56;
	Thu, 21 Aug 2014 12:15:16 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so7975884wiv.4
	for <multiple recipients>; Thu, 21 Aug 2014 05:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=bUW+0aYxVlNpw+6n/b/N9MjhDP5MC4MksenKz6sS60A=;
	b=UYLszLoWcRm26YajwdbYoi/atNWRHkFaxXZEjpUxRAs2+jG6BuEEAPOOqwWPm5U0DP
	P4dEzK7KBpv9iwM+SCPo+kd/z2uOC92v5iAROOTlb/iN+3b08l0A/iLiHUeF7PZ5v1+J
	M4TZ2ASl01Drba654qzlta66qPSWI/ckFxsJmR7VsstbKzJrGqe/iBUDzYuACKGykprp
	ED6SKM64BNhHkeqJHqmxlJV0GevpoNnct+C5o1agxua4sBq22OahaBlp3C+maHUA0R3d
	iwS5MC43epurcya+vkfrzHxy6jZEp/Q0Fu7cId81OwuwZzlvRvYEgzePQSKTN07MO9Nu
	tgIg==
X-Received: by 10.194.3.106 with SMTP id b10mr16949136wjb.116.1408623317833;
	Thu, 21 Aug 2014 05:15:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	es9sm66345397wjd.1.2014.08.21.05.15.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Aug 2014 05:15:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 21 Aug 2014 14:15:20 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <20140821121520.GY3660@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-08-21
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
X-List-Received-Date: Thu, 21 Aug 2014 12:15:19 -0000
X-Groupsio-MsgNum: 56809
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sF6X0tUrUrSWNIfp"
Content-Disposition: inline

--sF6X0tUrUrSWNIfp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-08-21 =3D=3D

=3D=3D=3D common () =3D=3D=3D

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_37.0.2062.0.bb, do_com=
pile

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_13.1.=
bb, do_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_compile

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||1     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140819_135219.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/1864/
|-
||qemux86       ||1     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140819_222152.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/1872/
|-
||qemux86_64    ||3     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140820_081835.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/1886/
|}

There were a lot of QA warnings about libdw dependency, but they all seem to
originate from new systemd (udev) and were fixed by adding PACKAGECONFIG th=
ere.

gstreamer recipes are worst, I've pinged dv already, because some are cause=
d by latest upgrade, no reply yet.

      1 gst-plugins-bad-0.10.23: gst-plugins-bad-rtmp rdepends on libcrypto=
, but it isn't a build dependency? [build-deps]
      1 gst-plugins-bad-0.10.23: gst-plugins-bad-rtmp rdepends on libssl, b=
ut it isn't a build dependency? [build-deps]
      3 gstreamer1.0-libav-1.4.0: ELF binary '/home/jenkins/oe/world/shr-co=
re/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gstreamer1.0-libav/1.4.0-r0/pac=
kages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has re=
locations in .text [textrel]
      2 gstreamer1.0-libav-1.4.0: ELF binary '/home/jenkins/oe/world/shr-co=
re/tmp-eglibc/work/i586-oe-linux/gstreamer1.0-libav/1.4.0-r0/packages-split=
/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations i=
n .text [textrel]
      6 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libdrm, but it=
 isn't a build dependency? [build-deps]
      6 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libegl-mesa, b=
ut it isn't a build dependency? [build-deps]
      6 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libgbm, but it=
 isn't a build dependency? [build-deps]
      6 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libgl-mesa, bu=
t it isn't a build dependency? [build-deps]
      6 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libglapi, but =
it isn't a build dependency? [build-deps]
      1 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libgles2-mesa,=
 but it isn't a build dependency? [build-deps]
      6 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libglu, but it=
 isn't a build dependency? [build-deps]
      6 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libgstgl-1.0, =
but it isn't a build dependency? [build-deps]
      6 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libudev, but i=
t isn't a build dependency? [build-deps]
      6 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libwayland-egl=
, but it isn't a build dependency? [build-deps]
      6 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libxdamage, bu=
t it isn't a build dependency? [build-deps]
      6 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libxfixes, but=
 it isn't a build dependency? [build-deps]
      6 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libxxf86vm, bu=
t it isn't a build dependency? [build-deps]
      6 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on wayland, but i=
t isn't a build dependency? [build-deps]
     11 gstreamer1.0-plugins-bad-1.4.0: gstreamer1.0-plugins-bad-opengl rde=
pends on libglu, but it isn't a build dependency? [build-deps]
     11 gstreamer1.0-plugins-bad-1.4.0: gstreamer1.0-plugins-bad-opengl rde=
pends on libjpeg-turbo, but it isn't a build dependency? [build-deps]
     11 gstreamer1.0-plugins-bad-1.4.0: gstreamer1.0-plugins-bad-opengl rde=
pends on libpng, but it isn't a build dependency? [build-deps]
     11 gstreamer1.0-plugins-bad-1.4.0: libgstgl-1.0 rdepends on libglu, bu=
t it isn't a build dependency? [build-deps]
      7 gypsy-0.9: gypsy: configure was passed unrecognised options: --with=
-distro [unknown-configure-option]
      1 libav-9.13: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/armv5te-oe-linux-gnueabi/libav/9.13-r0/packages-split/libavcodec/usr/l=
ib/libavcodec.so.54.35.0' has relocations in .text [textrel]
      1 libav-9.13: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.13-r0/packages-split/libavcodec/usr/lib/libavcod=
ec.so.54.35.0' has relocations in .text [textrel]
      1 libav-9.13: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.13-r0/packages-split/libavdevice/usr/lib/libavde=
vice.so.53.2.0' has relocations in .text [textrel]
      1 libav-9.13: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.13-r0/packages-split/libavfilter/usr/lib/libavfi=
lter.so.3.3.0' has relocations in .text [textrel]
      1 libav-9.13: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.13-r0/packages-split/libavformat/usr/lib/libavfo=
rmat.so.54.20.4' has relocations in .text [textrel]
      1 libav-9.13: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.13-r0/packages-split/libavresample/usr/lib/libav=
resample.so.1.0.1' has relocations in .text [textrel]
      1 libav-9.13: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.13-r0/packages-split/libavutil/usr/lib/libavutil=
=2Eso.52.3.0' has relocations in .text [textrel]
      1 libav-9.13: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.13-r0/packages-split/libswscale/usr/lib/libswsca=
le.so.2.1.1' has relocations in .text [textrel]
      3 libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/armv5te-oe-linux-gnueabi/libav/9.16-r0/packages-split/libavcodec/usr/l=
ib/libavcodec.so.54.35.0' has relocations in .text [textrel]
      3 libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.16-r0/packages-split/libavcodec/usr/lib/libavcod=
ec.so.54.35.0' has relocations in .text [textrel]
      3 libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.16-r0/packages-split/libavdevice/usr/lib/libavde=
vice.so.53.2.0' has relocations in .text [textrel]
      3 libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.16-r0/packages-split/libavfilter/usr/lib/libavfi=
lter.so.3.3.0' has relocations in .text [textrel]
      3 libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.16-r0/packages-split/libavformat/usr/lib/libavfo=
rmat.so.54.20.4' has relocations in .text [textrel]
      3 libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.16-r0/packages-split/libavresample/usr/lib/libav=
resample.so.1.0.1' has relocations in .text [textrel]
      3 libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.16-r0/packages-split/libavutil/usr/lib/libavutil=
=2Eso.52.3.0' has relocations in .text [textrel]
      3 libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.16-r0/packages-split/libswscale/usr/lib/libswsca=
le.so.2.1.1' has relocations in .text [textrel]
      3 libgcrypt-1.6.1: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libgcrypt/1.6.1-r0/packages-split/libgcr=
ypt/usr/lib/libgcrypt.so.20.0.1' has relocations in .text [textrel]
      4 libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/home/jenkins=
/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpostproc/52.=
3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc=
=2Eso.52.3.0' has relocations in .text [textrel]
      4 libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/home/jenkins=
/oe/world/shr-core/tmp-eglibc/work/i586-oe-linux/libpostproc/52.3.0+gitAUTO=
INC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0'=
 has relocations in .text [textrel]
      3 libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a b=
uild dependency? [build-deps]
      3 libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a bu=
ild dependency? [build-deps]
      4 mpg123-1.19.0: ELF binary '/home/jenkins/oe/world/shr-core/tmp-egli=
bc/work/i586-oe-linux/mpg123/1.19.0-r0/packages-split/mpg123/usr/lib/libmpg=
123.so.0.40.1' has relocations in .text [textrel]
      5 opencv-2.4.9+gitAUTOINC+df8e28283f: libopencv-highgui rdepends on j=
asper, but it isn't a build dependency? [build-deps]
      1 opencv-2.4.9+gitAUTOINC+df8e28283f: libopencv-highgui rdepends on l=
ibdc1394, but it isn't a build dependency? [build-deps]
      6 openldap-2.4.39: openldap: Files/directories were installed but not=
 shipped
     11 oscam-1.10+9164: File '/usr/bin/oscam' from oscam was already strip=
ped, this will prevent future debugging! [already-stripped]
      2 qemu-2.1.0: qemu rdepends on lzo, but it isn't a build dependency? =
[build-deps]
      3 qemu-2.1.0: qemu rdepends on numactl, but it isn't a build dependen=
cy? [build-deps]
      3 qtbase-5.3.1: qtbase-plugins rdepends on cups-lib, but it isn't a b=
uild dependency? [build-deps]
      4 qtwebengine-0.9.99+gitAUTOINC+21f6ce84ec: ELF binary '/home/jenkins=
/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtwebengine/0.9=
=2E99+gitAUTOINC+21f6ce84ec-r0/packages-split/qtwebengine/usr/lib/libQt0Web=
EngineCore.so.0.9.0' has relocations in .text [textrel]
      4 qtwebkit-5.3.1: ELF binary '/home/jenkins/oe/world/shr-core/tmp-egl=
ibc/work/i586-oe-linux/qtwebkit/5.3.1-r0/packages-split/qtwebkit/usr/lib/li=
bQt5WebKit.so.5.3.1' has relocations in .text [textrel]
     10 qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already str=
ipped, this will prevent future debugging! [already-stripped]
     10 qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was alrea=
dy stripped, this will prevent future debugging! [already-stripped]
     10 qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plug=
in.so' from qwt was already stripped, this will prevent future debugging! [=
already-stripped]
      3 tcpdump-4.6.1: tcpdump rdepends on libsmi, but it isn't a build dep=
endency? [build-deps]
      4 webkit-efl-1.10.0+1.11.0-beta1: ELF binary '/home/jenkins/oe/world/=
shr-core/tmp-eglibc/work/i586-oe-linux/webkit-efl/1_1.10.0+1.11.0-beta1-r0/=
packages-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.1.11.0' has relo=
cations in .text [textrel]
      4 webkit-gtk-1.8.3: ELF binary '/home/jenkins/oe/world/shr-core/tmp-e=
glibc/work/i586-oe-linux/webkit-gtk/1.8.3-r1/packages-split/libjavascriptco=
re/usr/lib/libjavascriptcoregtk-1.0.so.0.13.4' has relocations in .text [te=
xtrel]
      1 xbmc-13.1: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/w=
ork/i586-oe-linux/xbmc/13.1-r0/packages-split/xbmc/usr/lib/xbmc/system/play=
ers/paplayer/SNESAPU-i486-linux.so' has relocations in .text [textrel]


and libdw issues (probably all resolved by systemd PACKAGECONFIG which was =
cherry-picked later):
      1 bluez4-4.101: bluez4 rdepends on libdw, but it isn't a build depend=
ency? [build-deps]
      1 cheese-2.30.1: cheese rdepends on libdw, but it isn't a build depen=
dency? [build-deps]
      4 clutter-1.0-1.18.2: clutter-1.0 rdepends on libdw, but it isn't a b=
uild dependency? [build-deps]
      1 clutter-gst-1.0-1.6.0: clutter-gst-1.0 rdepends on libdw, but it is=
n't a build dependency? [build-deps]
      4 clutter-gtk-1.0-1.4.4: clutter-gtk-1.0 rdepends on libdw, but it is=
n't a build dependency? [build-deps]
      4 cogl-1.0-1.18.2: libcogl rdepends on libdw, but it isn't a build de=
pendency? [build-deps]
      4 cogl-1.0-1.18.2: libcogl-pango rdepends on libdw, but it isn't a bu=
ild dependency? [build-deps]
      4 cogl-1.0-1.18.2: libcogl-path rdepends on libdw, but it isn't a bui=
ld dependency? [build-deps]
      4 cpu-0.0.1+svnr82070: cpu rdepends on libdw, but it isn't a build de=
pendency? [build-deps]
      4 diskio-0.0.1+svnr82070: diskio rdepends on libdw, but it isn't a bu=
ild dependency? [build-deps]
      1 e-wm-0.18.8: e-wm rdepends on libdw, but it isn't a build dependenc=
y? [build-deps]
      1 efl-1.10.2+1.11.0-beta2: edje rdepends on libdw, but it isn't a bui=
ld dependency? [build-deps]
      1 efl-1.10.2+1.11.0-beta2: eeze rdepends on libdw, but it isn't a bui=
ld dependency? [build-deps]
      1 efl-1.10.2+1.11.0-beta2: emotion rdepends on libdw, but it isn't a =
build dependency? [build-deps]
      1 efl-1.10.2+1.11.0-beta2: ethumb rdepends on libdw, but it isn't a b=
uild dependency? [build-deps]
      1 efl-1.10.2+1.11.0-beta2: evas rdepends on libdw, but it isn't a bui=
ld dependency? [build-deps]
      1 efl-1.10.2+1.11.0-beta2: libemotion rdepends on libdw, but it isn't=
 a build dependency? [build-deps]
      1 elementary-1.10.2+1.11.0-beta2: elementary rdepends on libdw, but i=
t isn't a build dependency? [build-deps]
      1 elementary-1.10.2+1.11.0-beta2: elementary-accessibility rdepends o=
n libdw, but it isn't a build dependency? [build-deps]
      1 elementary-1.10.2+1.11.0-beta2: elementary-tests rdepends on libdw,=
 but it isn't a build dependency? [build-deps]
      4 elfe-0.0.1+gitrAUTOINC+1ec0e7713c: elfe rdepends on libdw, but it i=
sn't a build dependency? [build-deps]
      4 estardict-0.7: estardict rdepends on libdw, but it isn't a build de=
pendency? [build-deps]
      4 exalt-client-0.0.1+svnr82070: exalt-client rdepends on libdw, but i=
t isn't a build dependency? [build-deps]
      4 flame-0.0.3+svnr82070: flame rdepends on libdw, but it isn't a buil=
d dependency? [build-deps]
      4 forecasts-0.2.0+svnr82070: forecasts rdepends on libdw, but it isn'=
t a build dependency? [build-deps]
      4 gimp-2.8.10: gimp rdepends on libdw, but it isn't a build dependenc=
y? [build-deps]
      4 gnome-disk-utility-2.32.0: gnome-disk-utility-libs rdepends on libd=
w, but it isn't a build dependency? [build-deps]
      4 gst-plugins-gl-0.10.3: gst-plugins-gl-opengl rdepends on libdw, but=
 it isn't a build dependency? [build-deps]
      4 gst-plugins-gl-0.10.3: libgstgl-0.10 rdepends on libdw, but it isn'=
t a build dependency? [build-deps]
      1 gst-plugins-good-0.10.31: gst-plugins-good-video4linux2 rdepends on=
 libdw, but it isn't a build dependency? [build-deps]
      3 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libdw, but it =
isn't a build dependency? [build-deps]
      4 gstreamer1.0-plugins-bad-1.4.0: gstreamer1.0-plugins-bad-opengl rde=
pends on libdw, but it isn't a build dependency? [build-deps]
      4 gstreamer1.0-plugins-bad-1.4.0: gstreamer1.0-plugins-bad-uvch264 rd=
epends on libdw, but it isn't a build dependency? [build-deps]
      4 gstreamer1.0-plugins-bad-1.4.0: libgstgl-1.0 rdepends on libdw, but=
 it isn't a build dependency? [build-deps]
      4 gstreamer1.0-plugins-good-1.4.0: gstreamer1.0-plugins-good-video4li=
nux2 rdepends on libdw, but it isn't a build dependency? [build-deps]
      4 gvfs-1.10.1: gvfs rdepends on libdw, but it isn't a build dependenc=
y? [build-deps]
      4 gypsy-0.9: libgypsy rdepends on libdw, but it isn't a build depende=
ncy? [build-deps]
      1 libatasmart-0.19: libatasmart rdepends on libdw, but it isn't a bui=
ld dependency? [build-deps]
      4 libcec-1.9.0: libcec rdepends on libdw, but it isn't a build depend=
ency? [build-deps]
      4 libeflvala-2011.01.13.1+svnr82070: libeflvala rdepends on libdw, bu=
t it isn't a build dependency? [build-deps]
      4 libphone-ui-shr-0.0.1+gitrAUTOINC+25e6160710: libphone-ui-shr rdepe=
nds on libdw, but it isn't a build dependency? [build-deps]
      1 mesa-10.1.3: libegl-mesa rdepends on libdw, but it isn't a build de=
pendency? [build-deps]
      1 mesa-10.1.3: libgbm rdepends on libdw, but it isn't a build depende=
ncy? [build-deps]
      4 mx-1.0-1.4.7+gitAUTOINC+9b1db6b806: mx-1.0 rdepends on libdw, but i=
t isn't a build dependency? [build-deps]
      4 navit-0.2.0+svnr5310: navit rdepends on libdw, but it isn't a build=
 dependency? [build-deps]
      4 places-0.1.0+svnr82070: places rdepends on libdw, but it isn't a bu=
ild dependency? [build-deps]
      1 polkit-0.111: polkit rdepends on libdw, but it isn't a build depend=
ency? [build-deps]
      4 polkit-gnome-0.102: polkit-gnome rdepends on libdw, but it isn't a =
build dependency? [build-deps]
      1 pulseaudio-5.0: pulseaudio-lib-alsa-util rdepends on libdw, but it =
isn't a build dependency? [build-deps]
      1 pulseaudio-5.0: pulseaudio-module-alsa-card rdepends on libdw, but =
it isn't a build dependency? [build-deps]
      1 pulseaudio-5.0: pulseaudio-module-alsa-sink rdepends on libdw, but =
it isn't a build dependency? [build-deps]
      1 pulseaudio-5.0: pulseaudio-module-alsa-source rdepends on libdw, bu=
t it isn't a build dependency? [build-deps]
      1 pulseaudio-5.0: pulseaudio-module-systemd-login rdepends on libdw, =
but it isn't a build dependency? [build-deps]
      1 pulseaudio-5.0: pulseaudio-module-udev-detect rdepends on libdw, bu=
t it isn't a build dependency? [build-deps]
      4 rain-0.0.3+svnr82070: rain rdepends on libdw, but it isn't a build =
dependency? [build-deps]
      4 shr-e-gadgets-0.0.0+gitrAUTOINC+42806ea24f: shr-e-gadgets rdepends =
on libdw, but it isn't a build dependency? [build-deps]
      4 shr-wizard-0.0.0+gitrAUTOINC+1dae79221f: shr-wizard rdepends on lib=
dw, but it isn't a build dependency? [build-deps]
      1 systemd-215+gitAUTOINC+252ff40a38: libgudev-1.0 rdepends on libdw, =
but it isn't a build dependency? [build-deps]
      1 systemd-215+gitAUTOINC+252ff40a38: libsystemd rdepends on libdw, bu=
t it isn't a build dependency? [build-deps]
      1 systemd-215+gitAUTOINC+252ff40a38: libudev rdepends on libdw, but i=
t isn't a build dependency? [build-deps]
      1 systemd-215+gitAUTOINC+252ff40a38: systemd rdepends on libdw, but i=
t isn't a build dependency? [build-deps]
      4 uptime-0.0.2+svnr82070: uptime rdepends on libdw, but it isn't a bu=
ild dependency? [build-deps]
      4 vlc-2.1.4: vlc rdepends on libdw, but it isn't a build dependency? =
[build-deps]
      4 weston-1.5.0: weston rdepends on libdw, but it isn't a build depend=
ency? [build-deps]
      4 xf86-input-evdev-2.9.0: xf86-input-evdev rdepends on libdw, but it =
isn't a build dependency? [build-deps]
      2 xf86-video-ati-7.2.0: xf86-video-ati rdepends on libdw, but it isn'=
t a build dependency? [build-deps]
      2 xf86-video-intel-2.99.912: xf86-video-intel rdepends on libdw, but =
it isn't a build dependency? [build-deps]
      4 xf86-video-modesetting-0.8.1: xf86-video-modesetting rdepends on li=
bdw, but it isn't a build dependency? [build-deps]
      2 xf86-video-nouveau-1.0.9: xf86-video-nouveau rdepends on libdw, but=
 it isn't a build dependency? [build-deps]

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sF6X0tUrUrSWNIfp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP14tgACgkQN1Ujt2V2gBxS8ACbBEbrTouBvBiWa6puP+706+VV
OxIAmwZutnLFDjIeqykkVTvAbHJSgqpS
=Ll7i
-----END PGP SIGNATURE-----

--sF6X0tUrUrSWNIfp--
