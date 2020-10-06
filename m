Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.917.1602003132629372881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 09:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=k/CBQtwW;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.68, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f68.google.com with SMTP id qp15so18645587ejb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 09:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H5Y9YDSNcXVaNhEqKH5v1Lkd3JnJRFABaEBidBI+EVc=;
        b=k/CBQtwWB+m8m/64wikU9qPEomdbU3+rb1i3R1BnufnKWCDTqjrCifEpcUM4GM14m7
         52IuuD2Z22qEeeg5Hqu1YiqmdlNxBJV47ECK43FGp0GB4cCViCeYKB2yYArF/VOBj1AB
         v9cVmf6Q77zWdMRkCUvSkOf0zkis+Fta3gNfV8eu8eQeF+Dc/pGptHjJ953+/kXOxPVT
         84YQlGVoZq/WWXkRt2jJaSJSe6gjKe9sIXAU1+jUypbM/CdwGjFQYoS9SbwgdDBkLpx1
         Diz4HDTt54RKtitOPOJlrqUgjtNVCtA9cBfjNPaiU7j45pk+AdBsNkq64hRE2p0TeAG8
         DVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H5Y9YDSNcXVaNhEqKH5v1Lkd3JnJRFABaEBidBI+EVc=;
        b=s2CBz99rFVh3G0M3OY/RC5DblBMI/nIIpB/40dzrcKuATOJ+g1igRjTmlH8xp/h8pB
         CNU4lKV4j0RgLFfiDqGrUtB+aTT4T7oFdUO4TLP3tXVsn5GBsTPnqk4op5+MFtQJ/4ME
         WQPSTrzrGio9Ki/a8KZfZPX4uWqnoaHNePbhOoqh2o7fIHAIuJfvIFUxIa2USugoNRzG
         EYv/ydI0ps+DBfb99VYf47BiaRx7I6QO+0jWss0EmwWLFkwCJ7tuKlkty6zSn9L2dU1w
         L2iCMGpiMf1NylCqWwFXZRRW4awwiUlcGDBCoqpoIlu1iM7olqBiCn832UKYJKbRWZGQ
         3NxQ==
X-Gm-Message-State: AOAM531HNpgIlMHbkpv7lMm6zC1hsgUC7S87LtNB5ATh85rEhOO7cIpo
	XeqBifZlln3XMPorF1wUjroXo1bIKI2qKZ3A7Smi0w==
X-Google-Smtp-Source: ABdhPJxfDDBUw6jsgWfIu4iPXYyX/QlZvnfpX1YsGSyaf9hz0HDdoVFhPl5PW5sNGqPS0FF+ZfV7DC3XSob+9tIiI94=
X-Received: by 2002:a17:906:aec1:: with SMTP id me1mr448221ejb.225.1602003131001;
 Tue, 06 Oct 2020 09:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201006121105.94671-1-marex@denx.de> <CAOSpxdbTC-Y9=tJe=gPo8dW=0tMnmD+VdDf2B=sfW38L=obSRQ@mail.gmail.com>
 <CADkTA4N7tPU4cvG0LiyCaWW1ATZPo7YQs=mdk13evXtrzwr-zQ@mail.gmail.com>
 <CAOSpxdYJss9x9axm4E_JMtgCS+Kwpx_F-iiHfn=o24do0g2YKQ@mail.gmail.com>
 <CADkTA4Mb6hD=S-zC8qq=EQaku4FGHLxFpgjk4dJMfyj=X7=pkA@mail.gmail.com> <91e475ca-7e2a-e837-bc49-bf10935c3fa6@denx.de>
In-Reply-To: <91e475ca-7e2a-e837-bc49-bf10935c3fa6@denx.de>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 6 Oct 2020 06:51:59 -1000
Message-ID: <CAOSpxdbExEqAVRWHOtrC4BKeWgD8bY8iNp=ku4L36nGayXM6ag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] [dunfell] lttng-modules: update to 2.11.6
To: Marek Vasut <marex@denx.de>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 6, 2020 at 6:48 AM Marek Vasut <marex@denx.de> wrote:
>
> On 10/6/20 6:44 PM, Bruce Ashfield wrote:
> > On Tue, Oct 6, 2020 at 12:42 PM Steve Sakoman <steve@sakoman.com> wrote:
> >>
> >> On Tue, Oct 6, 2020 at 6:39 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >>>
> >>> On Tue, Oct 6, 2020 at 12:30 PM Steve Sakoman <steve@sakoman.com> wrote:
> >>>>
> >>>> On Tue, Oct 6, 2020 at 2:11 AM Marek Vasut <marex@denx.de> wrote:
> >>>>>
> >>>>> Update to latest available.
> >>>>
> >>>> Have you tested these patches with kernel versions 5.4.62+ ?
> >>>>
> >>>> IIRC, Bruce said that the 2.11.x tree did not have the necessary
> >>>> patches to build with recent 5.4 kernels.
> >>>>
> >>>
> >>> Since I did that backport to keep us moving, the lttng project has
> >>> added commits to the 2.11.x branch.
> >>>
> >>> I see changes to the right files in the commits, so it should be good
> >>> with this update, but I haven't tested it myself.
> >>
> >> Thanks for the quick response.  Given that info I'll pull in these
> >> patches and start testing.
> >
> > That being said. I'd expect that we should drop the backport that I
> > did, but I don't see that in this commit. So that is worth checking
> > into ..
>
> I ran into the build issue with 5.4.69, so that's how these patches came
> to be. It could be that I didn't build the tools and ust if they are not
> built as part of the "standard" build run.

No worries, I'll give the patches a thorough test.  I do however need
you to redo this patch so that it will apply cleanly on the current
dunfell head (i.e. drop Bruce's backport)

Your other 3 patches seem fine.

Steve
