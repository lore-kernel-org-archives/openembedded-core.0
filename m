Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwYXV-0005wG-U5
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 15:00:37 +0200
Received: by wgbdr1 with SMTP id dr1so6117690wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Bwi2XgW56tLjH9Gi+A0iN3wWyqSB1XbWIAGV3ia0iFA=;
	b=Mvl544JTFGzNv5bb0wxfSpQSUQDogaTdfTagxmNY9lNN2e5fbbgqEes96wl3lSssFg
	omKN2AwWEtwA5D09Lfpev+hgAxys9n9Rymca9JRDv4p4YeEpQgSa21rkO5ppseyswaaT
	8bjqCi6AXsuZYrm/yAAnQMscBZyEbz41AD6xUbf7oFHx/jFrrhTAvIBGnLyZNBDgwvfe
	Vk9pmJJgFHhSRCJ9yrQgUAzTbBKU5qS9b0s07sB3vzQjguBOtMqMokto4ULXp0AJ9foR
	dgaS9yGbUzUWN8FvCHBCE0ZoHVT1+779+3onPF02uobpy25CWZqzOI2Bcub+V2n9lXWi
	eIYQ==
Received: by 10.216.71.82 with SMTP id q60mr9175290wed.64.1343825339869;
	Wed, 01 Aug 2012 05:48:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ef5sm8537984wib.3.2012.08.01.05.48.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 05:48:58 -0700 (PDT)
Date: Wed, 1 Aug 2012 14:48:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120801124856.GG16306@jama.jama.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<9a9c6f98362245a91a2e58daef6c4ff1bb415881.1343823907.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <9a9c6f98362245a91a2e58daef6c4ff1bb415881.1343823907.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 12/12] mesa-demos: fix GLES2 build
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
X-List-Received-Date: Wed, 01 Aug 2012 13:00:38 -0000
X-Groupsio-MsgNum: 26637
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PyMzGVE0NRonI6bs"
Content-Disposition: inline

--PyMzGVE0NRonI6bs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2012 at 01:31:18PM +0100, Ross Burton wrote:
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb b/meta/recipe=
s-graphics/mesa/mesa-demos_8.0.1.bb
> index bfc62c5..0685711 100644
> --- a/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
> +++ b/meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb
> @@ -11,10 +11,11 @@ LIC_FILES_CHKSUM =3D "file://src/xdemos/glxgears.c;be=
ginline=3D1;endline=3D20;md5=3D9142
> =20
>  DEPENDS =3D "virtual/libx11 virtual/libgl glew"
> =20
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}=
=2Etar.bz2 \
> -	file://dso_linking_change_build_fix.patch"
> +	file://dso_linking_change_build_fix.patch \
> +        file://gles2-info.patch"

mixing tabs and spaces in multiline variable (should be spaces only).

> =20
>  inherit autotools pkgconfig
> =20
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PyMzGVE0NRonI6bs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEUEARECAAYFAlAZJbgACgkQN1Ujt2V2gBz9DwCY9u+UFqaRDFT82JAIpszCipBY
xACgsozInqCXLOzVgJtN6A4kqPEZRKA=
=ia3o
-----END PGP SIGNATURE-----

--PyMzGVE0NRonI6bs--
