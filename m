Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web12.2088.1608249778430704866
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 16:02:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O0ayDRAS;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id x26so462023vsq.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 16:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xamwuKfOsOWcAZmgQRZL5DBXuD3MrvhcswVUZ9gNIo8=;
        b=O0ayDRASg5ER7EQjF+GxjF6AtbxSMLRchVS+8mWVC8+itwagzoJslTA1jvFaOFyu2n
         ZqV37RAbillxOdCEj8m2PNCPWI3XF2f/Ejy4rPIG7u9qfO/s3B0BLEYrCTe+BSXCO73D
         qwwOS/pYk2exakV3cobjzCJjs3uHbbTOBG1+IPlSSZlQ1VbAYhKfW9uwSR99Ds4Sb3tI
         XviueaQV5PbdbgEeaTxLTxzGgac/aSeozIw8D0eGSI55X2sJ1dSp+e6oEA8e+tx7flar
         Tk3LN8RGkV/V12I9OMqS0eAEpMMR3W3zI9m+eg/PY+EzkkTaeDwt5TSbTVTs6pCAcgbk
         XatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xamwuKfOsOWcAZmgQRZL5DBXuD3MrvhcswVUZ9gNIo8=;
        b=pJJuW/61sNHicT6rw5kdzqW00jCDeWayeo3whAiZJWRC2BELHInGnLuXQoubo8NHTr
         9wmoJ1gyiKVmZkfGetbgtFg7Thuc7x29qHixatjoDp+8nHPaONArsbRI6pmME8bM2aG2
         1Mm0MG9t1G/i5U7XAoH5QVZDaqSN9Cij8nAHTrvlDKfVeCmsZzGBVxeKNLXG/q0KMyc4
         /AoS2XftY2FdidQ0gI8mlYKeDyp80gqS4dMJ8rqeudGieqtLzDPsP9673dKAXS3zAYZr
         XESlO2cSalf21zZRcAfLYbnBd4kfOprHLIsW3vTdLSINjBk3K2393jxEsxwhNv0rgVy6
         X++Q==
X-Gm-Message-State: AOAM533qV9m7zOgsM9XwrVhVpS3jwrEwFosxJblaYldYh2+MxJcRCdVm
	C9At/GlGt0hCWNLZHxIvYRXTI4DNgTMdi+uv3dw=
X-Google-Smtp-Source: ABdhPJzyFzdRiWwephbEUZBx0vOlFPHDrFCBZk7ajCD6gdUYbtuJbJdymMfZ85kdcgmngudc3YdHBUplxt8pK1yhZxQ=
X-Received: by 2002:a67:fb46:: with SMTP id e6mr1864393vsr.0.1608249777585;
 Thu, 17 Dec 2020 16:02:57 -0800 (PST)
MIME-Version: 1.0
References: <20201217225440.2633474-1-raj.khem@gmail.com> <CAJ86T=XXi5NtoFoQvTzuQe04gvBPizW6jjin2JkUovLCOti9MA@mail.gmail.com>
 <CAMKF1spNRZcLNFK3t-QQxHbV4UdOesJe6RAniYBezcJvc+yOLw@mail.gmail.com>
In-Reply-To: <CAMKF1spNRZcLNFK3t-QQxHbV4UdOesJe6RAniYBezcJvc+yOLw@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 17 Dec 2020 16:02:46 -0800
Message-ID: <CAJ86T=U04Ny3=sS+oJ=PJ-HfE6de+q176+UMgEguS5qcJqBWKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] initscripts: use quotes for shell variable comparision
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 17, 2020 at 3:54 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Dec 17, 2020 at 3:51 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > On Thu, Dec 17, 2020 at 2:54 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Helps to execute it with busybox shell
> >
> > How does it help? Adding quotes would help if $rootcheck is an empty
> > string, but that's not specific to busybox.
> >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
> > > index 02f0351fcb..a63e71b780 100755
> > > --- a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
> > > +++ b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
> > > @@ -74,7 +74,7 @@ test "$VERBOSE" != no && echo "Activating swap"
> > >  #
> > >  # Check the root filesystem.
> > >  #
> > > -if test -f /fastboot || test $rootcheck = no
> > > +if test -f /fastboot || test "$rootcheck" = "no"
> > >  then
> > >    test $rootcheck = yes && echo "Fast boot, no filesystem check"
> >
> > Doesn't this instance need to be quoted too?
>
> yes infact there are more cleanup to follow, this series just fixed
> default boot errors on reference images.

Adding quotes around a variable should probably be done consistently,
so maybe it makes sense to hold off on this one until you've finished
the cleanup?
