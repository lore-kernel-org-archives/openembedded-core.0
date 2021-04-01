Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.6743.1617309034727317702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 13:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tQMPR3kq;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.45, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f45.google.com with SMTP id v11so2981057wro.7
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 13:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8D5VIL4ollbCmmXy5v+4mbJCDrcWofWeCiUJqzdZ/1I=;
        b=tQMPR3kq/thJt4Ha4JxvlhWyAx642GQWHQ5BsjCPdX+7a4hgmtrKrgOPvPEvWRzrVR
         oGeL5Qjj1JjPrKHQWjmrv0CvhDVfT9Zs0GM7VYuuKUfRdS2cFxN8yfgm1YSS3Xqye9uV
         VNS7VLAlGBeLb7w845mzu4H0LERLcOGdl+3GRV/I2WQtfeOaJThUNQUwJ4ZEf/z7mIyr
         tIQvd4Xzcna7s//odH+FaCo+FwSM5dVVqphWES+2KdgbxGIdn8iO9troips84/+v3dfi
         omkkxnTzPBBHXB5GCxyg1fl9hrpzLEDSIS84467IciAM2JVgD0Gp8lEmIX8Yn4qL95z3
         +5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8D5VIL4ollbCmmXy5v+4mbJCDrcWofWeCiUJqzdZ/1I=;
        b=h5ETS/iHajRlA7M9K0TJPj09NasSZSmBqylYzUDHR06B3MdadG/nurjMwRWPME/KQh
         rx0it/qVVC29FXbqNH5wq+x264Kno5V3cymeaWqXXj27uv7U6Y/1zgxBioHeLNpB1cjW
         hBG0KhKHy6fVwvuD3eThA2rh0wjkxutPetcS/RE6Kr740xVMZdo/Q2OItIflABqr7USH
         rWUV7roSVdhnQv6pq68Ltcl2BJyeJMc/YAqy0BVUvtLMXLJzb1YcIVVeF8ln3cDX6zkI
         lRtStXBA6ootv/YQk/E6cEuep1YUZUnIcWEH3jdr4b3/lhljmSvQnRzDrMvzOgkps7T7
         PUgg==
X-Gm-Message-State: AOAM533kHM7eCLx5msE1vqp4Ux4ezHyfiYAkWufow8QVTBr8Qdds0BSs
	pnMpe4o/CN1vcqRo0IZiDTbwfkSEqujUBzMIY3VwRQ==
X-Google-Smtp-Source: ABdhPJxuiD6Re9Xqvg27KCWI3JmsbvgqoHFQim9AM7BSMPiMGkzai4cJbdenITMQWx13/Z/tLKdYE2Jr8icSLSHRpM8=
X-Received: by 2002:adf:fcc7:: with SMTP id f7mr11808245wrs.400.1617309033092;
 Thu, 01 Apr 2021 13:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617290309.git.steve@sakoman.com> <cd4f70f47c82377d65c51a7c9a9759188dfbb5b1.1617290310.git.steve@sakoman.com>
 <CAJ86T=VowO_dOjSw-hSs2B+dnHwhnKcEiRoywhBwa_E7tWkMcQ@mail.gmail.com>
In-Reply-To: <CAJ86T=VowO_dOjSw-hSs2B+dnHwhnKcEiRoywhBwa_E7tWkMcQ@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 1 Apr 2021 10:30:20 -1000
Message-ID: <CAOSpxdZiyjWbhtfNdfLDseOt=Rg5dow0UY4EGUANjM5FRJtcbg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 13/15] packagegroups: delete useless "PROVIDES" lines
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 1, 2021 at 10:07 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Thu, Apr 1, 2021 at 8:29 AM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > From: "Robert P. J. Day" <rpjday@crashcourse.ca>
> >
> > There is apparently no functional value to "PROVIDES" lines anymore in
> > packagegroup recipe files, so remove the lonely couple of examples
> > left.
>
> Seems questionable for backporting to a stable release. The bogus
> PROVIDES lines have been there for more than a decade without causing
> any issues (ie removing them isn't fixing a bug).

My rationale for including this was that users often take our recipes
as templates for their own, so best we model good behavior :-)

But I don't feel strongly about it so I'll drop from my pull request.
That's what this review period is for, so thanks for taking a
thoughtful look at the patches!

Steve

> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 6f2c9602bc5fc6794b852ec20f40ea62a55ada1e)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/recipes-core/packagegroups/packagegroup-base.bb     | 1 -
> >  meta/recipes-core/packagegroups/packagegroup-core-nfs.bb | 1 -
> >  2 files changed, 2 deletions(-)
> >
> > diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
> > index 1f802da09b..c32664917f 100644
> > --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> > +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> > @@ -8,7 +8,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
> >
> >  inherit packagegroup
> >
> > -PROVIDES = "${PACKAGES}"
> >  PACKAGES = ' \
> >              packagegroup-base \
> >              packagegroup-base-extended \
> > diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
> > index b345e314ad..20fe6fc092 100644
> > --- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
> > +++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
> > @@ -7,7 +7,6 @@ PR = "r2"
> >
> >  inherit packagegroup
> >
> > -PROVIDES = "${PACKAGES}"
> >  PACKAGES = "${PN}-server ${PN}-client"
> >
> >  SUMMARY_${PN}-client = "NFS client"
> > --
> > 2.25.1
> >
> >
> > 
> >
