Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9F7FA6E6B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 18:54:45 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id r187so5186137pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 11:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=QCDNApy/ML3vtij0VtlG79wMSJX01quBmWlyxTMrhSA=;
	b=sUOj49VWqRAQH6PNRWqrLS6W1ZKAQegOzGamhT5ObeDPiLDGjN6lG4cqk3OulWtLIw
	ejRlqfLt6yXvHM8WHTvPwVuCDmhhpHzkTYBMx200ajdh/JRIVv/2TUPCWjr2M/+e/NSi
	I77mgGJTv3JnjTp9vMplhGghNU5dHe5DSSVj3+aD3R5jDtOmL70l4TCuFxMWE1fw/kTV
	mwQ051oDsfe1wqeuNu/ol1tbe7Ew82KLD0adBbh8fqmyQ6zyGP9j75IH6BQ6aqpt8GLN
	tBNbWtYlR9HXsSPOtbeCimUZEf9ExIZqyx8AoVRPlM2ZCaG3hZtZfnXcJ9lSipVPJDmw
	arDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=QCDNApy/ML3vtij0VtlG79wMSJX01quBmWlyxTMrhSA=;
	b=EpoN6eTUirg1+FuqMYahcKVHA0+Y0icf1pi81q56zGGpxHajH1XG7rumYPw77ICRDI
	VfJR+nS1z2wTsebPH9VTsffwIelznqE/G2RHHnQOCeXMLw1ud9x06RNiDzmfylt29L/p
	M61kErVWlufwTAKdJHWbbrnQBrhl2uJ87HkqY4glWqug0lu7YZ9nxl7llrooIhsbYJcW
	BFTwNPj4mKhRnp06qZ0veowMDbvglRAc0FJ8DF1ZmyTxhsCHhh/NxCfEdwtC4+yTVG5i
	9ndECnAkdzso5dLZT55tugm525701gwCeMarH30oj3xwe/OT8kGzlsUva26Nd2W4Urzf
	cQeA==
X-Gm-Message-State: AOPr4FUphjGP8KJhKfuE34thVoVV0NMqMjJVJ53R2qgxzOzTtzrsoYlmFYd+g4pOIvWzmA==
X-Received: by 10.98.26.130 with SMTP id a124mr7386757pfa.39.1462992886072;
	Wed, 11 May 2016 11:54:46 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:695b:c36c:8e56:a8aa?
	([2601:646:8800:5a9a:695b:c36c:8e56:a8aa])
	by smtp.gmail.com with ESMTPSA id
	u2sm13913952pan.45.2016.05.11.11.54.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2016 11:54:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1461662879-21557-1-git-send-email-git@andred.net>
Date: Wed, 11 May 2016 11:55:03 -0700
Message-Id: <571935B4-DB58-4820-BBEA-AA6668098755@gmail.com>
References: <1461662879-21557-1-git-send-email-git@andred.net>
To: =?utf-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] feature-arm-neon.inc: restore vfpv3-d16 support
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
X-List-Received-Date: Wed, 11 May 2016 18:54:45 -0000
X-Groupsio-MsgNum: 81932
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A3FFC66C-038C-4250-AA4C-0413F944E20E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A3FFC66C-038C-4250-AA4C-0413F944E20E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

This causes raspberrypi2 not parse anymore

ERROR:  OE-core's config sanity checker detected a potential =
misconfiguration.
    Either fix the cause of this error or at your own risk disable the =
checker (see sanity.conf).
    Following is the list of potential problems / advisories:

    Error, the PACKAGE_ARCHS variable (all any noarch armv5hf-vfp =
armv5thf-vfp armv5ehf-vfp armv5tehf-vfp armv6hf-vfp a
rmv6thf-vfp armv7ahf-vfp armv7at2hf-vfp armv7vehf-vfp armv7vet2hf-vfp =
armv7vehf-neon armv7vet2hf-neon armv7vehf-neon-vf
pv4 armv7vet2hf-neon-vfpv4 cortexa7hf-vfp cortexa7hf-neon =
cortexa7hf-neon-vfpv4 cortexa7t2hf-vfp cortexa7t2hf-neon cort
exa7t2hf-neon-vfpv4 raspberrypi3) for DEFAULTTUNE =
(cortexa7thf-neon-vfpv4) does not contain TUNE_PKGARCH (cortexa7hf-ne
onvfpv4).


> On Apr 26, 2016, at 2:27 AM, Andr=C3=A9 Draszik <git@andred.net> =
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
> index 4247255..bd366a1 100644
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
True).split()[-1].replace('-', '')) if (d.getVar('TUNE_CCARGS_MFPU', =
True) !=3D '') else ''}"
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


--Apple-Mail=_A3FFC66C-038C-4250-AA4C-0413F944E20E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlczgAoACgkQuwUzVZGdMxSO1gCfYZA/dzTH6BqP7IrKDKWWIV+w
9/AAn3aEF6GqbsNJ/sqZN8aNe6/7u9HR
=LyJI
-----END PGP SIGNATURE-----

--Apple-Mail=_A3FFC66C-038C-4250-AA4C-0413F944E20E--
