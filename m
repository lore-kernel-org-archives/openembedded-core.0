Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 48F5C60119
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 18:10:28 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id r72so110248865wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 11:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=GuAW22VZShdNpXCKtJj4p1ENSdThwKKJHrtygvQp6VE=;
	b=OcDpeKc3At7Gc4OhOeYeUA/XwXhda22mzDcepxDnlLd4Mk+bh79Lr6yA3idve545/C
	IHi9p1hQFErtt2zVKBrUThzi9ZAGwUqzd7uCmOkC1uQBMxUer/r9zjRq7aYhYX8C7KN2
	DwixKYhg7hhp3u51EFzIh0SSo5KrdfdCke6MGC17HYqXg099gy/XoNASAu3NFO3RcPmu
	GLBmM1VF+8g0Bo1Fj6p7n4HXnX4+7cJdjymMcmnCKNktFPFpu5CGz2MszKGhR45eJdvB
	GePZleoNWVf5DT4IQMBxb1Rmmt7kpSq85q08KEY6XcKCrVq85mEml6q4ygVwTGm+CluK
	25qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=GuAW22VZShdNpXCKtJj4p1ENSdThwKKJHrtygvQp6VE=;
	b=QyB+v5pM4UkKG/12eCSQFbJikLAJceP2mtcrzsPJOYBlzHX32fmniyCupa3Wh/JdRN
	fduoaMtFDf5CQbNk+JkSPOTz5qJNiICh8zh4TTzh67afqUNBkN3vQiQbiXyyTOdcZMpn
	EN1pn33OX3zoOWHIyMirElggHuCwkYA6ZALI/ClH1D3bLWYaBRsxXCk0Evq5qLU0I7sG
	hgi2BhZJXpsKR31vENKhzBQIc0flbWxjLk8l4zU2bAY09h4qoKqTHkOjdYDZWEIS72qx
	fZdrjT8HpvadT8kAKJuXEJRkq6Y/RhseiaQ0MF3GyLvP+JXulKz7hSDOrV4GTeRB1QhZ
	isSA==
X-Gm-Message-State: AD7BkJJEBtDUA8va+sxUC+Uqk2N2V5uWha9S+7Atns+bn6VJR9Grs4zNgx61R+uQPH6h753Bz2fF0iO3sxVXHw==
MIME-Version: 1.0
X-Received: by 10.28.0.148 with SMTP id 142mr11359963wma.72.1459361428888;
	Wed, 30 Mar 2016 11:10:28 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Wed, 30 Mar 2016 11:10:28 -0700 (PDT)
In-Reply-To: <0D55B52F-DFC8-4E25-A7E7-AAEEE683894B@gmail.com>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
	<1459203003.2322.29.camel@pbcl.net>
	<87103DB9-1813-4A3B-A68D-9BDC572BC588@gmail.com>
	<56FBF8CA.20809@windriver.com>
	<0D55B52F-DFC8-4E25-A7E7-AAEEE683894B@gmail.com>
Date: Wed, 30 Mar 2016 11:10:28 -0700
Message-ID: <CAJ86T=WfMfoXjabaN0+9u52Jxy4d+HXnaJv2Hii+TEtr0JohNw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 30 Mar 2016 18:10:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 9:36 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mar 30, 2016, at 9:03 AM, Dragomir Daniel <daniel.dragomir@windriver.=
com> wrote:
>>
>> On 03/29/2016 07:07 PM, Khem Raj wrote:
>>>> On Mar 28, 2016, at 3:10 PM, Phil Blundell <pb@pbcl.net> wrote:
>>>>
>>>> On Mon, 2016-03-28 at 18:29 +0300, Daniel Dragomir wrote:
>>>>> For AArch64 state, the default tune is aarch32 and include which
>>>>>    include just the aarch64 feature.
>>>> I don't really understand what this sentence is trying to say.  Can yo=
u
>>>> re-phrase it so as to be more accessible to non-experts?
>>>>
>>>>> meta/conf/machine/include/arm/arch-arm64.inc       |  36 -------
>>>>> meta/conf/machine/include/arm/arch-armv8.inc       |   1 -
>>>> If you are deleting existing files, please mention that in the commit
>>>> message.  And in particular, if you are removing a file that supports
>>>> generic ARMv8 (if imperfectly) and replacing it with something that is
>>>> specific to ARMv8-A, please explain why this is a good thing.
>>>>
>>>>> +TUNEVALID[crc] =3D "Enable CRC instructions for ARMv8-a"
>>>>> +ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'crc', '-c=
rc', '', d)}"
>>>>> +ARMPKGSFX_FPU_64 =3D "${@bb.utils.contains('TUNE_FEATURES', 'crc', '=
-crc', '', d)}"
>>>> Why is this involved with ARMPKGSFX_FPU?  The crc instructions are not
>>>> related to the fpu.  Also, the fact that you need to duplicate both th=
is
>>>> and the crypto one for both FPU and FPU_64 seems like an indication th=
at
>>>> something elsewhere is misdesigned.
>>>>
>>>>> +TUNEVALID[fp-armv8] =3D "Enable ARMv8 Vector Floating Point unit."
>>>>> +ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'fp-armv8'=
, '-fp-armv8', '', d)}"
>>>> I don't entirely understand why this one doesn't have an FPU_64
>>>> equivalent.  Are you always enabling vfp for A64?
>>>>
>>>>> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'aarch3=
2', 'aarch32:', '' ,d)}"
>>>>> +MACHINEOVERRIDES .=3D "${@bb.utils.contains('TUNE_FEATURES', 'aarch6=
4', ':aarch64', '' ,d)}"
>>>> As previously discussed, I am not wild about "aarch32" as the name of =
an
>>>> override which really means "ARMv8 in AArch32 state".  I know there is=
 a
>>>> school of thought that says that the execution state of older cpus is
>>>> not AArch32 even if in practice it is indistinguishable, but this
>>>> doesn't seem to match either the expectations that a rational user of =
OE
>>>> is likely to have, or the information in the published literature.
>>> Don=E2=80=99t disagree with technical argument I said that previously t=
oo. All I am trying
>>> to say is lets take this opportunity to simplify arm tunes starting wit=
h armv8
>>> we have this opportunity and what you suggest will keep the thread aliv=
e with
>>> prior tunes. With armv8 we should match what we do for x86 and x86_64 i=
deally.
>>
>> We'll need to take a decision on this and continue the work on tunes.
>>
>> What is the best way to name the armv8a tunes:
>> aarch32 and aarch64 or armv8a32 and armv8a64?
>
> We are catering armv8 here and not 64bit or 32bit arm. Thats the differen=
ce.
> may be those could be added in a common file?
> its fine to call them armv8a32 and armv8a64 it doesnt matter
> but break the inclusion of .inc files that will drag it
> into pre-armv8 world and define a consistent 32bit tunes
> such that when we think armv8, we get three options
> aarch64, aarch32, aarch32t2,

All armv8a CPUs support Thumb2, so there's no need to distinguish
between aarch32 and aarch32t2.

We've made that mistake historically for armv6 and armv7 but we
shouldn't keep carrying it forward.

> all the vfp options
> may be folder into these three and also neon and others

For most cores from Cortex A9 onwards NEON and VFP are optional, so
hardcoded assumptions won't work.

> Can we reach that somehow ?
>
>
>>
>> Who else need to express his opinion about this and make the decision?
>>
>> Daniel
>>
>>>
>>>>> +ARMPKGARCH_tune-aarch64            ?=3D "aarch64"
>>>> This seems a tiny bit short-sighted since presumably there will be an
>>>> ARMv9 (or ARMv8.2) at some point.  What will ARMPKGARCH for A64 be the=
n?
>>>>
>>>>> +BASE_LIB_tune-aarch64            =3D "lib64"
>>>> This seems like more a matter of distro policy and I'm not sure it
>>>> belongs in a tune file.  If it does then can't you rely on the aarch64
>>>> MACHINEOVERRIDE and just write "BASE_LIB_aarch64" rather than having t=
o
>>>> duplicate this for all four of the tunes (and the -be equivalents)?
>>>>
>>>>> +# Duplicated from arch-arm.inc
>>>> Please add a comment explaining why you can't include arch-arm.inc.
>>>>
>>>> p.
>>>>
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

