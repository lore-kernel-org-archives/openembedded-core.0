Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web08.7819.1604584632308738538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 05:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U75r2XRw;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id l2so2442072lfk.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 05:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cP7pZpimBQ6NhrLPvwpqszT2+tl/wvcy+RSxQpnqpPo=;
        b=U75r2XRw4csx6e7i2vKdvAe5WaaMCx7jXmSkOeOgiP/kV0wRL/V9HvO3SVMC8Q9BgI
         gl58/ZGdOsvS9SbPf5+ehRaBXe8b5HDue6syx6800eDyqscAo1W77w6walzZkoHI5tUG
         /AmbT9D+LuGKTP96U0Wv0k3RVlflVVOv8m7GVL7U8/b1DULQdY7/yaBStG1ZedM4EA8o
         JYc4LfDEiySYQqPsG2ztqV9fQOpT4/JFv1A2Mva8V6lTYJqApaF5a88F8mWQC0w4fDgh
         p/eGh112VHMdBcpFKKPA/5MzSrL9v+k8whykOeFK1gMGz1XQ67QqhFIAn42epnosMENI
         PrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cP7pZpimBQ6NhrLPvwpqszT2+tl/wvcy+RSxQpnqpPo=;
        b=j8we7vJZwaJzE3f4WiI19itWktFLvxL1hT8+qoj4wlNvL0kXBGaMecE+IlyXsXIaoV
         Xv2LmZfmxFF81qQug36FRTCYuVgky8ygUWfwvHw/8dSsPgq9eTjAfGfLeN2cu7wRNCCR
         22wToula+mqXOSK+dCyM/eRJFZIrY/M6b84MRixTn8Kz9iIyuVnG35TcuaWvJPU5Jk0h
         ka6Nxn3+uljvjFj+xf5A4nZsWU+UPIKEQ7tRJD0oSjntSQ2g3sIUnLxVLsI7K4QMHhOs
         /SUz7wf0cZac37pX0a44Eqkkgza69qMZhctFzfM1wHnaOaI91KganRKuFwQwjx3zA8ef
         +Idg==
X-Gm-Message-State: AOAM532vRYCKnK7OMjt5qvxKs1/gg21gKXJZe/wWBfAcrNM/SIm1zrIT
	5vNJQMe/cTbj1lC+tDy4hb8gbkQ9YBW27o9eeLQ=
X-Google-Smtp-Source: ABdhPJz6BN2J2qjTHUdXwCgAza1j2YAbKdo5AXC9AsvaSrfyx3cuCHRURiQeRf+dO0cDG99phCXf+lrhIU/nT7pf/ew=
X-Received: by 2002:a19:e04e:: with SMTP id g14mr971612lfj.590.1604584630319;
 Thu, 05 Nov 2020 05:57:10 -0800 (PST)
MIME-Version: 1.0
References: <20201105110247.417380-1-nathan@nathanrossi.com>
 <CAHtQpK5JHsZ7H-y521+Bfaf0L6kz9ixMm_b7hCsdHinoWAG1sQ@mail.gmail.com> <CA+aJhH1BAoM7A=JJcpRnTuGOOhc4Rx1H4UO9oCH1v0Etsr5J9A@mail.gmail.com>
In-Reply-To: <CA+aJhH1BAoM7A=JJcpRnTuGOOhc4Rx1H4UO9oCH1v0Etsr5J9A@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Thu, 5 Nov 2020 14:56:58 +0100
Message-ID: <CAHtQpK4tGeGyuP_inDC93kA2tnVzp-LuVMmtZZOqYUA_P0V+HQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] vim: add nativesdk to BBCLASSEXTEND
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 5, 2020 at 1:07 PM Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> On Thu, 5 Nov 2020 at 21:16, Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> >
> > On Thu, Nov 5, 2020 at 12:02 PM Nathan Rossi <nathan@nathanrossi.com> wrote:
> > >
> > > Enable nativesdk build support in order to be able to include vim in
> > > nativesdk targets (e.g. buildtools-tarball/sdk). It is useful to be able
> > > to provide an editor in a relocatable form for when hosts do not provide
> > > an editor.
> >
> > Is there any reason why a preference is given to vim in favor of all
> > other available editors? Why cannot a user install any editor of
> > choice on the host system or inside a container?
> >
> > AFAIK, editor is not an integral part of the build system and is not
> > considered a build tool, therefore does it really make sense to pull
> > it into buildtools-tarball/sdk?
> > Maybe I'm just missing a use case here...
>
> So this change here is not about including it in buildtools itself.
> This is just enabling nativesdk for vim such that it can be included
> in a nativesdk target.

Yes, I understood this and agree with it.

>
> Just a couple of use cases for including vim in a nativesdk
> "buildtools-tarball" like relocatable installer:
> - xxd bundled with other microcontroller/etc. programming/debug tools

This I can consider to be marked as a build tool, but this relates
only to `xxd`. If this is all that is needed from vim package - maybe
then only xxd should be exported?

> - vim (and/or other editors) shipped with an expanded
> buildtools-tarball to avoid host dependencies on build machines that
> have heavily restrictive policies

That also makes sense, but in this case - should there be a similar
patch against emacs and nano in meta-openembedded ("fair play")?

>
> >
> > > Additionally the vim recipe provides the xxd tool.
> >
> > This is a "hidden" dependency that would be pulled via this recipe...
> > I'm not sure this is a good solution, especially when somebody would
> > opt-out from vim package.
>
> Not sure what you are referring to here. This comment in the commit
> message is just to point out that this change is not just about the
> vim editor, but also in order to be able to include the xxd tool (that
> is part of the vim source) as a nativesdk package.

This was a source of confusion for me: your commit message states that
vim provides xxd without any further information, so one can make an
assumption that it was not provided before. :) Since this states the
obvious - maybe it is better to drop this statement at all, it is
rather confusing than informative.

>
> Regards,
> Nathan
>
> >
> > >
> > > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > > ---
> > > Changes in v2:
> > > - Add detail to commit message
> > > ---
> > >  meta/recipes-support/vim/vim_8.2.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-support/vim/vim_8.2.bb b/meta/recipes-support/vim/vim_8.2.bb
> > > index 709b6ddb55..7e4654e472 100644
> > > --- a/meta/recipes-support/vim/vim_8.2.bb
> > > +++ b/meta/recipes-support/vim/vim_8.2.bb
> > > @@ -3,7 +3,7 @@ require vim.inc
> > >  PROVIDES = "xxd"
> > >
> > >  PACKAGECONFIG_class-native = ""
> > > -BBCLASSEXTEND = "native"
> > > +BBCLASSEXTEND = "native nativesdk"
> > >
> > >  ALTERNATIVE_${PN}_append = " xxd"
> > >  ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
> > > ---
> > > 2.28.0
> > >
> > > 
> > >
> >
> >
> > --
> > Regards,
> > Andrey.



-- 
Regards,
Andrey.
