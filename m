Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qgem5-00029M-OI
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 17:21:27 +0200
Received: by wwi18 with SMTP id 18so4100681wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 08:16:20 -0700 (PDT)
Received: by 10.216.166.132 with SMTP id g4mr55311wel.35.1310483779763;
	Tue, 12 Jul 2011 08:16:19 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w10sm7614349weq.27.2011.07.12.08.16.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 08:16:18 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1310483720-11729-1-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 12 Jul 2011 17:16:16 +0200
Message-Id: <D2DF7696-0988-469C-A6BC-013B6E5830BF@dominion.thruhere.net>
References: <1310483720-11729-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] pulseaudio: enable bluetooth support
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
X-List-Received-Date: Tue, 12 Jul 2011 15:21:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

This is the final patch in the pulseaudio series, I have bluetooth audio =
working again :)


Op 12 jul 2011, om 17:15 heeft Koen Kooi het volgende geschreven:

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    4 ++--
> .../pulseaudio/pulseaudio_0.9.22.bb                |    2 +-
> .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
> 3 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc =
b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index a520343..4bb1c59 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D =
"file://GPL;md5=3D4325afd396febcb659c36b49533135d4 \
>                     =
file://src/pulsecore/vector.h;beginline=3D1;endline=3D21;md5=3D1b561f0a2ca=
47b1fa49862a6ccaacff1"
> DEPENDS =3D "libatomics-ops liboil avahi libsamplerate0 libsndfile1 =
libtool virtual/libx11"
> # optional
> -DEPENDS +=3D "udev alsa-lib glib-2.0 dbus consolekit"
> +DEPENDS +=3D "bluez4 udev alsa-lib glib-2.0 dbus consolekit"
>=20
> SRC_URI =3D =
"http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.gz =
\
>            file://gcc4-compile-fix.patch;patch=3D1 \
> @@ -19,7 +19,7 @@ inherit autotools pkgconfig
>=20
> EXTRA_OECONF =3D "\
> 		--disable-lynx \
> -		--disable-bluez \
> +		--enable-bluez \
> 		--disable-polkit \
> 		--with-x \
> 		--without-jack \
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb =
b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
> index 2757b32..da2e988 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
> @@ -1,6 +1,6 @@
> require pulseaudio.inc
>=20
> -PR =3D "r5"
> +PR =3D "r6"
>=20
> DEPENDS +=3D "gdbm speex"
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb =
b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> index 8b96aed..1edd913 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> @@ -1,6 +1,6 @@
> require pulseaudio.inc
>=20
> -PR =3D "r3"
> +PR =3D "r4"
>=20
> DEPENDS +=3D "gdbm speex"
>=20
> --=20
> 1.6.6.1
>=20



