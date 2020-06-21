Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web11.17206.1592753084271726356
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2020 08:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L5GpYOpw;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id y5so16766191iob.12
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jun 2020 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3IdoW16gy5pn+UAkTIop9cJJO45HPOhbnv9qkb46suk=;
        b=L5GpYOpwFymJPIw4vqs+Sqwnsg4oAgi0NBakPv+FZUw8GtlgDSGAaIznvvZmwJi6iD
         FLuycN5kurhH6W4stdc6A3PEWFU0q9FCLmINKAUR5o7zD4N7AnBD3sZedSJlt6S/8uB3
         lKA6k894vnDtOx7ezAHVka+7TQnGMdlK4BV64Ch4pZMRd3R1MuPxszX6uP7I3htqlT6z
         l9xFNav4xZ/JpolGkPBECivDEc8DinyZ19XGdB+rFBfEVEt8BAN3UIfRdzL3lE5feoMY
         vo9s5F+e6dcBgq+Dkh/SBKKiPC9Tcwq6OXaf05AprMDrlgoLyu/39rCAq5JaWclwJL48
         R/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3IdoW16gy5pn+UAkTIop9cJJO45HPOhbnv9qkb46suk=;
        b=PKxhzYGUNDFXvGcizXCVSU4mdnZmQKIputHwAJLUwiEWWx910E+AXQ/TpcRykaO2H0
         Bv7dF518uxgykgh4hxciJtNwDCzLIS06m0Wogs+iaSisPjLvO/ULSn242MEqOBev8f6X
         xsKkJM1C5rxZe/3JgAjNW/qOjMQO6yDNKTwBVQIRn3w2AtqzRE1HCzJm9THd4/tYFmgx
         sME3rdtqAV0WSEYLhpNvlq3StKPfPWoHmMFDV1EIQPUZJ1r/ZZH00fFXfJkoCq41mC2d
         CXSrhfEtBIlNvURRL34BjovNpX23HMKkO05vb/gX+Q6Ir/2tZSSTsZWD/6PEvaH4mA1J
         6k8g==
X-Gm-Message-State: AOAM530StiIuNoCft7M9CTu8C49XgXFX9lRxkcmIG+RNLfbyDv5SUd6P
	izgVX3/vwYYQ+uZ/JY8imUFqIr+SGlrLTtQ6/0M=
X-Google-Smtp-Source: ABdhPJz1s8GDJGwlPUqerf7IjNNzQ3Jvq/+dje4VQTRmbvTtWMnInDPQ3DElfimMe58ZHE0/AYPfyG1N/AWxNcSXYG4=
X-Received: by 2002:a05:6638:223:: with SMTP id f3mr5363298jaq.144.1592753083663;
 Sun, 21 Jun 2020 08:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191219221748.27079-1-alex.kiernan@gmail.com>
 <20191219221748.27079-2-alex.kiernan@gmail.com> <902865ec-101f-0e0b-e17c-03c2fa555921@intel.com>
 <161110ADA6F0224D.21901@lists.openembedded.org> <CAO5Uq5Q1VwSVeVA7gRkjKda1upvD1iAi=Zgj5e1GGFXEHtntrg@mail.gmail.com>
 <ce0383b221fbe65e28f940b04443cb7c4d93bce9.camel@linuxfoundation.org>
In-Reply-To: <ce0383b221fbe65e28f940b04443cb7c4d93bce9.camel@linuxfoundation.org>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Sun, 21 Jun 2020 16:24:32 +0100
Message-ID: <CAO5Uq5Sb37G8zRNPv=Ue3pxYnVPBgkR=XgHRoWCNs0C9iKuRXA@mail.gmail.com>
Subject: Re: [OE-core] [OE-Core][PATCH 2/2] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross@burtonini.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Richard

On Sat, Jun 20, 2020 at 1:45 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2020-06-09 at 16:08 +0100, Alex Kiernan wrote:
> > On Thu, May 21, 2020 at 3:14 PM Alex Kiernan via
> > lists.openembedded.org <alex.kiernan=gmail.com@lists.openembedded.org
> > >
> > wrote:
> > > Hi Ross
> > >
> > > On Thu, Jan 2, 2020 at 11:20 PM Ross Burton <ross.burton@intel.com>
> > > wrote:
> > > > On 19/12/2019 22:17, Alex Kiernan wrote:
> > > > > Enable rootfs_check_host_user_contaminated by default
> > > >
> > > > Useful check!
> > > >
> > > > WARNING: Paths in the rootfs are owned by the same user or group
> > > > as the
> > > > user running bitbake. See the logfile for the specific paths.
> > > >
> > > > /data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-image-
> > > > sato/1.0-r0/rootfs/usr/share/fonts/.uuid
> > > >
> > > > /data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-image-
> > > > sato/1.0-r0/rootfs/usr/share/fonts/ttf/.uuid
> > > >
> > > > (patch incoming)
> > > >
> > >
> > > Did you manage to get a patch for this out? I've had a couple of
> > > goes
> > > at reproducing it and failed, but I suspect I'm not including the
> > > right things. It would be good to get this check enabled early in
> > > the
> > > release cycle, if we can?
> > >
> >
> > Ping?
>
> I'm trying to enable this but its triggering warnings on the
> autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/2037
>
> Unfortunately the logs are totally useless. I think we'll have to
> improve the logging before this can be debugged and fixed which blocks
> this merging.
>

I've had a couple of goes at reproducing this locally, based on the
configuration I think it's building and can't get it to fail...

Presumably we need to expose the failure lines from the supplementary
log file so that they make it into the autobuilder output?

--
Alex Kiernan
