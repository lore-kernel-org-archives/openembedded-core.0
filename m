Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.5106.1595475717857017060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 20:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=n8r0B5zL;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.68, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f68.google.com with SMTP id gg18so1449570ejb.6
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2020 20:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l4c4IA3uRJEDx2yQAKp7V4A5xZVkldZqXJql0O5U/N0=;
        b=n8r0B5zLQYVP0gzJ/EM5ZwiZYWGXxBEWa7eoOoqiyAmDrNEKs4M5yAQh/fBLDIT4Vl
         SIF2r23rNrzfgTwDvNP87rof5rEd5XGKBpXaD4eyVRmb7j/mYjIZKzea2HVcwdzKsH3D
         RwMr6G30t8VERD96LME2lTyvDFgwf9ZdD2ga8XI6eK6RxCVts//B31wkrKhP0YknhwUF
         32zII+5hegL+Ki6Tdi1A2+Y0Nb/ZWfkrRepTKXmB5BTGJ2OUm+5ZSlL7dYYSZENxA5pd
         9CRyQ3xsDp7C2+SY5qPoxpRG98CwQjWBrTxdyNQOpRyXr5/qDTHeuiKzx7+e6s2xvPBo
         J0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l4c4IA3uRJEDx2yQAKp7V4A5xZVkldZqXJql0O5U/N0=;
        b=M/IVEBaMYziQkDfhhLl/uo6fdFOjTAz2Uu7MDAf//tdSq1gfOfV0YdyWP6V3occoON
         HFDK+z7gv7AgCRse42ClS+Iuf8F9p1JsKCqqOcnrMMslaCcxc9lL1OR2b4MFL5CI2hpc
         3Iu+YgBThqfzBTiKpNRADnRcc2i9z46JGvsctr2tA0R0Yr09ZhTGjSxMnnfhD7wi+Sat
         EDjf7OLSvD9rYaAlZKRr7FRD/Iqk+8SGnpjsZJT+35svE2SK1G1y1xq5zyFHjH4YzhTq
         Y/bZcSJnyfYaZJ9W7q1rw17LLDLtelVabzZvWQrJGHCDEqlZk0LwsRiqcI4R6oBbSCqp
         cbAw==
X-Gm-Message-State: AOAM533ku2GBjHnnQ/Mx4UL7LMtuCV98MFbxnEpis2upzR01Kgw4If1x
	fMfcQj6PB3cnDsnlInFQj8FKGI16NfKSG6fjTYqztg==
X-Google-Smtp-Source: ABdhPJzKv0gmuQF81ujwTp22X3zNS2F4wJRUQ36BohVI8TbH7oQs0nAQQNXndvJ5D7E1ELs/8ejcaF9uH4BuN6JRe5U=
X-Received: by 2002:a17:906:488b:: with SMTP id v11mr2555264ejq.173.1595475716292;
 Wed, 22 Jul 2020 20:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200722075354.1568251-1-gary.bisson@boundarydevices.com> <CADkTA4N+PY9VBNZFfQtkM=mWmJEf1WLDAozTndmqAmwHT2nrJA@mail.gmail.com>
In-Reply-To: <CADkTA4N+PY9VBNZFfQtkM=mWmJEf1WLDAozTndmqAmwHT2nrJA@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 22 Jul 2020 17:41:44 -1000
Message-ID: <CAOSpxdYT8A+BAHuShUEg+ZBu7K-CzoUWueMFVNoxQ85y3agJEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][poky][dunfell] kernel-yocto: account for extracted defconfig in elements check
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, poky@lists.yoctoproject.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 22, 2020 at 3:58 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> Adding oe-core, since that's where this would be noticed (and is the
> right list for it).
>
> Steve: this change is good for backpor, and puts everything back to a
> working state, the bug this fixes only came in after the initial fixes
> had gone to dunfell.

I already pulled thin into stable/dunfell-nut for testing, but we
should probably pull it into the upcoming dunfell 3.1.2 release!

Richard: If you are going to kick off the release build could you pull
in this patch?  If you aren't going to the build yet I'll send a pull
request tomorrow morning.

Steve

> On Wed, Jul 22, 2020 at 3:53 AM Gary Bisson
> <gary.bisson@boundarydevices.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > The test for whether or not scc should to invoked to generate a
> > config.queue was missing the newly created sccs_defconfig variable.
> > We need to test for that variable as well, or we may miss generating
> > the config.queue in some cases.
> >
> > (From OE-Core rev: 3a95e171d3eaa6ab143d4f422c98a0ac7ad31761)
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > Hi,
> >
> > I believe this patch log should also say:
> > Fixes: 23dcff0d39 (kernel/yocto: ensure that defconfigs are processed first)
> >
> > What I see on dunfell HEAD currently is that it's impossible to build my
> > kernel (that uses KBUILD_DEFCONFIG) as the configme step fails because
> > the config.queue in meta folder is not created.
> >
> > Adding this patch on dunfell branch fixed the issue, hence this backport
> > request.
> >
> > Let me know if you have any questions.
> >
> > Regards,
> > Gary
> > ---
> >  meta/classes/kernel-yocto.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > index 54a1a1627a..3311f6e84e 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -213,7 +213,7 @@ do_kernel_metadata() {
> >         meta_dir=$(kgit --meta)
> >
> >         # run1: pull all the configuration fragments, no matter where they come from
> > -       elements="`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`"
> > +       elements="`echo -n ${bsp_definition} $sccs_defconfig ${sccs} ${patches} ${KERNEL_FEATURES}`"
> >         if [ -n "${elements}" ]; then
> >                 echo "${bsp_definition}" > ${S}/${meta_dir}/bsp_definition
> >                 scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches ${KERNEL_FEATURES}
> > --
> > 2.27.0
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 
