Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id E3F2E6D1B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 08:12:22 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c1so1156344eek.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 01:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2+dlA9mFK7Uh55eJ9AyTamhm0qN0fZK4bSXdAmFvVQk=;
	b=SNq9MLkQQ52V0dFMAgWECDoIOktuliBAfNzZnfcYWjpROL/ycnxYp7CEwwXqBzN4sI
	r1EMIRXfqrcQVobS97szw+FFn0Kil40Dr/lVWpP90w9tosGUKrTdEqgLzlYUvS9HWWHO
	yMiSniDAKSB5j5Lnrqdzv/EtP3/wWY1Pa9Dd8CYaiKKP51soRHALtwKw/mHVYZZxFqof
	g2zm6ymR0cv38X2laOw6lNtYfVXXLOMRrYB4gGgYknMZ35VzjhoylhczKNOKSX75HpLd
	zcydnz5hasctuuo/kh95PevoVvUh5iOR/bl3uGmIONzHriNln47xa0L5CBcPpbZZNpF9
	i//g==
X-Received: by 10.14.149.13 with SMTP id w13mr659904eej.134.1383207144348;
	Thu, 31 Oct 2013 01:12:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id x47sm5328420eea.16.2013.10.31.01.12.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Oct 2013 01:12:23 -0700 (PDT)
Date: Thu, 31 Oct 2013 09:12:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: rongqing.li@windriver.com
Message-ID: <20131031081225.GD32015@jama>
References: <1383181191-17015-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1383181191-17015-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bluez: declaration of virtual/bluez
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
X-List-Received-Date: Thu, 31 Oct 2013 08:12:23 -0000
X-Groupsio-MsgNum: 46447
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ycz6tD7Th1CMF4v7"
Content-Disposition: inline

--Ycz6tD7Th1CMF4v7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2013 at 08:59:51AM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> We have two version bluez, declare virtual/bluez to switch them easily,
> and set the preferred provider for bluez as bluez4

virtual/bluez and PREFERRED_PROVIDERS doesn't work for runtime
dependencies, you need to use VIRTUAL_RUNTIME_bluez for runtime deps and
virtual/bluez only for build time.

>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta/conf/distro/include/default-providers.inc                    |    4=
 +---
>  meta/recipes-connectivity/bluez/bluez4.inc                        |    2=
 ++
>  meta/recipes-connectivity/bluez5/bluez5.inc                       |    2=
 ++
>  meta/recipes-connectivity/connman/connman.inc                     |    4=
 ++--
>  meta/recipes-connectivity/libpcap/libpcap.inc                     |    2=
 +-
>  meta/recipes-connectivity/neard/neard.inc                         |    2=
 +-
>  meta/recipes-connectivity/ofono/ofono.inc                         |    2=
 +-
>  meta/recipes-core/packagegroups/packagegroup-base.bb              |    2=
 +-
>  meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc        |    2=
 +-
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb |    2=
 +-
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc                 |    2=
 +-
>  meta/recipes-qt/qt4/qt-mobility_1.2.0.inc                         |    2=
 +-
>  12 files changed, 15 insertions(+), 13 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/d=
istro/include/default-providers.inc
> index d4b9db0..9dc0310 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -14,6 +14,7 @@ PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "op=
kg"
>  PREFERRED_PROVIDER_virtual/update-alternatives-native ?=3D "opkg-native"
>  PREFERRED_PROVIDER_virtual/libx11 ?=3D "libx11"
>  PREFERRED_PROVIDER_xf86-video-intel ?=3D "xf86-video-intel"
> +PREFERRED_PROVIDER_virtual/bluez ?=3D "bluez4"
> =20
>  #
>  # Default virtual runtime providers
> @@ -40,6 +41,3 @@ PREFERRED_PROVIDER_console-tools ?=3D "kbd"
>  PREFERRED_PROVIDER_gzip-native ?=3D "pigz-native"
>  PREFERRED_PROVIDER_make ?=3D "make"
>  PREFERRED_PROVIDER_udev ?=3D "${@base_contains('DISTRO_FEATURES','system=
d','systemd','udev',d)}"
> -# There are issues with runtime packages and PREFERRED_PROVIDER, see YOC=
TO #5044 for details
> -# on this rather strange entry.
> -PREFERRED_PROVIDER_bluez4 ?=3D "bluez4"
> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-co=
nnectivity/bluez/bluez4.inc
> index e4f6834..8ef1d2b 100644
> --- a/meta/recipes-connectivity/bluez/bluez4.inc
> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
> @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff8=
7c09e5b7ccc2c4ca7e \
>                      file://sbc/sbc.c;beginline=3D1;endline=3D25;md5=3D1a=
40781ed30d50d8639323a184aeb191"
>  DEPENDS =3D "udev libusb dbus-glib glib-2.0 libcheck readline"
>  RDEPENDS_${PN}-dev =3D "bluez-hcidump"
> +PROVIDES +=3D "virtual/bluez"
> +RPROVIDES_${PN} =3D "virtual/bluez"
> =20
>  PACKAGECONFIG ??=3D "\
>      ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index 2e25d86..d21c8a2 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -7,6 +7,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff8=
7c09e5b7ccc2c4ca7e \
>                      file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90f=
b0e09 \
>                      file://src/main.c;beginline=3D1;endline=3D24;md5=3D9=
bc54b93cd7e17bf03f52513f39f926e"
>  DEPENDS =3D "udev libusb dbus-glib glib-2.0 libcheck readline"
> +PROVIDES +=3D "virtual/bluez"
> +RPROVIDES_${PN} =3D "virtual/bluez"
> =20
>  RCONFLICTS_${PN} =3D "bluez4"
> =20
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes=
-connectivity/connman/connman.inc
> index 12f3edd..a66c524 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -41,7 +41,7 @@ PACKAGECONFIG ??=3D "wispr \
>  # PACKAGECONFIG_append_pn-connman =3D " openvpn vpnc l2tp pptp"
> =20
>  PACKAGECONFIG[wifi] =3D "--enable-wifi, --disable-wifi, wpa-supplicant"
> -PACKAGECONFIG[bluetooth] =3D "--enable-bluetooth, --disable-bluetooth, b=
luez4"
> +PACKAGECONFIG[bluetooth] =3D "--enable-bluetooth, --disable-bluetooth, v=
irtual/bluez"
>  PACKAGECONFIG[3g] =3D "--enable-ofono, --disable-ofono, ofono"
>  PACKAGECONFIG[tist] =3D "--enable-tist,--disable-tist,"
>  PACKAGECONFIG[openvpn] =3D "--enable-openvpn --with-openvpn=3D${sbindir}=
/openvpn,--disable-openvpn,,openvpn"
> @@ -114,7 +114,7 @@ RPROVIDES_${PN} =3D "\
> =20
>  RDEPENDS_${PN} =3D "\
>  	dbus \
> -	${@base_contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '', d)} \
> +	${@base_contains('PACKAGECONFIG', 'bluetooth', 'virtual/bluez', '', d)}=
 \
>  	${@base_contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '', d)} \
>  	${@base_contains('PACKAGECONFIG', '3g','ofono', '', d)} \
>  	xuser-account \
> diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes=
-connectivity/libpcap/libpcap.inc
> index 3a08afe..3a67ecc 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap.inc
> +++ b/meta/recipes-connectivity/libpcap/libpcap.inc
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1d4b03665579=
51c84a94fabe3529f867 \
>  DEPENDS =3D "flex-native bison-native libnl"
> =20
>  PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'b=
luetooth', '', d)}"
> -PACKAGECONFIG[bluetooth] =3D "--enable-bluetooth,--disable-bluetooth,blu=
ez4"
> +PACKAGECONFIG[bluetooth] =3D "--enable-bluetooth,--disable-bluetooth,vir=
tual/bluez"
>  PACKAGECONFIG[canusb] =3D "--enable-canusb,--enable-canusb=3Dno,libusb"
> =20
>  INC_PR =3D "r5"
> diff --git a/meta/recipes-connectivity/neard/neard.inc b/meta/recipes-con=
nectivity/neard/neard.inc
> index 7cccbdc..1d27c10 100644
> --- a/meta/recipes-connectivity/neard/neard.inc
> +++ b/meta/recipes-connectivity/neard/neard.inc
> @@ -47,7 +47,7 @@ RDEPENDS_${PN} =3D "dbus python python-dbus python-pygo=
bject"
> =20
>  # Bluez & Wifi are not mandatory except for handover
>  RRECOMMENDS_${PN} =3D "\
> -                     ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'b=
luez4', '', d)} \
> +                     ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'v=
irtual/bluez', '', d)} \
>                       ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-sup=
plicant', '', d)} \
>                      "
> =20
> diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-con=
nectivity/ofono/ofono.inc
> index 3972e06..ff34265 100644
> --- a/meta/recipes-connectivity/ofono/ofono.inc
> +++ b/meta/recipes-connectivity/ofono/ofono.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539fee=
f013de476e68b5c50a \
> =20
>  inherit autotools pkgconfig update-rc.d systemd
> =20
> -DEPENDS  =3D "dbus glib-2.0 udev mobile-broadband-provider-info ${@base_=
contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)}"
> +DEPENDS  =3D "dbus glib-2.0 udev mobile-broadband-provider-info ${@base_=
contains('DISTRO_FEATURES', 'bluetooth','virtual/bluez', '', d)}"
> =20
>  INITSCRIPT_NAME =3D "ofono"
>  INITSCRIPT_PARAMS =3D "defaults 22"
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/=
recipes-core/packagegroups/packagegroup-base.bb
> index eee8bd9..e9e46f4 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -210,7 +210,7 @@ RRECOMMENDS_packagegroup-base-pcmcia =3D "\
> =20
>  SUMMARY_packagegroup-base-bluetooth =3D "Bluetooth support"
>  RDEPENDS_packagegroup-base-bluetooth =3D "\
> -    bluez4 \
> +    virtual/bluez \
>      ${@base_contains('COMBINED_FEATURES', 'alsa', 'libasound-module-blue=
z', '',d)} \
>      "
> =20
> diff --git a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc b=
/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> index 416e05d..e1a520a 100644
> --- a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> +++ b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> @@ -3,7 +3,7 @@ SDK-GMAE =3D " \
>      dbus-glib-dev \
>      gtk+-dev \
>      gstreamer-dev \
> -    bluez4-dev \
> +    virtual/bluez-dev \
>      gconf-dev \
>      avahi-dev \
>      telepathy-glib-dev \
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_g=
it.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
> index e1a5904..8f37be8 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
> @@ -11,7 +11,7 @@ S =3D "${WORKDIR}/git"
> =20
>  SRCREV =3D "6e5db57d2446a753aaa76bee268e1f95600b14ce"
> =20
> -PACKAGECONFIG[bluez] =3D "--enable-bluez,--disable-bluez,bluez4"
> +PACKAGECONFIG[bluez] =3D "--enable-bluez,--disable-bluez,virtual/bluez"
>  PACKAGECONFIG[sbc] =3D "--enable-sbc,--disable-sbc,sbc"
>  PACKAGECONFIG[hls] =3D "--enable-hls,--disable-hls,gnutls"
> =20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
> index bb13f4b..e4e058f 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -36,7 +36,7 @@ PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES'=
, 'bluetooth', 'bluez', '',
>                     ${@base_contains('DISTRO_FEATURES', 'systemd', 'syste=
md', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avah=
i', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '',=
 d)}"
> -PACKAGECONFIG[bluez] =3D "--enable-bluez,--disable-bluez,bluez4 sbc"
> +PACKAGECONFIG[bluez] =3D "--enable-bluez,--disable-bluez,virtual/bluez s=
bc"
>  PACKAGECONFIG[gtk] =3D "--enable-gtk3,--disable-gtk3,gtk+3"
>  PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd"
>  PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,virtual/libx11 libxts=
t libice libsm libxcb"
> diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/=
qt4/qt-mobility_1.2.0.inc
> index 062702f..ef3f08d 100644
> --- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> +++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> @@ -3,7 +3,7 @@ DEPENDS =3D "gstreamer util-linux"
> =20
>  PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'pulseaudio', '=
pulseaudio', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'blu=
etooth', '', d)}"
> -PACKAGECONFIG[bluetooth] =3D ",,bluez4"
> +PACKAGECONFIG[bluetooth] =3D ",,virtual/bluez"
>  PACKAGECONFIG[pulseaudio] =3D ",,pulseaudio"
> =20
>  LICENSE =3D "LGPLv2.1"
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Ycz6tD7Th1CMF4v7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJyEOkACgkQN1Ujt2V2gBwtHQCfROCd91YQjdjCtkVWAAvZTW7D
O8wAn3By6uDexJhs8OioVQQBmb4u4r3e
=WFx4
-----END PGP SIGNATURE-----

--Ycz6tD7Th1CMF4v7--
