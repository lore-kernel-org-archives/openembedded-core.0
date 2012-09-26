Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TGoWt-000248-Nv
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 12:07:43 +0200
Received: by bkcjk7 with SMTP id jk7so177912bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=m/ygfe2bEJgqrSJP77qhEuuZwUdsuEcRoALi8T+MHJg=;
	b=A88rHbv7LfWftAMfCVcQvcH0pJYau5WEBAsqv2/eYQn+l8uqGocU1dDW9vF+7SntL9
	DhG+Ws36H4YwdLrXZ1uJOOSh4vy0ABgg+mS2U+tgRe1wCybzOtnlFTsKL1z92nGRsXDk
	0dp6aJBwa4cOCdwybuUVhlwY4kUI3faJ+s5G2Slwk5AulKr5qkqBz/oQr3h309GSOL8k
	Ga/WX44Jc3x+JQne+t4Oto+RmmVdkvqfeDJWVcmfcz1im4FCvpWGNY3Y2q33UsNJLfte
	MeRcD6RKs87K7OggvZSKGFVRZtIQA1AF+Zv6/nK5lkPXJvip0lPRWDykwXcgJJD2b3wd
	DNCQ==
Received: by 10.204.4.200 with SMTP id 8mr4929531bks.81.1348653293568;
	Wed, 26 Sep 2012 02:54:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 25sm1932723bkx.9.2012.09.26.02.54.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 02:54:52 -0700 (PDT)
Date: Wed, 26 Sep 2012 11:54:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120926095459.GE3313@jama.jama.net>
References: <1348652719.31293.90.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1348652719.31293.90.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-cross: factor out --enable-threads argument into ${GCCTHREADS}
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
X-List-Received-Date: Wed, 26 Sep 2012 10:07:43 -0000
X-Groupsio-MsgNum: 29891
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qFgkTsE6LiHkLPZw"
Content-Disposition: inline

--qFgkTsE6LiHkLPZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2012 at 10:45:18AM +0100, Phil Blundell wrote:
> This allows BSPs for architectures with no thread support to set (for
> example) "GCCTHREADS=3Dno" without having to override all the other confi=
gure
> parameters.
>=20
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>  meta/recipes-devtools/gcc/gcc-configure-common.inc |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/re=
cipes-devtools/gcc/gcc-configure-common.inc
> index 908ad3e..504bfaa 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -26,12 +26,13 @@ EXTRA_OECONF_INITIAL ?=3D ""
>  EXTRA_OECONF_INTERMEDIATE ?=3D ""
> =20
>  GCCMULTILIB =3D "--disable-multilib"
> +GCCTHREADS =3D "posix"
> =20
>  EXTRA_OECONF =3D "${@['--enable-clocale=3Dgeneric', ''][d.getVar('USE_NL=
S', True) !=3D 'no']} \
>                  --with-gnu-ld \
>                  --enable-shared \
>                  --enable-languages=3D${LANGUAGES} \
> -                --enable-threads=3Dposix \
> +                --enable-threads=3D${GCCTHREADS} \
>                  ${GCCMULTILIB} \
>                  --enable-c99 \
>                  --enable-long-long \
> --=20
> 1.7.10.4

Missing PR bump

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qFgkTsE6LiHkLPZw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBi0PMACgkQN1Ujt2V2gBzQ/ACcCc8AyHWUcI9d780g3r0ri9Pg
RiwAoLOF41Y5z0YPvR7Bifus+m69A4Nz
=DVFr
-----END PGP SIGNATURE-----

--qFgkTsE6LiHkLPZw--
