Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id B575E6AE86;
	Wed, 24 Jul 2013 11:32:49 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id l10so172282eei.16
	for <multiple recipients>; Wed, 24 Jul 2013 04:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yfUNk4Z8uCtXKa/JgLQMlRkpf4Lso1pLbv3ycFnouxI=;
	b=sr830D7phVduhU3eYejpwn1cDC5XB+TRG/Z00oUWZD6y5oP+n/UFyErfsz0O4+43vL
	1ZaxpuIHigZDrcEb4aAJQjNkVZvQ9qAAHXItHvKtBHmMaxo8HRZGfzcvEWZQQb1Yrj5M
	8VA2rRenAYWUkuvjvkdoUuSraxxV9NSKnDyMluLBisg7fNBTx5+VRbCLkmsHmAtE/59N
	A2mulCbZ/0wyBxkTDyJQwLJHmVcQ6LT0bU+98X794zJ2H4OxFajWzOoOGyjuXbxKJ6Kc
	b2OPChm2rb7UH4STDTggWHHrg02/JlMc2iZRvmGQnacwB6rpRoe+XOzbmP/0Rm2ZfvSs
	GvQA==
X-Received: by 10.15.35.129 with SMTP id g1mr37439452eev.2.1374665569698;
	Wed, 24 Jul 2013 04:32:49 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bj46sm65410496eeb.13.2013.07.24.04.32.48 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 04:32:49 -0700 (PDT)
Date: Wed, 24 Jul 2013 13:33:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20130724113311.GE4136@jama>
References: <20130718201834.CB5765038D@opal>
MIME-Version: 1.0
In-Reply-To: <20130718201834.CB5765038D@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : bluez5: new package for v5.7
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
X-List-Received-Date: Wed, 24 Jul 2013 11:32:50 -0000
X-Groupsio-MsgNum: 42362
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ytoMbUMiTKPMT3hY"
Content-Disposition: inline

--ytoMbUMiTKPMT3hY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2013 at 08:18:34PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 5d55498be84a6a8725794f75f4d12336048cdc34
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D5d55498be84a6a8725794f75f4d12336048cdc34
>=20
> Author: Cristian Iorga <cristian.iorga@intel.com>
> Date:   Tue Jul 16 18:26:01 2013 +0300
>=20
> bluez5: new package for v5.7
>=20
> - bluez5 does not replace bluez4
> - bluez5 is integrated with systemd
> - RCONFLICTS bluez4
> - add readline dependency

They are providing the same package for runtime:
NOTE: multiple providers are available for runtime libasound-module-bluez (=
bluez4, bluez5)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libasound-modul=
e-bluez

Please fix that.

>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  .../bluez5/bluez5-5.7/bluetooth.conf               |   16 +++++
>  meta/recipes-connectivity/bluez5/bluez5.inc        |   68 ++++++++++++++=
++++++
>  meta/recipes-connectivity/bluez5/bluez5_5.7.bb     |    5 ++
>  3 files changed, 89 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5-5.7/bluetooth.conf b=
/meta/recipes-connectivity/bluez5/bluez5-5.7/bluetooth.conf
> new file mode 100644
> index 0000000..ca5e9e4
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5-5.7/bluetooth.conf
> @@ -0,0 +1,16 @@
> +<!-- This configuration file specifies the required security policies
> +     for Bluetooth core daemon to work. -->
> +
> +<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration =
1.0//EN"
> + "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
> +<busconfig>
> +
> +  <!-- ../system.conf have denied everything, so we just punch some hole=
s -->
> +
> +  <policy context=3D"default">
> +    <allow own=3D"org.bluez"/>
> +    <allow send_destination=3D"org.bluez"/>
> +    <allow send_interface=3D"org.bluez.Agent"/>
> +  </policy>
> +
> +</busconfig>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> new file mode 100644
> index 0000000..fc78900
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -0,0 +1,68 @@
> +SUMMARY =3D "Linux Bluetooth Stack Userland V5"
> +DESCRIPTION =3D "Linux Bluetooth stack V5 userland components.  These in=
clude a system configurations, daemons, tools and system libraries."
> +HOMEPAGE =3D "http://www.bluez.org"
> +SECTION =3D "libs"
> +LICENSE =3D "GPLv2+ & LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4c=
a7e \
> +                    file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90f=
b0e09 \
> +                    file://src/main.c;beginline=3D1;endline=3D24;md5=3D9=
bc54b93cd7e17bf03f52513f39f926e"
> +DEPENDS =3D "udev libusb dbus-glib glib-2.0 libcheck libical readline"
> +
> +RCONFLICTS_${PN} =3D "bluez4"
> +
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa',=
 '', d)}"
> +PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
> +
> +SRC_URI =3D "\
> +    ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
> +    file://bluetooth.conf \
> +"
> +S =3D "${WORKDIR}/bluez-${PV}"
> +
> +inherit autotools pkgconfig systemd
> +
> +EXTRA_OECONF =3D "\
> +  --disable-gstreamer \
> +  --enable-usb \
> +  --enable-tools \
> +  --enable-bccmd \
> +  --enable-hid2hci \
> +  --enable-dfutool \
> +  --disable-hidd \
> +  --disable-pand \
> +  --disable-dund \
> +  --disable-cups \
> +  --enable-test \
> +  --enable-datafiles \
> +  ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=
=3D${systemd_unitdir}/system/', '--disable-systemd', d)} \
> +"
> +
> +do_install_append() {
> +	install -d ${D}${sysconfdir}/bluetooth/
> +	install -m 0644 ${S}/profiles/audio/audio.conf ${D}/${sysconfdir}/bluet=
ooth/
> +	install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/b=
luetooth/
> +	install -m 0644 ${S}/profiles/input/input.conf ${D}/${sysconfdir}/bluet=
ooth/
> +	# at_console doesn't really work with the current state of OE, so punch=
 some more holes so people can actually use BT
> +	install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/sys=
tem.d/
> +}
> +
> +ALLOW_EMPTY_libasound-module-bluez =3D "1"
> +PACKAGES =3D+ "libasound-module-bluez ${PN}-test"
> +
> +FILES_libasound-module-bluez =3D "${libdir}/alsa-lib/lib*.so ${datadir}/=
alsa"
> +FILES_${PN} +=3D "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugin=
s/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}=
/ ${datadir}/dbus-1"
> +FILES_${PN}-dev +=3D "\
> +  ${libdir}/bluetooth/plugins/*.la \
> +  ${libdir}/alsa-lib/*.la \
> +"
> +
> +FILES_${PN}-test =3D "${libdir}/bluez/test/*"
> +
> +FILES_${PN}-dbg +=3D "\
> +  ${libdir}/${BPN}/bluetooth/.debug \
> +  ${libdir}/bluetooth/plugins/.debug \
> +  ${libdir}/*/.debug \
> +  */udev/.debug \
> +  "
> +
> +SYSTEMD_SERVICE_${PN} =3D "bluetooth.service"
> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.7.bb b/meta/recipe=
s-connectivity/bluez5/bluez5_5.7.bb
> new file mode 100644
> index 0000000..6e2850d
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.7.bb
> @@ -0,0 +1,5 @@
> +require bluez5.inc
> +
> +SRC_URI[md5sum] =3D "ce0ef43938e8bfc230f3f06d6ad02d7e"
> +SRC_URI[sha256sum] =3D "902299204b7139c913765603c7054a604570aea9e9fddb30=
454bd1b5e5997860"
> +
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ytoMbUMiTKPMT3hY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHvu3cACgkQN1Ujt2V2gBzeFQCgtnp3Pv0/0fo4UD01KYfebtSp
BSkAoIT+BkfDoDrKOUl6UV64Lvy6Cic5
=9/v0
-----END PGP SIGNATURE-----

--ytoMbUMiTKPMT3hY--
