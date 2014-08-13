Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id F38F4609C0;
	Wed, 13 Aug 2014 20:38:33 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id v6so239272lbi.11
	for <multiple recipients>; Wed, 13 Aug 2014 13:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=ARzwvYVDZAlXvXU9zO+JkLnrajDuNH/vpmQ2rO0VVhE=;
	b=xVPC6BjQMWNpVjXBZMnKpLhhyB+Gih7KEvmTR0WknO61GNzHKWiqCsIJAHRz96/vEG
	YoovMMZI3gNsy6MOW9JFz2uQPk94ykRC2K2Ei6YiHDTjX7rnGp7SMWqpGvExiKxiO2FG
	MqaMxHaAn1RJC50/1qxswUJ/1swE+L9YcL0lJT+F01q3TMA4CaW6q+mEzz9PAVva2Swp
	N24HFE0fpMlDwIUI7YsrL0NnrgjKp+4Genapp9gdeNeirsai6DlooTc+W2WLYHF0KWG8
	Ypyo4SGIwujUanAYRDW0wNQd7V78dfCgAtOr9TlXsvHPBNkGOyWEfXVmVEVNr0AJXHpe
	2hMw==
X-Received: by 10.152.44.230 with SMTP id h6mr383539lam.51.1407962314220;
	Wed, 13 Aug 2014 13:38:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	xl2sm4540791lbb.47.2014.08.13.13.38.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Aug 2014 13:38:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Aug 2014 22:39:09 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140813203909.GY14848@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-08-13
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
X-List-Received-Date: Wed, 13 Aug 2014 20:38:44 -0000
X-Groupsio-MsgNum: 56425
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nPYEf/DvajCvrriP"
Content-Disposition: inline

--nPYEf/DvajCvrriP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Fix for dnsmasq is already on ML (and applied for qemux86*)

rabbitmq-c is new recipe from review, issue was reported

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-08-13 =3D=3D

=3D=3D=3D common () =3D=3D=3D

=3D=3D=3D common-x86 (1) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_37.0.2062.0.bb, do_com=
pile

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-support/dnsmasq/dnsmasq_2.6=
8.bb, do_patch

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (3) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_=
0.5.0.bb, do_compile
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_compile

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||1     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140810_115305.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/1702/
|-
||qemux86       ||2     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140811_084941.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/1705/
|-
||qemux86_64    ||4     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140813_111311.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/1706/
|}

More importantly here is full QA log (the build was without sstate-cache),
the number says in how many qa.log files it was found

      1 gstreamer1.0-libav-1.4.0: ELF binary '/home/jenkins/oe/world/shr-co=
re/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gstreamer1.0-libav/1.4.0-r0/pac=
kages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has re=
locations in .text [textrel]
      1 gstreamer1.0-libav-1.4.0: ELF binary '/home/jenkins/oe/world/shr-co=
re/tmp-eglibc/work/i586-oe-linux/gstreamer1.0-libav/1.4.0-r0/packages-split=
/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations i=
n .text [textrel]
      3 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libdrm, but it=
 isn't a build dependency? [build-deps]
      3 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libegl-mesa, b=
ut it isn't a build dependency? [build-deps]
      3 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libgbm, but it=
 isn't a build dependency? [build-deps]
      3 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libgl-mesa, bu=
t it isn't a build dependency? [build-deps]
      3 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libglapi, but =
it isn't a build dependency? [build-deps]
      1 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libgles2-mesa,=
 but it isn't a build dependency? [build-deps]
      3 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libglu, but it=
 isn't a build dependency? [build-deps]
      3 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libgstgl-1.0, =
but it isn't a build dependency? [build-deps]
      3 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libudev, but i=
t isn't a build dependency? [build-deps]
      3 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libwayland-egl=
, but it isn't a build dependency? [build-deps]
      3 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libxdamage, bu=
t it isn't a build dependency? [build-deps]
      3 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libxfixes, but=
 it isn't a build dependency? [build-deps]
      3 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on libxxf86vm, bu=
t it isn't a build dependency? [build-deps]
      3 gstreamer1.0-omx-1.2.0: gstreamer1.0-omx rdepends on wayland, but i=
t isn't a build dependency? [build-deps]
      4 gstreamer1.0-plugins-bad-1.4.0: gstreamer1.0-plugins-bad-opengl rde=
pends on libglu, but it isn't a build dependency? [build-deps]
      4 gstreamer1.0-plugins-bad-1.4.0: gstreamer1.0-plugins-bad-opengl rde=
pends on libjpeg-turbo, but it isn't a build dependency? [build-deps]
      4 gstreamer1.0-plugins-bad-1.4.0: gstreamer1.0-plugins-bad-opengl rde=
pends on libpng, but it isn't a build dependency? [build-deps]
      4 gstreamer1.0-plugins-bad-1.4.0: libgstgl-1.0 rdepends on libglu, bu=
t it isn't a build dependency? [build-deps]
      4 gypsy-0.9: gypsy: configure was passed unrecognised options: --with=
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
      1 libgcrypt-1.6.1: ELF binary '/home/jenkins/oe/world/shr-core/tmp-eg=
libc/work/armv5te-oe-linux-gnueabi/libgcrypt/1.6.1-r0/packages-split/libgcr=
ypt/usr/lib/libgcrypt.so.20.0.1' has relocations in .text [textrel]
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
      4 openldap-2.4.39: openldap: Files/directories were installed but not=
 shipped  /run [installed-vs-shipped]
      4 oscam-1.10+9164: File '/usr/bin/oscam' from oscam was already strip=
ped, this will prevent future debugging! [already-stripped]
      2 qemu-2.1.0: qemu rdepends on lzo, but it isn't a build dependency? =
[build-deps]
      1 qtwebengine-0.9.99+gitAUTOINC+21f6ce84ec: ELF binary '/home/jenkins=
/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtwebengine/0.9=
=2E99+gitAUTOINC+21f6ce84ec-r0/packages-split/qtwebengine/usr/lib/libQt0Web=
EngineCore.so.0.9.0' has relocations in .text [textrel]
      1 qtwebkit-5.3.1: ELF binary '/home/jenkins/oe/world/shr-core/tmp-egl=
ibc/work/i586-oe-linux/qtwebkit/5.3.1-r0/packages-split/qtwebkit/usr/lib/li=
bQt5WebKit.so.5.3.1' has relocations in .text [textrel]
      5 qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already str=
ipped, this will prevent future debugging! [already-stripped]
      5 qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was alrea=
dy stripped, this will prevent future debugging! [already-stripped]
      5 qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plug=
in.so' from qwt was already stripped, this will prevent future debugging! [=
already-stripped]
      1 webkit-efl-2.3.4+svnr164189: ELF binary '/home/jenkins/oe/world/shr=
-core/tmp-eglibc/work/i586-oe-linux/webkit-efl/2.3.4+svnr164189-r0/packages=
-split/webkit-efl/usr/lib/libjavascriptcore_efl.so.0.1.0' has relocations i=
n .text [textrel]
      1 webkit-gtk-1.8.3: ELF binary '/home/jenkins/oe/world/shr-core/tmp-e=
glibc/work/i586-oe-linux/webkit-gtk/1.8.3-r1/packages-split/libjavascriptco=
re/usr/lib/libjavascriptcoregtk-1.0.so.0.13.4' has relocations in .text [te=
xtrel]

Fixes on ML
      1 dconf-0.18.0: dconf-editor rdepends on libxml2, but it isn't a buil=
d dependency? [build-deps]
      4 evopedia-0.4.2+gitrAUTOINC+36ca70acb4: evopedia rdepends on libbz2,=
 but it isn't a build dependency? [build-deps]
      1 expedite-1.7.9: expedite rdepends on evas-engine-fb, but it isn't a=
 build dependency? [build-deps]
      1 expedite-1.7.9: expedite rdepends on evas-engine-software-generic, =
but it isn't a build dependency? [build-deps]
      1 expedite-1.7.9: expedite rdepends on evas-loader-png, but it isn't =
a build dependency? [build-deps]
      1 expedite-1.7.9: expedite rdepends on libsdl, but it isn't a build d=
ependency? [build-deps]
      1 webmin-1.620: webmin rdepends on perl-module-timelocal, but it isn'=
t a build dependency? [build-deps]
      1 webmin-1.620: webmin-module-proc rdepends on procps, but it isn't a=
 build dependency? [build-deps]
      1 webmin-1.620: webmin-module-raid rdepends on mdadm, but it isn't a =
build dependency? [build-deps]
      1 gtksourceview2-2.10.5: gtksourceview2 rdepends on libxml2, but it i=
sn't a build dependency? [build-deps]
      1 kernelshark-1.2+gitAUTOINC+7055ffd37b: kernelshark rdepends on libx=
ml2, but it isn't a build dependency? [build-deps]
      1 libxklavier-5.3: libxklavier rdepends on libxml2, but it isn't a bu=
ild dependency? [build-deps]
      2 talloc-2.0.1: talloc: Files/directories were installed but not ship=
ped  /usr/bin [installed-vs-shipped]

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nPYEf/DvajCvrriP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPrzO0ACgkQN1Ujt2V2gBxOIgCfQBs8CletOdXp4BRFIcSKelbt
+WsAoIIH5fOpmjszibc87BOs+9yXSllk
=LqIX
-----END PGP SIGNATURE-----

--nPYEf/DvajCvrriP--
