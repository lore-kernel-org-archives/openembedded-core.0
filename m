Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TKXKl-0001Rj-23; Sat, 06 Oct 2012 18:34:35 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so1961891wgb.24
	for <multiple recipients>; Sat, 06 Oct 2012 09:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6nqIJZc9dFxe1LyhH5NIFCnCiModNpgRZtG6cTciHEc=;
	b=qO0XK+bee0PXK6bTj9LBYj2FSg4zb7/Z7L4zlzwWu1JrbIs/3W6lrhitfRfyVM9RW6
	xLqXL+eILarK8enigBVJomAOwSLmeNkihWNR87w6FqgemTIdMd86eR/oWsBDE7KIxTD+
	xOzo/vDXs3ubjm/KKfoeLfcSWjH98Q8+Sd8zVgqvMJVWZIEZczdQEpnByt3Y16WJlFuu
	bK5zltjRMBS1kkBeWPFMXbhUaRzh84XI5vnEK6AvnvowHU6bp2qKWrruRy1UQShEeOaC
	aKBRc95AATUBALkkqS0T28IY1CRVHQyOQvHQtqcuc+Zlfel/wBhuhrwlL7uGsMEfw8eW
	tODA==
Received: by 10.216.240.3 with SMTP id d3mr7375263wer.87.1349540490986;
	Sat, 06 Oct 2012 09:21:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j8sm8999658wiy.9.2012.10.06.09.21.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Oct 2012 09:21:29 -0700 (PDT)
Date: Sat, 6 Oct 2012 18:21:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: laurentiu.palcu@intel.com
Message-ID: <20121006162136.GA24453@jama.jama.net>
References: <20121003114821.8D16410375@opal>
MIME-Version: 1.0
In-Reply-To: <20121003114821.8D16410375@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : qemu: add wrapper for qemu-mips binary
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
X-List-Received-Date: Sat, 06 Oct 2012 16:34:40 -0000
X-Groupsio-MsgNum: 30438
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 03, 2012 at 11:48:21AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 53b3103abdf21123b1c7be49b05cfe97a7cd9ed7
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D53b3103abdf21123b1c7be49b05cfe97a7cd9ed7
>=20
> Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
> Date:   Wed Oct  3 14:23:26 2012 +0300
>=20
> qemu: add wrapper for qemu-mips binary
>=20
> qemu-mips user emulation binary segfaults when running any kind of
> binary. This is due to a MMU access fault in the virtual CPU. This
> problem has been introduced in qemu when 4GB of vmem were reserved for
> 32-on-64 bit.
>=20
> This workaround will need to be reverted once the proper fix is found.
>=20
> [YOCTO #3143]
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-devtools/qemu/qemu_1.2.0.bb |   15 ++++++++++++++-
>  1 files changed, 14 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu_1.2.0.bb b/meta/recipes-devt=
ools/qemu/qemu_1.2.0.bb
> index 191ee48..cbdb4d4 100644
> --- a/meta/recipes-devtools/qemu/qemu_1.2.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
> @@ -17,7 +17,7 @@ SRC_URI =3D "\
>  SRC_URI[md5sum] =3D "78eb1e984f4532aa9f2bdd3c127b5b61"
>  SRC_URI[sha256sum] =3D "c8b84420d9f4869397f84cad2dabd9a475b7723d619a924a=
873740353e9df936"
> =20
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  SRC_URI_append_virtclass-nativesdk =3D "\
>      file://relocatable_sdk.patch \
> @@ -29,6 +29,19 @@ do_configure_prepend_virtclass-nativesdk() {
>  		sed -i 's/-lX11//g' Makefile.target
>  	fi
>  }
> +
> +# The following fragment will create a wrapper for qemu-mips user emulat=
ion
> +# binary in order to work around a segmentation fault issue. Basically, =
by
> +# default, the reserved virtual address space for 32-on-64 bit is set to=
 4GB.
> +# This will trigger a MMU access fault in the virtual CPU. With this cha=
nge,
> +# the qemu-mips works fine.
> +# IMPORTANT: This piece needs to be removed once the root cause is fixed!
> +do_install_append() {
> +	create_wrapper ${D}/${bindir}/qemu-mips \
> +		QEMU_RESERVED_VA=3D0x0
> +}
> +# END of qemu-mips workaround

What about checking if mips is in QEMU_TARGETS before doing this?

Right now this breaks all distros without mips in QEMU_TARGETS.

Cheers,

> +
>  do_configure_prepend_virtclass-native() {
>  	# Undo the -lX11 added by linker-flags.patch, don't assume that host ha=
s libX11 installed
>  	sed -i 's/-lX11//g' Makefile.target
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBwWpAACgkQN1Ujt2V2gByt9wCgm1LdYYU6OxdE9JVGdbB4Kz5g
8lIAoKamTRpo/qmuFjaodygf5caMBs03
=pLld
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
