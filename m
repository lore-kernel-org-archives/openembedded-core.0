Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UFJkc-0007Ej-NU
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 08:36:04 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Mar 2013 00:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,827,1355126400"; 
	d="scan'208,217";a="299808066"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by orsmga002.jf.intel.com with ESMTP; 12 Mar 2013 00:19:17 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Tue, 12 Mar 2013 07:19:15 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.244]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.185]) with mapi id
	14.01.0355.002; Tue, 12 Mar 2013 07:19:15 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH 2/2] bluez5: new package for v5.3
Thread-Index: AQHOHmBCa5eBsG0HEUSbvhgxUuKykpihoeuAgAADQ3A=
Date: Tue, 12 Mar 2013 07:19:14 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16215DC9@IRSMSX102.ger.corp.intel.com>
References: <1363010209-18220-1-git-send-email-cristian.iorga@intel.com>
	<1363010209-18220-3-git-send-email-cristian.iorga@intel.com>
	<20130312070053.GE9724@jama.dyndns-home.com>
In-Reply-To: <20130312070053.GE9724@jama.dyndns-home.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] bluez5: new package for v5.3
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
X-List-Received-Date: Tue, 12 Mar 2013 07:36:16 -0000
X-List-Received-Date: Tue, 12 Mar 2013 07:36:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Martin,

By bluez5 does not replace bluez4, I meant: "in Yocto Project case".

At the moment, bluez5 is not a replacement for bluez4.
And it is not also an upgrade path at the moment.

An user having bluez5 is supposed to not include in the target bluez4.
That's why I said the recipe/package is experimental. It does not help the =
user make the switch.

Quote: " Why not move to bluez PN and set R* variables to do the switch on =
target?"

Can you please provide more details? I do not understand your proposal, sor=
ry.

Regards,
Cristian

P.S.: A "Hi Cristian, " in the beginning would be nice, also. Thanks.

-----Original Message-----
From: Martin Jansa [mailto:martin.jansa@gmail.com]=20
Sent: Tuesday, March 12, 2013 9:01 AM
To: Iorga, Cristian
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] bluez5: new package for v5.3

On Mon, Mar 11, 2013 at 03:56:49PM +0200, Cristian Iorga wrote:
> - bluez5 does not replace bluez4

And is that correct? I guess some files on target will conflict between
bluez4 and bluez5, so how is user/distro supposed to upgrade from 4 to 5?

Why not move to bluez PN and set R* variables to do the switch on target?

> - bluez5 is integrated with systemd
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  .../bluez5/bluez5-5.3/bluetooth.conf               |   16 +++++++
>  .../bluez5/bluez5-5.3/fix-udev-paths.patch         |   35 ++++++++++++++=
+
>  meta/recipes-connectivity/bluez5/bluez5.inc        |   45 ++++++++++++++=
++++++
>  meta/recipes-connectivity/bluez5/bluez5_5.3.bb     |   35 ++++++++++++++=
+
>  4 files changed, 131 insertions(+)
>  create mode 100644=20
> meta/recipes-connectivity/bluez5/bluez5-5.3/bluetooth.conf
>  create mode 100644=20
> meta/recipes-connectivity/bluez5/bluez5-5.3/fix-udev-paths.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5.inc
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.3.bb
>=20
> diff --git=20
> a/meta/recipes-connectivity/bluez5/bluez5-5.3/bluetooth.conf=20
> b/meta/recipes-connectivity/bluez5/bluez5-5.3/bluetooth.conf
> new file mode 100644
> index 0000000..ca5e9e4
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5-5.3/bluetooth.conf
> @@ -0,0 +1,16 @@
> +<!-- This configuration file specifies the required security policies
> +     for Bluetooth core daemon to work. -->
> +
> +<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration =
1.0//EN"
> + "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
> +<busconfig>
> +
> +  <!-- ../system.conf have denied everything, so we just punch some=20
> + holes -->
> +
> +  <policy context=3D"default">
> +    <allow own=3D"org.bluez"/>
> +    <allow send_destination=3D"org.bluez"/>
> +    <allow send_interface=3D"org.bluez.Agent"/>
> +  </policy>
> +
> +</busconfig>
> diff --git=20
> a/meta/recipes-connectivity/bluez5/bluez5-5.3/fix-udev-paths.patch=20
> b/meta/recipes-connectivity/bluez5/bluez5-5.3/fix-udev-paths.patch
> new file mode 100644
> index 0000000..37362f5
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5-5.3/fix-udev-paths.patch
> @@ -0,0 +1,35 @@
> +Add udevdir/udevrulesdir options
> +
> +Upstream-Status: Inappropriate [configuration]
> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> +Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> +
> +Index: bluez-5.0/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bluez-5.0.orig/Makefile.am	2012-12-24 19:46:54.000000000 +0200
> ++++ bluez-5.0/Makefile.am	2013-01-30 14:33:15.760615474 +0200
> +@@ -175,7 +175,7 @@
> + include Makefile.obexd
> +=20
> + if HID2HCI
> +-rulesdir =3D @UDEV_DIR@/rules.d
> ++rulesdir =3D @UDEV_RULES_DIR@
> +=20
> + rules_DATA =3D tools/97-hid2hci.rules
> +=20
> +Index: bluez-5.0/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- bluez-5.0.orig/configure.ac	2012-12-24 19:46:54.000000000 +0200
> ++++ bluez-5.0/configure.ac	2013-01-30 14:34:59.068613895 +0200
> +@@ -160,6 +160,11 @@
> + 	AC_SUBST(UDEV_DIR, [${path_udevdir}])  fi
> +=20
> ++AC_ARG_WITH([udevrulesdir],
> ++    AS_HELP_STRING([--with-udevrulesdir=3DDIR], [udev rules directory])=
,
> ++    [], [with_udevrulesdir=3D/lib/udev/rules.d])
> ++AC_SUBST([UDEV_RULES_DIR], [$with_udevrulesdir])
> ++
> + AM_CONDITIONAL(HID2HCI, test "${enable_tools}" !=3D "no" &&
> + 		test "${enable_udev}" !=3D "no" && test "${enable_usb}" !=3D "no")
> +=20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc=20
> b/meta/recipes-connectivity/bluez5/bluez5.inc
> new file mode 100644
> index 0000000..db9c766
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -0,0 +1,45 @@
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
> +DEPENDS =3D "udev libusb dbus-glib glib-2.0 libcheck libical"
> +
> +PACKAGECONFIG ??=3D "\
> +    ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
> +    ${@base_contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\ "
> +PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
> +PACKAGECONFIG[pie] =3D "--enable-pie,--disable-pie,"
> +
> +ASNEEDED =3D ""
> +
> +SRC_URI =3D "\
> +  ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \ "
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
> +  --with-udevdir=3D${base_libdir}/udev \
> +  --with-udevrulesdir=3D${nonarch_base_libdir}/udev/rules.d \
> +  ${@base_contains('DISTRO_FEATURES', 'systemd',=20
> +'--with-systemdunitdir=3D${systemd_unitdir}/system/', '--disable-systemd=
', d)} \ "
> +
> +SYSTEMD_SERVICE_${PN} =3D "bluetooth.service"
> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.3.bb=20
> b/meta/recipes-connectivity/bluez5/bluez5_5.3.bb
> new file mode 100644
> index 0000000..311562f
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.3.bb
> @@ -0,0 +1,35 @@
> +require bluez5.inc
> +
> +SRC_URI +=3D "file://bluetooth.conf \
> +            file://fix-udev-paths.patch"
> +
> +SRC_URI[md5sum] =3D "44de20f6422bf90a01b8df48e7dfe4ed"
> +SRC_URI[sha256sum] =3D "828e2cd1109835c2fc1d731fb7fd7b46951044e451cc8556=
a37e1312d8c8c9a6"
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
> +	install -m 0644 ${WORKDIR}/bluetooth.conf=20
> +${D}/${sysconfdir}/dbus-1/system.d/
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
> +  ${libdir}/${PN}/bluetooth/.debug \
> +  ${libdir}/bluetooth/plugins/.debug \
> +  ${libdir}/*/.debug \
> +  ${base_libdir}/udev/.debug \
> +  "
> --
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


