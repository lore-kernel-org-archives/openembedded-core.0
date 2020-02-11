Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
	[209.85.222.44])
	by mail.openembedded.org (Postfix) with ESMTP id 16C6E60CC6;
	Tue, 11 Feb 2020 14:34:32 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id w15so4023867uap.0;
	Tue, 11 Feb 2020 06:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7Avd3+fdJ9FPL4H2nqN2D67jjOF2ijLyYcKTeAU+T08=;
	b=XP9R3stjpuMr4hAewEjI+fXJGMG/gqsDPO/yZDfRiX22gF2WasYw5vlWfqINAMex65
	fmsGydxcCxD9fcCJkQ3SzaTB4Z5CI1QuImwYHGXzwFXxQG5TqjUyHb2rGkM6+usyW02+
	Q7hIPWaj2CbbC0UwUsIr3lilOtWUq7O4PCvFJJ4rCJRtPKok9WewvhI2Di3nwOUeYCfh
	TsPkDTNiOYJmWL1obSTqe4Q/0QnKDc4jnilSW5/SVPyxR4Ei0YOhRCtZrLDKs8CmMOak
	MCcz2299Fe7hpQVwXmkhhqRXar7TvqrI/tvUTOqCbXBa38O2MLr/iJCH31IOM3P96kZf
	I+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7Avd3+fdJ9FPL4H2nqN2D67jjOF2ijLyYcKTeAU+T08=;
	b=FE+bWQhxuYycSP92I4J3vSHvc6pQLiNDdtxp03kTxXTVjr/56xqQ7TsyVorfj4G4Sc
	f86JulVt+gfXdgORy9EZxeX5ESD+AK9YeDC4m3v5EKt+UmGTA454d96RBIdZsPz7Dzvr
	c2WyP33uEmPKIkaY9m6+gmCffqOcHH8iQO8fDXZnvqz7aPg20aqorxhVAoKPcQh3rann
	K+JGfvC1iH+C5b02l0HpTG9G8rV/TbrAMCM4SFD+b4S6tg5TPYah1JtW7CW125PpBnxK
	o5JQoIfNCoitXuPnaoZ1a0MKn5mXIRIRbL55DnHZZBUy5z7WZwgrYhik5B/Esr/YdpKt
	51pg==
X-Gm-Message-State: APjAAAXulKMgzWmPyFY8o8Dnbcd2K9HYOkxkSeOKpSvjLckUXOIgpTjR
	MpR1/Q2Hp3Vl7HxzgDzjpGuhHaoOLZdOlZlibVWkgA==
X-Google-Smtp-Source: APXvYqx2D93Tdj9jA7SAsqxA73lO9UFIXNNmj8kbU7GJpNrpY4bkqrKKyRNKsqVWoaPwXbkwPU4R4K6+GPj0YyoIIdQ=
X-Received: by 2002:ab0:658d:: with SMTP id v13mr1659049uam.71.1581431672945; 
	Tue, 11 Feb 2020 06:34:32 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
	<20200211135323.GA3234@localhost>
	<CANNYZj_ExXVJJMS3g6Ga2xNc9AgspEhcMBQgmQGaQXmkcUYvPQ@mail.gmail.com>
	<CANNYZj_v9=Ys-NXqHWXY42dZqT95+LxcRUqSRKcyy6pMz-Y01g@mail.gmail.com>
	<20200211141347.GB3234@localhost>
In-Reply-To: <20200211141347.GB3234@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Feb 2020 15:35:03 +0100
Message-ID: <CANNYZj_2WVWrWDbL1tsUeqVQ_OPHnzebA=6fobRD9e==UybAhA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Future of sato and X in oe-core
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
X-List-Received-Date: Tue, 11 Feb 2020 14:34:33 -0000
Content-Type: multipart/alternative; boundary="0000000000001a47fa059e4dc139"

--0000000000001a47fa059e4dc139
Content-Type: text/plain; charset="UTF-8"

X might and likely will start to bitrot sooner for those not using RHEL 8
and its very conservative and never changing software stack. I can imagine
Red Hat has no interest in supporting it on Fedora going forward for
instance, they'll just make Xwayland work, and rip the standalone server
and its drivers and libraries out.

Oe-core will have X for as long as the burden of fixing build errors and
runtime issues with custom patches is not too painful. The point I am
trying to make is that I am not convinced oe-core needs a 'real' ui at all,
and opinion to the contrary should justify the need.

Alex

On Tue, 11 Feb 2020 at 15:13, Adrian Bunk <bunk@stusta.de> wrote:

> On Tue, Feb 11, 2020 at 03:01:20PM +0100, Alexander Kanavin wrote:
> > Specifically (sorry for the rapid-followup), I think the main value
> > proposition of core is integration and testing of various language
> > toolchains and core libraries. UIs in embedded space can mean pretty much
> > anything, and so I'd leave that to specialised layers.
>
> That's actually quite different from your original email.
>
> Your original email raised the problem that X might start to bitrot
> after the end of support for RHEL 8 in the year 2029 (sic).
>
> What functionality should be in core for users/demo/QA/...
> is not strictly related to X versus Wayland.
>
> > Alex
>
> cu
> Adrian
>

--0000000000001a47fa059e4dc139
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">X might and likely will start to bitrot sooner for those n=
ot using RHEL 8 and its very conservative and never changing software stack=
. I can imagine Red Hat has no interest in supporting it on Fedora going fo=
rward for instance, they&#39;ll just make Xwayland work, and rip the standa=
lone server and its drivers and libraries out.=C2=A0<div><br></div><div>Oe-=
core will have X for as long as the burden of fixing build errors and runti=
me issues with custom patches is not too painful. The point I am trying to =
make is that I am not convinced oe-core needs a &#39;real&#39; ui at all, a=
nd opinion to the contrary should justify the need.<div><br></div><div><div=
>Alex</div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, 11 Feb 2020 at 15:13, Adrian Bunk &lt;<a hre=
f=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-l=
eft:1ex">On Tue, Feb 11, 2020 at 03:01:20PM +0100, Alexander Kanavin wrote:=
<br>
&gt; Specifically (sorry for the rapid-followup), I think the main value<br=
>
&gt; proposition of core is integration and testing of various language<br>
&gt; toolchains and core libraries. UIs in embedded space can mean pretty m=
uch<br>
&gt; anything, and so I&#39;d leave that to specialised layers.<br>
<br>
That&#39;s actually quite different from your original email.<br>
<br>
Your original email raised the problem that X might start to bitrot<br>
after the end of support for RHEL 8 in the year 2029 (sic).<br>
<br>
What functionality should be in core for users/demo/QA/...<br>
is not strictly related to X versus Wayland.<br>
<br>
&gt; Alex<br>
<br>
cu<br>
Adrian<br>
</blockquote></div>

--0000000000001a47fa059e4dc139--
