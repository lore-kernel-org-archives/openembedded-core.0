Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.14078.1594396377214224532
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 08:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZFrXj0FM;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id f2so6438423wrp.7
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 08:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KhMNGFbOpi2WBu3P8OUmtki6VNnoJTF3O++XMUn/3A8=;
        b=ZFrXj0FMtQ+ZWX8N6K5lYHMhqm3aDoiJV0x460qCFDRuHd68QZ1ugpOc+R0wpTRwms
         kY0+5nv/j5L2T7X2YliTByfQQz0AJAGJAH85xkWY9F2Ia7PRd/qNjU9SgcY3T9XnelFj
         JtX4FL57LE/4F3CGqjBauFVWEtzHKLXPQtr8w/owLcz9nNbZholxQbBWEco8NhtG/KU1
         B3ZmKrKNommVE7yMP4+rYWW0Fp+8+H2IJwL7jt4dz3gQ/3Z6MJHCEq/OwDGukohVTXGx
         RLaFESYKXiDBSzT10eaTGGN529lj7dZwU674pltw5AQN6e4Ut4SQJHUrWiIb1rO8zbG7
         5T0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KhMNGFbOpi2WBu3P8OUmtki6VNnoJTF3O++XMUn/3A8=;
        b=S6g9HDRuzD+mdw7WQzOc8bzzWNrQyPIJfCtugXO47ZvklTE3WVjd2G2y1TGaiBzfzR
         MV3VoUO4ie7co1Ld2cRtQDICsW5ybextcjd8LSoYPIG3DaiY3ObCA2P9pKj76YNEWXnu
         D+gf4nqfLX6xp42vASG3OLpYx71f2LzQJd/Q5RhddFyUi9UPOkI6szQg9DoZCxjf1eWh
         eznMCM/jJiiiXs160GmMUbVVHozRQWy5Eckh7TSwQWgryoTPq2xJ8rCjI6WNSrRPzBwF
         NMi2qTi/MIA4qsdQoplH85pUP7+brbYBEQnTFtu9gxa8/9964XbA3vzxCjtLi+wc0/rX
         SgIw==
X-Gm-Message-State: AOAM530pCzHq6zUivRRdTs5F0vR5Zn+LYTM8+0+fNXh6zLsNPoas2Qm7
	Sbv1IWLhA5vgb+M2FC2gI5k=
X-Google-Smtp-Source: ABdhPJxtn0PnH6HrUVDyuHF0N0zcoof868HjxMlYwY0AUF3FqePv38fpCGBARFK2DvToc8X0xnFvFg==
X-Received: by 2002:a5d:6603:: with SMTP id n3mr71162397wru.142.1594396375631;
        Fri, 10 Jul 2020 08:52:55 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from Saturn.fritz.box ([81.221.228.86])
        by smtp.gmail.com with ESMTPSA id b18sm10825513wrs.46.2020.07.10.08.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 08:52:55 -0700 (PDT)
Message-ID: <ffdc5289fd5629ead12ca61c865e769ef82655cf.camel@gmail.com>
Subject: Re: [OE-core][Patch 2/2] kernel-yocto.bbclass: force creation of config.queue
From: "Max Krummenacher" <max.oss.09@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, Patches and discussions about the
 oe-core layer <openembedded-core@lists.openembedded.org>, Max Krummenacher
 <max.krummenacher@toradex.com>
Date: Fri, 10 Jul 2020 17:52:54 +0200
In-Reply-To: <CADkTA4P-y9n5LLFBmbwhVjV5eXqpM43oVL9KqJxzAUNS8VFZGQ@mail.gmail.com>
References: <20200710090514.440-1-max.krummenacher@toradex.com>
	 <20200710090514.440-2-max.krummenacher@toradex.com>
	 <CADkTA4PA0N8W7+jUbV+ao__tY8Q_623=yLZ47YC=z4dD4fiGmA@mail.gmail.com>
	 <CAHtQpK5GsbVg3pdNWoYtynvHjzCMMJVr7yRAx5mPQ674DS6N2g@mail.gmail.com>
	 <bf4599cf6afab3338c6bdbc86855a424376d3c39.camel@gmail.com>
	 <CADkTA4MDO+BCc3ZLDCTzpG6v-0F-c0BwyU068yb1CjTN84sg4A@mail.gmail.com>
	 <CADkTA4P-y9n5LLFBmbwhVjV5eXqpM43oVL9KqJxzAUNS8VFZGQ@mail.gmail.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Bruce

Am Freitag, den 10.07.2020, 11:28 -0400 schrieb Bruce Ashfield:
> On Fri, Jul 10, 2020 at 11:21 AM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > On Fri, Jul 10, 2020 at 11:12 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > > Hi Bruce, Hi Andrey
> > > 
> > > Am Freitag, den 10.07.2020, 15:21 +0200 schrieb Andrey Zhizhikin:
> > > > On Fri, Jul 10, 2020 at 2:47 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > > > On Fri, Jul 10, 2020 at 5:06 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > > > > > In the case of no patches or no configure fragments, during
> > > > > > do_kernel_metadata() scc is not called, and thus
> > > > > > kernel-sources/${meta_dir}/config.queue is not created.
> > > > > > Later do_kernel_configme fails because the file is missing.
> > > > > 
> > > > > This is a really strange case, since in tree and defconfigs go through
> > > > > the queue.
> > > > > How are you ending up in this situation in the first place?
> > > 
> > > I have a kernel recipe with SRC_URI = "git://kernel-git file://defconfig"
> > > As far as I understand it no configure fragments kick in from anywhere.
> > > Whith that the above case is what happens, i.e. none of the variables put together to
> > > form 'elements' have any content.
> > > 
> > > Notably, $sccs is empty. I.e. if I add some bbwarns after the sccs assignment
> > > 
> > >         sccs="$sccs_from_src_uri"
> > >         bbwarn "sccs " $sccs
> > >         bbwarn "sccs_from_src_uri " $sccs_from_src_uri
> > >         bbwarn "sccs_defconfig " $sccs_defconfig
> > > 
> > > I get:
> > > 
> > >    WARNING: sccs
> > >    WARNING: sccs_from_src_uri
> > >    WARNING: sccs_defconfig  .../recipes-kernel/linux/linux-toradex-4.14-2.3.x/mx8/defconfig
> > > 
> > > sccs_defconfig has been removed from the variables which form elements in commit
> > > 23dcff0d396c (oe: e6845327b693) (kernel/yocto: ensure that defconfigs are
> > > processed first). Was that removal not intended?
> > > In which of the variables would you expect an out of tree defconfig to end up?
> > 
> > It goes into the config.queue just like the rest of .scc files.
> > 
> > The changes I made recently were only to ensure that it was at the
> > bottom of the queue, so fragments can logically follow and adjust
> > settings. So no, the defconfig is not removed from the processing, it
> > has just been order adjusted.
> > 
> > > I admit I lack the big picture of what kgit, scc and do_kernel_metadata and
> > > friends really do, I wrote the patch under the impression that without
> > > configuration fragments or patches one should not run scc here.
> > > 
> > > > Can this be the same issue that was solved when defconfig is not in-tree?
> > > > 
> > > > I guess this could happen only when the list of elements defined as:
> > > > elements="`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`"
> > > > would contain nothing at all, which means that even a defconfig is not found...
> > > > 
> > > > Max,
> > > > Can you reproduce this issue from the latest master? Fix for searching
> > > > for OOT defconfig is already merged there (see [1]).
> > > 
> > > Yes, I can, actually without your patch the build errors out earlier.
> > > You could reproduce it too if you removed
> > 
> > I can build here with a defconfig only kernel, so something else is wrong.
> > 
> > If you can send me (off list) the details of your build (your
> > bblayers, local.conf settings), I can fire up a build and see what has
> > gone wrong.
> 
> Actually, I think I see the hole that this managed to sail through.
> Can you try the attached patch ?
> 
> It isn't the final one, since I'm also going to add a message and
> error if no configuration elements are found, but I wanted to see if
> this addresses the immediate issue.

I don't have to test, this was actually my first approach to make the
build succeed. I thought it to be to invasive for all the other use
cases which I do not fully understand.

If you're working on anything that includes the effects of the attached
patch just drop my submission. Thanks for the work.

I put a workaround for this issue in our kernel recipe, so for me there
is no rush to have it fixed in openembedded-core.

Max

If anyone would need the quick and dirty workaround:

+do_kernel_metadata_append () {
+       touch ${S}/.kernel-meta/config.queue
+}

> 
> I'm actually in the midst of re-working quite a bit of this flow for
> the fall release, so I'm trying to keep changes to a minimum at the
> moment, since they could end up being tossed in the bin shortly.
> 
> Bruce
> 
> > Bruce
> > 
> > >     SRC_URI += "file://0001-perf-Make-perf-able-to-build-with-latest-libbfd.patch"
> > > from meta-freescale/recipes-kernel/linux/linux-imx_5.4.3.bb and rebuild that kernel e.g.
> > >     MACHINE=imx8qmmek bitbake virtual/kernel -fc kernel_configme
> > > 
> > > > > I'd rather not force create this, but detect the misconfiguration and
> > > > > output a useful error message.
> > > > > 
> > > > > Bruce
> > > 
> > > Max
> > > 
> > > > [1]:
> > > > http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7dbc62a672909adce316bb4a8772be0ee9b480fe
> > > > 
> > 
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> 
> 

