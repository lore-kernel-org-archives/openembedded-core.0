Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.1477.1590620307289432644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 15:58:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PozVnDLd;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id b6so1321558qkh.11
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 15:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lgJwwwsdW/OQ9bPUCABeCMmGkMkzzVqI0rZdVaPJ/+8=;
        b=PozVnDLdGtqmlZMyk4/3L5fw8zWOn7wv073DXgahaqUNWIIqQTC6kzjN6WRIIR4xDU
         v8I7ypUUVMP483svSBU/pKs16GIEO9DRoIs5JYLoncc88seM/tsWwI2vupd0q82b5zNb
         HF7Y4HczLdjK7XwmequNuFJ+gh7EyJp05Kt4GX03H/rdQtMpAUweixs4U5IS3snBK89h
         oV7jXh+0GxwSvdECOBOIkWL42kERuqEo8BEZINfn2DSb5qzqkNZbCDWp9Z4Nq7zcenT4
         DDyHjEECwQAd1MXcE74Qyre9x5rM0qk8Bvju0PaLnNVJpzVKrHM/JXpa248jfk2Cd0ga
         BjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lgJwwwsdW/OQ9bPUCABeCMmGkMkzzVqI0rZdVaPJ/+8=;
        b=Q+7843lGX2iuWR5FkfkqtaseQtqxCuWeqe4NFmGRc3+ly+3RRqEEo3U54rmJSHhu8L
         csKyZHfkYZeA3tI1Iw8bGwEGyvkLv3NzlZiDZRK07gZFmkc5sSgau+iSmesBbH7OpcmJ
         vG8NadvoGpEvRYsD0uk5ArNbOxyHyPLZMryjCynVEIyOlsDQAhljVSM7FkYIBBIQH4xt
         XV3ilVMKhdX8ibD91nVWw+9BmMa6eIpaqMkeAF6hzA2SBr9WpCJnR6Tyw66wm1jPFZLu
         mDcQWhbfaHOOrO3QBwrNlWG/W1qFm5EQgmIyidfiHa3dhElFkXDS6fz+q4asU1WKsP3C
         2Sgw==
X-Gm-Message-State: AOAM532sGLtKlrPlLAw5BhrWTjNeE9LnIFimwd5cnuRZOaIdn7/PQehT
	vNAb3IRnXqaqrY2rxWSM+bMvVgah4iRkb2nxEec=
X-Google-Smtp-Source: ABdhPJyQmiKjh/BHTjx6B6Ow9W9JvAsuhE5JxUFh1+X+3tgIe3AG0DMi8lEgQVJWcexFBKpc27cBJ7IlOaiyUKNoZrw=
X-Received: by 2002:a37:4c97:: with SMTP id z145mr127843qka.165.1590620306110;
 Wed, 27 May 2020 15:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200527155011.3165976-1-raj.khem@gmail.com> <20200527155957.GK17660@denix.org>
 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
 <CAMKF1spMw=6ZfkBWy3=+rSiHknxLvVC6uPH3Q8z_UiGdOECVdw@mail.gmail.com>
 <20200527215251.GA20867@pbcl.net> <CAJ86T=X=su_-PaAG_fqs-AjFb_ZFPtvRJTFvP9ZOce1Kv1Z3nQ@mail.gmail.com>
In-Reply-To: <CAJ86T=X=su_-PaAG_fqs-AjFb_ZFPtvRJTFvP9ZOce1Kv1Z3nQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 27 May 2020 15:57:59 -0700
Message-ID: <CAMKF1spE6tvmsJuoFciA9-MPBZLH0GpOQiDcohL5qtJzF_BzbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Phil Blundell <pb@pbcl.net>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Denys Dmytriyenko <denis@denix.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 27, 2020 at 3:43 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Wed, May 27, 2020 at 2:52 PM Phil Blundell via
> lists.openembedded.org <pb=pbcl.net@lists.openembedded.org> wrote:
> >
> > On Wed, May 27, 2020 at 02:46:24PM -0700, Khem Raj wrote:
> > > and building userspace against way newer kernel-headers with older
> > > kernel underneath has unintended
> > > consequences.
> >
> > Can you be more specific?  If this doesn't work, it's just a bug and
> > should be fixed.  What problems are you having?
>
> I don't have an up to date example, but I've been using kernel version
> specific libc headers for all my projects for many years. The issue
> which prompted me to do that was run time crashes from libcap-ng and
> the historical commit message was:
>
> ----
>
>  linux-libc-headers: use 3.3.8 kernel header files for mips platforms
>
>  If libcap-ng is unable to probe kernel capabilities at runtime then
>  it will assume the kernel supports all features defined by the libc
>  kernel headers. Since our default libc kernel headers (linux 3.14)
>  define capabilities which are not available in linux 3.3 based
>  stblinux kernel used for our MIPS platforms, that causes runtime
>  crashes.
>
>  As a workaround, force an older version of linux-libc-headers for all
>  MIPS platforms to try to remove that discrepancy between the kernel's
>  capabilities and those defined in the libc kernel headers.
>

there are similar issues seen with linput.h using apps. I will dig the reasons
but it does work when kernel and kernel header. versions are same and its using
mainlne release for kernel headers here, so there is no vendor specific code
perhaps that's breaking APIs

> ----
>
> The risk of using bleeding edge linux-libc-headers with an older
> kernel may be low, it's not zero. Since OE testing doesn't appear to
> include any coverage of older kernels, I'm not sure why I should be
> the guinea pig and take the risk!
