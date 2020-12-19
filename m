Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.10680.1608393906623112560
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 08:05:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GEvq3qgR;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id b73so5414115edf.13
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 08:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kNZnRhghrg0PuqJlPDsR6epRzhS9QviPxWrOI36zdSQ=;
        b=GEvq3qgRVqe0XtWx+NfWFX34v0yOdCE6RVAgPeMDsXva2DK1cNZnfjH6ECrI/JiOem
         ccuYPP7auu9/aoGoJxYV2txmGjm4ojVjlfrHctO5rQi6eSehNEiqtv9MCpyY98z1fUAo
         dGjHgfhFcBG4tGyQSU9+wDWNvTMpZBx1sGaf3IYYkDcl/nVehsYYZ0FvA9Bh+TCT3mu+
         M9iwppec8AVrGYOy7wePLAm+BUR2WgguNMyC7b15uZ/i2wpqrJrGTVb3kejVKVWDVB6G
         QCMMmk3Qd69fxuSlWN2XzeEi92WIGVFujE6FWA5gNb3OgLuWf06SAtnx9fIlUGwquCJw
         tmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kNZnRhghrg0PuqJlPDsR6epRzhS9QviPxWrOI36zdSQ=;
        b=rr4n/o4qtT0Sgo3q/1XJ8gv7IPvaQ+pLFWM18wvQpQwT/098GxH+7+5lsZ3v1kL09L
         tWXSa+71JEvxzILszkMAEW5ywTqodrBKH9F3eADnnQlgfwVdkuztc9M8vlrWOK/Q9TLf
         teaSaVow7SoKf3zL5NFUiGWIJhKYDS7925V4NWmNkfVqTEpfPzJjflovGi9dpQ8JjRPP
         eJHq0TT8M1Db/8kRiCxfrAbUXBh6RnOVLNTYk1t48/jCmlhVhdL8q3JMx778YTIHTkg8
         jczmX3A4tct302q7HF8IOlPhJB3a9zUsbxiG1zk1nO0Ah9mDyVa+pNvRfghlwSPuMhNC
         SeIQ==
X-Gm-Message-State: AOAM531V0aWyXCiWCb3WTDSMqw/FPn/hW+ufH74TnyTmQGfBezdeSeIG
	nk15MllniL3sAlYkxBr8q/YqmfYFb6XmTwyudMs=
X-Google-Smtp-Source: ABdhPJxNnu+GtPCy10/1m1/Up/6K2Tof0ca7BoJ8qb3fPeWzhatuj9OhcZuYbxKhT4pYlACp0iJwC3L4agDuymSQpC8=
X-Received: by 2002:aa7:d407:: with SMTP id z7mr9766487edq.234.1608393904979;
 Sat, 19 Dec 2020 08:05:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607958349.git.bruce.ashfield@gmail.com>
 <faff0743666a4ef199d2902a1611a83ee5c2a4a9.camel@linuxfoundation.org>
 <CADkTA4Ou33v4AhB+JTTwxytUr1-UWRrbS8qd562utkiq-a49HQ@mail.gmail.com> <f213eac0f84b71359c5909a54b45d4783574e836.camel@linuxfoundation.org>
In-Reply-To: <f213eac0f84b71359c5909a54b45d4783574e836.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sat, 19 Dec 2020 11:04:53 -0500
Message-ID: <CADkTA4NMU0ptscSu33BT3MTRw-k7_swhf2MjcXSG_EsbRkm_5A@mail.gmail.com>
Subject: Re: [PATCH 0/8] linux-yocto: consolidated pull requesrt
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Paul Eggleton <bluelightning@bluelightning.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 19, 2020 at 10:52 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2020-12-19 at 10:48 -0500, Bruce Ashfield wrote:
> > On Sat, Dec 19, 2020 at 6:31 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > Hi Bruce,
> > >
> > > On Mon, 2020-12-14 at 10:09 -0500, bruce.ashfield@gmail.com wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >
> > > > 5.10 dropped this morning, so I'm switching over to the libc-headers
> > > > and reference kernel upgrade (5.4 and 5.10 will be in master, with
> > > > 5.8 being dropped).
> > > >
> > > > But since that will take a bit to sort out, I wanted to send my queue
> > > > of patches for other fixes/versions.
> > > >
> > > > I didn't pick up any issues with local testing, so hopefully this
> > > > won't
> > > > cause any problems.
> > > >
> > > > I have the lttng-modules patch from a previous send repeated here,
> > > > since
> > > > it may be easier to take it as part of the bulk update. I checked
> > > > just a few minutes ago, and there isn't a new tagged version of the
> > > > modules yet, so we still need the backported patches for 5.10+
> > > > builds.
> > >
> > > I was able to merge part of the series but there were some warnings
> > > that came up:
> > >
> > > meta-intel:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/1020
> > > poky-tiny:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/3105
> > >
> > > so I've deferred the kernel tooling bit until we can figure these out.
> > > That means several other patches which depended on that also couldn't
> > > make it in.
> >
> > Nothing else should have depended on the kern-tools ones, it is independent
> > of the rest. Either way, I'll submit next week!
>
> The others don't rebase cleanly without it and I wasn't sure if
> resolving the rejects was going to be a good or a bad idea so I replied
> on list and asked :)
>
> Its probably easier for us both if I wait but I can rebase if it makes
> sense.

Let just wait, I have more 5.4-stable updates and some other fixes
(systemtap), that I can submit as a new series.

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
