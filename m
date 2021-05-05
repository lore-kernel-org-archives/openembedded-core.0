Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.3579.1620250125216905622
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 14:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JwEuyr3q;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id o5so3118075qkb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 14:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DC1ACtLgXdz2Dd6GF6naIrwYOVISQzYAZMhu639dQfI=;
        b=JwEuyr3qwfPVjLeWuu2IGhEbuBM3f81EescSQ3wDr4gvQRDAzoqJLISaGtGuJSp5aa
         gcxZloHo8xcFD15gOCDRe4xV9pwr1KthLeEix1UhQBxcIqKHw98TBfEAFC7vT08Nd1oO
         J1sh3RauEX9VnNrLTL0BmMp7Mmc2Ajv1xc4Xc+zF2BidmptjwYhM/2jW/mYAJsblC3zf
         8tjyEX6D4Pjxrnu8YfzisihRvt8sKSShiDu2hq//3WaVry+8pgYrozmOXmbbYxn541+2
         ebNE9sJmcY42ywBN+djYJSmgCkQJ+rYKxnoG1wKiQZA50M5WzaqqEHIDB/4ZloPZvbAf
         NlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DC1ACtLgXdz2Dd6GF6naIrwYOVISQzYAZMhu639dQfI=;
        b=Kh3t3eVP3Cjpcd7nss+yJ7wZ8jJgNFTlMp+W/nr19iOZddcocyBexWceZGw6qO890U
         PvkmMfLQ3r4mpUf7SDnnRamofdsWbN5zwgkFyJhrWrDt2zpPe2zHhyvORTb13t8qj7dF
         ht+Bkl7JD3nRlQO0WL6giO+zl4cZh+6obBo9sfxJsuSx9hicr59NdYcblzTyic1Qy09Y
         XQc6wM2YgjDPZrZVD+5ni2+ItubOqiz5xyXOfpHfogW0KnA+JYSo2dJMxWPPiL9IM2BC
         UPQzNMqTnZ1Fy1D2J8QFmxFiiJ8JRSYhMBPz4b5+z/xED/xr0mvowLweHPzKvwvJAUJm
         Sw6A==
X-Gm-Message-State: AOAM532t4WxbrGzrZtkOc9TtrsSDVvxbY2r1ZDBSIEiJBJnGj5MaciW8
	R27Cw2HWEZYhbopCxHHUSrl85JTSv9nogqZl0X0=
X-Google-Smtp-Source: ABdhPJy4HNzBrD2ZLPrLFqmMlweOmvxdPgNcA2kj/WUJD9yjO/KP6RPNGuON5fju/u/9PBbRN1eKUoBrmj/o+hEwoNQ=
X-Received: by 2002:a05:620a:9c8:: with SMTP id y8mr803672qky.125.1620250124374;
 Wed, 05 May 2021 14:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-58-alex.kanavin@gmail.com> <CAMKF1spEqemKRZAwWnDMupsSmk7rteUef6P1HbmC0-KtsOjO_w@mail.gmail.com>
 <CANNYZj9scBK7xAZpR1A3Fs9AiC8MT_EZHqszbGfiAkZSZgMYwg@mail.gmail.com> <443c94b6db48ae6b7daae10b529b8ea420be4add.camel@linuxfoundation.org>
In-Reply-To: <443c94b6db48ae6b7daae10b529b8ea420be4add.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 May 2021 14:28:18 -0700
Message-ID: <CAMKF1so4BWNatThY_tixepiRUvzH=kfE7_4BWHroj4RnzSVQyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 58/61] gi-docgen: add a recipe and class
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 5, 2021 at 2:09 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-05-05 at 20:45 +0200, Alexander Kanavin wrote:
> > On Wed, 5 May 2021 at 20:05, Khem Raj <raj.khem@gmail.com> wrote:
> > > On Wed, May 5, 2021 at 8:20 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > > >
> > > > This seems to be the gtk-doc successor, and gnome
> > > > projects such as pango and gdk-pixbuf have started
> > > > transitioning to it.
> > > >
> > >
> > > going through
> > > https://gitlab.gnome.org/GNOME/gi-docgen#disclaimer
> > >
> > > it seems that its still under development and not declared stable, so
> > > I am wary of the churn it will cause.
> > > I would prefer to wait until at least its declared prime time for
> > > system wide inclusion.
> > >
> >
> >
> > It is only built if you enable api-documentation, and even then used only
> > in pango and gdk-pixbuf. I'd say it's fairly well contained.
>
> I did also have a quick chat with friends in that community and their advice
> was that it was ok to switch now FWIW...

ok, that helps, perhaps they can reflect this assertion in document above?
but still, depending upon abandoned packages needs to be answered by
upstream IMO before we tread down this path

>
> Cheers,
>
> Richard
>
