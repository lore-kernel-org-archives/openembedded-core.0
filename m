Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.4647.1610729999842189924
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 09:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PBkLYiwI;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id b21so1461675edy.6
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 08:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aN2FSyZXTn5yTUrwBApWShHrOM2pM/3fCWZCggiW3VM=;
        b=PBkLYiwIGEeXwV410e+JKysltemGXtGU36vnGr0lcyakxS7ScmvWPytI8p0qnXuksJ
         xo6UHJ0i7/3peD0N+Oa9iPxMH+g5gpVsVMkXJoTgnsZmg4s255sGEBAi1be6PzaIPRN+
         ZA5gPa9tMyktgdX36ol4pNXtfGSKw04xg6vCPH7nZ9YfLwsEG2HRTWS3AFKO+CeZ8hnr
         JMX5NDx4OrjjefQb9EjDue2mGtUiJnl+79ueTqA1invieiMHYceGwwMnvbXOYOpXSeXM
         JV4sR7Ns+8fCkY5Z1ILZDQoMLmOoU+9iPz5RVgHuqMANJSmv17NK0E28+VkK4zyir2Gg
         DeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aN2FSyZXTn5yTUrwBApWShHrOM2pM/3fCWZCggiW3VM=;
        b=Bz0O7920iZMN0g6UFyhjLqv0VaRRA476LnxwJUKUmCtW64zgWhGpmpf4QcQlCHsY32
         bzuoUYNnB2BEViyrXIgw0gYPBJO3mZljUt9kerW1Bp6QiNw/+7dD9VETs8wn3nihMWeY
         dBtihANIMDivoQ1iKT7x2rXRuoe2onxG6gjUydfotIV4AN05McROVJVreHBd5kqbEDgp
         +EJXI5J76dLN1BQgXlEnoXi1sWJ2RBJMYIW1KyRjCwEZnkM4Wy8nHRoDdk1ln0vRkQuH
         UhBoau5kPbRiokZjd0wQ0orDB9iZt/qOouK4574bHz39a+v8GHS+uZ0OkAT2bM/A3vK4
         kWsQ==
X-Gm-Message-State: AOAM531cPHMI+CNNGoZq9RECFsLhkn8/dIX3Pkq4QkLf5I+gMXEOuIzq
	kYEphYmolErJCJUS+CT/cdDOp5GBEDTGicYAtlM=
X-Google-Smtp-Source: ABdhPJyEdmsGu/rTTzmk8xyFxvOuLiqnoTtTtRV3FQGSVXUw/2iJo4gMXgmbiSkYM5FrC/JJfTZoltFsV1lz6na5bag=
X-Received: by 2002:a05:6402:22e1:: with SMTP id dn1mr10733503edb.347.1610729998311;
 Fri, 15 Jan 2021 08:59:58 -0800 (PST)
MIME-Version: 1.0
References: <20210115052615.29893-1-paul.gortmaker@windriver.com>
 <12145df57b9fdec6933497849a2d8b40fcb8a023.camel@linuxfoundation.org>
 <a81ea7e632a26636d966540a86ec1978f557e63c.camel@microsoft.com>
 <20210115144724.GM16838@windriver.com> <96b7ff9f43b96d80021b3f797a6295de210711ea.camel@microsoft.com>
 <CADkTA4MHjfrAf01PDVY8hyR9r_f5mqheLomuWKuUZY-+Rgi0=g@mail.gmail.com> <6b4797ffe82f0ddd48352363ad85b3e5a52c3f7e.camel@microsoft.com>
In-Reply-To: <6b4797ffe82f0ddd48352363ad85b3e5a52c3f7e.camel@microsoft.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 15 Jan 2021 11:59:46 -0500
Message-ID: <CADkTA4PrQefBMme_z6JAquZCv=7CYMsq8OA4+Y7xVHwL=VjseA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.8
To: Luca Boccassi <Luca.Boccassi@microsoft.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"paul.gortmaker@windriver.com" <paul.gortmaker@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 15, 2021 at 11:31 AM Luca Boccassi
<Luca.Boccassi@microsoft.com> wrote:
>
> On Fri, 2021-01-15 at 11:07 -0500, Bruce Ashfield wrote:
> > On Fri, Jan 15, 2021 at 10:37 AM Luca Boccassi via
> > lists.openembedded.org
> > <luca.boccassi=microsoft.com@lists.openembedded.org> wrote:
> > > On Fri, 2021-01-15 at 09:47 -0500, Paul Gortmaker wrote:
> > > > [Re: [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.8] On 15/01/2021 (Fri 09:57) Luca Boccassi wrote:
> > > >
> > > > > On Fri, 2021-01-15 at 08:37 +0000, Richard Purdie wrote:
> > > > > > On Fri, 2021-01-15 at 00:26 -0500, Paul Gortmaker wrote:
> > > > > > > Recent systemd started using ascii args to "hidepid=" mount options
> > > > > > > for proc fs - unconditionally -- even though kernels older than v5.8
> > > > > > > emit an error message on each attempt:
> > > > > > >
> > > > > > > root@qemux86-64:~# cat /proc/version
> > > > > > > Linux version 5.4.87-yocto-standard (oe-user@oe-host) (gcc version 10.2.0 (GCC)) #1 SMP PREEMPT Fri Jan 8 01:47:13 UTC 2021
> > > > > > > root@qemux86-64:~# dmesg|grep proc:
> > > > > > > [   29.487995] proc: Bad value for 'hidepid'
> > > > > > > [   43.170571] proc: Bad value for 'hidepid'
> > > > > > > [   44.175615] proc: Bad value for 'hidepid'
> > > > > > > [   46.213300] proc: Bad value for 'hidepid'
> > > > > > > root@qemux86-64:~#
> > > > >
> > > > > Wouldn't it be better to patch the kernel to downgrade that message to
> > > > > debug level?
> > > >
> > > > The problem is that the breakage is forced upon older kernels, so you'd
> > > > have to effectively mainline that kind of "fix" to v5.12 (where there is
> > > > no problem) and then you could in theory request it for v5.4 linux-stable
> > > > according to "stable rules".
> > >
> > > The patch could be downstream for older kernels, just like this one is.
> > > With the difference that it would be temporary.
> >
> > But the coverage is impossible, since there are so many
> > different kernel trees. So a kernel solution is a non-starter.
>
> IMHO a long term solution can only go through the kernel. There will be
> more instances like this in the future, given the fundamental issue is
> the lack of a clear EOPNOTSUPP-like interface. I realise the mount
> interface is ancient at this point, and difficult to change. We are
> keeping an eye on the evolution of the new interface, but it's not
> there yet (eg: no read-only bind mounts).

I don't disagree .. but I'm only commenting on this one older kernel
issue, so there's nothing to see in the new kernels where I spend
99% of my time. The interfaces in the kernel will absolutely evolve
in the newer kernels, and that's a good thing.

>
> > > > Besides, if something with root/mount priv. is consistently trying to
> > > > drive a square peg into a round hole - by trying to mount something and
> > > > failing -- it should be something that a sysadmin would want to
> > > > investigate.  Which is precisely why I am here now.  I think burying it
> > > > at debug level is counterproductive to that.
> > >
> > > Well the real issue is that there's no way to get a clean "we don't
> > > support this option" out of certain kernel APIs, so one has to guess
> > > and see what happens. Sometimes it's even worse, and flags like
> > > NOSYMFOLLOW get silently ignored if they are not supported, which is
> > > not great for security-related settings...
> > >
> > > Anyway, these warnings only appear if ProtectProc and/or ProcSubset are
> > > set to something other than the default value. Why not simply add a
> > > top-level drop-in in /etc that forces them to be disabled in all
> > > services if you have an older kernel? Something like this:
> > >
> > > /etc/systemd/system/service.d/10-override-protect-proc.conf
> > > [Service]
> > > ProtectProc=default
> > > ProcSubset=all
> > >
> > > And then you can drop it when you upgrade your kernel. Isn't this a
> > > better option than taking on permanent technical debt?
> >
> > That's even more fiddly than Paul's patch. It relies on much more
> > of someone's distro configuration.
>
> But what is the combination of a kernel version + systemd version if
> not someone's distro configuration?
> I mean, it could even be added dynamically by the poky recipe at build
> time, given the kernel version is known at that point.

The kernel isn't currently a dependency of systemd and you'd be going
outside of the recipe namespace (but maybe I'm missing something, I
spent about a minute refreshing my memory on the recipes) .
Something at the image/rootfs level, gets brittle and doesn't scale
(but again, maybe I'm overlooking some technique).

>
> Surely a three lines piece of configuration is better to handle than a
> downstream patch?
>

Not in my opinion. I have no interest in extra moving parts and having
something injected into my userspace/init config.

> > But it is true that you can throw it away eventually, assuming
> > someone actually knows that it is there.
> >
> > I wouldn't call this patch much of a technical debt, but if it starts
> > gumming up systemd upgrades, it's easy to revisit.
>
> It's in a security-critical area that we are constantly improving and
> expanding.

That code block isn't particularly complex and it is self contained,
so really, there's not much to see there. But I'm not in the business
of predicting anything, I'm in the wait and see camp (AUH will be the
first to pick it up if it causes patch problems, etc).

Richard can either take the change or not, I'm just supporting how
it has currently been submitted as chances are that no further
revisions are coming from Paul, so it can live or die as-is.

Cheers,

Bruce

>
> --
> Kind regards,
> Luca Boccassi



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
