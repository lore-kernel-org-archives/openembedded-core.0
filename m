Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF19607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 14:32:33 +0000 (UTC)
Received: by wiwl6 with SMTP id l6so20622751wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jul 2015 07:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0NxR85Vpe0THR6zfZsOfkmmE8DqGVd6DTOnCFCI+wrk=;
	b=ntbop/Iqngh6b3LRNXlY6NZPQCW13dAITuJLCNlbC06ViZTIoLrk4WBwOw0F9P1f3I
	jIWhU3CMx7PgJCy/j8o4ZU9hGlxgNljNOr2GqN89uRBomw93NV9spHBb8ggSazhX24ZB
	BhHl7waBo4cxQ628O9EjWJu0tColCNvOcnwk8Fxb05d1uyKtM1Izsd9D8n10yUjcBKYQ
	ZgY9NB21pwe21sghznvcNqYBTvtvRwZdMoCTeoH6iq/uc0rW69Vswb9IzVYuD8llMMwG
	YEI/1q6cNFp4uJ0R1l2kTsLvmfe/NjhBJ3IhNCCF5Tfu/4k1kg6QcZw1ASP1S+OPRr+W
	dm2g==
X-Received: by 10.194.176.68 with SMTP id cg4mr30638396wjc.106.1436452353311; 
	Thu, 09 Jul 2015 07:32:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id jy6sm9165394wjc.4.2015.07.09.07.32.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jul 2015 07:32:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 9 Jul 2015 16:32:48 +0200
To: Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20150709143248.GC2446@jama>
References: <cover.1436452048.git.cristian.iorga@intel.com>
	<ffb48ef3e2d7e9eb1e0adcff1226dd77b9b10553.1436452048.git.cristian.iorga@intel.com>
MIME-Version: 1.0
In-Reply-To: <ffb48ef3e2d7e9eb1e0adcff1226dd77b9b10553.1436452048.git.cristian.iorga@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libical: upgrade to 1.0.1
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
X-List-Received-Date: Thu, 09 Jul 2015 14:32:34 -0000
X-Groupsio-MsgNum: 67748
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Content-Disposition: inline

--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2015 at 05:28:11PM +0300, Cristian Iorga wrote:
> Bugfix release mainly.
> autotools build system removed, cmake is now used.
> perl is needed during the configure phase.
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  .../libical/{libical_1.0.0.bb =3D> libical_1.0.1.bb}               | 9 +=
+++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/libical/{libical_1.0.0.bb =3D> libical_1.0.1=
=2Ebb} (67%)
>=20
> diff --git a/meta/recipes-support/libical/libical_1.0.0.bb b/meta/recipes=
-support/libical/libical_1.0.1.bb
> similarity index 67%
> rename from meta/recipes-support/libical/libical_1.0.0.bb
> rename to meta/recipes-support/libical/libical_1.0.1.bb
> index be6b635..b50cf7e 100644
> --- a/meta/recipes-support/libical/libical_1.0.0.bb
> +++ b/meta/recipes-support/libical/libical_1.0.1.bb
> @@ -7,7 +7,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd4fc58309d8ed=
46587ac63bb449d82f8 \
>  SECTION =3D "libs"
> =20
>  SRC_URI =3D "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz"

aren't github archives regenerated from time to time with different
checksums?

> -SRC_URI[md5sum] =3D "f4b8e33ae5efb2f025eb43ce69682a36"
> -SRC_URI[sha256sum] =3D "0072e83834092315772e6719b85fc8b11530b1ff53f4d108=
315fb38cddbce8c2"
> +SRC_URI[md5sum] =3D "af91db06b22559f863869c5a382ad08a"
> +SRC_URI[sha256sum] =3D "7d5f613454ec6c7d1bcfb441c919215be53292aa15cd1cb1=
4249d1413d6c610c"
> +
> +inherit cmake perlnative
> +
> +FILES_${PN}-dev +=3D "${libdir}/cmake"
> =20
> -inherit autotools
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

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWehg4ACgkQN1Ujt2V2gBz4dACgg4uzHMJ90sy85VYCgJ84+R4a
8vEAmQHkXmpMiApx6tq0g8QcFZ3H+3ji
=jeYX
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--
