Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgXB7-0008HP-01
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 09:14:45 +0200
Received: by wyg30 with SMTP id 30so3513732wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 00:10:45 -0700 (PDT)
Received: by 10.216.63.2 with SMTP id z2mr3813428wec.11.1310454642421;
	Tue, 12 Jul 2011 00:10:42 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id g55sm660680wee.11.2011.07.12.00.10.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 00:10:41 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <febb9488289e43ac06b9383dfffa2d584f49aa16.1310425837.git.sgw@linux.intel.com>
Date: Tue, 12 Jul 2011 09:10:39 +0200
Message-Id: <2541EF21-1EB2-47BD-9F58-CA2FB08F8541@dominion.thruhere.net>
References: <cover.1310425837.git.sgw@linux.intel.com>
	<febb9488289e43ac06b9383dfffa2d584f49aa16.1310425837.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 12/26] libxft: use default bitbake.conf FILES Packaging to handle staticdev
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
X-List-Received-Date: Tue, 12 Jul 2011 07:14:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 jul 2011, om 01:13 heeft Saul Wold het volgende geschreven:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb |    7 ++-----
> 1 files changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb =
b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
> index 1a56702..997db3e 100644
> --- a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
> @@ -18,7 +18,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D90b90b60eb30f65fc9c2673d7cf59e24"
> DEPENDS +=3D "libxrender freetype fontconfig"
> PROVIDES =3D "xft"
>=20
> -PR =3D "r0"
> +PR =3D "r1"
> PE =3D "1"
>=20
> XORG_PN =3D "libXft"
> @@ -28,10 +28,7 @@ python () {
>             bb.data.setVar('PKG_${PN}', 'libxft2', d)
> }
>=20
> -FILES_${PN} =3D "${libdir}/lib*${SOLIBS}"
> -FILES_${PN}-dev =3D "${includedir} ${libdir}/lib*${SOLIBSDEV} =
${libdir}/*.la \
> -		${libdir}/*.a ${libdir}/pkgconfig \
> -		${datadir}/aclocal ${bindir} ${sbindir}"
> +FILES_${PN}-dev +=3D "${bindir} ${sbindir}"


$ dpkg-deb -c ipk/armv7a/libxft-dev_2.2.0-r0_armv7a.ipk=20
drwxr-xr-x root/root         0 2011-07-11 09:28 ./
drwxr-xr-x root/root         0 2011-07-11 09:28 ./usr/
drwxr-xr-x root/root         0 2011-07-11 09:28 ./usr/include/
drwxr-xr-x root/root         0 2011-07-11 09:28 ./usr/include/X11/
drwxr-xr-x root/root         0 2011-07-11 09:28 ./usr/include/X11/Xft/
-rw-r--r-- root/root      5223 2011-07-11 09:28 =
./usr/include/X11/Xft/XftCompat.h
-rw-r--r-- root/root     12533 2011-07-11 09:28 =
./usr/include/X11/Xft/Xft.h
drwxr-xr-x root/root         0 2011-07-11 09:28 ./usr/lib/
-rwxr-xr-x root/root      1228 2011-07-11 09:28 ./usr/lib/libXft.la
drwxr-xr-x root/root         0 2011-07-11 09:28 ./usr/lib/pkgconfig/
-rw-r--r-- root/root       241 2011-07-11 09:28 =
./usr/lib/pkgconfig/xft.pc
lrwxrwxrwx root/root         0 2011-07-11 09:28 ./usr/lib/libXft.so -> =
libXft.so.2.2.0
-rw-r--r-- root/root    847424 2011-07-11 09:28 ./usr/lib/libXft.a

Is there actually something in (s)bindir?=


