Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6AF6AF9A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 22:43:06 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id o10so1726020eaj.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2013 15:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NOPDm1qobgO3y5adhe+/fJdyZwEqV0hJOQwJFlU0Rqg=;
	b=hMHu8mmasZ2mllO7rwNxYl3hkBfLyjnh7PZLxpSGX0UVWqhwTelw/O1gMqKFBGlUI6
	QZvqVgeXUWou0MPHyqwF4uUX+rwKDKmIHPY54QkAbFF309s2x+dKXRkBtXdB+XJTtE8D
	UBbd10MOFJ1iEryNFHgThvim42/9mpa87+rfLFkPUuCdDOQCL/HzDxF++cvnE3B5U6+X
	sQgQbMy99KsT7Rhc5+yTbiigJ65Y7sUPEEtJs2Wb/JnFcy+yBE0EQbVqmcFjW2GZQ1+i
	b+xNHgHOWLxsdXxAEZgs5TAmdfLeMIyRVwfJ6OxkU0RETZ80nYQzdH0ILBG0XbcRSSB1
	TDXA==
X-Received: by 10.14.172.194 with SMTP id t42mr14365160eel.78.1373064186431;
	Fri, 05 Jul 2013 15:43:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm17939217eeh.11.2013.07.05.15.43.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 05 Jul 2013 15:43:05 -0700 (PDT)
Date: Sat, 6 Jul 2013 00:43:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130705224311.GA3288@jama>
References: <cover.1372987648.git.Martin.Jansa@gmail.com>
	<f74731158fdfcc9399a32a4e1616652fad1a512d.1372987648.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f74731158fdfcc9399a32a4e1616652fad1a512d.1372987648.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 8/8] eglibc-locale: add missing dependency on virtual/${TARGET_PREFIX}binutils
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
X-List-Received-Date: Fri, 05 Jul 2013 22:43:06 -0000
X-Groupsio-MsgNum: 41541
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 05, 2013 at 03:29:00AM +0200, Martin Jansa wrote:
> * eglibc-collateral.inc inhibits all default deps, but do_package needs
>   objcopy:
>   ERROR: objcopy failed with exit code 127 (cmd was
>   'i586-webos-linux-objcopy' --only-keep-debug
>   'eglibc-locale/2.17-r0/package/usr/lib/gconv/IBM1166.so'
>   'eglibc-locale/2.17-r0/package/usr/lib/gconv/.debug/IBM1166.so')
>   ERROR: Function failed: split_and_strip_files
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/eglibc/eglibc-locale.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-co=
re/eglibc/eglibc-locale.inc
> index f4cb814..fc51022 100644
> --- a/meta/recipes-core/eglibc/eglibc-locale.inc
> +++ b/meta/recipes-core/eglibc/eglibc-locale.inc
> @@ -5,6 +5,11 @@ SUMMARY =3D "Locale data from eglibc"
>  BPN =3D "eglibc"
>  LOCALEBASEPN =3D "${MLPREFIX}eglibc"
> =20
> +# eglibc-collateral.inc inhibits all default deps, but do_package needs =
objcopy
> +# ERROR: objcopy failed with exit code 127 (cmd was 'i586-webos-linux-ob=
jcopy' --only-keep-debug 'eglibc-locale/2.17-r0/package/usr/lib/gconv/IBM11=
66.so' 'eglibc-locale/2.17-r0/package/usr/lib/gconv/.debug/IBM1166.so')
> +# ERROR: Function failed: split_and_strip_files
> +DEPENDS =3D "virtual/${TARGET_PREFIX}binutils"
> +

This one doesn't work with nativesdk:

ERROR: Nothing PROVIDES 'virtual/nativesdk-x86_64-oesdk-linux-binutils'
(but
virtual:nativesdk:/OE/shr-core/openembedded-core/meta/recipes-core/eglibc/e=
glibc-locale_2.18.bb
DEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'nativesdk-eglibc-charmaps' (but
virtual:nativesdk:/OE/shr-core/openembedded-core/meta/recipes-core/eglibc/e=
glibc-locale_2.18.bb
RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'nativesdk-eglibc-charmaps'

I'll send v2 when I have a fix.

>  # Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GEN=
ERATION
>  # is set. The idea is to avoid running localedef on the target (at first=
 boot)
>  # to decrease initial boot time and avoid localedef being killed by the =
OOM
> --=20
> 1.8.2.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHXS/8ACgkQN1Ujt2V2gBxPmgCgtNMcByqdX5t1aICwIYIm3oNj
v7QAn2Mf8wZIjIFNZWsUFhOxOOKcy83V
=3XNI
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
