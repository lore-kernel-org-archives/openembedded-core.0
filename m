Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web12.13287.1612889087043868252
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 08:44:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lwlbvOhf;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d3so1301014qtr.10
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 08:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sd8A5oHX1dJeHs59u4Z5lEQRtoT8aPgyY6fH97Lj3yg=;
        b=lwlbvOhfLMzAY8eNUjLq3817UQPgOzuMKWkdTJo/hkaWKU3JScnXEMg2/u3/D695B5
         3vcviPv/JRByu6OWIZjSgot+ZbP5ngiIb9uJbGO+Z44zUzK77TDIDROY6wrFAwZufVvt
         hhp5RMpAvQX09ldm2OoL2zQnNkfOBBJI6aUDFmofUDM0NLcI7hgp4VBsI2cp1lTH7My/
         RKC03bJIf/GEqKK9f4VfgAYFXfgrpProZBOUDECVd8hB2S2AfOR57OfS/huXp8/o/c1i
         S0lPfR1ReWQ5xBOyV8nFU5thIYUALyayHMVuLm4PpGT/HNsxTw4OQXHP/E0zpOntYkwq
         AmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sd8A5oHX1dJeHs59u4Z5lEQRtoT8aPgyY6fH97Lj3yg=;
        b=WQqgj6eVoP8sxJGYb9T/bQEQ4neyKs+C9QABP2Xxmp+Rz285bcXiGgTtRWcis9yw+9
         gIM+ftNVeQOq3k63YdpkktYeMs4DrrPZf2p5FxbCTMn+4kgSyCRSwbL1QuznsnC/ijw4
         NBp+C9n+TcZjFiUVkwilHL4/xTj9ITuZosHdLK92VfSHdwlyNsaExQkQ1Fvxg3jsoS51
         XEPpG07npm1Ko6ViMsttdOdE3zq8H6SJ3jRZjwgRMsVJSHjpRsnl0fwDnTHVpFvGIe3Q
         ugfbcinkQguHgz8Wy8dIhhdIZSwGL5+gLu3+JEZHhgSpoSeUZH63UoXzG2rOPCVRYy7W
         hLZA==
X-Gm-Message-State: AOAM531kbbL7bS4nxy/faU4n55J+lAvnzE+PdhIkaWH/luPqkdJT7kkd
	VRDkwcVpc0PkZ+By74AF0UIAR8hGsw5Uitc3TAI=
X-Google-Smtp-Source: ABdhPJzO3AZ94MoiQNQ7+CWt0oJdU4+uAFE+3ReQxO56Q3NwScicCfwF08fS6BdjQ6BfEkdHpsWEdD7Z2osYbENeDG8=
X-Received: by 2002:ac8:60c9:: with SMTP id i9mr13116574qtm.88.1612889086028;
 Tue, 09 Feb 2021 08:44:46 -0800 (PST)
MIME-Version: 1.0
References: <20210208181747.44789-1-mcroce@linux.microsoft.com>
 <CADkTA4P-kS6UdgDmT9J=FtWGy0Tmu28RtDtXHOg0M_J8z41vAQ@mail.gmail.com>
 <CAFnufp0ehmcRbLmZXPyG0s8guwyxHhaFXchATL0JRqTYMVPKNA@mail.gmail.com> <CADkTA4OyrJa19z57OJDvo-Si2cjjkO5AH+e9JQ1P5cWtQUKRQw@mail.gmail.com>
In-Reply-To: <CADkTA4OyrJa19z57OJDvo-Si2cjjkO5AH+e9JQ1P5cWtQUKRQw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 9 Feb 2021 08:44:19 -0800
Message-ID: <CAMKF1sonXQZL0ML=HPmyHdfV=A7fR_XumuhLd7YMBCLJ1JkZ+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes-kernel: add libbpf
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Matteo Croce <mcroce@linux.microsoft.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

fails to build for rpi4 here

https://errors.yoctoproject.org/Errors/Details/570276/

On Mon, Feb 8, 2021 at 1:34 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Mon, Feb 8, 2021 at 4:22 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
> >
> > On Mon, Feb 8, 2021 at 9:13 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Mon, Feb 8, 2021 at 1:18 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
> > > >
> > > > From: Matteo Croce <mcroce@microsoft.com>
> > > >
> > > > Add a recipe to build libbpf from https://github.com/libbpf/libbpf
> > > > The only patch fixes a build issue, and it's already merged upstream.
> > >
> > > Thanks for the submission! I have a few comments / questions.
> > >
> > > To get this into oe-core, we should be commenting / documenting why it
> > > should be in core, versus another layer. The standard criteria is that
> > > there are enough varied users and that the functionality is common
> > > enough, that it belongs in core.
> > >
> >
> > For sure bcc and bpftrace can use it, and maybe also perf.
> > In future even iproute2 will use it, as it has been ported to libbpf recently.
> > Feel free to propose another layer, in case you know a better one.
>
> That's not for me to propose . that's for you to sort out.
>
> A quick check of the layer index would show that other bpf tools are
> in meta-oe.
>
> >
> >
> > > There should also be some sort of oe-selftest for the functionality,
> > > otherwise, it is hard to detect breakages. Some sort of application
> > > that uses the library and that can be executed in qemu would be
> > > enough.
> > >
> >
> > That's doable.
> >
> > > What are the kernel requirements ? CONFIG_BPF is selected by other
> > > kernel configs (it has no menu entry, so it must be), is it that, or
> > > something else that is the requirement (classic BFP?). If that option
> > > is now always on, is that true for the reference kernel versions in
> > > master (5.4 and 5.10).
> > >
> >
> > I'd say BPF_SYSCALL, which is the single entry point for al the eBPF routines.
>
> Yes, that's the core support, and a selftest would ensure that the
> reference kernels can support the package (they can, but we still need
> the test) and implicitly document that requirement.
>
> >
> > > Finally, does this work across all the supported architectures ? if
> > > not, we'll need compatibility settings.
> > >
> >
> > I tested it only x86 and aarch64, but it should be arch independent.
>
> Then it should be limited to where it has been tested, otherwise, the
> burden falls to the oe-core maintainer, which we don't want.
>
> Bruce
>
> >
> > Thanks!
> > --
> > per aspera ad upstream
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>
