Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id BF07360273
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2019 01:21:38 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id t20so14997921qtr.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Oct 2019 18:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a5kUSIzf4AAthumsHWH5E0xWXPNP2CcrVAovqjw1EF0=;
	b=k6YdrFdFhIdfouHZuOAWWBiw0f3Rq2zU6X+UIp5X7gZ6ziNTonB04qtYtkkfKdplin
	G+7Eub3P6j070DCXtJ4WQ1HbHs0eFgzX14awvM/pyVZvsq6WTJK04vPKLbwkUwJMl93P
	pE9Oj1xVk/xEdlUGjTdLyxJ7v1Wzvk6MxzQn1Oe6g58UrwWphZtegmaXd1hvmgHSBZbC
	T+TqsLoRCCqVsy7vMhV9t2UhLQqSX1CBGdd+O1vL/P0nt1IOReX3NQ4a9k3ZNHL6D48L
	duqLWx/wmtB0uSrbaJQl2rKybaZGMAZRYzbfttK+irzd/NR0NZx8px2v3j7psw6+5DAR
	6Hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a5kUSIzf4AAthumsHWH5E0xWXPNP2CcrVAovqjw1EF0=;
	b=sdiIoc3uhsIiLkhdVEV6yRtkSyCZE1/Da+gKso8/hoicFIrG7/cjDQqP+595Ik06iv
	r+BXl3cIoW2iQn+YSkOdbdEHbSmTWz1xzeHM6a8NKgtN6KKctWEuhmSjzfH/RUwzPlDX
	SEgOJNwF5/JO1SKxX2+4TKDEXqH9H5dztV+36kMgCsP76CU1iIDJy2KCZJu+N8UehVVt
	qxutaC84zVjDaBLr6ExWvsICUSnNVJp3zCvdz+igRquao6t8Xe2NYsvFo3d6JALVVa0W
	pFQAl/eCRlrVQ9JNT7lyEq6pokMcPMdj92jCx/oNECMgTLfZ/PMd4xxkYV24uVZg3UWw
	7hfQ==
X-Gm-Message-State: APjAAAUmwCC/vr8cVwp/xO6vIPFgsRWfTuRcNBowb3684uOP173bYATH
	4TkbDgauPaQYwLzV54pnQjUZ+vxqG11d7/33G7M=
X-Google-Smtp-Source: APXvYqyjngki/kQDr0kkDdjl9oFLDbU5VXYUjsieqfN8AJ68XUrrBDe1OpVWKOQFMKtJtb64ycZGwZdh9E9ylxbdLKw=
X-Received: by 2002:a0c:e5c1:: with SMTP id u1mr17349745qvm.206.1571534498748; 
	Sat, 19 Oct 2019 18:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
	<20191011114754.91740-16-alex.kanavin@gmail.com>
	<dbf128cd95ea3d8017274ea57dda52a72ad727cb.camel@gmail.com>
	<CAMKF1srnabEcWqWYa80uoCe1H=iw-wDPNut4hu4eRwuSQ1HaoQ@mail.gmail.com>
	<CANNYZj8J-wr1V1+aNfbRGyQ+Lk+sofRX4rT1xudaCm67gVev3Q@mail.gmail.com>
	<da2fa30bb8fed7f991ef14a4955a67ec15bc94a6.camel@linuxfoundation.org>
In-Reply-To: <da2fa30bb8fed7f991ef14a4955a67ec15bc94a6.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Oct 2019 06:51:26 +0530
Message-ID: <CAMKF1sr8xy+bW_UL_=B-nt7MG58bJj=WmB9VVZf5hxBqpXwPiQ@mail.gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/19] meson: update to 0.52.0
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
X-List-Received-Date: Sun, 20 Oct 2019 01:21:39 -0000
Content-Type: multipart/alternative; boundary="0000000000008cdf4705954d63dd"

--0000000000008cdf4705954d63dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 19, 2019 at 2:56 AM <richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2019-10-18 at 20:49 +0200, Alexander Kanavin wrote:
> > I certainly don't mean to ignore those reports, it's just that due to
> > my ongoing health problems, and having to dedicate most of my energy
> > to the day job (https://mbition.io/en/home/), I am not currently able
> > to work on the upstream issues in a timely manner the way I used to
> > when maintaining core was actually my day job (at Intel).
> >
> > The question of how much effort people who update things in core
> > should allocate to fixing 'other' layers has been a conflict point
> > for a long time. I'd prefer to see more aggressive
> > blacklisting/removal of recipes that no one has an interest in fixing
> > and updating.
>
> If anything this would be my fault for merging things despite there
> being concerns raised. I have to admit I'd seen other patches and
> therefore erroneously thought the issues we mostly resolved.
>
> Should OE-Core block on all issues being resolved before merging? I'm
> torn on that, I realise there are pros and cons.


If an issue is there and gets reported after it=E2=80=99s merged I think it=
=E2=80=99s fine
to do whatever is needed after the fact however if testing master-next from
oe-core and reported against it I think this will help you in longer run if
these master-next issues are looked into and blocked on. We should not run
Oe-core so fast that other layers fall way back behind where they start
supporting just releases and you have lost free integration testing that
other layers would offer

If there are too many reports then it would be questionable to block on it
but I don=E2=80=99t think that=E2=80=99s the case



>
> It takes most of my time/energy to track the issues with core without
> trying to remember that patch X breaks layer Y and that I need a report
> back on that combination before I then find a patch and merge it.
>
> So sorry, I probably shouldn't have taken this :/.
>
> There is a fundamental issue with having enough people to help work on
> these things though and requiring more work for changes to be merged
> isn't going to help. I wish I knew what would help.
>
> Cheers,
>
> Richard
>
>
>
>
>

--0000000000008cdf4705954d63dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Oct 19, 2019 at 2:56 AM &lt;<a href=3D"mailto:richa=
rd.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On Fri, 2019-10-18 at 20:49 +=
0200, Alexander Kanavin wrote:<br>
&gt; I certainly don&#39;t mean to ignore those reports, it&#39;s just that=
 due to<br>
&gt; my ongoing health problems, and having to dedicate most of my energy<b=
r>
&gt; to the day job (<a href=3D"https://mbition.io/en/home/" rel=3D"norefer=
rer" target=3D"_blank">https://mbition.io/en/home/</a>), I am not currently=
 able<br>
&gt; to work on the upstream issues in a timely manner the way I used to<br=
>
&gt; when maintaining core was actually my day job (at Intel).<br>
&gt; <br>
&gt; The question of how much effort people who update things in core<br>
&gt; should allocate to fixing &#39;other&#39; layers has been a conflict p=
oint<br>
&gt; for a long time. I&#39;d prefer to see more aggressive<br>
&gt; blacklisting/removal of recipes that no one has an interest in fixing<=
br>
&gt; and updating.<br>
<br>
If anything this would be my fault for merging things despite there<br>
being concerns raised. I have to admit I&#39;d seen other patches and<br>
therefore erroneously thought the issues we mostly resolved.<br>
<br>
Should OE-Core block on all issues being resolved before merging? I&#39;m<b=
r>
torn on that, I realise there are pros and cons.</blockquote><div dir=3D"au=
to"><br></div><div dir=3D"auto">If an issue is there and gets reported afte=
r it=E2=80=99s merged I think it=E2=80=99s fine to do whatever is needed af=
ter the fact however if testing master-next from oe-core and reported again=
st it I think this will help you in longer run if these master-next issues =
are looked into and blocked on. We should not run Oe-core so fast that othe=
r layers fall way back behind where they start supporting just releases and=
 you have lost free integration testing that other layers would offer</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">If there are too many reports=
 then it would be questionable to block on it but I don=E2=80=99t think tha=
t=E2=80=99s the case=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><br>
<br>
It takes most of my time/energy to track the issues with core without<br>
trying to remember that patch X breaks layer Y and that I need a report<br>
back on that combination before I then find a patch and merge it.<br>
<br>
So sorry, I probably shouldn&#39;t have taken this :/. <br>
<br>
There is a fundamental issue with having enough people to help work on<br>
these things though and requiring more work for changes to be merged<br>
isn&#39;t going to help. I wish I knew what would help.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000008cdf4705954d63dd--
