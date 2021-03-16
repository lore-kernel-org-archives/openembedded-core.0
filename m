Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.836.1615909543885382104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 08:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0PJHsep9;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.54, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f54.google.com with SMTP id f12so10692826wrx.8
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wt2C9EXp0DFdEyNWGF87Wf5nyV9AHXuiargKn/zFOGY=;
        b=0PJHsep9AajoM10EJhkzHlsooFB+Wp0nUwA3/JW/DxO0AViz0buNL6AAa5x0UUqVRy
         Yb1dzk7snVfz/wTcYumIu/O41oZ2ycnLFBmwXv8W/dzW7GpkbS6kUJXDnKqdEjGxSL3c
         Gemdkqvb14EBQ/MVVo29FvZW3pw8IiBZW3bHu2ZdJI/Lmtvjj7p8dBrgDD6Xja64Q7+H
         ThgboqGCEOW2yfqszJHtvsBfAaCtZE4K9Izo39T2x9r0EHi7gsgfJH/TPJ5oKbQPp6C3
         5nvV4E0YEW1q3lSIYEDb6QQWLkruLVpjJzyrlDKdMyhcpEjm0EuuC49ZW6vA75G4rwje
         UMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wt2C9EXp0DFdEyNWGF87Wf5nyV9AHXuiargKn/zFOGY=;
        b=PPu14XBq5GFNiEzq0AfrfTtW5qD+GvviZ0jhVSJjKUuom8Z09nSR//cKFojS/43/Zl
         KkPb3Hp6lzKQ+voAVqwLzpT/BvUHjlYhjSoNYyPcswkNGQ7x8JLqBIWmdD4iAFqeSlIS
         vDEW5ZgHghgsjiFS7NgBe3OwpyIc29ltuLMu7ZXWW+BlOICzbRQSxDP5ZD893ja5qSN+
         0Q7BwxKtneYUVllkcB2iE+SUSTg4V9mfTDvYY+SHFR9MlJqJtKqo4J4vIkU4TXYPGfYO
         RfsrHrPIia7vv5747GzUXbDlAC4WS4kik3om6an4huI0IjTvM9DquDCH2gW2U8C6Y5bI
         dMFw==
X-Gm-Message-State: AOAM533yFWCfcKyTBN8AUt05H6kWEwclQRscgRxvwA1l0+eDck2vifoH
	+rf6y6pjw+QxfnwZjHP1A/x29uSp6/N0SGlZv85Ciw==
X-Google-Smtp-Source: ABdhPJzJ23NwgNGfAPH6oozHz5gDq2yvuhjp93BGuHG2WWpwJmKMmJaMljYabRz7Vu/zfgheyGyv8orE+Qr+hxbnjtM=
X-Received: by 2002:adf:a219:: with SMTP id p25mr5711708wra.400.1615909537078;
 Tue, 16 Mar 2021 08:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210311152128.41215-1-khairul.rohaizzat.jamaluddin@intel.com>
 <CAMKF1spX6z9vvv7QNbWhkapX-Z1=FWZVh0W2+OM2qSbxPqQgkQ@mail.gmail.com>
 <DM5PR11MB1322590C6E8F9272ECC912CFDE6F9@DM5PR11MB1322.namprd11.prod.outlook.com>
 <MWHPR11MB1326447A6A6AA12D09952A56DE6F9@MWHPR11MB1326.namprd11.prod.outlook.com>
 <f2d269853c88992f528419d5d20139a42728cada.camel@linux.microsoft.com>
 <20210315213606.GP4892@denix.org> <dd23f3e8-0db6-3f8b-466a-e9c9207c6604@linux.microsoft.com>
In-Reply-To: <dd23f3e8-0db6-3f8b-466a-e9c9207c6604@linux.microsoft.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 16 Mar 2021 05:45:24 -1000
Message-ID: <CAOSpxdbSVPDC9hDcyYhjvSwdbRnaPJ_VbaLscMLNhiwrVN6u-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
To: Anatol Belski <anbelski@linux.microsoft.com>
Cc: Denys Dmytriyenko <denis@denix.org>, 
	"Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>, Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 16, 2021 at 2:56 AM Anatol Belski
<anbelski@linux.microsoft.com> wrote:
>
> Hi,
>
> On 3/15/2021 10:36 PM, Denys Dmytriyenko wrote:
> > https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable.2FLTS_Patch_Acceptance_Policies
> >
> > Stable/LTS Patch Acceptance Policies
> >
> > Potentially Acceptable:
> > * Bug fix only version upgrades for upstreams with a good stable process
> >
> > Unacceptable:
> > * General version upgrades
> >
> >
> > So, unless there's a bugfix-only minor release of glibc, e.g. 2.31.1,
> > upgrading to 2.32 or 2.33 in stable branches is highly unlikely, as both
> > 2.32 and 2.33 have long lists of major changes:
> >
> > https://sourceware.org/pipermail/libc-announce/2020/000029.html
> > https://sourceware.org/pipermail/libc-announce/2021/000030.html
>
> thanks for linking the LTS doc.
>
> My suggestion was to pull the latest upstream from 2.31 actually, not
> upgrading the glibc version. As per
>
> http://git.yoctoproject.org/clean/cgit.cgi/poky/tree/meta/recipes-core/glibc/glibc-version.inc?h=dunfell
>
> we consume from the branch release/2.31/master. It already contains the
> backported patch fixing this CVE.
>
> There doesn't seem to be a release process in terms of versions, but it
> regularly receives backports. In fact,
>
> there are already some bug and CVE fixes between the current SRCREV used
> and HEAD.

I'd be happy to take such a patch for dunfell.

I'll add it to my to do list to look into this, but if someone has the
time/inclination to tackle this it might get done sooner :-)

Since there is no versioning from upstream it will be important in
this patch to make sure that we whitelist all of the CVE's that are
fixed with the bump in SRCREV.

Steve

> Regards
>
> Anatol
>
>
>
> 
>
