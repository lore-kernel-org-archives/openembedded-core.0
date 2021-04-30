Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.13719.1619797995233159403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 08:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iPucRkZ3;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.49, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f49.google.com with SMTP id x7so71052849wrw.10
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 08:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oxRuHE2UtHTBF9G/nNBKMmdzyNnuWFTtg1zgR5ePXrY=;
        b=iPucRkZ3v+m5xLHLwEzPZIM67vz09l4aYVwevL4j3wy5wZ5aCeerUdkT7Gw8kLFJKZ
         mcS0JEw5BQprk+kK7JRFQxBGkQscvvq5uUSnU3AYBEkQEgA01bVYyZD6ZNiGmzn+o8il
         T0Z2s/+7qCPulHqKQtiHmcUR4Ii8AV7Onmrficq6BTbCgpnwNI6mcu00egCXTBn21YCm
         6+GMKkLhvAH6l89V8oAwAufxlzsHhSASP8uIpEh9vh5N0fr98tsuInHxymtiuYqntNgL
         3FCSuQezmvfzmDYqoBR+fNwgG2ZEIItSyPy3tsVc/JzxCzcs3DTkuPH96h8WivwQ5H6I
         JwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oxRuHE2UtHTBF9G/nNBKMmdzyNnuWFTtg1zgR5ePXrY=;
        b=aOD5NPfHgMTZ1erk9dZO5sGj0Y5zU0NCmywHFjIngLXWdp3doWiMn2j/d56A1kyciv
         Po1b6L2viai5oDSPlHqe6e4N+frz5WtGkCPX5PhScEp4kZPSg80QhD6+be/aUsBOQSKG
         k9YwpF1KvTNthkpxEDl+56kYR3kOMJFTRM7epJLbiZufBGOk5yyzpBShDTxPDLrcHqBs
         BsEm1ud++7sSCq52JrUKbkvH+xu1synuSllt2H4caaghb+o7grptzb8BsuWvT0gd6ymT
         iiGRrhTa1S5uv3FJOMylfb/jEQabar37vHBr7+jaqR5xV6EGCWYPMCZ284s30k2tG7eM
         4B1A==
X-Gm-Message-State: AOAM532w4TGUROw8IlJBQxUVdkaAm+/DNzev4wYYtFZmitqIe5lCKg7j
	WsluZ+BhzkFQGoE2uYvu6/pgyHO+6suZHGc8x+HuvA==
X-Google-Smtp-Source: ABdhPJzccPPzKL5ozDnRV55gBjdYGYwzb7aPTOLki4RyIcRYq51WnW1veqiyhl1+oLVqX0/YMZBN8txOmdaDSWeOAsA=
X-Received: by 2002:adf:ee83:: with SMTP id b3mr7708403wro.329.1619797993578;
 Fri, 30 Apr 2021 08:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619796615.git.steve@sakoman.com> <327b83f6460dc069f22e1ce68f09af12d25ce4bb.1619796615.git.steve@sakoman.com>
 <01250a308dc7b262963fae41d95c0f1d68b455e6.camel@linuxfoundation.org>
In-Reply-To: <01250a308dc7b262963fae41d95c0f1d68b455e6.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 30 Apr 2021 05:53:01 -1000
Message-ID: <CAOSpxdZpcGXGP_yFzCaneJHwQ+B9_J36c_xoYEeoCKhEigk3FQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 07/12] go: Use dl.google.com for SRC_URI
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 30, 2021 at 5:44 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2021-04-30 at 05:33 -1000, Steve Sakoman wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > golang.org/dl is resolving to this anyway
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 8470e38ac1d9f9bb6d8a4ee43724af452d080057)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/recipes-devtools/go/go-common.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
> > index 39a681a712..c368b95b69 100644
> > --- a/meta/recipes-devtools/go/go-common.inc
> > +++ b/meta/recipes-devtools/go/go-common.inc
> > @@ -14,7 +14,7 @@ LICENSE = "BSD-3-Clause"
> >
> >
> >
> >
> >  inherit goarch
> >
> >
> >
> >
> > -SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main"
> > +SRC_URI = "https://dl.google.com/go/go${PV}.src.tar.gz;name=main"
> >  S = "${WORKDIR}/go"
> >  B = "${S}"
> >  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
>
>
> We are seeing autobuilder issues with some go downloads which we may want to
> resolve before merging this.

OK, haven't seen those with dunfell but will drop this patch from the
pull request and monitor master for resolution.

Steve
