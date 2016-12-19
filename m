Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 31AF9772DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 16:44:27 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id b35so9139568uaa.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 08:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=0hMQzkpu9SPjzS2ylempbXhd3AJj3c4yvPceJK8Fexo=;
	b=e6PiT99FbOfL9cGEXhWMO5xPLfonTrzWPTdOScEE1bsi+PLWWmJCBCQC1cDk+DNW80
	YNAzPedG7XD7gh1rQjtERKT7zu7mbVmLy7p9zA8oFiT4TPFuAnJEZEiSeO8Dqw0Mjb/t
	P2phz4jlDDT3IOjXwH7yWkSOTFoKL7vWY02lqrTXZ7MOoMEyviwr+puO9Rozxj7R/a9c
	MhzVfpOAgL4FHnHvtiyLXmUJ2IefYRELVMZKt4jyUkfaX7h+lDGmQ2Y48i9E8StfTGwP
	c1uYnKFxx7CQ76sdD3ouQNvOaSUVhg0VL19DFHAqDYMwHsoGPJZ7qp5pKrPS04Nrd+8w
	NmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0hMQzkpu9SPjzS2ylempbXhd3AJj3c4yvPceJK8Fexo=;
	b=bpktB2AGfmMWb5+lsCST1pnLuGFQyIOFJlSBwf1u5tLgZEHQIOXFpwG2gjCZqXG1uu
	15UDzXrNFKeO95YRM0ICBXtT5eNYWlNhlaf3eWRwZQDfQ9++Cjks9hoHTUwjJN8jfqAY
	4DSYgI79/tx07siy/3Xdm0NyFws45Mat5pel3K9rWNGjdR2czVzeDdumP/qBmt++A/lp
	SJ8QJOZRgostEAohs4CbyL6a5suEOne0o5Ca/G/4dB7YTGUq2JsIDkOkUafVX0QhBXq6
	jjoyKa9Ly2PGNxpNj1usMrYSlyxceMKck8JmaE43sxlIp5SmDdnrQ/qMIRgzSJ9DwdhH
	V0+g==
X-Gm-Message-State: AKaTC00QL1YI4Z46lLjZRngw0qTcvRR9r0kWXavGVsYiM4wgL1Vc5zfhbBK9t6EFL7iIHl/MEXXyMCrl5U/8mg==
X-Received: by 10.176.84.8 with SMTP id n8mr13594673uaa.29.1482165869291; Mon,
	19 Dec 2016 08:44:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Mon, 19 Dec 2016 08:43:58 -0800 (PST)
In-Reply-To: <1482144048.27847.19.camel@andred.net>
References: <20161219063957.18716-1-raj.khem@gmail.com>
	<20161219063957.18716-7-raj.khem@gmail.com>
	<1482143598.27847.17.camel@andred.net>
	<1482144048.27847.19.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Dec 2016 08:43:58 -0800
Message-ID: <CAMKF1sp0VZAaM40STArYA5DejMSW89SS8NNyZWMGM4V3Qtn-Cw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [V2 07/10] x264: Fix build on mips architectures
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
X-List-Received-Date: Mon, 19 Dec 2016 16:44:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2016 at 2:40 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> On Mon, 2016-12-19 at 10:33 +0000, Andr=C3=A9 Draszik wrote:
>> On Sun, 2016-12-18 at 22:39 -0800, Khem Raj wrote:
>> > Disable asm to fix
>> >
>> > > You specified a pre-MSA CPU in your CFLAGS.
>> > > If you really want to run on such a CPU, configure with --disable-as=
m.
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> >  meta/recipes-multimedia/x264/x264_git.bb | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-
>> > multimedia/x264/x264_git.bb
>> > index e790681ad3..240a19661f 100644
>> > --- a/meta/recipes-multimedia/x264/x264_git.bb
>> > +++ b/meta/recipes-multimedia/x264/x264_git.bb
>> > @@ -23,6 +23,8 @@ inherit lib_package pkgconfig perlnative
>> >  X264_DISABLE_ASM =3D ""
>> >  X264_DISABLE_ASM_armv4 =3D "--disable-asm"
>> >  X264_DISABLE_ASM_armv5 =3D "--disable-asm"
>> > +X264_DISABLE_ASM_mips =3D "--disable-asm"
>> > +X264_DISABLE_ASM_mipsel =3D "--disable-asm"
>>
>> I think you can use _mipsarch these days, which covers all MIPS. Equally=
,
>> mips32r5 and later have MSA, so I think the override should be:
>>
>> X264_DISABLE_ASM_mipsarch =3D "--disable-asm"
>> X264_DISABLE_ASM_mipsarchr6 =3D ""
>>
>> or just
>>
>> X264_DISABLE_ASM_mipsarch =3D "${@bb.utils.contains("AVAILTUNES", "mips3=
2r6", "", "--disable-asm", d)}"
>
> or
>
> X264_DISABLE_ASM_mipsarch =3D "${@bb.utils.contains("TUNE_FEATURES", "r6"=
, "", "--disable-asm", d)}"
>
>

Yeah using misparch is right approach here.

>> not sure, and completely untested.
>
> A.
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

