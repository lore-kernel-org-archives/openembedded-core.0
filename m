Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5954F6198F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 13:11:30 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id t20so2005668uao.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 05:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EwcBVpeb7tXU1jTnq4n80uoeOmpFuTG7fVp4CYv2+ic=;
	b=dbnZB5kty0DIXppupg8eckafhPIZ0HLC1dvOwf2B1JODy/wNcH0ChmKnh1gLKFXH1h
	75syHcdTExw6gICLn4cX7YA0NuhREwFH2QTmYcY2kvlv68Dm7U3wIH7fu5FunkFWUkx/
	AOlFfw5rptgvS8tZIHxR/sMixz/7on6eTssgoOnKxQnSY6DQW7C5ppwC8jgKoYc9L7H8
	IeJu6ckISrI1Cn77JksBL0XPgUXDzV3lHI9lkgNuuiQHfpi3tGegxkWX/HOITTLC4Ed/
	lw8gTO8E3de/kFFhwDa5Dig0YU/GF38og1VzJuPgUnOBJACqUFSsQocDe9oCt20F+yjy
	6MPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EwcBVpeb7tXU1jTnq4n80uoeOmpFuTG7fVp4CYv2+ic=;
	b=HtMF+nVOGlx0uafNImCX3hb8l/sIgv0tWfvdAXVZCSO3VD5nX+MUNzJFswfXaXo1eE
	SqF1xu8Zo+t8QPxTdmy35W3RRZz9wJ5xZhMqee2Cp7++fxqEvLnUZIXiAA2+PcCmqz0N
	0c41fnbm/gEDjQ1DEMGWdmUErgtJOp9oBjE2DgjW8oYF8mcoKcJqJNV5/EPswM4GiKgd
	h/KjCsfZ9kv36kmGm/kDzHewS4Q1bjGdmzFD3ZPcRsIpg2C077dNIWGeJvvFiJlyfk00
	Zf0fIbaYwlfNj/Ei00t63SUhEUh8TMfQWRUisHXRaFj/RBcVFznxzlAkpmfsdXTMPAh0
	LMoQ==
X-Gm-Message-State: ANhLgQ2f7mzSyCPu9dEB63GyOYr9Rw2/ZJ9B0TSTzdgnmfu5mITUu3LF
	cI7L44v9PoGZ8RFsFXzvzvx4D87/hcESMb7OY48=
X-Google-Smtp-Source: ADFU+vsAlLO6c/Lbgp6yWQ/WMV856D7WoadeRSC9DwHlU0DcO5nue+ExOZPo/JOfkUkf48Rz3Vm2HgIr2s2Z0YbjKH0=
X-Received: by 2002:ab0:7802:: with SMTP id x2mr4535017uaq.100.1582981891142; 
	Sat, 29 Feb 2020 05:11:31 -0800 (PST)
MIME-Version: 1.0
References: <20200229101433.30787-1-alex.kanavin@gmail.com>
	<23132fd4872488b259751cdf8bcd8335d703b205.camel@linuxfoundation.org>
In-Reply-To: <23132fd4872488b259751cdf8bcd8335d703b205.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 29 Feb 2020 14:11:20 +0100
Message-ID: <CANNYZj_orEnKxs6AvyYTauDVexY+Eby2DeRYeh=9=-9i8TzTwg@mail.gmail.com>
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
X-List-Received-Date: Sat, 29 Feb 2020 13:11:30 -0000
Content-Type: multipart/alternative; boundary="0000000000004eb7cf059fb6b1a3"

--0000000000004eb7cf059fb6b1a3
Content-Type: text/plain; charset="UTF-8"

On Sat 29. Feb 2020 at 11.40, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2020-02-29 at 11:14 +0100, Alexander Kanavin wrote:
> > This recipe is build-heavy, yet is not part of any images and isn't
> > runtime tesed as
> > part of oe-core. There's no evidence of anyone using it, as all
> > commits are revision updates. It also pulls in NumPy, which is also
> > a significant support item, and wouldn't otherwise be part of core.
>
> I'm not sure about this. The intent was to use piglit as a way of
> improving our graphics testing, particularly allowing it to be
> automated.
>
> Whilst we've had to focus on getting the basics right, I'm not sure
> that objective isn't still a worthy goal over time?


Piglit is meant for testing and validating OpenGL drivers for real
hardware. While we can put it on top of software Mesa driver or virgl, I am
not sure there is much value in that? Software rendering might even be too
slow to run in practice.

Alex

>

--0000000000004eb7cf059fb6b1a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Sat 29. Feb 2020 at 11.40, Richard Purdie &lt;<a href=3D"mailto:ric=
hard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;=
 wrote:<br></div><div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">On Sat, 2020-02-29 at 11:14 +0100, Alexander Kanavin wrote:<br>
&gt; This recipe is build-heavy, yet is not part of any images and isn&#39;=
t<br>
&gt; runtime tesed as<br>
&gt; part of oe-core. There&#39;s no evidence of anyone using it, as all<br=
>
&gt; commits are revision updates. It also pulls in NumPy, which is also<br=
>
&gt; a significant support item, and wouldn&#39;t otherwise be part of core=
.<br>
<br>
I&#39;m not sure about this. The intent was to use piglit as a way of<br>
improving our graphics testing, particularly allowing it to be<br>
automated.<br>
<br>
Whilst we&#39;ve had to focus on getting the basics right, I&#39;m not sure=
<br>
that objective isn&#39;t still a worthy goal over time?</blockquote><div di=
r=3D"auto"><br></div><div dir=3D"auto">Piglit is meant for testing and vali=
dating OpenGL drivers for real hardware. While we can put it on top of soft=
ware Mesa driver or virgl, I am not sure there is much value in that? Softw=
are rendering might even be too slow to run in practice.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Alex</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
/blockquote></div></div>

--0000000000004eb7cf059fb6b1a3--
