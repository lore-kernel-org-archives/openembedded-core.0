Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id A65507638A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:34:45 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so247657884wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dP9CcUewU7SrERQIYyeiemVW2UMY1us66OJplsx84hs=;
	b=FN8v+mwVq9jANW6VnxbctM3PuulHCwVtPY2rkCiH4b81rQhtdP3qmov0T724MIcQJc
	Pcd56RdakXxJxdrmdy/v2gk06hZnDLqzH7Pup0Zm2BAtsnL+lmKu7zRGV5DvXsMWo8Dy
	ZkvCHI+yF1jqiu+NTkdGuo+Y/jCRHwbXorAiwtPvl9gzW/ZxpIx7yxyqmjD/f2jo6A/S
	/VIL0z9EdaQQX2dLdblAja7S2PG7N6MUs1PElVRNOkXpSxIrTQyJZ90InJdwg3j5zcfi
	NoHDipU9XnCYw2J/QRVewnFUmxOIzGVcyzHH8DjSDYkCAZngcDMG2/zPLXaoSAyBikC0
	jOdg==
X-Received: by 10.194.58.109 with SMTP id p13mr97900798wjq.36.1438266885236;
	Thu, 30 Jul 2015 07:34:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gc4sm30203535wib.23.2015.07.30.07.34.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 07:34:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Jul 2015 16:35:00 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20150730143500.GI2457@jama>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<955430345ec10c6c1dda34e2b2c9f64e75d50f38.1438262915.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <955430345ec10c6c1dda34e2b2c9f64e75d50f38.1438262915.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 14/26] puzzles: switch svn for git, as upstream has done the same
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
X-List-Received-Date: Thu, 30 Jul 2015 14:34:46 -0000
X-Groupsio-MsgNum: 68739
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r4QXMf6/kyF/FvJJ"
Content-Disposition: inline

--r4QXMf6/kyF/FvJJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 04:31:43PM +0300, Alexander Kanavin wrote:
> Also, drop puzzles_x32_abi_time.patch as it has been merged upstream
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../puzzles/files/puzzles_x32_abi_time.patch       | 30 ----------------=
------
>  .../puzzles/{puzzles_r10286.bb =3D> puzzles_git.bb}  |  7 ++---
>  2 files changed, 4 insertions(+), 33 deletions(-)
>  delete mode 100644 meta/recipes-sato/puzzles/files/puzzles_x32_abi_time.=
patch
>  rename meta/recipes-sato/puzzles/{puzzles_r10286.bb =3D> puzzles_git.bb}=
 (89%)
>=20
> diff --git a/meta/recipes-sato/puzzles/files/puzzles_x32_abi_time.patch b=
/meta/recipes-sato/puzzles/files/puzzles_x32_abi_time.patch
> deleted file mode 100644
> index 63ab0b8..0000000
> --- a/meta/recipes-sato/puzzles/files/puzzles_x32_abi_time.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Fix printf's for time_t value add castings because ISOC90
> -don't support long long int that is used in x32 ABI for=20
> -time_t.
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
> -
> ---- a/magnets.c	2015-03-15 11:57:39.106674811 +0000
> -+++ b/magnets.c	2015-03-15 11:57:58.638674795 +0000
> -@@ -2562,7 +2562,7 @@
> -         goto done;
> -     }
> -     s =3D new_game(NULL, p, desc);
> --    printf("%s:%s (seed %ld)\n", id, desc, seed);
> -+    printf("%s:%s (seed %ld)\n", id, desc, (long) seed);
> -     if (aux) {
> -         /* We just generated this ourself. */
> -         if (verbose || print) {
> ---- a/signpost.c	2015-03-15 11:58:52.866674751 +0000
> -+++ b/signpost.c	2015-03-15 11:59:08.190674738 +0000
> -@@ -2393,7 +2393,7 @@
> -         }
> -     }
> -=20
> --    sprintf(newseed, "%lu", time(NULL));
> -+    sprintf(newseed, "%lu", (unsigned long) time(NULL));
> -     seedstr =3D dupstr(newseed);
> -=20
> -     if (id || !stdin_desc) {
> diff --git a/meta/recipes-sato/puzzles/puzzles_r10286.bb b/meta/recipes-s=
ato/puzzles/puzzles_git.bb
> similarity index 89%
> rename from meta/recipes-sato/puzzles/puzzles_r10286.bb
> rename to meta/recipes-sato/puzzles/puzzles_git.bb
> index 1ad8d1b..6346c06 100644
> --- a/meta/recipes-sato/puzzles/puzzles_r10286.bb
> +++ b/meta/recipes-sato/puzzles/puzzles_git.bb
> @@ -10,12 +10,13 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D33bcd4bce8f3c197f2aefbdbd2d29=
9bc"
> =20
> -SRC_URI =3D "svn://svn.tartarus.org/sgt;module=3Dpuzzles;rev=3D${MOD_PV}=
 \
> +SRC_URI =3D "git://git.tartarus.org/simon/puzzles.git \
>             file://fix-compiling-failure-with-option-g-O.patch \
> -           file://puzzles_x32_abi_time.patch \
>  "
> +SRCREV =3D "aa1a9375be96cd8e0f89a670359c3c80ad7cf937"
> +PV =3D "0.0+git${SRCPV}"

Doesn't PV go backwards with this?

> =20
> -S =3D "${WORKDIR}/${BPN}"
> +S =3D "${WORKDIR}/git"
> =20
>  inherit autotools-brokensep distro_features_check
> =20
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

--r4QXMf6/kyF/FvJJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW6NhMACgkQN1Ujt2V2gBwlsACgt7y7G2XmYeOy+ihoou/6UEwu
hH8AnRnlk3ed43OD/nmgk0XyZZj3vUNl
=Jgqo
-----END PGP SIGNATURE-----

--r4QXMf6/kyF/FvJJ--
