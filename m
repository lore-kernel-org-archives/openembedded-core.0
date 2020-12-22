Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web08.12138.1608649043593239784
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 06:57:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YYpo+Qkj;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: erik.boto@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id o19so32704155lfo.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 06:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eLkxNAbWdQRp47ZFtk4/4Nq7gO9BU/yYfDKPkHn75PY=;
        b=YYpo+Qkj4AJ5CjIrAXhSpwJA+pRjpMavmJCcqgiEl6goGU3sfTj5xRCTfxKV16tlb2
         jgnGYsolnshi2apzq1NfPJM4u0mPJlZLcHGwuhPKDfXCqy0dFKkpJNuFu8DBEVvkwJ8j
         SCDmDmieseQIq3uKzM1Zykl9Kjy4VhWOvgL+GEs7HrlFd8bU4agNqCdIoh2Gjy9btXe2
         IPk5R+Difm2D03bLcA3IVZPbHb1EtKsXkGxlWopXpBXG3BLIcarud+UJiOstHaBfD1Kg
         kXC11rMdY6gbSpgGLIR120Z2NLW4ziIdPcQMnES5KB2w1sGdLIAhzMW4iMJf5hMmph8U
         uEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eLkxNAbWdQRp47ZFtk4/4Nq7gO9BU/yYfDKPkHn75PY=;
        b=X4BPCW/wn0NRAW9pnltsJmVrMhDi7Te9MRYGutpStFcNtAI2uEmTvmfRpERdNdLt+t
         8uRgKBYvP7V6/LCSSz4m6wrXgXOvc842/flc7AfnHxu4wAWEDXGoftmqI5wjEdMYiHxI
         4qxlGUYT6JRT+G49VZARcfJeMnVrNEJ07nuZoSsQEBAps5nUHBgSq+8WKVsLqZDK8Oat
         KnE0rXbbLHdH3gnyRBu0ddFq8vkug+OV0kC17g7dvUBU7DH/4f9tqpF7hBRivz6YY9du
         hHgqPlGr7elsHRL0qyIC/0oIRS13xW9Cb9AbRHfEow90yqTHRbtotxYEAVxmVCdE+Usc
         hLsg==
X-Gm-Message-State: AOAM5318JDFX7jCRZRlTImZ7BlTGqMD99wdgNLewcMGNfs2719ExqhSB
	u33cKCgEQj4qThdbMOvz83I0CHmKYviAiF7U+IU=
X-Google-Smtp-Source: ABdhPJzpQzMJjwy8Gd1x6+By54dpsTNHN0ULSSdObEjA6/lNbp4gcvg+gq7CB18IePT/jxwGzb9vr/VsnL17/KZ9pZA=
X-Received: by 2002:a05:651c:211d:: with SMTP id a29mr4441623ljq.487.1608649041914;
 Tue, 22 Dec 2020 06:57:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607007208.git.steve@sakoman.com> <CA+chaQeEFu6++N5J2qkEjU9HZPqjAahuDVGZAcfsma-9zjDLZw@mail.gmail.com>
 <CAOSpxdaJXGM5HMR0yvobzN2sa2cy-+AxLqsa99tD4pn6fiN7+g@mail.gmail.com>
 <CALNvYWMznudnN+_6yCkxcwxhtv=8M=hRC1nNpQP6Ww7ZTedvPg@mail.gmail.com>
 <45cc5593b9b9bfbdfde689a5f72a678a99eb5d2b.camel@linuxfoundation.org> <CAM9ZRVvCueC0+9b+Tvwv2pHm+44OGwU18O5zDH2wBUgghW_gjg@mail.gmail.com>
In-Reply-To: <CAM9ZRVvCueC0+9b+Tvwv2pHm+44OGwU18O5zDH2wBUgghW_gjg@mail.gmail.com>
From: "Erik Boto" <erik.boto@gmail.com>
Date: Tue, 22 Dec 2020 15:57:10 +0100
Message-ID: <CALNvYWPbzRzC_B7FEUTZX7t5ts_Si+vqPaD8cy99JOsEF4+LUQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/28] Patch review - pseudo file mode corruption fix series
To: Paul Barker <pbarker@konsulko.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>, 
	Martin Jansa <martin.jansa@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 22, 2020 at 2:50 PM Paul Barker <pbarker@konsulko.com> wrote:
>
> On Tue, 22 Dec 2020 at 10:03, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Tue, 2020-12-22 at 10:08 +0100, Erik Boto wrote:
> > > There's a bug affecting wic in combination with --exclude-path /
> > > --include-path that would then be backported into the LTS version.
> > > See
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14129.
> > >
> > > Maybe the issue that is being fixed is more serious then the issue
> > > being introduced so it's a valid trade-off, I just wanted to mention
> > > it so it's known.
> >
> > I've been suggesting Steve hold off this until we sorted out master,
> > having a patch queue ready is helpful though so we don't lose track of
> > all the patches.
> >
> > There were some fixes from Peter/Paul around pseudo which we needed and
> > have now merged which leaves the above issue...
> >
> > Cheers,
> >
> > Richard
>
> Looking at that bug (#14129) I wonder why "${WORKDIR}/build-wic" was
> added to PSEUDO_IGNORE_PATHS in
> https://git.openembedded.org/openembedded-core/commit/?id=ad8f5532ffaead9a5ad13e1034fe9e5e1b7979f4.
> Is anything likely to explode if we drop that addition?

Yes, if you try to build an image a second time it breaks and you have
to "bitbake -c clean <image>" in order to build it successfully again.
I don't recall the exact error at this time, but it was related to the
partition files wic created under build-wic.

Cheers,
Erik

>
> Thanks,
>
> --
> Paul Barker
> Konsulko Group
