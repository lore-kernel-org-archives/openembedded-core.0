Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1362A6A941;
	Mon,  1 Sep 2014 09:52:31 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so12288867wiv.7
	for <multiple recipients>; Mon, 01 Sep 2014 02:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=arc7yeYsFghgsup2gt2fkKOgmcnpOvvYIO6Hz3z3Pj0=;
	b=C4N9XFP8m+cQrU00+DeIpL5uqC7aZYeFzhrNKMUMQzU8+RCnzyj/6kuPv3EIc/PU20
	KXWIZpSpXuB1v2mDAKnqZERPme2Zvu5xBGVGpFNqYwE41LKDmI0N/AqQ/mnmZo6uZp8X
	vBqkxBghPVMz2CTfgCyko32a50SDQoLqa1L7GP+I2tZ52Htdqyn9BigMT0wz7yfq612e
	k+2fEkSI0aLb6Gt3NWdNhaRteQ0l5ghY9m12SBPLpjTL6vzsbEun6YWIb84Khj0LDc64
	jsPCuo1Ic8gXrSZsG3SAfhYsIFeyzKN2wIS9sMN1iFDOvvDje3zMHYQtuOX1+WlvB/Vt
	ri8Q==
X-Received: by 10.194.2.12 with SMTP id 12mr30393517wjq.54.1409565152345;
	Mon, 01 Sep 2014 02:52:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pk9sm917629wjb.16.2014.09.01.02.52.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Sep 2014 02:52:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 1 Sep 2014 11:52:46 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140901095246.GD2419@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-09-01
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
X-List-Received-Date: Mon, 01 Sep 2014 09:52:36 -0000
X-Groupsio-MsgNum: 57268
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NGIwU0kFl1Z1A3An"
Content-Disposition: inline

--NGIwU0kFl1Z1A3An
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-09-01 =3D=3D

=3D=3D=3D common () =3D=3D=3D

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_37.0.2062.0.bb, do_com=
pile

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_13.2.=
bb, do_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_compile

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||1     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140831_023729.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/2333/
|-
||qemux86       ||1     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140831_165445.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/2334/
|-
||qemux86_64    ||3     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140830_105038.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/2329/
|}

QA issues:
      2 claws-plugin-gtkhtml2-viewer-0.31: claws-plugin-gtkhtml2-viewer rde=
pends on rtmpdump, but it isn't a build dependency? [build-deps]
      2 claws-plugin-rssyl-0.34: claws-plugin-rssyl rdepends on rtmpdump, b=
ut it isn't a build dependency? [build-deps]
      3 collectd-5.2.2: collectd rdepends on initscripts-functions, but it =
isn't a build dependency? [build-deps]
      2 collectd-5.2.2: collectd rdepends on rtmpdump, but it isn't a build=
 dependency? [build-deps]
      2 curlpp-0.7.3: libcurlpp rdepends on rtmpdump, but it isn't a build =
dependency? [build-deps]
      3 exquisite-0.0.1+svnr82070: exquisite rdepends on initscripts-functi=
ons, but it isn't a build dependency? [build-deps]
      3 gpm-1.99.7: gpm rdepends on initscripts-functions, but it isn't a b=
uild dependency? [build-deps]
      2 gst-plugins-bad-0.10.23: gst-plugins-bad-rtmp rdepends on libcrypto=
, but it isn't a build dependency? [build-deps]
      2 gst-plugins-bad-0.10.23: gst-plugins-bad-rtmp rdepends on libssl, b=
ut it isn't a build dependency? [build-deps]
      1 gstreamer1.0-libav-1.4.0: ELF binary '/home/jenkins/oe/world/shr-co=
re/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gstreamer1.0-libav/1.4.0-r0/pac=
kages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has re=
locations in .text [textrel]
      1 gstreamer1.0-libav-1.4.0: ELF binary '/home/jenkins/oe/world/shr-co=
re/tmp-eglibc/work/i586-oe-linux/gstreamer1.0-libav/1.4.0-r0/packages-split=
/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations i=
n .text [textrel]
      3 irda-utils-0.9.18: irda-utils rdepends on initscripts-functions, bu=
t it isn't a build dependency? [build-deps]
      2 jasper-1.900.1: jasper-bin rdepends on libgl-mesa, but it isn't a b=
uild dependency? [build-deps]
      2 jasper-1.900.1: jasper-bin rdepends on libglu, but it isn't a build=
 dependency? [build-deps]
      1 libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/armv5te-oe-linux-gnueabi/libav/9.16-r0/packages-split/libavcodec/usr/l=
ib/libavcodec.so.54.35.0' has relocations in .text [textrel]
      1 libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.16-r0/packages-split/libavcodec/usr/lib/libavcod=
ec.so.54.35.0' has relocations in .text [textrel]
      1 libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.16-r0/packages-split/libavdevice/usr/lib/libavde=
vice.so.53.2.0' has relocations in .text [textrel]
      1 libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.16-r0/packages-split/libavfilter/usr/lib/libavfi=
lter.so.3.3.0' has relocations in .text [textrel]
      1 libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.16-r0/packages-split/libavformat/usr/lib/libavfo=
rmat.so.54.20.4' has relocations in .text [textrel]
      1 libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.16-r0/packages-split/libavresample/usr/lib/libav=
resample.so.1.0.1' has relocations in .text [textrel]
      1 libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.16-r0/packages-split/libavutil/usr/lib/libavutil=
=2Eso.52.3.0' has relocations in .text [textrel]
      1 libav-9.16: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/=
work/i586-oe-linux/libav/9.16-r0/packages-split/libswscale/usr/lib/libswsca=
le.so.2.1.1' has relocations in .text [textrel]
      1 libgcrypt-1.6.1: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libgcrypt/1.6.1-r0/packages-split/libgcr=
ypt/usr/lib/libgcrypt.so.20.0.1' has relocations in .text [textrel]
      2 liboauth-1.0.3: liboauth rdepends on rtmpdump, but it isn't a build=
 dependency? [build-deps]
      1 libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/home/jenkins=
/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libpostproc/52.=
3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc=
=2Eso.52.3.0' has relocations in .text [textrel]
      1 libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/home/jenkins=
/oe/world/shr-core/tmp-eglibc/work/i586-oe-linux/libpostproc/52.3.0+gitAUTO=
INC+811db3b957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0'=
 has relocations in .text [textrel]
      2 libwebp-0.4.0: libwebp-bin rdepends on libgl-mesa, but it isn't a b=
uild dependency? [build-deps]
      2 libwebp-0.4.0: libwebp-bin rdepends on mesa-glut, but it isn't a bu=
ild dependency? [build-deps]
      1 mpg123-1.19.0: ELF binary '/home/jenkins/oe/world/shr-core/tmp-egli=
bc/work/i586-oe-linux/mpg123/1.19.0-r0/packages-split/mpg123/usr/lib/libmpg=
123.so.0.40.1' has relocations in .text [textrel]
      3 openldap-2.4.39: openldap: Files/directories were installed but not=
 shipped   /run [installed-vs-shipped]
      3 postgresql-9.2.4: postgresql rdepends on initscripts-functions, but=
 it isn't a build dependency? [build-deps]
      3 proftpd-1.3.4b: proftpd rdepends on initscripts-functions, but it i=
sn't a build dependency? [build-deps]
      2 python3-3.3.3: python3-tkinter rdepends on tcl-lib, but it isn't a =
build dependency? [build-deps]
      1 qtwebengine-0.9.99+gitAUTOINC+21f6ce84ec: ELF binary '/home/jenkins=
/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtwebengine/0.9=
=2E99+gitAUTOINC+21f6ce84ec-r0/packages-split/qtwebengine/usr/lib/libQt0Web=
EngineCore.so.0.9.0' has relocations in .text [textrel]
      1 qtwebkit-5.3.1: ELF binary '/home/jenkins/oe/world/shr-core/tmp-egl=
ibc/work/i586-oe-linux/qtwebkit/5.3.1-r0/packages-split/qtwebkit/usr/lib/li=
bQt5WebKit.so.5.3.1' has relocations in .text [textrel]
      3 qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already str=
ipped, this will prevent future debugging! [already-stripped]
      3 qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was alrea=
dy stripped, this will prevent future debugging! [already-stripped]
      3 qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plug=
in.so' from qwt was already stripped, this will prevent future debugging! [=
already-stripped]
      3 radvd-1.9.8: radvd rdepends on initscripts-functions, but it isn't =
a build dependency? [build-deps]
      2 strongswan-5.2.0: strongswan rdepends on rtmpdump, but it isn't a b=
uild dependency? [build-deps]
      3 sysklogd-1.5: sysklogd rdepends on initscripts-functions, but it is=
n't a build dependency? [build-deps]
      1 webkit-efl-1.11.0: ELF binary '/home/jenkins/oe/world/shr-core/tmp-=
eglibc/work/i586-oe-linux/webkit-efl/1_1.11.0-r0/packages-split/webkit-efl/=
usr/lib/libjavascriptcore_efl.so.1.11.0' has relocations in .text [textrel]
      1 webkit-gtk-1.8.3: ELF binary '/home/jenkins/oe/world/shr-core/tmp-e=
glibc/work/i586-oe-linux/webkit-gtk/1.8.3-r1/packages-split/libjavascriptco=
re/usr/lib/libjavascriptcoregtk-1.0.so.0.13.4' has relocations in .text [te=
xtrel]
      1 xbmc-13.2: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eglibc/w=
ork/i586-oe-linux/xbmc/13.2-r0/packages-split/xbmc/usr/lib/xbmc/system/play=
ers/paplayer/SNESAPU-i486-linux.so' has relocations in .text [textrel]
      3 xbmc-13.2: xbmc: configure was passed unrecognised options: --disab=
le-rxsx [unknown-configure-option]
      3 xinetd-2.3.15: xinetd rdepends on initscripts-functions, but it isn=
't a build dependency? [build-deps]

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NGIwU0kFl1Z1A3An
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQEQe4ACgkQN1Ujt2V2gByWNwCeMKwyCU6hEUMdo+Cq2XnZ1ifc
EO0AoIck0ASsJFbnIaBmtbvlw3aG9Ltf
=THid
-----END PGP SIGNATURE-----

--NGIwU0kFl1Z1A3An--
