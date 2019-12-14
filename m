Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id A614D7F7E9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 01:48:54 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id c9so711159wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 17:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Fa3t1qYsSAwXvtwv0wElCno32H2MQSUiyZJMvxQopQg=;
	b=TzT9M05GTTrECI1F+uF/RKl6pHC/Vqvr0jmMb0VNqRf013VBdXDq3S1GYX0mvH7+K6
	1gUJdZPuI1MfMJuxtXdXEw3o1NzVzapZ2+AMEHUKBjYlRuXw0SEM6D0vH6zZ7/0bxB3P
	fakcmu1R3bZRz/sz4r8My4xksB+ebB2XP6p6R5j7ninDDXsG7NrvSSZDJIz4KNZ//hcS
	JK1Z+FSfXbxii5RUauzehiWEHgwG1boyIlOLQq8LnEqnX8ISDr0BiV41S0wPJJ1jySlz
	Xf+ikpRoGiCOaThllr5xUTTHqrxoilfCteAHWCoRX0Db2e0zq3F4DGs8PMgBk/D0Xhs8
	LlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Fa3t1qYsSAwXvtwv0wElCno32H2MQSUiyZJMvxQopQg=;
	b=E9WEyCfHsxLQdiSonOXfptsWiegkhA1Xka0eNWcA5Hg/xgqOWiSydIrWkzKpfNXGEJ
	8Kcoe40VxC32XOeCKMEskLo/t6rdrmRLmmDiRxEvq4s8B2sVjfgZNL7TBk9rsM+iWNAK
	eGNCzjLnAU4YQYl4nlff7VXnW/Fk2E+V+5xcq4J8+l1GeqVmKlzlIhFLbOa6q23Jlulk
	cTUlpH/71nFjKs1VM5buDykt4/xS05Poxp+VtDTWFwgvvJxko4M/mOGQPHyR7u7xGZRj
	xGhD7N4gNMXG4cxW+yxj2nuidnECgEFacJGB3lQygmpdpAxXS6NyZcCgJDd7Q32VZOcL
	Ja8Q==
X-Gm-Message-State: APjAAAWL+Tto6Ufo9+S12UWPcpFiZbzlsKSLgrLNg7h5Lb+6zqXsQWqW
	RbjQuMVnXjT9Qa+CX1xjR9h72czvoSKBsDb79Ml5nQ==
X-Google-Smtp-Source: APXvYqw6FUtg2A8W3ooF6w/WfLCo2T2EkmK0+2fwEWwlggdSPkBNrDXpWxxYhb34/ftnPtmDzG5U/IxqbhN+oN4YTr8=
X-Received: by 2002:a5d:6802:: with SMTP id w2mr15583530wru.353.1576288135320; 
	Fri, 13 Dec 2019 17:48:55 -0800 (PST)
MIME-Version: 1.0
References: <20191213220309.3964324-1-JPEWhacker@gmail.com>
	<20191213231042.GB8776@localhost>
	<CAJdd5GY4Ld9t1fo1sC2mK7nXuBCi=T39DwstZ5ZnTNFrEp226A@mail.gmail.com>
	<20191214012249.GC8776@localhost>
	<CAJdd5GZT3RcbPFBt7dEbt_c3HLBTiduh_AU8sCSKpNRgheMU+w@mail.gmail.com>
	<20191214014120.GD8776@localhost>
In-Reply-To: <20191214014120.GD8776@localhost>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 13 Dec 2019 19:48:42 -0600
Message-ID: <CAJdd5GY-YWJg6smNoiw6GTkMUOn9_9yKN3gYTsCQ+ahRc0MVhA@mail.gmail.com>
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
X-List-Received-Date: Sat, 14 Dec 2019 01:48:54 -0000
Content-Type: multipart/alternative; boundary="0000000000005e97d60599a02eaf"

--0000000000005e97d60599a02eaf
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 13, 2019, 7:41 PM Adrian Bunk <bunk@stusta.de> wrote:

> On Fri, Dec 13, 2019 at 07:28:28PM -0600, Joshua Watt wrote:
> > On Fri, Dec 13, 2019, 7:22 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > > On Fri, Dec 13, 2019 at 06:47:33PM -0600, Joshua Watt wrote:
> > > > On Fri, Dec 13, 2019 at 5:10 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > > >
> > > > > On Fri, Dec 13, 2019 at 04:03:09PM -0600, Joshua Watt wrote:
> > > > > > Adds a tune for Cortex-A72 Cortex-A53 big.LITTLE SoCs, e.g.
> Rockchip
> > > > > > RK3399
> > > > > >...
> > > > > > +TUNE_FEATURES_tune-cortexa72-cortexa53 =
> > > "${TUNE_FEATURES_tune-aarch64} cortexa72-cortexa53"
> > > > > >...
> > > > >
> > > > > Looking at the gcc sources cortexa72-cortexa53 defaults to crc
> enabled,
> > > > > so TUNE_FEATURES_tune-cortexa72-cortexa53 must contain crc.
> > > >
> > > > I think that's armv8.1-a, the cortex A72 is only armv8-a (at least
> > > > AFAICT), so I think crc would still be an optional feature.
> > > >...
> > >
> > > It is optional for armv8-a, but not for Cortex A53 or A72.
> > >
> > > What matters in practice is that gcc automatically enables it for
> > > cortex-a72.cortex-a53, so the resulting code might not run on
> > > armv8-a hardware without support for crc - things will break
> > > if the tune features are not 100% aligned with whatever gcc
> > > is doing.
> >
> > I agree, but I can't find anywhere that says crc is enabled by default
> when
> > the tune is cortexa72.cortexa53. Maybe I'm looking in the wrong location?
>
>
> https://github.com/gcc-mirror/gcc/blob/master/gcc/config/arm/arm-cpus.in#L1278


Excellent. I'll send v3.

Thanks for the help


>
>
>
> > Thanks
>
> cu
> Adrian
>

--0000000000005e97d60599a02eaf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Dec 13, 2019, 7:41 PM Adrian Bunk &lt;<a href=
=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On Fri, Dec 13, 2019 at 07:28:28PM -0600, Joshua Watt=
 wrote:<br>
&gt; On Fri, Dec 13, 2019, 7:22 PM Adrian Bunk &lt;<a href=3D"mailto:bunk@s=
tusta.de" target=3D"_blank" rel=3D"noreferrer">bunk@stusta.de</a>&gt; wrote=
:<br>
&gt; <br>
&gt; &gt; On Fri, Dec 13, 2019 at 06:47:33PM -0600, Joshua Watt wrote:<br>
&gt; &gt; &gt; On Fri, Dec 13, 2019 at 5:10 PM Adrian Bunk &lt;<a href=3D"m=
ailto:bunk@stusta.de" target=3D"_blank" rel=3D"noreferrer">bunk@stusta.de</=
a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Fri, Dec 13, 2019 at 04:03:09PM -0600, Joshua Watt w=
rote:<br>
&gt; &gt; &gt; &gt; &gt; Adds a tune for Cortex-A72 Cortex-A53 big.LITTLE S=
oCs, e.g.=C2=A0 Rockchip<br>
&gt; &gt; &gt; &gt; &gt; RK3399<br>
&gt; &gt; &gt; &gt; &gt;...<br>
&gt; &gt; &gt; &gt; &gt; +TUNE_FEATURES_tune-cortexa72-cortexa53 =3D<br>
&gt; &gt; &quot;${TUNE_FEATURES_tune-aarch64} cortexa72-cortexa53&quot;<br>
&gt; &gt; &gt; &gt; &gt;...<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Looking at the gcc sources cortexa72-cortexa53 defaults=
 to crc enabled,<br>
&gt; &gt; &gt; &gt; so TUNE_FEATURES_tune-cortexa72-cortexa53 must contain =
crc.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I think that&#39;s armv8.1-a, the cortex A72 is only armv8-a=
 (at least<br>
&gt; &gt; &gt; AFAICT), so I think crc would still be an optional feature.<=
br>
&gt; &gt; &gt;...<br>
&gt; &gt;<br>
&gt; &gt; It is optional for armv8-a, but not for Cortex A53 or A72.<br>
&gt; &gt;<br>
&gt; &gt; What matters in practice is that gcc automatically enables it for=
<br>
&gt; &gt; cortex-a72.cortex-a53, so the resulting code might not run on<br>
&gt; &gt; armv8-a hardware without support for crc - things will break<br>
&gt; &gt; if the tune features are not 100% aligned with whatever gcc<br>
&gt; &gt; is doing.<br>
&gt; <br>
&gt; I agree, but I can&#39;t find anywhere that says crc is enabled by def=
ault when<br>
&gt; the tune is cortexa72.cortexa53. Maybe I&#39;m looking in the wrong lo=
cation?<br>
<br>
<a href=3D"https://github.com/gcc-mirror/gcc/blob/master/gcc/config/arm/arm=
-cpus.in#L1278" rel=3D"noreferrer noreferrer" target=3D"_blank">https://git=
hub.com/gcc-mirror/gcc/blob/master/gcc/config/arm/arm-cpus.in#L1278</a></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Excellen=
t. I&#39;ll send v3.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks for the help</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br><br><br><br>
&gt; Thanks<br>
<br>
cu<br>
Adrian<br>
</blockquote></div></div></div>

--0000000000005e97d60599a02eaf--
