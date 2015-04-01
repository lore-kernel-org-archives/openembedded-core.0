Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 18BF965C9C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 17:58:56 +0000 (UTC)
Received: by wgbdm7 with SMTP id dm7so61829326wgb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Apr 2015 10:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BrwpEoVqQfyYLG54OVtOfCEwn5uIOFCCUZcd6wUAeIw=;
	b=m9xyEkQbz4WqfQBSJE8E1SN2pa5bRPDUbKjteI2W+FBQssi3DvRiJBII/cJGXdUW0f
	DtY+Plgso9wjQpNYUmZ44mXp/CHmQr3zDXSlUxsXZh4sj0nnbLo3PFrGHW9nbX1mfodc
	u7CBKgZDvg0trnlUt13HMs05JYsHQ9C6WcjN+8zw7Bzm4MBlnXLybZ7cwCl1CwTkJqkK
	F4D+zM6K7IMbATkn6+2xXXP0Ozl2UEcmjw55UkrkshRxweZ+xXppKtCT4DsDTzURKsrx
	NvTVCU9j+IpHbx5op85/lXrq3oCuOwwssb3QT6Zj6kWhQ5GUEPjyaRNlmhJj6XBJkyN/
	EhLg==
X-Received: by 10.181.13.36 with SMTP id ev4mr17772153wid.6.1427911137412;
	Wed, 01 Apr 2015 10:58:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e2sm3680045wjy.46.2015.04.01.10.58.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Apr 2015 10:58:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Apr 2015 19:59:21 +0200
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150401175921.GK14928@jama>
References: <cover.1427874748.git.liezhi.yang@windriver.com>
	<ef4bd808c72bfaa4a7615db04cd27fdb98ab38bf.1427874748.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <ef4bd808c72bfaa4a7615db04cd27fdb98ab38bf.1427874748.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] piglit: add PACKAGECONFIG for freeglut
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Apr 2015 17:59:03 -0000
X-Groupsio-MsgNum: 63933
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k18oBAwMkTg3OUap"
Content-Disposition: inline

--k18oBAwMkTg3OUap
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2015 at 12:53:00AM -0700, Robert Yang wrote:
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-graphics/piglit/piglit_git.bb |    3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-gr=
aphics/piglit/piglit_git.bb
> index 68ac7e7..e33e4a7 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -21,6 +21,9 @@ REQUIRED_DISTRO_FEATURES =3D "x11"

Does this change resolve:
REQUIRED_DISTRO_FEATURES =3D "x11"
?

If yes, then you should remove it.

>  # contents out of $S and $B.
>  B=3D"${S}"
> =20
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[freeglut] =3D "-DPIGLIT_USE_GLUT=3D1,-DPIGLIT_USE_GLUT=3D0=
,freeglut,"
> +
>  # CMake sets the rpath at build time with the source tree, and will rese=
t it at
>  # install time. As we don't install this doesn't happen, so force the rp=
ath to
>  # what we need.
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k18oBAwMkTg3OUap
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUcMfkACgkQN1Ujt2V2gByw0wCfYlenVPo8FVRmtvdLSRiHGrzv
Kf8An0u5wX/4i2cvbSSZV8nKuHv9+I4o
=GdX5
-----END PGP SIGNATURE-----

--k18oBAwMkTg3OUap--
