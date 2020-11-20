Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web12.23684.1605870851823060422
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 03:14:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=gUFRQ7jt;
 spf=pass (domain: burtonini.com, ip: 209.85.167.41, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f41.google.com with SMTP id u19so12908011lfr.7
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 03:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JVopud5L5V5ROItemySsSo/A+CJ9j+B+5I0QN6l1u0U=;
        b=gUFRQ7jtb7QhPUgjbIKU42rjiWycHw2BXFnuHgTjN7ejj+TEA4nXf4wee4WVA8+55z
         Wx8ZXSwZ8dlh0eywBVcU0skvih2IghlC2J6cHniHdD1aiG6Fn1KsL/9UruAkbppqPGDi
         TJFXutUHG8hiMhOkJ8u7hB7vxh17gxiUhy2VAYG/+Yg64ym5oHWXUjKREHyNUtz9Ot13
         STrPsRaevnbeyKq/REVLbxawzLLBknYY6NiqUSJ/B7EoE+lYEzT4cn1KM5C+OYobGZ4b
         NkuT+Ollkk5Invmq5+2sY+rdC0kVuC2wxGNpVWX76RNFIMuWMp0b13gc5mAI0smxbn45
         R8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JVopud5L5V5ROItemySsSo/A+CJ9j+B+5I0QN6l1u0U=;
        b=j8jwjjUu2+pWrCku4QpM8zSQPDAzANBoVH8K9WV22HPxdfFnlT92jhCQB/H+LWJE3k
         w2sRdFJWWDLF6LYFzWiHZhKAJusSWUuxV6//L3uGBPpwANJ1XXGC4Dlo1+CnlFlWiPYp
         UmUC/8wVlYMFE7Eyl5D1fbPm0CpnS3TL4CUykKlYgKGbQ9+7uWhFLLmuXARrYMuWB7tj
         85UrxCqEzLG/guGUm16uJmtmfkgJ2cnCuEQi7ttbmKUIxpp7ws5TGFvvgusAoVdiTaII
         Sk+XabjqJ5CWKuQ8I+p3IUIsoAWsIv+MgzEgmwdR4zLWZDLS6ArQZAE50NDTwAXytgTV
         5Jcg==
X-Gm-Message-State: AOAM530nxzaxbsAcMkhZgktiSB9ACcTjPwJz5KHqB+N0gXeLnzW159c3
	vApdcEdTCpRXMKbF/dkTKz8VdurahX93SOEEgvD/4Q==
X-Google-Smtp-Source: ABdhPJzMDsEbsNmcM4dyk1ebYVHGcplspWL46VXa4EBrnUDmdkWuHwmnjwIz5Imen6piK7IJsrQi/09iK1LTyxQqV0c=
X-Received: by 2002:ac2:5dcb:: with SMTP id x11mr8217665lfq.44.1605870850109;
 Fri, 20 Nov 2020 03:14:10 -0800 (PST)
MIME-Version: 1.0
References: <20201119103813.2726273-1-ross.burton@arm.com> <20201119103813.2726273-3-ross.burton@arm.com>
 <CAOSpxdYRu4t85FLHB4W-_BFvP8amE2fkcgJ9taqTrvZ=8tRziQ@mail.gmail.com>
In-Reply-To: <CAOSpxdYRu4t85FLHB4W-_BFvP8amE2fkcgJ9taqTrvZ=8tRziQ@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 20 Nov 2020 11:13:58 +0000
Message-ID: <CAAnfSTuuecd0OPZ=B8DQKX-D+0B-=+aj5AxWF39=qD1+iy_Obg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] sqlite3: add CVE-2015-3717 to whitelist
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Yes, it is.

Ross

On Thu, 19 Nov 2020 at 15:04, Steve Sakoman <steve@sakoman.com> wrote:
>
> Is this also suitable for dunfell?
>
> Steve
>
> On Thu, Nov 19, 2020 at 12:38 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > As per https://groups.google.com/g/sqlite-dev/c/U7OjAbZO6LA this issue
> > is believed to be either iOS specific, or fixed in 3.8.9.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-support/sqlite/sqlite3_3.33.0.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-support/sqlite/sqlite3_3.33.0.bb b/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
> > index 611a1bd923a..33f041a161d 100644
> > --- a/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
> > +++ b/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
> > @@ -8,3 +8,5 @@ SRC_URI[sha256sum] = "106a2c48c7f75a298a7557bcc0d5f4f454e5b43811cc738b7ca294d695
> >
> >  # -19242 is only an issue in specific development branch commits
> >  CVE_CHECK_WHITELIST += "CVE-2019-19242"
> > +# This is believed to be iOS specific (https://groups.google.com/g/sqlite-dev/c/U7OjAbZO6LA)
> > +CVE_CHECK_WHITELIST += "CVE-2015-3717"
> > --
> > 2.25.1
> >
> >
> > 
> >
