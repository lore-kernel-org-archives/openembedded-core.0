Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web11.1809.1597171534976666025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 11:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p8hgE6J7;
 spf=pass (domain: gmail.com, ip: 209.85.219.194, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f194.google.com with SMTP id q3so7591637ybp.7
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 11:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9NzGbnEbFj8PsFeU7NCsK6q8s+08YMXf/+pREf31JEs=;
        b=p8hgE6J7g3b1BDRmzh8XDPc/KkgzL9id38JpWbs/MlwhZpynrAbredb+5Oc54Q1Fdy
         X23e0HUc3tq/7IV1jEMnXgaxg2ZTK3Nvqx85V6lotUmy2g8PoGxL0B8Hi+8wLbpySnSV
         t9z3ZIfpm31LGd2Y5K+v49j4fzHpuPzoItaHCeJGl1jQsdPiEii0DBpTivbsHe4D/0xs
         EpmX2B5bQz2bTAj3+70ZM7oDYLQ6cM6a8aWixlceIktVN+epFaZK3GLsmMCUie6X4axi
         PzTlbkG545sMKyyq4kTLvwfIJNHBzRa+08Y687mOWko3RuPUTkDkWpUKUzxT1gBgMVUB
         w6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9NzGbnEbFj8PsFeU7NCsK6q8s+08YMXf/+pREf31JEs=;
        b=o1yg7hLW8EPBL3nVHaF+xgxae8KAx7c28If6cE42RryymaC/gTOOx9oLPokOHkL5rD
         40nLjeK4+0DCK80PUBonWOFx1BmMvjgfEXWB0A7295wPHHn1rSUf2Ajl/JOfhyiJvOGO
         RKpaJ2I4LIGo4EyJ5mFXcfStF7q09nGZuiVzs9LohlcYb6KLlnHTny6Iuc4E68MzBjmG
         2jtW8TmGr6ZmEOEP+EMk4wonTHWASUs8dFcKCApTS1k9tynOSr+43g+0lq7wl5SGJqlC
         UYRrFUBKj5sVBDSM8IMX7z1afdj6f5jAN+SVO2sn+meUwiXe+0oN9G4OC4ZJSKymmSzR
         IPpA==
X-Gm-Message-State: AOAM531hGlbc+cKG6zXt4aDdwpOFeYs+IrmW/Yyz/6lVMNwAMsf7sAa3
	pgqnSKlJsJ6eNDJboKfcsIPLNYJ2zpvAhYp0p48=
X-Google-Smtp-Source: ABdhPJwNo/kWv3wUSDYFOkt/coGQKmpeiq4a42SfbFAqMAJa3wRGbdfq6p3QPQoXmC5zIZ2YKL5ygsVrKkwbSfV4J4E=
X-Received: by 2002:a25:ca83:: with SMTP id a125mr52202527ybg.513.1597171534140;
 Tue, 11 Aug 2020 11:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200811181701.2638189-1-raj.khem@gmail.com> <CAOSpxdaJtBOv18SzU0nDdQpAPMdaErFx4U8VGEBDNtb-=fDogg@mail.gmail.com>
 <CAMKF1sp4E3p_cmgrDXEQ3c_VnQ3s+O7pE22etBm2nJUrHZ3_Qg@mail.gmail.com>
In-Reply-To: <CAMKF1sp4E3p_cmgrDXEQ3c_VnQ3s+O7pE22etBm2nJUrHZ3_Qg@mail.gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Tue, 11 Aug 2020 08:45:23 -1000
Message-ID: <CAGDS+nnF+s1urNCiugvN_1ZzfGQry7913Mb8jPXajPban7Dzag@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] go: update 1.14.4 -> 1.14.6
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Zhixiong Chi <zhixiong.chi@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 11, 2020 at 8:36 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Aug 11, 2020 at 11:27 AM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > Zhixiong Chi submitted a patch today to fix CVE-2020-16845.
> >
> > I don't see that referenced in your patch, so I assume we'll need to
> > take both patches.
>
> right that will come with 1.14.7 update which is not yet proposed, so
> I guess we should do that in master and then backport it to dunfell
> instead as a follow up
> I will send upgrade patch to oe-core/master

No need, he's already submitted patches for master, dunfell, and zeus.

Steve


> > Will do an autobuilder test this morning with both applied.
> >
> > Steve
> >
> > On Tue, Aug 11, 2020 at 8:17 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Includes security Fixes for CVE-2020-14039 and CVE-2020-15586
> > >
> > > (cherry picked from commit 97d5c2d1f2dffe2518f46bbe57cb9348eb59c633)
> > > (cherry picked from commit 6591d269792fe864d7af4e379035f1cebc4510f5)
> > > (cherry picked from commit c9011d04eb624aeabf5d707e88de80137bcc2eb1)
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-devtools/go/go-1.14.inc | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
> > > index c52593db6b..64c2768f7e 100644
> > > --- a/meta/recipes-devtools/go/go-1.14.inc
> > > +++ b/meta/recipes-devtools/go/go-1.14.inc
> > > @@ -1,7 +1,7 @@
> > >  require go-common.inc
> > >
> > >  GO_BASEVERSION = "1.14"
> > > -GO_MINOR = ".1"
> > > +GO_MINOR = ".6"
> > >  PV .= "${GO_MINOR}"
> > >  FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> > >
> > > @@ -18,5 +18,4 @@ SRC_URI += "\
> > >      file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
> > >  "
> > >  SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
> > > -
> > > -SRC_URI[main.sha256sum] = "2ad2572115b0d1b4cb4c138e6b3a31cee6294cb48af75ee86bec3dca04507676"
> > > +SRC_URI[main.sha256sum] = "73fc9d781815d411928eccb92bf20d5b4264797be69410eac854babe44c94c09"
> > > --
> > > 2.28.0
> > >
> > >
> 
