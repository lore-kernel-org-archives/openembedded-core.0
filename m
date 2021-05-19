Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.14626.1621443218394943990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 09:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QkZnV8eB;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id e11so16389444ljn.13
        for <openembedded-core@lists.openembedded.org>; Wed, 19 May 2021 09:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U6rHgi+f5GwGZNF5VZU9rzWhKtjOn/ef3EeWYiYZd4A=;
        b=QkZnV8eBV/0k/aqc0u9CXtjB7PrkBZ7FAdGrQUEwBbHpctK991OUAtg9Y9iqEXWqtv
         g1sYujbGbBo9v/zoD4rN8+93nRhsb63khAxlN7IhykelNSjMHUeoBUgl2CapW5CJK3Hd
         QTDOFgl917mvjrc+HaTDtqKzSgIy3s9aTT2u9o43VD8JllSdxBMz09QrYaTquv2QjUni
         adaNYxQV8eyHAhQJjG5B5QtrEIZbDK2U5oJyqIRPXkkTmpOvXdOibL6URGZgSU1A++Eo
         tV8TgzRyxo0u83HSIcDmQh4uWKdXmxevG69F47Vvw8G0vmRD++u29qQ45v8xU4ZglFur
         sOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U6rHgi+f5GwGZNF5VZU9rzWhKtjOn/ef3EeWYiYZd4A=;
        b=kjusq8ggwo9J1X5Xv8Jh/Q5m1yY+PqdpC8xs7jvW//6E+o9idTJu58nMF16TF4TZzq
         10zzPRv/9N0vXh1vyGxfKyL6ikf6E1ScQUcX7MfNn+GI4JisMGZX0ODcG3UJ5Mv/NhU6
         dr92R/dE/ilGlUqGgIu8KO6fkkvEzidtXGoG/zpZc0caWPvDgkAEXwcug0TUoDwzCJXM
         AyhkZJ22s/UDtpm60QpS4rXJl3OUOD9MxoZ+80UDx9qD/+9kryM43WTpuKuRvi4NRIA6
         4bbf3EjyhFObOkvvPFx2jnnK2kObZYMDzZ/Vi3cx4ND9NioqG/RWUXcSYAQLx9KCJsmz
         ltig==
X-Gm-Message-State: AOAM53035JB+ErEpQAvz9OHTrtv8VY3QtdcfNhjldh72XyPi9W73DL4D
	guIU3v+gM3epN5292J+L1HKSSW/Z/rfqCF0RUhU=
X-Google-Smtp-Source: ABdhPJyiRi1FDswIadvbZHISCGmjjY1Ve2/dmsxQpUmcz/2hxFWh0xDaal6ojZAWe5pYPyVlnuGR4UHmCMeMCSY/xys=
X-Received: by 2002:a2e:968e:: with SMTP id q14mr99402lji.507.1621443216233;
 Wed, 19 May 2021 09:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <ca363208-ab63-44c4-92e7-98b1788a8a8c@www.fastmail.com>
 <CANNYZj9_4WC91DoTeXcsVAJi=kS2DRXHTHE5L6Wgbb2PJfTimA@mail.gmail.com>
 <255c6c61-af04-4866-bb2f-0ddc50ca6391@www.fastmail.com> <CANNYZj-PSq4bAQpy3s=8Vuqk-PcstZZFPzr710VXfS3Lj8Aiow@mail.gmail.com>
 <CANNYZj8yZ5Ays2dsPV5jkptLea0faY2uqd5_n6SeOFZdoqV8Gw@mail.gmail.com>
 <CAJ86T=UjJ8J3aUL7YX03oa1fy7zAwPk9vp+=yYxGNfEKsNt6oQ@mail.gmail.com>
 <5ceca668cfce15ebd8874fdaa9c01949fe1d95fc.camel@linuxfoundation.org>
 <d1c5ed38-605f-4fa8-8ece-09a9dcc43890@www.fastmail.com> <7ebd5f52982311726a6aebd89eba9cae07bdf999.camel@linuxfoundation.org>
 <720f0aff-891d-4186-b637-4b5e2ba0a598@www.fastmail.com> <8b4047d54cf840b1b7ed06758c18ffcb725d151d.camel@linuxfoundation.org>
In-Reply-To: <8b4047d54cf840b1b7ed06758c18ffcb725d151d.camel@linuxfoundation.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 19 May 2021 09:53:24 -0700
Message-ID: <CAJ86T=XX5wk4KPbF5JP_fTDy+U_R6gWtjyMR08HbvQ04LnBORQ@mail.gmail.com>
Subject: Re: [OE-core] master/main branch renaming and bitbake
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: colin walters <walters@verbum.org>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 13, 2021 at 3:48 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2021-05-13 at 17:33 -0400, colin walters wrote:
> >
> > On Thu, May 13, 2021, at 4:08 PM, Richard Purdie wrote:
> > >
> > > The advice to anyone hitting this issue is to add in the correct branch
> > > to the SRC_URI. It is simple and easy to do, can be in bbappends
> > > or even changed via anonymous python and similar if necessary. We've already
> > > found the issue with several core recipes, we simply updated them and most
> > > users didn't notice. I would even likely take that kind of change into older
> > > otherwise unmaintained branches and I think I did so in at least one case in
> > > the past.
> >
> > What I am uncertain about is: how quickly does that translate into us being
> > able to remove the old branch?
>
> My personal opinion is see the patches updating the SRC_URIs make the branches
> given we know about this one and then do it.
>
> > We're not the first project to do this and we won't be the last, so having a
> > solution here will be good.
>
> I'm suggesting people update the recipes.
>
> > Hmm actually I notice systemd upstream did the rename a while ago and they're
> > not carrying a `master` branch.  What's the difference between systemd and ostree here?
> >
> > Is it the use of `SRCREV`?  Or no, in the systemd case is it because it's set to a tag?
> > https://github.com/openembedded/openembedded-core/blob/2621dbbc1181808f18ca4ae79408d0d5b557670f/meta/recipes-core/systemd/systemd.inc#L18
> > ostree is also using tags, is the recipe just broken in not using tags?
>
> No:
>
> SRCBRANCH = "v247-stable"
> SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}
>
> i.e. there is a specific branch specified.
>
> > > I appreciate the tooling could do all kinds of magic things. I have a strong
> > > preference for not adding magic into it, or over complicating it, it is already
> > > horrendously complicated and a nightmare to test. I appreciate nobody believes
> > > me, I only do my best to maintain it. The code is here for anyone interested:
> > >
> > > http://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/lib/bb/fetch2/git.py
> >
> > Yeah, understood.
> >
> > > I'd also note you can add ;nobranch=1 to the urls or ;usehead=1. Those do
> > > have side effects, I will not recommend them, or accept them for general use
> > > in layers I maintain, they're considered developer options. I was reminded
> > > recently that we have seen bugs the branch parameter has caught where a
> > > revision was not where we thought it was so these do catch real world issues.
> >
> > Well I hope the result of this discussion is a recommended best practice at least.
> > If recommending using a tag works, that seems good to me.
>
> People should add/update the branch in SRC_URI.

Could we perhaps have an "official" recommendation on that somewhere
which users etc could be pointed to?

I've just had a discussion along the lines of "but ;nobranch=1 works
and will be more robust than setting ;branch=main if upstream changes
their mind again". From a user's point of view it's not clear at all
that setting branch is the better solution or why.
