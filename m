Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.1098.1596080068824407397
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 20:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PU5M11iZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id s23so19341552qtq.12
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 20:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AX6VaISyQbcWjRSiqrHdkWUUE0rQOlrpxYg6B64l75Q=;
        b=PU5M11iZ6amLXIPT7HJsYwSS+7Jzk3yp4EFABRtnXEjXPvC4DiQ5gRf3Ey6FoqI7Ee
         Y5s+IpMS2ACewvpVClYiTqAbOi6Wkidk/PKtmn+bgMf3eSykAbpp7WOURYUc4oGYdVWu
         2Y0GkqXBN3lhtxZm0IRZ5XdU8NJMC/Iu/nlFB+bc3o9NS9ih6LwULXLqBhqF6S8Nvk1h
         CZqbW70/JQDFKd6vBdxPgFpZ6Z7rOIkAwHEwP/tJ4N4RDSK9yHDm5U2uzjDDuidSDqFr
         TMdBKXsMTN0kD44Wgjy/rL2QKru/EagdU9v4dG2qNwRREa9Qj92ywt29TXG8F3XBdHkO
         LjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AX6VaISyQbcWjRSiqrHdkWUUE0rQOlrpxYg6B64l75Q=;
        b=INuC8pfNyYFOnKTlcncZpBsByxpTi4rx3Mlierp6cIGySvgecK5ViokriNpHS/wteO
         PpVNEP9kniyuyVwapp+NMSs0SP2muCahllGWU+/MAnWGudvqnU743sxZwHJgT+KVf9YI
         m2wVmxyBHYeR5tCvFPwA/lcxiAivQwr2Lh5sxzsRGuolzLyWlhyBmFalIWKkKj+bYz2L
         x1i7BUxkveRaCTDFQRrGS5dB3VykQ4QvKmham3yuxo9eV9XcAK2EZ/7g7YPSJPZfKZsI
         O5N+o7ZAVp2UPNz1pw8xcPqkV1+iRvialB3SoJy4jUwsOZzRBwVLPpZRsXO13Pgv521c
         DlXQ==
X-Gm-Message-State: AOAM531QBOMNaB5ML8PJXXNyyYNSgmmxSgZjZy1lopRq3Ik0fAQAKaiK
	wSXxROxrk0YcBGV/s+OP9N8V2d0wCk0rNx7AyKI=
X-Google-Smtp-Source: ABdhPJx1gVHAq4rimXN30la7RBO8PmNBu3X6edge5TO85Zsa3g+vn6pGoNFZ7StbNhLb2RFt4aNfUPQth1zfu1PoPPs=
X-Received: by 2002:ac8:748b:: with SMTP id v11mr966459qtq.293.1596080067885;
 Wed, 29 Jul 2020 20:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200729130916.38764-1-matthew.zeng@windriver.com>
 <d05d7357b7199a1e787d7f0510eaeacb46740a0a.camel@linuxfoundation.org>
 <87bljyqvzk.fsf@windriver.com> <e7a7ee265ac55cf179980f9deb5579b068e12299.camel@linuxfoundation.org>
 <CAMKF1sqZuL_0GE7uOuJqQTNm9TEazXDAsUZmzSebaAZq0VLzFQ@mail.gmail.com> <878sf1r8c9.fsf@windriver.com>
In-Reply-To: <878sf1r8c9.fsf@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 29 Jul 2020 20:34:00 -0700
Message-ID: <CAMKF1sq+MdGJY9A_V7=SDGxk5gAk53pqsWQsOrQYUHc-ozveaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2] ltp: remove OOM tests from runtest/mm
To: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 29, 2020 at 8:27 PM Mingde (Matthew) Zeng
<matthew.zeng@windriver.com> wrote:
>
>
> Khem Raj <raj.khem@gmail.com> writes:
>
> > on master-next I am also seeing
> >
> > step1b: WARNING: ltp-20200515-r0 do_patch: QA Issue: Patch log
> > indicates that patches do not apply cleanly. [patch-fuzz]
> >
> > I wonder if its related to this as well.
>
> My bad.
>
> Just a couple days ago ltp master introduced a commit directly effected the line above my change, resulting the diff to look slightly different.
>
> I could send a patch on top of this commit, or is it possible to revert this merged commit altogether and I will send a new patch, to keep the git log clean. Whichever preferred by YP.
>

its not in master yet so please send a v2.

>
> Matthew
>
> >
> > On Wed, Jul 29, 2020 at 6:43 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >>
> >> On Wed, 2020-07-29 at 09:41 -0400, Mingde (Matthew) Zeng wrote:
> >> > Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> >> >
> >> > > On Wed, 2020-07-29 at 09:09 -0400, Matthew wrote:
> >> > > > Fixes [YOCTO #13802]
> >> > >
> >> > > Thanks, we can reference the bug but I don't think we can yet claim
> >> > > it
> >> > > fixes it.
> >> >
> >> > Sure, would something like the following work?
> >> >
> >> > Reference [YOCTO #13802]
> >>
> >> Simply "[YOCTO #13802]" is fine (I'll tweak the commit message as I
> >> merge).
> >>
> >> > > The missing log issue happened again:
> >> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/908
> >> > > so I think there are multiple issues at play here.
> >> >
> >> > Can you attach this build's log.do_testimage so I can have a further
> >> > look?
> >>
> >> Sorry, that build directory has been reused in this case :( Next time
> >> that happens I'll try and spot/grab it.
> >>
> >> > > Is there any way to have the logging logged to disk straight away
> >> > > rather than stuck internally in oeqa's logging buffers? That way we
> >> > > could see which tests had run before a hang?
> >> > >
> >> > > Also, could we make the scp failure non-fatal, maybe a warning so
> >> > > that
> >> > > when it fails we can look at the rest of the logs?
> >> >
> >> > I'll further investigate this idea.
> >>
> >> Thanks!
> >>
> >> Cheers,
> >>
> >> Richard
> >>
> >> 
>
>
> --
> Mingde (Matthew) Zeng
