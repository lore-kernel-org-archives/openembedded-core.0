Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id CD38B7638A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:36:43 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so71284294wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LscM8X/heWFyRRLFnLCLEViE6J74jA7zIL9KyY5ztus=;
	b=1BuAfwyp+0lwtvEYwzJvLdvOoqkGKSZ9G+JulLLbY9lwo62udOvo4TdTb7In6GgVaF
	Rw6X0mi224rXFg4z1KnuI9PvDq39aAfdfQ3gcJgUvUCC+A5ViXxdXo1yK7r5sMotXgEg
	d2rd1VgbQ8SzsomCP140rymLt55qMb5NUXFtlPt5Pt3qVnu077F8FBwCcWL6cOUe4AYL
	k2b1U1y2aksgXuoLy6URD3nSVCLg6CrjALEg7yrjqovyon7K6406AWVCUFg+SDE6aORo
	CHB1R8M2j6o2gEDacDgE0LASaHfeG1yQm89u3HQ7+PwTN8TsTm4FpOrsrQKx8IAri++U
	d21Q==
X-Received: by 10.194.58.130 with SMTP id r2mr88607742wjq.72.1438267003938;
	Thu, 30 Jul 2015 07:36:43 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	di7sm3350502wib.23.2015.07.30.07.36.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 07:36:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Jul 2015 16:36:58 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20150730143658.GK2457@jama>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<86b43671f02c22f328e3801e0711a33731156ba8.1438262915.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <86b43671f02c22f328e3801e0711a33731156ba8.1438262915.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 21/26] systemd: remove PV from the recipe
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
X-List-Received-Date: Thu, 30 Jul 2015 14:36:44 -0000
X-Groupsio-MsgNum: 68741
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1ppIqr1kl39GnwQx"
Content-Disposition: inline

--1ppIqr1kl39GnwQx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 04:31:50PM +0300, Alexander Kanavin wrote:
> It is unnecessary because the recipe filename already contains it.

No, it contains only 219

>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-core/systemd/systemd_219.bb | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core=
/systemd/systemd_219.bb
> index 83e4bce..148a077 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -27,8 +27,6 @@ inherit gtk-doc useradd pkgconfig autotools perlnative =
update-rc.d update-altern
> =20
>  SRCREV =3D "85a6fabdd3e43cfab0fc6359e9f2a9e368d4a3ed"
> =20
> -PV =3D "219-stable+git${SRCPV}"
> -
>  SRC_URI =3D "git://anongit.freedesktop.org/systemd/systemd-stable;branch=
=3Dv219-stable;protocol=3Dgit \
>             file://0002-shared-missing.h-fall-back-to-insecure-getenv.pat=
ch \
>             file://0003-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1ppIqr1kl39GnwQx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW6NokACgkQN1Ujt2V2gByLqgCfcSQYufibSUxAGJlzb900B9Bm
omwAnA8WwxQWNMQcDLdZE6Sw1DiDtw97
=XgI8
-----END PGP SIGNATURE-----

--1ppIqr1kl39GnwQx--
