Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5B8CD6D12B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 09:34:33 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id c13so1859752eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2013 02:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=S/N+zhrkZOyP3ZWZGLwqs528bZhNvm7+cW/RTBM68Gs=;
	b=OyJ/Dw/X6BxK45nPWZADGHBF6ijq0PTlWEhL3AgFdKc+7RvhRpEJxR/iTGQFJzCHV5
	Yx2NyuATuk1QyBdQZXvu6ilCuj896dwUBWlspWh8YxANm3QiTnkpoP1qzXgzyqisfvi/
	fycNu6lJlWRsFA1nANR6cqgJQaBIUdCKzBCQ7RH62bojAekIcBYHNJ5Rz4TsjlDJqg/r
	+simBrxwODVYzZwFGbGCkzY1IAelxTP/67knxzqe69CZJabFSlzStgknjgpsgtuW4W2C
	nvveTmLRh0bBHgGDv1vHJiUSNBjHIWCfY/Av2JWAOVKgRVmRlH4dh/Zc1tZNbyFt1adc
	Q6yQ==
X-Received: by 10.14.176.195 with SMTP id b43mr575173eem.141.1383298474207;
	Fri, 01 Nov 2013 02:34:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id b42sm5424117eem.9.2013.11.01.02.34.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2013 02:34:33 -0700 (PDT)
Date: Fri, 1 Nov 2013 10:34:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: rongqing.li@windriver.com
Message-ID: <20131101093436.GN32015@jama>
References: <1383293368-23915-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1383293368-23915-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bluez: declaration of virtual/bluez and VIRTUAL-RUNTIME_bluez
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
X-List-Received-Date: Fri, 01 Nov 2013 09:34:34 -0000
X-Groupsio-MsgNum: 46492
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0aF+6pWUK5w8WdCh"
Content-Disposition: inline

--0aF+6pWUK5w8WdCh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2013 at 04:09:28PM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> We have two version bluez, declare virtual/bluez and VIRTUAL-RUNTIME_bluez
> to switch them easily, and set the preferred provider for bluez as bluez4

+1

I agree that some apps aren't compatible with both versions now, but
this gives easy way to switch between them for DISTRO which cares only
about apps which are compatible with bluez5 already.

BTW: Have someone tried upgrade path on target from bluez4 to bluez5?
I know we discussed it at lengths before bluez5 was merged, but don't
know if someone really tested it.

> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta/conf/distro/include/default-providers.inc                    |    5=
 ++---
>  meta/recipes-connectivity/bluez/bluez4.inc                        |    1=
 +
>  meta/recipes-connectivity/bluez5/bluez5.inc                       |    1=
 +
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
>  12 files changed, 14 insertions(+), 13 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/d=
istro/include/default-providers.inc
> index d4b9db0..0ec4cd9 100644
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
> @@ -21,6 +22,7 @@ PREFERRED_PROVIDER_xf86-video-intel ?=3D "xf86-video-in=
tel"
>  VIRTUAL-RUNTIME_update-alternatives ?=3D "update-alternatives-cworth"
>  VIRTUAL-RUNTIME_apm ?=3D "apm"
>  VIRTUAL-RUNTIME_alsa-state ?=3D "alsa-state"
> +VIRTUAL-RUNTIME_bluez ?=3D "bluez4"
> =20
>  #
>  # Default recipe providers
> @@ -40,6 +42,3 @@ PREFERRED_PROVIDER_console-tools ?=3D "kbd"
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
> index e4f6834..c0babc6 100644
> --- a/meta/recipes-connectivity/bluez/bluez4.inc
> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff8=
7c09e5b7ccc2c4ca7e \
>                      file://sbc/sbc.c;beginline=3D1;endline=3D25;md5=3D1a=
40781ed30d50d8639323a184aeb191"
>  DEPENDS =3D "udev libusb dbus-glib glib-2.0 libcheck readline"
>  RDEPENDS_${PN}-dev =3D "bluez-hcidump"
> +PROVIDES +=3D "virtual/bluez"
> =20
>  PACKAGECONFIG ??=3D "\
>      ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index 2e25d86..b3ab131 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff8=
7c09e5b7ccc2c4ca7e \
>                      file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90f=
b0e09 \
>                      file://src/main.c;beginline=3D1;endline=3D24;md5=3D9=
bc54b93cd7e17bf03f52513f39f926e"
>  DEPENDS =3D "udev libusb dbus-glib glib-2.0 libcheck readline"
> +PROVIDES +=3D "virtual/bluez"
> =20
>  RCONFLICTS_${PN} =3D "bluez4"
> =20
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes=
-connectivity/connman/connman.inc
> index c2d71e0..8641415 100644
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
> @@ -118,7 +118,7 @@ RPROVIDES_${PN} =3D "\
> =20
>  RDEPENDS_${PN} =3D "\
>  	dbus \
> -	${@base_contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '', d)} \
> +	${@base_contains('PACKAGECONFIG', 'bluetooth', '${VIRTUAL-RUNTIME_bluez=
}', '', d)} \
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
> index eee8bd9..a63ce73 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -210,7 +210,7 @@ RRECOMMENDS_packagegroup-base-pcmcia =3D "\
> =20
>  SUMMARY_packagegroup-base-bluetooth =3D "Bluetooth support"
>  RDEPENDS_packagegroup-base-bluetooth =3D "\
> -    bluez4 \
> +    ${VIRTUAL-RUNTIME_bluez} \
>      ${@base_contains('COMBINED_FEATURES', 'alsa', 'libasound-module-blue=
z', '',d)} \
>      "
> =20
> diff --git a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc b=
/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> index 416e05d..75c92e2 100644
> --- a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> +++ b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> @@ -3,7 +3,7 @@ SDK-GMAE =3D " \
>      dbus-glib-dev \
>      gtk+-dev \
>      gstreamer-dev \
> -    bluez4-dev \
> +    ${VIRTUAL-RUNTIME_bluez}-dev \
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

--0aF+6pWUK5w8WdCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJzdawACgkQN1Ujt2V2gBxgpACfWX/KIBhzW6boc/GXhDBp29yl
nMgAn04EzvwpvDSCEnW2njqRnyBBJqK/
=CcP3
-----END PGP SIGNATURE-----

--0aF+6pWUK5w8WdCh--
