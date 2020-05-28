Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.2419.1590624148229767773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 17:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e45S6SBt;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id b27so1531027qka.4
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 17:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gLAC0ZCfW8WcFMQ5YJMWU55rFcWxtaG6OCbqTHGwUXQ=;
        b=e45S6SBtkWPV5k3nDt/RJ+IvZ8GENpuqQW6Fd49BoWMwCgIPB4KmTgqfDoCkCzThk/
         UTqDpRBzoNc5vJuypkjygAGxKQ/v1wHp6niTNY/O3bDmTyqN+L+FqRYOiNb7eC4tEOA5
         kSJIs5FfwFwG3scvOfNwdRLwxoA/D3Y1jXQ2z9n53adAlYjJs7TGQXZoEYG0a95hjT6g
         XRzKigTGF1mpKE6ap4GVHJPjC1xvdBf1ftDQIPa8gUfSfdpfDrrt/edXEcYe8XEbZ56E
         7vB5IoZ6cTH4n6/vZSE9vJL5aMf2AoYAZPuemgZIia9uAOj5S8Fk8XG3PYmV/lS/bHog
         hQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gLAC0ZCfW8WcFMQ5YJMWU55rFcWxtaG6OCbqTHGwUXQ=;
        b=iZAvy+caiUwtysCB/sODFqruAzHTAuW+eltXpPpAIDyj9QAwGh0dC5yQe5p6Am+65W
         eePGErRIARZJhk455rmt3LfIkP6awJjoQG4Cu7ZSZ1O7QzqhdGSBs958tPU+W8PK+5id
         kjEOtv8C4I00AtVbJCnvMTjQ3s0S5i6aIfu94XrISbz5EGiRKK65FSjaDvw6QmOnD71a
         OH+96Boial5wAzfeSjDiy74SpxTx5p02TG+TSa3IGPknj6wq0cCkeWe/dh475sUXYdZK
         /94VPH3LF8+QTPC0WOkk+JBWtvmvnvcevyNy8aEN4s8z15HmHkCC7KJha/U4QRovxT31
         UbeA==
X-Gm-Message-State: AOAM530XxYq+3l7JK0e845UJGp91VQuTVZgjN+MlXtCgeAf+ChDYLaen
	1Kv1g7tQhpBpnwG7cD0mI+J8BY9VSKO/keBpiSs=
X-Google-Smtp-Source: ABdhPJyQDvokcNCxe9eF3a5vegLkmbLsuvoyEp6bjeqF9lJLDRpB0KxqlK0EGytjUcvDHHJrAW6u/mzjRXM7vtdSMXM=
X-Received: by 2002:a37:b847:: with SMTP id i68mr322641qkf.431.1590624147157;
 Wed, 27 May 2020 17:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200527155011.3165976-1-raj.khem@gmail.com> <20200527155957.GK17660@denix.org>
 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
 <CAMKF1spMw=6ZfkBWy3=+rSiHknxLvVC6uPH3Q8z_UiGdOECVdw@mail.gmail.com>
 <20200527215251.GA20867@pbcl.net> <CAJ86T=X=su_-PaAG_fqs-AjFb_ZFPtvRJTFvP9ZOce1Kv1Z3nQ@mail.gmail.com>
 <CAMKF1spE6tvmsJuoFciA9-MPBZLH0GpOQiDcohL5qtJzF_BzbQ@mail.gmail.com>
In-Reply-To: <CAMKF1spE6tvmsJuoFciA9-MPBZLH0GpOQiDcohL5qtJzF_BzbQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 27 May 2020 17:02:00 -0700
Message-ID: <CAMKF1spUHqFeyhr6R+3rQ8_1foDFZf6HgFNN70OOHgtFijjWaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Phil Blundell <pb@pbcl.net>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Denys Dmytriyenko <denis@denix.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 27, 2020 at 3:57 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, May 27, 2020 at 3:43 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > On Wed, May 27, 2020 at 2:52 PM Phil Blundell via
> > lists.openembedded.org <pb=pbcl.net@lists.openembedded.org> wrote:
> > >
> > > On Wed, May 27, 2020 at 02:46:24PM -0700, Khem Raj wrote:
> > > > and building userspace against way newer kernel-headers with older
> > > > kernel underneath has unintended
> > > > consequences.
> > >
> > > Can you be more specific?  If this doesn't work, it's just a bug and
> > > should be fixed.  What problems are you having?
> >
> > I don't have an up to date example, but I've been using kernel version
> > specific libc headers for all my projects for many years. The issue
> > which prompted me to do that was run time crashes from libcap-ng and
> > the historical commit message was:
> >
> > ----
> >
> >  linux-libc-headers: use 3.3.8 kernel header files for mips platforms
> >
> >  If libcap-ng is unable to probe kernel capabilities at runtime then
> >  it will assume the kernel supports all features defined by the libc
> >  kernel headers. Since our default libc kernel headers (linux 3.14)
> >  define capabilities which are not available in linux 3.3 based
> >  stblinux kernel used for our MIPS platforms, that causes runtime
> >  crashes.
> >
> >  As a workaround, force an older version of linux-libc-headers for all
> >  MIPS platforms to try to remove that discrepancy between the kernel's
> >  capabilities and those defined in the libc kernel headers.
> >
>
> there are similar issues seen with linput.h using apps. I will dig the reasons
> but it does work when kernel and kernel header. versions are same and its using
> mainlne release for kernel headers here, so there is no vendor specific code
> perhaps that's breaking APIs
>

https://github.com/torvalds/linux/commit/052876f8e5aec887d22c4d06e54aa5531ffcec75

this change e.g. in userspace checks for UINPUT_VERSION and decides to
use one method
or legacy to setup the device but this is really not gonna work with
kernels where these ioctls
are not available, it perhaps can be fixed to not check for
UINPUT_VERSION but then there
could be many such cases, how many can we chase.

> > ----
> >
> > The risk of using bleeding edge linux-libc-headers with an older
> > kernel may be low, it's not zero. Since OE testing doesn't appear to
> > include any coverage of older kernels, I'm not sure why I should be
> > the guinea pig and take the risk!
