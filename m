Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SCqj6-00047T-HS
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 13:07:40 +0200
Received: by wera1 with SMTP id a1so559758wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 03:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MW6BDZG/87uFXL8vhMSuCMlSNPmVCVWuhKvbbFdPsB0=;
	b=d2BmpHoDzYGu12IZgZ818IE1+XPoVO5Ty7wrhn02+mRohVhcdV/Ej3jCM8t8uHqbKe
	+q49KpvMNhmBHTkRVFxV1ao2QcDLi1zH2ort+5tEZEjqMwlCHC1H0eS7t/9Pu5uy5d0u
	KmMKyOHSv9xgxG4UMJp2m1gVUO0hVf/La/fuN1QAWmFAvdwLaKbqxyd1E0MZBMWaNWJC
	g8EVr+HrcE9dHvnHB/J+MFMXKi7S4B92Zc09q4GdNNNhnVI7cYHcR1vs6/EhlHyHFeGm
	MAT8rWw0J+yUb33nBeAy0gSnBpfMtfGFSrc9tkx7I5EYt/gVXi1codIrR3B7Wa8icTOu
	/NxQ==
Received: by 10.216.134.136 with SMTP id s8mr17257483wei.6.1332932318684;
	Wed, 28 Mar 2012 03:58:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ea6sm26793848wib.5.2012.03.28.03.58.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 03:58:37 -0700 (PDT)
Date: Wed, 28 Mar 2012 12:58:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120328105837.GB4004@jama.jama.net>
References: <cover.1332929227.git.edwin.zhai@intel.com>
	<af00d9bd88e6322d5080f985a36ac38afdf67ea5.1332929227.git.edwin.zhai@intel.com>
MIME-Version: 1.0
In-Reply-To: <af00d9bd88e6322d5080f985a36ac38afdf67ea5.1332929227.git.edwin.zhai@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/1] virtual/libgl: switch back to mesa-xlib for qemuarm/qemumips
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2012 11:07:40 -0000
X-Groupsio-MsgNum: 19880
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline

--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 28, 2012 at 06:10:26PM +0800, edwin.zhai@intel.com wrote:
> From: Martin Jansa <martin.jansa@gmail.com>

I don't think I've ever sent something like this.
Actually I've sent patch:
default-providers: switch virtual/libgl from mesa-xlib to mesa-dri
* to match default virtual/xserver

And this just reverts it + adds suspicious COMPATIBLE_MACHINE..

Cheers,

> Still need mesa-xlib for emulation of GLX interface on qemuarm/qemumips, =
where
> mesa-dri doesn't work for pure qemu emulator.
>=20
> [YOCTO #2066] fixed.
> ---
>  meta/conf/distro/include/default-providers.inc |    2 +-
>  meta/recipes-graphics/mesa/mesa-xlib.inc       |    2 ++
>  2 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/d=
istro/include/default-providers.inc
> index 54c90d3..3850a2f 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -5,7 +5,7 @@ PREFERRED_PROVIDER_virtual/db ?=3D "db"
>  PREFERRED_PROVIDER_virtual/db-native ?=3D "db-native"
>  PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
>  PREFERRED_PROVIDER_virtual/xserver-xf86 ?=3D "xserver-xorg"
> -PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa-dri"
> +PREFERRED_PROVIDER_virtual/libgl ?=3D "mesa-xlib"
>  PREFERRED_PROVIDER_virtual/update-alternatives ?=3D "update-alternatives=
-cworth"
>  PREFERRED_PROVIDER_virtual/update-alternatives-native ?=3D "opkg-native"
>  PREFERRED_PROVIDER_virtual/libx11 ?=3D "libx11-trim"
> diff --git a/meta/recipes-graphics/mesa/mesa-xlib.inc b/meta/recipes-grap=
hics/mesa/mesa-xlib.inc
> index b720e14..c431eab 100644
> --- a/meta/recipes-graphics/mesa/mesa-xlib.inc
> +++ b/meta/recipes-graphics/mesa/mesa-xlib.inc
> @@ -1 +1,3 @@
>  EXTRA_OECONF +=3D " --with-driver=3Dxlib --without-gallium-drivers"
> +
> +COMPATIBLE_MACHINE =3D "(qemuarm|qemumips|qemuppc)"
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk9y7t0ACgkQN1Ujt2V2gBzFlwCgmKr8ie2JFbOUlxXLZhEupGVi
K5UAn0aTkuuA3c+84QHMc0n+qcGKOsma
=GuZN
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--
