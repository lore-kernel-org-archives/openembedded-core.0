Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8F0736072C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 00:17:54 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id u190so64806265pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 16:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=RDmIm4rLp4GiFNPK9PHZqU9EAbBvIRyuX2SXwMu5lQ8=;
	b=IurWmm2PLzXK6KwIFZRkHUFmQc4BRmlheozvyCI9zTQ8NJZgXrL36GQJV3o8I8KqWd
	BqRPvadNZ923jwWILZWnhd1V2Zg9gCdsnAu7Ybrjvo0AwkMzttqrnXcswZoF4r3b0/Oq
	ynoNf9DqfZJyMeG/TXuqV7y8FMJP3bfBaWhFjzKD2u85gh650Uo8hBgD2hEmWvyNqlz0
	QmgxgQ7J+YB6qGGCn7MDrtxFx8yCVEsm0BLCnXHa1AYjeaQRS0bb6JOWy0wBk2qt0FH/
	tffXsx0A+35azB6fj45f9JdbQ+y3YCkxDQXzULhJbEd0F/kO+Tgg0V9OWEOozz3zilXG
	/YrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=RDmIm4rLp4GiFNPK9PHZqU9EAbBvIRyuX2SXwMu5lQ8=;
	b=ADp+MYNeXL5aXFGKM/F1h/topUCJ9Jlo5bnX1CqxPdZy6Cx2MMLBGvnMVQ98M8q3OW
	hJ9gb+KMpvZ4aU8fQrR84v5QSZNsO5YQK/+D3mul6Wiz4ie5Np5MrFgCh+yWFkdrfYYc
	F8V2SncaH/Jg6/VgWTs+OfasmPI6W+7ktpfN4THzWjKUHf9N+DdSycuX0sYEDIFgWlby
	Ftx5UpFEJhdpvplYwfgtQZxNurpkiB1cIhfRqRZxOM3dFp3F4/uALrnm8yP0BbbJqT6P
	P1y63snqMHlA4JL+pQ5QIf0W7cLDMrqY3vZDY6V5BOH5PEqeACB6ys5VHR7EOSet0py8
	JpTQ==
X-Gm-Message-State: AD7BkJLFDDVPssCtQ7Sc8WPf67B0fjeJNov9roHxDmpoKwye1bbPp642yBE4hBksfKc9rw==
X-Received: by 10.98.89.129 with SMTP id k1mr12201586pfj.66.1457741875438;
	Fri, 11 Mar 2016 16:17:55 -0800 (PST)
Received: from 172-4-122-115.lightspeed.bcvloh.sbcglobal.net
	(110-170-137-253.static.asianet.co.th. [110.170.137.253])
	by smtp.gmail.com with ESMTPSA id
	c18sm15476454pfj.41.2016.03.11.16.17.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2016 16:17:54 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1457719132-2239-2-git-send-email-daniel.dragomir@windriver.com>
Date: Sat, 12 Mar 2016 07:17:43 +0700
Message-Id: <249F02FB-87A8-431F-9C52-8312F1736B66@gmail.com>
References: <1457719132-2239-1-git-send-email-daniel.dragomir@windriver.com>
	<1457719132-2239-2-git-send-email-daniel.dragomir@windriver.com>
To: Daniel Dragomir <daniel.dragomir@windriver.com>
X-Mailer: Apple Mail (2.3112)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2][master] arch-armv8a.inc: Add tune for 32-bit ARMv8a
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
X-List-Received-Date: Sat, 12 Mar 2016 00:17:57 -0000
X-Groupsio-MsgNum: 79508
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7B6D36C4-EC6E-486F-BDC1-82ECE42A635C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7B6D36C4-EC6E-486F-BDC1-82ECE42A635C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Mar 12, 2016, at 12:58 AM, Daniel Dragomir =
<daniel.dragomir@windriver.com> wrote:
>=20
> This patch adds tunes for 32-bit armv8a platforms. The user can select
> little or big endian, hard or soft float, the vector floating-point
> instruction set: vfpv4 or fp-armv8 and the thumb, neon, crc and crypto
> extensions.

This does not feel right to me. Look at how thunderX looks like
ARMv8 is the time to fix this tune explodes on arm, this patch is not =
helping
it.

Do we need the hf/neon/vfp/thumb2 variants?

Only crc, crypto probably are needed.

It is not leveraging existing arm64 tune includes as well. I would =
rather have
no further tunes for aarch64 at this point.

choose a sane default and lets live with it.
>=20
> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
> ---
> meta/conf/machine/include/arm/arch-armv8a.inc      | 382 =
+++++++++++++++++++++
> .../conf/machine/include/arm/feature-arm-thumb.inc |   1 +
> 2 files changed, 383 insertions(+)
> create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
>=20
> diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc =
b/meta/conf/machine/include/arm/arch-armv8a.inc
> new file mode 100644
> index 0000000..6544f50
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
> @@ -0,0 +1,382 @@
> +DEFAULTTUNE ?=3D "armv8a"
> +
> +TUNEVALID[armv8a] =3D "Enable instructions for ARMv8-a"
> +TUNECONFLICTS[armv8a] =3D "armv4 armv5 armv6 armv7 armv7a armv7ve"
> +
> +TUNEVALID[crc] =3D "Enable CRC instructions for ARMv8-a"
> +ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "crc", =
"-crc", "", d)}"
> +
> +TUNEVALID[crypto] =3D "Enable ARMv8 crypto extension."
> +ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "crypto", =
"-crypto", "", d)}"
> +
> +TUNEVALID[fp-armv8] =3D "Enable ARMv8 Vector Floating Point unit."
> +ARMPKGSFX_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "fp-armv8", =
"-fp-armv8", "", d)}"
> +
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "armv8a", =
bb.utils.contains("TUNE_FEATURES", "crc", " -march=3Darmv8-a+crc", " =
-march=3Darmv8-a", d), "", d)}"
> +
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "fp-armv8", =
bb.utils.contains("TUNE_FEATURES", "neon", =
bb.utils.contains("TUNE_FEATURES", "crypto", " =
-mfpu=3Dcrypto-neon-fp-armv8", " -mfpu=3Dneon-fp-armv8", d), " =
-mfpu=3Dfp-armv8", d), "", d)}"
> +
> +MACHINEOVERRIDES =3D. "${@bb.utils.contains("TUNE_FEATURES", =
"armv8a", "armv8a:", "" ,d)}"
> +
> +require conf/machine/include/arm/arch-armv7ve.inc
> +
> +# Little Endian base configs
> +AVAILTUNES +=3D "armv8a armv8at armv8a-neon armv8at-neon armv8a-vfpv4 =
armv8at-vfpv4 armv8a-vfpv4-neon armv8at-vfpv4-neon armv8a-fp-armv8 =
armv8at-fp-armv8 armv8a-fp-armv8-neon armv8at-fp-armv8-neon =
armv8a-crypto-fp-armv8-neon armv8at-crypto-fp-armv8-neon"
> +ARMPKGARCH_tune-armv8a                       ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8at                      ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-neon                  ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8at-neon                 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-vfpv4                 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8at-vfpv4                ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-vfpv4-neon            ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8at-vfpv4-neon           ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-fp-armv8              ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8at-fp-armv8             ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-fp-armv8-neon         ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8at-fp-armv8-neon        ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crypto-fp-armv8-neon  ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8at-crypto-fp-armv8-neon ?=3D "armv8a"
> +TUNE_FEATURES_tune-armv8a                       =3D "arm armv8a"
> +TUNE_FEATURES_tune-armv8at                      =3D =
"${TUNE_FEATURES_tune-armv8a} thumb"
> +TUNE_FEATURES_tune-armv8a-neon                  =3D =
"${TUNE_FEATURES_tune-armv8a} neon"
> +TUNE_FEATURES_tune-armv8at-neon                 =3D =
"${TUNE_FEATURES_tune-armv8at} neon"
> +TUNE_FEATURES_tune-armv8a-vfpv4                 =3D =
"${TUNE_FEATURES_tune-armv8a} vfpv4"
> +TUNE_FEATURES_tune-armv8at-vfpv4                =3D =
"${TUNE_FEATURES_tune-armv8at} vfpv4"
> +TUNE_FEATURES_tune-armv8a-vfpv4-neon            =3D =
"${TUNE_FEATURES_tune-armv8a-neon} vfpv4"
> +TUNE_FEATURES_tune-armv8at-vfpv4-neon           =3D =
"${TUNE_FEATURES_tune-armv8at-neon} vfpv4"
> +TUNE_FEATURES_tune-armv8a-fp-armv8              =3D =
"${TUNE_FEATURES_tune-armv8a} fp-armv8"
> +TUNE_FEATURES_tune-armv8at-fp-armv8             =3D =
"${TUNE_FEATURES_tune-armv8at} fp-armv8"
> +TUNE_FEATURES_tune-armv8a-fp-armv8-neon         =3D =
"${TUNE_FEATURES_tune-armv8a-neon} fp-armv8"
> +TUNE_FEATURES_tune-armv8at-fp-armv8-neon        =3D =
"${TUNE_FEATURES_tune-armv8at-neon} fp-armv8"
> +TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon  =3D =
"${TUNE_FEATURES_tune-armv8a-fp-armv8-neon} crypto"
> +TUNE_FEATURES_tune-armv8at-crypto-fp-armv8-neon =3D =
"${TUNE_FEATURES_tune-armv8at-fp-armv8-neon} crypto"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a                       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7ve} armv8a"
> +PACKAGE_EXTRA_ARCHS_tune-armv8at                      =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7vet} armv8a"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-neon                  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8at-neon                 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8at} armv8a-neon armv8at2-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4                 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8at-vfpv4                =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8at} armv8a-vfpv4 armv8at2-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4-neon            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4} armv8a-neon armv8a-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8at-vfpv4-neon           =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8at-vfpv4} armv8a-neon armv8at2-neon =
armv8a-neon-vfpv4 armv8at2-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8              =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8at-fp-armv8             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8at} armv8a-fp-armv8 armv8at2-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon         =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8} armv8a-neon =
armv8a-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8at-fp-armv8-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8at-fp-armv8} armv8a-neon armv8at2-neon =
armv8a-fp-armv8-neon armv8at2-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto-fp-armv8-neon  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon} =
armv8a-crypto-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8at-crypto-fp-armv8-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8at-fp-armv8-neon} =
armv8a-crypto-fp-armv8-neon armv8at2-crypto-fp-armv8-neon"
> +
> +# CRC configs
> +AVAILTUNES +=3D "armv8a-crc armv8at-crc armv8a-crc-neon =
armv8at-crc-neon armv8a-crc-vfpv4 armv8at-crc-vfpv4 =
armv8a-crc-vfpv4-neon armv8at-crc-vfpv4-neon armv8a-crc-fp-armv8 =
armv8at-crc-fp-armv8 armv8a-crc-fp-armv8-neon armv8at-crc-fp-armv8-neon =
armv8a-crc-crypto-fp-armv8-neon armv8at-crc-crypto-fp-armv8-neon"
> +ARMPKGARCH_tune-armv8a-crc                       ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8at-crc                      ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-neon                  ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8at-crc-neon                 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-vfpv4                 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8at-crc-vfpv4                ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-vfpv4-neon            ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8at-crc-vfpv4-neon           ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-fp-armv8              ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8at-crc-fp-armv8             ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-fp-armv8-neon         ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8at-crc-fp-armv8-neon        ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8a-crc-crypto-fp-armv8-neon  ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8at-crc-crypto-fp-armv8-neon ?=3D "armv8a"
> +TUNE_FEATURES_tune-armv8a-crc                       =3D =
"${TUNE_FEATURES_tune-armv8a}                       crc"
> +TUNE_FEATURES_tune-armv8at-crc                      =3D =
"${TUNE_FEATURES_tune-armv8at}                      crc"
> +TUNE_FEATURES_tune-armv8a-crc-neon                  =3D =
"${TUNE_FEATURES_tune-armv8a-neon}                  crc"
> +TUNE_FEATURES_tune-armv8at-crc-neon                 =3D =
"${TUNE_FEATURES_tune-armv8at-neon}                 crc"
> +TUNE_FEATURES_tune-armv8a-crc-vfpv4                 =3D =
"${TUNE_FEATURES_tune-armv8a-vfpv4}                 crc"
> +TUNE_FEATURES_tune-armv8at-crc-vfpv4                =3D =
"${TUNE_FEATURES_tune-armv8at-vfpv4}                crc"
> +TUNE_FEATURES_tune-armv8a-crc-vfpv4-neon            =3D =
"${TUNE_FEATURES_tune-armv8a-vfpv4-neon}            crc"
> +TUNE_FEATURES_tune-armv8at-crc-vfpv4-neon           =3D =
"${TUNE_FEATURES_tune-armv8at-vfpv4-neon}           crc"
> +TUNE_FEATURES_tune-armv8a-crc-fp-armv8              =3D =
"${TUNE_FEATURES_tune-armv8a-fp-armv8}              crc"
> +TUNE_FEATURES_tune-armv8at-crc-fp-armv8             =3D =
"${TUNE_FEATURES_tune-armv8at-fp-armv8}             crc"
> +TUNE_FEATURES_tune-armv8a-crc-fp-armv8-neon         =3D =
"${TUNE_FEATURES_tune-armv8a-fp-armv8-neon}         crc"
> +TUNE_FEATURES_tune-armv8at-crc-fp-armv8-neon        =3D =
"${TUNE_FEATURES_tune-armv8at-fp-armv8-neon}        crc"
> +TUNE_FEATURES_tune-armv8a-crc-crypto-fp-armv8-neon  =3D =
"${TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon}  crc"
> +TUNE_FEATURES_tune-armv8at-crc-crypto-fp-armv8-neon =3D =
"${TUNE_FEATURES_tune-armv8at-crypto-fp-armv8-neon} crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc                       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8at-crc                      =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8at} armv8a-crc armv8at2-crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-neon                  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8a-neon} armv8a-crc-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8at-crc-neon                 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8at-neon} armv8a-crc-neon =
armv8at2-crc-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4                 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4} armv8a-crc-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8at-crc-vfpv4                =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8at-vfpv4} armv8a-crc-vfpv4 =
armv8at2-crc-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-vfpv4-neon            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8a-vfpv4-neon} armv8a-crc-neon =
armv8a-crc-vfpv4-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8at-crc-vfpv4-neon           =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8at-vfpv4-neon} armv8a-crc-neon =
armv8at2-crc-neon armv8a-crc-vfpv4-neon armv8at2-crc-vfpv4-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8              =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8} armv8a-crc-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8at-crc-fp-armv8             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8at-fp-armv8} armv8a-crc-fp-armv8 =
armv8at2-crc-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-fp-armv8-neon         =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8a-fp-armv8-neon} =
armv8a-crc-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8at-crc-fp-armv8-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8at-fp-armv8-neon} =
armv8a-crc-fp-armv8-neon armv8at2-crc-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto-fp-armv8-neon  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto-fp-armv8-neon} =
armv8a-crc-crypto-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8at-crc-crypto-fp-armv8-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8at-crypto-fp-armv8-neon} =
armv8a-crc-crypto-fp-armv8-neon armv8at2-crc-crypto-fp-armv8-neon"
> +
> +# HF configs
> +AVAILTUNES +=3D "armv8ahf armv8athf armv8ahf-neon armv8athf-neon =
armv8ahf-vfpv4 armv8athf-vfpv4 armv8ahf-vfpv4-neon armv8athf-vfpv4-neon =
armv8ahf-fp-armv8 armv8athf-fp-armv8 armv8ahf-fp-armv8-neon =
armv8athf-fp-armv8-neon armv8ahf-crypto-fp-armv8-neon =
armv8athf-crypto-fp-armv8-neon"
> +ARMPKGARCH_tune-armv8ahf                       ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athf                      ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahf-neon                  ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athf-neon                 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahf-vfpv4                 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athf-vfpv4                ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahf-vfpv4-neon            ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athf-vfpv4-neon           ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahf-fp-armv8              ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athf-fp-armv8             ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahf-fp-armv8-neon         ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athf-fp-armv8-neon        ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahf-crypto-fp-armv8-neon  ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athf-crypto-fp-armv8-neon ?=3D "armv8a"
> +TUNE_FEATURES_tune-armv8ahf                       =3D =
"${TUNE_FEATURES_tune-armv8a}                       callconvention-hard"
> +TUNE_FEATURES_tune-armv8athf                      =3D =
"${TUNE_FEATURES_tune-armv8at}                      callconvention-hard"
> +TUNE_FEATURES_tune-armv8ahf-neon                  =3D =
"${TUNE_FEATURES_tune-armv8a-neon}                  callconvention-hard"
> +TUNE_FEATURES_tune-armv8athf-neon                 =3D =
"${TUNE_FEATURES_tune-armv8at-neon}                 callconvention-hard"
> +TUNE_FEATURES_tune-armv8ahf-vfpv4                 =3D =
"${TUNE_FEATURES_tune-armv8a-vfpv4}                 callconvention-hard"
> +TUNE_FEATURES_tune-armv8athf-vfpv4                =3D =
"${TUNE_FEATURES_tune-armv8at-vfpv4}                callconvention-hard"
> +TUNE_FEATURES_tune-armv8ahf-vfpv4-neon            =3D =
"${TUNE_FEATURES_tune-armv8a-vfpv4-neon}            callconvention-hard"
> +TUNE_FEATURES_tune-armv8athf-vfpv4-neon           =3D =
"${TUNE_FEATURES_tune-armv8at-vfpv4-neon}           callconvention-hard"
> +TUNE_FEATURES_tune-armv8ahf-fp-armv8              =3D =
"${TUNE_FEATURES_tune-armv8a-fp-armv8}              callconvention-hard"
> +TUNE_FEATURES_tune-armv8athf-fp-armv8             =3D =
"${TUNE_FEATURES_tune-armv8at-fp-armv8}             callconvention-hard"
> +TUNE_FEATURES_tune-armv8ahf-fp-armv8-neon         =3D =
"${TUNE_FEATURES_tune-armv8a-fp-armv8-neon}         callconvention-hard"
> +TUNE_FEATURES_tune-armv8athf-fp-armv8-neon        =3D =
"${TUNE_FEATURES_tune-armv8at-fp-armv8-neon}        callconvention-hard"
> +TUNE_FEATURES_tune-armv8ahf-crypto-fp-armv8-neon  =3D =
"${TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon}  callconvention-hard"
> +TUNE_FEATURES_tune-armv8athf-crypto-fp-armv8-neon =3D =
"${TUNE_FEATURES_tune-armv8at-crypto-fp-armv8-neon} callconvention-hard"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahf                       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7vehf} armv8a armv8ahf"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athf                      =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7vethf} armv8a armv8ahf armv8at2hf"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahf-neon                  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahf} armv8ahf-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athf-neon                 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athf} armv8ahf-neon armv8at2hf-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahf-vfpv4                 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahf} armv8ahf-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athf-vfpv4                =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athf} armv8ahf-vfpv4 armv8at2hf-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahf-vfpv4-neon            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-vfpv4} armv8ahf-neon =
armv8ahf-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athf-vfpv4-neon           =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athf-vfpv4} armv8ahf-neon =
armv8at2hf-neon armv8ahf-neon-vfpv4 armv8at2hf-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahf-fp-armv8              =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahf} armv8ahf-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athf-fp-armv8             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athf} armv8ahf-fp-armv8 =
armv8at2hf-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahf-fp-armv8-neon         =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-fp-armv8} armv8ahf-neon =
armv8ahf-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athf-fp-armv8-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athf-fp-armv8} armv8ahf-neon =
armv8at2hf-neon armv8ahf-fp-armv8-neon armv8at2hf-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crypto-fp-armv8-neon  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-fp-armv8-neon} =
armv8ahf-crypto-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athf-crypto-fp-armv8-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athf-fp-armv8-neon} =
armv8ahf-crypto-fp-armv8-neon armv8at2hf-crypto-fp-armv8-neon"
> +
> +# HF + CRC
> +AVAILTUNES +=3D "armv8ahf-crc armv8athf-crc armv8ahf-crc-neon =
armv8athf-crc-neon armv8ahf-crc-vfpv4 armv8athf-crc-vfpv4 =
armv8ahf-crc-vfpv4-neon armv8athf-crc-vfpv4-neon armv8ahf-crc-fp-armv8 =
armv8athf-crc-fp-armv8 armv8ahf-crc-fp-armv8-neon =
armv8athf-crc-fp-armv8-neon armv8ahf-crc-crypto-fp-armv8-neon =
armv8athf-crc-crypto-fp-armv8-neon"
> +ARMPKGARCH_tune-armv8ahf-crc                       ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athf-crc                      ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahf-crc-neon                  ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athf-crc-neon                 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahf-crc-vfpv4                 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athf-crc-vfpv4                ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahf-crc-vfpv4-neon            ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athf-crc-vfpv4-neon           ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahf-crc-fp-armv8              ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athf-crc-fp-armv8             ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahf-crc-fp-armv8-neon         ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athf-crc-fp-armv8-neon        ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahf-crc-crypto-fp-armv8-neon  ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athf-crc-crypto-fp-armv8-neon ?=3D "armv8a"
> +TUNE_FEATURES_tune-armv8ahf-crc                       =3D =
"${TUNE_FEATURES_tune-armv8ahf}                       crc"
> +TUNE_FEATURES_tune-armv8athf-crc                      =3D =
"${TUNE_FEATURES_tune-armv8athf}                      crc"
> +TUNE_FEATURES_tune-armv8ahf-crc-neon                  =3D =
"${TUNE_FEATURES_tune-armv8ahf-neon}                  crc"
> +TUNE_FEATURES_tune-armv8athf-crc-neon                 =3D =
"${TUNE_FEATURES_tune-armv8athf-neon}                 crc"
> +TUNE_FEATURES_tune-armv8ahf-crc-vfpv4                 =3D =
"${TUNE_FEATURES_tune-armv8ahf-vfpv4}                 crc"
> +TUNE_FEATURES_tune-armv8athf-crc-vfpv4                =3D =
"${TUNE_FEATURES_tune-armv8athf-vfpv4}                crc"
> +TUNE_FEATURES_tune-armv8ahf-crc-vfpv4-neon            =3D =
"${TUNE_FEATURES_tune-armv8ahf-vfpv4-neon}            crc"
> +TUNE_FEATURES_tune-armv8athf-crc-vfpv4-neon           =3D =
"${TUNE_FEATURES_tune-armv8athf-vfpv4-neon}           crc"
> +TUNE_FEATURES_tune-armv8ahf-crc-fp-armv8              =3D =
"${TUNE_FEATURES_tune-armv8ahf-fp-armv8}              crc"
> +TUNE_FEATURES_tune-armv8athf-crc-fp-armv8             =3D =
"${TUNE_FEATURES_tune-armv8athf-fp-armv8}             crc"
> +TUNE_FEATURES_tune-armv8ahf-crc-fp-armv8-neon         =3D =
"${TUNE_FEATURES_tune-armv8ahf-fp-armv8-neon}         crc"
> +TUNE_FEATURES_tune-armv8athf-crc-fp-armv8-neon        =3D =
"${TUNE_FEATURES_tune-armv8athf-fp-armv8-neon}        crc"
> +TUNE_FEATURES_tune-armv8ahf-crc-crypto-fp-armv8-neon  =3D =
"${TUNE_FEATURES_tune-armv8ahf-crypto-fp-armv8-neon}  crc"
> +TUNE_FEATURES_tune-armv8athf-crc-crypto-fp-armv8-neon =3D =
"${TUNE_FEATURES_tune-armv8athf-crypto-fp-armv8-neon} crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc                       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahf} armv8ahf-crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athf-crc                      =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athf} armv8ahf-crc armv8at2hf-crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc-neon                  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-neon} armv8ahf-crc-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athf-crc-neon                 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athf-neon} armv8ahf-crc-neon =
armv8at2hf-crc-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc-vfpv4                 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-vfpv4} armv8ahf-crc-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athf-crc-vfpv4                =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athf-vfpv4} armv8ahf-crc-vfpv4 =
armv8at2hf-crc-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc-vfpv4-neon            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-vfpv4-neon} armv8ahf-crc-neon =
armv8ahf-crc-vfpv4-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athf-crc-vfpv4-neon           =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athf-vfpv4-neon} armv8ahf-crc-neon =
armv8at2hf-crc-neon armv8ahf-crc-vfpv4-neon armv8at2hf-crc-vfpv4-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc-fp-armv8              =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-fp-armv8} armv8ahf-crc-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athf-crc-fp-armv8             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athf-fp-armv8} armv8ahf-crc-fp-armv8 =
armv8at2hf-crc-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc-fp-armv8-neon         =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-fp-armv8-neon} =
armv8ahf-crc-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athf-crc-fp-armv8-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athf-fp-armv8-neon} =
armv8ahf-crc-fp-armv8-neon armv8at2hf-crc-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crc-crypto-fp-armv8-neon  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahf-crypto-fp-armv8-neon} =
armv8ahf-crc-crypto-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athf-crc-crypto-fp-armv8-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athf-crypto-fp-armv8-neon} =
armv8ahf-crc-crypto-fp-armv8-neon armv8at2hf-crc-crypto-fp-armv8-neon"
> +
> +
> +# Big Endian
> +AVAILTUNES +=3D "armv8ab armv8atb armv8ab-neon armv8atb-neon =
armv8ab-vfpv4 armv8atb-vfpv4 armv8ab-vfpv4-neon armv8atb-vfpv4-neon =
armv8ab-fp-armv8 armv8atb-fp-armv8 armv8ab-fp-armv8-neon =
armv8atb-fp-armv8-neon armv8ab-crypto-fp-armv8-neon =
armv8atb-crypto-fp-armv8-neon"
> +ARMPKGARCH_tune-armv8ab                       ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8atb                      ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ab-neon                  ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8atb-neon                 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ab-vfpv4                 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8atb-vfpv4                ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ab-vfpv4-neon            ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8atb-vfpv4-neon           ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ab-fp-armv8              ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8atb-fp-armv8             ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ab-fp-armv8-neon         ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8atb-fp-armv8-neon        ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ab-crypto-fp-armv8-neon  ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8atb-crypto-fp-armv8-neon ?=3D "armv8a"
> +TUNE_FEATURES_tune-armv8ab                       =3D =
"${TUNE_FEATURES_tune-armv8a}                       bigendian"
> +TUNE_FEATURES_tune-armv8atb                      =3D =
"${TUNE_FEATURES_tune-armv8at}                      bigendian"
> +TUNE_FEATURES_tune-armv8ab-neon                  =3D =
"${TUNE_FEATURES_tune-armv8a-neon}                  bigendian"
> +TUNE_FEATURES_tune-armv8atb-neon                 =3D =
"${TUNE_FEATURES_tune-armv8at-neon}                 bigendian"
> +TUNE_FEATURES_tune-armv8ab-vfpv4                 =3D =
"${TUNE_FEATURES_tune-armv8a-vfpv4}                 bigendian"
> +TUNE_FEATURES_tune-armv8atb-vfpv4                =3D =
"${TUNE_FEATURES_tune-armv8at-vfpv4}                bigendian"
> +TUNE_FEATURES_tune-armv8ab-vfpv4-neon            =3D =
"${TUNE_FEATURES_tune-armv8a-vfpv4-neon}            bigendian"
> +TUNE_FEATURES_tune-armv8atb-vfpv4-neon           =3D =
"${TUNE_FEATURES_tune-armv8at-vfpv4-neon}           bigendian"
> +TUNE_FEATURES_tune-armv8ab-fp-armv8              =3D =
"${TUNE_FEATURES_tune-armv8a-fp-armv8}              bigendian"
> +TUNE_FEATURES_tune-armv8atb-fp-armv8             =3D =
"${TUNE_FEATURES_tune-armv8at-fp-armv8}             bigendian"
> +TUNE_FEATURES_tune-armv8ab-fp-armv8-neon         =3D =
"${TUNE_FEATURES_tune-armv8a-fp-armv8-neon}         bigendian"
> +TUNE_FEATURES_tune-armv8atb-fp-armv8-neon        =3D =
"${TUNE_FEATURES_tune-armv8at-fp-armv8-neon}        bigendian"
> +TUNE_FEATURES_tune-armv8ab-crypto-fp-armv8-neon  =3D =
"${TUNE_FEATURES_tune-armv8a-crypto-fp-armv8-neon}  bigendian"
> +TUNE_FEATURES_tune-armv8atb-crypto-fp-armv8-neon =3D =
"${TUNE_FEATURES_tune-armv8at-crypto-fp-armv8-neon} bigendian"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ab                       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7veb} armv8ab"
> +PACKAGE_EXTRA_ARCHS_tune-armv8atb                      =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7vetb} armv8ab"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ab-neon                  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ab} armv8ab-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8atb-neon                 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8atb} armv8ab-neon armv8at2b-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ab-vfpv4                 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ab} armv8ab-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8atb-vfpv4                =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8atb} armv8ab-vfpv4 armv8at2b-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ab-vfpv4-neon            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ab-vfpv4} armv8ab-neon =
armv8ab-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8atb-vfpv4-neon           =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8atb-vfpv4} armv8ab-neon armv8at2b-neon =
armv8ab-neon-vfpv4 armv8at2b-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ab-fp-armv8              =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ab} armv8ab-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8atb-fp-armv8             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8atb} armv8ab-fp-armv8 =
armv8at2b-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ab-fp-armv8-neon         =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ab-fp-armv8} armv8ab-neon =
armv8ab-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8atb-fp-armv8-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8atb-fp-armv8} armv8ab-neon =
armv8at2b-neon armv8ab-fp-armv8-neon armv8at2b-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ab-crypto-fp-armv8-neon  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ab-fp-armv8-neon} =
armv8ab-crypto-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8atb-crypto-fp-armv8-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8atb-fp-armv8-neon} =
armv8ab-crypto-fp-armv8-neon armv8at2b-crypto-fp-armv8-neon"
> +
> +# Big Endian + CRC
> +AVAILTUNES +=3D "armv8ab-crc armv8atb-crc armv8ab-crc-neon =
armv8atb-crc-neon armv8ab-crc-vfpv4 armv8atb-crc-vfpv4 =
armv8ab-crc-vfpv4-neon armv8atb-crc-vfpv4-neon armv8ab-crc-fp-armv8 =
armv8atb-crc-fp-armv8 armv8ab-crc-fp-armv8-neon =
armv8atb-crc-fp-armv8-neon armv8ab-crc-crypto-fp-armv8-neon =
armv8atb-crc-crypto-fp-armv8-neon"
> +ARMPKGARCH_tune-armv8ab-crc                       ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8atb-crc                      ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ab-crc-neon                  ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8atb-crc-neon                 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ab-crc-vfpv4                 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8atb-crc-vfpv4                ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ab-crc-vfpv4-neon            ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8atb-crc-vfpv4-neon           ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ab-crc-fp-armv8              ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8atb-crc-fp-armv8             ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ab-crc-fp-armv8-neon         ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8atb-crc-fp-armv8-neon        ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ab-crc-crypto-fp-armv8-neon  ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8atb-crc-crypto-fp-armv8-neon ?=3D "armv8a"
> +TUNE_FEATURES_tune-armv8ab-crc                       =3D =
"${TUNE_FEATURES_tune-armv8ab}                       crc"
> +TUNE_FEATURES_tune-armv8atb-crc                      =3D =
"${TUNE_FEATURES_tune-armv8atb}                      crc"
> +TUNE_FEATURES_tune-armv8ab-crc-neon                  =3D =
"${TUNE_FEATURES_tune-armv8ab-neon}                  crc"
> +TUNE_FEATURES_tune-armv8atb-crc-neon                 =3D =
"${TUNE_FEATURES_tune-armv8atb-neon}                 crc"
> +TUNE_FEATURES_tune-armv8ab-crc-vfpv4                 =3D =
"${TUNE_FEATURES_tune-armv8ab-vfpv4}                 crc"
> +TUNE_FEATURES_tune-armv8atb-crc-vfpv4                =3D =
"${TUNE_FEATURES_tune-armv8atb-vfpv4}                crc"
> +TUNE_FEATURES_tune-armv8ab-crc-vfpv4-neon            =3D =
"${TUNE_FEATURES_tune-armv8ab-vfpv4-neon}            crc"
> +TUNE_FEATURES_tune-armv8atb-crc-vfpv4-neon           =3D =
"${TUNE_FEATURES_tune-armv8atb-vfpv4-neon}           crc"
> +TUNE_FEATURES_tune-armv8ab-crc-fp-armv8              =3D =
"${TUNE_FEATURES_tune-armv8ab-fp-armv8}              crc"
> +TUNE_FEATURES_tune-armv8atb-crc-fp-armv8             =3D =
"${TUNE_FEATURES_tune-armv8atb-fp-armv8}             crc"
> +TUNE_FEATURES_tune-armv8ab-crc-fp-armv8-neon         =3D =
"${TUNE_FEATURES_tune-armv8ab-fp-armv8-neon}         crc"
> +TUNE_FEATURES_tune-armv8atb-crc-fp-armv8-neon        =3D =
"${TUNE_FEATURES_tune-armv8atb-fp-armv8-neon}        crc"
> +TUNE_FEATURES_tune-armv8ab-crc-crypto-fp-armv8-neon  =3D =
"${TUNE_FEATURES_tune-armv8ab-crypto-fp-armv8-neon}  crc"
> +TUNE_FEATURES_tune-armv8atb-crc-crypto-fp-armv8-neon =3D =
"${TUNE_FEATURES_tune-armv8atb-crypto-fp-armv8-neon} crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ab-crc                       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ab} armv8ab-crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8atb-crc                      =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8atb} armv8ab-crc armv8at2b-crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ab-crc-neon                  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ab-neon} armv8ab-crc-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8atb-crc-neon                 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8atb-neon} armv8ab-crc-neon =
armv8at2b-crc-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ab-crc-vfpv4                 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ab-vfpv4} armv8ab-crc-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8atb-crc-vfpv4                =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8atb-vfpv4} armv8ab-crc-vfpv4 =
armv8at2b-crc-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ab-crc-vfpv4-neon            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ab-vfpv4-neon} armv8ab-crc-neon =
armv8ab-crc-vfpv4-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8atb-crc-vfpv4-neon           =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8atb-vfpv4-neon} armv8ab-crc-neon =
armv8at2b-crc-neon armv8ab-crc-vfpv4-neon armv8at2b-crc-vfpv4-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ab-crc-fp-armv8              =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ab-fp-armv8} armv8ab-crc-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8atb-crc-fp-armv8             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8atb-fp-armv8} armv8ab-crc-fp-armv8 =
armv8at2b-crc-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ab-crc-fp-armv8-neon         =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ab-fp-armv8-neon} =
armv8ab-crc-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8atb-crc-fp-armv8-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8atb-fp-armv8-neon} =
armv8ab-crc-fp-armv8-neon armv8at2b-crc-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ab-crc-crypto-fp-armv8-neon  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ab-crypto-fp-armv8-neon} =
armv8ab-crc-crypto-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8atb-crc-crypto-fp-armv8-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8atb-crypto-fp-armv8-neon} =
armv8ab-crc-crypto-fp-armv8-neon armv8at2b-crc-crypto-fp-armv8-neon"
> +
> +# Big Endian + HF
> +AVAILTUNES +=3D "armv8ahfb armv8athfb armv8ahfb-neon armv8athfb-neon =
armv8ahfb-vfpv4 armv8athfb-vfpv4 armv8ahfb-vfpv4-neon =
armv8athfb-vfpv4-neon armv8ahfb-fp-armv8 armv8athfb-fp-armv8 =
armv8ahfb-fp-armv8-neon armv8athfb-fp-armv8-neon =
armv8ahfb-crypto-fp-armv8-neon armv8athfb-crypto-fp-armv8-neon"
> +ARMPKGARCH_tune-armv8ahfb                       ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athfb                      ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahfb-neon                  ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athfb-neon                 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahfb-vfpv4                 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athfb-vfpv4                ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahfb-vfpv4-neon            ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athfb-vfpv4-neon           ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahfb-fp-armv8              ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athfb-fp-armv8             ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahfb-fp-armv8-neon         ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athfb-fp-armv8-neon        ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahfb-crypto-fp-armv8-neon  ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athfb-crypto-fp-armv8-neon ?=3D "armv8a"
> +TUNE_FEATURES_tune-armv8ahfb                       =3D =
"${TUNE_FEATURES_tune-armv8ab}                       =
callconvention-hard"
> +TUNE_FEATURES_tune-armv8athfb                      =3D =
"${TUNE_FEATURES_tune-armv8atb}                      =
callconvention-hard"
> +TUNE_FEATURES_tune-armv8ahfb-neon                  =3D =
"${TUNE_FEATURES_tune-armv8ab-neon}                  =
callconvention-hard"
> +TUNE_FEATURES_tune-armv8athfb-neon                 =3D =
"${TUNE_FEATURES_tune-armv8atb-neon}                 =
callconvention-hard"
> +TUNE_FEATURES_tune-armv8ahfb-vfpv4                 =3D =
"${TUNE_FEATURES_tune-armv8ab-vfpv4}                 =
callconvention-hard"
> +TUNE_FEATURES_tune-armv8athfb-vfpv4                =3D =
"${TUNE_FEATURES_tune-armv8atb-vfpv4}                =
callconvention-hard"
> +TUNE_FEATURES_tune-armv8ahfb-vfpv4-neon            =3D =
"${TUNE_FEATURES_tune-armv8ab-vfpv4-neon}            =
callconvention-hard"
> +TUNE_FEATURES_tune-armv8athfb-vfpv4-neon           =3D =
"${TUNE_FEATURES_tune-armv8atb-vfpv4-neon}           =
callconvention-hard"
> +TUNE_FEATURES_tune-armv8ahfb-fp-armv8              =3D =
"${TUNE_FEATURES_tune-armv8ab-fp-armv8}              =
callconvention-hard"
> +TUNE_FEATURES_tune-armv8athfb-fp-armv8             =3D =
"${TUNE_FEATURES_tune-armv8atb-fp-armv8}             =
callconvention-hard"
> +TUNE_FEATURES_tune-armv8ahfb-fp-armv8-neon         =3D =
"${TUNE_FEATURES_tune-armv8ab-fp-armv8-neon}         =
callconvention-hard"
> +TUNE_FEATURES_tune-armv8athfb-fp-armv8-neon        =3D =
"${TUNE_FEATURES_tune-armv8atb-fp-armv8-neon}        =
callconvention-hard"
> +TUNE_FEATURES_tune-armv8ahfb-crypto-fp-armv8-neon  =3D =
"${TUNE_FEATURES_tune-armv8ab-crypto-fp-armv8-neon}  =
callconvention-hard"
> +TUNE_FEATURES_tune-armv8athfb-crypto-fp-armv8-neon =3D =
"${TUNE_FEATURES_tune-armv8atb-crypto-fp-armv8-neon} =
callconvention-hard"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahfb                       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7vehfb} armv8ab armv8ahfb"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athfb                      =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7vethfb} armv8ab armv8ahfb armv8at2hfb"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-neon                  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb} armv8ahfb-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athfb-neon                 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athfb} armv8ahfb-neon armv8at2hfb-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-vfpv4                 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb} armv8ahfb-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athfb-vfpv4                =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athfb} armv8ahfb-vfpv4 =
armv8at2hfb-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-vfpv4-neon            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-vfpv4} armv8ahfb-neon =
armv8ahfb-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athfb-vfpv4-neon           =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-vfpv4} armv8ahfb-neon =
armv8at2hfb-neon armv8ahfb-neon-vfpv4 armv8at2hfb-neon-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-fp-armv8              =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb} armv8ahfb-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athfb-fp-armv8             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athfb} armv8ahfb-fp-armv8 =
armv8at2hfb-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-fp-armv8-neon         =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-fp-armv8} armv8ahfb-neon =
armv8ahfb-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athfb-fp-armv8-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-fp-armv8} armv8ahfb-neon =
armv8at2hfb-neon armv8ahfb-fp-armv8-neon armv8at2hfb-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crypto-fp-armv8-neon  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-fp-armv8-neon} =
armv8ahfb-crypto-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crypto-fp-armv8-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-fp-armv8-neon} =
armv8ahfb-crypto-fp-armv8-neon armv8at2hfb-crypto-fp-armv8-neon"
> +
> +# Big Endian + HF + CRC
> +AVAILTUNES +=3D "armv8ahfb-crc armv8athfb-crc armv8ahfb-crc-neon =
armv8athfb-crc-neon armv8ahfb-crc-vfpv4 armv8athfb-crc-vfpv4 =
armv8ahfb-crc-vfpv4-neon armv8athfb-crc-vfpv4-neon =
armv8ahfb-crc-fp-armv8 armv8athfb-crc-fp-armv8 =
armv8ahfb-crc-fp-armv8-neon armv8athfb-crc-fp-armv8-neon =
armv8ahfb-crc-crypto-fp-armv8-neon armv8athfb-crc-crypto-fp-armv8-neon"
> +ARMPKGARCH_tune-armv8ahfb-crc                       ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athfb-crc                      ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahfb-crc-neon                  ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athfb-crc-neon                 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahfb-crc-vfpv4                 ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athfb-crc-vfpv4                ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahfb-crc-vfpv4-neon            ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athfb-crc-vfpv4-neon           ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahfb-crc-fp-armv8              ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athfb-crc-fp-armv8             ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahfb-crc-fp-armv8-neon         ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athfb-crc-fp-armv8-neon        ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8ahfb-crc-crypto-fp-armv8-neon  ?=3D "armv8a"
> +ARMPKGARCH_tune-armv8athfb-crc-crypto-fp-armv8-neon ?=3D "armv8a"
> +TUNE_FEATURES_tune-armv8ahfb-crc                       =3D =
"${TUNE_FEATURES_tune-armv8ahfb}                       crc"
> +TUNE_FEATURES_tune-armv8athfb-crc                      =3D =
"${TUNE_FEATURES_tune-armv8athfb}                      crc"
> +TUNE_FEATURES_tune-armv8ahfb-crc-neon                  =3D =
"${TUNE_FEATURES_tune-armv8ahfb-neon}                  crc"
> +TUNE_FEATURES_tune-armv8athfb-crc-neon                 =3D =
"${TUNE_FEATURES_tune-armv8athfb-neon}                 crc"
> +TUNE_FEATURES_tune-armv8ahfb-crc-vfpv4                 =3D =
"${TUNE_FEATURES_tune-armv8ahfb-vfpv4}                 crc"
> +TUNE_FEATURES_tune-armv8athfb-crc-vfpv4                =3D =
"${TUNE_FEATURES_tune-armv8athfb-vfpv4}                crc"
> +TUNE_FEATURES_tune-armv8ahfb-crc-vfpv4-neon            =3D =
"${TUNE_FEATURES_tune-armv8ahfb-vfpv4-neon}            crc"
> +TUNE_FEATURES_tune-armv8athfb-crc-vfpv4-neon           =3D =
"${TUNE_FEATURES_tune-armv8athfb-vfpv4-neon}           crc"
> +TUNE_FEATURES_tune-armv8ahfb-crc-fp-armv8              =3D =
"${TUNE_FEATURES_tune-armv8ahfb-fp-armv8}              crc"
> +TUNE_FEATURES_tune-armv8athfb-crc-fp-armv8             =3D =
"${TUNE_FEATURES_tune-armv8athfb-fp-armv8}             crc"
> +TUNE_FEATURES_tune-armv8ahfb-crc-fp-armv8-neon         =3D =
"${TUNE_FEATURES_tune-armv8ahfb-fp-armv8-neon}         crc"
> +TUNE_FEATURES_tune-armv8athfb-crc-fp-armv8-neon        =3D =
"${TUNE_FEATURES_tune-armv8athfb-fp-armv8-neon}        crc"
> +TUNE_FEATURES_tune-armv8ahfb-crc-crypto-fp-armv8-neon  =3D =
"${TUNE_FEATURES_tune-armv8ahfb-crypto-fp-armv8-neon}  crc"
> +TUNE_FEATURES_tune-armv8athfb-crc-crypto-fp-armv8-neon =3D =
"${TUNE_FEATURES_tune-armv8athfb-crypto-fp-armv8-neon} crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crc                       =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb} armv8ahfb-crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crc                      =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athfb} armv8ahfb-crc armv8at2hfb-crc"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crc-neon                  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-neon} armv8ahfb-crc-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crc-neon                 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-neon} armv8ahfb-crc-neon =
armv8at2hfb-crc-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crc-vfpv4                 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-vfpv4} armv8ahfb-crc-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crc-vfpv4                =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-vfpv4} armv8ahfb-crc-vfpv4 =
armv8at2hfb-crc-vfpv4"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crc-vfpv4-neon            =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-vfpv4-neon} armv8ahfb-crc-neon =
armv8ahfb-crc-vfpv4-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crc-vfpv4-neon           =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-vfpv4-neon} armv8ahfb-crc-neon =
armv8at2hfb-crc-neon armv8ahfb-crc-vfpv4-neon =
armv8at2hfb-crc-vfpv4-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crc-fp-armv8              =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-fp-armv8} armv8ahfb-crc-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crc-fp-armv8             =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-fp-armv8} armv8ahfb-crc-fp-armv8 =
armv8at2hfb-crc-fp-armv8"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crc-fp-armv8-neon         =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-fp-armv8-neon} =
armv8ahfb-crc-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crc-fp-armv8-neon        =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-fp-armv8-neon} =
armv8ahfb-crc-fp-armv8-neon armv8at2hfb-crc-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crc-crypto-fp-armv8-neon  =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8ahfb-crypto-fp-armv8-neon} =
armv8ahfb-crc-crypto-fp-armv8-neon"
> +PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crc-crypto-fp-armv8-neon =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv8athfb-crypto-fp-armv8-neon} =
armv8ahfb-crc-crypto-fp-armv8-neon armv8at2hfb-crc-crypto-fp-armv8-neon"
> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc =
b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> index 1faebf7..36bb510 100644
> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> @@ -7,6 +7,7 @@ ARM_THUMB_SUFFIX .=3D =
"${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 't2', '', d
> ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7r', =
't2', '', d)}"
> ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', =
't2', '', d)}"
> ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'armv7ve', 't2', '', d)}"
> +ARM_THUMB_SUFFIX .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'armv8a', 't2', '', d)}"
>=20
> # If the device supports ARM, then respect ARM_THUMB_OPT (which can be =
"arm" or "thumb")
> # If the defice doesn't support ARM, then always set "thumb" even when
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_7B6D36C4-EC6E-486F-BDC1-82ECE42A635C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlbjYC8ACgkQuwUzVZGdMxT3pACfdvu7V8jFnwFYOGWyEj0IDN79
nsAAnAjmPYEAsf6BaDxH9zE9o4Z8AVFU
=K3Sl
-----END PGP SIGNATURE-----

--Apple-Mail=_7B6D36C4-EC6E-486F-BDC1-82ECE42A635C--
