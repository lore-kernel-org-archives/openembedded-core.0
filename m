Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TeLc1-0000BL-0d
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 09:06:17 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so73437eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 23:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=E26/kygQQMw3OC8pFPW2mUVdIXwF/Flrt7LTlDoVLgw=;
	b=b/KjZ+UTtu03aIXeQObZxQ7jC01mN3cP+wpIOZ8gzoAJItqMtIw+GzQX47ytMyIefJ
	7iIp9V1Mz5bIxAFiX/Ebfac6BoSs0veog9qOYlef+kh/8zZBKCOYDp1LMl5OCc0JD4F/
	tdKYr1Kln3S32h6IKNNF+ytVK7Vh2OmfjDxDlTY+x4ee+YIHjBt28fZ9R5nvoxeXkKyn
	2qrdgAtLwjxEZbjrf6bCz+pXplEXI9i1cmuAJ00Nexh/lT9NPIr9g5LErtYUnTC/6U+F
	wbjdfVrKnGUpnpES3LEcxUL+l1dZwu2hYRn0+qJiu7ATrC+47i+edWn4Dd81faoxRL1D
	+usQ==
Received: by 10.14.194.71 with SMTP id l47mr1829284een.6.1354261920468;
	Thu, 29 Nov 2012 23:52:00 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e1sm8915774eem.3.2012.11.29.23.51.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 23:51:59 -0800 (PST)
Date: Fri, 30 Nov 2012 08:51:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Zhenhua Luo <b19537@freescale.com>
Message-ID: <20121130075157.GB3436@jama.jama.net>
References: <1354246795-17672-1-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1354246795-17672-1-git-send-email-b19537@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: B29882@freescale.com, openembedded-core@lists.openembedded.org
Subject: Re: libxml2: add --with-fexceptions in configure flags to support exception handling in C++ programs
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
X-List-Received-Date: Fri, 30 Nov 2012 08:06:17 -0000
X-Groupsio-MsgNum: 31989
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline

--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 30, 2012 at 11:39:55AM +0800, Zhenhua Luo wrote:
> Without this flag, the library has a problem with C++ programs using exce=
ption handling.
>=20
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
>  meta/recipes-core/libxml/libxml2.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/lib=
xml/libxml2.inc
> index 9ec507b..8794247 100644
> --- a/meta/recipes-core/libxml/libxml2.inc
> +++ b/meta/recipes-core/libxml/libxml2.inc
> @@ -24,7 +24,7 @@ do_configure_prepend () {
>  	sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.in
>  }

Missing PR bump

Cheers,

> =20
> -EXTRA_OECONF =3D "--without-python --without-debug --without-legacy --wi=
thout-catalog --without-docbook --with-c14n --without-lzma"
> +EXTRA_OECONF =3D "--without-python --without-debug --without-legacy --wi=
thout-catalog --without-docbook --with-c14n --without-lzma --with-fexceptio=
ns"
>  EXTRA_OECONF_class-native =3D "--with-python=3D${STAGING_BINDIR}/python =
--without-legacy --with-catalog --without-docbook --with-c14n --without-lzm=
a"
>  EXTRA_OECONF_class-nativesdk =3D "--with-python=3D${STAGING_BINDIR}/pyth=
on --without-legacy --with-catalog --without-docbook --with-c14n --without-=
lzma"
>  EXTRA_OECONF_linuxstdbase =3D "--without-python --with-debug --with-lega=
cy --with-catalog --with-docbook --with-c14n --without-lzma"
> --=20
> 1.7.9.5
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC4ZZ0ACgkQN1Ujt2V2gByzJQCfWLpWlEZbms6VeuCn0MInqqY/
qucAnRyVXoN55BFVaLwqQiGe6yNO4Dud
=xLcq
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
