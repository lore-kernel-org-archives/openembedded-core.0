Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.63024.1600097016158960637
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 08:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AVIk+AWu;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id 16so470482qkf.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 08:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FHswRveKhEtp5KpsVNEwsVNx/Mr+MAxpZrLpoEdAeoA=;
        b=AVIk+AWuofGnfFqghm2XNBoUo5YfSxgJqTE1s1jYIyjRD2Lbaqsi18oZhPRKlwLHF+
         iR82S66vBLc+bicLU3F1baW0HUKgKpJ5zRfLeJM5ukHb6IKPIN4wBM9g7gHZLUb2+KqJ
         05NB5nrWbALIUs8V3pyDtPgHr2tKUQw3AwUngv5mwCNFXXNgKkZ0hNcDP47xwZAvMiBY
         7FD6mj7pZqrV8wuJQP0T6P+MibZ73d2VZ7Hnbu4TTvrH+T8FWx5a9yIf62m23pvmpYCH
         pLyejuqOP3faSdghXOPSConD56i/A+zlL5oJi95Cf6YH7ukbMdcCMpgZfzY/dcRMCxAv
         VpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FHswRveKhEtp5KpsVNEwsVNx/Mr+MAxpZrLpoEdAeoA=;
        b=Xe7Dbsa5pmNtbjPzTJsefvk8wRb2D+7zfTK8V3roBr+SEV49wIhsYUIaChlZXOi0O5
         sEwTesNo0gs6pmYYZbWCcTOdBiT8JMmNBZts//uoDtGTKHobTwYUoDiy4iZZuE7ArJ0M
         Dd0z6RTJzBak1vgkgsRIectjHMNkWfIYzZ4v2OEEwVuCkjYFNn7UQ+JtGW3Je0FmwEFW
         oSnAbBaeVxA9Si19jz7IuH2E5njwO8RpAZDtoJ0GKa8koDwExZa/VYMn0KTqOXwiOlIc
         I6s+UC/XDdKj2DicsTUBMboAxij77+4qzKBZV8MluEpMST7Zd+vDo/dA5Z2W6frL6gWl
         RpZA==
X-Gm-Message-State: AOAM533B+q/BoJ3BsUlKtfO5SiAdwYTGonwO55/SUgU6DnfQ1k6uzBYm
	0bptfg5GPsJMLKk76XVKWhJ2tpxQiFIc+0GitEc=
X-Google-Smtp-Source: ABdhPJxYb6k80FrXcARsnUM6VpIRdJT8VC2EUU/Xik1PfeNJQxBLvTs1/0VoCXzojpsPkxecB3z+ouODndxA8+qMen4=
X-Received: by 2002:a05:620a:13f6:: with SMTP id h22mr14025705qkl.9.1600097013995;
 Mon, 14 Sep 2020 08:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200910025728.3868717-1-mingli.yu@windriver.com>
 <CAAnfSTsTmAE5fbvTck6m9rsQGa_FebUMWmAXEvKkCfq2TWjiZw@mail.gmail.com>
 <26851540-6c95-c58e-7ae9-87d2ba546478@windriver.com> <236780a1-589b-589e-3e76-00d829868a0a@gmail.com>
 <3d6f9248-f819-debb-0d71-de29ee312ead@windriver.com> <eabcd7ed-88a8-8453-18dc-af4fcc92c9d8@gmail.com>
 <dc5035a2-5051-ceb5-310e-ed6d7dff8fd1@windriver.com>
In-Reply-To: <dc5035a2-5051-ceb5-310e-ed6d7dff8fd1@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 14 Sep 2020 08:23:07 -0700
Message-ID: <CAMKF1srYA5s5et4j7HbX6BQ0+zY4WXciagffTh2X3yMKy2vUZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: always define unknown_lock_type
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Ross Burton <ross@burtonini.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 13, 2020 at 11:29 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
>
>
> On 9/14/20 2:02 PM, Khem Raj wrote:
> >
> >
> > On 9/13/20 10:44 PM, Yu, Mingli wrote:
> >>
> >>
> >> On 9/14/20 1:26 PM, Khem Raj wrote:
> >>>
> >>>
> >>> On 9/13/20 6:50 PM, Yu, Mingli wrote:
> >>>>
> >>>>
> >>>> On 9/10/20 6:41 PM, Ross Burton wrote:
> >>>>> On Thu, 10 Sep 2020 at 04:03, Yu, Mingli <mingli.yu@windriver.com>
> >>>>> wrote:
> >>>>>> +Upstream-Status: Submitted [qemu-devel mailing list]
> >>>>>
> >>>>> https://lists.nongnu.org/archive/cgi-bin/namazu.cgi?query=unknown_lock_type&submit=Search%21&idxname=qemu-devel&max=20&result=normal&sort=score
> >>>>>
> >>>>>
> >>>>> doesn't find this patch, can you link to it please?
> >>>>>
> >>>>
> >>>> Hi Ross,
> >>>>
> >>>> The link is
> >>>> https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html,
> >>>> will include the link in V2.
> >>>
> >>> are you compiling without __OPTIMIZE__ defined ? qemu may not work
> >>
> >> Hi Khem,
> >>
> >> I didn't especially customize something for __OPTIMIZE__,  could you
> >> help guide where to define it?
> >
> > perhaps you are not using one of -O<n> option ?
>
> -Og passed to the compiler as DEBUG_BUILD = "1" defined in local.conf.

Does qemu work when built with -Og
