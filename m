Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.1147.1612820055091140659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 13:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QqPLWI9W;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id bl23so27794641ejb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 13:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cOTQsDV3MsbSUAfZTTf0/3b4WSe99+Fg0Oj/ov8g3x8=;
        b=QqPLWI9WHj89R92gqGGOZHt6/ER6jo5a6YP6twJpjyWFLR58CC8d+oDcEj2cvaJoAU
         MtDmFwi48LOhQVYI+JS5Aei8ozGgFdRILVP57+UiIkPUdYVUfLeI8UDtl6qZ2qGzP0py
         3Tvx3p3Rp6dRl/Kq2OWQ2v79Fws3zTLtZVPrL350SqOEHnhy9fvKBop/6KJAtGBxSJyE
         PIshunIZxjr2ODbVuNGobmHTL6+L+FbX2jr1ghLAtX//VVbwTC+jscgqTNG53A8LjVU3
         dokAgRVCle/wNTcRLuVs8LyPoUE5axLwadU2ih/piLz2mNi+twQp3h30y6r0UClfYoPJ
         YL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cOTQsDV3MsbSUAfZTTf0/3b4WSe99+Fg0Oj/ov8g3x8=;
        b=JKL4W9Rojfhind7SJk4BWC0yZWTTNTlNoefEUn3Z6cDRH+NH2/qqkPGyFkEZaRS78I
         A/ADFWQxMMf7u9nMYnS7gmzlmgIUlXfmllXlV2kmt6XzE+6rCtX3RCoaIUli767okZJk
         L/6M9i3VXq1yt0YDuZ4t0uVnOZmecDVfuSHYCZRnZOkw6EiDqCVbgDBHSFL2Pmm0Ca6D
         5JC2hJ2CJVewvH0JrfZyKmOgCJgrt4lNI11Y021lXtC0yTpYNSsy+50+g10/3gou6WWw
         JOMEs3OUXLIEWr/Q3a7eWp83K8sbUZxoHCr8N9LUPbAlQR9dWI1kHQPbv3AV4TtskmHc
         KLBg==
X-Gm-Message-State: AOAM532yjzKzJLZ8GDeNYhNHHFmC31cqbPrOcwn7tDTrffFgDuPlxtel
	V+dbtIgpGX7QgX5WK4V5JdDzKtAAT5+2wBWh2kg=
X-Google-Smtp-Source: ABdhPJwW1YsocThfFQ/lF4D8m/R4MX0wyL4VDnku2IPtEtBZi5cgxQXUIRllx4wEl9v1x/ku1pXkQnLKzduZuYPQtkc=
X-Received: by 2002:a17:906:a295:: with SMTP id i21mr19345812ejz.334.1612820053624;
 Mon, 08 Feb 2021 13:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20210208181747.44789-1-mcroce@linux.microsoft.com>
 <CADkTA4P-kS6UdgDmT9J=FtWGy0Tmu28RtDtXHOg0M_J8z41vAQ@mail.gmail.com> <CAFnufp0ehmcRbLmZXPyG0s8guwyxHhaFXchATL0JRqTYMVPKNA@mail.gmail.com>
In-Reply-To: <CAFnufp0ehmcRbLmZXPyG0s8guwyxHhaFXchATL0JRqTYMVPKNA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 8 Feb 2021 16:34:02 -0500
Message-ID: <CADkTA4OyrJa19z57OJDvo-Si2cjjkO5AH+e9JQ1P5cWtQUKRQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes-kernel: add libbpf
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 8, 2021 at 4:22 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
>
> On Mon, Feb 8, 2021 at 9:13 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Mon, Feb 8, 2021 at 1:18 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
> > >
> > > From: Matteo Croce <mcroce@microsoft.com>
> > >
> > > Add a recipe to build libbpf from https://github.com/libbpf/libbpf
> > > The only patch fixes a build issue, and it's already merged upstream.
> >
> > Thanks for the submission! I have a few comments / questions.
> >
> > To get this into oe-core, we should be commenting / documenting why it
> > should be in core, versus another layer. The standard criteria is that
> > there are enough varied users and that the functionality is common
> > enough, that it belongs in core.
> >
>
> For sure bcc and bpftrace can use it, and maybe also perf.
> In future even iproute2 will use it, as it has been ported to libbpf recently.
> Feel free to propose another layer, in case you know a better one.

That's not for me to propose . that's for you to sort out.

A quick check of the layer index would show that other bpf tools are
in meta-oe.

>
>
> > There should also be some sort of oe-selftest for the functionality,
> > otherwise, it is hard to detect breakages. Some sort of application
> > that uses the library and that can be executed in qemu would be
> > enough.
> >
>
> That's doable.
>
> > What are the kernel requirements ? CONFIG_BPF is selected by other
> > kernel configs (it has no menu entry, so it must be), is it that, or
> > something else that is the requirement (classic BFP?). If that option
> > is now always on, is that true for the reference kernel versions in
> > master (5.4 and 5.10).
> >
>
> I'd say BPF_SYSCALL, which is the single entry point for al the eBPF routines.

Yes, that's the core support, and a selftest would ensure that the
reference kernels can support the package (they can, but we still need
the test) and implicitly document that requirement.

>
> > Finally, does this work across all the supported architectures ? if
> > not, we'll need compatibility settings.
> >
>
> I tested it only x86 and aarch64, but it should be arch independent.

Then it should be limited to where it has been tested, otherwise, the
burden falls to the oe-core maintainer, which we don't want.

Bruce

>
> Thanks!
> --
> per aspera ad upstream



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
