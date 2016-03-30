Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9F3586612C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 18:53:36 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id 127so108301114wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 11:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=RVh3s/u6ZpSYLNyWkW4QOynPb3aLdNldPYTT4eAXa1s=;
	b=NSj0KOU/FMvtl3L7UlMKQ/t3m/4MUrDR50pU88dLWPnByj8QTiELQqMmfcYJdcy5k/
	/6RfxjfzXkD6Q9TgyqskO3QjiocLt455/64pOiblSPHr6XS24vqFRtaz6iCwJIkrHs6g
	m+zN+mVMSw2GBgirXMJzoJxrvoKkXkNwSdSsCU/5fjH8tDzgu9eTiKMLEVjvuPgRMz36
	7aNz1nKg4YRlHvEzO2UOMIwdvNASF3yqKfkomjUG3r9+neDcin0C0eguCQkm8ThwRJka
	UfeNjSX25SEr+YvEcdrYucMV89JFj5SWtFrCjbkEElomGwqNavit0iww1ALi5IXr4sTY
	CfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=RVh3s/u6ZpSYLNyWkW4QOynPb3aLdNldPYTT4eAXa1s=;
	b=lFfyrERy7k5KgOMvPG/y46WXeDo3VuI5mfMOIkMXyHBa+F/moyZ6O2vbsVHEvYPqlS
	K6R64GEdLyfI39S0ea++PlwpVyi9n82z6F6Vy0apwGi5xaKKrlV1TvbJUN2/5wB+XP82
	U1fYnyls/1dD8m/nENtIRdRzYrfSzdrY1Z5G+JBnZcZ1WQoVezxD9p1amUvrVOO+sqbj
	J+rA7JvtwFDgv4S5nw8hjlbfAps5MNZB1NUhSiEi38Nv5OJ+eQBtrIqKe/HE3PJP9j5U
	hZZJEH9scX7gdrbbWFb/YXoQGn910+s3VwOZOsrkfqiI0mZs5tuZC+hirniYxF4EJzZ3
	+HWg==
X-Gm-Message-State: AD7BkJL14AlrRpJrsJ/0t51nPf4cEDe4L+ojjfuYP3HnhhB7sfUxAQOh2DzE9mY0+Rt8kJfC6SAM2RAmlQaXdg==
MIME-Version: 1.0
X-Received: by 10.28.59.87 with SMTP id i84mr24611626wma.61.1459364017100;
	Wed, 30 Mar 2016 11:53:37 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Wed, 30 Mar 2016 11:53:37 -0700 (PDT)
In-Reply-To: <6065832E-762D-413F-AE15-9B743371EF93@gmail.com>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
	<1459203003.2322.29.camel@pbcl.net>
	<87103DB9-1813-4A3B-A68D-9BDC572BC588@gmail.com>
	<56FBF8CA.20809@windriver.com>
	<0D55B52F-DFC8-4E25-A7E7-AAEEE683894B@gmail.com>
	<CAJ86T=WfMfoXjabaN0+9u52Jxy4d+HXnaJv2Hii+TEtr0JohNw@mail.gmail.com>
	<6065832E-762D-413F-AE15-9B743371EF93@gmail.com>
Date: Wed, 30 Mar 2016 11:53:37 -0700
Message-ID: <CAJ86T=V8ftVDVY498MULYspLE57JvzPCOgQhCk_hp-8UbTuBEg@mail.gmail.com>
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
X-List-Received-Date: Wed, 30 Mar 2016 18:53:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 11:25 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mar 30, 2016, at 11:10 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Wed, Mar 30, 2016 at 9:36 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>> On Mar 30, 2016, at 9:03 AM, Dragomir Daniel <daniel.dragomir@windrive=
r.com> wrote:
>>>>
>>>> On 03/29/2016 07:07 PM, Khem Raj wrote:
>>>>>> On Mar 28, 2016, at 3:10 PM, Phil Blundell <pb@pbcl.net> wrote:
>>>>>>
>>>>>> On Mon, 2016-03-28 at 18:29 +0300, Daniel Dragomir wrote:
>>>>>>> For AArch64 state, the default tune is aarch32 and include which
>>>>>>>   include just the aarch64 feature.
>>>>>> I don't really understand what this sentence is trying to say.  Can =
you
>>>>>> re-phrase it so as to be more accessible to non-experts?
>>>>>>
>>>>>>> meta/conf/machine/include/arm/arch-arm64.inc       |  36 -------
>>>>>>> meta/conf/machine/include/arm/arch-armv8.inc       |   1 -
>>>>>> If you are deleting existing files, please mention that in the commi=
t
>>>>>> message.  And in particular, if you are removing a file that support=
s
>>>>>> generic ARMv8 (if imperfectly) and replacing it with something that =
is
>>>>>> specific to ARMv8-A, please explain why this is a good thing.
>>>>>>
>>>>>>> +TUNEVALID[crc] =3D "Enable CRC instructions for ARMv8-a"
>>>>>>> +ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'crc', '=
-crc', '', d)}"
>>>>>>> +ARMPKGSFX_FPU_64 =3D "${@bb.utils.contains('TUNE_FEATURES', 'crc',=
 '-crc', '', d)}"
>>>>>> Why is this involved with ARMPKGSFX_FPU?  The crc instructions are n=
ot
>>>>>> related to the fpu.  Also, the fact that you need to duplicate both =
this
>>>>>> and the crypto one for both FPU and FPU_64 seems like an indication =
that
>>>>>> something elsewhere is misdesigned.
>>>>>>
>>>>>>> +TUNEVALID[fp-armv8] =3D "Enable ARMv8 Vector Floating Point unit."
>>>>>>> +ARMPKGSFX_FPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'fp-armv=
8', '-fp-armv8', '', d)}"
>>>>>> I don't entirely understand why this one doesn't have an FPU_64
>>>>>> equivalent.  Are you always enabling vfp for A64?
>>>>>>
>>>>>>> +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'aarc=
h32', 'aarch32:', '' ,d)}"
>>>>>>> +MACHINEOVERRIDES .=3D "${@bb.utils.contains('TUNE_FEATURES', 'aarc=
h64', ':aarch64', '' ,d)}"
>>>>>> As previously discussed, I am not wild about "aarch32" as the name o=
f an
>>>>>> override which really means "ARMv8 in AArch32 state".  I know there =
is a
>>>>>> school of thought that says that the execution state of older cpus i=
s
>>>>>> not AArch32 even if in practice it is indistinguishable, but this
>>>>>> doesn't seem to match either the expectations that a rational user o=
f OE
>>>>>> is likely to have, or the information in the published literature.
>>>>> Don=E2=80=99t disagree with technical argument I said that previously=
 too. All I am trying
>>>>> to say is lets take this opportunity to simplify arm tunes starting w=
ith armv8
>>>>> we have this opportunity and what you suggest will keep the thread al=
ive with
>>>>> prior tunes. With armv8 we should match what we do for x86 and x86_64=
 ideally.
>>>>
>>>> We'll need to take a decision on this and continue the work on tunes.
>>>>
>>>> What is the best way to name the armv8a tunes:
>>>> aarch32 and aarch64 or armv8a32 and armv8a64?
>>>
>>> We are catering armv8 here and not 64bit or 32bit arm. Thats the differ=
ence.
>>> may be those could be added in a common file?
>>> its fine to call them armv8a32 and armv8a64 it doesnt matter
>>> but break the inclusion of .inc files that will drag it
>>> into pre-armv8 world and define a consistent 32bit tunes
>>> such that when we think armv8, we get three options
>>> aarch64, aarch32, aarch32t2,
>>
>> All armv8a CPUs support Thumb2, so there's no need to distinguish
>> between aarch32 and aarch32t2.
>
> I was more talking about execution states than packaging arches.

Either way it shouldn't be a concern for the CPU tuning files.
Building Thumb2 for an armv8a CPU is really just an extension of
"optimise for size" and we don't include -Os, -O2, etc options in the
CPU tuning files.

>> We've made that mistake historically for armv6 and armv7 but we
>> shouldn't keep carrying it forward.
>>
>>> all the vfp options
>>> may be folder into these three and also neon and others
>>
>> For most cores from Cortex A9 onwards NEON and VFP are optional, so
>> hardcoded assumptions won't work.
>
> Is it really =E2=80=98onwards=E2=80=99 or just cortexa9 was an exception.=
 Can you
> point to some documentation on it ?

Nothing very concrete. The ARM Cortex-A Series Programmer=E2=80=99s Guide f=
or
ARMv8-A mentions:

"Both floating-point and NEON are required in all standard ARMv8
implementations. However, implementations targeting specialized
markets may support the following combinations:

 - No NEON or floating-point.
 - Full floating-point and SIMD support with exception trapping.
 - Full floating-point and SIMD support without exception trapping.

http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.den0024a/CJHE=
CGIH.html

>>
>>> Can we reach that somehow ?
>>>
>>>
>>>>
>>>> Who else need to express his opinion about this and make the decision?
>>>>
>>>> Daniel
>>>>
>>>>>
>>>>>>> +ARMPKGARCH_tune-aarch64            ?=3D "aarch64"
>>>>>> This seems a tiny bit short-sighted since presumably there will be a=
n
>>>>>> ARMv9 (or ARMv8.2) at some point.  What will ARMPKGARCH for A64 be t=
hen?
>>>>>>
>>>>>>> +BASE_LIB_tune-aarch64            =3D "lib64"
>>>>>> This seems like more a matter of distro policy and I'm not sure it
>>>>>> belongs in a tune file.  If it does then can't you rely on the aarch=
64
>>>>>> MACHINEOVERRIDE and just write "BASE_LIB_aarch64" rather than having=
 to
>>>>>> duplicate this for all four of the tunes (and the -be equivalents)?
>>>>>>
>>>>>>> +# Duplicated from arch-arm.inc
>>>>>> Please add a comment explaining why you can't include arch-arm.inc.
>>>>>>
>>>>>> p.
>>>>>>
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>>
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>

