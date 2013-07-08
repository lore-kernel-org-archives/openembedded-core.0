Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id D0E8C6B085
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 15:01:48 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id a15so3046961eae.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2013 08:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=c0UeD6wOABC/HVJX0mLwzqwDH+ZNZ9z4+kPSm961wy4=;
	b=f4imVxAovN+djo2pCMN7e2UZ5pSL5x64VliVi0cbjBMZ4EUGIWccXEs2K108uVmg7j
	aOTsDRfj/GDirJ7mEyKdmFix57GFCuBfVc3tLRArRheP1FU/olKwopLx62URwriwy1he
	PTWEXRPN5RCOu6XRRJGSjgo8AV7Gb2l7hMo05s/LaOZwg1sI93hh+/FMWrWS/wLNWa/U
	hHnR9pwwsQYqs+x+ZBui+LfVNdfnAMMyhhIrjqoI/mt+HiPIhJBP/NYb/liu+uux0YTJ
	Lm4ELDHlsZbM8rYWEMa0i+Ktiy82dBcOVTpEEzUcg13lOI2YasqHYsZRWtrWN8rfUjer
	zr3w==
X-Received: by 10.14.0.131 with SMTP id 3mr25145778eeb.98.1373295708732;
	Mon, 08 Jul 2013 08:01:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m1sm42702060eex.17.2013.07.08.08.01.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 08:01:48 -0700 (PDT)
Date: Mon, 8 Jul 2013 17:01:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130708150156.GM3288@jama>
References: <20130705224311.GA3288@jama>
	<1373099962-19854-1-git-send-email-Martin.Jansa@gmail.com>
	<1373099962-19854-2-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1373099962-19854-2-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCHv2 2/2] subversion: explicitly disable sasl
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
X-List-Received-Date: Mon, 08 Jul 2013 15:01:49 -0000
X-Groupsio-MsgNum: 41606
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sMkrXc3gAYLRVOjR"
Content-Disposition: inline

--sMkrXc3gAYLRVOjR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 06, 2013 at 10:39:22AM +0200, Martin Jansa wrote:
> * cyrus-sasl is in meta-networking and isn't in subversion DEPENDS
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/subversion/subversion_1.6.15.bb | 1 +
>  meta/recipes-devtools/subversion/subversion_1.7.10.bb | 1 +
>  2 files changed, 2 insertions(+)

I'll change this into PACKAGECONFIG, Jonathan Liu reported that he needs
subversion with sasl support.

>=20
> diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta=
/recipes-devtools/subversion/subversion_1.6.15.bb
> index 244d7ea..2a072e8 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
> @@ -24,6 +24,7 @@ EXTRA_OECONF =3D " \
>                  --without-berkeley-db --without-apxs --without-apache \
>                  --without-swig --with-apr=3D${STAGING_BINDIR_CROSS} \
>                  --with-apr-util=3D${STAGING_BINDIR_CROSS} \
> +                --without-sasl \
>                  ac_cv_path_RUBY=3Dnone"
> =20
>  inherit autotools
> diff --git a/meta/recipes-devtools/subversion/subversion_1.7.10.bb b/meta=
/recipes-devtools/subversion/subversion_1.7.10.bb
> index 9d189fe..ded1788 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.7.10.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
> @@ -22,6 +22,7 @@ EXTRA_OECONF =3D " \
>                  --without-berkeley-db --without-apxs \
>                  --without-swig --with-apr=3D${STAGING_BINDIR_CROSS} \
>                  --with-apr-util=3D${STAGING_BINDIR_CROSS} \
> +                --without-sasl \
>                  ac_cv_path_RUBY=3Dnone"
> =20
>  inherit autotools
> --=20
> 1.8.2.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sMkrXc3gAYLRVOjR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHa1GQACgkQN1Ujt2V2gBz/xACgtjPmchzzmgW8y8goJWeFmLN1
QfkAn0Uqb9VCIx4ZmfOcexE8f49Q5mB3
=xRbz
-----END PGP SIGNATURE-----

--sMkrXc3gAYLRVOjR--
