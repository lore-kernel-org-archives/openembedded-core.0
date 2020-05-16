Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.4618.1589592130500732102
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 18:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A0417UNf;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id e16so5457798wra.7
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 18:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TNAB6vJg7ImiyF97zXfnzvqwQUZdW3YJTfNKYsQjKkA=;
        b=A0417UNfpGschD9l3QPHPpl1cOFErDiSCV0imM/Jt8900OykJFQvhyNxAZYUjgQ2Jt
         i6EoX6AEd1rDT50QiCnpBcN0Fr0ge4uwQ343hwlSTZvPeEbIWKGcrmhzQ1GmJSK54DbO
         pwQsPmh4OHtPuI5tJkgWtyR/N6LYeTY/7tRewMw6xRPSj7KYvfIpoBg3TxLdJYXyzUYG
         s27778ng7211NjNS0kXPSjTjxnDPWXelwwOTkHvn+P5rirBHdihA+cxh7bfUWCnkrV/Q
         WywNOwsRXsaKxY1TqMtNfdTHMTAjr7f/tdNexeZjsjaLgZhOQp9s0VJYeWvsm/CTCBCs
         gKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TNAB6vJg7ImiyF97zXfnzvqwQUZdW3YJTfNKYsQjKkA=;
        b=poPvw1hIjE+0p0xEB8X3+m2w4ibzVl3fC2w8njBelZjNV8MD6Og1C0BNQ56m1SDBMg
         +FxdsJ21+hV7AyN+3qKAVMYmkY4lVin6mwTGccS6MTZ8cqbeSbg4KQ80zwsqmA0SnHFN
         YhB/sx5wiZxElWXHc1+278BdFQl0OuY50tRWH2PE4aX6Fql+ego3Z0o5oyIRjxB30bex
         m6CLZB1NX19F+YV45bzGj6EhUqMqz6G9RswQD575NVkh07kaxWfuQ4CsQ/2f0rOkIF1y
         goo/y/OJPyCZuAyjdCioGe0S8qSpigh2kQB3iaext1cyWqBiV2oi14/fKu8z5E/5iyhl
         +WhA==
X-Gm-Message-State: AOAM530Y99PQ9fSy8a3VLb1lK2FT4+OPdtfUadgsu+6W9hzv98QDECdy
	yYSxBFe8eWZCbINCQJfZMqknKMmMWueMWhVIc+Q=
X-Google-Smtp-Source: ABdhPJxHU8QdWEM6vPMQbPzxgQgp+4GW+KvnZc0l562u2I+jjvfIt+XJPSQR/5YQ5ZcKN3Xv5AowVql9JsMXWMs/Gno=
X-Received: by 2002:a05:6000:1ca:: with SMTP id t10mr7030535wrx.230.1589592128647;
 Fri, 15 May 2020 18:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200514210458.33543-1-JPEWhacker@gmail.com> <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
In-Reply-To: <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Fri, 15 May 2020 15:21:57 -1000
Message-ID: <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>, Joshua Watt <jpewhacker@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, jdmason@kudzu.us, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 15, 2020 at 9:06 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-05-15 at 14:53 -0400, Denys Dmytriyenko wrote:
> > I see Richard has merged these to master-next, thanks!
> > And thanks Joshua for volunteering to maintain these recipes :)
> > I submitted removal patches to meta-python.
> >
> > So, it is good we are getting this extra dependency resolved in master. The
> > question is - can we get these backported to dunfell, does it qualify?
> >
> > Otherwise Jon wanted to finally branch off meta-arm into dunfell today and
> > we'll have to live with it until gatesgarth.
>
> I put them into -next so we could test them, see if the autobuilder had
> any surprises. Good news is there weren't any.
>
> The question still remains whether this is the best approach or not and
> some people I talked to were not convinced that a consensus had been
> reached.
>
> The question I guess is how widely used is optee and does it warrant
> adding this? Its a little ironic the thing people want is trusted-
> firmware...

I'm seeing a few votes of "yes for dunfell" and no opposition as yet
(at least here on the list).

I support the desire to get rid of a meta-python dependency in bsp
layers so I'm also a yes vote unless someone comes up with a good
reason why we shouldn't.

Steve

> Cheers,
>
> Richard
>
> 
