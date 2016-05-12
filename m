Return-Path: <raj.khem@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id E869C60118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 14:26:33 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id n2so1633283obo.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Y3Dks64KZuAjQ8R1UhXKFONUUgY4sDn+X2r3Y2vt7Ow=;
	b=tmY9OunWigraR1CX6mRpCgfQFtFHmzxzPvCuaM3B7bGPZ9PJ2FwfX2N1WY0hBComq+
	+81/PaYA+HydcBgaSv4+giqrC2MDN48EApSOGFKTuu1hEgw6EUZeWyNU9boQLUj2xARu
	50mcSlOOwkqFtMaAkz9Y6Ttw+35t31B+xoA+Lh4Ltyhyfy3vIm7HtzYScYEPAb3TMQ2U
	CZ61FqhzcJo5A8gKLmsO9JVt03rhOxWFV0XK6ZpaOYsl8MTv7alFqWr8XdxIkXz6Mo/E
	dejOSP15T6ouzWBBgDLmSeSj70LL/E5BQTL1hGLRjwIkpKDVKXdZN+udiB6ID4lw/vUn
	e2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Y3Dks64KZuAjQ8R1UhXKFONUUgY4sDn+X2r3Y2vt7Ow=;
	b=iEVcDBSJydBrhOBtW6J4kF9y3D3yoGxBKZrONVw7YkQNOusaLUoLg5bn3xGGpvWW1q
	t5Dtl/IfT/rZLx+/mnIJvCTukMdLzy8gI4lwEBJPfnse7M7+KQN3V1Tpu3GbRxEVe3dN
	42zRuxQM4JmQOMR8xb4k9/9ZAEWSG5PId8n8dIMrnt3i5yhHqsom6OP/ctDrcc+9e4UQ
	0xMUaLMSPat9CCoQTs0skBHzkQO/ilZv3LDRvws0dMou2HwK/CX4qmZhUxjWVbhfFOTY
	ajahkIlirGCgZ2Z2cUCjx91nDSnmYBAVSEAkDVLE+mTJKPazbNG5/77ChOwKoycgQyAU
	6aLA==
X-Gm-Message-State: AOPr4FVhNVTLh+kbyHo8cx9EMUP2k6EsK7tgN0bkEs/bdEYinLTccEiWcwthijbh63P/X/+rGqlpjnu4jU+Y7Q==
X-Received: by 10.140.150.20 with SMTP id 20mr10287773qhw.98.1463063167489;
	Thu, 12 May 2016 07:26:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Thu, 12 May 2016 07:25:38 -0700 (PDT)
In-Reply-To: <1463046684.29915.33.camel@andred.net>
References: <1461662879-21557-1-git-send-email-git@andred.net>
	<571935B4-DB58-4820-BBEA-AA6668098755@gmail.com>
	<1463046684.29915.33.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 May 2016 07:25:38 -0700
Message-ID: <CAMKF1spC5gcZy_M2q6FcUcfqqBDf+spr0k9wzOkcY-PBFGpB1Q@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 12 May 2016 14:26:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2016 at 2:51 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> OK. Any suggestions for how to best fix that?
>
> I could be more specific and .replace('vfpv3-d16', 'vfpv3d16') only, but
> that seems ugly :-)

There seem to be no other usecase where '-' is used in fpu names so it
should be ok

>
>
> Thanks,
> Andr=C3=A9
>
> On Mi, 2016-05-11 at 11:55 -0700, Khem Raj wrote:
>> This causes raspberrypi2 not parse anymore
>>
>> ERROR:  OE-core's config sanity checker detected a potential
>> misconfiguration.
>>     Either fix the cause of this error or at your own risk disable the
>> checker (see sanity.conf).
>>     Following is the list of potential problems / advisories:
>>
>>     Error, the PACKAGE_ARCHS variable (all any noarch armv5hf-vfp
>> armv5thf-vfp armv5ehf-vfp armv5tehf-vfp armv6hf-vfp a
>> rmv6thf-vfp armv7ahf-vfp armv7at2hf-vfp armv7vehf-vfp armv7vet2hf-vfp
>> armv7vehf-neon armv7vet2hf-neon armv7vehf-neon-vf
>> pv4 armv7vet2hf-neon-vfpv4 cortexa7hf-vfp cortexa7hf-neon cortexa7hf-neo=
n-
>> vfpv4 cortexa7t2hf-vfp cortexa7t2hf-neon cort
>> exa7t2hf-neon-vfpv4 raspberrypi3) for DEFAULTTUNE (cortexa7thf-neon-vfpv=
4)
>> does not contain TUNE_PKGARCH (cortexa7hf-ne
>> onvfpv4).
>>
>>
>> >
>> > On Apr 26, 2016, at 2:27 AM, Andr=C3=A9 Draszik <git@andred.net> wrote=
:
>> >
>> > Commit 6661718 (feature-arm-{neon,vfp}.inc: refactor and fix issues)
>> > effectively changed the gcc -mfpu=3D option from -mfpu=3Dvfpv3-d16 to
>> > -mfpu=3Dvfpv3d16, which gcc doesn't understand.
>> >
>> > Restore the original value.
>> >
>> > After doing that, we also need to adjust ARMPKGSFX_FPU which should
>> > contain the same value without dash '-' as it is used that way
>> > throughout.
>> >
>> > Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
>> > ---
>> > meta/conf/machine/include/arm/feature-arm-neon.inc | 2 +-
>> > meta/conf/machine/include/arm/feature-arm-vfp.inc  | 2 +-
>> > 2 files changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc
>> > b/meta/conf/machine/include/arm/feature-arm-neon.inc
>> > index 50d9175..b34af8e 100644
>> > --- a/meta/conf/machine/include/arm/feature-arm-neon.inc
>> > +++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
>> > @@ -8,7 +8,7 @@ TUNEVALID[neon] =3D "Enable Neon SIMD accelerator unit=
."
>> > TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'neon', '
>> > neon', '', d)}"
>> >
>> > TUNEVALID[vfpv3d16] =3D "Enable Vector Floating Point Version 3 with 1=
6
>> > registers (vfpv3-d16) unit."
>> > -TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d1=
6',
>> > ' vfpv3d16', '', d)}"
>> > +TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d1=
6',
>> > ' vfpv3-d16', '', d)}"
>> >
>> > TUNEVALID[vfpv3] =3D "Enable Vector Floating Point Version 3 with 32
>> > registers (vfpv3) unit."
>> > TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', =
'
>> > vfpv3', '' , d)}"
>> > diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc
>> > b/meta/conf/machine/include/arm/feature-arm-vfp.inc
>> > index 4247255..bd366a1 100644
>> > --- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
>> > +++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
>> > @@ -6,7 +6,7 @@ TUNEVALID[vfp] =3D "Enable Vector Floating Point (vfp)
>> > unit."
>> > TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfp', '
>> > vfp', '', d)}"
>> >
>> > TUNE_CCARGS  .=3D "${@ (' -mfpu=3D%s ' % d.getVar('TUNE_CCARGS_MFPU',
>> > True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) !=3D '') els=
e
>> > ''}"
>> > -ARMPKGSFX_FPU =3D "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU',
>> > True).split()[-1]) if (d.getVar('TUNE_CCARGS_MFPU', True) !=3D '') els=
e
>> > ''}"
>> > +ARMPKGSFX_FPU =3D "${@ ('-%s'        % d.getVar('TUNE_CCARGS_MFPU',
>> > True).split()[-1].replace('-', '')) if (d.getVar('TUNE_CCARGS_MFPU',
>> > True) !=3D '') else ''}"
>> >
>> > TUNEVALID[callconvention-hard] =3D "Enable EABI hard float call
>> > convention, requires VFP."
>> > TUNE_CCARGS_MFLOAT =3D "${@ bb.utils.contains('TUNE_FEATURES',
>> > 'callconvention-hard', 'hard', 'softfp', d) if
>> > (d.getVar('TUNE_CCARGS_MFPU', True) !=3D '') else '' }"
>> > --
>> > 2.8.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

