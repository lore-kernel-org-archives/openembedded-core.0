Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.9488.1623858834061307476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 08:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=t3pbAASr;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.51, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f51.google.com with SMTP id h22-20020a05600c3516b02901a826f84095so1977468wmq.5
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 08:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wnsRuVwrAZKLgKOXBBOC04wU+dZJAlHigBhAiiv9FW0=;
        b=t3pbAASrTAK/OQcF3wE0P9/cDXE31GCoip9h1k4QI507F0jXlOgicFsGhRt8ArIaeT
         x60QiinZcQvIO9cn5VNmffrLnRuZ0E08N3fB+sdk5YMD++DYCKrkguvP7baJzWgcUnP8
         pUdCs6TLeLAUPXY0Z0owKO6Pko4Pdr9xXdKf6uICJDNRE8W4gLtbihD9wnYMv/ya7zkr
         2nox9700COQePqExeXg/zJyfCcQKywJf/+fT+aQb36I1Gtf+htOq2Qe1vcCnlozHETTY
         19pHWkztVONRNPKUTAeXS/iCSIF1zu17YG9IclZ6MmLEA5y/bmoNusGG1qTILByUrFCr
         QjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wnsRuVwrAZKLgKOXBBOC04wU+dZJAlHigBhAiiv9FW0=;
        b=P2GWgunhy9CqrQl8S2pCOtwPf2kBaonWZkbXYBCouxQ4pfF3RoEnC/p76Vt14dgtnn
         c2ttAYDUAj1huWCU8J+T11H6GEL6pnMTLs0Ry/IKKLzKVwGrPhH7rsaNGYE/OuaJoIt0
         dkNfoqFIBd5GSXHRgooFZr2WYtGVHvB5IzuF8A4XSQTpkntCoWSD0ZHS7gjihfZErLYK
         ENSyNkX0J61um4VByVZNLs2R3pUnNLkiXRBFzyxW4HLrXPpWRBfT9TpLEXvFjGfb/ijB
         QtIiCHM1MIFH8gv5wbqO2F3FqsXLQSwt0WmDbGQnk7jfXQ0bLRGz8hsi/xH/brM7DQEA
         9PWQ==
X-Gm-Message-State: AOAM531j0zoXj6j9UApoFIVb5ajKEqQ6EauGQcbip6IB+pl0pmyP0mxr
	dhTL2scaEA/uCe5dpKiOXyrcXNpXp0pyogB78r0T9Q==
X-Google-Smtp-Source: ABdhPJzmo4jAwF11Fl9teGlrr/edsBN03eJ8kf8kUmELyBH1HpC+m4vKVzXhDKrUGT5ev2ml0k2g9/oyicEZUkrHm24=
X-Received: by 2002:a05:600c:190f:: with SMTP id j15mr12398563wmq.4.1623858832288;
 Wed, 16 Jun 2021 08:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <d8dac798fed14554b0bfb5b7ea2daf12@de.bosch.com>
 <CAOSpxdZQBmu8Da90W2h01ZMRD+s9GVP3Lvq-xsSrSjJJRuFeNA@mail.gmail.com>
 <CADkTA4NkMjTjTJbp_6HCapzasyzrWGwQkBWuen7GWgNi4ppZbw@mail.gmail.com> <8f04ab75284a42e084c02519d177bd18@de.bosch.com>
In-Reply-To: <8f04ab75284a42e084c02519d177bd18@de.bosch.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 16 Jun 2021 05:53:40 -1000
Message-ID: <CAOSpxdazeCZa_sx2ixaAv4A-fZZ86fhyyYx0ib=DBmfB93VgtQ@mail.gmail.com>
Subject: Re: Request to backport KERNEL_DTC_FLAGS to Dunfell
To: "Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"ovidiu.panait@windriver.com" <ovidiu.panait@windriver.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"toertel@gmail.com" <toertel@gmail.com>, 
	"RUAN Tingquan (BT-FIR/ENG1-Zhu)" <Tingquan.Ruan@cn.bosch.com>, 
	"quentin.schulz@streamunlimited.com" <quentin.schulz@streamunlimited.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 16, 2021 at 5:28 AM Jonas Mark (BT-FIR/ENG1-Grb)
<Mark.Jonas@de.bosch.com> wrote:
>
> Hi Bruce and Steve,
>
> > Von: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> > On Fri, Jun 4, 2021 at 11:09 AM Steve Sakoman <steve@sakoman.com> wrote:
> > >
> > > On Fri, Jun 4, 2021 at 2:45 AM Jonas Mark (BT-FIR/ENG1-Grb)
> > > <Mark.Jonas@de.bosch.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > We are using DT overlays and have the need to pass the -@ parameter
> > > > in DTC_FLAGS to Linux' make. The patch
> > > >
> > > > "kernel-devicetree: Introduce KERNEL_DTC_FLAGS to pass dtc flags"
>
> [cut out web links messed up by Outlook]
>
> > > > makes that possible in a nice way. Would it be reasonable to request
> > backporting of this patch to Dunfell?
> > >
> > > This is sort of in the grey area between feature and bug fix.  It does
> > > seem relatively safe, so I would consider taking the patch if there
> > > are no objections from the community.
> > >
> > > Added Bruce to the cc list to get his opinion.
> >
> > Good timing, I happened to notice this earlier and was thinking about it.
> >
> > While I also wouldn't call it a bug, I agree it is a small/standalone change that
> > shouldn't break anything.
> >
> > A quick scan of the dunfell tested kernels shows unchanged Makefile handling of
> > the option, so there's little risk there.
> >
> > I'd say that it would be fine for backport.
>
> Can I help with the backport in any way?

The reference patch is already in dunfell:

https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=2246b0d7a71c69eb2e89c55991d1387069895466

> My colleague Tingquan gave it a try and the patch from Hardknott applies cleanly on Dunfell.
>
> The documentation patch for Poky proposed by Quentin does not apply though. But it is just that ref-variables.rst was renamed to variables.rst.

Please see the documentation patch currently on the list for review:

https://lists.yoctoproject.org/g/docs/message/1469

Both should be in the 3.1.9 release coming up in the next week or so.

Steve



> > > > We were also wondering what could be an alternative approach for getting
> > this or a similar functionality. Patching a bbclass using a bbappend is not
> > possible, is it?
> > >
> > > No, there is no equivalent of bbappend for classes.
> > >
> > > Other solutions are possible, but taking this patch would be the
> > > cleanest solution to your problem.  Let's see what others think before
> > > we go there :-)
> > >
> > > Steve
>
> Cheers,
> Mark
