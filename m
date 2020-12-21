Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.35081.1608521661469039472
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 19:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kFA5LH2x;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id y24so7583847edt.10
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 19:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YM3cQj+Bcr9ixADj4ykodKcbn4WOFt8g5UdvKbFZHDM=;
        b=kFA5LH2xeXkvSDTGrC1qQCDe9JmH9PFCdOOk0TZ523hM6eA9e7w3P1oK+bFA/Oq2PW
         pbu5lyKP6302KcYUN0EkaZv5A/Ry5FXoCq3OgKTe12WNetZkj6tDSMCUNU/I8DdhsfF/
         aJc470LPdZH1EG+3fB6tTyqF0yAAzL/Tih63zjj50FLWxpxNU7e8FdFfYsPCEnBXvpXy
         d8kkjmJSdDEa1eTwXqEKl7Vh0B0Obi4Z5GL6r5JOdd+wF3cApS4pqn3k6MptHogauTpQ
         SxejgDTzx1TIqexKnuWYmDkUB+Z4edFi1s14a+C8gMFZQM+LjvOqIZI+L8AJb9sEQL9j
         v+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YM3cQj+Bcr9ixADj4ykodKcbn4WOFt8g5UdvKbFZHDM=;
        b=b4ioPRix+o6Lw1T4Oh3y+p+eQhZq5uYiRlfoKoSQ/oZbbqbnsIbFtHSxR7+luYVkDL
         b7J45ZoDU3VkWZ7d4CG8jmUYfSWj1YUnL/34cBuuwvupyy88Fzl7HVxwNZgWTDYuN5xK
         lRqv0XgJww+Uikz+pLxEeM0MYPYdNSDXOmbrBSrbpll0qaGCB4MI6FERD8edSag8i8c/
         tjFdxcKxS43yDaQ1ggLb6eH1JKxb1gRFxtmnvcm8Wpt3iSiuupETMg4lKDTV3LCt388k
         eFgZ/vr0lPl0o9i2TtmK53As+hKr/CGSN60srsiNlXueEXPpUUHjyV9pqxk9BjbJ7LTf
         CtNw==
X-Gm-Message-State: AOAM531sWgMSRULV0qCSH/sxySkYe2DUuiRuPrexgNYhOYdV3IgjFw4j
	QbeLBs2vZJXcu4mIsL/yn1S0G9+aBkbyzG2N6MY=
X-Google-Smtp-Source: ABdhPJyT0mH0pW1/dfCVVwKf51TiGQvJEtkVrPoYBcdrSvQbrnlVSHpSxOoBomIbyvId9ncZ0eqnQXwJhC/wEN2P91k=
X-Received: by 2002:a05:6402:3553:: with SMTP id f19mr274598edd.129.1608521659780;
 Sun, 20 Dec 2020 19:34:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607958349.git.bruce.ashfield@gmail.com>
 <faff0743666a4ef199d2902a1611a83ee5c2a4a9.camel@linuxfoundation.org> <cf65e19893f23bd5987ec4d50904e45838ad68d0.camel@intel.com>
In-Reply-To: <cf65e19893f23bd5987ec4d50904e45838ad68d0.camel@intel.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 20 Dec 2020 22:34:08 -0500
Message-ID: <CADkTA4Oevbn5KF45Z_3nb0KLtVNFrMbKLW9NX1xy2rYkOyWUag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/8] linux-yocto: consolidated pull requesrt
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"bluelightning@bluelightning.org" <bluelightning@bluelightning.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 20, 2020 at 9:57 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> Hi Bruce,
>
> On Sat, 2020-12-19 at 11:31 +0000, Richard Purdie wrote:
> > Hi Bruce,
> >
> > On Mon, 2020-12-14 at 10:09 -0500, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > 5.10 dropped this morning, so I'm switching over to the libc-
> > > headers
> > > and reference kernel upgrade (5.4 and 5.10 will be in master, with
> > > 5.8 being dropped).
> > >
> > > But since that will take a bit to sort out, I wanted to send my
> > > queue
> > > of patches for other fixes/versions.
> > >
> > > I didn't pick up any issues with local testing, so hopefully this
> > > won't
> > > cause any problems.
> > >
> > > I have the lttng-modules patch from a previous send repeated here,
> > > since
> > > it may be easier to take it as part of the bulk update. I checked
> > > just a few minutes ago, and there isn't a new tagged version of the
> > > modules yet, so we still need the backported patches for 5.10+
> > > builds.
> >
> > I was able to merge part of the series but there were some warnings
> > that came up:
> >
> > meta-intel:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/1020
>
> I think this would need:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/commit/features/firmware?id=1bde5ac3c3b324853958c24513a6a949d09138bc
>
> to be included in v5.4 branch as well. But I am wondering why is it

I have a pull request ready that fixes the warning for all the
branches, I'll send it on Monday.

> being flagged now. I can't figure out what has changed ...

It's a kern-tools update. Options that were both "hardware" and
"non-hardware" weren't being properly warned. I fixed it to warn in
that case, and these popped out.

Bruce

>
> Thanks,
>
> Anuj
>
> > poky-tiny:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/3105
> >
> > so I've deferred the kernel tooling bit until we can figure these
> > out.
> > That means several other patches which depended on that also couldn't
> > make it in.
> >
> > Cheers,
> >
> > Richard
> >
> >
> > 
> >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
