Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web12.14413.1607090838998548347
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 06:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=btqdeJnf;
 spf=pass (domain: burtonini.com, ip: 209.85.208.193, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f193.google.com with SMTP id o24so6764091ljj.6
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 06:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BcofiQFxFwbUgNWU7ezuNPwrLxng3mnk+myFVQpu3G4=;
        b=btqdeJnfxUqJD79gFOIClsrksOPF0BtmYojnWZIY//3JYNTbyC3Hi329C8dvZL2rwj
         lUOVj99TGcCk2YydknSSiNFfkOcf2O7MypK+/9Psvd0EjJrwb57cqSRBvCRCwL0twtC5
         SMhSg9d0dV5nTFfC9D9viMe7YKHqqJu5ih6deE389ZEvgCBbHp3fr5SgQmNad+65olN5
         1cshrmSfIgWPXajSI0hgBBPahbdHCC4bD7+5+WIDEOedujel6F92++j6SQSd98dEgWaN
         toX0vumWzYNStaUss8hKFPcgzV5zC1tosXWrjgQMEz8qHV1xTpiuIy9L1dBZUEJ+xu5G
         es+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BcofiQFxFwbUgNWU7ezuNPwrLxng3mnk+myFVQpu3G4=;
        b=GJHmHARZN7CS42yMdh61h1CRqV/k9bPs+cJuEV2Wlhmw5Jl6LAQJrD7l/LOX7tdHzH
         ApP9+Hc1MzUEGGc38ypbIdfOw8r2Jzl+qNUvL1qfvKXpgA7ToCDcN1IsRxxyHL3yxzq2
         tLCez2djlFJfnnojloC1Nbw+lDQVqxsS0ftrVkQWSkOx3CjgbiKT38g+bAsnIEAxHN/I
         UTKDaskxyoqoEBX1mm6sgJRVQWxvgABHY0oCqHlpBRCZFncXhLn6FkJx+Utqdqp4bUWo
         R7Yrq+qy4YRiZZKSJcV+zgEfxeyrsQlYBUJ3yUSdapWHTFr1x81mOZAAkweYioOO+Qkd
         RLEA==
X-Gm-Message-State: AOAM533uFIFJQP94lEAPZ6UMOnpBGafO1Bd9cTVtU0iWLbMJbWhYayqd
	HWHHcMBWPpPKCQXDYPPPFsi90IgVpPrIx+QQFhJ2+A==
X-Google-Smtp-Source: ABdhPJxzsuLUubdQe7fJvnBNJEhYWIeIKYgVaQeqvG4KveTlWfLUIlusjI5Gi48Z6HQ8R/ClC31Gs0CpR18WwP/BcP4=
X-Received: by 2002:a2e:b4ed:: with SMTP id s13mr3553489ljm.22.1607090836939;
 Fri, 04 Dec 2020 06:07:16 -0800 (PST)
MIME-Version: 1.0
References: <20201203161611.1346206-1-ross.burton@arm.com> <ad40fd1f62c7d837ca8052a2931f73fda43dba7c.camel@linuxfoundation.org>
In-Reply-To: <ad40fd1f62c7d837ca8052a2931f73fda43dba7c.camel@linuxfoundation.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 4 Dec 2020 14:07:03 +0000
Message-ID: <CAAnfSTtrG4bQkEuj10dXD1wBCh1UzkHL5ai6HO5e=4GxNcqYdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/containerimage: update for improved cleanup
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Anibal Limon <anibal.limon@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Argh, sorry.  Meant to run it through a selftest before posting, but forgot.

Ross

On Fri, 4 Dec 2020 at 05:04, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-12-03 at 16:16 +0000, Ross Burton wrote:
> > ldconfig/aux-cache isn't generated anymore, and the opkg directories
> > are correctly removed now.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/containerimage.py | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py
> > b/meta/lib/oeqa/selftest/cases/containerimage.py
> > index 4ad7f0e654..5d498f5bf2 100644
> > --- a/meta/lib/oeqa/selftest/cases/containerimage.py
> > +++ b/meta/lib/oeqa/selftest/cases/containerimage.py
> > @@ -58,13 +58,7 @@ IMAGE_INSTALL_remove = "ssh-pregen-hostkeys"
> >                      '.{sysconfdir}/ld.so.cache',
> >                      '.{sysconfdir}/timestamp',
> >                      '.{sysconfdir}/version',
> > -                    './run/',
> > -                    '.{localstatedir}/cache/',
> > -                    '.{localstatedir}/cache/ldconfig/',
> > -                    '.{localstatedir}/cache/ldconfig/aux-cache',
> > -                    '.{localstatedir}/cache/opkg/',
> > -                    '.{localstatedir}/lib/',
> > -                    '.{localstatedir}/lib/opkg/'
> > +                    './run/'
> >                  ]
> >
>
> Nearly, but:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1602/steps/15/logs/stdio
>
> I've a fixup I'll test and squash in -next.
>
> Cheers,
>
> Richard
>
