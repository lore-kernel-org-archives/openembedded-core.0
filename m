Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ScxR5-0004DV-0L
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 13:32:59 +0200
Received: by bkcjm2 with SMTP id jm2so1565237bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2012 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9SCfZKmybKbYy7Wvgcfg9ygScakiHLOafz71xPGbhRA=;
	b=zfi7cKkAPmcCtOUwBYmZkKEF4XTsI9RVgJLbM0+XS3MOFT6pjo0qjm7zaC++0wrEOl
	Z4jLgxVJZ91F8UIl/225yKabYFqZ/myI6DeYrCpWuHyXasStyR4+2M3MvM6rwT1I+veb
	OyCqOA0Obqe3UIw7MmBrIATAVgb+a7lJHLOk4ZmfbY45kZF9g1sIRxY9qDhhOGB+065f
	+ojEmExVBY9glo3uGJH+YCVNOJZris5C5kRvryo9hEO0EMAOUzuMVkwMAwmoavg8eOmW
	EIvjwgZ8frQ70tYiznT0pANq9rH5gZn/01TqT/PcgcmN5JX/rlGIm4K61uBhhYK3J583
	oF+A==
Received: by 10.204.131.65 with SMTP id w1mr5843690bks.41.1339154549237;
	Fri, 08 Jun 2012 04:22:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u8sm7203464bks.0.2012.06.08.04.22.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 04:22:27 -0700 (PDT)
Date: Fri, 8 Jun 2012 13:22:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120608112246.GI3140@jama.jama.net>
References: <1339153524-20746-1-git-send-email-bogdan.a.marinescu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1339153524-20746-1-git-send-email-bogdan.a.marinescu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] libpcre: updated to version 8.30
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
X-List-Received-Date: Fri, 08 Jun 2012 11:32:59 -0000
X-Groupsio-MsgNum: 23292
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ev7mvGV+3JQuI2Eo"
Content-Disposition: inline

--ev7mvGV+3JQuI2Eo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 08, 2012 at 02:05:24PM +0300, Bogdan Marinescu wrote:
> Tested by compiling lighttpd
>=20
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>  .../libpcre/{libpcre_8.21.bb =3D> libpcre_8.30.bb}   |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename meta/recipes-support/libpcre/{libpcre_8.21.bb =3D> libpcre_8.30.b=
b} (86%)
>=20
> diff --git a/meta/recipes-support/libpcre/libpcre_8.21.bb b/meta/recipes-=
support/libpcre/libpcre_8.30.bb
> similarity index 86%
> rename from meta/recipes-support/libpcre/libpcre_8.21.bb
> rename to meta/recipes-support/libpcre/libpcre_8.30.bb
> index f5fa4ef..83831e7 100644
> --- a/meta/recipes-support/libpcre/libpcre_8.21.bb
> +++ b/meta/recipes-support/libpcre/libpcre_8.30.bb
> @@ -5,15 +5,15 @@ provides a POSIX calling interface to PCRE; the regular=
 expressions \
>  themselves still follow Perl syntax and semantics. The header file for \
>  the POSIX-style functions is called pcreposix.h."
>  SECTION =3D "devel"
> -PR =3D "r1"
> +PR =3D "r0"
>  LICENSE =3D "BSD"
> -LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D2f00d186a775c8002422a5315079d=
96b"
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
> +LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D115e2bee152e2e23e838a29136094=
877"

What's changed in LICENCE? And add it to commit message in v2.

Cheers,

> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.ta=
r.bz2 \
>             file://pcre-cross.patch \
>             file://fix-pcre-name-collision.patch"
> =20
> -SRC_URI[md5sum] =3D "0a7b592bea64b7aa7f4011fc7171a730"
> -SRC_URI[sha256sum] =3D "a4b8509d11fc2764fb4e1415b764ad2c214459edc011ce48=
aeeb6bbe1ac599e3"
> +SRC_URI[md5sum] =3D "98e8928cccc945d04279581e778fbdff"
> +SRC_URI[sha256sum] =3D "c1113fd7db934e97ad8b3917d432e5b642e9eb9afd127eb7=
97804937c965f4ac"
> =20
>  S =3D "${WORKDIR}/pcre-${PV}"
> =20
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

--ev7mvGV+3JQuI2Eo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/R4IYACgkQN1Ujt2V2gBwfQQCdGNYcMHOQp/IuX6eAsxd5s0pC
qlIAoIedsa1IoEVnHqikS+Fpm1Ym09pA
=O6yQ
-----END PGP SIGNATURE-----

--ev7mvGV+3JQuI2Eo--
