Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2BDCA7F85F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 16:54:08 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id u99so4643302uau.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 08:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0P6U1MpF7Gc4mO6XDESPxiPrDBw9Ii9Ew7Jtr1zJ35E=;
	b=JdIGzSQ5I3YYfv1ivSFiX+WUx3eoeJtujJnIMVlgjg/nP+Bo2+nRpvforIqVY7LqPL
	ftuVIDIMK0ojjnx8Pc8r/qnlgTtEjBEVguCCPlffm8NzqGh7Bu7m/HPLkwUv3+oR9vR2
	aIxajj2LRgE6w4N58OU6t1oQtSpKSrH8rDLRTObDwEENTU48WbzgEYglGPT8ndUgQDgJ
	egCRN1Nl0yJUmqFtaXFUlkkXQOdKgySH0tb/0FitNS4waEtmG+r3MTCgbXf1Am9qiSc9
	D8m8k2lx79g90snC83rLIejMJN2QO9/VQbYQ7hC5+sPeNR2yfMyt1gJEwzH19f9gMAOr
	Nxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0P6U1MpF7Gc4mO6XDESPxiPrDBw9Ii9Ew7Jtr1zJ35E=;
	b=YR+YM2pZ77KuEv2H7qbnQNoGeyytc7V0J5Z0Kfsxwac+XjOLlY7yyB+OiKhv8q9ZPz
	+nvh1gVfNBWm0aA6T0AejnJ4udWM2wM0JC9Jjtg31+cPvkhzZgsxlRLN4Whf31B8TPBt
	2+BohCmRZ/pWTSKqyXLur3SRMGXcBxZYbSZkpT0FEQVmvqHLVemxp+Rm13ABOPhooMC0
	UjhihTDLDVu38icsObXqMKCJZaIAZHmXipvq01VwOirgZHj+tjD6lX08eNlQPe1JzkCc
	SXbi5wG4fp3IQU2Nzcar8GNDhx0XsrRGD9u3QW7YlXWpiuADyWaGHdKSQR8mtnB+wnNy
	2dxg==
X-Gm-Message-State: APjAAAUGvnB7In13cpHETH1W8VlU24gVL396ZfXMD9M1pazMH27Vkl6M
	mipdJFAkkLdZsQ9qVaXZFgkNL1kGmJj5aec4ii0=
X-Google-Smtp-Source: APXvYqyOjPw3Xp7JVddwJ0raCr3wTm7q4FmK2A6+6GYTkvK/hz8n0lx9Ln8U2iqSkJIQn7fsaBQMWKW1H7sSj3+hooQ=
X-Received: by 2002:ab0:6545:: with SMTP id x5mr18049323uap.89.1574700849157; 
	Mon, 25 Nov 2019 08:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
	<20191120134455.125118-9-alex.kanavin@gmail.com>
	<9dc24ea9d874a162834550eae33afbd20e19015e.camel@linuxfoundation.org>
In-Reply-To: <9dc24ea9d874a162834550eae33afbd20e19015e.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Nov 2019 17:53:57 +0100
Message-ID: <CANNYZj8wckay2W1ppUkGm6m0-_whh2he8hmfB_G=SX5QRv8TMg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/11] p11-kit: convert to meson
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
X-List-Received-Date: Mon, 25 Nov 2019 16:54:09 -0000
Content-Type: multipart/alternative; boundary="000000000000bddd2a05982e9cbf"

--000000000000bddd2a05982e9cbf
Content-Type: text/plain; charset="UTF-8"

On Sun, 24 Nov 2019 at 00:04, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2019-11-20 at 14:44 +0100, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  .../p11-kit/p11-kit_0.23.18.1.bb              | 26 +++------------
> > ----
> >  1 file changed, 3 insertions(+), 23 deletions(-)
>
> I think this caused a failure on the autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/1268
>

Thanks, will fix and resend.

Alex

--000000000000bddd2a05982e9cbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 24 Nov 2019 at 00:04, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2019-11-20 at 14:44=
 +0100, Alexander Kanavin wrote:<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../p11-kit/<a href=3D"http://p11-kit_0.23.18.1.bb" rel=3D"noref=
errer" target=3D"_blank">p11-kit_0.23.18.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 26 +++------------<br>
&gt; ----<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 23 deletions(-)<br>
<br>
I think this caused a failure on the autobuilder:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/69/build=
s/1268" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/69/builds/1268</a><br></blockquote><div><br></div=
><div>Thanks, will fix and resend.</div><div><br></div><div>Alex<br></div><=
/div></div>

--000000000000bddd2a05982e9cbf--
