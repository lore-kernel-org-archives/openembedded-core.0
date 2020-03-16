Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id A6EDD6023A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 20:50:42 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id z8so12161150qto.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 13:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=65NsWT7ZdKf5y2a18fIEKH4nui4Pe4j3gHQs1BUuXII=;
	b=YLzKQcesUTGam3jagPgEXTYGyM5NBNbo9FsyIGwjyI/m6TowWB4nExKSDu8bKyNve6
	TkRzOKqzUtVdHvmhAjCcNmzA26y8Lo1nvdVMi5mFcIoPGUCwrI2YXk0QPt2/xRFVmx93
	TMv9pZFbDSXoHgACVGb7f/QhUqfKwwT3OK7zBqJROHQL26UnuOk7o+QLh/dQpEQkKgAm
	7+e80eaYRk4qVn2Gg8eyVn4UN+VcT9OrPwIDJJsEhQpwVH3pGctB8SpID6CCGGbv/yUA
	x3Dc+cW//VaDoseCdXcVH/3nhRSUjOv9GXcd0/HdLCGbK6OVjAt2OMuHlRvz9mwZlZwO
	3XjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=65NsWT7ZdKf5y2a18fIEKH4nui4Pe4j3gHQs1BUuXII=;
	b=LS9lyzzauGgityF+HFzNU8gmrcIHquWQEIpCll+2CG0fzC4Aj1hRAfToL9L9w1S6Cm
	3tHK15228huxGSpgDgsIApdQ7hnjOMI5Sdi4EsD950fi8zYOXMHKaCcZOHakcVi/xt5B
	bltZEvNNFXkTIpfZcKyYnRKfdfbYoiWU5be5nMCqGxRX0hoeZSIZXCkX2PshZfiyCfkI
	vR7j4fzOJXzwl5sQur9FUL68oC0qCLazmIdJD+WdRJh4Hx6Bm6x3bN69x+ImfjdxC75S
	g5LPyH5e1rDrFOujQsalg2csgbPQpF0+j/d71mQZTyf4lSU/2WH0feTakalpojrVZRAu
	SVuA==
X-Gm-Message-State: ANhLgQ3Q4HWhUcvj9RgDKN5W0EPJjF8IQK3ApDNYdNVt0nHEo10SvX35
	7IU6PHpTRyIinJaDAAza6MEWaiHOYswmflRFIjWib9WI
X-Google-Smtp-Source: ADFU+vtbWguaksRnmvJlWL4+hwM3i1GYlZzlp5aXmnE9cD2wCQCaU4Ips2Zl8+abUUQlitaYa6RozAo/Gg6SHJ+zCws=
X-Received: by 2002:ac8:5351:: with SMTP id d17mr2121787qto.190.1584391843282; 
	Mon, 16 Mar 2020 13:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200316190628.19383-1-raj.khem@gmail.com>
	<62485e60-999e-54c6-09a6-590a8a3e2072@gmail.com>
	<CAMKF1spN-06_oN-gnXO8osuKva3DerMBoGJ8zf41ybQPtm2Csw@mail.gmail.com>
	<c741696cac17d9b3cc50630c32ba9b0a46396cf0.camel@andred.net>
In-Reply-To: <c741696cac17d9b3cc50630c32ba9b0a46396cf0.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Mar 2020 13:50:17 -0700
Message-ID: <CAMKF1srjjKfaLFQH8UtL+-xdmB6_HtX=MaK3ZnJjP7LHBV2qng@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa: Extend parselogs to rpi4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Mar 2020 20:50:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2020 at 1:37 PM Andr=C3=A9 Draszik <git@andred.net> wrote:
>
> On Mon, 2020-03-16 at 12:17 -0700, Khem Raj wrote:
> > On Mon, Mar 16, 2020 at 12:12 PM akuster808 <akuster808@gmail.com> wrot=
e:
> > >
> > >
> > > On 3/16/20 12:06 PM, Khem Raj wrote:
> > > > rpi had additional diagnostics which should be ignored [1]
> > > >
> > > > [1] https://github.com/raspberrypi/linux/issues/3195
> > >
> > > So does this mean OE will take similar patches for every BSP in the w=
orld?
> > >
> >
> > suggest a better way and I will do that in BSP layer.
>
> Not sure about better way, but in my BSP layer I have:
>

thanks it certainly is better than what I have, I will adapt to it

> layer.conf:
> -----------
> DEFAULT_TEST_SUITES_remove_mx7d =3D "parselogs"
> DEFAULT_TEST_SUITES_append_mx7d =3D " parselogs_mx7bsp"
>
> lib/oeqa/runtime/cases/parselogs_mx7bsp.py:
> -------------------------------------------
> from oeqa.runtime.cases.parselogs import *
>
> mx7bsp_errors =3D [
>     'list of messages',
> ]
>
> ignore_errors['mymachine'] =3D mx7bsp_errors + common_errors
>
> class ParseLogsTestMX7BSP(ParseLogsTest):
>     pass
>
>
> A.
>
> >
> > > - armin
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/lib/oeqa/runtime/cases/parselogs.py | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oe=
qa/runtime/cases/parselogs.py
> > > > index cc4f5f8c78..48712d4dac 100644
> > > > --- a/meta/lib/oeqa/runtime/cases/parselogs.py
> > > > +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
> > > > @@ -183,6 +183,11 @@ ignore_errors =3D {
> > > >          'Failed to make EGL context current',
> > > >          'glamor initialization failed',
> > > >          ] + common_errors,
> > > > +    'raspberrypi4-64' : [
> > > > +        'bcmgenet fd580000.genet: failed to get enet-eee clock',
> > > > +        'bcmgenet fd580000.genet: failed to get enet-wol clock',
> > > > +        'bcmgenet fd580000.genet: failed to get enet clock',
> > > > +        ] + common_errors,
> > > >  }
> > > >
> > > >  log_locations =3D ["/var/log/","/var/log/dmesg", "/tmp/dmesg_outpu=
t.log"]
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

