Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web12.14877.1592823551033490119
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 03:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iYJCREue;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id i25so19029286iog.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 03:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NEcTxfDsbu3gPhGqE0j0g6MW2fxOPjkC08vKOi60QL4=;
        b=iYJCREue7WWcg5yqk1cbTkyteuY7jptzLJcSKTp2TynqhIXS0V5zf/GBOIGSA1Zu/9
         +I7i1Tzo7YSUlJFPFK/bPfNsiwKV9yFUADw1qZOL+Yykz0ZriN74/yLhHhOUg8J42/Ho
         gtRmNPTAaZ5uY0euI6/ssgLHfmnVQlvUWgO2JCQbytsV57plbn9FA/qNouHCmY+ktJkP
         lSH4aS4YRiKlY0Y1AlsmGuX8YbG2pmjJxSAg2nVyZSiNLAJ/4GiXCm3vbF1kdcl+75PP
         RgAOIBakfKgtBtnwC4uj45Dti1wKVava5iYxYITVpyJ2SF2hijeWuWcBzI7uBd6XbNji
         NAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NEcTxfDsbu3gPhGqE0j0g6MW2fxOPjkC08vKOi60QL4=;
        b=JyFApZmFCCqaFVnSpjkibaXaXSXnWQndOhXVIxU1qr8oDRGZ7raQZ1MbUl17c9JHqO
         YfAtpB9lq9PMIdyYieT51Cr/fE9AZIMVzZDdyaCA9ut78dn2wTrU8eZEYomF1NOR5NaC
         ryGHI0sCR+Qt/IUGKr0Q7trbzNcIAt2W7z7e2dHmvmMBvIyc+A2JG87NzQ4ZlVJOSOkE
         vi82RZfoDDVcU0YUGjB7jCQ79oJEg4Sdi7U7+hJEoAdKg9XV53rqyy5feGMNQKPM2zrc
         21MNepBB8/VTOmZGY7FQjYL8ytItIRkhxXn8ty3Y1uzfaRWyMDRBv+O+s0oAceCBbaeo
         ZUIw==
X-Gm-Message-State: AOAM532Au3JGUA18v66KE3YThVpsvMWu+41I27mEY3XCv48nCDGD0Gsd
	KfL3S+4e73IEQM1/DAq0lKoulFx7gbv91S+daEA=
X-Google-Smtp-Source: ABdhPJwaCxXC3t7FMMv/U0wIU+xgAATxOXZ6aRI6Uhk1npBd+u+FvIYC+3iknqpK1RisFcs8HABfEqPNtKmn6x0op7k=
X-Received: by 2002:a6b:1449:: with SMTP id 70mr12421284iou.153.1592823550387;
 Mon, 22 Jun 2020 03:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191219221748.27079-1-alex.kiernan@gmail.com>
 <20191219221748.27079-2-alex.kiernan@gmail.com> <902865ec-101f-0e0b-e17c-03c2fa555921@intel.com>
 <161110ADA6F0224D.21901@lists.openembedded.org> <CAO5Uq5Q1VwSVeVA7gRkjKda1upvD1iAi=Zgj5e1GGFXEHtntrg@mail.gmail.com>
 <ce0383b221fbe65e28f940b04443cb7c4d93bce9.camel@linuxfoundation.org>
 <CAO5Uq5Sb37G8zRNPv=Ue3pxYnVPBgkR=XgHRoWCNs0C9iKuRXA@mail.gmail.com> <964e63ac0bfa723afd2f280b840edcc0340bb442.camel@linuxfoundation.org>
In-Reply-To: <964e63ac0bfa723afd2f280b840edcc0340bb442.camel@linuxfoundation.org>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Mon, 22 Jun 2020 11:58:58 +0100
Message-ID: <CAO5Uq5Q56a8nnPs_DD8i9=vVALkBqmrV4edR5_QmL1y99MbNLA@mail.gmail.com>
Subject: Re: [OE-core] [OE-Core][PATCH 2/2] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross@burtonini.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 21, 2020 at 5:00 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2020-06-21 at 16:24 +0100, Alex Kiernan wrote:
> > Hi Richard
> >
> > On Sat, Jun 20, 2020 at 1:45 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Tue, 2020-06-09 at 16:08 +0100, Alex Kiernan wrote:
> > > > On Thu, May 21, 2020 at 3:14 PM Alex Kiernan via
> > > > lists.openembedded.org <
> > > > alex.kiernan=gmail.com@lists.openembedded.org
> > > > wrote:
> > > > > Hi Ross
> > > > >
> > > > > On Thu, Jan 2, 2020 at 11:20 PM Ross Burton <
> > > > > ross.burton@intel.com>
> > > > > wrote:
> > > > > > On 19/12/2019 22:17, Alex Kiernan wrote:
> > > > > > > Enable rootfs_check_host_user_contaminated by default
> > > > > >
> > > > > > Useful check!
> > > > > >
> > > > > > WARNING: Paths in the rootfs are owned by the same user or
> > > > > > group
> > > > > > as the
> > > > > > user running bitbake. See the logfile for the specific paths.
> > > > > >
> > > > > > /data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-
> > > > > > image-
> > > > > > sato/1.0-r0/rootfs/usr/share/fonts/.uuid
> > > > > >
> > > > > > /data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-
> > > > > > image-
> > > > > > sato/1.0-r0/rootfs/usr/share/fonts/ttf/.uuid
> > > > > >
> > > > > > (patch incoming)
> > > > > >
> > > > >
> > > > > Did you manage to get a patch for this out? I've had a couple
> > > > > of
> > > > > goes
> > > > > at reproducing it and failed, but I suspect I'm not including
> > > > > the
> > > > > right things. It would be good to get this check enabled early
> > > > > in
> > > > > the
> > > > > release cycle, if we can?
> > > > >
> > > >
> > > > Ping?
> > >
> > > I'm trying to enable this but its triggering warnings on the
> > > autobuilder:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/2037
> > >
> > > Unfortunately the logs are totally useless. I think we'll have to
> > > improve the logging before this can be debugged and fixed which
> > > blocks
> > > this merging.
> > >
> >
> > I've had a couple of goes at reproducing this locally, based on the
> > configuration I think it's building and can't get it to fail...
> >
> > Presumably we need to expose the failure lines from the supplementary
> > log file so that they make it into the autobuilder output?
>
> Yes, we need the output to show which files are affected to have some
> chance of figuring out how to fix this. The fact its happening
> intermittently is somewhat worrying :/.
>

Just sent a v2 which includes changes to push the failure paths into
the main log

> Cheers,
>
> Richard
>



--
Alex Kiernan
