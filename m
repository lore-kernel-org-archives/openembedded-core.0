Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U3qT0-0002G8-JJ
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 17:06:22 +0100
Received: by mail-pa0-f48.google.com with SMTP id hz10so2066127pad.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 07:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=MHMPifXGur0hcrllVSdCRgAzGtjiLurbNwOgaCC83yk=;
	b=dRfk0eBGGMm68UHGe98Riscqb86Z4feMH+8a2g0Xonj9a2kl0O90LlxVXES2wkDdup
	qPNPxU+ASP/4n7tO3bTX8Ba+sPBqQqVQ/d0HBia6ZipmoNEJiP18wOoA1lZ1xMsrpBPE
	3SS71/W6Zw+nFEJmk9V+2g0R4HQsC/ZRD7E7hgfbFQxss6m/9WM3+j81n5ShgHsztWxo
	57pReSsImTa4UalBCZ+CM0onODxVtd58l/0kpJseZErNpM8B6W2tQ5JgH/GCyA7OSHwf
	+aXS8FpbUN9nWqtTyI2MNxk7p98RbGm2nWyLeejZ7DatLfegYRpxGZ50frSWoWiPXSXC
	x/QQ==
X-Received: by 10.66.74.197 with SMTP id w5mr18349846pav.60.1360338627659;
	Fri, 08 Feb 2013 07:50:27 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t6sm55374138paz.11.2013.02.08.07.50.25
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 07:50:26 -0800 (PST)
Date: Fri, 8 Feb 2013 16:50:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: ml@communistcode.co.uk
Message-ID: <20130208155020.GN3271@jama>
References: <CAJTo0Lbf+qsJd2R_39bN2GDHZNbncKPZFa1VUQiHn7USVZy_iA@mail.gmail.com>
	<1360336833-14523-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <1360336833-14523-1-git-send-email-ml@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] packagegroup-core-boot: add VIRTUAL-RUNTIME_network_manager
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
X-List-Received-Date: Fri, 08 Feb 2013 16:06:22 -0000
X-Groupsio-MsgNum: 35228
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U7PH6YjyT5379uVx"
Content-Disposition: inline

--U7PH6YjyT5379uVx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 08, 2013 at 03:20:33PM +0000, ml@communistcode.co.uk wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>=20
> Now netbase has been split into netbase and init-ifupdown, the user should
> be able to make a choice on which network manager to install, and not be
> forced to install init-ifupdown alongside if they wish to use a vanilla c=
opy
> of packagegroup-core-boot
>=20
> v2:
> - Update packagage-core-x11-sato to use the new variable
>=20
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> ---
>  meta/recipes-core/packagegroups/packagegroup-core-boot.bb     | 3 ++-
>  meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/=
meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> index b9183a8..a714879 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> @@ -29,6 +29,7 @@ VIRTUAL-RUNTIME_login_manager ?=3D "tinylogin"
>  VIRTUAL-RUNTIME_init_manager ?=3D "${DISTRO_FEATURES_INITMAN}"
>  VIRTUAL-RUNTIME_initscripts ?=3D "${@base_contains('DISTRO_FEATURES', 's=
ysvinit', 'initscripts', '',d)}"
>  VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
> +VIRTUAL-RUNTIME_network_manager ?=3D "init-ifupdown"
> =20
>  RDEPENDS_${PN} =3D "\
>      base-files \
> @@ -38,7 +39,7 @@ RDEPENDS_${PN} =3D "\
>      ${@base_contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_=
keymaps}", "", d)} \
>      modutils-initscripts \
>      netbase \
> -    init-ifupdown \
> +    ${VIRTUAL-RUNTIME_network_manager} \
>      ${VIRTUAL-RUNTIME_login_manager} \
>      ${VIRTUAL-RUNTIME_init_manager} \
>      ${VIRTUAL-RUNTIME_initscripts} \
> diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.b=
b b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> index a4413be..7c000ab 100644
> --- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> +++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> @@ -26,6 +26,8 @@ RDEPENDS_${PN} =3D "\
>  NETWORK_MANAGER ?=3D "connman-gnome"
>  NETWORK_MANAGER_libc-uclibc =3D ""
> =20
> +VIRTUAL-RUNTIME_network_manager =3D "${NETWORK_MANAGER}"

Please use ?=3D here too

> +
>  SUMMARY_${PN}-base =3D "Sato desktop - base packages"
>  RDEPENDS_${PN}-base =3D "\
>      matchbox-desktop \
> @@ -40,7 +42,6 @@ RDEPENDS_${PN}-base =3D "\
>      gtk-sato-engine \
>      shutdown-desktop \
>      libsdl \
> -    ${NETWORK_MANAGER} \
>      "
> =20
>  # pcmanfm doesn't work on mips
> --=20
> 1.8.1.2
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--U7PH6YjyT5379uVx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEVHrwACgkQN1Ujt2V2gBwp/wCeJKFsHsQclOuCZSHs7UBOmhoz
wxYAn0gGExm0VQ7GGI7AoDDt70d1nhzy
=S3zl
-----END PGP SIGNATURE-----

--U7PH6YjyT5379uVx--
