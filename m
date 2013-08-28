Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id D22CB6B8A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 08:17:57 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so2764075ead.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 01:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/Eo4YOXoBf1EENTRQ5Ikb7+g8u6hcB3oTWma2mm56Zw=;
	b=OquJ/360Anz48fFU4352SyY215MJJ54BHx9Mdlq3Pk933aKyYO0FuMlQLwmVWNL9CP
	7s7lym56pB0Hk4tR0jVuiRIuiQu6FCkvJYgiPCkTxOY+KEWj9yRm8Q0jZXpZ/yy81d9f
	3I6n4IM3yrS6q4HGsKJci8k3v1WWbqlXVa6qCp54cMhr5ZalkgMn0S1RGYy03KMFOaJb
	0kfvYTGTC7te36GOjCOYSo9FF8RkY92gBU+Cez4+dZ/LDEqIbguLsUsqdoLFlM6nnJpo
	VDLd2JPbMMl+YbQwC2wtoLueCJq5RKNtX9rX6C2kCvNIUHtGFJK0PwHcn/boUgFUADJj
	P32g==
X-Received: by 10.14.2.199 with SMTP id 47mr1499586eef.57.1377677877815;
	Wed, 28 Aug 2013 01:17:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z12sm35219424eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 01:17:57 -0700 (PDT)
Date: Wed, 28 Aug 2013 10:19:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20130828081908.GF3544@jama>
References: <cover.1377285913.git.chris_larson@mentor.com>
MIME-Version: 1.0
In-Reply-To: <cover.1377285913.git.chris_larson@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 0/2] Add ca-certificates recipe
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
X-List-Received-Date: Wed, 28 Aug 2013 08:17:58 -0000
X-Groupsio-MsgNum: 44178
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z+buRVFir587KtL+"
Content-Disposition: inline

--z+buRVFir587KtL+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2013 at 12:26:13PM -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>=20
> This is based on the meta-oe recipe, with enhancements, and prepopulates =
the
> certificates for the nativesdk version, for later use in the
> buildtools-tarball.
>=20
> The following changes since commit 9b05c65450526522d7358d0c0901b594de5467=
48:
>=20
>   sstate: Fix the relative symlink replacement code (2013-08-23 16:59:04 =
+0100)
>=20
> are available in the git repository at:
>=20
>   https://github.com/kergoth/oe-core.git ca-certificates
>=20
> Christopher Larson (2):
>   ca-certificates: add recipe (version 20130610)
>   nativesdk-ca-certificates: prepopulate ca-certificates.crt

Are you going to send patches to oe-devel to remove moved=20
recipes/bbclasses ?

>=20
>  ...01-update-ca-certificates-remove-c-rehash.patch | 46 +++++++++++++++
>  .../0002-update-ca-certificates-use-SYSROOT.patch  | 55 +++++++++++++++++
>  .../ca-certificates/default-sysroot.patch          | 55 +++++++++++++++++
>  .../ca-certificates/ca-certificates/sbindir.patch  | 20 +++++++
>  .../ca-certificates/ca-certificates_20130610.bb    | 69 ++++++++++++++++=
++++++
>  5 files changed, 245 insertions(+)
>  create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/=
0001-update-ca-certificates-remove-c-rehash.patch
>  create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/=
0002-update-ca-certificates-use-SYSROOT.patch
>  create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/=
default-sysroot.patch
>  create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/=
sbindir.patch
>  create mode 100644 meta/recipes-support/ca-certificates/ca-certificates_=
20130610.bb
>=20
> --=20
> 1.8.3.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z+buRVFir587KtL+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIdsnwACgkQN1Ujt2V2gByKOwCcDq0dgGsmTeKXOnPDvAzL/XF6
pQcAn3A/E64VrvK+faVXQ456tSiFhSTb
=eIuG
-----END PGP SIGNATURE-----

--z+buRVFir587KtL+--
