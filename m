Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web12.4488.1619738807349296095
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 16:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YJYoX7XJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id f12so50487225qtf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 16:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/bSvG8UJeYwAu5UBPUeubkk2x3iJXHFwZzmwvjV35N8=;
        b=YJYoX7XJqM+yOjJjVkkKPxxyQSvB35O7z+yqOyvuX+kKN0/aOzgYgGBgdn1w84tyqI
         e6y+nkB3PHsEt2/w5FG4qbrMSKtSvSHALHc1FodmDJtB9tfppOrX88u6jtLgQ2FFwpZF
         aUbW8xYjG/UY6GIH2cuonntnmS68iX+plDsorYPIMqEjWpVcHZuWBhz2qjm/2EhqpwBz
         8e3iF2xh3HjBXduXXmchjb+MivjaGL+7OzEYwL3NLnH3fRZIuF2oGRQdEbCZ3TTdU9gN
         qMjRt3GR9gue1EGvHg2vfP5kk/YPKt6MDly/TMvE8V/HdQvalWD3UN8obOUFHK/e2ewF
         /V2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/bSvG8UJeYwAu5UBPUeubkk2x3iJXHFwZzmwvjV35N8=;
        b=Iet0Q/0CvlwZmD30gcbU3f18Ec9CD6lWeGXXsDI0+F8GzKe7bGqR7Oygo2CTdwTHe/
         urz1foybXy5eqELmSp21vyKMDq/d3+fnJnlfo6EGNKtIM1yMudY9gG40kIVpJ5akrZSa
         UFP8/XITalMtLnJy38Y/FGk2C/MrB6AF/H9G32uPHnxdj3pNiMJVfduD3vUwHfpb9B1w
         2hi6SMbiP+i2RkPRdYMBpHlPtISxP7n4qIVnrzzHgBz4t6MtHus07eVaIvY7tmRZLGTV
         wUcd7679M752gbyD4sfTeMfob/Rp6PS5fDmqmibM5HYTv3ItModjUCW17QUscuxkpbTv
         gj/w==
X-Gm-Message-State: AOAM530tDXC8r0OKMQ1xFm/+7hIaC7M1a+nUKVASISHpuXvWUkuGaF6Q
	1LLEFjECEen1jRWfN+b8zidyFv2NRn8Vjz4mTLs=
X-Google-Smtp-Source: ABdhPJy8sbqT8l7GDrH6E3Rdh+sHSOmYSKdRZMQICSHGDPoyWY2vHLCZ2nASzXRdMh39jkjUf8W3Del5EqtAk4NQSNE=
X-Received: by 2002:ac8:5cc4:: with SMTP id s4mr1895250qta.214.1619738806401;
 Thu, 29 Apr 2021 16:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210420182838.958151-1-raj.khem@gmail.com> <20210420182838.958151-2-raj.khem@gmail.com>
 <YIs5x0X89EfRXduW@piout.net> <CAMKF1sr4MCyKV-YfEA7FwSwQXbJq7hHMOGuqYokYPgMX+WkQEw@mail.gmail.com>
In-Reply-To: <CAMKF1sr4MCyKV-YfEA7FwSwQXbJq7hHMOGuqYokYPgMX+WkQEw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 29 Apr 2021 16:26:20 -0700
Message-ID: <CAMKF1sqSZuBt1BjtbnW4AAXh_i2mAXWqTqbdv5k9eweZuqj4ug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] go: Use dl.google.com for SRC_URI
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

you also want to get rid of *.lock files as well.

On Thu, Apr 29, 2021 at 4:24 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Adding Miachel as well.
>
> this seems to be running
> buildoptions.SourceMirroring.test_yocto_source_mirror selftest, which
> AFAICT should force downloads from yp mirror only
> when I check the YP mirror then this tarball exists there
>
> http://downloads.yoctoproject.org/mirror/sources/go1.16.3.src.tar.gz
>
> but problem is that its 0 sized.
>
> Secondly I also see a bad checksum file there
>
> http://downloads.yoctoproject.org/mirror/sources/go1.16.3.src.tar.gz_bad-checksum_b298d29de9236ca47a023e382313bcc2d2eed31dfa706b60a04103ce83a71a25
>
> I am seeing that there are lot of *_bad-checksum_* files in YP src
> mirror http://downloads.yoctoproject.org/mirror/sources/
>
> Michael,
>
> Can we delete these *_bad-checksum_* files as well as zero-sized
> tarballs please?
>
> On Thu, Apr 29, 2021 at 3:57 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hello,
> >
> > On 20/04/2021 11:28:38-0700, Khem Raj wrote:
> > > golang.org/dl is resolving to this anyway
> > >
> >
> > Unfortunately, this is still an issue on the autobuilders:
> >
> > ERROR: go-cross-core2-32-1.16.3-r0 do_fetch: The URL: 'https://dl.google.com/go/go1.16.3.src.tar.gz;name=main' is not trusted and cannot be used
> > ERROR: go-cross-core2-32-1.16.3-r0 do_fetch: Fetcher failure for URL: 'https://dl.google.com/go/go1.16.3.src.tar.gz;name=main'. Unable to fetch URL from any source.
> > ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/a-quick/build/build-st/tmp/work/x86_64-linux/go-cross-core2-32/1.16.3-r0/temp/log.do_fetch.525
> > ERROR: go-runtime-1.16.3-r0 do_fetch: The URL: 'https://dl.google.com/go/go1.16.3.src.tar.gz;name=main' is not trusted and cannot be used
> > ERROR: go-runtime-1.16.3-r0 do_fetch: Fetcher failure for URL: 'https://dl.google.com/go/go1.16.3.src.tar.gz;name=main'. Unable to fetch URL from any source.
> > ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/a-quick/build/build-st/tmp/work/core2-32-poky-linux/go-runtime/1.16.3-r0/temp/log.do_fetch.544
> >
> > This is fairly reproducible:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1404/steps/23/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1403/steps/23/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1402/steps/23/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1401/steps/23/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2076/steps/23/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2074/steps/23/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2070/steps/23/logs/stdio
> >
> >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-devtools/go/go-common.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
> > > index 39a681a712..c368b95b69 100644
> > > --- a/meta/recipes-devtools/go/go-common.inc
> > > +++ b/meta/recipes-devtools/go/go-common.inc
> > > @@ -14,7 +14,7 @@ LICENSE = "BSD-3-Clause"
> > >
> > >  inherit goarch
> > >
> > > -SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main"
> > > +SRC_URI = "https://dl.google.com/go/go${PV}.src.tar.gz;name=main"
> > >  S = "${WORKDIR}/go"
> > >  B = "${S}"
> > >  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
> > > --
> > > 2.31.1
> > >
> >
> > >
> > > 
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
