Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web11.4751.1603137882707099802
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 13:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kWbB02Wv;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id p9so660250vsl.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 13:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DeCxcrCTUL6iY5khhKdk1zYTQwI3Lwhm/snIYWCcgH4=;
        b=kWbB02WvRnNDaj83oVUCkCIEwP5bK/R7AAq1qRUGlhHsa4Zdixr7iBG9knpR9Cb8ks
         fP/z3ttM63vufqSXvf9N3WCMvCHSfqO/ix9/ATXe/mXan0Xh/HJ6RmCKknS5/1XtdOkd
         aqixhUSsvVVYEJUTeVtKY4jplj0bs6k4JKxqZOh1BNfNTov2K45uf9sWx4sijb7YQeGs
         9auDe1G2mjghq3fed23Xt2si0tlo8PZ0v92Vk/rCH71M72WShVaV8juXiG7UJqkKszcM
         3t/WSzaN5J7HTYtRyap/qtOH6FADIP9+226d1MecMRxBGbivDO/DbQGznixnpoLYClTm
         LhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DeCxcrCTUL6iY5khhKdk1zYTQwI3Lwhm/snIYWCcgH4=;
        b=B77xVkNujOW6ud3SAHpdDjhAVTMWKuPLRvZw03oj8u63QFckQyKFj1GHBECm4Fprb/
         +/nGMNffRtE23JWggckHBYHKlgk7Yjg4O9dpXA39t+HahxWaqYFQT3eOXhL/XFJ5fqwy
         /K74ZnE/3rPl4kHXv/B3zmxtOQ2af54rJKkOm2g8LcfldTWy5oKewXybIM0ZkxAPkSAC
         LEHfnjLWgqPiXEJxm3PC+fMDTkw+rC661t0F88LNZkrs+yGipKsuqAVcTCPW5tK/hZOT
         VDyvxA3O/6NVIM7pd1VvvHtT2+hVOLvDG5Ligo9yCgr0ljnSpQ5SEWDRzgQyN6psAR8M
         4MuA==
X-Gm-Message-State: AOAM530ky2fyC/PkMyFeqrrHXlWc32snTRfhnejZ3Dt3j0Rzpv9CiTw+
	IKrFvaxTJqSE2Q7clmJoikPuITC16M9CSAZAdPM=
X-Google-Smtp-Source: ABdhPJzMwEtdVUoRL8r16QSvdTNF0TgxF3uNl7/sY1Da/PK4lWGCgJvHfb0i2bvnQLO2XEPq29pSItJTXQ0v+RXMuU8=
X-Received: by 2002:a67:79d4:: with SMTP id u203mr1674550vsc.35.1603137881193;
 Mon, 19 Oct 2020 13:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201015054600.24514-1-akuster808@gmail.com> <27107.1602752871157273119@lists.openembedded.org>
 <DB8PR10MB39778008487808091759D8AB92030@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
 <9ea47af9eca270bea1b3e468f530dad782023a44.camel@linuxfoundation.org>
 <CAJ86T=WvteSbKp3W5UvEQDVsUDh=SRvq20kP343PLQZMmQV_uA@mail.gmail.com> <618b0ed0615813e02e06dbc2068c5398cae15c4d.camel@linuxfoundation.org>
In-Reply-To: <618b0ed0615813e02e06dbc2068c5398cae15c4d.camel@linuxfoundation.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 19 Oct 2020 13:04:31 -0700
Message-ID: <CAJ86T=UNe-e5N9SLmwC=2Vto0og8aV-bmA2YF1dB9bV3R1Ujxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] busybox: add rev and pgrep
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Andrej Valek <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Diego Sueiro <diego.sueiro@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2020 at 12:57 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2020-10-19 at 12:55 -0700, Andre McCurdy wrote:
> > On Mon, Oct 19, 2020 at 6:25 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Fri, 2020-10-16 at 16:48 +0000, Andrej Valek wrote:
> > > > Why are you not enabling these configs correctly via defconfig?
> > >
> > > I'd wondered about that. I didn't really want to block the fixes on
> > > that discussion and am trying to pick the best places for
> > > discussion
> > > but I'd take patches tweaking this.
> >
> > It would be good to clarify this. At one stage the advice was "the
> > more fragmented the better". Does that no longer apply?
> >
> >   https://lists.openembedded.org/g/openembedded-core/topic/72273944#68672
> >
>
> The fragments need to be useful. We could create a fragment per config
> option but that would clearly not be particularly useful/usable. Its a
> question of common sense, which is hard to document explicitly :/.

We have individual config fragments for sha1 and sha256 based on your
advice in 2015. Has that been useful or usable?
