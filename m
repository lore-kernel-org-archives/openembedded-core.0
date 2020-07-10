Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.12904.1594393950709278657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 08:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qof2+JT3;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id a6so8682031wmm.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 08:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=PRJ+9x78hs3dZAS0bDDYvBexIqViw5Y0LiykXwO2TR8=;
        b=Qof2+JT3VMfxup9ZygRJapnIkJkxaynwsJkmNONq/e68EqVL9GEBL54Jj6k+jY4F1t
         wwDByWmTt3EqqGm30XyLuhQPAorew3LnKTPvZOEQc7uLLTemyjNwvvf6k4K1LSFG8Q/o
         YcfaCkFdgqBalgUSo6WS5H+jKwBvYSYyAVBYu00mtjKUw4jMhX7ucyOMwmupjkzEoy8R
         DexL3icQz9b8LTU61H8w/yqhjOPtuMuScKbkjdVIhYOYfZZKgk4IRbP5b0QVQ/HIQtSo
         DXGg2DKw8My7pppAa3ekJB+my5KhWw1gevWATChB1hN+ndf0PFGDfKqkTgaGAFgVxaG/
         U0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PRJ+9x78hs3dZAS0bDDYvBexIqViw5Y0LiykXwO2TR8=;
        b=ce8dA4LBgusFutLXZhf7V5y8EeewnCqd69gpix977TzHrEg+/RTRvq8FtGuN8iRIvx
         kfbV8kAkufdjlOD/aHHXelAsTnV3sUkuJCHOgWcwU4F9LSvjTq7s5B/ZRb6imCc02QUN
         0syNWQs0Jj9R15NGw1SSy6cSKaXEaIKehoBqMyTVOuBYp1UjQZeNtS869mMBMC66wQNF
         H3z2dCHE5hXc0/M0IQZKviNk8yw3t80IgIbAMP/LNrkfxQXDHH5rxHnSSfdHdpKyIxz3
         ul/XRZ6BIUuBxzbVtma4cU/5BzSwGs9iAO0+vW89/DpyK7J0f8iGaKTbe+1xlyQPSkOP
         RHBA==
X-Gm-Message-State: AOAM530P7dOgcTy1++brzgbD057OcqJjGAPhPk/gACpJe5m7vtUR4Si4
	q97QTEoBaMu0MuANYvc6fm4=
X-Google-Smtp-Source: ABdhPJy6zjOENF72n0F1HtvPdmgkrUn7ZQkBHw28fKkA6r1ncavsOORnx76dICwyYABTA0BLtWzwEA==
X-Received: by 2002:a1c:ba08:: with SMTP id k8mr5469773wmf.28.1594393949317;
        Fri, 10 Jul 2020 08:12:29 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from Saturn.fritz.box ([81.221.228.86])
        by smtp.gmail.com with ESMTPSA id q1sm10477310wro.82.2020.07.10.08.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 08:12:28 -0700 (PDT)
Message-ID: <bf4599cf6afab3338c6bdbc86855a424376d3c39.camel@gmail.com>
Subject: Re: [OE-core][Patch 2/2] kernel-yocto.bbclass: force creation of config.queue
From: "Max Krummenacher" <max.oss.09@gmail.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Max Krummenacher
	 <max.krummenacher@toradex.com>
Date: Fri, 10 Jul 2020 17:12:28 +0200
In-Reply-To: <CAHtQpK5GsbVg3pdNWoYtynvHjzCMMJVr7yRAx5mPQ674DS6N2g@mail.gmail.com>
References: <20200710090514.440-1-max.krummenacher@toradex.com>
	 <20200710090514.440-2-max.krummenacher@toradex.com>
	 <CADkTA4PA0N8W7+jUbV+ao__tY8Q_623=yLZ47YC=z4dD4fiGmA@mail.gmail.com>
	 <CAHtQpK5GsbVg3pdNWoYtynvHjzCMMJVr7yRAx5mPQ674DS6N2g@mail.gmail.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Bruce, Hi Andrey

Am Freitag, den 10.07.2020, 15:21 +0200 schrieb Andrey Zhizhikin:
> On Fri, Jul 10, 2020 at 2:47 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > On Fri, Jul 10, 2020 at 5:06 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > > In the case of no patches or no configure fragments, during
> > > do_kernel_metadata() scc is not called, and thus
> > > kernel-sources/${meta_dir}/config.queue is not created.
> > > Later do_kernel_configme fails because the file is missing.
> > 
> > This is a really strange case, since in tree and defconfigs go through
> > the queue.
> > How are you ending up in this situation in the first place?

I have a kernel recipe with SRC_URI = "git://kernel-git file://defconfig"
As far as I understand it no configure fragments kick in from anywhere.
Whith that the above case is what happens, i.e. none of the variables put together to
form 'elements' have any content.

Notably, $sccs is empty. I.e. if I add some bbwarns after the sccs assignment

        sccs="$sccs_from_src_uri"
        bbwarn "sccs " $sccs
        bbwarn "sccs_from_src_uri " $sccs_from_src_uri
        bbwarn "sccs_defconfig " $sccs_defconfig

I get:

   WARNING: sccs 
   WARNING: sccs_from_src_uri 
   WARNING: sccs_defconfig  .../recipes-kernel/linux/linux-toradex-4.14-2.3.x/mx8/defconfig

sccs_defconfig has been removed from the variables which form elements in commit
23dcff0d396c (oe: e6845327b693) (kernel/yocto: ensure that defconfigs are
processed first). Was that removal not intended?
In which of the variables would you expect an out of tree defconfig to end up?

I admit I lack the big picture of what kgit, scc and do_kernel_metadata and
friends really do, I wrote the patch under the impression that without
configuration fragments or patches one should not run scc here.

> 
> Can this be the same issue that was solved when defconfig is not in-tree?
> 
> I guess this could happen only when the list of elements defined as:
> elements="`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`"
> would contain nothing at all, which means that even a defconfig is not found...
> 
> Max,
> Can you reproduce this issue from the latest master? Fix for searching
> for OOT defconfig is already merged there (see [1]).

Yes, I can, actually without your patch the build errors out earlier.
You could reproduce it too if you removed
    SRC_URI += "file://0001-perf-Make-perf-able-to-build-with-latest-libbfd.patch"
from meta-freescale/recipes-kernel/linux/linux-imx_5.4.3.bb and rebuild that kernel e.g.
    MACHINE=imx8qmmek bitbake virtual/kernel -fc kernel_configme

> 
> > I'd rather not force create this, but detect the misconfiguration and
> > output a useful error message.
> > 
> > Bruce

Max

> [1]: 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7dbc62a672909adce316bb4a8772be0ee9b480fe
> 

