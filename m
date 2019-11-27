Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4D01D7FA30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 21:14:02 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id m125so20837380qkd.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 13:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=48OdT3a8a/jWe/SC9828XhTdDoDm/TAzIPtD8HU415Y=;
	b=J5nZB9eG2m5yQ9Fm6Th+PvoEuf7JMsN/WJAKtdx1oiV4ghkufyhYC+8mjUAcVShrcY
	6EVzSz1PWuz9CoWUidqmKPPyp8Z1qc2A/cBlL5yw1cb9/nKeYWAi7qgKr8yGW5+J5UDG
	dPT3JkwAI0NGhjXp1yEjqFKschjURfGAho4TZGjfd5vSdZLJIwou+Nb3xqNS/5TGyTiA
	k2Q20CLq0BRtMpLlt2oDMFN3ntDzRLlH5IEQ5VjCPuqCZDi1vMGbQ+kL0I1zwYPnaCV0
	p9kFJkvj3VzfyDW46Kn697bIq4D/8ydQ4iYCHv+WU4UQUwx6yulBkqsh+IvS2kp6rFRC
	KWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=48OdT3a8a/jWe/SC9828XhTdDoDm/TAzIPtD8HU415Y=;
	b=JUdBM6XwFK/Rwk9hGQMdxGoLm/8+Cmtytd+zvIeXu6MrMFxTRwci703S+hJXjDCfAE
	VVf2fZLV2uXjp0ctLR1fjl6Ez/0q+d8wstFJQEpi9d1P/ATaridJZEnf8iUvJ5eHIO1Z
	gq2uVPosKTgQltakyJ+ZKqzWCMKBkCCmLIK3TCyJcIgOYdtFLDSfcYKhtOCGvQPMjuV+
	MKomaEeV+1oxToQ7BpUqelpPslv+YtARwzoFqJHilPFoMQBJu1Koc1nqE81MorbT1KkI
	nsKAfDLRGD49qto1REFw3/9oAU0iSUp6ye2LKl692JUemhcFI9WeNrSJx2+2vkNWRpzP
	6wQg==
X-Gm-Message-State: APjAAAX5ycDeFhUltbj5FZnIcOJ/4CuUJdStPqjFa+GKOHTOs+YfkpuD
	i6Ipmg1u/uJwPbMwmBmZPzJ5eEqWWrMAnsiPLuc=
X-Google-Smtp-Source: APXvYqzeN9dGx8Gng8K4KVnd1Y47tGjDvwPy8nju8W3vgZzOUN9JhUPXHTk8QDDE3DuUm4UJ3CsuO+KsYac8yXk8oHo=
X-Received: by 2002:a37:4cd3:: with SMTP id z202mr6733089qka.212.1574889242509;
	Wed, 27 Nov 2019 13:14:02 -0800 (PST)
MIME-Version: 1.0
References: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
	<e92b8e21-99c6-c2c9-646a-b3a2e76d90aa@intel.com>
	<20191125211027.GA32080@localhost>
	<0c6015a022140c820803a3963ef33af984f19c8c.camel@gmail.com>
	<20191126195632.GA27863@localhost>
	<CAMKF1sq6=mY5WbyCE2APxNzBvqurr65vvrdubMvnA7b=fOD0_w@mail.gmail.com>
	<20191127063729.GA31353@localhost>
In-Reply-To: <20191127063729.GA31353@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Nov 2019 13:13:51 -0800
Message-ID: <CAMKF1soggA5tcr-ousJ12WZdVSTOnmTDDkWMPLy=DFyvG-bMAA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Very large size of libraries in core-image-minimal rootfs
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
X-List-Received-Date: Wed, 27 Nov 2019 21:14:02 -0000
Content-Type: multipart/alternative; boundary="000000000000dc4ee405985a79c5"

--000000000000dc4ee405985a79c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2019 at 10:37 PM Adrian Bunk <bunk@stusta.de> wrote:

> On Tue, Nov 26, 2019 at 02:57:43PM -0800, Khem Raj wrote:
> > On Tue, Nov 26, 2019 at 11:56 AM Adrian Bunk <bunk@stusta.de> wrote:
> >...
> > > > there are many other design considerations where musl might make mo=
re
> > > > sense
> > >
> > > Which of these are not covered by linking only your application
> > > with musl?
> > >
> > > It is not clear that all this outweights the constant pains of forcin=
g
> > > people to fix the steady stream of new musl issues for all recipes.
> > >
> > For a moment if you do not assume glibc =3D=3D linux then
> > Most of times issues are in application assuming wrong things from
> system.
> > in cases where issues are
>
> In general I consider portability a positive thing, but it is also
> legitimate when an upstream makes the decision to use everything
> provided by glibc.
>
> But this is not really relevant when discussing what kind of effort
> should be required from people contributing to OE - many build failures
> and work are a price OE pays for musl compatibility, and it can be
> questioned whether it is really worth spending scarce resources on that.
>
> The effort is smaller and the benefits are clearer when supporting musl
> only in a limited amount of recipes relevant for tiny systems.
>
> >...
> > > The combinations that are most relevant in practice are:
> > > - normal: -O2 + glibc + systemd
> > > - tiny: -Os + musl + busybox init
> >
> > again its two of many combinations  with OE.
>
> There are combinations that match common usecases, and there are
> combinations that don't match common usecases.
>
> Development and testing effort is best spent on combinations that
> match common usecases.


Keeping rat holing and derailing conversation in mind this will be my last
reply to this thread

It=E2=80=99s an opensource project and if contributors stop contributing to=
 musl
effort it will die on its own we do t have to install a kill switch. OE
philosophy is to be a distro builder not a distro that=E2=80=99s key differ=
entiator
and all of these arguments are very distro centric mindset. We do ask for
keeping builds clean and help with servicing the part of project that
interests a person, so pitch in what interests and hopefully there will be
enough of us around to support OE



>
> poky-tiny building with -O2 is weird.
>
> > > Using musl with -O2 or with systemd is far from the primary usecase
> > > of using musl for size benefits.
> > >
> > > The other advantage of -Os is that it is also useful for non-tiny
> > > systems since the benefits scale with the size of the filesystem.
> > > It is a nice knob to fix kernel or userspace space problems that
> > > does not change the API or ABI.
> >
> > perhaps, however, reducing code size is a design decision more than
> > compiler switch problem. Throwing any code at the compiler and expectin=
g
> > it to optimize for a given vector is never optimal.
>
> The compiler switch is part of the design decision, and on a tiny system
> you do often not have the luxury of picking only some size
> optimizations.


And not many upstream packages are built and tested regularly with Os leave
aside writing size friendly code in their dev streams so perhaps someone
should help them provide help testing with Os things will get better


>
> Tiny is when you have to squeeze bootloader, kernel and userspace
> together on 4 MB flash


Why 4 and not 2 or 16 fact is it depends on usecase


>
> cu
> Adrian
>

--000000000000dc4ee405985a79c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Nov 26, 2019 at 10:37 PM Adrian Bunk &lt;<a href=3D=
"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On Tue, Nov 26, 2019 at 02:57:43PM -0800, Khem Raj wrote=
:<br>
&gt; On Tue, Nov 26, 2019 at 11:56 AM Adrian Bunk &lt;<a href=3D"mailto:bun=
k@stusta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br>
&gt;...<br>
&gt; &gt; &gt; there are many other design considerations where musl might =
make more<br>
&gt; &gt; &gt; sense<br>
&gt; &gt;<br>
&gt; &gt; Which of these are not covered by linking only your application<b=
r>
&gt; &gt; with musl?<br>
&gt; &gt;<br>
&gt; &gt; It is not clear that all this outweights the constant pains of fo=
rcing<br>
&gt; &gt; people to fix the steady stream of new musl issues for all recipe=
s.<br>
&gt; &gt;<br>
&gt; For a moment if you do not assume glibc =3D=3D linux then<br>
&gt; Most of times issues are in application assuming wrong things from sys=
tem.<br>
&gt; in cases where issues are<br>
<br>
In general I consider portability a positive thing, but it is also <br>
legitimate when an upstream makes the decision to use everything<br>
provided by glibc.<br>
<br>
But this is not really relevant when discussing what kind of effort <br>
should be required from people contributing to OE - many build failures <br=
>
and work are a price OE pays for musl compatibility, and it can be <br>
questioned whether it is really worth spending scarce resources on that.<br=
>
<br>
The effort is smaller and the benefits are clearer when supporting musl<br>
only in a limited amount of recipes relevant for tiny systems.<br>
<br>
&gt;...<br>
&gt; &gt; The combinations that are most relevant in practice are:<br>
&gt; &gt; - normal: -O2 + glibc + systemd<br>
&gt; &gt; - tiny: -Os + musl + busybox init<br>
&gt; <br>
&gt; again its two of many combinations=C2=A0 with OE.<br>
<br>
There are combinations that match common usecases, and there are <br>
combinations that don&#39;t match common usecases.<br>
<br>
Development and testing effort is best spent on combinations that<br>
match common usecases.</blockquote><div dir=3D"auto"><br></div><div dir=3D"=
auto">Keeping rat holing and derailing conversation in mind this will be my=
 last reply to this thread=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">It=E2=80=99s an opensource project and if contributors stop contr=
ibuting to musl effort it will die on its own we do t have to install a kil=
l switch. OE philosophy is to be a distro builder not a distro that=E2=80=
=99s key differentiator and all of these arguments are very distro centric =
mindset. We do ask for keeping builds clean and help with servicing the par=
t of project that interests a person, so pitch in what interests and hopefu=
lly there will be enough of us around to support OE</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
poky-tiny building with -O2 is weird.<br>
<br>
&gt; &gt; Using musl with -O2 or with systemd is far from the primary useca=
se<br>
&gt; &gt; of using musl for size benefits.<br>
&gt; &gt;<br>
&gt; &gt; The other advantage of -Os is that it is also useful for non-tiny=
<br>
&gt; &gt; systems since the benefits scale with the size of the filesystem.=
<br>
&gt; &gt; It is a nice knob to fix kernel or userspace space problems that<=
br>
&gt; &gt; does not change the API or ABI.<br>
&gt; <br>
&gt; perhaps, however, reducing code size is a design decision more than<br=
>
&gt; compiler switch problem. Throwing any code at the compiler and expecti=
ng<br>
&gt; it to optimize for a given vector is never optimal.<br>
<br>
The compiler switch is part of the design decision, and on a tiny system <b=
r>
you do often not have the luxury of picking only some size <br>
optimizations.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">An=
d not many upstream packages are built and tested regularly with Os leave a=
side writing size friendly code in their dev streams so perhaps someone sho=
uld help them provide help testing with Os things will get better</div><div=
 dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Tiny is when you have to squeeze bootloader, kernel and userspace <br>
together on 4 MB flash</blockquote><div dir=3D"auto"><br></div><div dir=3D"=
auto">Why 4 and not 2 or 16 fact is it depends on usecase</div><div dir=3D"=
auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
cu<br>
Adrian<br>
</blockquote></div></div>

--000000000000dc4ee405985a79c5--
