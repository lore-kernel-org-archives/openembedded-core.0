Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TDZkT-0002JB-2p
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 13:44:21 +0200
Received: by bkcik5 with SMTP id ik5so2273470bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 04:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Che7Z7+z+vBcQUPqC1Zah9mWCsfV923v6GBcM/1enf8=;
	b=hrQq4lg5wJYsPvF7G18ffdTzm5SJNHO6ttL9UhdDCECWES4gTACiJYfQxY7IUSDpY/
	1tUrZQyClmhDxRMWAfJgKGo/uNwBIK2rcaopp5XH2dgsG2QQvRhYcRu4mRqa9HpQCVxe
	BFh51ZNnsOL239GpQCHE4jRfwZoO5VTpN/oIkVN9bbTPTBWHu3MLiCFv9ccVgKYnbrf+
	Dr0V0NuS94leqlkAt+jdr3oINJlSH9sd2xdAb5ukTO54WSiCVfyvPKvKxj5yQkTuQxdf
	HBUx9veaztCpyUFRQD1ZVTbRD+m8MAJoHuPIzrezIAnNo8+tHCCDFxZdYsqTdZ0UOkPL
	wGXg==
Received: by 10.204.130.197 with SMTP id u5mr1014591bks.100.1347881502471;
	Mon, 17 Sep 2012 04:31:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m9sm5166579bkm.10.2012.09.17.04.31.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 04:31:40 -0700 (PDT)
Date: Mon, 17 Sep 2012 13:31:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
Message-ID: <20120917113147.GB17748@jama.jama.net>
References: <1347877929-15603-1-git-send-email-constantinx.musca@intel.com>
MIME-Version: 1.0
In-Reply-To: <1347877929-15603-1-git-send-email-constantinx.musca@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] netbase: split up in netbase and init-ifupdown
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
X-List-Received-Date: Mon, 17 Sep 2012 11:44:21 -0000
X-Groupsio-MsgNum: 29379
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Content-Disposition: inline

--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 17, 2012 at 01:32:09PM +0300, Constantin Musca wrote:
> - netbase should only include etc-rpc, etc-protocols and etc-services
> - the init script/configuration files should be in another package
> (init-ifupdown)
>=20
> [YOCTO #2486]
>=20
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>  meta/conf/layer.conf                               |    1 +
>  .../init-ifupdown/init-ifupdown-1.0/copyright      |   11 +++++
>  .../init-ifupdown-1.0}/hosts                       |    0
>  .../init-ifupdown-1.0}/init                        |    0
>  .../init-ifupdown-1.0}/interfaces                  |    0
>  .../init-ifupdown-1.0}/nfsroot                     |    0
>  .../init-ifupdown-1.0}/qemuarm/interfaces          |    0
>  .../init-ifupdown-1.0}/qemuarmv6/interfaces        |    0
>  .../init-ifupdown-1.0}/qemuarmv7/interfaces        |    0
>  .../init-ifupdown-1.0}/qemumips/interfaces         |    0
>  .../init-ifupdown-1.0}/qemumips64/interfaces       |    0
>  .../init-ifupdown-1.0}/qemuppc/interfaces          |    0
>  .../init-ifupdown-1.0}/qemush4/interfaces          |    0
>  .../init-ifupdown-1.0}/qemux86-64/interfaces       |    0
>  .../init-ifupdown-1.0}/qemux86/interfaces          |    0
>  .../init-ifupdown/init-ifupdown_1.0.bb             |   42 ++++++++++++++=
++++++
>  meta/recipes-core/netbase/netbase_5.0.bb           |   35 ++------------=
--
>  .../packagegroups/packagegroup-core-boot.bb        |    1 +
>  18 files changed, 58 insertions(+), 32 deletions(-)
>  create mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/cop=
yright
>  rename meta/recipes-core/{netbase/netbase-5.0 =3D> init-ifupdown/init-if=
updown-1.0}/hosts (100%)
>  rename meta/recipes-core/{netbase/netbase-5.0 =3D> init-ifupdown/init-if=
updown-1.0}/init (100%)
>  rename meta/recipes-core/{netbase/netbase-5.0 =3D> init-ifupdown/init-if=
updown-1.0}/interfaces (100%)
>  rename meta/recipes-core/{netbase/netbase-5.0 =3D> init-ifupdown/init-if=
updown-1.0}/nfsroot (100%)
>  rename meta/recipes-core/{netbase/netbase-5.0 =3D> init-ifupdown/init-if=
updown-1.0}/qemuarm/interfaces (100%)
>  rename meta/recipes-core/{netbase/netbase-5.0 =3D> init-ifupdown/init-if=
updown-1.0}/qemuarmv6/interfaces (100%)
>  rename meta/recipes-core/{netbase/netbase-5.0 =3D> init-ifupdown/init-if=
updown-1.0}/qemuarmv7/interfaces (100%)
>  rename meta/recipes-core/{netbase/netbase-5.0 =3D> init-ifupdown/init-if=
updown-1.0}/qemumips/interfaces (100%)
>  rename meta/recipes-core/{netbase/netbase-5.0 =3D> init-ifupdown/init-if=
updown-1.0}/qemumips64/interfaces (100%)
>  rename meta/recipes-core/{netbase/netbase-5.0 =3D> init-ifupdown/init-if=
updown-1.0}/qemuppc/interfaces (100%)
>  rename meta/recipes-core/{netbase/netbase-5.0 =3D> init-ifupdown/init-if=
updown-1.0}/qemush4/interfaces (100%)
>  rename meta/recipes-core/{netbase/netbase-5.0 =3D> init-ifupdown/init-if=
updown-1.0}/qemux86-64/interfaces (100%)
>  rename meta/recipes-core/{netbase/netbase-5.0 =3D> init-ifupdown/init-if=
updown-1.0}/qemux86/interfaces (100%)
>  create mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
>=20
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index ed50f1c..1308077 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -18,6 +18,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>    shadow-securetty \
>    opkg-config-base \
>    netbase \
> +  init-ifupdown \
>    formfactor \
>    xserver-xf86-config \
>    pointercal \
> diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/copyright =
b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/copyright
> new file mode 100644
> index 0000000..2a8e0d1
> --- /dev/null
> +++ b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/copyright
> @@ -0,0 +1,11 @@
> +This package was created by Peter Tobias tobias@et-inf.fho-emden.de on
> +Wed, 24 Aug 1994 21:33:28 +0200 and maintained by Anthony Towns
> +<ajt@debian.org> until 2001.
> +It is currently maintained by Marco d'Itri <md@linux.it>.
> +
> +Copyright 1994-2010 Peter Tobias, Anthony Towns and Marco d'Itri
> +
> +The programs in this package are distributed under the terms of the GNU
> +General Public License, version 2 as distributed by the Free Software
> +Foundation. On Debian systems, a copy of this license may be found in
> +/usr/share/common-licenses/GPL-2.
> diff --git a/meta/recipes-core/netbase/netbase-5.0/hosts b/meta/recipes-c=
ore/init-ifupdown/init-ifupdown-1.0/hosts
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/hosts
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/hosts
> diff --git a/meta/recipes-core/netbase/netbase-5.0/init b/meta/recipes-co=
re/init-ifupdown/init-ifupdown-1.0/init
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/init
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/init
> diff --git a/meta/recipes-core/netbase/netbase-5.0/interfaces b/meta/reci=
pes-core/init-ifupdown/init-ifupdown-1.0/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/interfaces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/nfsroot b/meta/recipes=
-core/init-ifupdown/init-ifupdown-1.0/nfsroot
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/nfsroot
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/nfsroot
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemuarm/interfaces b/m=
eta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarm/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemuarm/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarm/inter=
faces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemuarmv6/interfaces b=
/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv6/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemuarmv6/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv6/int=
erfaces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemuarmv7/interfaces b=
/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv7/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemuarmv7/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv7/int=
erfaces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemumips/interfaces b/=
meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemumips/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips/inte=
rfaces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemumips64/interfaces =
b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips64/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemumips64/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips64/in=
terfaces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemuppc/interfaces b/m=
eta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuppc/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemuppc/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuppc/inter=
faces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemush4/interfaces b/m=
eta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemush4/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemush4/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemush4/inter=
faces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemux86-64/interfaces =
b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86-64/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemux86-64/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86-64/in=
terfaces
> diff --git a/meta/recipes-core/netbase/netbase-5.0/qemux86/interfaces b/m=
eta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86/interfaces
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase-5.0/qemux86/interfaces
> rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86/inter=
faces
> diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/=
recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> new file mode 100644
> index 0000000..d128e8c
> --- /dev/null
> +++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> @@ -0,0 +1,42 @@
> +SUMMARY =3D "Basic TCP/IP networking init scripts and configuration file=
s"
> +DESCRIPTION =3D "This package provides high level tools to configure net=
work interfaces"
> +HOMEPAGE =3D "http://packages.debian.org/ifupdown"
> +SECTION =3D "base"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/copyright;md5=3D3dd6192d306f582d=
ee7687da3d8748ab"
> +RDEPENDS =3D "netbase"

RDEPENDS_${PN}

and

RREPLACES_${PN} but that seems to break rpm packaging (see thread about
xserver-xorg-module-exa)

> +PR =3D "r0"
> +
> +inherit update-rc.d
> +
> +INITSCRIPT_NAME =3D "networking"
> +INITSCRIPT_PARAMS =3D "start 40 S . stop 40 0 6 1 ."
> +
> +SRC_URI =3D "file://copyright \
> +           file://init \
> +           file://hosts \
> +           file://interfaces \
> +           file://nfsroot"
> +
> +do_install () {
> +	install -d ${D}${sysconfdir}/init.d \
> +		   ${D}${sysconfdir}/network/if-pre-up.d \
> +		   ${D}${sysconfdir}/network/if-up.d \
> +		   ${D}${sysconfdir}/network/if-down.d \
> +		   ${D}${sysconfdir}/network/if-post-down.d
> +	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/networking
> +	install -m 0644 ${WORKDIR}/hosts ${D}${sysconfdir}/hosts
> +	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfa=
ces
> +	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre-up.d
> +
> +	# Disable network manager on machines that commonly do NFS booting
> +	case "${MACHINE}" in
> +		"qemuarm*" | "qemux86" | "qemux86-64" | "qemumips*" | "qemuppc" | "qem=
ush*")
> +			touch ${D}${sysconfdir}/network/nm-disabled-eth0
> +			;;
> +		*)
> +			;;
> +	esac
> +}
> +
> +CONFFILES_${PN} =3D "${sysconfdir}/hosts ${sysconfdir}/network/interface=
s"
> diff --git a/meta/recipes-core/netbase/netbase_5.0.bb b/meta/recipes-core=
/netbase/netbase_5.0.bb
> index 3aea874..711a864 100644
> --- a/meta/recipes-core/netbase/netbase_5.0.bb
> +++ b/meta/recipes-core/netbase/netbase_5.0.bb
> @@ -4,45 +4,16 @@ HOMEPAGE =3D "http://packages.debian.org/netbase"
>  SECTION =3D "base"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3D3dd6192d306f582dee76=
87da3d8748ab"
> -PR =3D "r0"
> +PR =3D "r1"
> =20
> -inherit update-rc.d
> -
> -INITSCRIPT_NAME =3D "networking"
> -INITSCRIPT_PARAMS =3D "start 40 S . stop 40 0 6 1 ."
> -
> -SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
> -           file://init \
> -           file://hosts \
> -           file://interfaces \
> -           file://nfsroot"
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz"
> =20
>  SRC_URI[md5sum] =3D "a379d9199d44d817543eddc211a29b70"
>  SRC_URI[sha256sum] =3D "ac9424d3cb2bd3c07b6c5bc5875c434d3bc687a73cd7c54b=
7dc7122308afa9dc"
> =20
>  do_install () {
> -	install -d ${D}${sysconfdir}/init.d \
> -		   ${D}${mandir}/man8 \
> -		   ${D}${sysconfdir}/network/if-pre-up.d \
> -		   ${D}${sysconfdir}/network/if-up.d \
> -		   ${D}${sysconfdir}/network/if-down.d \
> -		   ${D}${sysconfdir}/network/if-post-down.d
> -	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/networking
> -	install -m 0644 ${WORKDIR}/hosts ${D}${sysconfdir}/hosts
> +	install -d ${D}/${mandir}/man8 ${D}${sysconfdir}
>  	install -m 0644 etc-rpc ${D}${sysconfdir}/rpc
>  	install -m 0644 etc-protocols ${D}${sysconfdir}/protocols
>  	install -m 0644 etc-services ${D}${sysconfdir}/services
> -	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfa=
ces
> -	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre-up.d
> -
> -	# Disable network manager on machines that commonly do NFS booting
> -	case "${MACHINE}" in
> -		"qemuarm*" | "qemux86" | "qemux86-64" | "qemumips*" | "qemuppc" | "qem=
ush*")
> -			touch ${D}${sysconfdir}/network/nm-disabled-eth0
> -			;;
> -		*)
> -			;;
> -	esac
>  }
> -
> -CONFFILES_${PN} =3D "${sysconfdir}/hosts ${sysconfdir}/network/interface=
s"
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/=
meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> index 16ad4e3..c4ee7de 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> @@ -39,6 +39,7 @@ RDEPENDS_${PN} =3D "\
>      ${@base_contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_=
keymaps}", "", d)} \
>      modutils-initscripts \
>      netbase \
> +    init-ifupdown \
>      ${VIRTUAL-RUNTIME_login_manager} \
>      ${VIRTUAL-RUNTIME_init_manager} \
>      ${VIRTUAL-RUNTIME_dev_manager} \
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBXCiMACgkQN1Ujt2V2gBzkvQCaAyWGWIuulyQDgyqVZh/Jqrwf
hYsAn2dNFRsnPOZRT8ItVp9bDFeZv4mT
=3iZJ
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--
