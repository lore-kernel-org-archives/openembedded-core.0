Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id E3D3F77E44
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 20:39:41 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id i3-v6so227363uad.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 13:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PtCr0QU91mtYnFgPNidt7PwZwtpLJlRly8hni3WAUps=;
	b=rSkSBbmpfLPe34Lr6w4Ig+FZiiiIa1aCf1Rp3pSXbY87JzVqxrYplm3ePSBUvSaiCR
	ejQK1hlx08Lz0bIiUNYtXMca1jth9PpTTuZQRO6PabTfAqQMKDtGwkHIQZhNtmWxjrDF
	e/1yQSP8JP9aQaZfSGDtmuF9EjHtTpN+VEmgKkA6fqfsXCC1FAdYFtlUtf2HNk1LgBsV
	3jhwMgbM3dhVqueKLntu6dCR5m68U6xpxFT05gXN/rPaghGR0m2ADLj/k2vWYgwhGUnq
	EFGsQFeBTNTSbieFUHKmMAA0X5vZnbXUe4/64TwBwd1TH3mEsRxlOspINKQkxM5qOiu5
	Tang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PtCr0QU91mtYnFgPNidt7PwZwtpLJlRly8hni3WAUps=;
	b=plZ7b9CUvJBswCjVglPP+ZtBAEcbxY8PhG+ay2Q5MbT9nK7EarkiYvjQSyx7ynwmV/
	Gx2SHmPgrMbmeXK8yLDyoz1uUCDrvj0m7U6Xq5lU4enlpAplg7FQsxrFCQ/EWNa1MHNp
	gRSPvAWcIESqqYgQjAytc658rPcoutm8FFInKdC/aM8GemUCk7Fj0Ty4HxQbRleww+xA
	dt6GyoSapXvTZVghwNYoltWMb2nEpaS/RG4EHhH7iqOGCeuzl5PpiAR5W19Ua63Lf70v
	V8JgaGQ4PSey70Cb1WE3Zz4SOkUXfW8WM024XGWnzOjA1YpOBaXcL+ixA3WwPCfHcd0M
	GFiw==
X-Gm-Message-State: APt69E2dFZlvR0IW26zl2nFEsCvgh4vXJRM+kR8gXWGt8Cem91jx/ihK
	a4rzqlT2D3VsuZjXXgpi8f72sIH2XywFfF7LTe8=
X-Google-Smtp-Source: ADUXVKI/GtBdvAyQHN4p+X56+l4c6Le+k8EfKWM4MS6m6qBeI8tA2WcgIdotDxLaCHHy16oZawOTPzCD3UsnHNtXmp8=
X-Received: by 2002:a9f:3352:: with SMTP id
	a18-v6mr1465790uac.38.1528835982608; 
	Tue, 12 Jun 2018 13:39:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Tue, 12 Jun 2018 13:39:41 -0700 (PDT)
In-Reply-To: <16c1a187-66ef-dfb1-e8cc-4a63a75e947b@windriver.com>
References: <20180609062628.32364-1-ayaka@soulik.info>
	<F1A6604B-E5BB-413F-B7AF-0EC7B85D5C12@dominion.thruhere.net>
	<002901d40230$0fa25690$2ee703b0$@neuf.fr>
	<ce3746c4-8919-2982-e5d9-060578057c70@windriver.com>
	<003401d40264$f548ef90$dfdaceb0$@neuf.fr>
	<16c1a187-66ef-dfb1-e8cc-4a63a75e947b@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 12 Jun 2018 13:39:41 -0700
Message-ID: <CAJ86T=XPaV78aURUKY8bywmvD57hQacAfQ+jJ8ryf2pAYABYhw@mail.gmail.com>
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
X-List-Received-Date: Tue, 12 Jun 2018 20:39:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 12, 2018 at 1:00 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 6/12/18 10:49 AM, Herve Jourdain wrote:
>> Hi,
>>
>> So I agree with you about restricting to what gcc can support, that's ac=
tually my proposal (actually, probably a subset of what gcc can support).
>> So for armv8, gcc supports, as architectures: armv8-a, armv8.1-a, armv8.=
2-a, armv8.3-a, armv8.4-a.
>> Then, you can add the supported options with a "+" after the architectur=
e.
>> Options supported for armv8-a are: '+crc', '+simd', '+crypto', '+nocrypt=
o', '+nofp'
>> Options supported for armv8.1-a are: '+simd', '+crypto', '+nocrypto', '+=
nofp'
>> Options supported for armv8.2-a and armv8.3-a are: '+fp16', '+fp16fml', =
'+simd', '+crypto', '+dotprod', '+nocrypto', '+nofp'
>> Options supported for armv8.4-a are: '+fp16', '+simd', '+crypto', '+dotp=
rod', '+nocrypto', '+nofp'
>>
>> As you can see, proposals for armv8-a, whether my previous one, the new =
one here, or even the one I have updated and used in production, just captu=
re the existing complexity, and not add to it.
>> and support for armv8.1-a, armv8.2-a, armv8.3-a, armv8.4a will only add =
more options down the line.
>
> Sounds a lot like the above would be TUNE_FEATURES to me..  (even if we d=
on't
> necessarily define a tune that uses them -- if it's standard another laye=
r
> certainly could.)
>
>> Regarding fpu, gcc supports the following for armv8: fp-armv8, neon-fp-a=
rmv8, and crypto-neon-fp-armv8.
>>
>> Regarding cpu, I believe that the armv8 supported ones are: =E2=80=98cor=
tex-a32=E2=80=99, =E2=80=98cortex-a35=E2=80=99, =E2=80=98cortex-a53=E2=80=
=99, =E2=80=98cortex-a55=E2=80=99, =E2=80=98cortex-a57=E2=80=99, =E2=80=98c=
ortex-a72=E2=80=99, =E2=80=98cortex-a73=E2=80=99, =E2=80=98cortex-a75=E2=80=
=99.
>>
>> I personally would like to keep tuning for a specific CPU as much as pos=
sible (again I'm working closely with various ARM-based SoCs, so my opinion=
 might be tainted).
>
> Thats a lot of options, but if we focus on TUNE_FEATURES, I think it's a =
bit
> more reasonable to support all of this.. (maybe that is what needs to be =
done in
> the future as well for other architectures.. focus on the 'gcc' behavior =
and
> generate TUNE_FEATURES matching the compiler.)
>
> I'd like Khem's opinion on how crazy of an idea that is.
>
>> One thing that could be done to simplify things would be to just use the=
 cpu, and add the options to it. Gcc supports adding options to the cpu.
>> '+nofp' for =E2=80=98cortex-a32=E2=80=99, =E2=80=98cortex-a35=E2=80=99, =
=E2=80=98cortex-a53=E2=80=99 and =E2=80=98cortex-a55=E2=80=99
>> '+crypto' for =E2=80=98cortex-a32=E2=80=99, =E2=80=98cortex-a35=E2=80=99=
, =E2=80=98cortex-a53=E2=80=99, =E2=80=98cortex-a55=E2=80=99, =E2=80=98cort=
ex-a57=E2=80=99, =E2=80=98cortex-a72=E2=80=99, =E2=80=98cortex-a73=E2=80=99=
, =E2=80=98cortex-a75=E2=80=99
>>
>> That could simplify the tune settings, but would give less control than =
what we currently have.
>> As you might have guessed, I do put a specific emphasis on the crypto op=
tion, and on the neon option, which are the most interesting for armv8 in m=
y opinion.
>
> In the past 'crypto' options have only been assembly.. if that's changed =
it has
> definitely opened up a new facet in all of this work.
>
>> Regarding thumb, always adding it to the tune without creating specific =
variants with or without thumb makes sense, since the tune is normally abou=
t the SoC capabilities, and arv7 and armv8 both support it.
>> You can always select whether you want thumb or not by setting ARM_INSTR=
UCTION_SET appropriately at the distro level.
>
> Yes, that might be needed now that thumb is theoretically always supposed=
 to be
> present.

It's not _always_ present - it's missing for armv4 CPUs such as StrongARM.

However the option has been unnecessarily propagated into tuning files
for higher architecture levels where support for Thumb _is_ always
present.

