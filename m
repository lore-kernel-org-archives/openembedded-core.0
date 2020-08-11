Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.1628.1597171002912123193
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 11:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WOyla0AN;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id m7so12557025qki.12
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 11:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Eov0w/wXxKEvIMCYagiq1bQKCngVRR7cy9tesKnbI20=;
        b=WOyla0ANNBOGo/mFIJLsla4c/EU8pEO1FQ3X40N2lvZmW6IpJi2LF2Oj9yEHYR37ju
         WVkKYbLLacTB9mgIWMwRboGnaQzv0zDUF0ARhtJI7LelLOTQRtpsKKP67ABQIYzIycwH
         1aEG7eSfxTh6tYO/gui0thkuVVtQY1tPyT0OmprdcdRmte9cA8+4KFwS8S96OWnOPXD2
         hPa4B6Z6F2o82aJTnCAoPF2LzM/6U3XBjUV69D+fkedi9oDALbD5REmOs892cIwP02PE
         hienUso4EzEYEVowRvRlldsxaqOYZhE8hHc6CZNbOaz2kqePAuUIXhP1lT3wRrymLKDZ
         4DoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eov0w/wXxKEvIMCYagiq1bQKCngVRR7cy9tesKnbI20=;
        b=rPueNN7wVvL6NZEtOiy0f/089vWjhW1+nQ2u9JSYr9oTCgZ7Fecp8rxWUV51448gT4
         QKPHT43newTGIzkUkt7PTzLD80oqcWnv/eHZ99O87co/hLPInLEB3hiNZtdSiRfpLRr8
         ooiK8ISyetRFn03PWgIZJlt0+65A54A0m76+OBg+xzu5F4rXAUBTNHOEG47z2FCj0XEk
         mXOxRk3x93jG989cRcppkHSo/hte29VsHkAGxA+fQmVcZ1IMd9u2gsAFwu5lccniW2Z+
         UPtnRM4d3bVJwUYTjRWT/6nbkVpUMKls6nAi9SgHAI/LcWgBZwkswTPx9fGSUK/aY85B
         VTsw==
X-Gm-Message-State: AOAM530WYRkkfGTK8jXnm0iN46NYNK4rG6s1aOrOVF2lFUwl4lqCCG5J
	sbwI5MyULBu79+rHNDiVNjGi6/T3bl2N77CvIpG0+Cce
X-Google-Smtp-Source: ABdhPJwORkvsK2l/o51xpw0Y7gIAUq1VTmbLDzqzJ151LW+7/mMukqRHkyR2k7Eoa0Fl5q9O5xCNduD34KZSfVRKz1Q=
X-Received: by 2002:a37:7081:: with SMTP id l123mr2476810qkc.225.1597171001924;
 Tue, 11 Aug 2020 11:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200811181701.2638189-1-raj.khem@gmail.com> <CAOSpxdaJtBOv18SzU0nDdQpAPMdaErFx4U8VGEBDNtb-=fDogg@mail.gmail.com>
In-Reply-To: <CAOSpxdaJtBOv18SzU0nDdQpAPMdaErFx4U8VGEBDNtb-=fDogg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 11 Aug 2020 11:36:15 -0700
Message-ID: <CAMKF1sp4E3p_cmgrDXEQ3c_VnQ3s+O7pE22etBm2nJUrHZ3_Qg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] go: update 1.14.4 -> 1.14.6
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Zhixiong Chi <zhixiong.chi@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 11, 2020 at 11:27 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> Zhixiong Chi submitted a patch today to fix CVE-2020-16845.
>
> I don't see that referenced in your patch, so I assume we'll need to
> take both patches.

right that will come with 1.14.7 update which is not yet proposed, so
I guess we should do that in master and then backport it to dunfell
instead as a follow up
I will send upgrade patch to oe-core/master

>
> Will do an autobuilder test this morning with both applied.
>
> Steve
>
> On Tue, Aug 11, 2020 at 8:17 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Includes security Fixes for CVE-2020-14039 and CVE-2020-15586
> >
> > (cherry picked from commit 97d5c2d1f2dffe2518f46bbe57cb9348eb59c633)
> > (cherry picked from commit 6591d269792fe864d7af4e379035f1cebc4510f5)
> > (cherry picked from commit c9011d04eb624aeabf5d707e88de80137bcc2eb1)
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/go/go-1.14.inc | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
> > index c52593db6b..64c2768f7e 100644
> > --- a/meta/recipes-devtools/go/go-1.14.inc
> > +++ b/meta/recipes-devtools/go/go-1.14.inc
> > @@ -1,7 +1,7 @@
> >  require go-common.inc
> >
> >  GO_BASEVERSION = "1.14"
> > -GO_MINOR = ".1"
> > +GO_MINOR = ".6"
> >  PV .= "${GO_MINOR}"
> >  FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> >
> > @@ -18,5 +18,4 @@ SRC_URI += "\
> >      file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
> >  "
> >  SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
> > -
> > -SRC_URI[main.sha256sum] = "2ad2572115b0d1b4cb4c138e6b3a31cee6294cb48af75ee86bec3dca04507676"
> > +SRC_URI[main.sha256sum] = "73fc9d781815d411928eccb92bf20d5b4264797be69410eac854babe44c94c09"
> > --
> > 2.28.0
> >
> > 
