Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
	[209.85.217.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9477C7C556
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 14:55:14 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id b123so8949101vsb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 07:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=K2E0rQJifBBiN0umJBSOwgMGaVqgpzDIsDNRzG8Qmtk=;
	b=Py43IGboxCr3GDOgM+Fe4dk85v23ucgdlSY72znyxZYA8Qx71E+ZpadyjrfFEpGNwy
	/KwASWlnDTkzayixhw1krnPmKJjDcs9j5trFEThsh7UxAtSbFyREeVF0x5mXC9EVhg5s
	pGbXmhw51Doo7rJ13S2eOI4AI4qJ5pPytyVCWB0Gp9mT579RrTPUermMrN1+w6qcBVbh
	3YsujrQ9lsN0OsMxH3U8V+XwlESMA32Qh5kJUPWHWDDr/yGtel87Q631RHHDVqsHtR5d
	q+Q5CCbPjPJsyHHzEf3GInx7OWotMfprNfUgSbFpbSMpqAYov9wFbo5mZDcor3YHppQI
	oT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=K2E0rQJifBBiN0umJBSOwgMGaVqgpzDIsDNRzG8Qmtk=;
	b=Se1/KvBzwv5MIhBdmfNpSkX176HEP8EORNijIPBrSYP48Zs8WP2bPcAgWkpT8bB24Y
	sE9DDMXmooyZa62TosNLoIFotUQDxSsEbPIlFwZSbZf+5b3/bhkTCMgNiaFQAs5OpGLY
	UzozPz/R3tmHMHJdc1BD/veq2Jnkumu5SdWN8uqImrjaZe7oMqs1oJdvUvt0TGAaSUiH
	8ertWKgFn3afTQixIbNK69cQGIz7MVX3p8jiZZrnzU4A189Yw8/js1pgHYmcUG4ey6eQ
	O+ZHwXSyO9moSIZLDX/2Hz3bMKc1Sl3PvfR2y0VoS1OI2LelAYggnQwFnhFGVGAc7TPW
	5EaQ==
X-Gm-Message-State: APjAAAUeyZiNLZqSDoOFS+kob06V7A7CDPZmEzWnuTNX4srTM5nFCOI5
	XCv3eoLk+ktqiI2mkzutNfTavAYD2eUsG9ofSaoxUQ==
X-Google-Smtp-Source: APXvYqxYrMWK7X/AeBKzZNdut0eAvKHm4JB8uUgYx+KZYSoJFv2eaZaqy1n8D0jjRgWRICgCThlSxwvL17NrMX0U99w=
X-Received: by 2002:a05:6102:1cb:: with SMTP id
	s11mr12761098vsq.25.1568040915516; 
	Mon, 09 Sep 2019 07:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184727.552-1-fabio.berton@ossystems.com.br>
	<CANNYZj8jseQc9Lnt8r1SuDdh4q_xUJy5FkpUukpLzUbVn5vW2g@mail.gmail.com>
	<CAP9ODKp8Bmss=NcsPYMgCqKAoKDpPSrCKzA7Tm8FoNOM8tSejA@mail.gmail.com>
	<CANNYZj-N7zt57Gcbfj=0E-dunRwDQSLUfyQ3cpt=8AFHHjVS-A@mail.gmail.com>
	<CAAPZna3atYLmKGs1tXVq-ZujAN=BDgiQ6fcmAKGcU_wwuEgTGA@mail.gmail.com>
In-Reply-To: <CAAPZna3atYLmKGs1tXVq-ZujAN=BDgiQ6fcmAKGcU_wwuEgTGA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Sep 2019 16:55:04 +0200
Message-ID: <CANNYZj-79A3r4R513DF3b-ia81BojoNAzdHLuKP7j+zxLiowFg@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade 19.1.1 -> 19.1.6
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
X-List-Received-Date: Mon, 09 Sep 2019 14:55:14 -0000
Content-Type: multipart/alternative; boundary="000000000000c341c005921ff9fc"

--000000000000c341c005921ff9fc
Content-Type: text/plain; charset="UTF-8"

Thanks, now it's future-proof :)

Alex

On Mon, 9 Sep 2019 at 16:54, Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

> Hi Alexander!
>
> I sent a v2 with python3 in depends and dropped the patch.
>
> Thanks!
>
> On Fri, Sep 6, 2019 at 5:33 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > On Fri, 6 Sep 2019 at 22:12, Otavio Salvador <
> otavio.salvador@ossystems.com.br> wrote:
> >>
> >> > As I had previously suggested... can you try adding 'python3' to
> DEPENDS of mesa, and see if that helps please? I think that would allow
> avoiding this patch altogether.
> >>
> >> Why a new build dependency if this works just fine?
> >
> >
> > 1. Less patches is always better than more patches, especially if they
> are non-upstreamable.
> >
> > 2. The patch reverts to something that meson has deprecated and will
> likely remove in the future.
> >
> https://github.com/mesonbuild/meson/blob/master/docs/markdown/Python-3-module.md
> >
> > 3. Meson's currently supported way of detecting python does in fact rely
> on python's target configuration being available, as it picks up settings
> from it. I had fixed a similar issue elsewhere recently.
> >
> > Alex
> >
>

--000000000000c341c005921ff9fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, now it&#39;s future-proof :)</div><div><br></=
div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, 9 Sep 2019 at 16:54, Fabio Berton &lt;<a hre=
f=3D"mailto:fabio.berton@ossystems.com.br">fabio.berton@ossystems.com.br</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi =
Alexander!<br>
<br>
I sent a v2 with python3 in depends and dropped the patch.<br>
<br>
Thanks!<br>
<br>
On Fri, Sep 6, 2019 at 5:33 PM Alexander Kanavin &lt;<a href=3D"mailto:alex=
.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; On Fri, 6 Sep 2019 at 22:12, Otavio Salvador &lt;<a href=3D"mailto:ota=
vio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador@ossystems.=
com.br</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; &gt; As I had previously suggested... can you try adding &#39;pyth=
on3&#39; to DEPENDS of mesa, and see if that helps please? I think that wou=
ld allow avoiding this patch altogether.<br>
&gt;&gt;<br>
&gt;&gt; Why a new build dependency if this works just fine?<br>
&gt;<br>
&gt;<br>
&gt; 1. Less patches is always better than more patches, especially if they=
 are non-upstreamable.<br>
&gt;<br>
&gt; 2. The patch reverts to something that meson has deprecated and will l=
ikely remove in the future.<br>
&gt; <a href=3D"https://github.com/mesonbuild/meson/blob/master/docs/markdo=
wn/Python-3-module.md" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/mesonbuild/meson/blob/master/docs/markdown/Python-3-module.md</a><br>
&gt;<br>
&gt; 3. Meson&#39;s currently supported way of detecting python does in fac=
t rely on python&#39;s target configuration being available, as it picks up=
 settings from it. I had fixed a similar issue elsewhere recently.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
</blockquote></div>

--000000000000c341c005921ff9fc--
