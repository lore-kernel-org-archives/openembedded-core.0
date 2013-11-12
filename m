Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 184966D433
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 08:49:22 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id b15so1606690eek.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 00:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JgQG6FDugTxOPkuz3d7UHjavJEwZzF9HYK0zPY6WY70=;
	b=I0EzCi4MY7lCIFkJXpxWEugFM/GZmqTzft9h3Z/qoobWmpp30TDsapq1tHW9xohHAM
	zvhgLwExyeW+0JmW8rBf3h/M9PBI4Ie3aKqdfjwTkgJmK2c4CaygDCMMe652GGQrBrtb
	IRfni1j7dUSXh24EwbPh+8LTz8C/RCLs3Xi0a5aybpQczFF1hbxbQe/EBCPodprlEMkz
	MyY6e8wSrZotRUMpWf6ubvpJ5sqWIrPcDOhf9NvisaQnbhrWPfmy61JdLFiFmy8tgEBD
	kGAowv16J95rQWaNjknlaM/sd1WEiKWJ3xIWIOM0wXnvh8cOjHi6+//EL+5nEplgvr0r
	FytQ==
X-Received: by 10.14.199.1 with SMTP id w1mr29680943een.13.1384246163966;
	Tue, 12 Nov 2013 00:49:23 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 1sm12635775eeg.4.2013.11.12.00.49.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Nov 2013 00:49:23 -0800 (PST)
Date: Tue, 12 Nov 2013 09:49:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20131112084943.GA3663@jama>
References: <1383293368-23915-1-git-send-email-rongqing.li@windriver.com>
	<20131101093436.GN32015@jama>
	<969F26A8BAB325438E7EB80D3C3134FB16CB39CA@IRSMSX105.ger.corp.intel.com>
	<528176B2.4080507@windriver.com> <528184DB.2060403@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <528184DB.2060403@linux.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 12 Nov 2013 08:49:24 -0000
X-Groupsio-MsgNum: 46898
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2013 at 05:31:07PM -0800, Saul Wold wrote:
> On 11/11/2013 04:30 PM, Rongqing Li wrote:
> >
> >
> > On 11/11/2013 05:59 PM, Iorga, Cristian wrote:
> >> Hi all,
> >>
> >> As far as I have experimented, there is no upgrade path available at
> >> the moment, due to extensive changes into the programming model for
> >> BlueZ5 vs BlueZ4.
> >> At the moment, the last single component that is not officially ready
> >> for BlueZ5 is PulseAudio.
> >> As have asked around, and PA5.0 will* support BlueZ5.
> >> PA5.0 should* be released before EoY2013.
> >> Judging by PA git log, there are extensive changes/updates in order to
> >> support BZ5.
> >>
> >> Regards,
> >> Cristian
> >
> > Thanks.
> >
> > Saul: Do you think it is ready for merge, our release needs it, thanks.
> >
>=20
> At this point, I do not think this is an approporate patch, we can't=20
> switch between bluez4 and bluez5 as Cristian points out above, they are=
=20
> just not compatible.  This is a case where we need 2 distinct versions=20
> and once the recipes/upstreams for the things that rely on bluez4 are=20
> updated to bluez5, we will cut over and then likely move the bluez4=20
> stack out of oe-core into meta-oe.

I disagree a bit here, if some distribution is using only
packagegroup-base -> bluez dependency, then this patch is useful to
allow to switch to bluez5 already with just VIRTUAL_RUNTIME change
instead of a lot longer .bbappend for packagegroup-base just to replace
bluez4 with bluez5.

If bluez4 is moved to meta-oe then there would be the same problem for
people who can need bluez4-only images where bluez4 should be pulled by
packagegroup-base.

>=20
> Sau!
>=20
> >
> > -Roy
> >
> >>
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> >> Martin Jansa
> >> Sent: Friday, November 1, 2013 11:35 AM
> >> To: rongqing.li@windriver.com
> >> Cc: openembedded-core@lists.openembedded.org
> >> Subject: Re: [OE-core] [PATCH v2] bluez: declaration of virtual/bluez
> >> and VIRTUAL-RUNTIME_bluez
> >>
> >> On Fri, Nov 01, 2013 at 04:09:28PM +0800, rongqing.li@windriver.com
> >> wrote:
> >>> From: Roy Li <rongqing.li@windriver.com>
> >>>
> >>> We have two version bluez, declare virtual/bluez and
> >>> VIRTUAL-RUNTIME_bluez to switch them easily, and set the preferred
> >>> provider for bluez as bluez4
> >>
> >> +1
> >>
> >> I agree that some apps aren't compatible with both versions now, but
> >> this gives easy way to switch between them for DISTRO which cares only
> >> about apps which are compatible with bluez5 already.
> >>
> >> BTW: Have someone tried upgrade path on target from bluez4 to bluez5?
> >> I know we discussed it at lengths before bluez5 was merged, but don't
> >> know if someone really tested it.
> >>
> >>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> >>> ---
> >>>   meta/conf/distro/include/default-providers.inc
> >>> |    5 ++---
> >>>   meta/recipes-connectivity/bluez/bluez4.inc
> >>> |    1 +
> >>>   meta/recipes-connectivity/bluez5/bluez5.inc
> >>> |    1 +
> >>>   meta/recipes-connectivity/connman/connman.inc
> >>> |    4 ++--
> >>>   meta/recipes-connectivity/libpcap/libpcap.inc
> >>> |    2 +-
> >>>   meta/recipes-connectivity/neard/neard.inc
> >>> |    2 +-
> >>>   meta/recipes-connectivity/ofono/ofono.inc
> >>> |    2 +-
> >>>   meta/recipes-core/packagegroups/packagegroup-base.bb
> >>> |    2 +-
> >>>   meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> >>> |    2 +-
> >>>   meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
> >>> |    2 +-
> >>>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> >>> |    2 +-
> >>>   meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> >>> |    2 +-
> >>>   12 files changed, 14 insertions(+), 13 deletions(-)
> >>>
> >>> diff --git a/meta/conf/distro/include/default-providers.inc
> >>> b/meta/conf/distro/include/default-providers.inc
> >>> index d4b9db0..0ec4cd9 100644
> >>> --- a/meta/conf/distro/include/default-providers.inc
> >>> +++ b/meta/conf/distro/include/default-providers.inc
> >>> @@ -14,6 +14,7 @@ PREFERRED_PROVIDER_virtual/update-alternatives ?=3D
> >>> "opkg"
> >>>   PREFERRED_PROVIDER_virtual/update-alternatives-native ?=3D "opkg-na=
tive"
> >>>   PREFERRED_PROVIDER_virtual/libx11 ?=3D "libx11"
> >>>   PREFERRED_PROVIDER_xf86-video-intel ?=3D "xf86-video-intel"
> >>> +PREFERRED_PROVIDER_virtual/bluez ?=3D "bluez4"
> >>>
> >>>   #
> >>>   # Default virtual runtime providers
> >>> @@ -21,6 +22,7 @@ PREFERRED_PROVIDER_xf86-video-intel ?=3D
> >>> "xf86-video-intel"
> >>>   VIRTUAL-RUNTIME_update-alternatives ?=3D "update-alternatives-cwort=
h"
> >>>   VIRTUAL-RUNTIME_apm ?=3D "apm"
> >>>   VIRTUAL-RUNTIME_alsa-state ?=3D "alsa-state"
> >>> +VIRTUAL-RUNTIME_bluez ?=3D "bluez4"
> >>>
> >>>   #
> >>>   # Default recipe providers
> >>> @@ -40,6 +42,3 @@ PREFERRED_PROVIDER_console-tools ?=3D "kbd"
> >>>   PREFERRED_PROVIDER_gzip-native ?=3D "pigz-native"
> >>>   PREFERRED_PROVIDER_make ?=3D "make"
> >>>   PREFERRED_PROVIDER_udev ?=3D
> >>> "${@base_contains('DISTRO_FEATURES','systemd','systemd','udev',d)}"
> >>> -# There are issues with runtime packages and PREFERRED_PROVIDER, see
> >>> YOCTO #5044 for details -# on this rather strange entry.
> >>> -PREFERRED_PROVIDER_bluez4 ?=3D "bluez4"
> >>> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc
> >>> b/meta/recipes-connectivity/bluez/bluez4.inc
> >>> index e4f6834..c0babc6 100644
> >>> --- a/meta/recipes-connectivity/bluez/bluez4.inc
> >>> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
> >>> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D
> >>> "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7e \
> >>>
> >>> file://sbc/sbc.c;beginline=3D1;endline=3D25;md5=3D1a40781ed30d50d8639=
323a184aeb191"
> >>>
> >>>   DEPENDS =3D "udev libusb dbus-glib glib-2.0 libcheck readline"
> >>>   RDEPENDS_${PN}-dev =3D "bluez-hcidump"
> >>> +PROVIDES +=3D "virtual/bluez"
> >>>
> >>>   PACKAGECONFIG ??=3D "\
> >>>       ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\ di=
ff
> >>> --git a/meta/recipes-connectivity/bluez5/bluez5.inc
> >>> b/meta/recipes-connectivity/bluez5/bluez5.inc
> >>> index 2e25d86..b3ab131 100644
> >>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> >>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> >>> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D
> >>> "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7e \
> >>>
> >>> file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90fb0e09 \
> >>>
> >>> file://src/main.c;beginline=3D1;endline=3D24;md5=3D9bc54b93cd7e17bf03=
f52513f39f926e"
> >>>
> >>>   DEPENDS =3D "udev libusb dbus-glib glib-2.0 libcheck readline"
> >>> +PROVIDES +=3D "virtual/bluez"
> >>>
> >>>   RCONFLICTS_${PN} =3D "bluez4"
> >>>
> >>> diff --git a/meta/recipes-connectivity/connman/connman.inc
> >>> b/meta/recipes-connectivity/connman/connman.inc
> >>> index c2d71e0..8641415 100644
> >>> --- a/meta/recipes-connectivity/connman/connman.inc
> >>> +++ b/meta/recipes-connectivity/connman/connman.inc
> >>> @@ -41,7 +41,7 @@ PACKAGECONFIG ??=3D "wispr \  #
> >>> PACKAGECONFIG_append_pn-connman =3D " openvpn vpnc l2tp pptp"
> >>>
> >>>   PACKAGECONFIG[wifi] =3D "--enable-wifi, --disable-wifi, wpa-supplic=
ant"
> >>> -PACKAGECONFIG[bluetooth] =3D "--enable-bluetooth, --disable-bluetoot=
h,
> >>> bluez4"
> >>> +PACKAGECONFIG[bluetooth] =3D "--enable-bluetooth, --disable-bluetoot=
h,
> >>> virtual/bluez"
> >>>   PACKAGECONFIG[3g] =3D "--enable-ofono, --disable-ofono, ofono"
> >>>   PACKAGECONFIG[tist] =3D "--enable-tist,--disable-tist,"
> >>>   PACKAGECONFIG[openvpn] =3D "--enable-openvpn
> >>> --with-openvpn=3D${sbindir}/openvpn,--disable-openvpn,,openvpn"
> >>> @@ -118,7 +118,7 @@ RPROVIDES_${PN} =3D "\
> >>>
> >>>   RDEPENDS_${PN} =3D "\
> >>>       dbus \
> >>> -    ${@base_contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '', d)}=
 \
> >>> +    ${@base_contains('PACKAGECONFIG', 'bluetooth',
> >>> +'${VIRTUAL-RUNTIME_bluez}', '', d)} \
> >>>       ${@base_contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '',
> >>> d)} \
> >>>       ${@base_contains('PACKAGECONFIG', '3g','ofono', '', d)} \
> >>>       xuser-account \
> >>> diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc
> >>> b/meta/recipes-connectivity/libpcap/libpcap.inc
> >>> index 3a08afe..3a67ecc 100644
> >>> --- a/meta/recipes-connectivity/libpcap/libpcap.inc
> >>> +++ b/meta/recipes-connectivity/libpcap/libpcap.inc
> >>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D
> >>> "file://LICENSE;md5=3D1d4b0366557951c84a94fabe3529f867 \  DEPENDS =3D
> >>> "flex-native bison-native libnl"
> >>>
> >>>   PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'bluetooth=
',
> >>> 'bluetooth', '', d)}"
> >>> -PACKAGECONFIG[bluetooth] =3D
> >>> "--enable-bluetooth,--disable-bluetooth,bluez4"
> >>> +PACKAGECONFIG[bluetooth] =3D
> >>> "--enable-bluetooth,--disable-bluetooth,virtual/bluez"
> >>>   PACKAGECONFIG[canusb] =3D "--enable-canusb,--enable-canusb=3Dno,lib=
usb"
> >>>
> >>>   INC_PR =3D "r5"
> >>> diff --git a/meta/recipes-connectivity/neard/neard.inc
> >>> b/meta/recipes-connectivity/neard/neard.inc
> >>> index 7cccbdc..1d27c10 100644
> >>> --- a/meta/recipes-connectivity/neard/neard.inc
> >>> +++ b/meta/recipes-connectivity/neard/neard.inc
> >>> @@ -47,7 +47,7 @@ RDEPENDS_${PN} =3D "dbus python python-dbus
> >>> python-pygobject"
> >>>
> >>>   # Bluez & Wifi are not mandatory except for handover
> >>> RRECOMMENDS_${PN} =3D "\
> >>> -                     ${@base_contains('DISTRO_FEATURES',
> >>> 'bluetooth', 'bluez4', '', d)} \
> >>> +                     ${@base_contains('DISTRO_FEATURES', 'bluetooth',
> >>> + 'virtual/bluez', '', d)} \
> >>>                        ${@base_contains('DISTRO_FEATURES',
> >>> 'wifi','wpa-supplicant', '', d)} \
> >>>                       "
> >>>
> >>> diff --git a/meta/recipes-connectivity/ofono/ofono.inc
> >>> b/meta/recipes-connectivity/ofono/ofono.inc
> >>> index 3972e06..ff34265 100644
> >>> --- a/meta/recipes-connectivity/ofono/ofono.inc
> >>> +++ b/meta/recipes-connectivity/ofono/ofono.inc
> >>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> >>> "file://COPYING;md5=3Deb723b61539feef013de476e68b5c50a \
> >>>
> >>>   inherit autotools pkgconfig update-rc.d systemd
> >>>
> >>> -DEPENDS  =3D "dbus glib-2.0 udev mobile-broadband-provider-info
> >>> ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)}"
> >>> +DEPENDS  =3D "dbus glib-2.0 udev mobile-broadband-provider-info
> >>> ${@base_contains('DISTRO_FEATURES', 'bluetooth','virtual/bluez', '',
> >>> d)}"
> >>>
> >>>   INITSCRIPT_NAME =3D "ofono"
> >>>   INITSCRIPT_PARAMS =3D "defaults 22"
> >>> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb
> >>> b/meta/recipes-core/packagegroups/packagegroup-base.bb
> >>> index eee8bd9..a63ce73 100644
> >>> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> >>> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> >>> @@ -210,7 +210,7 @@ RRECOMMENDS_packagegroup-base-pcmcia =3D "\
> >>>
> >>>   SUMMARY_packagegroup-base-bluetooth =3D "Bluetooth support"
> >>>   RDEPENDS_packagegroup-base-bluetooth =3D "\
> >>> -    bluez4 \
> >>> +    ${VIRTUAL-RUNTIME_bluez} \
> >>>       ${@base_contains('COMBINED_FEATURES', 'alsa',
> >>> 'libasound-module-bluez', '',d)} \
> >>>       "
> >>>
> >>> diff --git
> >>> a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> >>> b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> >>> index 416e05d..75c92e2 100644
> >>> --- a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> >>> +++ b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> >>> @@ -3,7 +3,7 @@ SDK-GMAE =3D " \
> >>>       dbus-glib-dev \
> >>>       gtk+-dev \
> >>>       gstreamer-dev \
> >>> -    bluez4-dev \
> >>> +    ${VIRTUAL-RUNTIME_bluez}-dev \
> >>>       gconf-dev \
> >>>       avahi-dev \
> >>>       telepathy-glib-dev \
> >>> diff --git
> >>> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
> >>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
> >>> index e1a5904..8f37be8 100644
> >>> ---
> >>> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
> >>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.b
> >>> +++ b
> >>> @@ -11,7 +11,7 @@ S =3D "${WORKDIR}/git"
> >>>
> >>>   SRCREV =3D "6e5db57d2446a753aaa76bee268e1f95600b14ce"
> >>>
> >>> -PACKAGECONFIG[bluez] =3D "--enable-bluez,--disable-bluez,bluez4"
> >>> +PACKAGECONFIG[bluez] =3D "--enable-bluez,--disable-bluez,virtual/blu=
ez"
> >>>   PACKAGECONFIG[sbc] =3D "--enable-sbc,--disable-sbc,sbc"
> >>>   PACKAGECONFIG[hls] =3D "--enable-hls,--disable-hls,gnutls"
> >>>
> >>> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> >>> b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> >>> index bb13f4b..e4e058f 100644
> >>> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> >>> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> >>> @@ -36,7 +36,7 @@ PACKAGECONFIG ??=3D
> >>> "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '',
> >>>                      ${@base_contains('DISTRO_FEATURES', 'systemd',
> >>> 'systemd', '', d)} \
> >>>                      ${@base_contains('DISTRO_FEATURES', 'zeroconf',
> >>> 'avahi', '', d)} \
> >>>                      ${@base_contains('DISTRO_FEATURES', 'x11',
> >>> 'x11', '', d)}"
> >>> -PACKAGECONFIG[bluez] =3D "--enable-bluez,--disable-bluez,bluez4 sbc"
> >>> +PACKAGECONFIG[bluez] =3D "--enable-bluez,--disable-bluez,virtual/blu=
ez
> >>> sbc"
> >>>   PACKAGECONFIG[gtk] =3D "--enable-gtk3,--disable-gtk3,gtk+3"
> >>>   PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,syst=
emd"
> >>>   PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,virtual/libx11
> >>> libxtst libice libsm libxcb"
> >>> diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> >>> b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> >>> index 062702f..ef3f08d 100644
> >>> --- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> >>> +++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
> >>> @@ -3,7 +3,7 @@ DEPENDS =3D "gstreamer util-linux"
> >>>
> >>>   PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES',
> >>> 'pulseaudio', 'pulseaudio', '', d)} \
> >>>                      ${@base_contains('DISTRO_FEATURES', 'bluetooth',
> >>> 'bluetooth', '', d)}"
> >>> -PACKAGECONFIG[bluetooth] =3D ",,bluez4"
> >>> +PACKAGECONFIG[bluetooth] =3D ",,virtual/bluez"
> >>>   PACKAGECONFIG[pulseaudio] =3D ",,pulseaudio"
> >>>
> >>>   LICENSE =3D "LGPLv2.1"
> >>> --
> >>> 1.7.10.4
> >>>
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKB66cACgkQN1Ujt2V2gBxNuACgqS2KKfuycjMFCAlQ40q3D1OP
1ssAnA4weF8cdNj+Rly+O/R0j06yQA8m
=NDW0
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
