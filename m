Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.19165.1617009918607826881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 02:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=EaAtAiEM;
 spf=pass (domain: burtonini.com, ip: 209.85.128.52, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f52.google.com with SMTP id r10-20020a05600c35cab029010c946c95easo6281057wmq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 02:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0vAnIFRa4tEpZ+IaYC4XigfMu/mgeR4XzH4mq+MwB+w=;
        b=EaAtAiEMzzJ9EXBFPnYp5K1c5OjPrESNIpFVie4ZDd/xbeC44oP948gk7hUzG67RbO
         he0702XhpkkCW71mjMH+n/DvEkKGB7Ae4WuaxOPnUJoqPP97BGC+3B75qIbbq0umSzBW
         n58OOkbHIFdf9uzGETjOHdJBmHZe7OfIIbhdeK+VFaRsZH62yTbpDu3fHNvYCor1uSqS
         a6khtWH0enJ0Q2fJRUn2++Spe8e5JEOAuskh4T4gV3YhDDZ0B1ByqqlwxvcCrUxhFk3z
         DVkoDLBPlohuZOeYjnOsRL5RPKhd1ym6RUC8drbl/Rd6X0bxS1FRAscCjoNLmgs90HMk
         +DyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0vAnIFRa4tEpZ+IaYC4XigfMu/mgeR4XzH4mq+MwB+w=;
        b=TUVe+SS31ky0yRKpzUyDN4fsU84G2qnufq7Zgxn80gAKLAwLHb73aOuz6XIr3GRxwf
         9x35d+UiqSRAspy6djzzcwvflyR5v9oUlwCvXa6WKgeWD4ia46nZZi4e6RMzmVrnonB7
         MAfmU3/oyBCX4/IU1k/9oKOzIxJiyrLLZd3fy7tgutkAS0mw/K9x9MDoaUihAgmxUm8T
         AH6IBUniuNJbG2GwUyqsdEkQROGiwEa/eNBzhSWCcfu+9OAsRh9DSSSdMrSbkHFbzVTs
         thNIlZW2+b0n9i0aqOhNl/CgaG8rDOydiBq9DmpLF+1IT5RNn/hzYfrG0N4o9tHgF+6s
         2BPQ==
X-Gm-Message-State: AOAM532DvYmQekBRD/0znp7Su/nGiAdry4hQ19eEdQrpJ9E1ti09QggU
	eXoLim7odcQjy5+Ifyj2qzpZa+k5/rC1SA8n2CWrtQ==
X-Google-Smtp-Source: ABdhPJyLSjg0sPLkhDd70FNoS6UayH80FpG5He0Ch/1hEGvQE4+GuLYpF61RyKhZ6fbUQjsGenL2j2QPTLMwrfErhd0=
X-Received: by 2002:a1c:6855:: with SMTP id d82mr14689726wmc.169.1617009917051;
 Mon, 29 Mar 2021 02:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210325173901.3057180-1-ross.burton@arm.com> <CANNYZj_mMCVjamiimbWki=r4GFAOXkRPjH6xm3rcSbYkmpewWw@mail.gmail.com>
 <CAAnfSTvXHyX_MvHbtpcUso92K=DQT1_7hMwAGCDPJ9RMW0zVPg@mail.gmail.com> <CAMKF1sqMj-d-Dj-Kq3N5gAJBZtFDzGY=Rcc2J9uKD_gA-i9e8g@mail.gmail.com>
In-Reply-To: <CAMKF1sqMj-d-Dj-Kq3N5gAJBZtFDzGY=Rcc2J9uKD_gA-i9e8g@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 29 Mar 2021 09:25:06 +0000
Message-ID: <CAAnfSTt-wfkc2ZMDZ1hXAqGij5eQAcpvvwtoFNOS9PfMtkuJZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/3] meson: fix native/host confusion in gobject-introspection
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

This is the universe telling you that one line native file should have
been put in oe-core. :)

Ross

On Fri, 26 Mar 2021 at 18:49, Khem Raj <raj.khem@gmail.com> wrote:
>
> I am seeing some failures
>
> https://errors.yoctoproject.org/Errors/Details/574541/
>
> On Thu, Mar 25, 2021 at 12:08 PM Ross Burton <ross@burtonini.com> wrote:
> >
> > On Thu, 25 Mar 2021 at 18:15, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > > I don't think I fully understand this. Is g-i in meson projects already broken for a while (there was a bit of refactor in the latest meson version, which I tested, but perhaps not well enough), or is this necessary for the other patches in your set?
> >
> > I just sent a mail which sort-of answers this question without seeing it.
> >
> > Basically, the change is that Meson now knows that it should call
> > pkg-config-native for native pkgconfig lookups.  Before, it was using
> > pkg-config.
> >
> > As far as I can tell there is very little code which hits that
> > codepath, so we didn't notice.  When setting pkgconfig-native
> > correctly, this broke.
> >
> > Ross
> >
> > 
> >
