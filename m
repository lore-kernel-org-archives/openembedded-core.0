Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id AF5B861C5B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 22:40:43 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id x18so2880280qki.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 15:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zrAlyCoPxquYKl74qpY6k7SRyksXzDeHY9VH7tMsdXw=;
	b=ULXo+YIGaIjneIT0hDQSEaJMnFTPoleHsd38pYhRRxAbZLnvkWwBz/UDvUGtchwh0L
	VU8uYfvgc3YxfPqUEFLl6JlpOdkvznAmg3vgx3Ig6sdtqPoN5L1yKO0CMzmBbgupfgyd
	0Cm8Zcway6Cipns0DHUiIzksZTNDlvWkBUokmT9iavFElNJMdvWXG+JMOFje3SYOq01I
	Tqv0iKmTHmSNcKsRuE72ycG31uD00S2eQDfAE3HU9r3Yxv+opXiOX0oXjGcHrEFVnaJg
	tm83fz/WYI3wenBTATOZjhxKxAWK7Z0Hs6qB4Z8sufwaNEYyglfJ2nqX6EWWjzEVkLtj
	pWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zrAlyCoPxquYKl74qpY6k7SRyksXzDeHY9VH7tMsdXw=;
	b=OU9Hxq4ypjZ/+rcEagjJkAo6ij7rDUxOT1qpb3SSfX3BArn4Te28+hYXi5BnTpfRFi
	IeR5CVbDe0SZN9nQFY1IpZbLWSA+jsT3xGZrAKJlWkhG2r4Io0M+wqKVhRw6KBxoGArm
	mLWOnSG5htJJIT4qzMi8ayf1ubjAeIz4zJwidQ25cRRxrJuP17J6xYrfEdanX/XbhcIF
	z/kO/iIdD8/fn6ne7vnzRnIvwSU52z/VhBcS88EeN+blpL7jmoiP3Eg/R8Zen8pn1I/K
	J6XiwBZu/2iuUwL+whrwz11C9fPpNH2XjLNdkrAiRo/LerpFOhsgyuoz2/u50O/uJ/Gk
	TrTg==
X-Gm-Message-State: ANhLgQ17xU7jeY0c4aYx3MiWTWuS+FAksjUmL5WpFPHlnit6BrODB2lh
	DRDMOoWum46IX99T6gkRpLsMQYVA+uoG9mpvaUM=
X-Google-Smtp-Source: ADFU+vvJceek+sasMbG3SHnKfXPJ7zpQhSyZ40sZ/Hq7Gn6x4sbJAeV5iaymgY1MnCdyPgNotEVBx3vWJPA9vSnLSKg=
X-Received: by 2002:a05:620a:22b:: with SMTP id
	u11mr23378247qkm.225.1584312044111; 
	Sun, 15 Mar 2020 15:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200315042947.3257882-1-raj.khem@gmail.com>
	<cc5e7bc5640347ac632c65f9f2ebf1f6a2693a0c.camel@linuxfoundation.org>
	<CAMKF1spW8XY4q2rbo8on6AiVjsrF+xmLCSgJ9-Yza31=18VWEg@mail.gmail.com>
	<3d626d46a2cf1cb10d0ae41444db96a65e65e201.camel@linuxfoundation.org>
In-Reply-To: <3d626d46a2cf1cb10d0ae41444db96a65e65e201.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Mar 2020 15:40:33 -0700
Message-ID: <CAMKF1sozrcG05rufCSBG0TPLhY6MJUy2dOL8Mh7DDUqSqfRzPA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bison: Reset load average settings if specified in environment
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
X-List-Received-Date: Sun, 15 Mar 2020 22:40:43 -0000
Content-Type: multipart/alternative; boundary="0000000000009a4b1a05a0ec641d"

--0000000000009a4b1a05a0ec641d
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 15, 2020 at 3:25 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2020-03-15 at 15:23 -0700, Khem Raj wrote:
> > On Sun, Mar 15, 2020 at 3:14 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Sat, 2020-03-14 at 21:29 -0700, Khem Raj wrote:
> > > > In some cases, we run into parallel build failures where
> > > > BUILT_SOURCES
> > > > is skipped, as a result required header files are not generated and
> > > > the
> > > > build fails with missing header errors like
> > > >
> > > > ../bison-3.5.2/lib/uniwidth/width.c:21:10: fatal error: uniwidth.h:
> > > > No such file or directory
> > > >  #include "uniwidth.h"
> > > >           ^~~~~~~~~~~~
> > > > compilation terminated.
> > > >
> > > > BUILT_SOURCES should be built automatically with `make all` [1]
> > > > therefore
> > > > ensure that make is invoked with `all` target
> > > >
> > > > bison-native parallel build fails when -l<n> is passed globally from
> > > > build environment, errors like below due to race starts to show up
> > > >
> > > > Therefore removes a previous load limit if set
> > > >
> > > > [1]
> > > >
> https://www.gnu.org/software/automake/manual/html_node/Built-Sources-Example.html#Built-Sources-Example
> > >
> > > I'm not sure I understand this. We've seen a failure on our ubuntu1604
> > > performance tester which I think is the same bug as this. The
> > > environment on that machine doesn't change, so how/where is this -l
> > > option coming from?
> > >
> >
> > From custom distro global settings for EXTRA_OEMAKE
> >
> > > I suspect there is some issue we're not quite getting to still :(
> > >
> >  its well reproducible now with -j and -l together on our builders, From
> what
> > I see in makefiles bison is doing right thing in using BUILT_SOURCES so
> > I suspect it could be make acting in a certain way when those options
> > are present.
> >
> > our custom settings use -l options globally in EXTRA_OEMAKE
> > this is to let machines with certain configurations build when machines
> are
> > shared, we don't want a given build to use all resources on box. Yes one
> > could say why not do something else to limit the resources build uses but
> > this is a global setting that works well
> >
> > This patch just ensures that any -l setting passed from environment is
> > cleaned up and reset. So for general case it will be a noop.
>
> Ok, that explains your failure but not the one on our performance
> testing worker :/.


What errors do you see on perf testing worker is it exactly same ?

>
>
> Cheers,
>
> Richard
>
>

--0000000000009a4b1a05a0ec641d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Mar 15, 2020 at 3:25 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, 2020-=
03-15 at 15:23 -0700, Khem Raj wrote:<br>
&gt; On Sun, Mar 15, 2020 at 3:14 PM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Sat, 2020-03-14 at 21:29 -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; In some cases, we run into parallel build failures where<br>
&gt; &gt; &gt; BUILT_SOURCES<br>
&gt; &gt; &gt; is skipped, as a result required header files are not genera=
ted and<br>
&gt; &gt; &gt; the<br>
&gt; &gt; &gt; build fails with missing header errors like<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; ../bison-3.5.2/lib/uniwidth/width.c:21:10: fatal error: uniw=
idth.h:<br>
&gt; &gt; &gt; No such file or directory<br>
&gt; &gt; &gt;=C2=A0 #include &quot;uniwidth.h&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~<br>
&gt; &gt; &gt; compilation terminated.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; BUILT_SOURCES should be built automatically with `make all` =
[1]<br>
&gt; &gt; &gt; therefore<br>
&gt; &gt; &gt; ensure that make is invoked with `all` target<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; bison-native parallel build fails when -l&lt;n&gt; is passed=
 globally from<br>
&gt; &gt; &gt; build environment, errors like below due to race starts to s=
how up<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Therefore removes a previous load limit if set<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; [1]<br>
&gt; &gt; &gt; <a href=3D"https://www.gnu.org/software/automake/manual/html=
_node/Built-Sources-Example.html#Built-Sources-Example" rel=3D"noreferrer" =
target=3D"_blank">https://www.gnu.org/software/automake/manual/html_node/Bu=
ilt-Sources-Example.html#Built-Sources-Example</a><br>
&gt; &gt; <br>
&gt; &gt; I&#39;m not sure I understand this. We&#39;ve seen a failure on o=
ur ubuntu1604<br>
&gt; &gt; performance tester which I think is the same bug as this. The<br>
&gt; &gt; environment on that machine doesn&#39;t change, so how/where is t=
his -l<br>
&gt; &gt; option coming from?<br>
&gt; &gt; <br>
&gt; <br>
&gt; From custom distro global settings for EXTRA_OEMAKE<br>
&gt; <br>
&gt; &gt; I suspect there is some issue we&#39;re not quite getting to stil=
l :(<br>
&gt; &gt; <br>
&gt;=C2=A0 its well reproducible now with -j and -l together on our builder=
s, From what<br>
&gt; I see in makefiles bison is doing right thing in using BUILT_SOURCES s=
o<br>
&gt; I suspect it could be make acting in a certain way when those options<=
br>
&gt; are present.<br>
&gt; <br>
&gt; our custom settings use -l options globally in EXTRA_OEMAKE<br>
&gt; this is to let machines with certain configurations build when machine=
s are<br>
&gt; shared, we don&#39;t want a given build to use all resources on box. Y=
es one<br>
&gt; could say why not do something else to limit the resources build uses =
but<br>
&gt; this is a global setting that works well<br>
&gt; <br>
&gt; This patch just ensures that any -l setting passed from environment is=
<br>
&gt; cleaned up and reset. So for general case it will be a noop.<br>
<br>
Ok, that explains your failure but not the one on our performance<br>
testing worker :/.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto=
">What errors do you see on perf testing worker is it exactly same ?</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--0000000000009a4b1a05a0ec641d--
