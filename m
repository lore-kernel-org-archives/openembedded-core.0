Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TsFb5-0006YL-3A
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 17:30:52 +0100
Received: by mail-da0-f54.google.com with SMTP id n2so8817663dad.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 08:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=95IdxEohCnkCByWa5j5xVS5UpgQTKGvlQBCVhPWNspo=;
	b=HRuQkyw2p1FKeIWduCDRrATiJIuNgm1jU3U6pjMBkjO/SM516nbrd+d/zKg1T3in8w
	eJQPtJJe9hfVIkFq4/TnafaJ9hzC26R1H4uIT9XgyAi2JlLaA2E2R+AUXGsMlN477LtW
	tV3RWOkmb8QSUykzei3LI7JwqrB0oo/TlOobDm4/ThVcOGaA15ZsWD1HaQ+K2EGy5XbA
	DbVfwKarGiAb5Dyp0O8cREWnyNDTsGRH+2xSng8HsqdCQZ3WpzEmtts3t5exBGvYUBR4
	ykU81BSLWfstYGGUPfEi2+2IOXqTX33JoDw/q0R2zh3jfuSo+XOzKNKgCOwWrCVmBA7e
	NLWw==
X-Received: by 10.68.233.196 with SMTP id ty4mr189676276pbc.23.1357575336927; 
	Mon, 07 Jan 2013 08:15:36 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e6sm8688355paw.16.2013.01.07.08.15.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 08:15:35 -0800 (PST)
Date: Mon, 7 Jan 2013 17:15:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
Message-ID: <20130107161536.GE3285@jama>
References: <1357550207-19933-1-git-send-email-giuseppe.condorelli@st.com>
MIME-Version: 1.0
In-Reply-To: <1357550207-19933-1-git-send-email-giuseppe.condorelli@st.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpcre: set BUILD_CFLAGS
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
X-List-Received-Date: Mon, 07 Jan 2013 16:30:52 -0000
X-Groupsio-MsgNum: 33444
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/2994txjAzEdQwm5"
Content-Disposition: inline

--/2994txjAzEdQwm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 07, 2013 at 10:16:47AM +0100, Giuseppe CONDORELLI wrote:
> Set LINK_SIZE in BUILD_CFLAGS given that the autotools bbclass use it to =
set
> CFLAG_FOR_BUILD, required for the libpcre build.

CFLAG_FOR_BUILD typo in commit body and comment in recipe and please change=
=20
subject to indicate that you're _changing_  BUILD_CFLAGS and
BUILD_CPPFLAGS value.

> Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>
> ---
>  meta/recipes-support/libpcre/libpcre_8.32.bb |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/libpcre/libpcre_8.32.bb b/meta/recipes-=
support/libpcre/libpcre_8.32.bb
> index e434d55..361e9f0 100644
> --- a/meta/recipes-support/libpcre/libpcre_8.32.bb
> +++ b/meta/recipes-support/libpcre/libpcre_8.32.bb
> @@ -34,8 +34,9 @@ EXTRA_OECONF =3D "\
>      --with-match-limit=3D10000000 \
>  "
> =20
> -BUILD_CPPFLAGS +=3D "-DLINK_SIZE=3D2"
> -BUILD_CFLAGS =3D+ "-I${S}/include"
> +# Set LINK_SIZE in BUILD_CFLAGS given that the autotools bbclass use it =
to
> +# set CFLAG_FOR_BUILD, required for the libpcre build.
> +BUILD_CFLAGS =3D+ "-DLINK_SIZE=3D2 -I${S}/include"
>  CFLAGS +=3D "-D_REENTRANT"
>  CXXFLAGS_append_powerpc =3D " -lstdc++"
> =20
> --=20
> 1.7.7.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/2994txjAzEdQwm5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDq9KgACgkQN1Ujt2V2gBy38QCgiWPEGigpWXNBIcT26BGmb3AV
RxkAn1dW4ZNbRb/a/A+/puktkU+AZoyz
=OzHr
-----END PGP SIGNATURE-----

--/2994txjAzEdQwm5--
