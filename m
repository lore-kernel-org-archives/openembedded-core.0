Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.51346.1590501566504672415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 06:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iTK6RiVY;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id l11so20555962wru.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 06:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=do0Aex632U3pZMekHZWOE2ewSAuUJZfFR7ivheY6cYU=;
        b=iTK6RiVYeZJtIBL3RYPgt3iPYN68l9rMwfJFa3LBwN3RWvPx5Zekrc1B0fyTHD6BIr
         PXB8hWPdQgYpTvsS4w5ZyL6LzmbgwtTjsF8cqIZwEnKMbEXGji13gVyuDUAOyqM5Fs62
         Xqb3mbzaIkRzRz5PlBpF9uKDDTUX3Ms+VGqHunYC6+u48Nj8cxA6iXGL4aicXlJVIXN3
         n4UHARdLVGRXMZ11qyRRV0L2jptxlB2GjSbV5GS6RA6SZMHr5Ubj0BhfbkRKIbwLKd8F
         JmA8ltem/jZdI8Ta4zlnBSarZshh5BqbcorJcf/SY3U5qkjL+7UP8UmRHxOaOj4uAC7o
         DGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=do0Aex632U3pZMekHZWOE2ewSAuUJZfFR7ivheY6cYU=;
        b=DogUEUMpWb5oJSAzVL3YYyLHpT91gfxx+hbJPYOi781MoAltDCUVo8rk4XML+fFDT3
         jTT+KYP5RMFmSSEMoHGVt+6K3TOlh4DD90TwXYcVGAYNQeNvZxNI14rnsRMqrsTBqjtO
         OMZPcqlSBi9dfMlgP0KOA/BuimSCaRGTUADFvkaSamCkt3K7S/97leJEetOKCeMQoCM7
         /GK234Pt2WFYOkqBAskeetJjSt/1334lLTJMDmbpHnKp6ohaRZX98FV79z1oWmfeZ/xS
         Auh2hexM8fSLZKYViWDuxhRjs/gMHyY1KZA0+XGB9tVOO+gYVlPCzo/D19a88A2DGk/v
         8DMg==
X-Gm-Message-State: AOAM530OIh+5qDp45WghM+XMKxAMxAwBIGPR9fSFAT/H22sUTuMLFOCP
	XdavUlMGouszSzJ5N+q6Q5pGmnqIXUlfI24o3zE=
X-Google-Smtp-Source: ABdhPJxCwOIvWTE3PFY2XDeqsibSqo79+PDsBhoUNK8g73PhzuALmYqDeun4ydzBceEzpUb8h+mBef28mL0cFYmw8kY=
X-Received: by 2002:adf:e64b:: with SMTP id b11mr19316988wrn.402.1590501564858;
 Tue, 26 May 2020 06:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590445868.git.steve@sakoman.com> <c93720849b68369f9c01c620581226dbfe200303.1590445868.git.steve@sakoman.com>
 <CAM9ZRVuF0qqniEnBW1eCiTuwbaPEh5BdvB74Ds_1084DQ8MXZQ@mail.gmail.com>
In-Reply-To: <CAM9ZRVuF0qqniEnBW1eCiTuwbaPEh5BdvB74Ds_1084DQ8MXZQ@mail.gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Tue, 26 May 2020 03:59:13 -1000
Message-ID: <CAGDS+n=b2hez8zjvVboHv9D68g_OKddu3miajF0S=7Ji9oYkOg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 14/17] newlib: Upgrade to latest yearly release 3.3.0
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 25, 2020 at 10:31 PM Paul Barker <pbarker@konsulko.com> wrote:
>
> On Mon, 25 May 2020 at 23:37, Steve Sakoman <steve@sakoman.com> wrote:
> >
> > From: Alejandro Hernandez <alejandro@enedino.org>
> >
> > Upgrade to the latest snapshot, also drop md5sum while were at it.
> >
> > (From OE-Core rev: d73aa359e42e707dbc7cfa29c55a2fc8e6bb938a)
> >
> > Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
> > Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  .../newlib/{libgloss_3.2.0.bb => libgloss_3.3.0.bb}            | 0
> >  meta/recipes-core/newlib/newlib.inc                            | 3 +--
> >  meta/recipes-core/newlib/{newlib_3.2.0.bb => newlib_3.3.0.bb}  | 0
> >  3 files changed, 1 insertion(+), 2 deletions(-)
> >  rename meta/recipes-core/newlib/{libgloss_3.2.0.bb => libgloss_3.3.0.bb} (100%)
> >  rename meta/recipes-core/newlib/{newlib_3.2.0.bb => newlib_3.3.0.bb} (100%)
> >
> > diff --git a/meta/recipes-core/newlib/libgloss_3.2.0.bb b/meta/recipes-core/newlib/libgloss_3.3.0.bb
> > similarity index 100%
> > rename from meta/recipes-core/newlib/libgloss_3.2.0.bb
> > rename to meta/recipes-core/newlib/libgloss_3.3.0.bb
> > diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
> > index 5edea8aba1..96e230f985 100644
> > --- a/meta/recipes-core/newlib/newlib.inc
> > +++ b/meta/recipes-core/newlib/newlib.inc
> > @@ -16,8 +16,7 @@ LIC_FILES_CHKSUM = " \
> >                 "
> >
> >  SRC_URI = "https://sourceware.org/pub/newlib/newlib-${PV}.tar.gz"
> > -SRC_URI[md5sum] = "afb3a01c8c82b6717ea55659a4de30ec"
> > -SRC_URI[sha256sum] = "f7b2322964a1e3b37bec0768da20f50dfb62247d729110974dd95756a53bb6d4"
> > +SRC_URI[sha256sum] = "58dd9e3eaedf519360d92d84205c3deef0b3fc286685d1c562e245914ef72c66"
> >
> >  INHIBIT_DEFAULT_DEPS = "1"
> >  DEPENDS = "virtual/${TARGET_PREFIX}gcc"
> > diff --git a/meta/recipes-core/newlib/newlib_3.2.0.bb b/meta/recipes-core/newlib/newlib_3.3.0.bb
> > similarity index 100%
> > rename from meta/recipes-core/newlib/newlib_3.2.0.bb
> > rename to meta/recipes-core/newlib/newlib_3.3.0.bb
> > --
> > 2.17.1
>
> NACK: https://lists.openembedded.org/g/openembedded-core/message/137847

Thanks Paul!  I agree of course ;-)

I'll drop this patch in my final merge request.

Steve
