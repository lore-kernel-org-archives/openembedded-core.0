Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wj0-f171.google.com (mail-wj0-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 975A1606CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 09:15:08 +0000 (UTC)
Received: by mail-wj0-f171.google.com with SMTP id mp19so24180152wjc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 01:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=swOzKQCRAE3kOpxdEidX0ijqyfbl1cgySWS29dXqhNM=;
	b=ew9ix6tKmY8Dk7AnZkmvxmP3mBHSur+wwgauTIxtOhALvTGNmJBzS8mttybp6eQOMi
	lECUgcDkVWtN9qtjz05PYsoyxpB4zm1bUhqPIX9+GtJgfpZit9esrqPlQgSyEcDv+QMc
	HshDPcS1mnI3RWTXpNhMKEgKp12ho73Ihs0sY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=swOzKQCRAE3kOpxdEidX0ijqyfbl1cgySWS29dXqhNM=;
	b=R4Q0wxQLxLe63mKT5+NZfbWlx2/UdxoM82CyRLghFOXKIL/gTU2o3t0pvBPESRsMvb
	jVRacioZZujlLli7JSnSP8XYfYNFmZIm9WrQ+zbli66MAZheqYecaeGA1+zSpW+UJ2Zx
	j3r6Oq2gYpedpa4Lrbg4z8s607vMPTws+XOmXJxRHgA7wr9iVG9TWLJlfTD+2qqDhzKA
	h+t2emh/jAamatkwshoqFSUG5e9GcUL+XXFF2a05C7S49jz9IJXzXpXMtdCii9fGn6DF
	uU2Ys9jgQVLVj7C8GXtPe7jhlY1b1tdbzbJTEfsIDY5XGlzxCp4m6zFysbEgONmbUO9z
	0Hlg==
X-Gm-Message-State: AKaTC01PbR5uWopOxfo1LemHKhIPfYSgelkQ3jpa0/hynik+BrH3CHZcQbh5IrvHyOqHJJ7yVXtKWLO5/oxaJXWZ
X-Received: by 10.194.58.198 with SMTP id t6mr8130235wjq.44.1479719709630;
	Mon, 21 Nov 2016 01:15:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.211.65 with HTTP; Mon, 21 Nov 2016 01:15:08 -0800 (PST)
In-Reply-To: <000001d243b4$71402850$53c078f0$@neuf.fr>
References: <1479643823-11675-1-git-send-email-herve.jourdain@neuf.fr>
	<1479643823-11675-3-git-send-email-herve.jourdain@neuf.fr>
	<CAMKF1sqhpWEsjXg-CSoYmrOvxXFHG7voCjAv78gbbV8_QG3v9Q@mail.gmail.com>
	<000001d243b4$71402850$53c078f0$@neuf.fr>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Mon, 21 Nov 2016 11:15:08 +0200
Message-ID: <CAGNsrLC_Pt4Zw0PtEXVnTwdcxVGo7tRGUSRgqpao4v5E5n0fAQ@mail.gmail.com>
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/3] arch-armv8.inc: add support for 32bits armv8 options
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
X-List-Received-Date: Mon, 21 Nov 2016 09:15:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 21 November 2016 at 07:02, Herve Jourdain <herve.jourdain@neuf.fr> wrote=
:
> Hi Khem,
>
> It does cover all the possibilities in armv8 (3 possible FPU and 2 possib=
le options - crc and crypto).
> So if we want to be exhaustive, we probably need something similar.
> If we just want to support cortex-a53, then we can trim a bit.
>
> I was not aware of the Axxia work, it could also be used in oe-core inste=
ad of my patch, actually.
> But if you check what they did, they do define nearly as many - with the =
exception of the softfloat option, in their case aarch32 is always hf. That=
's a possibility that could be considered, but I initially tried to provide=
 as much "features" for aarch32 as there was for armv7ve - including the op=
tion to do softfloat...

There is a clear statement that _currently_ there is no soft / softfp
ABI for AArch64.
For armv8-a compliant hardware it must have NEON.
But, still, one _can_ compile for aarch32-mode on armv8-a in soft or
softp float-abi, and it will run.
There is no statement that armv8-a can't use soft or soft-fp ABI from armv7=
-a.

> Please let me know what you'd like me to do, amend my patch to remove sof=
tfloat cases, or just get the axxia patches into oe-core, or something else=
?
>
> Herve
>
> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: dimanche 20 novembre 2016 20:37
> To: Herve Jourdain <herve.jourdain@neuf.fr>
> Cc: Patches and discussions about the oe-core layer <openembedded-core@li=
sts.openembedded.org>
> Subject: Re: [OE-core] [oe-core][PATCH v3 2/3] arch-armv8.inc: add suppor=
t for 32bits armv8 options
>
> I dont think we need these many variats for v8, axxia has been carrying s=
uch patches locally.
> see
> https://github.com/axxia/meta-axxia/tree/master/conf/machine/include
>
> On Sun, Nov 20, 2016 at 4:10 AM, Herve Jourdain <herve.jourdain@neuf.fr> =
wrote:
>> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
>> ---
>>  meta/conf/machine/include/arm/arch-armv8.inc | 60
>> ++++++++++++++++++++++++++++
>>  1 file changed, 60 insertions(+)
>>
>> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc
>> b/meta/conf/machine/include/arm/arch-armv8.inc
>> index 5e832fa..8c96efc 100644
>> --- a/meta/conf/machine/include/arm/arch-armv8.inc
>> +++ b/meta/conf/machine/include/arm/arch-armv8.inc
>> @@ -1 +1,61 @@
>>  require conf/machine/include/arm/arch-arm64.inc
>> +
>> +TUNEVALID[armv8] =3D "Enable instructions for ARMv8"
>> +TUNECONFLICTS[armv8] =3D "armv4 armv5 armv6 armv7 armv7a armv7ve"
>> +
>> +TUNE_CCARGS .=3D \
>> +"${@' -march=3Darmv8-a+crypto+crc' if
>> +bb.utils.contains('TUNE_FEATURES', [ 'armv8', 'cryptov8', 'crcv8' ],
>> +True, False, d) else\ ' -march=3Darmv8-a+crypto' if
>> +bb.utils.contains('TUNE_FEATURES', [ 'armv8', 'cryptov8' ], True, False=
, d) else\ ' -march=3Darmv8-a+crc' if bb.utils.contains('TUNE_FEATURES', [ =
'armv8', 'crcv8' ], True, False, d) else \ bb.utils.contains('TUNE_FEATURES=
', 'armv8', ' -march=3Darmv8-a', '', d)}"
>> +
>> +TUNE_CCARGS_MFPU .=3D \
>> +"${@' crypto-neon-fp-armv8' if bb.utils.contains('TUNE_FEATURES', [
>> +'armv8', 'neon', 'cryptov8' ], True, False, d) else \ '
>> +neon-fp-armv8' if bb.utils.contains('TUNE_FEATURES', [ 'armv8', 'neon' =
], True, False, d) else \ bb.utils.contains('TUNE_FEATURES', [ 'armv8' ], '=
 fp-armv8', '', d)}"
>> +
>> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv8', '=
armv8:', '' ,d)}"
>> +
>> +AVAILTUNES +=3D "armv8 armv8-crypto armv8-crc armv8-crypto-crc"
>> +TUNE_FEATURES_tune-armv8 =3D "armv8"
>> +TUNE_FEATURES_tune-armv8-crypto =3D "${TUNE_FEATURES_tune-armv8} crypto=
v8"
>> +TUNE_FEATURES_tune-armv8-crc =3D "${TUNE_FEATURES_tune-armv8} crcv8"
>> +TUNE_FEATURES_tune-armv8-crypto-crc =3D "${TUNE_FEATURES_tune-armv8} cr=
yptov8 crcv8"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8 =3D "armv8"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8-crypto =3D "${PACKAGE_EXTRA_ARCHS_tune-a=
rmv8} armv8-crypto"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8-crc =3D "${PACKAGE_EXTRA_ARCHS_tune-armv=
8} armv8-crc"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8-crypto-crc =3D "${PACKAGE_EXTRA_ARCHS_tu=
ne-armv8} armv8-crypto-crc"
>> +
>> +AVAILTUNES +=3D "armv8-neon armv8-neon-crypto armv8-neon-crc armv8-neon=
-crypto-crc"
>> +TUNE_FEATURES_tune-armv8-neon =3D "${TUNE_FEATURES_tune-armv8} neon"
>> +TUNE_FEATURES_tune-armv8-neon-crypto =3D "${TUNE_FEATURES_tune-armv8-cr=
ypto} neon"
>> +TUNE_FEATURES_tune-armv8-neon-crc =3D "${TUNE_FEATURES_tune-armv8-crc} =
neon"
>> +TUNE_FEATURES_tune-armv8-neon-crypto-crc =3D "${TUNE_FEATURES_tune-armv=
8-crypto-crc} neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-arm=
v8} armv8-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8-neon-crypto =3D "${PACKAGE_EXTRA_ARCHS_t=
une-armv8-crypto} armv8-neon-crypto"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8-neon-crc =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv8-crc} armv8-neon-crc"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8-neon-crypto-crc =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv8-crypto-crc} armv8-neon-crypto-crc"
>> +
>> +AVAILTUNES +=3D "armv8hf armv8hf-crypto armv8hf-crc armv8hf-crypto-crc"
>> +TUNE_FEATURES_tune-armv8hf =3D "${TUNE_FEATURES_tune-armv8} callconvent=
ion-hard"
>> +TUNE_FEATURES_tune-armv8hf-crypto =3D "${TUNE_FEATURES_tune-armv8-crypt=
o} callconvention-hard"
>> +TUNE_FEATURES_tune-armv8hf-crc =3D "${TUNE_FEATURES_tune-armv8-crc} cal=
lconvention-hard"
>> +TUNE_FEATURES_tune-armv8hf-crypto-crc =3D "${TUNE_FEATURES_tune-armv8-c=
rypto-crc} callconvention-hard"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8hf =3D "armv8hf"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-crypto =3D "${PACKAGE_EXTRA_ARCHS_tune=
-armv8hf} armv8hf-crypto"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-crc =3D "${PACKAGE_EXTRA_ARCHS_tune-ar=
mv8hf} armv8hf-crc"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-crypto-crc =3D "${PACKAGE_EXTRA_ARCHS_=
tune-armv8hf} armv8hf-crypto-crc"
>> +
>> +AVAILTUNES +=3D "armv8hf-neon armv8hf-neon-crypto armv8hf-neon-crc armv=
8hf-neon-crypto-crc"
>> +TUNE_FEATURES_tune-armv8hf-neon =3D "${TUNE_FEATURES_tune-armv8hf} neon=
"
>> +TUNE_FEATURES_tune-armv8hf-neon-crypto =3D "${TUNE_FEATURES_tune-armv8h=
f-crypto} neon"
>> +TUNE_FEATURES_tune-armv8hf-neon-crc =3D "${TUNE_FEATURES_tune-armv8hf-c=
rc} neon"
>> +TUNE_FEATURES_tune-armv8hf-neon-crypto-crc =3D "${TUNE_FEATURES_tune-ar=
mv8hf-crypto-crc} neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon =3D "${PACKAGE_EXTRA_ARCHS_tune-a=
rmv8hf} armv8hf-neon"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon-crypto =3D "${PACKAGE_EXTRA_ARCHS=
_tune-armv8hf-crypto} armv8hf-neon-crypto"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon-crc =3D "${PACKAGE_EXTRA_ARCHS_tu=
ne-armv8hf-crc} armv8hf-neon-crc"
>> +PACKAGE_EXTRA_ARCHS_tune-armv8hf-neon-crypto-crc =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv8hf-crypto-crc} armv8hf-neon-crypto-crc"
>> +
>> +TUNEVALID[cryptov8] =3D "Enable armv8 crypto extensions"
>> +TUNEVALID[crcv8] =3D "Enable armv8 crc extensions"
>> +
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

Cheers,
--=20
Fathi Boudra
Linaro.org | Open source software for ARM SoCs

