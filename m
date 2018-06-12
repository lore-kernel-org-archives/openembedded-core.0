Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id DB11874551
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 21:47:59 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id a5-v6so339932uao.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 14:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=D4QoQ34IXJsWE0z98+lvD3xGFEXjJ+EZaAiGfPWa4YQ=;
	b=MTGXpclD2vzCP5CvO66QRVJwknRJWQlictKGHTGWf+Q/+x8tYKaNLE6UyZIGi3nv28
	Jj7KRgSzbutY88TyxyzYz7vNp5CWpmmZ8lOp3i0058siCjPZMU2Tmwo3OldByZYWouTT
	P10K29YkBQHPu4GNeYPp4xVFwPcUk6Fk6B8rNnQy4IwI6h/x1a0fTOBM2IOB85mpwp4u
	oiUodjw0SrHBe+RhWYO0G25Ycqm0Ixwt1gQAxjUFiaBlLRosIfoMk2fCjELZ9kcWPGLz
	2f21I1cJpEonGj06fLIhMeto9Mp3kbYk32Jerc+kkeOfgXQIRG/Yzmxq5Jem+ZyFSA9d
	mN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=D4QoQ34IXJsWE0z98+lvD3xGFEXjJ+EZaAiGfPWa4YQ=;
	b=hZkmxqR3UbxKV45SsgUNAEFZFvF+NTr0XiBukzJZVG3JAwOtzCWGKtP+9PEYMtpkwb
	sKYjbVzCa85wBT8FdRoupQXbQJgDX2wYpfHIl9bYf+Gw+t7sF+lO89Mqqkdq4lKAUf6e
	iPprswiiKI+kl20G+bJ/QUUYw6U8LyQAT/19HBLMF77DC+TOr2jue9zbhu2EodkEwlnA
	yeKVP1l1tptlYmVLdnsIlZrhrpcQn8XOFCY3Q2qsJji3P4tUMx0KnW0jSesqGkREVjVf
	reVG6XijMj2jAVCJkLlfpa77V8CkVMM/nUVJslP3ZdIaVBC8IIcLv/SXKqnL5OBr7+7D
	LarQ==
X-Gm-Message-State: APt69E1JYAjW6XQ+liO++B8Spal3HuLq8nP0kBQpRT6tE9b4RUj1AqBl
	ycFn1rPUgsOkYPo8WMF/4Myr0WOhXtVyHVRwHLI=
X-Google-Smtp-Source: ADUXVKJvIFmDKjLQFOQc0j0XeWastJC/rUVHCQXPAxG64f8NQ7dsIIfTwAKT+gEBosLs+xqEiRqD0QVDJfCyo94i1D4=
X-Received: by 2002:a9f:3352:: with SMTP id
	a18-v6mr1630867uac.38.1528840080692; 
	Tue, 12 Jun 2018 14:48:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Tue, 12 Jun 2018 14:48:00 -0700 (PDT)
In-Reply-To: <6ecaaa28-1748-b808-e519-72ee8642ebd6@windriver.com>
References: <20180609062628.32364-1-ayaka@soulik.info>
	<F1A6604B-E5BB-413F-B7AF-0EC7B85D5C12@dominion.thruhere.net>
	<002901d40230$0fa25690$2ee703b0$@neuf.fr>
	<ce3746c4-8919-2982-e5d9-060578057c70@windriver.com>
	<003401d40264$f548ef90$dfdaceb0$@neuf.fr>
	<16c1a187-66ef-dfb1-e8cc-4a63a75e947b@windriver.com>
	<CAJ86T=XPaV78aURUKY8bywmvD57hQacAfQ+jJ8ryf2pAYABYhw@mail.gmail.com>
	<6ecaaa28-1748-b808-e519-72ee8642ebd6@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 12 Jun 2018 14:48:00 -0700
Message-ID: <CAJ86T=UmGFzo60=P46D2ss-0S7x+xpkZYg25LfnvNnZL4iuFWA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH v2 0/4] Add tune for ARMv8 and some cortex processors
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
X-List-Received-Date: Tue, 12 Jun 2018 21:48:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 12, 2018 at 2:43 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 6/12/18 3:39 PM, Andre McCurdy wrote:
>> On Tue, Jun 12, 2018 at 1:00 PM, Mark Hatle <mark.hatle@windriver.com> w=
rote:
>>> On 6/12/18 10:49 AM, Herve Jourdain wrote:
>>>> Hi,
>>>>
>>>> So I agree with you about restricting to what gcc can support, that's =
actually my proposal (actually, probably a subset of what gcc can support).
>>>> So for armv8, gcc supports, as architectures: armv8-a, armv8.1-a, armv=
8.2-a, armv8.3-a, armv8.4-a.
>>>> Then, you can add the supported options with a "+" after the architect=
ure.
>>>> Options supported for armv8-a are: '+crc', '+simd', '+crypto', '+nocry=
pto', '+nofp'
>>>> Options supported for armv8.1-a are: '+simd', '+crypto', '+nocrypto', =
'+nofp'
>>>> Options supported for armv8.2-a and armv8.3-a are: '+fp16', '+fp16fml'=
, '+simd', '+crypto', '+dotprod', '+nocrypto', '+nofp'
>>>> Options supported for armv8.4-a are: '+fp16', '+simd', '+crypto', '+do=
tprod', '+nocrypto', '+nofp'
>>>>
>>>> As you can see, proposals for armv8-a, whether my previous one, the ne=
w one here, or even the one I have updated and used in production, just cap=
ture the existing complexity, and not add to it.
>>>> and support for armv8.1-a, armv8.2-a, armv8.3-a, armv8.4a will only ad=
d more options down the line.
>>>
>>> Sounds a lot like the above would be TUNE_FEATURES to me..  (even if we=
 don't
>>> necessarily define a tune that uses them -- if it's standard another la=
yer
>>> certainly could.)
>>>
>>>> Regarding fpu, gcc supports the following for armv8: fp-armv8, neon-fp=
-armv8, and crypto-neon-fp-armv8.
>>>>
>>>> Regarding cpu, I believe that the armv8 supported ones are: =E2=80=98c=
ortex-a32=E2=80=99, =E2=80=98cortex-a35=E2=80=99, =E2=80=98cortex-a53=E2=80=
=99, =E2=80=98cortex-a55=E2=80=99, =E2=80=98cortex-a57=E2=80=99, =E2=80=98c=
ortex-a72=E2=80=99, =E2=80=98cortex-a73=E2=80=99, =E2=80=98cortex-a75=E2=80=
=99.
>>>>
>>>> I personally would like to keep tuning for a specific CPU as much as p=
ossible (again I'm working closely with various ARM-based SoCs, so my opini=
on might be tainted).
>>>
>>> Thats a lot of options, but if we focus on TUNE_FEATURES, I think it's =
a bit
>>> more reasonable to support all of this.. (maybe that is what needs to b=
e done in
>>> the future as well for other architectures.. focus on the 'gcc' behavio=
r and
>>> generate TUNE_FEATURES matching the compiler.)
>>>
>>> I'd like Khem's opinion on how crazy of an idea that is.
>>>
>>>> One thing that could be done to simplify things would be to just use t=
he cpu, and add the options to it. Gcc supports adding options to the cpu.
>>>> '+nofp' for =E2=80=98cortex-a32=E2=80=99, =E2=80=98cortex-a35=E2=80=99=
, =E2=80=98cortex-a53=E2=80=99 and =E2=80=98cortex-a55=E2=80=99
>>>> '+crypto' for =E2=80=98cortex-a32=E2=80=99, =E2=80=98cortex-a35=E2=80=
=99, =E2=80=98cortex-a53=E2=80=99, =E2=80=98cortex-a55=E2=80=99, =E2=80=98c=
ortex-a57=E2=80=99, =E2=80=98cortex-a72=E2=80=99, =E2=80=98cortex-a73=E2=80=
=99, =E2=80=98cortex-a75=E2=80=99
>>>>
>>>> That could simplify the tune settings, but would give less control tha=
n what we currently have.
>>>> As you might have guessed, I do put a specific emphasis on the crypto =
option, and on the neon option, which are the most interesting for armv8 in=
 my opinion.
>>>
>>> In the past 'crypto' options have only been assembly.. if that's change=
d it has
>>> definitely opened up a new facet in all of this work.
>>>
>>>> Regarding thumb, always adding it to the tune without creating specifi=
c variants with or without thumb makes sense, since the tune is normally ab=
out the SoC capabilities, and arv7 and armv8 both support it.
>>>> You can always select whether you want thumb or not by setting ARM_INS=
TRUCTION_SET appropriately at the distro level.
>>>
>>> Yes, that might be needed now that thumb is theoretically always suppos=
ed to be
>>> present.
>>
>> It's not _always_ present - it's missing for armv4 CPUs such as StrongAR=
M.
>
> Always present on -modern- ARM processors.. ARMv7 (Cortex) and newer AFAI=
K.  I'm
> not referring to older cores.

OK. Thanks for clarifying.

>> However the option has been unnecessarily propagated into tuning files
>> for higher architecture levels where support for Thumb _is_ always
>> present.
>>
>

