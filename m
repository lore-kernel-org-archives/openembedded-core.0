Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RgWC9-0003r1-82
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 07:44:01 +0100
Received: by eeit10 with SMTP id t10so8514396eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2011 22:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0zG6cG0EO9HtHNxSWAkGt9XbdeFZGezceIFLX2CDjcw=;
	b=nCWB7kL1PgYjK5LKPEs/+5Z03/nIfFUwZqk+wtM6edxTcC36+4QEl0s6G8w4nONudg
	6goqyBnMwQahsAaLBNIrrruhbceFMx7vfW7A0Q0Jsb57xY/nCopK1WtovYDwG6Nu5qtC
	8VdBHbxVd/VLBFjCchClAOEkEKb1acw4KphhQ=
Received: by 10.14.16.38 with SMTP id g38mr12280374eeg.56.1325227001725;
	Thu, 29 Dec 2011 22:36:41 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a60sm143878533eeb.4.2011.12.29.22.36.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Dec 2011 22:36:40 -0800 (PST)
Date: Fri, 30 Dec 2011 07:36:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111230063629.GC16885@jama.jama.net>
References: <cover.1325204775.git.nitin.a.kamble@intel.com>
	<2c978c9609fda2df33641003921c25c2568be486.1325204775.git.nitin.a.kamble@intel.com>
MIME-Version: 1.0
In-Reply-To: <2c978c9609fda2df33641003921c25c2568be486.1325204775.git.nitin.a.kamble@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 14/14] automake: upgrade from 1.11.1 to 1.11.2
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
X-List-Received-Date: Fri, 30 Dec 2011 06:44:01 -0000
X-Groupsio-MsgNum: 14941
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Sr1nOIr3CvdE5hEN"
Content-Disposition: inline

--Sr1nOIr3CvdE5hEN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 29, 2011 at 04:30:59PM -0800, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/recipes-devtools/automake/automake.inc        |    1 -
>  .../{automake_1.11.1.bb =3D> automake_1.11.2.bb}     |    5 +++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/automake/{automake_1.11.1.bb =3D> automake_=
1.11.2.bb} (88%)
>=20
> diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-d=
evtools/automake/automake.inc
> index 25b0c0e..c259673 100644
> --- a/meta/recipes-devtools/automake/automake.inc
> +++ b/meta/recipes-devtools/automake/automake.inc
> @@ -4,7 +4,6 @@ Standards. Automake requires the use of Autoconf."
>  LICENSE =3D "GPLv2"
>  HOMEPAGE =3D "http://www.gnu.org/software/automake/"
>  SECTION =3D "devel"
> -PR =3D "r5"
> =20
>  SRC_URI =3D "${GNU_MIRROR}/automake/automake-${PV}.tar.bz2 "
> =20
> diff --git a/meta/recipes-devtools/automake/automake_1.11.1.bb b/meta/rec=
ipes-devtools/automake/automake_1.11.2.bb
> similarity index 88%
> rename from meta/recipes-devtools/automake/automake_1.11.1.bb
> rename to meta/recipes-devtools/automake/automake_1.11.2.bb
> index ff8353f..18436d2 100644
> --- a/meta/recipes-devtools/automake/automake_1.11.1.bb
> +++ b/meta/recipes-devtools/automake/automake_1.11.2.bb
> @@ -37,8 +37,9 @@ SRC_URI +=3D "${PATHFIXPATCH} \
>  	    file://prefer-cpio-over-pax-for-ustar-archives.patch \
>  	    file://python-libdir.patch"
> =20
> -SRC_URI[md5sum] =3D "c2972c4d9b3e29c03d5f2af86249876f"
> -SRC_URI[sha256sum] =3D "5b159d3c0e0a1f87de71b68bcb9f1a1c49e9e71749c9b723=
f17e2e1e0295c7ae"
> +PR=3Dr0

Just style issue but please add spaces and quotes.

> +SRC_URI[md5sum] =3D "18194e804d415767bae8f703c963d456"
> +SRC_URI[sha256sum] =3D "4f46d1f9380c8a3506280750f630e9fc915cb1a435b724be=
56b499d016368718"
> =20
>  do_install () {
>  	oe_runmake 'DESTDIR=3D${D}' install
> --=20
> 1.7.6.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Sr1nOIr3CvdE5hEN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk79W+wACgkQN1Ujt2V2gBwtAQCfThY5PIdpMaqjf+c9gipU/932
SrAAoIY9CkfpBFpw6oPr9Ix3/Q79FfPo
=YWqG
-----END PGP SIGNATURE-----

--Sr1nOIr3CvdE5hEN--
