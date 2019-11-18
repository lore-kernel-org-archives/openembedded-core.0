Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7E9227F69E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 22:16:41 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id q19so7271092qvs.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 14:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3HLWmvye6xt2+7In5yknqOXWnhugr+wedZcmVZ3rCSI=;
	b=KCb2m9kRP0U9DVX/zroqmRq/Buuv2Efb1qJQBT2n3yIWzm41bPXd7dY7VzZ9A02SdC
	GRmy1wLeUN4/FenLM99BuD1I8aEkrOv2Swbedhk7jzHssirbPsPSUmxaO0TQ/SjXRfCH
	t8S6/6Bh3RPuhqGrJ5GOF3sHnK7TSBpU+HoBTs2gQmaiEz0xDOMYZnIOaHblqfxUBWNq
	qkPHerF/9d20iu3GkYnlVy6wtSy+Hn5EJtVnQibpSW/Ku9ZwtY7Z2tJj59Nq3wCmP4lA
	zmhiQ0uCLfz9vHX/cEQG25I2NbMYxukyIqOH7Eu4GUzygYHmNY9yJRtYmFZAXlHW0gpa
	QdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3HLWmvye6xt2+7In5yknqOXWnhugr+wedZcmVZ3rCSI=;
	b=Lz/EXDgZOb9V8EeR189YD5X1f5RmM9uHRgHqtiLiFVCjFjkV7m2Otd/oVN26n+toqU
	l8Cx+qvfLyBDWRVXOfyoc6jF+N0bJHRF0dOQCLIBPV18KP7uZ2Ag3onEb8jZuZnps3MF
	HYNKnIaW0DrZWFwA92YQOlsVzWLkR9BwgnyO0Vf9gBIwBdyq6GZ6kOseh0t41m29jcOA
	CukCkjxwDglg6r8RzHaQ0l70LXWbJjjFOnoelgj5XmZp9U3A4ZLVoPuAY9V07tWBwpD8
	YOGApDiiuJBP+r8mhKaMvaDGXmystCj8RhCjvvhxCwneSvF3fatcEQflUIPHz35eWmfB
	LEsg==
X-Gm-Message-State: APjAAAUMnPV0HfN9Zx2grYQTYBbzDNMVaG9asNEBKTJSiclr9KPxi3on
	EeZsQL7GHc1kylwZoIOdKecuoKsx66LWSMZvA2c=
X-Google-Smtp-Source: APXvYqwp/U98pmyARr5ADWku7AClBQUMXLJfsQd9XJkBBRdW0VB2BT2pZ/czfzlfD9taeEKTs1rUHa64htXx60G9LUE=
X-Received: by 2002:ad4:4789:: with SMTP id z9mr28283394qvy.109.1574115401924; 
	Mon, 18 Nov 2019 14:16:41 -0800 (PST)
MIME-Version: 1.0
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
	<CAMKF1sp5SWYgoOj7Ujy5GMEEcuuATkuD45q7k7+LSc2SSkTVNg@mail.gmail.com>
	<20191118210500.GA4741@localhost>
	<CAMKF1spsipv7AbxJfmwHMU5dPtPDm-8VBxeQGWhEGUxJFG4WUw@mail.gmail.com>
	<20191118220613.GA7568@localhost>
In-Reply-To: <20191118220613.GA7568@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Nov 2019 14:16:30 -0800
Message-ID: <CAMKF1sq3hnUuM7rcCbEhfbTmUtGbpMVVZkq8mFo24FKGG=kFYA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/13] python: update to 2.7.17
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
X-List-Received-Date: Mon, 18 Nov 2019 22:16:41 -0000
Content-Type: multipart/alternative; boundary="0000000000005e04680597a64dcd"

--0000000000005e04680597a64dcd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 2:06 PM Adrian Bunk <bunk@stusta.de> wrote:

> On Mon, Nov 18, 2019 at 01:39:48PM -0800, Khem Raj wrote:
> > On Mon, Nov 18, 2019 at 1:05 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > On Mon, Nov 18, 2019 at 10:13:05AM -0800, Khem Raj wrote:
> > > > On Mon, Nov 18, 2019 at 5:08 AM Alexander Kanavin
> > > > <alex.kanavin@gmail.com> wrote:
> > > > >
> > > > > Drop backports, rebase a couple of patches.
> > > > >
> > > > > This is the second last release of py 2.x; upstream support ends =
on
> > > > > 1 January 2020, there will be one final 2.x afterwards.
> > > > >
> > > > > Note that the only thing that still needs python 2.x in oe-core i=
s
> > > > > u-boot; when the next u-boot update arrives, we should find out
> > > > > where the py3 migration is for that component before merging the
> > > > > update.
> > > >
> > > > I guess u-boot need it during build, in that case defer it to user =
to
> > > > have python2 on build host
> > > > could be possible.
> > > >...
> > >
> > > That's a non-option since it could mean
> > > "Yocto 3.1 cannot be built on Ubuntu 20.04".
> > >
> > > Ubuntu 20.04 might end up still shipping Python2,[1]
> > > but you cannot rely on future distributions shipping it.
> >
> > And why should OE ship something that=E2=80=99s dropped by its own upst=
ream and
> > other distributions
>
> All I am saying is that relying on the host Python2 is a non-option.
>
> If any layer needs a native Python2, this has to be shipped either in
> this layer or in a layer it depends on.


We should explore disabling python support in uboot if it does not move to
py3 perhaps there is a way like that having a single recipe require py2 is
a bit too much


>
> cu
> Adrian
>

--0000000000005e04680597a64dcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Nov 18, 2019 at 2:06 PM Adrian Bunk &lt;<a href=3D"=
mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On Mon, Nov 18, 2019 at 01:39:48PM -0800, Khem Raj wrote:=
<br>
&gt; On Mon, Nov 18, 2019 at 1:05 PM Adrian Bunk &lt;<a href=3D"mailto:bunk=
@stusta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br>
&gt; &gt; On Mon, Nov 18, 2019 at 10:13:05AM -0800, Khem Raj wrote:<br>
&gt; &gt; &gt; On Mon, Nov 18, 2019 at 5:08 AM Alexander Kanavin<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_bla=
nk">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Drop backports, rebase a couple of patches.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This is the second last release of py 2.x; upstream sup=
port ends on<br>
&gt; &gt; &gt; &gt; 1 January 2020, there will be one final 2.x afterwards.=
<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Note that the only thing that still needs python 2.x in=
 oe-core is<br>
&gt; &gt; &gt; &gt; u-boot; when the next u-boot update arrives, we should =
find out<br>
&gt; &gt; &gt; &gt; where the py3 migration is for that component before me=
rging the<br>
&gt; &gt; &gt; &gt; update.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I guess u-boot need it during build, in that case defer it t=
o user to<br>
&gt; &gt; &gt; have python2 on build host<br>
&gt; &gt; &gt; could be possible.<br>
&gt; &gt; &gt;...<br>
&gt; &gt;<br>
&gt; &gt; That&#39;s a non-option since it could mean<br>
&gt; &gt; &quot;Yocto 3.1 cannot be built on Ubuntu 20.04&quot;.<br>
&gt; &gt;<br>
&gt; &gt; Ubuntu 20.04 might end up still shipping Python2,[1]<br>
&gt; &gt; but you cannot rely on future distributions shipping it.<br>
&gt; <br>
&gt; And why should OE ship something that=E2=80=99s dropped by its own ups=
tream and<br>
&gt; other distributions<br>
<br>
All I am saying is that relying on the host Python2 is a non-option.<br>
<br>
If any layer needs a native Python2, this has to be shipped either in <br>
this layer or in a layer it depends on.</blockquote><div dir=3D"auto"><br><=
/div><div dir=3D"auto">We should explore disabling python support in uboot =
if it does not move to py3 perhaps there is a way like that having a single=
 recipe require py2 is a bit too much=C2=A0</div><div dir=3D"auto"><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><br>
<br>
cu<br>
Adrian<br>
</blockquote></div></div>

--0000000000005e04680597a64dcd--
