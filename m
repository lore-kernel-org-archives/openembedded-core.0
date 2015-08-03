Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4D431763F6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 16:58:28 +0000 (UTC)
Received: by wicgj17 with SMTP id gj17so114228364wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Aug 2015 09:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LTW022Sr5czOrKR2P1gxBFY3oIihtn7gHyawiWk1fpM=;
	b=gUzpozKUhtABWZcwu/u4qZso7Ec/pGWJDxbam9mw5vhmg4N2MLiYdgAh0DnVHfx46O
	mTwfh9qheoyRAd95BG3i+t81OB3Q4jSDFo4CNEEjLVhapguMfhkGlZuuEAlYDQpxHD9Q
	SI9cNHWxPHpBrUnsOH7yzJ+gNMsSg8zKhatLXGbbUrqniEQJcY9uicDxnKdeMte7G/jn
	geTXMJZL8slORFtbbIUYpIxRpq9dNtyBFCcuelpI6xgPogXJua+K4U47D5fcb1ZYVg/l
	IjyrdvAinfoc8d3gWXKBYCYS89Vf7Q1DEglCQC0P2ErcqVCvR5CODS5fvz9YqQsiV7m3
	rD7Q==
X-Received: by 10.180.86.234 with SMTP id s10mr19177300wiz.77.1438621108458;
	Mon, 03 Aug 2015 09:58:28 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id x6sm14493377wiy.6.2015.08.03.09.58.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Aug 2015 09:58:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 3 Aug 2015 18:58:32 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20150803165832.GC2465@jama>
References: <cover.1438619216.git.alexander.kanavin@linux.intel.com>
	<fd641de4c497143e62a5f662584ff91c65bec9da.1438619216.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <fd641de4c497143e62a5f662584ff91c65bec9da.1438619216.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/7] stress: update checksums to match upstream tarball
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
X-List-Received-Date: Mon, 03 Aug 2015 16:58:30 -0000
X-Groupsio-MsgNum: 68910
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline

--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 03, 2015 at 07:29:53PM +0300, Alexander Kanavin wrote:
> COPYING checksum has changed because the previous upstream tarball
> (taken from Fedora) had GPLv3 in it, but author's tarball has GPLv2.
> Otherwise the tarballs are identical
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-extended/stress/stress_1.0.4.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-extended/stress/stress_1.0.4.bb b/meta/recipes-=
extended/stress/stress_1.0.4.bb
> index df96fc0..00d9940 100644
> --- a/meta/recipes-extended/stress/stress_1.0.4.bb
> +++ b/meta/recipes-extended/stress/stress_1.0.4.bb
> @@ -2,13 +2,13 @@ DESCRIPTION =3D "Deliberately simple workload generator=
 for POSIX systems. It \
>  imposes a configurable amount of CPU, memory, I/O, and disk stress on th=
e system."
>  HOMEPAGE =3D "http://people.seas.harvard.edu/~apw/stress/"
>  LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> =20
>  SRC_URI =3D "http://people.seas.harvard.edu/~apw/stress/stress-${PV}.tar=
=2Egz \

Did you forget to update this? Commit message says something about
Fedora tarball...

Please also use $"{BPN}/${BP}" instead of "stress/stress-${PV}"

>             file://texinfo.patch \
>             "
> =20
> -SRC_URI[md5sum] =3D "a607afa695a511765b40993a64c6e2f4"
> -SRC_URI[sha256sum] =3D "369c997f65e8426ae8b318d4fdc8e6f07a311cfa77cc4b25=
dace465c582163c0"
> +SRC_URI[md5sum] =3D "890a4236dd1656792f3ef9a190cf99ef"
> +SRC_URI[sha256sum] =3D "057e4fc2a7706411e1014bf172e4f94b63a12f18412378fc=
a8684ca92408825b"
> =20
>  inherit autotools
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

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW/nbgACgkQN1Ujt2V2gByQNgCfY2JL967iIVM6EY1jRVp7I7Wa
VKQAoJO+JQyGtx70LyVG73K4hpg9lN2f
=02Xm
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
