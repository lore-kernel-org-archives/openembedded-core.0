Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.7909.1631849393745734998
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 20:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R51gltlE;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id v5so24287307edc.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 20:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8dykkCnGXwuNj1Z4JqxggsnQF7oXZfz0ctLQHg6fPiY=;
        b=R51gltlEZR0tyuM0vk7l7WGkjhaz+YSr9oWjR5mitkEcqt2G3aAzS5k/i+SLtdlvsT
         fu4LA7Q3oXePzdUPBikpxacSuGSYqwcCy0zkSSaADxvx7ViXucZiNOP3z7Sfx+/QHvex
         A+BvsGyLPxml2X1Ty9/cAdBqPo5cBECQxb5y42URQ4ZBBbPkJiJY79Swb/O7ONL8Ipsi
         EoiCDIy+Q1+O+ssyfCzspYFRDNbb55s1aHhHMJ9ycpWcY6VzDmmCpLQXAsp3ARQNLjlr
         aOaJtBRyFmobUkOL3hmw0X8jcv3DmUGKtUNZGlAiZ2FxF5J1O7MmUnboKOl7a/pBE+Gt
         cYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8dykkCnGXwuNj1Z4JqxggsnQF7oXZfz0ctLQHg6fPiY=;
        b=nsAQqb5Z70Iyfr2lJBoIAfXM0AxoVFURYk7jUkwXAC/e8QOFakafsLrKk9RQA6beF0
         +nXWyRWQFinVRRvXTeSsaCCMnqGYygsmRIRkfSCVXyjp0PtDK0Ms1YOooiAY4pOJZ3ys
         Mu30oG5YKEpxuGcABqlfKYEyALsflmqrwQze1EZaZaC+P3H0RZN7ebfKe55W4cwFvgY4
         uw5COCzBMrPpETZi9h0T9XakL/J+/kGn/JF3lA0bhgl6BOzbUBQCRNs+DmEWXtFzQFok
         G1tU4of9XQd/bHbyfMRfjc2cAnPLGlxOTxFdH9utxjTYx0bLtrerkNXtep1L4UKHnBW6
         3u+Q==
X-Gm-Message-State: AOAM530bP6L73j+GelLPfXTJd67xz0LcFQ0fiOoNAYqtOk4hSf3YmWRI
	CJPB5G8KMospWh1HqqOdyCLc20GBJ0kwqwD+k6k=
X-Google-Smtp-Source: ABdhPJxpVkELoE2yv30Qv3SM7IXj+p9Z4/VxonfrFc9OIbLQGIhrIw16MIb/S65xkTOdNYqjvcSKzBiLW4ULRG4mxXM=
X-Received: by 2002:a17:906:314e:: with SMTP id e14mr9951378eje.165.1631849391822;
 Thu, 16 Sep 2021 20:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210916224010.21213-1-jdmason@kudzu.us> <20210916224010.21213-2-jdmason@kudzu.us>
 <24d4a049-fe3a-f8c0-54e9-e02b8d03289c@gmail.com>
In-Reply-To: <24d4a049-fe3a-f8c0-54e9-e02b8d03289c@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 16 Sep 2021 23:29:40 -0400
Message-ID: <CADkTA4MQNPKpS=hc2U2=PqWDQX4+ZkRXr-G8anuqXdF7HJ+i4Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] README: update mailing list address
To: Armin Kuster <akuster808@gmail.com>
Cc: Jon Mason <jdmason@kudzu.us>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 16, 2021 at 8:08 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> If you are updating this, please check with Bruce on which  mail address
> he prefers.
>
> It may bounce from windriver.

It definitely will!

I noticed that when scanning the patch as well. I could have sworn I
grep'd and fixed all of those old addresses.

Jon: if you want, you could put in my gmail address, or I'll follow up
and do that.

>
> -armin
>
>
>
> On 9/16/21 3:40 PM, Jon Mason wrote:
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> >  meta-yocto-bsp/README.hardware.md | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-yocto-bsp/README.hardware.md b/meta-yocto-bsp/README.hardware.md
> > index 9803af006ae7..095815e1bca2 100644
> > --- a/meta-yocto-bsp/README.hardware.md
> > +++ b/meta-yocto-bsp/README.hardware.md
> > @@ -37,7 +37,7 @@ variable value corresponding to the board is given in brackets.
> >  Reference Board Maintenance
> >  ===========================
> >
> > -Send pull requests, patches, comments or questions about meta-yocto-bsps to poky@yoctoproject.org
> > +Send pull requests, patches, comments or questions about meta-yocto-bsps to poky@lists.yoctoproject.org
> >
> >  Maintainers: Kevin Hao <kexin.hao@windriver.com>
> >               Bruce Ashfield <bruce.ashfield@windriver.com>
> >
> >
> >
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
