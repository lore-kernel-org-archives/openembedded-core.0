Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 63DFB7F973
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 22:46:13 +0000 (UTC)
IronPort-SDR: 75WVK7Eyx8sg3rnwjkI+kz2zQ4ndiZbFzH7+cwvxVM7kpUCbuTiO9brhDQR41ODwuCJ39DR5tO
	kkLEs3+5YCi3/78rP9gE2EqD0vywNErofhw3rqeupu23aTRbVxLCfkiY7IWp70BHCuEpA4vG1b
	9JGUdtouj2r77UdUcnDT1+q66woxWvKVctj1tYp/ZygbbHBnr9/GvLrYdKPG/8ObpHT6I8Tx8k
	EocG6U5buxhAs/Abi7eoqrdACxBaotM7/mbPUjoM+d0s0DaMiCvmAuvfqQ6RKFlAgu0l3onXlo
	AZw=
X-IronPort-AV: E=Sophos;i="5.69,282,1571695200"; 
   d="scan'208";a="3293429"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Niko Mauno <niko.mauno@iki.fi>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [zeus][PATCH 1/3] iptables: Cosmetic fixes to recipe
Thread-Index: AQHVq6dma3ew1jg+CkamMKHBtseQI6esI0Og
Date: Thu, 5 Dec 2019 22:45:31 +0000
Message-ID: <f66739bfac294f33aa76aaa8b4bee7f7@XBOX03.axis.com>
References: <20191205200518.82007-1-niko.mauno@iki.fi>
In-Reply-To: <20191205200518.82007-1-niko.mauno@iki.fi>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [zeus][PATCH 1/3] iptables: Cosmetic fixes to recipe
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
X-List-Received-Date: Thu, 05 Dec 2019 22:46:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Niko Mauno
> Sent: den 5 december 2019 21:05
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [zeus][PATCH 1/3] iptables: Cosmetic fixes to recipe
>=20
> Introduce cosmetic changes to recipe content, most notably
>  - Change indentation style to four spaces in task statements

Unless I'm wrong, the standard for shell code in recipes in=20
OE-Core is still to indent using tabs. (OpenEmbedded on the=20
other hand uses four spaces for indentation also for shell=20
code.)

//Peter

>  - Reorder several entries according to oe-stylize.py suggestions
>=20
> (From OE-Core rev: c1d162b6165f11b7b5ae5c6066e7683d5e1379fc)
>=20
> Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../iptables/iptables_1.8.3.bb                | 60 +++++++++----------
>  1 file changed, 29 insertions(+), 31 deletions(-)
>=20
> diff --git a/meta/recipes-extended/iptables/iptables_1.8.3.bb
> b/meta/recipes-extended/iptables/iptables_1.8.3.bb
> index ff9fcb1b53..563c8ae354 100644
> --- a/meta/recipes-extended/iptables/iptables_1.8.3.bb
> +++ b/meta/recipes-extended/iptables/iptables_1.8.3.bb
> @@ -4,8 +4,9 @@ filtering code in Linux."
>  HOMEPAGE =3D "http://www.netfilter.org/"
>  BUGTRACKER =3D "http://bugzilla.netfilter.org/"
>  LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263\
> -
> file://iptables/iptables.c;beginline=3D13;endline=3D25;md5=3Dc5cffd099745=
58cf27d
> 0f763df2a12dc"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
> +
> file://iptables/iptables.c;beginline=3D13;endline=3D25;md5=3Dc5cffd099745=
58cf27d
> 0f763df2a12dc \
> +"
>=20
>  SRC_URI =3D "http://netfilter.org/projects/iptables/files/iptables-
> ${PV}.tar.bz2 \
>             file://0001-configure-Add-option-to-enable-disable-
> libnfnetlink.patch \
> @@ -13,16 +14,16 @@ SRC_URI =3D
> "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
>             file://iptables.service \
>             file://iptables.rules \
>  "
> -
>  SRC_URI[md5sum] =3D "29de711d15c040c402cf3038c69ff513"
>  SRC_URI[sha256sum] =3D
> "a23cac034181206b4545f4e7e730e76e08b5f3dd78771ba9645a6756de9cdd80"
>=20
> +SYSTEMD_SERVICE_${PN} =3D "iptables.service"
> +
>  inherit autotools pkgconfig systemd
>=20
>  EXTRA_OECONF =3D "--with-kernel=3D${STAGING_INCDIR}"
>=20
>  PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
> -
>  PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
>=20
>  # libnfnetlink recipe is in meta-networking layer
> @@ -32,9 +33,19 @@ PACKAGECONFIG[libnfnetlink] =3D "--enable-libnfnetlink=
,--
> disable-libnfnetlink,libn
>  PACKAGECONFIG[libnftnl] =3D "--enable-nftables,--disable-nftables,libnft=
nl"
>=20
>  do_configure_prepend() {
> -	# Remove some libtool m4 files
> -	# Keep ax_check_linker_flags.m4 which belongs to autoconf-
> archive.
> -	rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4
> ltversion.m4
> +    # Remove some libtool m4 files
> +    # Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
> +    rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4
> +}
> +
> +do_install_append() {
> +    install -d ${D}${sysconfdir}/iptables
> +    install -m 0644 ${WORKDIR}/iptables.rules ${D}${sysconfdir}/iptables
> +
> +    install -d ${D}${systemd_system_unitdir}
> +    install -m 0644 ${WORKDIR}/iptables.service
> ${D}${systemd_system_unitdir}
> +
> +    sed -i -e 's,@SBINDIR@,${sbindir},g'
> ${D}${systemd_system_unitdir}/iptables.service
>  }
>=20
>  PACKAGES +=3D "${PN}-modules"
> @@ -47,30 +58,6 @@ python populate_packages_prepend() {
>          d.appendVar('RDEPENDS_' + metapkg, ' ' + ' '.join(modules))
>  }
>=20
> -FILES_${PN} +=3D "${datadir}/xtables"
> -
> -# Include the symlinks as well in respective packages
> -FILES_${PN}-module-xt-conntrack +=3D "${libdir}/xtables/libxt_state.so"
> -FILES_${PN}-module-xt-ct +=3D "${libdir}/xtables/libxt_NOTRACK.so"
> -
> -INSANE_SKIP_${PN}-module-xt-conntrack =3D "dev-so"
> -INSANE_SKIP_${PN}-module-xt-ct =3D "dev-so"
> -
> -ALLOW_EMPTY_${PN}-modules =3D "1"
> -
> -do_install_append() {
> -
> -        install -d ${D}${sysconfdir}/iptables
> -        install -m 0644 ${WORKDIR}/iptables.rules
> ${D}${sysconfdir}/iptables
> -
> -        install -d ${D}${systemd_system_unitdir}
> -        install -m 0644 ${WORKDIR}/iptables.service
> ${D}${systemd_system_unitdir}
> -
> -	sed -i -e 's,@SBINDIR@,${sbindir},g'
> ${D}${systemd_system_unitdir}/iptables.service
> -}
> -
> -SYSTEMD_SERVICE_${PN} =3D "iptables.service"
> -
>  RDEPENDS_${PN} =3D "${PN}-module-xt-standard"
>  RRECOMMENDS_${PN} =3D " \
>      ${PN}-modules \
> @@ -84,3 +71,14 @@ RRECOMMENDS_${PN} =3D " \
>      kernel-module-nf-nat \
>      kernel-module-ipt-masquerade \
>  "
> +
> +FILES_${PN} +=3D "${datadir}/xtables"
> +
> +# Include the symlinks as well in respective packages
> +FILES_${PN}-module-xt-conntrack +=3D "${libdir}/xtables/libxt_state.so"
> +FILES_${PN}-module-xt-ct +=3D "${libdir}/xtables/libxt_NOTRACK.so"
> +
> +ALLOW_EMPTY_${PN}-modules =3D "1"
> +
> +INSANE_SKIP_${PN}-module-xt-conntrack =3D "dev-so"
> +INSANE_SKIP_${PN}-module-xt-ct =3D "dev-so"
> --
> 2.20.1


