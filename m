Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web11.65375.1595882730148824078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 13:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=emJKWmZ8;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id q15so5831296uap.4
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 13:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SefkLhTpXWp9JOV1pDQ5v2tPL/U6rIh72cCXToR1SKM=;
        b=emJKWmZ8QOzesvvoJPK1N2ABznL8YVqa5LkqyRbyPUyqwUUq9WCPWLFNEPmi9EN/08
         Of5V1L8D8q73ffnA1ZbvH1psccOpRwOQIbtN1lm4She8GcB3ucZlpPn+1uwLjVgbWabM
         NpCha0xHJRgunzI26pk/WomRN49Vamb8rSQng8jmcCJqv8B/j8ZFJRgOomUI6SjgkcA/
         4H07Ra4Gx21MdPyxMycGDmkSux1lawdxF44mkSJC0HfC4L1YdUcjzxykRJA1wGeic75F
         vQQOim0doLgZloMvhuctpnl90ZBisvTpwr4WYhfIf4UP+zTxoLPv/V9qdjeBkowInxad
         hfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SefkLhTpXWp9JOV1pDQ5v2tPL/U6rIh72cCXToR1SKM=;
        b=bh0XRh2ytn1OMqM035sBWlja64fFx8Xd6IK3P492ks2U9gYczupwwPJImhSbZj6KPJ
         IYkqgD4t6R3vU5azLMvH9r3wTRUQZdOmDiKLhr3PjpK+Q6S5SheG7IVf0RKOfqJl1fWm
         5EZuOYaLD+Ok2pMiUjaidWR93gRU+xUH0TO6JUoCQAuCJfBqqocth64pvFMJ1kdXB9fG
         1Qpbj4CNVc8MjqTD7DSppJ5FL9CRgpAZXrTrWGFF8ijOXMWelp3H4SP0d8Pwa7tQ58wV
         Ee9Zc+YJC2Ck+CwRnrDxXmtDfnUrYmQ9NiEy52LhoIpazKU9sbLWKCLg0kiof3tZeodG
         rCRA==
X-Gm-Message-State: AOAM5311rzQ7tAh3gS9DD8OFkyvfGxxLF1btw5eK29H2Bo2D3++ClxYR
	7AKK8bVos3UfKRzdEl2SBaUgTekmGQE9ep9iJ4s=
X-Google-Smtp-Source: ABdhPJzc81UVOY5pMjxk/vinSlJRYFoIlg1x5Wx43O2PEW5+5GRwKHqt1psC86vbnrCNL+6zaCDgaJmwVLEzCJcr99M=
X-Received: by 2002:ab0:280b:: with SMTP id w11mr17848735uap.81.1595882729186;
 Mon, 27 Jul 2020 13:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <64ecaddb6eaae1bd569e299ffb03b13081efe50b.camel@iki.fi>
 <CAMKF1sqvmPNPs6Vsh111hmWt3Fd-7E_4XbyQqrrvfqGH=RKYsg@mail.gmail.com>
 <1625397D9F68474B.26462@lists.openembedded.org> <65325f6d63b5927ea8f0f7a167119d0ca8dcfd34.camel@iki.fi>
 <CAMKF1srEGQnkaZutfPaH5QS_vK8Yx0NeWvWo_10rOQpD7s8=0A@mail.gmail.com>
In-Reply-To: <CAMKF1srEGQnkaZutfPaH5QS_vK8Yx0NeWvWo_10rOQpD7s8=0A@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 27 Jul 2020 13:45:16 -0700
Message-ID: <CAJ86T=Wt=dB+WauhLgzUOgOc56dpq41TORuyvnhGXOS46z3pZw@mail.gmail.com>
Subject: Re: [OE-core] Why disable NEON support in recipes if runtime detection works?
To: Khem Raj <raj.khem@gmail.com>
Cc: Tanu Kaskinen <tanuk@iki.fi>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 26, 2020 at 7:01 AM Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Jul 26, 2020 at 12:59 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
>> On Sun, 2020-07-26 at 09:27 +0300, Tanu Kaskinen wrote:
>> > On Mon, 2020-07-20 at 15:26 -0700, Khem Raj wrote:
>> > > On Sun, Jul 19, 2020 at 2:06 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
>> > > > Hi!
>> > > >
>> > > > If a recipe provides NEON optimizations, should those be explicitly
>> > > > disabled when "neon" is not in TUNE_FEATUERS, even if the software is
>> > > > able to detect NEON availability at runtime?
>> > > >
>> > > > I'm currently converting the pulseaudio recipe from Autotools to Meson,
>> > > > and the old Autotools build system supports disabling NEON
>> > > > optimizations but the Meson build system doesn't. So I'm wondering if I
>> > > > should add the missing feature to the Meson build system, or just let
>> > > > the runtime detection do its work.
>> > > >
>> > > > Is there ever need for disabling NEON optimizations if the CPU
>> > > > indicates NEON support? I guess it could be useful for testing the "no
>> > > > NEON" case (I today found out that dropping "neon" from TUNE_FEATURES
>> > > > doesn't remove NEON support from the qemuarm machine), but otherwise it
>> > > > seems unnecessary, unless there are CPUs that advertise NEON support
>> > > > but don't actually support it.
>> > > >
>> > >
>> > > I think the issue will result in a compiler error perhaps when neon is
>> > > disabled via
>> > > compiler command line which would be the case when neon is not in TUNE_FEATURES
>> > > the compiler might warn or error out when it finds neon instructions
>> > > being compiled via inline
>> > > assembly.  you just can try passing something like -mfpu=vfpv3d16 or
>> > > some such and see if
>> > > compiler/assembler complains during build, if not then perhaps its fine.
>> >
>> > If the last -mfpu is something else than neon, then including
>> > arm_neon.h will succeed but compiling neon code will fail.
>> >
>> > I did some experiments, and what I found was that when I remove neon
>> > from TUNE_FEATURES, OE adds -mfpu=vfp to CC, not CFLAGS, so it's very
>> > early in the compiler command line. PulseAudio adds -mfpu=neon to
>> > CFLAGS when building neon code, and the last -mfpu wins, so the neon
>> > code gets built without errors.
>> >
>> > The configure check in PulseAudio only checks that the compiler accepts
>> > -mfpu=neon and #include <arm_neon.h>, it doesn't try to compile any
>> > actual neon code. This means that if the user adds -mfpu=vfp (or other
>> > non-neon) to CFLAGS rather than CC, configure will pass but building
>> > will fail. Is this something to guard against? A default qemuarm build
>> > doesn't do this, so I don't know if this ever happens in OE.
>> >
>> > I don't know yet how Meson behaves, I'll continue testing...
>>
>> I tested Meson now. Meson too enables Neon even if -mfpu=vfp is in CC.
>> Unlike Autotools, Meson doesn't fail if -mfpu=vfp is added to CFLAGS (I
>> tried CFLAGS_append = " -mfpu=vfp" in the pulseaudio recipe). Neon is
>> enabled in any case.
>>
>> So, Meson seems pretty safe, although I guess it would be nice not to
>> override the user's -mfpu setting. I think this isn't a big problem is
>> practice, since runtime detection works.
>>
>> I haven't tested with a compiler that truly can't build Neon code,
>> because I don't know how to do that.

Presumably set a -mcpu=XXX to something which can never support NEON?

> Right. Cpu implementations without neon do exist
>  But they are perhaps rare enough and may not use the package too so chances are slim that we encounter this issue

So what's the conclusion? That CPU's without NEON are so rare that OE
doesn't need to care about them?
