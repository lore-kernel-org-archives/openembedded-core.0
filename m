Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UDbI8-0004xn-0S; Thu, 07 Mar 2013 14:55:29 +0100
Received: by mail-pb0-f52.google.com with SMTP id ma3so384494pbc.11
	for <multiple recipients>; Thu, 07 Mar 2013 05:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=k0PK6NgRhDbdctw3G+jGekwix70GOJ3HjEareV6r6sw=;
	b=O0BUOF77DCZFxVCzijR+uviTci5HbhYx7y53OE7w7IBdFvIvKjjLWCXSPamvQ18fdA
	tA7YdNP7RvnvN5wxzJS4fy7PkKwEJ1UDKFbqdGKoRzXsNXjTEAoMx+mCeuii0VgXEElA
	F9qWx8cdHMpaup/m+8Ieek9/YZODdMZ7CrBVQnioEtl/Jxnfdljika1h+glpGMjFkIl4
	fP2CjEry8XDQihHmFF6mOC1VbpLg44dLh8rl4nBY+G188OFQOJQAObBVKf41HBj64qR5
	GnD1zjHM3qQS76oY/VKdLoslaOR/m9HBdQjeXZTYOzQJWmQgRKMfdXafWUKih8PoeKxo
	cCLg==
X-Received: by 10.66.170.7 with SMTP id ai7mr2992957pac.137.1362663535043;
	Thu, 07 Mar 2013 05:38:55 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 1sm1738397pba.32.2013.03.07.05.38.52
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 05:38:53 -0800 (PST)
Date: Thu, 7 Mar 2013 14:38:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org, Denys Dmytriyenko <denys@ti.com>
Message-ID: <20130307133848.GK32228@jama.dyndns-home.com>
References: <20130307111408.37FDE5038A@opal>
MIME-Version: 1.0
In-Reply-To: <20130307111408.37FDE5038A@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Denys Dmytriyenko : tune-cortexa15: add tunes for ARM Cortex-A15
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Mar 2013 13:55:30 -0000
X-Groupsio-MsgNum: 36303
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DfnuYBTqzt7sVGu3"
Content-Disposition: inline

--DfnuYBTqzt7sVGu3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2013 at 11:14:08AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 513180af7f67b614dd0dbd8d9d77c057c45190b8
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D513180af7f67b614dd0dbd8d9d77c057c45190b8
>=20
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Mon Mar  4 22:12:33 2013 -0500
>=20
> tune-cortexa15: add tunes for ARM Cortex-A15
>=20
> http://www.arm.com/products/processors/cortex-a/cortex-a15.php
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

I've compared new tune files with tune-cortexa8 (after s/a15/a8; s/a7/a8) a=
nd there are some differences:

< TUNE_FEATURES_tune-cortexa8thf-neon ?=3D "${TUNE_FEATURES_tune-armv7ahf-n=
eon} cortexa8"
---
> TUNE_FEATURES_tune-cortexa8thf-neon ?=3D "${TUNE_FEATURES_tune-armv7athf-=
neon} cortexa8"
36c36
< PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv7athf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon cortexa8t2-vfp cortexa8=
t2hf-vfp-neon"
---
> PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv7ahf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon cortexa8t2hf-vfp cortexa=
8t2hf-vfp-neon"
OE @ ~/openembedded-core/meta/conf/machine/include $ diff tune-cortexa7.inc=
 tune-cortexa8.inc=20

< TUNE_FEATURES_tune-cortexa8thf-neon ?=3D "${TUNE_FEATURES_tune-armv7ahf-n=
eon} cortexa8"
---
> TUNE_FEATURES_tune-cortexa8thf-neon ?=3D "${TUNE_FEATURES_tune-armv7athf-=
neon} cortexa8"
36c36
< PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv7athf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon cortexa8t2-vfp cortexa8=
t2hf-vfp-neon"
---
> PACKAGE_EXTRA_ARCHS_tune-cortexa8thf-neon =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv7ahf-neon} cortexa8hf-vfp cortexa8hf-vfp-neon cortexa8t2hf-vfp cortexa=
8t2hf-vfp-neon"

I guess it's because a7/a15 were created from a9 which has the same issue (=
only a8 was fixed)

I'll send patch to fix those, but please test it.

> ---
>=20
>  meta/conf/machine/include/tune-cortexa15.inc |   36 ++++++++++++++++++++=
++++++
>  1 files changed, 36 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/mac=
hine/include/tune-cortexa15.inc
> new file mode 100644
> index 0000000..a9a8d0d
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-cortexa15.inc
> @@ -0,0 +1,36 @@
> +DEFAULTTUNE ?=3D "armv7a-neon"
> +
> +require conf/machine/include/arm/arch-armv7a.inc
> +
> +TUNEVALID[cortexa15] =3D "Enable Cortex-A15 specific processor optimizat=
ions"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa15", "-m=
tune=3Dcortex-a15", "", d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES +=3D "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon"
> +ARMPKGARCH_tune-cortexa15 =3D "cortexa15"
> +ARMPKGARCH_tune-cortexa15t =3D "cortexa15"
> +ARMPKGARCH_tune-cortexa15-neon =3D "cortexa15"
> +ARMPKGARCH_tune-cortexa15t-neon =3D "cortexa15"
> +TUNE_FEATURES_tune-cortexa15 =3D "${TUNE_FEATURES_tune-armv7a} cortexa15"
> +TUNE_FEATURES_tune-cortexa15t =3D "${TUNE_FEATURES_tune-armv7at} cortexa=
15"
> +TUNE_FEATURES_tune-cortexa15-neon =3D "${TUNE_FEATURES_tune-armv7a-neon}=
 cortexa15"
> +TUNE_FEATURES_tune-cortexa15t-neon =3D "${TUNE_FEATURES_tune-armv7at-neo=
n} cortexa15"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15 =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7=
a} cortexa15-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15t =3D "${PACKAGE_EXTRA_ARCHS_tune-armv=
7at} cortexa15-vfp cortexa15t2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-=
armv7a-neon} cortexa15-vfp cortexa15-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15t-neon =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv7at-neon} cortexa15-vfp cortexa15-vfp-neon cortexa15t2-vfp cortexa15t2=
-vfp-neon"
> +
> +# VFP Tunes
> +AVAILTUNES +=3D "cortexa15hf cortexa15thf cortexa15hf-neon cortexa15thf-=
neon"
> +ARMPKGARCH_tune-cortexa15hf =3D "cortexa15"
> +ARMPKGARCH_tune-cortexa15thf =3D "cortexa15"
> +ARMPKGARCH_tune-cortexa15hf-neon =3D "cortexa15"
> +ARMPKGARCH_tune-cortexa15thf-neon =3D "cortexa15"
> +TUNE_FEATURES_tune-cortexa15hf ?=3D "${TUNE_FEATURES_tune-armv7ahf} cort=
exa15"
> +TUNE_FEATURES_tune-cortexa15thf ?=3D "${TUNE_FEATURES_tune-armv7athf} co=
rtexa15"
> +TUNE_FEATURES_tune-cortexa15hf-neon ?=3D "${TUNE_FEATURES_tune-armv7ahf-=
neon} cortexa15"
> +TUNE_FEATURES_tune-cortexa15thf-neon ?=3D "${TUNE_FEATURES_tune-armv7ahf=
-neon} cortexa15"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf =3D "${PACKAGE_EXTRA_ARCHS_tune-arm=
v7ahf} cortexa15hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf =3D "${PACKAGE_EXTRA_ARCHS_tune-ar=
mv7athf} cortexa15hf-vfp cortexa15t2hf-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15hf-neon =3D "${PACKAGE_EXTRA_ARCHS_tun=
e-armv7ahf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa15thf-neon =3D "${PACKAGE_EXTRA_ARCHS_tu=
ne-armv7athf-neon} cortexa15hf-vfp cortexa15hf-vfp-neon cortexa15t2-vfp cor=
texa15t2hf-vfp-neon"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DfnuYBTqzt7sVGu3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE4mGgACgkQN1Ujt2V2gBy1mwCglqiIThWO/olVY5p3Jd2pCzw0
kbMAoIU39Pt6UuREx2vKGGR1GJ4CaY7f
=7SpV
-----END PGP SIGNATURE-----

--DfnuYBTqzt7sVGu3--
