Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.13351.1594394500708811123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 08:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OWIAkXwt;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id by13so4941269edb.11
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 08:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iqHJm1jpAmLlOb2OGKsJCMyEMx9vUTp6zLOfGYrf33M=;
        b=OWIAkXwt+ktHx/64mGlWIyV6sSwmq1WF841C5+shGc6Bod4Tmja+ecjZPATNqUH2l6
         ZSFAJYyd3wg3Ef7cdoHyF7GGcrpMiVb9qfzHZp2o33eY3iKriGzn8miAGti//hOcXArx
         Cso+lPNxsI4UqCOYeZJge5+JkHIXF4e/vE2/MQ6w9RlNiFAVSXO0ai15FMQFQBmGHZJO
         Ex4TlNZDm1wJv3OXUDvIw+gVeX2NWxVXP4/QVcQy6Ww9uNx9x7LIo0BZ4afr6zU4nW46
         U1ytqHh3EnDqHymrmFnsY06O6r1gwdbskky5Sx81MpNrWQyl3bgrF25W4QYj8cE3V67D
         hXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iqHJm1jpAmLlOb2OGKsJCMyEMx9vUTp6zLOfGYrf33M=;
        b=PGxBIeX24UeY2BBPtIutL4oWYaTGMfLPhZUEUrvbk3Ag6CdaF7Q77jw5o76pEv5+uC
         RomZa2L6vooFh74a/aRYOZFzNjNUpNJnGSexLrT+DyQs1oxs1T7gzULjqCT43PEtltiz
         gC1UyzOc83oju3Gj3vzqGNWDa95WWuLM/8IOdysok8uKko4t2ZeFGzJ1jH5BkZuV+OYF
         s22fZQHaHmAWsNRS/FxJy0Xf2EWHc8xJED4hZVJW9gdNsevnicHT4O1HJsAxgsnBWojW
         x6kDsjuAs9m2uJHpiodA1mhrA4o5yG6Y2qCZWkJerYq5SAS20CdD5u9Im8f9t8p6m/WR
         Th8w==
X-Gm-Message-State: AOAM532dFi+8XFJRDl5pl3neElclmr3U5B/8bIFOxtoAlXvOBTLZZu+Q
	HivNQg5BpP31z+L6AxD9/+fP8nXF5lvx2tTclfU=
X-Google-Smtp-Source: ABdhPJyAc3Bb1thZ36k8RFjrdXw1tUnxvPnL5pIMx2jJTkl03HSBUGmacwLYn5/Hr3zlAzHGaqCZGmlkDV5Kab0NF2E=
X-Received: by 2002:a05:6402:b72:: with SMTP id cb18mr39643396edb.352.1594394499163;
 Fri, 10 Jul 2020 08:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200710090514.440-1-max.krummenacher@toradex.com>
 <20200710090514.440-2-max.krummenacher@toradex.com> <CADkTA4PA0N8W7+jUbV+ao__tY8Q_623=yLZ47YC=z4dD4fiGmA@mail.gmail.com>
 <CAHtQpK5GsbVg3pdNWoYtynvHjzCMMJVr7yRAx5mPQ674DS6N2g@mail.gmail.com> <bf4599cf6afab3338c6bdbc86855a424376d3c39.camel@gmail.com>
In-Reply-To: <bf4599cf6afab3338c6bdbc86855a424376d3c39.camel@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 10 Jul 2020 11:21:28 -0400
Message-ID: <CADkTA4MDO+BCc3ZLDCTzpG6v-0F-c0BwyU068yb1CjTN84sg4A@mail.gmail.com>
Subject: Re: [OE-core][Patch 2/2] kernel-yocto.bbclass: force creation of config.queue
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 10, 2020 at 11:12 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
>
> Hi Bruce, Hi Andrey
>
> Am Freitag, den 10.07.2020, 15:21 +0200 schrieb Andrey Zhizhikin:
> > On Fri, Jul 10, 2020 at 2:47 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > On Fri, Jul 10, 2020 at 5:06 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > > > In the case of no patches or no configure fragments, during
> > > > do_kernel_metadata() scc is not called, and thus
> > > > kernel-sources/${meta_dir}/config.queue is not created.
> > > > Later do_kernel_configme fails because the file is missing.
> > >
> > > This is a really strange case, since in tree and defconfigs go through
> > > the queue.
> > > How are you ending up in this situation in the first place?
>
> I have a kernel recipe with SRC_URI = "git://kernel-git file://defconfig"
> As far as I understand it no configure fragments kick in from anywhere.
> Whith that the above case is what happens, i.e. none of the variables put together to
> form 'elements' have any content.
>
> Notably, $sccs is empty. I.e. if I add some bbwarns after the sccs assignment
>
>         sccs="$sccs_from_src_uri"
>         bbwarn "sccs " $sccs
>         bbwarn "sccs_from_src_uri " $sccs_from_src_uri
>         bbwarn "sccs_defconfig " $sccs_defconfig
>
> I get:
>
>    WARNING: sccs
>    WARNING: sccs_from_src_uri
>    WARNING: sccs_defconfig  .../recipes-kernel/linux/linux-toradex-4.14-2.3.x/mx8/defconfig
>
> sccs_defconfig has been removed from the variables which form elements in commit
> 23dcff0d396c (oe: e6845327b693) (kernel/yocto: ensure that defconfigs are
> processed first). Was that removal not intended?
> In which of the variables would you expect an out of tree defconfig to end up?

It goes into the config.queue just like the rest of .scc files.

The changes I made recently were only to ensure that it was at the
bottom of the queue, so fragments can logically follow and adjust
settings. So no, the defconfig is not removed from the processing, it
has just been order adjusted.

>
> I admit I lack the big picture of what kgit, scc and do_kernel_metadata and
> friends really do, I wrote the patch under the impression that without
> configuration fragments or patches one should not run scc here.
>
> >
> > Can this be the same issue that was solved when defconfig is not in-tree?
> >
> > I guess this could happen only when the list of elements defined as:
> > elements="`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`"
> > would contain nothing at all, which means that even a defconfig is not found...
> >
> > Max,
> > Can you reproduce this issue from the latest master? Fix for searching
> > for OOT defconfig is already merged there (see [1]).
>
> Yes, I can, actually without your patch the build errors out earlier.
> You could reproduce it too if you removed

I can build here with a defconfig only kernel, so something else is wrong.

If you can send me (off list) the details of your build (your
bblayers, local.conf settings), I can fire up a build and see what has
gone wrong.

Bruce

>     SRC_URI += "file://0001-perf-Make-perf-able-to-build-with-latest-libbfd.patch"
> from meta-freescale/recipes-kernel/linux/linux-imx_5.4.3.bb and rebuild that kernel e.g.
>     MACHINE=imx8qmmek bitbake virtual/kernel -fc kernel_configme
>
> >
> > > I'd rather not force create this, but detect the misconfiguration and
> > > output a useful error message.
> > >
> > > Bruce
>
> Max
>
> > [1]:
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7dbc62a672909adce316bb4a8772be0ee9b480fe
> >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
