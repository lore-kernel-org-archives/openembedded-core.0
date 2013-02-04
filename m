Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U2OH5-0005rp-6T
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 16:48:25 +0100
Received: by mail-pa0-f53.google.com with SMTP id bg4so3373146pad.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 07:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=gqY6GgdwIrqQpF9EiIhTSqDllYE1nXoJTIwi+Ce5nGc=;
	b=AUX+U+Cyx/adutTw8iG24sKrQYGInqkxE2ptBZ6x+VoMhOHLjNHVnFsSrRZ2spfbef
	aN9W8vTBWqfrgr3Uol4384wst5oyCUSp/Pkxk4xoxwHXXsv8iJa7V7GE3ty2gHXwjqN3
	618857fqY/qg3EKr6+Kv/aX55S37d3hSPbuTyo428+QY7BYhSj1WAabzQzKUwsKbe0v7
	ttCmh0GHVePAvMi4Qu9lhW9qxg8T2IiWavafggAUMZvx4+MUQ5kmL5tLi1BFJuNMzokF
	s66Wwyai0leuPNlGETILVVtMGryx1DUEAWVx5hqHXBa/P49GXjKUqcecloouZeND1p8b
	ekWA==
X-Received: by 10.66.81.68 with SMTP id y4mr53914528pax.66.1359991928299;
	Mon, 04 Feb 2013 07:32:08 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id k7sm8851037paz.13.2013.02.04.07.32.05
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 07:32:07 -0800 (PST)
Date: Mon, 4 Feb 2013 15:31:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
Message-ID: <20130204143157.GB3271@jama>
References: <1359990723-21304-1-git-send-email-constantinx.musca@intel.com>
MIME-Version: 1.0
In-Reply-To: <1359990723-21304-1-git-send-email-constantinx.musca@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5] netbase: split up in netbase and init-ifupdown
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
X-List-Received-Date: Mon, 04 Feb 2013 15:48:26 -0000
X-Groupsio-MsgNum: 34938
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Content-Disposition: inline

--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 04, 2013 at 05:12:03PM +0200, Constantin Musca wrote:
> - netbase should only include etc-rpc, etc-protocols, etc-services
> and the hosts file
> - the init script/configuration files should be in another package
> (init-ifupdown)
>=20
> [YOCTO #2486]
>=20
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>  meta/conf/layer.conf                               |  1 +
>  .../init-ifupdown/init-ifupdown-1.0/copyright      | 11 ++++++
>  .../init-ifupdown-1.0}/init                        |  0
>  .../init-ifupdown-1.0}/interfaces                  |  0
>  .../init-ifupdown-1.0}/nfsroot                     |  0
>  .../init-ifupdown-1.0}/qemuarm/interfaces          |  0
>  .../init-ifupdown-1.0}/qemuarmv6/interfaces        |  0
>  .../init-ifupdown-1.0}/qemuarmv7/interfaces        |  0
>  .../init-ifupdown-1.0}/qemumips/interfaces         |  0
>  .../init-ifupdown-1.0}/qemumips64/interfaces       |  0
>  .../init-ifupdown-1.0}/qemuppc/interfaces          |  0
>  .../init-ifupdown-1.0}/qemush4/interfaces          |  0
>  .../init-ifupdown-1.0}/qemux86-64/interfaces       |  0
>  .../init-ifupdown-1.0}/qemux86/interfaces          |  0
>  .../init-ifupdown/init-ifupdown_1.0.bb             | 42 ++++++++++++++++=
++++++
>  meta/recipes-core/netbase/netbase_5.0.bb           | 32 +++--------------
>  .../packagegroups/packagegroup-core-boot.bb        |  3 +-
>  17 files changed, 60 insertions(+), 29 deletions(-)
>  create mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/cop=
yright
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
> index 0000000..f0ee793
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
> +		   ${D}${sysconfdir}/network/if-pre-up.d \
> +		   ${D}${sysconfdir}/network/if-up.d \
> +		   ${D}${sysconfdir}/network/if-down.d \
> +		   ${D}${sysconfdir}/network/if-post-down.d
> +	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/networking
> +	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfa=
ces
> +	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre-up.d
> +

This recipe should be MACHINE_ARCH or use:
+}
=20
+PACKAGE_ARCH_qemuall =3D "${MACHINE_ARCH}"
+do_install_append_qemuall () {

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
> +RDEPENDS_${PN} =3D "netbase"
> +RCONFLICTS_${PN} =3D "netbase (< 1:5.0)"
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
> --=20
> 1.7.11.7
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEPxl0ACgkQN1Ujt2V2gByj9ACgjMRmMhV9T1yh0TfJd0LQAiSH
SvcAoIrEfBY5XUxFwJXneY9MdSSouANx
=70oq
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
