Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrUji-0004tw-81
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 15:56:18 +0200
Received: by bkcik5 with SMTP id ik5so1150846bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 06:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vjYkUGNoCLuvRrTYyTVuwBM4Q9+fD9iPca1LcvlQfg0=;
	b=i1dvu+wPouiTxUoNjykFlvmWC3UQOVtxpOazdoKZb3IIPNoO/vQKjkoU18Qyy1jAKH
	/T28c3Ockrs/2eUZwMaONSLfs+X89lkj9vT0hu/HYxmoLhz8zfJTOS69329Ef0QRCcwl
	OxniSrkLG2K/7hVsxN0nhnwz3jEetdVDJUtZA6s1UaK9WF/mORNI4Mp8ecS/KV1h2UPb
	WZU8BzlrYDZ6DiuQqHqOIolL7BjH0WWz05QF/vgvDFkiyH61gighkt26jur6SAZfQYQK
	Fsg5tYmnHpe4PUSXI/T+hKUN4N8Uz8IYkDMkFJajbcnNocbwpHBI1eblcz57AsK43G9W
	TS8w==
Received: by 10.204.151.81 with SMTP id b17mr1685495bkw.95.1342619097506;
	Wed, 18 Jul 2012 06:44:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t23sm11925410bks.4.2012.07.18.06.44.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 06:44:56 -0700 (PDT)
Date: Wed, 18 Jul 2012 15:45:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120718134507.GP22569@jama.jama.net>
References: <1342618950-1081-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1342618950-1081-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] sanity: display the parsed PATH when complaining about CWD elements
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
X-List-Received-Date: Wed, 18 Jul 2012 13:56:18 -0000
X-Groupsio-MsgNum: 25648
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MXxcbiX/Q4+iy5U7"
Content-Disposition: inline

--MXxcbiX/Q4+iy5U7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2012 at 02:42:30PM +0100, Ross Burton wrote:
> Many people don't understand the nuances of PATH, so help them by clarify=
ing
> the warning and displaying the parsed PATH element-by-element.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/sanity.bbclass |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 765958e..5c69d54 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -390,7 +390,8 @@ def check_sanity(sanity_data):
> =20
>      paths =3D sanity_data.getVar('PATH', True).split(":")
>      if "." in paths or "" in paths:
> -        messages =3D messages + "PATH contains '.' or '', which will bre=
ak the build, please remove this."
> +        messages =3D messages + "PATH contains '.' or '' (empty element)=
, which will break the build, please remove this.\n"
> +        messages =3D messages + "Parsed PATH is " + str(paths) + "\n"
> =20
>      bbpaths =3D sanity_data.getVar('BBPATH', True).split(":")
>      if "." in bbpaths or "" in bbpaths:

Maybe the same should be added to BBPATH test bellow?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MXxcbiX/Q4+iy5U7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAGveMACgkQN1Ujt2V2gBz0iwCgh03Ycs6yNGpNmNEMxiVgws0Z
jrMAn04SomKdm+OKLL8A8wHd+PY+Mwny
=3vrv
-----END PGP SIGNATURE-----

--MXxcbiX/Q4+iy5U7--
