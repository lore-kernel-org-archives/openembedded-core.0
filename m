Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4371560135
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 13:42:34 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id i78so1749788vke.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 05:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jgmjqBxhFA5uiL3VhoILwS05/n51a9W5AAUgN4IhBLU=;
	b=DJ7h+xBJCbUmbNye3SY0+gXXWj62ubeluSh15aCgyMp+sm6t1uUgjikOJa6qTeCJdj
	2T6SQ855TzHUxbuh/CViCzK9pA3YEjRCB9yza0DzdrYiDYlP2rcZ3YqscelXSYKAEZLy
	tIiqc+95tqWwR3se1Gk2aKvl/aqtucsZp/NmTfrggwdpdm10tKdGkHAPPlswyPlIvokE
	173VEO6pvo13YkjiMwhnEUpun6lRgJh+NqiIMNXZlMRny0m1H5RpuFyvfsUx9NaynDiJ
	seiVEJHReTyXMR7BtBp0AO8M3AaZtGmHA2Icvo/OfWdst/oKTTm1PlAcBiundPxAS4n0
	+Pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jgmjqBxhFA5uiL3VhoILwS05/n51a9W5AAUgN4IhBLU=;
	b=c9KUqQGtfJUVDj+dAVR6ng2uueP9C+oLHUd5BfQreX6/EY8mHuMuVHLSL0hgW3+Pu6
	ymcBRzgmUezEbGmxOJZK1at8W4TPG5Z/i9XFlab4Mr7tyGV0aejdaGvH+uInfn9B13VY
	TnYf93m9II+cYZOxgiajzkOpVCLv8gUcEAG/iP7FjoUR91dzz5vYlzseqjxDx6STSavv
	F2fAIsdqAumWQHbvFR2+mYgfqOIwlQxdbDxBH/6unl7yV15yw/uUZOqVvy6wXoeLFUlO
	olqZ24PuCnS9vtqdSTMTUiDivbwj2mFP9/ekIA9e/9TFnsXtbD5OihNWDcRz7NPaoFU7
	gw2w==
X-Gm-Message-State: ANhLgQ3JZmuB/dmzVIjAweq4CIy17LSYefe8OzXz5jZMK7EVVeyeYBvc
	AZdbPuNAOSLeGOeVcL2VamaOQVeWa2qX94s9jzA=
X-Google-Smtp-Source: ADFU+vu7RG4BMwpnHNjHM37xMXWxzazZdSem8gOFYbtlmJC8vYiyNReO01qCkEB+Xg/UATvbJPXblwLz/uLIxXiV6Rw=
X-Received: by 2002:ac5:cdcd:: with SMTP id u13mr5217114vkn.0.1582983755301;
	Sat, 29 Feb 2020 05:42:35 -0800 (PST)
MIME-Version: 1.0
References: <20200229101433.30787-1-alex.kanavin@gmail.com>
	<23132fd4872488b259751cdf8bcd8335d703b205.camel@linuxfoundation.org>
	<CANNYZj_orEnKxs6AvyYTauDVexY+Eby2DeRYeh=9=-9i8TzTwg@mail.gmail.com>
	<d415671888365ca180bcfb72000bcd394f0e7b24.camel@linuxfoundation.org>
In-Reply-To: <d415671888365ca180bcfb72000bcd394f0e7b24.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 29 Feb 2020 14:42:23 +0100
Message-ID: <CANNYZj_RZ=Q1Me7_Ye+N4NmQBvW+fE2yDiRdsYu_XnCOGY_+nA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] piglit: move to meta-oe
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
X-List-Received-Date: Sat, 29 Feb 2020 13:42:35 -0000
Content-Type: multipart/alternative; boundary="0000000000006b8755059fb7203f"

--0000000000006b8755059fb7203f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat 29. Feb 2020 at 14.14, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2020-02-29 at 14:11 +0100, Alexander Kanavin wrote:
> > On Sat 29. Feb 2020 at 11.40, Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > On Sat, 2020-02-29 at 11:14 +0100, Alexander Kanavin wrote:
> > > > This recipe is build-heavy, yet is not part of any images and
> > > isn't
> > > > runtime tesed as
> > > > part of oe-core. There's no evidence of anyone using it, as all
> > > > commits are revision updates. It also pulls in NumPy, which is
> > > also
> > > > a significant support item, and wouldn't otherwise be part of
> > > core.
> > >
> > > I'm not sure about this. The intent was to use piglit as a way of
> > > improving our graphics testing, particularly allowing it to be
> > > automated.
> > >
> > > Whilst we've had to focus on getting the basics right, I'm not sure
> > > that objective isn't still a worthy goal over time?
> >
> > Piglit is meant for testing and validating OpenGL drivers for real
> > hardware. While we can put it on top of software Mesa driver or
> > virgl, I am not sure there is much value in that? Software rendering
> > might even be too slow to run in practice.
>
> OE-Core is meant to be usable for validating BSPs amongst other things
> though. Testing virgl does prove the graphics stack is working too from
> a software perspective so does have some value.


Right, I can put Piglit on top of virgl and see how well that works. It
would be good to enable virgl =E2=80=98out of the box=E2=80=99 at some poin=
t, I=E2=80=99ve been
proposing that for a while :)

Alex

>

--0000000000006b8755059fb7203f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Sat 29. Feb 2020 at 14.14, Richard Purdie &lt;<a href=3D"mailto:ric=
hard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;=
 wrote:<br></div><div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">On Sat, 2020-02-29 at 14:11 +0100, Alexander Kanavin wrote:<br>
&gt; On Sat 29. Feb 2020 at 11.40, Richard Purdie &lt;<br>
&gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Sat, 2020-02-29 at 11:14 +0100, Alexander Kanavin wrote:<br>
&gt; &gt; &gt; This recipe is build-heavy, yet is not part of any images an=
d<br>
&gt; &gt; isn&#39;t<br>
&gt; &gt; &gt; runtime tesed as<br>
&gt; &gt; &gt; part of oe-core. There&#39;s no evidence of anyone using it,=
 as all<br>
&gt; &gt; &gt; commits are revision updates. It also pulls in NumPy, which =
is<br>
&gt; &gt; also<br>
&gt; &gt; &gt; a significant support item, and wouldn&#39;t otherwise be pa=
rt of<br>
&gt; &gt; core.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;m not sure about this. The intent was to use piglit as a wa=
y of<br>
&gt; &gt; improving our graphics testing, particularly allowing it to be<br=
>
&gt; &gt; automated.<br>
&gt; &gt; <br>
&gt; &gt; Whilst we&#39;ve had to focus on getting the basics right, I&#39;=
m not sure<br>
&gt; &gt; that objective isn&#39;t still a worthy goal over time?<br>
&gt; <br>
&gt; Piglit is meant for testing and validating OpenGL drivers for real<br>
&gt; hardware. While we can put it on top of software Mesa driver or<br>
&gt; virgl, I am not sure there is much value in that? Software rendering<b=
r>
&gt; might even be too slow to run in practice.<br>
<br>
OE-Core is meant to be usable for validating BSPs amongst other things<br>
though. Testing virgl does prove the graphics stack is working too from<br>
a software perspective so does have some value.</blockquote><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Right, I can put Piglit on top of virgl and =
see how well that works. It would be good to enable virgl =E2=80=98out of t=
he box=E2=80=99 at some point, I=E2=80=99ve been proposing that for a while=
 :)</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"></blockquote></div></div>

--0000000000006b8755059fb7203f--
