Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id CBC437F8AA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 01:28:40 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y17so700934wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 17:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oT54kgx+JibN2nHg48MadlgMfHGkaoHjfNRIukhRXPo=;
	b=WgCLa+PgZ5mibGlSLnTfTgMcKfZETu0IgfCi9ajWMdID9a1P3g0VT+o/RAQbl8bmlj
	yZ5la0w1qEuBCWFn38qKLi+QWEuCtzb2dcc/epcQqE1X0CwDtxuom/NeK4t8SawP5POP
	SRSScBv9dpLo5QSj4lHVOyohpppT2ObK+hAPkwvHsX6/W/1le19wwTtsM+aEEg8/3NQz
	YqN0S/o4bW7DuvY6kYyP4HE5UE+hnDaKvH919e/G1TDv70ra/zJkRKiVl/KUnknq2tUa
	rj5NIlDROakATDmDcL94gOizIJdErJBe/3pJ6jygcg+uU3rxV7n5+A1C3hgXyEHWtUk9
	guFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oT54kgx+JibN2nHg48MadlgMfHGkaoHjfNRIukhRXPo=;
	b=AQWI044VJWOiv29SJ48UadmfF3UW6fqnE6QaORtA1a8siay5KifJ3igNu3aulb8EFL
	QcoDDqyc/XYnE+yvq+KU+tnQ05dZEm6KGoM4cF2AEDFR40YAmho4gMr+OftJP/yRP2nf
	15BY8zPBPosdQ8euoVz3+9Vi2BAoefpZMZTRUdPip0wIu7364gPN3kBXyEYBGbOdBX5n
	6vvOz2fp2GthBwjnCLRXw18N+KFz45FMiN2qi/xF7gWI2EdP0Bay5I0cRHbFCFMxl7rm
	MEy+Mf9akTt7LRU44gezqurmN/eCmJZJ8OfChDgcr0f4q02hFf7m3L98lhlnBcWHvdaS
	DaXQ==
X-Gm-Message-State: APjAAAVazJkfdQqwTzw1LqBJdZtaO6vaMzMAMDtaoqSz3UGW8zpwZbEw
	WUKp1Agd6tNEe1/xum8a1pVWJ1feUWQGaJ8Lryk=
X-Google-Smtp-Source: APXvYqzLvwXsmw2m3RAUbhrT8KnAlaDf2kMTxNfsyryK3cr3SuWI8Ot1fSRPnzAzzenUgJyyk7tRXzNewgMzr4linRA=
X-Received: by 2002:a5d:67c7:: with SMTP id n7mr15570506wrw.319.1576286921323; 
	Fri, 13 Dec 2019 17:28:41 -0800 (PST)
MIME-Version: 1.0
References: <20191213220309.3964324-1-JPEWhacker@gmail.com>
	<20191213231042.GB8776@localhost>
	<CAJdd5GY4Ld9t1fo1sC2mK7nXuBCi=T39DwstZ5ZnTNFrEp226A@mail.gmail.com>
	<20191214012249.GC8776@localhost>
In-Reply-To: <20191214012249.GC8776@localhost>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 13 Dec 2019 19:28:28 -0600
Message-ID: <CAJdd5GZT3RcbPFBt7dEbt_c3HLBTiduh_AU8sCSKpNRgheMU+w@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-cortexa72-cortexa53: Add tune
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
X-List-Received-Date: Sat, 14 Dec 2019 01:28:41 -0000
Content-Type: multipart/alternative; boundary="00000000000002797b05999fe6d8"

--00000000000002797b05999fe6d8
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 13, 2019, 7:22 PM Adrian Bunk <bunk@stusta.de> wrote:

> On Fri, Dec 13, 2019 at 06:47:33PM -0600, Joshua Watt wrote:
> > On Fri, Dec 13, 2019 at 5:10 PM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Fri, Dec 13, 2019 at 04:03:09PM -0600, Joshua Watt wrote:
> > > > Adds a tune for Cortex-A72 Cortex-A53 big.LITTLE SoCs, e.g.  Rockchip
> > > > RK3399
> > > >...
> > > > +TUNE_FEATURES_tune-cortexa72-cortexa53 =
> "${TUNE_FEATURES_tune-aarch64} cortexa72-cortexa53"
> > > >...
> > >
> > > Looking at the gcc sources cortexa72-cortexa53 defaults to crc enabled,
> > > so TUNE_FEATURES_tune-cortexa72-cortexa53 must contain crc.
> >
> > I think that's armv8.1-a, the cortex A72 is only armv8-a (at least
> > AFAICT), so I think crc would still be an optional feature.
> >...
>
> It is optional for armv8-a, but not for Cortex A53 or A72.
>
> What matters in practice is that gcc automatically enables it for
> cortex-a72.cortex-a53, so the resulting code might not run on
> armv8-a hardware without support for crc - things will break
> if the tune features are not 100% aligned with whatever gcc
> is doing.
>

I agree, but I can't find anywhere that says crc is enabled by default when
the tune is cortexa72.cortexa53. Maybe I'm looking in the wrong location?

Thanks


> cu
> Adrian
>

--00000000000002797b05999fe6d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Dec 13, 2019, 7:22 PM Adrian Bunk &lt;<a href=
=3D"mailto:bunk@stusta.de" rel=3D"noreferrer noreferrer" target=3D"_blank">=
bunk@stusta.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fr=
i, Dec 13, 2019 at 06:47:33PM -0600, Joshua Watt wrote:<br>
&gt; On Fri, Dec 13, 2019 at 5:10 PM Adrian Bunk &lt;<a href=3D"mailto:bunk=
@stusta.de" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">bunk=
@stusta.de</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Dec 13, 2019 at 04:03:09PM -0600, Joshua Watt wrote:<br>
&gt; &gt; &gt; Adds a tune for Cortex-A72 Cortex-A53 big.LITTLE SoCs, e.g.=
=C2=A0 Rockchip<br>
&gt; &gt; &gt; RK3399<br>
&gt; &gt; &gt;...<br>
&gt; &gt; &gt; +TUNE_FEATURES_tune-cortexa72-cortexa53 =3D &quot;${TUNE_FEA=
TURES_tune-aarch64} cortexa72-cortexa53&quot;<br>
&gt; &gt; &gt;...<br>
&gt; &gt;<br>
&gt; &gt; Looking at the gcc sources cortexa72-cortexa53 defaults to crc en=
abled,<br>
&gt; &gt; so TUNE_FEATURES_tune-cortexa72-cortexa53 must contain crc.<br>
&gt; <br>
&gt; I think that&#39;s armv8.1-a, the cortex A72 is only armv8-a (at least=
<br>
&gt; AFAICT), so I think crc would still be an optional feature.<br>
&gt;...<br>
<br>
It is optional for armv8-a, but not for Cortex A53 or A72.<br>
<br>
What matters in practice is that gcc automatically enables it for <br>
cortex-a72.cortex-a53, so the resulting code might not run on<br>
armv8-a hardware without support for crc - things will break<br>
if the tune features are not 100% aligned with whatever gcc<br>
is doing.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I agree, but I can&#39;t find anywhere that says crc is enabled b=
y default when the tune is cortexa72.cortexa53. Maybe I&#39;m looking in th=
e wrong location?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<br>
cu<br>
Adrian<br>
</blockquote></div></div></div>

--00000000000002797b05999fe6d8--
