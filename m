Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.15913.1605239439907764103
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 19:50:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R5nl9lnI;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id y17so5649589ejh.11
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 19:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v5ghqQi9NVq675LEYOH6EKTcLvdP/baEx8II/SxVCf8=;
        b=R5nl9lnIpzT5Ty39kpBk/pUSKVeLfos/iYPJILkGI2Y42m8dAkz9jhuHfVLdAx2LAp
         +ZXxEuN5jqRx3S40d6QRqspOLp/kGBBFzIey43ymw+GvKP0CuR36LJHECbWd64gRAXJE
         N89Jf05VXJCg8eZjLmHLQMCQkDvmT6+Chx+6Wyy/CtBVL7/mqY+3nDovBSZJ/EAuVy9M
         lc98xJUJQIRhpLMa972ywOBoy81n1OSjEC724szWXENeYxWwrc3t5UAXVnoJvhgUx8m+
         A54lE0rA5Z+bh+czC2Q/pfcXNJJjV1Isoe4kNCKZFUOQUD//5FU1IY4oGwBqpUxxMStp
         q1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v5ghqQi9NVq675LEYOH6EKTcLvdP/baEx8II/SxVCf8=;
        b=ukVE/0o9UewMggNof8oR5h9JPISXdeIbWQINudePzG8z+Ndq7umgsBkRGlS79B65Hy
         GdioTxEQUJMPO3kWZKrEuY0nMeSxGmSCsDT7TYq3H4cOapBJ97F840/XeE0zlWfllWzt
         29BHQAQcg9wPghwgGEprcF+oWp+caTejkdWJRoi64kTLkqIkOsZ27Ck7qrsrqhicus1C
         1c54gxm9VlatIwqIFCqX1vRMjDnKO39k6cLZzL6ykZOms6XUoHDFqdAgnlDlzkf3xL1i
         1kcIEh04ybvV+ZdNjGI/JGWDokyG+GYgTTDZ4J/AzgPCpG5n5QRQFQlZFgFC8hZwV+E5
         8vkQ==
X-Gm-Message-State: AOAM533JpGC8lb3yYQqzFXYguWC4b3MUDL+6Rn3utNlTJWGbzEU4/y8c
	gZzf5nR5zmP86O5y2mcDdJ168X8JdGEhMeag7VI=
X-Google-Smtp-Source: ABdhPJywZ42ZvwsQ+eDchq4PRlrYcN06Ftp2iLSqL1LgMumyZ+ozjOdUgWTtan7+Olc3CWXhfQGvB9jQ4dW1y85eOaU=
X-Received: by 2002:a17:906:3644:: with SMTP id r4mr119981ejb.517.1605239438410;
 Thu, 12 Nov 2020 19:50:38 -0800 (PST)
MIME-Version: 1.0
References: <20201113021002.30015-1-lili.li@intel.com> <CADkTA4Po=it-hvSFG2KZXpKXWUxsPs-jLcnaWGTpwdUdc7RzgQ@mail.gmail.com>
 <MN2PR11MB3808A2C2E6AE7D1751C55C3BE4E60@MN2PR11MB3808.namprd11.prod.outlook.com>
In-Reply-To: <MN2PR11MB3808A2C2E6AE7D1751C55C3BE4E60@MN2PR11MB3808.namprd11.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 12 Nov 2020 22:50:27 -0500
Message-ID: <CADkTA4PA9QjPROHtKoohsq_wmyAdgQqur4g9e=hvUNCsMGCD2g@mail.gmail.com>
Subject: Re: [OE-core][gatesgarth][dunfell][master][PATCH] kernel.bbclass: fix module.lds missing issue since kernel v5.10
To: "Li, Lili" <lili.li@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"Mittal, Anuj" <anuj.mittal@intel.com>, "Pan, Kris" <kris.pan@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2020 at 10:22 PM Li, Lili <lili.li@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Bruce Ashfield
> > Sent: Friday, November 13, 2020 10:42 AM
> > To: Li, Lili <lili.li@intel.com>
> > Cc: Patches and discussions about the oe-core layer <openembedded-
> > core@lists.openembedded.org>; Mittal, Anuj <anuj.mittal@intel.com>; Pan,
> > Kris <kris.pan@intel.com>
> > Subject: Re: [OE-core][gatesgarth][dunfell][master][PATCH] kernel.bbclass: fix
> > module.lds missing issue since kernel v5.10
> >
> > On Thu, Nov 12, 2020 at 9:11 PM Lili Li <lili.li@intel.com> wrote:
> > >
> > > With v5.10-rc1 kernel commit 596b0474d3d9 (kbuild: preprocess module
> > > linker script), external kernel module need scripts/module.lds for
> > > compiling.
> > >
> > > Error Log:
> > > *** No rule to make target 'scripts/module.lds', needed by ....
> >
> > I have a similar change locally, but I do have a question.
> >
> > >
> > > Signed-off-by: Pan, Kris <kris.pan@intel.com>
> > > Signed-off-by: Lili Li <lili.li@intel.com>
> > > ---
> > >  meta/classes/kernel.bbclass | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > > index 9e3c34ad48..5c262f340e 100644
> > > --- a/meta/classes/kernel.bbclass
> > > +++ b/meta/classes/kernel.bbclass
> > > @@ -358,6 +358,10 @@ do_compile_kernelmodules() {
> > >                 # other kernel modules and will look at this
> > >                 # file to do symbol lookups
> > >                 cp ${B}/Module.symvers ${STAGING_KERNEL_BUILDDIR}/
> > > +               if [ -e ${B}/scripts/module.lds ]; then
> > > +                       mkdir -p ${STAGING_KERNEL_BUILDDIR}/scripts
> > > +                       cp ${B}/scripts/module.lds
> > ${STAGING_KERNEL_BUILDDIR}/scripts/
> > > +               fi
> >
> > You really shouldn't need this here.
> >
> > The only reason we copy Module.symvers is that the kernel module build
> > updates it.
> >
> > I only have the single copy in my local change (since it is created by
> > modules_prepare), and I'm not seeing any breakage.
> >
> > Were you seeing somewhere that it was updated, or something that was
> > breaking ?
> >
> > Bruce
>
> Thanks Bruce for catching this! I add this here just in case any further changes, we can remove it as of current process.
> Will you post your local patch or do you want me to submit v2 version?

I have a commit with a few extra details in it here, I can send it on
(my) Friday, and add your Signed-off-by on it as well.

If that's ok with you ?

 just wanted to run one more round of testing with my queued changes,
and will send them all together.

Bruce

>
> Thanks
> >
> > >         else
> > >                 bbnote "no modules to compile"
> > >         fi
> > > @@ -465,6 +469,11 @@ do_shared_workdir () {
> > >         # Copy files required for module builds
> > >         cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> > >         [ -e Module.symvers ] && cp Module.symvers $kerneldir/
> > > +       if [ -e ./scripts/module.lds ]; then
> > > +               mkdir -p $kerneldir/scripts
> > > +               cp ./scripts/module.lds $kerneldir/scripts/
> > > +       fi
> > > +
> > >         cp .config $kerneldir/
> > >         mkdir -p $kerneldir/include/config
> > >         cp include/config/kernel.release
> > > $kerneldir/include/config/kernel.release
> > > --
> > > 2.17.1
> > >
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its
> > end
> > - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
