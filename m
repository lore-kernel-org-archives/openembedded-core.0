Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web10.9992.1593782339209417418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 06:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UQiveGVW;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id r12so20050471ilh.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 06:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8Nw7h22sFT7BKR3LsLblvFB7ds+lSQmz80LlU5Qq3M0=;
        b=UQiveGVW1pnoA8j1bEbR2mPMDcG1VmCe1f47y/Z+TbwBOAcL5hmK+7WLh4LITlIp9J
         bcnDU1oy4bwTxEGX3Ub5QXCMVDWIsgag+MLhxxShqd/DO5uRhcOzRXJqnAiwZXr4fApW
         9dMUwQvLtk5TcLirGZWS7J3jZK7jf1V9snXinYw/84Sy7+r1wY1McGCoTmslYH+/ElRC
         9CHydzhikHIAImfj4tofoy4CjE6qT0rjfAf47kp5AnENLFfXcm+B4fXeR682KmO/ECvh
         KjJXIAR+Zz1hUwyevzWENSKUC15LL9RQb1SrzzwLUNL4AuaALeylieir5oBUxmoO6bM0
         G4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8Nw7h22sFT7BKR3LsLblvFB7ds+lSQmz80LlU5Qq3M0=;
        b=TSiWBRvZJ/1HFBVDT/rfNvBHxP5FSDno8cDrSJqryExIs8D109LRB1jv99nGaBKleD
         rRaRSbNdtocdbadnbHUdyjFUIvI0EMaP0ude02JOC74T9ZIaL5zJmDhiDk5kFRhxrFGB
         PG8V/fM576D92TA9ialWFMmVRhSx6T3ZXAHsT5eU71ZSYDiaWabhbJKOJ4Zy8EJf6RmM
         U4xzeYFAti99QAxjWwX2azVPXL0KsvwwjIvMJS5j5b9thwTIArZsovwCrjQR1Dwk2WI0
         7NMWAgbCrtW1zLJIJ/S1k/aQuxKfBJlrQRdQ4EzmMCnNzxhnTI3QGyuwtps1UxGMpf9R
         QaTg==
X-Gm-Message-State: AOAM532HP1nlE3PmkPYauPrTcnRc4yUKairxS+Dg0wiphrtFxhe/UZi4
	4vD/UR4tdsdNkq+hjhKZ88Ntn6TF6tkHYKhl7hdJig==
X-Google-Smtp-Source: ABdhPJwS71Z1ym/SbmbabQmIa36phKm4L9i7DTYfVq/Lf2h0Nfu6eYD3ka3F7bo0tDNyDyFEDjogBCtj8LRUICA8nQ8=
X-Received: by 2002:a92:5f12:: with SMTP id t18mr17934764ilb.267.1593782338704;
 Fri, 03 Jul 2020 06:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200628133414.3246339-1-schnitzeltony@gmail.com>
 <20200628133414.3246339-3-schnitzeltony@gmail.com> <CALT56yNmLt7b3NcguRAiwxqU-sfh+J9diD7OgMEy8+k8jLhwbQ@mail.gmail.com>
 <161DF04A63288914.12013@lists.openembedded.org>
In-Reply-To: <161DF04A63288914.12013@lists.openembedded.org>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Fri, 3 Jul 2020 15:18:47 +0200
Message-ID: <CALbNGRR0vujrxXNH=57RJso3_SErGohqVXUsYt7U6xFc5ZZC_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] ccache: upgrade 3.7.9 -> 3.7.10
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2020 at 2:47 PM Andreas M=C3=BCller via
lists.openembedded.org
<schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Thu, Jul 2, 2020 at 2:00 PM Dmitry Baryshkov <dbaryshkov@gmail.com> wr=
ote:
> >
> > Hello,
> >
> > =D0=B2=D1=81, 28 =D0=B8=D1=8E=D0=BD. 2020 =D0=B3. =D0=B2 16:34, Andreas=
 M=C3=BCller <schnitzeltony@gmail.com>:
> > >
> > > remove SRC_URI[md5sum]
> > >
> > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > ---
> > >  .../ccache/{ccache_3.7.9.bb =3D> ccache_3.7.10.bb}               | 3=
 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >  rename meta/recipes-devtools/ccache/{ccache_3.7.9.bb =3D> ccache_3.7=
.10.bb} (86%)
> >
> > This update broke python3 here (see the attached do_compile log).
> > Reverting this patch fixes python compilation.
> >
> > --
> > With best wishes
> > Dmitry
> Will try to reproduce and hope to come up with something helpful
>
> Andreas
Did not understand why it did not fail during my tests. Looking into
some more I found out that I set INHERIT +=3D "ccache" in a build
environment that was not active. So in fact this patch went out
untested and yes now that ccache is active (not only) python3 fails to
build also here.

To make things even worse: From tomorrow on I will be out of reach
from all communication services for two weeks - need some outage

Have opened an issue at [1] - maybe there is support.

The only workaround I can offer currently is a revert of this patch -
what do others think?

Sorry for inconvenience

Andreas
