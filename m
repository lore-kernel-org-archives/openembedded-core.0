Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.1928.1597171848081776639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 11:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SY2bfMXU;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id h21so10205820qtp.11
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 11:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MntfT81q+PrTplsf8+tDhTQ3N1i/pRBiQtLI7+IOVA4=;
        b=SY2bfMXU1ZWl+X6RiVy8b5Klfw/6bBYjnc8FDXrlu1R66Yb35qoYJFDf9o+DyWXRs4
         KmtcnoVZsuF5WPCAuZGs4AP5biHvMHz49/RPuqLILDn7jKwPWFpILCoOVxVknnjxEaHR
         5cum7H+C8hF835TFktO5D4K6u7MSnEG60HSwQOswrhmqftMTtLfjzcMsdLTKGd4Lcv4S
         FYVAr8hCwEsmgbMIlunSOeqEiETeQmrSt2hRUGjA/rep21HdcuYXei6LpeyEB5TDkU49
         ducyVNCg8ObZD6sqYskJehdC/40fXMc76i+a1nwLcrvD3I3l1RTfHp+d2KMq8BRxrmVX
         ZbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MntfT81q+PrTplsf8+tDhTQ3N1i/pRBiQtLI7+IOVA4=;
        b=KlOcK2cWG3cIVAexMitJgWsYoyl07xheH71N7GhuBqVlSfHdk3YRRSAufz1pgfFVcg
         FFKD3TW/YlXC7Si6m/X9wN+QPPlhRcsfSua+Dg0p5v3KW7166/5skH1TThlX0dVEcVwO
         paPCZuRHo9ey1i4+v9YqBVgee24X85Pb/Fb6MDJrYDIL/JOtk9VqmlrH0dRByYl6GlNv
         Z5F++0+VXiYgP3n1kYid3dx/AQ9bdTsMcLiNl0GkjTEJ7aXbvpEwB40W/Gu11mYormwY
         K4q+zI7m4q6ebGywcuOVeFPEyRSTfXlNQzuraoOLu1r62Ks8VBexljpuZyvsWbwYPrvQ
         UA+A==
X-Gm-Message-State: AOAM531v6/j0iJk1gXnSA/3z5G0VUv7tmilVyospYTYk4YYZ56b4HiB2
	PSOUHD4pbZUTtPm33ZsJHBuEFauP04lylUMlfWA=
X-Google-Smtp-Source: ABdhPJzLGDY8V2sPIEhPZdwO0q5JGn1uH6TcoB6IYp7Xy+1ZS1bZDBs9/erHC1qinTYlIZlywBPDS9RN4v7ho7rp7sw=
X-Received: by 2002:ac8:4097:: with SMTP id p23mr2438597qtl.316.1597171847137;
 Tue, 11 Aug 2020 11:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200811181701.2638189-1-raj.khem@gmail.com> <CAOSpxdaJtBOv18SzU0nDdQpAPMdaErFx4U8VGEBDNtb-=fDogg@mail.gmail.com>
 <CAMKF1sp4E3p_cmgrDXEQ3c_VnQ3s+O7pE22etBm2nJUrHZ3_Qg@mail.gmail.com> <CAGDS+nnF+s1urNCiugvN_1ZzfGQry7913Mb8jPXajPban7Dzag@mail.gmail.com>
In-Reply-To: <CAGDS+nnF+s1urNCiugvN_1ZzfGQry7913Mb8jPXajPban7Dzag@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 11 Aug 2020 11:50:20 -0700
Message-ID: <CAMKF1sp6ssDBySDRo3_uxj4VD138geByyP9ktNiU3Ce_xwktgQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] go: update 1.14.4 -> 1.14.6
To: Steve Sakoman <sakoman@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Zhixiong Chi <zhixiong.chi@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 11, 2020 at 11:45 AM Steve Sakoman <sakoman@gmail.com> wrote:
>
> On Tue, Aug 11, 2020 at 8:36 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Aug 11, 2020 at 11:27 AM Steve Sakoman <steve@sakoman.com> wrote:
> > >
> > > Zhixiong Chi submitted a patch today to fix CVE-2020-16845.
> > >
> > > I don't see that referenced in your patch, so I assume we'll need to
> > > take both patches.
> >
> > right that will come with 1.14.7 update which is not yet proposed, so
> > I guess we should do that in master and then backport it to dunfell
> > instead as a follow up
> > I will send upgrade patch to oe-core/master
>
> No need, he's already submitted patches for master, dunfell, and zeus.
>

I was talking about upgrading go to 1.14.7 see [1] which should
address the CVE too

[1] https://patchwork.openembedded.org/patch/175232/

> Steve
>
>
> > > Will do an autobuilder test this morning with both applied.
> > >
> > > Steve
> > >
> > > On Tue, Aug 11, 2020 at 8:17 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > Includes security Fixes for CVE-2020-14039 and CVE-2020-15586
> > > >
> > > > (cherry picked from commit 97d5c2d1f2dffe2518f46bbe57cb9348eb59c633)
> > > > (cherry picked from commit 6591d269792fe864d7af4e379035f1cebc4510f5)
> > > > (cherry picked from commit c9011d04eb624aeabf5d707e88de80137bcc2eb1)
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/recipes-devtools/go/go-1.14.inc | 5 ++---
> > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
> > > > index c52593db6b..64c2768f7e 100644
> > > > --- a/meta/recipes-devtools/go/go-1.14.inc
> > > > +++ b/meta/recipes-devtools/go/go-1.14.inc
> > > > @@ -1,7 +1,7 @@
> > > >  require go-common.inc
> > > >
> > > >  GO_BASEVERSION = "1.14"
> > > > -GO_MINOR = ".1"
> > > > +GO_MINOR = ".6"
> > > >  PV .= "${GO_MINOR}"
> > > >  FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> > > >
> > > > @@ -18,5 +18,4 @@ SRC_URI += "\
> > > >      file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
> > > >  "
> > > >  SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
> > > > -
> > > > -SRC_URI[main.sha256sum] = "2ad2572115b0d1b4cb4c138e6b3a31cee6294cb48af75ee86bec3dca04507676"
> > > > +SRC_URI[main.sha256sum] = "73fc9d781815d411928eccb92bf20d5b4264797be69410eac854babe44c94c09"
> > > > --
> > > > 2.28.0
> > > >
> > > >
> > 
