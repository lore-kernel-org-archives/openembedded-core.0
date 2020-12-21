Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web08.182.1608559630133816038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 06:07:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cxrzfcbr;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id x20so23861428lfe.12
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 06:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FEdIaBNKQIUPrb/Z3DoxE6hMwmYscpA/zVfflGTNrNA=;
        b=CxrzfcbrYPkJuIoa+IyOK3PkCUDC6ff//jZwBtNOKPR/Kkp4yJkkHBMAqtG+2YKANl
         dXMiLGiD1Rgv/rctRl6ZV6dV6j9tpysFsen/cZW3gSA4l76i2CXLIZvV9FQvlmkBveIr
         h/BeFT1Jh98iiC692yLdUutTbcv1o0+fWnVGeF2n1/BTon8aHVetXbROptGu8JdEbxxE
         lnr/NcrEv+P9b6XPYuLVMyUWfM4DYakRRLDxxKCTF75shPTlBuEDBpvwQM7TNoiFZlNK
         z3fJHqlV4htoReccQF+/jdQxK8KYu9wKVF+Rx7lOnyF+D0kKMLT+60TUQ+/xBnb02eBD
         GYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FEdIaBNKQIUPrb/Z3DoxE6hMwmYscpA/zVfflGTNrNA=;
        b=XjBDmaKk8Dvpzlm0IpUSRe+nVfArCEHlksUnjNPq6OSMPmDLVjXQgBDrWi9djnvbzF
         v667JolqeylDUHnGsKl17421ru2XaCj5t5dUibE80i8HxRRnHL+dI5rFfkqlbVOtgtHT
         G+il2ewoKC1peEiXct9TUYKIkvph+jxeAmitmzaxGzXxwfPeTHMWYRNkrFwOJnX4eKRM
         DR+bWS6F0gKahZcfEKBKXnPlhsnbSig9pjy3yGP5b/2JP9haz/Wsj2Q5Bluis5N2bsfk
         J8AevPpefvLhqv+t9qsYESPBuhNKYUlscZOtRHfGqTKW+uSLmS0UU2ed0fSmyUGvRunA
         sqLw==
X-Gm-Message-State: AOAM530fpF4h84jE6/X0NHjzq0EPzMfM1SlASW9Fof783QWfcNQTW+l+
	c/AtoHk3IWFEtn/MzIHi0M/fMTVkVn1dFAZRhUo=
X-Google-Smtp-Source: ABdhPJwHo4WE7eDUxpa95aTqF3JsU3444EAbofrBqfNihyOCMMruvCNgoyOpG07oBxxXXPNHzhfD6b/OHjYeU8b//K8=
X-Received: by 2002:a2e:2a46:: with SMTP id q67mr7127675ljq.331.1608559628081;
 Mon, 21 Dec 2020 06:07:08 -0800 (PST)
MIME-Version: 1.0
References: <20201217192738.14311-1-tanuk@iki.fi> <CAMKF1soQmWKFmpaEkcE7E_as0iKDS01e8mwTiGLKYSSQ3_x5bQ@mail.gmail.com>
 <CAMKF1spAAi=rDLYNHQWk3XpsyCv9=qDxJgG0d7nwrpaxSYM6gQ@mail.gmail.com>
 <d09a75fc25bc9d36c6f9227cc94f4e58d7f985fd.camel@iki.fi> <CAMKF1soBt5ifPhNj0h_DE+NY7jVTz4C3Ch13A=xEY-KZ=s4XtA@mail.gmail.com>
 <CAHtQpK4hjWnuVj+b=_joyf5pG=DsbA4UL6QMpj1o-0=D1iYpEQ@mail.gmail.com> <f66cc23e51f1b3262e1092f082d4c44b8ef92550.camel@iki.fi>
In-Reply-To: <f66cc23e51f1b3262e1092f082d4c44b8ef92550.camel@iki.fi>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Mon, 21 Dec 2020 15:06:56 +0100
Message-ID: <CAHtQpK4MRbq8hga4b+9Nf-586oaGTHGXd4r4Axkc-Njni8z+Kg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] pulseaudio: Autotools to Meson
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello Tanu,

On Mon, Dec 21, 2020 at 2:25 PM Tanu Kaskinen <tanuk@iki.fi> wrote:
>
> On Mon, 2020-12-21 at 14:03 +0100, Andrey Zhizhikin wrote:
> > Hello Tanu,
> >
> > On Sun, Dec 20, 2020 at 5:09 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > On Sun, Dec 20, 2020 at 6:26 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > > On Sat, 2020-12-19 at 12:36 -0800, Khem Raj wrote:
> > > > > On Sat, Dec 19, 2020 at 9:24 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > > > > On Thu, Dec 17, 2020 at 11:28 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > > > > > The PulseAudio project plans to drop Autotools support in 15.0, so let's
> > > > > > > switch to Meson. The first patch removes OE_LT_RPATH_ALLOW, which is
> > > > > > > some old cruft that sounds like it has something to do Libtool, so it's
> > > > > > > perhaps relevant for the goal of dropping Autotools. The next two
> > > > > > > patches disable features that aren't available with Meson. The last
> > > > > > > patch does the build system switch.
> > > > > > >
> > > > > > > Tanu Kaskinen (4):
> > > > > > >   pulseaudio: Remove OE_LT_RPATH_ALLOW
> > > > > > >   pulseaudio: disable EsounD support
> > > > > > >   pulseaudio: disable GConf support
> > > > > > >   pulseaudio: switch build system from Autotools to Meson
> >
> > I'm seeing a build failure after this upgrade, thought you might
> > advise here what could be wrong.
> >
> > Following is produced at the end of do_compile taks:
> >
> > > sed: can't read src/client.conf: No such file or directory
> > > WARNING: exit code 2 from a shell command.
> > >
> > ERROR: Task (/development/yocto-master/yocto-build-appliance/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_compile)
> > failed with exit code '1'
> >
> > Have you experienced the same error, and what can be missing here?
>
> I can reproduce the error when enabling the autospawn-for-root
> PACKAGECONFIG. client.conf is generated from client.conf.in, and the
> generated file's location has changed. Replacing "src/client.conf" with
> "src/pulse/client.conf" in pulseaudio.inc seems to fix this issue.

Thanks, that solved the compilation issue!

>
> --
> Tanu
>


-- 
Regards,
Andrey.
