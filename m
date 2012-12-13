Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tj30f-0004yh-32
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 08:15:10 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so523445eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 23:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/oqol3Hqfd6vYq8S89riWEQJoeyy6bCmpq7JRjhsAD4=;
	b=GWNcpfM2mB2IVslkpRSz54tjjvbR1Jt0PyuC6FOXo9PTsZG8rDE9RNM1TAkX+RvpfZ
	HXdcHOd7YsPhr7+qnmpPajn8bWuBlOH+KUynYQLGm3680sOdvRhdXHeB++ghdBFyooJ0
	O2nKq3kD6fAjCnOwuaYiqFr5aI8yAaZVWEQ0G/Jiq7Z1dhJec42gub0xfSLbZ53PqOSl
	Ag/4mTNe6d+2o+ll37BAcCX3T52zPPfnqeDXFFI9YXoda0IK94VzJlwHYuIOvITDeJ9s
	t0xNm2MRPJnZ1scrDvJ1R2qIRn6oeBBsRW5ibxNVqSpdqKp7rsYmZ5Vlio4EGGenUlsg
	U89g==
Received: by 10.14.225.194 with SMTP id z42mr2555193eep.22.1355382034451;
	Wed, 12 Dec 2012 23:00:34 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d3sm1171357eeo.13.2012.12.12.23.00.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Dec 2012 23:00:33 -0800 (PST)
Date: Thu, 13 Dec 2012 08:00:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20121213070049.GA3356@jama.jama.net>
References: <alpine.DEB.2.02.1212122013560.917@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1212122013560.917@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-openembedded: Replace vestiges of "pnum=" with "striplevel=".
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
X-List-Received-Date: Thu, 13 Dec 2012 07:15:11 -0000
X-Groupsio-MsgNum: 32612
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 12, 2012 at 08:16:16PM -0500, Robert P. J. Day wrote:
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

This belongs to openembedded-devel@lists.openembedded.org ML with
[meta-oe] tag in subject, please read README in layer top directory.

Cheers,

>=20
> ---
>=20
>   given that these were the last usages of "pnum=3D" that i'm aware of,
> i'll submit a patch to remove the processing from patch.bbclass --
> someone else can decide whether or not to apply it.
>=20
> diff --git a/meta-oe/recipes-support/vim/vim_7.2.446.bb b/meta-oe/recipes=
-support/vim/vim_7.2.446.bb
> index 62d76d7..ea922f5 100644
> --- a/meta-oe/recipes-support/vim/vim_7.2.446.bb
> +++ b/meta-oe/recipes-support/vim/vim_7.2.446.bb
> @@ -12,11 +12,11 @@ require vim.inc
>  PR =3D "${INC_PR}.3"
>=20
>  # 001-446; 401-446 are not yet available online
> -SRC_URI +=3D "http://ftp.vim.org/pub/vim/patches/7.2/7.2.001-100.gz;name=
=3Dp001-100;apply=3Dyes;patchdir=3D..;pnum=3D0"
> -SRC_URI +=3D "http://ftp.vim.org/pub/vim/patches/7.2/7.2.101-200.gz;name=
=3Dp101-200;apply=3Dyes;patchdir=3D..;pnum=3D0"
> -SRC_URI +=3D "http://ftp.vim.org/pub/vim/patches/7.2/7.2.201-300.gz;name=
=3Dp201-300;apply=3Dyes;patchdir=3D..;pnum=3D0"
> -SRC_URI +=3D "http://ftp.vim.org/pub/vim/patches/7.2/7.2.301-400.gz;name=
=3Dp301-400;apply=3Dyes;patchdir=3D..;pnum=3D0"
> -SRC_URI +=3D "file://401-446.diff;patchdir=3D..;pnum=3D0"
> +SRC_URI +=3D "http://ftp.vim.org/pub/vim/patches/7.2/7.2.001-100.gz;name=
=3Dp001-100;apply=3Dyes;patchdir=3D..;striplevel=3D0"
> +SRC_URI +=3D "http://ftp.vim.org/pub/vim/patches/7.2/7.2.101-200.gz;name=
=3Dp101-200;apply=3Dyes;patchdir=3D..;striplevel=3D0"
> +SRC_URI +=3D "http://ftp.vim.org/pub/vim/patches/7.2/7.2.201-300.gz;name=
=3Dp201-300;apply=3Dyes;patchdir=3D..;striplevel=3D0"
> +SRC_URI +=3D "http://ftp.vim.org/pub/vim/patches/7.2/7.2.301-400.gz;name=
=3Dp301-400;apply=3Dyes;patchdir=3D..;striplevel=3D0"
> +SRC_URI +=3D "file://401-446.diff;patchdir=3D..;striplevel=3D0"
>=20
>  SRC_URI[p001-100.md5sum] =3D "ba91b19374cee90f71b8f4ab1d92dc0f"
>  SRC_URI[p001-100.sha256sum] =3D "519f4fea460e4f7a737ea8006c0dc1684982f83=
72d1581fb963a5d58f8007f67"
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDJfSEACgkQN1Ujt2V2gBwd2QCgj+/uGFBCWcBFKI+zo1Qmd6wU
RjQAoKD8MDHL7VgkPdnfGpm2nr7j5xpi
=WjR+
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
