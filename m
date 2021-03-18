Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.178.1616095803263346203
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 12:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gyKmrwyG;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.52, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f52.google.com with SMTP id j18so6754667wra.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 12:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rse7E5cGjgZfz8KdYGPp78hVrTOnsd8DONLkt4K1yCc=;
        b=gyKmrwyGNFVZazOOLrEAFRdIO0Lpu8iCAEIg2+qlgtDcSTpcgmAx9XUH5kGPe35ycz
         cA1xRGHCzxIjGH/uOUQNYIQr54CWVFEuSUJZXMiwq3/PU+PviZ7+mh2WKnu9sIbxr3jQ
         fwiIXYZg7ZzLtAaqSnF75f/pq6BhTfIeJKoLstwVqqgurtiG5SNWvq6NVIK3FkUDLdSB
         W5jTT0Pozu4Z0sV9YX7DNAKtgNgkAN/V+w6606/fgO4XNYDq0RounOB0dqOfP0TjXjlI
         y1oHzNZsaCwan8vNbbjYi+bkD+2msq6GHeSHnmprYAiJ0/6WRA4M+ThukXVrNhDcIw7X
         WPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rse7E5cGjgZfz8KdYGPp78hVrTOnsd8DONLkt4K1yCc=;
        b=d05QPBBNYGwPasrbHykdVDfSG0ypGTj7UH0ucD5Kl/w81J2ZQxPLX9eMjaa7suojZr
         lOulHD/izYHXUVgORhHyepOZM9QOizUSbPglCP6gRF+0MarTAONj8+ZPmKOBGos2K7bM
         JkJrJCzgMHbKjiVZRjp7wQlu3noM124fClAOod0qtLql4OtzdOTbtcRKrHnSN0Sgupzo
         Iamq9a9evP/KDYE3TC8Q86bUrRpndMiMFXEHGK/UbBRTwV8SAuVFHeGbE5eLhMnExxq9
         tAusSy/hsiV0tPGh+e5aiF/WSl+mOGeuwnq5qAHl54TR8nygIKRsRVeZ0bMo/ap1APgv
         U0SQ==
X-Gm-Message-State: AOAM53016WHiNcv8sPq1AgNe/pePYzX191Q4lOFKEgzbxMalG+Zfh6uk
	1z1q9vCD7Xp+Eee7S95JoiQTJYkI/XMDhDx8FylsmQ==
X-Google-Smtp-Source: ABdhPJzUD+ixcLTxcnE9Twl4cHJyZP2CLrHqJ1yclrZYMlOWPx6zRdPoqA+5ymks3aK2xFDxcwrgZFg7tNu0qP8EWFo=
X-Received: by 2002:a5d:4587:: with SMTP id p7mr807972wrq.205.1616095801629;
 Thu, 18 Mar 2021 12:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210311152128.41215-1-khairul.rohaizzat.jamaluddin@intel.com>
 <CAMKF1spX6z9vvv7QNbWhkapX-Z1=FWZVh0W2+OM2qSbxPqQgkQ@mail.gmail.com>
 <DM5PR11MB1322590C6E8F9272ECC912CFDE6F9@DM5PR11MB1322.namprd11.prod.outlook.com>
 <MWHPR11MB1326447A6A6AA12D09952A56DE6F9@MWHPR11MB1326.namprd11.prod.outlook.com>
 <f2d269853c88992f528419d5d20139a42728cada.camel@linux.microsoft.com>
 <20210315213606.GP4892@denix.org> <dd23f3e8-0db6-3f8b-466a-e9c9207c6604@linux.microsoft.com>
 <CAOSpxdbSVPDC9hDcyYhjvSwdbRnaPJ_VbaLscMLNhiwrVN6u-A@mail.gmail.com>
 <c115a501-d7ce-3c30-7964-6e0afc373305@linux.microsoft.com> <MWHPR11MB1326409A4E80D7DB446A0B6CDE699@MWHPR11MB1326.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB1326409A4E80D7DB446A0B6CDE699@MWHPR11MB1326.namprd11.prod.outlook.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 18 Mar 2021 09:29:48 -1000
Message-ID: <CAOSpxdZzQh0cR2_3TMm8vpU_6odAym9ve1zYZSZo6EtqaP03YA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
To: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
Cc: Anatol Belski <anbelski@linux.microsoft.com>, Denys Dmytriyenko <denis@denix.org>, 
	Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 18, 2021 at 8:31 AM Jamaluddin, Khairul Rohaizzat
<khairul.rohaizzat.jamaluddin@intel.com> wrote:
>
> Hi,
>
> Please do correct me if I'm wrong, is the final verdict for glibc on dunfell is to whitelist all the CVEs that were applied before the commit used in SRCREV?
> I'm not really sure what needs to be done here..

My guess is:

1. Bump SRCREV to current head of the 2.31.1 branch
2. Remove patches from the recipe that are already included in the new head
3. See what breaks and fix it ;-)
4. Identify any new CVE's that are fixed as a result of moving to the
new head and add them to the whitelist.

It's unfortunate that we need to deal with keeping the whitelist
accurate, but since upstream doesn't do version bumps there is no way
for the cve checker to know that these fixes are included.

Steve

>
>
> Thank you & Kind regards,
> Khairul
>
> -----Original Message-----
> From: Anatol Belski <anbelski@linux.microsoft.com>
> Sent: Wednesday, March 17, 2021 4:24 AM
> To: Steve Sakoman <steve@sakoman.com>
> Cc: Denys Dmytriyenko <denis@denix.org>; Jamaluddin, Khairul Rohaizzat <khairul.rohaizzat.jamaluddin@intel.com>; Khem Raj <raj.khem@gmail.com>; Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
>
> Hi,
>
> On 3/16/2021 4:45 PM, Steve Sakoman wrote:
> > On Tue, Mar 16, 2021 at 2:56 AM Anatol Belski
> > <anbelski@linux.microsoft.com> wrote:
> >> Hi,
> >>
> >> On 3/15/2021 10:36 PM, Denys Dmytriyenko wrote:
> >>> https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable.2FL
> >>> TS_Patch_Acceptance_Policies
> >>>
> >>> Stable/LTS Patch Acceptance Policies
> >>>
> >>> Potentially Acceptable:
> >>> * Bug fix only version upgrades for upstreams with a good stable
> >>> process
> >>>
> >>> Unacceptable:
> >>> * General version upgrades
> >>>
> >>>
> >>> So, unless there's a bugfix-only minor release of glibc, e.g.
> >>> 2.31.1, upgrading to 2.32 or 2.33 in stable branches is highly
> >>> unlikely, as both
> >>> 2.32 and 2.33 have long lists of major changes:
> >>>
> >>> https://sourceware.org/pipermail/libc-announce/2020/000029.html
> >>> https://sourceware.org/pipermail/libc-announce/2021/000030.html
> >> thanks for linking the LTS doc.
> >>
> >> My suggestion was to pull the latest upstream from 2.31 actually, not
> >> upgrading the glibc version. As per
> >>
> >> http://git.yoctoproject.org/clean/cgit.cgi/poky/tree/meta/recipes-cor
> >> e/glibc/glibc-version.inc?h=dunfell
> >>
> >> we consume from the branch release/2.31/master. It already contains
> >> the backported patch fixing this CVE.
> >>
> >> There doesn't seem to be a release process in terms of versions, but
> >> it regularly receives backports. In fact,
> >>
> >> there are already some bug and CVE fixes between the current SRCREV
> >> used and HEAD.
> > I'd be happy to take such a patch for dunfell.
> >
> > I'll add it to my to do list to look into this, but if someone has the
> > time/inclination to tackle this it might get done sooner :-)
> >
> > Since there is no versioning from upstream it will be important in
> > this patch to make sure that we whitelist all of the CVE's that are
> > fixed with the bump in SRCREV.
> >
> I'd be able to do a run on this closer to the end of this week, if no one beats me to it (perhaps Khairul, the initial patch contributor ;)).
>
> Regards
>
> Anatol
>
