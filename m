Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.11680.1600170889971725817
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 04:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oyth9W2T;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id lo4so4603863ejb.8
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 04:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z4yBYdupdABjK5LerD4TmXCxNLvXiKzRasJuJYqKrBo=;
        b=oyth9W2TKVokh9cwTbg0gATVXXm86VcDM8mcUDGsUHbRAjzYuWLQbviP4jiYDy9dTi
         tHxM+4KdqIhwlApEO02FJS+Bm+7JREyEaTy5f+FX9+jRS8AC+2hxtA/8tz+/yLzhbXjh
         e4b9I4w9izGwVsTi+J0jCKERci1J198OXENr1QVVmbc/Wh+e7pGfhHsBgLM6H0UbEVra
         65aEPmYHc8LXOFn8WoJEAVJmDN0NbzjkgN67jUhSYAov3koJHD76nccTOx40fpgQfdqw
         0drkv+NSzpovdbzEYKEeolGOWYc50dGuzt59DPtlS1GgwtS98gu7csMWYhubqzMzTaa4
         ebbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z4yBYdupdABjK5LerD4TmXCxNLvXiKzRasJuJYqKrBo=;
        b=jLZ+J+XLtIwkiN8L4M7Z5G7zTn9WNvdHGh3TEObtl2XiZCm4GDXpZvDu/+35CDkK94
         A62F/+tLAYlVzZcLlpMIOug926eA0pH1Guj8ffMrDvnPpuHDF8scVMjOoh4bq6aI6Dhc
         WXC9SQkf43I6jpkOU36Y9wadDgs4qJMPv2gSsbYDEIXsTBtDm4KGHTrhPBOndSxiBJXp
         oc0iySHJwXVY3n8Ks9y9POZ8s3WCovC7efyEs2U8sB7xPrkMm5KArVvshkIybzGZSlYE
         F0Or32g1FxiMD7NxLq4E+kKPfOAlFkpSg0u3i+uQtLALcove6AR0zm4RZJsC5OPv0izg
         uE5w==
X-Gm-Message-State: AOAM533RaSlVqUwbe5QM0MAD5d/X7ejw+LSjGcYeJ5SACrqA731sr9k/
	2XgYX/9MgWC8g9SIwwmEj9bIXcqBwR0X93SeRmA=
X-Google-Smtp-Source: ABdhPJws9NF4QovDX6+FO/2t4FjfWNuIZCL/UJBJGVMgvcguwrFSbhxVnXaxUP5q9lH6Hgup9z0Q3SM/LzZq49djvR0=
X-Received: by 2002:a17:906:fa81:: with SMTP id lt1mr19379603ejb.459.1600170888212;
 Tue, 15 Sep 2020 04:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1600122415.git.bruce.ashfield@gmail.com>
 <ced4f4ad5252bcc989f40b54341c0d7a5835bfce.1600122415.git.bruce.ashfield@gmail.com>
 <486E178E-DCB8-4B23-B199-63231267196E@gmail.com> <CADkTA4MFzRoKSV6+kBvYvsQ-BfFwt4BJuOj5bPpfQLYbJk_vmg@mail.gmail.com>
 <d14f6deec304b5d5d7daddc1500dd32e21d00b0c.camel@linuxfoundation.org>
In-Reply-To: <d14f6deec304b5d5d7daddc1500dd32e21d00b0c.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 15 Sep 2020 07:53:19 -0400
Message-ID: <CADkTA4OFoYLNYTd_Sv79spUVreeXaXSygc6d3tEE12zg-p-XvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] lttng-modules: backport patches from 2.12.x to fix 5.4.64+ and 5.8.9+ builds
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jens Rehsack <rehsack@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2020 at 7:45 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2020-09-15 at 07:33 -0400, Bruce Ashfield wrote:
> > On Tue, Sep 15, 2020 at 1:44 AM Jens Rehsack <rehsack@gmail.com>
> > wrote:
> > >
> > >
> > > > Am 15.09.2020 um 00:34 schrieb Bruce Ashfield <
> > > > bruce.ashfield@gmail.com>:
> > > >
> > > > From: Jens Rehsack <sno@netbsd.org>
> > > >
> > > > Backporting the 10 patches since the lttng 2.12.2 release. We'll
> > > > drop
> > > > them once .3 is released, but for now, we need the fixes to build
> > >
> > > Yet another question: there is a stable-2.12 branch ... wouldn't it
> > > be reasonable to use this one as upstream source instead of the
> > > tarball?
> > >
> >
> > We used to do that .. yes. But then the lttng recipe was changed away
> > from git to using the tgz.
> >
> > I complained at the time (I'm sure it is in the archives for all to
> > see), since I'm constantly doing new kernels and have to do this sort
> > of exercise.
> >
> > The devupstream bbclass allows me to keep moving on my new kernels
> > when I need to pick up changes for -dev, and luckily -stable doesn't
> > normally need this sort of thing.
> >
> > IIRC it was switched to tgz since things like AUH work better with the
> > tarballs, but I can't be sure.
> >
> > But let's just say that I agree that this recipe is better as a branch
> > based, git recipe and not a tgz based recipe. I just haven't waded
> > into the discussion to switch it back :)
>
> Perhaps we have a need for both?

I suppose we could, but once we've switched back to the git based
recipe, I don't see the need for the tgz based one at all (maybe I'm
missing something though, see below for my rambling).

And by that, I don't see enough pull to a stable/released version of
lttng versus just using the stable/released branches. If we march the
branches forward like this, they are good for all users. i.e. I don't
see anyone carrying a preferred version to pickup and older released
tgz variant, since it wouldn't be the one getting build testing, etc.

devupstream can continue to point at the development/master branch,
and that should cover all the use cases, no ?

Bruce

>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
