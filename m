Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.27641.1628535261614030256
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 11:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mQ15y42B;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.54, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f54.google.com with SMTP id h24-20020a1ccc180000b029022e0571d1a0so703601wmb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 11:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wb8heRzahGswzbWMlPClWtFEqnLtVJed077CtMqRFeM=;
        b=mQ15y42BiICs+uFub2TcSH5gAmQATFgUacCVTNwYocUp2qpQ4L1O3yujSbaSWt6nRY
         jsgFvCcukRBVf+udapV3qnisFtG4EjsN3R1mcaM4X3nsnZzjUxfHitH5KHG5EX5UudN+
         B/njh7U/2btRQWwZF9Nni5M4tuA3kB97SKGzFBFJc5RkjusOYGNjFTuhfvDbZcVj08bH
         Ii+eQG8M3Hir+VFJ+B5OhcopM3djYOCGL5GQR1Sfmqb68eKYyA4gw9sREoatwG1Wo1wR
         PmZEJxOUseMYwE9OqcpJ4M91tYtleflReeDcYigsJWz0aB9I5EuNdvHVy0oR/JQb9+yH
         fUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wb8heRzahGswzbWMlPClWtFEqnLtVJed077CtMqRFeM=;
        b=b0biySj70/RHv3bqXanJW2pLrqCxMyU83IavU+nEh2QsRB4KhiR4S+oUmYv7nec2qm
         XVf6gePrzM/clC/kXuhmVKr11grfp2RErBl/KP3UzYhIoIAVm2AA5jWHPWjFkb/MQ67t
         kJEuGoDz+nDi6bixRwgjZ+YbInuGSB4aAWUHi3wmW5hoFoTFy5SAGivN6F6Sp29jJ+/i
         QPmAxenlyf8Pua4RfLUXUOevDF1vY80Y0Aod/+aX1fG3fIYgvXqr83cK5HF8X6bGksqD
         BXYxaTbD+nwSx1qCAA+udE+VkQd6d2ZmJAEefzicKX3GZoOB+TxyzggNWIZRrJb4+71h
         UQag==
X-Gm-Message-State: AOAM533ADBdEhKfF+qJdFaaScswdAC+6hpqVTGyPX+OxbtO1hkBaPqNw
	M4n3BwHAkUOv1VsTDCXxMza0XxJGBT9zRj57k91bkg==
X-Google-Smtp-Source: ABdhPJxH3B37vhp+KlpqJMrX6YsWLPeEUYDrDcOCY1qH0cc60r5nkXFbH6ub2FqGMKQmpmTEbKH9dtiSg2qcVZoEfIc=
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr607045wmj.4.1628535260100;
 Mon, 09 Aug 2021 11:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210808143359.6E9409602DA@nuc.router0800d9.com> <20210809183740.GA373236@maple.netwinder.org>
In-Reply-To: <20210809183740.GA373236@maple.netwinder.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 9 Aug 2021 08:54:08 -1000
Message-ID: <CAOSpxday+LLxEi5BvhzSkgHxiSh2gkvRhB3W-h3dndeGuN+PkQ@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for dunfell on Sun 08 Aug 2021 04:30:01 AM HST
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 9, 2021 at 8:37 AM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> On Sun, Aug 08, 2021 at 04:33:59AM -1000, Steve Sakoman wrote:
> >Branch: dunfell
> >
> >New this week: 3 CVEs
> >CVE-2021-28966: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28966 *
> >CVE-2021-31810: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31810 *
> >CVE-2021-35942: glibc
> >https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35942 *
>
> It looks like the glibc one is already fixed in the dunfell branch:
>
> commit e1e89ff7d75c3d22 ("glibc: update to lastest 2.31 release HEAD")
>
> Includes the following fixes:
>
> 4f0a61f753 wordexp: handle overflow in positional parameter number (bug
> 28011)
>
> which fixes the CVE, although it isn't mention in the commit:
>
> https://sourceware.org/git/?p=glibc.git;a=commit;h=4f0a61f75385c9a5879cbe7202042e88f692a3c8
>
> So I think all that's needed is CVE_CHECK_WHITELIST += "CVE-2021-35942"
> I can submit a patch for this if you wish...

That would be much appreciated!

Steve
