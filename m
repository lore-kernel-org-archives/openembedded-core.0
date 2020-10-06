Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.89.1602006831207750184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 10:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BSpjYbU+;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.68, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f68.google.com with SMTP id p15so18925495ejm.7
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 10:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BwNJCP37CTlp2HnVIkbdXnhpN+a5Jh+9VqR9fPYK6AU=;
        b=BSpjYbU+zI8Dkg9nuI9wLsh1VOPM9MQkL3wHyazYDUkfAl5eQ6QZ7FtVaHqdB5tzNI
         5WD5ynfhl4+wpYTiMPKIFmMzycU85A5yiY6nxYwqsazZ61NpFgCYwvzFQUJuK6mSiFJU
         F2H+Dw2dYizuNjCJDyfPrUqNOFxwNAPjuIAZKLgvhBORmCkqqFvPA7S4qSYRwZhN3ucD
         O+0mPG8VJzoNELdGZz8+58MMwv9/fU7XkHRSrpYCuHVT3OVnvJBDIjHmtuOs5mYeqy84
         tD5Q7Ei+OpRCtky6w+RekVhl4kXfAZMZxCTiFrDS9/JFBESRrVAgBieqdQfumP/tVKLO
         Eapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BwNJCP37CTlp2HnVIkbdXnhpN+a5Jh+9VqR9fPYK6AU=;
        b=BoygNS75Fix6shkaZHPXrAO4Rk7TwRW0jHL3LqjJTlSo6n2axlVvRkNXADmm6kWYK+
         DR8Sp/pmBz7w5pN9lTHWiwOp3N0UQF36dVHOqQKGNOhaJ8rj+/SeGFsfWBURksQ1YzOx
         mjPQR3+npirRL/9fIZ1H//9STUvmwM5wKPkUDLSedR8mHVewxdT85CuqpiNYY2DQPrlT
         XgJ1/cq7EYiYwlwogRTOcMaeP1IpfKLreRtcI212E6ydavxrDLFxKOWICnJ9+uPcAdpK
         sCEJu3ImetaFgtOlPm2iqLE2fzHrxQctvjV5wJ6hdsvix20cT1TbOIesHmIzRXvcXRQ1
         NR8g==
X-Gm-Message-State: AOAM533xWnvnR9CkOhiyt5NouwJ1UPMDifhnLtDgbFoIGSagrFK/M4wg
	hHIXWCV9A9Z5W49PlkFNMuHnmnvnsMU0KpgOt+ZSKQ==
X-Google-Smtp-Source: ABdhPJyF+F0o2TrWG79Wr5Su2Snhy/cU1ujzOVqdq3+gVxuJ8xgY5+83306D9ATOQJ/BglUa104bjj+HXxPGZp7qXos=
X-Received: by 2002:a17:906:b01:: with SMTP id u1mr715322ejg.57.1602006829541;
 Tue, 06 Oct 2020 10:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201006121105.94671-1-marex@denx.de> <CAOSpxdbTC-Y9=tJe=gPo8dW=0tMnmD+VdDf2B=sfW38L=obSRQ@mail.gmail.com>
 <CADkTA4N7tPU4cvG0LiyCaWW1ATZPo7YQs=mdk13evXtrzwr-zQ@mail.gmail.com>
 <CAOSpxdYJss9x9axm4E_JMtgCS+Kwpx_F-iiHfn=o24do0g2YKQ@mail.gmail.com>
 <CADkTA4Mb6hD=S-zC8qq=EQaku4FGHLxFpgjk4dJMfyj=X7=pkA@mail.gmail.com>
 <91e475ca-7e2a-e837-bc49-bf10935c3fa6@denx.de> <CAOSpxdbExEqAVRWHOtrC4BKeWgD8bY8iNp=ku4L36nGayXM6ag@mail.gmail.com>
 <258d6f6b-17fe-ab70-b410-e418f37df8f5@denx.de>
In-Reply-To: <258d6f6b-17fe-ab70-b410-e418f37df8f5@denx.de>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 6 Oct 2020 07:53:38 -1000
Message-ID: <CAOSpxdY_8rOGB=-0NG2+PuVVM17F7uOprJS4Fuoj7P3nHJz-Jw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] [dunfell] lttng-modules: update to 2.11.6
To: Marek Vasut <marex@denx.de>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 6, 2020 at 7:02 AM Marek Vasut <marex@denx.de> wrote:
>
> On 10/6/20 6:51 PM, Steve Sakoman wrote:
> > On Tue, Oct 6, 2020 at 6:48 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 10/6/20 6:44 PM, Bruce Ashfield wrote:
> >>> On Tue, Oct 6, 2020 at 12:42 PM Steve Sakoman <steve@sakoman.com> wrote:
> >>>>
> >>>> On Tue, Oct 6, 2020 at 6:39 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >>>>>
> >>>>> On Tue, Oct 6, 2020 at 12:30 PM Steve Sakoman <steve@sakoman.com> wrote:
> >>>>>>
> >>>>>> On Tue, Oct 6, 2020 at 2:11 AM Marek Vasut <marex@denx.de> wrote:
> >>>>>>>
> >>>>>>> Update to latest available.
> >>>>>>
> >>>>>> Have you tested these patches with kernel versions 5.4.62+ ?
> >>>>>>
> >>>>>> IIRC, Bruce said that the 2.11.x tree did not have the necessary
> >>>>>> patches to build with recent 5.4 kernels.
> >>>>>>
> >>>>>
> >>>>> Since I did that backport to keep us moving, the lttng project has
> >>>>> added commits to the 2.11.x branch.
> >>>>>
> >>>>> I see changes to the right files in the commits, so it should be good
> >>>>> with this update, but I haven't tested it myself.
> >>>>
> >>>> Thanks for the quick response.  Given that info I'll pull in these
> >>>> patches and start testing.
> >>>
> >>> That being said. I'd expect that we should drop the backport that I
> >>> did, but I don't see that in this commit. So that is worth checking
> >>> into ..
> >>
> >> I ran into the build issue with 5.4.69, so that's how these patches came
> >> to be. It could be that I didn't build the tools and ust if they are not
> >> built as part of the "standard" build run.
> >
> > No worries, I'll give the patches a thorough test.  I do however need
> > you to redo this patch so that it will apply cleanly on the current
> > dunfell head (i.e. drop Bruce's backport)
> >
> > Your other 3 patches seem fine.
>
> Do you need me to repost it or can you fix it up yourself while at it ?

I'm going to be out of the office for a few hours, so if you have the
time to repost it would be much appreciated.

If not, I'll do a fixup when I return.

Steve
