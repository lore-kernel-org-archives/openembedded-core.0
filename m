Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.2616.1605330570609575891
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 21:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=odf6ew1z;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id ay21so13317438edb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 21:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D5dmiCtLbzn/NTjVE/D7huSPZprJvtUO7a3KadXA7UU=;
        b=odf6ew1zbaq8l7k5hD144mQ58cugQgTVuIdKd1JU1smZKAoxqf73ZMUgWUE0QrUGav
         fJAGzD4lrjPELIEftN/8T1Lyv+vrSL4KhKMzRnCyrz5dy/xa1J3hOChYN25kjFIHo23g
         3RBIA63k5f3QXHDizgweuHmZ2act1XhDRizQxDzjXVE1h4wz8yy+BX08le24Iv0P0Bg1
         ilLG5cD5RfvJdvZ09XT+atSxnsYKNG6xOBY6GY7hARPcD5AUYdXdVo4khwQk4cfLqXc+
         YzIOteiXsnUGF2DZh50DGMkNK9+e2lGOu67f/xliRHW7/z1g5Z6VgYBk11X0kxey5wjA
         8t0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D5dmiCtLbzn/NTjVE/D7huSPZprJvtUO7a3KadXA7UU=;
        b=n/UnAhCBRCZJsckleQRXwRMjDk7F7w3KSyNkjj2pUuYBtY/R0bz+wDTpNBei0Sq0ui
         6OevQURIsIjtXA5P5txt30BmF1iDL8WwDsqXb65/F8W2k8dkYQI/zaYCaoTPQ8xoY3DE
         aYeJo7oGnZow/PqY2mF9S0ZkgeCUTRA8p6FmHXltzx17I4dSfXd/qZ3ofPJR+vxhUmEJ
         l57uNokWukTNQdEB10wmN0iKVmpIHgUcIXOXk1rsQC7qJZRAxaWJCPAcJT4RdRvRx6qu
         cASyxyrUqKwEE0x2Pn37l5zeBJwhgAcQvmZNBU7/gn7kouvixF47uPskHAuSUx9ZTfiq
         NKUQ==
X-Gm-Message-State: AOAM533vJR/Et01Refrjox9l2Xw4vTnYdUb20Ie/C+PRJDJt8eFcxLR6
	5uyNOs6BoTvg3y27xWIXpWnqhB6PITNEzO2HL/M=
X-Google-Smtp-Source: ABdhPJzF7HbbGCeCppgJ6iA4HyILYGFrL/Upu4jFDSgwh3IwR2BSxy9FWmrltt2kHbNrlujgGvx7ujJBw8s5a1nw3aM=
X-Received: by 2002:aa7:d407:: with SMTP id z7mr6152786edq.234.1605330568946;
 Fri, 13 Nov 2020 21:09:28 -0800 (PST)
MIME-Version: 1.0
References: <20201113063206.1716-1-bruce.ashfield@gmail.com>
 <da1c1435-f884-6d74-e6ad-292cf0a3f47e@broadcom.com> <771b373d-927a-4ac6-8716-b51f2b6d355f@broadcom.com>
 <1647455857E467AB.30187@lists.openembedded.org> <16474616B7B2F983.30187@lists.openembedded.org>
In-Reply-To: <16474616B7B2F983.30187@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sat, 14 Nov 2020 00:09:17 -0500
Message-ID: <CADkTA4NNWNwavqtsePX6AvCwBgRy9a9zWWNX=6qzUMMfsKUoVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: provide module.lds for out of tree builds in v5.10+
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Scott Branden <scott.branden@broadcom.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Lili Li <lili.li@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2020 at 11:41 PM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Fri, Nov 13, 2020 at 11:27 PM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> >
> > On Fri, Nov 13, 2020 at 11:19 PM Scott Branden
> > <scott.branden@broadcom.com> wrote:
> > >
> > > Sorry, spoke too soon.  Doesn't seem to work from a clean build now.
> > >
> >
> > How so ? Works on repeated clean builds here. For 5.4/5.8 and 5.10
> >
>
> I have a theory on this. Did you directly bitbake your external module
> ? versus building the kernel first and then the module ?
>
> I'll see what I can come up with.

Confirmed.

I have it sorted now. Doing one more clean build and will send a v2.

Thanks for the follow up!!

Bruce

>
> Bruce
>
> > Bruce
> >
> > > On 2020-11-13 9:53 a.m., Scott Branden wrote:
> > >
> > > Thanks, works for me building external kernel modules.
> > >
> > > On 2020-11-12 10:32 p.m., Bruce Ashfield wrote:
> > >
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > The upstream commit 596b0474d3d [kbuild: preprocess module linker
> > > script], adds a dependency on module.lds for external module
> > > building.
> > >
> > > Since module.lds is generated as part of 'modules_prepare', we
> > > must make it available with the other kernel artifacts in the
> > > kernel shared workdir, otherwise out of tree builds fail.
> > >
> > > This fixes errors like:
> > >
> > >     | make[4]: *** No rule to make target 'scripts/module.lds', needed by
> > >         'build/tmp/work/qemuarm64-poky-linux/cryptodev-module/1.11-r0/git/cryptodev.ko'.
> > >         Stop.
> > >     | make[4]: *** Waiting for unfinished jobs....
> > >
> > > We also ensure that kernel-devsrc has a copy to support on
> > > target module builds that are often prepared with 'make scripts
> > > prepare'. Those targets won't regenerate it, so the build fails.
> > > If 'make modules_prepare' is used, the file will be regenerated
> > > and overwrite our copy (as expected).
> > >
> > > Signed-off-by: Pan, Kris <kris.pan@intel.com>
> > > Signed-off-by: Lili Li <lili.li@intel.com>
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Tested-by: Scott Branden <scott.branden@broadcom.com>
> > >
> > > ---
> > >  meta/classes/kernel.bbclass                | 1 +
> > >  meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
> > >  2 files changed, 7 insertions(+)
> > >
> > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > > index be93a258f6..ccd74e61e8 100644
> > > --- a/meta/classes/kernel.bbclass
> > > +++ b/meta/classes/kernel.bbclass
> > > @@ -494,6 +494,7 @@ do_shared_workdir () {
> > >   # Copy files required for module builds
> > >   cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> > >   [ -e Module.symvers ] && cp Module.symvers $kerneldir/
> > > + [ -e scripts/module.lds ] && install -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds
> > >   cp .config $kerneldir/
> > >   mkdir -p $kerneldir/include/config
> > >   cp include/config/kernel.release $kerneldir/include/config/kernel.release
> > > diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > > index 81b1e36041..5f0dedbdf7 100644
> > > --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> > > +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > > @@ -100,6 +100,12 @@ do_install() {
> > >   # be dealt with.
> > >   # cp -a scripts $kerneldir/build
> > >
> > > + # although module.lds can be regenerated on target via 'make modules_prepare'
> > > + # there are several places where 'makes scripts prepare' is done, and that won't
> > > + # regenerate the file. So we copy it onto the target as a migration to using
> > > + # modules_prepare
> > > + cp -a --parents scripts/module.lds $kerneldir/build/ 2>/dev/null || :
> > > +
> > >          if [ -d arch/${ARCH}/scripts ]; then
> > >      cp -a arch/${ARCH}/scripts $kerneldir/build/arch/${ARCH}
> > >   fi
> > >
> > >
> > >
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
