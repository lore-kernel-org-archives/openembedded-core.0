Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id EFCF37F638
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 11:24:21 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id y23so13943432vso.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 03:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hnlTtVE2SnT0fMSXX103xuo2tIUnBlanmP+KsTENc1g=;
	b=vIDh5Az6xyvZeeKy8bvVuNQAofYgPK9zBeXSJeHAVCKqGep4Bw+GGkxZ55mIp9oB8b
	aJayp+AQYQmpbxnSLG+vCEjobSbOH3+7tFzuPDK2JD5bXb+NDfIV3W+6ub/QZyMQk2+j
	nufg+CV3J2ey3P2JfLddvGibwGvjrYPzAyE7d8SvGEnQ8jfgphnQXDLwdmdKm1mAYTY1
	AMlG4AD592CARbc/BOL+F8tzgM2fT6iHwbnPN1cXuhy4vF1oCN4i1bjMDrei4o2hqKMn
	zOgxuh4RKi387pxIgequPk77Au4gebeFFMmGJoGDbC3el4QgB1TGgQtciqfVxuWnomMB
	wqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hnlTtVE2SnT0fMSXX103xuo2tIUnBlanmP+KsTENc1g=;
	b=nKMC+VAdFduIJ704VWsqILo1VZrKsK8eXOMIM2CwuK8aA/sfC9lTbLy6wPU9F/L5B1
	xYKEjSFq2mgCUH/gmKYW3IHHkocMmE/PsYv/KGqjUkRdlmHaD2zgH37LNIAcS4vNbqPx
	+wRXe7drRZW08201UZZ+MG0dAahcjF/3DbWNIrb3XDkXog5xOfNwUypqnQ/cDFF1Yile
	gKcDuncuR7PIpx1MvH4ovSWVPOFPU31Rpd7GyWra1TyE7EpBovMZuxCmv5MO1UWqrCC0
	qn+aGqACDJ20HdcUHuVTknpC8R5L+hzSAoz0s0KGZTvBM63NMpH+tDCqHEb3nla1Jfof
	dy3w==
X-Gm-Message-State: APjAAAV8xzYFxBciCz20w7Eoc4HCjPzeC1KwVJ0sBxkzhejYdiob4efE
	2OnMnzEXF7VoUM7XqHjEQZRCp3OzieXNBAawGlM=
X-Google-Smtp-Source: APXvYqzEgldsqBDDGNlMMFJyxqVr5p90K0H0D81kDybrFnH6gmR6LZExfLZgkn5JkZW1lM9CGhw7G52tzBWfNiV2IsI=
X-Received: by 2002:a05:6102:4ab:: with SMTP id
	r11mr15521638vsa.25.1574162662732; 
	Tue, 19 Nov 2019 03:24:22 -0800 (PST)
MIME-Version: 1.0
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
	<CAMKF1sp5SWYgoOj7Ujy5GMEEcuuATkuD45q7k7+LSc2SSkTVNg@mail.gmail.com>
	<20191118210500.GA4741@localhost>
	<CAMKF1spsipv7AbxJfmwHMU5dPtPDm-8VBxeQGWhEGUxJFG4WUw@mail.gmail.com>
	<20191118220613.GA7568@localhost>
In-Reply-To: <20191118220613.GA7568@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Nov 2019 12:24:11 +0100
Message-ID: <CANNYZj_MBFp7Yg1od0e0q3pQGte1WdruTBrQRxJpBUUNm2Rz+g@mail.gmail.com>
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
X-List-Received-Date: Tue, 19 Nov 2019 11:24:22 -0000
Content-Type: multipart/alternative; boundary="00000000000054bee90597b14eda"

--00000000000054bee90597b14eda
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 18 Nov 2019 at 23:06, Adrian Bunk <bunk@stusta.de> wrote:

>
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
>

Sadly, not relying on host Python 2 is not possible. Building Python 2
needs a working binary of Python 2. So there is a circular dependency chain
that cannot be broken: host py2 -> native py2 -> target py2 -> self-hosted
packagegroup.

You can remove all three versions of py2, but not any of them individually.

Alex

--00000000000054bee90597b14eda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 18 Nov 2019 at 23:06, Adrian Bunk=
 &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
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
this layer or in a layer it depends on.<br></blockquote><div><br></div><div=
>Sadly, not relying on host Python 2 is not possible. Building Python 2 nee=
ds a working binary of Python 2. So there is a circular dependency chain th=
at cannot be broken: host py2 -&gt; native py2 -&gt; target py2 -&gt; self-=
hosted packagegroup. <br></div><div><br></div><div>You can remove all three=
 versions of py2, but not any of them individually.</div><div><br></div><di=
v>Alex<br></div></div></div>

--00000000000054bee90597b14eda--
