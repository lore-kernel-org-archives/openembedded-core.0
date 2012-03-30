Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SDbmt-00049g-Bu; Fri, 30 Mar 2012 15:22:43 +0200
Received: by wgbdr12 with SMTP id dr12so512003wgb.24
	for <multiple recipients>; Fri, 30 Mar 2012 06:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=k21vYissE2B6Xd1AZ8X5CF9OB9TlaA++aB+u887FC+s=;
	b=k/sKGUNu3RHvQu3Gnv/ocSFvMYymndMWy9sbQ9BXXEOi+yo+3H4h+4W0FHIo7LojiR
	jvjGLDRxlATt7MF6wn5ETAHBJRBFLMAJttQvXUqRlxVMdIWXr9rIac0aq6GW46UDaZhy
	NsLNRJS1kLO63YdXHVn+i/C/25AbY1C3y93kl+sITkzbZGVPabMJitjxRbMa/Wll8h7F
	tHI2fhAKi0cftXL0aGH5Nz8O3zwWDCNl4+vrniFuBC1/naY4BFBaEwTGriQYFBiiki6G
	g1zc+I/ByQoRbPWrPRAMP+yfiHyZKmRQ9+THzpMV8xGxWTx4iAuI7JgHzqDtsIP4Q7/L
	UozQ==
Received: by 10.180.80.70 with SMTP id p6mr6316558wix.21.1333113218829;
	Fri, 30 Mar 2012 06:13:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff9sm6289005wib.2.2012.03.30.06.13.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 06:13:37 -0700 (PDT)
Date: Fri, 30 Mar 2012 15:13:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120330131340.GT25815@jama.jama.net>
References: <20120328091335.495A010217@opal>
MIME-Version: 1.0
In-Reply-To: <20120328091335.495A010217@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Khem Raj : tune/armv7: Delete
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
X-List-Received-Date: Fri, 30 Mar 2012 13:22:43 -0000
X-Groupsio-MsgNum: 20032
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bn6XL8m8Y51x7rzV"
Content-Disposition: inline

--bn6XL8m8Y51x7rzV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 28, 2012 at 09:13:35AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 75b8adbc042e0f65fb1286bc550d02becd3b6aea
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D75b8adbc042e0f65fb1286bc550d02becd3b6aea
>=20
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Tue Mar 27 18:37:45 2012 -0700
>=20
> tune/armv7: Delete
>=20
> armv7 is least common denominator of armv7-a
> armv7-m and armv7-r and armv7-m does not support
> ARM instructions but only thumb2 instruction set
> which means armv7 when chosen will complain if
> code is compiled in arm mode which is default
> in OE if not specified other wise
>=20
> if we chose this tuning errors like below pop up
>=20
> error: target CPU does not support ARM mode
>=20
> This tuning seems theoretical and base tune
> for armv7 would be one of armv7-a,  armv7-m or
> armv7-r
>=20

this breaks armv7a with thumb and probably also other variants

PACKAGE_EXTRA_ARCHS_tune-armv7t is now undefined and ends unexpanded in PAC=
KAGE_EXTRA_ARCHS_tune-armv7at

ERROR: Error executing a python function in /OE/shr-core/meta-openembedded/=
meta-oe/recipes-core/meta/distro-feed-configs.bb:
ExpansionError: Failure expanding variable CONFFILES, expression was ${@ " =
".join( [ ( "/etc/opkg/%s-feed.conf" % feed ) for feed in "all om_gta04".sp=
lit() ] ) } ${@ " ".join( [ ( "/etc/opkg/%s-feed.conf" % feed ) for
  feed in set("${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a armv7a-vfp armv7at=
2-vfp armv7a-vfp-neon armv7at2-vfp-neon".split()).intersection(set("armv7a-=
vfp-neon".split())) ] ) } which triggered exception SyntaxError

=2E/include/arm/arch-armv7a.inc:PACKAGE_EXTRA_ARCHS_tune-armv7at =3D "${PAC=
KAGE_EXTRA_ARCHS_tune-armv7t} armv7a armv7a-vfp armv7at2-vfp"
=2E/include/arm/arch-armv7a.inc:AVAILTUNES +=3D "armv7hf armv7thf armv7hf-n=
eon armv7thf-neon"
=2E/include/arm/arch-armv7a.inc:PACKAGE_EXTRA_ARCHS_tune-armv7athf =3D "${P=
ACKAGE_EXTRA_ARCHS_tune-armv7thf} armv7ahf-vfp armv7at2hf-vfp"
=2E/include/arm/arch-armv7a.inc:PACKAGE_EXTRA_ARCHS_tune-armv7atb =3D "${PA=
CKAGE_EXTRA_ARCHS_tune-armv7t} armv7ab-vfp armv7at2b-vfp"
=2E/include/arm/arch-armv7a.inc:PACKAGE_EXTRA_ARCHS_tune-armv7athfb =3D "${=
PACKAGE_EXTRA_ARCHS_tune-armv7thfb} armv7ahfb-vfp armv7at2hfb-vfp"

Cheers,

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/conf/machine/include/arm/arch-armv7.inc  |   56 -------------------=
------
>  meta/conf/machine/include/arm/arch-armv7a.inc |    3 +-
>  meta/conf/machine/include/tune-armv7.inc      |    2 -
>  3 files changed, 2 insertions(+), 59 deletions(-)
>=20
> diff --git a/meta/conf/machine/include/arm/arch-armv7.inc b/meta/conf/mac=
hine/include/arm/arch-armv7.inc
> deleted file mode 100644
> index 33d9f0d..0000000
> --- a/meta/conf/machine/include/arm/arch-armv7.inc
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -DEFAULTTUNE ?=3D "armv7"
> -
> -ARMPKGARCH ?=3D "armv7"
> -
> -TUNEVALID[armv7] =3D "Enable instructions for ARMv7"
> -TUNE_CONFLICTS[armv7] =3D "armv4 armv5 armv6"
> -TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "armv7", "-march=
=3Darmv7", "", d)}"
> -MACHINEOVERRIDES .=3D "${@bb.utils.contains("TUNE_FEATURES", "armv7", ":=
armv7", "" ,d)}"
> -
> -require conf/machine/include/arm/arch-armv6.inc
> -require conf/machine/include/arm/feature-arm-neon.inc
> -
> -# Little Endian base configs
> -AVAILTUNES +=3D "armv7 armv7t armv7-neon armv7t-neon"
> -TUNE_FEATURES_tune-armv7 ?=3D "armv7 vfp"
> -TUNE_FEATURES_tune-armv7t ?=3D "armv7 vfp thumb"
> -TUNE_FEATURES_tune-armv7-neon ?=3D "armv7 vfp neon"
> -TUNE_FEATURES_tune-armv7t-neon ?=3D "armv7 vfp neon thumb"
> -PACKAGE_EXTRA_ARCHS_tune-armv7 =3D "${PACKAGE_EXTRA_ARCHS_tune-armv6} ar=
mv7-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7t =3D "${PACKAGE_EXTRA_ARCHS_tune-armv6t} =
armv7-vfp armv7t2-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-armv=
7} armv7-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7t-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-arm=
v7t} armv7-vfp-neon armv7at2-vfp-neon"
> -
> -# VFP Tunes
> -AVAILTUNES +=3D "armv7hf armv7thf armv7hf-neon armv7thf-neon"
> -TUNE_FEATURES_tune-armv7hf ?=3D "${TUNE_FEATURES_tune-armv7} callconvent=
ion-hard"
> -TUNE_FEATURES_tune-armv7thf ?=3D "${TUNE_FEATURES_tune-armv7t} callconve=
ntion-hard"
> -TUNE_FEATURES_tune-armv7hf-neon ?=3D "${TUNE_FEATURES_tune-armv7-neon} c=
allconvention-hard"
> -TUNE_FEATURES_tune-armv7thf-neon ?=3D "${TUNE_FEATURES_tune_armv7t-neon}=
 callconvention-hard"
> -PACKAGE_EXTRA_ARCHS_tune-armv7hf =3D "${PACKAGE_EXTRA_ARCHS_tune-armv6hf=
} armv7hf-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7thf =3D "${PACKAGE_EXTRA_ARCHS_tune-armv6t=
hf} armv7hf-vfp armv7t2hf-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7hf-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-ar=
mv7hf} armv7hf-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7thf-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-a=
rmv7thf} armv7hf-vfp-neon armv7at2hf-vfp-neon"
> -
> -# Big Endian
> -AVAILTUNES +=3D "armv7b armv7tb armv7b-neon armv7tb-neon"
> -TUNE_FEATURES_tune-armv7b ?=3D "${TUNE_FEATURES_tune-armv7} bigendian"
> -TUNE_FEATURES_tune-armv7tb ?=3D "${TUNE_FEATURES_tune-armv7t} bigendian"
> -TUNE_FEATURES_tune-armv7b-neon ?=3D "${TUNE_FEATURES_tune-armv7-neon} bi=
gendian"
> -TUNE_FEATURES_tune-armv7tb-neon ?=3D "${TUNE_FEATURES_tune-armv7t-neon} =
bigendian"
> -PACKAGE_EXTRA_ARCHS_tune-armv7b =3D "${PACKAGE_EXTRA_ARCHS_tune-armv6} a=
rmv7b-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7tb =3D "${PACKAGE_EXTRA_ARCHS_tune-armv6t}=
 armv7b-vfp armv7t2b-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7b-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-arm=
v7} armv7b-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7tb-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-ar=
mv7t} armv7b-vfp-neon armv7at2b-vfp-neon"
> -
> -# Big Endian + VFP
> -AVAILTUNES +=3D "armv7hfb armv7thfb armv7hfb-neon armv7thfb-neon"
> -TUNE_FEATURES_tune-armv7hfb ?=3D "${TUNE_FEATURES_tune-armv7b} callconve=
ntion-hard"
> -TUNE_FEATURES_tune-armv7thfb ?=3D "${TUNE_FEATURES_tune-armv7tb} callcon=
vention-hard"
> -TUNE_FEATURES_tune-armv7hfb-neon ?=3D "${TUNE_FEATURES_tune-armv7b-neon}=
 callconvention-hard"
> -TUNE_FEATURES_tune-armv7thfb-neon ?=3D "${TUNE_FEATURES_tune_armv7tb-neo=
n} callconvention-hard"
> -PACKAGE_EXTRA_ARCHS_tune-armv7hfb =3D "${PACKAGE_EXTRA_ARCHS_tune-armv6h=
fb} armv7hfb-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7thfb =3D "${PACKAGE_EXTRA_ARCHS_tune-armv6=
thfb} armv7hfb-vfp armv7t2hfb-vfp"
> -PACKAGE_EXTRA_ARCHS_tune-armv7hfb-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-a=
rmv7hfb} armv7hfb-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7thfb-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-=
armv7thfb} armv7hfb-vfp-neon armv7at2hfb-vfp-neon"
> -
> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/ma=
chine/include/arm/arch-armv7a.inc
> index de39cb5..92640e2 100644
> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> @@ -7,7 +7,8 @@ TUNE_CONFLICTS[armv7a] =3D "armv4 armv5 armv6 armv7"
>  TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "-marc=
h=3Darmv7-a -fno-tree-vectorize", "", d)}"
>  MACHINEOVERRIDES .=3D "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "=
:armv7a", "" ,d)}"
> =20
> -require conf/machine/include/arm/arch-armv7.inc
> +require conf/machine/include/arm/arch-armv6.inc
> +require conf/machine/include/arm/feature-arm-neon.inc
> =20
>  # Little Endian base configs
>  AVAILTUNES +=3D "armv7a armv7at armv7a-neon armv7at-neon"
> diff --git a/meta/conf/machine/include/tune-armv7.inc b/meta/conf/machine=
/include/tune-armv7.inc
> deleted file mode 100644
> index 664c24b..0000000
> --- a/meta/conf/machine/include/tune-armv7.inc
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require conf/machine/include/arm/arch-armv7.inc
> -
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bn6XL8m8Y51x7rzV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk91sYQACgkQN1Ujt2V2gByKBgCfYZllcEkwZLSYNLNJ4lXJJIJ5
ybcAoK84k9xmLgJKchML160Pg4L9AuOS
=I800
-----END PGP SIGNATURE-----

--bn6XL8m8Y51x7rzV--
