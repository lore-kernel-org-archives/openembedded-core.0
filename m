Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web08.291.1620252451564804831
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 15:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ef1GKM65;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id q6so2116663qvb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 15:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q03WNW8ND+aAZDeGTZDgor8ESFt4vVZ1arLiSnZ7Mb4=;
        b=Ef1GKM65kUYAEcBh4bBTp/HdKKXm8qAzfZmV//ue/Z3JVMtYQj94BRMRA0Ou/Aj30J
         Zh8lqPQG4nThSniAzwAbYwyYBOj3SVDnZKAtObtipQupG51cBk5cfE/uqIXmCLKJB1Sp
         nJolTpZSwUkv9QJV4gXZxQTmHnJ2Z2JryAeA8dL8iSyzvv1BKndGqXjuaKHGsQiM7fRH
         Ao0ZT3pb+faQZYtFNjGV8HxB0Fpth1Qj0cQZMlKIS3MN26rrTk5C05DCodsaQpczksqf
         HdWf8/ZP7iWf9NF8DvwnjmG/zsXiMJL1DCq7ZWEqALJ5LU4fotxsxIqZ2wcCICS13UoJ
         0oiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q03WNW8ND+aAZDeGTZDgor8ESFt4vVZ1arLiSnZ7Mb4=;
        b=LKabjwuaFMJieGHzziDKN3a8wBTWVGKO2lXx9J3Wd8MgIeVUjSwvVVvd0DZVLlFuxu
         QF8PpwH7BuqqUSH9YneiaPzGrJ7Rr6GKRU7l3Kj60SPBn6Vnxe+H+b+YayQTZIzKWEIo
         dFTTnlhRJ7ZxXRqhS8Qe9Qgi9XKd6E3UkiHaUzRReO9UMmpQ6Fvxq7v5AnPszVz2v/Hk
         g1PQCc62yI13VGCFailTxTTnoRbPPlR7kZfexqxs4TuipGvvAJ/vgsxI/Mb81FDFPNrx
         0p+xv2FafGVIJf4PIg7oimUgDdyFfGfbO4sxBb8zOR0QDZVbZ8s4L3v0T55gJcw69b8B
         cXDQ==
X-Gm-Message-State: AOAM531sXE6PcOqGN5f5yXRJYovbm5HOmEG8Qnrr6g0meUDOYUKUUWyQ
	Z6fI79GM0HTmb+BLxqMTc0xHD+xTcoiKTE/oQ1M=
X-Google-Smtp-Source: ABdhPJz3c5ngxzFSWBu9M2ol+UG6YQbX8yMSllW9PBS7MEmC+9168/V2eeVCvrFC0aazB5lGDUerS8lMrqCr6iTNyvM=
X-Received: by 2002:a0c:ee23:: with SMTP id l3mr1199310qvs.55.1620252450582;
 Wed, 05 May 2021 15:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-58-alex.kanavin@gmail.com> <CAMKF1spEqemKRZAwWnDMupsSmk7rteUef6P1HbmC0-KtsOjO_w@mail.gmail.com>
 <CANNYZj9scBK7xAZpR1A3Fs9AiC8MT_EZHqszbGfiAkZSZgMYwg@mail.gmail.com>
 <443c94b6db48ae6b7daae10b529b8ea420be4add.camel@linuxfoundation.org>
 <CAMKF1so4BWNatThY_tixepiRUvzH=kfE7_4BWHroj4RnzSVQyA@mail.gmail.com> <0dc03ad24ae6700f7757b6afca84c37758759d29.camel@linuxfoundation.org>
In-Reply-To: <0dc03ad24ae6700f7757b6afca84c37758759d29.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 May 2021 15:07:04 -0700
Message-ID: <CAMKF1spWRv+mhtzRti5vpn8ja94CgrJLnJ5sSt10VaX_AUhHbg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 58/61] gi-docgen: add a recipe and class
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 5, 2021 at 2:52 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-05-05 at 14:28 -0700, Khem Raj wrote:
> > On Wed, May 5, 2021 at 2:09 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Wed, 2021-05-05 at 20:45 +0200, Alexander Kanavin wrote:
> > > > On Wed, 5 May 2021 at 20:05, Khem Raj <raj.khem@gmail.com> wrote:
> > > > > On Wed, May 5, 2021 at 8:20 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > > > > >
> > > > > > This seems to be the gtk-doc successor, and gnome
> > > > > > projects such as pango and gdk-pixbuf have started
> > > > > > transitioning to it.
> > > > > >
> > > > >
> > > > > going through
> > > > > https://gitlab.gnome.org/GNOME/gi-docgen#disclaimer
> > > > >
> > > > > it seems that its still under development and not declared stable, so
> > > > > I am wary of the churn it will cause.
> > > > > I would prefer to wait until at least its declared prime time for
> > > > > system wide inclusion.
> > > > >
> > > >
> > > >
> > > > It is only built if you enable api-documentation, and even then used only
> > > > in pango and gdk-pixbuf. I'd say it's fairly well contained.
> > >
> > > I did also have a quick chat with friends in that community and their advice
> > > was that it was ok to switch now FWIW...
> >
> > ok, that helps, perhaps they can reflect this assertion in document above?
> > but still, depending upon abandoned packages needs to be answered by
> > upstream IMO before we tread down this path
>
> Reading that disclaimer, it seems to be saying they're making it work for gtk.
> We're using it in the gtk related components it is being developed for so I'm
> not sure there is an issue. What it says not to do is use it for general non-gtk
> code. We're not using it outside gtk?

This above says

GI-DocGen is still in development. The recommended use of GI-DocGen is
to add it as a sub-project to your Meson build system, and vendor it
when releasing dist archives.

we are trying to use it in system mode and not vendored along with
packages which need it. Perhaps I am misunderstanding?


>
> Cheers,
>
> Richard
>
