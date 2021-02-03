Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web09.11936.1612369879497252442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 08:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mgIiCYCT;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id j84so196410ybg.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 08:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8gj0+BOluyaOX7wW9BWPqTCFbBYoH+0ygNjWZbb/jsY=;
        b=mgIiCYCTmpfW/pw1rbpi+RRZYx7BifQFwbtcFexm/jWMtFNEttNYLwJOIR85vi5gSt
         OvrBHzmZlxMG08CChkXRAkxNOULhNcB68rNUJFkrbYUYoNGF1PjaX8sSNGZy4JePMv4G
         kYq4ZYmzT3Xm1LUgDOkgLTl+We7yHcd5STPCK7cNk71SVCumNfzZO/GNEYm9rjnSk4bM
         LEK5dP/HgBTAncH1+ZaKejAUaDQs23m+1ycit6XIFeotLPPDqHz8EM9xVb+014MtG5yl
         ddTsphwD4nte0L6HRdG3Y0sG65AtZy/FqVC7XNoogn2bVpFbWO+WA3CClrLtHY5P2Zn6
         UD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8gj0+BOluyaOX7wW9BWPqTCFbBYoH+0ygNjWZbb/jsY=;
        b=i8RL31vjNHd9TrmhtzaN6KVFillmb+RqOA7jGId8YxOoqejUzMORSBycwbtZs5NA6a
         0qMIDn/zfWo0RwYFzIYka24PzKePLB0ZFTdbDg1RXeSeJyqv06zzZrHEvgQkPMNL52/o
         JPd57LKHkIltonlc3scRrVtD9wZ8G8XXdinkTw4ZlOvSoQPAbVjwiML6FpI6upVOu2pD
         zYTzGBpZgEswEKxvwYXlr4hpuCyoTJfJgQ+nUkC/FzmuMtw/hRZg/JNDLcvOs0pQrChc
         sra8AprhDt+QjEDasbBr0v2tHTz4jF9953GXwhnr0tBLdkyfprZBNQqCwC4VccXlQi0U
         uWRQ==
X-Gm-Message-State: AOAM532r+saBZ/imZIvrgPVDGWBSuwf76/TxtJdMtsTYlVGgSg0c+84K
	7UePVdyxNTY5X3uJFCP0zq/jFVG73oG7TjwfaQ8=
X-Google-Smtp-Source: ABdhPJw8JDST1ll0dhS1d23DOEc1Vnb0r62c/uhDQL4au3J1uwf1Pg1DmcapbWTZ0vUgTWfSKxLk3BzqKZquAYNwFPA=
X-Received: by 2002:a25:1646:: with SMTP id 67mr5810634ybw.97.1612369878673;
 Wed, 03 Feb 2021 08:31:18 -0800 (PST)
MIME-Version: 1.0
References: <20210203084257.26778-1-anbelski@linux.microsoft.com>
 <YBp0r/IvR1vFubjt@korppu> <CAOSpxdYJNWu+cPtAH_ceHuOsYVYEo8ozh0RJRRcv54-B139fOA@mail.gmail.com>
 <YBrG8IXZ18sRjupY@korppu>
In-Reply-To: <YBrG8IXZ18sRjupY@korppu>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Wed, 3 Feb 2021 06:31:06 -1000
Message-ID: <CAGDS+nm6oVw9UuHmm_5PKE7kGiOo1HrNp3rHqVKgg72ZLdpHLQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] glib-2.0: Rename patch file for CVE-2020-35457
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: anbelski@linux.microsoft.com, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 3, 2021 at 5:53 AM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
>
> On Wed, Feb 03, 2021 at 04:38:58AM -1000, Steve Sakoman wrote:
> > On Wed, Feb 3, 2021 at 12:02 AM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
> > >
> > > Hi,
> > >
> > > On Wed, Feb 03, 2021 at 08:42:57AM +0000, Anatol Belski wrote:
> > > > The naming convention needs to be help so the CVE is recognized as
> > > > fixed by the tooling.
> > >
> > > Yocto CVE checker does detect CVE patches also from patch comments so
> > > this change is not needed for that. This is sufficient:
> > >
> > > poky$ git grep CVE-2020-35457
> > > meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch:CVE: CVE-2020-35457
> >
> > Yes, we are detecting the CVE patch from the patch comment.
> >
> > However our CVE patch guidelines do request that the patch be named
> > with the CVE as the name:
> >
> > https://wiki.yoctoproject.org/wiki/Security
> >
> > (in the "Patch name convention and commit message" section)
> >
> > I'm sorry I didn't catch this when I merged this earlier.  I always
> > check the patch itself for the CVE tag, but I missed the name.  So I'm
> > happy to take this patch just to clean up the metadata and make it
> > easy to see that this is a CVE patch.
>
> Does anyone know why CVE ID in both name of the patch and in the CVE: tag are required?

I wasn't involved in defining the requirements, but I suspect that it
is to make it easy to
see with a glance of the recipe which patches are CVE fixes.

I like it for this reason, but as you say it doesn't affect the cve
checker script.

Steve

> Sometimes when copying patches over from upstream or other distros, I prefer to do as
> little changes to them as possible. Adding CVE: tag and Upstream-Status are ok, but
> for example renaming all patches files copied from a Debian/Ubuntu patch set is
> a bit too much.
>
> Cheers,
>
> -Mikko
> 
>
