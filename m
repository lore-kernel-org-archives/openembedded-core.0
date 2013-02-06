Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1U34Pf-0005r7-HS; Wed, 06 Feb 2013 13:47:44 +0100
Received: by mail-da0-f46.google.com with SMTP id p5so631225dak.5
	for <multiple recipients>; Wed, 06 Feb 2013 04:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Dm4OYeMGJGQ02uCidO3S0aY6IrZjisPws+3vLQK9TEI=;
	b=vDdq0IlGbwlRVnXA3Zw1/dBzjrXihmvwiSvIQiIs9KdMUIK/nAIp7oadtBN0c7niFf
	cnHM0VriFqqRbg/dKjPTfTiSuFwXdO1EA+krDzsG+yXDwxPcm+E6sW7kHFCX4FXvWSX5
	QDYi+diho9+UU/KcihtF17Umr1Vj/hEnkWNbvxk3/OM4Iyd/n5LElMouqfnSUqDRUedx
	07fiAo/iTOMu1HqnNndOb774xqMX+gi9o2w/77EHBaKrDhHRH77scsOsiKa9tyZ2Rj3O
	lk+QkV+G6RIvMJzehqf+eIK8Gr5v1wixYGXorRYpPBzwuSMOnq8zcUGbsUVS/4/3EJwo
	VH/A==
X-Received: by 10.66.82.67 with SMTP id g3mr74827850pay.58.1360153911375;
	Wed, 06 Feb 2013 04:31:51 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t6sm37416043paz.11.2013.02.06.04.31.48
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 04:31:50 -0800 (PST)
Date: Wed, 6 Feb 2013 13:31:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130206123142.GU3271@jama>
References: <20130206093805.8625720BD@opal>
MIME-Version: 1.0
In-Reply-To: <20130206093805.8625720BD@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Constantin Musca : netbase: split up in netbase and init-ifupdown
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
X-List-Received-Date: Wed, 06 Feb 2013 12:47:46 -0000
X-Groupsio-MsgNum: 35096
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+bDoS+V4AJZnUgoC"
Content-Disposition: inline

--+bDoS+V4AJZnUgoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2013 at 09:38:05AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 5ce5c3d1226d4a8a4997c63acc1b1b125770d005
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D5ce5c3d1226d4a8a4997c63acc1b1b125770d005
>=20
> Author: Constantin Musca <constantinx.musca@intel.com>
> Date:   Mon Feb  4 19:13:20 2013 +0200
>=20
> netbase: split up in netbase and init-ifupdown
>=20
> - netbase should only include etc-rpc, etc-protocols, etc-services
> and the hosts file
> - the init script/configuration files should be in another package
> (init-ifupdown)
>=20
> [YOCTO #2486]
>=20
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/conf/layer.conf                               |    1 +
>  .../init-ifupdown/init-ifupdown-1.0/copyright      |   11 ++++++
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
>  .../init-ifupdown/init-ifupdown_1.0.bb             |   39 ++++++++++++++=
++++++
>  meta/recipes-core/netbase/netbase_5.0.bb           |   32 ++------------=
--
>  .../packagegroups/packagegroup-core-boot.bb        |    3 +-
>  17 files changed, 57 insertions(+), 29 deletions(-)
>=20
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 3259e5c..6e5cd0c 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -22,6 +22,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>    shadow-securetty \
>    opkg-config-base \
>    netbase \
> +  init-ifupdown \
>    connman-conf \
>    formfactor \
>    xserver-xf86-config \
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
> index 0000000..7bc7058
> --- /dev/null
> +++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> @@ -0,0 +1,39 @@
> +SUMMARY =3D "Basic TCP/IP networking init scripts and configuration file=
s"
> +DESCRIPTION =3D "This package provides high level tools to configure net=
work interfaces"
> +HOMEPAGE =3D "http://packages.debian.org/ifupdown"
> +SECTION =3D "base"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/copyright;md5=3D3dd6192d306f582d=
ee7687da3d8748ab"
> +PR =3D "r0"
> +
> +inherit update-rc.d
> +
> +INITSCRIPT_NAME =3D "networking"
> +INITSCRIPT_PARAMS =3D "start 40 S . stop 40 0 6 1 ."
> +
> +SRC_URI =3D "file://copyright \
> +           file://init \
> +           file://interfaces \
> +           file://nfsroot"
> +
> +do_install () {
> +	install -d ${D}${sysconfdir}/init.d \
> +			${D}${sysconfdir}/network/if-pre-up.d \
> +			${D}${sysconfdir}/network/if-up.d \
> +			${D}${sysconfdir}/network/if-down.d \
> +			${D}${sysconfdir}/network/if-post-down.d
> +	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/networking
> +	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfa=
ces
> +	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre-up.d
> +}
> +
> +do_install_append_qemuall () {
> +	# Disable network manager on machines that commonly do NFS booting
> +	touch ${D}${sysconfdir}/network/nm-disabled-eth0
> +}
> +
> +PACKAGE_ARCH_qemuall =3D "${MACHINE_ARCH}"
> +RDEPENDS_${PN} =3D "netbase"
> +RCONFLICTS_${PN} =3D "netbase (< 1:5.0)"

do_rootfs failed with this:
| Collected errors:
|  * check_conflicts_for: The following packages conflict with
init-ifupdown:
|  * check_conflicts_for:       netbase *
|  * opkg_install_cmd: Cannot install package packagegroup-core-boot.

> +
> +CONFFILES_${PN} =3D "${sysconfdir}/network/interfaces"
> diff --git a/meta/recipes-core/netbase/netbase_5.0.bb b/meta/recipes-core=
/netbase/netbase_5.0.bb
> index 3aea874..03fdc38 100644
> --- a/meta/recipes-core/netbase/netbase_5.0.bb
> +++ b/meta/recipes-core/netbase/netbase_5.0.bb
> @@ -5,44 +5,20 @@ SECTION =3D "base"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3D3dd6192d306f582dee76=
87da3d8748ab"
>  PR =3D "r0"
> -
> -inherit update-rc.d
> -
> -INITSCRIPT_NAME =3D "networking"
> -INITSCRIPT_PARAMS =3D "start 40 S . stop 40 0 6 1 ."
> +PE =3D "1"
> =20
>  SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
> -           file://init \
> -           file://hosts \
> -           file://interfaces \
> -           file://nfsroot"
> +           file://hosts"
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
> +	install -d ${D}/${mandir}/man8 ${D}${sysconfdir}
>  	install -m 0644 ${WORKDIR}/hosts ${D}${sysconfdir}/hosts
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
> =20
> -CONFFILES_${PN} =3D "${sysconfdir}/hosts ${sysconfdir}/network/interface=
s"
> +CONFFILES_${PN} =3D "${sysconfdir}/hosts"
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/=
meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> index edb9e74..b9183a8 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> @@ -6,7 +6,7 @@ SUMMARY =3D "Minimal boot requirements"
>  DESCRIPTION =3D "The minimal set of packages required to boot the system"
>  LICENSE =3D "MIT"
>  DEPENDS =3D "virtual/kernel"
> -PR =3D "r10"
> +PR =3D "r11"
> =20
>  inherit packagegroup
> =20
> @@ -38,6 +38,7 @@ RDEPENDS_${PN} =3D "\
>      ${@base_contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_=
keymaps}", "", d)} \
>      modutils-initscripts \
>      netbase \
> +    init-ifupdown \
>      ${VIRTUAL-RUNTIME_login_manager} \
>      ${VIRTUAL-RUNTIME_init_manager} \
>      ${VIRTUAL-RUNTIME_initscripts} \
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+bDoS+V4AJZnUgoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlESTS4ACgkQN1Ujt2V2gBxI0QCeNyjfBAfN9Pin4OqJ1DOESU3y
QqgAnisuwCfglIXHdmwNDPabblIqOgHR
=4BTA
-----END PGP SIGNATURE-----

--+bDoS+V4AJZnUgoC--
