Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id EBB1E73174
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 17:09:02 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id yl2so8925471pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 10:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=ZFF5t3TXzJMJlvgtmCNjieIrHVisB6N9UT6MlRtYyNo=;
	b=iRjIdiKU+JrbELiENyPR6CbrbufGJ48E8rxb9lzB8yyh7VeG+XNkBAOxEDCacTLMFp
	v4MDhS8CfJ3/uYMpVfVt+YXfTzhfTesSFjGcw9q2Q7CntdzkPe3naJIggWAHhGM6025m
	ExireMQesmQCPGabvGR+iEA3iUiDglaRPxPB6/wN1apORdHRhvgjgYfwxeAWyMU8lcdH
	IuMqkU/5Y7qQkIsnI7+ZxaOQGHu4OUdTft/A1u0gHQ45lUVzHh5H5p59xZrL98gSybcc
	PFs5q2iSL718NjLBo631H4cD3pf4PPzdDJ1xPIxKkHHf9g8NfwHwhS9v8vdcGHbBRN6c
	nUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ZFF5t3TXzJMJlvgtmCNjieIrHVisB6N9UT6MlRtYyNo=;
	b=YywsgIvjzx4Ho40Bjvl6o2SBv/4zzvPrVGsLH1izAPeHDEKuTsJYQ8AfEoXTb/LeVJ
	d6trQvGU8awDtzDd596W/1SrEb6NMYBvALWlnH4Mny1M1BSSh9/H1xxRB2T3phVpuCIG
	bMImpmwiEgc4oLiGRpmqZZ+mIDHujOkvqIF5baPX6zlaO99tnze9kdzGIPwfoYj0gCCA
	buQWsYRokyhXuu6j0saCHkWNjbkvjw2+BFmkqNk/Y1P5bLVRry29nDDt12Q4pSKOalMU
	psHiPeWEJKBR/CvHEBcxiqFjS3ZSDITfZx1Yja7dWVx6VFkIzfNLfU48vX4p8ojDQ6DD
	P3GA==
X-Gm-Message-State: AOPr4FXJeqpcF6xoLiLBwBo65H21Eu1ZvP84n3H1unkFWoZhMINdrZ93pS4B2xKtQLA0iw==
X-Received: by 10.66.151.104 with SMTP id up8mr23246592pab.134.1463159343322; 
	Fri, 13 May 2016 10:09:03 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:90dc:14f3:602d:85ba?
	([2601:646:8800:5a9a:90dc:14f3:602d:85ba])
	by smtp.gmail.com with ESMTPSA id
	kb15sm28790682pad.28.2016.05.13.10.09.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2016 10:09:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1463126191-24272-1-git-send-email-git@andred.net>
Date: Fri, 13 May 2016 10:08:57 -0700
Message-Id: <55B50CC1-24B9-47C3-8120-1794775A93D0@gmail.com>
References: <1463066880-17505-1-git-send-email-git@andred.net>
	<1463126191-24272-1-git-send-email-git@andred.net>
To: =?utf-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3][krogoth] feature-arm-neon.inc: restore vfpv3-d16 support
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
X-List-Received-Date: Fri, 13 May 2016 17:09:03 -0000
X-Groupsio-MsgNum: 82081
Content-Type: multipart/signed;
	boundary="Apple-Mail=_890A5F15-23BF-4510-B2AC-ECBD9DA0088A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_890A5F15-23BF-4510-B2AC-ECBD9DA0088A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 13, 2016, at 12:56 AM, Andr=C3=A9 Draszik <git@andred.net> =
wrote:
>=20
> Commit 6661718 (feature-arm-{neon,vfp}.inc: refactor and fix issues)
> effectively changed the gcc -mfpu=3D option from -mfpu=3Dvfpv3-d16 to
> -mfpu=3Dvfpv3d16, which gcc doesn't understand.
>=20
> Restore the original value.
>=20
> After doing that, we also need to adjust ARMPKGSFX_FPU which should
> contain the same value without dash '-' as it is used that way
> throughout.


V1 worked fine for my case. V3 doesnt even apply. Can you rebase it on =
top of master and resend ?

>=20
> Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
> ---
> meta/conf/machine/include/arm/feature-arm-neon.inc | 2 +-
> meta/conf/machine/include/arm/feature-arm-vfp.inc  | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc =
b/meta/conf/machine/include/arm/feature-arm-neon.inc
> index 50d9175..b34af8e 100644
> --- a/meta/conf/machine/include/arm/feature-arm-neon.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
> @@ -8,7 +8,7 @@ TUNEVALID[neon] =3D "Enable Neon SIMD accelerator =
unit."
> TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'neon', ' =
neon', '', d)}"
>=20
> TUNEVALID[vfpv3d16] =3D "Enable Vector Floating Point Version 3 with =
16 registers (vfpv3-d16) unit."
> -TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'vfpv3d16', ' vfpv3d16', '', d)}"
> +TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'vfpv3d16', ' vfpv3-d16', '', d)}"
>=20
> TUNEVALID[vfpv3] =3D "Enable Vector Floating Point Version 3 with 32 =
registers (vfpv3) unit."
> TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', =
' vfpv3', '' , d)}"
> diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc =
b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> index 4247255..9ef31e7 100644
> --- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
> @@ -6,7 +6,7 @@ TUNEVALID[vfp] =3D "Enable Vector Floating Point (vfp) =
unit."
> TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfp', ' =
vfp', '', d)}"
>=20
> TUNE_CCARGS  .=3D "${@ (' -mfpu=3D%s ' % d.getVar('TUNE_CCARGS_MFPU', =
True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) !=3D '') else =
''}"
> -ARMPKGSFX_FPU =3D "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU', =
True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) !=3D '') else =
''}"
> +ARMPKGSFX_FPU =3D "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU', =
True).split()[-1].replace('vfpv3-d16', 'vfpv3d16')) if =
(d.getVar('TUNE_CCARGS_MFPU', True) !=3D '') else ''}"
>=20
> TUNEVALID[callconvention-hard] =3D "Enable EABI hard float call =
convention, requires VFP."
> TUNE_CCARGS_MFLOAT =3D "${@ bb.utils.contains('TUNE_FEATURES', =
'callconvention-hard', 'hard', 'softfp', d) if =
(d.getVar('TUNE_CCARGS_MFPU', True) !=3D '') else '' }"
> --
> 2.8.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_890A5F15-23BF-4510-B2AC-ECBD9DA0088A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc2Ci0ACgkQuwUzVZGdMxQTCACfVpqhr32ExGBhc5S1lvf9841L
LNcAn3Em363mLNpCQMkIhaEKxIpY6jB6
=OSuG
-----END PGP SIGNATURE-----

--Apple-Mail=_890A5F15-23BF-4510-B2AC-ECBD9DA0088A--
