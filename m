Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrGQF-0002SA-Ls
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 00:39:15 +0200
Received: by weyr6 with SMTP id r6so557057wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 15:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uGUleQbtOfDg4rOKjsw0HiZT7TNCoikjb+2sDpwUwP4=;
	b=qWWI+lC4xzJGqkdWF8dTo1teOTOGHz2KuCMRkwrzhb3bR4b2mIGWu1OZQc5sK+8mdD
	p7hhT0ppxSqlzNeyJ9YaApeTzQh3TA5s3HKg0J22EvIq6zpH/fvYRFxYCspOF7NdiRAe
	KtVlcIJYyqi5nofzSXRLLxZRT6O8IUVEzda0e1P7YbenpPtblLHvvhD2933vwqDcARPy
	vTxdFbZH68ZXyQH6Hb3Dm2dEB+knYEmeUQGc7cDuljh6b+MlDqRVT5Y7JzYz25PNGCgN
	Gh37oLbkshmOvva9nbqTrlojIZpG2PJbyuRIfbS6/GAgadNmTC9KsXGU0sZwDbEPZH+x
	m4Pg==
Received: by 10.180.14.8 with SMTP id l8mr1382688wic.6.1342564075916;
	Tue, 17 Jul 2012 15:27:55 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h9sm29280906wiz.1.2012.07.17.15.27.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 15:27:54 -0700 (PDT)
Date: Wed, 18 Jul 2012 00:28:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120717222804.GD22569@jama.jama.net>
References: <1342563792-17634-1-git-send-email-damien.lespiau@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1342563792-17634-1-git-send-email-damien.lespiau@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Damien Lespiau <damien.lespiau@intel.com>
Subject: Re: [PATCH] eglic: Update the svn URL
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
X-List-Received-Date: Tue, 17 Jul 2012 22:39:15 -0000
X-Groupsio-MsgNum: 25562
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9crTWz/Z+Zyzu20v"
Content-Disposition: inline

--9crTWz/Z+Zyzu20v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 17, 2012 at 11:23:12PM +0100, Damien Lespiau wrote:
> From: Damien Lespiau <damien.lespiau@intel.com>
>=20
> Apparently, you can't be checkout eglibc at this URL anymore:
>=20
> STDERR: svn: E170000: URL 'svn://www.eglibc.org/svn/branches/eglibc-2_15'=
 doesn't exist
>=20
> eglibc.org does give http access to the repository, but you have to use
> the http:// scheme.
>=20
> So let's change both 2.15 and 2.16 recipes.

How did you test this change? svn:// is right (it's checkout from
subverion), what's wrong is your bitbake version not respecting
protocol=3Dhttp param to checkout from subversion using http backend.

If you change SRC_URI to start with http:// then wget will be used to
download that and of course it will fail as there is no eglibc source on
http://www.eglibc.org/svn/branches url.

Cheers,

>=20
> Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
> ---
>  meta/recipes-core/eglibc/eglibc_2.15.bb |    2 +-
>  meta/recipes-core/eglibc/eglibc_2.16.bb |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/=
eglibc/eglibc_2.15.bb
> index 110febf..16b3fa1 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.15.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
> @@ -7,7 +7,7 @@ PR =3D "r12"
>  PR_append =3D "+svnr${SRCPV}"
> =20
>  EGLIBC_BRANCH=3D"eglibc-2_15"
> -SRC_URI =3D "svn://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRANCH=
};protocol=3Dhttp \
> +SRC_URI =3D "http://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRANC=
H};protocol=3Dhttp \
>             file://eglibc-svn-arm-lowlevellock-include-tls.patch \
>             file://IO-acquire-lock-fix.patch \
>             file://mips-rld-map-check.patch \
> diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/=
eglibc/eglibc_2.16.bb
> index 09f5dbb..bec39cf 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.16.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
> @@ -7,7 +7,7 @@ PR =3D "r0"
>  PR_append =3D "+svnr${SRCPV}"
> =20
>  EGLIBC_BRANCH=3D"eglibc-2_16"
> -SRC_URI =3D "svn://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRANCH=
};protocol=3Dhttp \
> +SRC_URI =3D "http://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRANC=
H};protocol=3Dhttp \
>             file://eglibc-svn-arm-lowlevellock-include-tls.patch \
>             file://IO-acquire-lock-fix.patch \
>             file://mips-rld-map-check.patch \
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9crTWz/Z+Zyzu20v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAF5vQACgkQN1Ujt2V2gBy62QCeJ5TDvhWL5h7E0FhdNw5ksD21
A3MAn0KikXgAY0pwE4XplObB412BKozR
=nVVR
-----END PGP SIGNATURE-----

--9crTWz/Z+Zyzu20v--
