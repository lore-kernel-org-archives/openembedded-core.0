Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0145C60124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 22:33:30 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so159493096wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 14:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jzGnmePkt6pw647bWrq1LoE2kyalrQBI4mKJ0yemQRQ=;
	b=Nrv4PRaimMVzHzWJDQy6KXrwXp0q8p3dOkHFhE1SVxuZ0dkDOqPy0WjcBxXqZqu4lt
	TDVrWtDfIWiwJ2sv1W42kX7duvQHZlhOVVHZO6Gr7Q77k1zQtI7sjk3qlvXDLkhtDHSH
	3eVcMop7VEPSgAbSrf1bV/xz9UNPdoB+H09+5cgctrGPo5j5Dmu2WQrJ8jyiCvA+Mnds
	WJwpgmT1ExMmDEbaVnUeSEGoYqAF2tRfBtxafqa+zB5uMHRiZeXdEWirJhkFl/Rum278
	bh3KSpS593a9Y48R8VBqbrvnPzDwto3EGZCaef7+yThirYDOeHWrb0TCufccol40H0pB
	xQXQ==
X-Received: by 10.28.50.193 with SMTP id y184mr25129379wmy.26.1449527611097;
	Mon, 07 Dec 2015 14:33:31 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bg10sm134858wjb.46.2015.12.07.14.33.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Dec 2015 14:33:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 7 Dec 2015 23:35:02 +0100
To: openembedded-core@lists.openembedded.org
Message-ID: <20151207223502.GC2249@jama>
References: <1447864860.1472.56.camel@pbcl.net>
	<1447871842-30347-1-git-send-email-Martin.Jansa@gmail.com>
	<1447871842-30347-5-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1447871842-30347-5-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCHv3 5/6] feature-arm-vfp.inc: respect vfpv4 when setting -mfloat-abi and ARMPKGSFX_EABI
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
X-List-Received-Date: Mon, 07 Dec 2015 22:33:31 -0000
X-Groupsio-MsgNum: 74425
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline

--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2015 at 07:37:21PM +0100, Martin Jansa wrote:
> * without this change it wasn't possible to use call-convention hard
>   together with vfpv4
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/machine/include/arm/feature-arm-vfp.inc | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/con=
f/machine/include/arm/feature-arm-vfp.inc
> index e23d377..75c05fb 100644
> --- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> @@ -13,5 +13,8 @@ TUNEVALID[vfpv4] =3D "Enable Vector Floating Point Vers=
ion 4 (vfpv4) unit."
>  ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', '-vfp=
v4', '' ,d)}"
> =20
>  TUNEVALID[callconvention-hard] =3D "Enable EABI hard float call conventi=
on, requires VFP."
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfp', bb.utils.=
contains('TUNE_FEATURES', 'callconvention-hard', ' -mfloat-abi=3Dhard', ' -=
mfloat-abi=3Dsoftfp', d), '' ,d)}"
> +TUNE_CCARGS .=3D "${@bb.utils.contains_any('TUNE_FEATURES', [ 'vfp', 'vf=
pv3d16', 'vfpv3', 'vfpv4' ], bb.utils.contains('TUNE_FEATURES', 'callconven=
tion-hard', ' -mfloat-abi=3Dhard', ' -mfloat-abi=3Dsoftfp', d), '' ,d)}"
>  ARMPKGSFX_EABI .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'callconven=
tion-hard', 'vfp' ], 'hf', '', d)}"
> +ARMPKGSFX_EABI .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'callconven=
tion-hard', 'vfpv3d16' ], 'hf', '', d)}"
> +ARMPKGSFX_EABI .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'callconven=
tion-hard', 'vfpv3' ], 'hf', '', d)}"
> +ARMPKGSFX_EABI .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'callconven=
tion-hard', 'vfpv4' ], 'hf', '', d)}"

These last 4 lines should be normal assignment, otherwise the "hf"
suffix can be duplicated for tunes with multiple vfp* in TUNE_FEATURES

I've found 2 more issues (not caused by this patchset in cortexr4 tune)
and there are some issues in power6, power7, sh3 and supersparc tunes.

I'm using this script:
http://git.openembedded.org/openembedded-core-contrib/tree/scripts/tune/tes=
t.sh?h=3Djansa/tune2-test

to check that "bitbake -e openssl" works for every available DEFAULTTUNE
and stored log files are useful to see how the CC/CCARGS variables are
changing for each of them, you can see results in last commits in this
branch:
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune2-=
test
http://git.openembedded.org/openembedded-core-contrib/tree/scripts/tune?h=
=3Djansa/tune2-test

http://git.openembedded.org/openembedded-core-contrib/tree/scripts/tune/log=
=2Efake-power6?h=3Djansa/tune2-test
http://git.openembedded.org/openembedded-core-contrib/tree/scripts/tune/log=
=2Efake-power7?h=3Djansa/tune2-test
http://git.openembedded.org/openembedded-core-contrib/tree/scripts/tune/log=
=2Efake-sh3?h=3Djansa/tune2-test
http://git.openembedded.org/openembedded-core-contrib/tree/scripts/tune/log=
=2Efake-supersparc?h=3Djansa/tune2-test

It's highly recommended to use the script together with memres bitbake,
the execution time is at least 10 times shorted, but the changes aren't
picked between runs, so make sure to restart bitbake after changing the
tunes.

I'll send updated patchset soon.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZmCZUACgkQN1Ujt2V2gBxsKwCeOBYRQwRS4x2MRLMpUxOzkrLS
w94AoIbSti/6gu3pLSXfr/zfCnIzhp6t
=rW5N
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--
