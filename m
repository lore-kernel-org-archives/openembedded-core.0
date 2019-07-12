Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7D0637F0D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 07:55:38 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id z1so8865592wru.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 00:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=t3nEIHdI3FzlOqkuhCZCcPltJHzrf7Gh+rQa51iLoY8=;
	b=HsV3DbE1RzA+ZfsIV53i3ctJIBZy6Ee2JOIuv3HpvOwlWCXjaSBGZgkqeqnFf7UVGJ
	6h/QGLDfmWkNgxuqxDmcn+F+HA0u/6h0zRTuQ/YW57ftHL7f++NBVLSLLHHLeuotI+rN
	ARruhn+2KQjgFqIGFIEfC3Zf/uHri3qhTPBnhNvGQuglZoNDLPj9t4LEDqnMNrTznagX
	P5CIDq/Tt6ML5blEXi39IGj0bzRpVlgm/ANpeHIVtg24uSfP94IRfdPJ2nulqnyJfWxE
	VfDyggBIwyxl3kX7aoPFrm7Cownb9Qybe1wGf5q+2Nfvh9GYWfmSk9Wtx4dfjf2NoDFb
	ITfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=t3nEIHdI3FzlOqkuhCZCcPltJHzrf7Gh+rQa51iLoY8=;
	b=DMVbFdDO+2jqTJHF3CW6ZohEtwK5OpZGh77BGQNzD6iKR1HT2cB/iBJLHxYPsDWKqd
	P/17s6MmwT2nQ0d5bM+dDcugTAcXWOiRZ2vxMYL1MBeqosQ0rKRlnlHYjqrvycueWeAP
	3yTlZFLmC/wZcDOf9MzgMi5C0lLn7HLHDYihNO5ScxYzwzwboY96PI7ed74zkS6fhomt
	SLZ9YCik3hco/CtRQu0XKQ7Q/BYqy5NCa3jBHHMcRHceC1Tzrm/qihvGl8wmsZk3QCuR
	k0xnIhadRhakyPfXR5XgtHmgiQJ+40np1NLKFEnZue0HPjxd57k8AtDwGrUBhEHOYpLI
	1spw==
X-Gm-Message-State: APjAAAW+y+0jJxyijfVqhPhnHiomT0foE/deJxF4vdCTkJTYFoLiG+dQ
	xYFAIyMTGcFma8mMSXkww7kMxeEx
X-Google-Smtp-Source: APXvYqzG2aqlrKCiAXAVAt9YMDhVxz/H9LAiAj559uS7TcYNxxADby0YEsfHpKxdDGIe3fAZp6xLQQ==
X-Received: by 2002:a5d:518f:: with SMTP id k15mr9727822wrv.321.1562918139050; 
	Fri, 12 Jul 2019 00:55:39 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	u13sm7917630wrq.62.2019.07.12.00.55.37
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 00:55:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 12 Jul 2019 09:55:47 +0200
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190712075547.GA1468@jama>
References: <20190712074813.15131-1-bunk@stusta.de>
MIME-Version: 1.0
In-Reply-To: <20190712074813.15131-1-bunk@stusta.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Remove remnants of bluez4 support
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
X-List-Received-Date: Fri, 12 Jul 2019 07:55:38 -0000
X-Groupsio-MsgNum: 126751
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2019 at 10:48:13AM +0300, Adrian Bunk wrote:
> bluez4 was removed from meta-oe 2 years ago.
>=20
> Simplfy the setup of the two level bluetooth and bluez4/bluez5
> distro features by removing the bluez4/bluez5 distro features.
>=20
> This also removes the no longer required bluetooth class.
>=20
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
> Documentation changes will be sent separately.
> Users in meta-openembedded have already been fixed.
> ---
>  meta/classes/bluetooth.bbclass                     | 14 --------------
>  meta/conf/bitbake.conf                             |  2 +-
>  meta/conf/distro/include/default-providers.inc     |  2 +-
>  meta/recipes-connectivity/bluez5/bluez5_5.50.bb    |  2 --
>  meta/recipes-connectivity/connman/connman.inc      |  4 ++--
>  meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb |  4 ++--
>  meta/recipes-connectivity/neard/neard_0.16.bb      |  4 ++--
>  meta/recipes-connectivity/ofono/ofono.inc          |  4 ++--
>  .../packagegroups/packagegroup-base.bb             |  4 +---
>  meta/recipes-devtools/qemu/qemu.inc                |  4 ++--
>  meta/recipes-devtools/strace/strace_4.26.bb        |  4 ++--
>  .../gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb   |  4 ++--
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  5 ++---
>  13 files changed, 19 insertions(+), 38 deletions(-)
>  delete mode 100644 meta/classes/bluetooth.bbclass
>=20
> diff --git a/meta/classes/bluetooth.bbclass b/meta/classes/bluetooth.bbcl=
ass
> deleted file mode 100644
> index f88b4ae5b8..0000000000
> --- a/meta/classes/bluetooth.bbclass
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -# Avoid code duplication in bluetooth-dependent recipes.
> -
> -# Define a variable that expands to the recipe (package) providing core
> -# bluetooth support on the platform:
> -# "" if bluetooth is not in DISTRO_FEATURES
> -# else "bluez5" if bluez5 is in DISTRO_FEATURES
> -# else "bluez4"
> -
> -# Use this with:
> -#  inherit bluetooth
> -#  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetoo=
th', '${BLUEZ}', '', d)}
> -#  PACKAGECONFIG[bluez4] =3D "--enable-bluez4,--disable-bluez4,bluez4"
> -
> -BLUEZ ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', bb.util=
s.contains('DISTRO_FEATURES', 'bluez5', 'bluez5', 'bluez4', d), '', d)}"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 5e93f5c223..140f45b895 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -839,7 +839,7 @@ DISTRO_FEATURES_NATIVESDK ?=3D "x11"
>  DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation"
>  DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation"
> =20
> -DISTRO_FEATURES_BACKFILL =3D "pulseaudio sysvinit bluez5 gobject-introsp=
ection-data ldconfig"
> +DISTRO_FEATURES_BACKFILL =3D "pulseaudio sysvinit gobject-introspection-=
data ldconfig"
>  MACHINE_FEATURES_BACKFILL =3D "rtc qemu-usermode"
> =20
>  COMBINED_FEATURES =3D "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MAC=
HINE_FEATURES', d)}"
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/d=
istro/include/default-providers.inc
> index 2be3378773..7d3be8f4e1 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -44,7 +44,7 @@ PREFERRED_PROVIDER_nativesdk-opkg ?=3D "nativesdk-opkg"
>  PREFERRED_PROVIDER_console-tools ?=3D "kbd"
>  PREFERRED_PROVIDER_gzip-native ?=3D "pigz-native"
>  PREFERRED_PROVIDER_udev ?=3D "${@bb.utils.contains('DISTRO_FEATURES','sy=
stemd','systemd','eudev',d)}"
> -PREFERRED_RPROVIDER_bluez-hcidump ?=3D "${@bb.utils.contains('DISTRO_FEA=
TURES','bluetooth bluez5','bluez5','bluez-hcidump',d)}"
> +PREFERRED_RPROVIDER_bluez-hcidump ?=3D "${@bb.utils.contains('DISTRO_FEA=
TURES','bluetooth','bluez5','bluez-hcidump',d)}"

Is this still needed?

With all remnants of bluez4 gone, bluez-hcidump is probably rprovided
only by bluez5 now.

>  # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/lt=
p-ddt_0.0.4.bb
>  PREFERRED_PROVIDER_ltp ?=3D "ltp"
>  PREFERRED_PROVIDER_getopt ?=3D "util-linux-getopt"
> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.50.bb b/meta/recip=
es-connectivity/bluez5/bluez5_5.50.bb
> index 66271432fe..4e443e5fb0 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5_5.50.bb
> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.50.bb
> @@ -1,7 +1,5 @@
>  require bluez5.inc
> =20
> -REQUIRED_DISTRO_FEATURES =3D "bluez5"
> -
>  SRC_URI[md5sum] =3D "8e35c67c81a55d3ad4c9f22280dae178"
>  SRC_URI[sha256sum] =3D "5ffcaae18bbb6155f1591be8c24898dc12f062075a40b538=
b745bfd477481911"
> =20
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes=
-connectivity/connman/connman.inc
> index ae67079c71..ee00479926 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -13,7 +13,7 @@ LICENSE  =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4c=
a7e \
>                      file://src/main.c;beginline=3D1;endline=3D20;md5=3D4=
86a279a6ab0c8d152bcda3a5b5edc36"
> =20
> -inherit autotools pkgconfig systemd update-rc.d bluetooth update-alterna=
tives
> +inherit autotools pkgconfig systemd update-rc.d update-alternatives
> =20
>  DEPENDS  =3D "dbus glib-2.0 ppp readline"
> =20
> @@ -42,7 +42,7 @@ PACKAGECONFIG ??=3D "wispr \
> =20
>  PACKAGECONFIG[systemd] =3D "--with-systemdunitdir=3D${systemd_unitdir}/s=
ystem/ --with-tmpfilesdir=3D${sysconfdir}/tmpfiles.d/,--with-systemdunitdir=
=3D'' --with-tmpfilesdir=3D''"
>  PACKAGECONFIG[wifi] =3D "--enable-wifi, --disable-wifi, wpa-supplicant, =
wpa-supplicant"
> -PACKAGECONFIG[bluez] =3D "--enable-bluetooth, --disable-bluetooth, ${BLU=
EZ}, ${BLUEZ}"
> +PACKAGECONFIG[bluez] =3D "--enable-bluetooth, --disable-bluetooth, bluez=
5, bluez5"
>  PACKAGECONFIG[3g] =3D "--enable-ofono, --disable-ofono, ofono, ofono"
>  PACKAGECONFIG[tist] =3D "--enable-tist,--disable-tist,"
>  PACKAGECONFIG[openvpn] =3D "--enable-openvpn --with-openvpn=3D${sbindir}=
/openvpn,--disable-openvpn,,openvpn"
> diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb b/meta/re=
cipes-connectivity/libpcap/libpcap_1.9.0.bb
> index 78361561e6..77bc31af7e 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
> +++ b/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
> @@ -16,7 +16,7 @@ SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.=
gz \
>  SRC_URI[md5sum] =3D "dffd65cb14406ab9841f421732eb0f33"
>  SRC_URI[sha256sum] =3D "2edb88808e5913fdaa8e9c1fcaf272e19b2485338742b507=
4b9fe44d68f37019"
> =20
> -inherit autotools binconfig-disabled pkgconfig bluetooth
> +inherit autotools binconfig-disabled pkgconfig
> =20
>  BINCONFIG =3D "${bindir}/pcap-config"
> =20
> @@ -29,7 +29,7 @@ EXTRA_OECONF =3D " \
>                   "
>  EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
> =20
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, '${BLUEZ}', '', d)} \
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, 'bluez5', '', d)} \
>                     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
>  "
>  PACKAGECONFIG[bluez5] =3D "--enable-bluetooth,--disable-bluetooth,bluez5"
> diff --git a/meta/recipes-connectivity/neard/neard_0.16.bb b/meta/recipes=
-connectivity/neard/neard_0.16.bb
> index cc6af4e1ca..7c124a3c0b 100644
> --- a/meta/recipes-connectivity/neard/neard_0.16.bb
> +++ b/meta/recipes-connectivity/neard/neard_0.16.bb
> @@ -18,7 +18,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1f=
f87c09e5b7ccc2c4ca7e \
>   file://src/near.h;beginline=3D1;endline=3D20;md5=3D358e4deefef251a4761e=
1ffacc965d13 \
>   "
> =20
> -inherit autotools pkgconfig systemd update-rc.d bluetooth
> +inherit autotools pkgconfig systemd update-rc.d
> =20
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
> =20
> @@ -40,7 +40,7 @@ RDEPENDS_${PN} =3D "dbus"
> =20
>  # Bluez & Wifi are not mandatory except for handover
>  RRECOMMENDS_${PN} =3D "\
> -                     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, '${BLUEZ}', '', d)} \
> +                     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, 'bluez5', '', d)} \
>                       ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wpa=
-supplicant', '', d)} \
>                      "
> =20
> diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-con=
nectivity/ofono/ofono.inc
> index e1185c6e6b..03d0fd53a6 100644
> --- a/meta/recipes-connectivity/ofono/ofono.inc
> +++ b/meta/recipes-connectivity/ofono/ofono.inc
> @@ -5,7 +5,7 @@ LICENSE  =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a \
>                      file://src/ofono.h;beginline=3D1;endline=3D20;md5=3D=
3ce17d5978ef3445def265b98899c2ee"
> =20
> -inherit autotools pkgconfig update-rc.d systemd bluetooth gobject-intros=
pection-data
> +inherit autotools pkgconfig update-rc.d systemd gobject-introspection-da=
ta
> =20
>  DEPENDS  =3D "dbus glib-2.0 udev mobile-broadband-provider-info ell"
> =20
> @@ -17,7 +17,7 @@ PACKAGECONFIG ??=3D "\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)=
} \
>      "
>  PACKAGECONFIG[systemd] =3D "--with-systemdunitdir=3D${systemd_unitdir}/s=
ystem/,--with-systemdunitdir=3D"
> -PACKAGECONFIG[bluez] =3D "--enable-bluetooth, --disable-bluetooth, ${BLU=
EZ}"
> +PACKAGECONFIG[bluez] =3D "--enable-bluetooth, --disable-bluetooth, bluez=
5"
> =20
>  EXTRA_OECONF +=3D "--enable-test --enable-external-ell"
> =20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/=
recipes-core/packagegroups/packagegroup-base.bb
> index d05403635c..1f802da09b 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -7,7 +7,6 @@ PR =3D "r83"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
>  inherit packagegroup
> -inherit bluetooth
> =20
>  PROVIDES =3D "${PACKAGES}"
>  PACKAGES =3D ' \
> @@ -199,8 +198,7 @@ RRECOMMENDS_packagegroup-base-pcmcia =3D "\
> =20
>  SUMMARY_packagegroup-base-bluetooth =3D "Bluetooth support"
>  RDEPENDS_packagegroup-base-bluetooth =3D "\
> -    ${BLUEZ} \
> -    ${@bb.utils.contains('COMBINED_FEATURES', 'alsa', bb.utils.contains(=
'BLUEZ', 'bluez4', 'libasound-module-bluez', '', d), '',d)} \
> +    bluez5 \
>      "
> =20
>  RRECOMMENDS_packagegroup-base-bluetooth =3D "\
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index ac475a8e2a..32379708e4 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -5,7 +5,7 @@ LICENSE =3D "GPLv2 & LGPLv2.1"
>  RDEPENDS_${PN}-ptest =3D "bash make"
> =20
>  require qemu-targets.inc
> -inherit pkgconfig bluetooth ptest
> +inherit pkgconfig ptest
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a72f=
bac \
>                      file://COPYING.LIB;endline=3D24;md5=3D8c5efda6cf1e1b=
03dcfd0e6c0d271c7f"
> @@ -148,7 +148,7 @@ PACKAGECONFIG[lzo] =3D "--enable-lzo,--disable-lzo,lz=
o"
>  PACKAGECONFIG[numa] =3D "--enable-numa,--disable-numa,numactl"
>  PACKAGECONFIG[gnutls] =3D "--enable-gnutls,--disable-gnutls,gnutls"
>  PACKAGECONFIG[bzip2] =3D "--enable-bzip2,--disable-bzip2,bzip2"
> -PACKAGECONFIG[bluez] =3D "--enable-bluez,--disable-bluez,${BLUEZ}"
> +PACKAGECONFIG[bluez] =3D "--enable-bluez,--disable-bluez,bluez5"
>  PACKAGECONFIG[libiscsi] =3D "--enable-libiscsi,--disable-libiscsi"
>  PACKAGECONFIG[kvm] =3D "--enable-kvm,--disable-kvm"
>  PACKAGECONFIG[virglrenderer] =3D "--enable-virglrenderer,--disable-virgl=
renderer,virglrenderer"
> diff --git a/meta/recipes-devtools/strace/strace_4.26.bb b/meta/recipes-d=
evtools/strace/strace_4.26.bb
> index 3b61fc3eef..2688724e66 100644
> --- a/meta/recipes-devtools/strace/strace_4.26.bb
> +++ b/meta/recipes-devtools/strace/strace_4.26.bb
> @@ -20,13 +20,13 @@ SRC_URI =3D "https://strace.io/files/${PV}/strace-${P=
V}.tar.xz \
>  SRC_URI[md5sum] =3D "daa51acc0c7c696221ec03cf0b30a7af"
>  SRC_URI[sha256sum] =3D "7c4d2ffeef4f7d1cdc71062ca78d1130eb52f947c2fca82f=
59f6a1183bfa1e1c"
> =20
> -inherit autotools ptest bluetooth
> +inherit autotools ptest
> =20
>  PACKAGECONFIG_class-target ??=3D "\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)=
} \
>  "
> =20
> -PACKAGECONFIG[bluez] =3D "ac_cv_header_bluetooth_bluetooth_h=3Dyes,ac_cv=
_header_bluetooth_bluetooth_h=3Dno,${BLUEZ}"
> +PACKAGECONFIG[bluez] =3D "ac_cv_header_bluetooth_bluetooth_h=3Dyes,ac_cv=
_header_bluetooth_bluetooth_h=3Dno,bluez5"
>  PACKAGECONFIG[libunwind] =3D "--with-libunwind,--without-libunwind,libun=
wind"
> =20
>  EXTRA_OECONF +=3D "--enable-mpers=3Dno"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1=
=2E16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.1=
6.0.bb
> index 5af01a37ce..f9289e92d2 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb
> @@ -19,7 +19,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D73a5855a8119=
deb017f5f13cf327095d \
> =20
>  DEPENDS +=3D "gstreamer1.0-plugins-base"
> =20
> -inherit gettext bluetooth gobject-introspection
> +inherit gettext gobject-introspection
> =20
>  PACKAGECONFIG ??=3D " \
>      ${GSTREAMER_ORC} \
> @@ -35,7 +35,7 @@ PACKAGECONFIG ??=3D " \
>  # not add GL dependencies here, since these are taken care of in -base.
> =20
>  PACKAGECONFIG[assrender]       =3D "--enable-assrender,--disable-assrend=
er,libass"
> -PACKAGECONFIG[bluez]           =3D "--enable-bluez,--disable-bluez,${BLU=
EZ}"
> +PACKAGECONFIG[bluez]           =3D "--enable-bluez,--disable-bluez,bluez=
5"
>  PACKAGECONFIG[bz2]             =3D "--enable-bz2,--disable-bz2,bzip2"
>  PACKAGECONFIG[curl]            =3D "--enable-curl,--disable-curl,curl"
>  PACKAGECONFIG[dash]            =3D "--enable-dash,--disable-dash,libxml2"
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
> index 9a95e7c65b..e245be7f77 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -61,7 +61,7 @@ DEPENDS =3D "libatomic-ops libsndfile1 libtool intltool=
-native"
>  DEPENDS +=3D "udev alsa-lib glib-2.0"
>  DEPENDS +=3D "speexdsp libxml-parser-perl-native libcap"
> =20
> -inherit autotools bash-completion pkgconfig useradd gettext perlnative b=
luetooth systemd manpages gsettings
> +inherit autotools bash-completion pkgconfig useradd gettext perlnative s=
ystemd manpages gsettings
> =20
>  # *.desktop rules wont be generated during configure and build will fail
>  # if using --disable-nls
> @@ -98,7 +98,7 @@ EXTRA_OECONF +=3D "--without-fftw"
>  # very good anyway, better alternatives exist (such as the webrtc cancel=
ler).
>  EXTRA_OECONF +=3D "--disable-adrian-aec"
> =20
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, '${BLUEZ}', '', d)} \
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth'=
, 'bluez5', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '=
avahi', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', '3g', 'ofono'=
, '', d)} \
>                     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd x=
11', d)} \
> @@ -106,7 +106,6 @@ PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEA=
TURES', 'bluetooth', '${BLUEZ
>                     "
> =20
>  PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,dbus"
> -PACKAGECONFIG[bluez4] =3D "--enable-bluez4,--disable-bluez4,bluez4 sbc"
>  PACKAGECONFIG[bluez5] =3D "--enable-bluez5,--disable-bluez5,bluez5 sbc"
>  PACKAGECONFIG[gconf] =3D "--enable-gconf,--disable-gconf,gconf"
>  PACKAGECONFIG[gsettings] =3D "--enable-gsettings,--disable-gsettings,gli=
b-2.0-native glib-2.0"
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXSg9AgAKCRA3VSO3ZXaA
HDWMAJ91wa+S8m47e+mBdCE8IrYFLck5pQCdFlEGFbrfKHl+hPI5QwxV4Mgjra8=
=7c7r
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
