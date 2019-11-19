Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3A45A7F870
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:57:46 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id i11so11136129iol.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 23:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=76lhkKVkdZbBIYhEpgr3spNlkUICkkUbqQoJGMptqsI=;
	b=ueYNFpRar2aPZpM/olieApKiaJVWL2VgpOmQIPiEL9NHdfxhWLpUA1rKUM1ic6CZvc
	NE//rkjW1jR1bogbzEd5arJIZbwZHG60QSlgoTpkgSpQrcE/bSiiVVrWIHYQwcuSZBA/
	+NyfbEkCjahr7LDNq5kHF4bdyOSMo7Hx03MLIHsyMw0ZviK7nak0+7s29ucj6ds6M85B
	bea2ZztxVDD3zPFDmauYfYFft+ZIdkU9E7tAdG83eKFxsiq1bf1q4egOclzRb09SMCFw
	fuw1adTQxAp9ovuXPHNWTDpI2pFVRCCNocGPMvMWlm5sm3OXTvnMTa3/0aEdEJK+sUJh
	hOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=76lhkKVkdZbBIYhEpgr3spNlkUICkkUbqQoJGMptqsI=;
	b=W8kLu7vfbEB0k4Wr/cFfMSq6BKd2nENMRgEV4hfI5YTERAdfEiSSLktggcf4AzhQF1
	rkuDp2Vgm9AVOGZCVkK0EcqSDRON3F55Ew90VqLyqQ+Snv/+1FCChi5808muZn1EjfV9
	JJPa5U4cwgrdwtJB0K1fe6lsnDYe0nMF4NhtJnuIF0nMfeIMOgVCyGAyBVbqlbJClm0T
	dZOBsCZYvxpZqb1wTfBuQX3bSNrD7T14C8bFcATr7J5dtAQt8xPy4MZgI2Z/5+32pgF3
	7RYuKGst3NRwM06KO5p79eY4muCNR7UjA9GDqEBCklDk1OoEd332DgF2Q00UtpKyhc4q
	6jCA==
X-Gm-Message-State: APjAAAVZZ85qWAK9dskmKbyh9tIpzPgC9db4m+iP31su5lVy8JOoS0U5
	izt4+dOiAHB5l8wV3VKSKFMLUfE9NYmwljB4JdE=
X-Google-Smtp-Source: APXvYqzHzgM2fpTPTKHp9SsrrIqV1pI/VxWSuwNbT+GZXxnptDeRRQeMzDgEHNubYZ7ywVtlsmQo2E5kU1M958YvExw=
X-Received: by 2002:a6b:6304:: with SMTP id p4mr12079823iog.170.1574150267175; 
	Mon, 18 Nov 2019 23:57:47 -0800 (PST)
MIME-Version: 1.0
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
	<CAMKF1sp5SWYgoOj7Ujy5GMEEcuuATkuD45q7k7+LSc2SSkTVNg@mail.gmail.com>
	<20191118210500.GA4741@localhost>
	<CAMKF1spsipv7AbxJfmwHMU5dPtPDm-8VBxeQGWhEGUxJFG4WUw@mail.gmail.com>
	<20191118220613.GA7568@localhost>
	<CAMKF1sq3hnUuM7rcCbEhfbTmUtGbpMVVZkq8mFo24FKGG=kFYA@mail.gmail.com>
	<20191118225500.GB7568@localhost>
	<CAMKF1squJq7mLJJBhf_+EQbBTHb1c8R1g449e6Uo2v=MtNk2XQ@mail.gmail.com>
In-Reply-To: <CAMKF1squJq7mLJJBhf_+EQbBTHb1c8R1g449e6Uo2v=MtNk2XQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 18 Nov 2019 23:57:36 -0800
Message-ID: <CANx9H-D0Bve0QUDd3pERWV7xOvTfjro5+=FuaAJUxYz+tp3X5w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Adrian Bunk <bunk@stusta.de>
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
X-List-Received-Date: Tue, 19 Nov 2019 07:57:47 -0000
Content-Type: multipart/alternative; boundary="0000000000007f8a750597ae6b3c"

--0000000000007f8a750597ae6b3c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 3:27 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Nov 18, 2019 at 2:55 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Mon, Nov 18, 2019 at 02:16:30PM -0800, Khem Raj wrote:
> > > On Mon, Nov 18, 2019 at 2:06 PM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > > On Mon, Nov 18, 2019 at 01:39:48PM -0800, Khem Raj wrote:
> > > > > On Mon, Nov 18, 2019 at 1:05 PM Adrian Bunk <bunk@stusta.de>
> wrote:
> > > > > > On Mon, Nov 18, 2019 at 10:13:05AM -0800, Khem Raj wrote:
> > > > > > > On Mon, Nov 18, 2019 at 5:08 AM Alexander Kanavin
> > > > > > > <alex.kanavin@gmail.com> wrote:
> > > > > > > >
> > > > > > > > Drop backports, rebase a couple of patches.
> > > > > > > >
> > > > > > > > This is the second last release of py 2.x; upstream support
> ends on
> > > > > > > > 1 January 2020, there will be one final 2.x afterwards.
> > > > > > > >
> > > > > > > > Note that the only thing that still needs python 2.x in
> oe-core is
> > > > > > > > u-boot; when the next u-boot update arrives, we should find
> out
> > > > > > > > where the py3 migration is for that component before mergin=
g
> the
> > > > > > > > update.
> > > > > > >
> > > > > > > I guess u-boot need it during build, in that case defer it to
> user to
> > > > > > > have python2 on build host
> > > > > > > could be possible.
> > > > > > >...
> > > > > >
> > > > > > That's a non-option since it could mean
> > > > > > "Yocto 3.1 cannot be built on Ubuntu 20.04".
> > > > > >
> > > > > > Ubuntu 20.04 might end up still shipping Python2,[1]
> > > > > > but you cannot rely on future distributions shipping it.
> > > > >
> > > > > And why should OE ship something that=E2=80=99s dropped by its ow=
n
> upstream and
> > > > > other distributions
> > > >
> > > > All I am saying is that relying on the host Python2 is a non-option=
.
> > > >
> > > > If any layer needs a native Python2, this has to be shipped either =
in
> > > > this layer or in a layer it depends on.
> > >
> > >
> > > We should explore disabling python support in uboot if it does not
> move to
> > > py3 perhaps there is a way like that having a single recipe require
> py2 is
> > > a bit too much
> >
> > In u-boot build scripts are using Python2.
> >
> > But this is being fixed upstream, so realistically in Yocto 3.1
> > Python2 can move to meta-oe.
>
> No I do not want it in meta-oe, whoever needs it, should step up to
> maintain it and start a new layer
> much like meta-qt4
>

I have the beginnings of scripts to generate a meta-python2 layer. Someone
with a vested interest in keeping python2 supported will need to step up to
maintain it. After bitbake and Oe-core moved to python3, my use of python2
has gone to near zero.

I intend to move all python2 recipes from meta-python to the new layer.
meta-python will become python3 only in 3.1 release timeframe. The bb files
and inc files will also be merged, simplifying AUH and devtool usage.

Attempts to send python2 patches to meta-python after that shift will be
nacked.


> >
> > cu
> > Adrian
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000007f8a750597ae6b3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Nov 18, 2019 at 3:27 PM Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Mon, Nov 18, 2019 at 2:55 PM Adrian Bunk &lt;<a h=
ref=3D"mailto:bunk@stusta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; On Mon, Nov 18, 2019 at 02:16:30PM -0800, Khem Raj wrote:<br>
&gt; &gt; On Mon, Nov 18, 2019 at 2:06 PM Adrian Bunk &lt;<a href=3D"mailto=
:bunk@stusta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; On Mon, Nov 18, 2019 at 01:39:48PM -0800, Khem Raj wrote:<br=
>
&gt; &gt; &gt; &gt; On Mon, Nov 18, 2019 at 1:05 PM Adrian Bunk &lt;<a href=
=3D"mailto:bunk@stusta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<=
br>
&gt; &gt; &gt; &gt; &gt; On Mon, Nov 18, 2019 at 10:13:05AM -0800, Khem Raj=
 wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Mon, Nov 18, 2019 at 5:08 AM Alexander Kan=
avin<br>
&gt; &gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Drop backports, rebase a couple of patch=
es.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; This is the second last release of py 2.=
x; upstream support ends on<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; 1 January 2020, there will be one final =
2.x afterwards.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Note that the only thing that still need=
s python 2.x in oe-core is<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; u-boot; when the next u-boot update arri=
ves, we should find out<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; where the py3 migration is for that comp=
onent before merging the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; update.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I guess u-boot need it during build, in that =
case defer it to user to<br>
&gt; &gt; &gt; &gt; &gt; &gt; have python2 on build host<br>
&gt; &gt; &gt; &gt; &gt; &gt; could be possible.<br>
&gt; &gt; &gt; &gt; &gt; &gt;...<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; That&#39;s a non-option since it could mean<br>
&gt; &gt; &gt; &gt; &gt; &quot;Yocto 3.1 cannot be built on Ubuntu 20.04&qu=
ot;.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Ubuntu 20.04 might end up still shipping Python2,[=
1]<br>
&gt; &gt; &gt; &gt; &gt; but you cannot rely on future distributions shippi=
ng it.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; And why should OE ship something that=E2=80=99s dropped=
 by its own upstream and<br>
&gt; &gt; &gt; &gt; other distributions<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; All I am saying is that relying on the host Python2 is a non=
-option.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; If any layer needs a native Python2, this has to be shipped =
either in<br>
&gt; &gt; &gt; this layer or in a layer it depends on.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; We should explore disabling python support in uboot if it does no=
t move to<br>
&gt; &gt; py3 perhaps there is a way like that having a single recipe requi=
re py2 is<br>
&gt; &gt; a bit too much<br>
&gt;<br>
&gt; In u-boot build scripts are using Python2.<br>
&gt;<br>
&gt; But this is being fixed upstream, so realistically in Yocto 3.1<br>
&gt; Python2 can move to meta-oe.<br>
<br>
No I do not want it in meta-oe, whoever needs it, should step up to<br>
maintain it and start a new layer<br>
much like meta-qt4<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I have the begin=
nings of scripts to generate a meta-python2 layer. Someone with a vested in=
terest in keeping python2 supported will need to step up to maintain it. Af=
ter bitbake and Oe-core moved to python3, my use of python2 has gone to nea=
r zero.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I intend to move=
 all python2 recipes from meta-python to the new layer. meta-python will be=
come python3 only in 3.1 release timeframe. The bb files and inc files will=
 also be merged, simplifying AUH and devtool usage.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Attempts to send python2 patches to meta-python=
 after that shift will be nacked.</div><div dir=3D"auto"><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><br>
&gt;<br>
&gt; cu<br>
&gt; Adrian<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000007f8a750597ae6b3c--
