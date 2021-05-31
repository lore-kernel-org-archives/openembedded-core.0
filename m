Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.48231.1622487681529908031
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 12:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PhH4d+3S;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id l1so18023750ejb.6
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 12:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yW7MwqCzClAM7rdub26QF7aGIo6ILLFgUCBDUb/exWc=;
        b=PhH4d+3Sf8O3PZFr0mh1nSY+kul+q5n1tv3DxJ4muHZpW3VZhwhOg2BOPIVIh5XECU
         4F57qkYOgxvaCHnmyAc5jwKI52zn70UvYzD8YSjUHl6Mc9W+BU1x39PKMM2BSDZK4t8c
         9kmHP97WIK/p/OcoOEdsJAudpY2ycGUtTzussipvoD2D2auyRuafte/lxL9onhPoDG4n
         FelFRJs9amXKI88ZMbkxOdFHrnLESV+QJqZgxvxU5uND+nSZzuqU0KJttEJmc3W7ieGx
         qRJqdbGqoGeidt1xnYMaofhzdQnqwgpDAFw9uX14faq1gcRXDIHPbN2lFtfK0vyDx8TG
         er6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yW7MwqCzClAM7rdub26QF7aGIo6ILLFgUCBDUb/exWc=;
        b=SJUqVTfn3DcOk1yxqgQXpjOFBnmM3RJ83mEpfauN//M89OgoXAM5D5NWRHoF+X9qtW
         xkkSoOfCJ8NqTnNuVcWSSMc6uZoBQU/Y8Rxe9MqRehAjeiFPkzPxswakIxnGWyk1lH2z
         7+LTXhOEAdSFKw2jNLhNa72qmWztCKkiMrzBS3re54VSQ8VDrZpUtZy6seWkb+op5Gqb
         p1dUKZHHKzZ/6xTR46ioo/SSVGoFUvzNM+2X4Hx/m83sNSe62zoWqJrqjIITz3NTptrd
         xCTjMUlJxAovfclj4bN2cdPyfGCti6gWiezM3ptn972aigleD7BbY5AvsINs7YKa71Ig
         VzhA==
X-Gm-Message-State: AOAM533Z8hAy34vehKQunq4poyXges+A+t2G/I31tDAAr9P0IvxcQsKr
	lh+kmIvv5qS7dR7B4a0DEDn+B2loT+jamLYuNdE=
X-Google-Smtp-Source: ABdhPJyc+j8JjHHLgpUmuGk801ObdOlzj1VGWUBqZWKJSgeAWpSkRmFPP07WILM8obntekLB4wrvTbXPqZNS/+AdxX0=
X-Received: by 2002:a17:906:8056:: with SMTP id x22mr11714416ejw.298.1622487679940;
 Mon, 31 May 2021 12:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210531181609.963494-1-akuster808@gmail.com> <20210531181609.963494-2-akuster808@gmail.com>
 <CADkTA4Nz_WY9M+AZX9AgvXAbCZL-zyCT5YTeAx=B=0y839YU6g@mail.gmail.com> <cb8ee3b7-f17f-c738-57e9-0c250e6cdbf8@gmail.com>
In-Reply-To: <cb8ee3b7-f17f-c738-57e9-0c250e6cdbf8@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 31 May 2021 15:01:09 -0400
Message-ID: <CADkTA4N0=kA61UUB05_mvtK2LHWi6jj=9KiKCnD6JTXaAktkDQ@mail.gmail.com>
Subject: Re: [OE-core] [v2][PATCH 2/3] kernel.bbclass: link in kernel-features
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 31, 2021 at 2:41 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 5/31/21 11:20 AM, Bruce Ashfield wrote:
> > Thanks for v2!
> >
> > On Mon, May 31, 2021 at 2:16 PM Armin Kuster <akuster808@gmail.com> wrote:
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >>
> >> --
> >> V2]
> >> rename kernel-kfrag to kernel-features
> >> ---
> >>  meta/classes/kernel.bbclass | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> >> index 8693ab86be..493136dfb0 100644
> >> --- a/meta/classes/kernel.bbclass
> >> +++ b/meta/classes/kernel.bbclass
> >> @@ -1,4 +1,4 @@
> >> -inherit linux-kernel-base kernel-module-split
> >> +inherit linux-kernel-base kernel-module-split kernel-features
> > Since we have the bbwarn, can this just go into kernel-yocto.bbclass
> > as a default include (for now) ?
> sure.
> >
> > As part of my series to move things around, I can relocate it to kernel.bbclass.
> >
> > We are sending two different messages as it stands, and everyone is
> > going to get a bbawarn that isn't using linux-yocto, but is using
> > kernel.bbclass :D (not that i mind, but others will object ;))
> Well. One message is from the Crazy Uncle ( and its not you )
>
> I am not hung up on my solution. Whatevery works  when I  define a
> 'unique name'  to pull in kernel fragment that live in the
> yocto-kernel-cache. I think is silly I am doing this in a s/w layer.

I'm doing similar things in my layers as well, since from some points
of view it is better to keep the userspace components that need those
features close to where the KERNEL_FEATURE is enabled. But having a
place where it is easy to look at what is available via
DISTRO_FEATURES -> KERNEL_FEATURES is a good idea, and that's what I
see in your solution.

But for this comment, I'm just suggesting that until we have some
other features in place, it can serve the same purpose, but be limited
in scope to kernel-yocto, where we know that it will work (and there's
a smaller set of kernel versions).

The other concern that I had with some of my earlier implementations,
is that with the _append technique, it isn't easy for a layer to
opt-out of having those fragments applied. They can of course provide
their own fragments, but keeping them out of KERNEL_FEATURES at all,
is harder. Which led me to think that there should also be a global
toggle.

Let me dig up my bugzilla and and see if there's any elements of that
we can apply to this.

Bruce

>
> -armin
> >
> > Bruce
> >
> >
> >>  COMPATIBLE_HOST = ".*-linux"
> >>
> >> --
> >> 2.25.1
> >>
> >>
> >> 
> >>
> >
>

--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
