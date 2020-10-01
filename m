Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.3453.1601583651582073497
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 13:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=WhDvznRb;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id u4so5740230ljd.10
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2020 13:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I0ECgu7x6wViassZ8Ech5clzAP1re9sv70etx5EQDhg=;
        b=WhDvznRbWmwvlZREfL55wdwsc7/BnQ29Bf+ayiiCdxgbg7seUm2Hsu2yr9UTx1SgVl
         NgRIcbTp2rkOdm543g3ICgyqc6WCs8ei1w3nvyc4LpMVcsRyv4/f2qTKqyEmxjd6BOrg
         4jARMfvsN111Yv2Su4FrUNfPTu+0XvQhu+hOeewmpgWlfrLKHW1O1e4QZAmPmNTVQmB0
         I8pOwbeAH8U4JcNu6+JwkNjWrQ7obEbKJ9pDb3+c/bXcSYZZC5GUGant+SFGRFUcUb3S
         Dwon6l5w3CdQrrZG8uFdRXlSZsj5ZGiAhrPbeANg64dxwAAdoaatYA86exEGxlkC/1Xy
         M/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I0ECgu7x6wViassZ8Ech5clzAP1re9sv70etx5EQDhg=;
        b=opn4ImiO359ycw2Y+k9r/gxVrLIHaVe422waeEtCGTTTjF4FSh3csuwySgyyj5wu6J
         aqhTr8xY8BYkpu+R39UgWBiNdOB4l7cL7Dwh4L7KLNCDMquq/yYuXCRcAUgjVcZPvA2f
         gIMSqiX6TUfHu9aB/+raqGML4eyVDlUPBmTon6bfx8xfkeqU1+gArAlnKlhnPh9bOMXA
         LHYVcyltYV6X3GWyx9r03piKgV7VmRu5VsjHU4jxaUEvtIFmuLJlQRbI3FAaI824Uc6U
         ig16WCp7VsqCZVxI0fLTfQKJORXlDtZiFqLzPhNMIODwDKMhSSpocKnqFgOv6BbBe4cJ
         0C0g==
X-Gm-Message-State: AOAM530BoeBGT+9SnAnQXoT3acW6NawqtB9pfNMy8Rln91UEBDN5ESXm
	rbV3j+xFTNVv3C6vi9epgbHf/gPTzM/M50FtRQAqGw==
X-Google-Smtp-Source: ABdhPJxqRzzt2Biq4UpkxvQRxFrLHBA33XtocFZLRZGMb6KrKfrNboFhUhq8992XYTssgHgymAeAlmjKKL5rg/ZBOuA=
X-Received: by 2002:a2e:b80a:: with SMTP id u10mr3044716ljo.22.1601583649496;
 Thu, 01 Oct 2020 13:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201001161111.2889773-1-ross.burton@arm.com> <9d4997385b6095a0569babae0eb1241274cd9e2e.camel@linuxfoundation.org>
In-Reply-To: <9d4997385b6095a0569babae0eb1241274cd9e2e.camel@linuxfoundation.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 1 Oct 2020 21:20:38 +0100
Message-ID: <CAAnfSTtumHZnTF82Cb4n1mrvmst3+=R32rsqf8fCy++xKnQSSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] coreutils: improve coreutils-ptest RDEPENDS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2020 at 18:07, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> When you tested that, did you actually test an image just with the
> coreutils ptest installed? That was how we exposed this originally and
> without it, the test results werent' consistent.

Yes, core-image-base with coreutils-ptest installed.  I can try again
with core-image-minimal if you have concerns?

Ross
