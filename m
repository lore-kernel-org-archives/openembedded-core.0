Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7D93660119
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 18:29:51 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id zm5so46914928pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 11:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=uoNBZ4BZCz9Qkshig3zMe7btEfSCFI2JKlAGJK/5+ss=;
	b=uilKvN5WGK57CDKPmN1MSyWw7N/rE0av7kI/FbVG0FK4PK7BZPm3Hhb0Og6LsHICWI
	0KJk24UTrQZEKXeqCZSYjCAoFMILSYzWUjn1w4c436cXgSRf0azlpiu9LnLIQyeUs58R
	+adST9/sj51/U37FW0wnnhwLmJfekW6aTCMLxJH4WhE9DUG1wDaMjqi1vRmls7gJuKTL
	ssPCpgtfHmtyEbRP1SiBlojYqRxgQ5m7FV2ZjdwSSgszrlTKz6GKh45Pt7vbLoi90m/3
	Yu40o1BU+dZg26yONOWeXFaCUuGPGP+rsObe7tteALnZ7mLZ43Pca9cuky2l47KJIERm
	9SUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=uoNBZ4BZCz9Qkshig3zMe7btEfSCFI2JKlAGJK/5+ss=;
	b=g/R3YAuOp2X0r5r2rI7zrPsUrcp3pnXDCyyiy+75FmGN9O2c16yLLK18InMi6PEZCL
	xQVP970QmXzwTKLNyNrDEf+kCOiRQodExUV31atwvYTKYy6AhLUd/paetTGP5MpvDmpy
	V1pMdIyhch1daIf+8COkEkgY9cKg3MJWFpTlIcd+mKhvjQmEuUuTXioszQqYKcYS1l8x
	tLJLqbJJ/flVVOv2hSty3jJ8g/6NhTtXdkfO3vpJ9E2Mx+MqRT9b1TkcNMNw0BND0Pqm
	UN47WNNMakcQ3RLgkDBIoQRsekB3S41E1mURxdjHjQftZahK/zEE4T5EWadf5EYxFtsY
	AjXQ==
X-Gm-Message-State: AD7BkJKiBKpI+q9y0I05EstUFOpErpaprWC9ei0MuEeylWxiOaOYQd+8FA9h51UPlV0RpA==
X-Received: by 10.66.160.7 with SMTP id xg7mr15393352pab.10.1459362592612;
	Wed, 30 Mar 2016 11:29:52 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:153e:3940:320e:6ae3?
	([2601:646:8800:5a9a:153e:3940:320e:6ae3])
	by smtp.gmail.com with ESMTPSA id
	ul7sm7560261pac.41.2016.03.30.11.29.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2016 11:29:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=WfMfoXjabaN0+9u52Jxy4d+HXnaJv2Hii+TEtr0JohNw@mail.gmail.com>
Date: Wed, 30 Mar 2016 11:25:19 -0700
Message-Id: <6065832E-762D-413F-AE15-9B743371EF93@gmail.com>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
	<1459203003.2322.29.camel@pbcl.net>
	<87103DB9-1813-4A3B-A68D-9BDC572BC588@gmail.com>
	<56FBF8CA.20809@windriver.com>
	<0D55B52F-DFC8-4E25-A7E7-AAEEE683894B@gmail.com>
	<CAJ86T=WfMfoXjabaN0+9u52Jxy4d+HXnaJv2Hii+TEtr0JohNw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ARMv8-A: Add tune for AArch32 state and AArch64 state
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
X-List-Received-Date: Wed, 30 Mar 2016 18:29:53 -0000
X-Groupsio-MsgNum: 80310
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2D7F7028-1171-4B5C-8A8A-3663463E3E0D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2D7F7028-1171-4B5C-8A8A-3663463E3E0D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Mar 30, 2016, at 11:10 AM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Wed, Mar 30, 2016 at 9:36 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Mar 30, 2016, at 9:03 AM, Dragomir Daniel =
<daniel.dragomir@windriver.com> wrote:
>>>=20
>>> On 03/29/2016 07:07 PM, Khem Raj wrote:
>>>>> On Mar 28, 2016, at 3:10 PM, Phil Blundell <pb@pbcl.net> wrote:
>>>>>=20
>>>>> On Mon, 2016-03-28 at 18:29 +0300, Daniel Dragomir wrote:
>>>>>> For AArch64 state, the default tune is aarch32 and include which
>>>>>>   include just the aarch64 feature.
>>>>> I don't really understand what this sentence is trying to say.  =
Can you
>>>>> re-phrase it so as to be more accessible to non-experts?
>>>>>=20
>>>>>> meta/conf/machine/include/arm/arch-arm64.inc       |  36 -------
>>>>>> meta/conf/machine/include/arm/arch-armv8.inc       |   1 -
>>>>> If you are deleting existing files, please mention that in the =
commit
>>>>> message.  And in particular, if you are removing a file that =
supports
>>>>> generic ARMv8 (if imperfectly) and replacing it with something =
that is
>>>>> specific to ARMv8-A, please explain why this is a good thing.
>>>>>=20
>>>>>> +TUNEVALID[crc] =3D "Enable CRC instructions for ARMv8-a"
>>>>>> +ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'crc', =
'-crc', '', d)}"
>>>>>> +ARMPKGSFX_FPU_64 =3D "${@bb.utils.contains('TUNE_FEATURES', =
'crc', '-crc', '', d)}"
>>>>> Why is this involved with ARMPKGSFX_FPU?  The crc instructions are =
not
>>>>> related to the fpu.  Also, the fact that you need to duplicate =
both this
>>>>> and the crypto one for both FPU and FPU_64 seems like an =
indication that
>>>>> something elsewhere is misdesigned.
>>>>>=20
>>>>>> +TUNEVALID[fp-armv8] =3D "Enable ARMv8 Vector Floating Point =
unit."
>>>>>> +ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'fp-armv8', '-fp-armv8', '', d)}"
>>>>> I don't entirely understand why this one doesn't have an FPU_64
>>>>> equivalent.  Are you always enabling vfp for A64?
>>>>>=20
>>>>>> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', =
'aarch32', 'aarch32:', '' ,d)}"
>>>>>> +MACHINEOVERRIDES .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'aarch64', ':aarch64', '' ,d)}"
>>>>> As previously discussed, I am not wild about "aarch32" as the name =
of an
>>>>> override which really means "ARMv8 in AArch32 state".  I know =
there is a
>>>>> school of thought that says that the execution state of older cpus =
is
>>>>> not AArch32 even if in practice it is indistinguishable, but this
>>>>> doesn't seem to match either the expectations that a rational user =
of OE
>>>>> is likely to have, or the information in the published literature.
>>>> Don=E2=80=99t disagree with technical argument I said that =
previously too. All I am trying
>>>> to say is lets take this opportunity to simplify arm tunes starting =
with armv8
>>>> we have this opportunity and what you suggest will keep the thread =
alive with
>>>> prior tunes. With armv8 we should match what we do for x86 and =
x86_64 ideally.
>>>=20
>>> We'll need to take a decision on this and continue the work on =
tunes.
>>>=20
>>> What is the best way to name the armv8a tunes:
>>> aarch32 and aarch64 or armv8a32 and armv8a64?
>>=20
>> We are catering armv8 here and not 64bit or 32bit arm. Thats the =
difference.
>> may be those could be added in a common file?
>> its fine to call them armv8a32 and armv8a64 it doesnt matter
>> but break the inclusion of .inc files that will drag it
>> into pre-armv8 world and define a consistent 32bit tunes
>> such that when we think armv8, we get three options
>> aarch64, aarch32, aarch32t2,
>=20
> All armv8a CPUs support Thumb2, so there's no need to distinguish
> between aarch32 and aarch32t2.

I was more talking about execution states than packaging arches.

>=20
> We've made that mistake historically for armv6 and armv7 but we
> shouldn't keep carrying it forward.
>=20
>> all the vfp options
>> may be folder into these three and also neon and others
>=20
> For most cores from Cortex A9 onwards NEON and VFP are optional, so
> hardcoded assumptions won't work.

Is it really =E2=80=98onwards=E2=80=99 or just cortexa9 was an =
exception. Can you
point to some documentation on it ?

>=20
>> Can we reach that somehow ?
>>=20
>>=20
>>>=20
>>> Who else need to express his opinion about this and make the =
decision?
>>>=20
>>> Daniel
>>>=20
>>>>=20
>>>>>> +ARMPKGARCH_tune-aarch64            ?=3D "aarch64"
>>>>> This seems a tiny bit short-sighted since presumably there will be =
an
>>>>> ARMv9 (or ARMv8.2) at some point.  What will ARMPKGARCH for A64 be =
then?
>>>>>=20
>>>>>> +BASE_LIB_tune-aarch64            =3D "lib64"
>>>>> This seems like more a matter of distro policy and I'm not sure it
>>>>> belongs in a tune file.  If it does then can't you rely on the =
aarch64
>>>>> MACHINEOVERRIDE and just write "BASE_LIB_aarch64" rather than =
having to
>>>>> duplicate this for all four of the tunes (and the -be =
equivalents)?
>>>>>=20
>>>>>> +# Duplicated from arch-arm.inc
>>>>> Please add a comment explaining why you can't include =
arch-arm.inc.
>>>>>=20
>>>>> p.
>>>>>=20
>>>>>=20
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>=20
>>=20
>>=20
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20


--Apple-Mail=_2D7F7028-1171-4B5C-8A8A-3663463E3E0D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb8GhMACgkQuwUzVZGdMxQAFACeILIgOu2iRICLmO5OHMpaa/oP
rEkAn398Uc+18mgWWG1mJzmXNcTOJUWv
=I66/
-----END PGP SIGNATURE-----

--Apple-Mail=_2D7F7028-1171-4B5C-8A8A-3663463E3E0D--
