Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.15422.1594126372570369728
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 05:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pSCVYz9N;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: dbaryshkov@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id ch3so3295301pjb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2020 05:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2T5qAyXarZxY97OTwHJ62tVT7ahnKKNKEqvIK+3Rxzk=;
        b=pSCVYz9NfB3/nLY+3L+LMvQSGMgNC/8XqXkJL/bG79A95G7F6yk4nvRIPWicRwwVxF
         oxI3iwa4uIZkdMqR9U2ZAHgS4krCCymZ1MLWICakbG7o/juoDd8Frj9/F+ZODUShGVu+
         qp/umJWAIU1TZ8Kn3y+sUK3JKwy5q+aSLmDxRDunvW1QWKIOacve0N2O7Jqs+d7ha+ia
         6dWMLpFMlG7aK47q7/rognf213aEv5C8qsnuwN228GLMd2J8KFeFNRP2e9Gs3H5Qmjpq
         RBmzGhZm/M90194nW4bx563x5D6JErnGqrCO1fAj1JYn7QadVOiACY9kLMU+msKXxhnu
         JvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2T5qAyXarZxY97OTwHJ62tVT7ahnKKNKEqvIK+3Rxzk=;
        b=CSCp6cDNMbVsT1RCYrXBBXdhcRZNJfYaudzcW3vL9DBqhq9v3mjLFJWKL3UCj8iIYV
         NS05IWUGLGNO3ogSHT8lli49guEd2wBazhGl1AHvJ+lpUeaKJiQHleoFb278ZBr3YXdg
         xSTONhT+WhE4xiZEtTSYnDCzZt1zw7w0C8QqL/twTNTyO0nWcOB9iaEILWttCFIgVsXL
         /VxnOyIoc/3Wlk5DcQfbJdfE0Y+j/cM5Y2puEkBAPUM8ZZ1X2udNJuSB1IppGhwbYMiC
         kvM8pC1T7XhJaoPdTwqj3Y04TbWg9elnkSP75SMN65TJm0MyIEzGPO+TzeRswQqL+66V
         b3AA==
X-Gm-Message-State: AOAM531YRk63OuYIk/tUn1gbKHt274wL7zaiv8n5XJa17vPo3Os5Avpt
	FRoQMRmlZJGfIj6xaA7sCQoRm1IABnLATwU1dtE=
X-Google-Smtp-Source: ABdhPJzYI6GEi7Fz7N4uvIIkkjCrY+YXyevT4RqGkSDWRYJ9EIJiY84SEH1JyEn3g+a/bo8rRiwuiSxRIjVA9CWSBHc=
X-Received: by 2002:a17:902:302:: with SMTP id 2mr18571596pld.169.1594126371946;
 Tue, 07 Jul 2020 05:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200628133414.3246339-1-schnitzeltony@gmail.com>
 <20200628133414.3246339-3-schnitzeltony@gmail.com> <CALT56yNmLt7b3NcguRAiwxqU-sfh+J9diD7OgMEy8+k8jLhwbQ@mail.gmail.com>
 <161DF04A63288914.12013@lists.openembedded.org> <CALbNGRR0vujrxXNH=57RJso3_SErGohqVXUsYt7U6xFc5ZZC_A@mail.gmail.com>
In-Reply-To: <CALbNGRR0vujrxXNH=57RJso3_SErGohqVXUsYt7U6xFc5ZZC_A@mail.gmail.com>
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
Date: Tue, 7 Jul 2020 15:52:39 +0300
Message-ID: <CALT56yPQuAgL9WUk0RK30gYk3q9xoCr9U+7ojmG2FwjBodr-zg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] ccache: upgrade 3.7.9 -> 3.7.10
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

=D0=BF=D1=82, 3 =D0=B8=D1=8E=D0=BB. 2020 =D0=B3. =D0=B2 16:18, Andreas M=C3=
=BCller <schnitzeltony@gmail.com>:
>
> On Thu, Jul 2, 2020 at 2:47 PM Andreas M=C3=BCller via
> lists.openembedded.org
> <schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > On Thu, Jul 2, 2020 at 2:00 PM Dmitry Baryshkov <dbaryshkov@gmail.com> =
wrote:
> > >
> > > Hello,
> > >
> > > =D0=B2=D1=81, 28 =D0=B8=D1=8E=D0=BD. 2020 =D0=B3. =D0=B2 16:34, Andre=
as M=C3=BCller <schnitzeltony@gmail.com>:
> > > >
> > > > remove SRC_URI[md5sum]
> > > >
> > > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > > ---
> > > >  .../ccache/{ccache_3.7.9.bb =3D> ccache_3.7.10.bb}               |=
 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > >  rename meta/recipes-devtools/ccache/{ccache_3.7.9.bb =3D> ccache_3=
.7.10.bb} (86%)
> > >
> > > This update broke python3 here (see the attached do_compile log).
> > > Reverting this patch fixes python compilation.
> > >
> > > --
> > > With best wishes
> > > Dmitry
> > Will try to reproduce and hope to come up with something helpful
> >
> > Andreas
> Did not understand why it did not fail during my tests. Looking into
> some more I found out that I set INHERIT +=3D "ccache" in a build
> environment that was not active. So in fact this patch went out
> untested and yes now that ccache is active (not only) python3 fails to
> build also here.
>
> To make things even worse: From tomorrow on I will be out of reach
> from all communication services for two weeks - need some outage
>
> Have opened an issue at [1] - maybe there is support.

Link missing:
https://github.com/ccache/ccache/issues/615

>
> The only workaround I can offer currently is a revert of this patch -
> what do others think?

I'd suggest reverting the patch for now.


--=20
With best wishes
Dmitry
