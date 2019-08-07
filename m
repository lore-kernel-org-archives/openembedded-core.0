Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
	[209.85.217.45])
	by mail.openembedded.org (Postfix) with ESMTP id 377D37F3AE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 10:22:57 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id j26so60340046vsn.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 03:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MOvUR9AUs2IZqhqNQ4dC5emkMLvArt3ZFshh5S6/+hY=;
	b=bsg9hcQk11Vk5P3wn1a1+h9Q7aU2kVP/LR+paB0TmvBxuY2ij+xcbQFwGTA9CHkKRg
	dg4vTki+GChq3hEs0jxe1thaHD5c33umSXPnxCJj4aPAe4QGUp049hR2QYhx6A95eX7m
	gYGmLaXIsNpFHEWLHJGfO3AnpIrane41xTMSKNuNhJDuitzmKAynqJgdClDRQwBezPE0
	xEdbn7JMEq57L1albg7IVuRU0Ay2MSdJMirSH1xjuexe+R6LvHc6qu7E2AIC7+rYLUGh
	ptc8BUInONf1o+0PB6Bs+r98NRJm0WR3eFLN4wODB/M01hAy4xGMb7WTeGFXmBx7fbBH
	K5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MOvUR9AUs2IZqhqNQ4dC5emkMLvArt3ZFshh5S6/+hY=;
	b=sxrWTIjJ7QAbAecKwF4nU634TT+MqKkqrRDvIApkSIaZjw3OEF0k//n+QyhnfMchAh
	7T0KcmDTNYQEMZv7f8rTa6S1MbmCigZQbP6RqHWiLly6Zd2//UPwFtVeJY9S95XgLKEh
	RC+k0fy6iDGKwjxmZjkYZ6mys17seENLdnLMH4eA3EVkFBMHDynmAFBJ7srjDE5qPlWZ
	JPeo44bj46db7kIwltRQxUjGNATin0giN0jfjufyCWXSyFGtLRwU6opKsX9q2cDfHW4s
	yMPHQm7KhoVb2nmNDEnuEBaBvwst+gNfMINNk7pzrAD/tvM3gHt8p2zQMZZGVkHTF7m2
	Xn2w==
X-Gm-Message-State: APjAAAX6lChFqvhpqrpCPVFKked83WdTsKTGmnmfU/KKxM98VrI2aLIZ
	BIEGfwPHB7OxGAIq4Km8ntRS6zY4t1Njy2/dQU8=
X-Google-Smtp-Source: APXvYqyo/T51uWt42eKKntreCdrnkoDQYwvQDeURPsjPKdOVCfoi/9Cy2ENIQHUP8P4KHKhgeTqN/El1vY747UhHOYA=
X-Received: by 2002:a67:e8c3:: with SMTP id y3mr5223641vsn.94.1565173378808;
	Wed, 07 Aug 2019 03:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190423161916.25572-1-alex.kanavin@gmail.com>
	<8d33f7f60b0fb8394b459ed4c43e9f21d844b269.camel@linuxfoundation.org>
	<CANNYZj83RCwo3mtTkRxnyN45pi4qCg5ifrihWcyhQuk+0arZxA@mail.gmail.com>
	<3053753.Zs8syfq2pI@localhost.localdomain>
In-Reply-To: <3053753.Zs8syfq2pI@localhost.localdomain>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 7 Aug 2019 12:22:47 +0200
Message-ID: <CANNYZj9aqA-7uWBNHCYzc1OKtnki1w-P3mGEePG=EsYOEf5kzA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/9] python-setuptools: update to 41.0.1
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
X-List-Received-Date: Wed, 07 Aug 2019 10:22:58 -0000
Content-Type: multipart/alternative; boundary="00000000000041833d058f8453b9"

--00000000000041833d058f8453b9
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Aug 2019 at 01:14, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

>
> Did you get anywhere with this?
>
> FYI I filed a bug for the issue:
>
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=13467
>
>
Yes, it is already fixed in master:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=ac5b7cef596114ec96fcff34a3251ebf959395fd

Alex

--00000000000041833d058f8453b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 7 Aug 2019 at 01:14, Paul Eggleto=
n &lt;<a href=3D"mailto:paul.eggleton@linux.intel.com">paul.eggleton@linux.=
intel.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><br>
Did you get anywhere with this?<br>
<br>
FYI I filed a bug for the issue:<br>
<br>
=C2=A0 <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13467=
" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/sh=
ow_bug.cgi?id=3D13467</a><br>
<br></blockquote><div><br></div><div>Yes, it is already fixed in master:</d=
iv><div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?i=
d=3Dac5b7cef596114ec96fcff34a3251ebf959395fd">http://git.yoctoproject.org/c=
git/cgit.cgi/poky/commit/?id=3Dac5b7cef596114ec96fcff34a3251ebf959395fd</a>=
</div><div><br></div><div>Alex<br> </div></div></div>

--00000000000041833d058f8453b9--
