Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web11.1076.1596060521368545890
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 15:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bnu7f6af;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id b26so8368784vsa.13
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 15:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ni/UkmwMrhEn8TRzKRdOwZr7naop2CFUJ6I+dA3rXAo=;
        b=Bnu7f6afFMhIdX80f0e6tm14YWP5ZyKhnS2oWZf79oki+AeuBqg5Cv/m6urfnoFjcG
         fnEqSFIXhK/UNBNqDNdffQF8gix28fR7vb+5bKmFj4ifwTthVzYj1taige9LG3g+UZqn
         bSj6w5rAdbz+i7CBQ2eTr8fG08Z9YkYwKPEGazVVQSo2nTSTDPu/s8VkUhLEsoif9ZcK
         DSPH9TTCLpj4b0X1U6LI8U33HuaLMjep9HfrBFSqHu8ABfDOZa1PA4mxSVshWUdvqcrr
         BL1tk4Qea1mAInfTYiTlvgdXVLuRISRV6C0q9rrwNiMVNHqUIA3K/dDA23ie2VjEu41d
         NmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ni/UkmwMrhEn8TRzKRdOwZr7naop2CFUJ6I+dA3rXAo=;
        b=nQ60N3mYh6t9M6snPEVA2GSXsg/Ms4UK6pDvQ2mapYWP71pjKpkWh2smea/xckfq7I
         DADTeVFRKwkzZVtvxEpDOVA6IdwdGixMO+trk/aGs2oFtCemZ6SNPmT/lBb5LWheviHd
         BOBpGI75ah7QcHVjxFd3yF1AGCl7dh9uoPJgPevnT0ehrtRgqL1xkFB4XEaj5BHp2U+O
         gCef46qI+eO/ghN+Fi7mRVwhf3yEmrKeRlfWX3ieIzi6PVtUKONhhMqaEJ99cCuFmQcz
         G5CReY8aaPYYo4Hieo5xs62CoRCt2wTse7uR+ohDDpVd3br0helSO3KR2vK8kmcmAMxC
         k8bA==
X-Gm-Message-State: AOAM532YKaAo51WJvhH47B4sm1JdQq0rolH8xD7Wq8n/bClwqTy964L0
	+WTntnvJvhgxgYq8I10PLNejXhGzvRiDywj3msc=
X-Google-Smtp-Source: ABdhPJyep7Knr1prwKsLdFNPe7OB1969kURe9J3lIi81uDoT/3WgnbRTBizDWBDGs/xUsNcrEpiYmA+iwN4KfQZkqKs=
X-Received: by 2002:a67:1c06:: with SMTP id c6mr238328vsc.137.1596060520374;
 Wed, 29 Jul 2020 15:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <64ecaddb6eaae1bd569e299ffb03b13081efe50b.camel@iki.fi>
 <CAMKF1sqvmPNPs6Vsh111hmWt3Fd-7E_4XbyQqrrvfqGH=RKYsg@mail.gmail.com>
 <1625397D9F68474B.26462@lists.openembedded.org> <65325f6d63b5927ea8f0f7a167119d0ca8dcfd34.camel@iki.fi>
 <CAMKF1srEGQnkaZutfPaH5QS_vK8Yx0NeWvWo_10rOQpD7s8=0A@mail.gmail.com>
 <CAJ86T=Wt=dB+WauhLgzUOgOc56dpq41TORuyvnhGXOS46z3pZw@mail.gmail.com> <cc769449fccdd6867890b6347d89ced00844b566.camel@iki.fi>
In-Reply-To: <cc769449fccdd6867890b6347d89ced00844b566.camel@iki.fi>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 29 Jul 2020 15:08:28 -0700
Message-ID: <CAJ86T=WOQkBPFWfN_JO0bLt0O+D=Yg=0z_+_P4B3wx8q+b8Esg@mail.gmail.com>
Subject: Re: [OE-core] Why disable NEON support in recipes if runtime detection works?
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: Khem Raj <raj.khem@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 29, 2020 at 6:46 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
>
> On Mon, 2020-07-27 at 13:45 -0700, Andre McCurdy wrote:
> > On Sun, Jul 26, 2020 at 7:01 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > On Sun, Jul 26, 2020 at 12:59 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > > On Sun, 2020-07-26 at 09:27 +0300, Tanu Kaskinen wrote:
> > > > > On Mon, 2020-07-20 at 15:26 -0700, Khem Raj wrote:
> > > > > > On Sun, Jul 19, 2020 at 2:06 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > > > > > Hi!
> > > > > > >
> > > > > > > If a recipe provides NEON optimizations, should those be explicitly
> > > > > > > disabled when "neon" is not in TUNE_FEATUERS, even if the software is
> > > > > > > able to detect NEON availability at runtime?
> > > > > > >
> > > > > > > I'm currently converting the pulseaudio recipe from Autotools to Meson,
> > > > > > > and the old Autotools build system supports disabling NEON
> > > > > > > optimizations but the Meson build system doesn't. So I'm wondering if I
> > > > > > > should add the missing feature to the Meson build system, or just let
> > > > > > > the runtime detection do its work.
> > > > > > >
> > > > > > > Is there ever need for disabling NEON optimizations if the CPU
> > > > > > > indicates NEON support? I guess it could be useful for testing the "no
> > > > > > > NEON" case (I today found out that dropping "neon" from TUNE_FEATURES
> > > > > > > doesn't remove NEON support from the qemuarm machine), but otherwise it
> > > > > > > seems unnecessary, unless there are CPUs that advertise NEON support
> > > > > > > but don't actually support it.
> > > > > > >
> > > > > >
> > > > > > I think the issue will result in a compiler error perhaps when neon is
> > > > > > disabled via
> > > > > > compiler command line which would be the case when neon is not in TUNE_FEATURES
> > > > > > the compiler might warn or error out when it finds neon instructions
> > > > > > being compiled via inline
> > > > > > assembly.  you just can try passing something like -mfpu=vfpv3d16 or
> > > > > > some such and see if
> > > > > > compiler/assembler complains during build, if not then perhaps its fine.
> > > > >
> > > > > If the last -mfpu is something else than neon, then including
> > > > > arm_neon.h will succeed but compiling neon code will fail.
> > > > >
> > > > > I did some experiments, and what I found was that when I remove neon
> > > > > from TUNE_FEATURES, OE adds -mfpu=vfp to CC, not CFLAGS, so it's very
> > > > > early in the compiler command line. PulseAudio adds -mfpu=neon to
> > > > > CFLAGS when building neon code, and the last -mfpu wins, so the neon
> > > > > code gets built without errors.
> > > > >
> > > > > The configure check in PulseAudio only checks that the compiler accepts
> > > > > -mfpu=neon and #include <arm_neon.h>, it doesn't try to compile any
> > > > > actual neon code. This means that if the user adds -mfpu=vfp (or other
> > > > > non-neon) to CFLAGS rather than CC, configure will pass but building
> > > > > will fail. Is this something to guard against? A default qemuarm build
> > > > > doesn't do this, so I don't know if this ever happens in OE.
> > > > >
> > > > > I don't know yet how Meson behaves, I'll continue testing...
> > > >
> > > > I tested Meson now. Meson too enables Neon even if -mfpu=vfp is in CC.
> > > > Unlike Autotools, Meson doesn't fail if -mfpu=vfp is added to CFLAGS (I
> > > > tried CFLAGS_append = " -mfpu=vfp" in the pulseaudio recipe). Neon is
> > > > enabled in any case.
> > > >
> > > > So, Meson seems pretty safe, although I guess it would be nice not to
> > > > override the user's -mfpu setting. I think this isn't a big problem is
> > > > practice, since runtime detection works.
> > > >
> > > > I haven't tested with a compiler that truly can't build Neon code,
> > > > because I don't know how to do that.
> >
> > Presumably set a -mcpu=XXX to something which can never support NEON?
>
> No success so far...
>
> I tried CFLAGS_append = " -mcpu=cortex-a9+nosimd" in the pulseaudio
> recipe, but Neon got still enabled. GCC warned that -march=armv7ve
> conflicted with the chosen -mcpu (which makes sense, since "ve" in
> "armv7ve" means "virtualization extensinons", and Cortex-A9 doesn't
> have virtualization support, and all cores that have virtualization
> support have mandatory Neon support).

Is that true? If so then the various armv7ve specific tuning files
(tune-cortexa15.inc, etc) could all be simplified by removing the
option to disable NEON support.

> Then I tried adding -march=armv7a to the pulseaudio CFLAGS, but then
> the build failed, because Meson failed some C++ linker check ("Unable
> to determine dynamic linker").
>
> Then I tried to remove armv7ve and add cortexa9 to TUNE_FEATURES, but
> GCC didn't like that at all, nothing built any more.
>
> I'm still in the process of trying different combinations. Maybe it
> would be better to try to use someting older than Cortex-A9, since A9
> has optional Neon support. If you're familiar with tweaking the target
> CPU with qemuarm, suggestions are welcome. (If I sound like I know
> something about Arm CPUs, that's only because I've looked up things
> from Wikipedia today.)

For this test I think you can just set a custom DEFAULTTUNE from
within the pulseaudio recipe.

> > > Right. Cpu implementations without neon do exist
> > >  But they are perhaps rare enough and may not use the package too so chances are slim that we encounter this issue
> >
> > So what's the conclusion? That CPU's without NEON are so rare that OE
> > doesn't need to care about them?
>
> That seems overkill. PulseAudio detects Neon support at runtime, so
> even if Neon is enabled at build time, the binaries should work also on
> hardware without Neon. I think Khem misunderstood some details. I'm
> currently just trying to figure out how to test that the Neon check in
> Meson works also in the cases where the compiler can't build Neon code
> - so far in my tests Meson has always enabled Neon and the compiler has
> always built it without errors.

With runtime detection, the Makefiles etc should be forcing hardcoded
CFLAGS (or setting assembler directives etc) as required to build any
CPU specific code even if the global CFLAGS etc don't support it, so I
think it's expected that the NEON code will still be built even if you
succeed in setting the generic CFLAGS to target a CPU which doesn't
support NEON.

In other words, with runtime detection, there should be no need for
any build time configuration.
