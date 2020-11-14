Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.2438.1605328855074565555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 20:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WNf7iWTQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id cw8so16836203ejb.8
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 20:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pFNqzIDA934IyDLdMCrUw7IpkZfBTb2XAOVdb2C2X2Y=;
        b=WNf7iWTQZyEFoi9FkVu3fTHLptNbXh6uy19L9XOBioqVQn2nGa2VpyxhCIKUGKwMCJ
         s30dkCJee0c5f2yQsig2iAQky9CmjP+pqNi03ye0GgrRqxrWi2WJv1lpy8RhwyzIbP1M
         vSxv5o/SD+HjBcZrAZjcWGPjadzIYa+Bow3wdFe/JRXy2ry13RundA/HEqvOVMiRmdxc
         TO+4W2lGp/pzcVnrCK/LQtAuPph3PCt7U2RlBLTIMk/MRgwunj4676Iad9NCeoXStWEs
         mL8dM7aaVpqaHcLJtNjvvgslBDssA87NJSJWQvf3PevzNDp5fwVSLCeKda91+MeGVQli
         lU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pFNqzIDA934IyDLdMCrUw7IpkZfBTb2XAOVdb2C2X2Y=;
        b=e1vbIXZS1D4RDK2+TBsmbNcry/f6Bn2DE15Z4hIq5LV8zplxiZ+FtW+hyedS9EAoh6
         QJESe1a9583UOcffx0GPJlJ73m6ZSCsdMuLhCdFUKzHotIoHKG/GCHtrhpvtm4/Q1B41
         PPOmp9PZOHezwPOLdGWI5N/40m8I22jdHCZXBVYjEJ/JVPQ8PajtsX59+395ozylIFTd
         VpLDqxWXDF69kAYuN7oDYOpESaQswuvRF9aabWv3kjLkVemyR4SSgh60Wit4j/EHquSV
         98eas8+sYO7AslJCJWPjn6yWc2ZaoA1PKjD05IO2Z1nyAfAB5qpTJZk91XVvSWxGOvxT
         T+BA==
X-Gm-Message-State: AOAM533b8fzDiPYpBsnxelZJg7VNt2ZG+GXolsEQsVyPZMUObDv+dVgo
	ZBYZavToT1qhaiLv6lf29ygd8/6QPZ8dsggQTgA=
X-Google-Smtp-Source: ABdhPJwFtmDie2KoYJk1e9DxnEUKocS6/qaRUAHLG25RPagnTyafN7iEQFR3+UZ9wcXa7j5U4xVjiQQiB/GszdQ8CDo=
X-Received: by 2002:a17:906:3644:: with SMTP id r4mr5216913ejb.517.1605328853300;
 Fri, 13 Nov 2020 20:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20201113063206.1716-1-bruce.ashfield@gmail.com>
 <da1c1435-f884-6d74-e6ad-292cf0a3f47e@broadcom.com> <771b373d-927a-4ac6-8716-b51f2b6d355f@broadcom.com>
 <1647455857E467AB.30187@lists.openembedded.org>
In-Reply-To: <1647455857E467AB.30187@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 13 Nov 2020 23:40:42 -0500
Message-ID: <CADkTA4ObmyKxVWGuSupKAp+ELLnfTfnHQyv9mKPo4mB5bk_5oQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: provide module.lds for out of tree builds in v5.10+
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Scott Branden <scott.branden@broadcom.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Lili Li <lili.li@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2020 at 11:27 PM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Fri, Nov 13, 2020 at 11:19 PM Scott Branden
> <scott.branden@broadcom.com> wrote:
> >
> > Sorry, spoke too soon.  Doesn't seem to work from a clean build now.
> >
>
> How so ? Works on repeated clean builds here. For 5.4/5.8 and 5.10
>

I have a theory on this. Did you directly bitbake your external module
? versus building the kernel first and then the module ?

I'll see what I can come up with.

Bruce

> Bruce
>
> > On 2020-11-13 9:53 a.m., Scott Branden wrote:
> >
> > Thanks, works for me building external kernel modules.
> >
> > On 2020-11-12 10:32 p.m., Bruce Ashfield wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > The upstream commit 596b0474d3d [kbuild: preprocess module linker
> > script], adds a dependency on module.lds for external module
> > building.
> >
> > Since module.lds is generated as part of 'modules_prepare', we
> > must make it available with the other kernel artifacts in the
> > kernel shared workdir, otherwise out of tree builds fail.
> >
> > This fixes errors like:
> >
> >     | make[4]: *** No rule to make target 'scripts/module.lds', needed by
> >         'build/tmp/work/qemuarm64-poky-linux/cryptodev-module/1.11-r0/git/cryptodev.ko'.
> >         Stop.
> >     | make[4]: *** Waiting for unfinished jobs....
> >
> > We also ensure that kernel-devsrc has a copy to support on
> > target module builds that are often prepared with 'make scripts
> > prepare'. Those targets won't regenerate it, so the build fails.
> > If 'make modules_prepare' is used, the file will be regenerated
> > and overwrite our copy (as expected).
> >
> > Signed-off-by: Pan, Kris <kris.pan@intel.com>
> > Signed-off-by: Lili Li <lili.li@intel.com>
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Tested-by: Scott Branden <scott.branden@broadcom.com>
> >
> > ---
> >  meta/classes/kernel.bbclass                | 1 +
> >  meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index be93a258f6..ccd74e61e8 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -494,6 +494,7 @@ do_shared_workdir () {
> >   # Copy files required for module builds
> >   cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> >   [ -e Module.symvers ] && cp Module.symvers $kerneldir/
> > + [ -e scripts/module.lds ] && install -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds
> >   cp .config $kerneldir/
> >   mkdir -p $kerneldir/include/config
> >   cp include/config/kernel.release $kerneldir/include/config/kernel.release
> > diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > index 81b1e36041..5f0dedbdf7 100644
> > --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> > +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > @@ -100,6 +100,12 @@ do_install() {
> >   # be dealt with.
> >   # cp -a scripts $kerneldir/build
> >
> > + # although module.lds can be regenerated on target via 'make modules_prepare'
> > + # there are several places where 'makes scripts prepare' is done, and that won't
> > + # regenerate the file. So we copy it onto the target as a migration to using
> > + # modules_prepare
> > + cp -a --parents scripts/module.lds $kerneldir/build/ 2>/dev/null || :
> > +
> >          if [ -d arch/${ARCH}/scripts ]; then
> >      cp -a arch/${ARCH}/scripts $kerneldir/build/arch/${ARCH}
> >   fi
> >
> >
> >
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
