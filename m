Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id E4159731D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 13:46:35 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id j37so3806273qta.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 06:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1C69jL2ioSQZTznDi9VD1USOCZA/t7zBHd5vnvfhQA8=;
	b=KSrmBuGujxpUjsFllSRUKoX8zhWHb1E+rDk4jicPBMI+PUTYGrgsBU0fmb5p/9ZSMH
	NtAFtNFL4/kCKwkf1FeXmjJq5GhLVHIAsI3dNwyVSPX835AD3wdUzyCJZf1DRtLtQU1Z
	QbHX37grd2XuvIXbq4gKMVQnNbU33LKexpJAV2lARMEj1D0aHyWvujR0ubvYevFx0Zsn
	6LzXlie6bENg42iVwjVoEIH/JtqLOFEtWBZoBBuAkaOwBhQtm0fV40TWdFoHm10ly2rY
	MfuO/O66/+n3jwAsOp1qKkXiz7m4cPK0ftMfK96i/pfezF6GokpP0DjdwsA7zlumH93g
	8EMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1C69jL2ioSQZTznDi9VD1USOCZA/t7zBHd5vnvfhQA8=;
	b=OAmut7n7z0xxahg79qiTMOBaX4NpEtdyPvyQCQFnX5NRySMTaxsqJaNoioRaWu8n3U
	2vfCx7kxJkLmn6sb6XUXoBI7znrkOvsY5dQ1woImGWku9MwbLejzVM/kA4SOuPzifeLk
	dF9ZtKWWf1IBTYVcXcBt68Lcc6ABn+w0TNMDmM9YFLErkmiZ6DquNZrrEJisdmdHNX3U
	HRi9w7i6+w9eBu1WfCC3LCRp9Y9OeEzvspoFPVDG9UmR3HmG+I3lH1OuQPzpvTtreZAL
	XJgS/hJAUlRLHARgJqbghLMhMf3LqvanigKptjwzkQWfdhIqheqD7+cmQWO11qogHNiA
	vTXw==
X-Gm-Message-State: ALyK8tKSN7PBEpTuEGCp6lM2EArl5BRhsoE4viBTFuSgkWqv1d7Jz3LodQU1U93rA1S2nilv5q8GZzFoXiJvAg==
X-Received: by 10.200.56.155 with SMTP id f27mr32506947qtc.26.1469108796229;
	Thu, 21 Jul 2016 06:46:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Thu, 21 Jul 2016 06:46:06 -0700 (PDT)
In-Reply-To: <1469096205.6229.18.camel@andred.net>
References: <1469071188-26218-1-git-send-email-git@andred.net>
	<76D6B136-02D8-404A-8AB1-3F236ABAB58D@gmail.com>
	<1469096205.6229.18.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jul 2016 06:46:06 -0700
Message-ID: <CAMKF1sqPjcUCpnRnwXwMWNKMsCPx6znF-5sOsTzEUHdh5WhKZg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: don't compile in mips16e mode
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
X-List-Received-Date: Thu, 21 Jul 2016 13:46:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2016 at 3:16 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> On Mi, 2016-07-20 at 20:22 -0700, Khem Raj wrote:
>> >
>> > On Jul 20, 2016, at 8:19 PM, git@andred.net wrote:
>> >
>> > From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>> >
>> > musl contains hand-written assembly which is not compatible with
>> > the MIPS16e mode.
>> >
>> > Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>> > ---
>> > meta/recipes-core/musl/musl.inc | 3 +++
>> > 1 file changed, 3 insertions(+)
>> >
>> > diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-
>> > core/musl/musl.inc
>> > index 5e6cd01..276b00f 100644
>> > --- a/meta/recipes-core/musl/musl.inc
>> > +++ b/meta/recipes-core/musl/musl.inc
>> > @@ -24,3 +24,6 @@ FILES_SOLIBSDEV =3D ""
>> > FILES_${PN} +=3D "${libdir}/lib*${SOLIBSDEV}"
>> > INSANE_SKIP_${PN} =3D "dev-so"
>> >
>> > +# Doesn't compile in MIPS16e mode due to use of hand-written
>> > +# assembly
>> > +MIPS_INSTRUCTION_SET =3D =E2=80=9Cmips"
>>
>> Looks ok. However, does it make sense to have it compiled with mips ISA
>> for a mips16e
>> part ?
>
> MIPS16e is just an optional extension (ASE) on some mips32 and mips64 par=
ts.
> There can not be mips16e only parts.

OK, yes my search also ended in finding no mips16e only SOC.

>
>> will it work in all cases or only certain SOCs
>
> MIPS_INSTRUCTION_SET in OE is implemented similar to ARM_INSTRUCTION_SET.=
 If
> set to 'mips' (as above), it will simply revert to the standard instructi=
on
> set for the part we're building for, mips32/mips64/etc.
>
> Given mips16e is an optional ASE, this currently is hooked into 24k famil=
y
> type cores in OE, only.
>
> So yes, this should not break anything.
>
> BTW, Qemu supports mips16e (if the right target is selected).
>
>
> Cheers,
> Andre'
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

