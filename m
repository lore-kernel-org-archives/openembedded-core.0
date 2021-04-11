Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.25209.1618183251498111570
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Apr 2021 16:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wks+IBI9;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id q3so11573104qkq.12
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Apr 2021 16:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MbHCO3lS0goCVt1ZgXWGcIgdrkIqtBLRUxmV39j+kYY=;
        b=Wks+IBI9KCh/Ba8WkLpuyTNrRT4uEwtLT3tr7bBuEBq8HzTeyNaoq5ED1JbD3bQfgp
         dVE18BYCVp9Q7FhhhWcNyhTb1V5VeaGn1EpYXTuvL+H86ZPge3oFtEy9tsKiIUQQncH1
         R7eDpfhuTzbIetUMG6larIfp7XTJhZ5upesNPavMvScoepNs24OFJnBFJGe/QjVAazkB
         2yBCcAVZ3dTvsQZEpcmAcSaLecJUWqjxcLYhGmjl41Bx0QIUsRoEKNlbBnHu396ZRa/B
         BCrOAmcpvj5RcLI/k2ujqFP6v6CRARxXn6m9ZXH0coyvKtV/LM/bncHTEDky2ccJRB2C
         sHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MbHCO3lS0goCVt1ZgXWGcIgdrkIqtBLRUxmV39j+kYY=;
        b=OgT1LZ0AVPeoEWqjJ2mrwodIz7sGxzCtLoyzVlueU/27HKvAZhv1Jk9Tbr5jTeCCT6
         ZV6G0avZ4+wXSTG/AteKB/yTxmdP4LHalbC0D2w6emrEVX1aDsrpZM1b+AgrTiCLK0CT
         czIQzNbcnxz8GuanAe0yGCaJT/a8EGjqlFMhEVLCG9yUJIzLorOEDQO435BpzZW+Y6ww
         YP3k/4pMyFdbEeKLw0eA8c46yWv9wkBOyjPUR52BW28rrhpImPtl2h/F4QJifkE0DdNI
         WPACntTgYd2OcUKiVFHRG9+4gL3n4hJzzs54FwXMTZ6cKj8CPfkptNhA14Vokf691H6g
         Zq4w==
X-Gm-Message-State: AOAM530ZuKvqxDzLfkn8lzGeSp0LdF8WW5M/r8Azq3qYsHmiv27R64Yl
	qaFy3SoTaYFAnKhbXHnlgVKuf8MOj2d/3eSsu8o=
X-Google-Smtp-Source: ABdhPJz4KnRbXYkeg3PSwpjHILSGZ5SoYsJIInhT344t1c6Ro3WcKFq1cJ0cY4UNz819W1BM5B1F/mK09yEimYy4sB4=
X-Received: by 2002:a37:8ec4:: with SMTP id q187mr24346188qkd.381.1618183250601;
 Sun, 11 Apr 2021 16:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210411202746.388822-1-raj.khem@gmail.com> <dd4c72b2aaf48cb7f015030e232bc2641e38f2ef.camel@linuxfoundation.org>
In-Reply-To: <dd4c72b2aaf48cb7f015030e232bc2641e38f2ef.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 11 Apr 2021 16:20:24 -0700
Message-ID: <CAMKF1spL71KJfmpPT7F09gc=RB8NPgKFRewAtHhj7bFNp-H8Sg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] gcc: Upgrade to 10.3.0 bug-fix release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 11, 2021 at 3:12 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2021-04-11 at 13:27 -0700, Khem Raj wrote:
> > Drop aarch64 backports which are already upstream
> > List of bugs fixed is [1]
> >
> > [1] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=298084&resolution=FIXED&target_milestone=10.3
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Fix BINV
> > v3: Fix maintainer entry to use PV
> >     Fix include poison patch which was old version
>
> Not sure we can put PV into a maintainer's entry like that as it is in the global
> namespace, it isn't gcc specific.

I checked it with bitbake -e and seems to be effective.

>
> I also couldn't get this patch to apply, is it on a branch somewhere?
>]

Its on kraj/gcc11 branch on contrib tree

https://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc11

> Cheers,
>
> Richard
>
