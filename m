Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.5351.1625366605103647474
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jul 2021 19:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X+P143Fy;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id t3so18904784edc.7
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Jul 2021 19:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LhxjabSAJ76E16RSzXYePJDjWKjfFuUBQzJuqSoBCw0=;
        b=X+P143FyMPWO+Now34y4lO7S3+YL3uKS8z2+Jo0LeUDhOZedKkAOBSZTORjQy6PXsE
         4RPF+Bt4hYNMPevtfXKKvEOLGVrZ4lt+RKLZk7LGH+/t2bOCBtYrg0oS9Czvad6qzYAe
         I1fgn0TwVNpJDDb6ozTIgZbUbHw2HCAO5DOADcbJ+4UH0JOCuTnNvaTgeHxvo7B56QzF
         1aKH/4u4NgOx709ShWlCWEkOo61qlZhOfbNH2XrwlGYqv0BthqA+6npudEXQkK0+9ndh
         TmwVxY98EOLMyJ5HSOIQgufTmSGQF+Rx30PgRuqQPJzQ+nw9BQfzNKqehdb82Mf2r34A
         VSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LhxjabSAJ76E16RSzXYePJDjWKjfFuUBQzJuqSoBCw0=;
        b=oMon7WSbC0zzGzfxpU10AL9OLTnjsmLKG/7nMTRzir7L4PBYWrC03ilFtIk1MYNM0T
         Jm8lOnL2ljRol5TB4VV5P2ektydxynfttxEnFpTHuBGG47u2GYYGlqE7PmBbIVcgKy/N
         DjRjLkzy7GTocb9p5n53Bm8WAI7AF2DplfGnJQiqQPsNwgsMwwnAg8fJvc0cjK/FntWv
         p33uW1e0NvXNwEsm568PYrJqbydnyPdH/6PELLMQcGhFt0G9Mz54nHiNX9HyOOWVB2/d
         6a4CqQR6GnerjAr/NsXnJ383UU102/7oh7Hj+mXphKMM/dVaCcJcsE/RPuNtHTRiURcZ
         +uFQ==
X-Gm-Message-State: AOAM530mRn4kBKdY0LciV9uwMleD0JQTQcpC15HH9dR5PDi4Fatm0APJ
	dhg1ig+6VAI2fZ6/o9Sg80nng4oVNvP9ekfZSgg=
X-Google-Smtp-Source: ABdhPJw0S0V56a6HMH0UC65GZF8CQ4XrPEVsXohmyDcsajbpe7nyAo5FvWFGp1ptN3QTafGrQpfhuR6UZrbpv7UBjjk=
X-Received: by 2002:a05:6402:58:: with SMTP id f24mr8340142edu.234.1625366603437;
 Sat, 03 Jul 2021 19:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625238537.git.bruce.ashfield@gmail.com> <16e9488d8d4b8f200f506a6debb464e54a4bb0d9.camel@linuxfoundation.org>
In-Reply-To: <16e9488d8d4b8f200f506a6debb464e54a4bb0d9.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sat, 3 Jul 2021 22:43:12 -0400
Message-ID: <CADkTA4NeOtUJKavuXXvGpTjtkEaXKDq_D_VkJNOEOseoUYWWsg@mail.gmail.com>
Subject: Re: [PATCH 0/8] linux-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 3, 2021 at 6:02 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Bruce,
>
> On Fri, 2021-07-02 at 11:13 -0400, bruce.ashfield@gmail.com wrote:
> > Here's the next consolidated pull request. It has two normal -stable updates
> > for 5.10 and 5.4, as well as the first steps in bringing 5.13 in as the
> > reference kernel (and then dropping 5.4 from master).
> >
> > I've built and booted 5.13 as the default for qemu*, as well as building it
> > against both musl and glibc with the 5.13 libc-headers. I didn't run into
> > any issues, and neither did my AB runs (I'd like to think it is all the
> > other patches that have been sent as linux-yocto-dev moved foward that made
> > this relatively few patches now).
> >
> > I've also ensured that AB intermittent fixes are in place for 5.13, so it
> > is safe from that point of vew as well. Folks without exlcit versions set,
> > will get 5.13, but it is already sane and fit for that purpose.
> >
> > Obviously you can pick and chose what you need from this if there are issues,
> > and I'm around to trouble shoot anything that pops up.
>
> Thanks for this. In general it looks good, there is just one failure worrying
> me a bit:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/119/builds/425
>
> which in diffoscope speak is:
>
> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210702-c3hu90kc/packages/diff-html/
>
> You may wonder what this pull request has to do with a gcc-sanitisers failure?
>
> If you don't speak dwarfish or elvish, it means that perf_branch_sample_type_shift
> was declared on line 162 in one build and 182 in another. I wondered about a
> bit flip however it is two bits and linux/perf_events.h has
> perf_branch_sample_type_shift at line number 162 in 5.10 and 182 is 5.13 and that
> file comes from linux-libc-headers. The logical conclusion is that one was built
> with one header and the other, from the other header. Why/how this could happen
> I simply don't know. The problem build came from sstate so there is no real
> audit trail to follow :(.

I've done multiple header fixups with perf and libc-headers disagreeing, due to
captured copies being different from the uapi.

This is likely a variant of that.

... that being said, I've never seen anything that varied between
builds. It either
broke or it didn't.

This is libc-headers 5.13 and the 5.10 perf ?

Bruce

>
> I'm not sure this blocks the pull request as the issue is probably somewhere else
> and this just exposed it but any ideas on what happened are very welcome...
>
> Cheers,
>
> Richard
>
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
