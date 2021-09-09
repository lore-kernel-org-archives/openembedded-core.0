Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.3285.1631163969806079244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 22:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XRc0EUi8;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id bk29so580933qkb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 22:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HtEm8MtzMoXy7+TjTwW6FvRMs/tATGWJ4E/65QIco8o=;
        b=XRc0EUi80iRnlI0mg5DWMNs1PLH2e8tzmIVVSt0iv+OME8gs6SqNr286EG2ZYs/O+e
         RsLzVgLk53H2TXZw9nXJ3H6xUbDztsyd1xOhh1tndVNHdMnMAa9Aupd3YgqnBsYDrjZO
         ulSN9/zCpBsqe+kZc+VKBpbT0hqP4+Jq2LYr6KgIiOwuGqoadlaMALBtVIa/A8U9wcvS
         Hh3pzaOBUGGI6DXfwJrm8X19LvOCRGWT6LrFZJigRJ/fXZBaHoLB83zawa4wEUnHB4BQ
         kJR+rj9SJUp2uwJlnaTbtDdaRBFmDs2vO3s4hjjKyd9kvuq377tEk7xn/eiVpJCGbYCj
         CENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HtEm8MtzMoXy7+TjTwW6FvRMs/tATGWJ4E/65QIco8o=;
        b=5uaP6oJM8VoIlFGp/igNgRFOTvnSMHgT3WKflz9xh4INtbXvI0BC8EQee+tOIxWlO7
         ijWY3MAa+ia2rA4z0/8wYLsZLZua0wu06/RzRhBocAZB7n22RRpCGckIUFZJJA1L9gfO
         FTS1PPtGiN1An8rHbydNo4JKTQUZvyfTR83q2/U/EJl97Vv2hM8pii/TpISmFl2FJU1K
         m7WNFq7D/qx6JybAbaoStjd7J0T2bgHmcD2yg6P6XBczJNbl5qecjrOFfoIEWAaCBh9p
         aXHWlKFbSJnbgFtnHlBs4kuzQYYW1SnbnPYy8+vO97vxNfVvzIAKp/oelWs49ZT4z2FY
         /uxQ==
X-Gm-Message-State: AOAM533DLakjW7AOrkQWuk1aHnMk7VyWa3zte37Kv3NoxwDHgYyEbKxA
	wr+Nz80fPGZSM7tcXxxd6df98V6abfz1UL3vFf0=
X-Google-Smtp-Source: ABdhPJzadVq4f7tXtLrE7YLCG+xTgD1f3Y6vbV4CsrRe5QSob58ePUWM+zpdoH+Z1OSHaNLLKjqXzpxPIYKiB4BJKhM=
X-Received: by 2002:a05:620a:248f:: with SMTP id i15mr1150981qkn.128.1631163968800;
 Wed, 08 Sep 2021 22:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631006167.git.liezhi.yang@windriver.com>
 <ed036834262a67e88a58001d20c719bed37d50f5.1631006167.git.liezhi.yang@windriver.com>
 <945b8038-97c7-1264-594f-e3b424695c22@windriver.com> <CANNYZj_6j9W0KKuR68KjRk+=MTQx_EOcuWnH3Zt1aKZHJZzvHA@mail.gmail.com>
 <CAAnfSTu2fs=tG7NEW6w5PxLXsczTB5g3cm9_Y5jPgugA+-mc=A@mail.gmail.com>
In-Reply-To: <CAAnfSTu2fs=tG7NEW6w5PxLXsczTB5g3cm9_Y5jPgugA+-mc=A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 8 Sep 2021 22:05:42 -0700
Message-ID: <CAMKF1sryO5mNXDr6ZtF0kwm085Xp3-cTm5TNhatojy5cN57htQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] assimp: Remove it
To: Ross Burton <ross@burtonini.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Randy MacLeod <randy.macleod@windriver.com>, 
	Robert Yang <liezhi.yang@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 8, 2021 at 3:08 AM Ross Burton <ross@burtonini.com> wrote:
>
> On Tue, 7 Sept 2021 at 13:50, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > I'm not sure why layerindex says otherewise, but neither vulkan nor anything in meta-qt5 actually depend on assimp.
> > qt5/6 has an option, off by default, to use external assimp, vulkan has no dependency at all.
> >
> > This leaves basically meta-ros, so carrying assimp for the benefit of a single layer is dubious at best.
>
> I thought Vulkan needed assimp so dug into the history.  vulkan-demos
> used to need it, but that was replaced with vulkan-samples which does
> not.
>
> So, I say we drop assimp from core and move it to meta-oe.

just drop it, there is nothing in meta-openembedded repos that need it
so I am not that interested to maintain it in meta-oe either.

>
> Ross
>
> 
>
