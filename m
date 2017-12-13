Return-Path: <wildman279@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id C32DC78704
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 02:42:32 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id f18so938274lfg.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 18:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-transfer-encoding;
	bh=gt7Vs6P9mtqCrJZyxO/6xf+405aL8kBh/OiYKm9d6yk=;
	b=M1/4sfeSFOwg586MpV+AIpb17A+aL7gT3SebTf7KshOgI0jrZzkPefn1+5bT9k4T6F
	HgRPS1H0u6wlHHlaOFKrXOoGEWAduwHSNf7+GTxXlM1k5UFHatPiq4Q+eRtnpZuB+B3N
	beWPPdYHkHw6B1lRz2mXkMvc6orDaoULo/d/wE7lFJhX/epbznlpcv8M+Dyam+FOIfn+
	ZJ2nF2GvC6lQ95mrwou66QOSoFfVU16JYH2WDgBWdbxZquFlflRgM7tiB2jvF/3epywJ
	oUh+xrYFnfuweock4DYHpE9AGNXAVB/z/e548AZAm1bjvdeZl5MJ6K5HAwUXxeHwtxX8
	/D6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:content-transfer-encoding;
	bh=gt7Vs6P9mtqCrJZyxO/6xf+405aL8kBh/OiYKm9d6yk=;
	b=ufB4A48i/j0uHNu/6UgayV2r4o6fzgthsfu/UcV2PsJ2yHbdvl1m5WDI8CxfkddUZW
	vbIw+SSAs3wgq0VYgZlCsVlxOREo8wsaE1/eEIBZA5NoMYAyZV00cX2WkgOEa7QqeKSU
	E1Nr2c6Hrc/FcI/gZYgvAL2XZCBaxQFSlNMIT2jy7LwB5nO9kVNACmgfF0aC1o5zoa4C
	oJDfX4LfTBXnsKBKDlUa6DdgNTqCXrlVQclrLorIMnS74vn2Rk+bg6YkQpPjIynTzw/v
	coF2jhmMCi6StIF1UpU9Z9Tj69gvGo7s60QqeRcc6rzQDquht7WRsKV3FL6WFBrV5/q0
	mzrg==
X-Gm-Message-State: AKGB3mKoCyDtJ9aMcJ4JjlhqV45dG8ADQXZjzuhkoWKePpRo81/QBxL9
	G+Pdsh42IoxAGmDbSXOu941KLtmZSzGdXzkkRjc=
X-Google-Smtp-Source: ACJfBov7UVg1V8T/CS3DxII4cXuzduZglP4SlWgQxMlwxV1KN+VIwdTjTaWAmuy9s4F+UwGhlI02Y6QRngyZuWw7MFo=
X-Received: by 10.46.116.9 with SMTP id p9mr499155ljc.28.1513132953150; Tue,
	12 Dec 2017 18:42:33 -0800 (PST)
MIME-Version: 1.0
Sender: wildman279@gmail.com
Received: by 10.179.26.109 with HTTP; Tue, 12 Dec 2017 18:42:32 -0800 (PST)
In-Reply-To: <CAN33hf_0Y1=fCKmFYeCCZdVcEGyMjeUZHSkMzMiZP0z1VC5jmA@mail.gmail.com>
References: <20171212024917.14550-1-allenwild93@gmail.com>
	<1513068908.30397.2.camel@andred.net>
	<CAN33hf_0Y1=fCKmFYeCCZdVcEGyMjeUZHSkMzMiZP0z1VC5jmA@mail.gmail.com>
From: Allen Wild <allenwild93@gmail.com>
Date: Tue, 12 Dec 2017 21:42:32 -0500
X-Google-Sender-Auth: zlrphlXvlD6DSv3E6gayoDlkZB0
Message-ID: <CAN33hf9ntsO=MfoRExd==qHBTV5h0tgkAZqZTzr9R-yQK5ZcUQ@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>, 
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] syslinux: always use the BFD linker
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
X-List-Received-Date: Wed, 13 Dec 2017 02:42:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oops, forgot mail the list when sending my first reply.

I tried appending LDFLAGS, but it doesn't work for syslinux. It's
during do_install, not do_compile, that $(LD) is called directly to
link libutil.elf, libcom32.elf, libgpl.elf, and ldlinux.elf.

A python-free but more intrusive appropach to fix this could be to add
a new variable e.g. HOST_LDNAME in bitbake.conf and incorporate it
into the definition of LD. It would default to "ld" but could be
overridden by recipes like syslinux where appending LDFLAGS doesn't
work.

If we don't expect the bitbake.conf definition of LD to change,
syslinux could also just simply redefine LD =3D
"${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"

Thoughts?
--Allen

On Tue, Dec 12, 2017 at 4:46 PM, Allen Wild <allenwild93@gmail.com> wrote:
>> Hm, other recipes that have this need typically simply do:
>>
>> LDFLAGS_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold'=
, ' -fuse-ld=3Dbfd ', '', d)}"
>>
>> Would a similar approach work here, too? Instead of this big change.
>
> I thought about that, but grepping the Makefiles appeared to show many
> usages of $(LD) directly rather than using gcc as the linker, so I
> assumed it wouldn't work.
>
> However, I just looked more closely at my log.do_compile and I don't
> see anything appear to call LD directly, everything is getting run
> through x86_64-oe-linux-gcc.
> Clearly the LD variable passed to make affects this consistently, but
> now I don't know why. I'll try appending LDFLAGS and see if that
> works.
>
> Regards,
> Allen
>
> On Tue, Dec 12, 2017 at 3:55 AM, Andr=C3=A9 Draszik <git@andred.net> wrot=
e:
>> On Mon, 2017-12-11 at 21:49 -0500, Allen Wild wrote:
>>> Syslinux compiles successfully with Gold, but at runtime Isolinux fails
>>> to boot, getting stuck at the version screen without loading the menu.
>>> Forcing the BFD linker fixes this.
>>>
>>> To future-proof, use an inline python replace rather than duplicating
>>> the definition of LD in bitbake.conf
>>
>> Hm, other recipes that have this need typically simply do:
>>
>> LDFLAGS_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold'=
, ' -fuse-ld=3Dbfd ', '', d)}"
>>
>> Would a similar approach work here, too? Instead of this big change.
>>
>> Cheers,
>> Andre'
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

